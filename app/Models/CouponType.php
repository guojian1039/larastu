<?php

namespace App\Models;

use App\Exceptions\CouponUnavailableException;
use App\Models\Traits\DefaultDatetimeFormat;
use Illuminate\Database\Eloquent\Model;

class CouponType extends Model
{
    use DefaultDatetimeFormat;
    protected $fillable=['title','value','count','get_count','type','max_fetch','at_least','need_user_level',
        'range_type','get_start_time','get_end_time','start_time','end_time','term_of_validity_type',
        'fixed_term','status'];
    protected $dates=[
        'get_start_time',
        'get_end_time',
        'start_time',
        'end_time'
    ];
    public function coupons()
    {
        return $this->hasMany(Coupon::class,'coupon_type_id');
    }
    public function product(){
        return $this->belongsToMany(Product::class,'coupon_products','coupon_type_id');
    }
    static $typeMap=[1=>'满减',2=>'折扣'];
    static $validity_typeMap=[0 => '固定时间', 1 => '领取N天内'];
    static $range_typeMap=[1 => '全场商品', 2 => '部分商品'];

    public function getAdjustedPrice($orderAmount)
    {
        // 固定金额
        if ($this->type ===1) {
            // 为了保证系统健壮性，我们需要订单金额最少为 0.01 元
            return max(0.01, $orderAmount - $this->value);
        }
        return number_format($orderAmount * ($this->value) / 100, 2, '.', '');
    }
    public function checkAvailable($orderAmount = null,$product_amount=[])
    {
        if ($this->range_type ===1) {
            if (!is_null($orderAmount) && $orderAmount < $this->at_least) {
                throw new CouponUnavailableException('订单金额不满足该优惠券最低金额');
            }
        }else if(count($product_amount)>0){
            $at_least=0;
            $product_Ids=array_column( CouponProduct::query()->where('coupon_type_id',$this->id)->get('product_id')->toArray(),'product_id');
            foreach ($product_Ids as $id){
                if($product_amount[$id]){
                    $at_least+=$product_amount[$id];
                }
            }
            if ($at_least < $this->at_least) {
                throw new CouponUnavailableException('相关订单产品金额不满足该优惠券最低金额');
            }
        }
    }
}
