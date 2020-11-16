<?php

namespace App\Admin\Controllers;

use App\Admin\Actions\Grid\ReplyOpinions;
use App\Models\SiteOpinion;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Controllers\AdminController;

class SiteOpinionsController extends AdminController
{
    protected $title='网站问题反馈';
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(SiteOpinion::with('user'), function (Grid $grid) {
            //$grid->column('id')->sortable();
            $grid->number();
            $grid->column('user.name','反馈人');
            $grid->column('content');
            //$grid->column('covers');
            $grid->column('contact_way');
            //$grid->column('reply');
            $grid->column('type');
            $grid->column('from');
            //$grid->column('sort');
            $grid->column('created_at');
            //$grid->column('updated_at')->sortable();
        
            $grid->filter(function (Grid\Filter $filter) {
                $filter->equal('id');
        
            });
            $grid->disableEditButton();
            $grid->disableDeleteButton();
            $grid->actions(function ($actions) {
               $actions->append(new ReplyOpinions());
            });
            $grid->disableCreateButton();
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
        return Show::make($id, new SiteOpinion(), function (Show $show) {
            $show->field('id');
            //$show->field('user_id');
            $show->field('content');
            $show->html(function () {
                $images='';
                if($this->covers){
                    foreach (\GuzzleHttp\json_decode($this->covers,1) as $vitem){
                        $images.="<img src='$vitem'/><br>";
                    }
                }
                if(!$images){
                    $images= '暂无';
                }
                $html="<div class='show-field form-group row'>
                            <div class='col-sm-2 control-label'>
                                <span>图片</span>
                            </div>
                            <div class='col-sm-8'>
                                     <div class='box box-solid box-default no-margin box-show'>
                                        <div class='box-body'>$images
                                        </div>
                                    </div>
                             </div>
                           </div>";
                return $html;

            });

            $show->field('contact_way');
            $show->field('reply');
            $show->field('type');
            $show->field('from');
            $show->field('sort');
            $show->field('created_at');
            $show->field('updated_at');
            $show->disableEditButton();
            $show->disableDeleteButton();
        });
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        return Form::make(new SiteOpinion(), function (Form $form) {
            $form->display('id');
            $form->text('user_id');
            $form->text('content');
            $form->text('covers');
            $form->text('contact_way');
            $form->text('reply');
            $form->text('type');
            $form->text('from');
            $form->text('sort');
        
            $form->display('created_at');
            $form->display('updated_at');
        });
    }
}
