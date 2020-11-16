<?php

namespace App\Admin\Renders;
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
            ->get(['type','amount','created_at'])->toArray();

        $info=[];
        foreach ($data as $datum){
            $datum['type']=Transaction::$typeMap[$datum['type']];
            $datum['amount']=abs($datum['amount']);
            $info[]=$datum;
        }
        $titles = [
            '类型','变动金额','变动时间',
        ];
        return Table::make($titles, $info);
    }
}
