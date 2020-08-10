<?php

namespace App\Model;

use App\Models\ProductSku;
use App\Models\User;
use Illuminate\Database\Eloquent\Model;

class CartItem extends Model
{
    protected $fillable=['amount'];
    public $timestamps=false;
    public function productSku(){
        return $this->belongsTo(ProductSku::class);
    }
    public function user(){
        return $this->belongsTo(User::class);
    }
}
