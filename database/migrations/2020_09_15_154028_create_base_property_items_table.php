<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBasePropertyItemsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('base_property_items', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('base_property_id')->comment('属性ID');
            $table->foreign('base_property_id')->references('id')->on('base_properties')->onDelete('cascade');
            $table->string('relvalue')->comment('属性对应相关数据');
            $table->tinyInteger('status')->comment('状态(-1:已删除,0:禁用,1:正常)')->default(1);
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
        Schema::dropIfExists('base_property_items');
    }
}
