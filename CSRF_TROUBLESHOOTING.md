# CSRF Token Error 419 - Troubleshooting Guide

## Masalah
Error 419 saat mengirim foto selfie untuk check-in/check-out.

## Penyebab Umum
1. CSRF token tidak dikirim dengan benar
2. Session driver bermasalah
3. Token expired atau tidak valid
4. Konfigurasi axios tidak benar

## Solusi yang Sudah Diterapkan

### 1. Perbaikan Axios Configuration
- File: `resources/js/bootstrap.js`
- Menambahkan CSRF token header otomatis
- Menambahkan interceptor untuk handle 419 error
- Auto-refresh token saat error
- Menambahkan console logging untuk debug

### 2. Perbaikan FormData Submission
- File: `resources/js/Pages/Attendance/Index.vue`
- Menambahkan CSRF token ke FormData
- Menambahkan X-CSRF-TOKEN header
- Memastikan token diambil dari meta tag

### 3. Session Configuration
- File: `config/session.php`
- Mengubah driver dari 'database' ke 'file'
- Menghindari masalah database session

### 4. Debugging
- Menambahkan logging di controller
- File: `app/Http/Controllers/AttendanceController.php`
- Log CSRF token dari request dan session
- Menambahkan debug session configuration

### 5. Test Routes
- `/csrf-token` - Get CSRF token
- `/test-csrf` - Test CSRF validation
- `/health` - Health check with CSRF token

## Testing Steps

### 1. Browser Developer Tools
1. Buka browser developer tools (F12)
2. Go to Network tab
3. Coba upload foto selfie
4. Periksa request headers:
   - Harus ada `X-CSRF-TOKEN` header
   - Harus ada `_token` di FormData
5. Periksa response:
   - Jika 419, cek log di `storage/logs/laravel.log`

### 2. Manual Testing
1. Buka `/csrf-token` untuk cek token
2. Buka `/health` untuk cek status
3. Buka `/public/test-csrf.html` untuk test manual
4. Periksa meta tag di HTML: `<meta name="csrf-token" content="...">`

### 3. Console Testing
Jalankan script di `test-csrf-manual.js` di browser console

## Debug Information

### Log Files
- `storage/logs/laravel.log` - Laravel logs
- Browser console - JavaScript errors
- Network tab - Request/response details

### Debug Routes
- `GET /csrf-token` - Get current CSRF token
- `POST /test-csrf` - Test CSRF validation
- `GET /health` - Health check

### Session Debug
- Session driver: `config('session.driver')`
- Session lifetime: `config('session.lifetime')`
- Session ID: `session()->getId()`

## Jika Masih Error

### 1. Clear Cache
```bash
php artisan cache:clear
php artisan config:clear
php artisan route:clear
php artisan view:clear
```

### 2. Check Configuration
- File `.env` untuk `SESSION_DRIVER=file`
- Permission folder `storage/framework/sessions`
- Check `config/session.php`

### 3. Restart Server
```bash
php artisan serve
```

### 4. Check Logs
```bash
tail -f storage/logs/laravel.log
```

## Alternative Solutions

Jika masih bermasalah, coba:
1. Gunakan cookie-based session
2. Disable CSRF untuk route tertentu (tidak disarankan)
3. Gunakan API token authentication
4. Check if session is working: `session()->getId()`

## Common Issues

1. **Session not working**: Check session driver and permissions
2. **Token mismatch**: Check if token is being sent correctly
3. **Session expired**: Check session lifetime configuration
4. **CORS issues**: Check if request is coming from same domain
