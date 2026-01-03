-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 03, 2025 at 08:25 AM
-- Server version: 8.4.3
-- PHP Version: 8.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `presensi_pengajar`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `id` bigint UNSIGNED NOT NULL,
  `teacher_id` bigint UNSIGNED NOT NULL,
  `schedule_id` bigint UNSIGNED NOT NULL,
  `date` date NOT NULL COMMENT 'Tanggal presensi',
  `check_in_time` time DEFAULT NULL,
  `check_out_time` time DEFAULT NULL,
  `check_in_latitude` decimal(10,8) DEFAULT NULL,
  `check_in_longitude` decimal(11,8) DEFAULT NULL,
  `check_out_latitude` decimal(10,8) DEFAULT NULL,
  `check_out_longitude` decimal(11,8) DEFAULT NULL,
  `check_in_selfie` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Foto selfie saat check-in',
  `check_out_selfie` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Foto selfie saat check-out',
  `status` enum('hadir','terlambat','izin','alpha') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'alpha',
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attendances`
--

INSERT INTO `attendances` (`id`, `teacher_id`, `schedule_id`, `date`, `check_in_time`, `check_out_time`, `check_in_latitude`, `check_in_longitude`, `check_out_latitude`, `check_out_longitude`, `check_in_selfie`, `check_out_selfie`, `status`, `notes`, `created_at`, `updated_at`) VALUES
(1, 2, 1, '2025-10-13', '07:58:00', '09:32:00', -7.55699540, 110.82425860, -7.55699540, 110.82425860, NULL, NULL, 'hadir', 'Tepat waktu', '2025-10-20 06:57:55', '2025-10-20 06:57:55'),
(2, 2, 2, '2025-10-13', '10:05:00', '11:35:00', -7.55699540, 110.82425860, -7.55699540, 110.82425860, NULL, NULL, 'terlambat', 'Terlambat 5 menit', '2025-10-20 06:57:55', '2025-10-20 06:57:55'),
(3, 3, 3, '2025-10-13', '12:58:00', '14:32:00', -7.55729540, 110.82455860, -7.55729540, 110.82455860, NULL, NULL, 'hadir', NULL, '2025-10-20 06:57:55', '2025-10-20 06:57:55'),
(5, 2, 5, '2025-10-14', '07:55:00', '09:33:00', -7.55709540, 110.82435860, -7.55709540, 110.82435860, NULL, NULL, 'hadir', NULL, '2025-10-20 06:57:55', '2025-10-20 06:57:55'),
(6, 3, 6, '2025-10-14', '10:02:00', '11:28:00', -7.55699540, 110.82425860, -7.55699540, 110.82425860, NULL, NULL, 'terlambat', NULL, '2025-10-20 06:57:55', '2025-10-20 06:57:55'),
(8, 2, 8, '2025-10-15', '08:01:00', '09:29:00', -7.55699540, 110.82425860, -7.55699540, 110.82425860, NULL, NULL, 'hadir', NULL, '2025-10-20 06:57:55', '2025-10-20 06:57:55'),
(9, 3, 9, '2025-10-15', '10:05:00', NULL, -7.55729540, 110.82455860, NULL, NULL, NULL, NULL, 'hadir', 'Sedang mengajar', '2025-10-20 06:57:55', '2025-10-20 06:57:55'),
(10, 4, 10, '2025-10-15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'alpha', 'Tidak hadir tanpa keterangan', '2025-10-20 06:57:55', '2025-10-20 06:57:55'),
(11, 2, 1, '2025-11-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'izin', 'Izin disetujui: Sakit bos ini', '2025-11-03 01:21:22', '2025-11-03 01:21:22');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leaves`
--

CREATE TABLE `leaves` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `schedule_id` bigint UNSIGNED DEFAULT NULL,
  `leave_date` date NOT NULL,
  `leave_type` enum('izin','sakit','cuti') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'izin',
  `reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attachment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('pending','approved','rejected') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `admin_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `approved_by` bigint UNSIGNED DEFAULT NULL,
  `approved_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `leaves`
--

INSERT INTO `leaves` (`id`, `user_id`, `schedule_id`, `leave_date`, `leave_type`, `reason`, `attachment`, `status`, `admin_note`, `approved_by`, `approved_at`, `created_at`, `updated_at`) VALUES
(2, 2, 14, '2025-10-31', 'izin', 'Sakit Ngafs', 'leaves/1761907152_FORMULIR_WISUDA_KE-34_UDB-210102001.pdf', 'approved', 'Saya setujui anda', 1, '2025-10-31 03:40:50', '2025-10-31 03:39:12', '2025-10-31 03:40:50'),
(3, 2, 1, '2025-11-03', 'sakit', 'Sakit bos ini', 'leaves/1762157739_Diagram blok.png', 'approved', 'oke nu', 1, '2025-11-03 01:21:22', '2025-11-03 01:15:40', '2025-11-03 01:21:22');

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Nama ruangan/lokasi',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `latitude` decimal(10,8) NOT NULL,
  `longitude` decimal(11,8) NOT NULL,
  `radius` int DEFAULT '50' COMMENT 'Radius validasi dalam meter',
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `name`, `description`, `latitude`, `longitude`, `radius`, `address`, `is_active`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Ruang Kelas A101', 'Ruang kelas lantai 1 gedung A untuk kelas reguler', -7.55699540, 110.82425860, 30, 'Gedung A Lantai 1, Jl. Slamet Riyadi No.1, Surakarta', 1, 2, '2025-10-20 06:57:55', '2025-10-20 06:57:55'),
(2, 'Ruang Kelas B201', 'Ruang kelas lantai 2 gedung B', -7.55719540, 110.82445860, 30, 'Gedung B Lantai 2, Jl. Slamet Riyadi No.1, Surakarta', 1, 2, '2025-10-20 06:57:55', '2025-10-20 06:57:55'),
(3, 'Lab Komputer', 'Laboratorium komputer dengan 40 unit PC', -7.55709540, 110.82435860, 25, 'Gedung B Lantai 2, Jl. Slamet Riyadi No.1, Surakarta', 1, 2, '2025-10-20 06:57:55', '2025-10-20 06:57:55'),
(4, 'Lab Fisika', 'Laboratorium fisika dan praktikum', -7.56086500, 110.82850300, 25, 'Gedung C Lantai 1, Jl. Slamet Riyadi No.1, Surakarta', 1, 3, '2025-10-20 06:57:55', '2025-11-03 00:50:58'),
(6, 'Perpustakaan', 'Perpustakaan pusat sekolah', -7.55739540, 110.82475860, 40, 'Gedung E Lantai 1-2, Jl. Slamet Riyadi No.1, Surakarta', 1, 2, '2025-10-20 06:57:55', '2025-10-20 06:57:55');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_01_20_000000_add_selfie_photos_to_attendances_table', 1),
(5, '2025_10_24_094749_add_selfie_photos_to_attendances_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `id` bigint UNSIGNED NOT NULL,
  `teacher_id` bigint UNSIGNED NOT NULL,
  `location_id` bigint UNSIGNED NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Mata pelajaran',
  `class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Kelas yang diajar',
  `day` enum('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time` time NOT NULL COMMENT 'Jam mulai',
  `end_time` time NOT NULL COMMENT 'Jam selesai',
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `schedules`
--

INSERT INTO `schedules` (`id`, `teacher_id`, `location_id`, `subject`, `class`, `day`, `start_time`, `end_time`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 'Matematika Dasar', '10A', 'Monday', '08:00:00', '09:30:00', 1, '2025-10-20 06:57:55', '2025-10-20 06:57:55'),
(2, 2, 1, 'Kalkulus', '11B', 'Monday', '10:00:00', '11:30:00', 1, '2025-10-20 06:57:55', '2025-10-20 06:57:55'),
(3, 3, 4, 'Fisika Dasar', '10A', 'Monday', '13:00:00', '14:30:00', 1, '2025-10-20 06:57:55', '2025-10-20 06:57:55'),
(5, 2, 3, 'Aljabar Linear', '12A', 'Tuesday', '08:00:00', '09:30:00', 1, '2025-10-20 06:57:55', '2025-10-20 06:57:55'),
(6, 3, 1, 'Fisika Lanjut', '11A', 'Tuesday', '10:00:00', '11:30:00', 1, '2025-10-20 06:57:55', '2025-10-20 06:57:55'),
(7, 4, 2, 'Sastra Indonesia', '11B', 'Tuesday', '13:00:00', '14:30:00', 1, '2025-10-20 06:57:55', '2025-10-20 06:57:55'),
(8, 2, 1, 'Matematika Dasar', '10A', 'Wednesday', '08:00:00', '09:30:00', 1, '2025-10-20 06:57:55', '2025-10-20 06:57:55'),
(9, 3, 4, 'Praktikum Fisika', '10A', 'Wednesday', '10:00:00', '12:00:00', 1, '2025-10-20 06:57:55', '2025-10-20 06:57:55'),
(10, 4, 2, 'Tata Bahasa', '12A', 'Wednesday', '13:00:00', '14:30:00', 1, '2025-10-20 06:57:55', '2025-10-20 06:57:55'),
(11, 2, 1, 'Kalkulus', '11B', 'Thursday', '08:00:00', '09:30:00', 1, '2025-10-20 06:57:55', '2025-10-20 06:57:55'),
(12, 3, 1, 'Fisika Kuantum', '12A', 'Thursday', '10:00:00', '11:30:00', 1, '2025-10-20 06:57:55', '2025-10-20 06:57:55'),
(14, 2, 1, 'Matematika Diskrit', '11A', 'Friday', '08:00:00', '09:30:00', 1, '2025-10-20 06:57:55', '2025-10-20 06:57:55'),
(15, 3, 4, 'Lab Fisika Modern', '12A', 'Friday', '10:00:00', '12:00:00', 1, '2025-10-20 06:57:55', '2025-10-20 06:57:55'),
(16, 4, 2, 'Bahasa Indonesia', '10A', 'Friday', '13:00:00', '14:30:00', 1, '2025-10-20 06:57:55', '2025-10-20 06:57:55');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('vCeWaABq3W2xLiwLs7JTJtiQjktLYnw51e49Dwza', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoibFZibjd1M3BpOU5TU3N0WjBsbU56bUZjQm1rMWs1WFBLUDhJNExuSyI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI3OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyO30=', 1762158227),
('ZolXm1XixdBgRN0rY2Ts2eFoYaHaw54EBEJqMcsC', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiajdBcW4zSklDamV6TjBJZmp3T2k3dlJ5Y09EWXVETFBGZXJqejBaQSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjI7fQ==', 1762158140);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Nomor Induk Pengajar',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('admin','pengajar') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'pengajar',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mata pelajaran yang diampu',
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) DEFAULT '1',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `nip`, `email_verified_at`, `password`, `role`, `phone`, `subject`, `address`, `is_active`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin System', 'admin@presensi.test', NULL, NULL, '$2y$12$NqqGCDnrpzA.1/DkkvakierzKKlCSxDMR8A9W5S7iO0rGG4u.bZCS', 'admin', '081234567890', NULL, NULL, 1, 'NoNSctWNPsoencSZ8FSp3n4jqRz99L56atckQ9WOlNmuOJHpINMcfReQI3fS', '2025-10-19 23:57:55', '2025-11-03 08:21:26'),
(2, 'Dr. Budi Santoso', 'budi@presensi.test', '198501012010011001', NULL, '$2y$12$iY.w0hcluDNgzJM.PGHksOUeYl8zmR/.kekFR.C7CRlpKyNLeX1BS', 'pengajar', '081234567891', 'Matematika', NULL, 1, 'R6yCzVqtnQtmT7lIFlwFnjGgXrWP5TxdpRU17jCxfpc4QKBDHvsxDCwKQftc', '2025-10-19 23:57:55', '2025-11-03 08:15:47'),
(3, 'Prof. Siti Nurhaliza', 'siti@presensi.test', '198502022010012002', NULL, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'pengajar', '081234567892', 'Fisika', NULL, 1, NULL, '2025-10-19 23:57:55', '2025-10-19 23:57:55'),
(4, 'Drs. Ahmad Dahlan', 'ahmad@presensi.test', '198503032010013003', NULL, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'pengajar', '081234567893', 'Bahasa Indonesia', NULL, 1, NULL, '2025-10-19 23:57:55', '2025-10-19 23:57:55');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_teacher_schedule_date` (`teacher_id`,`schedule_id`,`date`),
  ADD KEY `idx_attendances_teacher` (`teacher_id`),
  ADD KEY `idx_attendances_schedule` (`schedule_id`),
  ADD KEY `idx_attendances_date` (`date`),
  ADD KEY `idx_attendances_status` (`status`),
  ADD KEY `idx_attendances_teacher_date` (`teacher_id`,`date`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leaves`
--
ALTER TABLE `leaves`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `idx_locations_active` (`is_active`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_schedules_teacher` (`teacher_id`),
  ADD KEY `idx_schedules_location` (`location_id`),
  ADD KEY `idx_schedules_day` (`day`),
  ADD KEY `idx_schedules_teacher_day` (`teacher_id`,`day`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leaves`
--
ALTER TABLE `leaves`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendances`
--
ALTER TABLE `attendances`
  ADD CONSTRAINT `attendances_ibfk_2` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `schedules`
--
ALTER TABLE `schedules`
  ADD CONSTRAINT `schedules_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
