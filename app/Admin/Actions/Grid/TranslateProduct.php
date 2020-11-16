<?php

namespace App\Admin\Actions\Grid;

use App\Admin\Forms\ProductActive;
use App\Admin\Forms\ProductDiscount;
use App\Models\Product;
use Dcat\Admin\Actions\Response;
use Dcat\Admin\Admin;
use Dcat\Admin\Grid\RowAction;
use Dcat\Admin\Traits\HasPermissions;
use Illuminate\Contracts\Auth\Authenticatable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;

class TranslateProduct extends RowAction
{
    protected $type;

    public function __construct(string $type = null)
    {
        $this->type = $type;
    }
    /**
     * @return string
     */
	//protected $title = '转化';

    public function render()
    {
        $id = "{$this->type}-trans-product-{$this->getKey()}";
        switch ($this->type)
        {
            case Product::TYPE_ACTIVE:
                $actio_nname = '搞活动';
                break;
            case Product::TYPE_CROWDFUNDING:
                $actio_nname = '众筹';
                break;
            case Product::TYPE_SECKILL:
                $actio_nname ='秒杀';
                break;
            case Product::TYPE_DISCOUNT:
                $actio_nname ='折扣商品';
                break;

        }
        // 模态窗
        $this->modal($id);

        return <<<HTML
<span class="grid-expand" data-toggle="modal" data-target="#{$id}">
   <a href="javascript:void(0)">{$actio_nname}</a>
</span>
HTML;
    }
    /**
     * Handle the action request.
     *
     * @param Request $request
     *
     * @return Response
     */
    /*
    public function handle(Request $request)
    {
        // dump($this->getKey());

        return $this->response()
            ->success('Processed successfully: '.$this->getKey())
            ->redirect('/');
    }
*/
    protected function modal($id)
    {
        // 工具表单
        switch ($this->type)
        {
            case Product::TYPE_DISCOUNT:
                $form = new ProductDiscount($this->getKey(),$this->type);
                break;
            default :
                $form = new ProductActive($this->getKey(),$this->type);
                break;

        }
        //$form = new ProductActive($this->getKey(),$this->type);

        // 在弹窗标题处显示当前行的用户名
        $title = $this->row->title;

        // 刷新页面时移除模态窗遮罩层
        // 从 v1.5.0 版本开始可以移除这段 JS 代码
        Admin::script('Dcat.onPjaxComplete(function () {
            $(".modal-backdrop").remove();
            $("body").removeClass("modal-open");
        }, true)');

        // 通过 Admin::html 方法设置模态窗HTML
        Admin::html(
            <<<HTML
<div class="modal fade" id="{$id}">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">{$title}</h4>
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
}
