<?php

namespace App\Http\Requests;
class UserAddressRequest extends Request
{

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'province'=>'required',
            'city'=>'required',
            'district'=>'required',
            'zip'=>'required',
            'address'=>'required',
            'contact_name'=>'required',
            'contact_phone'=>'required'
        ];
    }
    public function attributes()
    {
        return [
            'province'=>'省份',
            'city'=>'城市',
            'district'=>'区域',
            'zip'=>'邮编',
            'address'=>'地址',
            'contact_name'=>'联系人',
            'contact_phone'=>'电话'
        ];
    }
}
