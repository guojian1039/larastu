<?php
namespace App\Services;
use App\Exceptions\InvalidRequestException;
use App\Models\Coupon;
use App\Models\CouponType;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;

class CouponService{
    //列表
    public function canReceiveCoupon($pager=0,$user_id=null){
        if(!$user_id && Auth::check()){
            $user_id=Auth::user()->id;
        }
        $build=CouponType::query()
            ->where('status',1)
            ->where('get_start_time','<=',Carbon::now())
            ->where('get_end_time','>=',Carbon::now())
            ->whereRaw('get_count<count');
        if($user_id){
            $build->whereDoesntHave('coupons',function ($query)use ($user_id){
                $query->where('user_id',$user_id);
            });
        }
        if($pager>0){
            $list=$build->paginate($pager);
        }else{
            $list=$build->get();
        }
        return $list;
    }
    //获取
    public function getCoupon($user_id,$get_type,CouponType $couponType){
        $coupons=$couponType->coupons;
        $filtered = collect($coupons)->where('user_id',$user_id);
        if(count($filtered)==0){
            $coupon=$coupons->where('user_id',0)->first();
            if($coupon){
                $data=['user_id'=>$user_id,'fetch_time'=>Carbon::now(),'state'=>1,'get_type'=>$get_type];
                if($couponType->term_of_validity_type==1){
                    $data['start_time']=Carbon::now();
                    $data['end_time']=Carbon::now()->addDays($couponType->fixed_term);
                }
                $rev= $coupon->where('id',$coupon->id)->where('state',0)->update($data);
                if($rev){
                    $couponType->where('id',$couponType->id)->whereRaw('get_count<count')->increment('get_count');
                }
                return $rev;
            }
        }
        else{
            return -1;
        }
        return 0;
    }

    //已领优惠券
    public function userCoupons($user_id, $state){

        $build=Coupon::query()->where('user_id',$user_id)->where('state',$state);
        $list=$build->with('couponType.product')->paginate(8);
        return $list;
    }

    public function userCouponCount($user_id){
        $count=Coupon::query()->where('user_id',$user_id)->where('state',1)->count();
        return $count;
    }
}