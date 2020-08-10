<?php

namespace App\Admin\Controllers;

use App\Admin\Actions\Grid\ShowUserAddress;
use App\Admin\Repositories\User;
use App\Admin\Repositories\UserAddress;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Controllers\AdminController;

class UsersController extends AdminController
{
    protected $title='用户管理';
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new User(), function (Grid $grid) {
            $grid->id->sortable();
            $grid->name;
            $grid->email;
            $grid->column('email_verified_at','是否认证') ->display(function ($value){
                return $value?'已认证':'未认证';
            });
            $grid->created_at;

            $grid->opt->display('邮寄地址')->expand(UserAddress::make(['post_type' => 1]));
            $grid->filter(function (Grid\Filter $filter) {
                $filter->equal('id');
        
            });
            //$grid->setActionClass(Grid\Displayers\Actions::class);
            $grid->disableCreateButton(true);
            $grid->disableActions(true);
            $grid->tools('<a class="btn btn-primary disable-outline">测试按钮</a>');
            $grid->toolsWithOutline(false);
            $grid->actions(function (Grid\Displayers\Actions $actions) {
                // append一个操作
                //$actions->append('<a href=""><i class="fa fa-eye"></i></a>');

                // prepend一个操作
                //$actions->prepend('<a href="addresses/userid/'.$actions->getKey().'"><i class="fa fa-paper-plane"></i>发货地址</a>');

                //$actions->append(ShowUserAddress::make());
            });
            /*
            $grid->disableDeleteButton();
            $grid->disableEditButton();
            $grid->disableViewButton();
            */
            /*
            $grid->actions(function ($action){
               $action->disableView();
               $action->disableDelete();
               $action->disableEdit();
            });
            */
            //$grid->disableBatchDelete();
            /*
            $grid->tools(function ($tools){
                $tools->batch(function ($batch){
                    $batch->disableDelete();
                });
            });
            */
        });
    }
}
