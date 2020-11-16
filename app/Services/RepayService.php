<?php
namespace App\Services;
use App\Models\Borrow;
use App\Models\BorrowInvest;
use App\Models\BorrowRepayment;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Support\Facades\Log;

class RepayService{
    //还款
    public function repay($user,$borrow_id,$batch){
         $list=$this->getRepayList($borrow_id,$batch);
         $borrow= Borrow::query()->find($borrow_id);
        return \DB::transaction(function ()use ($user,$list,$batch,$borrow){
            $first=$list->first();
            $dealtime = Carbon::parse($first['deadline']);
            $expire=Carbon::now()->diffInMinutes($dealtime,false);
            $expire_days=0;
            $fee_manage = 0; //逾期管理费 还款人-》宝来
            $total_overdue = 0; //逾期罚息费 还款人 -》收款人
            //超过一分钟就算违约
            if($expire<0){
                $expire_days=abs($dealtime->diffInDays(Carbon::now(),false))+1;
                $expire_money=$this->getExpiredFee($list,$expire_days);
                $fee_manage = $expire_money[1];
                $total_overdue=$expire_money[0];
            }
            $totali=0;
            $temp_overdue=0;
            $total_capital=0;
            $total_interest=0;
            foreach ($list as $item){
                $totali=$totali+1;
                $fee_overdue = 0;
                if($expire<0){
                    $fee_overdue=$this->_getExpiredRateOverdue($item['capital']+$item['interest'],$expire_days);
                }
                $item['receive_capital']=$item['capital'];
                $item['receive_interest']=$item['interest'];
                if($expire<0){
                    $fee_overdue=$this->_getExpiredRateOverdue($item['capital']+$item['interest'],$expire_days);
                    if(count($list)==$totali){
                        //最后一个还款违约金的计算要相减
                        $fee_overdue=$total_overdue-$temp_overdue;
                        $item['receive_overdue']=$fee_overdue;
                    }else{
                        $item['receive_overdue']=$fee_overdue;
                        $temp_overdue+=$fee_overdue;
                    }
                }
                $item['repayment_time']=Carbon::now();
                $item['status']=BorrowRepayment::STATUS_COMPLETED;
                $total_capital+=$item['capital'];
                $total_interest+=$item['interest'];
                $item->save();

                //更新投资记录表
                $invest=BorrowInvest::query()->find($item['borrow_invest_id']);
                $invest['receive_capital']=$invest->receive_capital+$item['capital'];
                $invest['receive_interest']=$invest->receive_interest+$item['interest'];
                $invest['receive_overdue']=$invest->receive_overdue+$fee_overdue;
                if($borrow['repayment_times']==$batch){
                    $invest['status']=BorrowInvest::STATUS_COMPLETED;
                }
                $invest->save();

                //转账
                $user->transfer(User::query()->find($item['borrow_invest_user_id']), $item['capital']+$item['interest']+$fee_overdue,['type'=>'finance_payback']);
                //短信通知

            }
             //更新融资信息
             $borrow_data['repayment_already_times']=$borrow['repayment_already_times']+1;
             if($expire<0){
                 $borrow_data['overtimes']=$borrow['overtimes']+1;
             }
             $borrow_data['repayment_capital']=$borrow['repayment_capital']+$total_capital;
             $borrow_data['repayment_interest']=$borrow['repayment_interest']+$total_interest;
             $borrow_data['repayment_managefee']=$borrow['repayment_managefee']+$fee_manage;
             $borrow_data['repayment_overdue']=$borrow['repayment_overdue']+$total_overdue;
             if($borrow['repayment_times'] == $batch){
                 $borrow_data['status']=Borrow::STATUS_COMPLETED;
             }else{
                 $next_list=$this->getRepayList($borrow->id,$batch+1);
                 $next_first=$next_list->first();
                 $borrow_data['next_repaytime'] = Carbon::parse($next_first['deadline']);
             }
             $borrow->update($borrow_data);
            return true;
        });
    }
    //获取逾期费
    public function getExpiredFee($list,$expired_days){
        $capital=collect($list)->sum('capital');
        $interest=collect($list)->sum('interest');
        $total=$capital+$interest;
        $overdue=$this->_getExpiredRateOverdue($total,$expired_days);
        $manage_fee=$this->_getExpiredManageFee($total,$expired_days);
        return [$overdue,$manage_fee];
    }
    //获取还未还款的还款记录
    public function getRepayList($borrow_id,$batch)
    {
        $list = BorrowRepayment::query()
            ->where('batch', $batch)
            ->where('borrow_id', $borrow_id)
            ->where('status', BorrowRepayment::STATUS_PROCCESSING)
            ->get();
        return $list;
    }
    //多条件获取列表
    public function getList($params,$include=null)
        {
            $build = BorrowRepayment::query();
            if(isset($params['batch'])){
                $build->where('batch', $params['batch']);
            }
            if(isset($params['user_id'])){
                $build->where('borrow_invest_user_id', $params['user_id']);
            }
            if(isset($params['borrow_user_id'])){
                $build->where('borrow_user_id', $params['borrow_user_id']);
            }
            if(isset($params['borrow_id'])){
                $build->where('borrow_id', $params['borrow_id']);
            }
            if(isset($params['invest_id'])){
                $build->where('borrow_invest_id', $params['invest_id']);
            }
            if(isset($params['status'])){
                $build->where('status', $params['status']);
            }
            if(isset($params['indays'])){
                $build->whereDate('deadline','>',Carbon::now()->addDays($params['indays']));
            }
            if($include){
                $build->with($include);
            }
            return  $build->get();
        }
    private function  _getExpiredRateOverdue($total,$expired_days){
        //宽限期内
        if(config('borrow.miss_overdue')>=$expired_days){
            return 0;
        }
        return round( config('borrow.rate_overdue') * $total , 2 );
    }
    private function  _getExpiredManageFee($total,$expired_days){
        //宽限期内
        if(config('borrow.miss_manage')>=$expired_days){
            return 0;
        }
        return round( config('borrow.rate_manage') * $total , 2 );
    }
}