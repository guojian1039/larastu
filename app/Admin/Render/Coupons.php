<?php

namespace App\Admin\Renders;
use App\Models\Coupon;
use Carbon\Carbon;
use Dcat\Admin\Support\LazyRenderable;
use Dcat\Admin\Widgets\Table;
use Illuminate\Support\Facades\Log;

class Coupons extends LazyRenderable
{
    public function render()
    {
        // 获取ID
        $id = $this->key;
        // 获取其他自定义参数
        //$type = $this->post_type;
        $data=Coupon::query()
            //->where('payable_type', $wallet->holder_type)
            ->where('coupon_type_id', $id)
            ->limit(20)
            ->get()->toArray();

        $info=[];
        foreach ($data as $datum){
            $datum['get_type']=Coupon::$get_typeMap[$datum['get_type']];
            $status='未领取';
            if($datum['user_id']){
                $status='已领取';
                if($datum['use_order_id']){
                    $status='已使用';
                }else{
                    if($datum['end_time']>Carbon::now()){
                        $status='未使用';
                    }else{
                        $status='已过期';
                    }
                }
            }
            $datum['status']=$status;

            $info[]=['code'=>$datum['code'],
                'user_id'=>$datum['user_id']?$datum['user_id']:'未领用',
                'get_type'=>$datum['get_type'],
                'fetch_time'=>$datum['fetch_time'],
                'use_time'=>$datum['use_time'],
                'enable_time'=>$datum['start_time'].'<br/>'.$datum['end_time'],
                'status'=>$datum['status']
                ];
        }
        $titles = [
            '码','使用人','获取方式','获取时间','使用时间','有效时间','使用情况',
        ];
        return Table::make($titles, $info);
    }
}
