<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAdvsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('advs', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('merchant_id')->nullable()->comment('商户id');
            $table->string('title')->comment('标题');
            $table->unsignedTinyInteger('is_title_show')->default(0)->comment('是否显示标题');
            $table->string('cover')->comment('封面图片');
            $table->string('location')->comment('广告位ID 广告类型，广告位置');
            $table->unsignedInteger('view')->comment('浏览量')->default(0);
            $table->string('silder_text')->comment('图片描述')->nullable();
            $table->dateTime('start_time')->comment('开始时间');
            $table->dateTime('end_time')->comment('结束时间');
            $table->string('jump_link')->comment('跳转链接')->nullable();
            $table->string('jump_type')->comment('跳转方式')->nullable();
            $table->tinyInteger('sort')->comment('优先级')->default(0);
            $table->tinyInteger('status')->comment('状态')->default(0);
            $table->unsignedInteger('width')->comment('宽度')->default(0);
            $table->unsignedInteger('height')->comment('高度')->default(0);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('advs');
    }
}
