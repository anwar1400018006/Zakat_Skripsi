-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 01, 2019 at 07:07 PM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `zakat`
--

-- --------------------------------------------------------

--
-- Table structure for table `fasilitas`
--

CREATE TABLE `fasilitas` (
  `id_fasilitas` varchar(10) NOT NULL,
  `nama_fasilitas` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jamaah`
--

CREATE TABLE `jamaah` (
  `id_jamaah` int(11) NOT NULL,
  `nik` varchar(20) NOT NULL,
  `nama_lengkap` varchar(30) NOT NULL,
  `tempat_lahir` varchar(30) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `jenis_kelamin` enum('Laki-Laki','Perempuan') NOT NULL,
  `status_hubungan` varchar(20) NOT NULL,
  `no_telp` varchar(15) NOT NULL,
  `pendidikan` varchar(50) NOT NULL,
  `pekerjaan` varchar(30) NOT NULL,
  `gol_darah` varchar(2) DEFAULT NULL,
  `sholat` enum('0','1','2','3','4') NOT NULL,
  `baca_alquran` enum('Tidak Bisa','Belum Lancar','Lancar') NOT NULL,
  `no_kk` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jenis_transaksi`
--

CREATE TABLE `jenis_transaksi` (
  `id_jenis` varchar(10) NOT NULL,
  `nama_jenis` varchar(50) NOT NULL,
  `jenis_transaksi` enum('Masuk','Keluar') NOT NULL,
  `id_masjid` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jenis_transaksi`
--

INSERT INTO `jenis_transaksi` (`id_jenis`, `nama_jenis`, `jenis_transaksi`, `id_masjid`) VALUES
('K0001', 'Infaq', 'Masuk', 'M0001'),
('K0002', 'Transportasi', 'Keluar', 'M0001');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_zakat`
--

CREATE TABLE `jenis_zakat` (
  `id_jenis` varchar(10) NOT NULL,
  `nama_jenis` varchar(50) NOT NULL,
  `jenis_zakat` enum('Masuk','Keluar') NOT NULL,
  `id_masjid` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jenis_zakat`
--

INSERT INTO `jenis_zakat` (`id_jenis`, `nama_jenis`, `jenis_zakat`, `id_masjid`) VALUES
('K0002', 'fakir ', 'Keluar', 'M0001'),
('K0005', 'Zakat Fitrah', 'Masuk', 'M0001'),
('K0006', 'Zakat Maal', 'Masuk', 'M0001'),
('K0007', 'infaq', 'Masuk', 'M0002'),
('K0008', 'Zakat Fitrah', 'Keluar', 'M0002'),
('K0009', 'Zakat Fitrah', 'Masuk', 'M0003'),
('K0010', 'Zakat maal', 'Masuk', 'M0003'),
('K0011', 'Zakat', 'Keluar', 'M0003'),
('K0012', 'miskin', 'Keluar', 'M0001'),
('K0013', 'mualaf', 'Keluar', 'M0001'),
('K0014', 'amil', 'Keluar', 'M0001'),
('K0015', 'fisabilillah', 'Keluar', 'M0001'),
('K0016', 'gharimin', 'Keluar', 'M0001'),
('K0017', 'riqab', 'Keluar', 'M0001'),
('K0018', 'ibnu sabil', 'Keluar', 'M0001'),
('K0019', 'Zakat Fitrah', 'Masuk', 'M0004'),
('K0020', 'zakat maal', 'Masuk', 'M0004'),
('K0021', 'amil', 'Keluar', 'M0004'),
('K0022', 'fakir ', 'Keluar', 'M0004'),
('K0023', 'gharimin', 'Keluar', 'M0004'),
('K0024', 'miskin', 'Keluar', 'M0004'),
('K0025', 'mualaf', 'Keluar', 'M0004'),
('K0026', 'ibnu sabil', 'Keluar', 'M0004'),
('K0027', 'riqab', 'Keluar', 'M0004'),
('K0028', 'fisabilillah', 'Keluar', 'M0004');

-- --------------------------------------------------------

--
-- Table structure for table `kartu_keluarga`
--

CREATE TABLE `kartu_keluarga` (
  `id_kk` int(11) NOT NULL,
  `no_kk` varchar(20) NOT NULL,
  `rw` varchar(5) NOT NULL,
  `rt` varchar(5) NOT NULL,
  `alamat` text NOT NULL,
  `id_masjid` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kegiatan`
--

CREATE TABLE `kegiatan` (
  `id_kegiatan` int(11) NOT NULL,
  `nama_kegiatan` varchar(100) NOT NULL,
  `pengisi` text NOT NULL,
  `keterangan` text NOT NULL,
  `tanggal` date NOT NULL,
  `jam` time NOT NULL,
  `gambar_kegiatan` varchar(50) DEFAULT NULL,
  `status` enum('0','1') NOT NULL,
  `peserta` smallint(6) DEFAULT NULL,
  `id_masjid` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `masjid`
--

CREATE TABLE `masjid` (
  `id_masjid` varchar(10) NOT NULL,
  `nama_masjid` varchar(30) NOT NULL,
  `alamat_masjid` text NOT NULL,
  `kecamatan` varchar(15) NOT NULL,
  `tipologi` varchar(20) NOT NULL,
  `no_telp_masjid` varchar(15) NOT NULL,
  `tahun_berdiri` int(11) DEFAULT NULL,
  `no_badan_hukum` varchar(50) DEFAULT NULL,
  `luas_tanah` float DEFAULT NULL,
  `luas_bangunan` float DEFAULT NULL,
  `status_tanah` varchar(25) DEFAULT NULL,
  `no_aiw` varchar(50) DEFAULT NULL,
  `daya_tampung` int(11) DEFAULT NULL,
  `sk_pendirian` varchar(50) NOT NULL,
  `sk_tanah` varchar(50) NOT NULL,
  `gambar_masjid` varchar(50) NOT NULL,
  `latitude` float(10,6) DEFAULT NULL,
  `longitude` float(10,6) DEFAULT NULL,
  `fasilitas` text,
  `kegiatan` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `masjid`
--

INSERT INTO `masjid` (`id_masjid`, `nama_masjid`, `alamat_masjid`, `kecamatan`, `tipologi`, `no_telp_masjid`, `tahun_berdiri`, `no_badan_hukum`, `luas_tanah`, `luas_bangunan`, `status_tanah`, `no_aiw`, `daya_tampung`, `sk_pendirian`, `sk_tanah`, `gambar_masjid`, `latitude`, `longitude`, `fasilitas`, `kegiatan`) VALUES
('M0001', 'darussalam', 'danurejan', 'Danurejan', 'Agung', '081348355000', 213123213, '213123123', 123213000, 213123000, 'Wakaf', '3123213213', 213213123, '795886.png', '218008.png', '373155.jpg', -10000.000000, 10000.000000, '', ''),
('M0002', 'babussalam', 'ttrth', 'Umbulharjo', 'Agung', '12345436', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '115331.jpeg', '448084.jpeg', '328967.jpeg', NULL, NULL, NULL, NULL),
('M0003', 'darul ilmi', 'wqweqe', 'Gedongtengen', 'Jami', '08122997715', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '979361.png', '578303.png', '491262.png', NULL, NULL, NULL, NULL),
('M0004', 'Masjid Uni Salamah', 'Glahgasari VH4/590A Yogyakarta ', 'Umbulharjo', 'Jami', '082227157112', 1989, '12.04.100413.13180581', 2313, 12321, 'Wakaf', '19/X/13', 2313, '782658.jfif', '428916.jpg', '254561.jpg', -7.808347, 110.377289, 'Sarana Ibadah', '');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` varchar(10) NOT NULL,
  `jumlah_transaksi` int(11) NOT NULL,
  `tgl_transaksi` date NOT NULL,
  `keterangan` text NOT NULL,
  `id_jenis` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `jumlah_transaksi`, `tgl_transaksi`, `keterangan`, `id_jenis`) VALUES
('T0001', 750000, '2019-08-28', 'Kamu', 'K0001'),
('T0002', 1200000, '2019-07-16', 'Kas', 'K0001'),
('T0003', 100000, '2019-08-14', 'Transport', 'K0002'),
('T0036', 1500000, '2019-09-06', 'Infaq Mingguan', 'K0001');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` varchar(10) NOT NULL,
  `nama_user` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `hak_akses` enum('admin','pengurus') NOT NULL,
  `jenis_kelamin` enum('Laki-Laki','Perempuan') NOT NULL,
  `tempat_lahir` varchar(30) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `no_telp` varchar(15) NOT NULL,
  `alamat` text NOT NULL,
  `gambar` varchar(50) NOT NULL,
  `ktp` varchar(150) DEFAULT NULL,
  `sk_kepengurusan` varchar(150) DEFAULT NULL,
  `status` enum('0','1','2','3','4') NOT NULL,
  `id_masjid` varchar(10) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama_user`, `email`, `username`, `password`, `hak_akses`, `jenis_kelamin`, `tempat_lahir`, `tgl_lahir`, `no_telp`, `alamat`, `gambar`, `ktp`, `sk_kepengurusan`, `status`, `id_masjid`, `created_at`) VALUES
('A0001', 'syaripudin khairil anwar', 'anwar.sadrel@gmail.com', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin', 'Laki-Laki', 'Palangka Raya', '1996-11-23', '081229997715', 'Jl. Kusumanegara, Gg. Tugiyo, No. 902', '192550.png', '', '', '1', NULL, '2019-02-05 06:41:55'),
('P0001', 'pengurus', 'admin@admin.com', 'pengurus', 'ef4113dcac30d9fea0cd4ed7caa66ee8', 'pengurus', 'Laki-Laki', 'dgfdg', '2019-05-01', '0123456789', 'adsfdsf', '623302.jpg', '781622.png', '116138.png', '1', 'M0001', '2019-05-08 17:13:11'),
('P0002', 'pengurus1', 'admin@admin1.com', 'pengurus1', '4e2e2e26fd3bdd141a789ef2ead43320', 'pengurus', 'Laki-Laki', 'dgfdg', '2019-05-06', '0123456789', 'pengurus1', '334143.jpeg', '140422.jpeg', '280323.jpeg', '1', 'M0002', '2019-05-08 18:38:21'),
('P0003', 'pengurus3', 'asdf@gmail.com', 'pengurus3', 'e9f54ad865e8c8d8c4f51349c9a0b1f6', 'pengurus', 'Laki-Laki', 'pengurus3', '2018-12-05', '081229997715', 'pengurus3', '228982.png', '158770.png', '107460.png', '1', 'M0003', '2019-05-15 10:01:17'),
('P0004', 'Bpk H Subandi S.H', 'salamah23@gmail.com', 'salamah', '940cf5a59c333477a72bcd0b254ac670', 'pengurus', 'Laki-Laki', 'Yogyakarta', '1988-10-15', '082227157112', 'Glahgasari VH4/590A Yogyakarta', '558822.jpg', '217671.jpeg', '845858.jpg', '1', 'M0004', '2019-10-01 15:34:28');

-- --------------------------------------------------------

--
-- Table structure for table `zakat`
--

CREATE TABLE `zakat` (
  `id_zakat` varchar(10) NOT NULL,
  `jumlah_transaksi` int(11) NOT NULL,
  `tgl_transaksi` date NOT NULL,
  `nik` int(255) NOT NULL,
  `nama_zakat` varchar(50) NOT NULL,
  `alamat_zakat` text NOT NULL,
  `nohp` varchar(255) NOT NULL,
  `email_zakat` varchar(50) NOT NULL,
  `id_jenis` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `zakat`
--

INSERT INTO `zakat` (`id_zakat`, `jumlah_transaksi`, `tgl_transaksi`, `nik`, `nama_zakat`, `alamat_zakat`, `nohp`, `email_zakat`, `id_jenis`) VALUES
('T0007', 50000, '2019-05-07', 3123123, 'susi susilawaty', 'FDSAD', '832131232', 'susi@gmail.com', 'K0002'),
('T0008', 1500000, '2019-05-09', 1445656767, 'mackend leonardo', 'ASDASA', '999999999943234', 'mackends@gmail.com', 'K0005'),
('T0009', 500000, '2019-05-09', 6343434, 'abdul manan', 'AASSSS', '0', '', 'K0002'),
('T0010', 100000, '2019-05-15', 0, 'ambon', '', '0', '', 'K0007'),
('T0011', 100000, '2019-05-16', 0, 'dimas wahyu pribadi', '', '0', '', 'K0008'),
('T0012', 200000, '2019-05-17', 0, 'gina malya putri', '', '0', '', 'K0006'),
('T0013', 150000, '2019-05-17', 0, 'erwin sulistio', 'CZXCVZX', '1124134124', 'ASDAS@GMAIL.COM', 'K0002'),
('T0014', 1000000, '2019-05-17', 0, 'Hamba Allah', '', '0', '', 'K0009'),
('T0015', 250000, '2019-05-17', 0, 'bayu km', '', '0', '', 'K0011'),
('T0016', 100000, '2019-05-18', 0, 'alldy novrialldy', '', '0', '', 'K0005'),
('T0017', 100000, '2019-06-09', 0, 'wibi sono ', '', '0', '', 'K0002'),
('T0018', 500000, '2019-06-09', 0, 'Nizar azuari', '', '0', '', 'K0006'),
('T0019', 1000000, '2019-08-05', 0, 'Syaiful rochmat', '', '0', '', 'K0005'),
('T0020', 500000, '2019-08-06', 0, 'muhammad Irfan', '', '0', '', 'K0006'),
('T0021', 100000, '2019-08-09', 0, 'erwin', '', '0', '', 'K0007'),
('T0022', 100000, '2019-08-09', 0, 'lalu gian ramadhani', '', '0', '', 'K0002'),
('T0023', 100000, '2019-08-09', 0, 'Awid Sagria', '', '0', '', 'K0011'),
('T0024', 100000, '2019-08-09', 0, 'muhammad rijal', '', '0', '', 'K0008'),
('T0025', 100000, '2019-08-09', 0, 'windy sheila ramadhani', '', '0', '', 'K0011'),
('T0026', 100000, '2019-08-09', 0, 'abdy firdaus', '', '0', '', 'K0011'),
('T0027', 200000, '2019-08-08', 0, 'Heru Nugroho Zailani', '', '0', '', 'K0011'),
('T0028', 1500000, '2019-08-07', 0, 'Bimo Feriyan', '', '0', '', 'K0009'),
('T0029', 100000, '2019-08-09', 0, 'anwar', '', '0', '', 'K0005'),
('T0030', 100000, '2019-08-09', 0, 'bayu', '', '0', '', 'K0002'),
('T0031', 100000, '2019-09-20', 0, 'anwar', '', '0', '', 'K0006'),
('T0032', 1500000, '2019-09-08', 123123123, '123123123', '123123123', '3123123123', 'susi@gmail.com', 'K0005'),
('T0033', 1500000, '2019-09-30', 2147483647, 'rani', 'subroto', '123456789098', 'susi2345@gmail.com', 'K0005'),
('T0034', 100000, '2019-09-18', 2147483647, 'ipul', 'asdfghhgb', '45675326789', 'mackendserfg@gmail.com', 'K0002'),
('T0035', 250000, '2019-09-29', 2147483647, 'guah', 'dcgvjhbkjk', '4589765', 'susi@gmail.com', 'K0006'),
('T0036', 150000, '2019-09-30', 2147483647, 'munir', 'zxcvbnkoj', '387676543234567', 'mackendsfcgvjbkjnk@gmail.com', 'K0002'),
('T0037', 1500000, '2019-09-30', 1234757868, 'mackend leonardo', 'assaa', '52544365465', 'mackends@gmail.com', 'K0005'),
('T0038', 1000000, '2019-10-02', 123123123, 'VVVV', 'asdasdad', '23123123123123', 'susi@gmail.com', 'K0005'),
('T0039', 14000, '2019-10-01', 0, 'muhammad saipul', 'Glahgasari VH4/590A Yogyakarta ', '081354857122', '', 'K0019'),
('T0040', 14000, '2019-10-07', 0, 'saputra wintoro', 'Glahgasari VH4/590A Yogyakarta ', '085248357771', '', 'K0019'),
('T0041', 14000, '2019-10-08', 0, 'hariyanti', 'Glahgasari VH4/590A Yogyakarta ', '087845322233', '', 'K0019'),
('T0042', 14000, '2019-10-22', 0, 'muhammad khaorul', 'Glahgasari VH4/590A Yogyakarta ', '085743910075', '', 'K0019'),
('T0043', 14000, '2019-10-14', 0, 'wibowo saputra', 'Glahgasari VH4/590A Yogyakarta ', '081229997755', '', 'K0019'),
('T0044', 500000, '2019-10-10', 0, 'muhammad hidayat', 'Glahgasari VH4/590A Yogyakarta ', '085612125678', '', 'K0020'),
('T0045', 350000, '2019-10-21', 0, 'mahrusadi', 'Glahgasari VH4/590A Yogyakarta ', '081348224572', '', 'K0020'),
('T0046', 250000, '2019-10-17', 0, 'dewi saputri', 'Glahgasari VH4/590A Yogyakarta ', '085213774328', '', 'K0020'),
('T0047', 470000, '2019-10-07', 0, 'muhammad asad', 'Glahgasari VH4/590A Yogyakarta ', '085256779090', '', 'K0020'),
('T0048', 14000, '2019-10-23', 0, 'abdul hamid', 'Glahgasari VH4/590A Yogyakarta ', '085255432891', '', 'K0019'),
('T0049', 50000, '2019-10-31', 0, 'muhammad rizal', 'Glahgasari VH4/590A Yogyakarta ', '081348567770', '', 'K0021'),
('T0050', 50000, '2019-10-15', 0, 'bahruddin', 'Glahgasari VH4/590A Yogyakarta', '0812547688', '', 'K0026'),
('T0051', 300000, '2019-10-08', 0, 'nita hildayanti', 'Glahgasari VH4/590A Yogyakarta', '07856568788', '', 'K0022'),
('T0052', 230000, '2019-10-16', 0, 'hariyoto', 'Glahgasari VH4/590A Yogyakarta', '087823336775', '', 'K0024'),
('T0053', 50000, '2019-10-17', 0, 'yuni', 'Glahgasari VH4/590A Yogyakarta', '085756564477', '', 'K0021');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `fasilitas`
--
ALTER TABLE `fasilitas`
  ADD PRIMARY KEY (`id_fasilitas`);

--
-- Indexes for table `jamaah`
--
ALTER TABLE `jamaah`
  ADD PRIMARY KEY (`nik`),
  ADD KEY `id` (`id_jamaah`),
  ADD KEY `no_kk` (`no_kk`);

--
-- Indexes for table `jenis_transaksi`
--
ALTER TABLE `jenis_transaksi`
  ADD PRIMARY KEY (`id_jenis`),
  ADD KEY `id_masjid` (`id_masjid`);

--
-- Indexes for table `jenis_zakat`
--
ALTER TABLE `jenis_zakat`
  ADD PRIMARY KEY (`id_jenis`),
  ADD KEY `id_masjid` (`id_masjid`);

--
-- Indexes for table `kartu_keluarga`
--
ALTER TABLE `kartu_keluarga`
  ADD PRIMARY KEY (`no_kk`),
  ADD KEY `id` (`id_kk`),
  ADD KEY `id_masjid` (`id_masjid`);

--
-- Indexes for table `kegiatan`
--
ALTER TABLE `kegiatan`
  ADD PRIMARY KEY (`id_kegiatan`),
  ADD KEY `id_masjid` (`id_masjid`);

--
-- Indexes for table `masjid`
--
ALTER TABLE `masjid`
  ADD PRIMARY KEY (`id_masjid`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_masjid` (`id_jenis`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `id_masjid` (`id_masjid`);

--
-- Indexes for table `zakat`
--
ALTER TABLE `zakat`
  ADD PRIMARY KEY (`id_zakat`),
  ADD KEY `id_masjid` (`id_jenis`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jamaah`
--
ALTER TABLE `jamaah`
  MODIFY `id_jamaah` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kartu_keluarga`
--
ALTER TABLE `kartu_keluarga`
  MODIFY `id_kk` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kegiatan`
--
ALTER TABLE `kegiatan`
  MODIFY `id_kegiatan` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `jamaah`
--
ALTER TABLE `jamaah`
  ADD CONSTRAINT `fk_kk_jamaah` FOREIGN KEY (`no_kk`) REFERENCES `kartu_keluarga` (`no_kk`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jenis_transaksi`
--
ALTER TABLE `jenis_transaksi`
  ADD CONSTRAINT `fk_masjid_jenist` FOREIGN KEY (`id_masjid`) REFERENCES `masjid` (`id_masjid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jenis_zakat`
--
ALTER TABLE `jenis_zakat`
  ADD CONSTRAINT `fk_masjid_jenis` FOREIGN KEY (`id_masjid`) REFERENCES `masjid` (`id_masjid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kartu_keluarga`
--
ALTER TABLE `kartu_keluarga`
  ADD CONSTRAINT `fk_masjid_kk` FOREIGN KEY (`id_masjid`) REFERENCES `masjid` (`id_masjid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kegiatan`
--
ALTER TABLE `kegiatan`
  ADD CONSTRAINT `fk_masjid_kegiatan` FOREIGN KEY (`id_masjid`) REFERENCES `masjid` (`id_masjid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `fk_jenist` FOREIGN KEY (`id_jenis`) REFERENCES `jenis_transaksi` (`id_jenis`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_masjid_user` FOREIGN KEY (`id_masjid`) REFERENCES `masjid` (`id_masjid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `zakat`
--
ALTER TABLE `zakat`
  ADD CONSTRAINT `fk_jenis` FOREIGN KEY (`id_jenis`) REFERENCES `jenis_zakat` (`id_jenis`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
