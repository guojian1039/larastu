<?php

namespace App\Admin\Renderable;

use App\Models\Product;
use App\Models\User;
use Dcat\Admin\Grid;
use Dcat\Admin\Grid\LazyRenderable;

class UserTable extends LazyRenderable
{
    public function grid(): Grid
    {
        return Grid::make(new User(), function (Grid $grid) {
            $grid->column('id', 'ID')->sortable();
            $grid->column('name','姓名');
            $grid->column('phone','电话');
            $grid->column('created_at');
            $grid->quickSearch(['id', 'name']);

            $grid->paginate(4);
            $grid->disableActions();

            $grid->filter(function (Grid\Filter $filter) {
                $filter->like('name')->width(4);
                $filter->like('phone')->width(4);
            });
        });
    }
}
