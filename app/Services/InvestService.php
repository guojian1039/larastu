<?php
namespace App\Services;
use App\Models\Borrow;
use App\Models\BorrowInvest;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Support\Facades\Log;

class InvestService{
    //对融资项目投资
    public function invest($user,$borrow_id,$invest_sum){
        $borrow=Borrow::query()->find($borrow_id);
        $rv=true;
        return \DB::transaction(function ()use ($user,$borrow,$invest_sum,$rv){
            //计算已投资总额
            $invest_list=BorrowInvest::query()
                //->where('user_id',$user->id)
                ->where('borrow_id',$borrow['id'])
                ->where('status',BorrowInvest::STATUS_FREEZE)
                ->get();
            $reset_sum=collect($invest_list)->sum('invest_sum');
            $invest=collect($invest_list)->where('user_id',$user->id)->first();
            //投资总金额不能超总融资额，这个在投资操作前也要验证
            if(($reset_sum+$invest_sum)<=$borrow['money']){
                //正常投资
                if($invest){
                    $invest->update(['invest_sum'=>$invest->invest_sum+$invest_sum]);//投资额度累计
                }else{
                    $invest=new BorrowInvest();
                    $invest->borrow_user_id=$borrow['user_id'];
                    $invest->status=BorrowInvest::STATUS_FREEZE;
                    $invest->parent_id=0;
                    $invest->transfer_id=0;
                    $invest->invest_sum=$invest_sum;
                    $invest->capital=$invest_sum;
                    $invest->interest=0;
                    $invest->receive_capital=0;
                    $invest->receive_interest=0;
                    $invest->receive_overdue=0;
                    $invest->user()->associate($user);
                    $invest->borrow()->associate($borrow);
                    $invest->save();//投资新增
                }
                //给公共账号打款，即用户资金冻结，
                $user->transfer(User::query()->find(1), $invest_sum,['type'=>'finance_frozen']);
                //通知投资人，投资完成，账号被转到公共账号冻结

                //满标判断
                if(intval($reset_sum+$invest_sum)==intval($borrow['money'])){
                    //满标
                    $borrow->update(['full_time'=>Carbon::now(),'status'=>Borrow::STATUS_BIDSUCCESS]);
                }
            }else{
                $rv=false;
            }
            return $rv;
        });
    }
    //投资前验证【1、投资账户额度是否有效，2、投资金额是否有效】

    public function beforInvest($user_id,$borrow_id,$invest_sum){
        $borrow=Borrow::query()->find($borrow_id);
        if(!$borrow){

        }
    }

    public function getList($params,$include=null){
        $build= BorrowInvest::query();
        if(isset($params['user_id'])){
            $build->where('user_id',$params['user_id']);
        }
        if($include){
            $build->with($include);
        }
        return $build->get();
    }
}