<?php

namespace App\Http\Resources;
use App\Models\Order;
use App\Models\Transaction;
use Illuminate\Http\Resources\Json\JsonResource;

class TransactionResource extends JsonResource
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
        if($data['meta']['type']==Transaction::TYPE_WITHDRAW){
            $data['account_type']='提现';
        }
        if($data['meta']['type']==Transaction::TYPE_DEPOSIT){
            $data['account_type']='充值';
        }
        if($data['meta']['type']==Order::REFUND_STATUS_PENDING){
            $data['account_type']='购买消费';
        }
        if($data['meta']['type']==Order::REFUND_STATUS_PROCESSING){
            $data['account_type']='消费退款';
        }
        if($data['meta']['type']=='finance_frozen' && $data['type']==Transaction::TYPE_WITHDRAW){
            $data['account_type']='投资支出';
        }
        if($data['meta']['type']=='finance_frozen' && $data['type']==Transaction::TYPE_DEPOSIT){
            $data['account_type']='投资冻结暂存';
        }
        if($data['meta']['type']=='finance_success' && $data['type']==Transaction::TYPE_DEPOSIT){
            $data['account_type']='融资收入';
        }
        if($data['meta']['type']=='finance_success' && $data['type']==Transaction::TYPE_WITHDRAW){
            $data['account_type']='投资成功转出';
        }
        if($data['meta']['type']=='finance_fail'){
            $data['account_type']='投资失败退款';
        }

        if($data['meta']['type']=='finance_payback'  && $data['type']==Transaction::TYPE_DEPOSIT){
            $data['account_type']='投资回款';
        }

        if($data['meta']['type']=='finance_payback'  && $data['type']==Transaction::TYPE_WITHDRAW){
            $data['account_type']='融资支出';
        }

        return $data;
    }
}
