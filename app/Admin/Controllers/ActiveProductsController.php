<?php
namespace App\Admin\Controllers;
use App\Admin\Actions\Grid\BackProduct;
use App\Models\ActiveProduct;
use App\Models\Product;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;

class ActiveProductsController extends CommonProductsController
{
    public function getProductType()
    {
        return Product::TYPE_ACTIVE;
    }
    public function customGrid(Grid $grid)
    {
        $grid->model()->with('active');
        //$grid->column('id', __('序号'));
        //$grid->column('title', __('名称'));
        $grid->number();
        $grid->column('title','商品名称')->display(function ($value){
            return "<a href='active_products/$this->id'>$value</a>";
        });
        $grid->column('on_sale', __('是否上架'))->display(function ($value){
            return $value?'是':'否';
        });
        $grid->column('original_price', __('原价'));
        $grid->column('price', __('价格'));
        $grid->column('active.end_at','结束时间');
        $grid->disableViewButton();
        $grid->actions([new BackProduct(ActiveProduct::class)]);
        $grid->setActionClass(Grid\Displayers\Actions::class);
    }
    public function customForm(Form $form)
    {
        $form->datetime('active.end_at','活动结束时间')->rules('required|date');

    }
    public function specialSku(Form\NestedForm $form)
    {
        $form->text('original_price','原价')->rules('required|numeric|min:0.01');
    }
    public function formRelation()
    {
        return Product::with(['skus','active']);
    }
    public function childGrid(Grid $grid, $keyValue)
    {
        $grid->disableDeleteButton();
    }
    public function customShow(Show $show)
    {
        $show->active(function ($model) {
            $active = ActiveProduct::query()->where('product_id', $model->id)->first();
            return Show::make($active->id, new ActiveProduct(), function (Show $show) {
                // 设置路由
                //$show->resource('/crowdfunding');
                //$show->id();
                $show->end_at('结束时间');
                $show->disableDeleteButton();
                $show->disableListButton();
                $show->disableEditButton();

            });
        });
    }
}