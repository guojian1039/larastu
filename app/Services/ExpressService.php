<?php
namespace App\Services;
use App\Models\Order;
use App\Models\Transaction;
use Wythe\Logistics\Logistics;

class ExpressService{
    public function getInfo($express_no,$api='')
    {
        $logistics = new Logistics(config('express'));
        return $logistics->query($express_no,$api);
    }
}