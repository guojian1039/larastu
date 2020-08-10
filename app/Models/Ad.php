<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;

class Ad extends Model
{
    protected $fillable=['name','image','url','width','height','content'];
    public function getImageUrlAttribute()
    {
        if(Str::startsWith($this->image,['http','https']))
        {
            return $this->image;
        }
        return image_url($this->image);
    }
}
