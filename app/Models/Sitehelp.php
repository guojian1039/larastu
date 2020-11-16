<?php

namespace App\Models;

use App\Models\Traits\DefaultDatetimeFormat;
use Illuminate\Database\Eloquent\Model;

class Sitehelp extends Model
{
    use DefaultDatetimeFormat;
    protected $fillable=['title','content','synopsis','view','sender_id','sender_name'];

    public function sitehelpType(){
        return $this->belongsTo(SitehelpType::class,'sitehelp_type_id');
    }
}
