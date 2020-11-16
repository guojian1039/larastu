<?php

namespace App\Admin\Controllers;

use App\Admin\Actions\Grid\CreateCategory;
use App\Admin\Repositories\Category;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Controllers\AdminController;
use Illuminate\Http\Request;

class CategoryController extends AdminController
{
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new Category(), function (Grid $grid) {
            $grid->number();
            $grid->name->tree();


            $grid->level->display(function ($value){
                return $value+1;
            });

            //$grid->path;
            //$grid->opt->display('查看')->modal('sdd');
            $grid->filter(function (Grid\Filter $filter) {
                $filter->equal('id');

            });
            $grid->setActionClass(Grid\Displayers\Actions::class);
            $grid->disableViewButton();

            //$grid->disableDeleteButton();
            $grid->disableBatchActions();
            if($grid->is_directory)
            {
                $grid->actions(function (Grid\Displayers\Actions $actions) {
                    $actions->append(CreateCategory::make());
                });
            }
            $grid->column('is_directory','是否目录')->display(function ($value){
                return $value?'是':'否';
            });
        });
    }
    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        return Form::make(new Category(), function (Form $form) {
            $form->display('id');
            $form->text('name')->required()->rules('required');
            if($form->isEditing()){
                // 不允许用户修改『是否目录』和『父类目』字段的值
                // 用 display() 方法来展示值，with() 方法接受一个匿名函数，会把字段值传给匿名函数并把返回值展示出来
                $form->display('is_directory','是否目录')->with(function ($value){
                    return $value?'是':'否';
                });
                // 支持用符号 . 来展示关联关系的字段
                $form->display('parent.name', '父类目');
            }
            if($form->isCreating()){
                $form->switch('is_directory', __('是否目录'))->default(true);
                //$pcategory=\App\Models\Category::query()->where('parent_id')
                $form->select('parent_id', __('父类目'))->ajax('/api/categories');
            }
            $form->image('image', __('图片'))->rules('image')->uniqueName();
            $form->disableViewButton();
        });

    }

    // 定义下拉框搜索接口
    public function apiIndex(Request $request)
    {
        // 用户输入的值通过 q 参数获取
        // 由于这里选择的是父类目，因此需要限定 is_directory 为 true
        $search = $request->input('q');
        $results=\App\Models\Category::query()->where('is_directory',boolval($request->input('is_directory',true)))
            ->where('name','like','%'.$search.'%')->paginate();
        // 把查询出来的结果重新组装成 Laravel-Admin 需要的格式
        $results->setCollection($results->getCollection()->map(function ($category){
            $item= ['id' => $category->id, 'text' => $category->full_name];
            return $item;
        }));
        return $results;
    }

    // 定义下拉框搜索接口
    public function allCategories(Request $request)
    {
        // 用户输入的值通过 q 参数获取
        // 由于这里选择的是父类目，因此需要限定 is_directory 为 true
        $search = $request->input('q');
        $results=\App\Models\Category::query()
            ->where('name','like','%'.$search.'%')->paginate();
        // 把查询出来的结果重新组装成 Laravel-Admin 需要的格式
        $results->setCollection($results->getCollection()->map(function ($category){
            $item= ['id' => $category->id, 'text' => $category->full_name];
            return $item;
        }));
        return $results;
    }
}
