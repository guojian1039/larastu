<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class OrderCount extends Model
{
    const ORDER_TYPE_PENDING='pending';
    const ORDER_TYPE_APPLIED = 'applied';
    const ORDER_TYPE_DELIVERED = 'delivered';
    const ORDER_TYPE_RECEIVED='received';
    const ORDER_TYPE_REFUND='refund';
    const ORDER_TYPE_CLOSE='close';
    public static $ordertypeMap = [
        self::ORDER_TYPE_PENDING   => '待付款',
        self::ORDER_TYPE_APPLIED => '待发货',
        self::ORDER_TYPE_DELIVERED => '待收货',
        self::ORDER_TYPE_RECEIVED  => '评价',//已收货
        self::ORDER_TYPE_REFUND  => '退款/售后',
        self::ORDER_TYPE_CLOSE=>'已关闭'
    ];
    protected $fillable=['order_type','order_count'];
    public function user(){
        return $this->belongsTo(User::class);
    }
}
