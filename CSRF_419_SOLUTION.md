# CSRF 419 Error - Solusi yang Diterapkan

## Masalah

Error 419 "Page Expired" sering muncul karena:

1. CSRF token tidak diperbarui saat navigasi SPA dengan Inertia.js
2. Session timeout setelah user idle
3. Token tidak sinkron antara frontend dan backend

## Solusi yang Diterapkan

### 1. HandleInertiaRequests Middleware

-   `csrf_token` sekarang menggunakan lazy evaluation (`fn() => csrf_token()`) untuk selalu mengirim token fresh di setiap request

### 2. Bootstrap.js Enhancement

-   Menambahkan event listener `router.on('navigate')` untuk update CSRF token otomatis setiap kali ada navigasi Inertia
-   Token diperbarui di axios headers dan meta tag

### 3. App.js Update

-   Inisialisasi CSRF token dari Inertia props saat aplikasi dimuat
-   Menyediakan method global untuk update token

### 4. Composable useCsrf

-   File baru: `resources/js/Composables/useCsrf.js`
-   Composable Vue untuk mengelola CSRF token secara reaktif
-   Otomatis mengupdate axios headers saat token berubah
-   Sudah diterapkan di `AppLayout.vue`

### 5. Error Handler

-   Interceptor axios tetap ada untuk reload halaman jika tetap terjadi 419
-   Memberikan fallback terakhir untuk mendapatkan token fresh

## Rekomendasi Tambahan

### Update file .env (opsional):

```env
SESSION_LIFETIME=720          # 12 jam (default 480 = 8 jam)
SESSION_EXPIRE_ON_CLOSE=false # Session tetap aktif walau browser ditutup
SESSION_SECURE_COOKIE=false   # Set true jika menggunakan HTTPS
```

### Jika masih ada masalah:

1. Clear cache: `php artisan config:clear && php artisan cache:clear`
2. Clear session: `php artisan session:flush` (akan logout semua user)
3. Pastikan folder `storage/framework/sessions` writable
4. Restart Laravel server dan Vite

## Testing

Untuk test apakah solusi bekerja:

1. Login ke aplikasi
2. Biarkan idle selama beberapa menit
3. Coba submit form atau navigasi
4. Seharusnya tidak muncul error 419 lagi

## File yang Dimodifikasi

-   ✅ `app/Http/Middleware/HandleInertiaRequests.php`
-   ✅ `resources/js/bootstrap.js`
-   ✅ `resources/js/app.js`
-   ✅ `resources/js/Layouts/AppLayout.vue`
-   ✅ `resources/js/Composables/useCsrf.js` (baru)
