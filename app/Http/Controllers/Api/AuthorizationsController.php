<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\AuthorizationRequest;
use App\Http\Requests\Api\SocialAuthorizationRequest;
use App\Models\User;
use Illuminate\Auth\AuthenticationException;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;

class AuthorizationsController extends Controller
{
    public function store(AuthorizationRequest $request){

        $username=$request->username;
        filter_var($username,FILTER_VALIDATE_EMAIL)?$credentials['email']=$username:$credentials['phone']=$username;
           $credentials['password']=$request->password;
        if(!$token=\Auth::guard('api')->attempt($credentials)){
            throw new AuthenticationException('用户名或密码错误');
        }
        return $this->responseWithToken($token)->setStatusCode(201);

    }
    public function socailStore($type,SocialAuthorizationRequest $request){

        $driver=\Socialite::driver($type);
        try{
            if($code=$request->code){
                $response=$driver->getAccessTokenResponse($code);
                $token=Arr::get($response,'access_token');
            }else{
                $token=$request->access_token;
                if($type=='weixin'){
                    $driver->setOpenId($request->openid);
                }
            }
            $oauthUser=$driver->userFromToken($token);
        } catch (\Exception $e){
            throw new AuthenticationException('参数错误，为获取用户信息');
        }
        switch ($type){
            case 'weixin':
                $unionid=$oauthUser->offsetExists('unionid')?$oauthUser->offsetGet('unionid'):null;
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
