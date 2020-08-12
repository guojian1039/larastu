<?php

namespace App\Http\Requests;

use App\Models\ProductSku;

class UpdateCartsRequest extends Request
{

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'items'=>['required','array'],
            'items.*.sku_id'=>['required',function($attribute,$value,$fail){
                if(!$sku=ProductSku::query()->find($value)){
                    return $fail('该商品不存在');
                }
                if(!$sku->product->on_sale){
                    return $fail('该商品未上架');
                }
                if($sku->stock===0){
                    return $fail('该商品已售完');
                }
                //获取当前索引
                preg_match('/items\.(\d+)\.sku_id/',$attribute,$m);
                $index=$m[1];
                // 根据索引找到用户所提交的购买数量
                $amount=$this->input('items')[$index]['amount'];
                if($amount>0 && $amount>$sku->stock){
                    return $fail('该商品库存不足');
                }
            }],
            'items.*.amount'=>['required','integer','min:1']
        ];
    }
}
