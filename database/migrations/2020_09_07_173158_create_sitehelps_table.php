<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSitehelpsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('sitehelps', function (Blueprint $table) {
            $table->id();
            $table->string('title')->comment('标题');
            $table->string('content')->comment('内容');
            $table->string('synopsis')->comment('概要');
            $table->unsignedInteger('view')->comment('浏览量');
            $table->unsignedInteger('sender_id')->comment('发送者id');
            $table->string('sender_name')->comment('发送者name');
            $table->unsignedInteger('sitehelp_type_id');
            $table->foreign('sitehelp_type_id')->references('id')->on('sitehelp_types')->onDelete('cascade');
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
        Schema::dropIfExists('sitehelps');
    }
}
