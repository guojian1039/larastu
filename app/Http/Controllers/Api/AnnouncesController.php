<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\AnnounceResource;
use App\Models\Announce;
use App\Services\AnnouncesService;
use Illuminate\Http\Request;

class AnnouncesController extends Controller
{
    public function index(Request $request,AnnouncesService $service){
        $limit=$request->input('limit');
        $list=$service->getList($limit);
        return AnnounceResource::collection($list);
    }
    public function show(Announce $announce){
        $announce->increment('view');
        return $announce;
    }
}
