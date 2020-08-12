<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class CrowdfundingProductResource extends JsonResource
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
        $rdata['target_amount']=$data['target_amount'];
        $rdata['total_amount']=$data['total_amount'];
        $rdata['user_count']=$data['user_count'];
        $rdata['end_at']=$data['end_at'];
        return $rdata;
    }
}
