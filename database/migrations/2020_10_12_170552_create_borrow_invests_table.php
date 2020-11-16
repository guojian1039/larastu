<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBorrowInvestsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('borrow_invests', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('user_id');
            $table->unsignedBigInteger('borrow_id');
            $table->unsignedBigInteger('borrow_user_id');
            $table->string('status');
            $table->unsignedBigInteger('parent_id')->default(0)->comment('转让');
            $table->unsignedInteger('transfer_id')->default(0)->comment('转让标');
            $table->decimal('invest_sum',15,2)->default(0)->comment('投资额');
            $table->decimal('capital',15,2)->default(0)->comment('应得本金');
            $table->decimal('interest',15,2)->default(0)->comment('应得利息');
            $table->decimal('receive_capital',15,2)->default(0)->comment('已得本金');
            $table->decimal('receive_interest',15,2)->default(0)->comment('已得利息');
            $table->decimal('receive_overdue',15,2)->default(0)->comment('已得违约金');

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
        Schema::dropIfExists('borrow_invests');
    }
}
