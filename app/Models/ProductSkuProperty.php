<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProductSkuProperty extends Model
{
    protected $fillable=['title','prop_value'];
    public $timestamps=false;
    public function productSku(){
        return $this->belongsTo(ProductSku::class);
    }
    public function basePropertyItem(){
        return $this->belongsTo(BasePropertyItem::class);
    }
    public function baseProperty(){
        return $this->belongsTo(BaseProperty::class);
    }
}
