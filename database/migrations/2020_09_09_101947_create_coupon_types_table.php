<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCouponTypesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('coupon_types', function (Blueprint $table) {
            $table->id();
            $table->string('title')->comment('优惠券名称');
            $table->decimal('value',10,2)->comment('折扣')->default(0);
            $table->unsignedInteger('count')->comment('发放数量');
            $table->unsignedInteger('get_count')->comment('领取数量')->default(0);
            $table->tinyInteger('type')->comment('优惠券类型 1:满减;2:折扣');
            $table->decimal('at_least',10,2)->comment('满多少元使用 0代表无限制')->default(0);
            $table->tinyInteger('need_user_level')->comment('领取人会员等级')->default(0);
            $table->unsignedTinyInteger('range_type')->comment('使用范围2部分产品使用 1全场产品使用')->default(1);
            $table->dateTime('get_start_time')->comment('领取有效日期开始时间');
            $table->dateTime('get_end_time')->comment('领取有效日期结束时间');
            $table->dateTime('start_time')->comment('有效日期开始时间')->nullable();
            $table->dateTime('end_time')->comment('有效日期结束时间')->nullable();
            $table->tinyInteger('term_of_validity_type')->comment('有效期类型 0固定时间 1领取之日起')->default(0);
            $table->unsignedTinyInteger('fixed_term')->comment('领取之日起N天内有效')->default(1);
            $table->tinyInteger('status')->comment('状态[0:禁用;1启用]')->default(1);
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
        Schema::dropIfExists('coupon_types');
    }
}
