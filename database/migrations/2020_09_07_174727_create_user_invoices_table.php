<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUserInvoicesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('user_invoices', function (Blueprint $table) {
            $table->id();
            $table->unsignedInteger('user_id')->comment('用户id');
            $table->foreign('user_id')->on('users')->references('id')->onDelete('cascade');
            $table->string('title')->comment('公司抬头');
            $table->string('duty_paragraph' )->comment('税号');
            $table->string('opening_bank')->comment('开户行')->default('');
            $table->string('address')->comment('地址及电话')->default('');
            $table->string('content')->comment('内容')->default('');
            $table->tinyInteger('is_default')->comment('默认')->default(0);
            $table->tinyInteger('type')->comment('类型 1企业 2个人');
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
        Schema::dropIfExists('user_invoices');
    }
}
