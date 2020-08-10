<?php

namespace App\Admin\Actions\Grid;
use Dcat\Admin\Actions\Response;
use Dcat\Admin\Grid\RowAction;
use Dcat\Admin\Traits\HasPermissions;
use Dcat\Admin\Widgets\Table;
use Illuminate\Contracts\Auth\Authenticatable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;

class ShowUserAddress extends RowAction
{
    /**
     * @return string
     */
	protected $title = '发货地址';

    /**
     * @var string
     */
    protected $modalId = 'show-user-address';
    /**
     * Handle the action request.
     *
     * @param Request $request
     *
     * @return Response
     */
    public function handle(Request $request)
    {
        $address=\App\Models\UserAddress::query()->where('user_id',$this->getKey())->get(['province','city','district','zip','contact_name','contact_phone']);
        if(count($address)>0)
        {
            $table=Table::make(['省份','城市','区域','邮编','联系人','联系电话'],$address->toArray());
            return $this->response()->html($table);
        }

        else{
            return $this->response()->error('未检索的相关数据');
        }
            //->html('Processed successfully: '.$this->getKey());
    }

    /**
     * 处理响应的HTML字符串，附加到弹窗节点中
     *
     * @return string
     */
    protected function handleHtmlResponse()
    {
        return <<<'JS'
function (target, html, data) {
    var $modal = $(target.data('target')); 

    $modal.find('.modal-body').html(html)
    $modal.modal('show')
} 
JS;
    }

    /**
     * 设置HTML标签的属性
     *
     * @return void
     */
    protected function setupHtmlAttributes()
    {
        // 添加class
        $this->addHtmlClass('btn btn-primary');

        // 保存弹窗的ID
        $this->setHtmlAttribute('data-target', '#'.$this->modalId);

        parent::setupHtmlAttributes();
    }

    /**
     * 设置按钮的HTML，这里我们需要附加上弹窗的HTML
     *
     * @return string|void
     */
    public function html()
    {
        // 按钮的html
        $html = parent::html();

        return <<<HTML
{$html}        
<div class="modal fade" id="{$this->modalId}" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">{$this->title()}</h4>
      </div>
      <div class="modal-body"></div>
    </div>
  </div>
</div>
HTML;
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
        //return ['user_id'=>$this->getKey()];
        return [];
    }
}
