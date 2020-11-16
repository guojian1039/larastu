<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\SiteOpinionResource;
use App\Models\SiteOpinion;
use Illuminate\Http\Request;

class SiteOpinionsController extends Controller
{
    public function store(Request $request){
        $user_id=$request->user()->id;
        $data=$request->only(['content','covers','contact_way','type','from']);
        $data['user_id']=$user_id;
        $data['from']='h5';
        return SiteOpinion::query()->create($data);
    }
    public function getUserList(Request $request){
        $user_id=$request->user()->id;
        $list= SiteOpinion::query()->where('user_id',$user_id)->paginate(8);
        return SiteOpinionResource::collection($list);
    }
    public function show(SiteOpinion $opinion){
        return new SiteOpinionResource($opinion);
    }
}
