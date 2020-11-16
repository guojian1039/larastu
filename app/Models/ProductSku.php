<?php

namespace App\Models;

use App\Exceptions\InternalException;
use App\Models\Traits\DefaultDatetimeFormat;
use Illuminate\Database\Eloquent\Model;

class ProductSku extends Model
{
    use DefaultDatetimeFormat;
    protected $fillable=['title','description','image','price','original_price','cost_price','stock'];
    public function product()
    {
        return $this->belongsTo(Product::class);
    }
    protected static function booted()
    {
        parent::booted();
        static::creating(function ($sku){
            if(!$sku->original_price)
            {
                $sku->original_price=$sku->price;
            }
        });
    }
    public function decreaseStock($amount){
        if($amount<0){
            throw new InternalException('减库存不可小于零');
        }
        return $this->where('id',$this->id)->where('stock','>=',$amount)->decrement('stock',$amount);
    }

    public function addStock($amount){
        if($amount<0){
            throw new InternalException('加库存不可小于零');
        }
       return $this->increment('stock',$amount);
    }

    public function props(){
        return $this->hasMany(ProductSkuProperty::class);
    }

}
