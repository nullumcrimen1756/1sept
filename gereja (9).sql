-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 31, 2025 at 09:11 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gereja`
--

-- --------------------------------------------------------

--
-- Table structure for table `anggaran_pendapatan`
--

CREATE TABLE `anggaran_pendapatan` (
  `id` int(11) NOT NULL,
  `kode_subkategori` varchar(50) NOT NULL,
  `bulan` varchar(20) NOT NULL,
  `jumlah` decimal(15,2) NOT NULL DEFAULT 0.00,
  `type` enum('uang-setoran','kelompok','subkategori','keseluruhan') NOT NULL DEFAULT 'subkategori'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jurnal`
--

CREATE TABLE `jurnal` (
  `id_jurnal` int(11) NOT NULL,
  `nama_jurnal` varchar(100) NOT NULL,
  `kode_jurnal` varchar(10) NOT NULL,
  `deskripsi` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jurnal`
--

INSERT INTO `jurnal` (`id_jurnal`, `nama_jurnal`, `kode_jurnal`, `deskripsi`) VALUES
(1, 'Pengeluaran Jemaat', 'PJ', NULL),
(2, 'Penerimaan Jemaat', 'PRJ', NULL),
(3, 'Penerimaan Saldo Bank', 'PSB', NULL),
(4, 'Penerimaan GSG', 'PGSG', NULL),
(5, 'Jurnal Penerimaan Jemaat Saldo Bank Mandiri', 'PPJSB', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `id_jurnal` int(11) NOT NULL,
  `kode_kategori` varchar(3) NOT NULL,
  `nama_kategori` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `id_jurnal`, `kode_kategori`, `nama_kategori`) VALUES
(1, 1, '200', 'ADMINISTRASI GEREJA'),
(2, 1, '400', 'BIDANG APOSTOLAT'),
(3, 1, '600', 'BIDANG PASTORAT'),
(4, 1, '800', 'BIDANG DIAKONAT'),
(5, 2, '300', 'KEBAKTIAN & SEWA GSG'),
(6, 2, '500', 'BAKTI BULANAN & UCAPAN SYUKUR'),
(7, 2, '700', 'JASA & PENDAPATAN LAIN'),
(8, 2, '900', 'LAIN-LAIN'),
(9, 5, '300', 'KEBAKTIAN'),
(10, 5, '500', 'BAKTI BULANAN & UCAPAN SYUKUR'),
(11, 5, '700', 'JASA & PENDAPATAN LAIN'),
(12, 4, '200', 'ADMINISTRASI GSG'),
(13, 4, '400', 'PENGADAAN'),
(14, 4, '600', 'PEMELIHARAAN'),
(15, 4, '800', 'LANGGANAN DAYA & JASA'),
(16, 4, '100', 'KONTRIBUSI'),
(17, 3, '200', 'BELUM DIDEFINISIKAN'),
(18, 3, '400', 'BELUM DIDEFINISIKAN'),
(19, 3, '600', 'BELUM DIDEFINISIKAN'),
(20, 3, '800', 'BELUM DIDEFINISIKAN');

-- --------------------------------------------------------

--
-- Table structure for table `login_logs`
--

CREATE TABLE `login_logs` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `waktu_login` datetime NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `browser` varchar(100) DEFAULT NULL,
  `operating_system` varchar(100) DEFAULT NULL,
  `device_type` varchar(50) DEFAULT NULL,
  `user_agent` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subkategori`
--

CREATE TABLE `subkategori` (
  `id_subkategori` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `kode_subkategori` varchar(12) NOT NULL,
  `nama_subkategori` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subkategori`
--

INSERT INTO `subkategori` (`id_subkategori`, `id_kategori`, `kode_subkategori`, `nama_subkategori`) VALUES
(1, 1, '200.01', 'TUNJANGAN & PENGGANTI TRANSPORT'),
(2, 1, '200.02', 'ADMINSTRASI KANTOR'),
(3, 1, '200.03', 'ADMINISTRASI & UMUM'),
(4, 1, '200.04', 'PEMELIHARAAN RUTIN GEREJA'),
(5, 1, '200.05', 'EKSPLOITASI - KENDARAAN DINAS GEREJA'),
(6, 1, '200.06', 'DAYA & JASA'),
(7, 1, '200.07', 'PENGADAAN INVENTARIS GEREJA'),
(8, 1, '200.01.01', 'Pendeta Pimpinan Jemaat'),
(9, 1, '200.01.02', 'Pendeta Khusus (diperbantukan) / Vikaris (Calon Pendeta GKPI)'),
(10, 1, '200.01.03', 'Guru Jemaat'),
(11, 1, '200.01.04', 'Sekretaris dan Bendahara Jemaat'),
(12, 1, '200.01.05', 'Pegawai Administrasi : Kantor GKPI Medan Kota'),
(13, 1, '200.01.06a', 'Pegawai Kebersihan & Teknisi: Gedung Gereja'),
(14, 1, '200.01.06b', 'Pegawai Kebersihan & Teknisi: Pekarangan & Taman Gereja'),
(15, 1, '200.01.06c1', 'Pegawai Kebersihan & Teknisi: Supir Mobil Dinas & Ambulance GKPI Medan Kota'),
(16, 1, '200.01.06c2', 'Pegawai Kebersihan & Teknisi: Jaga Malam'),
(17, 1, '200.01.06d', 'Pegawai Kebersihan & Teknisi: Gedung Multifungsi'),
(18, 1, '200.01.06e', 'Pegawai Kebersihan & Teknisi: Soundman'),
(19, 1, '200.01.07', 'Administrasi Guru Sekolah Minggu (dan Remaja)'),
(20, 1, '200.01.08', 'Pengawas Parkir (Minggu & Hari Besar)'),
(21, 1, '200.02.01', 'Alat Tulis Kantor, Penggandaan dan Cetakan'),
(22, 1, '200.02.02', 'Rapat dan Pertemuan Majelis Jemaat'),
(23, 1, '200.02.03', 'Insentif / Lembur Pegawai'),
(24, 1, '200.02.04a', 'Minum & Konsumsi Kantor, Jemaat'),
(25, 1, '200.02.04b', 'Biaya Makan Tamu Gereja'),
(26, 1, '200.02.04c', 'Biaya Snack untuk Pemusik & Songleader'),
(27, 1, '200.02.05', 'Penyediaan Kolportase (Al & Kal, Alkitab, Agenda, dll)'),
(28, 1, '200.02.06', 'Transport, Kurir, Benda pos'),
(29, 1, '200.03.01a', 'Snack dan minuman sermon penatua'),
(30, 1, '200.03.01b', 'Penyediaan makanan pembukaan dan penutupan sermon penatua'),
(31, 1, '200.03.02', 'Dana Pembinaan untuk Paduan Suara di GKPI Medan Kota'),
(32, 1, '200.03.03a', 'Syukuran Awal Tahun (Jemaat & Pendeta)'),
(33, 1, '200.03.03b', 'Snack Kebaktian Pembukaan and Tutup Tahun Gereja'),
(34, 1, '200.03.03c', 'Snack Paskah and Buha - Buha Ijuk'),
(35, 1, '200.03.04', 'Krans Bunga Dukacita bagi Anggota Jemaat'),
(36, 1, '200.03.05', 'Bantuan Dukacita bagi Anggota Jemaat'),
(37, 1, '200.03.06a', 'Bunga altar pada Kebaktian Minggu'),
(38, 1, '200.03.06b', 'Dekorasi pada Kebaktian Hari Besar Kristen'),
(39, 1, '200.03.07', 'Keamanan Acara Hari Besar Kristen'),
(40, 1, '200.03.08a', 'Kontribusi & Registrasi Peserta untuk Rapat Sinode Am Kerja (SAK) XXIII GKPI 2023'),
(41, 1, '200.03.08b', 'Perjalanan Dinas Peserta Rapat Sinode Am Kerja (SAK) XXIII GKPI 2023'),
(42, 1, '200.03.09', 'Perjalanan Dinas atas undangan Kantor Pusat GKPI'),
(43, 1, '200.03.10', 'Sidang Umum Jemaat GKPI Medan Kota'),
(44, 1, '200.03.11', 'Biaya Tak Terduga / Insidentil'),
(45, 1, '200.04.01', 'Gedung Gereja, Rumah Dinas & Pekarangan'),
(46, 1, '200.04.02', 'Inventaris Gereja'),
(47, 1, '200.05.01a', 'Roda 4(Empat): Kijang Innova, Plat BK 1757 EJ'),
(48, 1, '200.05.01b', 'Pajak Kenderaan Kijang Innova, Plat BK 1757 EJ'),
(49, 1, '200.05.02a', 'Roda 4(Empat): HIACE BK.7866 DP'),
(50, 1, '200.05.02b', 'Pajak Kenderaan Roda 4(Empat): HIACE BK.7866 DP'),
(51, 1, '200.05.03a', 'Roda 2(dua): 1 unit, Plat BK. 5440 AGG'),
(52, 1, '200.05.03b', 'Pajak Kendaraan Roda 2(dua): 1 unit, Plat BK. 5440 AGG'),
(53, 1, '200.06.01', 'Telepon Kantor (Gereja / Jemaat): (061) 453-4521, Speedy, My republik dan Wa'),
(54, 1, '200.07.01', 'Jubah Penatua'),
(55, 1, '200.07.02', 'Pengadaan Peralatan & Perlengkapan Inventaris Gereja'),
(56, 1, '200.07.03', 'Dekorasi dan Persiapan Natal'),
(57, 2, '400.01', 'IBADAH MINGGU'),
(58, 2, '400.02', 'IBADAH / PERSEKUTUAN DOA / KEBAKTIAN'),
(59, 2, '400.03', 'IBADAH KHUSUS'),
(60, 2, '400.04', 'PETUGAS KEBAKTIAN'),
(61, 2, '400.05', 'PELAYANAN SAKRAMEN'),
(62, 2, '400.06', 'HUT GKPI MEDAN KOTA'),
(63, 2, '400.01.01', 'Pengkhotbah Minggu: Pimpination Sinode GKPI'),
(64, 2, '400.01.02', 'Pengkhotbah Minggu: Dari Luar Kota'),
(65, 2, '400.01.03', 'Pengkhotbah Minggu: Dari Dalam Kota'),
(66, 2, '400.01.04', 'Pengkhotbah Minggu: Di Rumah Duka'),
(67, 2, '400.01.05', 'Pengkhotbah Minggu: Remaja'),
(68, 2, '400.02.01', 'Pengkhotbah Kebaktian Lingkungan'),
(69, 2, '400.02.02', 'Pengkhotbah Kebaktian Pemuda-Pemudi & GSM'),
(70, 2, '400.02.03', 'Pengkhotbah Kebaktian Perkumpulan Koor Ibu-Ibu'),
(71, 2, '400.02.04', 'Pengkhotbah Kebaktian Ibu Hanna & Diakoni'),
(72, 2, '400.02.05', 'Pengkhotbah Kebaktian Lanjut Usia (LANSIA)'),
(73, 2, '400.03.01', 'Pengkhotbah Kebak. Perjanjian/Pemberkatan Nikah'),
(74, 2, '400.03.02', 'Pengkhotbah Kebak. Penguburan Jenazah'),
(75, 2, '400.03.03', 'Pengkhotbah Kebak. di Rumah Duka oleh Penatua'),
(76, 2, '400.04.01', 'Minggu Pagi: Pukul 08.00 WIB'),
(77, 2, '400.04.02', 'Minggu Sore: Pukul 18.00 WIB'),
(78, 2, '400.04.03', 'Sekolah Minggu & Remaja'),
(79, 2, '400.04.04', 'Perjanjian / Pemberkatan Nikah'),
(80, 2, '400.04.05', 'Kebaktian pemberangkatan jenazah (pemusik & songleader)'),
(81, 2, '400.04.06', 'Kebaktian di Rumah Duka'),
(82, 2, '400.04.07', 'Pelayanan di Rumah Duka'),
(83, 2, '400.04.08', 'Guru Sekolah Minggu (Sermon & Mengajar)'),
(84, 2, '400.04.09', 'Latihan Pemusik dan Songleader'),
(85, 2, '400.04.10', 'Petugas Penghitung Kebaktian Minggu'),
(86, 2, '400.05.01', 'Perjamuan Kudus di Gereja'),
(87, 2, '400.05.02', 'Snack Ujian Tulisan & Lisan Pelajar Sidi TA. 2021'),
(88, 2, '400.06.01', 'HUT GKPI Medan Kota'),
(89, 3, '600.01', 'PENDIDIDIKAN & PEMBINAAN'),
(90, 3, '600.02', 'PROGRAM KERJA SEKSI'),
(91, 3, '600.03', 'BAKTI BULANAN / TARGET KE KANTOR PUSAT'),
(92, 3, '600.04', 'TARGET KE GKPI RESSORT MEDAN BARAT'),
(93, 3, '600.01.01', 'Pendidikan Lanjutan Untuk Pendeta'),
(94, 3, '600.01.02', 'Penghargaan Untuk Penatua'),
(95, 3, '600.01.03', 'Pembinaan & Pelatihan Pelajar Sidi GKPI Medan Kota'),
(96, 3, '600.01.04', 'Pembinaan Penatua se Resort Medan Barat'),
(97, 3, '600.02.01', 'Pembinaan & Pelayanan Rohani (PPR)'),
(98, 3, '600.02.02', 'Pekabaran Injil (PI)'),
(99, 3, '600.02.03', 'Diakoni'),
(100, 3, '600.02.04', 'Musik, Nyanyian & Koor (MNK)'),
(101, 3, '600.02.05', 'Sekolah Minggu'),
(102, 3, '600.02.06', 'Remaja'),
(103, 3, '600.02.07', 'Pemuda'),
(104, 3, '600.02.08', 'Perempuan'),
(105, 3, '600.02.09', 'Pria'),
(106, 3, '600.02.10', 'Lansia'),
(107, 3, '600.02.11', 'Kesehatan'),
(108, 3, '600.02.12', 'Education'),
(109, 3, '600.02.13', 'Usaha & Pengembangan Sumber Daya (UPSD)'),
(110, 3, '600.02.14', 'Sarana & Prasarana'),
(111, 3, '600.02.15', 'Natal Gabungan Seksi-seksi (Natal II)'),
(112, 3, '600.03.01', 'Target Ke Kantor Pusat GKPI'),
(113, 3, '600.03.02', 'Biaya Tahun Renstra GKPI 2023'),
(114, 3, '600.03.03', 'Kantor Sinode GKPI (Persembahan Kedua)'),
(115, 3, '600.04.01', 'Target Ke GKPI Ressort Medan Barat'),
(116, 4, '800.01', 'BANTUAN KEMANUSIAAN / JEMAAT'),
(117, 4, '800.02', 'BINGKISAN NATAL'),
(118, 4, '800.01.01', 'Bantuan ke Jemaat untuk musibah/bencana alam'),
(119, 4, '800.01.02', 'Akomodasi Acara Penghiburan ke rumah duka'),
(120, 4, '800.01.03', 'Bantuan untuk Dana Pensiun Pendeta GKPI'),
(121, 4, '800.01.04', 'Bantuan untuk PA. Mamre and Yapentra'),
(122, 4, '800.01.05', 'Bantuan Ke GKPI Lainnya'),
(123, 4, '800.02.01', 'Anak - Anak Sekolah Minggu'),
(124, 4, '800.02.02', 'Penatua Purnabakti'),
(125, 4, '800.02.03', 'Penatua Aktif'),
(126, 4, '800.02.04', 'Calon Penatua'),
(127, 4, '800.02.05', 'Pendeta GKPI Ressort Medan Barat'),
(128, 4, '800.02.06', 'Anggota Majelis Jemaat: Ketua Seksi, Penasehat, PHBK'),
(129, 4, '800.02.07', 'Guru-Guru Koor di Jemaat GKPI Medan Kota'),
(130, 4, '800.02.08', 'Guru-Guru Sekolah Minggu'),
(131, 4, '800.02.09', 'Pemusik: (Organis, Pianis dan Saxophonis)'),
(132, 4, '800.02.10', 'Songleader (Pemandu Lagu)'),
(133, 4, '800.02.11', 'Petugas Live Streaming Minggu'),
(134, 5, '300.01', 'IBADAH ONLINE'),
(135, 5, '300.02', 'SEWA GSG'),
(136, 5, '300.01.01', 'Ibadah di rumah (live streaming)'),
(137, 5, '300.02.01', 'Umum Lantai I & II - Senin-Selasa & Minggu'),
(138, 5, '300.02.02', 'Umum Lantai I & II - Rabu-Kamis'),
(139, 5, '300.02.03', 'Umum Lantai I & II - Jumat-Sabtu'),
(140, 5, '300.02.04', 'Jemaat GKPI Lantai I & II - Senin-Selasa & Minggu'),
(141, 5, '300.02.05', 'Jemaat GKPI Lantai I & II - Rabu-Kamis'),
(142, 5, '300.02.06', 'Jemaat GKPI Lantai I & II - Jumat-Sabtu'),
(143, 5, '300.02.07', 'Jemaat GKPI Medan Kota Lantai I - Senin-Selasa & Minggu'),
(144, 5, '300.02.08', 'Jemaat GKPI Medan Kota Lantai I - Rabu-Kamis'),
(145, 5, '300.02.09', 'Jemaat GKPI Medan Kota Lantai I - Jumat-Sabtu'),
(146, 5, '300.02.10', 'Majelis Jemaat GKPI Medan Kota Lantai I - Senin-Selasa & Minggu'),
(147, 5, '300.02.11', 'Majelis Jemaat GKPI Medan Kota Lantai I - Rabu-Kamis'),
(148, 5, '300.02.12', 'Majelis Jemaat GKPI Medan Kota Lantai I - Jumat-Sabtu'),
(149, 6, '500.01', 'BAKTI BULANAN'),
(150, 6, '500.02', 'UCAPAN SYUKUR'),
(151, 6, '500.01.01', 'Bakti Bulanan'),
(152, 6, '500.02.01', 'Ucapan Syukur'),
(153, 7, '700.03', 'JASA BANK'),
(154, 7, '700.03.01', 'Jasa Bank (Bunga)'),
(155, 8, '900.01', 'JASA BANK NET'),
(156, 8, '900.02', 'SHELTER GSG'),
(157, 8, '900.03', 'AMBULANCE'),
(158, 8, '900.01.00', 'Jasa Bank (Net)'),
(159, 8, '900.02.00', 'Pemakaian Shelter GSG dan Lain-lain'),
(160, 8, '900.03.00', 'Jasa Mobil Ambulance'),
(161, 9, '300.01', 'IBADAH UMUM'),
(162, 9, '300.01.05', 'Persembahan Ibadah Umum'),
(163, 10, '500.01', 'BAKTI BULANAN REGULER'),
(164, 10, '500.02', 'SUMBANGAN & UCAPAN SYUKUR'),
(165, 10, '500.01.01', 'Bakti Bulanan Reguler'),
(166, 10, '500.02.01', 'Sumbangan & Ucapan Syukur'),
(167, 11, '700.03', 'JASA BANK'),
(168, 11, '700.03', 'SEWA GEDUNG'),
(169, 11, '700.03.01', 'Bunga Bank'),
(170, 11, '700.03.08', 'Sewa Gedung'),
(171, 12, '200.01', 'PETUGAS KEBERSIHAN'),
(172, 12, '200.02', 'PETUGAS KEBERSIHAN (HONORER)'),
(173, 12, '200.01.01', 'Petugas Kebersihan'),
(174, 12, '200.02.01', 'Petugas Kebersihan (Honorer)'),
(175, 13, '400.01', 'INVENTARIS GSG'),
(176, 13, '400.01.01', 'Inventaris GSG'),
(177, 14, '600.01', 'SOUND SYS. & INSTALASI LISTRIK'),
(178, 14, '600.02', 'GEDUNG & PEKARANGAN'),
(179, 14, '600.03', 'GENERATOR SETTING (EKSPLOITASI)'),
(180, 14, '600.04', 'PEREHABAN'),
(181, 14, '600.05', 'AMBULANCE (EKSPLOITASI)'),
(182, 14, '600.06', 'BIAYA LAIN - LAIN'),
(183, 14, '600.01.01', 'Sound System & Instalasi Listrik'),
(184, 14, '600.02.01', 'Gedung & Pekarangan'),
(185, 14, '600.03.01', 'Generator Setting (Eksploitasi)'),
(186, 14, '600.04.01', 'Pemeliharaan Gedung, Kamar Mandi dan Ruang Genset'),
(187, 14, '600.05.01', 'Roda 4(Empat): Isuzu tahun 2011, Plat BK 1103 OW'),
(188, 14, '600.05.02', 'Pajak Kendaraan: Isuzu tahun 2011, Plat BK 1103 OW'),
(189, 14, '600.05.03', 'Honor Pendamping Driver'),
(190, 14, '600.06.01', 'Biaya Lain - Lain'),
(191, 15, '800.01', 'PLN: ARUS LISTRIK'),
(192, 15, '800.02', 'PDAM: AIR BERSIH'),
(193, 15, '800.01.01', 'PLN: Arus Listrik'),
(194, 15, '800.02.01', 'PDAM: Air Bersih'),
(195, 16, '1000.01', 'KONTRIBUSI KE GEREJA/JEMAAT'),
(196, 16, '1000.01.01', 'Kontribusi ke Gereja/Jemaat'),
(197, 17, '200.00.00', 'Biaya Administrasi'),
(198, 18, '400.00.00', 'Program & Kegiatan'),
(199, 19, '600.00.00', 'Biaya Operasional'),
(200, 20, '800.00.00', 'Transfer & Distribusi');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_jurnal` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `no_kwitansi` varchar(50) NOT NULL,
  `uraian` text DEFAULT NULL,
  `jumlah` decimal(15,2) NOT NULL,
  `id_subkategori` int(11) DEFAULT NULL,
  `setoran` decimal(15,2) DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anggaran_pendapatan`
--
ALTER TABLE `anggaran_pendapatan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jurnal`
--
ALTER TABLE `jurnal`
  ADD PRIMARY KEY (`id_jurnal`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`),
  ADD KEY `id_jurnal` (`id_jurnal`);

--
-- Indexes for table `login_logs`
--
ALTER TABLE `login_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subkategori`
--
ALTER TABLE `subkategori`
  ADD PRIMARY KEY (`id_subkategori`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_jurnal` (`id_jurnal`),
  ADD KEY `id_subkategori` (`id_subkategori`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `anggaran_pendapatan`
--
ALTER TABLE `anggaran_pendapatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jurnal`
--
ALTER TABLE `jurnal`
  MODIFY `id_jurnal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `login_logs`
--
ALTER TABLE `login_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subkategori`
--
ALTER TABLE `subkategori`
  MODIFY `id_subkategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kategori`
--
ALTER TABLE `kategori`
  ADD CONSTRAINT `kategori_ibfk_1` FOREIGN KEY (`id_jurnal`) REFERENCES `jurnal` (`id_jurnal`);

--
-- Constraints for table `subkategori`
--
ALTER TABLE `subkategori`
  ADD CONSTRAINT `subkategori_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`);

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_jurnal`) REFERENCES `jurnal` (`id_jurnal`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_subkategori`) REFERENCES `subkategori` (`id_subkategori`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
