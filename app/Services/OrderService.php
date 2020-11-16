<?php
namespace App\Services;

use App\Events\OrderReviewed;
use App\Exceptions\InvalidRequestException;
use App\Jobs\CloseOrder;
use App\Model\CartItem;
use App\Models\Coupon;
use App\Models\Order;
use App\Models\OrderCount;
use App\Models\OrderInvoice;
use App\Models\ProductSku;
use App\Models\UserAddress;
use App\Models\UserInvoice;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Redis;

class OrderService{
    //登录授权用户的订单
    public function getOrders($synthesize_status=-1,$keyword=null,$limit=null,$includes=['items.productSku','items.product']){
       $build= Auth::user()->orders();
           //待付款
       if($synthesize_status==0){
               $build->where('closed',false)
                   ->whereNull('paid_at');
           }
           //待发货
        if($synthesize_status==1){
            $build->whereNotNull('paid_at')
                ->where('closed',false)
                ->where('refund_status',Order::REFUND_STATUS_PENDING)
                ->where('ship_status',Order::SHIP_STATUS_PENDING);
        }
        //待收
        if($synthesize_status==2){
            $build->whereNotNull('paid_at')
                ->where('closed',false)
                ->where('refund_status',Order::REFUND_STATUS_PENDING)
                ->where('ship_status',Order::SHIP_STATUS_DELIVERED);
        }
        //已收待评价
        if($synthesize_status==3){
            $build->whereNotNull('paid_at')
                ->where('closed',false)
                ->where('reviewed',false)
                ->where('refund_status',Order::REFUND_STATUS_PENDING)
                ->where('ship_status',Order::SHIP_STATUS_RECEIVED);
        }
           if($includes && count($includes)>0){
               $build->with($includes);
           }
           if($keyword){
               $build->where(function ($query)use ($keyword) {
                   $like = '%'.$keyword.'%';
                   $query->where('no','like',$like)
                       ->orWhereHas('items.product', function ($query) use ($like) {
                           $query->where('title', 'like', $like)
                               ->orWhere('description', 'like', $like);
                       });
               });
           }
           $build->orderBy('created_at','desc');
            if($limit){
                 return $build->get();
            }else{
                 return $build->paginate(5);
            }

    }
    //订单保存
    public function saveOrder($address_id,$items,$remark, Coupon $coupon = null,$invoice=null){
        // 如果传入了优惠券，则先检查是否可用
        if ($coupon) {
            // 但此时我们还没有计算出订单总金额，因此先不校验
            $coupon->checkAvailable();
        }
        // 开启一个数据库事务
      $order=  \DB::transaction(function ()use ($address_id,$remark,$items,$coupon,$invoice){
            $address=UserAddress::query()->find($address_id);
          // 创建一个订单
            $order=Auth::user()->orders()->make(['remark'=>$remark,
                'address'=>['address'=>$address->full_address,'zip'=>$address->zip,'contact_name'=>$address->contact_name,'contact_phone'=>$address->contact_phone],
                'total_amount'=>0,
                'type'=> Order::TYPE_NORMAL
                ]);
          // 写入数据库
            $order->save();
            $total_amount=0;
            $product_amount=[];
            // 遍历用户提交的 SKU
            foreach ($items as $item){
                $sku=ProductSku::query()->find($item['sku_id']);
                // 创建一个 OrderItem 并直接与当前订单关联
                $orderItem=$order->items()->make(['amount'=>$item['amount'],'price'=>$sku->price]);
                $orderItem->product()->associate($sku->product_id);
                $orderItem->productSku()->associate($sku);
                $orderItem->save();
                $total_amount+=$item['amount']*$sku->price;
                if(in_array($sku->product_id,$product_amount)){
                    $product_amount[$sku->product_id]+=$item['amount']*$sku->price;
                }else{
                    $product_amount[$sku->product_id]=$item['amount']*$sku->price;
                }
                if($sku->decreaseStock($item['amount'])<=0){
                    throw new InvalidRequestException('该商品库存不足');
                }
            }
          if ($coupon) {
              // 总金额已经计算出来了，检查是否符合优惠券规则
              $coupon->couponType->checkAvailable($total_amount,$product_amount);
              // 把订单金额修改为优惠后的金额
              $total_amount = $coupon->couponType->getAdjustedPrice($total_amount);
              $coupon->update(['use_order_id'=>$order->id,'use_time'=>Carbon::now(),'status'=>2]);
          }
            $order->update(['total_amount'=>$total_amount]);

            $skuIds=collect($items)->pluck('sku_id')->all();
            app(CartService::class)->delCartItems($skuIds);
            //代付款
            $this->increaseOrderCount($order,OrderCount::ORDER_TYPE_PENDING);
          // 这里我们直接使用 dispatch 函数
          dispatch(new CloseOrder($order,config('app.order_ttl')));

          if($invoice){
              $this->storeOrderInvoice($order,$invoice);
          }
            return $order;
        });
      return $order;
    }
   //众筹订单
    public function crowdfunding($address_id,$sku_id,$amount){

        $address=UserAddress::query()->find($address_id);
        $sku=ProductSku::query()->find($sku_id);

        $order=\DB::transaction(function ()use ($address,$sku,$amount){
           $total_amount=$sku->price*$amount;
            $data=['address'=>
                ['address'=>$address->full_address,'zip'=>$address->zip,'contact_name'=>$address->contact_name,'contact_phone'=>$address->contact_phone],
                'remark'=>'',
                'type'=> Order::TYPE_CROWDFUNDING,
                'total_amount'=>$total_amount];
            $order=Auth::user()->orders()->make($data);
            $order->save();
            $orderItem=$order->items()->make(['price'=>$sku->price,'amount'=>$amount]);
            $orderItem->product()->associate($sku->product_id);
            $orderItem->productSku()->associate($sku);
            $orderItem->save();
            if($sku->decreaseStock($amount)<=0){
                throw  new InvalidRequestException('该商品库存不足');
            }
            return $order;
        });
        // 众筹结束时间减去当前时间得到剩余秒数
        $crowdfundingTtl=$sku->product->crowdfunding->end_at->getTimestamp()-time();
        // 剩余秒数与默认订单关闭时间取较小值作为订单关闭时间
        dispatch(new CloseOrder($order,min(config('app.order_ttl'),$crowdfundingTtl)));
        return $order;
    }

    //订单退货
    public function refundOrder(Order $order){
        switch ($order->payment_method){
            case "alipay":
                // 用我们刚刚写的方法来生成一个退款订单号
                $refundNo = Order::getAvailableRefundNo();
                $order->update(['refund_status'=>Order::REFUND_STATUS_PROCESSING,'refund_no'=>$refundNo]);
                $data=['out_trade_no'=>$order->no,'refund_amount'=>$order->total_amount,'out_request_no'=>$refundNo];
                // 调用支付宝支付实例的 refund 方法
                $ret = app('alipay')->refund([
                    'out_trade_no' => $order->no, // 之前的订单流水号
                    'refund_amount' => $order->total_amount, // 退款金额，单位元
                    'out_request_no' => $refundNo, // 退款订单号
                ]);
                // 根据支付宝的文档，如果返回值里有 sub_code 字段说明退款失败
                if ($ret->sub_code) {
                    // 将退款失败的保存存入 extra 字段
                    $extra = $order->extra;
                    $extra['refund_failed_code'] = $ret->sub_code;
                    // 将订单的退款状态标记为退款失败
                    $order->update([
                        'refund_no' => $refundNo,
                        'refund_status' => Order::REFUND_STATUS_FAILED,
                        'extra' => $extra,
                    ]);
                } else {
                    // 将订单的退款状态标记为退款成功并保存退款订单号
                    $order->update([
                        'refund_no' => $refundNo,
                        'refund_status' => Order::REFUND_STATUS_SUCCESS,
                    ]);
                }
                break;
            case 'wechat':
//               生成退款订单号
                $refundNo = Order::getAvailableRefundNo();
                app('wechat_pay')->refund([
                    'out_trade_no' => $order->no, // 之前的订单流水号
                    'total_fee' => $order->total_amount * 100, //原订单金额，单位分
                    'refund_fee' => $order->total_amount * 100, // 要退款的订单金额，单位分
                    'out_refund_no' => $refundNo, // 退款订单号
                    // 微信支付的退款结果并不是实时返回的，而是通过退款回调来通知，因此这里需要配上退款回调接口地址
                    'notify_url' => route('payment.wechat.refund_notify'), // 由于是开发环境，需要配成 requestbin 地址
                ]);
                // 将订单状态改成退款中
                $order->update([
                    'refund_no' => $refundNo,
                    'refund_status' => Order::REFUND_STATUS_PROCESSING,
                ]);
                break;
            case 'webself':
                // 用我们刚刚写的方法来生成一个退款订单号
                $refundNo = Order::getAvailableRefundNo();
                $order->update(['refund_status'=>Order::REFUND_STATUS_PROCESSING,'refund_no'=>$refundNo]);
                //$data=['out_trade_no'=>$order->no,'refund_amount'=>$order->total_amount,'out_request_no'=>$refundNo];
                if($order->user->paid($order)){
                    if($order->user->refund($order))
                    {
                        $order->update([
                            'refund_no' => $refundNo,
                            'refund_status' => Order::REFUND_STATUS_SUCCESS,
                        ]);
                    }
                    else{
                        // 将退款失败的保存存入 extra 字段
                        $extra = $order->extra;
                        $extra['refund_failed_code'] = 'webself';
                        // 将订单的退款状态标记为退款失败
                        $order->update([
                            'refund_no' => $refundNo,
                            'refund_status' => Order::REFUND_STATUS_FAILED,
                            'extra' => $extra,
                        ]);
                    }
                }
                break;
                default:
                // 原则上不可能出现，这个只是为了代码健壮性
                throw new InternalException('未知订单支付方式：'.$order->payment_method);
                break;
        }
    }

    //秒杀订单
    public function seckill($user,array $addressData,$sku){
        $order = \DB::transaction(function () use ($user,$addressData, $sku) {
            // 扣减对应 SKU 库存
            if ($sku->decreaseStock(1) <= 0) {
                throw new InvalidRequestException('该商品库存不足');
            }
            // 创建一个订单
            $order = new Order([
                'address'      => [ // 将地址信息放入订单中
                    'address'       => $addressData['province'].$addressData['city'].$addressData['district'].$addressData['address'],
                    'zip'            => $addressData['zip'],
                    'contact_name'  => $addressData['contact_name'],
                    'contact_phone' => $addressData['contact_phone'],
                ],
                'remark'       => '',
                'total_amount' => $sku->price,
                'type'         => Order::TYPE_SECKILL,
            ]);
            // 订单关联到当前用户
            $order->user()->associate($user);
            // 写入数据库
            $order->save();
            // 创建一个新的订单项并与 SKU 关联
            $item = $order->items()->make([
                'amount' => 1, // 秒杀商品只能一份
                'price'  => $sku->price,
            ]);
            $item->product()->associate($sku->product_id);
            $item->productSku()->associate($sku);
            $item->save();

            Redis::decr('seckill_sku_'.$sku->id);
            return $order;
        });
        // 秒杀订单的自动关闭时间与普通订单不同
        dispatch(new CloseOrder($order, config('app.seckill_order_ttl')));

        return $order;
    }

    public function closeOrder(Order $order){
        \DB::transaction(function ()use ($order){
            // 将订单的 closed 字段标记为 true，即关闭订单
            $order->update(['closed'=>true]);

            foreach ($order->items as $item){
                // 循环遍历订单中的商品 SKU，将订单中的数量加回到 SKU 的库存中去
                $item->productSku->addStock($item->amount);
                // 当前订单类型是秒杀订单，并且对应商品是上架且尚未到截止时间
                if ($item->order->type === Order::TYPE_SECKILL
                    && $item->product->on_sale
                    && !$item->product->seckill->is_after_end) {
                    // 将 Redis 中的库存 +1
                    Redis::incr('seckill_sku_'.$item->productSku->id);
                }
            }
            //代付款订单关闭
            $this->decreaseOrderCount($order,OrderCount::ORDER_TYPE_PENDING);
            $this->increaseOrderCount($order,OrderCount::ORDER_TYPE_CLOSE);
            if ($order->couponCode) {
                $order->couponCode->changeUsed(false);
            }
        });
        return [];
    }

    public function increaseOrderCount(Order $order,$order_type){
        $order_count=$order->user->ordercounts()->where('order_type',$order_type)->first();
        if($order_count){
            $order_count->update(['order_count'=>$order_count->order_count+1]);
        }else{
            $order_count=$order->user->ordercounts()->create(['order_type'=>$order_type,'order_count'=>1]);
        }
    }
    public function decreaseOrderCount(Order $order,$order_type){
        $order_count=OrderCount::query()->where('user_id',$order->user_id)->where('order_type',$order_type)->first();
        if($order_count && $order_count->id>0){
            $order_count->update(['order_count'=>$order_count->order_count-1]);
        }
    }

    public function review($reviews,Order $order){
        // 开启事务
        \DB::transaction(function () use ($reviews, $order) {
            // 遍历用户提交的数据
            foreach ($reviews as $review) {
                $orderItem = $order->items()->find($review['id']);
                // 保存评分和评价
                $orderItem->update([
                    'rating'      => $review['rating'],
                    'review'      => $review['review'],
                    'review_images'      => $review['covers'],
                    'is_anonymous'      => $review['is_anonymous'],
                    'reviewed_at' => Carbon::now(),
                ]);
            }
            // 将订单标记为已评价
            $order->update(['reviewed' => true]);
            $this->decreaseOrderCount($order,OrderCount::ORDER_TYPE_RECEIVED);
            event(new OrderReviewed($order));
        });
    }

    public function received(Order $order){
        // 更新发货状态为已收到
        $order->update(['ship_status'=>Order::SHIP_STATUS_RECEIVED]);
        //待收货订单减少
        $this->decreaseOrderCount($order,OrderCount::ORDER_TYPE_DELIVERED);
        //已收货订单增加
        $this->increaseOrderCount($order,OrderCount::ORDER_TYPE_RECEIVED);
    }

    public function storeOrderInvoice( Order $order,UserInvoice $invoice){
        $order_invoice=$order->invoice()->make([
            'order_sn'=>$order->no,
            'username'=>Auth::user()->name,
            'title'=>$invoice->title,
            'duty_paragraph'=>$invoice->duty_paragraph,
            'opening_bank'=>$invoice->opening_bank,
            'address'=>$invoice->address,
            'content'=>$invoice->content,
            'type'=>$invoice->type,
            'tax_money'=>$order->total_amount,
            'status'=>0
        ]);
        $order_invoice->user()->associate($order->user_id);
        $order_invoice->save();
        return $order_invoice;
    }
}