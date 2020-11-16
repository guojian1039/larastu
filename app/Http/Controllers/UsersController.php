<?php

namespace App\Http\Controllers;

use App\Handlers\ImageUploadHandler;
use App\Models\Shop;
use App\Models\Transaction;
use App\Models\User;
use App\Services\UserService;
use Bavix\Wallet\Models\Transfer;
use Bavix\Wallet\Models\Wallet;
use Illuminate\Http\Request;
use App\Http\Requests\UserAddressRequest;
use Illuminate\Support\Facades\Log;

class UsersController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function me(Request $request)
    {
        return view('accounts.my',['user'=>$request->user()]);
    }

    public function update(Request $request,ImageUploadHandler $uploader,UserService $service){
        $user=$request->user();

        $data=$request->only(['name','phone','email','introduction','username','birthday','gender','qq']);
        if ($request->avatar) {
            $result = $uploader->save($request->avatar, 'avatars', $user->id, 416);
            if ($result) {
                $data['avatar'] = $result['path'];
            }
        }
        $avatar_image_id=$request->input('avatar_image_id');
        $user= $service->update($user,$data,$avatar_image_id);
        return redirect()->route('users.me');
    }

    public function deposit(Request $request){
        return view('accounts.deposit');
    }
    public function depositUpdate(Request $request){
        $info=$this->validate($request,
            ['moneynum'=>'required|numeric','captcha'=>'required|captcha'],
            ['moneynum.required'=>':attribute 不能为空','moneynum.numeric'=>':attribute 为数值型','captcha.required'=>':attribute 不能为空','captcha.captcha'=>'请输入正确的 :attribute'],
            ['captcha'=>'验证码','moneynum'=>'金额']);
        if($info['moneynum']>0){
            $request->user()->deposit($info['moneynum'],['type'=>'deposit']);
        }
        return redirect()->route('accounts.index');
    }
    public function withdraw(Request $request){
        return view('accounts.withdraw',['balance'=>$request->user()->balance]);
    }
    //提现
    public function withdrawUpdate(Request $request){
        $info=$this->validate($request,
            ['moneynum'=>'required|numeric','captcha'=>'required|captcha'],
            ['moneynum.required'=>':attribute 不能为空','moneynum.numeric'=>':attribute 为数值型','captcha.required'=>':attribute 不能为空','captcha.captcha'=>'请输入正确的 :attribute'],
            ['captcha'=>'验证码','money'=>'金额']);
        if($info['moneynum']>0){
            $request->user()->withdraw($info['moneynum'],['type'=>'withdraw']);
        }
        return redirect()->route('accounts.index');
    }
    public function wallets(Request $request){
        $user=$request->user();
        $balance=$user->balance;
        $data=[];
        $transactions=Transaction::query()->where('payable_id',$user->id)->paginate(10);
        foreach ($transactions as $transaction){
            if($transaction['type']=='deposit'){
               $deposit= Transfer::query()->where('deposit_id',$transaction['id'])->first();
                if($deposit){
                    $dataitem['title']='转入';
                    $deposit_user=Wallet::query()->where('id',$deposit['from_id'])->first();
                    if($deposit_user){
                        if($deposit_user['holder_type']=='App\Models\User'){
                            $member=User::query()->where('id',$deposit_user['holder_id'])->first();
                            if($member){
                                $dataitem['description']='【'.$member['name'].'】转入'.$transaction['amount'].'元';
                            }
                        }else if($deposit_user['holder_type']=='App\Models\Shop'){
                            $member=Shop::query()->where('id',$deposit_user['holder_id'])->first();
                            if($member){
                                $dataitem['description']='【'.$member['name'].'】转入'.$transaction['amount'].'元,'.$transaction['meta']['title'];
                            }
                        }
                    }

                }else{
                    $dataitem['title']='充值';
                    $dataitem['description']='充值';
                }
                $dataitem['amount']=$transaction['amount'];
                $dataitem['created_at']=$transaction['created_at'];
            }
            else if($transaction['type']=='withdraw'){
                $withdraw= Transfer::query()->where('withdraw_id',$transaction['id'])->first();
                if($withdraw){
                    $dataitem['title']='转出';
                    if($withdraw['status']=='paid' || $withdraw['status']=='refund'){
                        $dataitem['description']='消费'.$transaction['amount'].'元，'.$transaction['meta']['title'].'';
                        $dataitem['title']='消费';
                    }
                    else
                    {
                        $withdraw_user=Wallet::query()->where('id',$withdraw['to_id'])->first();
                        if($withdraw_user){
                            if($withdraw_user['holder_type']=='App\Models\User'){
                                $member=User::query()->where('id',$withdraw_user['holder_id'])->first();
                                if($member){
                                    $dataitem['description']='转出'.$transaction['amount'].'元，到【'.$member['name'].'】账户';
                                }
                            }else if($withdraw_user['holder_type']=='App\Models\Shop'){
                                $member=Shop::query()->where('id',$withdraw_user['holder_id'])->first();
                                if($member){
                                    $dataitem['description']='转出'.$transaction['amount'].'元，到【'.$member['name'].'】账户';
                                }
                            }


                        }
                    }
                }else{
                    $dataitem['title']='提现';
                    $dataitem['description']='提现';
                }
                $dataitem['amount']=$transaction['amount'];
                $dataitem['created_at']=$transaction['created_at'];
            }
            $data[]=$dataitem;
        }
        return view('accounts.wallets',['balance'=>$balance,'list'=>$data,'transactions'=>$transactions]);
    }
}
