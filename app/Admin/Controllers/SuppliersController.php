<?php

namespace App\Admin\Controllers;
use Illuminate\Http\Request;
use App\Models\Supplier;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Controllers\AdminController;

class SuppliersController extends AdminController
{
    protected $title='供货商';
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new Supplier(), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('name');
            $grid->column('desc');
            $grid->column('linkman_tel');
            $grid->column('linkman_name');
            $grid->column('linkman_address');
            $grid->column('status')->switch();

            $grid->disableViewButton();
            $grid->filter(function (Grid\Filter $filter) {
                $filter->equal('id');
        
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
        return Form::make(new Supplier(), function (Form $form) {
            $form->display('id');
            $form->text('name')->required();
            $form->text('desc')->required();
            $form->text('linkman_tel')->required();
            $form->text('linkman_name')->required();
            $form->text('linkman_address')->required();
            $form->switch('status');
        });
    }

    //搜索供应商
    public function suppliers(Request $request)
    {
        $q = $request->get('q');

        return Supplier::where('name', 'like', "%$q%")->paginate(null, ['id', 'name as text']);
    }
}
