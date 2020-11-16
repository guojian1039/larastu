<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Sitehelp;
use App\Models\SitehelpType;
use Illuminate\Http\Request;

class SitehelpsController extends Controller
{
    public function index(){
        return SitehelpType::query()->with('sitehelps')->get();
    }
    public function show(Sitehelp $sitehelp){
        $sitehelp->increment('view');
        return $sitehelp;
    }
}
