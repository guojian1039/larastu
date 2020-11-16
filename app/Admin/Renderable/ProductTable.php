<?php

namespace App\Admin\Renderable;

use App\Models\Product;
use Dcat\Admin\Grid;
use Dcat\Admin\Grid\LazyRenderable;

class ProductTable extends LazyRenderable
{
    public function grid(): Grid
    {
        return Grid::make(new Product(), function (Grid $grid) {
            $grid->column('id', 'ID')->sortable();
            $grid->column('title','商品名称');
            $grid->column('price','商品价格');
            $grid->column('created_at');
            $grid->quickSearch(['id', 'title']);

            $grid->paginate(4);
            $grid->disableActions();

            $grid->filter(function (Grid\Filter $filter) {
                $filter->like('title')->width(4);
                $filter->like('discription')->width(4);
            });
        });
    }
}
