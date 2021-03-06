<?php

namespace App\Http\Requests\Api;


class UserRequest extends FormRequest
{
    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        switch ($this->method())
        {
            case 'POST':
                return [
                    'username' => 'required|between:3,25|regex:/^[A-Za-z0-9\-\_]+$/|unique:users,username',
                    'password'=>'required|alpha_dash|min:6',
                    'verification_key'=>'required|string',
                    'code'=>'required|string',
                ];
                break;
            case 'PUT':
                $userId = auth('api')->id();
                return [
                    'username' => 'between:3,25|regex:/^[A-Za-z0-9\-\_]+$/|unique:users,username,'.$userId,
                    //'avatar_image_id'=>'exists:images,id,type,avatar,user_id,'.$userId,
                    'introduction'=>'max:80',
                    'email'=>'email|unique:users,email,'.$userId
                ];
                break;
        }

    }
    public function attributes()
    {
        return ['verification_key'=>'短信验证码 key','verification_code'=>'短信验证码'];
    }
    public function messages()
    {
        return [
            'name.unique' => '用户名已被占用，请重新填写',
            'name.regex' => '用户名只支持英文、数字、横杆和下划线。',
            'name.between' => '用户名必须介于 3 - 25 个字符之间。',
            'name.required' => '用户名不能为空。',
        ];
    }
}
