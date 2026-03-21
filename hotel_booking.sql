-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 21, 2026 at 09:35 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel_booking`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `room_type_id` bigint(20) UNSIGNED NOT NULL,
  `check_in` date NOT NULL,
  `check_out` date NOT NULL,
  `rooms_booked` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('long_stay','last_minute') NOT NULL,
  `value` int(11) NOT NULL,
  `min_days` int(11) DEFAULT NULL,
  `days_before_checkin` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `discounts`
--

INSERT INTO `discounts` (`id`, `type`, `value`, `min_days`, `days_before_checkin`, `created_at`, `updated_at`) VALUES
(1, 'long_stay', 10, 3, NULL, '2026-03-20 01:39:37', '2026-03-20 01:39:37'),
(2, 'last_minute', 15, NULL, 2, '2026-03-20 01:39:37', '2026-03-20 01:39:37');

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
-- Table structure for table `inventories`
--

CREATE TABLE `inventories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `room_type_id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `available_rooms` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inventories`
--

INSERT INTO `inventories` (`id`, `room_type_id`, `date`, `available_rooms`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, '2026-03-20', 5, 2000.00, '2026-03-20 01:39:37', '2026-03-20 01:39:37'),
(2, 2, '2026-03-20', 5, 3500.00, '2026-03-20 01:39:37', '2026-03-20 01:39:37'),
(3, 1, '2026-03-21', 5, 2000.00, '2026-03-20 01:39:37', '2026-03-20 01:39:37'),
(4, 2, '2026-03-21', 5, 3500.00, '2026-03-20 01:39:37', '2026-03-20 01:39:37'),
(5, 1, '2026-03-22', 5, 2000.00, '2026-03-20 01:39:37', '2026-03-20 01:39:37'),
(6, 2, '2026-03-22', 5, 3500.00, '2026-03-20 01:39:37', '2026-03-20 01:39:37'),
(7, 1, '2026-03-23', 5, 2000.00, '2026-03-20 01:39:37', '2026-03-20 01:39:37'),
(8, 2, '2026-03-23', 5, 3500.00, '2026-03-20 01:39:37', '2026-03-20 01:39:37'),
(9, 1, '2026-03-24', 5, 2000.00, '2026-03-20 01:39:37', '2026-03-20 01:39:37'),
(10, 2, '2026-03-24', 5, 3500.00, '2026-03-20 01:39:37', '2026-03-20 01:39:37'),
(11, 1, '2026-03-25', 5, 2000.00, '2026-03-20 01:39:37', '2026-03-20 01:39:37'),
(12, 2, '2026-03-25', 5, 3500.00, '2026-03-20 01:39:37', '2026-03-20 01:39:37'),
(13, 1, '2026-03-26', 5, 2000.00, '2026-03-20 01:39:37', '2026-03-20 01:39:37'),
(14, 2, '2026-03-26', 5, 3500.00, '2026-03-20 01:39:37', '2026-03-20 01:39:37'),
(15, 1, '2026-03-27', 5, 2000.00, '2026-03-20 01:39:37', '2026-03-20 01:39:37'),
(16, 2, '2026-03-27', 5, 3500.00, '2026-03-20 01:39:37', '2026-03-20 01:39:37'),
(17, 1, '2026-03-28', 5, 2000.00, '2026-03-20 01:39:37', '2026-03-20 01:39:37'),
(18, 2, '2026-03-28', 5, 3500.00, '2026-03-20 01:39:37', '2026-03-20 01:39:37'),
(19, 1, '2026-03-29', 5, 2000.00, '2026-03-20 01:39:37', '2026-03-20 01:39:37'),
(20, 2, '2026-03-29', 5, 3500.00, '2026-03-20 01:39:37', '2026-03-20 01:39:37'),
(21, 1, '2026-03-30', 5, 2000.00, '2026-03-20 01:39:37', '2026-03-20 01:39:37'),
(22, 2, '2026-03-30', 5, 3500.00, '2026-03-20 01:39:37', '2026-03-20 01:39:37'),
(23, 1, '2026-03-31', 5, 2000.00, '2026-03-20 01:39:37', '2026-03-20 01:39:37'),
(24, 2, '2026-03-31', 5, 3500.00, '2026-03-20 01:39:37', '2026-03-20 01:39:37'),
(25, 1, '2026-04-01', 5, 2000.00, '2026-03-20 01:39:37', '2026-03-20 01:39:37'),
(26, 2, '2026-04-01', 5, 3500.00, '2026-03-20 01:39:37', '2026-03-20 01:39:37'),
(27, 1, '2026-04-02', 5, 2000.00, '2026-03-20 01:39:37', '2026-03-20 01:39:37'),
(28, 2, '2026-04-02', 5, 3500.00, '2026-03-20 01:39:37', '2026-03-20 01:39:37'),
(29, 1, '2026-04-03', 5, 2000.00, '2026-03-20 01:39:37', '2026-03-20 01:39:37'),
(30, 2, '2026-04-03', 5, 3500.00, '2026-03-20 01:39:37', '2026-03-20 01:39:37'),
(31, 1, '2026-04-04', 5, 2000.00, '2026-03-20 01:39:37', '2026-03-20 01:39:37'),
(32, 2, '2026-04-04', 5, 3500.00, '2026-03-20 01:39:37', '2026-03-20 01:39:37'),
(33, 1, '2026-04-05', 5, 2000.00, '2026-03-20 01:39:37', '2026-03-20 01:39:37'),
(34, 2, '2026-04-05', 5, 3500.00, '2026-03-20 01:39:37', '2026-03-20 01:39:37'),
(35, 1, '2026-04-06', 5, 2000.00, '2026-03-20 01:39:37', '2026-03-20 01:39:37'),
(36, 2, '2026-04-06', 5, 3500.00, '2026-03-20 01:39:37', '2026-03-20 01:39:37'),
(37, 1, '2026-04-07', 5, 2000.00, '2026-03-20 01:39:37', '2026-03-20 01:39:37'),
(38, 2, '2026-04-07', 5, 3500.00, '2026-03-20 01:39:37', '2026-03-20 01:39:37'),
(39, 1, '2026-04-08', 5, 2000.00, '2026-03-20 01:39:37', '2026-03-20 01:39:37'),
(40, 2, '2026-04-08', 5, 3500.00, '2026-03-20 01:39:37', '2026-03-20 01:39:37'),
(41, 1, '2026-04-09', 5, 2000.00, '2026-03-20 01:39:37', '2026-03-20 01:39:37'),
(42, 2, '2026-04-09', 5, 3500.00, '2026-03-20 01:39:37', '2026-03-20 01:39:37'),
(43, 1, '2026-04-10', 5, 2000.00, '2026-03-20 01:39:37', '2026-03-20 01:39:37'),
(44, 2, '2026-04-10', 5, 3500.00, '2026-03-20 01:39:37', '2026-03-20 01:39:37'),
(45, 1, '2026-04-11', 5, 2000.00, '2026-03-20 01:39:37', '2026-03-20 01:39:37'),
(46, 2, '2026-04-11', 5, 3500.00, '2026-03-20 01:39:37', '2026-03-20 01:39:37'),
(47, 1, '2026-04-12', 5, 2000.00, '2026-03-20 01:39:37', '2026-03-20 01:39:37'),
(48, 2, '2026-04-12', 5, 3500.00, '2026-03-20 01:39:37', '2026-03-20 01:39:37'),
(49, 1, '2026-04-13', 5, 2000.00, '2026-03-20 01:39:37', '2026-03-20 01:39:37'),
(50, 2, '2026-04-13', 5, 3500.00, '2026-03-20 01:39:37', '2026-03-20 01:39:37'),
(51, 1, '2026-04-14', 5, 2000.00, '2026-03-20 01:39:37', '2026-03-20 01:39:37'),
(52, 2, '2026-04-14', 5, 3500.00, '2026-03-20 01:39:37', '2026-03-20 01:39:37'),
(53, 1, '2026-04-15', 5, 2000.00, '2026-03-20 01:39:37', '2026-03-20 01:39:37'),
(54, 2, '2026-04-15', 5, 3500.00, '2026-03-20 01:39:37', '2026-03-20 01:39:37'),
(55, 1, '2026-04-16', 5, 2000.00, '2026-03-20 01:39:37', '2026-03-20 01:39:37'),
(56, 2, '2026-04-16', 5, 3500.00, '2026-03-20 01:39:37', '2026-03-20 01:39:37'),
(57, 1, '2026-04-17', 5, 2000.00, '2026-03-20 01:39:37', '2026-03-20 01:39:37'),
(58, 2, '2026-04-17', 5, 3500.00, '2026-03-20 01:39:37', '2026-03-20 01:39:37'),
(59, 1, '2026-04-18', 5, 2000.00, '2026-03-20 01:39:37', '2026-03-20 01:39:37'),
(60, 2, '2026-04-18', 5, 3500.00, '2026-03-20 01:39:37', '2026-03-20 01:39:37');

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
(4, '2026_03_20_064744_create_room_types_table', 2),
(5, '2026_03_20_064745_create_inventories_table', 2),
(6, '2026_03_20_064746_create_bookings_table', 2),
(7, '2026_03_20_064747_create_discounts_table', 2);

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
-- Table structure for table `room_types`
--

CREATE TABLE `room_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `capacity` int(11) NOT NULL DEFAULT 3,
  `total_rooms` int(11) NOT NULL DEFAULT 5,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `room_types`
--

INSERT INTO `room_types` (`id`, `name`, `capacity`, `total_rooms`, `created_at`, `updated_at`) VALUES
(1, 'Standard', 3, 5, '2026-03-20 01:39:37', '2026-03-20 01:39:37'),
(2, 'Deluxe', 3, 5, '2026-03-20 01:39:37', '2026-03-20 01:39:37');

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
('jt5DlN8iNGD7eI7bi03wbL5EFpDQrvMpS0wzaHMa', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'eyJfdG9rZW4iOiI1VGlOd21OUTk3dzJJTHlQaHFPRDY2eWNkS1ZneVhiUlMyWTZBOXJuIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwXC9zZWFyY2g/Y2hlY2tfaW49MjAyNi0wMy0xMCZjaGVja19vdXQ9MjAyNi0wMy0xMyZndWVzdHM9MyZtZWFsX3BsYW49YnJlYWtmYXN0Iiwicm91dGUiOm51bGx9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19', 1774081567);

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
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Test User', 'test@example.com', '2026-03-20 01:39:36', '$2y$12$3Sd8nz9bMyOwz9s8QeDKy.Zb0AYK5oFNQbLoWtl3VKmTOSWg69GuO', 'BFo3GvpxDs', '2026-03-20 01:39:37', '2026-03-20 01:39:37');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookings_room_type_id_foreign` (`room_type_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `inventories`
--
ALTER TABLE `inventories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inventories_room_type_id_foreign` (`room_type_id`);

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
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `room_types`
--
ALTER TABLE `room_types`
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
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventories`
--
ALTER TABLE `inventories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

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
-- AUTO_INCREMENT for table `room_types`
--
ALTER TABLE `room_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_room_type_id_foreign` FOREIGN KEY (`room_type_id`) REFERENCES `room_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `inventories`
--
ALTER TABLE `inventories`
  ADD CONSTRAINT `inventories_room_type_id_foreign` FOREIGN KEY (`room_type_id`) REFERENCES `room_types` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
