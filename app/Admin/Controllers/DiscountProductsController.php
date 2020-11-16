<?php
namespace App\Admin\Controllers;
use App\Admin\Actions\Grid\BackProduct;
use App\Admin\Controllers;
use App\Models\Product;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;

class DiscountProductsController extends CommonProductsController
{

    protected $title='折扣商品';
    public function getProductType()
    {
        return Product::TYPE_DISCOUNT;
    }
    public function customForm(Form $form)
    {
        // TODO: Implement customForm() method.
    }
    public function customGrid(Grid $grid)
    {
        $grid->model()->with(['category']);
        //$grid->id('ID')->sortable();
        //$grid->title('商品名称');
        $grid->number();
        $grid->column('title','商品名称')->display(function ($value){
            return "<a href='discount_products/$this->id'>$value</a>";
        });
        $grid->column('category.name', '类目');
        $grid->on_sale('已上架')->display(function ($value) {
            return $value ? '是' : '否';
        });
        $grid->original_price('原价');
        $grid->price('价格');
        $grid->rating('评分');
        $grid->sold_count('销量');
        $grid->disableViewButton();
        $grid->setActionClass(Grid\Displayers\Actions::class);
        $grid->actions([new BackProduct(null)]);
    }
    public function specialSku(Form\NestedForm $form)
    {
        $form->text('original_price','原价')->rules('required|numeric|min:0.01');
    }
    public function customShow(Show $show)
    {
        // TODO: Implement customShow() method.
    }
    public function childGrid(Grid $grid, $keyValue)
    {
        $grid->disableDeleteButton();
    }
    public function formRelation()
    {
        return Product::with(['skus']);
    }
}