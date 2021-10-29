-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 29, 2021 at 02:33 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `dkm_vote`
--

-- --------------------------------------------------------

--
-- Table structure for table `kpu_calon`
--

CREATE TABLE `kpu_calon` (
  `id` int(11) NOT NULL,
  `npm` int(11) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `no_urut` int(11) DEFAULT NULL,
  `visi` text DEFAULT NULL,
  `misi` text DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '0 dibuat | 1 tidak aktif | 2 aktif | 3 deleted',
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kpu_calon`
--

INSERT INTO `kpu_calon` (`id`, `npm`, `nama`, `photo`, `no_urut`, `visi`, `misi`, `status`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2147483647, 'Isep Lutpi Nur', 'd2e63d3526bf202997ba38d7298ed6e4.jpg', 1, '<ul><li>Tes</li><li>sdfasdf</li><li>asdfasdf</li><li>fasdf</li></ul>', '<p>tes</p>', 1, 1, NULL, NULL, '2021-10-29 00:03:53', '2021-10-29 04:01:25', NULL),
(3, 1, '1', NULL, 1, '<p>sadfasdf</p>', '<p>sdaf</p>', 3, 1, NULL, 1, '2021-10-29 00:37:10', '2021-10-29 01:16:28', '2021-10-29 01:16:28'),
(4, 2147483647, 'Ketua Dua', '45a024fd187a1b92e2e6637090e4c931.png', 2, 'Melaksanakan kegiatan yang dapat meningkatkan hubungan positif antar guru dan siswa\r\nMenciptkan kondisi lingkungan sekolah yang kondusif dalam belajar, untuk menghasilkan siswa yang berkompetensi dan mandiri\r\nMengaktifkan kelompok belajar dari masing-masing kelas\r\nMemaksimalkan peran siswa dalam menjaga kebersihan lingkungan\r\nMemajukan kualitas ekskul di sekolah agar banyak diminati siswa dan mampu mengukir prestasi diluar sekolah\r\nMengadakan kerjasama dengan sekolah lain dari sisi akademik, olah raga dan seni\r\nMembentuk karakter siswa yang unggul dari SQ. IQ, EQ\r\nMenjalin kerja sama dengan organisasi internal sekolah lainnya untuk memicu kreatifitas siswa\r\nAktif menyerap dan berbagi informasi tentang kondisi dunia pendidikan\r\nMenjadi jembatan siswa berprestasi untuk mendapatkan beasiswa', '<ol><li>Membentuk wadah belajar kelompok terpadu bagi siswa.\r\n</li><li>Menyelenggarakan perlombaan yang mendidik.\r\n</li><li>Menyelenggarakan kegiatan masa orientasi siswa yang jauh dari kesan pembodohan.\r\n</li><li>Aktif belajar di media sosial seperti Brainly, Edmodo, dan Quipper.</li><li>\r\nIkut membantu penyelenggaran kegiatan hari besar keagamaan.</li></ol>', 1, 1, NULL, NULL, '2021-10-29 00:38:15', '2021-10-29 03:01:22', NULL),
(5, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2021-10-29 02:57:53', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kpu_kunci`
--

CREATE TABLE `kpu_kunci` (
  `id` int(11) NOT NULL,
  `nilai` int(11) NOT NULL COMMENT '0 dibuka | 1 Ditutup'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kpu_kunci`
--

INSERT INTO `kpu_kunci` (`id`, `nilai`) VALUES
(1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `kpu_pemilih`
--

CREATE TABLE `kpu_pemilih` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `npp` varchar(255) DEFAULT NULL,
  `token` varchar(11) DEFAULT NULL,
  `keterangan` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '0 tidak aktif | 1 aktif',
  `last_login` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kpu_pemilih`
--

INSERT INTO `kpu_pemilih` (`id`, `nama`, `npp`, `token`, `keterangan`, `status`, `last_login`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, 'Isep Lutpi Nurs', 'UA202110s', 'CPYZMF4', '', 1, '2021-10-29 06:18:39', 1, 1, NULL, '2021-10-29 01:59:38', '2021-10-29 06:18:39', NULL),
(4, 'Pemilih dua', 'UA2021101', 'UZ8D0WQ', 'Pemilih dua', 1, '2021-10-29 06:20:57', 1, NULL, NULL, '2021-10-29 03:01:51', '2021-10-29 06:20:57', NULL),
(5, 'Pemilih Tiga', 'UA202110', 'BZXOL8I', 'adfasdfsdaf', 1, '2021-10-29 07:33:17', 1, NULL, NULL, '2021-10-29 03:02:00', '2021-10-29 07:33:17', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kpu_pemilihan`
--

CREATE TABLE `kpu_pemilihan` (
  `id` int(11) NOT NULL,
  `id_pemilih` int(11) DEFAULT NULL,
  `id_calon` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '0 tidak aktif | 1 aktif',
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kpu_pemilihan`
--

INSERT INTO `kpu_pemilihan` (`id`, `id_pemilih`, `id_calon`, `status`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 4, 1, 1, NULL, NULL, NULL, '2021-10-29 06:44:06', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

CREATE TABLE `level` (
  `lev_id` int(11) NOT NULL,
  `lev_nama` varchar(50) NOT NULL,
  `lev_keterangan` text NOT NULL,
  `lev_status` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `level`
--

INSERT INTO `level` (`lev_id`, `lev_nama`, `lev_keterangan`, `lev_status`, `created_at`) VALUES
(1, 'Super Admin', 'Super Admin', 'Aktif', '2020-06-18 09:40:31'),
(127, 'Pemilih', 'Pemilih', 'Aktif', '2021-10-28 20:16:12');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `menu_id` int(11) NOT NULL,
  `menu_menu_id` int(11) NOT NULL,
  `menu_nama` varchar(50) NOT NULL,
  `menu_keterangan` text NOT NULL,
  `menu_index` int(11) NOT NULL,
  `menu_icon` varchar(50) NOT NULL,
  `menu_url` varchar(100) NOT NULL,
  `menu_status` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`menu_id`, `menu_menu_id`, `menu_nama`, `menu_keterangan`, `menu_index`, `menu_icon`, `menu_url`, `menu_status`, `created_at`) VALUES
(1, 0, 'Dashboard', '-', 1, 'fa fa-suitcase', 'dashboard', 'Aktif', '2020-06-18 02:40:07'),
(2, 0, 'Pengaturan', '-', 6, 'fa fa-cogs', '#', 'Aktif', '2020-06-18 02:40:07'),
(4, 2, 'Menu', '-', 6, 'far fa-circle', 'pengaturan/menu', 'Aktif', '2020-06-18 02:40:07'),
(5, 2, 'Level', '-', 4, 'far fa-circle', 'pengaturan/level', 'Aktif', '2020-06-18 02:40:07'),
(6, 2, 'Pengguna', '-', 2, 'far fa-circle', 'pengaturan/pengguna', 'Aktif', '2020-06-18 02:40:07'),
(7, 2, 'Ganti Password', 'Ganti password', 3, 'fa fa-key', 'pengaturan/password', 'Aktif', '2021-06-28 08:34:14'),
(110, 0, 'Calon Ketua', 'Calon Ketua Umum\n', 1, 'fas fa-user', 'admin/CalonKetua', 'Aktif', '2021-10-28 17:04:18'),
(111, 0, 'Pemilih', '-', 2, ' fas fa-tasks', 'admin/pemilih', 'Aktif', '2021-10-28 18:27:32'),
(112, 0, 'Perhitungan Suara', '-', 3, 'far fa-comment', 'admin/Count', 'Aktif', '2021-10-28 19:46:03'),
(113, 2, 'Reset', '-', 1, 'far fa-circle', 'pengaturan/reset', 'Aktif', '2021-10-28 22:41:40'),
(114, 0, 'Kunci Pemungutan Suara', '1', 4, 'fas fa-key', 'admin/kunci', 'Aktif', '2021-10-28 23:24:00');

-- --------------------------------------------------------

--
-- Table structure for table `role_aplikasi`
--

CREATE TABLE `role_aplikasi` (
  `rola_id` int(11) NOT NULL,
  `rola_menu_id` int(11) NOT NULL,
  `rola_lev_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role_aplikasi`
--

INSERT INTO `role_aplikasi` (`rola_id`, `rola_menu_id`, `rola_lev_id`, `created_at`) VALUES
(229, 1, 1, '2021-10-28 22:24:48'),
(230, 110, 1, '2021-10-28 22:24:51'),
(231, 112, 1, '2021-10-28 22:24:54'),
(232, 111, 1, '2021-10-28 22:24:55'),
(234, 6, 1, '2021-10-28 22:24:57'),
(235, 7, 1, '2021-10-28 22:25:00'),
(236, 5, 1, '2021-10-28 22:25:01'),
(238, 4, 1, '2021-10-28 22:25:03'),
(239, 2, 1, '2021-10-28 22:25:10'),
(240, 113, 1, '2021-10-28 22:44:39'),
(241, 114, 1, '2021-10-28 23:24:05'),
(242, 1, 127, '2021-10-28 23:56:31');

-- --------------------------------------------------------

--
-- Table structure for table `role_users`
--

CREATE TABLE `role_users` (
  `role_id` int(11) NOT NULL,
  `role_user_id` int(11) NOT NULL,
  `role_lev_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role_users`
--

INSERT INTO `role_users` (`role_id`, `role_user_id`, `role_lev_id`, `created_at`) VALUES
(1, 1, 1, '2020-06-18 09:39:26');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `id_partner` int(11) DEFAULT NULL,
  `nik` varchar(30) DEFAULT NULL,
  `user_nama` varchar(50) NOT NULL,
  `user_tgl_lahir` date DEFAULT NULL,
  `user_jk` enum('Laki-Laki','Perempuan') DEFAULT NULL COMMENT 'Jenis Kelamin',
  `user_password` varchar(100) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `user_email_status` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0 Belum Diverifikasi | 1 Sudah Diverifikasi',
  `user_phone` varchar(15) NOT NULL,
  `user_foto` varchar(255) DEFAULT NULL,
  `user_status` int(1) NOT NULL DEFAULT 0 COMMENT '0 Tidak Aktif | 1 Aktif | 2 Pendding | 3 deleted',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `id_partner`, `nik`, `user_nama`, `user_tgl_lahir`, `user_jk`, `user_password`, `user_email`, `user_email_status`, `user_phone`, `user_foto`, `user_status`, `created_at`, `updated_at`) VALUES
(1, NULL, '1', 'Adjie Abdul Azis', NULL, NULL, '$2y$10$34NjNNzrzOHiYA/Wc54tt.n3TB9abQUM065ZueEMd/LDw2NewOFoG', 'administrator@gmail.com', '1', '08123123', NULL, 1, '2020-06-18 09:39:08', '2020-06-18 09:39:08');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kpu_calon`
--
ALTER TABLE `kpu_calon`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `deleted_by` (`deleted_by`);

--
-- Indexes for table `kpu_kunci`
--
ALTER TABLE `kpu_kunci`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kpu_pemilih`
--
ALTER TABLE `kpu_pemilih`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `deleted_by` (`deleted_by`);

--
-- Indexes for table `kpu_pemilihan`
--
ALTER TABLE `kpu_pemilihan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_pemilih` (`id_pemilih`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `deleted_by` (`deleted_by`);

--
-- Indexes for table `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`lev_id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`menu_id`);

--
-- Indexes for table `role_aplikasi`
--
ALTER TABLE `role_aplikasi`
  ADD PRIMARY KEY (`rola_id`);

--
-- Indexes for table `role_users`
--
ALTER TABLE `role_users`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kpu_calon`
--
ALTER TABLE `kpu_calon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `kpu_kunci`
--
ALTER TABLE `kpu_kunci`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kpu_pemilih`
--
ALTER TABLE `kpu_pemilih`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `kpu_pemilihan`
--
ALTER TABLE `kpu_pemilihan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `level`
--
ALTER TABLE `level`
  MODIFY `lev_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT for table `role_aplikasi`
--
ALTER TABLE `role_aplikasi`
  MODIFY `rola_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=243;

--
-- AUTO_INCREMENT for table `role_users`
--
ALTER TABLE `role_users`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kpu_calon`
--
ALTER TABLE `kpu_calon`
  ADD CONSTRAINT `kpu_calon_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `kpu_calon_ibfk_4` FOREIGN KEY (`updated_by`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `kpu_calon_ibfk_5` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `kpu_pemilih`
--
ALTER TABLE `kpu_pemilih`
  ADD CONSTRAINT `kpu_pemilih_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `kpu_pemilih_ibfk_4` FOREIGN KEY (`updated_by`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `kpu_pemilih_ibfk_5` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `kpu_pemilihan`
--
ALTER TABLE `kpu_pemilihan`
  ADD CONSTRAINT `kpu_pemilihan_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `kpu_pemilihan_ibfk_4` FOREIGN KEY (`updated_by`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `kpu_pemilihan_ibfk_5` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;
