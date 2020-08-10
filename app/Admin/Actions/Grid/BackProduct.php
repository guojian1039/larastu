<?php

namespace App\Admin\Actions\Grid;

use App\Models\Product;
use Dcat\Admin\Actions\Response;
use Dcat\Admin\Grid\RowAction;
use Dcat\Admin\Traits\HasPermissions;
use Illuminate\Contracts\Auth\Authenticatable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;

class BackProduct extends RowAction
{
    /**
     * @return string
     */
	protected $title = '取消';
    /*
    public function html()
    {
               return <<<HTML
            <i class="icon-circle"></i>
HTML;
    }*/
    protected $model;

    public function __construct(string $model = null)
    {
        $this->model = $model;
    }
    /**
     * Handle the action request.
     *
     * @param Request $request
     *
     * @return Response
     */
    public function handle(Request $request)
    {
        // 获取当前行ID
        $id = $this->getKey();

        $model = $request->get('model');

        // 转化为普通商品
        //$model::find($id)->update(['type'=>Product::TYPE_NORMAL]);
        Product::find($id)->update(['type'=>Product::TYPE_NORMAL]);
        if(!$model){
            $model::query()->where('product_id',$id)->delete();
        }
        // 返回响应结果并刷新页面
        return $this->response()->success("操作成功")->refresh();
    }

    /**
	 * @return string|array|void
	 */
	public function confirm()
	{
        return [
            // 确认弹窗 title
            "您确定要将本商品转为普通商品？",
            // 确认弹窗 content
            $this->row->title,
        ];
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
        return [
            // 把模型类名传递到接口
            'model' => $this->model,
        ];
    }
}
