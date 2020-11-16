<?php

namespace App\Admin\Controllers;

use App\Models\Sitehelp;
use App\Models\SitehelpType;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Controllers\AdminController;

class SitehelpsController extends AdminController
{
    protected $title='帮助信息';
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(Sitehelp::with('sitehelpType'), function (Grid $grid) {
            //$grid->column('id')->sortable();
            $grid->number();
            $grid->column('title');
            //$grid->column('content');
            $grid->column('synopsis');
            $grid->column('view');
            //$grid->column('sender_id');
            //$grid->column('sender_name');
            $grid->column('sitehelpType.title','分类');
            $grid->column('created_at');
            //$grid->column('updated_at')->sortable();
        
            $grid->filter(function (Grid\Filter $filter) {
                $filter->equal('id');
        
            });
        });
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     *
     * @return Show
     */
    protected function detail($id)
    {
        return Show::make($id,Sitehelp::with('sitehelpType'), function (Show $show) {
            $show->field('id');
            $show->field('title');
            $show->html(function (){
                $html="<div class='show-field form-group row'>
                            <div class='col-sm-2 control-label'>
                                <span>图片</span>
                            </div>
                            <div class='col-sm-8'>
                                     <div class='box box-solid box-default no-margin box-show'>
                                        <div class='box-body'>$this->content
                                        </div>
                                    </div>
                             </div>
                           </div>";
                return $html;
            });
            $show->field('synopsis');
            $show->field('view');
            //$show->field('sender_id');
            //$show->field('sender_name');
            $show->field('sitehelp_type.title','分类');
            $show->field('created_at');
            //$show->field('updated_at');
        });
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        return Form::make(new Sitehelp(), function (Form $form) {
            $form->display('id');
            $form->text('title')->required();
            $form->editor('content')->height('500')
                ->options(['language'=>'zh_CN'])
                ->required();
            $form->textarea('synopsis')->rows(3)->required();
            $form->hidden('view')->default(0);
            //$form->text('sender_id');
            //$form->text('sender_name');
            $types=SitehelpType::query()->get(['id','title as text']);
            foreach ($types as $type){
                $data[$type->id]=$type['text'];
            }

            $form->select('sitehelp_type_id','分类')->options(
                $data
            )->required();
        
            $form->display('created_at');
            $form->display('updated_at');
            $form->hidden('sender_id');
            $form->hidden('sender_name');
            $form->saving(function (Form $form){
               if(!$form->input('sender_id')){
                   $form->sender_id=1;
                   $form->sender_name='admin';
               }
            });
        });
    }
}
