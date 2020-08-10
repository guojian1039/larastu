<?php
namespace App\Services;
use App\Models\Image;
use Illuminate\Http\Request;

class UserService{
    public function update($user,$data,$avatar_image_id){
        if($avatar_image_id)
        {
            $avatar=Image::query()->find($avatar_image_id);
            $data['avatar']=$avatar['path'];
        }
        $user->update($data);
        return $user;
    }
    public function userFavorites($user,$pageNo)
    {
        $products=$user->favoriteProducts()->paginate($pageNo);
        return $products;
    }
}