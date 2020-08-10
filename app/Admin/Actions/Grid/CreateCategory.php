<?php

namespace App\Admin\Actions\Grid;

use App\Admin\Forms\category_create;
use Dcat\Admin\Actions\Response;
use Dcat\Admin\Admin;
use Dcat\Admin\Grid\RowAction;
use Dcat\Admin\Traits\HasPermissions;
use Illuminate\Contracts\Auth\Authenticatable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;

class CreateCategory extends RowAction
{
    /**
     * @return string
     */
	protected $title = '新增下级分类';


    /**
	 * @return string|array|void
	 */
	public function confirm()
	{
		// return ['Confirm?', 'contents'];
	}

    /**
     * @param Model|Authenticatable|HasPermissions|null $user
     *
     * @return bool
     */
    protected function authorize($user): bool
    {
        return true;
    }

    /**
     * @return array
     */
    protected function parameters()
    {
        return [];
    }
    public function render()
    {
        $id="create-category-{$this->getKey()}";
        //模态窗
        $this->modal($id);
        if($this->row->is_directory)
        return <<<HTML
        <span class="grid-expand" data-toggle="modal" data-target="#{$id}">
           <a href="javascript:void(0)">新增下级分类</a>
        </span>
HTML;
    }
    protected function modal($id){
        //表单
        $form=new category_create($this->getKey());
        // 在弹窗标题处显示当前行的信息
        $name = $this->row->name;
        // 通过 Admin::html 方法设置模态窗HTML
        Admin::html(
            <<<HTML
<div class="modal fade" id="{$id}">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
         <h4 class="modal-title">【{$name}】的下级分类</h4>
         <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
      <div class="modal-body">
        {$form->render()}
      </div>
    </div>
  </div>
</div>
HTML
        );
    }
}
