<?php

namespace App\Http\Controllers\Api;
use App\Http\Controllers\Controller;
use App\Http\Resources\UserInvoiceResource;
use App\Models\UserInvoice;
use Illuminate\Http\Request;

class UserInvoicesController extends Controller
{
    public function index(Request $request){
        $user_id=$request->user()->id;
        $list= UserInvoice::query()->where('user_id',$user_id)->paginate(6);
        return UserInvoiceResource::collection($list);
    }
    public function store(Request $request){
        $data=$request->only(['title','duty_paragraph','opening_bank','address','content','is_default','type']);
        $data['user_id']=$request->user()->id;
        return UserInvoice::query()->create($data);
    }
    public function update(Request $request, UserInvoice $userInvoice)
    {
        //$this->authorize('own',$userInvoice);
        $userInvoice->update($request->only(['title','duty_paragraph','opening_bank','address','content','is_default','type']));
        return [];
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\UserAddress  $userAddress
     * @return \Illuminate\Http\Response
     */
    public function destroy(UserInvoice $userInvoice)
    {
        //$this->authorize('own',$userInvoice);
        $userInvoice->delete();
        return [];
    }

    public function edit(UserInvoice $userInvoice)
    {
        //$this->authorize('own',$userInvoice);
        return $userInvoice;
    }
}
