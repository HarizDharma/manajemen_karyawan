-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 01 Jul 2021 pada 17.28
-- Versi server: 10.4.17-MariaDB
-- Versi PHP: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `manajemen_karyawan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `ak_login`
--

CREATE TABLE `ak_login` (
  `id_pegawai` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `ak_login`
--

INSERT INTO `ak_login` (`id_pegawai`, `username`, `password`, `status`) VALUES
(98, 'raihan1', '1234', 'aktif'),
(212, 'ad', '1234', 'aktif'),
(1198, 'ades', '1234', 'aktif');

-- --------------------------------------------------------

--
-- Struktur dari tabel `job_desk`
--

CREATE TABLE `job_desk` (
  `id_job` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `NamaJob` text NOT NULL,
  `tanggal` date NOT NULL,
  `supervisor` varchar(18) NOT NULL,
  `StatusJob` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `job_desk`
--

INSERT INTO `job_desk` (`id_job`, `id_pegawai`, `NamaJob`, `tanggal`, `supervisor`, `StatusJob`) VALUES
(31123, 1198, 'ForntEnd', '2021-06-28', 'polo', 1),
(413123, 1198, 'Ade', '2021-07-02', 'polo', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pegawai`
--

CREATE TABLE `pegawai` (
  `id_pegawai` int(12) NOT NULL,
  `NamaPeg` varchar(50) NOT NULL,
  `Jenis_kelamin` enum('L','P') NOT NULL,
  `AlamatPeg` text NOT NULL,
  `EmailPeg` varchar(255) NOT NULL,
  `NoTlpPeg` int(18) NOT NULL,
  `JabatanPeg` varchar(20) NOT NULL,
  `gaji` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pegawai`
--

INSERT INTO `pegawai` (`id_pegawai`, `NamaPeg`, `Jenis_kelamin`, `AlamatPeg`, `EmailPeg`, `NoTlpPeg`, `JabatanPeg`, `gaji`) VALUES
(98, 'Raihan Alizar Sulaimanllll', 'L', 'Singosari', 'raihanalizar@gmail.com', 81300029, 'Admin', 100000),
(212, 'polo', 'L', 'Singosari', 'raihanalizar@gmail.com', 81300029, 'Supervisor', 100000),
(1198, 'ades', 'L', 'Singosari', 'raihanalizar@gmail.com', 81300029, 'Pegawai', 100000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `rekap_hadir`
--

CREATE TABLE `rekap_hadir` (
  `id` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `waktu` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `rekap_hadir`
--

INSERT INTO `rekap_hadir` (`id`, `id_pegawai`, `waktu`, `status`) VALUES
(34, 1198, '2021-06-19 12:20:12', 'telat'),
(35, 1198, '2021-06-22 12:37:23', 'telat'),
(36, 1198, '2021-06-23 00:38:13', 'tepat watu');

-- --------------------------------------------------------

--
-- Struktur dari tabel `to_do_list_job`
--

CREATE TABLE `to_do_list_job` (
  `id_to_do_list` int(11) NOT NULL,
  `id_job` int(11) NOT NULL,
  `todolist` varchar(255) NOT NULL,
  `jam_batas_mulai` time NOT NULL,
  `jam_batas_akhir` time NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `to_do_list_job`
--

INSERT INTO `to_do_list_job` (`id_to_do_list`, `id_job`, `todolist`, `jam_batas_mulai`, `jam_batas_akhir`, `tanggal`) VALUES
(18, 31123, 'qq', '11:36:26', '16:36:26', '2021-06-29'),
(44, 31123, 'sad', '10:56:47', '10:56:55', '2021-06-29');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `ak_login`
--
ALTER TABLE `ak_login`
  ADD PRIMARY KEY (`id_pegawai`);

--
-- Indeks untuk tabel `job_desk`
--
ALTER TABLE `job_desk`
  ADD PRIMARY KEY (`id_job`);

--
-- Indeks untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id_pegawai`);

--
-- Indeks untuk tabel `rekap_hadir`
--
ALTER TABLE `rekap_hadir`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `to_do_list_job`
--
ALTER TABLE `to_do_list_job`
  ADD PRIMARY KEY (`id_to_do_list`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `rekap_hadir`
--
ALTER TABLE `rekap_hadir`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
