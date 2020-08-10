<?php
namespace App\Services;
use App\Models\CartItem;
use App\Models\Product;
use Illuminate\Support\Facades\Auth;
class CartService{
    public function getCartItems()
    {
        if(Auth::check()){
            return Auth::user()->cartItems()->with(['productSku.product'])->get();
        }
        return [];
    }
    public function addCart($sku_id,$amount)
    {
        $user=Auth::user();
        if($cartitem= $user->cartItems()->where('product_sku_id',$sku_id)->first())
        {
            $cartitem->update(['amount'=>$cartitem->amount+$amount]);
        }
        else
        {
            /*
            $cartitem=new CartItem(['amount'=>$amount]);
            $cartitem->user()->associate($user);
            $cartitem->productSku()->associate($sku_id);
            $cartitem->save();
            */
            $cartitem=$user->cartItems()->make(['amount'=>$amount]);
            $cartitem->productSku()->associate($sku_id);
            $cartitem->save();
        }
    }
    public function addSimpleCart($product_id)
    {
        $user=Auth::user();
        $product=Product::query()->find($product_id)->load('skus');
        foreach ($product->skus as $skus){
            if($product->price==$skus->price){
                $sku_id=$skus->id;
                break;
            }
        }
        if(!$sku_id){
            foreach ($product->skus as $skus){
                $sku_id=$skus->id;
                break;
            }
        }
       $this->addCart($sku_id,1);
    }
    public function delCartItems($skuIds)
    {
        if(!is_array($skuIds))
        {
            $skuIds=[$skuIds];
        }
        Auth::user()->cartItems()->whereIn('product_sku_id',$skuIds)->delete();
    }
    public function updateCarts($items)
    {
        return \DB::transaction(function () use ($items){
           foreach ($items as $item){
               $sku=Auth::user()->cartItems()->where('product_sku_id',$item['sku_id'])->first();
               if($sku){
                   $sku->update(['amount'=>$item['amount']]);
                   $sku->save();
               }
           }
           return true;
        });
    }
}