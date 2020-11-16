<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\AddCartRequest;
use App\Http\Requests\UpdateCartsRequest;
use App\Models\Coupon;
use App\Models\CouponProduct;
use App\Models\ProductSku;
use App\Services\CartService;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use function MongoDB\BSON\toJSON;

class CartController extends Controller
{
    protected $cartService;
    public function __construct(CartService $cartService)
    {
        $this->cartService=$cartService;
    }

    public function store(AddCartRequest $request)
    {
        $this->cartService->addCart($request->input('sku_id'),$request->input('amount'));
        return response($request->user()->cartItems->sum('amount'));
    }

    public function index(Request $request)
    {
        $cartItems=$this->cartService->getCartItems();
        return $cartItems;
    }

    public function remove(Request $request)
    {
        $sku_id=$request->input('sku_id',[]);
        $this->cartService->delCartItems($sku_id);
        return response($request->user()->cartItems->sum('amount'));
    }
    public function update(UpdateCartsRequest $request){

        $rv=$this->cartService->updateCarts($request->input('items'));
        return response($request->user()->cartItems->sum('amount'));
    }
    public function changeCartsSku(Request $request){
        $rv=$this->cartService->changeCartsSku($request->input('old_sku_id'),$request->input('new_sku_id'));
        return response($request->user()->cartItems->sum('amount'));
    }
    public function cartItemUpdateNum(Request $request){
        $rv=$this->cartService->cartItemUpdateNum($request->input('sku_id'),$request->input('amount'));
        return response($request->user()->cartItems->sum('amount'));
    }

    public function cartCount(Request $request){
        return response($request->user()->cartItems->sum('amount'));
    }
    public function orderPreview(Request $request){
        $type=$request->input('type');
        $data=$request->input('data');
        $total_amount=0.00;
        $coupon_product=[];
        $user=$request->user();
        $coupons=[];
        $coupon_product_amount=[];
        //本人未使用的优惠券
        $coupon_build =Coupon::query()->with('couponType')
            ->where('user_id',$user->id)
            ->whereNull('use_time');
            //->where('start_time','>=',Carbon::now())
           // ->where('end_time','<=',Carbon::now());
        /*;
        $coupon_build->whereHas('couponType',function ($query) use ($total_amount){
            $query->where('range_type',1)->where('at_least','<=',$total_amount);
        });
        */
        $list=$coupon_build->get();
        foreach ($list as $item){
            if($item['couponType']->range_type==1 && $item['couponType']->at_least<=$total_amount){
                $coupons[]=$item;
            }else if($item['couponType']->range_type==2){
                $coupon_products=CouponProduct::query()->where('coupon_type_id',$item->coupon_type_id)->get('product_id');
                foreach ($coupon_products as $product){
                    $coupon_product[$item->coupon_type_id][]=$product->product_id;
                }
            }
        }
         if($type=='cart'){
             $data=explode(',',$data);
            //$data->data为sku_ids字符串
            //$products=ProductSku::query()->whereIn('id',$data)->with('product')->get();
            $cartitems=$user->cartItems()->with('productSku.product')->whereIn('product_sku_id',$data)->get();
            foreach ($cartitems as $cartitem){
                $sku=$cartitem->productSku;
                $sku['orderNum']=$cartitem->amount;
                $products[]=$sku;
                $total_amount+=$cartitem->amount*$sku->price;
                foreach ($coupon_product as $key=>$value){
                    if(in_array($sku->product_id,$value)){
                        if($coupon_product_amount && $coupon_product_amount[$key]){
                            $coupon_product_amount[$key]+=$cartitem->amount*$sku->price;
                        }
                        else{
                            $coupon_product_amount[$key]=$cartitem->amount*$sku->price;
                        }
                    }
                }
            }
        }
        else if($type=='buy_now')
        {
            $data=json_decode ($data, true);
            $skus=ProductSku::query()->where('id',$data['sku_id'])->with('product')->get();
            foreach ($skus as $sku){
                $sku['orderNum']=$data['amount'];
                $total_amount+=$data['amount']*$sku->price;
                $products[]=$sku;
                foreach ($coupon_product as $key=>$value){
                    if(in_array($sku->product_id,$value)){
                        $coupon_product_amount[$key]+=$data['amount']*$sku->price;
                    }
                }
            }
        }
        $address=$user->addresses()->where('is_default',1)->first();
        foreach ($list as $item){
             if($item['couponType']->range_type==2){
                 if(count($coupon_product_amount)>0 && $coupon_product_amount[$item->coupon_type_id] && $coupon_product_amount[$item->coupon_type_id]>=$item->at_least){
                     $coupons[]=$item;
                 }
            }
        }
        return response(['products'=>$products,'address'=>$address,'total_amount'=>$total_amount,'coupons'=>$coupons]);

    }
}
