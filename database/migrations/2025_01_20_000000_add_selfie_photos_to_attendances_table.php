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
        Schema::table('attendances', function (Blueprint $table) {
            $table->string('check_in_selfie')->nullable()->after('check_out_longitude')->comment('Foto selfie saat check-in');
            $table->string('check_out_selfie')->nullable()->after('check_in_selfie')->comment('Foto selfie saat check-out');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('attendances', function (Blueprint $table) {
            $table->dropColumn(['check_in_selfie', 'check_out_selfie']);
        });
    }
};
