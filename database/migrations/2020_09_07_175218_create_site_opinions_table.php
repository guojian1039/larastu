<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSiteOpinionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('site_opinions', function (Blueprint $table) {
            $table->id();
            $table->unsignedInteger('user_id')->comment('用户id');
            $table->foreign('user_id')->on('users')->references('id')->onDelete('cascade');
            $table->string('content')->comment('内容');
            $table->string('covers')->comment('反馈图片');
            $table->string('contact_way')->comment('联系方式');
            $table->string( 'reply')->comment('回复')->default('');
            $table->tinyInteger('type')->default(1)->comment('反馈类型');
            $table->string('from')->comment('来源');
            $table->unsignedInteger('sort')->comment('优先级（0-9）')->default(0);
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
        Schema::dropIfExists('site_opinions');
    }
}
