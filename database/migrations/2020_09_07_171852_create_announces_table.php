<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAnnouncesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('announces', function (Blueprint $table) {
            $table->id();
            $table->string('title')->comment('标题');
            $table->string('content')->comment('消息内容');
            $table->string('cover')->comment( '封面')->nullable();
            $table->string('synopsis')->comment('概要');
            $table->unsignedInteger('view')->comment('浏览量')->default(0);
            $table->unsignedInteger('sender_id')->comment('发送者id');
            $table->string('sender_name')->comment('发送者name');
            $table->tinyInteger('status')->comment('状态')->default(0);

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
        Schema::dropIfExists('announces');
    }
}