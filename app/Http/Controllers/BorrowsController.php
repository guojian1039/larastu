<?php

namespace App\Http\Controllers;

use App\Models\Borrow;
use App\Models\BorrowInvest;
use App\Models\BorrowRepayment;
use App\Services\BorrowsService;
use App\Services\InvestService;
use App\Services\RepayService;
use Carbon\Carbon;
use Illuminate\Http\Request;

class BorrowsController extends Controller
{
    public function index(Request $request,BorrowsService $service){
        $list=$service->getList(['status'=>Borrow::STATUS_BIDDING]);
        //$request->user()->deposit(100000);
        return view('borrows.index',['borrows'=>$list]);
    }

    public function myBorrows(Request $request,BorrowsService $service){
        $list=$service->getList(['user_id'=>$request->user()->id]);
        return view('accounts.borrows',['borrows'=>$list]);
    }
    public function myInvests(Request $request,InvestService $service){
        $list=$service->getList(['user_id'=>$request->user()->id],'borrow');
        return view('accounts.invests',['invests'=>$list]);
    }
    public function show(Borrow $borrow){
        return view('borrows.show',['borrow'=>$borrow]);
    }

    //投资
    public function invest(Request $request,InvestService $service){
        $user=$request->user();
        $borrow_id=$request->input('borrow_id');
        $invest_sum=$request->input('invest_sum');
        $service->invest($user,$borrow_id,$invest_sum);
        return [];
    }

    //按还款期数，还款
    public function repay(Request $request,RepayService $service){
        $user=$request->user();
        $batch=$request->input('batch');
        $borrow_id=$request->input('borrow_id');
        $service->repay($user,$borrow_id,$batch);
        return [];
    }
    //融资还款列表
    public function borrowRepay(Request $request,Borrow $borrow){
        $list=BorrowRepayment::query()->where('borrow_id',$borrow->id)
            ->where('status','<>',BorrowRepayment::STATUS_TRANSFERED)
            ->get();

        $repaylists=[];
        $dealtime=[];
        $status=[];
        $capital=[];
        $interest=[];
        foreach ($list as $item){
            $dealtime[$item['batch']]=$item['deadline'];
            $status[$item['batch']]=$item['status'];
            if(isset($capital[$item['batch']])){
                $capital[$item['batch']]+=$item['capital'];
            }else{
                $capital[$item['batch']]=$item['capital'];
            }
            if(isset($interest[$item['batch']])){
                $interest[$item['batch']]+=$item['interest'];
            }else{
                $interest[$item['batch']]=$item['interest'];
            }
        }
        foreach ($interest as $key=>$value){
            $remaindays=0;

            if($dealtime[$key]>Carbon::now()){
                if(Carbon::now()->diffInDays(Carbon::parse($dealtime[$key]))<91){
                    $remaindays=1;
                }
            }
            $repaylists[]=['batch'=>$key,'capital'=>$capital[$key],
                'interest'=>$value,'dealtime'=>$dealtime[$key],
                'status'=>$status[$key],'remaindays'=>$remaindays];
        }
        return view('accounts.borrowrepay',['borrow_id'=>$borrow->id,'title'=>$borrow['title'],'repaylists'=>$repaylists]);
    }

    public function investRepay(Request $request,BorrowInvest $invest){
        $list=BorrowRepayment::query()->where('borrow_invest_id',$invest->id)
            ->where('status','<>',BorrowRepayment::STATUS_TRANSFERED)
            ->get();
        $borrow=Borrow::query()->find($invest->borrow_id);
        return view('accounts.investrepay',['title'=>$borrow->title,'repaylists'=>$list]);
    }
}
