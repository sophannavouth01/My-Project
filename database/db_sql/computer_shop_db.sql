-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Feb 20, 2024 at 10:36 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `computer_shop_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_01_18_045321_add_role_to_users_table', 2),
(6, '2024_01_18_072215_create_products_table', 3),
(7, '2024_01_18_072938_make_image_nullable_in_products_table', 4),
(8, '2024_01_19_083653_create_orders_table', 5),
(9, '2024_01_19_083701_create_order_details_table', 5),
(10, '2024_01_20_070450_add_status_to_orders_table', 6),
(13, '2024_01_22_063336_create_payments_table', 7),
(15, '2024_01_23_032101_add_total_qty_to_orders_table', 8);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `total_amount` double(8,2) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_qty` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `total_amount`, `status`, `created_at`, `updated_at`, `total_qty`) VALUES
(41, 2, 25676.00, 'completed', '2024-01-23 21:04:04', '2024-01-23 21:19:04', 0),
(59, 3, 20401.00, 'completed', '2024-01-24 01:03:56', '2024-01-25 19:57:47', 0),
(67, 3, 2398.00, 'completed', '2024-01-25 20:55:17', '2024-01-25 21:25:36', 0),
(68, 3, 3797.00, 'completed', '2024-01-25 21:26:23', '2024-01-25 21:27:30', 0),
(69, 3, 2997.00, 'completed', '2024-01-25 21:29:20', '2024-01-25 21:30:34', 0),
(70, 3, 3996.00, 'completed', '2024-01-25 21:32:07', '2024-01-25 21:33:06', 0),
(71, 3, 2798.00, 'completed', '2024-01-25 21:36:44', '2024-01-25 21:37:17', 0),
(72, 3, 3198.00, 'completed', '2024-01-25 21:39:05', '2024-01-25 21:46:28', 0),
(74, 3, 2998.00, 'completed', '2024-01-25 23:35:50', '2024-01-25 23:47:33', 0),
(76, 3, 7195.00, 'completed', '2024-01-30 05:28:12', '2024-01-30 05:37:16', 0),
(77, 3, 21685.00, 'completed', '2024-02-06 04:32:55', '2024-02-06 07:30:28', 0),
(78, 3, 4097.00, 'completed', '2024-02-06 07:31:19', '2024-02-06 08:06:20', 3),
(81, 3, 3198.00, 'completed', '2024-02-07 01:38:14', '2024-02-07 01:39:04', 2),
(82, 3, 1599.00, 'completed', '2024-02-07 01:43:52', '2024-02-07 01:44:36', 1),
(85, 3, 3997.00, 'completed', '2024-02-12 05:05:48', '2024-02-12 05:07:34', 3);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  `price` double(8,2) NOT NULL,
  `total_price` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `qty`, `price`, `total_price`, `created_at`, `updated_at`) VALUES
(83, 41, 46, 20, 984.00, 19680.00, '2024-01-23 21:04:04', '2024-01-23 21:06:09'),
(85, 41, 14, 2, 1599.00, 3198.00, '2024-01-23 21:08:38', '2024-01-23 21:08:39'),
(86, 41, 16, 2, 1399.00, 2798.00, '2024-01-23 21:09:00', '2024-01-23 21:09:01'),
(103, 59, 39, 1, 8837.00, 8837.00, '2024-01-24 01:03:56', '2024-01-25 19:56:45'),
(104, 59, 40, 1, 8766.00, 8766.00, '2024-01-24 01:03:57', '2024-01-25 19:56:47'),
(110, 59, 16, 2, 1399.00, 2798.00, '2024-01-25 19:44:11', '2024-01-25 19:44:13'),
(125, 67, 16, 1, 1399.00, 1399.00, '2024-01-25 20:55:17', '2024-01-25 20:55:17'),
(126, 67, 17, 1, 999.00, 999.00, '2024-01-25 20:55:18', '2024-01-25 20:55:18'),
(127, 68, 16, 2, 1399.00, 2798.00, '2024-01-25 21:26:23', '2024-01-25 21:26:25'),
(128, 68, 17, 1, 999.00, 999.00, '2024-01-25 21:26:27', '2024-01-25 21:26:27'),
(129, 69, 17, 3, 999.00, 2997.00, '2024-01-25 21:29:20', '2024-01-25 21:29:22'),
(130, 70, 17, 4, 999.00, 3996.00, '2024-01-25 21:32:07', '2024-01-25 21:32:08'),
(131, 71, 16, 2, 1399.00, 2798.00, '2024-01-25 21:36:44', '2024-01-25 21:36:44'),
(132, 72, 14, 2, 1599.00, 3198.00, '2024-01-25 21:39:05', '2024-01-25 21:39:11'),
(135, 74, 14, 1, 1599.00, 1599.00, '2024-01-25 23:35:50', '2024-01-25 23:38:37'),
(136, 74, 16, 1, 1399.00, 1399.00, '2024-01-25 23:35:51', '2024-01-25 23:35:51'),
(140, 76, 14, 1, 1599.00, 1599.00, '2024-01-30 05:28:12', '2024-01-30 05:28:12'),
(141, 76, 16, 4, 1399.00, 5596.00, '2024-01-30 05:28:14', '2024-01-30 05:28:59'),
(143, 77, 16, 5, 1399.00, 6995.00, '2024-02-06 04:32:55', '2024-02-06 07:30:28'),
(144, 77, 17, 1, 999.00, 999.00, '2024-02-06 04:32:57', '2024-02-06 04:32:57'),
(145, 77, 18, 1, 899.00, 899.00, '2024-02-06 04:32:58', '2024-02-06 04:32:58'),
(146, 77, 14, 8, 1599.00, 12792.00, '2024-02-06 04:33:11', '2024-02-06 04:36:12'),
(147, 78, 14, 2, 1599.00, 3198.00, '2024-02-06 07:31:19', '2024-02-06 07:58:50'),
(148, 78, 18, 1, 899.00, 899.00, '2024-02-06 07:38:54', '2024-02-06 07:38:54'),
(155, 81, 14, 2, 1599.00, 3198.00, '2024-02-07 01:38:14', '2024-02-07 01:38:17'),
(156, 82, 14, 1, 1599.00, 1599.00, '2024-02-07 01:43:52', '2024-02-07 01:43:52'),
(161, 85, 14, 1, 1599.00, 1599.00, '2024-02-12 05:05:48', '2024-02-12 05:05:48'),
(162, 85, 16, 1, 1399.00, 1399.00, '2024-02-12 05:05:50', '2024-02-12 05:05:50'),
(163, 85, 17, 1, 999.00, 999.00, '2024-02-12 05:05:55', '2024-02-12 05:05:55');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `user_id`, `order_id`, `amount`, `payment_method`, `transaction_id`, `customer_name`, `address`, `phone_number`, `created_at`, `updated_at`) VALUES
(5, 2, 41, 25676.00, 'credit_card', NULL, 'Lida Spray', 'Battombong', '09876543', '2024-01-23 21:19:04', '2024-01-23 21:19:04'),
(6, 3, 59, 20402.00, 'cash', NULL, 'Dara Puth', 'Phnom penh', '012-896-7543', '2024-01-25 19:57:47', '2024-01-25 19:57:47'),
(7, 3, 67, 2398.00, 'credit_card', NULL, 'Reaksa', 'Kompot', '098-123-987', '2024-01-25 21:25:36', '2024-01-25 21:25:36'),
(8, 3, 68, 3797.00, 'credit_card', NULL, 'Dymong', 'Krate', '078-456-321', '2024-01-25 21:27:30', '2024-01-25 21:27:30'),
(9, 3, 69, 2997.00, 'cash', NULL, 'Leapheng', 'Chbar Ompov', '056-645-3552', '2024-01-25 21:30:34', '2024-01-25 21:30:34'),
(10, 3, 70, 3996.00, 'credit_card', NULL, 'Mengoun', 'Takeo', '023-456-789', '2024-01-25 21:33:06', '2024-01-25 21:33:06'),
(11, 3, 71, 2798.00, 'cash', NULL, 'test', 'pp', '0987', '2024-01-25 21:37:17', '2024-01-25 21:37:17'),
(12, 3, 72, 3198.00, 'cash', NULL, 'linhey', 'pp', '009984', '2024-01-25 21:46:28', '2024-01-25 21:46:28'),
(13, 3, 74, 2998.00, 'credit_card', NULL, 'Leak Sursdey', 'Sremreab', '098-534-378', '2024-01-25 23:47:33', '2024-01-25 23:47:33'),
(15, 3, 76, 3997.00, 'credit_card', NULL, 'GEEE', 'FFF', '99998', '2024-01-30 05:37:16', '2024-01-30 05:37:16'),
(16, 3, 78, 4097.00, 'cash', NULL, 'non', 'none', '0983', '2024-02-06 08:06:20', '2024-02-06 08:06:20'),
(17, 3, 81, 1599.00, 'credit_card', NULL, 'Leakna', 'Phnom Penh', '098-988-298', '2024-02-07 01:39:04', '2024-02-07 01:39:04'),
(18, 3, 82, 1599.00, 'cash', NULL, 'lika', 'BTB', '03098383', '2024-02-07 01:44:36', '2024-02-07 01:44:36'),
(19, 3, 85, 3997.00, 'cash', NULL, 'raksa', 'phnompenh', '0884642003', '2024-02-12 05:07:34', '2024-02-12 05:07:34');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pname` varchar(255) NOT NULL,
  `bcode` varchar(255) NOT NULL,
  `brandname` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `category` varchar(255) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` double(8,2) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `pname`, `bcode`, `brandname`, `color`, `image`, `category`, `qty`, `price`, `description`, `created_at`, `updated_at`) VALUES
(14, 'MacBook Pro 14”', '1234567890', 'Apple', 'Space Gray', 'products/Ek4Xevnr5Kjs77DpXhaWoOJ8VZnkHrMNEnFgMe6b.jpg', 'Laptop', 59, 1599.00, 'esting conducted by Apple in September and October 2023 using preproduction 16-inch MacBook Pro systems with Apple M3 Pro, 12-core CPU, 18-core GPU, 36GB of RAM, and 512GB SSD.', '2024-01-18 21:10:17', '2024-02-12 05:05:48'),
(15, 'M2', '0987654321', 'Apple', 'Black', 'products/U7IihOXfUTlBVKn05LDfDjUX3XXFLvVczRzg53u8.png', 'Laptop', 0, 1099.00, 'Released in 2020', '2024-01-18 21:21:06', '2024-01-18 21:21:06'),
(16, 'Macbook Air 2020', '0987654321', 'Apple', 'Space Grey', 'products/vzg7lkuz1t5IjyaZdT2iQYdgk4ZmXfK6PMZfLYwp.jpg', 'Laptop', 173, 1399.00, '14-inch MacBook Pro systems with Apple M3, 8-core CPU, 10-core GPU, and 24GB of RAM, production 13-inch MacBook Pro systems with Apple M2, 8-core CPU, 10-core GPU, and 24GB of RAM, production 13-inch MacBook Pro systems with Apple, and 16GB of RAM', '2024-01-18 21:37:27', '2024-02-12 05:05:50'),
(17, 'Macbook Pro 2023', '1234567890', 'Apple', 'White', 'products/4NxSKYGUAllIIXteKpT0yols7u5fMvYN11cS2fQR.jpg', 'Laptop', 218, 999.00, 'GB of RAM, production 13-inch MacBook Pro systems with Apple M2, 8-core CPU, 10-core GPU, and 24GB of RAM, production 13-inch MacBook Pro systems with Apple M1, 8-core CPU, 8-core GPU, and 16GB of RAM, and productio', '2024-01-18 21:39:11', '2024-02-12 05:05:55'),
(18, 'Macbook Air 2021', '098765567890', 'Apple', 'Black', 'products/rW91VSUsHWO9ECgbNJIm7HFdaAF5PcSiun6ge0kZ.jpg', 'Laptop', 285, 899.00, 'Septem 14-inch MacBook Pro systems with Apple M3, 8-core CPU, 10-core GPU, and 24GB of RAM, production 13-inch MacBook Pro systems with , and 24GB of RAM, production 13-inch MacBook Pro, and 16GB of RAM, and production 1.7GHz', '2024-01-18 21:41:04', '2024-02-06 07:38:54'),
(19, 'iMac 2022', '0987654321', 'Apple', 'white', 'products/WzwlPD9ruwPWFlnGvPP1Sn6oaGu4gbOVTT4DdBBu.jpg', 'Desktop', 200, 6000.00, 'The iMac \"M1\" 8-Core CPU/8-Core GPU/4 USB-C Shaped Ports (2022) model features a 5-nm 3.2 GHz Apple M1 processor with 8 cores (4 performance cores and 4 efficiency cores), an 8-core GPU, a 16-core Neural Engine, 8 GB of onboard RAM, and a 256 GB or 512 GB onboard SSD.', '2024-01-23 01:40:28', '2024-01-24 02:33:50'),
(20, 'MSI 2021', '1234567890', 'MSI', 'White', 'products/c7dIbUvxQOlpe7knicUCb7asEzjksSv06juzSZvp.jpg', 'Laptop', 300, 2999.00, 'MSI GS66 Stealth (mid-2021) Full Specifications\nGeneral. Brand. MSI. ...\nDisplay. Size. 15.60-inch. ...\nProcessor. Processor. Intel Core i7 11th Gen.\nGraphics. Dedicated Graphics. Yes. ...\nStorage. Hard disk. No.\nConnectivity. Wi-Fi standards supported. 802.11 ac/ax. ...\nInputs. Web Camera. Yes. ...\nPorts and slots. Number of USB Ports. USB 3.2 Gen 2 (Type C)', '2024-01-23 01:51:26', '2024-01-23 02:14:44'),
(21, 'iMac2023', '1234567890', 'Apple', 'Green', 'products/kJVRVPHwouGiFnN6NyJiN5FDuAeQ8rbzIyRrZly4.jpg', 'Desktop', 655, 2100.00, 'Apple M3 chip\n8-core CPU with 4 performance cores and 4 efficiency cores.\n10-core GPU.\nHardware-accelerated ray tracing.\n16-core Neural Engine.\n100GB/s memory bandwidth.', '2024-01-23 01:57:59', '2024-01-24 02:33:52'),
(22, 'iMac 2020', '0987654321', 'Apple', 'Grey', 'products/wot7ht7tzGTmJfd4PicbPtAkpK9HsPxkDXjOmZp5.jpg', 'Desktop', 654, 4320.00, 'Key Features\n3.6 GHz Intel Core i9 10-Core (10th Gen)\n8GB DDR4 RAM | 1TB PCIe SSD\n27\" 5120 x 2880 IPS Retina 5K Display\nAMD Radeon Pro 5700 XT (16GB GDDR6)', '2024-01-23 02:21:11', '2024-01-24 02:33:51'),
(24, 'IMac 2020', '123456789', 'Apple', 'Yellow', 'products/BqT0y5gHzqW0UPRTT0Mp1H5QiQz1T3rB8gSEB2lH.jpg', 'Desktop', 765, 1234.00, 'The iMac \"Core i5\" 3.1 27-Inch Aluminum (Retina 5K, 2020/Comet Lake) features a 14-nm \"Comet Lake\" 3.1 GHz Intel \"Core i5\" processor (I5-10500) with six independent processor \"cores\" on a single chip, a 12 MB shared level 3 cache, a T2 Security Chip, 8 GB of easy to upgrade 2666 MHz DDR4 SDRAM, a 256 GB onboard SSD, and a Radeon Pro 5300 graphics processor with 4 GB of dedicated GDDR6 video memory. ', '2024-01-23 02:33:51', '2024-01-23 02:33:51'),
(25, 'Asus  ProArt 2023', '1234567890', 'Asus', 'Blue', 'products/5wginZPSwFpmJCWuu0mTpqs1Uk3osSPoRpbC2yHv.jpg', 'Desktop', 1234, 23456.00, 'ASUS 2023 ProArt StudioBook 16 OLED Laptop, 16â€ 3.2K OLED Touch Display, Intel Core i9-13980HX CPU, Nvidia Geforce RTX 4070 GPU, 32GB DDR5 SO-DIMM RAM, 1TB SSD, Windows 11 Home, H7604JI-DS96T', '2024-01-23 02:38:19', '2024-01-23 02:38:19'),
(26, 'Monitor Asus 2020', '1234567890', 'Asus', 'Blue', 'products/dy8J4m3KmUpWhAzqSSQfRrv3doCIGucW3VBaVmgD.jpg', 'Desktop', 1234, 9876.00, 'ASUS 22” (21.45” viewable) 1080P Eye Care Monitor (VZ22EHE) - Full HD, IPS, 75Hz, 1ms (MPRT), Adaptive-Sync, HDMI, Low Blue Light, Flicker Free, HDMI, VGA, Ultra-Slim,Black', '2024-01-23 02:51:22', '2024-01-23 02:51:22'),
(27, 'ASUS A3402 PC', '0987654321', 'Asus', 'White', 'products/WHaiZsUJBQkcLsvGdwm9BIJ0diUeo9CtthERL21y.jpg', 'Desktop', 65432, 876.00, 'ASUS A3402 PC All-in-One, 23.8” FHD, Intel i7-1255U,16GB, 512GB SSD, Win 11 Home, A3402WBA-PB704T', '2024-01-23 02:53:51', '2024-01-23 02:53:51'),
(28, 'Asus ROG ', '1234567890', 'Asus', 'Black', 'products/GgJHzEnilJe1XsNKYT4QnqnMYQ9tNF6KgAQzvqdJ.png', 'Desktop', 12, 2345.00, 'ROG Strix 24.5” 1080P Gaming Monitor (XG256Q) - Full HD, Fast IPS, 180Hz, 1ms, G-Sync Compatible/FreeSync, DisplayPort, HDMI, DisplayHDR400 , BLACK', '2024-01-23 02:55:04', '2024-01-23 02:55:04'),
(29, 'Msi Curved Gaming', '0987654321', 'MSI', 'Black', 'products/fE8ytahWOwloSbjlA2eGaC0sLnpGvzLeSsyKRSqt.png', 'Desktop', 4653, 33344.00, 'G27C4X 27\" Curved Gaming Monitor, 1920 x 1080 (FHD), 1ms, 250Hz, FreeSync, HDMI, DisplayPort, Anti-Flicker, Anti-Glare, HDR Ready,Black', '2024-01-23 02:55:49', '2024-01-23 02:55:49'),
(30, 'Msi Reddot 2021', '1234567890', 'MSI', 'Gray', 'products/Ze4AGniwjKieqAJDfH7CmSYqgh0DnfoiBdP6y10f.jpg', 'Desktop', 987, 2436.00, 'Modern MD272XPW 27\" FHD 100Hz Flat Business & Productivity Monitor\n27\" Flat display.\n1920 x 1080 (FHD) resolution.\n4ms (GTG) Respond Time and 100Hz Refresh Rate.\nIn-Plane Switching (IPS) technology.\n16:9 Aspect ratio.\nFreeSync Technology.\nAdjustability: Height/Pivot/Swivel/Tilt.\nRed Dot Design Award 2021 Winner.', '2024-01-23 02:56:59', '2024-01-23 02:56:59'),
(31, 'Msi Curved Gaming', '0987654321', 'MSI', 'Black', 'products/M2NeI4Y5g2lDYzksWsVm6hhQn7iHrGriNfjMTttX.png', 'Desktop', 46644, 87764.00, 'G32C4X, 32\" Gaming Monitor, 1920 x 1080 (FHD) Curved Gaming Monitor, 1 ms, 250Hz, FreeSync, 1500R, HDMI, DisplayPort, Tilt Adjustable, Black', '2024-01-23 02:58:00', '2024-01-23 02:58:00'),
(32, 'Msi Optix', '1234567890', 'MSI', 'Black', 'products/waU4VSPgeGqkkyJXO5Ce6iqLfIygBMfTXzg45CFw.png', 'Desktop', 874, 87634.00, 'MSI Optix MAG342CQR 1500R Curvature 21:9 Aspect Ratio Narrow Bezel 1ms 3440 x 1440 (UWQHD) 144Hz Refresh Rate Tilt/Swivel/Height/Pivot Adjustment 34\" AMD Freesync Gaming Curved Monitor, Black', '2024-01-23 02:59:02', '2024-01-23 02:59:02'),
(33, 'Dell Vostro', '1234567890', 'Dell', 'White', 'products/O8IQrXYIRqZweL0C9rRNsAdh5DfsNwyciGICfe5i.jpg', 'Desktop', 675, 4332.00, 'Dell Vostro 3888 Tower Desktop PC Bundle - 10th Gen Intel Core i5 10400, 16GB DDR4 , 500 SSD + 1TB HDD, Intel UHD Graphics 630, With Wired English Keyboard, Mouse and Dell 27 inch LED FHD Monitor', '2024-01-23 03:00:37', '2024-01-23 03:00:37'),
(34, 'Dell P2422H', '987654321', 'Dell', 'Black', 'products/rwHNwibMFlWVOYwPwChv3qfgSX80uWspMg1wa6Jq.jpg', 'Desktop', 234, 4343.00, 'Dell P2422H 24\" 16:9 IPS Computer Monitor Screen with Display Port Cable and USB 3.0 Upstream Cable - New Model', '2024-01-23 03:01:55', '2024-01-23 03:01:55'),
(35, 'Dell Inspiron', '1234567890', 'Dell', 'White', 'products/twPK6c9JZwjQtSxPRDBoTmE0Izp9tKpaSCPMaAKY.jpg', 'Desktop', 6453, 6554.00, 'Dell Inspiron\n13th Gen Intel® Core™ i5-13400 (20 MB cache, 10 cores, 16 threads, 2.50 GHz to 4.60 GHz Turbo)\n\nlaptop\nWindows 11 Home Single Language, English\n\nvideocard\nIntel® UHD Graphics 730\n\nmemory\n16 GB: 1 x 16 GB, DDR4, 3200 MT/s\n\nharddrive\n512 GB, M.2, PCIe NVMe, SSD\n\nfallbackcolor\n180W Black Chassis with Mist Blue Bezel', '2024-01-23 03:05:16', '2024-01-23 03:06:41'),
(36, 'Dell UltraSharp', '1234567890', 'Dell', 'White', 'products/SQWF3KT6vX3PF1L4pjQnEdI81iIDmGWFXtmCUGPZ.jpg', 'Desktop', 645, 2733.00, 'Dell UltraSharp U2723QE 27\" 4K UHD WLED LCD Monitor - 16:9 - Black, Silver', '2024-01-23 03:07:50', '2024-01-23 03:07:50'),
(37, 'ASUS - Zenbook', '1234567890', 'Asus', 'none', 'products/AhaQQAPckiKhhAfK0tGYJLNouUkSTF8lGnij2rsq.jpg', 'Laptop', 6644, 8734.00, 'ASUS - Zenbook 14X 14.5\" 2.8K OLED Touch Laptop - Intel Evo Platform i7-13700H - 16GB Memory - 512GB SSD - Inkwell Gray', '2024-01-23 03:17:32', '2024-01-23 03:17:32'),
(38, 'ASUS\nVivobook', '1234567890', 'Asus', 'none', 'products/jO94wcVSVJAyMk1TdZ3uc5DdwEc48HaTMYVvolLr.jpg', 'Laptop', 98474, 88374.00, 'ASUS\nVivobook 16X OLED Laptop, 16” 3.2K 120Hz Display, Intel Core i9-13900H CPU, NVIDIA Geforce RTX 4060 GPU, 32GB RAM, 1TB SSD, Windows 11 Home, Indie Black, K3605VV-ES96', '2024-01-23 03:18:27', '2024-01-23 03:20:38'),
(39, 'ASUS - Zenbook', '0987654321', 'Asus', 'none', 'products/CW5YhpHgHSUT3qctdAUm9m33CQINBJW5DHTTtvJn.jpg', 'Laptop', 2773, 8837.00, 'ASUS - Zenbook 14\" 120Hz OLED Touch Laptop - EVO Intel 13 Gen Core i9 with 32GB Memory - NVIDIA GeForece RTX 3050 - 1TB SSD - Gray', '2024-01-23 03:20:01', '2024-01-25 19:56:45'),
(40, 'ASUS\nVivobook', '0987654321', 'Asus', 'none', 'products/BienyPt16Ba8bOzfgNxG5pQxhDn2cDWTskLE2733.jpg', 'Laptop', 889, 8766.00, 'ASUS\nVivobook 16X OLED Laptop, 16” 3.2K 120Hz Display, Intel Core i9-13900H CPU, NVIDIA Geforce RTX 4060 GPU, 32GB RAM, 1TB SSD, Windows 11 Home, Indie Black, K3605VV-ES96', '2024-01-23 03:21:16', '2024-02-07 01:36:19'),
(41, 'Dell 2022 Newest Inspiron', '0987654321', 'Dell', 'none', 'products/BJuRmjZalcbAuC2YDiZmPpizo1Ww8foTn77YkwZo.jpg', 'Laptop', 97874, 87464.00, 'Dell 2022 Newest Inspiron 15 3511 Laptop, 15.6\" FHD Touchscreen, Intel Core i5-1035G1, 16GB RAM, 1TB PCIe NVMe M.2 SSD, SD Card Reader, Webcam, HDMI, WiFi, Windows 11 Home, Black', '2024-01-23 03:21:58', '2024-01-23 03:21:58'),
(42, 'Dell Inpiron ', '09876444', 'Dell', 'none', 'products/NKmrChIN5uXReTBLa1y3SdZzDjRdng94xhJggb5Z.jpg', 'Laptop', 7644, 8733.00, 'Dell Inspiron 15 3511 15.6 Inch Laptop, Full HD LED Non-Touch WVA Display - Intel Core i3-1115G4, 8GB DDR4 RAM, 256GB SSD, UHD Graphics, Windows 11 Home - Carbon Black', '2024-01-23 03:22:26', '2024-01-23 03:22:26'),
(43, 'Dell 2023 Newest Inspiron ', '0987654321', 'Dell', 'none', 'products/O0jhDMwJGs8cPEi1iQSjB24wzZ68UjEuifXBGgHi.jpg', 'Laptop', 789, 87653.00, 'Dell 2023 Newest Inspiron Laptop, 15.6\" FHD IPS Touchscreen, Intel Core i5-1155G7(Beats i7-1065G7) Processor (Quad-core), 16GB RAM, 512GB SSD, Wi-Fi, Bluetooth, Windows 11 Home, Carbon Black', '2024-01-23 03:23:12', '2024-01-23 03:28:32'),
(44, 'OEM Dell Latitude ', '0987654321', 'Dell', 'none', 'products/7sQXsz0nsJkJsc2pg703jyNs7TzhsziYtN85L4dx.jpg', 'Laptop', 87264, 6453.00, 'OEM Dell Latitude 3540 Notebook 15.6” FHD, Intel 10 Core i5-1335U (Beats i7-1270P), 16GB RAM, 512GB NVMe, WiFi 6, BT, HD Webcam, RJ-45, W11P, Business Laptop', '2024-01-23 03:23:44', '2024-01-23 03:27:36'),
(45, 'Msi 2021', '0987654321', 'MSI', 'none', 'products/JDKwoIOAYvJkrLswbLyPSWDZea40pZnhuFMwmAU3.jpg', 'Laptop', 97344, 83764.00, '2021 MSI - GF63035 | 15.6\" Full HD Gaming Laptop | Intel Core i5-10200H | 8GB DDR4/3200MHz, 256GB SSD (PCI-e) | Black, Windows 10 Home', '2024-01-23 03:29:28', '2024-01-23 03:29:28'),
(46, 'Msi Thin', '0987654321', 'MSI', 'none', 'products/smmlhXBtBsBEQtNLgh9zXW34FY6cVgDhIkvS6VCh.jpg', 'Laptop', 9874, 984.00, 'MSI Thin GF63 Gaming Laptop: Intel Core i5-12450H GeForce RTX 2050, 15.6\" FHD, 144Hz, 8GB DDR4, 512GB NVMe SSD, Type-C USB 3.2 Gen 1, Cooler Boost 5, Win 11 Home: Black 12UCX-484US', '2024-01-23 03:30:05', '2024-01-24 00:41:38'),
(47, 'MSI GV15 ', '0987654321', 'MSI', 'none', 'products/GJIVr0JO8VJxitqwkg0YrmidSPN6Hjic8JoLNSEX.jpg', 'Laptop', 977, 26343.00, 'MSI GV15 15.6\" 144Hz Gaming Laptop: Intel Core i5-11400H GTX 1650 8GB 256GB NVMe SSD, Wi-Fi 6, USB Type-C, Nahimic 3 Audio Immersion, Win 11: Black 11SC-633', '2024-01-23 03:30:51', '2024-01-24 00:41:39'),
(48, 'iPhone Charger', '0987654321', 'Apple', 'white', 'products/BubFaaqiFDU0md6y79M8jZi1kxnKSCLee6Dav89G.png', 'Accessory', 20, 300.00, 'iPhone Charger [MFi Certified] 2 Pack 20W USB C Fast Wall Charger Adapter with 6 FT USB-C to C Cable and USB-C to Lightning Cable for iPhone 15 14 13 12 11 Pro Max XR XS, iPad, Galaxy, AirPods', '2024-02-07 02:56:52', '2024-02-07 03:12:16'),
(49, 'Wireless Headphones', '0987654321', 'Apple', 'BLUE', 'products/gnnbxCpoLy03eKE9MOUpfLEoqcwZLPm1rYQJ18m4.jpg', 'Accessory', 2, 99.00, 'WH-CH520 Wireless Headphones Bluetooth On-Ear Headset with Microphone, Black New', '2024-02-07 19:48:33', '2024-02-07 19:48:33'),
(50, 'Screen', '0987654321', 'Apple', 'BLACK', 'products/qBqfG9OOxZ7D6BGYdvp5t8kqBRbsF39UFQU4rUbl.jpg', 'Accessory', 90, 899.00, 'Halloive 15.6 Inch Anti Blue Light Laptop Screen Protectorand Anti Glare Filter, Eye Protection Laptop Blue Light Blocking Screen for 15.6\" with 16:9 Aspect Ratio Widescreen Laptop Monitor', '2024-02-07 19:50:56', '2024-02-07 19:50:56'),
(51, 'Screen', '123456789', 'Apple', 'white', 'products/Otk8fTZeyGUiKDaiKRgHwQTz0TMvO7ndnr9JNKiT.jpg', 'Accessory', 88, 699.00, 'Halloive 15.6 Inch Anti Blue Light Laptop Screen Protectorand Anti Glare Filter, Eye Protection Laptop Blue Light Blocking Screen for 15.6\" with 16:9 Aspect Ratio Widescreen Laptop Monitor', '2024-02-07 19:52:54', '2024-02-07 19:52:54'),
(52, 'Laptop Charger', '0987654321', 'Asus', 'none', 'products/wmhWWeE0aU4JqAjAU7P7fxwyNDzb7vR4VP3DNfdv.jpg', 'Accessory', 11, 120.00, 'Laptop Charger for Asus, Vivobook, Zenbook, (UL Safety Certified), Round Connector, 65W, 45W, 33W', '2024-02-07 20:05:42', '2024-02-07 20:07:52'),
(53, 'ASUS Bag', '1234567890', 'Asus', 'none', 'products/Sh7o37XgTn2hQpaUhgmqzjgCTfqprGztcCPi1Qlv.jpg', 'Accessory', 2, 8.00, 'ASUS Classic, Black/White, One Size', '2024-02-07 20:06:36', '2024-02-07 20:06:36'),
(54, 'ASUS Mouse', '1234567890', 'Asus', 'none', 'products/JQdx7WVGCwDa3GS3bBqMUfppGfkzXizXRnqOEZj1.jpg', 'Accessory', 12, 89.00, 'ASUS ROG Spatha X Wireless Gaming Mouse (Magnetic Charging Stand, 12 Programmable Buttons, 19,000 DPI, Push-fit Hot Swap Switch Sockets, ROG Micro Switches&Paracord and Aura RGB lighting),Black', '2024-02-07 20:10:15', '2024-02-07 20:12:32'),
(55, 'ASUS Board', '0125489855', 'Asus', 'none', 'products/gjOwm3tbfgWUXnVq9ovXl3r8RaLx89EoGxyANaxU.jpg', 'Accessory', 11, 122.00, 'ASUS ROG Strix Z690-E Gaming WiFi 6E LGA 1700(Intel 12th Gen)ATX motherboard(PCIe 5.0,DDR5,2.5 Gb LAN,Thunderbolt 4,5xM.2,1xPCIe 5.0 M.2,ROG Hyper M.2 Card,Front panel USB 3.2 Gen 2x2 Type-C)', '2024-02-07 20:15:07', '2024-02-07 20:15:07'),
(56, 'Keyboard', '0359798555', 'Dell', 'none', 'products/j2VFks0WM24nYPdQAZoQ6GwWnfIkJBufxTomLgEN.png', 'Accessory', 89, 90.00, 'Dell KM900 Premier Collaboration Keyboard and Mouse - Zoom Touch Controls, Backlight Keyboard, Bluetooth 5.1, Radio Frequency 2.4GHz - Black', '2024-02-07 20:17:34', '2024-02-07 20:17:34'),
(57, 'Dell Gaming Backpack', '0547812554', 'Dell', 'none', 'products/XCOa8NEyzbK8iMS9CLJsTRoRNtpDXsDViCsvNfBl.jpg', 'Accessory', 90, 90.00, 'Dell Gaming Backpack 17\" - GMBP1720M', '2024-02-07 20:20:29', '2024-02-07 20:20:29'),
(58, 'RGB Keyboard', '0425896314', 'Dell', 'none', 'products/C9yebhvEWk6WBfbmTQI8XQIM7LnGjawvwLLjxp8d.png', 'Accessory', 3, 33.00, 'AULA Gaming Keyboard, 104 Keys Gaming Keyboard and Mouse Combo with RGB Backlit, All-Metal Panel, Anti-Ghosting, PC Gaming Keyboard and Mouse', '2024-02-07 20:23:45', '2024-02-07 20:23:45'),
(59, 'Webcam', '0958426142', 'Dell', 'none', 'products/zoazCeRJNt1qZtiw7wNpsdiszpX8oVphQadh3F7D.jpg', 'Accessory', 2, 222.00, 'Dell UltraSharp HDR 4K Webcam with Privacy Cover, HD USB Computer Camera with 4K Sony STARVIS CMOS / IR / Proximity Sensor,  Black - Anodized Aluminum - WB7022 – for Windows', '2024-02-07 20:27:10', '2024-02-07 20:27:10'),
(60, 'Headphones', '0965214452', 'MSI', 'none', 'products/iQkDEZMdWCxUAgvVZbrVzCMfqqCYy2JiL7CxV65R.jpg', 'Accessory', 3, 222.00, 'MSI DS502 Gaming Headset, Enhanced Virtual 7.1 Surround Sound, Ergonimic Design, Omnidirectional Microphone, Intelligent Vibration System, Red LED Lighting, PC/Mac', '2024-02-07 20:30:05', '2024-02-07 20:30:05'),
(61, 'Mouse', '0978546252', 'MSI', 'none', 'products/4fjTAERMBPA9tazlzthKPd2WtMUjgxbFaNJh2C4N.jpg', 'Accessory', 3, 333.00, 'MSI Clutch GM08 Gaming Mouse, 4200 DPI, Optical Sensor, 3 Adjustable Weights, Red LED Lighting, Symmetrical Design, Black', '2024-02-07 20:31:16', '2024-02-07 20:31:16'),
(62, 'Gaming Chair', '0123546852', 'MSI', 'none', 'products/8RO4Qtvoy0XdNUh7WQQq3tWMzWtzxZ9LCpSkgw6F.png', 'Accessory', 3, 180.00, 'Darkecho Gaming Chair with Footrest Massage Racing Office Computer Ergonomic Chair Leather Reclining Video Game Chair Adjustable Armrest High Back Esports Chair with Headrest and Lumbar Support Red', '2024-02-07 20:33:17', '2024-02-07 20:40:22'),
(63, 'Game Controller', '0987654321', 'MSI', 'none', 'products/OgrHrhDrFZnpBSmWpgJOYj4vOyiQ9aS7es6hZwIc.jpg', 'Accessory', 3, 22.00, 'MSI Force GC30V2 Wireless Gaming Controller, Dual Vibration Motors, Dual Connection Modes, Interchangable D-Pads, Compatible with PC & Android', '2024-02-07 20:43:25', '2024-02-07 20:43:25');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role`) VALUES
(1, 'Sophanna', 'Sophanna@gmail.com', NULL, '$2y$12$0HiPnuypweGg7ipDWzfcNebthtTqKR/tEig6e9TqqD5T6iUrkvmza', NULL, '2024-01-17 22:50:41', '2024-01-25 19:36:57', 'admin'),
(2, 'Muyheng', 'Muyheng@gmail.com', NULL, '$2y$12$1LKUeUTxWC1nzDRwwnQJCe43v2IBuCRdTRNK9Lfn.qT9ExBITno52', NULL, '2024-01-17 23:04:01', '2024-01-25 19:35:37', 'admin'),
(3, 'Sunheng', 'Sunheng@gmail.com', NULL, '$2y$12$8sRyLZ9Vey8/8MPdYHBil.VbiEp2Kafn3sA1ud6H3/1Y8d/KgevT.', NULL, '2024-01-18 08:19:36', '2024-01-23 00:09:56', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_details_order_id_foreign` (`order_id`),
  ADD KEY `order_details_product_id_foreign` (`product_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_user_id_foreign` (`user_id`),
  ADD KEY `payments_order_id_foreign` (`order_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
