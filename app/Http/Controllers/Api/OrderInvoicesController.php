<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\OrderInvoiceResource;
use App\Models\Order;
use App\Models\OrderInvoice;
use App\Models\UserInvoice;
use App\Services\OrderService;
use Illuminate\Http\Request;

class OrderInvoicesController extends Controller
{
    //列表
    public function index(Request $request){
        $user_id=$request->user()->id;
        $list= OrderInvoice::query()->where('status',0)->where('user_id',$user_id)->paginate(8);
        return OrderInvoiceResource::collection($list);
    }
    //添加保存
    public function store(UserInvoice $invoice, Request $request){
        /*
        $orderInvoice= OrderInvoice::make($request->only(['order_sn','username','title','duty_paragraph','opening_bank','address','content','tax_money','type']));
        $orderInvoice->user()->associate($request->user());
        $orderInvoice->order()->associate($request->input('order_id'));
        return $orderInvoice->save();
        */
        $order=Order::query()->find($request->input('order_id'));
       return app(OrderService::class)->storeOrderInvoice($order,$invoice);
    }
    //删除
    public function destroy(OrderInvoice $orderInvoice){
        return $orderInvoice->update(['status'=>1]);
    }
}
