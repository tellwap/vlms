-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 16, 2022 at 10:32 AM
-- Server version: 8.0.29-0ubuntu0.20.04.3
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vlms`
--

-- --------------------------------------------------------

--
-- Table structure for table `centers`
--

CREATE TABLE `centers` (
  `id` bigint UNSIGNED NOT NULL,
  `district_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `centers`
--

INSERT INTO `centers` (`id`, `district_id`, `name`, `location_id`, `created_at`, `updated_at`) VALUES
(1, 4, 'test', 1, '2022-06-04 07:17:16', '2022-06-04 07:17:16'),
(2, 4, 'test 2', 2, '2022-06-04 07:21:42', '2022-06-04 07:21:42'),
(3, 4, 'pp', 3, '2022-06-05 05:48:23', '2022-06-05 05:48:23'),
(4, 5, 'kimara', 6, '2022-06-12 11:05:47', '2022-06-12 11:05:47'),
(5, 5, 'Kam college', 7, '2022-06-12 11:22:44', '2022-06-12 11:22:44'),
(6, 5, 'Lugalo hospital', 8, '2022-06-12 11:25:36', '2022-06-12 11:25:36'),
(7, 5, 'tz', 9, '2022-06-12 12:49:16', '2022-06-12 12:49:16'),
(8, 5, 'test', 10, '2022-06-15 08:06:32', '2022-06-15 08:06:32'),
(9, 4, 'Kinondoni area', 11, '2022-06-15 08:15:06', '2022-06-15 08:15:06'),
(10, 6, 'Ilala plac', 12, '2022-06-15 08:17:18', '2022-06-15 08:17:18');

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE `districts` (
  `id` bigint UNSIGNED NOT NULL,
  `region_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`id`, `region_id`, `name`, `code`, `created_at`, `updated_at`) VALUES
(4, 1, 'Kinondoni', 'T8574', '2022-06-01 10:12:06', '2022-06-01 10:12:06'),
(5, 1, 'Kijitonyama', 'T3494', '2022-06-01 10:12:23', '2022-06-01 10:12:23'),
(6, 1, 'Ilala', '594', '2022-06-15 08:16:50', '2022-06-15 08:16:50');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` bigint UNSIGNED NOT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `latitude`, `longitude`, `created_at`, `updated_at`) VALUES
(1, '-6.7931429', '39.1672097', '2022-06-04 07:15:45', '2022-06-04 07:15:45'),
(2, '-6.7931429', '39.1672097', '2022-06-04 07:16:40', '2022-06-04 07:16:40'),
(3, '-6.7931429', '39.1672097', '2022-06-04 07:17:15', '2022-06-04 07:17:15'),
(6, '-6.7931429', '39.1672097', '2022-06-12 11:05:47', '2022-06-12 11:05:47'),
(7, '-6.7827816625822', '39.176709651947', '2022-06-12 11:22:44', '2022-06-12 11:22:44'),
(8, '-6.7452690329811', '39.220763929188', '2022-06-12 11:25:36', '2022-06-12 11:25:36'),
(9, '-6.1929868712167', '39.160156734288', '2022-06-12 12:49:16', '2022-06-12 12:49:16'),
(10, '-6.8046533', '39.22555', '2022-06-15 08:06:32', '2022-06-15 08:06:32'),
(11, '-6.8046533', '39.22555', '2022-06-15 08:15:06', '2022-06-15 08:15:06'),
(12, '-6.8046533', '39.22555', '2022-06-15 08:17:18', '2022-06-15 08:17:18');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_05_31_080225_create_regions_table', 1),
(8, '2022_05_31_080243_create_districts_table', 3),
(10, '2022_06_04_100346_create_locations_table', 4),
(11, '2022_05_31_084854_create_centers_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'myapptoken', '10dfe9776efb5cfaf78191f4cee066f74591c6948ce4b6beb3d54b4577001d7d', '[\"*\"]', NULL, '2022-05-31 07:58:12', '2022-05-31 07:58:12'),
(2, 'App\\Models\\User', 1, 'myapptoken', '4cfb6b4fc65a618d7a6e584dadbe751f155d5c6dfd733aa4478cc971dd1b9202', '[\"*\"]', NULL, '2022-05-31 08:12:48', '2022-05-31 08:12:48'),
(3, 'App\\Models\\User', 1, 'myapptoken', '95b4425181331cbb16ab791cf2979d983f520ba82ea9fed82393c57e37d7d52f', '[\"*\"]', NULL, '2022-05-31 10:06:40', '2022-05-31 10:06:40'),
(4, 'App\\Models\\User', 1, 'myapptoken', '96403dc607dd62c6cbdaae2b412565c5af278553574827ea6f20168545a98b3b', '[\"*\"]', NULL, '2022-05-31 10:26:58', '2022-05-31 10:26:58'),
(5, 'App\\Models\\User', 1, 'myapptoken', '947f56151f3458fd934a95f9e92759f7babbd5ea99836a4d547ecc4a15f027c9', '[\"*\"]', NULL, '2022-05-31 10:27:18', '2022-05-31 10:27:18'),
(6, 'App\\Models\\User', 1, 'myapptoken', '201e156d4e8fc9aad2b673d26d83b6955a7b38b543a377b5bfe09ee2359e9e75', '[\"*\"]', NULL, '2022-05-31 10:28:00', '2022-05-31 10:28:00'),
(7, 'App\\Models\\User', 1, 'myapptoken', '399ccc7e9ceff3f6078b599c8050dc46769b3beeaa445d5878091bda9298cd83', '[\"*\"]', NULL, '2022-05-31 10:29:48', '2022-05-31 10:29:48'),
(8, 'App\\Models\\User', 1, 'myapptoken', '55fdadcc54ff96dd814678b313a1f52bc035e304158acc5ab7e10a5ba7ef6cde', '[\"*\"]', NULL, '2022-05-31 10:30:19', '2022-05-31 10:30:19'),
(9, 'App\\Models\\User', 1, 'myapptoken', '5ebc6e126b2a91831cbb243432bd6c1cb752ad175dad12491329d9bad45b36db', '[\"*\"]', NULL, '2022-05-31 10:30:21', '2022-05-31 10:30:21'),
(10, 'App\\Models\\User', 1, 'myapptoken', 'e98ffe25b578d1c210aa2a823741baac6900b5551b53f0165b862cd07ec9b4b5', '[\"*\"]', NULL, '2022-05-31 10:30:39', '2022-05-31 10:30:39'),
(11, 'App\\Models\\User', 1, 'myapptoken', '07c541c705cc002912f8544fd992adefa57b7a2ed13e86649b7548d00297b729', '[\"*\"]', NULL, '2022-05-31 10:30:57', '2022-05-31 10:30:57'),
(12, 'App\\Models\\User', 1, 'myapptoken', 'dc63182db1c48cac36398c99bce721ae7c1afa264b7d4232eb963de30b6a9b73', '[\"*\"]', NULL, '2022-05-31 10:31:56', '2022-05-31 10:31:56'),
(13, 'App\\Models\\User', 1, 'myapptoken', '647c804fcbe27f5d25396785f7d191e544dce397bb8b6449185bf188d58853b7', '[\"*\"]', NULL, '2022-05-31 11:06:16', '2022-05-31 11:06:16'),
(14, 'App\\Models\\User', 1, 'myapptoken', '5592fc29bcd5e1a083f1b919ec1f8a55e621a578a7a6b2ab38a971fc97122d7b', '[\"*\"]', NULL, '2022-05-31 11:06:23', '2022-05-31 11:06:23'),
(15, 'App\\Models\\User', 1, 'myapptoken', '6e3fa36e17baa3cb9ba4b568691bce65a5c89ec7710f256cf75b10f486494f22', '[\"*\"]', NULL, '2022-05-31 11:06:38', '2022-05-31 11:06:38'),
(16, 'App\\Models\\User', 1, 'myapptoken', 'd1fe4b14efdf567bf76986292cac26655b4e38f3f2ff61f6fe82373f6430b67e', '[\"*\"]', NULL, '2022-05-31 11:06:42', '2022-05-31 11:06:42'),
(17, 'App\\Models\\User', 1, 'myapptoken', '7a77e242ae3eddc05a712b806fc930355906b12a6a490052e4f7ec6e42207ead', '[\"*\"]', NULL, '2022-05-31 11:06:43', '2022-05-31 11:06:43'),
(18, 'App\\Models\\User', 1, 'myapptoken', 'abe6b942b7dd5c2d555ade72b566b1c0c708cfea63dc83a54a0e60626ce6be58', '[\"*\"]', NULL, '2022-05-31 11:06:44', '2022-05-31 11:06:44'),
(19, 'App\\Models\\User', 1, 'myapptoken', '6a94dab3a8647c0d3eb85523b5ce2527b02c5aa0eb7b52de456c321106b13eea', '[\"*\"]', NULL, '2022-05-31 11:11:47', '2022-05-31 11:11:47'),
(20, 'App\\Models\\User', 1, 'myapptoken', '85cb359e2c5f4770c82ddfce212a67453333efd3211611e7b389d6a66c5a9d1a', '[\"*\"]', NULL, '2022-05-31 12:01:47', '2022-05-31 12:01:47'),
(21, 'App\\Models\\User', 1, 'myapptoken', 'e796b91bfbd666c9eb19bc0574f285c5d91a33fadd14181f2ba1d21be88c80be', '[\"*\"]', NULL, '2022-05-31 12:06:49', '2022-05-31 12:06:49'),
(22, 'App\\Models\\User', 1, 'myapptoken', 'b10fe922bb14972294a3fcbf9ac2e0af9b11bb20a5496763b0f232fb5ccd2da8', '[\"*\"]', NULL, '2022-05-31 12:09:48', '2022-05-31 12:09:48'),
(23, 'App\\Models\\User', 1, 'myapptoken', 'b675f6de4875006a8fb4149eeaf358993702855f978bf877b196b162bc14193e', '[\"*\"]', NULL, '2022-05-31 15:04:52', '2022-05-31 15:04:52'),
(24, 'App\\Models\\User', 1, 'myapptoken', '3c23f6101584c1d2268e9e478061945701891f6814149d41130f31ec4f7525eb', '[\"*\"]', NULL, '2022-05-31 15:10:44', '2022-05-31 15:10:44'),
(25, 'App\\Models\\User', 1, 'myapptoken', 'cd760955c39a13daf4b7d6afb60c91bd544c87a923a1323c7274a2a7848daee2', '[\"*\"]', NULL, '2022-06-01 07:55:08', '2022-06-01 07:55:08'),
(26, 'App\\Models\\User', 1, 'myapptoken', 'aa861ab602af1cf24b4c260676e0debf23b3bfdd09acf11da7675a4c1754ff5a', '[\"*\"]', NULL, '2022-06-01 08:03:35', '2022-06-01 08:03:35'),
(27, 'App\\Models\\User', 1, 'myapptoken', '33ed4b7422620df0c7bbacae450ea36363c26da690b79d81da6d934ce5d1c3af', '[\"*\"]', NULL, '2022-06-01 08:26:49', '2022-06-01 08:26:49'),
(28, 'App\\Models\\User', 1, 'myapptoken', 'b719f6316f57919dc98e1f1ca18be5da4f26bd4399d12999c3ffd0fb577a661d', '[\"*\"]', NULL, '2022-06-01 09:33:03', '2022-06-01 09:33:03'),
(29, 'App\\Models\\User', 1, 'myapptoken', 'ee2b05f0faf9ccf813eb61af441373f1b88b6bfaed2e25abd72587365e84964d', '[\"*\"]', NULL, '2022-06-01 10:05:27', '2022-06-01 10:05:27'),
(30, 'App\\Models\\User', 1, 'myapptoken', 'e20293410358698dfd2c6683ced1e987d55bba77ea1ac7a46ee49992be890395', '[\"*\"]', NULL, '2022-06-01 10:10:57', '2022-06-01 10:10:57'),
(31, 'App\\Models\\User', 1, 'myapptoken', 'ca6cd4dda8f18050dd450382b3ed18f607b0e24d6a9e79f7d49f2b917df8dc10', '[\"*\"]', NULL, '2022-06-01 10:19:33', '2022-06-01 10:19:33'),
(32, 'App\\Models\\User', 1, 'myapptoken', 'c67d9501f1caf698dc33976ad93f51a8082e0bcb6a64a20645bf9d8ab9429c5f', '[\"*\"]', NULL, '2022-06-05 05:48:12', '2022-06-05 05:48:12'),
(33, 'App\\Models\\User', 1, 'myapptoken', '6146908bad866312442df300ce036bb566235dc37caec6e1e6f85f3c9b478840', '[\"*\"]', NULL, '2022-06-12 11:05:10', '2022-06-12 11:05:10'),
(34, 'App\\Models\\User', 1, 'myapptoken', '659b342c28af4f0021d9c773e0f67c69498766f684d7d07e8e1e6f6ead18cf10', '[\"*\"]', NULL, '2022-06-12 11:19:00', '2022-06-12 11:19:00'),
(35, 'App\\Models\\User', 1, 'myapptoken', '4950c693d745b85beaa70eec8552b9bce1d7b072e89d91b6048decd7da93c54d', '[\"*\"]', NULL, '2022-06-12 11:29:55', '2022-06-12 11:29:55'),
(36, 'App\\Models\\User', 1, 'myapptoken', 'a18a08bb6aaeaba5afead31835157cffd816a3a408034b5d2d39143d0c2f0fa9', '[\"*\"]', NULL, '2022-06-12 12:39:47', '2022-06-12 12:39:47'),
(37, 'App\\Models\\User', 1, 'myapptoken', '5dd0b6fb181a933bfb07bd4fd5dfd3a2f8ce19d177633f1b3004c337268101cb', '[\"*\"]', NULL, '2022-06-12 12:47:38', '2022-06-12 12:47:38'),
(38, 'App\\Models\\User', 1, 'myapptoken', 'fb41176e4311a38f88006edacbbef37ffbe0092e0d51582616fad442409bd6c1', '[\"*\"]', NULL, '2022-06-13 07:35:17', '2022-06-13 07:35:17'),
(39, 'App\\Models\\User', 1, 'myapptoken', 'fec6eaf7c1174a5e99af5969d80c7d773f750729048875f2590673cb1c654e9d', '[\"*\"]', NULL, '2022-06-13 07:49:44', '2022-06-13 07:49:44'),
(40, 'App\\Models\\User', 1, 'myapptoken', 'f6eacf5a11ae18da1ec5259403ae87cf58ac0eec2994e873d3ad4333e17b49c0', '[\"*\"]', NULL, '2022-06-13 08:56:38', '2022-06-13 08:56:38'),
(41, 'App\\Models\\User', 1, 'myapptoken', 'adad5517c1021e51d4dcaa2e4da25bfe0408d3d5d97e89cf198565213609ce52', '[\"*\"]', NULL, '2022-06-15 07:03:03', '2022-06-15 07:03:03'),
(42, 'App\\Models\\User', 1, 'myapptoken', 'beba3acdafb1ad7b1f294bab23e730ffc1456c9a57f884e6bec2de10ed71a82e', '[\"*\"]', NULL, '2022-06-15 07:14:31', '2022-06-15 07:14:31'),
(43, 'App\\Models\\User', 1, 'myapptoken', '15a8fa14a758fd4b5f277779557f54f5359d1f2f24f34ec0981d6fa2b4d86fbf', '[\"*\"]', NULL, '2022-06-15 07:20:53', '2022-06-15 07:20:53'),
(44, 'App\\Models\\User', 1, 'myapptoken', 'f4f90f0e59e002a0f5146e06e55ca0e2fe51a44773e3e30a69821f4f2acbe8a2', '[\"*\"]', NULL, '2022-06-15 08:00:52', '2022-06-15 08:00:52'),
(45, 'App\\Models\\User', 1, 'myapptoken', 'c835692d9a500786bdbccdf719fe7ad1887935a8776bc3f9cca39e85c93dd3b6', '[\"*\"]', NULL, '2022-06-15 08:12:18', '2022-06-15 08:12:18'),
(46, 'App\\Models\\User', 1, 'myapptoken', '6f51026abc911c9d9a0eb5fe8f5ce273df178f9aa42fc3eafd0877ff03cff032', '[\"*\"]', NULL, '2022-06-15 08:13:54', '2022-06-15 08:13:54'),
(47, 'App\\Models\\User', 1, 'myapptoken', '1472dbd7e1de083c3481258bfc7a5f335edf6468c40e6e0d96196fed49e75e4e', '[\"*\"]', NULL, '2022-06-15 08:17:43', '2022-06-15 08:17:43');

-- --------------------------------------------------------

--
-- Table structure for table `regions`
--

CREATE TABLE `regions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `regions`
--

INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Dar es salaam', '2022-05-31 05:39:23', '2022-05-31 05:39:23'),
(2, 'Kilimanjaro', '2022-05-31 05:39:33', '2022-05-31 05:39:33');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Chami', 'chami@epimac.tech', NULL, '$2y$10$P22NR/hZD7v2g1JdqblS9OYeE3YLMvX4o0eVeLcMTqQ7FMilAAA2y', NULL, '2022-05-31 07:58:12', '2022-05-31 07:58:12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `centers`
--
ALTER TABLE `centers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `regions`
--
ALTER TABLE `regions`
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
-- AUTO_INCREMENT for table `centers`
--
ALTER TABLE `centers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `districts`
--
ALTER TABLE `districts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `regions`
--
ALTER TABLE `regions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
