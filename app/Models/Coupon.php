<?php

namespace App\Models;

use App\Exceptions\CouponUnavailableException;
use App\Models\Traits\DefaultDatetimeFormat;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;

class Coupon extends Model
{
    use DefaultDatetimeFormat;
    protected $fillable=['coupon_type_id','code','user_id','use_order_id','create_order_id','get_type','fetch_time',
        'use_time','start_time','end_time','status','state'];

    public function couponType(){
        return $this->belongsTo(CouponType::class);
    }
    protected $dates=['fetch_time','use_time','start_time','end_time'];
    public static function findAvailableCode($length = 16)
    {
        /*
        do {
            // 生成一个指定长度的随机字符串，并转成大写
            $code = strtoupper(Str::random($length));
            // 如果生成的码已存在就继续循环
        } while (self::query()->where('code', $code)->exists());

        */
        $code = strtoupper(Str::random($length));
        return $code;
    }
    static $get_typeMap=[0=>'未领取',1=>'订单',2=>'首页领取'];

    public function checkAvailable($orderAmount = null)
    {
        if ($this->use_order_id) {
            throw new CouponUnavailableException('该优惠券已被兑完');
        }
        if ($this->state!=1) {
            throw new CouponUnavailableException('优惠券已过期');
        }

        if ($this->start_time && $this->start_time->gt(Carbon::now())) {
            throw new CouponUnavailableException('该优惠券现在还不能使用');
        }

        if ($this->end_time && $this->end_time->lt(Carbon::now())) {
            throw new CouponUnavailableException('该优惠券已过期');
        }
    }
    protected $appends = ['description'];

    public function getDescriptionAttribute()
    {
        $str = '';

        if ($this->couponType['at_least'] > 0) {
            $str = '满'.str_replace('.00', '', $this->couponType['at_least']);
        }
        if ($this->couponType['type'] === 2) {
            return $str.'优惠'.str_replace('.00', '', $this->couponType['value']).'%';
        }

        return $str.'减'.str_replace('.00', '', $this->couponType['value']);
    }
}
