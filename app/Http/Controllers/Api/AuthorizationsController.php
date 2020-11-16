<?php

namespace App\Http\Controllers\Api;

use App\Exceptions\InvalidRequestException;
use App\Http\Controllers\Controller;
use App\Http\Requests\Api\AuthorizationRequest;
use App\Http\Requests\Api\PhoneAuthorizationRequest;
use App\Http\Requests\Api\SocialAuthorizationRequest;
use App\Http\Requests\Api\WeappAuthorizationRequest;
use App\Models\User;
//use Illuminate\Auth\AuthenticationException;
use Overtrue\EasySms\EasySms;
use Overtrue\LaravelSocialite\Socialite;
use Overtrue\Socialite\AccessToken;
class AuthorizationsController extends Controller
{
    public function store(AuthorizationRequest $request){

        $username=$request->username;
        filter_var($username,FILTER_VALIDATE_EMAIL)?$credentials['email']=$username:$credentials['phone']=$username;
           $credentials['password']=$request->password;
        if(!$token=\Auth::guard('api')->attempt($credentials)){
            throw new InvalidRequestException('用户名或密码错误',433);
        }
        return $this->responseWithToken($token)->setStatusCode(201);
    }
    public function phoneStore(PhoneAuthorizationRequest $request){
        $verifyData=\Cache::get($request->verification_key);
        if(!$verifyData){
            abort(403,'验证码失效');
        }
        //hash_equals 是可防止时序攻击的字符串比较，那么什么是时序攻击呢？比如这段代码我们使用
        if(!hash_equals((string)$verifyData['code'],$request->verification_code)){
            //返回401
            throw new InvalidRequestException('验证码错误',433);
        }
        $credentials['phone']=$request->phone;

        if(!$token=\Auth::guard('api')->attempt($credentials)){
            throw new InvalidRequestException('用户名不存在',433);
        }

        return $this->responseWithToken($token)->setStatusCode(201);
    }
    public function weappStore(WeappAuthorizationRequest $request)
    {
        $code = $request->code;
        // 根据 code 获取微信 openid 和 session_key
        $miniProgram = \EasyWeChat::miniProgram();
        $data = $miniProgram->auth->session($code);

        // 如果结果错误，说明 code 已过期或不正确，返回 401 错误
        if (isset($data['errcode'])) {
            throw new InvalidRequestException('code 不正确',433);
        }

        // 找到 openid 对应的用户
        $user = User::where('weapp_openid', $data['openid'])->first();

        $attributes['weixin_session_key'] = $data['session_key'];

        // 未找到对应用户则需要提交用户名密码进行用户绑定
        if (!$user) {
            // 如果未提交用户名密码，403 错误提示
            if (!$request->username) {
                throw new InvalidRequestException('用户不存在',433);
            }

            $username = $request->username;

            // 用户名可以是邮箱或电话
            filter_var($username, FILTER_VALIDATE_EMAIL) ?
                $credentials['email'] = $username :
                $credentials['phone'] = $username;

            $credentials['password'] = $request->password;

            // 验证用户名和密码是否正确
            if (!auth('api')->once($credentials)) {
                throw new InvalidRequestException('用户名或密码错误',433);
            }

            // 获取对应的用户
            $user = auth('api')->getUser();
            $attributes['weapp_openid'] = $data['openid'];
        }

        // 更新用户数据
        $user->update($attributes);

        // 为对应用户创建 JWT
        $token = auth('api')->login($user);

        return $this->responseWithToken($token)->setStatusCode(201);
    }
    public function socailStore($type,SocialAuthorizationRequest $request){
        $driver=Socialite::driver($type);
        try{
            if($code=$request->code){
                $accessToken=$driver->getAccessToken($code);
            }else{
                $tokenData['access_token']=$request->access_token;
                // 微信需要增加 openid
                if($type=='weixin'){
                    $tokenData['openid'] = $request->openid;
                }
                $accessToken = new AccessToken($tokenData);
            }
            $oauthUser = $driver->user($accessToken);
        } catch (\Exception $e){
            throw new InvalidRequestException('参数错误，为获取用户信息',433);
        }
        switch ($type){
            case 'weixin':
                $unionid = $oauthUser->getOriginal()['unionid'] ?? null;
                if($unionid){
                    $user=User::query()->where('weixin_unionid',$unionid)->first();
                }else{
                    $user=User::query()->where('weixin_openid',$oauthUser->getId())->first();
                }
                //没有用户，默认创建一个用户
                if(!$user){
                    $user=User::create(['name'=>$oauthUser->getNickname(),
                        'avatar'=>$oauthUser->getAvatar(),
                        'weixin_openid'=>$oauthUser->getId(),
                        'weixin_unionid'=>$unionid,
                        ]);
                }
                break;
        }
        $token=auth('api')->login($user);

        return $this->responseWithToken($token)->setStatusCode(201);
    }

    private function responseWithToken($token){
        return response()->json([
            'access_token'=>$token,
            'token_type'=>'Bearer',
            'expires_in'=>\Auth::guard('api')->factory()->getTTL()*60
        ]);
    }
    public function update(){

        $token=auth('api')->refresh();
        return $this->responseWithToken($token);
    }
    public function destroy(){
        auth('api')->logout();
        return response(null,204);

    }
}
