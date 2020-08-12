<?php
function route_class()
{
    return str_replace('.','-',Route::currentRouteName());
}
function image_url($image)
{
    return \Storage::disk('public')->url($image);
}
function url_image($image)
{
    if(\Illuminate\Support\Str::startsWith($image,['http','https']))
    {
        return $image;
    }
    return image_url($image);
}
function get_thumb_pic($picname)
{
    $extend =explode("." , $picname);
    $va=count($extend)-1;
    return str_replace(strrchr($picname, "."),"",$picname).'-small'.'.'.$extend[$va];
}
