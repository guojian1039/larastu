<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBorrowsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('borrows', function (Blueprint $table) {
            $table->id();
            $table->string('title');
            $table->unsignedBigInteger('user_id');
            $table->unsignedBigInteger('company_id');
            $table->smallInteger('duration')->default(0)
                ->comment('借款期限 正数单位为月 负数单位为天');
            $table->decimal('money',15,2)->default(0);
            $table->decimal('rate',15,2)->default(0);
            $table->decimal('fee',15,2)->default(0);
            $table->tinyInteger('repayment_times')->comment('还款次数，就是总共需要还几期');
            $table->tinyInteger('repayment_already_times')->default(0)->comment('已还完第几期');
            $table->string('repayment_type')->comment('还款方式');
            $table->tinyInteger('collect_day')->default(3)->comment('募集时间(天) 标保持状态2几天');
            $table->dateTime('deal_time')->nullable()->comment('初审时间');
            $table->dateTime('publish_time')->nullable()->comment('初审过后的发布时间-投标生效时间,立即生效就是初审时间');
            $table->dateTime('full_time')->nullable()->comment('满标时间');
            $table->dateTime('redeal_time')->nullable()->comment('复审时间');
            $table->dateTime('next_repaytime')->nullable()->comment('下次还款时间');
            $table->string('type')->comment('分类');
            $table->string('area')->comment('专区')->default(1);
            $table->string('status')->comment('状态')->default(\App\Models\Borrow::STATUS_PENDING);
            $table->string('use')->comment('用途');
            $table->string('use_other')->nullable()->comment('其他用途说明');

            $table->integer('deal_id')->default(0)->comment('初审人');
            $table->string('deal_name')->nullable()->comment('初审人');
            $table->string('deal_info')->nullable()->comment('初审');
            $table->integer('redeal_id')->default(0)->comment('复审人');
            $table->string('redeal_name')->nullable()->comment('复审人');
            $table->string('redeal_info')->nullable()->comment('复审');
            $table->decimal('repayment_capital',15,2)->default(0)->comment('归还本金');
            $table->decimal('repayment_interest',15,2)->default(0)->comment('归还利息');
            $table->decimal('repayment_managefee',15,2)->default(0)->comment('逾期管理费');
            $table->decimal('repayment_overdue',15,2)->default(0)->comment('逾期罚息费');

            $table->text('borrow_des')->comment('融资概述');
            $table->tinyInteger('overtimes')->default(0)->comment('逾期数');
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
        Schema::dropIfExists('borrows');
    }
}
