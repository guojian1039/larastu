<?php

namespace App\Models;

use Carbon\Carbon;
use App\Models\Traits\DefaultDatetimeFormat;
use Illuminate\Database\Eloquent\Model;

class SeckillProduct extends Model
{
    use DefaultDatetimeFormat;
    protected $fillable=['start_at','end_at'];
    public $timestamps=false;
    protected $dates=['start_at','end_at'];
    public function product()
    {
        return $this->belongsTo(Product::class);
    }
    // 定义一个名为 is_before_start 的访问器，当前时间早于秒杀开始时间时返回 true
    public function getIsBeforeStartAttribue()
    {
        return Carbon::now()->lt($this->start_at);
    }
    // 定义一个名为 is_after_end 的访问器，当前时间晚于秒杀结束时间时返回 true
    public function getIsAfterEndAttribute()
    {
        return Carbon::now()->gt($this->end_at);
    }
}
