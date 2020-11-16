<?php
namespace App\Services;
use App\Events\OrderPaid;
use App\Models\Order;
use App\Models\OrderCount;
use Carbon\Carbon;

class PaymentService{
    //支付宝支付回调
     public function alipayNotify(){
         // 校验提交的参数是否合法
         $data=app('alipay')->verify();
         // 如果订单状态不是成功或者结束，则不走后续的逻辑
         // 所有交易状态：https://docs.open.alipay.com/59/103672
         if(!in_array($data->trade_status, ['TRADE_SUCCESS', 'TRADE_FINISHED'])) {
             return app('alipay')->success();
         }
         // $data->out_trade_no 拿到订单流水号，并在数据库中查询
         $order=Order::query()->where('no',$data->out_trade_no)->first();
         // 正常来说不太可能出现支付了一笔不存在的订单，这个判断只是加强系统健壮性。
         if(!$order){
             return 'fail';
         }
         // 如果这笔订单的状态已经是已支付
         if($order->paid_at){
             // 返回数据给支付宝
             return app('alipay')->success();
         }
         $order->update(['payment_method'=>'alipay','payment_no'=>$data->trade_no,'paid_at'=>Carbon::now()]);
         $this->afterPaid($order);

         $this->orderCount($order);
         return app('alipay')->success();
     }
     private function afterPaid(Order $order){
        event(new OrderPaid($order));
    }
    private function orderCount(Order $order){
        //代付款订单减少
        app(OrderService::class)->decreaseOrderCount($order,OrderCount::ORDER_TYPE_PENDING);
        //代发货订单增加
        app(OrderService::class)->increaseOrderCount($order,OrderCount::ORDER_TYPE_APPLIED);
    }
    //微信支付回调
    public function wechatNotify(){
        $data=app('wechat_pay')->verify();
        if(!in_array($data->trade_status,['TRADE_SUCCESS'])){
            return app('wechat_pay')->success();
        }
        $order=Order::query()->where('no',$data->out_trade_no)->first();
        if(!$order){
            return 'fail';
        }
        // 订单已支付
        if ($order->paid_at) {
            // 告知微信支付此订单已处理
            return app('wechat_pay')->success();
        }
        $order->update(['payment_no'=>$data->transaction_id,'payment_method'=>'wechat','paid_at'=>Carbon::now()]);
        $this->afterPaid($order);
        $this->orderCount($order);
        return app('wechat_pay')->success();
    }

    public function myNotify(Order $order){
        $order->update(['payment_method'=>'webself','payment_no'=>$order->id,'paid_at'=>Carbon::now()]);
        $this->afterPaid($order);
        $this->orderCount($order);
    }
}