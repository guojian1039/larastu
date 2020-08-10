<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProductPic extends Model
{
    protected $fillable=['image','description'];
    public function product()
    {
        return $this->belongsTo(Product::class);
    }
    public $timestamps=false;
}
