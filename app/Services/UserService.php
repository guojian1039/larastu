<?php
namespace App\Services;
use App\Models\Image;
use Illuminate\Http\Request;

class UserService{
    //修改
    public function update($user,$data,$avatar_image_id){
        if($avatar_image_id)
        {
            $avatar=Image::query()->find($avatar_image_id);
            $data['avatar']=$avatar['path'];
        }
        $user->update($data);
        return $user;
    }
    //个人收藏
    public function userFavorites($user,$limit=null)
    {
        if($limit){
            $products=$user->favoriteProducts()->limit($limit)->get();
        }else{
            $products=$user->favoriteProducts()->paginate(6);
        }
        return $products;
    }
    //个人足迹
    public function userFootprints($user,$limit=null)
    {
        if($limit){
            $products=$user->footprints()->limit($limit)->get();
        }else{
            $products=$user->footprints()->paginate(6);
        }
        return $products;
    }
    //获取个人信息
    public function getInfo($user,$include)
    {
        $includes = [];
        $includecounts = [];
        if ($include) {
            if (!is_array($include)) {
                $include = explode(',', $include);
            }
            foreach ($include as $key => $value) {
                if (in_array($value, ['footprints', 'cartItems', 'favoriteProducts'])) {
                    $includecounts[] = $value;
                }
                if (in_array($value, ['ordercounts'])) {
                    $includes[] = $value;
                }
            }
            //$include=implode(',',$includes);
            if ($includecounts && count($includecounts) > 0) {
                $user->loadCount($includecounts);
            }
            if ($includes && count($includes) > 0) {
                $user->load($includes);
            }
            if (in_array($value, ['balance'])) {
                $user->user_money=$user->balance;
            }
        }
        return $user;
    }
}