<?php
function make_excerpt($value, $length = 200)
{
    $excerpt = trim(preg_replace('/\r\n|\r|\n+/', ' ', strip_tags($value)));
    return Str::limit($excerpt, $length);
}
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
function itemsMerge(array $items, $pid = 0, $idField = "id", $pidField = 'parent_id', $child = '-')
{
    $map = [];
    $tree = [];
    foreach ($items as &$it) {
        $it[$child] = [];
        $map[$it[$idField]] = &$it;
    }

    foreach ($items as &$it) {
        $parent = &$map[$it[$pidField]];
        if ($parent) {
            $parent[$child][] = &$it;
        } else {
            $pid == $it[$pidField] && $tree[] = &$it;
        }
    }

    unset($items, $map);

    return $tree;
}
