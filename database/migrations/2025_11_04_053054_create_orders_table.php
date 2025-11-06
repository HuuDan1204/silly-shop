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
        Schema::create('orders', function (Blueprint $table) {
    $table->id();
    $table->foreignId('user_id')->constrained()->onDelete('cascade');
    $table->foreignId('voucher_id')->nullable()->constrained()->onDelete('set null');
    $table->string('name');
    $table->string('phone');
    $table->string('address');
    $table->decimal('total_amount', 10, 2);
    $table->decimal('final_amount', 10, 2);
    $table->enum('status', ['pending', 'confirmed', 'shipping', 'success', 'cancelled'])->default('pending');
    $table->enum('pay_method', ['COD', 'QR'])->nullable();
    $table->enum('status_pay', ['unpaid', 'paid', 'failed', 'cancelled', 'cod_paid'])->default('unpaid');
    $table->string('code_order', 16)->unique();
    $table->timestamps();
});

    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('orders');
    }
};
