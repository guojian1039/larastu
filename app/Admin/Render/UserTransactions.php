<?php

namespace App\Admin\Renders;
use App\Models\Order;
use App\Models\Transaction;
use Dcat\Admin\Support\LazyRenderable;
use Dcat\Admin\Widgets\Table;
class UserTransactions extends LazyRenderable
{
    public function render()
    {
        // 获取ID
        $id = $this->key;
        // 获取其他自定义参数
        //$type = $this->post_type;
        $data=Transaction::query()
            //->where('payable_type', $wallet->holder_type)
            ->where('payable_id', $id)
            ->limit(20)
            ->get(['type','amount','created_at','meta'])->toArray();

        $info=[];
        foreach ($data as $datum){
            if(isset($datum['meta']) && isset($datum['meta']['type'])){
                if($datum['meta']['type']==Transaction::TYPE_WITHDRAW){
                    $datum['type']='提现';
                }
                else if($datum['meta']['type']==Transaction::TYPE_DEPOSIT){
                    $datum['type']='充值';
                }
                else if($datum['meta']['type']==Order::REFUND_STATUS_PENDING){
                    $datum['type']='购买消费';
                }
                else  if($datum['meta']['type']==Order::REFUND_STATUS_PROCESSING){
                    $datum['type']='消费退款';
                }
                else if($datum['meta']['type']=='finance_frozen' && $datum['type']==Transaction::TYPE_WITHDRAW){
                    $datum['type']='投资支出';
                }
                else if($datum['meta']['type']=='finance_frozen' && $datum['type']==Transaction::TYPE_DEPOSIT){
                    $datum['type']='投资冻结暂存';
                }
                else if($datum['meta']['type']=='finance_success' && $datum['type']==Transaction::TYPE_DEPOSIT){
                    $datum['type']='融资收入';
                }
                else if($datum['meta']['type']=='finance_success' && $datum['type']==Transaction::TYPE_WITHDRAW){
                    $datum['type']='投资成功转出';
                }
                else if($datum['meta']['type']=='finance_fail'){
                    $datum['type']='投资失败退款';
                }

                else if($datum['meta']['type']=='finance_payback'  && $datum['type']==Transaction::TYPE_DEPOSIT){
                    $datum['type']='投资回款';
                }

                else if($datum['meta']['type']=='finance_payback'  && $datum['type']==Transaction::TYPE_WITHDRAW){
                    $datum['type']='融资支出';
                }
            }
            $datum['amount']=abs($datum['amount']);
            unset($datum['meta']);
            $info[]=$datum;
        }
        $titles = [
            '类型','变动金额','变动时间',
        ];
        return Table::make($titles, $info);
    }
}
