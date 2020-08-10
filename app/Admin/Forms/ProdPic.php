<?php

namespace App\Admin\Forms;
use App\Models\ProductPic;
use Dcat\Admin\Widgets\Form;
use Symfony\Component\HttpFoundation\Response;

class ProdPic extends Form
{
    protected $product_id;
    protected $type;
    public function __construct(int $product_id=0,string $type=null)
    {
        $this->product_id=$product_id;
        $this->type=$type;
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
        $pic=new ProductPic();

        $pic->description=$input['description'];
        $pic->image=$input['image'];
        $pic->product()->associate($input['id']);
        $pic->save();
        return $this->success('操作成功', '/products');
    }

    /**
     * Build a form here.
     */
    public function form()
    {
        if($this->product_id>0)
        {
            $this->hidden('id')->value($this->product_id);
        }

        $this->text('description','描述');
        $this->image('image','图片')->rules('required|image')->uniqueName();
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
