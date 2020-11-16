<?php

namespace App\Admin\Controllers;

use App\Admin\Renders\Comments;
use App\Models\News;
use App\Models\NewsCategory;
use Dcat\Admin\Admin;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Controllers\AdminController;

class NewsController extends AdminController
{
    protected $title='新闻列表';
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(News::with('newsCategory'), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('title','标题');
            //$grid->column('image');
            //$grid->column('body');
            $grid->column('newsCategory.name','类别');
            //$grid->column('excerpt');
            $grid->column('slug');
            //$grid->column('sender_id');
            $grid->column('sender_name','发布者');
            $grid->column('created_at');
            //$grid->column('updated_at')->sortable();
            $grid->column('comments','评论')->display('查看')->expand(Comments::make());
            $grid->setActionClass(Grid\Displayers\Actions::class);
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
        return Show::make($id,News::with('newsCategory'), function (Show $show) {
            $show->field('id');
            $show->field('news_category.name','类别');
            $show->field('title','标题');
            $show->image('封面')->unescape()->as(function ($image) {
                return "<img src='{$image}' />";
            });
            $show->body('内容')->unescape()->as(function ($content) {
                return $content;
            });
            $show->field('excerpt','简介');
            $show->field('slug');
            $show->field('sender_name','操作人');
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
        return Form::make(new News(), function (Form $form) {
            $form->display('id');
            $form->text('title','标题');
           $cates= NewsCategory::query()->get(['id', \DB::raw('name as text')]);
            foreach ($cates as $type){
                $data[$type->id]=$type['text'];
            }
            $form->select('news_category_id','类别')->options($data);
            $form->image('image','封面');
            $form->editor('body','内容')->height('400');
            //$form->text('excerpt');
            //$form->text('slug');
            $form->hidden('sender_id')->default(Admin::user()->id);
            $form->hidden('sender_name')->default(Admin::user()->name);
            $form->display('created_at');
            $form->display('updated_at');
            $form->saving(function (Form $form){
                if($form->image){
                    $form->image=\Storage::disk('public')->url($form->image);
                }
            });
        });
    }
}
