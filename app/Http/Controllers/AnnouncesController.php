<?php

namespace App\Http\Controllers;
use App\Models\Announce;
use App\Services\AnnouncesService;
use Illuminate\Http\Request;

class AnnouncesController extends Controller
{
    public function index(Request $request,AnnouncesService $service){
        $list=$service->getList();
        return view('announces.index',['list'=>$list]);
    }

    public function show(Announce $announce){
        $announce->increment('view');
        return view('announces.show',['announce'=>$announce]);
    }
}
