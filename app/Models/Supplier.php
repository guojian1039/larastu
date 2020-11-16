<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Supplier extends Model
{
    protected $fillable=['name','desc','linkman_tel','linkman_name','linkman_address','status'];
    protected $casts=['status'=>'boolean'];
}
