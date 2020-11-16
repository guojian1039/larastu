<?php

namespace App\Models;

use App\Models\Traits\DefaultDatetimeFormat;
use Illuminate\Database\Eloquent\Model;

class Company extends Model
{
    use DefaultDatetimeFormat;
    protected $fillable=['name','image','idcard','corporation','phone','yyzz','khxkz','swdj','frsfz','description'];
    public function user(){
        return $this->belongsTo(User::class);
    }
}
