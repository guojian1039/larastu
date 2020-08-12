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
use App\Models\CouponCode;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\ProductSku;
use App\Models\UserAddress;
use App\Services\OrderService;
use Carbon\Carbon;
use Illuminate\Http\Request;

class OrdersController extends Controller
{
    public function store(OrderRequest $request,OrderService $orderService){
        $address_id=$request->input('address_id');
        $remark=$request->input('remark','');
        $items=$request->input('items');
        $coupon  = null;

        // 如果用户提交了优惠码
        if ($code = $request->input('coupon_code')) {
            $coupon = CouponCode::where('code', $code)->first();
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
        $order=$orderService->saveOrder($address_id,$items,$remark,$coupon);
       return $order;
    }
    public function index(Request $request,OrderService $orderService){
        /*
        $user=$request->user();
        $orders=$user->orders()->with(['items.product','items.productSku'])
            ->orderBy('created_at','desc')->paginate();
        */
        $orders=$orderService->getOrders();
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
        // 更新发货状态为已收到
        $order->update(['ship_status'=>Order::SHIP_STATUS_RECEIVED]);
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
        // 开启事务
        \DB::transaction(function () use ($reviews, $order) {
            // 遍历用户提交的数据
            foreach ($reviews as $review) {
                $orderItem = $order->items()->find($review['id']);
                // 保存评分和评价
                $orderItem->update([
                    'rating'      => $review['rating'],
                    'review'      => $review['review'],
                    'reviewed_at' => Carbon::now(),
                ]);
            }
            // 将订单标记为已评价
            $order->update(['reviewed' => true]);
            event(new OrderReviewed($order));
        });

        return redirect()->back();
    }

    public function crowdfunding(CrowdFundingOrderRequest $request,OrderService $orderService){
        $sku_id=$request->input('sku_id');
        $amount=$request->input('amount');
        $address_id=$request->input('address_id');
        $order=$orderService->crowdfunding($address_id,$sku_id,$amount);
        return $order;
    }
    public function seckill(SeckillOrderRequest $request,OrderService $orderService){
        $sku_id=$request->input('sku_id');
        //$address_id=$request->input('address_id');
        //$address=UserAddress::query()->find($address_id);
        $sku=ProductSku::query()->find($sku_id);
        $order=$orderService->seckill($request->user(),$request->input('address'),$sku);
        return $order;
    }

}