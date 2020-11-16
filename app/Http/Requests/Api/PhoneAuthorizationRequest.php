<?php

namespace App\Http\Requests\Api;
class PhoneAuthorizationRequest extends FormRequest
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
            'verification_code'=>'required|string',
            'verification_key'=>'required|string'
        ];
    }
}
