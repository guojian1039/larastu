<?php

namespace App\Models;

use App\Models\Traits\DefaultDatetimeFormat;
use Illuminate\Database\Eloquent\Model;

class OrderItem extends Model
{
    use DefaultDatetimeFormat;
    protected $fillable = ['amount', 'price', 'rating','review_images', 'review', 'reviewed_at','is_anonymous'];
    protected $dates = ['reviewed_at'];
    public $timestamps = false;

    protected $casts=['review_images'=>'json'];

    public function product()
    {
        return $this->belongsTo(Product::class);
    }

    public function productSku()
    {
        return $this->belongsTo(ProductSku::class);
    }

    public function order()
    {
        return $this->belongsTo(Order::class);
    }
}
