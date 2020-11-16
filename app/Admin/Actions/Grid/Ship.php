<?php

namespace App\Admin\Actions\Grid;
use App\Admin\Forms\RefundForm;
use App\Admin\Forms\ShipForm;
use Dcat\Admin\Actions\Response;
use Dcat\Admin\Grid\RowAction;
use Dcat\Admin\Traits\HasPermissions;
use Illuminate\Contracts\Auth\Authenticatable;
use Dcat\Admin\Widgets\Modal;
use Illuminate\Http\Request;

class Ship extends RowAction
{

    /**
     * @return string
     */
	protected $title = '发货';

    public function render()
    {
        // 实例化表单类并传递自定义参数
        $form = ShipForm::make()->payload(['id' => $this->getKey()]);
        return Modal::make()
            ->lg()
            ->title($this->title)
            ->body($form)
            ->button($this->title);
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
