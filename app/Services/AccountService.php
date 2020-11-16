<?php
namespace App\Services;
use App\Models\Order;
use App\Models\Transaction;
class AccountService{
    public function getbill($user,$credit_type=0,$limit=null)
    {
        // 创建一个查询构造器
        $builder=Transaction::query()->where('payable_id',$user->id)->where('payable_type',Transaction::TYPE_USERPAYABLE);
        if($credit_type==1){
            //充值记录
            $builder->where('type',Transaction::TYPE_DEPOSIT)->whereJsonContains('meta->type',Transaction::TYPE_DEPOSIT);
        }else if($credit_type==2){
            //消费记录
            $builder->where('type',Transaction::TYPE_WITHDRAW)->whereJsonContains('meta->type',Order::REFUND_STATUS_PENDING);
        }
        $builder->orderBy('id','desc');
        if($limit){
            $bills= $builder->limit($limit)->get();
        }
        else{
            $bills= $builder->paginate(10);
        }
        return $bills;
    }
}