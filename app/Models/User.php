<?php

namespace App\Models;

use App\Model\CartItem;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Tymon\JWTAuth\Contracts\JWTSubject;

class User extends Authenticatable implements  MustVerifyEmail, JWTSubject
{
    use Notifiable;
    use \App\Models\Traits\DefaultDatetimeFormat;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password','username','phone','weixin_openid', 'weixin_unionid','avatar','introduction'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token', 'weixin_openid', 'weixin_unionid'
    ];
    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];
    public function addresses()
    {
        return $this->hasMany(UserAddress::class);
    }
    public function favoriteProducts()
    {
        return $this->belongsToMany(Product::class,'user_favorite_products')->withTimestamps()
            ->orderBy('user_favorite_products.created_at','desc');
    }
    public function cartItems()
    {
        return $this->hasMany(CartItem::class);
    }
    public function orders(){
        return $this->hasMany(Order::class);
    }
    public function getJWTCustomClaims()
    {
        return [];
    }
    public function getJWTIdentifier()
    {
        return $this->getKey();
    }
}
