-- =====================================================
-- Create Leaves Table
-- Tabel untuk menyimpan data pengajuan izin pengajar
-- =====================================================

CREATE TABLE IF NOT EXISTS `leaves` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `user_id` BIGINT UNSIGNED NOT NULL COMMENT 'ID Pengajar yang mengajukan izin',
  `schedule_id` BIGINT UNSIGNED NULL COMMENT 'ID Jadwal terkait (opsional)',
  `leave_date` DATE NOT NULL COMMENT 'Tanggal izin',
  `leave_type` ENUM('izin', 'sakit', 'cuti') NOT NULL DEFAULT 'izin' COMMENT 'Jenis izin',
  `reason` TEXT NOT NULL COMMENT 'Alasan/keterangan izin',
  `attachment` VARCHAR(255) NULL COMMENT 'Path file lampiran (surat keterangan, dll)',
  `status` ENUM('pending', 'approved', 'rejected') NOT NULL DEFAULT 'pending' COMMENT 'Status persetujuan',
  `admin_note` TEXT NULL COMMENT 'Catatan dari admin',
  `approved_by` BIGINT UNSIGNED NULL COMMENT 'ID Admin yang menyetujui/menolak',
  `approved_at` TIMESTAMP NULL COMMENT 'Waktu persetujuan/penolakan',
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

  -- Foreign Keys
  CONSTRAINT `fk_leaves_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `users`(`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,

  CONSTRAINT `fk_leaves_schedule_id`
    FOREIGN KEY (`schedule_id`)
    REFERENCES `schedules`(`id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,

  CONSTRAINT `fk_leaves_approved_by`
    FOREIGN KEY (`approved_by`)
    REFERENCES `users`(`id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,

  -- Indexes untuk optimasi query
  INDEX `idx_leaves_user_date` (`user_id`, `leave_date`),
  INDEX `idx_leaves_status` (`status`),
  INDEX `idx_leaves_leave_date` (`leave_date`),
  INDEX `idx_leaves_schedule_id` (`schedule_id`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
COMMENT='Tabel untuk menyimpan data pengajuan izin pengajar';

-- =====================================================
-- Sample Data (Optional - for testing)
-- =====================================================

-- INSERT INTO `leaves`
-- (`user_id`, `schedule_id`, `leave_date`, `leave_type`, `reason`, `status`)
-- VALUES
-- (2, 1, '2025-11-01', 'sakit', 'Sakit demam tinggi, terlampir surat keterangan dokter', 'approved'),
-- (2, NULL, '2025-11-05', 'izin', 'Keperluan keluarga mendadak', 'pending');
