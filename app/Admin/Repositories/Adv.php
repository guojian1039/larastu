<?php

namespace App\Admin\Repositories;

use App\Models\Adv as Model;
use Dcat\Admin\Repositories\EloquentRepository;

class Adv extends EloquentRepository
{
    /**
     * Model.
     *
     * @var string
     */
    protected $eloquentClass = Model::class;
}
