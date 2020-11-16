<?php

namespace App\Admin\Renders;
use Dcat\Admin\Support\LazyRenderable;
use Dcat\Admin\Widgets\Table;
use App\Models\UserInvoice as UserInvoiceModel;

class UserInvoice extends LazyRenderable
{
    public function render()
    {
        // 获取ID
        $id = $this->key;
        // 获取其他自定义参数
        //$type = $this->post_type;
        $data = UserInvoiceModel::where('user_id', $id)
            //->where('type', $type)
            ->get(['title','duty_paragraph','content','type','is_default'])
            ->toArray();

        $titles = [
            '公司抬头','税号','内容','类型','是否默认',
        ];

        return Table::make($titles, $data);
    }
}
