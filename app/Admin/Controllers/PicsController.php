<?php

namespace App\Admin\Controllers;
use App\Models\ProductPic;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Layout\Content;

class PicsController
{
    public function create(Content $content)
    {
        return $content
            ->header('商品图片')
            ->description('新增图片')
            ->body($this->form($_REQUEST['product_id']));
    }
    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form($product_id)
    {
        $form = new Form(new ProductPic());
        $form->hidden('product_id')->value($product_id);
        $form->image('image','图片')->rules('required|image')->uniqueName();
        $form->text('description','描述')->rules('required');
        $form->disableViewButton();
        return $form;
    }
}
