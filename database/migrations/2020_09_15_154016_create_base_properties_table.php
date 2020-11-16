<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBasePropertiesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('base_properties', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('category_id')->comment( '分类id');
            $table->string('title')->comment('模型名称');
            $table->tinyInteger('status')->comment( '状态(-1:已删除,0:禁用,1:正常)')->default(1);
            //$table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('base_properties');
    }
}
