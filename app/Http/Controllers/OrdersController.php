<?php

namespace App\Http\Controllers;

use App\Events\OrderReviewed;
use App\Exceptions\CouponCodeUnavailableException;
use App\Exceptions\InternalException;
use App\Exceptions\InvalidRequestException;
use App\Http\Requests\CrowdFundingOrderRequest;
use App\Http\Requests\OrderRequest;
use App\Http\Requests\SeckillOrderRequest;
use App\Http\Requests\SendReviewRequest;
use App\Jobs\CloseOrder;
use App\Models\Coupon;
use App\Models\CouponCode;
use App\Models\Order;
use App\Models\OrderCount;
use App\Models\OrderItem;
use App\Models\ProductSku;
use App\Models\UserAddress;
use App\Services\OrderService;
use Carbon\Carbon;
use Illuminate\Http\Request;

class OrdersController extends Controller
{
    protected $orderService;
    public function __construct(OrderService $orderService)
    {
        $this->orderService=$orderService;
    }
    public function store(OrderRequest $request){
        $address_id=$request->input('address_id');
        $remark=$request->input('remark','');
        $items=$request->input('items');
        $coupon  = null;

        // 如果用户提交了优惠码
        if ($code = $request->input('coupon_code')) {
            $coupon = Coupon::where('code', $code)->first();
            if (!$coupon) {
                throw new CouponCodeUnavailableException('优惠券不存在');
            }
        }
        /*
        $user=$request->user();
       $order= \DB::transaction(function ()use ($address_id,$items,$user,$remark){
           $address=UserAddress::query()->find($address_id);
           $order=$user->orders()->make(
               ['address'=>['address'=>$address->full_address,'zip'=>$address->zip,'contact_name'=>$address->contact_name,
               'contact_phone'=>$address->contact_phone],
                   'remark'=>$remark,
                   'total_amount'=>0
               ]);
           // 写入数据库
           $order_id=$order->save();
           $total_amount=0;
           foreach ($items as $item)
           {
               $sku=ProductSku::query()->find($item['sku_id']);
                // 创建一个 OrderItem 并直接与当前订单关联
               $orderItem=$order->items()->make(['amount'=>$item['amount'],'price'=>$sku->price]);

               $orderItem->product()->associate($sku->product_id);
               $orderItem->productSku()->associate($sku);
               $orderItem->save();
               $total_amount+=$item['amount']*$sku->price;

              if($sku->decreaseStock($item['amount'])<=0)
              {
                  throw new InvalidRequestException('该商品库存不足');
              }
           }
           $order->update(['total_amount'=>$total_amount]);
           $skuIds=collect($items)->pluck('sku_id');
           $user->cartItems()->whereIn('product_sku_id',$skuIds)->delete();
           return $order;
        });
       $this->dispatch(new CloseOrder($order,config('app.order_ttl')));
        */
        $order=$this->orderService->saveOrder($address_id,$items,$remark,$coupon);
       return $order;
    }
    public function index(Request $request){
        /*
        $user=$request->user();
        $orders=$user->orders()->with(['items.product','items.productSku'])
            ->orderBy('created_at','desc')->paginate();
        */
        $orders=$this->orderService->getOrders();
        return view('orders.index',['orders'=>$orders]);
    }
    public function show(Order $order){
        $this->authorize('own',$order);
        return view('orders.show',['order'=>$order->load(['items.productSku','items.product'])]);
    }
    public function received(Order $order,Request $request)
    {
        // 校验权限
        $this->authorize('own', $order);
        if(!$order->paid_at){
            throw new InvalidRequestException('订单未支付');
        }
        // 判断订单的发货状态是否为已发货
        if($order->ship_status!==Order::SHIP_STATUS_DELIVERED){
            throw new InvalidRequestException('发货状态不正确');
        }
        $this->orderService->received($order);
        // 返回原页面
        return $order;
    }
    public function review(Order $order)
    {
        // 校验权限
        $this->authorize('own', $order);
        // 判断是否已经支付
        if(!$order->paid_at){
            throw new InvalidRequestException('订单未支付，不可评价！');
        }
        /*
        if(!$order->ship_status===Order::SHIP_STATUS_RECEIVED){
            throw new InvalidRequestException();
        }*/
        // 使用 load 方法加载关联数据，避免 N + 1 性能问题
        return view('orders.review',['order'=>$order->load(['items.product','items.productSku'])]);
    }

    public function sendReview(Order $order, SendReviewRequest $request)
    {
        // 校验权限
        $this->authorize('own', $order);
        if (!$order->paid_at) {
            throw new InvalidRequestException('该订单未支付，不可评价');
        }
        // 判断是否已经评价
        if ($order->reviewed) {
            throw new InvalidRequestException('该订单已评价，不可重复提交');
        }
        $reviews = $request->input('reviews');
        $this->orderService->review($reviews,$order);
        return redirect()->back();
    }

    public function crowdfunding(CrowdFundingOrderRequest $request){
        $sku_id=$request->input('sku_id');
        $amount=$request->input('amount');
        $address_id=$request->input('address_id');
        $order=$this->orderService->crowdfunding($address_id,$sku_id,$amount);
        return $order;
    }
    public function seckill(SeckillOrderRequest $request){
        $sku_id=$request->input('sku_id');
        //$address_id=$request->input('address_id');
        //$address=UserAddress::query()->find($address_id);
        $sku=ProductSku::query()->find($sku_id);
        $order=$this->orderService->seckill($request->user(),$request->input('address'),$sku);
        return $order;
    }

}
