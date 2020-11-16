<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCompaniesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('companies', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('user_id');
            $table->string('name')->comment('公司名称');
            $table->string('image')->comment('公司封面');
            $table->string('idcard')->comment('统一社会信用代码');
            $table->string('corporation')->comment('法人');
            $table->string('phone')->comment('电话');
            $table->string('yyzz')->comment('营业执照图片');
            $table->string('khxkz')->comment('开户许可证图片');
            $table->string('swdj')->comment('税务登记图片');
            $table->string('frsfz')->comment('法人身份证图片');
            $table->text('description')->comment('描述');
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
        Schema::dropIfExists('companies');
    }
}
