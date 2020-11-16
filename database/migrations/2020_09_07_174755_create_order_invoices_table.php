<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateOrderInvoicesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('order_invoices', function (Blueprint $table) {
            $table->id();
            $table->unsignedInteger('order_id')->comment('订单id');
            $table->foreign('order_id')->references('id')->on('order')->onDelete('cascade');
            $table->string('order_sn')->comment('订单编号');
            $table->unsignedInteger('user_id')->comment('用户id');
            $table->foreign('user_id')->on('users')->references('id')->onDelete('cascade');
            $table->string('username')->comment('买家会员名称');
            $table->string('title')->comment('公司抬头');
            $table->string('duty_paragraph' )->comment('税号');
            $table->string('opening_bank')->comment('开户行')->default('');
            $table->string('address')->comment('地址及电话')->default('');
            $table->string('content')->comment('内容')->default('');
            $table->decimal('tax_money')->comment('金额');
            $table->tinyInteger('type')->comment('类型 1企业 2个人');
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
        Schema::dropIfExists('order_invoices');
    }
}
