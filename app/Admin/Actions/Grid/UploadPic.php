<?php

namespace App\Admin\Actions\Grid;

use App\Admin\Forms\ProdPic;
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

class UploadPic extends RowAction
{
    protected $type;

    protected $product_id;
    public function __construct(int $product_id=0, string $type = null)
    {
        $this->type = $type;
        $this->product_id = $product_id;
    }
    /**
     * @return string
     */
	//protected $title = '转化';

    public function render()
    {
        $id = "upload-productpic";
        // 模态窗
        $this->modal($id);

        return <<<HTML
<span class="grid-expand" data-toggle="modal" data-target="#{$id}">
   <a href="javascript:void(0)">商品图片</a>
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

        $key=$this->product_id;
        if(!$key){
            $key=$this->getKey();
        }
        $form = new ProdPic($key,$this->type);

        // 在弹窗标题处显示
        $title = '商品图片';

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
