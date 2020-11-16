<?php

namespace App\Models;

use App\Models\Traits\DefaultDatetimeFormat;
use Illuminate\Database\Eloquent\Model;

class Announce extends Model
{
    use DefaultDatetimeFormat;
    protected $fillable=['title','content','cover','synopsis','sender_id','sender_name','status','view'];
}
