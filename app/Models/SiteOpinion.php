<?php

namespace App\Models;

use App\Models\Traits\DefaultDatetimeFormat;
use Illuminate\Database\Eloquent\Model;

class SiteOpinion extends Model
{
    use DefaultDatetimeFormat;
    protected $fillable=['content','covers','contact_way','reply','type','from','user_id'];
    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
