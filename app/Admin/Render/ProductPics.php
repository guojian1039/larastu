<?php
namespace App\Admin\Renders;
use App\Admin\Actions\Grid\TranslateProduct;
use App\Models\Product;
use App\Models\ProductPic as PicModel;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Grid\Displayers\Actions;
use Dcat\Admin\Show;
use Dcat\Admin\Support\LazyRenderable;
use Dcat\Admin\Widgets\Table;

class ProductPics extends  LazyRenderable
{
    public function render()
    {
        // 获取ID
        $id = $this->key;
        return Show::make($id, new Product(), function (Show $show) {
            //$show->id;
            $show->title('商品名称');
            $show->skus(function ($model) {
                $grid = new Grid(new PicModel());
                $grid->model()->where('product_id', $model->id);

                // 设置路由
                //$grid->resource('pics');

                $grid->number();

                $grid->image('图片')->display(function ($value) {
                    return '<img src="/storage/' . $value . '" width=120 height=50>';
                });
                $grid->column('description', __('描述'));
                $grid->setActionClass(Actions::class);
                $grid->disableViewButton();
                $grid->disableEditButton();

                $grid->disablePagination();
                $grid->disablePerPages();
                $grid->disableDeleteButton();
                $grid->disableCreateButton();
                $grid->disableRefreshButton();

                return $grid;
            });

            $show->disableEditButton();
            $show->disableListButton();
            $show->disableDeleteButton();

        });
    }
}