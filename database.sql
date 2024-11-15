-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 15, 2024 at 05:32 PM
-- Server version: 10.6.18-MariaDB-0ubuntu0.22.04.1
-- PHP Version: 8.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `is_task`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
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
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_11_14_205933_create_personal_access_tokens_table', 1),
(5, '2024_11_14_210213_create_products_table', 1),
(6, '2024_11_14_210304_create_orders_table', 1),
(7, '2025_11_14_210304_create_order_details_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `total`, `created_at`, `updated_at`) VALUES
(1, 1, '710.00', '2024-11-15 14:56:17', '2024-11-15 14:56:17'),
(2, 1, '364.00', '2024-11-15 15:01:08', '2024-11-15 15:01:08'),
(3, 1, '1054.00', '2024-11-15 15:02:43', '2024-11-15 15:02:43'),
(4, 1, '19.00', '2024-11-15 15:03:37', '2024-11-15 15:03:37'),
(5, 1, '131.00', '2024-11-15 15:03:57', '2024-11-15 15:03:57');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 74, 1, '224.00', '2024-11-15 14:56:17', '2024-11-15 14:56:17'),
(2, 1, 73, 1, '486.00', '2024-11-15 14:56:17', '2024-11-15 14:56:17'),
(3, 2, 94, 1, '42.00', '2024-11-15 15:01:08', '2024-11-15 15:01:08'),
(4, 2, 93, 1, '322.00', '2024-11-15 15:01:08', '2024-11-15 15:01:08'),
(5, 3, 65, 2, '408.00', '2024-11-15 15:02:43', '2024-11-15 15:02:43'),
(6, 3, 66, 1, '238.00', '2024-11-15 15:02:43', '2024-11-15 15:02:43'),
(7, 4, 96, 1, '19.00', '2024-11-15 15:03:37', '2024-11-15 15:03:37'),
(8, 5, 102, 1, '131.00', '2024-11-15 15:03:57', '2024-11-15 15:03:57');

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

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'api_token', '434cf0ddbfe44225ada108f5823e9ec0a93508d0dc05bb2fc86effdc8238c1c0', '[\"*\"]', NULL, NULL, '2024-11-14 19:57:45', '2024-11-14 19:57:45'),
(4, 'App\\Models\\User', 1, 'api_token', '1564923aeae85296f74a257619670374531700fdf1756bb9ca031b60bfd183c3', '[\"*\"]', '2024-11-15 15:02:43', NULL, '2024-11-14 20:08:53', '2024-11-15 15:02:43'),
(5, 'App\\Models\\User', 2, 'api_token', 'd5cb604d1b21b518e186b4760f535b1a02d190016d140f1700a57ba30abbc7db', '[\"*\"]', NULL, NULL, '2024-11-15 10:25:20', '2024-11-15 10:25:20'),
(6, 'App\\Models\\User', 1, 'api_token', 'a487a78774e60ef8f30e1dcc1025e9961535753cf87a2ee7e393bc7c83dfb1d6', '[\"*\"]', NULL, NULL, '2024-11-15 11:33:15', '2024-11-15 11:33:15'),
(7, 'App\\Models\\User', 3, 'api_token', '3ab04200168439a97ddb7a4ec1bad42d79356523f1cea3694415b1a6abf56941', '[\"*\"]', NULL, NULL, '2024-11-15 11:37:30', '2024-11-15 11:37:30'),
(8, 'App\\Models\\User', 4, 'api_token', '64af028ea05cecfb16354e60722fb03f8000c33e31e42549bf32f7585702cb4f', '[\"*\"]', NULL, NULL, '2024-11-15 11:39:05', '2024-11-15 11:39:05'),
(9, 'App\\Models\\User', 1, 'api_token', '4e75a713519fca81fb76786e594e04afaba603209560130a6d64155df9172f38', '[\"*\"]', NULL, NULL, '2024-11-15 12:35:39', '2024-11-15 12:35:39'),
(10, 'App\\Models\\User', 1, 'api_token', '23bcf86b8f23f472552278c86a6a3a0d13a4004c0c9e51e76c12b6d58782288f', '[\"*\"]', NULL, NULL, '2024-11-15 12:38:53', '2024-11-15 12:38:53'),
(11, 'App\\Models\\User', 1, 'api_token', '85515eef9df606855a54005f9e9b4179fb5f76d71966d23c809aedcbaaf68426', '[\"*\"]', NULL, NULL, '2024-11-15 12:46:59', '2024-11-15 12:46:59'),
(12, 'App\\Models\\User', 1, 'api_token', '082cb9cb4d6ffc17a73f022dce5a77d55c2ea8ccebd5201783e83a0c346db138', '[\"*\"]', NULL, NULL, '2024-11-15 12:47:13', '2024-11-15 12:47:13'),
(13, 'App\\Models\\User', 1, 'api_token', '44df48f7705e372e8c307fa1fc2410273519907338a8b5f2590febf7e24c80f9', '[\"*\"]', NULL, NULL, '2024-11-15 12:50:22', '2024-11-15 12:50:22'),
(14, 'App\\Models\\User', 1, 'api_token', '0d292360d87a46c4ca1bfaa5ba383278a2b64efa4600a6e45c984c1e3d6f3c7f', '[\"*\"]', NULL, NULL, '2024-11-15 12:52:37', '2024-11-15 12:52:37'),
(15, 'App\\Models\\User', 1, 'api_token', '4bbc33b81fe9b952f1628c7fee573028931dd5a0ebfbb3284d88ae5a18b643d2', '[\"*\"]', '2024-11-15 12:54:48', NULL, '2024-11-15 12:53:54', '2024-11-15 12:54:48'),
(16, 'App\\Models\\User', 1, 'api_token', '2eb3b83275d4b8cb62e44c6108a57a23f32134f3164f9c324bef53d244e08c50', '[\"*\"]', '2024-11-15 12:56:07', NULL, '2024-11-15 12:55:11', '2024-11-15 12:56:07'),
(17, 'App\\Models\\User', 1, 'api_token', '5e89e8c42f15b42f379c9f5cd7f25ae1e228198415168adb99c94b901758549d', '[\"*\"]', '2024-11-15 12:56:32', NULL, '2024-11-15 12:56:16', '2024-11-15 12:56:32'),
(18, 'App\\Models\\User', 1, 'api_token', 'fb9b781278b75412a1219c079cb972be81abb6ebf4707b69d6c902f2cf5a5e40', '[\"*\"]', '2024-11-15 12:59:30', NULL, '2024-11-15 12:56:38', '2024-11-15 12:59:30'),
(19, 'App\\Models\\User', 1, 'api_token', 'ae800ad93616088ca113d0464c3d87893ff9b53340fc7a2d204e7041a92166ed', '[\"*\"]', '2024-11-15 13:11:16', NULL, '2024-11-15 13:00:00', '2024-11-15 13:11:16'),
(20, 'App\\Models\\User', 1, 'api_token', '21e669d4fd9c60580ca7bd122a7cfea28733842e89c7e2db7a74f134efbac1f4', '[\"*\"]', '2024-11-15 13:20:44', NULL, '2024-11-15 13:16:31', '2024-11-15 13:20:44'),
(21, 'App\\Models\\User', 1, 'api_token', '616cd3a2e86accb36b579b196b9fe79f9bce2b942d485891587d0334e3b3e2e3', '[\"*\"]', '2024-11-15 13:21:49', NULL, '2024-11-15 13:21:49', '2024-11-15 13:21:49'),
(22, 'App\\Models\\User', 1, 'api_token', 'dacf213e43fa6798d1d981d985e535d734789aca3503993fd78f63c838af0050', '[\"*\"]', '2024-11-15 14:41:22', NULL, '2024-11-15 13:22:56', '2024-11-15 14:41:22'),
(23, 'App\\Models\\User', 1, 'api_token', '650be26ce025aacf4103ea334ac797c72a0cf7a3fce5c01fa81eb117940a93e6', '[\"*\"]', '2024-11-15 15:27:56', NULL, '2024-11-15 14:41:33', '2024-11-15 15:27:56');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `price`, `image`, `created_at`, `updated_at`) VALUES
(62, 'aspernatur', '356.00', 'https://www.cnet.com/a/img/resize/483f6629791616f58f3a205df4d52e40b8cba429/hub/2024/03/06/725a8e72-aa72-439a-9357-af161b30f3c9/apple-macbook-air-m3-2024-14.jpg?auto=webp&fit=crop&height=1200&width=1200', '2024-11-14 20:17:48', '2024-11-14 20:17:48'),
(63, 'iure', '206.00', 'https://www.cnet.com/a/img/resize/483f6629791616f58f3a205df4d52e40b8cba429/hub/2024/03/06/725a8e72-aa72-439a-9357-af161b30f3c9/apple-macbook-air-m3-2024-14.jpg?auto=webp&fit=crop&height=1200&width=1200', '2024-11-14 20:17:48', '2024-11-14 20:17:48'),
(64, 'corrupti', '27.00', 'https://www.cnet.com/a/img/resize/483f6629791616f58f3a205df4d52e40b8cba429/hub/2024/03/06/725a8e72-aa72-439a-9357-af161b30f3c9/apple-macbook-air-m3-2024-14.jpg?auto=webp&fit=crop&height=1200&width=1200', '2024-11-14 20:17:48', '2024-11-14 20:17:48'),
(65, 'est', '408.00', 'https://www.cnet.com/a/img/resize/483f6629791616f58f3a205df4d52e40b8cba429/hub/2024/03/06/725a8e72-aa72-439a-9357-af161b30f3c9/apple-macbook-air-m3-2024-14.jpg?auto=webp&fit=crop&height=1200&width=1200', '2024-11-14 20:17:48', '2024-11-14 20:17:48'),
(66, 'molestiae', '238.00', 'https://www.cnet.com/a/img/resize/483f6629791616f58f3a205df4d52e40b8cba429/hub/2024/03/06/725a8e72-aa72-439a-9357-af161b30f3c9/apple-macbook-air-m3-2024-14.jpg?auto=webp&fit=crop&height=1200&width=1200', '2024-11-14 20:17:48', '2024-11-14 20:17:48'),
(67, 'sint', '28.00', 'https://www.cnet.com/a/img/resize/483f6629791616f58f3a205df4d52e40b8cba429/hub/2024/03/06/725a8e72-aa72-439a-9357-af161b30f3c9/apple-macbook-air-m3-2024-14.jpg?auto=webp&fit=crop&height=1200&width=1200', '2024-11-14 20:17:48', '2024-11-14 20:17:48'),
(68, 'molestiae', '51.00', 'https://www.cnet.com/a/img/resize/483f6629791616f58f3a205df4d52e40b8cba429/hub/2024/03/06/725a8e72-aa72-439a-9357-af161b30f3c9/apple-macbook-air-m3-2024-14.jpg?auto=webp&fit=crop&height=1200&width=1200', '2024-11-14 20:17:48', '2024-11-14 20:17:48'),
(69, 'nam', '16.00', 'https://www.cnet.com/a/img/resize/483f6629791616f58f3a205df4d52e40b8cba429/hub/2024/03/06/725a8e72-aa72-439a-9357-af161b30f3c9/apple-macbook-air-m3-2024-14.jpg?auto=webp&fit=crop&height=1200&width=1200', '2024-11-14 20:17:48', '2024-11-14 20:17:48'),
(70, 'illo', '131.00', 'https://www.cnet.com/a/img/resize/483f6629791616f58f3a205df4d52e40b8cba429/hub/2024/03/06/725a8e72-aa72-439a-9357-af161b30f3c9/apple-macbook-air-m3-2024-14.jpg?auto=webp&fit=crop&height=1200&width=1200', '2024-11-14 20:17:48', '2024-11-14 20:17:48'),
(71, 'et', '369.00', 'https://www.cnet.com/a/img/resize/483f6629791616f58f3a205df4d52e40b8cba429/hub/2024/03/06/725a8e72-aa72-439a-9357-af161b30f3c9/apple-macbook-air-m3-2024-14.jpg?auto=webp&fit=crop&height=1200&width=1200', '2024-11-14 20:17:48', '2024-11-14 20:17:48'),
(72, 'laudantium', '369.00', 'https://www.cnet.com/a/img/resize/483f6629791616f58f3a205df4d52e40b8cba429/hub/2024/03/06/725a8e72-aa72-439a-9357-af161b30f3c9/apple-macbook-air-m3-2024-14.jpg?auto=webp&fit=crop&height=1200&width=1200', '2024-11-14 20:17:48', '2024-11-14 20:17:48'),
(73, 'consequatur', '486.00', 'https://www.cnet.com/a/img/resize/483f6629791616f58f3a205df4d52e40b8cba429/hub/2024/03/06/725a8e72-aa72-439a-9357-af161b30f3c9/apple-macbook-air-m3-2024-14.jpg?auto=webp&fit=crop&height=1200&width=1200', '2024-11-14 20:17:48', '2024-11-14 20:17:48'),
(74, 'voluptatem', '224.00', 'https://www.cnet.com/a/img/resize/483f6629791616f58f3a205df4d52e40b8cba429/hub/2024/03/06/725a8e72-aa72-439a-9357-af161b30f3c9/apple-macbook-air-m3-2024-14.jpg?auto=webp&fit=crop&height=1200&width=1200', '2024-11-14 20:17:48', '2024-11-14 20:17:48'),
(75, 'saepe', '259.00', 'https://www.cnet.com/a/img/resize/483f6629791616f58f3a205df4d52e40b8cba429/hub/2024/03/06/725a8e72-aa72-439a-9357-af161b30f3c9/apple-macbook-air-m3-2024-14.jpg?auto=webp&fit=crop&height=1200&width=1200', '2024-11-14 20:17:48', '2024-11-14 20:17:48'),
(76, 'voluptatibus', '280.00', 'https://www.cnet.com/a/img/resize/483f6629791616f58f3a205df4d52e40b8cba429/hub/2024/03/06/725a8e72-aa72-439a-9357-af161b30f3c9/apple-macbook-air-m3-2024-14.jpg?auto=webp&fit=crop&height=1200&width=1200', '2024-11-14 20:17:48', '2024-11-14 20:17:48'),
(77, 'et', '202.00', 'https://www.cnet.com/a/img/resize/483f6629791616f58f3a205df4d52e40b8cba429/hub/2024/03/06/725a8e72-aa72-439a-9357-af161b30f3c9/apple-macbook-air-m3-2024-14.jpg?auto=webp&fit=crop&height=1200&width=1200', '2024-11-14 20:17:48', '2024-11-14 20:17:48'),
(78, 'consequatur', '370.00', 'https://www.cnet.com/a/img/resize/483f6629791616f58f3a205df4d52e40b8cba429/hub/2024/03/06/725a8e72-aa72-439a-9357-af161b30f3c9/apple-macbook-air-m3-2024-14.jpg?auto=webp&fit=crop&height=1200&width=1200', '2024-11-14 20:17:48', '2024-11-14 20:17:48'),
(79, 'eos', '204.00', 'https://www.cnet.com/a/img/resize/483f6629791616f58f3a205df4d52e40b8cba429/hub/2024/03/06/725a8e72-aa72-439a-9357-af161b30f3c9/apple-macbook-air-m3-2024-14.jpg?auto=webp&fit=crop&height=1200&width=1200', '2024-11-14 20:17:48', '2024-11-14 20:17:48'),
(80, 'qui', '446.00', 'https://www.cnet.com/a/img/resize/483f6629791616f58f3a205df4d52e40b8cba429/hub/2024/03/06/725a8e72-aa72-439a-9357-af161b30f3c9/apple-macbook-air-m3-2024-14.jpg?auto=webp&fit=crop&height=1200&width=1200', '2024-11-14 20:17:48', '2024-11-14 20:17:48'),
(81, 'hic', '443.00', 'https://www.cnet.com/a/img/resize/483f6629791616f58f3a205df4d52e40b8cba429/hub/2024/03/06/725a8e72-aa72-439a-9357-af161b30f3c9/apple-macbook-air-m3-2024-14.jpg?auto=webp&fit=crop&height=1200&width=1200', '2024-11-14 20:17:48', '2024-11-14 20:17:48'),
(82, 'fugit', '188.00', 'https://www.cnet.com/a/img/resize/483f6629791616f58f3a205df4d52e40b8cba429/hub/2024/03/06/725a8e72-aa72-439a-9357-af161b30f3c9/apple-macbook-air-m3-2024-14.jpg?auto=webp&fit=crop&height=1200&width=1200', '2024-11-14 20:17:48', '2024-11-14 20:17:48'),
(83, 'quia', '187.00', 'https://www.cnet.com/a/img/resize/483f6629791616f58f3a205df4d52e40b8cba429/hub/2024/03/06/725a8e72-aa72-439a-9357-af161b30f3c9/apple-macbook-air-m3-2024-14.jpg?auto=webp&fit=crop&height=1200&width=1200', '2024-11-14 20:17:48', '2024-11-14 20:17:48'),
(84, 'quos', '185.00', 'https://www.cnet.com/a/img/resize/483f6629791616f58f3a205df4d52e40b8cba429/hub/2024/03/06/725a8e72-aa72-439a-9357-af161b30f3c9/apple-macbook-air-m3-2024-14.jpg?auto=webp&fit=crop&height=1200&width=1200', '2024-11-14 20:17:48', '2024-11-14 20:17:48'),
(85, 'quos', '370.00', 'https://www.cnet.com/a/img/resize/483f6629791616f58f3a205df4d52e40b8cba429/hub/2024/03/06/725a8e72-aa72-439a-9357-af161b30f3c9/apple-macbook-air-m3-2024-14.jpg?auto=webp&fit=crop&height=1200&width=1200', '2024-11-14 20:17:48', '2024-11-14 20:17:48'),
(86, 'ex', '110.00', 'https://www.cnet.com/a/img/resize/483f6629791616f58f3a205df4d52e40b8cba429/hub/2024/03/06/725a8e72-aa72-439a-9357-af161b30f3c9/apple-macbook-air-m3-2024-14.jpg?auto=webp&fit=crop&height=1200&width=1200', '2024-11-14 20:17:48', '2024-11-14 20:17:48'),
(87, 'minus', '473.00', 'https://www.cnet.com/a/img/resize/483f6629791616f58f3a205df4d52e40b8cba429/hub/2024/03/06/725a8e72-aa72-439a-9357-af161b30f3c9/apple-macbook-air-m3-2024-14.jpg?auto=webp&fit=crop&height=1200&width=1200', '2024-11-14 20:17:48', '2024-11-14 20:17:48'),
(88, 'voluptatem', '368.00', 'https://www.cnet.com/a/img/resize/483f6629791616f58f3a205df4d52e40b8cba429/hub/2024/03/06/725a8e72-aa72-439a-9357-af161b30f3c9/apple-macbook-air-m3-2024-14.jpg?auto=webp&fit=crop&height=1200&width=1200', '2024-11-14 20:17:48', '2024-11-14 20:17:48'),
(89, 'dolorum', '293.00', 'https://www.cnet.com/a/img/resize/483f6629791616f58f3a205df4d52e40b8cba429/hub/2024/03/06/725a8e72-aa72-439a-9357-af161b30f3c9/apple-macbook-air-m3-2024-14.jpg?auto=webp&fit=crop&height=1200&width=1200', '2024-11-14 20:17:48', '2024-11-14 20:17:48'),
(90, 'amet', '486.00', 'https://www.cnet.com/a/img/resize/483f6629791616f58f3a205df4d52e40b8cba429/hub/2024/03/06/725a8e72-aa72-439a-9357-af161b30f3c9/apple-macbook-air-m3-2024-14.jpg?auto=webp&fit=crop&height=1200&width=1200', '2024-11-14 20:17:48', '2024-11-14 20:17:48'),
(91, 'molestias', '91.00', 'https://www.cnet.com/a/img/resize/483f6629791616f58f3a205df4d52e40b8cba429/hub/2024/03/06/725a8e72-aa72-439a-9357-af161b30f3c9/apple-macbook-air-m3-2024-14.jpg?auto=webp&fit=crop&height=1200&width=1200', '2024-11-14 20:17:48', '2024-11-14 20:17:48'),
(92, 'dolorum', '279.00', 'https://www.cnet.com/a/img/resize/483f6629791616f58f3a205df4d52e40b8cba429/hub/2024/03/06/725a8e72-aa72-439a-9357-af161b30f3c9/apple-macbook-air-m3-2024-14.jpg?auto=webp&fit=crop&height=1200&width=1200', '2024-11-14 20:17:48', '2024-11-14 20:17:48'),
(93, 'nostrum', '322.00', 'https://www.cnet.com/a/img/resize/483f6629791616f58f3a205df4d52e40b8cba429/hub/2024/03/06/725a8e72-aa72-439a-9357-af161b30f3c9/apple-macbook-air-m3-2024-14.jpg?auto=webp&fit=crop&height=1200&width=1200', '2024-11-14 20:17:48', '2024-11-14 20:17:48'),
(94, 'nam', '42.00', 'https://www.cnet.com/a/img/resize/483f6629791616f58f3a205df4d52e40b8cba429/hub/2024/03/06/725a8e72-aa72-439a-9357-af161b30f3c9/apple-macbook-air-m3-2024-14.jpg?auto=webp&fit=crop&height=1200&width=1200', '2024-11-14 20:17:48', '2024-11-14 20:17:48'),
(95, 'placeat', '430.00', 'https://www.cnet.com/a/img/resize/483f6629791616f58f3a205df4d52e40b8cba429/hub/2024/03/06/725a8e72-aa72-439a-9357-af161b30f3c9/apple-macbook-air-m3-2024-14.jpg?auto=webp&fit=crop&height=1200&width=1200', '2024-11-14 20:17:48', '2024-11-14 20:17:48'),
(96, 'et', '19.00', 'https://www.cnet.com/a/img/resize/483f6629791616f58f3a205df4d52e40b8cba429/hub/2024/03/06/725a8e72-aa72-439a-9357-af161b30f3c9/apple-macbook-air-m3-2024-14.jpg?auto=webp&fit=crop&height=1200&width=1200', '2024-11-14 20:17:48', '2024-11-14 20:17:48'),
(97, 'beatae', '300.00', 'https://www.cnet.com/a/img/resize/483f6629791616f58f3a205df4d52e40b8cba429/hub/2024/03/06/725a8e72-aa72-439a-9357-af161b30f3c9/apple-macbook-air-m3-2024-14.jpg?auto=webp&fit=crop&height=1200&width=1200', '2024-11-14 20:17:48', '2024-11-14 20:17:48'),
(98, 'et', '358.00', 'https://www.cnet.com/a/img/resize/483f6629791616f58f3a205df4d52e40b8cba429/hub/2024/03/06/725a8e72-aa72-439a-9357-af161b30f3c9/apple-macbook-air-m3-2024-14.jpg?auto=webp&fit=crop&height=1200&width=1200', '2024-11-14 20:17:48', '2024-11-14 20:17:48'),
(99, 'suscipit', '478.00', 'https://www.cnet.com/a/img/resize/483f6629791616f58f3a205df4d52e40b8cba429/hub/2024/03/06/725a8e72-aa72-439a-9357-af161b30f3c9/apple-macbook-air-m3-2024-14.jpg?auto=webp&fit=crop&height=1200&width=1200', '2024-11-14 20:17:48', '2024-11-14 20:17:48'),
(100, 'nobis', '291.00', 'https://www.cnet.com/a/img/resize/483f6629791616f58f3a205df4d52e40b8cba429/hub/2024/03/06/725a8e72-aa72-439a-9357-af161b30f3c9/apple-macbook-air-m3-2024-14.jpg?auto=webp&fit=crop&height=1200&width=1200', '2024-11-14 20:17:48', '2024-11-14 20:17:48'),
(101, 'quaerat', '331.00', 'https://www.cnet.com/a/img/resize/483f6629791616f58f3a205df4d52e40b8cba429/hub/2024/03/06/725a8e72-aa72-439a-9357-af161b30f3c9/apple-macbook-air-m3-2024-14.jpg?auto=webp&fit=crop&height=1200&width=1200', '2024-11-14 20:17:48', '2024-11-14 20:17:48'),
(102, 'ipsum', '131.00', 'https://www.cnet.com/a/img/resize/483f6629791616f58f3a205df4d52e40b8cba429/hub/2024/03/06/725a8e72-aa72-439a-9357-af161b30f3c9/apple-macbook-air-m3-2024-14.jpg?auto=webp&fit=crop&height=1200&width=1200', '2024-11-14 20:17:48', '2024-11-14 20:17:48'),
(103, 'facilis', '204.00', 'https://www.cnet.com/a/img/resize/483f6629791616f58f3a205df4d52e40b8cba429/hub/2024/03/06/725a8e72-aa72-439a-9357-af161b30f3c9/apple-macbook-air-m3-2024-14.jpg?auto=webp&fit=crop&height=1200&width=1200', '2024-11-14 20:17:48', '2024-11-14 20:17:48'),
(104, 'sapiente', '97.00', 'https://www.cnet.com/a/img/resize/483f6629791616f58f3a205df4d52e40b8cba429/hub/2024/03/06/725a8e72-aa72-439a-9357-af161b30f3c9/apple-macbook-air-m3-2024-14.jpg?auto=webp&fit=crop&height=1200&width=1200', '2024-11-14 20:17:48', '2024-11-14 20:17:48'),
(105, 'dolor', '193.00', 'https://www.cnet.com/a/img/resize/483f6629791616f58f3a205df4d52e40b8cba429/hub/2024/03/06/725a8e72-aa72-439a-9357-af161b30f3c9/apple-macbook-air-m3-2024-14.jpg?auto=webp&fit=crop&height=1200&width=1200', '2024-11-14 20:17:48', '2024-11-14 20:17:48'),
(106, 'maiores', '494.00', 'https://www.cnet.com/a/img/resize/483f6629791616f58f3a205df4d52e40b8cba429/hub/2024/03/06/725a8e72-aa72-439a-9357-af161b30f3c9/apple-macbook-air-m3-2024-14.jpg?auto=webp&fit=crop&height=1200&width=1200', '2024-11-14 20:17:48', '2024-11-14 20:17:48'),
(107, 'odit', '185.00', 'https://www.cnet.com/a/img/resize/483f6629791616f58f3a205df4d52e40b8cba429/hub/2024/03/06/725a8e72-aa72-439a-9357-af161b30f3c9/apple-macbook-air-m3-2024-14.jpg?auto=webp&fit=crop&height=1200&width=1200', '2024-11-14 20:17:48', '2024-11-14 20:17:48'),
(108, 'et', '43.00', 'https://www.cnet.com/a/img/resize/483f6629791616f58f3a205df4d52e40b8cba429/hub/2024/03/06/725a8e72-aa72-439a-9357-af161b30f3c9/apple-macbook-air-m3-2024-14.jpg?auto=webp&fit=crop&height=1200&width=1200', '2024-11-14 20:17:48', '2024-11-14 20:17:48'),
(109, 'voluptates', '366.00', 'https://www.cnet.com/a/img/resize/483f6629791616f58f3a205df4d52e40b8cba429/hub/2024/03/06/725a8e72-aa72-439a-9357-af161b30f3c9/apple-macbook-air-m3-2024-14.jpg?auto=webp&fit=crop&height=1200&width=1200', '2024-11-14 20:17:48', '2024-11-14 20:17:48'),
(110, 'et', '144.00', 'https://www.cnet.com/a/img/resize/483f6629791616f58f3a205df4d52e40b8cba429/hub/2024/03/06/725a8e72-aa72-439a-9357-af161b30f3c9/apple-macbook-air-m3-2024-14.jpg?auto=webp&fit=crop&height=1200&width=1200', '2024-11-14 20:17:48', '2024-11-14 20:17:48'),
(111, 'corrupti', '333.00', 'https://www.cnet.com/a/img/resize/483f6629791616f58f3a205df4d52e40b8cba429/hub/2024/03/06/725a8e72-aa72-439a-9357-af161b30f3c9/apple-macbook-air-m3-2024-14.jpg?auto=webp&fit=crop&height=1200&width=1200', '2024-11-14 20:17:48', '2024-11-14 20:17:48');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('qW0aDp8gydQvg3qhZSUiI1AJizrkw9w8zeu00BD6', 1, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:132.0) Gecko/20100101 Firefox/132.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSlZoemFHdTRFTUUzcmpodDhPWVZxZk9OZEk5Qm9ZNUdha1U3Slk5OSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHM/cGFnZT0xJnNlYXJjaD0iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1731691676);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_en` varchar(255) NOT NULL,
  `name_ar` varchar(255) NOT NULL,
  `dob_hijri` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name_en`, `name_ar`, `dob_hijri`, `mobile`, `password`, `created_at`, `updated_at`) VALUES
(1, 'Amgad', 'Amgad ar', '11-12-2000', '01277112438', '$2y$12$RzQ9oaxSuXxUFa3UzYUw6.7x2x2FDqDNlJhdtGbG6pZDfP.64tFV2', '2024-11-14 19:57:45', '2024-11-14 19:57:45'),
(2, 'Amgad', 'Amgad ar', '11-12-2000', '01277112435', '$2y$12$ZqB/qRUSTCrlzJsi7ZWGx.cXVH8CPm9G.CPQOfkT81werCozblGh2', '2024-11-15 10:25:20', '2024-11-15 10:25:20'),
(3, 'testtttttttt', 'testtttttt ar', '2024-11-14', '011447788', '$2y$12$2zGh.jTVH8W6rdN/RtDuB.BxErwMymXg2Kp349HP6iMJ7S0SG1EXi', '2024-11-15 11:37:30', '2024-11-15 11:37:30'),
(4, 'testtttttttt', 'testtttttt ar', '2024-11-14', '0114477885', '$2y$12$wYCEkPQk636gLXL/1KxVHekm2MzDTd52LTtzcRvs3u5z6n9J1kXC.', '2024-11-15 11:39:05', '2024-11-15 11:39:05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_mobile_unique` (`mobile`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  ADD CONSTRAINT `order_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
