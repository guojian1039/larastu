<?php
namespace App\Admin\Controllers;
use App\Admin\Actions\Grid\UploadPic;
use App\Models\ProductPic;
use App\Models\ProductSku;
use Dcat\Admin\Controllers\AdminController;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use App\Models\Category;
use \App\Models\Product;
use Dcat\Admin\Layout\Content;
use Dcat\Admin\Show;

abstract  class CommonProductsController extends  AdminController
{
  abstract  public function getProductType();

  abstract public function customGrid(Grid $grid);
  abstract public function customForm(Form $form);
  abstract public function specialSku(Form\NestedForm $form);
  abstract public function customShow(Show $show);
  abstract public function childGrid(Grid $grid,$keyValue);
  abstract public function formRelation();
  //abstract public function showForm(Form $form);
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Product());
        $grid->model()->where('type',$this->getProductType())->orderBy('id', 'desc');;

        $grid->actions(function ($action){
            //$action->disableView();
            //$action->disableDelete();
        });
        $grid->tools(function ($tool){
            $tool->batch(function ($batch){
                $batch->disableDelete();
            }) ;
        });
        //$grid->setActionClass(Grid\Displayers\Actions::class);
        $this->customGrid($grid);

        return $grid;
    }

    /*
    public function edit($id, Content $content)
    {
        return $content
            ->title($this->title())
            ->description($this->description['edit'] ?? trans('admin.edit'))
            ->body($this->form(true)->edit($id));
    }
    */
    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        // 这里需要显式地指定关联关系
        $builder = $this->formRelation();
        $form = new Form($builder);
        // 在表单中添加一个名为 type，值为 Product::TYPE_CROWDFUNDING 的隐藏字段
        $form->hidden('type')->value($this->getProductType());

        $form->hidden('id');
        $form->text('title', __('商品名称'))->rules('required');
        $form->select('category_id', __('类目'))->ajax('/api/categories?is_directory=0')
            ->options(function ($id){
                $category= Category::find($id);
                if($category)
                {
                    return [$category->id=>$category->full_name];
                }
            });
        $form->image('image', __('封面'))->rules('required|image')->move("product")->uniqueName();;
        $form->textarea('description', __('描述'))->rules('required');
        $form->switch('on_sale', __('是否上架'))->default(1);
        $form->switch('recommend', __('是否推荐'))->default(1);
        $this->customForm($form);

        $form->hasMany('skus', '商品 SKU', function (Form\NestedForm $form) {
            $form->text('title', 'SKU 名称')->rules('required');
            $form->text('description', 'SKU 描述')->rules('required');
            $form->text('price', '单价')->rules('required|numeric|min:0.01');
            $this->specialSku($form);
            $form->text('stock', '剩余库存')->rules('required|integer|min:0');
        });
        $form->disableViewButton();

        /*
            $form->hasMany('pics','图片集合',function (Form\NestedForm $form){
               $form->image('image','图片')->rules('required')->move("product")->uniqueName()->thumbnail('small',100,100);
               $form->text('description');
            });
        */
        $form->saving(function (Form $form){
            $min_price=collect($form->input('skus'))->where(Form::REMOVE_FLAG_NAME,0)->min('price')?:0;
            $form->price=$min_price;

            $selskus= collect($form->input('skus'))->where(Form::REMOVE_FLAG_NAME,0)->filter(function ($item, $key) use ($min_price){
                if($item['price']==$min_price)
                {
                    return $item['original_price'];
                }
            });
            $original_price=0;
            $data=$selskus->first();
            if(isset($data['original_price']))
            {
                $original_price=$data['original_price'];
            }
            if(is_null($form->id))
            {
                if(!$original_price)
                {
                    $form->original_price=$min_price;
                }
                else
                {
                    $form->original_price=$original_price;
                }
                if($min_price!=$original_price && $original_price>0)
                {
                    $form->discount_num=intval($min_price*100/$original_price);
                }
            }else
            {
                $form->original_price=$original_price;
                if($min_price!=$original_price && $original_price>0)
                {
                    $form->discount_num=intval($min_price*100/$original_price);
                }
            }

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
        return Show::make($id, new Product(), function (Show $show) use ($id) {
            //$show->id;
            $show->type('类型')->as(function ($value){
                return Product::$typeMap[$value];
            });
            /*
            $show->category_id('类目')->as(function ($value){
                if(is_numeric($value)){
                    $category=Category::query()->find($value);
                    return $category->name;
                }
            });
            */
            $show->title('商品名称');
            $show->image('封面')->unescape()->as(function ($value){
                $value=url_image($value);
                return "<img src=$value width='300' height='200'/>";
            });
            $show->description('描述');
            /*
            $show->on_sale('是否上架')->as(function ($value){
                return $value?'是':'否';
            });
            $show->recommend('是否推荐')->as(function ($value){
                return $value?'是':'否';
            });
            $show->rating('评分');
            $show->sold_count('销量');
            $show->review_count('评论数');
            */
            $this->customShow($show);
            $show->skus(function ($model) {
                $grid = new Grid(new ProductSku());

                $grid->model()->where('product_id', $model->id);

                // 设置路由
                $grid->resource('skus');

                $grid->id('ID');
                $grid->column('title','名称');
                $grid->column('description','说明')->limit(2);
                $grid->price('价格');
                $grid->stock('库存');
                $grid->original_price('原价');

                $grid->filter(function ($filter) {
                    $filter->like('title')->width('2000px');
                });

                $grid->setActionClass(Grid\Displayers\Actions::class);
                $grid->disableViewButton();
                $grid->disableCreateButton();
                $this->childGrid($grid,$model->id);
                return $grid;
            });

            $show->pics(function ($model) {
                $grid = new Grid(new ProductPic());

                $grid->model()->where('product_id', $model->id);

                // 设置路由
                $grid->resource('product_pics');

                //$grid->id('ID');
                $grid->image('图片')->display(function ($value){
                    return '<img src="/storage/'.$value.'" width=120 height=50>';
                });
                $grid->column('description','说明')->limit(2);

                $grid->setActionClass(Grid\Displayers\Actions::class);
                $grid->disableViewButton();
                $grid->disableCreateButton();
                $grid->disableEditButton();
                $grid->disableRefreshButton();
                $grid->tools(function (Grid\Tools $tools) use ( $model){
                    /*
                    $tools->append('<a  href="/product_pics/create?product_id='. $model->id.'" class="btn btn-primary btn-outline create-pic"> <i class="feather icon-plus"></i><span class="d-none d-sm-inline">&nbsp;&nbsp;新增</span>
</a>');
                    */
                    $tools->append(new UploadPic($model->id,'product'));
                });
                return $grid;
            });
            /*
            $show->price;
            $show->discount_num;
            $show->original_price;
            $show->created_at;
            $show->updated_at;
            */
            /*
            $show->row(function (Show\Row $show) {
                $show->width(3)->field('profile.first_name');
                $show->field('profile.last_name');
                $show->width(3)->field('profile.postcode');
            });
            */

            /*
            Form::dialog('商品图片')
                ->click('.create-pic') // 绑定点击按钮
                ->url('pics/create?product_id='.$id) // 表单页面链接，此参数会被按钮中的 “data-url” 属性替换。。
                ->width('550px') // 指定弹窗宽度，可填写百分比，默认 720px
                ->height('500px') // 指定弹窗高度，可填写百分比，默认 690px
                ->success('Dcat.reload()'); // 新增成功后刷新页面
            */
        });
    }
}
