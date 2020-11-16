<?php

namespace App\Http\Controllers\Api;

use App\Events\OrderPaid;
use App\Exceptions\InvalidRequestException;
use App\Http\Requests\ApplyRefundRequest;
use App\Models\Order;
use App\Services\PaymentService;
use Carbon\Carbon;
use Endroid\QrCode\QrCode;
use Illuminate\Http\Request;

class PaymentController extends Controller
{
    public function prePay (Order $order,Request $request){
        // 判断订单是否属于当前用户
        $this->authorize('own', $order);
        // 订单已支付或者已关闭
        if ($order->paid_at || $order->closed) {
            throw new InvalidRequestException('订单状态不正确');
        }
        $pay_type=$request->input('pay_type');
        $trade_type=$request->input('trade_type');
        $openid=$request->input('openid');
        switch ($pay_type){
            case 1:

                //微信支付
                if($trade_type=='js'){//微信公众号H5调用微信支付
                    //$miniProgram = \EasyWeChat::miniProgram();
                    //$data = $miniProgram->auth->session($code);
                }
                if($trade_type=='mini_program'){//微信小程序调用微信支付
                    if(!$openid){
                        $code=$request->input('code');
                    }
                    // 根据 code 获取微信 openid 和 session_key
                    //$miniProgram = \EasyWeChat::miniProgram();
                    //$data = $miniProgram->auth->session($code);
                    $openid= $data['openid']='om9DL4lsqImJVbW6fCTpkK9pqLHc';
                    $wechat=  app('wechat_pay')->app([
                        'out_trade_no'=>$order->no,
                        'total_fee'=>$order->total_amount*100,
                        'body'=>'支付单'.$order->no
                    ]);
                }
                if($trade_type=='app'){//app里面调用微信支付
                    $wechat=  app('wechat_pay')->app([
                        'out_trade_no'=>$order->no,
                        'total_fee'=>$order->total_amount*100,
                        'body'=>'支付单'.$order->no
                    ]);
                }
                break;
        }
        // 调用支付宝的网页支付
      return  app('alipay')->web([
            'out_trade_no'=>$order->no,// 订单编号，需保证在商户端不重复
            'total_amount'=>$order->total_amount,// 订单金额，单位元，支持小数点后两位
            'subject'=>'支付单'.$order->no,// 订单标题
        ]);
    }
    // 前端回调页面
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
        return app('alipay')->success();
    }
    // 服务器端回调
    public function alipayReturn(){
        /*
        try {
            $data=app('alipay')->verify();
            \Log::debug('Alipay notify', $data->all());
        } catch (\Exception $e) {
            return view('errors.index', ['message' => '数据不正确'.$e->getMessage()]);
        }
        */

        return view('errors.index', ['message' => '付款成功']);
    }
    public function payByWechat(Order $order){

        $this->authorize('own',$order);
        // 订单已支付或者已关闭
        if ($order->paid_at || $order->closed) {
            throw new InvalidRequestException('订单状态不正确');
        }
        $wechatOrder=  app('wechat_pay')->scan([
            'out_trade_no'=>$order->no,
            'total_fee'=>$order->total_amount*100,
            'body'=>'支付单'.$order->no
            ]);
        $qrCode=new QrCode($wechatOrder->code_url);
        // 将生成的二维码图片数据以字符串形式输出，并带上相应的响应类型
        return response($qrCode->writeString(), 200, ['Content-Type' => $qrCode->getContentType()]);
    }
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
        return app('wechat_pay')->success();
    }
    public function afterPaid(Order $order){
        event(new OrderPaid($order));
    }
    //申请退货，退款
    public function applyRefund(Order $order,ApplyRefundRequest $request){
        // 校验订单是否属于当前用户
        $this->authorize('own', $order);
        if (!$order->paid_at) {
            throw new InvalidRequestException('该订单未支付，不可退款',422);
        }
        // 众筹订单不允许申请退款
        if ($order->type === Order::TYPE_CROWDFUNDING) {
            throw new InvalidRequestException('众筹订单不支持退款');
        }
        if($order->refund_status!==Order::REFUND_STATUS_PENDING){
            throw new InvalidRequestException('该订单已经申请过退款，请勿重复申请',422);
        }
        // 将用户输入的退款理由放到订单的 extra 字段中
        $extra=$order->extra?:[];
        $extra['refund_reason']=$request->input('reason');
        // 将订单退款状态改为已申请退款
        $order->update(['refund_status'=>Order::REFUND_STATUS_APPLIED,'extra'=>$extra]);
        return $order;
    }

    public function wechatRefundNotify(Request $request)
    {
        // 给微信的失败响应
        $failXml = '<xml><return_code><![CDATA[FAIL]]></return_code><return_msg><![CDATA[FAIL]]></return_msg></xml>';
        $data = app('wechat_pay')->verify(null, true);

        // 没有找到对应的订单，原则上不可能发生，保证代码健壮性
        if(!$order = Order::where('no', $data['out_trade_no'])->first()) {
            return $failXml;
        }

        if ($data['refund_status'] === 'SUCCESS') {
            // 退款成功，将订单退款状态改成退款成功
            $order->update([
                'refund_status' => Order::REFUND_STATUS_SUCCESS,
            ]);
        } else {
            // 退款失败，将具体状态存入 extra 字段，并表退款状态改成失败
            $extra = $order->extra;
            $extra['refund_failed_code'] = $data['refund_status'];
            $order->update([
                'refund_status' => Order::REFUND_STATUS_FAILED,
                'extra' => $extra
            ]);
        }

        return app('wechat_pay')->success();
    }

    public function payByWeb(Order $order,PaymentService $service){
        // 判断订单是否属于当前用户
        $this->authorize('own', $order);
        // 订单已支付或者已关闭
        if ($order->paid_at || $order->closed) {
            throw new InvalidRequestException('订单状态不正确',555);
        }
        $user=$order->user;
        $wallet=$user->balance;
        if($wallet<$order->total_amount){
            throw new InvalidRequestException('账户余额不足',555);
        }
        $user->pay($order);
        $service->myNotify($order);
        return $order;
    }
}
