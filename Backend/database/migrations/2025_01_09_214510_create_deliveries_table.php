<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('deliveries', function (Blueprint $table) {
            $table->id();
            
            $table->foreignId('order_id')->constrained('orders')->onDelete('cascade');
            $table->string('name');
            $table->string('phone_number');
            $table->timestamp('expected_delivery_time');
            $table->enum('state', ['pending', 'on_the_way', 'delivered', 'canceled'])->default('pending');
            
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('deliveries');
    }
};
