<?php

namespace App\Http\Resources;
use Illuminate\Http\Resources\Json\JsonResource;

class ProductResource extends JsonResource
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
        $data['image']=url_image($data['image']);
        $data['category']=new CategoryResource($this->whenLoaded('category'));
        $data['pics']=ProductPicResource::collection($this->whenLoaded('pics'));
        $data['skus']=new ProductSkuResource($this->whenLoaded('skus'));

        return $data;
    }
}
