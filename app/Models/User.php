<?php

namespace App\Models;

use App\Model\CartItem;
use Bavix\Wallet\Interfaces\Customer;
use Bavix\Wallet\Traits\CanPay;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Illuminate\Support\Facades\Auth;
use Tymon\JWTAuth\Contracts\JWTSubject;
use Bavix\Wallet\Traits\HasWalletFloat;
use Bavix\Wallet\Interfaces\WalletFloat;
use Bavix\Wallet\Interfaces\Wallet;
class User extends Authenticatable implements  MustVerifyEmail, JWTSubject,Customer
{
    //use HasWalletFloat;
    use CanPay;
    use \App\Models\Traits\DefaultDatetimeFormat;
    use Notifiable ;
    static $user_levelMap=[1 => '普通用户', 2 => '会员用户'];
    //
    public function userNotify($instance)
    {
        // 如果要通知的人是当前用户，就不必通知了！
        if ($this->id == Auth::id()) {
            return;
        }
        // 只有数据库类型通知才需提醒，直接发送 Email 或者其他的都 Pass
        if (method_exists($instance, 'toDatabase')) {
            $this->increment('notification_count');
        }
        $this->notify($instance);
    }
    public function commNotify($instance)
    {
        // 只有数据库类型通知才需提醒，直接发送 Email 或者其他的都 Pass
        if (method_exists($instance, 'toDatabase')) {
            $this->increment('notification_count');
        }
        $this->notify($instance);
    }

    public function notifiabletypes(){
        return $this->hasMany(UserNotifiableType::class);
    }
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password','username','phone','weixin_openid', 'weixin_unionid',
        'avatar','introduction','member_level','notification_count',
        'birthday','qq','gender','lock','scores','email_verified_at'
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
    public function footprints()
    {
        return $this->belongsToMany(Product::class,'user_footprints')->withTimestamps()
            ->orderBy('user_footprints.updated_at','desc');
    }
    public function ordercounts(){
        return $this->hasMany(OrderCount::class);
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
