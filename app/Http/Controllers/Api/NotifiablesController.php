<?php

namespace App\Http\Controllers\Api;

use App\Models\Adv;
use App\Models\Category;
use App\Models\UserNotifiableType;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class NotifiablesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $list =$request->user()->notifiabletypes;
        return $list;
    }
    public function getNotifyList(Request $request){
        //$user->unreadNotifications->markAsRead();
        $type=$request->input('notifiable_type');
        $notification_count=$request->input('notification_count',0);
        $user=$request->user();
        if($notification_count){
            $user->unreadNotifications()->where('type',$type)->update(['read_at' => Carbon::now()]);
            $user->notifiabletypes()->where('notifiable_type',$type)->update(['notification_count'=>0]);
            Log::info(time());
        }
        $list=$user->notifications()->where('type',$type)->orderBy('created_at','desc')->get();
        return $list;
    }
    public function notificationStats(Request $request){
        $user=$request->user();
        $count=collect($user->notifiabletypes)->sum(notification_count);
        return $count;
    }
    public function destroy(Request $request){
        $id=$request->input('id');
        $type=$request->input('type');
        $user=$request->user();
        $first=true;
        if($id){
            //$item=$user->notifications()->where('id',$id)->find();
            $list=$user->notifications()->where('type',$type)->orderBy('created_at','desc')->get();
            if(count($list)>1){
                foreach ($list as $item){
                    if($item->id==$id && $first){
                        $item->delete();
                    }else if(!$first){
                        if($item->type=='App\Notifications\ProductOnsale'){
                            $user->notifiabletypes()->where('notifiable_type',$item->type)
                                ->update(['description'=>$item->data['title'].'发布，价格'.$item->data['price'],'created_at'=>$item->created_at]);
                            break;
                        }
                    }
                    $first=false;
                }
            }else{
                $list[0]->delete();
                $user->notifiabletypes()->where('notifiable_type',$type)->delete();
            }
        }
        return [];
    }
}
