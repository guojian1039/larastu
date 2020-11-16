<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\Adv;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Controllers\AdminController;

class AdvController extends AdminController
{
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new Adv(), function (Grid $grid) {
            $grid->column('title','名称');
            $grid->cover('图片')->display(function ($value){
                return '<img src="/storage/'.$value.'" width=120 height=50>';
            });
            $grid->width('宽度');
            $grid->height('高度');
            $grid->is_title_show('显示标题')->display(function ($value){
                return $value?'是':'否';
            });
            $grid->location('类型')->display(function ($value){
               return \App\Models\Adv::$typeMap[$value];
            });
            $grid->setActionClass(Grid\Displayers\Actions::class);
            $grid->actions(function ($action){
                $action->disableView();
            });
            $grid->filter(function (Grid\Filter $filter) {
                $filter->equal('id');
        
            });
        });
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        return Form::make(new Adv(), function (Form $form) {
            $form->display('id');
            $form->text('title', '名称')->rules('required');
            $form->switch('is_title_show','是否显示标题')->default(1);
            $form->image('cover', '链接地址')->rules('required|image')->move('ads')->uniqueName();
            $form->select('location','位置分类')->rules('required')->options(\App\Models\Adv::$typeMap);
            $form->text('silder_text','图片描述');
            $form->datetime('start_time','开始时间')->rules('required');
            $form->datetime('end_time','结束时间')->rules('required');
            $form->text('jump_link','跳转连接');
            $form->select('jump_type','跳转类型')->options(\App\Models\Adv::$jumpType);
            $form->text('sort','排序')->rules('required|integer')->default(0);
            $form->radio('status','状态')->options(['0'=>'禁用','1'=>'启用'])->default(1);
            $form->text('width', '宽度')->rules('required|integer');
            $form->text('height', '高度')->rules('required|integer');;
            $form->display('created_at');
            $form->display('updated_at');
        });
    }
}
