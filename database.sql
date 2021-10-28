-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 29, 2021 at 12:21 AM
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
-- Table structure for table `alamat`
--

CREATE TABLE `alamat` (
  `id` int(11) NOT NULL,
  `id_profile` int(11) NOT NULL,
  `id_jenis_alamat` int(11) NOT NULL,
  `alamat` text DEFAULT NULL,
  `domisili` varchar(100) NOT NULL,
  `tanggal_mulai` date DEFAULT NULL,
  `tanggal_selesai` date DEFAULT NULL,
  `status` char(1) NOT NULL COMMENT '0 = dibuat, 1 = aktif, 2 = tidak aktif',
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `alamat`
--

INSERT INTO `alamat` (`id`, `id_profile`, `id_jenis_alamat`, `alamat`, `domisili`, `tanggal_mulai`, `tanggal_selesai`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(4, 5, 0, '123', 'Bandung', '2021-10-22', '2021-10-16', '1', '2021-10-01', NULL, NULL),
(5, 6, 0, 'q', 'q', '2021-10-29', '2021-10-28', '1', '2021-10-01', NULL, NULL),
(6, 7, 0, 'Dekat kolam pancingan ikan', 'Cobolong Dago Bandung', '2021-10-05', '0000-00-00', '1', '2021-10-05', '2021-10-05', NULL),
(7, 8, 0, 'rumah deskripsi', 'Jl. Empang 2', '2021-09-29', '0000-00-00', '1', '2021-10-06', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `client_company`
--

CREATE TABLE `client_company` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `no_telepon` varchar(20) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `id_resiko` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `status` char(1) NOT NULL COMMENT '0 = dibuat, 1 = aktif, 2 = tidak aktif',
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `client_company`
--

INSERT INTO `client_company` (`id`, `nama`, `alamat`, `no_telepon`, `email`, `id_resiko`, `remark`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'BUMN1', 'Bandung', '0812512578', 'karya@gmail.com', 1, '', '1', '2021-09-28', '2021-10-06', NULL),
(2, 'BUMN2', 'Jakarta', '1727374', 'admin@bumn2.com', 1, '-', '1', '2021-10-06', '2021-10-08', '2021-10-06'),
(3, '1231', '-', '23234', 'ss@gmail.com', 1, '-', '3', '2021-10-08', '2021-10-08', '2021-10-08'),
(4, 'BUMN3', '-', '082131231', 'bumn3@gmail.com', 1, '-', '3', '2021-10-08', '2021-10-08', '2021-10-08'),
(5, 'BUMN3', 'BUMN3', '0851258125', 'BUMN@GMAIL.COM', 6, 'Penjelasan di sini', '3', '2021-10-11', '2021-10-11', '2021-10-11'),
(6, 'BUMN 3', 'JAKARTA, INDONESIA', '0851258125', 'bumn3@gmail.com', 7, 'Penjelasan di sini', '1', '2021-10-11', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `id_profile` int(11) DEFAULT NULL,
  `id_tipe_contact` int(11) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `status` char(1) NOT NULL COMMENT '0 = dibuat, 1 = aktif, 2 = tidak aktif',
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `id_profile`, `id_tipe_contact`, `keterangan`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(4, 5, 2147483647, '123', '1', '2021-10-01', '2021-10-01', NULL),
(5, 6, NULL, NULL, '1', '2021-10-01', NULL, NULL),
(6, 7, 2147483647, '@iseplutpinur', '1', '2021-10-01', '2021-10-05', NULL),
(7, 8, 81231231, '@soni', '1', '2021-10-05', '2021-10-08', NULL),
(8, 9, NULL, NULL, '1', '2021-10-08', NULL, NULL),
(9, 10, 2147483647, '-', '1', '2021-10-08', '2021-10-12', NULL),
(10, 11, 811, '-', '1', '2021-10-12', '2021-10-12', NULL),
(11, 12, 2147483647, '-', '1', '2021-10-12', '2021-10-12', NULL),
(12, 13, 2147483647, '-', '1', '2021-10-12', '2021-10-12', NULL),
(13, 14, 811, '-', '1', '2021-10-12', '2021-10-12', NULL),
(14, 15, 2147483647, '-', '1', '2021-10-12', '2021-10-12', NULL),
(15, 16, NULL, NULL, '1', '2021-10-12', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `data_formal`
--

CREATE TABLE `data_formal` (
  `id` int(11) NOT NULL,
  `id_profile` int(11) NOT NULL,
  `dtm_peristiwa_id` int(11) DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `tempat` varchar(50) DEFAULT NULL,
  `tanggal_data_formal` date DEFAULT NULL,
  `status` char(1) NOT NULL COMMENT '0 = dibuat, 1 = aktif, 2 = tidak aktif',
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_formal`
--

INSERT INTO `data_formal` (`id`, `id_profile`, `dtm_peristiwa_id`, `keterangan`, `tempat`, `tanggal_data_formal`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(4, 5, NULL, NULL, 'Bangladesh', '2000-08-10', '1', '2021-10-01', NULL, NULL),
(5, 6, NULL, NULL, 'q', '2021-10-29', '1', '2021-10-01', NULL, NULL),
(6, 7, 2, '123', 'Bandung', '2018-12-05', '1', '2021-10-05', '2021-10-05', NULL),
(7, 8, 2, 'lahir', 'Bandung', '2000-10-05', '1', '2021-10-06', NULL, NULL),
(8, 16, 3, 'jakarta', 'bandung', '2021-10-04', '1', '2021-10-15', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dtm_peristiwa`
--

CREATE TABLE `dtm_peristiwa` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `details` text NOT NULL,
  `status` int(1) NOT NULL COMMENT '0 Tidak Aktif | 1 Aktif | 2 Deleted',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dtm_peristiwa`
--

INSERT INTO `dtm_peristiwa` (`id`, `name`, `details`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 'Tanggal Lahir', 'Lahir', 1, '2021-10-05 08:15:02', '2021-10-06 22:33:41', NULL),
(3, 'Tanggal Join', '1223', 1, '2021-10-05 08:19:00', '2021-10-06 22:33:30', NULL),
(4, 'Tanggal Keluar', 'resign', 1, '2021-10-06 22:47:42', NULL, NULL),
(5, 'Tanggal Xx', '0x', 3, '2021-10-08 13:31:00', '2021-10-08 13:31:09', '2021-10-08 13:31:09');

-- --------------------------------------------------------

--
-- Table structure for table `gelar`
--

CREATE TABLE `gelar` (
  `id` int(11) NOT NULL,
  `id_profile` int(11) NOT NULL,
  `id_jenis_gelar` int(11) DEFAULT NULL,
  `tanggal_lulus` date NOT NULL,
  `lembaga` varchar(100) NOT NULL,
  `status` char(1) NOT NULL COMMENT '0 = dibuat, 1 = aktif, 2 = tidak aktif',
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gelar`
--

INSERT INTO `gelar` (`id`, `id_profile`, `id_jenis_gelar`, `tanggal_lulus`, `lembaga`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, 5, 0, '2021-10-01', 'd', '1', '2021-10-01', NULL, NULL),
(4, 6, 0, '2021-10-13', 'q', '1', '2021-10-01', NULL, NULL),
(5, 7, 0, '2021-10-05', 'USB YPKP', '1', '2021-10-05', NULL, NULL),
(6, 7, 0, '2024-12-31', 'USB YPKP', '1', '2021-10-05', NULL, NULL),
(7, 8, 0, '1999-10-05', 'Ui', '1', '2021-10-06', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jenis_alamat`
--

CREATE TABLE `jenis_alamat` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `status` int(1) NOT NULL COMMENT '0 Tidak Aktif | 1 Aktif | 2 Deleted',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jenis_alamat`
--

INSERT INTO `jenis_alamat` (`id`, `nama`, `keterangan`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Kost', 'Kost', 1, '2021-10-15 15:53:19', NULL, NULL),
(2, 'Domisili', 'Domisili', 1, '2021-10-15 15:53:57', NULL, NULL),
(3, 'b', 'b', 3, '2021-10-15 15:54:02', '2021-10-15 15:54:13', '2021-10-15 15:54:13'),
(4, 'Dummy', 'Detail Dummy', 3, '2021-10-15 15:55:14', '2021-10-15 15:55:21', '2021-10-15 15:55:21');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_gelar`
--

CREATE TABLE `jenis_gelar` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `status` int(1) NOT NULL COMMENT '0 Tidak Aktif | 1 Aktif | 2 Deleted',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jenis_gelar`
--

INSERT INTO `jenis_gelar` (`id`, `nama`, `keterangan`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Diploma', 'Diploma', 1, '2021-10-15 15:58:47', NULL, NULL),
(2, 'Sarjana', 'Sarjana', 1, '2021-10-15 15:58:54', NULL, NULL),
(3, 'Master', 'Master', 1, '2021-10-15 15:59:02', NULL, NULL),
(4, 'Doktor', 'Doktor', 1, '2021-10-15 15:59:09', NULL, NULL),
(5, 'Dummys', 'Detail Dummys', 3, '2021-10-15 16:00:03', '2021-10-15 16:00:11', '2021-10-15 16:00:11');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_membership`
--

CREATE TABLE `jenis_membership` (
  `id` int(11) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `status` char(1) NOT NULL COMMENT '0 = dibuat, 1 = aktif, 2 = tidak aktif',
  `id_level` int(11) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jenis_membership`
--

INSERT INTO `jenis_membership` (`id`, `nama`, `keterangan`, `status`, `id_level`, `created_at`, `updated_at`, `deleted_at`) VALUES
(8, 'Admin Staff', '-', '3', NULL, '2021-10-11', '2021-10-11', '2021-10-11'),
(9, 'Admin Staff', 'Admin Staff', '1', NULL, '2021-10-12', NULL, NULL),
(10, 'Partner L1', 'Partner L1', '1', NULL, '2021-10-12', NULL, NULL),
(11, 'Partner L2', 'Partner L2', '1', NULL, '2021-10-12', NULL, NULL);

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
-- Table structure for table `kpu_pemilih`
--

CREATE TABLE `kpu_pemilih` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `npp` varchar(255) DEFAULT NULL,
  `token` varchar(11) DEFAULT NULL,
  `keterangan` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '0 tidak aktif | 1 aktif',
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

INSERT INTO `kpu_pemilih` (`id`, `nama`, `npp`, `token`, `keterangan`, `status`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, 'Isep Lutpi Nurs', 'UA202110s', 'CPYZMF4', '', 1, 1, 1, NULL, '2021-10-29 01:59:38', '2021-10-29 02:00:24', NULL),
(4, 'Pemilih dua', 'UA2021101', 'UZ8D0WQ', 'Pemilih dua', 1, 1, NULL, NULL, '2021-10-29 03:01:51', NULL, NULL),
(5, 'Pemilih Tiga', 'UA202110', 'BZXOL8I', 'adfasdfsdaf', 1, 1, NULL, NULL, '2021-10-29 03:02:00', NULL, NULL);

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
(2, 5, 4, 1, NULL, NULL, NULL, '2021-10-29 05:20:46', NULL, NULL);

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
-- Table structure for table `membership`
--

CREATE TABLE `membership` (
  `id` int(11) NOT NULL,
  `id_profile` int(11) NOT NULL,
  `id_jenis_membership` int(11) NOT NULL,
  `id_approver` int(11) NOT NULL,
  `tanggal_anggota` date NOT NULL,
  `status` char(1) NOT NULL COMMENT '0 = dibuat, 1 = aktif, 2 = tidak aktif',
  `created_at` date DEFAULT current_timestamp(),
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `membership`
--

INSERT INTO `membership` (`id`, `id_profile`, `id_jenis_membership`, `id_approver`, `tanggal_anggota`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(17, 10, 10, 1, '2021-10-11', '1', '2021-10-11', NULL, NULL),
(21, 13, 11, 1, '2021-10-12', '1', '2021-10-12', NULL, NULL),
(24, 11, 10, 1, '2021-10-06', '1', '2021-10-13', NULL, NULL),
(25, 16, 9, 1, '2021-10-11', '1', '2021-10-15', NULL, NULL);

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
(3, 2, 'Hak Akses', '-', 5, 'far fa-circle', 'pengaturan/hakAkses', 'Aktif', '2020-06-18 02:40:07'),
(4, 2, 'Menu', '-', 6, 'far fa-circle', 'pengaturan/menu', 'Aktif', '2020-06-18 02:40:07'),
(5, 2, 'Level', '-', 4, 'far fa-circle', 'pengaturan/level', 'Aktif', '2020-06-18 02:40:07'),
(6, 2, 'Pengguna', '-', 2, 'far fa-circle', 'pengaturan/pengguna', 'Aktif', '2020-06-18 02:40:07'),
(7, 2, 'Ganti Password', 'Ganti password', 3, 'fa fa-key', 'pengaturan/password', 'Aktif', '2021-06-28 08:34:14'),
(82, 0, 'Master', '-', 8, 'fa fa-database', '#', 'Aktif', '2021-08-25 09:03:41'),
(96, 82, 'Company', '-', 1, 'fas fa-handshake', 'data-master/company', 'Aktif', '2021-09-23 05:26:15'),
(97, 0, 'P2PK', '-', 3, 'fas fa-money-check-alt', 'p2pk/listP2PK', 'Aktif', '2021-09-23 05:26:15'),
(98, 0, 'SPM', '-', 4, 'fas fa-tasks', '#', 'Aktif', '2021-09-23 05:26:15'),
(99, 0, 'Repository', '-', 5, 'fas fa-warehouse', '#', 'Aktif', '2021-09-23 05:26:15'),
(100, 0, 'Activity', '-', 5, 'fas fa-tasks', '#', 'Aktif', '2021-09-23 05:26:15'),
(101, 82, 'Resiko', '-', 2, 'fas fa-tasks', 'data-master/resiko', 'Aktif', '2021-09-23 05:32:02'),
(102, 82, 'Membership', '-', 3, 'fas fa-users', 'data-master/membership', 'Aktif', '2021-09-23 05:34:00'),
(103, 82, 'Tipe Kontak', '-', 4, 'fas fa-users', 'data-master/tipeKontak', 'Tidak Aktif', '2021-09-23 05:34:39'),
(104, 2, 'Users', '-', 1, 'fas fa-users', 'pengaturan/profile', 'Aktif', '2021-09-23 05:35:13'),
(106, 0, 'Partner', '-', 7, 'fas fa-users', 'data-master/partner', 'Aktif', '2021-09-28 07:15:00'),
(109, 82, 'Data Formal', 'List Peristiwa', 3, ' far fa-circle', 'data-master/peristiwa', 'Aktif', '2021-10-05 01:04:18'),
(110, 0, 'Calon Ketua', 'Calon Ketua Umum\n', 1, 'fas fa-user', 'admin/CalonKetua', 'Aktif', '2021-10-28 17:04:18'),
(111, 0, 'Pemilih', '-', 2, ' fas fa-tasks', 'admin/pemilih', 'Aktif', '2021-10-28 18:27:32'),
(112, 0, 'Perhitungan Suara', '-', 3, 'far fa-comment', 'admin/Count', 'Aktif', '2021-10-28 19:46:03');

-- --------------------------------------------------------

--
-- Table structure for table `p2pk`
--

CREATE TABLE `p2pk` (
  `id` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  `id_pic` int(11) NOT NULL,
  `status` char(1) NOT NULL COMMENT '0 = dibuat, 1 = aktif, 2 = tidak aktif',
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `p2pk_planning`
--

CREATE TABLE `p2pk_planning` (
  `id` int(11) NOT NULL,
  `id_p2pk` int(11) NOT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `deskripsi` varbinary(2000) DEFAULT NULL,
  `status` char(1) NOT NULL COMMENT '0 = dibuat, 1 = aktif, 2 = tidak aktif',
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `p2pk_planning_file`
--

CREATE TABLE `p2pk_planning_file` (
  `id` int(11) NOT NULL,
  `id_p2pk_planning` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `status` char(1) NOT NULL COMMENT '0 = dibuat, 1 = aktif, 2 = tidak aktif',
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `p2pk_proses_audit`
--

CREATE TABLE `p2pk_proses_audit` (
  `id` int(11) NOT NULL,
  `id_p2pk` int(11) NOT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `deskripsi` varbinary(2000) DEFAULT NULL,
  `status` char(1) NOT NULL COMMENT '0 = dibuat, 1 = aktif, 2 = tidak aktif',
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `p2pk_proses_audit_file`
--

CREATE TABLE `p2pk_proses_audit_file` (
  `id` int(11) NOT NULL,
  `id_p2pk_proses_audit` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `status` char(1) NOT NULL COMMENT '0 = dibuat, 1 = aktif, 2 = tidak aktif',
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `p2pk_report`
--

CREATE TABLE `p2pk_report` (
  `id` int(11) NOT NULL,
  `id_p2pk` int(11) NOT NULL,
  `report_phase` int(11) DEFAULT NULL,
  `status` char(1) NOT NULL COMMENT '0 = dibuat, 1 = aktif, 2 = tidak aktif',
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `p2pk_report_detail`
--

CREATE TABLE `p2pk_report_detail` (
  `id` int(11) NOT NULL,
  `id_p2pk_report` int(11) NOT NULL,
  `report_phase` int(11) DEFAULT NULL,
  `id_approval` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `tanggal_upload` date DEFAULT NULL,
  `tanggal_approval_diminta` date DEFAULT NULL,
  `file_komen` varchar(255) DEFAULT NULL,
  `tanggal_komentar_submit` date DEFAULT NULL,
  `status` char(1) NOT NULL COMMENT '0 = dibuat, 1 = aktif, 2 = tidak aktif',
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `partner`
--

CREATE TABLE `partner` (
  `id` int(11) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `no_telepon` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `lokasi` varchar(100) DEFAULT NULL,
  `status` char(1) NOT NULL COMMENT '0 = dibuat, 1 = aktif, 2 = tidak aktif',
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `partner`
--

INSERT INTO `partner` (`id`, `nama`, `no_telepon`, `email`, `lokasi`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 'KAP Cabang1', '085798132505', 'dodo@gmail.com', 'Bandung', '1', '2021-09-28', '2021-10-06', NULL),
(4, 'KAP Cabang 2', '085798132505', 'iseplutpi1008@gmail.com', 'Bandung', '1', '2021-10-05', '2021-10-06', NULL),
(5, 'M ilham solehudin', '085798132505', 'administrator@gmail.co', '123', '3', '2021-10-05', '2021-10-05', '2021-10-05'),
(7, 'kd2', '21312', 'kd@gmail.com2', 'ads2', '3', '2021-10-08', '2021-10-08', '2021-10-08'),
(8, 'kap3', '24234', 'kap3@gmail.com', '-', '3', '2021-10-08', '2021-10-08', '2021-10-08'),
(9, 'KAP Cabang 3', '73647273', 'kapcabang3@kap.com', 'Bintaro', '1', '2021-10-13', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `profesi`
--

CREATE TABLE `profesi` (
  `id` int(11) NOT NULL,
  `id_profile` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `status` char(1) NOT NULL COMMENT '0 = dibuat, 1 = aktif, 2 = tidak aktif',
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `id` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `nama_depan` varchar(50) DEFAULT NULL,
  `nama_belakang` varchar(100) DEFAULT NULL,
  `jenis_kelamin` char(1) DEFAULT NULL COMMENT '1 = laki-laki, 2 = perempuan',
  `photo` varchar(255) DEFAULT NULL,
  `status` char(1) NOT NULL COMMENT '0 = dibuat, 1 = aktif, 2 = tidak aktif, 3 deleted',
  `status_verifikasi` int(11) DEFAULT NULL,
  `tanggal_anggota` date DEFAULT NULL,
  `created_at` date DEFAULT current_timestamp(),
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`id`, `id_user`, `nama_depan`, `nama_belakang`, `jenis_kelamin`, `photo`, `status`, `status_verifikasi`, `tanggal_anggota`, `created_at`, `updated_at`, `deleted_at`) VALUES
(5, 36, 's', 's', '1', 'd4aca1d4cf997d9d55f7ccd90840c5dd.png', '3', 1, '2021-10-03', NULL, NULL, '2021-10-03'),
(6, 40, 's', 's', '1', 'b3666dade162cfe3fe3f93b5745ab9fc.png', '3', 1, '2021-10-03', NULL, NULL, '2021-10-05'),
(7, NULL, 'Isep', 'Lutpi Nur', '1', '2f67340de429a118964a6c424f22b2ea.png', '3', NULL, NULL, NULL, NULL, '2021-10-12'),
(8, 42, 'Soni', '1993', '1', '755c98838f63d7b266bfa3694cc549d0.png', '3', NULL, NULL, '2021-10-05', NULL, '2021-10-12'),
(9, 43, 'Hendrik', 'A', '1', '590e7ef49cca6f36191f1124ef4bc222.png', '3', NULL, NULL, '2021-10-08', NULL, '2021-10-12'),
(10, NULL, 'Robert', 'Sianipar', '1', NULL, '1', NULL, NULL, '2021-10-08', NULL, NULL),
(11, NULL, 'Eric', '', '1', NULL, '1', NULL, NULL, '2021-10-12', NULL, NULL),
(12, NULL, 'Novi', '', '1', NULL, '1', NULL, NULL, '2021-10-12', NULL, NULL),
(13, NULL, 'Hendrik', 'Marpaung', '1', NULL, '1', NULL, NULL, '2021-10-12', NULL, NULL),
(14, NULL, 'William', 'Bonar', '1', NULL, '1', NULL, NULL, '2021-10-12', NULL, NULL),
(15, NULL, 'Ahmad', '', '1', NULL, '1', NULL, NULL, '2021-10-12', NULL, NULL),
(16, NULL, 'Joni kap3', 'kap3Belakang', '1', '69ececeb863bf237ba492172c3e0ebbc.png', '1', NULL, NULL, '2021-10-12', NULL, NULL),
(17, NULL, 'Sonii', 'Setiiawan', '1', NULL, '1', NULL, NULL, '2021-10-13', NULL, NULL),
(18, NULL, 'nama depan', 'df', '1', NULL, '1', NULL, NULL, '2021-10-14', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `resiko`
--

CREATE TABLE `resiko` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `status` char(1) NOT NULL COMMENT '0 = dibuat, 1 = aktif, 2 = tidak aktif',
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `resiko`
--

INSERT INTO `resiko` (`id`, `nama`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'High', '1', '2021-09-28', '2021-09-28', NULL),
(2, 'Medium', '1', '2021-09-28', NULL, NULL),
(3, 'Low', '1', '2021-09-28', NULL, NULL),
(4, 'baru', '3', '2021-10-06', '2021-10-08', '2021-10-08'),
(5, 'TEST', '3', '2021-10-08', '2021-10-08', '2021-10-08'),
(6, 'Low', '1', '2021-10-11', NULL, NULL),
(7, 'Low', '1', '2021-10-11', NULL, NULL);

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
(1, 1, 1, '2021-07-14 12:27:04'),
(3, 4, 1, '2021-07-14 12:27:17'),
(4, 5, 1, '2021-07-14 12:27:25'),
(5, 6, 1, '2021-07-14 12:27:31'),
(6, 7, 1, '2021-07-14 12:27:37'),
(7, 2, 1, '2021-07-14 12:27:48'),
(16, 1, 3, '2021-07-14 13:08:09'),
(17, 7, 3, '2021-07-14 13:08:17'),
(28, 1, 4, '2021-07-14 13:11:37'),
(29, 7, 4, '2021-07-14 13:11:46'),
(36, 1, 5, '2021-07-14 13:13:49'),
(37, 7, 5, '2021-07-14 13:13:56'),
(40, 32, 5, '2021-07-14 13:14:57'),
(105, 74, 1, '2021-08-19 06:58:31'),
(141, 93, 1, '2021-09-17 03:49:15'),
(148, 96, 1, '2021-09-23 05:26:15'),
(153, 101, 1, '2021-09-23 05:32:46'),
(154, 102, 1, '2021-09-23 05:35:34'),
(160, 109, 1, '2021-10-05 01:04:39'),
(163, 97, 14, '2021-10-06 16:12:35'),
(164, 98, 14, '2021-10-06 16:12:38'),
(165, 99, 14, '2021-10-06 16:12:39'),
(166, 1, 12, '2021-10-08 12:38:08'),
(168, 82, 12, '2021-10-08 12:38:12'),
(169, 96, 12, '2021-10-08 12:40:16'),
(170, 101, 12, '2021-10-08 12:40:18'),
(171, 7, 12, '2021-10-08 12:41:30'),
(172, 1, 11, '2021-10-08 12:43:18'),
(173, 7, 11, '2021-10-08 12:43:22'),
(174, 97, 11, '2021-10-08 12:43:23'),
(175, 98, 11, '2021-10-08 12:43:23'),
(176, 99, 11, '2021-10-08 12:43:24'),
(177, 100, 11, '2021-10-08 12:43:25'),
(178, 1, 124, '2021-10-12 03:30:39'),
(179, 82, 124, '2021-10-12 03:30:42'),
(180, 96, 124, '2021-10-12 03:30:55'),
(181, 101, 124, '2021-10-12 03:30:56'),
(183, 102, 124, '2021-10-12 03:30:57'),
(184, 106, 124, '2021-10-12 03:30:58'),
(185, 109, 124, '2021-10-12 03:30:59'),
(186, 7, 124, '2021-10-12 03:31:01'),
(187, 97, 124, '2021-10-12 03:31:02'),
(188, 98, 124, '2021-10-12 03:31:03'),
(189, 99, 124, '2021-10-12 03:31:06'),
(190, 100, 124, '2021-10-12 03:31:07'),
(191, 104, 124, '2021-10-12 03:31:22'),
(192, 6, 124, '2021-10-12 03:31:23'),
(193, 1, 125, '2021-10-12 03:33:15'),
(194, 82, 125, '2021-10-12 03:33:15'),
(195, 96, 125, '2021-10-12 03:33:16'),
(196, 101, 125, '2021-10-12 03:33:16'),
(197, 102, 125, '2021-10-12 03:33:17'),
(199, 106, 125, '2021-10-12 03:33:19'),
(200, 109, 125, '2021-10-12 03:33:19'),
(201, 7, 125, '2021-10-12 03:33:23'),
(202, 97, 125, '2021-10-12 03:33:25'),
(203, 98, 125, '2021-10-12 03:33:29'),
(204, 99, 125, '2021-10-12 03:33:29'),
(205, 100, 125, '2021-10-12 03:33:29'),
(206, 6, 125, '2021-10-12 03:33:38'),
(207, 104, 125, '2021-10-12 03:33:39'),
(208, 2, 125, '2021-10-12 03:33:41'),
(209, 2, 124, '2021-10-12 03:35:07'),
(210, 7, 123, '2021-10-12 03:37:20'),
(211, 1, 126, '2021-10-12 03:38:07'),
(212, 2, 126, '2021-10-12 03:38:15'),
(213, 6, 126, '2021-10-12 03:38:16'),
(214, 104, 126, '2021-10-12 03:38:17'),
(215, 7, 126, '2021-10-12 03:38:27'),
(216, 97, 126, '2021-10-12 03:38:36'),
(217, 98, 126, '2021-10-12 03:38:36'),
(218, 99, 126, '2021-10-12 03:38:37'),
(219, 100, 126, '2021-10-12 03:38:37'),
(220, 1, 123, '2021-10-12 03:40:03'),
(224, 2, 123, '2021-10-14 03:41:00'),
(225, 110, 1, '2021-10-28 17:04:37'),
(226, 111, 1, '2021-10-28 18:28:27'),
(227, 112, 1, '2021-10-28 19:46:29'),
(228, 1, 127, '2021-10-28 20:18:48');

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
(1, 1, 1, '2020-06-18 09:39:26'),
(6, 9, 5, '2021-07-15 08:18:40'),
(8, 11, 5, '2021-07-16 10:53:23'),
(10, 13, 5, '2021-07-16 13:47:41'),
(11, 14, 5, '2021-07-16 14:11:51'),
(12, 15, 5, '2021-07-16 14:52:34'),
(17, 20, 5, '2021-07-17 02:29:29'),
(18, 21, 5, '2021-07-17 14:38:27'),
(19, 22, 5, '2021-07-17 15:15:46'),
(20, 23, 5, '2021-07-17 15:20:08'),
(21, 24, 5, '2021-07-17 15:22:43'),
(23, 26, 5, '2021-07-18 23:34:36'),
(25, 28, 6, '2021-08-17 08:43:10'),
(26, 29, 1, '2021-08-18 07:12:11'),
(28, 31, 6, '2021-08-18 08:09:02'),
(29, 32, 3, '2021-08-25 15:41:15'),
(30, 33, 6, '2021-09-02 04:34:46'),
(31, 34, 6, '2021-09-02 04:35:10'),
(33, 36, 11, '2021-10-01 14:06:09'),
(37, 40, 11, '2021-10-01 14:20:38'),
(38, 41, 10, '2021-10-05 11:06:57'),
(39, 42, 12, '2021-10-08 12:28:16'),
(40, 43, 126, '2021-10-08 12:42:55');

-- --------------------------------------------------------

--
-- Table structure for table `tipe_contact`
--

CREATE TABLE `tipe_contact` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `keterangan` varchar(100) DEFAULT NULL,
  `status` int(1) NOT NULL COMMENT '0 Tidak Aktif | 1 Aktif | 2 Deleted',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tipe_contact`
--

INSERT INTO `tipe_contact` (`id`, `nama`, `keterangan`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Whatsapp', '-', 1, '2021-10-15 17:29:29', '2021-10-15 17:32:05', NULL),
(2, 'Handphone', '-', 1, '2021-10-15 17:37:44', NULL, NULL),
(3, 'Telepon Rumah', '-', 1, '2021-10-15 17:37:58', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `user_id` int(10) NOT NULL,
  `created` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tokens`
--

INSERT INTO `tokens` (`id`, `token`, `user_id`, `created`) VALUES
(30, '00a748a4abe1076bab4266e6184e7d', 59, '2021-10-18'),
(31, '97e5ebc5bca8f7575c47200401b85e', 59, '2021-10-18'),
(32, 'cfbc4c9d9d5bb0be1f03d06061d9b7', 59, '2021-10-18'),
(33, 'fb2a5900daf6c10ee995a976671784', 59, '2021-10-18'),
(34, '961dbf4fef4dab9ce9abc6fc2769a5', 60, '2021-10-18'),
(35, 'b0e2d885d4073fe2700d2744702a50', 60, '2021-10-18');

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
(1, NULL, '1', 'Adjie Abdul Azis', NULL, NULL, '$2y$10$34NjNNzrzOHiYA/Wc54tt.n3TB9abQUM065ZueEMd/LDw2NewOFoG', 'administrator@gmail.com', '1', '08123123', NULL, 1, '2020-06-18 09:39:08', '2020-06-18 09:39:08'),
(36, NULL, '211111', 's', '2021-10-03', NULL, '$2y$10$L7c6z/MN/KxpEKSgzq.Nr.y948c/SIUKePhOxW/OVied1OHRiO7hu', 'iseplutpi1008@gmail.com', '0', '', NULL, 3, '2021-10-01 14:06:09', '2021-10-03 13:32:19'),
(40, NULL, '11', 's', '2021-10-03', NULL, '$2y$10$657rSVyS.Iqk0f.lKXNHteihieQ50I7k70GHuppb.v6Pz5rLeoC3e', 'administrator@gmail.co', '0', '', NULL, 3, '2021-10-01 14:20:38', '2021-10-03 13:18:40'),
(42, 2, '123123', 'Soni', NULL, NULL, '$2y$10$34NjNNzrzOHiYA/Wc54tt.n3TB9abQUM065ZueEMd/LDw2NewOFoG', 'soni1933@gmail.com', '0', '081231231', NULL, 3, '2021-10-08 12:28:16', NULL),
(43, 2, '23123123', 'Hendrik Marpaung', NULL, NULL, '$2y$10$OpQ09XVqRC2RPrDnZd/eTeGGRq4YG/aH.H..9fAbrg06BVH4Fmzf.', 'pa.hendrik@gmail.com', '0', '628128686086', NULL, 3, '2021-10-08 12:42:55', '2021-10-12 04:01:43');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alamat`
--
ALTER TABLE `alamat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_profile` (`id_profile`);

--
-- Indexes for table `client_company`
--
ALTER TABLE `client_company`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_resiko` (`id_resiko`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_profile` (`id_profile`);

--
-- Indexes for table `data_formal`
--
ALTER TABLE `data_formal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_profile` (`id_profile`),
  ADD KEY `dtm_peristiwa_id` (`dtm_peristiwa_id`);

--
-- Indexes for table `dtm_peristiwa`
--
ALTER TABLE `dtm_peristiwa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gelar`
--
ALTER TABLE `gelar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_profile` (`id_profile`);

--
-- Indexes for table `jenis_alamat`
--
ALTER TABLE `jenis_alamat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jenis_gelar`
--
ALTER TABLE `jenis_gelar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jenis_membership`
--
ALTER TABLE `jenis_membership`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_level` (`id_level`);

--
-- Indexes for table `kpu_calon`
--
ALTER TABLE `kpu_calon`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `deleted_by` (`deleted_by`);

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
-- Indexes for table `membership`
--
ALTER TABLE `membership`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_approver` (`id_approver`),
  ADD KEY `id_jenis_membership` (`id_jenis_membership`),
  ADD KEY `id_profile` (`id_profile`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`menu_id`);

--
-- Indexes for table `p2pk`
--
ALTER TABLE `p2pk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `p2pk_planning`
--
ALTER TABLE `p2pk_planning`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `p2pk_planning_file`
--
ALTER TABLE `p2pk_planning_file`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `p2pk_proses_audit`
--
ALTER TABLE `p2pk_proses_audit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `p2pk_proses_audit_file`
--
ALTER TABLE `p2pk_proses_audit_file`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `p2pk_report`
--
ALTER TABLE `p2pk_report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `p2pk_report_detail`
--
ALTER TABLE `p2pk_report_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `partner`
--
ALTER TABLE `partner`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `profesi`
--
ALTER TABLE `profesi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_profile` (`id_profile`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `resiko`
--
ALTER TABLE `resiko`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `tipe_contact`
--
ALTER TABLE `tipe_contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `alamat`
--
ALTER TABLE `alamat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `client_company`
--
ALTER TABLE `client_company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `data_formal`
--
ALTER TABLE `data_formal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `dtm_peristiwa`
--
ALTER TABLE `dtm_peristiwa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `gelar`
--
ALTER TABLE `gelar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `jenis_alamat`
--
ALTER TABLE `jenis_alamat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `jenis_gelar`
--
ALTER TABLE `jenis_gelar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `jenis_membership`
--
ALTER TABLE `jenis_membership`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `kpu_calon`
--
ALTER TABLE `kpu_calon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `kpu_pemilih`
--
ALTER TABLE `kpu_pemilih`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `kpu_pemilihan`
--
ALTER TABLE `kpu_pemilihan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `level`
--
ALTER TABLE `level`
  MODIFY `lev_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT for table `membership`
--
ALTER TABLE `membership`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `p2pk`
--
ALTER TABLE `p2pk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `p2pk_planning`
--
ALTER TABLE `p2pk_planning`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `p2pk_planning_file`
--
ALTER TABLE `p2pk_planning_file`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `p2pk_proses_audit`
--
ALTER TABLE `p2pk_proses_audit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `p2pk_proses_audit_file`
--
ALTER TABLE `p2pk_proses_audit_file`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `p2pk_report`
--
ALTER TABLE `p2pk_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `p2pk_report_detail`
--
ALTER TABLE `p2pk_report_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `partner`
--
ALTER TABLE `partner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `profesi`
--
ALTER TABLE `profesi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `profile`
--
ALTER TABLE `profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `resiko`
--
ALTER TABLE `resiko`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `role_aplikasi`
--
ALTER TABLE `role_aplikasi`
  MODIFY `rola_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=229;

--
-- AUTO_INCREMENT for table `role_users`
--
ALTER TABLE `role_users`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `tipe_contact`
--
ALTER TABLE `tipe_contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alamat`
--
ALTER TABLE `alamat`
  ADD CONSTRAINT `alamat_ibfk_1` FOREIGN KEY (`id_profile`) REFERENCES `profile` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `client_company`
--
ALTER TABLE `client_company`
  ADD CONSTRAINT `client_company_ibfk_1` FOREIGN KEY (`id_resiko`) REFERENCES `resiko` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `contact`
--
ALTER TABLE `contact`
  ADD CONSTRAINT `contact_ibfk_1` FOREIGN KEY (`id_profile`) REFERENCES `profile` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `data_formal`
--
ALTER TABLE `data_formal`
  ADD CONSTRAINT `data_formal_ibfk_1` FOREIGN KEY (`id_profile`) REFERENCES `profile` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `data_formal_ibfk_2` FOREIGN KEY (`dtm_peristiwa_id`) REFERENCES `dtm_peristiwa` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `gelar`
--
ALTER TABLE `gelar`
  ADD CONSTRAINT `gelar_ibfk_1` FOREIGN KEY (`id_profile`) REFERENCES `profile` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jenis_membership`
--
ALTER TABLE `jenis_membership`
  ADD CONSTRAINT `jenis_membership_ibfk_1` FOREIGN KEY (`id_level`) REFERENCES `level` (`lev_id`) ON DELETE CASCADE ON UPDATE CASCADE;

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

--
-- Constraints for table `membership`
--
ALTER TABLE `membership`
  ADD CONSTRAINT `membership_ibfk_1` FOREIGN KEY (`id_approver`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `membership_ibfk_2` FOREIGN KEY (`id_jenis_membership`) REFERENCES `jenis_membership` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `membership_ibfk_3` FOREIGN KEY (`id_profile`) REFERENCES `profile` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `profesi`
--
ALTER TABLE `profesi`
  ADD CONSTRAINT `profesi_ibfk_1` FOREIGN KEY (`id_profile`) REFERENCES `profile` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `profile_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;
