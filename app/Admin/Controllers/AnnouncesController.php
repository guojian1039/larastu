<?php

namespace App\Admin\Controllers;

use App\Models\Announce;
use Dcat\Admin\Admin;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Controllers\AdminController;

class AnnouncesController extends AdminController
{
    protected $title="通知公告";
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new Announce(), function (Grid $grid) {
            //$grid->column('id')->sortable();
            $grid->number();
            $grid->column('title');
            //$grid->column('content');
            //$grid->image('cover');
            $grid->column('synopsis');
            $grid->column('view');
            //$grid->column('sender_id');
            $grid->column('sender_name');
            //$grid->column('status');
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
        return Show::make($id, new Announce(), function (Show $show) {
            $show->field('id');
            $show->field('title');

            $show->cover()->unescape()->as(function ($cover) {
                return "<img src='{$cover}' />";
            });
            $show->field('synopsis');
            $show->content('内容')->unescape()->as(function ($content) {
                return $content;
            });
            $show->field('view');
            //$show->field('sender_id');
            $show->field('sender_name');
            //$show->field('status');
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
        return Form::make(new Announce(), function (Form $form) {
            $form->display('id');
            $form->text('title');
            $form->image('cover');
            $form->text('synopsis');
            $form->editor('content')->height('400');

            $form->hidden('view')->default(0);
            $form->hidden('sender_id')->default(Admin::user()->id);
            $form->hidden('sender_name')->default(Admin::user()->name);
            $form->switch('status');
        
            $form->display('created_at');
            $form->display('updated_at');
            $form->saving(function (Form $form){
               if($form->cover){
                   $form->cover=\Storage::disk('public')->url($form->cover);
               }
            });
        });
    }
}
