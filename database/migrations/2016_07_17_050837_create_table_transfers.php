<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTableTransfers extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('transfers', function(Blueprint $table){
            $table->increments('id');
            $table->integer('user_from_id')->comment('Who sent money');
            $table->integer('user_to_id')->comment('Who recieves money');
            $table->decimal('amount', 10, 2)->comment('amount of money');
            $table->string('token', 13)->comment('token for preventing double execution due to http bugs');
            $table->text('comment')->nullable()->comment('comment');
            $table->tinyInteger('status')->default(1)->comment('1 - done, 0 - not done.');
            $table->string('browser', 512)->comment('request sender browser info');
            $table->string('ip', 64)->comment('request sender IP');
            $table->timestamps();
            $table->unique(['token', 'user_from_id', 'user_to_id'], 'token_ufrom_uto');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('transfers');
    }
}
