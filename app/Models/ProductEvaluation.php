<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProductEvaluation extends Model
{
    protected $fillable=['good_num','ordinary_num','negative_num','cover_num'];
    public $timestamps=false;
    public function product(){
        return $this->belongsTo(Product::class);
    }
}
