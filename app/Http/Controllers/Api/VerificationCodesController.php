<?php

namespace App\Http\Controllers\Api;
use App\Exceptions\InvalidRequestException;
use App\Http\Requests\Api\VerificationCodeRequest;
use Illuminate\Support\Str;
use Overtrue\EasySms\EasySms;

class VerificationCodesController extends Controller
{
    public function store(VerificationCodeRequest $request,EasySms $easySms){

        $phone=$request->phone;
        //生成4随机数，左侧补零
        $code=str_pad(random_int(1,9999),4,0,STR_PAD_LEFT);
        $captcha_key=$request->captcha_key;
        $usage=$request->usage;
        $captData=\Cache::get($captcha_key);

        if(!$captData){
            abort(403,'图片验证码已失效');
        }
        $captcha_code=$request->captcha_code;
        if(!hash_equals($captData['code'],(string)$captcha_code)){
            \Cache::delete($captcha_key);
            throw new InvalidRequestException('验证码错误',433);
        }
        if(app()->environment('production')){
            try{
                $request=$easySms->send($phone,[
                    'template'=>config('easysms.gateways.aliyun.templates.'.$usage),
                    'data'=>[
                        'code'=>$code
                    ],]);
            }catch (\Overtrue\EasySms\Exceptions\NoGatewayAvailableException $exception){
                $message=$exception->getException('aliyun')->getMessage();
                abort(500, $message ?: '短信发送异常');
            }
        }else{
            $code=1234;
        }
        $key='verificationCode_'.Str::random(15);
        $expiredAt=now()->addMinutes(5);
        //缓存验证码5分钟过期。
        \Cache::put($key,['phone'=>$phone,'code'=>$code],$expiredAt);
        //清除图片验证码缓存
        \Cache::delete($captcha_key);
        return response()->json(['key'=>$key,'expired_at'=>$expiredAt->toDateTimeString()])->setStatusCode(201);
    }
}
