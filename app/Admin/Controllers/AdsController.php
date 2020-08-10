<?php

namespace App\Admin\Controllers;

use App\Models\Ad;
use Dcat\Admin\Actions\Action;
use Dcat\Admin\Controllers\AdminController;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
class AdsController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '广告列表';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new Ad(), function (Grid $grid) {
            $grid->name('名称');
            $grid->image('图片')->display(function ($value){
                return '<img src="/storage/'.$value.'" width=120 height=50>';
            });
            $grid->width('宽度');
            $grid->width('高度');
            $grid->setActionClass(Grid\Displayers\Actions::class);
            $grid->actions(function ($action){
                $action->disableView();
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
        return Form::make(new Ad(), function (Form $form) {
            $form->text('name', '名称')->rules('required');
            $form->image('image', '图片')->rules('required|image')->move('ads')->uniqueName();
            $form->text('url', '链接地址')->rules('required');
            $form->text('width', '宽度')->rules('required|integer');
            $form->text('height', '高度')->rules('required|integer');
            $form->disableViewButton();
        });
    }
}
