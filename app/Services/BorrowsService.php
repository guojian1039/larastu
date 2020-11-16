<?php
namespace App\Services;
use App\Models\Borrow;
use App\Models\BorrowInvest;
use App\Models\BorrowRepayment;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Support\Facades\Log;

class BorrowsService{
    //融资列表
    public function getList($params,$include=null,$limit=null,$order='id_desc')
    {
        // 创建一个查询构造器
        $builder =Borrow::query();
        if(isset($params['status'])){
            $builder->where('status',$params['status']);
        }

        //$builder->whereRaw('datediff(now(),publish_time)<=collect_day')
        //    ->where('publish_time','<=',Carbon::now());

        if(isset($params['user_id'])){
            $builder->where('user_id',$params['user_id']);
        }

        if(isset($params['indays'])){
            $builder->whereDate('next_repaytime','<',Carbon::now()->addDays($params['indays']));
        }
        // 是否有提交 order 参数，如果有就赋值给 $order 变量
        // order 参数用来控制商品的排序规则
        if ($order) {
            // 是否是以 _asc 或者 _desc 结尾
            if (preg_match('/^(.+)_(asc|desc)$/', $order, $m)) {
                // 如果字符串的开头是这 3 个字符串之一，说明是一个合法的排序值
                if (in_array($m[1], ['id'])) {
                    // 根据传入的排序值来构造排序参数
                    $builder->orderBy($m[1], $m[2]);
                }
            }
        }

        if($include){
            $builder->with($include);
        }

        if($limit && is_numeric($limit)){
            $list= $builder->limit($limit)->get();
        }
        else{
            $list= $builder->paginate(12);
        }
        return $list;
    }
    //流标--融资失败
    public function bidFail(Borrow $borrow){
        return \DB::transaction(function ()use ($borrow){
            //融资失败
            $borrow->update(['status'=>Borrow::STATUS_BIDFAIL]);
            //已投资列表
            $invests=BorrowInvest::query()
                ->where('borrow_id',$borrow['id'])
                ->where('status',BorrowInvest::STATUS_FREEZE)->get();
            //公共账号
            $user=User::query()->find(1);
            //给已投资人退款操作
            foreach ($invests as $invest){
                $user->transfer($invest->user,$invest->invest_sum,['type'=>'finance_fail']);
                $invest->update(['status'=>BorrowInvest::STATUS_FAIL]);
            }
            return $borrow;
        });
    }
    //复审融资成功
    public function getPass(Borrow $borrow){
        return \DB::transaction(function ()use ($borrow){
            //融资成功
            //$borrow->update(['status'=>Borrow::STATUS_SUCCESS]);
            //投资记录表
            $invests=BorrowInvest::query()
                ->where('borrow_id',$borrow['id'])
                ->where('status',BorrowInvest::STATUS_FREEZE)->get();
            //公共账户
            $user=User::query()->find(1);
            $total = $borrow['repayment_times'];//还款总期数
            //获取还款时间
            $repaymentTime=$this->_repaymentTime($borrow['repayment_type'],$total,$borrow['duration']);
            //生成还款计划
            foreach ($invests as $invest){
                $data['borrow_invest_id'] = $invest['id'];//投资记录ID
                $data['borrow_invest_user_id'] = $invest['user_id'];//投资人ID
                $data['borrow_id'] = $borrow['id'];//借款ID
                $data['borrow_user_id'] = $borrow['user_id'];//借款人UID
                $data['status'] = BorrowRepayment::STATUS_PROCCESSING;

                $capital = $interest = 0;//初始化 本金 、 利息总和
                for($i = 1;$i <= $total;$i++){
                    $data['batch'] = $i;//期数
                    $res = $this->_repaymentMoney($invest['invest_sum'],$borrow['rate'],$borrow['repayment_type'],$borrow['duration'],$total,$i,$capital);
                    //if($res[0] === false) return [false,13];//本金利息计算出错
                    $data['capital'] = round($res[0],2);//这一期需还本金
                    $data['interest'] = round($res[1],2);//这一期需还利息
                    $capital += $data['capital'];//本金总和
                    $interest += $data['interest'];//利息总和

                    if($i == $total && $invest['invest_sum'] != $capital){//最后一期时 本金总和不相等投资金额，做下处理
                        $gap = $capital - $invest['invest_sum'];//差值
                        $data['capital'] -= $gap;
                        $capital -= $gap;
                        $data['interest'] += $gap;
                        $interest += $gap;
                    }

                    $data['deadline']=$repaymentTime[$i];
                    //生成还款计划
                    BorrowRepayment::query()->create($data);
                }
                //投资记录状态更新
                $invest->update(['status'=>BorrowInvest::STATUS_PROCCESSING,'capital'=>$capital,'interest'=>$interest]);
                //通知投资人--投资成功
            }

            //通知融资人--融资成功【短信，微信】
            $user->transfer($borrow->user,($borrow->money-$borrow->fee),['type'=>'finance_success']);
            return $repaymentTime[1];
        });
    }
    //复审融资失败
    public function getFail(Borrow $borrow){
        return \DB::transaction(function ()use ($borrow){
            //$borrow->update(['status'=>Borrow::STATUS_REDEALFAIL]);
            $invests=BorrowInvest::query()
                ->where('borrow_id',$borrow['id'])
                ->where('status',BorrowInvest::STATUS_FREEZE)->get();
            //公共账号
            $user=User::query()->find(1);
            //给投资人退款
            foreach ($invests as $invest){
                $user->transfer($invest->user,$invest->invest_sum,['type'=>'finance_fail']);
                $invest->update(['status'=>BorrowInvest::STATUS_FAIL]);
            }
            return true;
        });
    }

    //计算每次的还款本金与利息
    private function _repaymentMoney($capital,$rate,$repayment_type,$duration,$total,$batch,$already_capital){
        if($duration > 0) $rate = $rate * 0.01 / 12; //月利率 = 年化利率/12个月
        else $rate = $rate * 0.01 / 360; //日利率 = 年化利率/360天

        $batch_capital = false;
        $batch_interest = false;
        switch($repayment_type){
            case 3: $rate *= 3; //按季等额本息还款 把月利率改成季利率，然后使用“按月等额本息还款”的公式
            case 2: //按月等额本息还款
                static $repayment = 0;//定义静态变量 每期固定还款金额

                if(!$repayment){
                    $pow = pow( 1 + $rate, $total );
                    $a = $capital*$rate*$pow; //公式分子 本金*月利率*(1+月利率)^月数
                    $b = $pow - 1; //公式分母 (1+月利率)^月数 - 1
                    $repayment = round($a/$b,4); //得出每个月应该还的钱 每期固定还款金额
                }

                $batch_interest = ($capital - $already_capital) * $rate;//本期利息
                $batch_capital = $repayment - $batch_interest;//本期本金 = 每期固定还款金额 - 本期利息

                if($batch == $total) $repayment = 0;//最后一期把静态变量$repayment初始为0
                break;


            case 4: //按月还息到期还本
                if($batch == $total) $batch_capital = $capital;//本期本金 只有最后一期有本金
                else $batch_capital = 0;//本期本金

                $batch_interest = $capital * $rate;//本期利息 每个月的利息是一样的
                break;

            case 5: //一次性还款
                if($batch == 1){ //一次性还款只有一期
                    $batch_capital = $capital;//本期本金
                    $batch_interest = $capital * $rate * abs($duration);//本期利息 按天算$rate是日利率 按月算$rate是月利率
                }
                break;

            case 6: //按季还息到期还本
                if($batch == $total){
                    $batch_capital = $capital;//本期本金 只有最后一期有本金
                    $batch_interest = $capital * $rate * ($duration - ($total - 1)*3);//本期利息 最后一个季度可能只有一个月 例如借款10个月按季度还款 分4期还
                }else{
                    $batch_capital = 0;//本期本金
                    $batch_interest = $capital * $rate * 3;//本期利息 每个季度的利息是一样的
                }
                break;
        }

        return [$batch_capital,$batch_interest];
    }

    //计算还款时间
    private function _repaymentTime($repayment_type,$times,$duration){
        $arr = [];
        $time =Carbon::tomorrow();// strtotime(date( "Y-m-d", TIME )." 23:59:59");//求出时间戳
        switch($repayment_type){
            case 2: //按月等额本息还款
            case 4: //按月还息到期还本
                for($i = 1;$i <= $times; $i++){
                    //$arr[$i] = strtotime( "+{$i} month", $time );
                    $arr[$i]=Carbon::tomorrow()->addMonths($i)->addSeconds(-1);
                }
                break;
            case 3: //按季等额本息还款
            case 6: //按季还息到期还本
                for($i = 1;$i <= $times; $i++){
                    $k = $i*3;

                    if($i == $times){ //最后一个季度
                        $j = $duration%3;//能否整除3
                        if($j) $k = ($i - 1)*3+$j;//有余数，余数就是最后一个季度的月数
                    }

                    //$arr[$i] = strtotime( "+{$k} month", $time );
                    $arr[$i]=Carbon::tomorrow()->addMonths($k)->addSeconds(-1);
                }
                break;
            case 5: //一次性还款
                if($duration > 0) $arr[1]=Carbon::tomorrow()->addMonths($duration)->addSeconds(-1); //$arr[1] = strtotime( "+{$duration} month", $time );
                else{
                    $duration = abs($duration);
                    //$arr[1] = strtotime( "+{$duration} day", $time );
                    $arr[1]=Carbon::tomorrow()->addDays($duration)->addSeconds(-1);
                }
        }
        return $arr;
    }

    public function getTime(){
        return $this->_repaymentTime(6,4,12);
    }
}