<?php

namespace App\Models;
use App\Models\Traits\DefaultDatetimeFormat;
use Illuminate\Database\Eloquent\Model;

class ActiveProduct extends Model
{
    use DefaultDatetimeFormat;
    protected $fillable=['end_at'];
    protected $dates=['end_at'];
    public $timestamps=false;
    public function product()
    {
        return $this->belongsTo(Product::class);
    }
}
