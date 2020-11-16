<?php

namespace App\Admin\Controllers;
use App\Models\Brand;
use App\Models\Category;
use Dcat\Admin\Controllers\AdminController;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class BrandsController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '品牌列表';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Brand());

        $grid->model()->with('categories');
        //$grid->column('id', __('序号'));
        $grid->number();
        $grid->column('category','类别')->display(function (){
            $categories='';
            foreach ($this->categories as $category){
                $categories.=$category['name'].',';
            }
            return trim($categories,',') ;
        });
        $grid->column('name', __('名称'));
        $grid->image('图片')->display(function ($value){
            return '<img src="/storage/'.$value.'" width=120 height=50>';
        });
        $grid->column('url', __('链接'));

        $grid->actions(function ($action){
            $action->disableView();
        });
        $grid->setActionClass(Grid\Displayers\Actions::class);
        return $grid;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form( Brand::with('categories'));
        /*
        $form->select('category_id', __('类目'))->ajax('/api/categories?is_directory=0')
            ->options(function ($id){
                $category= \App\Models\Category::find($id);
                if($category)
                {
                    return [$category->id=>$category->full_name];
                }
            });
        */
        $form->text('name','名称')->rules('required');
        $form->image('image','图片')->rules('required|image')->move('brands')->uniqueName();
        $form->text('url','链接地址')->rules('required');
        // 这里的数据会自动保存到关联模型中
        $form->tree('categories','类别')
            ->nodes(function () {
                return (new Category())->allNodes();
            })
            ->customFormat(function ($v) {
                if (!$v) return [];
                // 这一步非常重要，需要把数据库中查出来的二维数组转化成一维数组
                return array_column($v, 'id');
            });
        $form->disableViewButton();
        return $form;
    }

    public function brands(Request $request)
    {
        $category_id = $request->get('q');
        $category=Category::query()->find($category_id);
        return $category->brands->map(function ($value, $key) {
            return ['id'=>$value['id'],'text'=>$value['name']];
        });
            /*
        return Brand::query()->whereHas('categories',function ($query)use ($category_id){
            $query->where('id',$category_id);
        })->get(['id', \DB::raw('name as text')]);
            */
    }
}
