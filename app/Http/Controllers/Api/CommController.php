<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Province;
use Illuminate\Http\Request;

class CommController extends Controller
{
    public function getArea(Request $request){
        $pid=$request->input('pid',0);
        return Province::query()
            ->where(['pid' => $pid])
            ->orderBy('id')
            ->get(['id', 'title', 'pid']);
    }
}
