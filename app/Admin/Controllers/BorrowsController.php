<?php

namespace App\Admin\Controllers;

use App\Admin\Actions\Grid\BidFail;
use App\Admin\Renderable\UserTable;
use App\Admin\Renders\BorrowInvest;
use App\Models\Borrow;
use App\Models\BorrowInfo;
use App\Models\Company;
use App\Models\User;
use App\Services\BorrowsService;
use Carbon\Carbon;
use Dcat\Admin\Admin;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Layout\Content;
use Dcat\Admin\Layout\Row;
use Dcat\Admin\Show;
use Dcat\Admin\Controllers\AdminController;
use Dcat\Admin\Widgets\Tab;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class BorrowsController extends AdminController
{
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(Borrow::with(['company']), function (Grid $grid) {
            $grid->model()->orderBy('id','desc');
            //$grid->column('id')->sortable();
            $grid->number();
            $grid->column('title');
            //$grid->column('user.name','用户');
            $grid->column('company.name','融资主体');
            $grid->column('duration')->display(function ($v){
                if($v>0) return $v.'月';
                else return abs($v).'天';
            });
            $grid->column('money');
            $grid->column('rate');
            $grid->column('fee');
            /*
            $grid->column('repayment_times');
            $grid->column('repayment_already_times');
            $grid->column('repayment_type');
            $grid->column('collect_day');
            $grid->column('deal_time');
            $grid->column('publish_time');
            $grid->column('full_time');
            $grid->column('redeal_time');
            $grid->column('next_repaytime');
            $grid->column('type');
            $grid->column('area');
            $grid->column('status');
            $grid->column('use');
            $grid->column('use_other');
            $grid->column('deal_id');
            $grid->column('deal_name');
            $grid->column('deal_info');
            $grid->column('redeal_id');
            $grid->column('redeal_name');
            $grid->column('redeal_info');
            $grid->column('repayment_capital');
            $grid->column('repayment_interest');
            $grid->column('repayment_managefee');
            $grid->column('repayment_overdue');
            */
            $grid->column('status')->display(function ($v){
                return Borrow::$statusMap[$v];
            });
            $grid->column('id','投资详情')->display('查看')->expand(BorrowInvest::make());
            $grid->column('created_at');
            //$grid->column('updated_at')->sortable();

            $grid->actions(function (Grid\Displayers\Actions $actions) {
                $url="borrows/".$this->id."/binfo?";
                $actions->append("<a href=$url"."show_type=1".">补充资料</a>");
                if($this->rate>0 && $this->status==Borrow::STATUS_PENDING){
                    $actions->append("<a href=$url"."show_type=4&check=1".">初级审核</a>");
                }
                if($this->status==Borrow::STATUS_BIDSUCCESS){
                    $actions->append("<a href=$url"."show_type=5&check=2".">终极审核</a>");
                }
                if($this->status==Borrow::STATUS_BIDDING){
                    $actions->append(new BidFail());
                }
            });
            $grid->disableDeleteButton();
            $grid->disableEditButton();
            $grid->filter(function (Grid\Filter $filter) {
                //$filter->equal('id');
                $filter->like('title','融资标题');
                $filter->in('user_id','融资用户')->multipleSelectTable(UserTable::make())->max(3)->model(User::class,'id','name');
                $filter->equal('status', '融资状态')->select(Borrow::$statusMap);
                $filter->between('created_at','创建时间')->datetime();
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
        return Show::make($id, new Borrow(), function (Show $show) {
            $show->field('id');
            $show->field('title');
            $show->field('user_id');
            $show->field('company_id');
            $show->field('duration');
            $show->field('money');
            $show->field('rate');
            $show->field('fee');
            $show->field('borrow_min');
            $show->field('borrow_max');
            $show->field('repayment_times');
            $show->field('repayment_already_times');
            $show->field('repayment_type');
            $show->field('collect_day');
            $show->field('deal_time');
            $show->field('publish_time');
            $show->field('full_time');
            $show->field('redeal_time');
            $show->field('next_repaytime');
            $show->field('type');
            $show->field('area');
            $show->field('status');
            $show->field('use');
            $show->field('use_other');
            $show->field('deal_id');
            $show->field('deal_name');
            $show->field('deal_info');
            $show->field('redeal_id');
            $show->field('redeal_name');
            $show->field('redeal_info');
            $show->field('repayment_capital');
            $show->field('repayment_interest');
            $show->field('repayment_managefee');
            $show->field('repayment_overdue');
            $show->field('created_at');
            $show->field('updated_at');
        });
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        return Form::make(new Borrow(), function (Form $form) {
            $form->display('id');
            $form->select('type')->options(config('borrow.borrowType'));

            $form->text('title');
            $companies= Company::query()->get(['id', \DB::raw('name as text')]);
            foreach ($companies as $company){
                $data[$company->id]=$company['text'];
            }
            $form->select('company_id','选择公司')->options($data);
            $form->decimal('money');

            $form->select('duration')->options(config('borrow.borrowDuration'))->when([-7,-15,1],function (Form $form){
                $form->select('repayment_type')->options([5=>'一次性还款']);
            })->when([2,3,4,5],function (Form $form){
                $form->select('repayment_type')->options([4=>'按月还息到期还本',5=>'一次性还款']);
            })->when([6,7,8,9,10,11,12],function (Form $form){
                $form->select('repayment_type')->options([4=>'按月还息到期还本',6=>'按季还息到期还本',]);
            });
            //$form->text('rate');
            //$form->text('fee');
            //$form->text('borrow_min');
            //$form->text('borrow_max');
            //$form->text('repayment_times');
            //$form->text('repayment_already_times');

            //$form->text('collect_day');
            //$form->text('deal_time');
            //$form->text('publish_time');
            //$form->text('full_time');
            //$form->text('redeal_time');
            //$form->text('next_repaytime');

            //$form->text('area');
            //$form->text('status');
            $form->select('use')->options(config('borrow.use'));
            $form->text('use_other');
            /*
            $form->text('deal_id');
            $form->text('deal_name');
            $form->text('deal_info');
            $form->text('redeal_id');
            $form->text('redeal_name');
            $form->text('redeal_info');
            $form->text('repayment_capital');
            $form->text('repayment_interest');
            $form->text('repayment_managefee');
            $form->text('repayment_overdue');
        */

            $form->hidden('user_id');
            $form->hidden('repayment_times');
            $form->saving(function (Form $form){
                if($form->input('company_id')) {
                    $form->user_id=Company::find($form->input('company_id'))['user_id'];
                }
                if($form->input('repayment_type')) {
                    $form->repayment_times=$this->_howTimes($form->input('repayment_type'),$form->input('duration'));
                }
            });

            $form->display('created_at');
            $form->display('updated_at');
        });
    }
    /*
 *通过还款方式与借款期限，计算出还款期数 author 楠神 2016/12/19
 *@param $repayment_type int 还款方式
 *@param $duration int 借款期数
 *@return int
 */
    private function _howTimes($repayment_type,$duration){
        switch($repayment_type){
            case 2: return $duration; //按月等额本息还款
            case 3: return ceil($duration/3); //按季等额本息还款
            case 4: return $duration; //按月还息到期还本
            case 5: return 1; //一次性还款
            case 6: return ceil($duration/3); //按季还息到期还本
        }
    }


    public function binfo(Content $content,$id)
    {
        $content->row(function (Row $row) use ($id){
            $type = request('show_type', 1);
            $check=request('check', 0);
            $tab = new Tab();

            if ($type == 1) {
                $tab->add('融资信息', $this->form_info($id));
                $tab->addLink('风险控制', request()->fullUrlWithQuery(['show_type' => 2,'check'=>$check]));
                $tab->addLink('文件资料', request()->fullUrlWithQuery(['show_type' => 3,'check'=>$check]));
                $tab->addLink('初审信息', request()->fullUrlWithQuery(['show_type' => 4,'check'=>1]));
                $tab->addLink('复审信息', request()->fullUrlWithQuery(['show_type' => 5,'check'=>2]));
                $tab->addLink('返回列表', url('/admin/borrows'));
            } else if($type==2) {
                $tab->addLink('融资信息', request()->fullUrlWithQuery(['show_type' => 1,'check'=>$check]));
                $tab->add('风险控制', $this->form_safe($id), true);
                $tab->addLink('文件资料', request()->fullUrlWithQuery(['show_type' => 3,'check'=>$check]));
                $tab->addLink('初审信息', request()->fullUrlWithQuery(['show_type' => 4,'check'=>1]));
                $tab->addLink('复审信息', request()->fullUrlWithQuery(['show_type' => 5,'check'=>2]));
                $tab->addLink('返回列表', url('/admin/borrows'));
            }else if($type==3){
                $tab->addLink('融资信息', request()->fullUrlWithQuery(['show_type' => 1,'check'=>$check]));
                $tab->addLink('风险控制', request()->fullUrlWithQuery(['show_type' => 2,'check'=>$check]));
                $tab->add('文件资料', $this->form_file($id), true);
                $tab->addLink('初审信息', request()->fullUrlWithQuery(['show_type' => 4,'check'=>1]));
                $tab->addLink('复审信息', request()->fullUrlWithQuery(['show_type' => 5,'check'=>2]));
                $tab->addLink('返回列表', url('/admin/borrows'));
            }else if($type==4 && $check==1){
                $tab->addLink('融资信息', request()->fullUrlWithQuery(['show_type' => 1,'check'=>$check]));
                $tab->addLink('风险控制', request()->fullUrlWithQuery(['show_type' => 2,'check'=>$check]));
                $tab->addLink('文件资料', request()->fullUrlWithQuery(['show_type' => 3,'check'=>$check]));
                $tab->add('初审信息', $this->form_check($id),true);
                $tab->addLink('复审信息', request()->fullUrlWithQuery(['show_type' => 5,'check'=>2]));
                $tab->addLink('返回列表', url('/admin/borrows'));
            }
            else if($type==5 && $check==2){
                $tab->addLink('融资信息', request()->fullUrlWithQuery(['show_type' => 1,'check'=>$check]));
                $tab->addLink('风险控制', request()->fullUrlWithQuery(['show_type' => 2,'check'=>$check]));
                $tab->addLink('文件资料', request()->fullUrlWithQuery(['show_type' => 3,'check'=>$check]));
                $tab->addLink('初审信息', request()->fullUrlWithQuery(['show_type' => 4,'check'=>1]));
                $tab->add('复审信息', $this->form_recheck($id),true);
                $tab->addLink('返回列表', url('/admin/borrows'));
            }
            $row->column(12, $tab->withCard());
        });
        return $content
            ->header('补充资料');
    }
    protected function form_info($id)
    {
        $form = new \Dcat\Admin\Widgets\Form();
        $borrow=Borrow::query()->find($id)->toArray();
        $form->fill($borrow);
        $form->action(request()->fullUrl());
        $form->rate('rate')->default(9);
        $form->decimal('fee')->default(0);
        //$form->decimal('borrow_min')->default(100);
        //$form->decimal('borrow_max')->default(100000);
        $form->number('collect_day')->default(3);
        //$form->datetime('publish_time');
        $form->select('area')->options(config('borrow.borrowArea'))->default(1);
        $form->textarea('borrow_des','融资详情');
        $form->disableAjaxSubmit();
        $form->disableResetButton();
        if($borrow['status']==Borrow::STATUS_PENDING){

        }else{
            $form->disableSubmitButton();
        }
        //$form->
        //$form->hidden('deal_id')->default(Admin::user()->id);
        //$form->hidden('deal_name')->default(Admin::user()->name);
        //$form->hidden('deal_time')->default(Carbon::now());
        return "<div style='padding:9px 8px'>{$form->render()}</div>";
    }
    protected function form_file($id)
    {
        $form = new \Dcat\Admin\Widgets\Form();
        $form->action(request()->fullUrl());
        $borrow_info=BorrowInfo::query()->where('borrow_id',$id)->first();
        if($borrow_info){
            $data=$borrow_info->img;
            $form->fill($data);
        }
        $form->image('zjsyjh', '资金使用计划')->url('comm/files');
        $form->image('gdhjy', '股东会决议')->url('comm/files');
        $form->disableResetButton();
        $form->disableAjaxSubmit();

        return "<div style='padding:9px 8px'>{$form->render()}</div>";
    }
    protected function form_safe($id){
        $data=[['name'=>'还款来源','value'=>''],['name'=>'贷前调查','value'=>''],
            ['name'=>'风险评级','value'=>''],['name'=>'适合投资人群','value'=>''],
            ['name'=>'项目风险提示','value'=>'']];
        $borrow_info=BorrowInfo::query()->where('borrow_id',$id)->first();
        if($borrow_info){
            $data=$borrow_info->risk;
        }
        $form = new \Dcat\Admin\Widgets\Form();
        $form->action(request()->fullUrl());
        //$form->model()->risk=$data;
        $form->fill(['risk'=>$data]);
        $form->table('risk', function (Form\NestedForm $table) {
            $table->text('name','名称');
            $table->text('value','数值');
        });

        $form->disableResetButton();
        $form->disableAjaxSubmit();

        return "<div style='padding:10px 8px'>{$form->render()}</div>";
    }
    public function storeBinfo(Request $request,$id){
        $data=$request->all();
        if($data['show_type']==1){
            if($id){
                $borrow=Borrow::find($id);
                $borrow->update($request->except(['show_type','_token']));
            }
        }else if($data['show_type']==2){
            $risk=[];
            foreach ($data['risk'] as $item){
                if($item['value'] && $item['_remove_']==0){
                    $risk[]=['name'=>$item['name'],'value'=>$item['value']];
                }
            }
            $this->saveBorrowInfo($id,'risk',$risk);
        } else if($data['show_type']==3){
            $img=[];
            if(isset($data['zjsyjh'])){
                $img['zjsyjh']=\Storage::disk('public')->url($data['zjsyjh']);
            }
            if(isset($data['gdhjy'])){
                $img['gdhjy']=\Storage::disk('public')->url($data['gdhjy']);
            }
            if(count($img)>0){
                $this->saveBorrowInfo($id,'img',$img);
            }
        }else if($data['show_type']=='4'){
            if($id){
                $borrow=Borrow::find($id);
                $info=$request->except(['show_type','_token']);
                if($data['opt']==1){
                    $info['status']=Borrow::STATUS_BIDDING;
                }
                $borrow->update($info);
            }
        }else if($data['show_type']=='5'){
            if($id){
                $borrow=Borrow::with('user')->find($id);
                $info=$request->except(['show_type','_token']);
                if($data['opt']==1){
                    $info['status']=Borrow::STATUS_SUCCESS;
                    $info['next_repaytime']=app(BorrowsService::class)->getPass($borrow);
                }else{
                    $info['status']=Borrow::STATUS_REDEALFAIL;
                    app(BorrowsService::class)->getFail($borrow);
                }
                $borrow->update($info);
                //生成还款计划，修改投资记录表和融资信息
            }
        }
        return response()->redirectTo($request->fullUrl());
    }
    private function saveBorrowInfo($borrow_id,$filed,$filedValue){
        $borrow_info=BorrowInfo::query()->where('borrow_id',$borrow_id)->first();
        if($borrow_info){
            $borrow_info->update(["$filed"=>$filedValue]);
        }
        else{
            $borrow_info=new BorrowInfo();
            $borrow_info["$filed"]=$filedValue;
            $borrow_info->borrow()->associate($borrow_id);
            $borrow_info->save();
        }
    }

    protected function form_check($id)
    {
        $form = new \Dcat\Admin\Widgets\Form();
        $borrow=Borrow::query()->find($id)->toArray();
        $form->fill($borrow);
        $form->action(request()->fullUrl());
        $form->datetime('publish_time')->default(Carbon::now()->addDays($borrow['collect_day']));;
        $form->textarea('deal_info','审核意见');
        $opt=1;
        if($borrow['status']==Borrow::STATUS_DEALFAIL ){
            $opt=2;
        }
        $form->radio('opt','是否同意')->options([1=>'同意',2=>'不同意'])->default($opt);
        $form->disableAjaxSubmit();
        $form->disableResetButton();
        $form->hidden('deal_id')->default(Admin::user()->id);
        $form->hidden('deal_name')->default(Admin::user()->name);
        $form->hidden('deal_time')->default(Carbon::now());
        if($borrow['status']==Borrow::STATUS_PENDING ){

        }else{
            $form->disableSubmitButton();
        }
        return "<div style='padding:9px 8px'>{$form->render()}</div>";
    }
    protected function form_recheck($id)
    {
        $form = new \Dcat\Admin\Widgets\Form();
        $info=Borrow::with('user')->find($id);
        $borrow=$info->toArray();
        $form->fill($borrow);
        $form->action(request()->fullUrl());
        $form->textarea('redeal_info','审核意见');
        $opt=1;
        if($borrow['status']==Borrow::STATUS_REDEALFAIL ){
            $opt=2;
        }
        $form->radio('opt','是否同意')->options([1=>'同意',2=>'不同意'])->default($opt);
        $form->disableAjaxSubmit();
        $form->disableResetButton();
        $form->hidden('redeal_id')->default(Admin::user()->id);
        $form->hidden('redeal_name')->default(Admin::user()->name);
        $form->hidden('redeal_time')->default(Carbon::now());
        if($borrow['status']==Borrow::STATUS_BIDSUCCESS ){

        }else{
            $form->disableSubmitButton();
        }
        return "<div style='padding:9px 8px'>{$form->render()}</div>";
    }
}
