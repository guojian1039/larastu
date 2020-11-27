<?php

namespace App\Http\Controllers\Api;
use App\Exceptions\InvalidRequestException;
use App\Http\Requests\Api\UserRequest;
use App\Http\Resources\ProductResource;
use App\Http\Resources\TransactionResource;
use App\Http\Resources\UserResource;
use App\Models\Order;
use App\Models\Transaction;
use App\Models\User;
use App\Services\AccountService;
use App\Services\InvestService;
use App\Services\ProductService;
use App\Services\UserService;
use Carbon\Carbon;
use Illuminate\Auth\AuthenticationException;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class UsersController extends Controller
{
    //注册
    public function store(UserRequest $request){
        $verifyData=\Cache::get($request->verification_key);
        if(!$verifyData){
            abort(403,'验证码失效');
        }
        //hash_equals 是可防止时序攻击的字符串比较，那么什么是时序攻击呢？比如这段代码我们使用
        if(!hash_equals((string)$verifyData['code'],$request->code)){
            //返回401
            //throw new AuthenticationException('验证码错误');
            throw new InvalidRequestException('验证码错误');
        }
        //清除验证码缓存
        \Cache::delete($request->verification_key);
       $build= User::query()->where('phone',$request->mobile);
        if($request->username){
            $build->orWhere('username',$request->username);
        }
        $user=$build->first();
        if(!$user){
            $user=User::create([
                'name'=>$request->username,
                'username'=>$request->username,
                'phone'=>$request->mobile,
                'password'=>Hash::make($request->password),
                'email_verified_at'=>Carbon::now()
            ]);
            if($user){
                $user->deposit(10000,['type'=>'deposit']);
            }
        }else{
            throw new InvalidRequestException('用户已经存在');
        }

        return (new UserResource($user))->showSensitiveFields();
    }
    public function show(User $user){
        return new UserResource($user);
    }
    //个人信息
    public function me(Request $request,UserService $service){
        $user=$request->user();
        $include=$request->input('include');
        $userinfo=$service->getInfo($user,$include);
        return (new UserResource($userinfo))->showSensitiveFields();
    }
    //修改个人资料
    public function update(UserRequest $request,UserService $service){
        $user=$request->user();

        $data=$request->only(['name','email','introduction','username','birthday','avatar','gender','qq']);

        $avatar_image_id=$request->input('avatar_image_id');

        $user= $service->update($user,$data,$avatar_image_id);

        return (new UserResource($user))->showSensitiveFields();
    }
    //个人收藏列表
    public function favorites(Request $request,UserService $service){
        $limit=$request->input('limit');
        $user=$request->user();
        $products=$service->userFavorites($user,$limit);
        return ProductResource::collection($products);
    }
    //个人足迹列表
    public function footprints(Request $request,UserService $service){
        $limit=$request->input('limit');
        $user=$request->user();
        $products=$service->userFootprints($user,$limit);
        return ProductResource::collection($products);
    }
    public function getGuessYouLike(Request $request,ProductService $productService){
        $footprints=$request->user()->footprints;
        $category=null;
        if(count($footprints)>0){
            $category=collect($footprints)->pluck('category_id')->all();
        }
        $products=$productService->getGuessYouLike($category);
        return ProductResource::collection($products);
    }

    //获取open_id
    public function getOpenid(Request $request){
        $oauth_client=$request->input('oauth_client');
        switch ($oauth_client){
            case 'wechat':
                return response(['openid'=>$request->user()->weixin_openid]);
                break;
            case 'wechatMp':
                return response(['openid'=>$request->user()->weapp_openid]);
                break;
        }
    }
    //账户信息
    public function account(Request $request){
        $user=$request->user();

        $show_type=$request->input('show_type',1);
        //累计充值
        /*
        $accumulate_money=Transaction::query()->where('payable_id',$user->id)->where('payable_type',Transaction::TYPE_USERPAYABLE)
            ->where('type',Transaction::TYPE_DEPOSIT)->whereNotExists(function ($query){
                $query->select(\DB::raw(1))->from('transfers')->whereRaw('transactions.id=transfers.deposit_id');
            })->sum('amount');
        */
        if($show_type==1){
            //账户余额
            $data['account']['user_money']=$user->balance/10000;
            //累计充值
            $accumulate_money=Transaction::query()->where('payable_id',$user->id)->where('payable_type',Transaction::TYPE_USERPAYABLE)
                ->where('type',Transaction::TYPE_DEPOSIT)->whereJsonContains('meta->type',Transaction::TYPE_DEPOSIT)->sum('amount');
            $data['account']['accumulate_money']=$accumulate_money/10000;
            //累计消费
            $consume_money=Transaction::query()->where('payable_id',$user->id)->where('payable_type',Transaction::TYPE_USERPAYABLE)
                ->where('type',Transaction::TYPE_WITHDRAW)->whereJsonContains('meta->type',Order::REFUND_STATUS_PENDING)
                ->sum('amount');
            $data['account']['consume_money']=abs($consume_money)/10000;
            //累计投资
            $invest_list=app(InvestService::class)->getList(['user_id'=>$user->id]);
            $invest_sum=collect($invest_list)->sum('invest_sum');
            $data['account']['invest_sum']=$invest_sum/10000;
        }else if($show_type==2){
            $data['account']['user_money']=$user->balance;
        }
        return $data;
    }
    //充值记录--废弃
    public function deposits(Request $request){
        $user=$request->user();
        /*
        $deposit_list=Transaction::query()->where('payable_id',$user->id)->where('payable_type',Transaction::TYPE_USERPAYABLE)
            ->where('type',Transaction::TYPE_DEPOSIT)->whereNotExists(function ($query){
                $query->select(\DB::raw(1))->from('transfers')->whereRaw('transactions.id=transfers.deposit_id');
            })->get();
        */
        $deposit_list=Transaction::query()->where('payable_id',$user->id)->where('payable_type',Transaction::TYPE_USERPAYABLE)
            ->where('type',Transaction::TYPE_DEPOSIT)->whereJsonContains('meta->type',Transaction::TYPE_DEPOSIT)->get();

        return $deposit_list;
    }
    //消费--废弃
    public function consumes(Request $request){
        $user=$request->user();

        /*
        $consume_list=Transaction::query()->where('payable_id',$user->id)->where('payable_type',Transaction::TYPE_USERPAYABLE)
            ->where('type',Transaction::TYPE_WITHDRAW)->whereExists(function ($query){
                $query->select(\DB::raw(1))->from('transfers')->whereRaw("transfers.status='paid' and transactions.id=transfers.withdraw_id");
            })->get();
        */
        $consume_list=Transaction::query()->where('payable_id',$user->id)->where('payable_type',Transaction::TYPE_USERPAYABLE)
            ->where('type',Transaction::TYPE_WITHDRAW)->whereJsonContains('meta->type',Order::REFUND_STATUS_PENDING)->get();
        return $consume_list;
    }
    //账单记录
    public function bills(Request $request,AccountService $service){
        $user=$request->user();
        $credit_type=$request->input('credit_type','');
        $bills=$service->getbill($user,$credit_type);
        /*
        foreach ($list as $item){
            if($item['meta']->type==Transaction::TYPE_WITHDRAW){
                $item['account_type']='提现';
            }
            if($item['meta']->type==Transaction::TYPE_DEPOSIT){
                $item['account_type']='充值';
            }
            if($item['meta']->type==Order::REFUND_STATUS_PENDING){
                $item['account_type']='购买消费';
            }
            if($item['meta']->type==Order::REFUND_STATUS_PROCESSING){
                $item['account_type']='消费退款';
            }
            if($item['meta']->type=='finance_frozen'){
                $item['account_type']='投资支出';
            }
            if($item['meta']->type=='finance_success'){
                $item['account_type']='融资收入';
            }
            if($item['meta']->type=='finance_fail'){
                $item['account_type']='投资失败退款';
            }
            if($item['meta']->type=='finance_payback'){
                $item['account_type']='投资收益';
            }
            $data[]=$item;
        }
        */
        return TransactionResource::collection($bills);
    }

    public function depositUpdate(Request $request){
        $verifyData=\Cache::get($request->verification_key);
        if(!$verifyData){
            abort(403,'验证码失效');
        }
        //hash_equals 是可防止时序攻击的字符串比较，那么什么是时序攻击呢？比如这段代码我们使用
        if(!hash_equals((string)$verifyData['code'],$request->code)){
            //返回401
            throw new InvalidRequestException('验证码错误',433);
        }
        $info=$this->validate($request,
            ['moneynum'=>'required|numeric'],
            ['moneynum.required'=>':attribute 不能为空','moneynum.numeric'=>':attribute 为数值型'],
            ['moneynum'=>'金额']);
        if($info['moneynum']>0){
            $request->user()->deposit($info['moneynum'],['type'=>'deposit']);
        }
        return [];
    }

    //提现
    public function withdrawUpdate(Request $request){
        $verifyData=\Cache::get($request->verification_key);
        if(!$verifyData){
            abort(403,'验证码失效');
        }
        //hash_equals 是可防止时序攻击的字符串比较，那么什么是时序攻击呢？比如这段代码我们使用
        if(!hash_equals((string)$verifyData['code'],$request->code)){
            //返回401
            throw new InvalidRequestException('验证码错误',433);
        }
        $info=$this->validate($request,
            ['moneynum'=>'required|numeric'],
            ['moneynum.required'=>':attribute 不能为空','moneynum.numeric'=>':attribute 为数值型'],
            ['moneynum'=>'金额']);
        if($info['moneynum']>0){
            $request->user()->withdraw($info['moneynum'],['type'=>'withdraw']);
        }
        return [];
    }
}
