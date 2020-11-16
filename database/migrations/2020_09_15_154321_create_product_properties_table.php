<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductPropertiesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('product_properties', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('product_id')->comment('商品编码');
            $table->foreign('product_id')->references('id')->on('products')->onDelete('cascade');
            $table->unsignedBigInteger('base_property_id')->comment('属性编码')->default(0);
            $table->foreign('base_property_id')->references('id')->on('base_properties')->onDelete('cascade');
            $table->unsignedBigInteger('base_property_item_id')->comment('属性编码')->default(0);
            $table->foreign('base_property_item_id')->references('id')->on('base_property_items')->onDelete('cascade');
            $table->string('title')->comment('参数名称');
            $table->string('prop_value')->comment('参数值');
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
        Schema::dropIfExists('product_properties');
    }
}
