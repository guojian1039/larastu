<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class SeckillProductResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        $data= parent::toArray($request);
        $rdata=$data['product'];
        $rdata['image']=url_image($rdata['image']);
        $rdata['start_at']=$data['start_at'];
        $rdata['end_at']=$data['end_at'];
        return $rdata;
    }
}
