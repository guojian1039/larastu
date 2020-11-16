<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class BasePropertyItem extends Model
{
    protected $fillable=['relvalue','status'];
    public function baseProperty(){
        return $this->belongsTo(BaseProperty::class);
    }
    public $timestamps=false;
}
