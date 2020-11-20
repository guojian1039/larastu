<?php

namespace App\Http\Requests\Api;
class ResetPasswordRequest extends FormRequest
{
    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'phone' => 'required|string',
            'code'=>'required|string',
            'verification_key'=>'required|string',
            'password'=>'required|string'
        ];
    }
}
