<?php

namespace App\Admin\Forms;
use App\Models\ProductPic;
use App\Models\SiteOpinion;
use Dcat\Admin\Widgets\Form;
use Symfony\Component\HttpFoundation\Response;

class Reply extends Form
{
    protected $opinion_id;
    public function __construct(int $opinion_id=0)
    {
        $this->opinion_id=$opinion_id;
        parent::__construct();
    }
    /**
     * Handle the form request.
     *
     * @param array $input
     *
     * @return Response
     */
    public function handle(array $input)
    {
        $reply=$input['reply'];
        SiteOpinion::query()->where('id',$input['id'])->update(['reply'=>$reply]);
        return $this->success('操作成功', '/site_opinions');
    }

    /**
     * Build a form here.
     */
    public function form()
    {
        $this->hidden('id')->value($this->opinion_id);
        $this->text('reply','回复内容');
    }

    /**
     * The data of the form.
     *
     * @return array
     */
    public function default()
    {
        //$skus=ProductSku::query()->where('product_id',$this->product_id)->get();
       // return $skus->toArray();
        return [   ];
    }
}
