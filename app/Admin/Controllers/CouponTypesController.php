<?php

namespace App\Admin\Controllers;
use App\Admin\Renderable\ProductTable;
use App\Admin\Renders\Coupons;
use App\Models\Coupon;
use App\Models\CouponProduct;
use App\Models\CouponType;
use App\Models\Product;
use App\Models\User;
use Carbon\Carbon;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Controllers\AdminController;
use Dcat\Admin\Show;
use Illuminate\Support\Facades\Log;

class CouponTypesController extends AdminController
{
    protected $title='优惠券';
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new CouponType(), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('title');
            //$grid->column('money');
            $grid->value('折扣')->display(function($value) {
                return $this->type === 1 ? '￥'.$value : $value.'%';
            });
            $grid->column('count')->modal(
                function ($modal){
                    $modal->title('领用记录');
                    // 允许在比包内返回异步加载类的实例
                    return Coupons::make(['title' => $this->title]);
                    // Coupons::make(['title' => $this->title]);
                }
            );
            $grid->column('get_count','剩余数量')->display(function ($v){
                return $this->count-$v;
            });
            $grid->column('type','类型')->display(function ($v){
                return $v==1?'满减':'折扣';
            });
            $grid->column('at_least');
            //$grid->column('need_user_level');
            $grid->column('range_type')->display(function ($v){
                return $v==1?'全场商品':'部分商品';
            });
            $grid->column('get_start_time','领取时间')->display(function ($v){
                return $v.'<br/>'.$this->get_end_time;
            });
            //$grid->column('get_end_time');
            //$grid->column('start_time');
            //$grid->column('end_time');
            $grid->column('term_of_validity_type')->display(function ($v){
                return $v?'领取日'.$this->fixed_term.'天':'固定时间';
            });
            //$grid->column('fixed_term');
            $grid->column('status')->display(function ($v){
                return $v==1?'进行中':'已失效';
            });
            $grid->fixColumns(4,-2);
            $grid->setActionClass(Grid\Displayers\DropdownActions::class);
            $grid->filter(function (Grid\Filter $filter) {
                $filter->equal('id');
            });
        });
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form= Form::make(CouponType::class, function (Form $form) {
            $form->display('id');
            $form->text('title')->required();

            if($form->isEditing()){
                $form->text('count')->readOnly();
            }
            else{
                $form->text('count')->rules('required|integer|min:1');
            }

            //$form->text('get_count');
            $form->select('type')->options(CouponType::$typeMap)->when([2],function (Form $form){
                $form->select('value', '打折数')
                    ->options(['90'=>'9折','80'=>'8折','70'=>'7折','60'=>'6折','50'=>'5折','40'=>'4折','30'=>'3折'])
                    ->rules('required')->default(80);
            })->when([1],function (Form $form){
                $form->text('value', '满减数')->rules('required|numeric|min:0.01');
            })->display(1);
            $form->text('at_least', '最低金额')->rules('required|numeric|min:0');
            $form->select('need_user_level')->options(User::$user_levelMap)->display(1);

            $form->datetime('get_start_time')->required()->rules('required|date|after:tomorrow');
            $form->datetime('get_end_time')->required()->rules('required|date|after:get_start_time');
            $form->select('range_type')
                ->when([2],function (Form $form){
                    if(!$form->isEditing()) {
                        $form->multipleSelectTable('product')
                            ->title('选择商品')
                            ->max(3)
                            ->dialogWidth('50%')// 弹窗宽度，默认 800px
                            ->from(ProductTable::make())// 设置渲染类实例，并传递自定义参数
                            ->options(function ($v) use ($form) { // 设置编辑数据显示
                                if ($form->isEditing()) {
                                    $coupon_type_id = $form->getKey();
                                    $list = CouponProduct::query()->where('coupon_type_id', $coupon_type_id)->with('product')->get();
                                    return $list->pluck('product.title', 'product_id');
                                }
                            });
                        //->model(CouponProduct::query()->where('coupon_type_id',$form->getKey())->with('product')->get(), 'product_id', 'product.title'); // 设置编辑数据显示
                    }
                })
                ->options(CouponType::$range_typeMap)->display(1);

            if($form->isEditing()){

            }
            $form->radio('term_of_validity_type')
                ->when([0],function (Form $form){
                    $form->datetime('start_time')->required()->rules('required|date|after:get_end_time');
                    $form->datetime('end_time')->required()->rules('required|date|after:start_time');
                })->when([1],function (Form $form){
                    $form->text('fixed_term')->default(1);
                })
                ->options(CouponType::$validity_typeMap)->display(1);
            $form->switch('status');
        });
        $form->saving(function (Form $form){

        });
        $form->saved(function (Form $form, $result) {
            $coupontype=$form->repository()->eloquent();
            // 判断是否是新增操作
            if ($form->isCreating()) {
                // 自增ID
                //$newId = $result;
                $count=$coupontype->count;//发放数量
                for ($i=0;$i<$count;$i++){
                    $coupon=new Coupon();
                    $coupon->coupon_type_id=$coupontype->id;
                    $coupon->code=Coupon::findAvailableCode();
                    if($form->term_of_validity_type==0){
                        $coupon->start_time=$form->start_time;
                        $coupon->end_time=$form->end_time;
                    }
                    /*
                   if($coupontype->term_of_validity_type==1){
                       $coupon->start_time=Carbon::now();
                       $coupon->end_time=Carbon::now()->addDays($coupontype->fixed_term);
                   }
                    */
                    $coupon->save();
                }
                /*
                if($coupontype->range_type==2){
                    if($form->input('product')){
                        $prductIds=explode(',',$form->input('product'));
                        foreach ($prductIds as $prductId){
                            $data[]=['coupon_type_id'=>$coupontype->id,'product_id'=>$prductId];
                        }
                        if(count($data)>0)
                        CouponProduct::insert($data);
                    }
                }
                */
                return;
            }
            // 修改操作
        });
        return $form;
    }
    /**
     * Make a show builder.
     *
     * @param mixed $id
     *
     * @return Show
     */
    protected function detail($id)
    {
        return Show::make($id, new CouponType(), function (Show $show) {

            $show->field('id');
            $show->field('title');
            $show->field('value');

            $show->field('count');
            $show->field('get_count');
            $show->field('type')->using(CouponType::$typeMap);
            $show->field('at_least');
            $show->field('need_user_level')->using(User::$user_levelMap);
            $show->field('range_type')->using(CouponType::$range_typeMap);
            if($show->model()->range_type==2){
                $show->product(function ()use ($show) {
                    $grid = new Grid(new Product());
                    $pIDs=CouponProduct::query()->where('coupon_type_id',$show->model()->id)->get('product_id');
                    //array_column($pIDs,'product_id')
                    $grid->model()->whereIn('id', array_column($pIDs->toArray(),'product_id'));
                    // 设置路由
                    //$grid->resource('pics');

                    $grid->number();
                    $grid->column('title', __('商品名称'));
                    $grid->column('price', __('商品价格'));
                    $grid->image('图片')->display(function ($value) {
                        return '<img src="/storage/' . $value . '" width=120 height=50>';
                    });
                    $grid->disableRowSelector();

                    $grid->disableViewButton();
                    $grid->disableEditButton();

                    //$grid->disablePagination();
                    //$grid->disablePerPages();
                    $grid->disableDeleteButton();
                    $grid->disableCreateButton();
                    $grid->disableRefreshButton();

                    return $grid;
                });
            }
            $show->field('get_start_time');
            $show->field('get_end_time');
            if($show->model()->term_of_validity_type==0) {
                $show->field('start_time');
                $show->field('end_time');
            }
            $show->field('term_of_validity_type')->using(CouponType::$validity_typeMap);
            if($show->model()->term_of_validity_type==1){
                $show->field('fixed_term');
            }
            $show->field('status')->as(function ($v){
                return $v?'运行':'停用';
            });
            $show->field('created_at');
            $show->field('updated_at');
        });
    }
}
