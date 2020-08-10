<?php

namespace App\Admin\Forms;

use App\Models\Product;
use App\Models\ProductSku;
use Dcat\Admin\Form\NestedForm;
use Dcat\Admin\Widgets\Form;
use Symfony\Component\HttpFoundation\Response;

class ProductDiscount extends Form
{
    protected $product_id;
    protected $type;
    public function __construct(int $product_id=0,string $type=null)
    {
        $this->product_id=$product_id;
        $this->type=$type;
        parent::__construct();
    }
    /**
     * Handle the form request.
     *
     * @param array $input
     *
     * @return Response
     */
    public function handle(array $input)
    {
        /*
         array:2 [
  "id" => "121"
  "skus" => array:3 [
    231 => array:7 [
      "title" => "8GB/128GB"
      "description" => "8GB/128GB"
      "price" => "3600.00"
      "original_price" => "4000.00"
      "stock" => "20"
      "id" => "231"
      "_remove_" => "0"
    ]
    "new_1" => array:7 [
      "title" => null
      "description" => null
      "price" => null
      "original_price" => null
      "stock" => null
      "id" => null
      "_remove_" => "1"
    ]
    "new_2" => array:7 [
      "title" => null
      "description" => null
      "price" => null
      "original_price" => null
      "stock" => null
      "id" => null
      "_remove_" => "1"
    ]
  ]
]
         */
         //dump($input);
         //echo $input['id'];
         $skus=$input['skus'];
         $min_price=0;
         $original_price=0;
         $product=Product::query()->find($input['id']);
         foreach ($skus as $key=>$value){
             if($value[\Dcat\Admin\Form::REMOVE_FLAG_NAME]) {
                 if(is_numeric($key)){
                     ProductSku::query()->where('id',$value['id'])->delete();
                 }
             }
             if($value[\Dcat\Admin\Form::REMOVE_FLAG_NAME]==0) {

                 if($min_price>0 && $value['price']<$min_price){
                     $min_price=$value['price'];
                     $original_price=$value['original_price'];
                 }
                 if($min_price==0){
                     $min_price=$value['price'];
                     $original_price=$value['original_price'];
                 }
                 if(is_numeric($key)){
                     //修改
                     /*
                      * "title" => "8GB/128GB"
                      "description" => "8GB/128GB"
                      "price" => "3600.00"
                      "original_price" => "4000.00"
                      "stock" => "20"
                      */
                     ProductSku::query()->where('id',$value['id'])->update(['title'=>$value['title'],
                         'description'=>$value['description'],'price'=>$value['price'],
                         'original_price'=>$value['original_price'],'stock'=>$value['stock']
                         ]);
                 }
                 else{
                     //新增
                     $sku=new ProductSku();
                     $sku->title=$value['title'];
                     $sku->description=$value['description'];
                     $sku->price=$value['price'];
                     $sku->original_price=$value['original_price'];
                     $sku->stock=$value['stock'];
                     $sku->product()->associate($input['id']);
                     $sku->save();
                 }
             }
         }
        if($original_price>0)
        {
            $discount_num=intval($min_price*100/$original_price);
        }
        $product->update(['type'=>Product::TYPE_DISCOUNT,'price'=>$min_price,'original_price'=>$original_price,'discount_num'=>$discount_num]);
        // return $this->error('Your error message.');
        return $this->success('操作成功', '/products');
        //return $this->success('Processed successfully.', '/');
    }

    /**
     * Build a form here.
     */
    public function form()
    {
        if($this->product_id>0)
        {
            $this->hidden('id')->value($this->product_id);
            $product=Product::query()->find($this->product_id);
            $model=$product->load('skus');
            $this->fill($model);
        }

        $this->display('title','商品名称');
        $this->hasMany('skus',function (NestedForm $form){
            $form->text('title', 'SKU 名称')->rules('required');
            $form->text('description', 'SKU 描述')->rules('required');
            $form->text('price', '单价')->rules('required|numeric|min:0.01');
            $form->text('original_price','原价')->rules('required|numeric|min:0.01');
            $form->text('stock', '剩余库存')->rules('required|integer|min:0');
        });
    }

    /**
     * The data of the form.
     *
     * @return array
     */
    public function default()
    {
        //$skus=ProductSku::query()->where('product_id',$this->product_id)->get();
       // return $skus->toArray();
        return [   ];
    }
}
