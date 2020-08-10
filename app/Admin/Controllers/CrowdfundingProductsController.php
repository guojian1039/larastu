<?php

namespace App\Admin\Controllers;
use App\Admin\Actions\Grid\BackProduct;
use App\Models\Category;
use App\Models\CrowdfundingProduct;
use App\Models\Product;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;

class CrowdfundingProductsController extends CommonProductsController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '众筹商品';
    public function getProductType()
    {
        return Product::TYPE_CROWDFUNDING;
    }
    public function customForm(Form $form)
    {
        // 添加众筹相关字段
        $form->text('crowdfunding.target_amount','众筹目标金额')->rules('required|numeric|min:0.01');
        $form->datetime('crowdfunding.end_at','众筹结束时间')->rules('required|date');

    }
    public function customGrid(Grid $grid)
    {
        $grid->model()->with('crowdfunding');
        //$grid->column('id', __('序号'));
        //$grid->column('title', __('名称'));
        $grid->number();
        $grid->column('title','商品名称')->display(function ($value){
            return "<a href='crowdfunding_products/$this->id'>$value</a>";

        });
        $grid->column('on_sale', __('是否上架'))->display(function ($value){
            return $value?'是':'否';
        });
        $grid->column('price', __('价格'));
        $grid->column('crowdfunding.target_amount', __('目标金额'));
        $grid->column('crowdfunding.total_amount','目标金额');
        $grid->column('crowdfunding.end_at','结束时间');
        $grid->column('crowdfunding.status','状态')->display(function ($value){
            return CrowdfundingProduct::$statusMap[$value];
        });
        $grid->disableViewButton();
        $grid->actions([new BackProduct(CrowdfundingProduct::class)]);
        $grid->setActionClass(Grid\Displayers\Actions::class);
    }
    public function specialSku(Form\NestedForm $form)
    {
        $form->hidden('original_price')->default(0);
    }
    public function customShow(Show $show)
    {
        /*
        $show->model()->with(['crowdfunding']);
        // 添加众筹相关字段
        $show->field('crowdfunding.target_amount','众筹目标金额');
        $show->field('crowdfunding.end_at','众筹结束时间');
        */
        $show->crowdfunding(function ($model) {
            $crowFunding=CrowdfundingProduct::query()->where('product_id',$model->id)->first();
            return Show::make($crowFunding->id,new CrowdfundingProduct(), function (Show $show) {
                // 设置路由
                //$show->resource('/crowdfunding');
                //$show->id();
                $show->target_amount('众筹目标金额');
                $show->end_at('众筹结束时间');
                $show->disableDeleteButton();
                $show->disableListButton();
                $show->disableEditButton();

            });

        });


    }
    public function childGrid(Grid $grid, $keyValue)
    {
        // TODO: Implement childGrid() method.
        $grid->disableDeleteButton();
    }
    public function formRelation()
    {
        // TODO: Implement formRelation() method.
        return Product::with(['skus','crowdfunding']);
    }
}
