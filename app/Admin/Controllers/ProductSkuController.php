<?php

namespace App\Admin\Controllers;

use App\Models\Product;
use App\Models\ProductSku;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Controllers\AdminController;

class ProductSkuController extends AdminController
{
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new ProductSku(), function (Grid $grid) {
            $grid->id->sortable();
            $grid->product_id;
            $grid->title;
            $grid->description;
            $grid->price;
            $grid->original_price;
            $grid->stock;
            $grid->created_at;
            $grid->updated_at->sortable();
        
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
        return Show::make($id, new ProductSku(), function (Show $show) {
            $show->id;
            $show->product_id;
            $show->title;
            $show->description;
            $show->price;
            $show->original_price;
            $show->stock;
            $show->created_at;
            $show->updated_at;
        });
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        return Form::make(new ProductSku(), function (Form $form) {
            $product_id=0;
            if($form->isCreating()){
                $product_id=$_REQUEST['product_id'];
            }else{
                $product_id=$form->model()->product_id;
            }
            if(is_numeric($product_id) && $product_id>0)
            {
                $product=Product::query()->find($product_id);
            }
            if(isset($product) && $product){
                $form->hidden('product_id')->value($product_id);
                $form->display('product','商品')->value($product['title']);
            }
            else{
                return $form->error('发生错误');
            }
            $form->display('id');

            $form->text('title');
            $form->text('description');
            $form->text('price');
            $form->text('original_price');
            $form->text('stock');

            $form->disableViewButton();
            $form->disableListButton();
            $form->disableDeleteButton();
            $form->tools(function (Form\Tools $tools) use ($form){

                if($form->isCreating()){
                    $url='javascript:history.go(-1)';
                }
                if($form->isEditing()){
                    $url='/admin/products/'.$form->model()->product_id;
                }
                if($form->model()->id){
                    $tools->append('<a class="btn btn-sm btn-danger text-white" data-action="delete" data-url="/admin/skus/'.$form->model()->id.'" data-redirect="/admin/products/'.$form->model()->product_id.'">
        <i class="feather icon-trash"></i><span class="d-none d-sm-inline"> 删除</span>
    </a>');
                }
                $tools->append('<a href="'.$url.'"   class="btn btn-sm btn-white "><i class="feather icon-list"></i><span class="d-none d-sm-inline">&nbsp;返回</span></a>');
            });

            $form->display('created_at');
            $form->display('updated_at');
            $form->saved(function (Form $form,$result){
               $product_id= $form->repository()->eloquent()->product_id;
               $skus=ProductSku::query()->where('product_id',$product_id)->get();
               $sku= collect($skus)->sortBy('price')->first();

              if($sku){
                  $min_price=$sku->price;
                  $original_price=$sku->original_price;
                  $discount_num=0;
                  if($original_price>$min_price)
                    $discount_num=intval($min_price*100/$original_price);
                  $sku->product->update(['price'=>$min_price,'original_price'=>$original_price,'discount_num'=>$discount_num]);
              }
                return $form->redirect('products/'.$product_id, '保存成功');
            });
            $form->deleted(function (Form $form,$result){
                // 获取删除行数据，这里获取的是一个二维数组
                $data = $form->model()->toArray();
            });
        });
    }

    public function destroy($id)
    {
        $oldsku= ProductSku::query()->find($id);
        $rv=$this->form()->destroy($id);
        $skus=ProductSku::query()->where('product_id',$oldsku['product_id'])->get();
        $sku= collect($skus)->sortBy('price')->first();
        if($sku){
            $min_price=$sku->price;
            $original_price=$sku->original_price;
            $discount_num=0;
            if($original_price>$min_price)
                $discount_num=intval($min_price*100/$original_price);
            $sku->product->update(['price'=>$min_price,'original_price'=>$original_price,'discount_num'=>$discount_num]);
        }
        return $rv;
    }
}
