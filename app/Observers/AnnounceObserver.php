<?php

namespace App\Observers;
use App\Models\Announce;
use App\Models\User;
use App\Models\UserNotifiableType;
use App\Notifications\WebAnnounceNotification;

class AnnounceObserver
{
    /**
     * 处理 Announce 「created」事件
     */
    public function created(Announce $announce)
    {
        $users = User::all();
        foreach ($users as $user) {
           $notifyType= $user->notifiabletypes()
                ->where('notifiable_type','App\Notifications\WebAnnounceNotification')
                ->where('user_id',$user->id)
                ->first();
           if(!$notifyType){
               $notifyType= $user->notifiabletypes()->create([
                   'notifiable_type'=>'App\Notifications\WebAnnounceNotification',
                   'notification_logo'=>UserNotifiableType::$logoMap['announce'],
                   'notification_count'=>1,
                   'description'=>$announce->title
                   ]);
           }else{
               $notifyType->update([
                   'notification_count'=>$notifyType->notification_count+1,
                   'description'=>$announce->title]);
           }
            $user->commNotify(new WebAnnounceNotification($announce)); // 发送通知
        }
    }
}
