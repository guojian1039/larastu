<?php

namespace App\Admin\Forms;

use App\Models\Category;
use Dcat\Admin\Widgets\Form;
use Symfony\Component\HttpFoundation\Response;

class category_create extends Form
{
    protected $parent_id;
    public function __construct($parent_id=null)
    {
        $this->parent_id=$parent_id;
        parent::__construct();
    }

    /**
     * Handle the form request.
     *
     * @param array $input
     *
     * @return Response
     */
    public function handle(array $input)
    {
        //return $this->error('操作失败'.\GuzzleHttp\json_encode($input));
        $category=new Category();
        $category->parent_id=$input['parent_id'];
        $category->name=$input['name'];
        $category->is_directory=$input['is_directory'];
        $r=$category->save();
        //Category::query()->create($input)
        /**/
        if($r){
            return $this->success('添加成功', '/categories');
        }

        else{
            return $this->error('操作失败');
        }

    }

    /**
     * Build a form here.
     */
    public function form()
    {
        $this->text('name')->required();
        $this->switch('is_directory', __('是否目录'))->default(false);
        // 设置隐藏表单，传递用户id
        $this->hidden('parent_id')->value($this->parent_id);
    }

    /**
     * The data of the form.
     *
     * @return array
     */
    public function default()
    {
        return [
            'name'  => '',
            'is_directory' => false,
            //'parent_id'=>0
        ];
    }
}
