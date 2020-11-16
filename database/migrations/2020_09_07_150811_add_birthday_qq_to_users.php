<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddBirthdayQqToUsers extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('users', function (Blueprint $table) {
            $table->date('birthday')->nullable();
            $table->string('qq')->nullable();
            $table->tinyInteger('gender')->default(0);
            $table->unsignedInteger('scores')->default(0);
            $table->unsignedInteger('lock')->default(0);

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('users', function (Blueprint $table) {
            $table->dropColumn('birthday');
            $table->dropColumn('qq');
            $table->dropColumn('gender');
            $table->dropColumn('scores');
            $table->dropColumn('lock');
        });
    }
}
