<?php

namespace App\Admin\Controllers;

use App\Models\SitehelpType;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Controllers\AdminController;

class SitehelpTypesController extends AdminController
{
    protected $title='帮助分类';
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new SitehelpType(), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('title');
            $grid->column('cover');
        
            $grid->filter(function (Grid\Filter $filter) {
                $filter->equal('id');
        
            });
            $grid->disableViewButton();
        });
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        return Form::make(new SitehelpType(), function (Form $form) {
            $form->display('id');
            $form->text('title')->required();
            $form->image('cover')->required();
        });
    }
}
