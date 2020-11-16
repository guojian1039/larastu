<?php

namespace App\Admin\Controllers;

use App\Http\Requests\Request;
use App\Models\NewsCategory;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Controllers\AdminController;

class NewsCategoriesController extends AdminController
{
    protected $title='新闻分类';
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new NewsCategory(), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('name');
            $grid->column('description','描述');
            $grid->column('created_at');
            $grid->column('updated_at')->sortable();
        
            $grid->filter(function (Grid\Filter $filter) {
                $filter->equal('id');
        
            });
            $grid->toolsWithOutline(false);
            $grid->enableDialogCreate();
            $grid->setDialogFormDimensions(600,500);
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
        return Form::make(new NewsCategory(), function (Form $form) {
            $form->display('id');
            $form->text('name','名称');
            $form->text('description','描述');
        
            $form->display('created_at');
            $form->display('updated_at');
            $form->disableViewButton();
        });
    }

    public function getCategories(Request $request){
        return NewsCategory::query()->get(['id', \DB::raw('name as text')]);
    }
}
