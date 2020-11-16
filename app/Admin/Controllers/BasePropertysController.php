<?php

namespace App\Admin\Controllers;
use App\Models\BaseProperty;
use App\Models\Category;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Controllers\AdminController;

class BasePropertysController extends AdminController
{
    protected $title = '分类属性';
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new BaseProperty(), function (Grid $grid) {
            $grid->model()->with('category');
            //$grid->column('id')->sortable();
            $grid->number();
            $grid->column('category.name','分类');
            $grid->column('title');
            $grid->column('status','状态')->switch();
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
        return Form::make(BaseProperty::with('items'), function (Form $form) {
            $form->display('id');
            $form->select('category_id', __('类目'))->ajax('/api/allCategories')
                ->options(function ($id){
                    $category= Category::find($id);
                    if($category)
                    {
                        return [$category->id=>$category->full_name];
                    }
                });
            $form->text('title');
            $form->hasMany('items','属性值',function (Form\NestedForm $form){
               $form->text('relvalue','数值')->required();
               $form->switch('status','状态');
            });
            $form->switch('status','状态')->display(1);
        });
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
        return Show::make($id, new BaseProperty(), function (Show $show) {
            $show->field('id');
            $show->field('category_id');
            $show->field('title');
            $show->field('status');
        });
    }
}
