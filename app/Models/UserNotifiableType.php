<?php

namespace App\Models;

use App\Models\Traits\DefaultDatetimeFormat;
use Illuminate\Database\Eloquent\Model;

class UserNotifiableType extends Model
{
    use DefaultDatetimeFormat;
    protected $fillable=['notifiable_type','notification_logo','notification_count','description'];
    public function user(){
        return $this->belongsTo(User::class);
    }
    static $logoMap=['announce'=>'/static/logo.png','coupon'=>'/static/logo.png'];
}
