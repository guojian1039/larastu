<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SitehelpType extends Model
{
    protected $fillable=['title','cover'];
    public function sitehelps(){
        return $this->hasMany(Sitehelp::class,'sitehelp_type_id');
    }
    public $timestamps=false;
}
