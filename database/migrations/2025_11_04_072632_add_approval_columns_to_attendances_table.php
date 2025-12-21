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
            $table->enum('approval_status', ['pending', 'approved', 'rejected'])
                  ->default('pending')
                  ->after('status')
                  ->comment('Status persetujuan admin');
            $table->text('approval_note')->nullable()->after('approval_status')->comment('Catatan dari admin');
            $table->unsignedBigInteger('approved_by')->nullable()->after('approval_note')->comment('Admin yang menyetujui/menolak');
            $table->timestamp('approved_at')->nullable()->after('approved_by')->comment('Waktu disetujui/ditolak');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('attendances', function (Blueprint $table) {
            $table->dropColumn(['approval_status', 'approval_note', 'approved_by', 'approved_at']);
        });
    }
};
