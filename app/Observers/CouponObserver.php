<?php

namespace App\Observers;
use App\Models\CouponType;
use App\Models\User;
use App\Models\UserNotifiableType;
use App\Notifications\CouponNotification;

class CouponObserver
{
    /**
     * 处理 Announce 「created」事件
     */
    public function created(CouponType $couponType)
    {
        $users = User::all();
        foreach ($users as $user) {
           $notifyType= $user->notifiabletypes()
                ->where('notifiable_type','App\Notifications\CouponNotification')
                ->where('user_id',$user->id)
                ->first();
           if(!$notifyType){
               $notifyType= $user->notifiabletypes()->create([
                   'notifiable_type'=>'App\Notifications\CouponNotification',
                   'notification_logo'=>UserNotifiableType::$logoMap['coupon'],
                   'notification_count'=>1,
                   'description'=>$couponType->title.'获取时间：'.$couponType->get_start_time.'至'.$couponType->get_end_time
                   ]);
           }else{
               $notifyType->update([
                   'notification_count'=>$notifyType->notification_count+1,
                   'description'=>$couponType->title.'获取时间：'.$couponType->get_start_time.'至'.$couponType->get_end_time]);
           }
            $user->commNotify(new CouponNotification($couponType)); // 发送通知
        }
    }
}
