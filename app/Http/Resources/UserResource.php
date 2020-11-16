<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class UserResource extends JsonResource
{
    protected $showSensitiveFields=false;
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        if(!$this->showSensitiveFields){
            $this->resource->makeHidden(['phone', 'email']);
        }
        $data= parent::toArray($request);
        $data['bound_phone'] = $this->resource->phone ? true : false;
        $data['bound_wechat'] = ($this->resource->weixin_unionid || $this->resource->weixin_openid) ? true : false;
        //$data['cartNum']=collect($this->whenLoaded('cartItems'));

        //$data['orders']=ProductPicResource::collection($this->whenLoaded('pics'));
        //$data['favoriteNum']=count($this->whenLoaded('favoriteProducts'));
        //$data['footprintNum']=count($this->whenLoaded('footprints'));
        $data['ordercounts']=OrderCountResource::collection($this->whenLoaded('ordercounts'));
        return $data;
    }
    public function showSensitiveFields(){
        $this->showSensitiveFields=true;
        return $this;
    }
}
