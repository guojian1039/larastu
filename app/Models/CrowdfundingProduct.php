<?php

namespace App\Models;

use App\Models\Traits\DefaultDatetimeFormat;
use Illuminate\Database\Eloquent\Model;

class CrowdfundingProduct extends Model
{
    use DefaultDatetimeFormat;
    const STATUS_FUNDING='funding';
    const STATUS_SUCCESS='success';
    const STATUS_FAIL='fail';

    public static $statusMap = [
        self::STATUS_FUNDING => '众筹中',
        self::STATUS_SUCCESS => '众筹成功',
        self::STATUS_FAIL    => '众筹失败',
    ];
    protected $fillable=['target_amount','total_amount','user_count','status','end_at'];
    protected $dates=['end_at'];
    public $timestamps=false;
    public function product()
    {
        return $this->belongsTo(Product::class);
    }

    // 定义一个名为 percent 的访问器，返回当前众筹进度
    public function getPercentAttribute()
    {
        // 已筹金额除以目标金额
        $value = $this->attributes['total_amount'] / $this->attributes['target_amount'];

        return floatval(number_format($value * 100, 2, '.', ''));
    }
}
