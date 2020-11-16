<?php

namespace App\Models;

use App\Models\Traits\DefaultDatetimeFormat;
use Illuminate\Database\Eloquent\Model;

class Adv extends Model
{
    const TYPE_PC = 'pc';

    const TYPE_APP_INDEX_TOP = 'app_index_top';
    const TYPE_APP_INDEX_NEW = 'app_index_new';
    const TYPE_APP_INDEX_RECOMMEND = 'app_index_recommend';
    const TYPE_APP_INDEX_HOT = 'app_index_hot';

    public static $typeMap = [
        self::TYPE_PC => 'PC端广告',
        self::TYPE_APP_INDEX_TOP => 'APP轮播',
        self::TYPE_APP_INDEX_NEW=>'APP首页新品',
        self::TYPE_APP_INDEX_RECOMMEND=>'APP首页推荐',
        self::TYPE_APP_INDEX_HOT=>'APP首页热门',
    ];
    public static $jumpType=[
        'product_view'=>'产品详情',
        'mini_program_live_view'=>'小程序直播详情',
        'notify_announce_view'=>'公告详情',
        'helper_view'=>'站点帮助详情',
        'coupon_view'=>'优惠券详情',
        'product_list_for_cate'=>'某分类下产品列表',
    ];
    use DefaultDatetimeFormat;
    protected $fillable= [
            'title',
            'is_title_show',
            'cover',
            'location',
            'view',
            'silder_text',
            'start_time',
            'end_time',
            'jump_link',
            'jump_type',
            'sort',
            'status',
        ];
    public function getImageUrlAttribute()
    {
        if(Str::startsWith($this->cover,['http','https']))
        {
            return $this->cover;
        }
        return image_url($this->cover);
    }

}
