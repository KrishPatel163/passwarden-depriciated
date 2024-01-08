-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 08, 2024 at 02:22 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `passwarden`
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
(5, '2023_11_29_154707_create_users_passwords_table', 1);

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
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(1, 'test', 'test@test.com', NULL, '$2y$10$XwJU6rqUOuNm1dkiFRSOGOZTpFWkNF22uldNJG/T1CgS1n84wf71q', NULL, '2023-12-13 04:07:58', '2023-12-13 04:07:58'),
(2, 'krish', 'krish@krish.com', NULL, '$2y$10$GtJcB9wBU4UrzJgfmEX6ReEg6rSsXfi2rXEAR.P8gCmPhbbHkEzti', NULL, '2023-12-31 02:20:05', '2023-12-31 02:20:05');

-- --------------------------------------------------------

--
-- Table structure for table `users_passwords`
--

CREATE TABLE `users_passwords` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `website` varchar(255) NOT NULL,
  `account_name` varchar(255) NOT NULL,
  `password` varchar(300) NOT NULL,
  `users_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users_passwords`
--

INSERT INTO `users_passwords` (`id`, `website`, `account_name`, `password`, `users_id`, `created_at`, `updated_at`) VALUES
(1, 'instagram', 'test_insta', 'eyJpdiI6ImFTSGEyYjBkVEI0TU1YNVNZbDNIYnc9PSIsInZhbHVlIjoiSFMvTmUxcjY2eHFEc0RPYkROcWFMdz09IiwibWFjIjoiM2VjOGM0MWU5ODdiMjRlOTQwYjE2MDg0MTBlMDY1YWFiMmU4OGQ3MzY1YTg4OWVlYzdmMmU0ODMxMTlhZTYyZSIsInRhZyI6IiJ9', 1, '2023-12-13 04:46:13', '2023-12-13 04:46:13'),
(2, 'google', 'krishpatel', 'eyJpdiI6IjhrS1huVjRqNGJQVGFOb3VSNXVERmc9PSIsInZhbHVlIjoiQjE5Z1I1Y2E4V3FVYjE1QTFIRlN3UT09IiwibWFjIjoiZWJjZTY2YjYwN2Q4ODhhNTQxNmFmNTY5NWJhMTYxYzQyYjk3NDA5ZmUxNTE0MTc1NmEwYTkyMTgyNDgwZTc4OCIsInRhZyI6IiJ9', 2, '2023-12-31 02:21:27', '2023-12-31 02:21:27'),
(4, 'war thunder', 'top_ghe', 'eyJpdiI6IlhraXl4Yk5kVkw0REZDSWNvc2ZPR0E9PSIsInZhbHVlIjoiUk8wNWJjZHY1OTV5dElRdEZ3T0Zwdz09IiwibWFjIjoiMTlhOTUzMDFjODlhNjdhMjlhZTgzMmJiN2VhOTljMThiNjhjM2Y3YjdiMWRjODBkOTEwMjdlM2FjYjg4OTAwNyIsInRhZyI6IiJ9', 2, '2023-12-31 02:23:56', '2023-12-31 02:23:56'),
(5, 'instagram', 'krishxd.java', 'eyJpdiI6InhxRFl6RXY2TW9IV2hQUXVGS0c0WGc9PSIsInZhbHVlIjoiU3VxR0tOVHVycGo3cDZQUEtJTmRnUT09IiwibWFjIjoiNWMyOTQ5YmE2ZDJkOTkwMzMzNmQ5NGQ2YjA0ODI3OTk2ZjFhOTEwMWIwODM5OWNlNWU0MWI1MmU2YjQ1YjhmMiIsInRhZyI6IiJ9', 2, '2023-12-31 02:28:23', '2023-12-31 02:28:23'),
(6, 'steam', 'steam', 'def50200c31d9ebd3fdc738a315482bd9a7682c739e973699957a3bc7d02a5ad791814816054403cb730c5c2f0cb2269cda908ee48dcf6e81ce7aaa79ba41c0a1e4cff951965674b5ec6b08171a94e19d70858573caf7e5479bb026b9389', 2, '2024-01-02 01:52:04', '2024-01-02 01:52:04'),
(7, 'discord', 'kakashiii', 'def50200db75bcb9ff6e1063555ccc49c1aa58502f1b8cec3fa09483dfb4d0865cb086174d4c8cae49c99de9fd33cfb9afa1937d8dec500af582ac655199a6b3ee59e2fdca1ff5151c545c87fee9e4b00ef49b4c3547af7b40862044871b034f51', 2, '2024-01-02 01:53:00', '2024-01-02 01:53:00'),
(9, 'google', 'google', 'e60dUw0b9uGF1l+HJET3HA==', 2, '2024-01-05 02:07:16', '2024-01-05 02:07:16');

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
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `users_passwords`
--
ALTER TABLE `users_passwords`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_passwords_users_id_foreign` (`users_id`);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users_passwords`
--
ALTER TABLE `users_passwords`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `users_passwords`
--
ALTER TABLE `users_passwords`
  ADD CONSTRAINT `users_passwords_users_id_foreign` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
