<?php

namespace App\Admin\Controllers;

use App\Admin\Renderable\UserTable;
use App\Models\Company;
use App\Models\User;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Controllers\AdminController;

class CompaniesController extends AdminController
{
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(Company::with('user'), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('user.name','用户');
            $grid->column('name');
            //$grid->column('image');
            $grid->column('idcard');
            $grid->column('corporation');
            $grid->column('phone');
            /*
            $grid->column('yyzz');
            $grid->column('khxkz');
            $grid->column('swdj');
            $grid->column('frsfz');
            $grid->column('description');
            */
            $grid->column('created_at');
            //$grid->column('updated_at')->sortable();
        
            $grid->filter(function (Grid\Filter $filter) {
                $filter->equal('id');
        
            });
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
        return Show::make($id, new Company(), function (Show $show) {
            $show->field('id');
            $show->field('user_id');
            $show->field('name');
            $show->field('image');
            $show->field('idcard');
            $show->field('corporation');
            $show->field('phone');
            $show->field('yyzz');
            $show->field('khxkz');
            $show->field('swdj');
            $show->field('frsfz');
            $show->field('description');
            $show->field('created_at');
            $show->field('updated_at');
        });
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        return Form::make(new Company(), function (Form $form) {
            $form->display('id');
            //$form->text('user_id');
            $form->selectTable('user_id','用户')
                ->from(UserTable::make()) // 设置渲染类实例，并传递自定义参数
                ->options(function ($v) { // 设置编辑数据显示
                    if (! $v) {
                        return [];
                    }
                    return User::find($v)->pluck('name', 'id');
                });
            $form->text('name');
            $form->image('image');
            $form->text('idcard');
            $form->text('corporation');
            $form->text('phone');
            $form->image('yyzz');
            $form->image('khxkz');
            $form->image('swdj');
            $form->image('frsfz');
            $form->text('description');
        
            $form->display('created_at');
            $form->display('updated_at');
        });
    }
}
