<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

class BaseProperty extends Model
{
    protected $fillable=['title','status'];
    public function items(){
        return $this->hasMany(BasePropertyItem::class);
    }
    public $timestamps=false;
    public function category(){
        return $this->belongsTo(Category::class);
    }
    public function productProperty(){
        return $this->hasMany(ProductProperty::class);
    }
    public function productSkuProperty(){
        return $this->hasMany(ProductSkuProperty::class);
    }
}
