<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('gedung', function (Blueprint $table) {
            $table->id();
            $table->text('name');
            $table->text('description');
            $table->text('price');
            $table->text('total_gedung');
            $table->text('amenities')->nullable();
            $table->text('size')->nullable();
            $table->text('total_guests')->nullable();
            $table->text('featured_photo');
            $table->text('video_id')->nullable();
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
        Schema::dropIfExists('gedung');
    }
};
