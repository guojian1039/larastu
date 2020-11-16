<?php

namespace App\Http\Controllers;

use App\Models\Borrow;
use App\Models\BorrowRepayment;
use App\Services\BorrowsService;
use App\Services\InvestService;
use App\Services\RepayService;
use Illuminate\Http\Request;

class AccountsController extends Controller
{
    public function index(Request $request)
    {
        $user=$request->user();
        $invest_list=app(InvestService::class)->getList(['user_id'=>$user->id]);
        $rest_receive=collect($invest_list)->sum(function ($item){
            return (($item['capital']+$item['interest'])-($item['receive_capital']+$item['receive_interest']));
        });
        //$repay_list=app(RepayService::class)->getList(['user_id'=>$user->id,'indays'=>30]);
        $params['user_id']=$user->id;
        $params['indays']=100;
        $params['status']=Borrow::STATUS_SUCCESS;
        $borrow_list=app(BorrowsService::class)->getList($params,'repays',20);
        $borrows=[];
        foreach ($borrow_list as $item){
            $repay_sum=collect($item['repays'])->where('batch',$item['repayment_already_times']+1)
                ->where('status',BorrowRepayment::STATUS_PROCCESSING)
                ->sum(function ($item){
                   return $item['capital']+$item['interest'];
                });
            $borrows[]=['title'=>$item['title'],'batch'=>$item['repayment_already_times']+1,'next_repaytime'=>$item['next_repaytime'],'repay_sum'=>$repay_sum];//名称
        }
        return view('accounts.index',[
            'balance'=>$user->balance,
            'rest_receive'=>$rest_receive,
            'borrows'=>$borrows
        ]);
    }
}
