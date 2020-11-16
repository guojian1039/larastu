<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBorrowRepaymentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('borrow_repayments', function (Blueprint $table) {
            $table->id();
            $table->tinyInteger('batch');
            $table->unsignedBigInteger('borrow_id');
            $table->unsignedBigInteger('borrow_user_id');
            $table->unsignedBigInteger('borrow_invest_id');
            $table->unsignedBigInteger('borrow_invest_user_id');
            $table->unsignedBigInteger('help_uid')->comment('担保人替还')->default(0);
            $table->decimal('capital',15,2)->comment('本期应得本金')->default(0);
            $table->decimal('interest',15,2)->comment('本期应得利息')->default(0);
            $table->decimal('receive_capital',15,2)->comment('已得本金')->default(0);
            $table->decimal('receive_interest',15,2)->comment('已得利息')->default(0);
            $table->decimal('receive_overdue',15,2)->comment('已得违约金')->default(0);
            $table->string('status');
            $table->dateTime('deadline')->comment('最迟还款时间');
            $table->dateTime('repayment_time')->comment('还款时间')->nullable();
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
        Schema::dropIfExists('borrow_repayments');
    }
}
