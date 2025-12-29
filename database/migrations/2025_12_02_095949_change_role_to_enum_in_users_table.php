<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    public function up(): void
    {
        // Cách 1: Dùng enum native của MySQL (cứng nhất, không thêm được role lạ)
        Schema::table('users', function (Blueprint $table) {
            $table->dropColumn('role'); // nếu đã có cột cũ
        });

        Schema::table('users', function (Blueprint $table) {
            $table->enum('role', ['admin', 'guest'])
                  ->default('guest')
                  ->after('email');
        });

        // Đảm bảo tất cả user cũ đều là guest
        DB::statement("UPDATE users SET role = 'guest' WHERE role IS NULL OR role NOT IN ('admin', 'guest')");
    }

    public function down(): void
    {
        Schema::table('users', function (Blueprint $table) {
            $table->dropColumn('role');
        });
        Schema::table('users', function (Blueprint $table) {
            $table->string('role')->default('guest');
        });
    }
};