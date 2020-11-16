<?php

namespace App\Models;

use App\Models\Traits\DefaultDatetimeFormat;
use Illuminate\Database\Eloquent\Model;

class News extends Model
{
    use DefaultDatetimeFormat;
    protected $fillable=['title','image','sender_id','sender_name','body','excerpt','slug'];
    public function newsCategory(){
        return $this->belongsTo(NewsCategory::class);
    }
    public function comments(){
        return $this->hasMany(NewsComment::class);
    }
}
