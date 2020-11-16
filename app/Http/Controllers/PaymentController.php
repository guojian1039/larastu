<?php

namespace App\Http\Controllers;

use App\Events\OrderPaid;
use App\Exceptions\InvalidRequestException;
use App\Http\Requests\ApplyRefundRequest;
use App\Models\Order;
use App\Models\User;
use App\Services\PaymentService;
use Carbon\Carbon;
use Endroid\QrCode\QrCode;
use Illuminate\Http\Request;

class PaymentController extends Controller
{
    protected $paymentService;
    public function __construct(PaymentService $paymentService)
    {
        $this->paymentService=$paymentService;
    }
    public function payByAlipay (Order $order){
        // 判断订单是否属于当前用户
        $this->authorize('own', $order);
        // 订单已支付或者已关闭
        if ($order->paid_at || $order->closed) {
            throw new InvalidRequestException('订单状态不正确');
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
       return $this->paymentService->alipayNotify();
    }
    // 支付宝服务器端回调
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
    //微信服务器端回调
    public function wechatNotify(){
       return $this->paymentService->wechatNotify();
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
