<?php

namespace App\Admin\Controllers;
use App\Admin\Actions\Grid\TranslateProduct;
use App\Admin\Actions\Grid\UploadPic;
use App\Renders\ProductPic;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use \App\Models\Product;
use Dcat\Admin\Show;

class ProductsController extends CommonProductsController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '商品列表';

    public function getProductType()
    {
        return Product::TYPE_NORMAL;
    }
    public function customGrid(Grid $grid)
    {
        $grid->model()->with(['category']);
        //$grid->id('ID')->sortable();
        $grid->number();
        $grid->column('title','商品名称')->display(function ($value){
            return "<a href='products/$this->id'>$value</a>";

        });
        //$grid->column('pic','图片')->display('图片')->modal('商品图片', \App\Renders\ProductPic::make());
        $grid->column('category.name', '类目');
        /*
        $grid->on_sale('已上架')->display(function ($value) {
            return $value ? '是' : '否';
        });
        */
        $grid->on_sale('已上架')->switch();
        $grid->price('价格');
        $grid->rating('评分');
        $grid->sold_count('销量');
        $grid->review_count('评论数');

        $grid->recommend('推荐')->switch();

        $grid->disableViewButton(true);
        //$grid->setActionClass(Grid\Displayers\ContextMenuActions::class);
        $grid->setActionClass(Grid\Displayers\DropdownActions::class);
        $grid->actions(function ($actions) {
            //$actions->append(CreateCategory::make());
            $actions->append(TranslateProduct::make(Product::TYPE_ACTIVE));
            //$actions->append(CrowdfundingTransProduct::make(Product::TYPE_CROWDFUNDING));
            $actions->append(new TranslateProduct(Product::TYPE_CROWDFUNDING));
            $actions->append(new TranslateProduct(Product::TYPE_SECKILL));
            //$actions->append(new TranslateProduct(Product::TYPE_DISCOUNT));
           // $actions->prepend('<a href="discount_products/'.$actions->getKey().'/edit">折扣商品</a>');
            $actions->append(new UploadPic(0,'test'));
        });


    }
    public function customForm(Form $form)
    {
        // TODO: Implement customForm() method.
    }
    public function childGrid(Grid $grid,$keyValue)
    {
        $grid->tools(function (Grid\Tools $tools) use ($keyValue){
            $tools->append('<a href="/admin/skus/create?product_id='.$keyValue.'". class="btn btn-primary btn-outline">
    <i class="feather icon-plus"></i><span class="d-none d-sm-inline">&nbsp;&nbsp;新增</span>
</a>');
        });
    }

    public function customShow(Show $show)
    {
        // TODO: Implement customShow() method.
    }

    public function specialSku(Form\NestedForm $form)
    {
        $form->hidden('original_price')->default(0);
    }
    public function formRelation()
    {
        // TODO: Implement formRelation() method.
        return Product::with('skus');
    }
}
