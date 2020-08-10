<?php

namespace App\Models;
use App\Models\Traits\DefaultDatetimeFormat;
use Illuminate\Database\Eloquent\Model;

class UserAddress extends Model
{
	use DefaultDatetimeFormat;
    protected $table = 'user_addresses';
    
}
