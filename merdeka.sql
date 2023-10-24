-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 24 Okt 2023 pada 00.58
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `merdeka`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `photo`, `token`, `created_at`, `updated_at`) VALUES
(1, 'Maykaparadya', 'maykaparadya@gmail.com', '$2y$10$9Fw5GCNJ45HYGdAmrggKsO0c.zhev8mg6XFFUVniXIDZb7N234XZq', 'admin.jpg', '', NULL, '2023-06-28 18:45:28');

-- --------------------------------------------------------

--
-- Struktur dari tabel `amenities`
--

CREATE TABLE `amenities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `amenities`
--

INSERT INTO `amenities` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Air Conditioner', '2022-07-01 05:32:35', '2022-07-01 05:32:35'),
(2, 'Refrigenerator', '2022-07-01 05:32:55', '2023-06-25 02:24:37'),
(3, 'TV', '2022-07-01 05:33:07', '2023-06-25 02:25:07'),
(4, 'Free Acces Swimming Pool', '2022-07-01 05:33:29', '2023-06-25 02:25:39'),
(5, 'Free Wifi', '2022-07-01 05:33:41', '2023-06-25 02:25:55'),
(6, 'Free Breakfast', '2022-07-01 05:33:52', '2022-07-01 05:33:52'),
(7, 'Free WiFi', '2022-07-01 05:34:00', '2022-07-01 05:34:00'),
(9, 'LCD', '2023-07-25 23:34:27', '2023-07-25 23:34:27'),
(10, 'Sound System', '2023-07-25 23:34:48', '2023-07-25 23:34:48'),
(11, 'Kursi Dan Meja', '2023-07-25 23:35:08', '2023-07-25 23:35:08');

-- --------------------------------------------------------

--
-- Struktur dari tabel `bayars`
--

CREATE TABLE `bayars` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` int(11) NOT NULL,
  `order_no` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `bukti_pembayaran` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_last_digit` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_amount` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `booking_date` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `bayars`
--

INSERT INTO `bayars` (`id`, `customer_id`, `order_no`, `transaction_id`, `payment_method`, `bukti_pembayaran`, `card_last_digit`, `paid_amount`, `booking_date`, `status`, `created_at`, `updated_at`) VALUES
(7, 5, '1688834229', '1688834229', 'Bank Transfer', 'bukti_pembayaran/ihuMLdQT8vO3EzPmr6OR4IreA3ltXxXl65stsYav.jpg', '', '10000000', '08/07/2023', 'Completed', '2023-07-08 09:37:09', '2023-07-08 09:59:01'),
(11, 5, '1688914668', '1688914668', 'Bank Transfer', 'bukti_pembayaran/6NT3NIu0hrCz0YZ4mvELHNFYe4QhU90tWnfP0NDW.jpg', '', '10000000', '09/07/2023', 'Completed', '2023-07-09 07:57:48', '2023-07-09 07:59:08');

-- --------------------------------------------------------

--
-- Struktur dari tabel `bayar_details`
--

CREATE TABLE `bayar_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `gedung_id` int(11) NOT NULL,
  `order_no` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `checkin_date` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `checkout_date` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `adult` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `children` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtotal` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `bayar_details`
--

INSERT INTO `bayar_details` (`id`, `order_id`, `gedung_id`, `order_no`, `checkin_date`, `checkout_date`, `adult`, `children`, `subtotal`, `created_at`, `updated_at`) VALUES
(9, 7, 4, '1688834229', '10/07/2023', '10/07/2023', 'wedding', '1000', '0', '2023-07-08 09:37:09', '2023-07-08 09:37:09'),
(13, 11, 4, '1688914668', '09/07/2023', '09/07/2023', 'wedding', '1', '0', '2023-07-09 07:57:48', '2023-07-09 07:57:48');

-- --------------------------------------------------------

--
-- Struktur dari tabel `booked_gedungs`
--

CREATE TABLE `booked_gedungs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `booking_date` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_no` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `gedung_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `booked_rooms`
--

CREATE TABLE `booked_rooms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `booking_date` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_no` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `room_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `booked_rooms`
--

INSERT INTO `booked_rooms` (`id`, `booking_date`, `order_no`, `room_id`, `created_at`, `updated_at`) VALUES
(1, '08/08/2022', '1659579248', 1, NULL, NULL),
(2, '15/08/2022', '1659579248', 6, NULL, NULL),
(3, '16/08/2022', '1659579248', 6, NULL, NULL),
(4, '08/08/2022', '1659808495', 4, NULL, NULL),
(5, '09/08/2022', '1659808495', 4, NULL, NULL),
(6, '10/08/2022', '1659808495', 4, NULL, NULL),
(7, '04/09/2022', '1659923618', 4, '2022-08-07 19:53:38', '2022-08-07 19:53:38'),
(8, '12/09/2022', '1659923618', 5, '2022-08-07 19:53:38', '2022-08-07 19:53:38'),
(9, '13/09/2022', '1659923618', 5, '2022-08-07 19:53:38', '2022-08-07 19:53:38'),
(10, '14/09/2022', '1659923618', 5, '2022-08-07 19:53:39', '2022-08-07 19:53:39'),
(11, '15/09/2022', '1659923618', 5, '2022-08-07 19:53:39', '2022-08-07 19:53:39'),
(12, '10/09/2022', '1659954645', 5, '2022-08-08 04:30:45', '2022-08-08 04:30:45'),
(13, '11/09/2022', '1659954645', 5, '2022-08-08 04:30:45', '2022-08-08 04:30:45'),
(14, '12/09/2022', '1659954645', 5, '2022-08-08 04:30:45', '2022-08-08 04:30:45'),
(15, '18/10/2022', '1665914211', 6, '2022-10-16 02:56:52', '2022-10-16 02:56:52'),
(16, '18/10/2022', '1665914373', 6, '2022-10-16 02:59:34', '2022-10-16 02:59:34'),
(17, '18/10/2022', '1665914835', 6, '2022-10-16 03:07:17', '2022-10-16 03:07:17'),
(18, '18/10/2022', '1665916149', 1, '2022-10-16 03:29:09', '2022-10-16 03:29:09'),
(19, '24/10/2022', '1665916149', 4, '2022-10-16 03:29:09', '2022-10-16 03:29:09'),
(20, '18/10/2022', '1665916185', 1, '2022-10-16 03:29:46', '2022-10-16 03:29:46'),
(21, '24/10/2022', '1665916185', 4, '2022-10-16 03:29:46', '2022-10-16 03:29:46'),
(22, '17/10/2022', '1665919987', 6, '2022-10-16 04:33:08', '2022-10-16 04:33:08'),
(23, '16/10/2022', '1665923514', 6, '2022-10-16 05:31:54', '2022-10-16 05:31:54'),
(24, '16/10/2022', '1665925374', 6, '2022-10-16 06:02:54', '2022-10-16 06:02:54'),
(25, '16/10/2022', '1665925507', 6, '2022-10-16 06:05:07', '2022-10-16 06:05:07'),
(26, '16/10/2022', '1665925592', 6, '2022-10-16 06:06:32', '2022-10-16 06:06:32'),
(27, '16/10/2022', '1665926277', 6, '2022-10-16 06:17:58', '2022-10-16 06:17:58'),
(28, '16/10/2022', '1665926297', 6, '2022-10-16 06:18:17', '2022-10-16 06:18:17'),
(29, '16/10/2022', '1665926637', 6, '2022-10-16 06:23:57', '2022-10-16 06:23:57'),
(30, '17/10/2022', '1665936022', 6, '2022-10-16 09:00:23', '2022-10-16 09:00:23'),
(31, '17/10/2022', '1665936129', 6, '2022-10-16 09:02:10', '2022-10-16 09:02:10'),
(32, '17/10/2022', '1665936129', 4, '2022-10-16 09:02:10', '2022-10-16 09:02:10'),
(33, '11/06/2023', '1685664628', 1, '2023-06-01 17:10:28', '2023-06-01 17:10:28'),
(34, '12/06/2023', '1685664628', 1, '2023-06-01 17:10:28', '2023-06-01 17:10:28'),
(35, '13/06/2023', '1685664628', 1, '2023-06-01 17:10:28', '2023-06-01 17:10:28'),
(36, '14/06/2023', '1685664628', 1, '2023-06-01 17:10:28', '2023-06-01 17:10:28'),
(37, '15/06/2023', '1685664628', 1, '2023-06-01 17:10:28', '2023-06-01 17:10:28'),
(38, '16/06/2023', '1685664628', 1, '2023-06-01 17:10:28', '2023-06-01 17:10:28'),
(39, '17/06/2023', '1685664628', 1, '2023-06-01 17:10:28', '2023-06-01 17:10:28'),
(40, '18/06/2023', '1685664628', 1, '2023-06-01 17:10:28', '2023-06-01 17:10:28'),
(41, '19/06/2023', '1685664628', 1, '2023-06-01 17:10:28', '2023-06-01 17:10:28'),
(42, '20/06/2023', '1685664628', 1, '2023-06-01 17:10:28', '2023-06-01 17:10:28'),
(43, '21/06/2023', '1685664628', 1, '2023-06-01 17:10:28', '2023-06-01 17:10:28'),
(44, '22/06/2023', '1685664628', 1, '2023-06-01 17:10:28', '2023-06-01 17:10:28'),
(45, '23/06/2023', '1685664628', 1, '2023-06-01 17:10:28', '2023-06-01 17:10:28'),
(46, '24/06/2023', '1685664628', 1, '2023-06-01 17:10:28', '2023-06-01 17:10:28'),
(47, '25/06/2023', '1685664628', 1, '2023-06-01 17:10:28', '2023-06-01 17:10:28'),
(48, '26/06/2023', '1685664628', 1, '2023-06-01 17:10:28', '2023-06-01 17:10:28'),
(49, '27/06/2023', '1685664628', 1, '2023-06-01 17:10:28', '2023-06-01 17:10:28'),
(50, '28/06/2023', '1685664628', 1, '2023-06-01 17:10:28', '2023-06-01 17:10:28'),
(51, '29/06/2023', '1685664628', 1, '2023-06-01 17:10:28', '2023-06-01 17:10:28'),
(52, '30/06/2023', '1685664628', 1, '2023-06-01 17:10:28', '2023-06-01 17:10:28'),
(53, '01/07/2023', '1685664628', 1, '2023-06-01 17:10:28', '2023-06-01 17:10:28'),
(54, '02/07/2023', '1685664628', 1, '2023-06-01 17:10:28', '2023-06-01 17:10:28'),
(55, '03/07/2023', '1685664628', 1, '2023-06-01 17:10:28', '2023-06-01 17:10:28'),
(56, '04/07/2023', '1685664628', 1, '2023-06-01 17:10:28', '2023-06-01 17:10:28'),
(57, '05/07/2023', '1685664628', 1, '2023-06-01 17:10:28', '2023-06-01 17:10:28'),
(58, '06/07/2023', '1685664628', 1, '2023-06-01 17:10:28', '2023-06-01 17:10:28'),
(59, '07/07/2023', '1685664628', 1, '2023-06-01 17:10:28', '2023-06-01 17:10:28'),
(60, '08/07/2023', '1685664628', 1, '2023-06-01 17:10:28', '2023-06-01 17:10:28'),
(61, '09/07/2023', '1685664628', 1, '2023-06-01 17:10:28', '2023-06-01 17:10:28'),
(62, '10/07/2023', '1685664628', 1, '2023-06-01 17:10:28', '2023-06-01 17:10:28'),
(63, '11/07/2023', '1685664628', 1, '2023-06-01 17:10:28', '2023-06-01 17:10:28'),
(64, '16/06/2023', '1686886992', 1, '2023-06-15 20:43:15', '2023-06-15 20:43:15'),
(65, '17/06/2023', '1686886992', 1, '2023-06-15 20:43:15', '2023-06-15 20:43:15'),
(66, '18/06/2023', '1686886992', 1, '2023-06-15 20:43:15', '2023-06-15 20:43:15'),
(67, '19/06/2023', '1686886992', 1, '2023-06-15 20:43:15', '2023-06-15 20:43:15'),
(68, '20/06/2023', '1686886992', 1, '2023-06-15 20:43:15', '2023-06-15 20:43:15'),
(69, '21/06/2023', '1686886992', 1, '2023-06-15 20:43:15', '2023-06-15 20:43:15'),
(70, '22/06/2023', '1686886992', 1, '2023-06-15 20:43:15', '2023-06-15 20:43:15'),
(71, '23/06/2023', '1686886992', 1, '2023-06-15 20:43:15', '2023-06-15 20:43:15'),
(72, '24/06/2023', '1686886992', 1, '2023-06-15 20:43:15', '2023-06-15 20:43:15'),
(73, '25/06/2023', '1686886992', 1, '2023-06-15 20:43:15', '2023-06-15 20:43:15'),
(74, '26/06/2023', '1686886992', 1, '2023-06-15 20:43:15', '2023-06-15 20:43:15'),
(75, '27/06/2023', '1686886992', 1, '2023-06-15 20:43:15', '2023-06-15 20:43:15'),
(76, '28/06/2023', '1686886992', 1, '2023-06-15 20:43:15', '2023-06-15 20:43:15'),
(77, '29/06/2023', '1686886992', 1, '2023-06-15 20:43:15', '2023-06-15 20:43:15'),
(78, '30/06/2023', '1686886992', 1, '2023-06-15 20:43:15', '2023-06-15 20:43:15'),
(79, '01/07/2023', '1686886992', 1, '2023-06-15 20:43:15', '2023-06-15 20:43:15'),
(80, '02/07/2023', '1686886992', 1, '2023-06-15 20:43:15', '2023-06-15 20:43:15'),
(81, '03/07/2023', '1686886992', 1, '2023-06-15 20:43:15', '2023-06-15 20:43:15'),
(82, '04/07/2023', '1686886992', 1, '2023-06-15 20:43:15', '2023-06-15 20:43:15'),
(83, '05/07/2023', '1686886992', 1, '2023-06-15 20:43:15', '2023-06-15 20:43:15'),
(84, '06/07/2023', '1686886992', 1, '2023-06-15 20:43:15', '2023-06-15 20:43:15'),
(85, '07/07/2023', '1686886992', 1, '2023-06-15 20:43:15', '2023-06-15 20:43:15'),
(86, '08/07/2023', '1686886992', 1, '2023-06-15 20:43:15', '2023-06-15 20:43:15'),
(87, '09/07/2023', '1686886992', 1, '2023-06-15 20:43:15', '2023-06-15 20:43:15'),
(88, '10/07/2023', '1686886992', 1, '2023-06-15 20:43:15', '2023-06-15 20:43:15'),
(89, '11/07/2023', '1686886992', 1, '2023-06-15 20:43:15', '2023-06-15 20:43:15'),
(90, '12/07/2023', '1686886992', 1, '2023-06-15 20:43:15', '2023-06-15 20:43:15'),
(91, '13/07/2023', '1686886992', 1, '2023-06-15 20:43:15', '2023-06-15 20:43:15'),
(92, '14/07/2023', '1686886992', 1, '2023-06-15 20:43:15', '2023-06-15 20:43:15'),
(93, '15/07/2023', '1686886992', 1, '2023-06-15 20:43:15', '2023-06-15 20:43:15'),
(94, '18/06/2023', '1686887459', 6, '2023-06-15 20:50:59', '2023-06-15 20:50:59'),
(95, '18/06/2023', '1687063599', 1, '2023-06-17 21:46:42', '2023-06-17 21:46:42'),
(96, '20/06/2023', '1687110452', 1, '2023-06-18 10:47:34', '2023-06-18 10:47:34'),
(97, '25/06/2023', '1687367637', 1, '2023-06-21 10:13:59', '2023-06-21 10:13:59'),
(98, '26/06/2023', '1687715559', 7, '2023-06-25 10:52:39', '2023-06-25 10:52:39'),
(99, '27/06/2023', '1687716682', 1, '2023-06-25 11:11:22', '2023-06-25 11:11:22'),
(100, '27/06/2023', '1687771368', 7, '2023-06-26 02:22:51', '2023-06-26 02:22:51'),
(101, '30/06/2023', '1687771609', 1, '2023-06-26 02:26:49', '2023-06-26 02:26:49'),
(102, '27/06/2023', '1687771709', 4, '2023-06-26 02:28:30', '2023-06-26 02:28:30'),
(103, '04/07/2023', '1687771764', 4, '2023-06-26 02:29:24', '2023-06-26 02:29:24'),
(104, '04/07/2023', '1688374914', 6, '2023-07-03 02:01:54', '2023-07-03 02:01:54'),
(105, '04/07/2023', '1688386078', 1, '2023-07-03 05:07:58', '2023-07-03 05:07:58'),
(106, '16/07/2023', '1688710994', 1, '2023-07-06 23:23:14', '2023-07-06 23:23:14'),
(107, '08/07/2023', '1688720822', 1, '2023-07-07 02:07:02', '2023-07-07 02:07:02'),
(108, '08/07/2023', '1688721035', 5, '2023-07-07 02:10:35', '2023-07-07 02:10:35'),
(109, '09/07/2023', '1688721492', 1, '2023-07-07 02:18:12', '2023-07-07 02:18:12'),
(110, '14/07/2023', '1688721780', 7, '2023-07-07 02:23:00', '2023-07-07 02:23:00'),
(111, '08/07/2023', '1688724041', 5, '2023-07-07 03:00:41', '2023-07-07 03:00:41'),
(112, '24/07/2023', '1688728832', 7, '2023-07-07 04:20:32', '2023-07-07 04:20:32'),
(113, '17/07/2023', '1688734443', 1, '2023-07-07 05:54:03', '2023-07-07 05:54:03'),
(114, '12/07/2023', '1688743873', 1, '2023-07-07 08:31:13', '2023-07-07 08:31:13'),
(115, '19/07/2023', '1688744790', 5, '2023-07-07 08:46:31', '2023-07-07 08:46:31'),
(116, '12/07/2023', '1688745902', 5, '2023-07-07 09:05:02', '2023-07-07 09:05:02'),
(117, '18/07/2023', '1688913219', 5, '2023-07-09 07:33:39', '2023-07-09 07:33:39'),
(118, '18/07/2023', '1688913219', 5, '2023-07-09 07:33:39', '2023-07-09 07:33:39'),
(119, '18/07/2023', '1688913219', 5, '2023-07-09 07:33:39', '2023-07-09 07:33:39'),
(120, '18/07/2023', '1688913449', 7, '2023-07-09 07:37:29', '2023-07-09 07:37:29'),
(121, '10/07/2023', '1688914256', 5, '2023-07-09 07:50:56', '2023-07-09 07:50:56'),
(122, '10/07/2023', '1688914308', 5, '2023-07-09 07:51:48', '2023-07-09 07:51:48'),
(123, '16/07/2023', '1688962900', 5, '2023-07-09 21:21:40', '2023-07-09 21:21:40'),
(124, '23/07/2023', '1689834474', 7, '2023-07-19 23:27:54', '2023-07-19 23:27:54'),
(125, '24/07/2023', '1689834848', 1, '2023-07-19 23:34:10', '2023-07-19 23:34:10'),
(126, '24/07/2023', '1689835041', 6, '2023-07-19 23:37:21', '2023-07-19 23:37:21'),
(127, '24/07/2023', '1689837853', 5, '2023-07-20 00:24:15', '2023-07-20 00:24:15');

-- --------------------------------------------------------

--
-- Struktur dari tabel `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `password`, `phone`, `country`, `address`, `state`, `city`, `zip`, `photo`, `token`, `status`, `created_at`, `updated_at`) VALUES
(5, 'Mayka Yudha', 'maykayudha@gmail.com', '$2y$10$j8GmJJC6cxqOSlKI4dfuy.1AoQf4TKf41.hiXK9oQLYEBgUK5bYRC', '087861786236', 'Indonesia', 'Jl.Anggrek', '1', 'Madiun', '1', NULL, '51356124390875f7d430e734e8574c148c41e9d6623f86d4c64caaf6e92bb52b', 1, '2023-06-25 02:29:30', '2023-07-25 07:54:16'),
(11, 'Bu Dani', 'budani@gmail.com', '$2y$10$VFlHJOFEFOjPgTgxk41PwOCuOEtpTgKGWRzZo6QKpgyvMouGmhOdW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'b345ae9c00527b954c772a6161261fb5ac6c8961960a9ee297428a87183fc230', 1, '2023-07-09 21:18:42', '2023-07-09 21:19:21'),
(18, 'mayka1', 'mayka@gmail.com', '$2y$10$OH/wHXarJV96HXvnysve3en2Rw4rQ9oChIDjrWjkLSAOAMRaIqQBm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3c09096e34d1d00a0b2d66501a29ebb17e54e90c754d6380f864c7e2207f1b79', 1, '2023-07-20 00:16:04', '2023-07-21 10:22:49'),
(37, 'Anissa', 'anisaolivia@gmail.com', '$2y$10$.2MBrW2Br2EniuZUvS8HLOFZlppKQu.ECT71ZFziuI8w5bWhBoGYy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2023-07-21 11:39:01', '2023-07-24 03:56:47'),
(39, 'yudha', 'mayka1@gmail.com', '$2y$10$Qtmf9PgUFRxmh5TFSD3VtuOvF9DwVSH8Ui3DePWpGfv5C/91.xNee', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1cd10bd87de6452ff0e6bdfadda74a772868de62902dbb96845d1b1e4f29f142', 1, '2023-07-25 23:14:17', '2023-07-25 23:14:57'),
(40, 'mayka', 'mayka2@gmail.com', '$2y$10$UPT3XBzRpUyZCzcqB.fLKuOptNN4idpZ9N6nDzkH8fl.HrN.QHDCS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2023-07-25 23:41:45', '2023-07-25 23:42:43');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `faqs`
--

INSERT INTO `faqs` (`id`, `question`, `answer`, `created_at`, `updated_at`) VALUES
(1, 'Website Question 1', '<p>Lorem ipsum dolor sit amet, ut has quidam prodesset, eos sumo ipsum civibus ea, vel quas nusquam ei. Et sea doming quodsi audire. No vim ornatus scaevola disputando, qui stet ceteros ad. Ad his choro appetere mnesarchum, no duo accusata incorrupte, vel essent fabulas ut.</p><p>Ne nam soluta libris. Cu sea utamur adipiscing, convenire patrioque dignissim et nec. Accusam incorrupte vituperatoribus vix ad, ei clita omnium mentitum pro. Est ad duis perpetua recteque, in autem posidonium qui. Illum nulla dolor mea an.<br></p><p>Officiis disputationi ne pri, libris malorum eam id. Molestie principes vix no. Ut velit iudicabit inciderint mea. Malorum mediocrem deseruisse nam ne, tale imperdiet vim ut. Aperiri splendide cu eos, vis in alia laoreet aliquando.<br></p>', '2022-06-26 23:48:59', '2022-06-26 23:48:59'),
(2, 'Website Question 2', '<p>Lorem ipsum dolor sit amet, ut has quidam prodesset, eos sumo ipsum civibus ea, vel quas nusquam ei. Et sea doming quodsi audire. No vim ornatus scaevola disputando, qui stet ceteros ad. Ad his choro appetere mnesarchum, no duo accusata incorrupte, vel essent fabulas ut.</p><p>Ne nam soluta libris. Cu sea utamur adipiscing, convenire patrioque dignissim et nec. Accusam incorrupte vituperatoribus vix ad, ei clita omnium mentitum pro. Est ad duis perpetua recteque, in autem posidonium qui. Illum nulla dolor mea an.<br></p><p>Officiis disputationi ne pri, libris malorum eam id. Molestie principes vix no. Ut velit iudicabit inciderint mea. Malorum mediocrem deseruisse nam ne, tale imperdiet vim ut. Aperiri splendide cu eos, vis in alia laoreet aliquando.</p>', '2022-06-26 23:50:18', '2022-06-26 23:50:18'),
(3, 'Website Question 3', '<p>Lorem ipsum dolor sit amet, ut has quidam prodesset, eos sumo ipsum civibus ea, vel quas nusquam ei. Et sea doming quodsi audire. No vim ornatus scaevola disputando, qui stet ceteros ad. Ad his choro appetere mnesarchum, no duo accusata incorrupte, vel essent fabulas ut.</p><p>Ne nam soluta libris. Cu sea utamur adipiscing, convenire patrioque dignissim et nec. Accusam incorrupte vituperatoribus vix ad, ei clita omnium mentitum pro. Est ad duis perpetua recteque, in autem posidonium qui. Illum nulla dolor mea an.<br></p><p>Officiis disputationi ne pri, libris malorum eam id. Molestie principes vix no. Ut velit iudicabit inciderint mea. Malorum mediocrem deseruisse nam ne, tale imperdiet vim ut. Aperiri splendide cu eos, vis in alia laoreet aliquando.</p>', '2022-06-26 23:50:33', '2022-06-26 23:50:33'),
(4, 'Website Question 4', '<p>Lorem ipsum dolor sit amet, ut has quidam prodesset, eos sumo ipsum civibus ea, vel quas nusquam ei. Et sea doming quodsi audire. No vim ornatus scaevola disputando, qui stet ceteros ad. Ad his choro appetere mnesarchum, no duo accusata incorrupte, vel essent fabulas ut.</p><p>Ne nam soluta libris. Cu sea utamur adipiscing, convenire patrioque dignissim et nec. Accusam incorrupte vituperatoribus vix ad, ei clita omnium mentitum pro. Est ad duis perpetua recteque, in autem posidonium qui. Illum nulla dolor mea an.<br></p><p>Officiis disputationi ne pri, libris malorum eam id. Molestie principes vix no. Ut velit iudicabit inciderint mea. Malorum mediocrem deseruisse nam ne, tale imperdiet vim ut. Aperiri splendide cu eos, vis in alia laoreet aliquando.</p>', '2022-06-26 23:50:48', '2022-06-26 23:50:48');

-- --------------------------------------------------------

--
-- Struktur dari tabel `features`
--

CREATE TABLE `features` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `icon` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `heading` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `features`
--

INSERT INTO `features` (`id`, `icon`, `heading`, `text`, `created_at`, `updated_at`) VALUES
(1, 'fa fa-clock-o', 'Room Service 24 Jam', 'If you find a lower online rate, we will match it and give you an additional 25% off on your stay.', '2022-06-25 20:46:45', '2023-06-25 07:08:03'),
(2, 'fa fa-wifi', 'Free Wifi', 'If you find a lower online rate, we will match it and give you an additional 25% off on your stay.', '2022-06-25 20:48:09', '2022-06-25 20:48:09'),
(3, 'fa fa-superpowers', 'Nikmati Malam Gratis', 'If you find a lower online rate, we will match it and give you an additional 25% off on your stay.', '2022-06-25 20:48:35', '2023-06-25 07:08:43'),
(4, 'fa fa-cubes', 'Kolam Renang', 'If you find a lower online rate, we will match it and give you an additional 25% off on your stay.', '2022-06-25 20:49:00', '2023-06-25 07:09:07');

-- --------------------------------------------------------

--
-- Struktur dari tabel `gedungs`
--

CREATE TABLE `gedungs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_gedung` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `amenities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_guests` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured_photo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `gedungs`
--

INSERT INTO `gedungs` (`id`, `name`, `description`, `price`, `total_gedung`, `amenities`, `size`, `total_guests`, `featured_photo`, `video_id`, `created_at`, `updated_at`) VALUES
(4, 'Gedung Biru', '<p>Gedung Biru adalah salah satu fasilitas yang disediakan dalam hotel kami, yang bisa digunakan untuk pertemuan, rapat, seminar, ataupun wedding dari suatu perusahaan, instansi, atau personal.<br></p>', '10000000', '1', '1,2,5,9,10,11', '100', '500', '1688323512.jpg', NULL, '2023-07-02 11:45:12', '2023-07-25 23:36:09'),
(5, 'Ballroom', '<p>Ballroom adalah salah satu fasilitas yang disediakan dalam hotel kami, yang bisa digunakan untuk pertemuan, rapat, seminar, ataupun wedding dari suatu perusahaan, instansi, atau personal.<br></p>', '15000000', '1', '1,5,9,10,11', '500 m2', '2000', '1688353056.jpg', NULL, '2023-07-02 19:57:36', '2023-07-25 23:36:32'),
(7, 'Ballrom Lantai 2', 'Ballroom Lantai 2 adalah salah satu fasilitas yang disediakan dalam hotel kami, yang bisa digunakan untuk pertemuan, rapat, seminar, ataupun wedding dari suatu perusahaan, instansi, atau personal.', '8000000', '1', '1,5,9,10,11', '250 m2', '500', '1688353531.jpg', NULL, '2023-07-02 20:05:31', '2023-07-25 23:36:57');

-- --------------------------------------------------------

--
-- Struktur dari tabel `gedung_photos`
--

CREATE TABLE `gedung_photos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `gedung_id` int(11) NOT NULL,
  `photo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `gedung_photos`
--

INSERT INTO `gedung_photos` (`id`, `gedung_id`, `photo`, `created_at`, `updated_at`) VALUES
(1, 3, '1688005508.jpg', '2023-06-28 19:25:08', '2023-06-28 19:25:08'),
(2, 4, '1688725613.jpg', '2023-07-07 03:26:53', '2023-07-07 03:26:53');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_02_18_035205_create_admins_table', 1),
(6, '2022_06_24_093653_create_slides_table', 2),
(7, '2022_06_26_021258_create_features_table', 3),
(8, '2022_06_26_033305_create_testimonials_table', 4),
(9, '2022_06_26_051426_create_posts_table', 5),
(10, '2022_06_26_135533_create_photos_table', 6),
(11, '2022_06_27_021908_create_videos_table', 7),
(12, '2022_06_27_050408_create_faqs_table', 8),
(13, '2022_06_27_104626_create_pages_table', 9),
(14, '2022_06_29_115954_create_subscribers_table', 10),
(15, '2022_07_01_104958_create_amenities_table', 11),
(16, '2022_07_02_005301_create_rooms_table', 12),
(17, '2022_07_02_010035_create_room_photos_table', 13),
(18, '2022_07_04_065843_create_customers_table', 14),
(19, '2022_07_13_034131_create_orders_table', 15),
(20, '2022_07_13_034641_create_order_details_table', 16),
(21, '2022_08_07_135954_create_booked_rooms_table', 17),
(22, '2022_08_08_120610_create_settings_table', 18),
(23, '2022_07_02_005301_create_gedung_table', 19),
(24, '2023_06_28_060655_create_gedung_table', 20),
(25, '2023_06_28_155640_create_gedung_photos', 21),
(26, '2022_08_07_135954_create_booked_gedung_table', 22),
(27, '2022_08_07_135954_create_booked_gedungs_table', 23),
(28, '2022_07_13_034131_create_laporans_table', 24),
(29, '2022_07_13_034641_create_laporan_details_table', 25);

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` int(11) NOT NULL,
  `order_no` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `snap_token` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bukti_pembayaran` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_last_digit` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_amount` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `booking_date` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `order_no`, `transaction_id`, `payment_method`, `snap_token`, `bukti_pembayaran`, `card_last_digit`, `paid_amount`, `booking_date`, `status`, `created_at`, `updated_at`) VALUES
(77, 5, '1688728832', '1688728832', 'Bank Transfer', '', 'bukti_pembayaran/312LZdvJMus55fSawIpSNkmNXCgnoo3pTdP29FPi.jpg', '', '968000', '07/07/2023', 'Completed', '2023-07-07 04:20:32', '2023-07-25 08:20:35'),
(85, 5, '1688914308', '1688914308', 'Bank Transfer', '', 'bukti_pembayaran/nSPsIeG2psOGkglFaPpqFuxtlbhs2fCGhpjx0PrR.jpg', '', '500000', '09/07/2023', 'Completed', '2023-07-09 07:51:48', '2023-07-09 07:52:20');

-- --------------------------------------------------------

--
-- Struktur dari tabel `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `order_no` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `checkin_date` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `checkout_date` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `adult` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `children` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtotal` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `room_id`, `order_no`, `checkin_date`, `checkout_date`, `adult`, `children`, `subtotal`, `created_at`, `updated_at`) VALUES
(49, 77, 7, '1688728832', '24/07/2023', '25/07/2023', '1', '1', '968000', '2023-07-07 04:20:32', '2023-07-07 04:20:32'),
(59, 85, 5, '1688914308', '10/07/2023', '11/07/2023', '1', '1', '500000', '2023-07-09 07:51:48', '2023-07-09 07:51:48');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `about_heading` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `about_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `about_status` int(11) NOT NULL,
  `terms_heading` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `terms_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `terms_status` int(11) NOT NULL,
  `privacy_heading` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `privacy_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `privacy_status` int(11) NOT NULL,
  `contact_heading` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_map` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_status` int(11) NOT NULL,
  `photo_gallery_heading` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo_gallery_status` int(11) NOT NULL,
  `video_gallery_heading` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_gallery_status` int(11) NOT NULL,
  `faq_heading` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `faq_status` int(11) NOT NULL,
  `blog_heading` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `blog_status` int(11) NOT NULL,
  `room_heading` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `cart_heading` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `cart_status` int(11) NOT NULL,
  `checkout_heading` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `checkout_status` int(11) NOT NULL,
  `payment_heading` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `signup_heading` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `signup_status` int(11) NOT NULL,
  `signin_heading` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `signin_status` int(11) NOT NULL,
  `forget_password_heading` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `reset_password_heading` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `pages`
--

INSERT INTO `pages` (`id`, `about_heading`, `about_content`, `about_status`, `terms_heading`, `terms_content`, `terms_status`, `privacy_heading`, `privacy_content`, `privacy_status`, `contact_heading`, `contact_map`, `contact_status`, `photo_gallery_heading`, `photo_gallery_status`, `video_gallery_heading`, `video_gallery_status`, `faq_heading`, `faq_status`, `blog_heading`, `blog_status`, `room_heading`, `cart_heading`, `cart_status`, `checkout_heading`, `checkout_status`, `payment_heading`, `signup_heading`, `signup_status`, `signin_heading`, `signin_status`, `forget_password_heading`, `reset_password_heading`, `created_at`, `updated_at`) VALUES
(1, 'About Us', '<br>', 1, 'Terms and Conditions', '<div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Hic iure delectus, aperiam eius sed suscipit corporis quas, nisi dicta harum excepturi quis est id deserunt a, ipsa autem in distinctio. Lorem ipsum dolor sit amet consectetur adipisicing elit. Hic iure delectus, aperiam eius sed suscipit corporis quas, nisi dicta harum excepturi quis est id deserunt a, ipsa autem in distinctio.</div><div><br></div><div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Hic iure delectus, aperiam eius sed suscipit corporis quas, nisi dicta harum excepturi quis est id deserunt a, ipsa autem in distinctio. Lorem ipsum dolor sit amet consectetur adipisicing elit. Hic iure delectus, aperiam eius sed suscipit corporis quas, nisi dicta harum excepturi quis est id deserunt a, ipsa autem in distinctio.</div><div><br></div><div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Hic iure delectus, aperiam eius sed suscipit corporis quas, nisi dicta harum excepturi quis est id deserunt a, ipsa autem in distinctio. Lorem ipsum dolor sit amet consectetur adipisicing elit. Hic iure delectus, aperiam eius sed suscipit corporis quas, nisi dicta harum excepturi quis est id deserunt a, ipsa autem in distinctio.</div><div><br></div><div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Hic iure delectus, aperiam eius sed suscipit corporis quas, nisi dicta harum excepturi quis est id deserunt a, ipsa autem in distinctio. Lorem ipsum dolor sit amet consectetur adipisicing elit. Hic iure delectus, aperiam eius sed suscipit corporis quas, nisi dicta harum excepturi quis est id deserunt a, ipsa autem in distinctio.</div>', 1, 'Checkout Gedung', '<br>', 1, 'Kontak', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d26361688.302253906!2d-113.76378198869888!3d36.23999124494682!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x54eab584e432360b%3A0x1c3bb99243deb742!2sUnited%20States!5e0!3m2!1sen!2sbd!4v1656378870953!5m2!1sen!2sbd\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', 1, 'Foto Galeri', 1, 'Galeri Video', 1, 'FAQ', 1, 'Blog', 1, 'Kamar', 'Checkout Kamar', 1, 'Checkout', 0, 'Pembayaran', 'Register', 1, 'Login', 1, 'Lupa Password', 'Reset Password', NULL, '2023-07-03 13:05:59');

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `photos`
--

CREATE TABLE `photos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `photo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `caption` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `photos`
--

INSERT INTO `photos` (`id`, `photo`, `caption`, `created_at`, `updated_at`) VALUES
(1, '1687702437.jpg', 'Ball Room', '2022-06-26 08:17:41', '2023-06-25 07:16:08'),
(2, '1687702497.jpg', 'New Suite Room', '2022-06-26 08:18:11', '2023-06-25 07:16:28'),
(3, '1687702529.jpg', 'Kolam Renang', '2022-06-26 08:18:43', '2023-06-25 07:16:43'),
(7, '1688040909.jpg', 'Kolam Renang', '2023-06-29 05:15:09', '2023-06-29 05:15:09');

-- --------------------------------------------------------

--
-- Struktur dari tabel `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `photo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `heading` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_view` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `posts`
--

INSERT INTO `posts` (`id`, `photo`, `heading`, `short_content`, `content`, `total_view`, `created_at`, `updated_at`) VALUES
(2, '1687712449.jpg', 'Foto 1', '*', '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Hic iure delectus, aperiam eius sed suscipit corporis quas, nisi dicta harum excepturi quis est id deserunt a, ipsa autem in distinctio. Lorem ipsum dolor sit amet consectetur adipisicing elit. Hic iure delectus, aperiam eius sed suscipit corporis quas, nisi dicta harum excepturi quis est id deserunt a, ipsa autem in distinctio.</p>', 20, '2022-06-26 05:32:58', '2023-06-25 10:43:06'),
(5, '1688039894.jpg', 'Kolam Renang', 'Tes', '<p>Lorem Ipsum</p>', 7, '2023-06-29 04:58:14', '2023-06-29 05:01:18');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rekening`
--

CREATE TABLE `rekening` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `atas_nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_rekening` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `rekening`
--

INSERT INTO `rekening` (`id`, `bank_name`, `atas_nama`, `no_rekening`, `created_at`, `updated_at`) VALUES
(1, 'BRI', 'HOTEL MERDEKA', '123456789', NULL, '2022-06-09 02:29:48'),
(3, 'MANDIRI', 'HOTEL MERDEKA', '123456789', '2020-03-22 08:35:31', '2022-06-09 02:29:43'),
(4, 'BCA', 'HOTEL MERDEKA', '123456789', '2020-03-24 17:22:37', '2022-06-09 02:29:57'),
(5, 'BNI', 'HOTEL MERDEKA', '123456789', '2020-03-24 17:23:12', '2022-06-09 02:29:52');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rooms`
--

CREATE TABLE `rooms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_rooms` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `amenities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_beds` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_bathrooms` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_balconies` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_guests` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured_photo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `rooms`
--

INSERT INTO `rooms` (`id`, `name`, `description`, `price`, `total_rooms`, `amenities`, `size`, `total_beds`, `total_bathrooms`, `total_balconies`, `total_guests`, `featured_photo`, `video_id`, `created_at`, `updated_at`) VALUES
(1, 'Standard Room', '<div>Standart Room Merupakan fasilitas kamar yang berada di hotel merdeka kota madiun. Standart room&nbsp;<span style=\"text-align: var(--bs-body-text-align);\">adalah jenis kamar hotel yang umum dimiliki setiap hotel. Standart room biasanya hanya terdiri dari satu ruangan yang berisi hanya satu tempat tidur, sofa, dan kamar mandi.&nbsp;</span><span style=\"text-align: var(--bs-body-text-align);\">Jenis kamar hotel standart room cocok untuk keluarga karena memang fasilitas dan kapasitas yang besar. Stnadart room juga biasanya lebih banyak diminati oleh para traveller yang bepergian, karena harganya yang lebih murah dibandingkan dengan jenis kamar hotel lainnya.</span></div>', '300000', '17', '4,5,6,7', '100 sqm2', '1', '1', '1', '2', '1688005824.jpg', NULL, '2022-07-01 21:12:23', '2023-07-25 23:29:58'),
(5, 'New Superior Room', '<div>New Superior Room Merupakan fasilitas kamar yang berada di hotel merdeka kota madiun. New Superior room&nbsp;<span style=\"text-align: var(--bs-body-text-align);\">adalah jenis kamar hotel yang umum dimiliki setiap hotel. Standart room biasanya hanya terdiri dari satu ruangan yang berisi hanya satu tempat tidur, sofa, dan kamar mandi.&nbsp;</span><span style=\"text-align: var(--bs-body-text-align);\">Jenis kamar hotel standart room cocok untuk keluarga karena memang fasilitas dan kapasitas yang besar. Stnadart room juga biasanya lebih banyak diminati oleh para traveller yang bepergian, karena harganya yang lebih murah dibandingkan dengan jenis kamar hotel lainnya.</span></div>', '500000', '2', '1,2,3,4,6,7', '200 sqm2', '2', '1', '1', '4', '1687701225.jpg', NULL, '2022-07-03 08:06:01', '2023-07-25 23:30:29'),
(6, 'Deluxe Room', '<div>Deluxe Room Merupakan fasilitas kamar yang berada di hotel merdeka kota madiun. Deluxe room&nbsp;<span style=\"text-align: var(--bs-body-text-align);\">adalah jenis kamar hotel yang umum dimiliki setiap hotel. Standart room biasanya hanya terdiri dari satu ruangan yang berisi hanya satu tempat tidur, sofa, dan kamar mandi.&nbsp;</span><span style=\"text-align: var(--bs-body-text-align);\">Jenis kamar hotel standart room cocok untuk keluarga karena memang fasilitas dan kapasitas yang besar. Stnadart room juga biasanya lebih banyak diminati oleh para traveller yang bepergian, karena harganya yang lebih murah dibandingkan dengan jenis kamar hotel lainnya.</span></div>', '450000', '22', '1,2,3,4,5,6,7', '300 sqm2', '1', '1', '1', '4', '1687684896.jpg', NULL, '2022-07-03 08:07:43', '2023-07-25 23:30:50'),
(7, 'Merdeka Suite Room', '<div>Merdeka Suite Room Merupakan fasilitas kamar yang berada di hotel merdeka kota madiun. Merdeka Suite Room&nbsp;<span style=\"text-align: var(--bs-body-text-align);\">adalah jenis kamar hotel yang umum dimiliki setiap hotel. Standart room biasanya hanya terdiri dari satu ruangan yang berisi hanya satu tempat tidur, sofa, dan kamar mandi.&nbsp;</span><span style=\"text-align: var(--bs-body-text-align);\">Jenis kamar hotel standart room cocok untuk keluarga karena memang fasilitas dan kapasitas yang besar. Stnadart room juga biasanya lebih banyak diminati oleh para traveller yang bepergian, karena harganya yang lebih murah dibandingkan dengan jenis kamar hotel lainnya.</span></div>', '968000', '4', '1,2,3,4,5,6,7', '100', '1', '1', '1', '4', '1687701651.jpg', NULL, '2023-06-25 07:00:51', '2023-07-25 23:31:09'),
(9, 'Superior Room', '<div>Superior Room Merupakan fasilitas kamar yang berada di hotel merdeka kota madiun. Superior room&nbsp;<span style=\"text-align: var(--bs-body-text-align);\">adalah jenis kamar hotel yang umum dimiliki setiap hotel. Standart room biasanya hanya terdiri dari satu ruangan yang berisi hanya satu tempat tidur, sofa, dan kamar mandi.&nbsp;</span><span style=\"text-align: var(--bs-body-text-align);\">Jenis kamar hotel standart room cocok untuk keluarga karena memang fasilitas dan kapasitas yang besar. Stnadart room juga biasanya lebih banyak diminati oleh para traveller yang bepergian, karena harganya yang lebih murah dibandingkan dengan jenis kamar hotel lainnya.</span></div>', '360000', '17', '1,2,3,5,6', '100 m2', '1', '1', '0', '4', '1688372299.jpg', NULL, '2023-07-03 01:18:19', '2023-07-25 23:31:29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `room_photos`
--

CREATE TABLE `room_photos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `room_id` int(11) NOT NULL,
  `photo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `room_photos`
--

INSERT INTO `room_photos` (`id`, `room_id`, `photo`, `created_at`, `updated_at`) VALUES
(6, 1, '1687798228.jpg', '2023-06-26 09:50:28', '2023-06-26 09:50:28');

-- --------------------------------------------------------

--
-- Struktur dari tabel `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `logo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `favicon` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `top_bar_phone` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `top_bar_email` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home_feature_status` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `home_room_total` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `home_room_status` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `home_testimonial_status` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `home_latest_post_total` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `home_latest_post_status` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `footer_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_phone` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_email` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `copyright` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pinterest` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `theme_color_1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme_color_2` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `analytic_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `settings`
--

INSERT INTO `settings` (`id`, `logo`, `favicon`, `top_bar_phone`, `top_bar_email`, `home_feature_status`, `home_room_total`, `home_room_status`, `home_testimonial_status`, `home_latest_post_total`, `home_latest_post_status`, `footer_address`, `footer_phone`, `footer_email`, `copyright`, `facebook`, `twitter`, `linkedin`, `pinterest`, `theme_color_1`, `theme_color_2`, `analytic_id`, `created_at`, `updated_at`) VALUES
(1, '1687682268.jpg', '1687713120.jpg', '085800084682', 'maykayudhaparadya@gmail.com', 'Show', '4', 'Show', 'Show', '3', 'Hide', 'Jl. Pahlawan No.42, Pangongangan, Kec. Manguharjo, Kota Madiun, Jawa Timur 63121', '085800084682', 'hotmermadiun@gmail.com', 'Hotel Merdeka Kota Madiun', 'https://www.facebook.com', 'https://www.twitter.com', 'https://www.linkedin.com', 'https://www.pinterest.com', '#001C30', '#159895', 'UA-84213520-6', NULL, '2023-06-29 03:16:15');

-- --------------------------------------------------------

--
-- Struktur dari tabel `slides`
--

CREATE TABLE `slides` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `photo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `heading` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button_url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `slides`
--

INSERT INTO `slides` (`id`, `photo`, `heading`, `text`, `button_text`, `button_url`, `created_at`, `updated_at`) VALUES
(1, '1687701270.jpg', 'HOTEL MERDEKA KOTA MADIUN', 'Hotel Bersejarah bintang 3 yang berada di pusat Kota Madiun\r\n                          \"Get The Satisfaction With Us\"', 'Read More', 'http://127.0.0.1:8000/', '2022-06-25 02:04:35', '2023-06-25 07:48:37'),
(2, '1687704604.jpg', 'Merdeka Room Suite', 'Nikmati Kamar Hotel Merdeka', 'Read More', 'http://127.0.0.1:8000/room/7', '2022-06-25 02:06:09', '2023-06-25 07:50:04');

-- --------------------------------------------------------

--
-- Struktur dari tabel `subscribers`
--

CREATE TABLE `subscribers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `subscribers`
--

INSERT INTO `subscribers` (`id`, `email`, `token`, `status`, `created_at`, `updated_at`) VALUES
(1, 'aa@gmail.com', '', 1, '2022-06-29 06:12:46', '2022-06-29 08:14:51'),
(2, 'bb@gmail.com', '', 1, '2022-06-29 08:16:18', '2022-06-29 08:16:47'),
(3, 'cc@gmail.com', '89c61eac3132dbf53502d5e17d51bfb523eaa9dfe0a06c21a08f6ee6c185bfb6', 0, '2022-06-29 18:06:54', '2022-06-29 18:06:54');

-- --------------------------------------------------------

--
-- Struktur dari tabel `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `photo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `testimonials`
--

INSERT INTO `testimonials` (`id`, `photo`, `name`, `designation`, `comment`, `created_at`, `updated_at`) VALUES
(1, '1687701826.png', 'Eny Yuliani', 'General Manager Hotel Merdeka', 'Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens. Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens.', '2022-06-25 21:52:58', '2023-06-25 07:03:46');

-- --------------------------------------------------------

--
-- Struktur dari tabel `videos`
--

CREATE TABLE `videos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `video_id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `caption` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `amenities`
--
ALTER TABLE `amenities`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `bayars`
--
ALTER TABLE `bayars`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `bayar_details`
--
ALTER TABLE `bayar_details`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `booked_gedungs`
--
ALTER TABLE `booked_gedungs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gedung_id` (`gedung_id`);

--
-- Indeks untuk tabel `booked_rooms`
--
ALTER TABLE `booked_rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `features`
--
ALTER TABLE `features`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `gedungs`
--
ALTER TABLE `gedungs`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `gedung_photos`
--
ALTER TABLE `gedung_photos`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `rekening`
--
ALTER TABLE `rekening`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `room_photos`
--
ALTER TABLE `room_photos`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `slides`
--
ALTER TABLE `slides`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `amenities`
--
ALTER TABLE `amenities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `bayars`
--
ALTER TABLE `bayars`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `bayar_details`
--
ALTER TABLE `bayar_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `booked_gedungs`
--
ALTER TABLE `booked_gedungs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `booked_rooms`
--
ALTER TABLE `booked_rooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT untuk tabel `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `features`
--
ALTER TABLE `features`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `gedungs`
--
ALTER TABLE `gedungs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `gedung_photos`
--
ALTER TABLE `gedung_photos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT untuk tabel `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT untuk tabel `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `photos`
--
ALTER TABLE `photos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `rekening`
--
ALTER TABLE `rekening`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `room_photos`
--
ALTER TABLE `room_photos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `slides`
--
ALTER TABLE `slides`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `videos`
--
ALTER TABLE `videos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `booked_gedungs`
--
ALTER TABLE `booked_gedungs`
  ADD CONSTRAINT `booked_gedungs_ibfk_1` FOREIGN KEY (`gedung_id`) REFERENCES `gedungs` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
