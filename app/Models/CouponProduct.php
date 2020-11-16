<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class CouponProduct extends Model
{
    protected $fillable=['coupon_type_id','product_id'];
    public $timestamps=false;
    public function product(){
        return $this->belongsTo(Product::class);
    }
}
