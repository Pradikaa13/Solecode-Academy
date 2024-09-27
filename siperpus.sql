-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 27 Sep 2024 pada 10.20
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `siperpus`
--
CREATE DATABASE IF NOT EXISTS `siperpus` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `siperpus`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

DROP TABLE IF EXISTS `buku`;
CREATE TABLE IF NOT EXISTS `buku` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `judul` varchar(255) NOT NULL,
  `pengarang` varchar(100) NOT NULL,
  `penerbit` varchar(100) NOT NULL,
  `isbn` varchar(20) NOT NULL,
  `tahun_terbit` year(4) NOT NULL,
  `jumlah_tersedia` int(11) NOT NULL,
  `kategori_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `kategori_id` (`kategori_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `buku`
--

INSERT INTO `buku` (`id`, `judul`, `pengarang`, `penerbit`, `isbn`, `tahun_terbit`, `jumlah_tersedia`, `kategori_id`) VALUES
(1, 'Elon Musk Merakit Starlink', 'Elon Musk', 'Gramedia', 'ISN0489-SS', '2023', 5, 1),
(2, 'Elon Musk Marketing Starlink', 'Elon Musk', 'Gramedia', 'ISN0489-SB', '2024', 20, 1),
(3, 'Resep Dimsum Ayam Peperoni', 'Chef Arnold', 'Pendekar Raya', 'ISN9321-RR', '2021', 1, 4),
(4, 'Berpolitik ala Gen-Z', 'Purwadi M', 'Senada Pustaka', 'IS329-PP', '2022', 4, 3),
(5, 'Menangani Covid-19 Di Era Pandemi', 'Siti Nurbaya', 'Senada Pustaka', 'IS768-PP', '2020', 9, 2),
(6, 'Belajar Python untuk Pemula', 'Ahmad Fauzi', 'Tech Press', 'ISN1234-A', '2022', 15, 1),
(7, 'Kesehatan Mental di Era Digital', 'Diana S', 'Sahabat Media', 'ISN5678-B', '2023', 7, 2),
(8, 'Politik dalam Sastra', 'Rina L', 'Literasi Pustaka', 'ISN9101-C', '2021', 3, 3),
(9, 'Resep Masakan Sehari-hari', 'Chef Tika', 'Dapur Kita', 'ISN1122-D', '2020', 10, 4),
(10, 'Seni dan Musik dalam Kebudayaan', 'Budi Setiawan', 'Kultur Pustaka', 'ISN3344-E', '2022', 6, 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

DROP TABLE IF EXISTS `kategori`;
CREATE TABLE IF NOT EXISTS `kategori` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id`, `nama`) VALUES
(1, 'Pendidikan'),
(2, 'Kesehatan'),
(3, 'Politik'),
(4, 'Resep Makanan'),
(5, 'Seni dan Musik');

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman`
--

DROP TABLE IF EXISTS `peminjaman`;
CREATE TABLE IF NOT EXISTS `peminjaman` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `anggota_id` int(11) DEFAULT NULL,
  `buku_id` int(11) DEFAULT NULL,
  `tanggal_pinjam` date NOT NULL,
  `tanggal_batas_kembali` date NOT NULL,
  `tanggal_kembali` date DEFAULT NULL,
  `denda` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `anggota_id` (`anggota_id`),
  KEY `buku_id` (`buku_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `peminjaman`
--

INSERT INTO `peminjaman` (`id`, `anggota_id`, `buku_id`, `tanggal_pinjam`, `tanggal_batas_kembali`, `tanggal_kembali`, `denda`) VALUES
(1, 1, 1, '2024-09-01', '2024-09-07', '2024-09-06', 0),
(2, 1, 2, '2024-09-01', '2024-09-07', '2024-09-05', 0),
(3, 1, 3, '2024-09-01', '2024-09-07', '2024-09-07', 0),
(4, 2, 4, '2024-09-02', '2024-09-09', '2024-09-08', 0),
(5, 2, 5, '2024-09-02', '2024-09-09', '2024-09-09', 0),
(6, 2, 6, '2024-09-02', '2024-09-09', '2024-09-10', 0),
(7, 3, 7, '2024-09-03', '2024-09-10', '2024-09-09', 0),
(8, 3, 8, '2024-09-03', '2024-09-10', '2024-09-10', 0),
(9, 3, 9, '2024-09-03', '2024-09-10', '2024-09-15', 5000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `no_ktp` varchar(20) NOT NULL,
  `no_hp` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `tanggal_terdaftar` date NOT NULL DEFAULT curdate(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `nama`, `alamat`, `no_ktp`, `no_hp`, `email`, `tanggal_terdaftar`) VALUES
(1, 'User 1', 'Jl. Merdeka No. 1, Jakarta', '1234567890123456', '081234567890', 'ahmad.rizki@example.com', '2024-09-27'),
(2, 'User 2', 'Jl. Cempaka No. 10, Bandung', '2345678901234567', '082345678901', 'siti.aisyah@example.com', '2024-09-27'),
(3, 'User 3', 'Jl. Melati No. 5, Surabaya', '3456789012345678', '083456789012', 'budi.santoso@example.com', '2024-09-27'),
(4, 'User 4', 'Jl. Kenanga No. 20, Yogyakarta', '4567890123456789', '084567890123', 'dewi.lestari@example.com', '2024-09-27'),
(5, 'User 5', 'Jl. Mawar No. 15, Semarang', '5678901234567890', '085678901234', 'eko.prabowo@example.com', '2024-09-27');

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD CONSTRAINT `buku_ibfk_1` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`id`);

--
-- Ketidakleluasaan untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`anggota_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `peminjaman_ibfk_2` FOREIGN KEY (`buku_id`) REFERENCES `buku` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
