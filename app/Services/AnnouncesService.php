<?php
namespace App\Services;
use App\Models\Announce;

class AnnouncesService{
    public function getList($limit=null,$order='id_desc')
    {
        // 创建一个查询构造器
        $builder =Announce::query()->where('status',1);
        // 是否有提交 order 参数，如果有就赋值给 $order 变量
        // order 参数用来控制商品的排序规则
        if ($order) {
            // 是否是以 _asc 或者 _desc 结尾
            if (preg_match('/^(.+)_(asc|desc)$/', $order, $m)) {
                // 如果字符串的开头是这 3 个字符串之一，说明是一个合法的排序值
                if (in_array($m[1], ['id'])) {
                    // 根据传入的排序值来构造排序参数
                    $builder->orderBy($m[1], $m[2]);
                }
            }
        }

        if(!$limit && is_numeric($limit)){
            $list= $builder->limit($limit)->get();
        }
        else{
            $list= $builder->paginate(12);
        }
        return $list;
    }
}