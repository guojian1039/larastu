<?php

namespace App\Admin\Renders;
use Dcat\Admin\Support\LazyRenderable;
use Dcat\Admin\Widgets\Table;
use App\Models\BorrowInvest as BorrowInvestModel;
use Illuminate\Support\Facades\Log;

class BorrowInvest extends LazyRenderable
{
    public function render()
    {
        // 获取ID
        $id = $this->key;
        $list = BorrowInvestModel::with('user')->where('borrow_id', $id)
            ->get(['user_id','invest_sum','status','created_at'])
            ->toArray();
        $data=[];
        foreach ($list as $datum){
            $item['name']=$datum['user']['name'];
            $item['invest_sum']=$datum['invest_sum'];
            $item['status']=BorrowInvestModel::$statusMap[$datum['status']];
            $item['created_at']=$datum['created_at'];
            $data[]=$item;
        }
        $titles = [
            '投资人','投资金额','状态','投资时间',
        ];

        return Table::make($titles, $data);
    }
}
