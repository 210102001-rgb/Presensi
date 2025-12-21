# Troubleshooting: Data Absensi Tidak Masuk ke Database

## Masalah

Data absensi tidak tersimpan ke database meskipun tidak ada error.

## Kemungkinan Penyebab

### 1. **Tabel `attendances` Tidak Ada**

-   Migration belum dijalankan
-   Tabel tidak terbuat dengan benar

### 2. **Database Connection Issues**

-   Koneksi database bermasalah
-   Database tidak accessible

### 3. **Model/Validation Issues**

-   Fillable fields tidak sesuai
-   Validation gagal secara silent

### 4. **Transaction Issues**

-   Database transaction rollback
-   Constraint violations

## Solusi yang Sudah Diterapkan

### 1. **Enhanced Logging**

```php
// Di AttendanceController.php
try {
    $attendance = Attendance::updateOrCreate([...], [...]);
    Log::info('Attendance saved successfully:', [...]);
} catch (\Exception $e) {
    Log::error('Failed to save attendance:', [...]);
    return back()->withErrors(['message' => 'Gagal menyimpan presensi: ' . $e->getMessage()]);
}
```

### 2. **Database Migration**

-   File: `database/migrations/2025_01_21_000000_create_attendances_table.php`
-   Struktur tabel lengkap dengan semua field yang diperlukan

### 3. **Debug Scripts**

-   `test_database.php` - Test koneksi database
-   `fix_attendance_issue.php` - Comprehensive database check

## Langkah Troubleshooting

### 1. **Cek Database Connection**

```bash
php artisan tinker
>>> DB::connection()->getPdo();
```

### 2. **Cek Tabel Attendances**

```bash
php artisan tinker
>>> Schema::hasTable('attendances');
>>> DB::table('attendances')->count();
```

### 3. **Jalankan Migration**

```bash
php artisan migrate
php artisan migrate:status
```

### 4. **Cek Log Files**

```bash
tail -f storage/logs/laravel.log
```

### 5. **Test Manual Insert**

```bash
php artisan tinker
>>> Attendance::create([
    'teacher_id' => 1,
    'schedule_id' => 1,
    'date' => now()->toDateString(),
    'check_in_time' => now()->format('H:i:s'),
    'status' => 'hadir'
]);
```

## Debug Information

### Log Locations

-   `storage/logs/laravel.log` - Laravel logs
-   Browser console - JavaScript errors
-   Network tab - Request/response details

### Database Checks

1. **Table exists**: `SHOW TABLES LIKE 'attendances'`
2. **Table structure**: `DESCRIBE attendances`
3. **Data count**: `SELECT COUNT(*) FROM attendances`
4. **Latest records**: `SELECT * FROM attendances ORDER BY created_at DESC LIMIT 5`

### Common Issues

1. **Migration not run**: `php artisan migrate`
2. **Table missing columns**: Check migration files
3. **Foreign key constraints**: Check related tables exist
4. **Permission issues**: Check database user permissions
5. **Transaction rollback**: Check for constraint violations

## Testing Steps

### 1. **Manual Test**

1. Buka halaman attendance
2. Coba check-in dengan data valid
3. Cek log di `storage/logs/laravel.log`
4. Cek database langsung

### 2. **Database Direct Test**

```sql
-- Cek apakah data masuk
SELECT * FROM attendances ORDER BY created_at DESC LIMIT 10;

-- Cek struktur tabel
DESCRIBE attendances;

-- Cek foreign key constraints
SHOW CREATE TABLE attendances;
```

### 3. **Laravel Tinker Test**

```bash
php artisan tinker
>>> $attendance = new App\Models\Attendance();
>>> $attendance->teacher_id = 1;
>>> $attendance->schedule_id = 1;
>>> $attendance->date = now()->toDateString();
>>> $attendance->check_in_time = now()->format('H:i:s');
>>> $attendance->status = 'hadir';
>>> $attendance->save();
>>> echo "Saved with ID: " . $attendance->id;
```

## Jika Masih Bermasalah

1. **Check database permissions**
2. **Verify foreign key constraints**
3. **Check for silent validation failures**
4. **Review database transaction logs**
5. **Test with minimal data first**

## Quick Fix Commands

```bash
# Reset database
php artisan migrate:fresh

# Clear cache
php artisan cache:clear
php artisan config:clear

# Check routes
php artisan route:list | grep attendance

# Test database
php fix_attendance_issue.php
```
