<?php

namespace App\Admin\Renders;
use App\Models\NewsComment;
use Dcat\Admin\Support\LazyRenderable;
use Dcat\Admin\Widgets\Table;
class Comments extends LazyRenderable
{
    public function render()
    {
        // 获取ID
        $id = $this->key;
        // 获取其他自定义参数
        //$type = $this->post_type;
        $data = NewsComment::where('news_id', $id)
            //->where('type', $type)
            ->get(['content','created_at'])
            ->toArray();

        $titles = [
            '内容','评论时间',
        ];

        return Table::make($titles, $data);
    }
}
