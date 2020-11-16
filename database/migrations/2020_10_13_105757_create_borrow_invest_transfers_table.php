<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBorrowInvestTransfersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('borrow_invest_transfers', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('borrow_id');
            $table->tinyInteger('repayment_already_times')->comment('已还完第几期');
            $table->unsignedBigInteger('borrow_invest_id');
            $table->unsignedBigInteger('borrow_invest_user_id');
            $table->string('status')->comment('状态');
            $table->decimal('transfer_money',15,2)->comment('转让金额');
            $table->unsignedTinyInteger('transfer_day')->comment('转让天数');
            $table->decimal('transfer_fee',15,2)->default(0)->comment('转让管理、手续费');
            $table->decimal('transfer_rate',15,2)->default(0)->comment('转让率');
            $table->integer('deal_id')->default(0)->comment('初审人');
            $table->string('deal_name')->nullable()->comment('初审人');
            $table->string('deal_info')->nullable()->comment('初审');
            $table->dateTime('deal_time')->nullable()->comment('初审时间');
            $table->integer('redeal_id')->default(0)->comment('复审人');
            $table->string('redeal_name')->nullable()->comment('复审人');
            $table->string('redeal_info')->nullable()->comment('复审');
            $table->dateTime('redeal_time')->nullable()->comment('初审时间');
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
        Schema::dropIfExists('borrow_invest_transfers');
    }
}
