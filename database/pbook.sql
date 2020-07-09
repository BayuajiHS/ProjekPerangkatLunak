-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 08 Jul 2020 pada 15.09
-- Versi Server: 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pbook`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `banner`
--

CREATE TABLE `banner` (
  `banner_id` int(11) NOT NULL,
  `banner` varchar(300) NOT NULL,
  `gambar` varchar(300) NOT NULL,
  `status` enum('on','off') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `banner`
--

INSERT INTO `banner` (`banner_id`, `banner`, `gambar`, `status`) VALUES
(1, 'Pbook', 'pbook2.png', 'on'),
(2, 'Pbook2', 'pbook1.png', 'on'),
(3, 'pbook3', '13.jpg', 'off');

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

CREATE TABLE `buku` (
  `buku_id` int(10) NOT NULL,
  `kategori_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `judul_buku` varchar(250) NOT NULL,
  `deskripsi` text NOT NULL,
  `gambar` varchar(300) NOT NULL,
  `harga` int(10) NOT NULL,
  `stok` tinyint(1) NOT NULL,
  `rekening` varchar(50) NOT NULL,
  `status` enum('on','off') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `buku`
--

INSERT INTO `buku` (`buku_id`, `kategori_id`, `user_id`, `judul_buku`, `deskripsi`, `gambar`, `harga`, `stok`, `rekening`, `status`) VALUES
(1, 3, 12, 'Si Kancil', '<p><em><strong>Lorem ipsum dolor sit amet</strong></em>, consectetur adipiscing elit. Nunc sollicitudin nisl ligula, sed iaculis purus accumsan sit amet. Maecenas sapien sapien, tincidunt sed egestas vitae, consequat vel turpis. Aenean at velit sed nisl tincidunt ultricies quis et mi. Morbi elit ipsum, fringilla faucibus justo in, feugiat malesuada enim. Mauris arcu lacus, semper sit amet purus nec, convallis luctus neque. Nulla sed interdum risus. Maecenas viverra dui in mauris dictum imperdiet. Nulla lacinia lacus urna, eget elementum urna finibus luctus. Nam in nisi eu purus ornare molestie. Quisque tincidunt dictum fringilla. Nullam maximus, leo ultrices efficitur gravida, dolor velit vulputate lectus, ac elementum nulla odio sed tortor. Aliquam a nisi sit amet ante condimentum pharetra ac in metus. Pellentesque vel malesuada nunc. Cras nec tempus purus.</p><p>Vivamus nulla sem, aliquam sit amet nunc lacinia, condimentum dictum massa. Morbi faucibus sem neque, eget facilisis justo dictum vitae. Nunc porta felis at leo auctor tempor. Ut et iaculis velit, vel ornare leo. Curabitur ultricies posuere eros ut lobortis. Fusce vulputate diam quis dapibus eleifend. Fusce vitae metus urna.</p><p>Nam nec massa auctor, suscipit ex eget, aliquam elit. Nunc ornare ultrices risus egestas viverra. Sed non ultricies sapien. In maximus justo eu ipsum volutpat, sit amet tempor nulla euismod. Cras varius fermentum consectetur. Pellentesque euismod velit metus, non porttitor velit dignissim at. Donec varius tortor eu quam rhoncus eleifend. Nunc sed malesuada mi, sed malesuada nisi.</p><p>Sed et nunc velit. Nullam imperdiet pellentesque magna, vel cursus eros fermentum et. Donec volutpat ligula magna, ac imperdiet est condimentum vel. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc eu auctor erat, sed tincidunt risus. Duis cursus nunc ut dapibus cursus. Vestibulum tincidunt diam sed risus pretium, in tincidunt ex tristique. Mauris cursus lectus quis placerat rhoncus. Duis maximus lectus vel felis scelerisque gravida. Integer nibh purus, tincidunt eu scelerisque tristique, porta nec leo. Aliquam porta, mi in semper viverra, augue velit condimentum ante, id faucibus velit velit ac justo.</p><p>Nullam dapibus elementum velit, eu vehicula ex viverra vitae. Morbi ac arcu lorem. Ut a felis molestie, posuere est a, ultricies ex. Pellentesque vel augue ac velit commodo sagittis. Integer auctor mollis mauris, ut vestibulum nulla. Suspendisse pretium accumsan arcu. Fusce pulvinar, odio ac faucibus venenatis, justo odio tincidunt ipsum, id ornare dui lectus et justo. Donec non imperdiet eros. Aenean id neque ac risus aliquam commodo. Suspendisse suscipit sapien diam, a sollicitudin ex sagittis vel.</p>', 'sikancil.jpg', 4000, 3, '183789123891 (A/N JADON BNI)', 'on'),
(2, 1, 2, 'Bleaches', '<p>Bleaches</p>', 'bleach.jpg', 5000, 2, '', 'on'),
(3, 1, 12, 'Si Juki', '<p><em><strong>Lorem ipsum dolor sit amet</strong></em>, consectetur adipiscing elit. Nunc sollicitudin nisl ligula, sed iaculis purus accumsan sit amet. Maecenas sapien sapien, tincidunt sed egestas vitae, consequat vel turpis. Aenean at velit sed nisl tincidunt ultricies quis et mi. Morbi elit ipsum, fringilla faucibus justo in, feugiat malesuada enim. Mauris arcu lacus, semper sit amet purus nec, convallis luctus neque. Nulla sed interdum risus. Maecenas viverra dui in mauris dictum imperdiet. Nulla lacinia lacus urna, eget elementum urna finibus luctus. Nam in nisi eu purus ornare molestie. Quisque tincidunt dictum fringilla. Nullam maximus, leo ultrices efficitur gravida, dolor velit vulputate lectus, ac elementum nulla odio sed tortor. Aliquam a nisi sit amet ante condimentum pharetra ac in metus. Pellentesque vel malesuada nunc. Cras nec tempus purus.</p><p>Vivamus nulla sem, aliquam sit amet nunc lacinia, condimentum dictum massa. Morbi faucibus sem neque, eget facilisis justo dictum vitae. Nunc porta felis at leo auctor tempor. Ut et iaculis velit, vel ornare leo. Curabitur ultricies posuere eros ut lobortis. Fusce vulputate diam quis dapibus eleifend. Fusce vitae metus urna.</p><p>Nam nec massa auctor, suscipit ex eget, aliquam elit. Nunc ornare ultrices risus egestas viverra. Sed non ultricies sapien. In maximus justo eu ipsum volutpat, sit amet tempor nulla euismod. Cras varius fermentum consectetur. Pellentesque euismod velit metus, non porttitor velit dignissim at. Donec varius tortor eu quam rhoncus eleifend. Nunc sed malesuada mi, sed malesuada nisi.</p><p>Sed et nunc velit. Nullam imperdiet pellentesque magna, vel cursus eros fermentum et. Donec volutpat ligula magna, ac imperdiet est condimentum vel. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc eu auctor erat, sed tincidunt risus. Duis cursus nunc ut dapibus cursus. Vestibulum tincidunt diam sed risus pretium, in tincidunt ex tristique. Mauris cursus lectus quis placerat rhoncus. Duis maximus lectus vel felis scelerisque gravida. Integer nibh purus, tincidunt eu scelerisque tristique, porta nec leo. Aliquam porta, mi in semper viverra, augue velit condimentum ante, id faucibus velit velit ac justo.</p><p>Nullam dapibus elementum velit, eu vehicula ex viverra vitae. Morbi ac arcu lorem. Ut a felis molestie, posuere est a, ultricies ex. Pellentesque vel augue ac velit commodo sagittis. Integer auctor mollis mauris, ut vestibulum nulla. Suspendisse pretium accumsan arcu. Fusce pulvinar, odio ac faucibus venenatis, justo odio tincidunt ipsum, id ornare dui lectus et justo. Donec non imperdiet eros. Aenean id neque ac risus aliquam commodo. Suspendisse suscipit sapien diam, a sollicitudin ex sagittis vel.</p>', 'juki.png', 5000, 2, '10923912319 (A/N JADON BCA)', 'on'),
(4, 1, 13, 'Harry Potter', '<p><em><strong>Lorem ipsum dolor sit amet</strong></em>, consectetur adipiscing elit. Nunc sollicitudin nisl ligula, sed iaculis purus accumsan sit amet. Maecenas sapien sapien, tincidunt sed egestas vitae, consequat vel turpis. Aenean at velit sed nisl tincidunt ultricies quis et mi. Morbi elit ipsum, fringilla faucibus justo in, feugiat malesuada enim. Mauris arcu lacus, semper sit amet purus nec, convallis luctus neque. Nulla sed interdum risus. Maecenas viverra dui in mauris dictum imperdiet. Nulla lacinia lacus urna, eget elementum urna finibus luctus. Nam in nisi eu purus ornare molestie. Quisque tincidunt dictum fringilla. Nullam maximus, leo ultrices efficitur gravida, dolor velit vulputate lectus, ac elementum nulla odio sed tortor. Aliquam a nisi sit amet ante condimentum pharetra ac in metus. Pellentesque vel malesuada nunc. Cras nec tempus purus.</p><p>Vivamus nulla sem, aliquam sit amet nunc lacinia, condimentum dictum massa. Morbi faucibus sem neque, eget facilisis justo dictum vitae. Nunc porta felis at leo auctor tempor. Ut et iaculis velit, vel ornare leo. Curabitur ultricies posuere eros ut lobortis. Fusce vulputate diam quis dapibus eleifend. Fusce vitae metus urna.</p><p>Nam nec massa auctor, suscipit ex eget, aliquam elit. Nunc ornare ultrices risus egestas viverra. Sed non ultricies sapien. In maximus justo eu ipsum volutpat, sit amet tempor nulla euismod. Cras varius fermentum consectetur. Pellentesque euismod velit metus, non porttitor velit dignissim at. Donec varius tortor eu quam rhoncus eleifend. Nunc sed malesuada mi, sed malesuada nisi.</p><p>Sed et nunc velit. Nullam imperdiet pellentesque magna, vel cursus eros fermentum et. Donec volutpat ligula magna, ac imperdiet est condimentum vel. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc eu auctor erat, sed tincidunt risus. Duis cursus nunc ut dapibus cursus. Vestibulum tincidunt diam sed risus pretium, in tincidunt ex tristique. Mauris cursus lectus quis placerat rhoncus. Duis maximus lectus vel felis scelerisque gravida. Integer nibh purus, tincidunt eu scelerisque tristique, porta nec leo. Aliquam porta, mi in semper viverra, augue velit condimentum ante, id faucibus velit velit ac justo.</p><p>Nullam dapibus elementum velit, eu vehicula ex viverra vitae. Morbi ac arcu lorem. Ut a felis molestie, posuere est a, ultricies ex. Pellentesque vel augue ac velit commodo sagittis. Integer auctor mollis mauris, ut vestibulum nulla. Suspendisse pretium accumsan arcu. Fusce pulvinar, odio ac faucibus venenatis, justo odio tincidunt ipsum, id ornare dui lectus et justo. Donec non imperdiet eros. Aenean id neque ac risus aliquam commodo. Suspendisse suscipit sapien diam, a sollicitudin ex sagittis vel.</p>', 'harry.jpg', 7000, 2, '1231243132212 (A/N DANANG BNI)', 'on'),
(7, 1, 12, 'Adikku Pahlawanku', '<p><em><strong>Lorem ipsum dolor sit amet</strong></em>, consectetur adipiscing elit. Nunc sollicitudin nisl ligula, sed iaculis purus accumsan sit amet. Maecenas sapien sapien, tincidunt sed egestas vitae, consequat vel turpis. Aenean at velit sed nisl tincidunt ultricies quis et mi. Morbi elit ipsum, fringilla faucibus justo in, feugiat malesuada enim. Mauris arcu lacus, semper sit amet purus nec, convallis luctus neque. Nulla sed interdum risus. Maecenas viverra dui in mauris dictum imperdiet. Nulla lacinia lacus urna, eget elementum urna finibus luctus. Nam in nisi eu purus ornare molestie. Quisque tincidunt dictum fringilla. Nullam maximus, leo ultrices efficitur gravida, dolor velit vulputate lectus, ac elementum nulla odio sed tortor. Aliquam a nisi sit amet ante condimentum pharetra ac in metus. Pellentesque vel malesuada nunc. Cras nec tempus purus.</p><p>Vivamus nulla sem, aliquam sit amet nunc lacinia, condimentum dictum massa. Morbi faucibus sem neque, eget facilisis justo dictum vitae. Nunc porta felis at leo auctor tempor. Ut et iaculis velit, vel ornare leo. Curabitur ultricies posuere eros ut lobortis. Fusce vulputate diam quis dapibus eleifend. Fusce vitae metus urna.</p><p>Nam nec massa auctor, suscipit ex eget, aliquam elit. Nunc ornare ultrices risus egestas viverra. Sed non ultricies sapien. In maximus justo eu ipsum volutpat, sit amet tempor nulla euismod. Cras varius fermentum consectetur. Pellentesque euismod velit metus, non porttitor velit dignissim at. Donec varius tortor eu quam rhoncus eleifend. Nunc sed malesuada mi, sed malesuada nisi.</p><p>Sed et nunc velit. Nullam imperdiet pellentesque magna, vel cursus eros fermentum et. Donec volutpat ligula magna, ac imperdiet est condimentum vel. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc eu auctor erat, sed tincidunt risus. Duis cursus nunc ut dapibus cursus. Vestibulum tincidunt diam sed risus pretium, in tincidunt ex tristique. Mauris cursus lectus quis placerat rhoncus. Duis maximus lectus vel felis scelerisque gravida. Integer nibh purus, tincidunt eu scelerisque tristique, porta nec leo. Aliquam porta, mi in semper viverra, augue velit condimentum ante, id faucibus velit velit ac justo.</p><p>Nullam dapibus elementum velit, eu vehicula ex viverra vitae. Morbi ac arcu lorem. Ut a felis molestie, posuere est a, ultricies ex. Pellentesque vel augue ac velit commodo sagittis. Integer auctor mollis mauris, ut vestibulum nulla. Suspendisse pretium accumsan arcu. Fusce pulvinar, odio ac faucibus venenatis, justo odio tincidunt ipsum, id ornare dui lectus et justo. Donec non imperdiet eros. Aenean id neque ac risus aliquam commodo. Suspendisse suscipit sapien diam, a sollicitudin ex sagittis vel.</p>', 'adikkuPahlawanku.jpg', 6000, 2, '123124313221a (A/N JADON)', 'on');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `kategori_id` int(10) NOT NULL,
  `kategori` varchar(150) NOT NULL,
  `status` enum('on','off') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`kategori_id`, `kategori`, `status`) VALUES
(1, 'Komik', 'on'),
(2, 'Novel', 'on'),
(3, 'Dongeng', 'on'),
(4, 'Cerita Rakyat', 'on'),
(5, 'Hidayah', 'on');

-- --------------------------------------------------------

--
-- Struktur dari tabel `konfirmasi_pembayaran`
--

CREATE TABLE `konfirmasi_pembayaran` (
  `konfirmasi_id` int(10) NOT NULL,
  `pesanan_id` int(10) NOT NULL,
  `nomor_rekening` varchar(20) NOT NULL,
  `nama_account` varchar(150) NOT NULL,
  `tanggal_transfer` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `konfirmasi_pembayaran`
--

INSERT INTO `konfirmasi_pembayaran` (`konfirmasi_id`, `pesanan_id`, `nomor_rekening`, `nama_account`, `tanggal_transfer`) VALUES
(1, 2, '0008888', 'Jeong', '2016-06-19'),
(2, 3, '0008888', 'Lee', '2016-06-19'),
(3, 4, '0008888', 'Jeong', '2016-06-19'),
(4, 11, '0009999', 'Acok', '2019-09-21'),
(5, 11, '00992301', 'Acok', '2018-02-10'),
(6, 11, '0889909', 'Acok', '2019-09-10'),
(7, 12, '000099992183', 'Bambang', '2019-08-08'),
(8, 14, '08123193123', 'Aceng', '2019-08-09'),
(9, 14, '12312', 'asdasd', '2019-08-04'),
(10, 14, '1231241', 'AAAA', '2019-08-04'),
(11, 15, '123123123', 'AAA', '2019-08-04'),
(12, 16, '09090909090', 'ADMIN', '2019-08-04'),
(13, 17, '000012312312', 'Bayu', '2018-09-09'),
(14, 13, '00010231', 'Jok', '2019-08-09'),
(15, 18, '10231923123', 'Maa', '2019-02-12'),
(16, 19, '01238912831', 'Danang', '2019-12-16'),
(17, 20, '089123818237', 'Nang', '2020-01-06'),
(18, 21, '1092837465', 'Danang Syaifullah', '2020-04-10'),
(19, 21, '1092837465', 'Danang SyaifullahS', '2020-04-10');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kurir`
--

CREATE TABLE `kurir` (
  `kurir_id` int(10) NOT NULL,
  `kurir` varchar(20) NOT NULL,
  `tarif_kurir` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kurir`
--

INSERT INTO `kurir` (`kurir_id`, `kurir`, `tarif_kurir`) VALUES
(1, 'Pakai', 5000),
(2, 'Tidak Pakai', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesanan`
--

CREATE TABLE `pesanan` (
  `pesanan_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `kurir_id` int(10) NOT NULL,
  `pinjam_id` int(10) NOT NULL,
  `nama_penerima` varchar(150) NOT NULL,
  `nomor_telepon` varchar(15) NOT NULL,
  `alamat` varchar(300) NOT NULL,
  `tanggal_pemesanan` datetime NOT NULL,
  `tanggal_pengembalian` date NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pesanan`
--

INSERT INTO `pesanan` (`pesanan_id`, `user_id`, `kurir_id`, `pinjam_id`, `nama_penerima`, `nomor_telepon`, `alamat`, `tanggal_pemesanan`, `tanggal_pengembalian`, `status`) VALUES
(2, 2, 1, 1, 'Jeong', '00000', 'Jl. XXXXX', '2016-11-08 06:11:24', '2019-12-10', 1),
(3, 6, 1, 2, 'Lee', '0000', 'Jl. aaaa', '2016-10-08 10:48:45', '0000-00-00', 2),
(4, 6, 1, 3, 'Lee', '0000', 'Jl. AAA', '2016-10-08 12:01:55', '0000-00-00', 2),
(5, 2, 1, 1, 'AAA', '111', 'Jl xxx', '2019-12-15 05:59:37', '0000-00-00', 0),
(6, 2, 2, 4, 'Acok', '0000', 'Jl Jalan', '2019-12-15 06:00:33', '0000-00-00', 0),
(7, 2, 1, 1, '', '', '', '2019-12-15 06:20:53', '0000-00-00', 0),
(8, 2, 1, 1, 'Joko', '00000', 'Jalan', '2019-12-15 06:30:12', '0000-00-00', 2),
(9, 2, 1, 2, 'Asep', '081283781283', 'Truntum', '2019-12-15 06:31:00', '0000-00-00', 0),
(10, 2, 2, 4, 'Bayuaji', '0241283818', 'Jl Nakula', '2019-12-15 07:14:09', '0000-00-00', 0),
(11, 2, 1, 2, 'Bambang', '089123123', 'Jl Jl', '2019-12-15 07:17:55', '0000-00-00', 1),
(12, 2, 2, 3, 'Bambang', '08912838712', 'Jalan Cempaka', '2019-12-15 07:32:47', '0000-00-00', 1),
(13, 2, 1, 4, 'Aceng', '09812873812', 'Jl Jalan', '2019-12-15 07:37:59', '2019-12-30', 2),
(14, 2, 1, 4, 'Aceng', '09812873812', 'Jl Jalan', '2019-12-15 07:38:11', '2019-12-18', 2),
(15, 2, 1, 1, '', '', '', '2019-12-15 07:47:24', '2019-12-31', 2),
(16, 2, 1, 1, 'Admin', '08919231', 'Jl Admin', '2019-12-15 07:49:46', '2019-12-03', 1),
(17, 2, 1, 3, 'Bay', '024588234', 'Jl Merbabu', '2019-12-15 14:43:00', '2019-12-03', 2),
(18, 2, 1, 2, 'Maaa', '012931923', 'Jl Parang', '2019-12-16 14:27:53', '2018-12-27', 1),
(19, 13, 1, 3, 'Danang ', '08919231239', 'Jl Sadewa', '2019-12-16 15:06:11', '2019-12-30', 2),
(20, 13, 2, 4, 'Nang', '082198839182', 'Truntum', '2020-01-06 09:47:19', '2020-02-03', 2),
(21, 13, 1, 2, 'Danang Syaifullah', '091283123', 'Jl xxxx', '2020-04-10 10:17:53', '2020-04-19', 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesanan_detail`
--

CREATE TABLE `pesanan_detail` (
  `pesanan_id` int(10) NOT NULL,
  `buku_id` int(10) NOT NULL,
  `quantity` tinyint(2) NOT NULL,
  `harga` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pesanan_detail`
--

INSERT INTO `pesanan_detail` (`pesanan_id`, `buku_id`, `quantity`, `harga`) VALUES
(2, 6, 1, 2900000),
(2, 5, 1, 12700000),
(3, 13, 1, 2700000),
(3, 1, 1, 7800000),
(3, 11, 1, 10100000),
(4, 7, 2, 6134000),
(4, 12, 1, 7250000),
(5, 1, 1, 5000),
(5, 3, 1, 5000),
(6, 1, 1, 5000),
(7, 2, 1, 10000),
(8, 3, 1, 5000),
(9, 1, 1, 5000),
(10, 1, 3, 5000),
(11, 1, 1, 5000),
(12, 1, 1, 5000),
(13, 2, 1, 10000),
(15, 3, 1, 5000),
(16, 1, 1, 5000),
(17, 1, 1, 5000),
(18, 2, 2, 10000),
(19, 1, 2, 5000),
(20, 2, 2, 10000),
(21, 1, 1, 4000),
(21, 2, 1, 5000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tambahan`
--

CREATE TABLE `tambahan` (
  `pinjam_id` int(10) NOT NULL,
  `lama_pinjam` varchar(50) NOT NULL,
  `tarif_pinjam` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tambahan`
--

INSERT INTO `tambahan` (`pinjam_id`, `lama_pinjam`, `tarif_pinjam`) VALUES
(1, '1 Minggu', 2000),
(2, '2 Minggu', 4000),
(3, '3 Minggu', 6000),
(4, '1 Bulan', 8000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `user_id` int(10) NOT NULL,
  `level` varchar(30) NOT NULL,
  `nama` varchar(150) NOT NULL,
  `email` varchar(160) NOT NULL,
  `alamat` varchar(400) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `foto` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `status` enum('on','off') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`user_id`, `level`, `nama`, `email`, `alamat`, `phone`, `foto`, `password`, `status`) VALUES
(2, 'superadmin', 'admin', 'admin@pbook.com', 'jl pbook', '08889999', '2.jpg', '1b3231655cebb7a1f783eddf27d254ca', 'on'),
(6, 'customer', 'customer', 'customer1@aaa.com', 'jl.Customer Weshop', '088888', '', '5f4dcc3b5aa765d61d8327deb882cf99', 'on'),
(9, 'customer', 'Aziz Zul', 'aziz@gmail.com', 'Jl Kemangis', '0862312831', '', '827ccb0eea8a706c4c34a16891f84e7b', 'on'),
(10, 'customer', 'Arif Dobleh', 'arif@gmail.com', 'Jl Jalanss', '08123189237', '1.jpg', '827ccb0eea8a706c4c34a16891f84e7b', 'on'),
(12, 'customer', 'Jadon', 'jade@gmail.com', 'Jlaklakss', '123123123', '', '827ccb0eea8a706c4c34a16891f84e7b', 'on'),
(13, 'customer', 'Danang Syaifullah A', 'danang@gmail.com', 'Jl Sadewa', '089123123120', 'matkul.png', '827ccb0eea8a706c4c34a16891f84e7b', 'on'),
(14, 'customer', 'Homex', 'homex@gmail.com', 'Jl qwerty', '111111', 'HxSynYl.png', '827ccb0eea8a706c4c34a16891f84e7b', 'on');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`banner_id`);

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`buku_id`),
  ADD KEY `kategori_id` (`kategori_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`kategori_id`);

--
-- Indexes for table `konfirmasi_pembayaran`
--
ALTER TABLE `konfirmasi_pembayaran`
  ADD PRIMARY KEY (`konfirmasi_id`),
  ADD KEY `pesanan_id` (`pesanan_id`);

--
-- Indexes for table `kurir`
--
ALTER TABLE `kurir`
  ADD PRIMARY KEY (`kurir_id`);

--
-- Indexes for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`pesanan_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `kurir_id` (`kurir_id`),
  ADD KEY `pinjam_id` (`pinjam_id`);

--
-- Indexes for table `pesanan_detail`
--
ALTER TABLE `pesanan_detail`
  ADD KEY `pesanan_id` (`pesanan_id`),
  ADD KEY `barang_id` (`buku_id`);

--
-- Indexes for table `tambahan`
--
ALTER TABLE `tambahan`
  ADD PRIMARY KEY (`pinjam_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banner`
--
ALTER TABLE `banner`
  MODIFY `banner_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `buku_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `kategori_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `konfirmasi_pembayaran`
--
ALTER TABLE `konfirmasi_pembayaran`
  MODIFY `konfirmasi_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `kurir`
--
ALTER TABLE `kurir`
  MODIFY `kurir_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `pesanan_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `tambahan`
--
ALTER TABLE `tambahan`
  MODIFY `pinjam_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD CONSTRAINT `fk_kategori` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`kategori_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `konfirmasi_pembayaran`
--
ALTER TABLE `konfirmasi_pembayaran`
  ADD CONSTRAINT `konfirmasi_pembayaran_ibfk_1` FOREIGN KEY (`pesanan_id`) REFERENCES `pesanan` (`pesanan_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  ADD CONSTRAINT `pesanan_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pesanan_ibfk_3` FOREIGN KEY (`kurir_id`) REFERENCES `kurir` (`kurir_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pesanan_ibfk_4` FOREIGN KEY (`pinjam_id`) REFERENCES `tambahan` (`pinjam_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pesanan_detail`
--
ALTER TABLE `pesanan_detail`
  ADD CONSTRAINT `pesanan_detail_ibfk_1` FOREIGN KEY (`pesanan_id`) REFERENCES `pesanan` (`pesanan_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pesanan_detail_ibfk_2` FOREIGN KEY (`buku_id`) REFERENCES `buku` (`buku_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
