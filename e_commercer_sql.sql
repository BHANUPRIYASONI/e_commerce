-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 27, 2024 at 02:04 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bhanupriya_test`
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
(5, '2014_10_12_000000_create_users_table', 1),
(6, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(7, '2019_08_19_000000_create_failed_jobs_table', 1),
(8, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(9, '2024_06_24_181447_add_user_details_to_users_table', 2),
(10, '2024_06_24_190508_create_products_table', 2),
(11, '2024_06_24_190509_create_orders_table', 2),
(12, '2024_06_24_190509_create_transactions_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `total_price` decimal(8,2) NOT NULL,
  `status` enum('pending','completed','cancelled') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `product_id`, `quantity`, `total_price`, `status`, `created_at`, `updated_at`) VALUES
(1, 8, 1, 1, 100.00, 'completed', '2024-06-24 22:23:06', '2024-06-24 22:23:06'),
(2, 8, 3, 1, 300.00, 'completed', '2024-06-24 22:23:42', '2024-06-24 22:23:42'),
(3, 9, 2, 1, 200.00, 'completed', '2024-06-24 22:28:08', '2024-06-24 22:28:08');

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

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(8,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `stock`, `created_at`, `updated_at`) VALUES
(1, 'Product 1', 'Description for Product 1', 100.00, 10, '2024-06-24 21:55:21', '2024-06-24 21:55:21'),
(2, 'Product 2', 'Description for Product 2', 200.00, 20, '2024-06-24 21:55:21', '2024-06-24 21:55:21'),
(3, 'Product 3', 'Description for Product 3', 300.00, 30, '2024-06-24 21:55:21', '2024-06-24 21:55:21');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `order_id`, `amount`, `created_at`, `updated_at`) VALUES
(1, 8, 1, 100.00, '2024-06-24 22:23:06', '2024-06-24 22:23:06'),
(2, 8, 2, 300.00, '2024-06-24 22:23:42', '2024-06-24 22:23:42'),
(3, 9, 3, 200.00, '2024-06-24 22:28:08', '2024-06-24 22:28:08');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `address` text DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `role` enum('customer','vendor','superAdmin') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `address`, `contact`, `username`, `profile_picture`, `dob`, `role`, `created_at`, `updated_at`) VALUES
(1, 'bhanu priya soni', 'bhanupriya.mindcrew@gmail.com', '$2y$12$PrNTz1XC4f3WR00.fSroheMP3gvPjGKELxg0O3bADzd7hflBPSA2m', 'indore', '1234567897', 'admin1', 'profile_pictures/m43ySe4Ah7xHnxUwVkKgHeD0q7eQsaS6GcOa0t93.png', '2024-06-24', 'customer', '2024-06-24 12:53:33', '2024-06-24 12:53:33'),
(2, 'vendor', 'bhanupriya1.mindcrew@gmail.com', '$2y$12$xITd/KD7vOhIxWB78KG/j.VMU6nkeCa9TqLh8tNilVN0Xre90Ouke', 'indore', '1234567897', 'vendor@gmail.com', 'profile_pictures/m43ySe4Ah7xHnxUwVkKgHeD0q7eQsaS6GcOa0t93.png', '2024-06-24', 'vendor', '2024-06-24 12:59:25', '2024-06-24 12:59:25'),
(3, 'bhanu customer', 'bhanupriya21.mindcrew@gmail.com', '$2y$12$5QZAG/04S9zxI/BjNMlL7eJjSyjaAeYWeM0D8pmxGKNfROrTypGKC', 'indore', '1234567897', 'admin21@gmail.com', 'profile_pictures/u7RF9T9m57jEA9sJJV5piMuvkjpz3qWNdIWFBvAY.png', '2024-06-25', 'customer', '2024-06-24 13:06:07', '2024-06-24 13:08:33'),
(4, 'bhanu vendor', 'bhanupriya3.mindcrew@gmail.com', '$2y$12$.NP.saR5tMqsorX7PupXWOj4q7Leq2CaPH6w8Kff3nHTy//9S2Gpu', 'indore', '1234567897', 'admin3@gmail.com', 'profile_pictures/etBv7lF7bPGzoGQW5TToMBJym88bRGJLsFhe21cn.png', '2024-06-25', 'vendor', '2024-06-24 13:12:48', '2024-06-24 13:12:48'),
(7, 'Super Admin', 'admin@gmail.com', '$2y$12$PrNTz1XC4f3WR00.fSroheMP3gvPjGKELxg0O3bADzd7hflBPSA2m', '123 Admin Street', '1234567890', 'superadmin', 'profile_pictures/etBv7lF7bPGzoGQW5TToMBJym88bRGJLsFhe21cn.png', '1980-01-01', 'superAdmin', NULL, NULL),
(8, 'bhanu', 'bhanupriya4.mindcrew@gmail.com', '$2y$12$EhnicWoVjKXwjjfrGCv2j.cf7uP557XCxIqeU1s./ZvrdkANebaPO', 'indore', '1234567897', 'bhanupriya4', 'profile_pictures/By3xcRE9T2Pm0O1qGgBDYr0OwHMopa0TSLsRuZEL.png', '2024-06-25', 'customer', '2024-06-24 22:20:18', '2024-06-24 22:20:18'),
(9, 'priya soni', 'bhanupriya5.mindcrew@gmail.com', '$2y$12$GflUux5V1fLwI5c7Zxhuz.7KPO7BOK2RiGezSUobwhGryH9K8VWnK', 'indore', '1234567897', 'bhanupriya5', 'profile_pictures/AXsupFcSz1kfu4HoDhHQqZPRbJfYRd6EvFBF4X4A.png', '2024-06-25', 'customer', '2024-06-24 22:27:27', '2024-06-24 22:27:27');

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
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_product_id_foreign` (`product_id`);

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
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_user_id_foreign` (`user_id`),
  ADD KEY `transactions_order_id_foreign` (`order_id`);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
