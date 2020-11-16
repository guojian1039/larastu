<?php

namespace App\Http\Controllers\Api;

use App\Http\Resources\UserAddressResource;
use App\Models\UserAddress;
use Illuminate\Http\Request;
use App\Http\Requests\UserAddressRequest;
class UserAddressesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        return UserAddressResource::collection($request->user()->addresses);
    }
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(UserAddressRequest $request)
    {
        $address=$request->user()->addresses()->create($request->only(['province','city','district','zip','address','contact_name','contact_phone','is_default']));
        return [];
    }
    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\UserAddress  $userAddress
     * @return \Illuminate\Http\Response
     */
    public function update(UserAddressRequest $request, UserAddress $userAddress)
    {
        $this->authorize('own',$userAddress);
        $userAddress->update($request->only(['province','city','district','zip','address','contact_name','contact_phone','is_default']));
        return [];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\UserAddress  $userAddress
     * @return \Illuminate\Http\Response
     */
    public function destroy(UserAddress $userAddress)
    {
        $this->authorize('own',$userAddress);
        $userAddress->delete();
        return [];
    }

    public function edit(UserAddress $userAddress)
    {
        $this->authorize('own',$userAddress);
        return new UserAddressResource($userAddress);
    }
}
