<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class UserAddress extends Model
{
    use \App\Models\Traits\DefaultDatetimeFormat;
    protected $fillable=['province','city','district','zip','address','contact_name','contact_phone'];
    protected $dates=['last_used_at'];
    protected $appends=['full_address'];
    public function user()
    {
        return $this->belongsTo(User::class);
    }
    public function getFullAddressAttribute()
    {
        return "{$this->province}{$this->city}{$this->district}{$this->address}";
    }
}
