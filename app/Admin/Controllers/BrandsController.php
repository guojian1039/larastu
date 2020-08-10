<?php

namespace App\Admin\Controllers;

use App\Models\Brand;
use Dcat\Admin\Controllers\AdminController;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;

class BrandsController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '品牌列表';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Brand());

        $grid->column('id', __('序号'));
        $grid->column('name', __('名称'));
        $grid->image('图片')->display(function ($value){
            return '<img src="/storage/'.$value.'" width=120 height=50>';
        });
        $grid->column('url', __('链接'));

        $grid->actions(function ($action){
            $action->disableView();
        });
        $grid->setActionClass(Grid\Displayers\Actions::class);
        return $grid;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Brand());

        $form->text('name','名称')->rules('required');
        $form->image('image','图片')->rules('required|image')->move('brands')->uniqueName();
        $form->text('url','链接地址')->rules('required');
        $form->disableViewButton();
        return $form;
    }
}
