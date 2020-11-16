<?php

namespace App\Http\Resources;

use App\Models\Order;
use Carbon\Carbon;
use Illuminate\Http\Resources\Json\JsonResource;

class OrderResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        $data= parent::toArray($request);
        $data['close_time']=Carbon::parse($data['created_at'])->addSeconds(config('app.order_ttl'))->toDateTimeString();
        if($data['payment_method']=='webself'){
            $data['paymentMethod']='余额支付';
        }else if($data['payment_method']=='alipay'){
            $data['paymentMethod']='支付宝支付';
        }else if($data['payment_method']=='wechat'){
            $data['paymentMethod']='微信支付';
        }
        $data['shipping_explain']='免邮';
        if($data['paid_at']){
            if($data['refund_status']==Order::REFUND_STATUS_PENDING){
                switch ($data['ship_status']){
                    case Order::SHIP_STATUS_PENDING:
                        $data['order_status']='待发货';
                        break;
                    case Order::SHIP_STATUS_DELIVERED:
                        $data['order_status']='待收货';
                        break;
                    case Order::SHIP_STATUS_RECEIVED:
                        $data['order_status']='已收货';
                        break;
                }
            }else if($data['refund_status']==Order::REFUND_STATUS_APPLIED){
                $data['order_status']='申请售后';
            }
            else if($data['refund_status']==Order::REFUND_STATUS_PROCESSING){
                $data['order_status']='售后处理中';
            }else if($data['refund_status']==Order::REFUND_STATUS_SUCCESS){
                $data['order_status']='退货成功';
            }else if($data['refund_status']==Order::REFUND_STATUS_FAILED){
                $data['order_status']='退货失败';
            }
        }else{
            $data['order_status']='未支付';
        }
        return $data;
    }
}
