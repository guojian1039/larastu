<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class BorrowInfo extends Model
{
    public $timestamps=false;
    protected $fillable=['risk','img'];
    public function borrow(){
        return $this->belongsTo(Borrow::class);
    }
    protected $casts=['risk'=>'json','img'=>'json'];
}
