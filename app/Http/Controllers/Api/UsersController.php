<?php

namespace App\Http\Controllers\Api;
use App\Http\Requests\Api\UserRequest;
use App\Http\Resources\ProductResource;
use App\Http\Resources\UserResource;
use App\Models\Image;
use App\Models\User;
use App\Services\UserService;
use Illuminate\Auth\AuthenticationException;
use Illuminate\Http\Request;

class UsersController extends Controller
{
    //注册
    public function store(UserRequest $request){
        $verifyData=\Cache::get($request->verification_key);
        if(!$verifyData){
            abort(403,'验证码失效');
        }
        //hash_equals 是可防止时序攻击的字符串比较，那么什么是时序攻击呢？比如这段代码我们使用
        if(!hash_equals((string)$verifyData['code'],$request->verification_code)){
            //返回401
            throw new AuthenticationException('验证码错误');
        }
        $user=User::create([
            'name'=>$request->name,
            'phone'=>$verifyData['phone'],
            'password'=>$request->password,
        ]);
        //清除验证码缓存
        \Cache::delete($request->verification_key);
        return (new UserResource($user))->showSensitiveFields();
    }
    public function show(User $user){
        return new UserResource($user);
    }
    //个人信息
    public function me(Request $request){
        return (new UserResource($request->user()))->showSensitiveFields();
    }
    //修改个人资料
    public function update(UserRequest $request,UserService $service){
        $user=$request->user();

        $data=$request->only(['name','email','introduction']);

        $avatar_image_id=$request->input('avatar_image_id');

        $user= $service->update($user,$data,$avatar_image_id);

        return (new UserResource($user))->showSensitiveFields();
    }
    //个人收藏
    public function favorites(Request $request,UserService $service){
        $pageNum=$request->input('pageNo');
        if(!$pageNum){
            $pageNum=9;
        }
        $user=$request->user();
        $products=$service->userFavorites($user,$pageNum);
        return ProductResource::collection($products);
    }
}
