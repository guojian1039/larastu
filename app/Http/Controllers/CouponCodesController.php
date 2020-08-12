<?php

namespace App\Http\Controllers;

use App\Models\CouponCode;
use Carbon\Carbon;
use Illuminate\Http\Request;

class CouponCodesController extends Controller
{
    public function show($code)
    {
        if (!$record = CouponCode::where('code', $code)->first()) {
            throw new CouponCodeUnavailableException('优惠券不存在');
        }

        $record->checkAvailable();

        return $record;
    }
    public function index(Request $request){
        $couponcodes=CouponCode::query()
            ->where('enabled',true)
            ->whereRaw(' total>used ')
            ->where('not_after','>=',Carbon::now())->get();
        return view('coupon_codes.index',['couponcodes'=>$couponcodes]);
    }
}
