# Presensi

Aplikasi Presensi berbasis web yang dibangun dengan Laravel PHP Framework.

## Fitur

- Manajemen data pengajar dan siswa
- Presensi online dengan QR Code
- Laporan presensi harian, mingguan, dan bulanan
- Ekspor data presensi ke Excel
- Dashboard interaktif

## Persyaratan Sistem

- PHP 8.2+
- Composer
- Node.js 18+
- SQLite / MySQL / PostgreSQL

## Instalasi

1. Clone repository ini
2. Salin file `.env.example` menjadi `.env`
3. Konfigurasi file `.env` sesuai dengan pengaturan database Anda
4. Jalankan `composer install`
5. Jalankan `npm install`
6. Generate key aplikasi dengan `php artisan key:generate`
7. Jalankan migrasi database: `php artisan migrate --seed`
8. Compile aset frontend: `npm run build`
9. Jalankan server development: `php artisan serve`

## Lisensi

Aplikasi ini bersifat open-source di bawah [MIT license](https://opensource.org/licenses/MIT).
