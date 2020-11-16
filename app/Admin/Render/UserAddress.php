<?php

namespace App\Admin\Renders;
use Dcat\Admin\Support\LazyRenderable;
use Dcat\Admin\Widgets\Table;
use App\Models\UserAddress as UserAddressModel;

class UserAddress extends LazyRenderable
{
    public function render()
    {
        // 获取ID
        $id = $this->key;

        // 获取其他自定义参数
        $type = $this->post_type;

        $data = UserAddressModel::where('user_id', $id)
            //->where('type', $type)
            ->get(['province','city','district','zip','contact_name','contact_phone'])
            ->toArray();

        $titles = [
            '省份','城市','区域','邮编','联系人','联系电话',
        ];

        return Table::make($titles, $data);
    }
}
