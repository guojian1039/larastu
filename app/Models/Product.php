<?php

namespace App\Models;

use App\Services\CouponService;
use App\Services\ProductService;
use App\Models\Traits\DefaultDatetimeFormat;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

class Product extends Model
{
      use DefaultDatetimeFormat;
      const  TYPE_NORMAL='normal';
      const TYPE_CROWDFUNDING='crowdfunding';
      const TYPE_SECKILL='seckill';
      const TYPE_DISCOUNT='discount';
      const TYPE_ACTIVE='active';
      public static $typeMap=[
          self::TYPE_NORMAL=>'普通商品',
          self::TYPE_CROWDFUNDING=>'众筹商品',
          self::TYPE_SECKILL=>'秒杀商品',
          self::TYPE_DISCOUNT=>'折扣商品',
          self::TYPE_ACTIVE=>'活动商品'
      ];
      protected $fillable=['title','description','image','on_sale','rating','sold_count','review_count','sku_id','price','discount_num','original_price','type','unit'];
      protected $casts=['on_sale'=>'boolean'];

      //public $timestamps=false;
      public function skus()
      {
          return $this->hasMany(ProductSku::class);
      }
      public function pics()
      {
          return $this->hasMany(ProductPic::class);
      }
      public function getImageUrlAttribute()
      {
          if(Str::startsWith($this->image,['http','https']))
          {
              return $this->image;
          }
          return image_url($this->image);
      }
      public function category()
      {
          return $this->belongsTo(Category::class);
      }
      public function crowdfunding()
      {
          return $this->hasOne(CrowdfundingProduct::class);
      }
      public function seckill()
      {
          return $this->hasOne(SeckillProduct::class);
      }
      public function active()
      {
          return $this->hasOne(ActiveProduct::class);
      }

      //是否收藏
      public function getIsFavoriteAttribute(){
          $favored=false;
          $favorite_Ids= app(ProductService::class)->getFavoriteIds();
          if(in_array($this->id,$favorite_Ids)){
              $favored=true;
          }
          return $favored;
      }
      //商品评论--废弃
      public function getReviewsAttribute()
      {
          return $this->id;
      }

      //优惠券领取
    public function getCouponsAttribute(){
       $list= app(CouponService::class)->canReceiveCoupon();
       return $list;
    }
    public static function boot()
    {
        parent::boot();
        static ::created(function (Product $product){
            $product->pics()->create(['image'=>$product['image'],'description'=>'封面']);
         });
    }
    public function props(){
        return $this->hasMany(ProductProperty::class);
    }
    public function brand(){
        return $this->belongsTo(Brand::class);
    }
    public function supplier(){
        return $this->belongsTo(Supplier::class);
    }
    public function evaluation(){
        return $this->hasOne(ProductEvaluation::class);
    }
}
