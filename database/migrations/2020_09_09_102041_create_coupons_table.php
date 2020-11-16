<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCouponsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('coupons', function (Blueprint $table) {
            $table->id();
            $table->unsignedInteger('coupon_type_id')->comment('优惠券类型id');
            $table->string('code')->comment('优惠券编码');
            $table->unsignedBigInteger('user_id')->comment('领用人')->default(0);
            $table->unsignedBigInteger('use_order_id')->comment('优惠券使用订单id')->default(0);
            $table->unsignedBigInteger('create_order_id')->comment('创建订单id(优惠券只有是完成订单发放的优惠券时才有值)')->default(0);
            $table->tinyInteger('state')->comment('优惠券状态 0未领用 1已领用（未使用） 2已使用 3已过期')->default(0);
            $table->unsignedTinyInteger('get_type')->comment('获取方式1订单2.首页领取')->default(0);
            $table->dateTime('fetch_time')->comment('领取时间')->nullable();
            $table->dateTime('use_time')->comment('使用时间')->nullable();
            $table->dateTime('start_time')->comment('有效期开始时间')->nullable();
            $table->dateTime('end_time')->comment('有效期结束时间')->nullable();
            $table->tinyInteger('status')->comment('状态')->default(1);
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
        Schema::dropIfExists('coupons');
    }
}
