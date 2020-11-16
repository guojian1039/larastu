<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;

class Brand extends Model
{
    protected $fillable=['name','image','url'];
    public function getImageUrlAttribute()
    {
        if(Str::startsWith($this->image,['http','https']))
        {
            return $this->image;
        }
        return image_url($this->image);
    }
    public function categories(){
        return $this->belongsToMany(Category::class,'brand_categories');
    }
}
