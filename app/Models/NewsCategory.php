<?php

namespace App\Models;

use App\Models\Traits\DefaultDatetimeFormat;
use Illuminate\Database\Eloquent\Model;

class NewsCategory extends Model
{
    use DefaultDatetimeFormat;
    protected $fillable=['name','description'];
    public function news(){
        return $this->hasMany(News::class,'news_category_id');
    }
}
