<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProductProperty extends Model
{
    protected $fillable=['title','prop_value'];
    public $timestamps=false;
    public function product(){
        return $this->belongsTo(Product::class);
    }
    public function basePropertyItem(){
        return $this->belongsTo(BasePropertyItem::class);
    }
    public function baseProperty(){
        return $this->belongsTo(BaseProperty::class);
    }
}
