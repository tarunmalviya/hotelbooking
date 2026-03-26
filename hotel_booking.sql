-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 26, 2026 at 11:48 AM
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
  `type` varchar(255) NOT NULL,
  `value` int(11) NOT NULL,
  `min_days` int(11) DEFAULT NULL,
  `days_before_checkin` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `rate_plan_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `discounts`
--

INSERT INTO `discounts` (`id`, `type`, `value`, `min_days`, `days_before_checkin`, `created_at`, `updated_at`, `rate_plan_id`) VALUES
(1, 'early_bird', 5, NULL, 5, '2026-03-25 07:54:05', '2026-03-25 07:54:05', 1),
(2, 'early_bird', 10, NULL, 5, '2026-03-25 07:54:05', '2026-03-25 07:54:05', 2),
(3, 'early_bird', 10, NULL, 5, '2026-03-25 07:54:05', '2026-03-25 07:54:05', 3),
(4, 'early_bird', 10, NULL, 5, '2026-03-25 07:54:05', '2026-03-25 07:54:05', 4);

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
(1, 1, '2026-03-25', 5, 2304.00, '2026-03-25 07:54:05', '2026-03-25 07:54:05'),
(2, 2, '2026-03-25', 5, 5665.00, '2026-03-25 07:54:05', '2026-03-25 07:54:05'),
(3, 1, '2026-03-26', 5, 2927.00, '2026-03-25 07:54:05', '2026-03-25 07:54:05'),
(4, 2, '2026-03-26', 5, 5934.00, '2026-03-25 07:54:05', '2026-03-25 07:54:05'),
(5, 1, '2026-03-27', 5, 2931.00, '2026-03-25 07:54:05', '2026-03-25 07:54:05'),
(6, 2, '2026-03-27', 5, 5707.00, '2026-03-25 07:54:05', '2026-03-25 07:54:05'),
(7, 1, '2026-03-28', 5, 2815.00, '2026-03-25 07:54:05', '2026-03-25 07:54:05'),
(8, 2, '2026-03-28', 5, 5193.00, '2026-03-25 07:54:05', '2026-03-25 07:54:05'),
(9, 1, '2026-03-29', 5, 2660.00, '2026-03-25 07:54:05', '2026-03-25 07:54:05'),
(10, 2, '2026-03-29', 5, 5476.00, '2026-03-25 07:54:05', '2026-03-25 07:54:05'),
(11, 1, '2026-03-30', 5, 2322.00, '2026-03-25 07:54:05', '2026-03-25 07:54:05'),
(12, 2, '2026-03-30', 5, 4085.00, '2026-03-25 07:54:05', '2026-03-25 07:54:05'),
(13, 1, '2026-03-31', 5, 2723.00, '2026-03-25 07:54:05', '2026-03-25 07:54:05'),
(14, 2, '2026-03-31', 5, 4818.00, '2026-03-25 07:54:05', '2026-03-25 07:54:05'),
(15, 1, '2026-04-01', 5, 2001.00, '2026-03-25 07:54:05', '2026-03-25 07:54:05'),
(16, 2, '2026-04-01', 5, 5031.00, '2026-03-25 07:54:05', '2026-03-25 07:54:05'),
(17, 1, '2026-04-02', 5, 2634.00, '2026-03-25 07:54:05', '2026-03-25 07:54:05'),
(18, 2, '2026-04-02', 5, 4699.00, '2026-03-25 07:54:05', '2026-03-25 07:54:05'),
(19, 1, '2026-04-03', 5, 2257.00, '2026-03-25 07:54:05', '2026-03-25 07:54:05'),
(20, 2, '2026-04-03', 5, 4137.00, '2026-03-25 07:54:05', '2026-03-25 07:54:05'),
(21, 1, '2026-04-04', 5, 2783.00, '2026-03-25 07:54:05', '2026-03-25 07:54:05'),
(22, 2, '2026-04-04', 5, 4420.00, '2026-03-25 07:54:05', '2026-03-25 07:54:05'),
(23, 1, '2026-04-05', 5, 2524.00, '2026-03-25 07:54:05', '2026-03-25 07:54:05'),
(24, 2, '2026-04-05', 5, 4881.00, '2026-03-25 07:54:05', '2026-03-25 07:54:05'),
(25, 1, '2026-04-06', 5, 2923.00, '2026-03-25 07:54:05', '2026-03-25 07:54:05'),
(26, 2, '2026-04-06', 5, 5884.00, '2026-03-25 07:54:05', '2026-03-25 07:54:05'),
(27, 1, '2026-04-07', 5, 2945.00, '2026-03-25 07:54:05', '2026-03-25 07:54:05'),
(28, 2, '2026-04-07', 5, 4544.00, '2026-03-25 07:54:05', '2026-03-25 07:54:05'),
(29, 1, '2026-04-08', 5, 2813.00, '2026-03-25 07:54:05', '2026-03-25 07:54:05'),
(30, 2, '2026-04-08', 5, 4606.00, '2026-03-25 07:54:05', '2026-03-25 07:54:05'),
(31, 1, '2026-04-09', 5, 2216.00, '2026-03-25 07:54:05', '2026-03-25 07:54:05'),
(32, 2, '2026-04-09', 5, 5291.00, '2026-03-25 07:54:05', '2026-03-25 07:54:05'),
(33, 1, '2026-04-10', 5, 2794.00, '2026-03-25 07:54:05', '2026-03-25 07:54:05'),
(34, 2, '2026-04-10', 5, 5141.00, '2026-03-25 07:54:05', '2026-03-25 07:54:05'),
(35, 1, '2026-04-11', 5, 2491.00, '2026-03-25 07:54:05', '2026-03-25 07:54:05'),
(36, 2, '2026-04-11', 5, 4005.00, '2026-03-25 07:54:05', '2026-03-25 07:54:05'),
(37, 1, '2026-04-12', 5, 2183.00, '2026-03-25 07:54:05', '2026-03-25 07:54:05'),
(38, 2, '2026-04-12', 5, 5574.00, '2026-03-25 07:54:05', '2026-03-25 07:54:05'),
(39, 1, '2026-04-13', 5, 2576.00, '2026-03-25 07:54:05', '2026-03-25 07:54:05'),
(40, 2, '2026-04-13', 5, 4149.00, '2026-03-25 07:54:05', '2026-03-25 07:54:05'),
(41, 1, '2026-04-14', 5, 2120.00, '2026-03-25 07:54:05', '2026-03-25 07:54:05'),
(42, 2, '2026-04-14', 5, 4087.00, '2026-03-25 07:54:05', '2026-03-25 07:54:05'),
(43, 1, '2026-04-15', 5, 2401.00, '2026-03-25 07:54:05', '2026-03-25 07:54:05'),
(44, 2, '2026-04-15', 5, 4911.00, '2026-03-25 07:54:05', '2026-03-25 07:54:05'),
(45, 1, '2026-04-16', 5, 2882.00, '2026-03-25 07:54:05', '2026-03-25 07:54:05'),
(46, 2, '2026-04-16', 5, 5060.00, '2026-03-25 07:54:05', '2026-03-25 07:54:05'),
(47, 1, '2026-04-17', 5, 2808.00, '2026-03-25 07:54:05', '2026-03-25 07:54:05'),
(48, 2, '2026-04-17', 5, 4418.00, '2026-03-25 07:54:05', '2026-03-25 07:54:05'),
(49, 1, '2026-04-18', 5, 2968.00, '2026-03-25 07:54:05', '2026-03-25 07:54:05'),
(50, 2, '2026-04-18', 5, 4475.00, '2026-03-25 07:54:05', '2026-03-25 07:54:05'),
(51, 1, '2026-04-19', 5, 2670.00, '2026-03-25 07:54:05', '2026-03-25 07:54:05'),
(52, 2, '2026-04-19', 5, 5614.00, '2026-03-25 07:54:05', '2026-03-25 07:54:05'),
(53, 1, '2026-04-20', 5, 2348.00, '2026-03-25 07:54:05', '2026-03-25 07:54:05'),
(54, 2, '2026-04-20', 5, 5799.00, '2026-03-25 07:54:05', '2026-03-25 07:54:05'),
(55, 1, '2026-04-21', 5, 2313.00, '2026-03-25 07:54:05', '2026-03-25 07:54:05'),
(56, 2, '2026-04-21', 5, 4999.00, '2026-03-25 07:54:05', '2026-03-25 07:54:05'),
(57, 1, '2026-04-22', 5, 2760.00, '2026-03-25 07:54:05', '2026-03-25 07:54:05'),
(58, 2, '2026-04-22', 5, 4067.00, '2026-03-25 07:54:05', '2026-03-25 07:54:05'),
(59, 1, '2026-04-23', 5, 2960.00, '2026-03-25 07:54:05', '2026-03-25 07:54:05'),
(60, 2, '2026-04-23', 5, 5895.00, '2026-03-25 07:54:05', '2026-03-25 07:54:05'),
(61, 1, '2026-04-24', 5, 2952.00, '2026-03-25 07:54:05', '2026-03-25 07:54:05'),
(62, 2, '2026-04-24', 5, 5238.00, '2026-03-25 07:54:05', '2026-03-25 07:54:05');

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
(4, '2026_03_20_064744_create_room_types_table', 1),
(5, '2026_03_20_064745_create_inventories_table', 1),
(6, '2026_03_20_064746_create_bookings_table', 1),
(7, '2026_03_20_064747_create_discounts_table', 1),
(8, '2026_03_25_130410_add_max_occupancy_to_room_types', 1),
(9, '2026_03_25_130647_create_rate_plans_table', 1),
(10, '2026_03_25_130737_update_discounts_table', 1);

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
-- Table structure for table `rate_plans`
--

CREATE TABLE `rate_plans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `room_type_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `meal_plan` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rate_plans`
--

INSERT INTO `rate_plans` (`id`, `room_type_id`, `name`, `meal_plan`, `created_at`, `updated_at`) VALUES
(1, 1, 'EP', 'room_only', NULL, NULL),
(2, 1, 'CP', 'breakfast', NULL, NULL),
(3, 2, 'CP', 'breakfast', NULL, NULL),
(4, 2, 'MAP', 'all_meals', NULL, NULL);

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
  `updated_at` timestamp NULL DEFAULT NULL,
  `max_occupancy` int(11) NOT NULL DEFAULT 3
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `room_types`
--

INSERT INTO `room_types` (`id`, `name`, `capacity`, `total_rooms`, `created_at`, `updated_at`, `max_occupancy`) VALUES
(1, 'Standard', 3, 5, '2026-03-25 07:54:05', '2026-03-25 07:54:05', 3),
(2, 'Deluxe', 3, 5, '2026-03-25 07:54:05', '2026-03-25 07:54:05', 4);

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
('hEsP9VOnTSHCkxEQb6bEOdni8sSocQAZRmPz8jSL', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'eyJfdG9rZW4iOiIxWFZTNE5BQ2NiRXRwZ1hyT1VuN0JGRjlTZVNKa2JKQ2lPQkY2YnFmIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwXC9zZWFyY2g/Y2hlY2tfaW49MjAyNi0wNC0wMSZjaGVja19vdXQ9MjAyNi0wNC0xMCZndWVzdHM9MSIsInJvdXRlIjpudWxsfSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==', 1774521662);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `discounts_rate_plan_id_foreign` (`rate_plan_id`);

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
-- Indexes for table `rate_plans`
--
ALTER TABLE `rate_plans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rate_plans_room_type_id_foreign` (`room_type_id`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventories`
--
ALTER TABLE `inventories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `rate_plans`
--
ALTER TABLE `rate_plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `room_types`
--
ALTER TABLE `room_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_room_type_id_foreign` FOREIGN KEY (`room_type_id`) REFERENCES `room_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `discounts`
--
ALTER TABLE `discounts`
  ADD CONSTRAINT `discounts_rate_plan_id_foreign` FOREIGN KEY (`rate_plan_id`) REFERENCES `rate_plans` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `inventories`
--
ALTER TABLE `inventories`
  ADD CONSTRAINT `inventories_room_type_id_foreign` FOREIGN KEY (`room_type_id`) REFERENCES `room_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `rate_plans`
--
ALTER TABLE `rate_plans`
  ADD CONSTRAINT `rate_plans_room_type_id_foreign` FOREIGN KEY (`room_type_id`) REFERENCES `room_types` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
