<?php

namespace App\Http\Controllers;
use App\Exceptions\CouponUnavailableException;
use App\Models\Coupon;
use App\Models\CouponType;
use App\Services\CouponService;
use Illuminate\Http\Request;

class CouponTypesController extends Controller
{
    protected $couponService;
    public function __construct(CouponService $couponService)
    {
        $this->couponService=$couponService;
    }
    //优惠券暂时先不考虑会员等级
    public function index(Request $request){
        $user_id=$request->user()->id;
        $coupontypes=$this->couponService->canReceiveCoupon(8,$user_id);
        return view('coupon_types.index',['coupontypes'=>$coupontypes]);
    }
    //领取
    public function getCoupon(Request $request,CouponType $couponType){
        $get_type=$request->input('get_type',0);
        $user_id=$request->user()->id;
        return $this->couponService->getCoupon($user_id,$get_type,$couponType);
    }
    //已领优惠券
    public function userCoupons(Request $request){
        $user_id=$request->user()->id;
        $state=$request->input('state',1);
        $list=$this->couponService->userCoupons($user_id,$state);
        return view('accounts.coupon',['list'=>$list]);
    }

    public function userCouponCount(Request $request){
        $user_id=$request->user()->id;
        $count=$this->couponService->userCouponCount($user_id);
        return $count;
    }
    public function checkCoupon($code){
        if (!$record = Coupon::where('code', $code)->first()) {
            throw new CouponUnavailableException('优惠券不存在');
        }

        $record->checkAvailable();

        return $record;
    }
}
