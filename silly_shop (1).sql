-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th4 13, 2026 lúc 07:10 AM
-- Phiên bản máy phục vụ: 8.0.30
-- Phiên bản PHP: 8.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `silly_shop`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `address_books`
--

CREATE TABLE `address_books` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `province_code` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ward_code` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `address_books`
--

INSERT INTO `address_books` (`id`, `name`, `address`, `phone`, `user_id`, `created_at`, `updated_at`, `province_code`, `ward_code`) VALUES
(1, 'Khánh Linh', '35 ngo 86 Phu Kieu', '0395069694', 1, '2025-08-10 08:30:25', '2025-08-10 08:30:25', '14', '03982'),
(2, 'Huu Dan Nguyen', '35 ngo 86 Phu Kieu', '0395069694', 3, '2025-08-13 14:38:39', '2025-08-13 14:38:39', '20', '06184'),
(3, 'Huu Dan Nguyen', '35 ngo 86 Phu Kieu', '0395069694', 2, '2025-08-14 13:42:35', '2025-08-14 13:42:35', '20', '06220');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cache`
--

CREATE TABLE `cache` (
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `carts`
--

CREATE TABLE `carts` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `product_variants_id` bigint UNSIGNED DEFAULT NULL,
  `flash_sale_items_id` bigint UNSIGNED DEFAULT NULL,
  `product_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int NOT NULL,
  `price_at_time` decimal(10,2) NOT NULL,
  `promotion_type` enum('0','flash_sale','bundle') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `product_variants_id`, `flash_sale_items_id`, `product_name`, `product_image_url`, `quantity`, `price_at_time`, `promotion_type`, `created_at`, `updated_at`) VALUES
(73, 4, 28, NULL, 'Quần short nam 1 - Trắng - S', NULL, 1, 111111.00, '0', '2026-04-11 07:08:52', '2026-04-11 07:08:52');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `image`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(4, 'Quần short', 'categories/cBmevpxcGVvWVDcU9RA61ify57dEHDpPGnFoDlq0.jpg', '1', '2026-03-27 00:43:20', '2026-03-27 00:43:20', NULL),
(5, 'Quần Jean', 'categories/41Mir4jcBsuDVKHv7Eh5999y1eVgrU960EK9Q5SE.jpg', '1', '2026-03-27 00:45:30', '2026-03-27 00:45:30', NULL),
(6, 'Áo thun', 'categories/Udnz82Vitu5AU1lVIScbzmteQ6hzldl0RrnK79mf.jpg', '1', '2026-03-27 00:45:48', '2026-03-27 00:49:32', NULL),
(7, 'Áo thun nam mát mẻ', 'categories/vnGF7epYsEpIyMXoc4zTbqaBRAPZhL1Md34bqyYi.jpg', '1', '2026-03-30 00:34:04', '2026-04-02 02:14:03', NULL),
(8, 'Quần short 2', 'categories/1o7rSJFxiVWoILTT9CO8iv70j7KMO2SmcpaR3k7l.jpg', '1', '2026-03-30 00:36:00', '2026-03-30 00:36:00', NULL),
(9, 'Áo thu đông', 'categories/TuQWybrtbeWRk81UwRydjDg238rUIK8RnvK1mf3i.jpg', '1', '2026-04-08 22:12:36', '2026-04-08 22:12:36', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories_vouchers`
--

CREATE TABLE `categories_vouchers` (
  `id` bigint UNSIGNED NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories_vouchers`
--

INSERT INTO `categories_vouchers` (`id`, `slug`, `name`, `created_at`, `updated_at`) VALUES
(1, 'giam-gia-moi-thang', 'Giảm giá mỗi tháng', '2025-08-10 07:46:02', '2025-08-10 07:46:02');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `colors`
--

CREATE TABLE `colors` (
  `id` bigint UNSIGNED NOT NULL,
  `color_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `color_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `colors`
--

INSERT INTO `colors` (`id`, `color_name`, `created_at`, `updated_at`, `color_code`) VALUES
(1, 'Xanh', '2025-08-10 07:40:01', '2025-08-10 07:40:01', '#2104b4'),
(2, 'Đen', '2025-08-10 07:40:04', '2025-08-10 07:40:04', '#000000'),
(3, 'Trắng', '2025-08-10 07:40:13', '2025-08-10 07:40:13', '#fafafa');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `admin_reply` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `time_reply` datetime DEFAULT NULL,
  `is_replied` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `flash_sales`
--

CREATE TABLE `flash_sales` (
  `id` bigint UNSIGNED NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `status` enum('upcoming','active','ended','canceled') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'upcoming',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `discount` int DEFAULT NULL,
  `slot_time` int DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `flash_sales`
--

INSERT INTO `flash_sales` (`id`, `start_date`, `end_date`, `status`, `created_at`, `updated_at`, `discount`, `slot_time`, `user_id`) VALUES
(3, '2025-08-13 20:00:00', '2025-08-13 23:48:59', 'active', '2025-08-13 13:10:18', '2025-08-13 13:10:18', 10, 12, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `flash_sale_items`
--

CREATE TABLE `flash_sale_items` (
  `id` bigint UNSIGNED NOT NULL,
  `product_variant_id` bigint UNSIGNED NOT NULL,
  `flash_sale_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `variant_image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `max_quantity` int NOT NULL,
  `sold_quantity` int NOT NULL,
  `price_at_flash_sale` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_id` bigint UNSIGNED DEFAULT NULL,
  `color_id` bigint UNSIGNED DEFAULT NULL,
  `size_id` bigint UNSIGNED DEFAULT NULL,
  `import_price` decimal(10,2) NOT NULL,
  `listed_price` decimal(10,2) NOT NULL,
  `sale_price` decimal(10,2) NOT NULL,
  `stock_quantity` int NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lock_reasons`
--

CREATE TABLE `lock_reasons` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_05_12_040446_create_colors_table', 1),
(5, '2025_05_12_040452_create_sizes_table', 1),
(6, '2025_05_12_064602_create_categories_vouchers_table', 1),
(7, '2025_05_12_101032_create_vouchers_table', 1),
(8, '2025_05_12_101045_create_vouchers_users_table', 1),
(9, '2025_05_13_060556_create_categories_table', 1),
(10, '2025_05_13_064000_create_products_table', 1),
(11, '2025_05_13_065921_create_product_variants_table', 1),
(12, '2025_05_13_070236_create_flash_sales_table', 1),
(13, '2025_05_13_071154_create_flash_sale_items_table', 1),
(14, '2025_05_13_100014_create_carts_table', 1),
(15, '2025_05_15_095152_create_address_books_table', 1),
(16, '2025_05_16_065614_create_orders_table', 1),
(17, '2025_05_23_072504_add_status_to_users_table', 1),
(18, '2025_05_23_073910_create_permission_tables', 1),
(19, '2025_05_24_120019_add_google_fields_to_users_table', 1),
(20, '2025_05_26_065953_create_order_items_table', 1),
(21, '2025_05_26_090209_add_code_voucher_to_vouchers_table', 1),
(22, '2025_05_26_092901_add_code_voucher_to_vouchers_table', 1),
(23, '2025_05_27_062106_alter_table_vouchers', 1),
(24, '2025_05_27_074219_add_soft_delete_vouchers', 1),
(25, '2025_05_27_080344_add_status_table_voucher_user', 1),
(26, '2025_05_27_103932_add_max_discount_vouchers', 1),
(27, '2025_05_27_121539_update_enum_status_vouchers', 1),
(28, '2025_05_27_141523_change_type_value_voucher', 1),
(29, '2025_05_31_024358_fix_enum_status_vouchers_users', 1),
(30, '2025_06_01_160858_create_bot_q_a_s_table', 1),
(31, '2025_06_02_105831_add_cl_received_vouchers', 1),
(32, '2025_06_04_045013_create_order_histories_table', 1),
(33, '2025_06_04_100525_update_status_order', 1),
(34, '2025_06_07_084139_add_col_table_orders', 1),
(35, '2025_06_07_104300_add_col_table_order', 1),
(36, '2025_06_07_165147_update_time_action_default_in_order_histories_table', 1),
(37, '2025_06_09_144157_add_order_to_roles_table', 1),
(38, '2025_06_17_221328_products_description', 1),
(39, '2025_06_21_115038_add_col_content_table_order_histories', 1),
(40, '2025_06_21_122230_create_reviews_table', 1),
(41, '2025_06_23_101108_add_col_vouchers', 1),
(42, '2025_06_23_114146_add_col_color_code_table_colors', 1),
(43, '2025_06_24_124025_add_col_view_table_products', 1),
(44, '2025_06_28_211612_add_notes_to_orders_table', 1),
(45, '2025_06_29_133315_add_col_table_vouchers', 1),
(46, '2025_06_29_182800_update_pay_method_enum_orders_table', 1),
(47, '2025_06_29_220125_add_total_spent_point_rank_to_users_table', 1),
(48, '2025_06_30_183051_add_deleted_at_to_users_table', 1),
(49, '2025_07_13_141914_add_date_table_vouchers_user', 1),
(50, '2025_07_13_145534_create_vouchers_logs_table', 1),
(51, '2025_07_13_150801_add_col_status_vouchers_log', 1),
(52, '2025_07_13_222236_make_voucher_id_nullable_in_vouchers_logs_table', 1),
(53, '2025_07_14_025502_create_refund_money_table', 1),
(54, '2025_07_14_093209_add_column_stk_table_refund_money', 1),
(55, '2025_07_14_094958_add_column_images_table_refund_money', 1),
(56, '2025_07_14_102208_update_status_enum_in_refund_money_table', 1),
(57, '2025_07_17_181034_add_title_to_roles_table', 1),
(58, '2025_07_17_181932_add_fields_to_permissions_table', 1),
(59, '2025_07_19_082326_add_col_image_success_ship_table_orders', 1),
(60, '2025_07_19_110636_add_user_comment_and_user_confirm_to_orders_table', 1),
(61, '2025_07_19_145804_add_province_ward_table_users', 1),
(62, '2025_07_19_145828_add_province_ward_table_address_book', 1),
(63, '2025_07_19_151903_add_province_ward_table_orders', 1),
(64, '2025_07_19_211323_create_lock_reasons_table', 1),
(65, '2025_07_19_211324_create_user_locks_table', 1),
(66, '2025_07_19_214508_rename_reason_column_in_user_locks_table', 1),
(67, '2025_07_19_215006_update_user_locks_table_fix_reason_column', 1),
(68, '2025_07_20_000000_remove_url_from_permissions_table', 1),
(69, '2025_07_20_135559_fix_address_books_ward_code_column', 1),
(70, '2025_07_20_152747_create_refund_logs_table', 1),
(71, '2025_07_20_153813_change_actor_column_to_foreign_key_in_table_name', 1),
(72, '2025_07_20_155214_add_col_refund_id', 1),
(73, '2025_07_20_161318_add_admin_note_refund_money', 1),
(74, '2025_07_20_161823_add_col_refunlog_action', 1),
(75, '2025_07_20_170857_add_admin_note_refund_log', 1),
(76, '2025_07_21_173117_add_locked_by_to_users_table', 1),
(77, '2025_07_22_214045_create_comments_table', 1),
(78, '2025_07_23_170550_add_images_to_reviews_table', 1),
(79, '2025_07_23_184008_create_review_replies_table', 1),
(80, '2025_07_27_151012_remove_voucher_id_from_flash_sales_table', 1),
(81, '2025_07_27_151253_add_col_product_id_table_flashsale', 1),
(82, '2025_07_27_154158_add_col_atribute__table_flashsale', 1),
(83, '2025_07_27_201800_add_col_use_flash_sale', 1),
(84, '2025_07_27_205212_add_col_sold_quantity', 1),
(85, '2025_07_27_233041_drop_unique_product_variant_id_from_flash_sale_items_table', 1),
(86, '2025_07_30_084202_add_col_slot_time_table_flash_sale', 1),
(87, '2025_07_30_094034_add_col_user_id__table_flash_sale', 1),
(88, '2025_08_01_151140_create_contacts_table', 1),
(89, '2025_08_01_171325_add_col_stock_quantity_table_flash_sale_item', 1),
(90, '2025_08_01_213318_add_locked_by_to_user_locks_table', 1),
(91, '2025_08_08_090311_update_orders_foreign_keys_set_null', 1),
(92, '2025_08_08_091315_add_voucher_snapshots_to_orders', 1),
(93, '2025_08_08_092144_update_order_items_product_foreign_keys_set_null', 1),
(94, '2025_08_08_093259_update_carts_add_snapshot_and_set_null_foreign_keys', 1),
(95, '2025_08_08_095051_add_col_atribu_order_items', 1),
(96, '2025_08_08_133736_create_vouchers_histories_table', 1),
(97, '2025_08_09_082057_add_color_and_size_to_reviews_table', 2),
(98, '2025_08_09_092217_add_order_id_and_product_variant_id_to_reviews_table', 2),
(99, '2025_08_12_205738_add_col_slug_table_flash_sale_items', 3),
(100, '2025_08_13_124641_add_col_initial_stock_table_product_variant', 3),
(101, '2025_08_13_141525_update_flash_sale_fk_in_order_items', 3),
(102, '2025_08_14_231547_update_voucher_type_discount_snapshot_in_orders_table', 3),
(103, '2025_08_20_014644_add_col_delivered_table_orders', 3),
(104, '2025_08_25_214438_add_admin_id_to_reviews_table', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `voucher_id` bigint UNSIGNED DEFAULT NULL,
  `voucher_code_snapshot` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `voucher_type_discount_snapshot` enum('percent','value') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `voucher_value_snapshot` decimal(10,2) DEFAULT NULL,
  `voucher_max_discount_snapshot` decimal(10,2) DEFAULT NULL,
  `voucher_min_order_value_snapshot` decimal(10,2) DEFAULT NULL,
  `voucher_start_date_snapshot` datetime DEFAULT NULL,
  `voucher_end_date_snapshot` datetime DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `address_books_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `final_amount` decimal(10,2) NOT NULL,
  `discount_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `status` enum('pending','confirmed','shipping','delivered','success','cancelled','failed') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `code_order` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pay_method` enum('COD','QR','VNPAY') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_pay` enum('unpaid','paid','failed','cancelled','cod_paid') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shipping_method` enum('basic','express') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'basic',
  `shipping_fee` int NOT NULL DEFAULT '0',
  `image_ship` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `user_confirm` tinyint(1) NOT NULL DEFAULT '0',
  `province_code` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ward_code` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `voucher_id`, `voucher_code_snapshot`, `voucher_type_discount_snapshot`, `voucher_value_snapshot`, `voucher_max_discount_snapshot`, `voucher_min_order_value_snapshot`, `voucher_start_date_snapshot`, `voucher_end_date_snapshot`, `user_id`, `address_books_id`, `name`, `phone`, `address`, `total_amount`, `final_amount`, `discount_amount`, `status`, `code_order`, `pay_method`, `status_pay`, `notes`, `created_at`, `updated_at`, `shipping_method`, `shipping_fee`, `image_ship`, `image_user`, `user_comment`, `user_confirm`, `province_code`, `ward_code`) VALUES
(68, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, 'Huu Dan Nguyen', '0395069694', '35 ngo 86 Phu Kieu', 111111.00, 141111.00, 0.00, 'confirmed', 'ORD-PJ6C9KUF', 'VNPAY', 'paid', 'xxx', '2026-04-11 06:37:08', '2026-04-11 06:37:37', 'basic', 30000, NULL, NULL, NULL, 0, '01', '00004'),
(69, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, 'Huu Dan Nguyen', '0395069694', '35 ngo 86 Phu Kieu', 222222.00, 230000.00, 22222.00, 'confirmed', 'ORD-FKVPK0UG', 'VNPAY', 'paid', '111', '2026-04-11 06:38:44', '2026-04-11 06:39:06', 'basic', 30000, NULL, NULL, NULL, 0, '04', '01279'),
(70, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, 'Huu Dan Nguyen', '0395069694', '35 ngo 86 Phu Kieu', 222222.00, 252222.00, 0.00, 'confirmed', 'ORD-OL2QWMR3', 'VNPAY', 'paid', 'sss', '2026-04-11 07:00:57', '2026-04-11 07:01:30', 'basic', 30000, NULL, NULL, NULL, 0, '01', '00004'),
(71, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, 'Huu Dan Nguyen', '0395069694', '35 ngo 86 Phu Kieu', 111111.00, 141111.00, 0.00, 'confirmed', 'ORD-SRFX9Y9S', 'VNPAY', 'paid', 'aaa', '2026-04-11 07:02:57', '2026-04-11 07:03:21', 'basic', 30000, NULL, NULL, NULL, 0, '31', '11455'),
(72, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, 'Huu Dan Nguyen', '0395069694', '35 ngo 86 Phu Kieu', 111111.00, 141111.00, 0.00, 'failed', 'ORD-CZEGPIGP', 'VNPAY', 'paid', 'aaa', '2026-04-11 07:05:50', '2026-04-11 08:01:06', 'basic', 30000, NULL, NULL, NULL, 0, '31', '11455'),
(73, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, 'Huu Dan Nguyen', '0395069694', '35 ngo 86 Phu Kieu', 111111.00, 141111.00, 0.00, 'success', 'ORD-FMWNZNB8', 'VNPAY', 'paid', 'saa', '2026-04-11 07:09:07', '2026-04-11 07:58:21', 'basic', 30000, NULL, NULL, NULL, 0, '38', '16531');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_histories`
--

CREATE TABLE `order_histories` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED NOT NULL,
  `from_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `to_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `users` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_action` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order_histories`
--

INSERT INTO `order_histories` (`id`, `order_id`, `from_status`, `to_status`, `note`, `content`, `users`, `time_action`, `created_at`, `updated_at`) VALUES
(19, 73, 'confirmed', 'success', 'Admin thay đổi trạng thái từ confirmed sang success', NULL, '4', '2026-04-11 07:58:21', '2026-04-11 07:58:21', '2026-04-11 07:58:21'),
(20, 72, 'confirmed', 'failed', 'Admin thay đổi trạng thái từ confirmed sang failed', NULL, '4', '2026-04-11 08:01:06', '2026-04-11 08:01:06', '2026-04-11 08:01:06');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED NOT NULL,
  `product_variant_id` bigint UNSIGNED DEFAULT NULL,
  `flash_sale_items_id` bigint UNSIGNED DEFAULT NULL,
  `product_id` bigint UNSIGNED DEFAULT NULL,
  `product_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `import_price` decimal(10,2) NOT NULL,
  `listed_price` decimal(10,2) NOT NULL,
  `sale_price` decimal(10,2) NOT NULL,
  `quantity` int NOT NULL,
  `promotion_type` enum('0','flash_sale','bundle') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `size_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_variant_id`, `flash_sale_items_id`, `product_id`, `product_name`, `product_image_url`, `import_price`, `listed_price`, `sale_price`, `quantity`, `promotion_type`, `created_at`, `updated_at`, `size_name`, `color_name`) VALUES
(66, 68, 29, NULL, 38, 'Quần Jean nam - Đen - M', 'uploads/product_variants/1775130752_1775130725_tải xuống (1).jpg', 100000.00, 111111.00, 111111.00, 1, '0', '2026-04-11 06:37:08', '2026-04-11 06:37:08', 'M', 'Đen'),
(67, 69, 29, NULL, 38, 'Quần Jean nam - Đen - M', 'uploads/product_variants/1775130752_1775130725_tải xuống (1).jpg', 100000.00, 111111.00, 111111.00, 2, '0', '2026-04-11 06:38:44', '2026-04-11 06:38:44', 'M', 'Đen'),
(68, 70, 30, NULL, 38, 'Quần Jean nam - Trắng - M', 'uploads/product_variants/1775130752_1775130750_fpoly.jpg', 100000.00, 111111.00, 111111.00, 2, '0', '2026-04-11 07:00:57', '2026-04-11 07:00:57', 'M', 'Trắng'),
(69, 71, 29, NULL, 38, 'Quần Jean nam - Đen - M', 'uploads/product_variants/1775130752_1775130725_tải xuống (1).jpg', 100000.00, 111111.00, 111111.00, 1, '0', '2026-04-11 07:02:57', '2026-04-11 07:02:57', 'M', 'Đen'),
(70, 72, 30, NULL, 38, 'Quần Jean nam - Trắng - M', 'uploads/product_variants/1775130752_1775130750_fpoly.jpg', 100000.00, 111111.00, 111111.00, 1, '0', '2026-04-11 07:05:50', '2026-04-11 07:05:50', 'M', 'Trắng'),
(71, 73, 27, NULL, 39, 'Quần short nam 1 - Đen - S', 'uploads/product_variants/1775130691_1775130671_tải xuống (1).jpg', 100000.00, 111111.00, 111111.00, 1, '0', '2026-04-11 07:09:07', '2026-04-11 07:09:07', 'S', 'Đen');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` bigint UNSIGNED DEFAULT NULL,
  `order` int NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `title`, `description`, `action`, `parent_id`, `order`, `deleted_at`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Quản lý Dashboard', 'Dashboard Management', NULL, NULL, NULL, 0, NULL, 'web', '2025-08-08 14:00:17', '2025-08-08 14:00:17'),
(2, 'Xem trang dashboard', 'View Dashboard', NULL, NULL, 1, 0, NULL, 'web', '2025-08-08 14:00:17', '2025-08-08 14:00:17'),
(3, 'Quản lý Đơn hàng', 'Order Management', NULL, NULL, NULL, 0, NULL, 'web', '2025-08-08 14:00:17', '2025-08-08 14:00:17'),
(4, 'Xem trang đơn hàng', 'View Orders', NULL, NULL, 3, 0, NULL, 'web', '2025-08-08 14:00:17', '2025-08-08 14:00:17'),
(5, 'Tạo đơn hàng', 'Create Order', NULL, NULL, 3, 0, NULL, 'web', '2025-08-08 14:00:17', '2025-08-08 14:00:17'),
(6, 'Sửa đơn hàng', 'Edit Order', NULL, NULL, 3, 0, NULL, 'web', '2025-08-08 14:00:17', '2025-08-08 14:00:17'),
(7, 'Xóa đơn hàng', 'Delete Order', NULL, NULL, 3, 0, NULL, 'web', '2025-08-08 14:00:17', '2025-08-08 14:00:17'),
(8, 'Thay đổi trạng thái đơn hàng', 'Change Order Status', NULL, NULL, 3, 0, NULL, 'web', '2025-08-08 14:00:17', '2025-08-08 14:00:17'),
(9, 'Thay đổi địa chỉ đơn hàng', 'Change Order Address', NULL, NULL, 3, 0, NULL, 'web', '2025-08-08 14:00:17', '2025-08-08 14:00:17'),
(10, 'Quản lý Hoàn tiền', 'Refund Management', NULL, NULL, NULL, 0, NULL, 'web', '2025-08-08 14:00:17', '2025-08-08 14:00:17'),
(11, 'Xem trang hoàn tiền', 'View Refunds', NULL, NULL, 10, 0, NULL, 'web', '2025-08-08 14:00:17', '2025-08-08 14:00:17'),
(12, 'Tạo yêu cầu hoàn tiền', 'Create Refund', NULL, NULL, 10, 0, NULL, 'web', '2025-08-08 14:00:17', '2025-08-08 14:00:17'),
(13, 'Sửa yêu cầu hoàn tiền', 'Edit Refund', NULL, NULL, 10, 0, NULL, 'web', '2025-08-08 14:00:17', '2025-08-08 14:00:17'),
(14, 'Xóa yêu cầu hoàn tiền', 'Delete Refund', NULL, NULL, 10, 0, NULL, 'web', '2025-08-08 14:00:17', '2025-08-08 14:00:17'),
(15, 'Phê duyệt hoàn tiền', 'Approve Refund', NULL, NULL, 10, 0, NULL, 'web', '2025-08-08 14:00:17', '2025-08-08 14:00:17'),
(16, 'Từ chối hoàn tiền', 'Reject Refund', NULL, NULL, 10, 0, NULL, 'web', '2025-08-08 14:00:17', '2025-08-08 14:00:17'),
(17, 'Quản lý Doanh thu', 'Revenue Management', NULL, NULL, NULL, 0, NULL, 'web', '2025-08-08 14:00:17', '2025-08-08 14:00:17'),
(18, 'Xem trang doanh thu', 'View Revenue', NULL, NULL, 17, 0, NULL, 'web', '2025-08-08 14:00:17', '2025-08-08 14:00:17'),
(19, 'Xuất báo cáo doanh thu', 'Export Revenue Report', NULL, NULL, 17, 0, NULL, 'web', '2025-08-08 14:00:17', '2025-08-08 14:00:17'),
(20, 'Lọc dữ liệu doanh thu', 'Filter Revenue Data', NULL, NULL, 17, 0, NULL, 'web', '2025-08-08 14:00:17', '2025-08-08 14:00:17'),
(21, 'Quản lý Voucher', 'Voucher Management', NULL, NULL, NULL, 0, NULL, 'web', '2025-08-08 14:00:17', '2025-08-08 14:00:17'),
(22, 'Xem trang voucher', 'View Vouchers', NULL, NULL, 21, 0, NULL, 'web', '2025-08-08 14:00:17', '2025-08-08 14:00:17'),
(23, 'Tạo voucher', 'Create Voucher', NULL, NULL, 21, 0, NULL, 'web', '2025-08-08 14:00:17', '2025-08-08 14:00:17'),
(24, 'Sửa voucher', 'Edit Voucher', NULL, NULL, 21, 0, NULL, 'web', '2025-08-08 14:00:17', '2025-08-08 14:00:17'),
(25, 'Xóa voucher', 'Delete Voucher', NULL, NULL, 21, 0, NULL, 'web', '2025-08-08 14:00:17', '2025-08-08 14:00:17'),
(26, 'Kích hoạt voucher', 'Activate Voucher', NULL, NULL, 21, 0, NULL, 'web', '2025-08-08 14:00:17', '2025-08-08 14:00:17'),
(27, 'Vô hiệu hóa voucher', 'Deactivate Voucher', NULL, NULL, 21, 0, NULL, 'web', '2025-08-08 14:00:17', '2025-08-08 14:00:17'),
(28, 'Quản lý quảng cáo voucher', 'Manage Voucher Ads', NULL, NULL, 21, 0, NULL, 'web', '2025-08-08 14:00:17', '2025-08-08 14:00:17'),
(29, 'Quản lý Flash Sale', 'Flash Sale Management', NULL, NULL, NULL, 0, NULL, 'web', '2025-08-08 14:00:17', '2025-08-08 14:00:17'),
(30, 'Xem trang flash sale', 'View Flash Sales', NULL, NULL, 29, 0, NULL, 'web', '2025-08-08 14:00:17', '2025-08-08 14:00:17'),
(31, 'Tạo flash sale', 'Create Flash Sale', NULL, NULL, 29, 0, NULL, 'web', '2025-08-08 14:00:17', '2025-08-08 14:00:17'),
(32, 'Sửa flash sale', 'Edit Flash Sale', NULL, NULL, 29, 0, NULL, 'web', '2025-08-08 14:00:17', '2025-08-08 14:00:17'),
(33, 'Xóa flash sale', 'Delete Flash Sale', NULL, NULL, 29, 0, NULL, 'web', '2025-08-08 14:00:17', '2025-08-08 14:00:17'),
(34, 'Kích hoạt flash sale', 'Activate Flash Sale', NULL, NULL, 29, 0, NULL, 'web', '2025-08-08 14:00:17', '2025-08-08 14:00:17'),
(35, 'Vô hiệu hóa flash sale', 'Deactivate Flash Sale', NULL, NULL, 29, 0, NULL, 'web', '2025-08-08 14:00:17', '2025-08-08 14:00:17'),
(36, 'Quản lý sản phẩm flash sale', 'Manage Flash Sale Items', NULL, NULL, 29, 0, NULL, 'web', '2025-08-08 14:00:17', '2025-08-08 14:00:17'),
(37, 'Quản lý Sản phẩm', 'Product Management', NULL, NULL, NULL, 0, NULL, 'web', '2025-08-08 14:00:17', '2025-08-08 14:00:17'),
(38, 'Xem trang sản phẩm', 'View Products', NULL, NULL, 37, 0, NULL, 'web', '2025-08-08 14:00:17', '2025-08-08 14:00:17'),
(39, 'Tạo sản phẩm', 'Create Product', NULL, NULL, 37, 0, NULL, 'web', '2025-08-08 14:00:17', '2025-08-08 14:00:17'),
(40, 'Sửa sản phẩm', 'Edit Product', NULL, NULL, 37, 0, NULL, 'web', '2025-08-08 14:00:17', '2025-08-08 14:00:17'),
(41, 'Xóa sản phẩm', 'Delete Product', NULL, NULL, 37, 0, NULL, 'web', '2025-08-08 14:00:17', '2025-08-08 14:00:17'),
(42, 'Khôi phục sản phẩm', 'Restore Product', NULL, NULL, 37, 0, NULL, 'web', '2025-08-08 14:00:17', '2025-08-08 14:00:17'),
(43, 'Tải ảnh sản phẩm', 'Upload Product Image', NULL, NULL, 37, 0, NULL, 'web', '2025-08-08 14:00:17', '2025-08-08 14:00:17'),
(44, 'Thêm sản phẩm vào flash sale', 'Add Product to Flash Sale', NULL, NULL, 37, 0, NULL, 'web', '2025-08-08 14:00:17', '2025-08-08 14:00:17'),
(45, 'Xóa sản phẩm khỏi flash sale', 'Remove Product from Flash Sale', NULL, NULL, 37, 0, NULL, 'web', '2025-08-08 14:00:17', '2025-08-08 14:00:17'),
(46, 'Quản lý Danh mục', 'Category Management', NULL, NULL, NULL, 0, NULL, 'web', '2025-08-08 14:00:17', '2025-08-08 14:00:17'),
(47, 'Xem trang danh mục', 'View Categories', NULL, NULL, 46, 0, NULL, 'web', '2025-08-08 14:00:17', '2025-08-08 14:00:17'),
(48, 'Tạo danh mục', 'Create Category', NULL, NULL, 46, 0, NULL, 'web', '2025-08-08 14:00:17', '2025-08-08 14:00:17'),
(49, 'Sửa danh mục', 'Edit Category', NULL, NULL, 46, 0, NULL, 'web', '2025-08-08 14:00:17', '2025-08-08 14:00:17'),
(50, 'Xóa danh mục', 'Delete Category', NULL, NULL, 46, 0, NULL, 'web', '2025-08-08 14:00:17', '2025-08-08 14:00:17'),
(51, 'Khôi phục danh mục', 'Restore Category', NULL, NULL, 46, 0, NULL, 'web', '2025-08-08 14:00:17', '2025-08-08 14:00:17'),
(52, 'Quản lý Biến thể sản phẩm', 'Product Variant Management', NULL, NULL, NULL, 0, NULL, 'web', '2025-08-08 14:00:17', '2025-08-08 14:00:17'),
(53, 'Xem trang biến thể', 'View Variants', NULL, NULL, 52, 0, NULL, 'web', '2025-08-08 14:00:17', '2025-08-08 14:00:17'),
(54, 'Tạo biến thể', 'Create Variant', NULL, NULL, 52, 0, NULL, 'web', '2025-08-08 14:00:17', '2025-08-08 14:00:17'),
(55, 'Sửa biến thể', 'Edit Variant', NULL, NULL, 52, 0, NULL, 'web', '2025-08-08 14:00:17', '2025-08-08 14:00:17'),
(56, 'Xóa biến thể', 'Delete Variant', NULL, NULL, 52, 0, NULL, 'web', '2025-08-08 14:00:17', '2025-08-08 14:00:17'),
(57, 'Khôi phục biến thể', 'Restore Variant', NULL, NULL, 52, 0, NULL, 'web', '2025-08-08 14:00:17', '2025-08-08 14:00:17'),
(58, 'Tải ảnh biến thể', 'Upload Variant Image', NULL, NULL, 52, 0, NULL, 'web', '2025-08-08 14:00:17', '2025-08-08 14:00:17'),
(59, 'Quản lý Màu sắc', 'Color Management', NULL, NULL, NULL, 0, NULL, 'web', '2025-08-08 14:00:17', '2025-08-08 14:00:17'),
(60, 'Xem trang màu sắc', 'View Colors', NULL, NULL, 59, 0, NULL, 'web', '2025-08-08 14:00:17', '2025-08-08 14:00:17'),
(61, 'Tạo màu sắc', 'Create Color', NULL, NULL, 59, 0, NULL, 'web', '2025-08-08 14:00:18', '2025-08-08 14:00:18'),
(62, 'Sửa màu sắc', 'Edit Color', NULL, NULL, 59, 0, NULL, 'web', '2025-08-08 14:00:18', '2025-08-08 14:00:18'),
(63, 'Xóa màu sắc', 'Delete Color', NULL, NULL, 59, 0, NULL, 'web', '2025-08-08 14:00:18', '2025-08-08 14:00:18'),
(64, 'Quản lý Kích thước', 'Size Management', NULL, NULL, NULL, 0, NULL, 'web', '2025-08-08 14:00:18', '2025-08-08 14:00:18'),
(65, 'Xem trang kích thước', 'View Sizes', NULL, NULL, 64, 0, NULL, 'web', '2025-08-08 14:00:18', '2025-08-08 14:00:18'),
(66, 'Tạo kích thước', 'Create Size', NULL, NULL, 64, 0, NULL, 'web', '2025-08-08 14:00:18', '2025-08-08 14:00:18'),
(67, 'Sửa kích thước', 'Edit Size', NULL, NULL, 64, 0, NULL, 'web', '2025-08-08 14:00:18', '2025-08-08 14:00:18'),
(68, 'Xóa kích thước', 'Delete Size', NULL, NULL, 64, 0, NULL, 'web', '2025-08-08 14:00:18', '2025-08-08 14:00:18'),
(69, 'Quản lý Tài khoản', 'User Management', NULL, NULL, NULL, 0, NULL, 'web', '2025-08-08 14:00:18', '2025-08-08 14:00:18'),
(70, 'Xem trang tài khoản', 'View Users', NULL, NULL, 69, 0, NULL, 'web', '2025-08-08 14:00:18', '2025-08-08 14:00:18'),
(71, 'Tạo tài khoản', 'Create User', NULL, NULL, 69, 0, NULL, 'web', '2025-08-08 14:00:18', '2025-08-08 14:00:18'),
(72, 'Sửa tài khoản', 'Edit User', NULL, NULL, 69, 0, NULL, 'web', '2025-08-08 14:00:18', '2025-08-08 14:00:18'),
(73, 'Xóa tài khoản', 'Delete User', NULL, NULL, 69, 0, NULL, 'web', '2025-08-08 14:00:18', '2025-08-08 14:00:18'),
(74, 'Khóa tài khoản', 'Lock User', NULL, NULL, 69, 0, NULL, 'web', '2025-08-08 14:00:18', '2025-08-08 14:00:18'),
(75, 'Mở khóa tài khoản', 'Unlock User', NULL, NULL, 69, 0, NULL, 'web', '2025-08-08 14:00:18', '2025-08-08 14:00:18'),
(76, 'Xóa hàng loạt tài khoản', 'Bulk Delete Users', NULL, NULL, 69, 0, NULL, 'web', '2025-08-08 14:00:18', '2025-08-08 14:00:18'),
(77, 'Quản lý Vai trò', 'Role Management', NULL, NULL, NULL, 0, NULL, 'web', '2025-08-08 14:00:18', '2025-08-08 14:00:18'),
(78, 'Xem trang vai trò', 'View Roles', NULL, NULL, 77, 0, NULL, 'web', '2025-08-08 14:00:18', '2025-08-08 14:00:18'),
(79, 'Tạo vai trò', 'Create Role', NULL, NULL, 77, 0, NULL, 'web', '2025-08-08 14:00:18', '2025-08-08 14:00:18'),
(80, 'Sửa vai trò', 'Edit Role', NULL, NULL, 77, 0, NULL, 'web', '2025-08-08 14:00:18', '2025-08-08 14:00:18'),
(81, 'Xóa vai trò', 'Delete Role', NULL, NULL, 77, 0, NULL, 'web', '2025-08-08 14:00:18', '2025-08-08 14:00:18'),
(82, 'Sắp xếp vai trò', 'Order Roles', NULL, NULL, 77, 0, NULL, 'web', '2025-08-08 14:00:18', '2025-08-08 14:00:18'),
(83, 'Quản lý Quyền hạn', 'Permission Management', NULL, NULL, NULL, 0, NULL, 'web', '2025-08-08 14:00:18', '2025-08-08 14:00:18'),
(84, 'Xem trang quyền hạn', 'View Permissions', NULL, NULL, 83, 0, NULL, 'web', '2025-08-08 14:00:18', '2025-08-08 14:00:18'),
(85, 'Tạo quyền hạn', 'Create Permission', NULL, NULL, 83, 0, NULL, 'web', '2025-08-08 14:00:18', '2025-08-08 14:00:18'),
(86, 'Sửa quyền hạn', 'Edit Permission', NULL, NULL, 83, 0, NULL, 'web', '2025-08-08 14:00:18', '2025-08-08 14:00:18'),
(87, 'Xóa quyền hạn', 'Delete Permission', NULL, NULL, 83, 0, NULL, 'web', '2025-08-08 14:00:18', '2025-08-08 14:00:18'),
(88, 'Sắp xếp quyền hạn', 'Order Permissions', NULL, NULL, 83, 0, NULL, 'web', '2025-08-08 14:00:18', '2025-08-08 14:00:18'),
(89, 'Quản lý Bình luận', 'Comment Management', NULL, NULL, NULL, 0, NULL, 'web', '2025-08-08 14:00:18', '2025-08-08 14:00:18'),
(90, 'Xem trang bình luận', 'View Comments', NULL, NULL, 89, 0, NULL, 'web', '2025-08-08 14:00:18', '2025-08-08 14:00:18'),
(91, 'Sửa bình luận', 'Edit Comment', NULL, NULL, 89, 0, NULL, 'web', '2025-08-08 14:00:18', '2025-08-08 14:00:18'),
(92, 'Trả lời bình luận', 'Reply to Comment', NULL, NULL, 89, 0, NULL, 'web', '2025-08-08 14:00:18', '2025-08-08 14:00:18'),
(93, 'Xóa trả lời bình luận', 'Delete Comment Reply', NULL, NULL, 89, 0, NULL, 'web', '2025-08-08 14:00:18', '2025-08-08 14:00:18');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `views_page` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `description`, `slug`, `image_url`, `created_at`, `updated_at`, `deleted_at`, `views_page`) VALUES
(24, 6, 'Áo thun', '111', 'ao-thun', 'products/gWZk0JCWZYWN1VrOwTt0TP3DXBmpkWfZf8Ki3AhR.jpg', '2026-03-30 09:19:46', '2026-03-31 02:56:45', '2026-03-31 02:56:45', 0),
(35, 6, 'Áo thun nam mát mẻ', '<p>abc</p>', 'ao-thun-nam-mat-me', 'uploads/products/1775114565_1775114559_tanjiro-kamado-3840x2160-23027.jpg', '2026-04-02 00:22:45', '2026-04-02 01:08:25', '2026-04-02 01:08:25', 0),
(36, 5, 'Quần Jean nam ống suông', '<p>abc</p>', 'quan-jean-nam-ong-suong', 'uploads/products/1775130582_1775130536_itachi-uchiha-moon-3840x2160-25777.jpg', '2026-04-02 01:04:30', '2026-04-02 04:49:42', NULL, 0),
(37, 4, 'Quần short nam', '<p>abc</p>', 'quan-short-nam', 'uploads/products/1775130470_1775130460_satoru-gojo-jujutsu-3840x2160-9292.jpg', '2026-04-02 01:10:03', '2026-04-02 04:47:50', NULL, 0),
(38, 5, 'Quần Jean nam', '<p>abc</p>', 'quan-jean-nam', 'uploads/products/1775130527_1775130523_tanjiro-kamado-3840x2160-23027.jpg', '2026-04-02 02:10:39', '2026-04-02 04:48:47', NULL, 0),
(39, 4, 'Quần short nam 1', '<p>abc</p>', 'quan-short-nam-1', 'uploads/products/1775121104_1775121103_satoru-gojo-jujutsu-3840x2160-9292.jpg', '2026-04-02 02:11:44', '2026-04-02 02:11:44', NULL, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_variants`
--

CREATE TABLE `product_variants` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `color_id` bigint UNSIGNED NOT NULL,
  `size_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `variant_image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `import_price` decimal(10,2) NOT NULL,
  `listed_price` decimal(10,2) NOT NULL,
  `sale_price` decimal(10,2) NOT NULL,
  `stock` int NOT NULL,
  `initial_stock` int NOT NULL DEFAULT '0',
  `is_show` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `use_flash_sale` tinyint(1) NOT NULL DEFAULT '0',
  `sold_quantity` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_variants`
--

INSERT INTO `product_variants` (`id`, `product_id`, `color_id`, `size_id`, `name`, `variant_image_url`, `import_price`, `listed_price`, `sale_price`, `stock`, `initial_stock`, `is_show`, `created_at`, `updated_at`, `deleted_at`, `use_flash_sale`, `sold_quantity`) VALUES
(19, 36, 1, 1, 'Quần Jean nam ống suông - Xanh - S', 'uploads/product_variants/1775130833_1775130582_1775130437_1775130429_satoru-gojo-jujutsu-3840x2160-9292.jpg', 100000.00, 111111.00, 111111.00, 0, 11, 1, '2026-04-02 01:04:30', '2026-04-08 22:37:53', NULL, 0, 0),
(20, 37, 1, 1, 'Quần short nam - Xanh - S', 'uploads/product_variants/1775130648_1775130470_1775117403_1775117374_itachi-uchiha-moon-3840x2160-25777.jpg', 100000.00, 111111.00, 111111.00, 8, 11, 1, '2026-04-02 01:10:03', '2026-04-10 10:24:41', NULL, 0, 0),
(21, 37, 2, 1, 'Quần short nam - Đen - S', 'uploads/product_variants/1775130648_1775130470_1775117403_1775117399_tanjiro-kamado-3840x2160-23027.jpg', 100000.00, 111111.00, 111111.00, 108, 111, 1, '2026-04-02 01:10:03', '2026-04-08 22:45:23', NULL, 0, 0),
(22, 38, 1, 2, 'Quần Jean nam - Xanh - M', 'uploads/product_variants/1775130752_1775130527_1775121039_1775121036_itachi-uchiha-moon-3840x2160-25777.jpg', 100000.00, 111111.00, 111111.00, 7, 11, 1, '2026-04-02 02:10:39', '2026-04-11 05:37:53', NULL, 0, 0),
(23, 39, 1, 1, 'Quần short nam 1 - Xanh - S', 'uploads/product_variants/1775130691_1775121104_1775121088_satoru-gojo-jujutsu-3840x2160-9292.jpg', 100000.00, 1111111.00, 111111.00, 0, 11, 1, '2026-04-02 02:11:44', '2026-04-08 22:16:29', NULL, 0, 0),
(24, 36, 2, 1, 'Quần Jean nam ống suông - Đen - S', 'uploads/product_variants/1775130833_1775130582_1775130561_1.jpg', 100000.00, 111111.00, 111111.00, 10, 11, 1, '2026-04-02 04:49:42', '2026-04-08 22:16:30', NULL, 0, 0),
(25, 36, 3, 1, 'Quần Jean nam ống suông - Trắng - S', 'uploads/product_variants/1775130833_1775130582_1775130579_Wallpaper.jpg', 100000.00, 111111.00, 111111.00, 11, 11, 1, '2026-04-02 04:49:42', '2026-04-02 04:53:53', NULL, 0, 0),
(26, 37, 3, 1, 'Quần short nam - Trắng - S', 'uploads/product_variants/1775130648_1775130646_tải xuống.jpg', 100000.00, 111111.00, 111111.00, 22, 22, 1, '2026-04-02 04:50:48', '2026-04-02 04:50:48', NULL, 0, 0),
(27, 39, 2, 1, 'Quần short nam 1 - Đen - S', 'uploads/product_variants/1775130691_1775130671_tải xuống (1).jpg', 100000.00, 111111.00, 111111.00, 16, 22, 1, '2026-04-02 04:51:31', '2026-04-11 07:09:31', NULL, 0, 0),
(28, 39, 3, 1, 'Quần short nam 1 - Trắng - S', 'uploads/product_variants/1775130691_1775130689_1.jpg', 100000.00, 111111.00, 111111.00, 11, 11, 1, '2026-04-02 04:51:31', '2026-04-02 04:51:31', NULL, 0, 0),
(29, 38, 2, 2, 'Quần Jean nam - Đen - M', 'uploads/product_variants/1775130752_1775130725_tải xuống (1).jpg', 100000.00, 111111.00, 111111.00, 4, 11, 1, '2026-04-02 04:52:32', '2026-04-11 07:03:21', NULL, 0, 0),
(30, 38, 3, 2, 'Quần Jean nam - Trắng - M', 'uploads/product_variants/1775130752_1775130750_fpoly.jpg', 100000.00, 111111.00, 111111.00, 30, 33, 1, '2026-04-02 04:52:32', '2026-04-11 07:06:17', NULL, 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `provinces`
--

CREATE TABLE `provinces` (
  `id` bigint UNSIGNED NOT NULL,
  `province_code` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `place_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `provinces`
--

INSERT INTO `provinces` (`id`, `province_code`, `name`, `short_name`, `code`, `place_type`, `country`, `created_at`, `updated_at`) VALUES
(1, '01', 'Thành phố Hà Nội', 'Thành phố Hà Nội', 'HNI', 'Thành phố Trung Ương', 'VN', NULL, NULL),
(2, '04', 'Cao Bằng', 'Cao Bằng', 'CBG', 'Tỉnh', 'VN', NULL, NULL),
(3, '08', 'Tuyên Quang', 'Tuyên Quang', 'TGQ', 'Tỉnh', 'VN', NULL, NULL),
(4, '11', 'Điện Biên', 'Điện Biên', 'DBN', 'Tỉnh', 'VN', NULL, NULL),
(5, '12', 'Lai Châu', 'Lai Châu', 'LCU', 'Tỉnh', 'VN', NULL, NULL),
(6, '14', 'Sơn La', 'Sơn La', 'SLA', 'Tỉnh', 'VN', NULL, NULL),
(7, '15', 'Lào Cai', 'Lào Cai', 'LCI', 'Tỉnh', 'VN', NULL, NULL),
(8, '19', 'Thái Nguyên', 'Thái Nguyên', 'TNN', 'Tỉnh', 'VN', NULL, NULL),
(9, '20', 'Lạng Sơn', 'Lạng Sơn', 'LSN', 'Tỉnh', 'VN', NULL, NULL),
(10, '22', 'Quảng Ninh', 'Quảng Ninh', 'QNH', 'Tỉnh', 'VN', NULL, NULL),
(11, '24', 'Bắc Ninh', 'Bắc Ninh', 'BNH', 'Tỉnh', 'VN', NULL, NULL),
(12, '25', 'Phú Thọ', 'Phú Thọ', 'PTO', 'Tỉnh', 'VN', NULL, NULL),
(13, '31', 'Thành phố Hải Phòng', 'Thành phố Hải Phòng', 'HPG', 'Thành phố Trung Ương', 'VN', NULL, NULL),
(14, '33', 'Hưng Yên', 'Hưng Yên', 'HYN', 'Tỉnh', 'VN', NULL, NULL),
(15, '37', 'Ninh Bình', 'Ninh Bình', 'NBH', 'Tỉnh', 'VN', NULL, NULL),
(16, '38', 'Thanh Hóa', 'Thanh Hóa', 'THA', 'Tỉnh', 'VN', NULL, NULL),
(17, '40', 'Nghệ An', 'Nghệ An', 'NAN', 'Tỉnh', 'VN', NULL, NULL),
(18, '42', 'Hà Tĩnh', 'Hà Tĩnh', 'HTH', 'Tỉnh', 'VN', NULL, NULL),
(19, '44', 'Quảng Trị', 'Quảng Trị', 'QTI', 'Tỉnh', 'VN', NULL, NULL),
(20, '46', 'Thành phố Huế', 'Thành phố Huế', 'TTH', 'Thành phố Trung Ương', 'VN', NULL, NULL),
(21, '48', 'Thành phố Đà Nẵng', 'Thành phố Đà Nẵng', 'DNG', 'Thành phố Trung Ương', 'VN', NULL, NULL),
(22, '51', 'Quảng Ngãi', 'Quảng Ngãi', 'QNI', 'Tỉnh', 'VN', NULL, NULL),
(23, '52', 'Gia Lai', 'Gia Lai', 'GLI', 'Tỉnh', 'VN', NULL, NULL),
(24, '56', 'Khánh Hòa', 'Khánh Hòa', 'KHA', 'Tỉnh', 'VN', NULL, NULL),
(25, '66', 'Đắk Lắk', 'Đắk Lắk', 'DLK', 'Tỉnh', 'VN', NULL, NULL),
(26, '68', 'Lâm Đồng', 'Lâm Đồng', 'LDG', 'Tỉnh', 'VN', NULL, NULL),
(27, '75', 'Đồng Nai', 'Đồng Nai', 'DNI', 'Tỉnh', 'VN', NULL, NULL),
(28, '79', 'Thành phố Hồ Chí Minh', 'Thành phố Hồ Chí Minh', 'HCM', 'Thành phố Trung Ương', 'VN', NULL, NULL),
(29, '80', 'Tây Ninh', 'Tây Ninh', 'TNH', 'Tỉnh', 'VN', NULL, NULL),
(30, '82', 'Đồng Tháp', 'Đồng Tháp', 'DTP', 'Tỉnh', 'VN', NULL, NULL),
(31, '86', 'Vĩnh Long', 'Vĩnh Long', 'VLG', 'Tỉnh', 'VN', NULL, NULL),
(32, '91', 'An Giang', 'An Giang', 'AGG', 'Tỉnh', 'VN', NULL, NULL),
(33, '92', 'Thành phố Cần Thơ', 'Thành phố Cần Thơ', 'CTO', 'Thành phố Trung Ương', 'VN', NULL, NULL),
(34, '96', 'Cà Mau', 'Cà Mau', 'CMU', 'Tỉnh', 'VN', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `refund_logs`
--

CREATE TABLE `refund_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `money` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `refund_id` bigint UNSIGNED DEFAULT NULL,
  `action` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `refund_money`
--

CREATE TABLE `refund_money` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED DEFAULT NULL,
  `bank` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_account_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `status` enum('pending','approved','rejected','admin') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin',
  `reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stk` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `images` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `QR_images` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_notes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED DEFAULT NULL,
  `product_variant_id` bigint UNSIGNED DEFAULT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `images` json DEFAULT NULL,
  `admin_reply` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `admin_id` bigint UNSIGNED DEFAULT NULL,
  `rating` tinyint UNSIGNED DEFAULT NULL,
  `is_show` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `review_replies`
--

CREATE TABLE `review_replies` (
  `id` bigint UNSIGNED NOT NULL,
  `review_id` bigint UNSIGNED NOT NULL,
  `admin_id` bigint UNSIGNED NOT NULL,
  `reply` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `parent_id` bigint UNSIGNED DEFAULT NULL,
  `order` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`id`, `parent_id`, `order`, `name`, `guard_name`, `created_at`, `updated_at`, `title`) VALUES
(1, NULL, NULL, 'Quản trị viên', 'web', '2025-08-08 14:00:28', '2025-08-08 14:00:28', 'Admin'),
(2, NULL, NULL, 'Nhân viên', 'web', '2025-08-08 14:00:28', '2025-08-08 14:00:28', 'Staff');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1),
(91, 1),
(92, 1),
(93, 1),
(1, 2),
(2, 2),
(3, 2),
(4, 2),
(6, 2),
(8, 2),
(10, 2),
(11, 2),
(15, 2),
(16, 2),
(17, 2),
(18, 2),
(89, 2),
(90, 2),
(91, 2),
(92, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('hYuWqMkjyVMnopAbheHFDGN7nkAoY9LK4tUxuPbK', 4, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiU21VT2hRaEJRWEVFd2FKemMxTHBzc0NPMTJHeE5iMkZYVU5ZV0QySyI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6NDtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czoyMToiaHR0cDovLzEyNy4wLjAuMTo4MDAwIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1776063790);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sizes`
--

CREATE TABLE `sizes` (
  `id` bigint UNSIGNED NOT NULL,
  `size_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sizes`
--

INSERT INTO `sizes` (`id`, `size_name`, `created_at`, `updated_at`) VALUES
(1, 'S', '2025-08-10 07:39:17', '2025-08-10 07:39:17'),
(2, 'M', '2025-08-10 07:39:25', '2025-08-10 07:39:25'),
(3, 'L', '2025-08-10 07:39:28', '2025-08-10 07:39:28');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `default_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` enum('admin','guest') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'guest',
  `total_spent` decimal(15,2) NOT NULL DEFAULT '0.00',
  `point` int UNSIGNED NOT NULL DEFAULT '0',
  `rank` enum('newbie','silver','gold','diamond') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'newbie',
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `locked_by` bigint UNSIGNED DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `google_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `province_code` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ward_code` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `default_address`, `default_phone`, `role`, `total_spent`, `point`, `rank`, `status`, `locked_by`, `remember_token`, `created_at`, `updated_at`, `google_id`, `avatar`, `deleted_at`, `province_code`, `ward_code`) VALUES
(1, 'Huu Dan Nguyen', 'iamvuahaitac1@gmail.com', '2025-08-12 17:00:00', '$2y$12$XaW1l7Bs7pTfww4OVMTbpOMyZyH9NTi9qoCzp6HwYbu7fm33UapOS', NULL, '0395069694', 'admin', 0.00, 0, 'newbie', 'active', NULL, 'YjYRMa3FyfR1Rpk4y4uXyF15q8LMrIq5qGw7yWDOS97Bsz9L8NtmuM3yQFa8', '2025-08-10 07:33:21', '2025-08-10 07:34:12', NULL, NULL, NULL, NULL, NULL),
(2, 'Huu Dan Nguyen', 'danmktb3@gmail.com', NULL, '$2y$12$lqyA.0MPukrOYOKq7WKz/OFGwVRpjv61qbAuZLmTZJusItDUAdAvy', NULL, NULL, 'guest', 0.00, 0, 'newbie', 'active', NULL, 'Vay36ubS1aTkdf17zq0cgKWJbjSy84jfm0o6sznRgoml8kX0dskK8KibwweK', '2025-08-11 14:04:48', '2025-08-11 14:04:48', NULL, NULL, NULL, NULL, NULL),
(3, 'Huu Dan', 'danmktb13@gmail.com', '2025-08-05 14:37:50', '$2y$12$xjUzATIVzHX7PTF9EHDMqe5mydJWRqQKdMZjFUwZTH.DJkc3OnRrm', NULL, NULL, 'guest', 0.00, 0, 'newbie', 'active', NULL, NULL, '2025-08-13 14:37:23', '2025-08-13 14:37:23', NULL, NULL, NULL, NULL, NULL),
(4, 'Huu Dan Nguyen', 'nguyendangkhanhlinh275@gmail.com', NULL, '$2y$12$giaCWPT8Ay7cG8f.Bm7bvOjKBcMcs6CmpePyvgmHgeAUm1CbC/no2', 'sss', '0395069694', 'admin', 0.00, 0, 'newbie', 'active', NULL, '0zuvLVmVR5SdI0vnDPdApEkiqqMg90IDhKGIKqS1nOqhChyHvPyLWUESVolC', '2026-03-27 00:41:15', '2026-04-10 09:40:53', NULL, 'avatars/dgUEzG7hZ1O9QLyt7mr5ntHtVoVTTfyZeWMnAltX.jpg', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_locks`
--

CREATE TABLE `user_locks` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `locked_by` bigint UNSIGNED DEFAULT NULL,
  `lock_reason_id` bigint UNSIGNED NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vouchers`
--

CREATE TABLE `vouchers` (
  `id` bigint UNSIGNED NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `block_show` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_discount` enum('percent','value') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` int NOT NULL,
  `block` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `used` int NOT NULL DEFAULT '0',
  `received` int NOT NULL DEFAULT '0',
  `max_used` int DEFAULT NULL,
  `min_order_value` int DEFAULT NULL,
  `status` enum('draft','active','disabled','used_up','expired','revoked','save') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'draft',
  `category_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `max_discount` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `vouchers`
--

INSERT INTO `vouchers` (`id`, `code`, `url_image`, `block_show`, `type_discount`, `value`, `block`, `image`, `start_date`, `end_date`, `used`, `received`, `max_used`, `min_order_value`, `status`, `category_id`, `created_at`, `updated_at`, `deleted_at`, `max_discount`) VALUES
(2, 'GIAMGIAMOITHANG', NULL, NULL, 'percent', 10, '3', 'uploads/vouchers/1754812281.jpg', '2025-08-11 14:50:00', '2025-08-31 14:51:00', 1, 1, 99, 150000, 'disabled', 1, '2025-08-10 07:51:21', '2025-08-26 13:58:33', NULL, 30000),
(3, 'GIAMGIAVIPPRO', NULL, NULL, 'percent', 10, '2', 'uploads/Voucher/1775807510.jpg', '2026-04-10 14:52:00', '2026-05-15 21:46:00', 0, 2, 98, 150000, 'active', 1, '2025-08-26 13:46:26', '2026-04-10 08:03:08', NULL, 30000),
(4, 'HELLOWORLD', NULL, NULL, 'percent', 10, '1', 'uploads/Voucher/1775732304.jpg', '2026-04-09 18:36:00', '2026-04-30 17:58:00', 0, 1, 110, 200000, 'active', 1, '2026-04-09 03:58:25', '2026-04-10 07:52:31', NULL, 10000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vouchers_histories`
--

CREATE TABLE `vouchers_histories` (
  `id` bigint UNSIGNED NOT NULL,
  `voucher_id` bigint UNSIGNED DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `to_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_action` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vouchers_logs`
--

CREATE TABLE `vouchers_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `voucher_id` bigint UNSIGNED DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `order_id` bigint UNSIGNED DEFAULT NULL,
  `actor` bigint UNSIGNED DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('refund_reuse','refund_new') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vouchers_users`
--

CREATE TABLE `vouchers_users` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `voucher_id` bigint UNSIGNED NOT NULL,
  `is_used` enum('unused','used') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unused',
  `issued_date` timestamp NULL DEFAULT NULL,
  `status` enum('available','used','expired') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'available',
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `vouchers_users`
--

INSERT INTO `vouchers_users` (`id`, `user_id`, `voucher_id`, `is_used`, `issued_date`, `status`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'used', NULL, 'used', '2025-08-10 14:50:00', '2025-08-31 14:51:00', '2025-08-10 08:11:32', '2025-08-10 15:20:34'),
(3, 4, 4, 'unused', NULL, 'available', '2026-04-09 18:36:00', '2026-04-30 17:58:00', '2026-04-10 07:48:20', '2026-04-10 07:48:20'),
(4, 4, 3, 'unused', NULL, 'available', '2026-04-10 14:52:00', '2026-05-15 21:46:00', '2026-04-10 08:03:08', '2026-04-10 08:03:08');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wards`
--

CREATE TABLE `wards` (
  `id` bigint UNSIGNED NOT NULL,
  `ward_code` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `province_code` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `wards`
--

INSERT INTO `wards` (`id`, `ward_code`, `name`, `province_code`, `created_at`, `updated_at`) VALUES
(1, '00004', 'Phường Ba Đình', '01', NULL, NULL),
(2, '00008', 'Phường Ngọc Hà', '01', NULL, NULL),
(3, '00025', 'Phường Giảng Võ', '01', NULL, NULL),
(4, '00070', 'Phường Hoàn Kiếm', '01', NULL, NULL),
(5, '00082', 'Phường Cửa Nam', '01', NULL, NULL),
(6, '00091', 'Phường Phú Thượng', '01', NULL, NULL),
(7, '00097', 'Phường Hồng Hà', '01', NULL, NULL),
(8, '00103', 'Phường Tây Hồ', '01', NULL, NULL),
(9, '00118', 'Phường Bồ Đề', '01', NULL, NULL),
(10, '00127', 'Phường Việt Hưng', '01', NULL, NULL),
(11, '00136', 'Phường Phúc Lợi', '01', NULL, NULL),
(12, '00145', 'Phường Long Biên', '01', NULL, NULL),
(13, '00160', 'Phường Nghĩa Đô', '01', NULL, NULL),
(14, '00166', 'Phường Cầu Giấy', '01', NULL, NULL),
(15, '00175', 'Phường Yên Hòa', '01', NULL, NULL),
(16, '00190', 'Phường Ô Chợ Dừa', '01', NULL, NULL),
(17, '00199', 'Phường Láng', '01', NULL, NULL),
(18, '00226', 'Phường Văn Miếu - Quốc Tử Giám', '01', NULL, NULL),
(19, '00229', 'Phường Kim Liên', '01', NULL, NULL),
(20, '00235', 'Phường Đống Đa', '01', NULL, NULL),
(21, '00256', 'Phường Hai Bà Trưng', '01', NULL, NULL),
(22, '00283', 'Phường Vĩnh Tuy', '01', NULL, NULL),
(23, '00292', 'Phường Bạch Mai', '01', NULL, NULL),
(24, '00301', 'Phường Vĩnh Hưng', '01', NULL, NULL),
(25, '00316', 'Phường Định Công', '01', NULL, NULL),
(26, '00322', 'Phường Tương Mai', '01', NULL, NULL),
(27, '00328', 'Phường Lĩnh Nam', '01', NULL, NULL),
(28, '00331', 'Phường Hoàng Mai', '01', NULL, NULL),
(29, '00337', 'Phường Hoàng Liệt', '01', NULL, NULL),
(30, '00340', 'Phường Yên Sở', '01', NULL, NULL),
(31, '00352', 'Phường Phương Liệt', '01', NULL, NULL),
(32, '00364', 'Phường Khương Đình', '01', NULL, NULL),
(33, '00367', 'Phường Thanh Xuân', '01', NULL, NULL),
(34, '00376', 'Xã Sóc Sơn', '01', NULL, NULL),
(35, '00382', 'Xã Kim Anh', '01', NULL, NULL),
(36, '00385', 'Xã Trung Giã', '01', NULL, NULL),
(37, '00430', 'Xã Đa Phúc', '01', NULL, NULL),
(38, '00433', 'Xã Nội Bài', '01', NULL, NULL),
(39, '00454', 'Xã Đông Anh', '01', NULL, NULL),
(40, '00466', 'Xã Phúc Thịnh', '01', NULL, NULL),
(41, '00475', 'Xã Thư Lâm', '01', NULL, NULL),
(42, '00493', 'Xã Thiên Lộc', '01', NULL, NULL),
(43, '00508', 'Xã Vĩnh Thanh', '01', NULL, NULL),
(44, '00541', 'Xã Phù Đổng', '01', NULL, NULL),
(45, '00562', 'Xã Thuận An', '01', NULL, NULL),
(46, '00565', 'Xã Gia Lâm', '01', NULL, NULL),
(47, '00577', 'Xã Bát Tràng', '01', NULL, NULL),
(48, '00592', 'Phường Từ Liêm', '01', NULL, NULL),
(49, '00598', 'Phường Thượng Cát', '01', NULL, NULL),
(50, '00602', 'Phường Đông Ngạc', '01', NULL, NULL),
(51, '00611', 'Phường Xuân Đỉnh', '01', NULL, NULL),
(52, '00613', 'Phường Tây Tựu', '01', NULL, NULL),
(53, '00619', 'Phường Phú Diễn', '01', NULL, NULL),
(54, '00622', 'Phường Xuân Phương', '01', NULL, NULL),
(55, '00634', 'Phường Tây Mỗ', '01', NULL, NULL),
(56, '00637', 'Phường Đại Mỗ', '01', NULL, NULL),
(57, '00640', 'Xã Thanh Trì', '01', NULL, NULL),
(58, '00643', 'Phường Thanh Liệt', '01', NULL, NULL),
(59, '00664', 'Xã Đại Thanh', '01', NULL, NULL),
(60, '00679', 'Xã Ngọc Hồi', '01', NULL, NULL),
(61, '00685', 'Xã Nam Phù', '01', NULL, NULL),
(62, '00691', 'Phường Hà Giang 2', '08', NULL, NULL),
(63, '00694', 'Phường Hà Giang 1', '08', NULL, NULL),
(64, '00700', 'Xã Ngọc Đường', '08', NULL, NULL),
(65, '00706', 'Xã Phú Linh', '08', NULL, NULL),
(66, '00715', 'Xã Lũng Cú', '08', NULL, NULL),
(67, '00721', 'Xã Đồng Văn', '08', NULL, NULL),
(68, '00733', 'Xã Sà Phìn', '08', NULL, NULL),
(69, '00745', 'Xã Phố Bảng', '08', NULL, NULL),
(70, '00763', 'Xã Lũng Phìn', '08', NULL, NULL),
(71, '00769', 'Xã Mèo Vạc', '08', NULL, NULL),
(72, '00778', 'Xã Sơn Vĩ', '08', NULL, NULL),
(73, '00787', 'Xã Sủng Máng', '08', NULL, NULL),
(74, '00802', 'Xã Khâu Vai', '08', NULL, NULL),
(75, '00808', 'Xã Tát Ngà', '08', NULL, NULL),
(76, '00817', 'Xã Niêm Sơn', '08', NULL, NULL),
(77, '00820', 'Xã Yên Minh', '08', NULL, NULL),
(78, '00829', 'Xã Thắng Mố', '08', NULL, NULL),
(79, '00832', 'Xã Bạch Đích', '08', NULL, NULL),
(80, '00847', 'Xã Mậu Duệ', '08', NULL, NULL),
(81, '00859', 'Xã Ngọc Long', '08', NULL, NULL),
(82, '00865', 'Xã Đường Thượng', '08', NULL, NULL),
(83, '00871', 'Xã Du Già', '08', NULL, NULL),
(84, '00874', 'Xã Quản Bạ', '08', NULL, NULL),
(85, '00883', 'Xã Cán Tỷ', '08', NULL, NULL),
(86, '00889', 'Xã Nghĩa Thuận', '08', NULL, NULL),
(87, '00892', 'Xã Tùng Vài', '08', NULL, NULL),
(88, '00901', 'Xã Lùng Tám', '08', NULL, NULL),
(89, '00913', 'Xã Vị Xuyên', '08', NULL, NULL),
(90, '00919', 'Xã Minh Tân', '08', NULL, NULL),
(91, '00922', 'Xã Thuận Hòa', '08', NULL, NULL),
(92, '00925', 'Xã Tùng Bá', '08', NULL, NULL),
(93, '00928', 'Xã Thanh Thủy', '08', NULL, NULL),
(94, '00937', 'Xã Lao Chải', '08', NULL, NULL),
(95, '00952', 'Xã Cao Bồ', '08', NULL, NULL),
(96, '00958', 'Xã Thượng Sơn', '08', NULL, NULL),
(97, '00967', 'Xã Việt Lâm', '08', NULL, NULL),
(98, '00970', 'Xã Linh Hồ', '08', NULL, NULL),
(99, '00976', 'Xã Bạch Ngọc', '08', NULL, NULL),
(100, '00982', 'Xã Minh Sơn', '08', NULL, NULL),
(101, '00985', 'Xã Giáp Trung', '08', NULL, NULL),
(102, '00991', 'Xã Bắc Mê', '08', NULL, NULL),
(103, '00994', 'Xã Minh Ngọc', '08', NULL, NULL),
(104, '01006', 'Xã Yên Cường', '08', NULL, NULL),
(105, '01012', 'Xã Đường Hồng', '08', NULL, NULL),
(106, '01021', 'Xã Hoàng Su Phì', '08', NULL, NULL),
(107, '01024', 'Xã Bản Máy', '08', NULL, NULL),
(108, '01033', 'Xã Thàng Tín', '08', NULL, NULL),
(109, '01051', 'Xã Tân Tiến', '08', NULL, NULL),
(110, '01057', 'Xã Pờ Ly Ngài', '08', NULL, NULL),
(111, '01075', 'Xã Nậm Dịch', '08', NULL, NULL),
(112, '01084', 'Xã Hồ Thầu', '08', NULL, NULL),
(113, '01090', 'Xã Thông Nguyên', '08', NULL, NULL),
(114, '01096', 'Xã Pà Vầy Sủ', '08', NULL, NULL),
(115, '01108', 'Xã Xín Mần', '08', NULL, NULL),
(116, '01117', 'Xã Trung Thịnh', '08', NULL, NULL),
(117, '01141', 'Xã Nấm Dẩn', '08', NULL, NULL),
(118, '01144', 'Xã Quảng Nguyên', '08', NULL, NULL),
(119, '01147', 'Xã Khuôn Lùng', '08', NULL, NULL),
(120, '01153', 'Xã Bắc Quang', '08', NULL, NULL),
(121, '01156', 'Xã Vĩnh Tuy', '08', NULL, NULL),
(122, '01165', 'Xã Đồng Tâm', '08', NULL, NULL),
(123, '01171', 'Xã Tân Quang', '08', NULL, NULL),
(124, '01180', 'Xã Bằng Hành', '08', NULL, NULL),
(125, '01192', 'Xã Liên Hiệp', '08', NULL, NULL),
(126, '01201', 'Xã Hùng An', '08', NULL, NULL),
(127, '01216', 'Xã Đồng Yên', '08', NULL, NULL),
(128, '01225', 'Xã Tiên Nguyên', '08', NULL, NULL),
(129, '01234', 'Xã Yên Thành', '08', NULL, NULL),
(130, '01237', 'Xã Quang Bình', '08', NULL, NULL),
(131, '01243', 'Xã Tân Trịnh', '08', NULL, NULL),
(132, '01246', 'Xã Bằng Lang', '08', NULL, NULL),
(133, '01255', 'Xã Xuân Giang', '08', NULL, NULL),
(134, '01261', 'Xã Tiên Yên', '08', NULL, NULL),
(135, '01273', 'Phường Thục Phán', '04', NULL, NULL),
(136, '01279', 'Phường Nùng Trí Cao', '04', NULL, NULL),
(137, '01288', 'Phường Tân Giang', '04', NULL, NULL),
(138, '01290', 'Xã Bảo Lâm', '04', NULL, NULL),
(139, '01294', 'Xã Lý Bôn', '04', NULL, NULL),
(140, '01297', 'Xã Nam Quang', '04', NULL, NULL),
(141, '01304', 'Xã Quảng Lâm', '04', NULL, NULL),
(142, '01318', 'Xã Yên Thổ', '04', NULL, NULL),
(143, '01321', 'Xã Bảo Lạc', '04', NULL, NULL),
(144, '01324', 'Xã Cốc Pàng', '04', NULL, NULL),
(145, '01327', 'Xã Cô Ba', '04', NULL, NULL),
(146, '01336', 'Xã Khánh Xuân', '04', NULL, NULL),
(147, '01339', 'Xã Xuân Trường', '04', NULL, NULL),
(148, '01351', 'Xã Hưng Đạo', '04', NULL, NULL),
(149, '01354', 'Xã Huy Giáp', '04', NULL, NULL),
(150, '01360', 'Xã Sơn Lộ', '04', NULL, NULL),
(151, '01363', 'Xã Thông Nông', '04', NULL, NULL),
(152, '01366', 'Xã Cần Yên', '04', NULL, NULL),
(153, '01387', 'Xã Thanh Long', '04', NULL, NULL),
(154, '01392', 'Xã Trường Hà', '04', NULL, NULL),
(155, '01393', 'Xã Lũng Nặm', '04', NULL, NULL),
(156, '01414', 'Xã Tổng Cọt', '04', NULL, NULL),
(157, '01438', 'Xã Hà Quảng', '04', NULL, NULL),
(158, '01447', 'Xã Trà Lĩnh', '04', NULL, NULL),
(159, '01456', 'Xã Quang Hán', '04', NULL, NULL),
(160, '01465', 'Xã Quang Trung', '04', NULL, NULL),
(161, '01477', 'Xã Trùng Khánh', '04', NULL, NULL),
(162, '01489', 'Xã Đình Phong', '04', NULL, NULL),
(163, '01501', 'Xã Đàm Thủy', '04', NULL, NULL),
(164, '01525', 'Xã Đoài Dương', '04', NULL, NULL),
(165, '01537', 'Xã Lý Quốc', '04', NULL, NULL),
(166, '01552', 'Xã Quang Long', '04', NULL, NULL),
(167, '01558', 'Xã Hạ Lang', '04', NULL, NULL),
(168, '01561', 'Xã Vinh Quý', '04', NULL, NULL),
(169, '01576', 'Xã Quảng Uyên', '04', NULL, NULL),
(170, '01594', 'Xã Độc Lập', '04', NULL, NULL),
(171, '01618', 'Xã Hạnh Phúc', '04', NULL, NULL),
(172, '01636', 'Xã Bế Văn Đàn', '04', NULL, NULL),
(173, '01648', 'Xã Phục Hòa', '04', NULL, NULL),
(174, '01654', 'Xã Hòa An', '04', NULL, NULL),
(175, '01660', 'Xã Nam Tuấn', '04', NULL, NULL),
(176, '01699', 'Xã Nguyễn Huệ', '04', NULL, NULL),
(177, '01708', 'Xã Bạch Đằng', '04', NULL, NULL),
(178, '01726', 'Xã Nguyên Bình', '04', NULL, NULL),
(179, '01729', 'Xã Tĩnh Túc', '04', NULL, NULL),
(180, '01738', 'Xã Ca Thành', '04', NULL, NULL),
(181, '01747', 'Xã Minh Tâm', '04', NULL, NULL),
(182, '01768', 'Xã Phan Thanh', '04', NULL, NULL),
(183, '01774', 'Xã Tam Kim', '04', NULL, NULL),
(184, '01777', 'Xã Thành Công', '04', NULL, NULL),
(185, '01786', 'Xã Đông Khê', '04', NULL, NULL),
(186, '01789', 'Xã Canh Tân', '04', NULL, NULL),
(187, '01792', 'Xã Kim Đồng', '04', NULL, NULL),
(188, '01795', 'Xã Minh Khai', '04', NULL, NULL),
(189, '01807', 'Xã Thạch An', '04', NULL, NULL),
(190, '01822', 'Xã Đức Long', '04', NULL, NULL),
(191, '01840', 'Phường Đức Xuân', '19', NULL, NULL),
(192, '01843', 'Phường Bắc Kạn', '19', NULL, NULL),
(193, '01849', 'Xã Phong Quang', '19', NULL, NULL),
(194, '01864', 'Xã Bằng Thành', '19', NULL, NULL),
(195, '01879', 'Xã Cao Minh', '19', NULL, NULL),
(196, '01882', 'Xã Nghiên Loan', '19', NULL, NULL),
(197, '01894', 'Xã Phúc Lộc', '19', NULL, NULL),
(198, '01906', 'Xã Ba Bể', '19', NULL, NULL),
(199, '01912', 'Xã Chợ Rã', '19', NULL, NULL),
(200, '01921', 'Xã Thượng Minh', '19', NULL, NULL),
(201, '01933', 'Xã Đồng Phúc', '19', NULL, NULL),
(202, '01936', 'Xã Nà Phặc', '19', NULL, NULL),
(203, '01942', 'Xã Bằng Vân', '19', NULL, NULL),
(204, '01954', 'Xã Ngân Sơn', '19', NULL, NULL),
(205, '01957', 'Xã Thượng Quan', '19', NULL, NULL),
(206, '01960', 'Xã Hiệp Lực', '19', NULL, NULL),
(207, '01969', 'Xã Phủ Thông', '19', NULL, NULL),
(208, '01981', 'Xã Vĩnh Thông', '19', NULL, NULL),
(209, '02008', 'Xã Cẩm Giàng', '19', NULL, NULL),
(210, '02014', 'Xã Bạch Thông', '19', NULL, NULL),
(211, '02020', 'Xã Chợ Đồn', '19', NULL, NULL),
(212, '02026', 'Xã Nam Cường', '19', NULL, NULL),
(213, '02038', 'Xã Quảng Bạch', '19', NULL, NULL),
(214, '02044', 'Xã Yên Thịnh', '19', NULL, NULL),
(215, '02071', 'Xã Nghĩa Tá', '19', NULL, NULL),
(216, '02083', 'Xã Yên Phong', '19', NULL, NULL),
(217, '02086', 'Xã Chợ Mới', '19', NULL, NULL),
(218, '02101', 'Xã Thanh Mai', '19', NULL, NULL),
(219, '02104', 'Xã Tân Kỳ', '19', NULL, NULL),
(220, '02107', 'Xã Thanh Thịnh', '19', NULL, NULL),
(221, '02116', 'Xã Yên Bình', '19', NULL, NULL),
(222, '02143', 'Xã Văn Lang', '19', NULL, NULL),
(223, '02152', 'Xã Cường Lợi', '19', NULL, NULL),
(224, '02155', 'Xã Na Rì', '19', NULL, NULL),
(225, '02176', 'Xã Trần Phú', '19', NULL, NULL),
(226, '02185', 'Xã Côn Minh', '19', NULL, NULL),
(227, '02191', 'Xã Xuân Dương', '19', NULL, NULL),
(228, '02212', 'Phường Nông Tiến', '08', NULL, NULL),
(229, '02215', 'Phường Minh Xuân', '08', NULL, NULL),
(230, '02221', 'Xã Nà Hang', '08', NULL, NULL),
(231, '02239', 'Xã Thượng Nông', '08', NULL, NULL),
(232, '02245', 'Xã Côn Lôn', '08', NULL, NULL),
(233, '02248', 'Xã Yên Hoa', '08', NULL, NULL),
(234, '02260', 'Xã Hồng Thái', '08', NULL, NULL),
(235, '02266', 'Xã Lâm Bình', '08', NULL, NULL),
(236, '02269', 'Xã Thượng Lâm', '08', NULL, NULL),
(237, '02287', 'Xã Chiêm Hóa', '08', NULL, NULL),
(238, '02296', 'Xã Bình An', '08', NULL, NULL),
(239, '02302', 'Xã Minh Quang', '08', NULL, NULL),
(240, '02305', 'Xã Trung Hà', '08', NULL, NULL),
(241, '02308', 'Xã Tân Mỹ', '08', NULL, NULL),
(242, '02317', 'Xã Yên Lập', '08', NULL, NULL),
(243, '02320', 'Xã Tân An', '08', NULL, NULL),
(244, '02332', 'Xã Kiên Đài', '08', NULL, NULL),
(245, '02350', 'Xã Kim Bình', '08', NULL, NULL),
(246, '02353', 'Xã Hòa An', '08', NULL, NULL),
(247, '02359', 'Xã Tri Phú', '08', NULL, NULL),
(248, '02365', 'Xã Yên Nguyên', '08', NULL, NULL),
(249, '02374', 'Xã Hàm Yên', '08', NULL, NULL),
(250, '02380', 'Xã Bạch Xa', '08', NULL, NULL),
(251, '02392', 'Xã Phù Lưu', '08', NULL, NULL),
(252, '02398', 'Xã Yên Phú', '08', NULL, NULL),
(253, '02404', 'Xã Bình Xa', '08', NULL, NULL),
(254, '02407', 'Xã Thái Sơn', '08', NULL, NULL),
(255, '02419', 'Xã Thái Hòa', '08', NULL, NULL),
(256, '02425', 'Xã Hùng Đức', '08', NULL, NULL),
(257, '02434', 'Xã Lực Hành', '08', NULL, NULL),
(258, '02437', 'Xã Kiến Thiết', '08', NULL, NULL),
(259, '02449', 'Xã Xuân Vân', '08', NULL, NULL),
(260, '02455', 'Xã Hùng Lợi', '08', NULL, NULL),
(261, '02458', 'Xã Trung Sơn', '08', NULL, NULL),
(262, '02470', 'Xã Tân Long', '08', NULL, NULL),
(263, '02473', 'Xã Yên Sơn', '08', NULL, NULL),
(264, '02494', 'Xã Thái Bình', '08', NULL, NULL),
(265, '02509', 'Phường Mỹ Lâm', '08', NULL, NULL),
(266, '02512', 'Phường An Tường', '08', NULL, NULL),
(267, '02524', 'Phường Bình Thuận', '08', NULL, NULL),
(268, '02530', 'Xã Nhữ Khê', '08', NULL, NULL),
(269, '02536', 'Xã Sơn Dương', '08', NULL, NULL),
(270, '02545', 'Xã Tân Trào', '08', NULL, NULL),
(271, '02548', 'Xã Bình Ca', '08', NULL, NULL),
(272, '02554', 'Xã Minh Thanh', '08', NULL, NULL),
(273, '02572', 'Xã Đông Thọ', '08', NULL, NULL),
(274, '02578', 'Xã Tân Thanh', '08', NULL, NULL),
(275, '02608', 'Xã Hồng Sơn', '08', NULL, NULL),
(276, '02611', 'Xã Phú Lương', '08', NULL, NULL),
(277, '02620', 'Xã Sơn Thủy', '08', NULL, NULL),
(278, '02623', 'Xã Trường Sinh', '08', NULL, NULL),
(279, '02647', 'Phường Lào Cai', '15', NULL, NULL),
(280, '02671', 'Phường Cam Đường', '15', NULL, NULL),
(281, '02680', 'Xã Hợp Thành', '15', NULL, NULL),
(282, '02683', 'Xã Bát Xát', '15', NULL, NULL),
(283, '02686', 'Xã A Mú Sung', '15', NULL, NULL),
(284, '02695', 'Xã Trịnh Tường', '15', NULL, NULL),
(285, '02701', 'Xã Y Tý', '15', NULL, NULL),
(286, '02707', 'Xã Dền Sáng', '15', NULL, NULL),
(287, '02725', 'Xã Bản Xèo', '15', NULL, NULL),
(288, '02728', 'Xã Mường Hum', '15', NULL, NULL),
(289, '02746', 'Xã Cốc San', '15', NULL, NULL),
(290, '02752', 'Xã Pha Long', '15', NULL, NULL),
(291, '02761', 'Xã Mường Khương', '15', NULL, NULL),
(292, '02782', 'Xã Cao Sơn', '15', NULL, NULL),
(293, '02788', 'Xã Bản Lầu', '15', NULL, NULL),
(294, '02809', 'Xã Si Ma Cai', '15', NULL, NULL),
(295, '02824', 'Xã Sín Chéng', '15', NULL, NULL),
(296, '02839', 'Xã Bắc Hà', '15', NULL, NULL),
(297, '02842', 'Xã Tả Củ Tỷ', '15', NULL, NULL),
(298, '02848', 'Xã Lùng Phình', '15', NULL, NULL),
(299, '02869', 'Xã Bản Liền', '15', NULL, NULL),
(300, '02890', 'Xã Bảo Nhai', '15', NULL, NULL),
(301, '02896', 'Xã Cốc Lầu', '15', NULL, NULL),
(302, '02902', 'Xã Phong Hải', '15', NULL, NULL),
(303, '02905', 'Xã Bảo Thắng', '15', NULL, NULL),
(304, '02908', 'Xã Tằng Loỏng', '15', NULL, NULL),
(305, '02923', 'Xã Gia Phú', '15', NULL, NULL),
(306, '02926', 'Xã Xuân Quang', '15', NULL, NULL),
(307, '02947', 'Xã Bảo Yên', '15', NULL, NULL),
(308, '02953', 'Xã Nghĩa Đô', '15', NULL, NULL),
(309, '02962', 'Xã Xuân Hòa', '15', NULL, NULL),
(310, '02968', 'Xã Thượng Hà', '15', NULL, NULL),
(311, '02989', 'Xã Bảo Hà', '15', NULL, NULL),
(312, '02998', 'Xã Phúc Khánh', '15', NULL, NULL),
(313, '03004', 'Xã Ngũ Chỉ Sơn', '15', NULL, NULL),
(314, '03006', 'Phường Sa Pa', '15', NULL, NULL),
(315, '03013', 'Xã Tả Phìn', '15', NULL, NULL),
(316, '03037', 'Xã Tả Van', '15', NULL, NULL),
(317, '03043', 'Xã Mường Bo', '15', NULL, NULL),
(318, '03046', 'Xã Bản Hồ', '15', NULL, NULL),
(319, '03061', 'Xã Võ Lao', '15', NULL, NULL),
(320, '03076', 'Xã Nậm Chày', '15', NULL, NULL),
(321, '03082', 'Xã Văn Bàn', '15', NULL, NULL),
(322, '03085', 'Xã Nậm Xé', '15', NULL, NULL),
(323, '03091', 'Xã Chiềng Ken', '15', NULL, NULL),
(324, '03103', 'Xã Khánh Yên', '15', NULL, NULL),
(325, '03106', 'Xã Dương Quỳ', '15', NULL, NULL),
(326, '03121', 'Xã Minh Lương', '15', NULL, NULL),
(327, '03127', 'Phường Điện Biên Phủ', '11', NULL, NULL),
(328, '03151', 'Phường Mường Lay', '11', NULL, NULL),
(329, '03158', 'Xã Sín Thầu', '11', NULL, NULL),
(330, '03160', 'Xã Mường Nhé', '11', NULL, NULL),
(331, '03162', 'Xã Nậm Kè', '11', NULL, NULL),
(332, '03163', 'Xã Mường Toong', '11', NULL, NULL),
(333, '03164', 'Xã Quảng Lâm', '11', NULL, NULL),
(334, '03166', 'Xã Mường Chà', '11', NULL, NULL),
(335, '03169', 'Xã Nà Hỳ', '11', NULL, NULL),
(336, '03172', 'Xã Na Sang', '11', NULL, NULL),
(337, '03175', 'Xã Chà Tở', '11', NULL, NULL),
(338, '03176', 'Xã Nà Bủng', '11', NULL, NULL),
(339, '03181', 'Xã Mường Tùng', '11', NULL, NULL),
(340, '03193', 'Xã Pa Ham', '11', NULL, NULL),
(341, '03194', 'Xã Nậm Nèn', '11', NULL, NULL),
(342, '03199', 'Xã Si Pa Phìn', '11', NULL, NULL),
(343, '03202', 'Xã Mường Pồn', '11', NULL, NULL),
(344, '03203', 'Xã Na Son', '11', NULL, NULL),
(345, '03208', 'Xã Xa Dung', '11', NULL, NULL),
(346, '03214', 'Xã Mường Luân', '11', NULL, NULL),
(347, '03217', 'Xã Tủa Chùa', '11', NULL, NULL),
(348, '03220', 'Xã Tủa Thàng', '11', NULL, NULL),
(349, '03226', 'Xã Sín Chải', '11', NULL, NULL),
(350, '03241', 'Xã Sính Phình', '11', NULL, NULL),
(351, '03244', 'Xã Sáng Nhè', '11', NULL, NULL),
(352, '03253', 'Xã Tuần Giáo', '11', NULL, NULL),
(353, '03256', 'Xã Mường Ảng', '11', NULL, NULL),
(354, '03260', 'Xã Pú Nhung', '11', NULL, NULL),
(355, '03268', 'Xã Mường Mùn', '11', NULL, NULL),
(356, '03283', 'Xã Chiềng Sinh', '11', NULL, NULL),
(357, '03295', 'Xã Quài Tở', '11', NULL, NULL),
(358, '03301', 'Xã Búng Lao', '11', NULL, NULL),
(359, '03313', 'Xã Mường Lạn', '11', NULL, NULL),
(360, '03316', 'Xã Nà Tấu', '11', NULL, NULL),
(361, '03325', 'Xã Mường Phăng', '11', NULL, NULL),
(362, '03328', 'Xã Thanh Nưa', '11', NULL, NULL),
(363, '03334', 'Phường Mường Thanh', '11', NULL, NULL),
(364, '03349', 'Xã Thanh Yên', '11', NULL, NULL),
(365, '03352', 'Xã Thanh An', '11', NULL, NULL),
(366, '03356', 'Xã Sam Mứn', '11', NULL, NULL),
(367, '03358', 'Xã Núa Ngam', '11', NULL, NULL),
(368, '03368', 'Xã Mường Nhà', '11', NULL, NULL),
(369, '03370', 'Xã Pu Nhi', '11', NULL, NULL),
(370, '03382', 'Xã Phình Giàng', '11', NULL, NULL),
(371, '03385', 'Xã Tìa Dình', '11', NULL, NULL),
(372, '03388', 'Phường Đoàn Kết', '12', NULL, NULL),
(373, '03390', 'Xã Bình Lư', '12', NULL, NULL),
(374, '03394', 'Xã Sin Suối Hồ', '12', NULL, NULL),
(375, '03405', 'Xã Tả Lèng', '12', NULL, NULL),
(376, '03408', 'Phường Tân Phong', '12', NULL, NULL),
(377, '03424', 'Xã Bản Bo', '12', NULL, NULL),
(378, '03430', 'Xã Khun Há', '12', NULL, NULL),
(379, '03433', 'Xã Bum Tở', '12', NULL, NULL),
(380, '03434', 'Xã Nậm Hàng', '12', NULL, NULL),
(381, '03439', 'Xã Thu Lũm', '12', NULL, NULL),
(382, '03442', 'Xã Pa Ủ', '12', NULL, NULL),
(383, '03445', 'Xã Mường Tè', '12', NULL, NULL),
(384, '03451', 'Xã Mù Cả', '12', NULL, NULL),
(385, '03460', 'Xã Hua Bum', '12', NULL, NULL),
(386, '03463', 'Xã Tà Tổng', '12', NULL, NULL),
(387, '03466', 'Xã Bum Nưa', '12', NULL, NULL),
(388, '03472', 'Xã Mường Mô', '12', NULL, NULL),
(389, '03478', 'Xã Sìn Hồ', '12', NULL, NULL),
(390, '03487', 'Xã Lê Lợi', '12', NULL, NULL),
(391, '03503', 'Xã Pa Tần', '12', NULL, NULL),
(392, '03508', 'Xã Hồng Thu', '12', NULL, NULL),
(393, '03517', 'Xã Nậm Tăm', '12', NULL, NULL),
(394, '03529', 'Xã Tủa Sín Chải', '12', NULL, NULL),
(395, '03532', 'Xã Pu Sam Cáp', '12', NULL, NULL),
(396, '03538', 'Xã Nậm Mạ', '12', NULL, NULL),
(397, '03544', 'Xã Nậm Cuổi', '12', NULL, NULL),
(398, '03549', 'Xã Phong Thổ', '12', NULL, NULL),
(399, '03562', 'Xã Sì Lở Lầu', '12', NULL, NULL),
(400, '03571', 'Xã Dào San', '12', NULL, NULL),
(401, '03583', 'Xã Khổng Lào', '12', NULL, NULL),
(402, '03595', 'Xã Than Uyên', '12', NULL, NULL),
(403, '03598', 'Xã Tân Uyên', '12', NULL, NULL),
(404, '03601', 'Xã Mường Khoa', '12', NULL, NULL),
(405, '03613', 'Xã Nậm Sỏ', '12', NULL, NULL),
(406, '03616', 'Xã Pắc Ta', '12', NULL, NULL),
(407, '03618', 'Xã Mường Than', '12', NULL, NULL),
(408, '03637', 'Xã Mường Kim', '12', NULL, NULL),
(409, '03640', 'Xã Khoen On', '12', NULL, NULL),
(410, '03646', 'Phường Tô Hiệu', '14', NULL, NULL),
(411, '03664', 'Phường Chiềng An', '14', NULL, NULL),
(412, '03670', 'Phường Chiềng Cơi', '14', NULL, NULL),
(413, '03679', 'Phường Chiềng Sinh', '14', NULL, NULL),
(414, '03688', 'Xã Mường Chiên', '14', NULL, NULL),
(415, '03694', 'Xã Mường Giôn', '14', NULL, NULL),
(416, '03703', 'Xã Quỳnh Nhai', '14', NULL, NULL),
(417, '03712', 'Xã Mường Sại', '14', NULL, NULL),
(418, '03721', 'Xã Thuận Châu', '14', NULL, NULL),
(419, '03724', 'Xã Bình Thuận', '14', NULL, NULL),
(420, '03727', 'Xã Mường É', '14', NULL, NULL),
(421, '03754', 'Xã Chiềng La', '14', NULL, NULL),
(422, '03757', 'Xã Mường Khiêng', '14', NULL, NULL),
(423, '03760', 'Xã Mường Bám', '14', NULL, NULL),
(424, '03763', 'Xã Long Hẹ', '14', NULL, NULL),
(425, '03781', 'Xã Co Mạ', '14', NULL, NULL),
(426, '03784', 'Xã Nậm Lầu', '14', NULL, NULL),
(427, '03799', 'Xã Muổi Nọi', '14', NULL, NULL),
(428, '03808', 'Xã Mường La', '14', NULL, NULL),
(429, '03814', 'Xã Chiềng Lao', '14', NULL, NULL),
(430, '03820', 'Xã Ngọc Chiến', '14', NULL, NULL),
(431, '03847', 'Xã Mường Bú', '14', NULL, NULL),
(432, '03850', 'Xã Chiềng Hoa', '14', NULL, NULL),
(433, '03856', 'Xã Bắc Yên', '14', NULL, NULL),
(434, '03862', 'Xã Xím Vàng', '14', NULL, NULL),
(435, '03868', 'Xã Tà Xùa', '14', NULL, NULL),
(436, '03871', 'Xã Pắc Ngà', '14', NULL, NULL),
(437, '03880', 'Xã Tạ Khoa', '14', NULL, NULL),
(438, '03892', 'Xã Chiềng Sại', '14', NULL, NULL),
(439, '03901', 'Xã Suối Tọ', '14', NULL, NULL),
(440, '03907', 'Xã Mường Cơi', '14', NULL, NULL),
(441, '03910', 'Xã Phù Yên', '14', NULL, NULL),
(442, '03922', 'Xã Gia Phù', '14', NULL, NULL),
(443, '03943', 'Xã Mường Bang', '14', NULL, NULL),
(444, '03958', 'Xã Tường Hạ', '14', NULL, NULL),
(445, '03961', 'Xã Kim Bon', '14', NULL, NULL),
(446, '03970', 'Xã Tân Phong', '14', NULL, NULL),
(447, '03979', 'Phường Mộc Sơn', '14', NULL, NULL),
(448, '03980', 'Phường Mộc Châu', '14', NULL, NULL),
(449, '03982', 'Phường Thảo Nguyên', '14', NULL, NULL),
(450, '03985', 'Xã Chiềng Sơn', '14', NULL, NULL),
(451, '03997', 'Xã Tân Yên', '14', NULL, NULL),
(452, '04000', 'Xã Đoàn Kết', '14', NULL, NULL),
(453, '04006', 'Xã Song Khủa', '14', NULL, NULL),
(454, '04018', 'Xã Tô Múa', '14', NULL, NULL),
(455, '04033', 'Phường Vân Sơn', '14', NULL, NULL),
(456, '04045', 'Xã Lóng Sập', '14', NULL, NULL),
(457, '04048', 'Xã Vân Hồ', '14', NULL, NULL),
(458, '04057', 'Xã Xuân Nha', '14', NULL, NULL),
(459, '04075', 'Xã Yên Châu', '14', NULL, NULL),
(460, '04078', 'Xã Chiềng Hặc', '14', NULL, NULL),
(461, '04087', 'Xã Yên Sơn', '14', NULL, NULL),
(462, '04096', 'Xã Lóng Phiêng', '14', NULL, NULL),
(463, '04099', 'Xã Phiêng Khoài', '14', NULL, NULL),
(464, '04105', 'Xã Mai Sơn', '14', NULL, NULL),
(465, '04108', 'Xã Chiềng Sung', '14', NULL, NULL),
(466, '04117', 'Xã Mường Chanh', '14', NULL, NULL),
(467, '04123', 'Xã Chiềng Mung', '14', NULL, NULL),
(468, '04132', 'Xã Chiềng Mai', '14', NULL, NULL),
(469, '04136', 'Xã Tà Hộc', '14', NULL, NULL),
(470, '04144', 'Xã Phiêng Cằm', '14', NULL, NULL),
(471, '04159', 'Xã Phiêng Pằn', '14', NULL, NULL),
(472, '04168', 'Xã Sông Mã', '14', NULL, NULL),
(473, '04171', 'Xã Bó Sinh', '14', NULL, NULL),
(474, '04183', 'Xã Mường Lầm', '14', NULL, NULL),
(475, '04186', 'Xã Nậm Ty', '14', NULL, NULL),
(476, '04195', 'Xã Chiềng Sơ', '14', NULL, NULL),
(477, '04204', 'Xã Chiềng Khoong', '14', NULL, NULL),
(478, '04210', 'Xã Huổi Một', '14', NULL, NULL),
(479, '04219', 'Xã Mường Hung', '14', NULL, NULL),
(480, '04222', 'Xã Chiềng Khương', '14', NULL, NULL),
(481, '04228', 'Xã Púng Bánh', '14', NULL, NULL),
(482, '04231', 'Xã Sốp Cộp', '14', NULL, NULL),
(483, '04240', 'Xã Mường Lèo', '14', NULL, NULL),
(484, '04246', 'Xã Mường Lạn', '14', NULL, NULL),
(485, '04252', 'Phường Yên Bái', '15', NULL, NULL),
(486, '04273', 'Phường Nam Cường', '15', NULL, NULL),
(487, '04279', 'Phường Văn Phú', '15', NULL, NULL),
(488, '04288', 'Phường Nghĩa Lộ', '15', NULL, NULL),
(489, '04303', 'Xã Lục Yên', '15', NULL, NULL),
(490, '04309', 'Xã Lâm Thượng', '15', NULL, NULL),
(491, '04336', 'Xã Tân Lĩnh', '15', NULL, NULL),
(492, '04342', 'Xã Khánh Hòa', '15', NULL, NULL),
(493, '04345', 'Xã Mường Lai', '15', NULL, NULL),
(494, '04363', 'Xã Phúc Lợi', '15', NULL, NULL),
(495, '04375', 'Xã Mậu A', '15', NULL, NULL),
(496, '04381', 'Xã Lâm Giang', '15', NULL, NULL),
(497, '04387', 'Xã Châu Quế', '15', NULL, NULL),
(498, '04399', 'Xã Đông Cuông', '15', NULL, NULL),
(499, '04402', 'Xã Phong Dụ Hạ', '15', NULL, NULL),
(500, '04423', 'Xã Phong Dụ Thượng', '15', NULL, NULL),
(501, '04429', 'Xã Tân Hợp', '15', NULL, NULL),
(502, '04441', 'Xã Xuân Ái', '15', NULL, NULL),
(503, '04450', 'Xã Mỏ Vàng', '15', NULL, NULL),
(504, '04456', 'Xã Mù Cang Chải', '15', NULL, NULL),
(505, '04462', 'Xã Nậm Có', '15', NULL, NULL),
(506, '04465', 'Xã Khao Mang', '15', NULL, NULL),
(507, '04474', 'Xã Lao Chải', '15', NULL, NULL),
(508, '04489', 'Xã Chế Tạo', '15', NULL, NULL),
(509, '04492', 'Xã Púng Luông', '15', NULL, NULL),
(510, '04498', 'Xã Trấn Yên', '15', NULL, NULL),
(511, '04531', 'Xã Quy Mông', '15', NULL, NULL),
(512, '04537', 'Xã Lương Thịnh', '15', NULL, NULL),
(513, '04543', 'Phường Âu Lâu', '15', NULL, NULL),
(514, '04564', 'Xã Việt Hồng', '15', NULL, NULL),
(515, '04576', 'Xã Hưng Khánh', '15', NULL, NULL),
(516, '04585', 'Xã Hạnh Phúc', '15', NULL, NULL),
(517, '04603', 'Xã Tà Xi Láng', '15', NULL, NULL),
(518, '04606', 'Xã Trạm Tấu', '15', NULL, NULL),
(519, '04609', 'Xã Phình Hồ', '15', NULL, NULL),
(520, '04630', 'Xã Tú Lệ', '15', NULL, NULL),
(521, '04636', 'Xã Gia Hội', '15', NULL, NULL),
(522, '04651', 'Xã Sơn Lương', '15', NULL, NULL),
(523, '04660', 'Xã Liên Sơn', '15', NULL, NULL),
(524, '04663', 'Phường Trung Tâm', '15', NULL, NULL),
(525, '04672', 'Xã Văn Chấn', '15', NULL, NULL),
(526, '04681', 'Phường Cầu Thia', '15', NULL, NULL),
(527, '04693', 'Xã Cát Thịnh', '15', NULL, NULL),
(528, '04699', 'Xã Chấn Thịnh', '15', NULL, NULL),
(529, '04705', 'Xã Thượng Bằng La', '15', NULL, NULL),
(530, '04711', 'Xã Nghĩa Tâm', '15', NULL, NULL),
(531, '04714', 'Xã Yên Bình', '15', NULL, NULL),
(532, '04717', 'Xã Thác Bà', '15', NULL, NULL),
(533, '04726', 'Xã Cảm Nhân', '15', NULL, NULL),
(534, '04744', 'Xã Yên Thành', '15', NULL, NULL),
(535, '04750', 'Xã Bảo Ái', '15', NULL, NULL),
(536, '04792', 'Phường Tân Hòa', '25', NULL, NULL),
(537, '04795', 'Phường Hòa Bình', '25', NULL, NULL),
(538, '04828', 'Phường Thống Nhất', '25', NULL, NULL),
(539, '04831', 'Xã Đà Bắc', '25', NULL, NULL),
(540, '04846', 'Xã Đức Nhàn', '25', NULL, NULL),
(541, '04849', 'Xã Tân Pheo', '25', NULL, NULL),
(542, '04873', 'Xã Quy Đức', '25', NULL, NULL),
(543, '04876', 'Xã Cao Sơn', '25', NULL, NULL),
(544, '04891', 'Xã Tiền Phong', '25', NULL, NULL),
(545, '04894', 'Phường Kỳ Sơn', '25', NULL, NULL),
(546, '04897', 'Xã Thịnh Minh', '25', NULL, NULL),
(547, '04924', 'Xã Lương Sơn', '25', NULL, NULL),
(548, '04930', 'Xã Yên Xuân', '01', NULL, NULL),
(549, '04960', 'Xã Liên Sơn', '25', NULL, NULL),
(550, '04978', 'Xã Kim Bôi', '25', NULL, NULL),
(551, '04990', 'Xã Nật Sơn', '25', NULL, NULL),
(552, '05014', 'Xã Mường Động', '25', NULL, NULL),
(553, '05047', 'Xã Cao Dương', '25', NULL, NULL),
(554, '05068', 'Xã Hợp Kim', '25', NULL, NULL),
(555, '05086', 'Xã Dũng Tiến', '25', NULL, NULL),
(556, '05089', 'Xã Cao Phong', '25', NULL, NULL),
(557, '05092', 'Xã Thung Nai', '25', NULL, NULL),
(558, '05116', 'Xã Mường Thàng', '25', NULL, NULL),
(559, '05128', 'Xã Tân Lạc', '25', NULL, NULL),
(560, '05134', 'Xã Mường Hoa', '25', NULL, NULL),
(561, '05152', 'Xã Vân Sơn', '25', NULL, NULL),
(562, '05158', 'Xã Mường Bi', '25', NULL, NULL),
(563, '05191', 'Xã Toàn Thắng', '25', NULL, NULL),
(564, '05200', 'Xã Mai Châu', '25', NULL, NULL),
(565, '05206', 'Xã Tân Mai', '25', NULL, NULL),
(566, '05212', 'Xã Pà Cò', '25', NULL, NULL),
(567, '05245', 'Xã Bao La', '25', NULL, NULL),
(568, '05251', 'Xã Mai Hạ', '25', NULL, NULL),
(569, '05266', 'Xã Lạc Sơn', '25', NULL, NULL),
(570, '05287', 'Xã Mường Vang', '25', NULL, NULL),
(571, '05290', 'Xã Nhân Nghĩa', '25', NULL, NULL),
(572, '05293', 'Xã Thượng Cốc', '25', NULL, NULL),
(573, '05305', 'Xã Yên Phú', '25', NULL, NULL),
(574, '05323', 'Xã Quyết Thắng', '25', NULL, NULL),
(575, '05329', 'Xã Ngọc Sơn', '25', NULL, NULL),
(576, '05347', 'Xã Đại Đồng', '25', NULL, NULL),
(577, '05353', 'Xã Yên Thủy', '25', NULL, NULL),
(578, '05362', 'Xã Lạc Lương', '25', NULL, NULL),
(579, '05386', 'Xã Yên Trị', '25', NULL, NULL),
(580, '05392', 'Xã Lạc Thủy', '25', NULL, NULL),
(581, '05395', 'Xã An Nghĩa', '25', NULL, NULL),
(582, '05425', 'Xã An Bình', '25', NULL, NULL),
(583, '05443', 'Phường Phan Đình Phùng', '19', NULL, NULL),
(584, '05455', 'Phường Quyết Thắng', '19', NULL, NULL),
(585, '05467', 'Phường Gia Sàng', '19', NULL, NULL),
(586, '05482', 'Phường Quan Triều', '19', NULL, NULL),
(587, '05488', 'Xã Đại Phúc', '19', NULL, NULL),
(588, '05500', 'Phường Tích Lương', '19', NULL, NULL),
(589, '05503', 'Xã Tân Cương', '19', NULL, NULL),
(590, '05518', 'Phường Sông Công', '19', NULL, NULL),
(591, '05528', 'Phường Bách Quang', '19', NULL, NULL),
(592, '05533', 'Phường Bá Xuyên', '19', NULL, NULL),
(593, '05542', 'Xã Lam Vỹ', '19', NULL, NULL),
(594, '05551', 'Xã Kim Phượng', '19', NULL, NULL),
(595, '05563', 'Xã Phượng Tiến', '19', NULL, NULL),
(596, '05569', 'Xã Định Hóa', '19', NULL, NULL),
(597, '05581', 'Xã Trung Hội', '19', NULL, NULL),
(598, '05587', 'Xã Bình Yên', '19', NULL, NULL),
(599, '05602', 'Xã Phú Đình', '19', NULL, NULL),
(600, '05605', 'Xã Bình Thành', '19', NULL, NULL),
(601, '05611', 'Xã Phú Lương', '19', NULL, NULL),
(602, '05620', 'Xã Yên Trạch', '19', NULL, NULL),
(603, '05632', 'Xã Hợp Thành', '19', NULL, NULL),
(604, '05641', 'Xã Vô Tranh', '19', NULL, NULL),
(605, '05662', 'Xã Trại Cau', '19', NULL, NULL),
(606, '05665', 'Xã Văn Lăng', '19', NULL, NULL),
(607, '05674', 'Xã Quang Sơn', '19', NULL, NULL),
(608, '05680', 'Xã Văn Hán', '19', NULL, NULL),
(609, '05692', 'Xã Đồng Hỷ', '19', NULL, NULL),
(610, '05707', 'Xã Nam Hòa', '19', NULL, NULL),
(611, '05710', 'Phường Linh Sơn', '19', NULL, NULL),
(612, '05716', 'Xã Võ Nhai', '19', NULL, NULL),
(613, '05719', 'Xã Sảng Mộc', '19', NULL, NULL),
(614, '05722', 'Xã Nghinh Tường', '19', NULL, NULL),
(615, '05725', 'Xã Thần Sa', '19', NULL, NULL),
(616, '05740', 'Xã La Hiên', '19', NULL, NULL),
(617, '05746', 'Xã Tràng Xá', '19', NULL, NULL),
(618, '05755', 'Xã Dân Tiến', '19', NULL, NULL),
(619, '05773', 'Xã Phú Xuyên', '19', NULL, NULL),
(620, '05776', 'Xã Đức Lương', '19', NULL, NULL),
(621, '05788', 'Xã Phú Lạc', '19', NULL, NULL),
(622, '05800', 'Xã Phú Thịnh', '19', NULL, NULL),
(623, '05809', 'Xã An Khánh', '19', NULL, NULL),
(624, '05818', 'Xã La Bằng', '19', NULL, NULL),
(625, '05830', 'Xã Đại Từ', '19', NULL, NULL),
(626, '05845', 'Xã Vạn Phú', '19', NULL, NULL),
(627, '05851', 'Xã Quân Chu', '19', NULL, NULL),
(628, '05857', 'Phường Phúc Thuận', '19', NULL, NULL),
(629, '05860', 'Phường Phổ Yên', '19', NULL, NULL),
(630, '05881', 'Xã Thành Công', '19', NULL, NULL),
(631, '05890', 'Phường Vạn Xuân', '19', NULL, NULL),
(632, '05899', 'Phường Trung Thành', '19', NULL, NULL),
(633, '05908', 'Xã Phú Bình', '19', NULL, NULL),
(634, '05917', 'Xã Tân Khánh', '19', NULL, NULL),
(635, '05923', 'Xã Tân Thành', '19', NULL, NULL),
(636, '05941', 'Xã Điềm Thụy', '19', NULL, NULL),
(637, '05953', 'Xã Kha Sơn', '19', NULL, NULL),
(638, '05977', 'Phường Đông Kinh', '20', NULL, NULL),
(639, '05983', 'Phường Lương Văn Tri', '20', NULL, NULL),
(640, '05986', 'Phường Tam Thanh', '20', NULL, NULL),
(641, '06001', 'Xã Đoàn Kết', '20', NULL, NULL),
(642, '06004', 'Xã Quốc Khánh', '20', NULL, NULL),
(643, '06019', 'Xã Tân Tiến', '20', NULL, NULL),
(644, '06037', 'Xã Kháng Chiến', '20', NULL, NULL),
(645, '06040', 'Xã Thất Khê', '20', NULL, NULL),
(646, '06046', 'Xã Tràng Định', '20', NULL, NULL),
(647, '06058', 'Xã Quốc Việt', '20', NULL, NULL),
(648, '06073', 'Xã Hoa Thám', '20', NULL, NULL),
(649, '06076', 'Xã Quý Hòa', '20', NULL, NULL),
(650, '06079', 'Xã Hồng Phong', '20', NULL, NULL),
(651, '06085', 'Xã Thiện Hòa', '20', NULL, NULL),
(652, '06091', 'Xã Thiện Thuật', '20', NULL, NULL),
(653, '06103', 'Xã Thiện Long', '20', NULL, NULL),
(654, '06112', 'Xã Bình Gia', '20', NULL, NULL),
(655, '06115', 'Xã Tân Văn', '20', NULL, NULL),
(656, '06124', 'Xã Na Sầm', '20', NULL, NULL),
(657, '06148', 'Xã Thụy Hùng', '20', NULL, NULL),
(658, '06151', 'Xã Hội Hoan', '20', NULL, NULL),
(659, '06154', 'Xã Văn Lãng', '20', NULL, NULL),
(660, '06172', 'Xã Hoàng Văn Thụ', '20', NULL, NULL),
(661, '06184', 'Xã Đồng Đăng', '20', NULL, NULL),
(662, '06187', 'Phường Kỳ Lừa', '20', NULL, NULL),
(663, '06196', 'Xã Ba Sơn', '20', NULL, NULL),
(664, '06211', 'Xã Cao Lộc', '20', NULL, NULL),
(665, '06220', 'Xã Công Sơn', '20', NULL, NULL),
(666, '06253', 'Xã Văn Quan', '20', NULL, NULL),
(667, '06280', 'Xã Điềm He', '20', NULL, NULL),
(668, '06286', 'Xã Khánh Khê', '20', NULL, NULL),
(669, '06298', 'Xã Yên Phúc', '20', NULL, NULL),
(670, '06313', 'Xã Tri Lễ', '20', NULL, NULL),
(671, '06316', 'Xã Tân Đoàn', '20', NULL, NULL),
(672, '06325', 'Xã Bắc Sơn', '20', NULL, NULL),
(673, '06337', 'Xã Tân Tri', '20', NULL, NULL),
(674, '06349', 'Xã Hưng Vũ', '20', NULL, NULL),
(675, '06364', 'Xã Vũ Lễ', '20', NULL, NULL),
(676, '06367', 'Xã Vũ Lăng', '20', NULL, NULL),
(677, '06376', 'Xã Nhất Hòa', '20', NULL, NULL),
(678, '06385', 'Xã Hữu Lũng', '20', NULL, NULL),
(679, '06391', 'Xã Yên Bình', '20', NULL, NULL),
(680, '06400', 'Xã Hữu Liên', '20', NULL, NULL),
(681, '06415', 'Xã Vân Nham', '20', NULL, NULL),
(682, '06427', 'Xã Cai Kinh', '20', NULL, NULL),
(683, '06436', 'Xã Thiện Tân', '20', NULL, NULL),
(684, '06445', 'Xã Tân Thành', '20', NULL, NULL),
(685, '06457', 'Xã Tuấn Sơn', '20', NULL, NULL),
(686, '06463', 'Xã Chi Lăng', '20', NULL, NULL),
(687, '06475', 'Xã Bằng Mạc', '20', NULL, NULL),
(688, '06481', 'Xã Chiến Thắng', '20', NULL, NULL),
(689, '06496', 'Xã Nhân Lý', '20', NULL, NULL),
(690, '06505', 'Xã Vạn Linh', '20', NULL, NULL),
(691, '06517', 'Xã Quan Sơn', '20', NULL, NULL),
(692, '06526', 'Xã Na Dương', '20', NULL, NULL),
(693, '06529', 'Xã Lộc Bình', '20', NULL, NULL),
(694, '06541', 'Xã Mẫu Sơn', '20', NULL, NULL),
(695, '06565', 'Xã Khuất Xá', '20', NULL, NULL),
(696, '06577', 'Xã Thống Nhất', '20', NULL, NULL),
(697, '06601', 'Xã Lợi Bác', '20', NULL, NULL),
(698, '06607', 'Xã Xuân Dương', '20', NULL, NULL),
(699, '06613', 'Xã Đình Lập', '20', NULL, NULL),
(700, '06616', 'Xã Thái Bình', '20', NULL, NULL),
(701, '06625', 'Xã Kiên Mộc', '20', NULL, NULL),
(702, '06637', 'Xã Châu Sơn', '20', NULL, NULL),
(703, '06652', 'Phường Hà Tu', '22', NULL, NULL),
(704, '06658', 'Phường Cao Xanh', '22', NULL, NULL),
(705, '06661', 'Phường Việt Hưng', '22', NULL, NULL),
(706, '06673', 'Phường Bãi Cháy', '22', NULL, NULL),
(707, '06676', 'Phường Hà Lầm', '22', NULL, NULL),
(708, '06685', 'Phường Hồng Gai', '22', NULL, NULL),
(709, '06688', 'Phường Hạ Long', '22', NULL, NULL),
(710, '06706', 'Phường Tuần Châu', '22', NULL, NULL),
(711, '06709', 'Phường Móng Cái 2', '22', NULL, NULL),
(712, '06712', 'Phường Móng Cái 1', '22', NULL, NULL),
(713, '06724', 'Xã Hải Sơn', '22', NULL, NULL),
(714, '06733', 'Xã Hải Ninh', '22', NULL, NULL),
(715, '06736', 'Phường Móng Cái 3', '22', NULL, NULL),
(716, '06757', 'Xã Vĩnh Thực', '22', NULL, NULL),
(717, '06760', 'Phường Mông Dương', '22', NULL, NULL),
(718, '06778', 'Phường Quang Hanh', '22', NULL, NULL),
(719, '06781', 'Phường Cửa Ông', '22', NULL, NULL),
(720, '06793', 'Phường Cẩm Phả', '22', NULL, NULL),
(721, '06799', 'Xã Hải Hòa', '22', NULL, NULL),
(722, '06811', 'Phường Uông Bí', '22', NULL, NULL),
(723, '06820', 'Phường Vàng Danh', '22', NULL, NULL),
(724, '06832', 'Phường Yên Tử', '22', NULL, NULL),
(725, '06838', 'Xã Bình Liêu', '22', NULL, NULL),
(726, '06841', 'Xã Hoành Mô', '22', NULL, NULL),
(727, '06856', 'Xã Lục Hồn', '22', NULL, NULL),
(728, '06862', 'Xã Tiên Yên', '22', NULL, NULL),
(729, '06874', 'Xã Điền Xá', '22', NULL, NULL),
(730, '06877', 'Xã Đông Ngũ', '22', NULL, NULL),
(731, '06886', 'Xã Hải Lạng', '22', NULL, NULL),
(732, '06895', 'Xã Đầm Hà', '22', NULL, NULL),
(733, '06913', 'Xã Quảng Tân', '22', NULL, NULL),
(734, '06922', 'Xã Quảng Hà', '22', NULL, NULL),
(735, '06931', 'Xã Quảng Đức', '22', NULL, NULL),
(736, '06946', 'Xã Đường Hoa', '22', NULL, NULL),
(737, '06967', 'Xã Cái Chiên', '22', NULL, NULL),
(738, '06970', 'Xã Ba Chẽ', '22', NULL, NULL),
(739, '06979', 'Xã Kỳ Thượng', '22', NULL, NULL),
(740, '06985', 'Xã Lương Minh', '22', NULL, NULL),
(741, '06994', 'Đặc khu Vân Đồn', '22', NULL, NULL),
(742, '07030', 'Phường Hoành Bồ', '22', NULL, NULL),
(743, '07054', 'Xã Quảng La', '22', NULL, NULL),
(744, '07060', 'Xã Thống Nhất', '22', NULL, NULL),
(745, '07069', 'Phường Mạo Khê', '22', NULL, NULL),
(746, '07081', 'Phường Bình Khê', '22', NULL, NULL),
(747, '07090', 'Phường An Sinh', '22', NULL, NULL),
(748, '07093', 'Phường Đông Triều', '22', NULL, NULL),
(749, '07114', 'Phường Hoàng Quế', '22', NULL, NULL),
(750, '07132', 'Phường Quảng Yên', '22', NULL, NULL),
(751, '07135', 'Phường Đông Mai', '22', NULL, NULL),
(752, '07147', 'Phường Hiệp Hòa', '22', NULL, NULL),
(753, '07168', 'Phường Hà An', '22', NULL, NULL),
(754, '07180', 'Phường Liên Hòa', '22', NULL, NULL),
(755, '07183', 'Phường Phong Cốc', '22', NULL, NULL),
(756, '07192', 'Đặc khu Cô Tô', '22', NULL, NULL),
(757, '07210', 'Phường Bắc Giang', '24', NULL, NULL),
(758, '07228', 'Phường Đa Mai', '24', NULL, NULL),
(759, '07246', 'Xã Xuân Lương', '24', NULL, NULL),
(760, '07264', 'Xã Tam Tiến', '24', NULL, NULL),
(761, '07282', 'Xã Đồng Kỳ', '24', NULL, NULL),
(762, '07288', 'Xã Yên Thế', '24', NULL, NULL),
(763, '07294', 'Xã Bố Hạ', '24', NULL, NULL),
(764, '07306', 'Xã Nhã Nam', '24', NULL, NULL),
(765, '07330', 'Xã Phúc Hòa', '24', NULL, NULL),
(766, '07333', 'Xã Quang Trung', '24', NULL, NULL),
(767, '07339', 'Xã Tân Yên', '24', NULL, NULL),
(768, '07351', 'Xã Ngọc Thiện', '24', NULL, NULL),
(769, '07375', 'Xã Lạng Giang', '24', NULL, NULL),
(770, '07381', 'Xã Tiên Lục', '24', NULL, NULL),
(771, '07399', 'Xã Kép', '24', NULL, NULL),
(772, '07420', 'Xã Mỹ Thái', '24', NULL, NULL),
(773, '07432', 'Xã Tân Dĩnh', '24', NULL, NULL),
(774, '07444', 'Xã Lục Nam', '24', NULL, NULL),
(775, '07450', 'Xã Đông Phú', '24', NULL, NULL),
(776, '07462', 'Xã Bảo Đài', '24', NULL, NULL),
(777, '07486', 'Xã Nghĩa Phương', '24', NULL, NULL),
(778, '07489', 'Xã Trường Sơn', '24', NULL, NULL),
(779, '07492', 'Xã Lục Sơn', '24', NULL, NULL),
(780, '07498', 'Xã Bắc Lũng', '24', NULL, NULL),
(781, '07519', 'Xã Cẩm Lý', '24', NULL, NULL),
(782, '07525', 'Phường Chũ', '24', NULL, NULL),
(783, '07531', 'Xã Tân Sơn', '24', NULL, NULL),
(784, '07534', 'Xã Sa Lý', '24', NULL, NULL),
(785, '07537', 'Xã Biên Sơn', '24', NULL, NULL),
(786, '07543', 'Xã Sơn Hải', '24', NULL, NULL),
(787, '07552', 'Xã Kiên Lao', '24', NULL, NULL),
(788, '07573', 'Xã Biển Động', '24', NULL, NULL),
(789, '07582', 'Xã Lục Ngạn', '24', NULL, NULL),
(790, '07594', 'Xã Đèo Gia', '24', NULL, NULL),
(791, '07603', 'Xã Nam Dương', '24', NULL, NULL),
(792, '07612', 'Phường Phượng Sơn', '24', NULL, NULL),
(793, '07615', 'Xã Sơn Động', '24', NULL, NULL),
(794, '07616', 'Xã Tây Yên Tử', '24', NULL, NULL),
(795, '07621', 'Xã Vân Sơn', '24', NULL, NULL),
(796, '07627', 'Xã Đại Sơn', '24', NULL, NULL),
(797, '07642', 'Xã Yên Định', '24', NULL, NULL),
(798, '07654', 'Xã An Lạc', '24', NULL, NULL),
(799, '07663', 'Xã Tuấn Đạo', '24', NULL, NULL),
(800, '07672', 'Xã Dương Hưu', '24', NULL, NULL),
(801, '07681', 'Phường Yên Dũng', '24', NULL, NULL),
(802, '07682', 'Phường Tân An', '24', NULL, NULL),
(803, '07696', 'Phường Tiền Phong', '24', NULL, NULL),
(804, '07699', 'Phường Tân Tiến', '24', NULL, NULL),
(805, '07735', 'Xã Đồng Việt', '24', NULL, NULL),
(806, '07738', 'Phường Cảnh Thụy', '24', NULL, NULL),
(807, '07774', 'Phường Tự Lạn', '24', NULL, NULL),
(808, '07777', 'Phường Việt Yên', '24', NULL, NULL),
(809, '07795', 'Phường Nếnh', '24', NULL, NULL),
(810, '07798', 'Phường Vân Hà', '24', NULL, NULL),
(811, '07822', 'Xã Hoàng Vân', '24', NULL, NULL),
(812, '07840', 'Xã Hiệp Hòa', '24', NULL, NULL),
(813, '07864', 'Xã Hợp Thịnh', '24', NULL, NULL),
(814, '07870', 'Xã Xuân Cẩm', '24', NULL, NULL),
(815, '07894', 'Phường Nông Trang', '25', NULL, NULL),
(816, '07900', 'Phường Việt Trì', '25', NULL, NULL),
(817, '07909', 'Phường Thanh Miếu', '25', NULL, NULL),
(818, '07918', 'Phường Vân Phú', '25', NULL, NULL),
(819, '07942', 'Phường Phú Thọ', '25', NULL, NULL),
(820, '07948', 'Phường Âu Cơ', '25', NULL, NULL),
(821, '07954', 'Phường Phong Châu', '25', NULL, NULL),
(822, '07969', 'Xã Đoan Hùng', '25', NULL, NULL),
(823, '07996', 'Xã Bằng Luân', '25', NULL, NULL),
(824, '07999', 'Xã Chí Đám', '25', NULL, NULL),
(825, '08023', 'Xã Tây Cốc', '25', NULL, NULL),
(826, '08038', 'Xã Chân Mộng', '25', NULL, NULL),
(827, '08053', 'Xã Hạ Hòa', '25', NULL, NULL),
(828, '08071', 'Xã Đan Thượng', '25', NULL, NULL),
(829, '08110', 'Xã Hiền Lương', '25', NULL, NULL),
(830, '08113', 'Xã Yên Kỳ', '25', NULL, NULL),
(831, '08134', 'Xã Văn Lang', '25', NULL, NULL),
(832, '08143', 'Xã Vĩnh Chân', '25', NULL, NULL),
(833, '08152', 'Xã Thanh Ba', '25', NULL, NULL),
(834, '08173', 'Xã Quảng Yên', '25', NULL, NULL),
(835, '08203', 'Xã Hoàng Cương', '25', NULL, NULL),
(836, '08209', 'Xã Đông Thành', '25', NULL, NULL),
(837, '08218', 'Xã Chí Tiên', '25', NULL, NULL),
(838, '08227', 'Xã Liên Minh', '25', NULL, NULL),
(839, '08230', 'Xã Phù Ninh', '25', NULL, NULL),
(840, '08236', 'Xã Phú Mỹ', '25', NULL, NULL),
(841, '08245', 'Xã Trạm Thản', '25', NULL, NULL),
(842, '08254', 'Xã Dân Chủ', '25', NULL, NULL),
(843, '08275', 'Xã Bình Phú', '25', NULL, NULL),
(844, '08290', 'Xã Yên Lập', '25', NULL, NULL),
(845, '08296', 'Xã Sơn Lương', '25', NULL, NULL),
(846, '08305', 'Xã Xuân Viên', '25', NULL, NULL),
(847, '08311', 'Xã Trung Sơn', '25', NULL, NULL),
(848, '08323', 'Xã Thượng Long', '25', NULL, NULL),
(849, '08338', 'Xã Minh Hòa', '25', NULL, NULL),
(850, '08341', 'Xã Cẩm Khê', '25', NULL, NULL),
(851, '08344', 'Xã Tiên Lương', '25', NULL, NULL),
(852, '08377', 'Xã Vân Bán', '25', NULL, NULL),
(853, '08398', 'Xã Phú Khê', '25', NULL, NULL),
(854, '08416', 'Xã Hùng Việt', '25', NULL, NULL),
(855, '08431', 'Xã Đồng Lương', '25', NULL, NULL),
(856, '08434', 'Xã Tam Nông', '25', NULL, NULL),
(857, '08443', 'Xã Hiền Quan', '25', NULL, NULL),
(858, '08467', 'Xã Vạn Xuân', '25', NULL, NULL),
(859, '08479', 'Xã Thọ Văn', '25', NULL, NULL),
(860, '08494', 'Xã Lâm Thao', '25', NULL, NULL),
(861, '08500', 'Xã Xuân Lũng', '25', NULL, NULL),
(862, '08515', 'Xã Hy Cương', '25', NULL, NULL),
(863, '08521', 'Xã Phùng Nguyên', '25', NULL, NULL),
(864, '08527', 'Xã Bản Nguyên', '25', NULL, NULL),
(865, '08542', 'Xã Thanh Sơn', '25', NULL, NULL),
(866, '08545', 'Xã Thu Cúc', '25', NULL, NULL),
(867, '08560', 'Xã Lai Đồng', '25', NULL, NULL),
(868, '08566', 'Xã Tân Sơn', '25', NULL, NULL),
(869, '08584', 'Xã Võ Miếu', '25', NULL, NULL),
(870, '08590', 'Xã Xuân Đài', '25', NULL, NULL),
(871, '08593', 'Xã Minh Đài', '25', NULL, NULL),
(872, '08611', 'Xã Văn Miếu', '25', NULL, NULL),
(873, '08614', 'Xã Cự Đồng', '25', NULL, NULL),
(874, '08620', 'Xã Long Cốc', '25', NULL, NULL),
(875, '08632', 'Xã Hương Cần', '25', NULL, NULL),
(876, '08635', 'Xã Khả Cửu', '25', NULL, NULL),
(877, '08656', 'Xã Yên Sơn', '25', NULL, NULL),
(878, '08662', 'Xã Đào Xá', '25', NULL, NULL),
(879, '08674', 'Xã Thanh Thủy', '25', NULL, NULL),
(880, '08686', 'Xã Tu Vũ', '25', NULL, NULL),
(881, '08707', 'Phường Vĩnh Yên', '25', NULL, NULL),
(882, '08716', 'Phường Vĩnh Phúc', '25', NULL, NULL),
(883, '08740', 'Phường Phúc Yên', '25', NULL, NULL),
(884, '08746', 'Phường Xuân Hòa', '25', NULL, NULL),
(885, '08761', 'Xã Lập Thạch', '25', NULL, NULL),
(886, '08770', 'Xã Hợp Lý', '25', NULL, NULL),
(887, '08773', 'Xã Yên Lãng', '25', NULL, NULL),
(888, '08782', 'Xã Hải Lựu', '25', NULL, NULL),
(889, '08788', 'Xã Thái Hòa', '25', NULL, NULL),
(890, '08812', 'Xã Liên Hòa', '25', NULL, NULL),
(891, '08824', 'Xã Tam Sơn', '25', NULL, NULL),
(892, '08842', 'Xã Tiên Lữ', '25', NULL, NULL),
(893, '08848', 'Xã Sông Lô', '25', NULL, NULL),
(894, '08866', 'Xã Sơn Đông', '25', NULL, NULL),
(895, '08869', 'Xã Tam Dương', '25', NULL, NULL),
(896, '08872', 'Xã Tam Dương Bắc', '25', NULL, NULL),
(897, '08896', 'Xã Hoàng An', '25', NULL, NULL),
(898, '08905', 'Xã Hội Thịnh', '25', NULL, NULL),
(899, '08911', 'Xã Tam Đảo', '25', NULL, NULL),
(900, '08914', 'Xã Đạo Trù', '25', NULL, NULL),
(901, '08923', 'Xã Đại Đình', '25', NULL, NULL),
(902, '08935', 'Xã Bình Nguyên', '25', NULL, NULL),
(903, '08944', 'Xã Bình Tuyền', '25', NULL, NULL),
(904, '08950', 'Xã Bình Xuyên', '25', NULL, NULL),
(905, '08971', 'Xã Xuân Lãng', '25', NULL, NULL),
(906, '08974', 'Xã Quang Minh', '01', NULL, NULL),
(907, '08980', 'Xã Yên Lãng', '01', NULL, NULL),
(908, '08995', 'Xã Tiến Thắng', '01', NULL, NULL),
(909, '09022', 'Xã Mê Linh', '01', NULL, NULL),
(910, '09025', 'Xã Yên Lạc', '25', NULL, NULL),
(911, '09040', 'Xã Tề Lỗ', '25', NULL, NULL),
(912, '09043', 'Xã Tam Hồng', '25', NULL, NULL),
(913, '09052', 'Xã Nguyệt Đức', '25', NULL, NULL),
(914, '09064', 'Xã Liên Châu', '25', NULL, NULL),
(915, '09076', 'Xã Vĩnh Tường', '25', NULL, NULL),
(916, '09079', 'Xã Vĩnh An', '25', NULL, NULL),
(917, '09100', 'Xã Vĩnh Hưng', '25', NULL, NULL),
(918, '09106', 'Xã Vĩnh Thành', '25', NULL, NULL),
(919, '09112', 'Xã Thổ Tang', '25', NULL, NULL),
(920, '09154', 'Xã Vĩnh Phú', '25', NULL, NULL),
(921, '09169', 'Phường Vũ Ninh', '24', NULL, NULL),
(922, '09187', 'Phường Kinh Bắc', '24', NULL, NULL),
(923, '09190', 'Phường Võ Cường', '24', NULL, NULL),
(924, '09193', 'Xã Yên Phong', '24', NULL, NULL),
(925, '09202', 'Xã Tam Giang', '24', NULL, NULL),
(926, '09205', 'Xã Yên Trung', '24', NULL, NULL),
(927, '09208', 'Xã Tam Đa', '24', NULL, NULL),
(928, '09238', 'Xã Văn Môn', '24', NULL, NULL),
(929, '09247', 'Phường Quế Võ', '24', NULL, NULL),
(930, '09253', 'Phường Nhân Hòa', '24', NULL, NULL),
(931, '09265', 'Phường Phương Liễu', '24', NULL, NULL),
(932, '09286', 'Phường Nam Sơn', '24', NULL, NULL),
(933, '09292', 'Xã Phù Lãng', '24', NULL, NULL),
(934, '09295', 'Phường Bồng Lai', '24', NULL, NULL),
(935, '09301', 'Phường Đào Viên', '24', NULL, NULL),
(936, '09313', 'Xã Chi Lăng', '24', NULL, NULL),
(937, '09319', 'Xã Tiên Du', '24', NULL, NULL),
(938, '09325', 'Phường Hạp Lĩnh', '24', NULL, NULL),
(939, '09334', 'Xã Liên Bão', '24', NULL, NULL),
(940, '09340', 'Xã Đại Đồng', '24', NULL, NULL),
(941, '09343', 'Xã Tân Chi', '24', NULL, NULL),
(942, '09349', 'Xã Phật Tích', '24', NULL, NULL),
(943, '09367', 'Phường Từ Sơn', '24', NULL, NULL),
(944, '09370', 'Phường Tam Sơn', '24', NULL, NULL),
(945, '09379', 'Phường Phù Khê', '24', NULL, NULL),
(946, '09385', 'Phường Đồng Nguyên', '24', NULL, NULL),
(947, '09400', 'Phường Thuận Thành', '24', NULL, NULL),
(948, '09409', 'Phường Mão Điền', '24', NULL, NULL),
(949, '09427', 'Phường Trí Quả', '24', NULL, NULL),
(950, '09430', 'Phường Trạm Lộ', '24', NULL, NULL),
(951, '09433', 'Phường Song Liễu', '24', NULL, NULL),
(952, '09445', 'Phường Ninh Xá', '24', NULL, NULL),
(953, '09454', 'Xã Gia Bình', '24', NULL, NULL),
(954, '09466', 'Xã Cao Đức', '24', NULL, NULL),
(955, '09469', 'Xã Đại Lai', '24', NULL, NULL),
(956, '09475', 'Xã Nhân Thắng', '24', NULL, NULL),
(957, '09487', 'Xã Đông Cứu', '24', NULL, NULL),
(958, '09496', 'Xã Lương Tài', '24', NULL, NULL),
(959, '09499', 'Xã Trung Kênh', '24', NULL, NULL),
(960, '09523', 'Xã Trung Chính', '24', NULL, NULL),
(961, '09529', 'Xã Lâm Thao', '24', NULL, NULL),
(962, '09552', 'Phường Kiến Hưng', '01', NULL, NULL),
(963, '09556', 'Phường Hà Đông', '01', NULL, NULL),
(964, '09562', 'Phường Yên Nghĩa', '01', NULL, NULL),
(965, '09568', 'Phường Phú Lương', '01', NULL, NULL),
(966, '09574', 'Phường Sơn Tây', '01', NULL, NULL),
(967, '09604', 'Phường Tùng Thiện', '01', NULL, NULL),
(968, '09616', 'Xã Đoài Phương', '01', NULL, NULL),
(969, '09619', 'Xã Quảng Oai', '01', NULL, NULL),
(970, '09634', 'Xã Cổ Đô', '01', NULL, NULL),
(971, '09661', 'Xã Minh Châu', '01', NULL, NULL),
(972, '09664', 'Xã Vật Lại', '01', NULL, NULL),
(973, '09676', 'Xã Bất Bạt', '01', NULL, NULL),
(974, '09694', 'Xã Suối Hai', '01', NULL, NULL),
(975, '09700', 'Xã Ba Vì', '01', NULL, NULL),
(976, '09706', 'Xã Yên Bài', '01', NULL, NULL),
(977, '09715', 'Xã Phúc Thọ', '01', NULL, NULL),
(978, '09739', 'Xã Phúc Lộc', '01', NULL, NULL),
(979, '09772', 'Xã Hát Môn', '01', NULL, NULL),
(980, '09784', 'Xã Đan Phượng', '01', NULL, NULL),
(981, '09787', 'Xã Liên Minh', '01', NULL, NULL),
(982, '09817', 'Xã Ô Diên', '01', NULL, NULL),
(983, '09832', 'Xã Hoài Đức', '01', NULL, NULL),
(984, '09856', 'Xã Dương Hòa', '01', NULL, NULL),
(985, '09871', 'Xã Sơn Đồng', '01', NULL, NULL),
(986, '09877', 'Xã An Khánh', '01', NULL, NULL),
(987, '09886', 'Phường Dương Nội', '01', NULL, NULL),
(988, '09895', 'Xã Quốc Oai', '01', NULL, NULL),
(989, '09910', 'Xã Kiều Phú', '01', NULL, NULL),
(990, '09931', 'Xã Hưng Đạo', '01', NULL, NULL),
(991, '09952', 'Xã Phú Cát', '01', NULL, NULL),
(992, '09955', 'Xã Thạch Thất', '01', NULL, NULL),
(993, '09982', 'Xã Hạ Bằng', '01', NULL, NULL),
(994, '09988', 'Xã Hòa Lạc', '01', NULL, NULL),
(995, '10003', 'Xã Tây Phương', '01', NULL, NULL),
(996, '10015', 'Phường Chương Mỹ', '01', NULL, NULL),
(997, '10030', 'Xã Phú Nghĩa', '01', NULL, NULL),
(998, '10045', 'Xã Xuân Mai', '01', NULL, NULL),
(999, '10072', 'Xã Quảng Bị', '01', NULL, NULL),
(1000, '10081', 'Xã Trần Phú', '01', NULL, NULL),
(1001, '10096', 'Xã Hòa Phú', '01', NULL, NULL),
(1002, '10114', 'Xã Thanh Oai', '01', NULL, NULL),
(1003, '10126', 'Xã Bình Minh', '01', NULL, NULL),
(1004, '10144', 'Xã Tam Hưng', '01', NULL, NULL),
(1005, '10180', 'Xã Dân Hòa', '01', NULL, NULL),
(1006, '10183', 'Xã Thường Tín', '01', NULL, NULL),
(1007, '10210', 'Xã Hồng Vân', '01', NULL, NULL),
(1008, '10231', 'Xã Thượng Phúc', '01', NULL, NULL),
(1009, '10237', 'Xã Chương Dương', '01', NULL, NULL),
(1010, '10273', 'Xã Phú Xuyên', '01', NULL, NULL),
(1011, '10279', 'Xã Phượng Dực', '01', NULL, NULL),
(1012, '10330', 'Xã Chuyên Mỹ', '01', NULL, NULL),
(1013, '10342', 'Xã Đại Xuyên', '01', NULL, NULL),
(1014, '10354', 'Xã Vân Đình', '01', NULL, NULL),
(1015, '10369', 'Xã Ứng Thiên', '01', NULL, NULL),
(1016, '10402', 'Xã Ứng Hòa', '01', NULL, NULL),
(1017, '10417', 'Xã Hòa Xá', '01', NULL, NULL),
(1018, '10441', 'Xã Mỹ Đức', '01', NULL, NULL),
(1019, '10459', 'Xã Phúc Sơn', '01', NULL, NULL),
(1020, '10465', 'Xã Hồng Sơn', '01', NULL, NULL),
(1021, '10489', 'Xã Hương Sơn', '01', NULL, NULL),
(1022, '10507', 'Phường Thành Đông', '31', NULL, NULL),
(1023, '10525', 'Phường Hải Dương', '31', NULL, NULL),
(1024, '10532', 'Phường Lê Thanh Nghị', '31', NULL, NULL),
(1025, '10537', 'Phường Tân Hưng', '31', NULL, NULL),
(1026, '10543', 'Phường Việt Hòa', '31', NULL, NULL),
(1027, '10546', 'Phường Chí Linh', '31', NULL, NULL),
(1028, '10549', 'Phường Chu Văn An', '31', NULL, NULL),
(1029, '10552', 'Phường Nguyễn Trãi', '31', NULL, NULL),
(1030, '10570', 'Phường Trần Hưng Đạo', '31', NULL, NULL),
(1031, '10573', 'Phường Trần Nhân Tông', '31', NULL, NULL),
(1032, '10603', 'Phường Lê Đại Hành', '31', NULL, NULL),
(1033, '10606', 'Xã Nam Sách', '31', NULL, NULL),
(1034, '10615', 'Xã Hợp Tiến', '31', NULL, NULL),
(1035, '10633', 'Xã Trần Phú', '31', NULL, NULL),
(1036, '10642', 'Xã Thái Tân', '31', NULL, NULL),
(1037, '10645', 'Xã An Phú', '31', NULL, NULL),
(1038, '10660', 'Phường Ái Quốc', '31', NULL, NULL),
(1039, '10675', 'Phường Kinh Môn', '31', NULL, NULL);
INSERT INTO `wards` (`id`, `ward_code`, `name`, `province_code`, `created_at`, `updated_at`) VALUES
(1040, '10678', 'Phường Bắc An Phụ', '31', NULL, NULL),
(1041, '10705', 'Xã Nam An Phụ', '31', NULL, NULL),
(1042, '10714', 'Phường Nhị Chiểu', '31', NULL, NULL),
(1043, '10726', 'Phường Phạm Sư Mạnh', '31', NULL, NULL),
(1044, '10729', 'Phường Trần Liễu', '31', NULL, NULL),
(1045, '10744', 'Phường Nguyễn Đại Năng', '31', NULL, NULL),
(1046, '10750', 'Xã Phú Thái', '31', NULL, NULL),
(1047, '10756', 'Xã Lai Khê', '31', NULL, NULL),
(1048, '10792', 'Xã An Thành', '31', NULL, NULL),
(1049, '10804', 'Xã Kim Thành', '31', NULL, NULL),
(1050, '10813', 'Xã Thanh Hà', '31', NULL, NULL),
(1051, '10816', 'Xã Hà Bắc', '31', NULL, NULL),
(1052, '10837', 'Phường Nam Đồng', '31', NULL, NULL),
(1053, '10843', 'Xã Hà Nam', '31', NULL, NULL),
(1054, '10846', 'Xã Hà Tây', '31', NULL, NULL),
(1055, '10882', 'Xã Hà Đông', '31', NULL, NULL),
(1056, '10888', 'Xã Cẩm Giang', '31', NULL, NULL),
(1057, '10891', 'Phường Tứ Minh', '31', NULL, NULL),
(1058, '10903', 'Xã Cẩm Giàng', '31', NULL, NULL),
(1059, '10909', 'Xã Tuệ Tĩnh', '31', NULL, NULL),
(1060, '10930', 'Xã Mao Điền', '31', NULL, NULL),
(1061, '10945', 'Xã Kẻ Sặt', '31', NULL, NULL),
(1062, '10966', 'Xã Bình Giang', '31', NULL, NULL),
(1063, '10972', 'Xã Đường An', '31', NULL, NULL),
(1064, '10993', 'Xã Thượng Hồng', '31', NULL, NULL),
(1065, '10999', 'Xã Gia Lộc', '31', NULL, NULL),
(1066, '11002', 'Phường Thạch Khôi', '31', NULL, NULL),
(1067, '11020', 'Xã Yết Kiêu', '31', NULL, NULL),
(1068, '11050', 'Xã Gia Phúc', '31', NULL, NULL),
(1069, '11065', 'Xã Trường Tân', '31', NULL, NULL),
(1070, '11074', 'Xã Tứ Kỳ', '31', NULL, NULL),
(1071, '11086', 'Xã Đại Sơn', '31', NULL, NULL),
(1072, '11113', 'Xã Tân Kỳ', '31', NULL, NULL),
(1073, '11131', 'Xã Chí Minh', '31', NULL, NULL),
(1074, '11140', 'Xã Lạc Phượng', '31', NULL, NULL),
(1075, '11146', 'Xã Nguyên Giáp', '31', NULL, NULL),
(1076, '11164', 'Xã Vĩnh Lại', '31', NULL, NULL),
(1077, '11167', 'Xã Tân An', '31', NULL, NULL),
(1078, '11203', 'Xã Ninh Giang', '31', NULL, NULL),
(1079, '11218', 'Xã Hồng Châu', '31', NULL, NULL),
(1080, '11224', 'Xã Khúc Thừa Dụ', '31', NULL, NULL),
(1081, '11239', 'Xã Thanh Miện', '31', NULL, NULL),
(1082, '11242', 'Xã Nguyễn Lương Bằng', '31', NULL, NULL),
(1083, '11254', 'Xã Bắc Thanh Miện', '31', NULL, NULL),
(1084, '11257', 'Xã Hải Hưng', '31', NULL, NULL),
(1085, '11284', 'Xã Nam Thanh Miện', '31', NULL, NULL),
(1086, '11311', 'Phường Hồng Bàng', '31', NULL, NULL),
(1087, '11329', 'Phường Ngô Quyền', '31', NULL, NULL),
(1088, '11359', 'Phường Gia Viên', '31', NULL, NULL),
(1089, '11383', 'Phường Lê Chân', '31', NULL, NULL),
(1090, '11407', 'Phường An Biên', '31', NULL, NULL),
(1091, '11411', 'Phường Đông Hải', '31', NULL, NULL),
(1092, '11413', 'Phường Hải An', '31', NULL, NULL),
(1093, '11443', 'Phường Kiến An', '31', NULL, NULL),
(1094, '11446', 'Phường Phù Liễn', '31', NULL, NULL),
(1095, '11455', 'Phường Đồ Sơn', '31', NULL, NULL),
(1096, '11473', 'Phường Bạch Đằng', '31', NULL, NULL),
(1097, '11488', 'Phường Lưu Kiếm', '31', NULL, NULL),
(1098, '11503', 'Xã Việt Khê', '31', NULL, NULL),
(1099, '11506', 'Phường Lê Ích Mộc', '31', NULL, NULL),
(1100, '11533', 'Phường Hòa Bình', '31', NULL, NULL),
(1101, '11542', 'Phường Nam Triệu', '31', NULL, NULL),
(1102, '11557', 'Phường Thiên Hương', '31', NULL, NULL),
(1103, '11560', 'Phường Thủy Nguyên', '31', NULL, NULL),
(1104, '11581', 'Phường An Dương', '31', NULL, NULL),
(1105, '11593', 'Phường An Phong', '31', NULL, NULL),
(1106, '11602', 'Phường Hồng An', '31', NULL, NULL),
(1107, '11617', 'Phường An Hải', '31', NULL, NULL),
(1108, '11629', 'Xã An Lão', '31', NULL, NULL),
(1109, '11635', 'Xã An Trường', '31', NULL, NULL),
(1110, '11647', 'Xã An Quang', '31', NULL, NULL),
(1111, '11668', 'Xã An Khánh', '31', NULL, NULL),
(1112, '11674', 'Xã An Hưng', '31', NULL, NULL),
(1113, '11680', 'Xã Kiến Thụy', '31', NULL, NULL),
(1114, '11689', 'Phường Hưng Đạo', '31', NULL, NULL),
(1115, '11692', 'Phường Dương Kinh', '31', NULL, NULL),
(1116, '11713', 'Xã Nghi Dương', '31', NULL, NULL),
(1117, '11725', 'Xã Kiến Minh', '31', NULL, NULL),
(1118, '11728', 'Xã Kiến Hưng', '31', NULL, NULL),
(1119, '11737', 'Phường Nam Đồ Sơn', '31', NULL, NULL),
(1120, '11749', 'Xã Kiến Hải', '31', NULL, NULL),
(1121, '11755', 'Xã Tiên Lãng', '31', NULL, NULL),
(1122, '11761', 'Xã Quyết Thắng', '31', NULL, NULL),
(1123, '11779', 'Xã Tân Minh', '31', NULL, NULL),
(1124, '11791', 'Xã Tiên Minh', '31', NULL, NULL),
(1125, '11806', 'Xã Chấn Hưng', '31', NULL, NULL),
(1126, '11809', 'Xã Hùng Thắng', '31', NULL, NULL),
(1127, '11824', 'Xã Vĩnh Bảo', '31', NULL, NULL),
(1128, '11836', 'Xã Vĩnh Thịnh', '31', NULL, NULL),
(1129, '11842', 'Xã Vĩnh Thuận', '31', NULL, NULL),
(1130, '11848', 'Xã Vĩnh Hòa', '31', NULL, NULL),
(1131, '11875', 'Xã Vĩnh Hải', '31', NULL, NULL),
(1132, '11887', 'Xã Vĩnh Am', '31', NULL, NULL),
(1133, '11911', 'Xã Nguyễn Bỉnh Khiêm', '31', NULL, NULL),
(1134, '11914', 'Đặc khu Cát Hải', '31', NULL, NULL),
(1135, '11948', 'Đặc khu Bạch Long Vĩ', '31', NULL, NULL),
(1136, '11953', 'Phường Phố Hiến', '33', NULL, NULL),
(1137, '11977', 'Xã Tân Hưng', '33', NULL, NULL),
(1138, '11980', 'Phường Hồng Châu', '33', NULL, NULL),
(1139, '11983', 'Phường Sơn Nam', '33', NULL, NULL),
(1140, '11992', 'Xã Lạc Đạo', '33', NULL, NULL),
(1141, '11995', 'Xã Đại Đồng', '33', NULL, NULL),
(1142, '12004', 'Xã Như Quỳnh', '33', NULL, NULL),
(1143, '12019', 'Xã Văn Giang', '33', NULL, NULL),
(1144, '12025', 'Xã Phụng Công', '33', NULL, NULL),
(1145, '12031', 'Xã Nghĩa Trụ', '33', NULL, NULL),
(1146, '12049', 'Xã Mễ Sở', '33', NULL, NULL),
(1147, '12064', 'Xã Nguyễn Văn Linh', '33', NULL, NULL),
(1148, '12070', 'Xã Hoàn Long', '33', NULL, NULL),
(1149, '12073', 'Xã Yên Mỹ', '33', NULL, NULL),
(1150, '12091', 'Xã Việt Yên', '33', NULL, NULL),
(1151, '12103', 'Phường Mỹ Hào', '33', NULL, NULL),
(1152, '12127', 'Phường Thượng Hồng', '33', NULL, NULL),
(1153, '12133', 'Phường Đường Hào', '33', NULL, NULL),
(1154, '12142', 'Xã Ân Thi', '33', NULL, NULL),
(1155, '12148', 'Xã Phạm Ngũ Lão', '33', NULL, NULL),
(1156, '12166', 'Xã Xuân Trúc', '33', NULL, NULL),
(1157, '12184', 'Xã Nguyễn Trãi', '33', NULL, NULL),
(1158, '12196', 'Xã Hồng Quang', '33', NULL, NULL),
(1159, '12205', 'Xã Khoái Châu', '33', NULL, NULL),
(1160, '12223', 'Xã Triệu Việt Vương', '33', NULL, NULL),
(1161, '12238', 'Xã Việt Tiến', '33', NULL, NULL),
(1162, '12247', 'Xã Châu Ninh', '33', NULL, NULL),
(1163, '12271', 'Xã Chí Minh', '33', NULL, NULL),
(1164, '12280', 'Xã Lương Bằng', '33', NULL, NULL),
(1165, '12286', 'Xã Nghĩa Dân', '33', NULL, NULL),
(1166, '12313', 'Xã Đức Hợp', '33', NULL, NULL),
(1167, '12322', 'Xã Hiệp Cường', '33', NULL, NULL),
(1168, '12337', 'Xã Hoàng Hoa Thám', '33', NULL, NULL),
(1169, '12361', 'Xã Tiên Hoa', '33', NULL, NULL),
(1170, '12364', 'Xã Tiên Lữ', '33', NULL, NULL),
(1171, '12391', 'Xã Quang Hưng', '33', NULL, NULL),
(1172, '12406', 'Xã Đoàn Đào', '33', NULL, NULL),
(1173, '12424', 'Xã Tiên Tiến', '33', NULL, NULL),
(1174, '12427', 'Xã Tống Trân', '33', NULL, NULL),
(1175, '12452', 'Phường Trần Hưng Đạo', '33', NULL, NULL),
(1176, '12454', 'Phường Trần Lãm', '33', NULL, NULL),
(1177, '12466', 'Phường Vũ Phúc', '33', NULL, NULL),
(1178, '12472', 'Xã Quỳnh Phụ', '33', NULL, NULL),
(1179, '12499', 'Xã A Sào', '33', NULL, NULL),
(1180, '12511', 'Xã Minh Thọ', '33', NULL, NULL),
(1181, '12517', 'Xã Ngọc Lâm', '33', NULL, NULL),
(1182, '12523', 'Xã Phụ Dực', '33', NULL, NULL),
(1183, '12526', 'Xã Đồng Bằng', '33', NULL, NULL),
(1184, '12532', 'Xã Nguyễn Du', '33', NULL, NULL),
(1185, '12577', 'Xã Quỳnh An', '33', NULL, NULL),
(1186, '12583', 'Xã Tân Tiến', '33', NULL, NULL),
(1187, '12586', 'Xã Hưng Hà', '33', NULL, NULL),
(1188, '12595', 'Xã Ngự Thiên', '33', NULL, NULL),
(1189, '12613', 'Xã Long Hưng', '33', NULL, NULL),
(1190, '12619', 'Xã Diên Hà', '33', NULL, NULL),
(1191, '12631', 'Xã Thần Khê', '33', NULL, NULL),
(1192, '12634', 'Xã Tiên La', '33', NULL, NULL),
(1193, '12676', 'Xã Lê Quý Đôn', '33', NULL, NULL),
(1194, '12685', 'Xã Hồng Minh', '33', NULL, NULL),
(1195, '12688', 'Xã Đông Hưng', '33', NULL, NULL),
(1196, '12694', 'Xã Bắc Đông Hưng', '33', NULL, NULL),
(1197, '12700', 'Xã Bắc Tiên Hưng', '33', NULL, NULL),
(1198, '12736', 'Xã Đông Tiên Hưng', '33', NULL, NULL),
(1199, '12745', 'Xã Bắc Đông Quan', '33', NULL, NULL),
(1200, '12754', 'Xã Tiên Hưng', '33', NULL, NULL),
(1201, '12763', 'Xã Nam Tiên Hưng', '33', NULL, NULL),
(1202, '12775', 'Xã Nam Đông Hưng', '33', NULL, NULL),
(1203, '12793', 'Xã Đông Quan', '33', NULL, NULL),
(1204, '12817', 'Phường Trà Lý', '33', NULL, NULL),
(1205, '12826', 'Xã Thái Thụy', '33', NULL, NULL),
(1206, '12850', 'Xã Tây Thụy Anh', '33', NULL, NULL),
(1207, '12859', 'Xã Bắc Thụy Anh', '33', NULL, NULL),
(1208, '12862', 'Xã Đông Thụy Anh', '33', NULL, NULL),
(1209, '12865', 'Xã Thụy Anh', '33', NULL, NULL),
(1210, '12904', 'Xã Nam Thụy Anh', '33', NULL, NULL),
(1211, '12916', 'Xã Bắc Thái Ninh', '33', NULL, NULL),
(1212, '12919', 'Xã Tây Thái Ninh', '33', NULL, NULL),
(1213, '12922', 'Xã Thái Ninh', '33', NULL, NULL),
(1214, '12943', 'Xã Đông Thái Ninh', '33', NULL, NULL),
(1215, '12961', 'Xã Nam Thái Ninh', '33', NULL, NULL),
(1216, '12970', 'Xã Tiền Hải', '33', NULL, NULL),
(1217, '12988', 'Xã Đông Tiền Hải', '33', NULL, NULL),
(1218, '13003', 'Xã Đồng Châu', '33', NULL, NULL),
(1219, '13021', 'Xã Ái Quốc', '33', NULL, NULL),
(1220, '13039', 'Xã Tây Tiền Hải', '33', NULL, NULL),
(1221, '13057', 'Xã Nam Cường', '33', NULL, NULL),
(1222, '13063', 'Xã Nam Tiền Hải', '33', NULL, NULL),
(1223, '13066', 'Xã Hưng Phú', '33', NULL, NULL),
(1224, '13075', 'Xã Kiến Xương', '33', NULL, NULL),
(1225, '13093', 'Xã Trà Giang', '33', NULL, NULL),
(1226, '13096', 'Xã Bình Nguyên', '33', NULL, NULL),
(1227, '13120', 'Xã Lê Lợi', '33', NULL, NULL),
(1228, '13132', 'Xã Quang Lịch', '33', NULL, NULL),
(1229, '13141', 'Xã Vũ Quý', '33', NULL, NULL),
(1230, '13159', 'Xã Hồng Vũ', '33', NULL, NULL),
(1231, '13183', 'Xã Bình Thanh', '33', NULL, NULL),
(1232, '13186', 'Xã Bình Định', '33', NULL, NULL),
(1233, '13192', 'Xã Vũ Thư', '33', NULL, NULL),
(1234, '13219', 'Xã Vạn Xuân', '33', NULL, NULL),
(1235, '13222', 'Xã Thư Trì', '33', NULL, NULL),
(1236, '13225', 'Phường Thái Bình', '33', NULL, NULL),
(1237, '13246', 'Xã Tân Thuận', '33', NULL, NULL),
(1238, '13264', 'Xã Thư Vũ', '33', NULL, NULL),
(1239, '13279', 'Xã Vũ Tiên', '33', NULL, NULL),
(1240, '13285', 'Phường Phủ Lý', '37', NULL, NULL),
(1241, '13291', 'Phường Phù Vân', '37', NULL, NULL),
(1242, '13318', 'Phường Châu Sơn', '37', NULL, NULL),
(1243, '13324', 'Phường Duy Tiên', '37', NULL, NULL),
(1244, '13330', 'Phường Duy Tân', '37', NULL, NULL),
(1245, '13336', 'Phường Duy Hà', '37', NULL, NULL),
(1246, '13348', 'Phường Đồng Văn', '37', NULL, NULL),
(1247, '13363', 'Phường Tiên Sơn', '37', NULL, NULL),
(1248, '13366', 'Phường Hà Nam', '37', NULL, NULL),
(1249, '13384', 'Phường Kim Bảng', '37', NULL, NULL),
(1250, '13393', 'Phường Lê Hồ', '37', NULL, NULL),
(1251, '13396', 'Phường Nguyễn Úy', '37', NULL, NULL),
(1252, '13402', 'Phường Kim Thanh', '37', NULL, NULL),
(1253, '13420', 'Phường Tam Chúc', '37', NULL, NULL),
(1254, '13435', 'Phường Lý Thường Kiệt', '37', NULL, NULL),
(1255, '13444', 'Phường Liêm Tuyền', '37', NULL, NULL),
(1256, '13456', 'Xã Liêm Hà', '37', NULL, NULL),
(1257, '13474', 'Xã Tân Thanh', '37', NULL, NULL),
(1258, '13483', 'Xã Thanh Bình', '37', NULL, NULL),
(1259, '13489', 'Xã Thanh Lâm', '37', NULL, NULL),
(1260, '13495', 'Xã Thanh Liêm', '37', NULL, NULL),
(1261, '13501', 'Xã Bình Mỹ', '37', NULL, NULL),
(1262, '13504', 'Xã Bình Lục', '37', NULL, NULL),
(1263, '13531', 'Xã Bình Giang', '37', NULL, NULL),
(1264, '13540', 'Xã Bình An', '37', NULL, NULL),
(1265, '13558', 'Xã Bình Sơn', '37', NULL, NULL),
(1266, '13573', 'Xã Lý Nhân', '37', NULL, NULL),
(1267, '13579', 'Xã Bắc Lý', '37', NULL, NULL),
(1268, '13591', 'Xã Nam Xang', '37', NULL, NULL),
(1269, '13594', 'Xã Trần Thương', '37', NULL, NULL),
(1270, '13597', 'Xã Vĩnh Trụ', '37', NULL, NULL),
(1271, '13609', 'Xã Nhân Hà', '37', NULL, NULL),
(1272, '13627', 'Xã Nam Lý', '37', NULL, NULL),
(1273, '13669', 'Phường Nam Định', '37', NULL, NULL),
(1274, '13684', 'Phường Thiên Trường', '37', NULL, NULL),
(1275, '13693', 'Phường Đông A', '37', NULL, NULL),
(1276, '13699', 'Phường Thành Nam', '37', NULL, NULL),
(1277, '13708', 'Phường Mỹ Lộc', '37', NULL, NULL),
(1278, '13741', 'Xã Vụ Bản', '37', NULL, NULL),
(1279, '13750', 'Xã Minh Tân', '37', NULL, NULL),
(1280, '13753', 'Xã Hiển Khánh', '37', NULL, NULL),
(1281, '13777', 'Phường Trường Thi', '37', NULL, NULL),
(1282, '13786', 'Xã Liên Minh', '37', NULL, NULL),
(1283, '13795', 'Xã Ý Yên', '37', NULL, NULL),
(1284, '13807', 'Xã Tân Minh', '37', NULL, NULL),
(1285, '13822', 'Xã Phong Doanh', '37', NULL, NULL),
(1286, '13834', 'Xã Vũ Dương', '37', NULL, NULL),
(1287, '13864', 'Xã Vạn Thắng', '37', NULL, NULL),
(1288, '13870', 'Xã Yên Cường', '37', NULL, NULL),
(1289, '13879', 'Xã Yên Đồng', '37', NULL, NULL),
(1290, '13891', 'Xã Nghĩa Hưng', '37', NULL, NULL),
(1291, '13894', 'Xã Rạng Đông', '37', NULL, NULL),
(1292, '13900', 'Xã Đồng Thịnh', '37', NULL, NULL),
(1293, '13918', 'Xã Nghĩa Sơn', '37', NULL, NULL),
(1294, '13927', 'Xã Hồng Phong', '37', NULL, NULL),
(1295, '13939', 'Xã Quỹ Nhất', '37', NULL, NULL),
(1296, '13957', 'Xã Nghĩa Lâm', '37', NULL, NULL),
(1297, '13966', 'Xã Nam Trực', '37', NULL, NULL),
(1298, '13972', 'Phường Vị Khê', '37', NULL, NULL),
(1299, '13984', 'Phường Hồng Quang', '37', NULL, NULL),
(1300, '13987', 'Xã Nam Hồng', '37', NULL, NULL),
(1301, '14005', 'Xã Nam Ninh', '37', NULL, NULL),
(1302, '14011', 'Xã Nam Minh', '37', NULL, NULL),
(1303, '14014', 'Xã Nam Đồng', '37', NULL, NULL),
(1304, '14026', 'Xã Cổ Lễ', '37', NULL, NULL),
(1305, '14038', 'Xã Ninh Giang', '37', NULL, NULL),
(1306, '14053', 'Xã Trực Ninh', '37', NULL, NULL),
(1307, '14056', 'Xã Cát Thành', '37', NULL, NULL),
(1308, '14062', 'Xã Quang Hưng', '37', NULL, NULL),
(1309, '14071', 'Xã Minh Thái', '37', NULL, NULL),
(1310, '14077', 'Xã Ninh Cường', '37', NULL, NULL),
(1311, '14089', 'Xã Xuân Trường', '37', NULL, NULL),
(1312, '14095', 'Xã Xuân Hồng', '37', NULL, NULL),
(1313, '14104', 'Xã Xuân Giang', '37', NULL, NULL),
(1314, '14122', 'Xã Xuân Hưng', '37', NULL, NULL),
(1315, '14161', 'Xã Giao Minh', '37', NULL, NULL),
(1316, '14167', 'Xã Giao Thủy', '37', NULL, NULL),
(1317, '14179', 'Xã Giao Hưng', '37', NULL, NULL),
(1318, '14182', 'Xã Giao Hòa', '37', NULL, NULL),
(1319, '14194', 'Xã Giao Bình', '37', NULL, NULL),
(1320, '14203', 'Xã Giao Phúc', '37', NULL, NULL),
(1321, '14212', 'Xã Giao Ninh', '37', NULL, NULL),
(1322, '14215', 'Xã Hải Hậu', '37', NULL, NULL),
(1323, '14218', 'Xã Hải Tiến', '37', NULL, NULL),
(1324, '14221', 'Xã Hải Thịnh', '37', NULL, NULL),
(1325, '14236', 'Xã Hải Anh', '37', NULL, NULL),
(1326, '14248', 'Xã Hải Hưng', '37', NULL, NULL),
(1327, '14281', 'Xã Hải An', '37', NULL, NULL),
(1328, '14287', 'Xã Hải Quang', '37', NULL, NULL),
(1329, '14308', 'Xã Hải Xuân', '37', NULL, NULL),
(1330, '14329', 'Phường Hoa Lư', '37', NULL, NULL),
(1331, '14359', 'Phường Nam Hoa Lư', '37', NULL, NULL),
(1332, '14362', 'Phường Tam Điệp', '37', NULL, NULL),
(1333, '14365', 'Phường Trung Sơn', '37', NULL, NULL),
(1334, '14371', 'Phường Yên Sơn', '37', NULL, NULL),
(1335, '14389', 'Xã Gia Lâm', '37', NULL, NULL),
(1336, '14401', 'Xã Gia Tường', '37', NULL, NULL),
(1337, '14404', 'Xã Cúc Phương', '37', NULL, NULL),
(1338, '14407', 'Xã Phú Sơn', '37', NULL, NULL),
(1339, '14428', 'Xã Nho Quan', '37', NULL, NULL),
(1340, '14434', 'Xã Thanh Sơn', '37', NULL, NULL),
(1341, '14452', 'Xã Quỳnh Lưu', '37', NULL, NULL),
(1342, '14458', 'Xã Phú Long', '37', NULL, NULL),
(1343, '14464', 'Xã Gia Viễn', '37', NULL, NULL),
(1344, '14482', 'Xã Gia Hưng', '37', NULL, NULL),
(1345, '14488', 'Xã Gia Vân', '37', NULL, NULL),
(1346, '14494', 'Xã Gia Trấn', '37', NULL, NULL),
(1347, '14500', 'Xã Đại Hoàng', '37', NULL, NULL),
(1348, '14524', 'Xã Gia Phong', '37', NULL, NULL),
(1349, '14533', 'Phường Tây Hoa Lư', '37', NULL, NULL),
(1350, '14560', 'Xã Yên Khánh', '37', NULL, NULL),
(1351, '14563', 'Xã Khánh Thiện', '37', NULL, NULL),
(1352, '14566', 'Phường Đông Hoa Lư', '37', NULL, NULL),
(1353, '14608', 'Xã Khánh Trung', '37', NULL, NULL),
(1354, '14611', 'Xã Khánh Nhạc', '37', NULL, NULL),
(1355, '14614', 'Xã Khánh Hội', '37', NULL, NULL),
(1356, '14620', 'Xã Phát Diệm', '37', NULL, NULL),
(1357, '14623', 'Xã Bình Minh', '37', NULL, NULL),
(1358, '14638', 'Xã Kim Sơn', '37', NULL, NULL),
(1359, '14647', 'Xã Quang Thiện', '37', NULL, NULL),
(1360, '14653', 'Xã Chất Bình', '37', NULL, NULL),
(1361, '14674', 'Xã Lai Thành', '37', NULL, NULL),
(1362, '14677', 'Xã Định Hóa', '37', NULL, NULL),
(1363, '14698', 'Xã Kim Đông', '37', NULL, NULL),
(1364, '14701', 'Xã Yên Mô', '37', NULL, NULL),
(1365, '14725', 'Phường Yên Thắng', '37', NULL, NULL),
(1366, '14728', 'Xã Yên Từ', '37', NULL, NULL),
(1367, '14743', 'Xã Yên Mạc', '37', NULL, NULL),
(1368, '14746', 'Xã Đồng Thái', '37', NULL, NULL),
(1369, '14758', 'Phường Hàm Rồng', '38', NULL, NULL),
(1370, '14797', 'Phường Hạc Thành', '38', NULL, NULL),
(1371, '14812', 'Phường Bỉm Sơn', '38', NULL, NULL),
(1372, '14818', 'Phường Quang Trung', '38', NULL, NULL),
(1373, '14845', 'Xã Mường Lát', '38', NULL, NULL),
(1374, '14848', 'Xã Tam Chung', '38', NULL, NULL),
(1375, '14854', 'Xã Mường Lý', '38', NULL, NULL),
(1376, '14857', 'Xã Trung Lý', '38', NULL, NULL),
(1377, '14860', 'Xã Quang Chiểu', '38', NULL, NULL),
(1378, '14863', 'Xã Pù Nhi', '38', NULL, NULL),
(1379, '14864', 'Xã Nhi Sơn', '38', NULL, NULL),
(1380, '14866', 'Xã Mường Chanh', '38', NULL, NULL),
(1381, '14869', 'Xã Hồi Xuân', '38', NULL, NULL),
(1382, '14872', 'Xã Trung Thành', '38', NULL, NULL),
(1383, '14875', 'Xã Trung Sơn', '38', NULL, NULL),
(1384, '14878', 'Xã Phú Lệ', '38', NULL, NULL),
(1385, '14890', 'Xã Phú Xuân', '38', NULL, NULL),
(1386, '14896', 'Xã Hiền Kiệt', '38', NULL, NULL),
(1387, '14902', 'Xã Nam Xuân', '38', NULL, NULL),
(1388, '14908', 'Xã Thiên Phủ', '38', NULL, NULL),
(1389, '14923', 'Xã Bá Thước', '38', NULL, NULL),
(1390, '14932', 'Xã Điền Quang', '38', NULL, NULL),
(1391, '14950', 'Xã Điền Lư', '38', NULL, NULL),
(1392, '14953', 'Xã Quý Lương', '38', NULL, NULL),
(1393, '14956', 'Xã Pù Luông', '38', NULL, NULL),
(1394, '14959', 'Xã Cổ Lũng', '38', NULL, NULL),
(1395, '14974', 'Xã Văn Nho', '38', NULL, NULL),
(1396, '14980', 'Xã Thiết Ống', '38', NULL, NULL),
(1397, '15001', 'Xã Trung Hạ', '38', NULL, NULL),
(1398, '15007', 'Xã Tam Thanh', '38', NULL, NULL),
(1399, '15010', 'Xã Sơn Thủy', '38', NULL, NULL),
(1400, '15013', 'Xã Na Mèo', '38', NULL, NULL),
(1401, '15016', 'Xã Quan Sơn', '38', NULL, NULL),
(1402, '15019', 'Xã Tam Lư', '38', NULL, NULL),
(1403, '15022', 'Xã Sơn Điện', '38', NULL, NULL),
(1404, '15025', 'Xã Mường Mìn', '38', NULL, NULL),
(1405, '15031', 'Xã Yên Khương', '38', NULL, NULL),
(1406, '15034', 'Xã Yên Thắng', '38', NULL, NULL),
(1407, '15043', 'Xã Giao An', '38', NULL, NULL),
(1408, '15049', 'Xã Văn Phú', '38', NULL, NULL),
(1409, '15055', 'Xã Linh Sơn', '38', NULL, NULL),
(1410, '15058', 'Xã Đồng Lương', '38', NULL, NULL),
(1411, '15061', 'Xã Ngọc Lặc', '38', NULL, NULL),
(1412, '15085', 'Xã Thạch Lập', '38', NULL, NULL),
(1413, '15091', 'Xã Ngọc Liên', '38', NULL, NULL),
(1414, '15106', 'Xã Nguyệt Ấn', '38', NULL, NULL),
(1415, '15112', 'Xã Kiên Thọ', '38', NULL, NULL),
(1416, '15124', 'Xã Minh Sơn', '38', NULL, NULL),
(1417, '15127', 'Xã Cẩm Thủy', '38', NULL, NULL),
(1418, '15142', 'Xã Cẩm Thạch', '38', NULL, NULL),
(1419, '15148', 'Xã Cẩm Tú', '38', NULL, NULL),
(1420, '15163', 'Xã Cẩm Vân', '38', NULL, NULL),
(1421, '15178', 'Xã Cẩm Tân', '38', NULL, NULL),
(1422, '15187', 'Xã Kim Tân', '38', NULL, NULL),
(1423, '15190', 'Xã Vân Du', '38', NULL, NULL),
(1424, '15199', 'Xã Thạch Quảng', '38', NULL, NULL),
(1425, '15211', 'Xã Thạch Bình', '38', NULL, NULL),
(1426, '15229', 'Xã Thành Vinh', '38', NULL, NULL),
(1427, '15250', 'Xã Ngọc Trạo', '38', NULL, NULL),
(1428, '15271', 'Xã Hà Trung', '38', NULL, NULL),
(1429, '15274', 'Xã Hà Long', '38', NULL, NULL),
(1430, '15286', 'Xã Hoạt Giang', '38', NULL, NULL),
(1431, '15298', 'Xã Lĩnh Toại', '38', NULL, NULL),
(1432, '15316', 'Xã Tống Sơn', '38', NULL, NULL),
(1433, '15349', 'Xã Vĩnh Lộc', '38', NULL, NULL),
(1434, '15361', 'Xã Tây Đô', '38', NULL, NULL),
(1435, '15382', 'Xã Biện Thượng', '38', NULL, NULL),
(1436, '15409', 'Xã Yên Phú', '38', NULL, NULL),
(1437, '15412', 'Xã Quý Lộc', '38', NULL, NULL),
(1438, '15421', 'Xã Yên Trường', '38', NULL, NULL),
(1439, '15442', 'Xã Yên Ninh', '38', NULL, NULL),
(1440, '15448', 'Xã Định Hòa', '38', NULL, NULL),
(1441, '15457', 'Xã Định Tân', '38', NULL, NULL),
(1442, '15469', 'Xã Yên Định', '38', NULL, NULL),
(1443, '15499', 'Xã Thọ Xuân', '38', NULL, NULL),
(1444, '15505', 'Xã Thọ Long', '38', NULL, NULL),
(1445, '15520', 'Xã Xuân Hòa', '38', NULL, NULL),
(1446, '15544', 'Xã Lam Sơn', '38', NULL, NULL),
(1447, '15553', 'Xã Sao Vàng', '38', NULL, NULL),
(1448, '15568', 'Xã Thọ Lập', '38', NULL, NULL),
(1449, '15574', 'Xã Xuân Tín', '38', NULL, NULL),
(1450, '15592', 'Xã Xuân Lập', '38', NULL, NULL),
(1451, '15607', 'Xã Bát Mọt', '38', NULL, NULL),
(1452, '15610', 'Xã Yên Nhân', '38', NULL, NULL),
(1453, '15622', 'Xã Vạn Xuân', '38', NULL, NULL),
(1454, '15628', 'Xã Lương Sơn', '38', NULL, NULL),
(1455, '15634', 'Xã Luận Thành', '38', NULL, NULL),
(1456, '15643', 'Xã Thắng Lộc', '38', NULL, NULL),
(1457, '15646', 'Xã Thường Xuân', '38', NULL, NULL),
(1458, '15658', 'Xã Xuân Chinh', '38', NULL, NULL),
(1459, '15661', 'Xã Tân Thành', '38', NULL, NULL),
(1460, '15664', 'Xã Triệu Sơn', '38', NULL, NULL),
(1461, '15667', 'Xã Thọ Bình', '38', NULL, NULL),
(1462, '15682', 'Xã Hợp Tiến', '38', NULL, NULL),
(1463, '15715', 'Xã Tân Ninh', '38', NULL, NULL),
(1464, '15724', 'Xã Đồng Tiến', '38', NULL, NULL),
(1465, '15754', 'Xã Thọ Ngọc', '38', NULL, NULL),
(1466, '15763', 'Xã Thọ Phú', '38', NULL, NULL),
(1467, '15766', 'Xã An Nông', '38', NULL, NULL),
(1468, '15772', 'Xã Thiệu Hóa', '38', NULL, NULL),
(1469, '15778', 'Xã Thiệu Tiến', '38', NULL, NULL),
(1470, '15796', 'Xã Thiệu Quang', '38', NULL, NULL),
(1471, '15820', 'Xã Thiệu Toán', '38', NULL, NULL),
(1472, '15835', 'Xã Thiệu Trung', '38', NULL, NULL),
(1473, '15853', 'Phường Đông Tiến', '38', NULL, NULL),
(1474, '15865', 'Xã Hoằng Hóa', '38', NULL, NULL),
(1475, '15880', 'Xã Hoằng Giang', '38', NULL, NULL),
(1476, '15889', 'Xã Hoằng Phú', '38', NULL, NULL),
(1477, '15910', 'Xã Hoằng Sơn', '38', NULL, NULL),
(1478, '15925', 'Phường Nguyệt Viên', '38', NULL, NULL),
(1479, '15961', 'Xã Hoằng Lộc', '38', NULL, NULL),
(1480, '15976', 'Xã Hoằng Châu', '38', NULL, NULL),
(1481, '15991', 'Xã Hoằng Tiến', '38', NULL, NULL),
(1482, '16000', 'Xã Hoằng Thanh', '38', NULL, NULL),
(1483, '16012', 'Xã Hậu Lộc', '38', NULL, NULL),
(1484, '16021', 'Xã Triệu Lộc', '38', NULL, NULL),
(1485, '16033', 'Xã Đông Thành', '38', NULL, NULL),
(1486, '16072', 'Xã Hoa Lộc', '38', NULL, NULL),
(1487, '16078', 'Xã Vạn Lộc', '38', NULL, NULL),
(1488, '16093', 'Xã Nga Sơn', '38', NULL, NULL),
(1489, '16108', 'Xã Tân Tiến', '38', NULL, NULL),
(1490, '16114', 'Xã Nga Thắng', '38', NULL, NULL),
(1491, '16138', 'Xã Hồ Vương', '38', NULL, NULL),
(1492, '16144', 'Xã Nga An', '38', NULL, NULL),
(1493, '16171', 'Xã Ba Đình', '38', NULL, NULL),
(1494, '16174', 'Xã Như Xuân', '38', NULL, NULL),
(1495, '16177', 'Xã Xuân Bình', '38', NULL, NULL),
(1496, '16186', 'Xã Hóa Quỳ', '38', NULL, NULL),
(1497, '16213', 'Xã Thanh Phong', '38', NULL, NULL),
(1498, '16222', 'Xã Thanh Quân', '38', NULL, NULL),
(1499, '16225', 'Xã Thượng Ninh', '38', NULL, NULL),
(1500, '16228', 'Xã Như Thanh', '38', NULL, NULL),
(1501, '16234', 'Xã Xuân Du', '38', NULL, NULL),
(1502, '16249', 'Xã Mậu Lâm', '38', NULL, NULL),
(1503, '16258', 'Xã Xuân Thái', '38', NULL, NULL),
(1504, '16264', 'Xã Yên Thọ', '38', NULL, NULL),
(1505, '16273', 'Xã Thanh Kỳ', '38', NULL, NULL),
(1506, '16279', 'Xã Nông Cống', '38', NULL, NULL),
(1507, '16297', 'Xã Trung Chính', '38', NULL, NULL),
(1508, '16309', 'Xã Thắng Lợi', '38', NULL, NULL),
(1509, '16342', 'Xã Thăng Bình', '38', NULL, NULL),
(1510, '16348', 'Xã Trường Văn', '38', NULL, NULL),
(1511, '16363', 'Xã Tượng Lĩnh', '38', NULL, NULL),
(1512, '16369', 'Xã Công Chính', '38', NULL, NULL),
(1513, '16378', 'Phường Đông Sơn', '38', NULL, NULL),
(1514, '16417', 'Phường Đông Quang', '38', NULL, NULL),
(1515, '16438', 'Xã Lưu Vệ', '38', NULL, NULL),
(1516, '16480', 'Xã Quảng Yên', '38', NULL, NULL),
(1517, '16489', 'Xã Quảng Chính', '38', NULL, NULL),
(1518, '16498', 'Xã Quảng Ngọc', '38', NULL, NULL),
(1519, '16516', 'Phường Nam Sầm Sơn', '38', NULL, NULL),
(1520, '16522', 'Phường Quảng Phú', '38', NULL, NULL),
(1521, '16531', 'Phường Sầm Sơn', '38', NULL, NULL),
(1522, '16540', 'Xã Quảng Ninh', '38', NULL, NULL),
(1523, '16543', 'Xã Quảng Bình', '38', NULL, NULL),
(1524, '16549', 'Xã Tiên Trang', '38', NULL, NULL),
(1525, '16561', 'Phường Tĩnh Gia', '38', NULL, NULL),
(1526, '16576', 'Phường Ngọc Sơn', '38', NULL, NULL),
(1527, '16591', 'Xã Các Sơn', '38', NULL, NULL),
(1528, '16594', 'Phường Tân Dân', '38', NULL, NULL),
(1529, '16597', 'Phường Hải Lĩnh', '38', NULL, NULL),
(1530, '16609', 'Phường Đào Duy Từ', '38', NULL, NULL),
(1531, '16624', 'Phường Trúc Lâm', '38', NULL, NULL),
(1532, '16636', 'Xã Trường Lâm', '38', NULL, NULL),
(1533, '16645', 'Phường Hải Bình', '38', NULL, NULL),
(1534, '16654', 'Phường Nghi Sơn', '38', NULL, NULL),
(1535, '16681', 'Phường Thành Vinh', '40', NULL, NULL),
(1536, '16690', 'Phường Trường Vinh', '40', NULL, NULL),
(1537, '16702', 'Phường Vinh Phú', '40', NULL, NULL),
(1538, '16708', 'Phường Vinh Lộc', '40', NULL, NULL),
(1539, '16732', 'Phường Cửa Lò', '40', NULL, NULL),
(1540, '16738', 'Xã Quế Phong', '40', NULL, NULL),
(1541, '16744', 'Xã Thông Thụ', '40', NULL, NULL),
(1542, '16750', 'Xã Tiền Phong', '40', NULL, NULL),
(1543, '16756', 'Xã Tri Lễ', '40', NULL, NULL),
(1544, '16774', 'Xã Mường Quàng', '40', NULL, NULL),
(1545, '16777', 'Xã Quỳ Châu', '40', NULL, NULL),
(1546, '16792', 'Xã Châu Tiến', '40', NULL, NULL),
(1547, '16801', 'Xã Hùng Chân', '40', NULL, NULL),
(1548, '16804', 'Xã Châu Bình', '40', NULL, NULL),
(1549, '16813', 'Xã Mường Xén', '40', NULL, NULL),
(1550, '16816', 'Xã Mỹ Lý', '40', NULL, NULL),
(1551, '16819', 'Xã Bắc Lý', '40', NULL, NULL),
(1552, '16822', 'Xã Keng Đu', '40', NULL, NULL),
(1553, '16828', 'Xã Huồi Tụ', '40', NULL, NULL),
(1554, '16831', 'Xã Mường Lống', '40', NULL, NULL),
(1555, '16834', 'Xã Na Loi', '40', NULL, NULL),
(1556, '16837', 'Xã Nậm Cắn', '40', NULL, NULL),
(1557, '16849', 'Xã Hữu Kiệm', '40', NULL, NULL),
(1558, '16855', 'Xã Chiêu Lưu', '40', NULL, NULL),
(1559, '16858', 'Xã Mường Típ', '40', NULL, NULL),
(1560, '16870', 'Xã Na Ngoi', '40', NULL, NULL),
(1561, '16876', 'Xã Tương Dương', '40', NULL, NULL),
(1562, '16882', 'Xã Nhôn Mai', '40', NULL, NULL),
(1563, '16885', 'Xã Hữu Khuông', '40', NULL, NULL),
(1564, '16903', 'Xã Nga My', '40', NULL, NULL),
(1565, '16906', 'Xã Lượng Minh', '40', NULL, NULL),
(1566, '16909', 'Xã Yên Hòa', '40', NULL, NULL),
(1567, '16912', 'Xã Yên Na', '40', NULL, NULL),
(1568, '16933', 'Xã Tam Quang', '40', NULL, NULL),
(1569, '16936', 'Xã Tam Thái', '40', NULL, NULL),
(1570, '16939', 'Phường Thái Hòa', '40', NULL, NULL),
(1571, '16941', 'Xã Nghĩa Đàn', '40', NULL, NULL),
(1572, '16951', 'Xã Nghĩa Lâm', '40', NULL, NULL),
(1573, '16969', 'Xã Nghĩa Thọ', '40', NULL, NULL),
(1574, '16972', 'Xã Nghĩa Hưng', '40', NULL, NULL),
(1575, '16975', 'Xã Nghĩa Mai', '40', NULL, NULL),
(1576, '17011', 'Phường Tây Hiếu', '40', NULL, NULL),
(1577, '17017', 'Xã Đông Hiếu', '40', NULL, NULL),
(1578, '17029', 'Xã Nghĩa Lộc', '40', NULL, NULL),
(1579, '17032', 'Xã Nghĩa Khánh', '40', NULL, NULL),
(1580, '17035', 'Xã Quỳ Hợp', '40', NULL, NULL),
(1581, '17044', 'Xã Châu Hồng', '40', NULL, NULL),
(1582, '17056', 'Xã Châu Lộc', '40', NULL, NULL),
(1583, '17059', 'Xã Tam Hợp', '40', NULL, NULL),
(1584, '17071', 'Xã Minh Hợp', '40', NULL, NULL),
(1585, '17077', 'Xã Mường Ham', '40', NULL, NULL),
(1586, '17089', 'Xã Mường Chọng', '40', NULL, NULL),
(1587, '17110', 'Phường Hoàng Mai', '40', NULL, NULL),
(1588, '17125', 'Phường Quỳnh Mai', '40', NULL, NULL),
(1589, '17128', 'Phường Tân Mai', '40', NULL, NULL),
(1590, '17143', 'Xã Quỳnh Văn', '40', NULL, NULL),
(1591, '17149', 'Xã Quỳnh Tam', '40', NULL, NULL),
(1592, '17170', 'Xã Quỳnh Sơn', '40', NULL, NULL),
(1593, '17176', 'Xã Quỳnh Anh', '40', NULL, NULL),
(1594, '17179', 'Xã Quỳnh Lưu', '40', NULL, NULL),
(1595, '17212', 'Xã Quỳnh Phú', '40', NULL, NULL),
(1596, '17224', 'Xã Quỳnh Thắng', '40', NULL, NULL),
(1597, '17230', 'Xã Bình Chuẩn', '40', NULL, NULL),
(1598, '17239', 'Xã Mậu Thạch', '40', NULL, NULL),
(1599, '17242', 'Xã Cam Phục', '40', NULL, NULL),
(1600, '17248', 'Xã Châu Khê', '40', NULL, NULL),
(1601, '17254', 'Xã Con Cuông', '40', NULL, NULL),
(1602, '17263', 'Xã Môn Sơn', '40', NULL, NULL),
(1603, '17266', 'Xã Tân Kỳ', '40', NULL, NULL),
(1604, '17272', 'Xã Tân Phú', '40', NULL, NULL),
(1605, '17278', 'Xã Giai Xuân', '40', NULL, NULL),
(1606, '17284', 'Xã Nghĩa Đồng', '40', NULL, NULL),
(1607, '17287', 'Xã Tiên Đồng', '40', NULL, NULL),
(1608, '17305', 'Xã Tân An', '40', NULL, NULL),
(1609, '17326', 'Xã Nghĩa Hành', '40', NULL, NULL),
(1610, '17329', 'Xã Anh Sơn', '40', NULL, NULL),
(1611, '17335', 'Xã Thành Bình Thọ', '40', NULL, NULL),
(1612, '17344', 'Xã Nhân Hòa', '40', NULL, NULL),
(1613, '17357', 'Xã Vĩnh Tường', '40', NULL, NULL),
(1614, '17365', 'Xã Anh Sơn Đông', '40', NULL, NULL),
(1615, '17380', 'Xã Yên Xuân', '40', NULL, NULL),
(1616, '17395', 'Xã Hùng Châu', '40', NULL, NULL),
(1617, '17416', 'Xã Đức Châu', '40', NULL, NULL),
(1618, '17419', 'Xã Hải Châu', '40', NULL, NULL),
(1619, '17443', 'Xã Quảng Châu', '40', NULL, NULL),
(1620, '17464', 'Xã Diễn Châu', '40', NULL, NULL),
(1621, '17476', 'Xã Minh Châu', '40', NULL, NULL),
(1622, '17479', 'Xã An Châu', '40', NULL, NULL),
(1623, '17488', 'Xã Tân Châu', '40', NULL, NULL),
(1624, '17506', 'Xã Yên Thành', '40', NULL, NULL),
(1625, '17515', 'Xã Bình Minh', '40', NULL, NULL),
(1626, '17521', 'Xã Quang Đồng', '40', NULL, NULL),
(1627, '17524', 'Xã Giai Lạc', '40', NULL, NULL),
(1628, '17530', 'Xã Đông Thành', '40', NULL, NULL),
(1629, '17560', 'Xã Vân Du', '40', NULL, NULL),
(1630, '17569', 'Xã Quan Thành', '40', NULL, NULL),
(1631, '17605', 'Xã Hợp Minh', '40', NULL, NULL),
(1632, '17611', 'Xã Vân Tụ', '40', NULL, NULL),
(1633, '17623', 'Xã Bạch Ngọc', '40', NULL, NULL),
(1634, '17641', 'Xã Lương Sơn', '40', NULL, NULL),
(1635, '17662', 'Xã Đô Lương', '40', NULL, NULL),
(1636, '17677', 'Xã Văn Hiến', '40', NULL, NULL),
(1637, '17689', 'Xã Thuần Trung', '40', NULL, NULL),
(1638, '17707', 'Xã Bạch Hà', '40', NULL, NULL),
(1639, '17713', 'Xã Đại Đồng', '40', NULL, NULL),
(1640, '17722', 'Xã Hạnh Lâm', '40', NULL, NULL),
(1641, '17728', 'Xã Cát Ngạn', '40', NULL, NULL),
(1642, '17743', 'Xã Tam Đồng', '40', NULL, NULL),
(1643, '17759', 'Xã Sơn Lâm', '40', NULL, NULL),
(1644, '17770', 'Xã Hoa Quân', '40', NULL, NULL),
(1645, '17779', 'Xã Xuân Lâm', '40', NULL, NULL),
(1646, '17791', 'Xã Kim Bảng', '40', NULL, NULL),
(1647, '17818', 'Xã Bích Hào', '40', NULL, NULL),
(1648, '17827', 'Xã Nghi Lộc', '40', NULL, NULL),
(1649, '17833', 'Xã Hải Lộc', '40', NULL, NULL),
(1650, '17842', 'Xã Thần Lĩnh', '40', NULL, NULL),
(1651, '17854', 'Xã Văn Kiều', '40', NULL, NULL),
(1652, '17857', 'Xã Phúc Lộc', '40', NULL, NULL),
(1653, '17866', 'Xã Trung Lộc', '40', NULL, NULL),
(1654, '17878', 'Xã Đông Lộc', '40', NULL, NULL),
(1655, '17920', 'Phường Vinh Hưng', '40', NULL, NULL),
(1656, '17935', 'Xã Nam Đàn', '40', NULL, NULL),
(1657, '17944', 'Xã Đại Huệ', '40', NULL, NULL),
(1658, '17950', 'Xã Vạn An', '40', NULL, NULL),
(1659, '17971', 'Xã Kim Liên', '40', NULL, NULL),
(1660, '17989', 'Xã Thiên Nhẫn', '40', NULL, NULL),
(1661, '18001', 'Xã Hưng Nguyên', '40', NULL, NULL),
(1662, '18007', 'Xã Yên Trung', '40', NULL, NULL),
(1663, '18028', 'Xã Hưng Nguyên Nam', '40', NULL, NULL),
(1664, '18040', 'Xã Lam Thành', '40', NULL, NULL),
(1665, '18073', 'Phường Thành Sen', '42', NULL, NULL),
(1666, '18100', 'Phường Trần Phú', '42', NULL, NULL),
(1667, '18115', 'Phường Bắc Hồng Lĩnh', '42', NULL, NULL),
(1668, '18118', 'Phường Nam Hồng Lĩnh', '42', NULL, NULL),
(1669, '18133', 'Xã Hương Sơn', '42', NULL, NULL),
(1670, '18160', 'Xã Sơn Hồng', '42', NULL, NULL),
(1671, '18163', 'Xã Sơn Tiến', '42', NULL, NULL),
(1672, '18172', 'Xã Sơn Tây', '42', NULL, NULL),
(1673, '18184', 'Xã Sơn Giang', '42', NULL, NULL),
(1674, '18196', 'Xã Sơn Kim 1', '42', NULL, NULL),
(1675, '18199', 'Xã Sơn Kim 2', '42', NULL, NULL),
(1676, '18202', 'Xã Tứ Mỹ', '42', NULL, NULL),
(1677, '18223', 'Xã Kim Hoa', '42', NULL, NULL),
(1678, '18229', 'Xã Đức Thọ', '42', NULL, NULL),
(1679, '18244', 'Xã Đức Minh', '42', NULL, NULL),
(1680, '18262', 'Xã Đức Quang', '42', NULL, NULL),
(1681, '18277', 'Xã Đức Thịnh', '42', NULL, NULL),
(1682, '18304', 'Xã Đức Đồng', '42', NULL, NULL),
(1683, '18313', 'Xã Vũ Quang', '42', NULL, NULL),
(1684, '18322', 'Xã Mai Hoa', '42', NULL, NULL),
(1685, '18328', 'Xã Thượng Đức', '42', NULL, NULL),
(1686, '18352', 'Xã Nghi Xuân', '42', NULL, NULL),
(1687, '18364', 'Xã Đan Hải', '42', NULL, NULL),
(1688, '18373', 'Xã Tiên Điền', '42', NULL, NULL),
(1689, '18394', 'Xã Cổ Đạm', '42', NULL, NULL),
(1690, '18406', 'Xã Can Lộc', '42', NULL, NULL),
(1691, '18409', 'Xã Hồng Lộc', '42', NULL, NULL),
(1692, '18418', 'Xã Tùng Lộc', '42', NULL, NULL),
(1693, '18436', 'Xã Trường Lưu', '42', NULL, NULL),
(1694, '18466', 'Xã Gia Hanh', '42', NULL, NULL),
(1695, '18481', 'Xã Xuân Lộc', '42', NULL, NULL),
(1696, '18484', 'Xã Đồng Lộc', '42', NULL, NULL),
(1697, '18496', 'Xã Hương Khê', '42', NULL, NULL),
(1698, '18502', 'Xã Hà Linh', '42', NULL, NULL),
(1699, '18523', 'Xã Hương Bình', '42', NULL, NULL),
(1700, '18532', 'Xã Hương Phố', '42', NULL, NULL),
(1701, '18544', 'Xã Hương Xuân', '42', NULL, NULL),
(1702, '18547', 'Xã Phúc Trạch', '42', NULL, NULL),
(1703, '18550', 'Xã Hương Đô', '42', NULL, NULL),
(1704, '18562', 'Xã Thạch Hà', '42', NULL, NULL),
(1705, '18568', 'Xã Lộc Hà', '42', NULL, NULL),
(1706, '18583', 'Xã Mai Phụ', '42', NULL, NULL),
(1707, '18586', 'Xã Đông Kinh', '42', NULL, NULL),
(1708, '18601', 'Xã Việt Xuyên', '42', NULL, NULL),
(1709, '18604', 'Xã Thạch Khê', '42', NULL, NULL),
(1710, '18619', 'Xã Đồng Tiến', '42', NULL, NULL),
(1711, '18628', 'Xã Thạch Lạc', '42', NULL, NULL),
(1712, '18634', 'Xã Toàn Lưu', '42', NULL, NULL),
(1713, '18652', 'Phường Hà Huy Tập', '42', NULL, NULL),
(1714, '18667', 'Xã Thạch Xuân', '42', NULL, NULL),
(1715, '18673', 'Xã Cẩm Xuyên', '42', NULL, NULL),
(1716, '18676', 'Xã Thiên Cầm', '42', NULL, NULL),
(1717, '18682', 'Xã Yên Hòa', '42', NULL, NULL),
(1718, '18685', 'Xã Cẩm Bình', '42', NULL, NULL),
(1719, '18736', 'Xã Cẩm Hưng', '42', NULL, NULL),
(1720, '18739', 'Xã Cẩm Duệ', '42', NULL, NULL),
(1721, '18742', 'Xã Cẩm Trung', '42', NULL, NULL),
(1722, '18748', 'Xã Cẩm Lạc', '42', NULL, NULL),
(1723, '18754', 'Phường Sông Trí', '42', NULL, NULL),
(1724, '18766', 'Xã Kỳ Xuân', '42', NULL, NULL),
(1725, '18775', 'Xã Kỳ Anh', '42', NULL, NULL),
(1726, '18781', 'Phường Hải Ninh', '42', NULL, NULL),
(1727, '18787', 'Xã Kỳ Văn', '42', NULL, NULL),
(1728, '18790', 'Xã Kỳ Khang', '42', NULL, NULL),
(1729, '18814', 'Xã Kỳ Hoa', '42', NULL, NULL),
(1730, '18823', 'Phường Vũng Áng', '42', NULL, NULL),
(1731, '18832', 'Phường Hoành Sơn', '42', NULL, NULL),
(1732, '18838', 'Xã Kỳ Lạc', '42', NULL, NULL),
(1733, '18844', 'Xã Kỳ Thượng', '42', NULL, NULL),
(1734, '18859', 'Phường Đồng Thuận', '44', NULL, NULL),
(1735, '18871', 'Phường Đồng Sơn', '44', NULL, NULL),
(1736, '18880', 'Phường Đồng Hới', '44', NULL, NULL),
(1737, '18901', 'Xã Minh Hóa', '44', NULL, NULL),
(1738, '18904', 'Xã Dân Hóa', '44', NULL, NULL),
(1739, '18919', 'Xã Tân Thành', '44', NULL, NULL),
(1740, '18922', 'Xã Kim Điền', '44', NULL, NULL),
(1741, '18943', 'Xã Kim Phú', '44', NULL, NULL),
(1742, '18949', 'Xã Đồng Lê', '44', NULL, NULL),
(1743, '18952', 'Xã Tuyên Sơn', '44', NULL, NULL),
(1744, '18958', 'Xã Tuyên Lâm', '44', NULL, NULL),
(1745, '18985', 'Xã Tuyên Phú', '44', NULL, NULL),
(1746, '18991', 'Xã Tuyên Bình', '44', NULL, NULL),
(1747, '18997', 'Xã Tuyên Hóa', '44', NULL, NULL),
(1748, '19009', 'Phường Ba Đồn', '44', NULL, NULL),
(1749, '19021', 'Xã Phú Trạch', '44', NULL, NULL),
(1750, '19030', 'Xã Trung Thuần', '44', NULL, NULL),
(1751, '19033', 'Xã Hòa Trạch', '44', NULL, NULL),
(1752, '19051', 'Xã Tân Gianh', '44', NULL, NULL),
(1753, '19057', 'Xã Quảng Trạch', '44', NULL, NULL),
(1754, '19066', 'Phường Bắc Gianh', '44', NULL, NULL),
(1755, '19075', 'Xã Nam Ba Đồn', '44', NULL, NULL),
(1756, '19093', 'Xã Nam Gianh', '44', NULL, NULL),
(1757, '19111', 'Xã Hoàn Lão', '44', NULL, NULL),
(1758, '19126', 'Xã Bắc Trạch', '44', NULL, NULL),
(1759, '19138', 'Xã Phong Nha', '44', NULL, NULL),
(1760, '19141', 'Xã Bố Trạch', '44', NULL, NULL),
(1761, '19147', 'Xã Thượng Trạch', '44', NULL, NULL),
(1762, '19159', 'Xã Đông Trạch', '44', NULL, NULL),
(1763, '19198', 'Xã Nam Trạch', '44', NULL, NULL),
(1764, '19204', 'Xã Trường Sơn', '44', NULL, NULL),
(1765, '19207', 'Xã Quảng Ninh', '44', NULL, NULL),
(1766, '19225', 'Xã Ninh Châu', '44', NULL, NULL),
(1767, '19237', 'Xã Trường Ninh', '44', NULL, NULL),
(1768, '19246', 'Xã Lệ Ninh', '44', NULL, NULL),
(1769, '19249', 'Xã Lệ Thủy', '44', NULL, NULL),
(1770, '19255', 'Xã Cam Hồng', '44', NULL, NULL),
(1771, '19288', 'Xã Sen Ngư', '44', NULL, NULL),
(1772, '19291', 'Xã Tân Mỹ', '44', NULL, NULL),
(1773, '19309', 'Xã Trường Phú', '44', NULL, NULL),
(1774, '19318', 'Xã Kim Ngân', '44', NULL, NULL),
(1775, '19333', 'Phường Đông Hà', '44', NULL, NULL),
(1776, '19351', 'Phường Nam Đông Hà', '44', NULL, NULL),
(1777, '19360', 'Phường Quảng Trị', '44', NULL, NULL),
(1778, '19363', 'Xã Vĩnh Linh', '44', NULL, NULL),
(1779, '19366', 'Xã Bến Quan', '44', NULL, NULL),
(1780, '19372', 'Xã Vĩnh Hoàng', '44', NULL, NULL),
(1781, '19405', 'Xã Vĩnh Thủy', '44', NULL, NULL),
(1782, '19414', 'Xã Cửa Tùng', '44', NULL, NULL),
(1783, '19429', 'Xã Khe Sanh', '44', NULL, NULL),
(1784, '19432', 'Xã Lao Bảo', '44', NULL, NULL),
(1785, '19435', 'Xã Hướng Lập', '44', NULL, NULL),
(1786, '19441', 'Xã Hướng Phùng', '44', NULL, NULL),
(1787, '19462', 'Xã Tân Lập', '44', NULL, NULL),
(1788, '19483', 'Xã A Dơi', '44', NULL, NULL),
(1789, '19489', 'Xã Lìa', '44', NULL, NULL),
(1790, '19495', 'Xã Gio Linh', '44', NULL, NULL),
(1791, '19496', 'Xã Cửa Việt', '44', NULL, NULL),
(1792, '19501', 'Xã Bến Hải', '44', NULL, NULL),
(1793, '19537', 'Xã Cồn Tiên', '44', NULL, NULL),
(1794, '19555', 'Xã Hướng Hiệp', '44', NULL, NULL),
(1795, '19564', 'Xã Đakrông', '44', NULL, NULL),
(1796, '19567', 'Xã Ba Lòng', '44', NULL, NULL),
(1797, '19588', 'Xã Tà Rụt', '44', NULL, NULL),
(1798, '19594', 'Xã La Lay', '44', NULL, NULL),
(1799, '19597', 'Xã Cam Lộ', '44', NULL, NULL),
(1800, '19603', 'Xã Hiếu Giang', '44', NULL, NULL),
(1801, '19624', 'Xã Triệu Phong', '44', NULL, NULL),
(1802, '19639', 'Xã Nam Cửa Việt', '44', NULL, NULL),
(1803, '19645', 'Xã Triệu Bình', '44', NULL, NULL),
(1804, '19654', 'Xã Triệu Cơ', '44', NULL, NULL),
(1805, '19669', 'Xã Ái Tử', '44', NULL, NULL),
(1806, '19681', 'Xã Diên Sanh', '44', NULL, NULL),
(1807, '19699', 'Xã Vĩnh Định', '44', NULL, NULL),
(1808, '19702', 'Xã Hải Lăng', '44', NULL, NULL),
(1809, '19735', 'Xã Nam Hải Lăng', '44', NULL, NULL),
(1810, '19741', 'Xã Mỹ Thủy', '44', NULL, NULL),
(1811, '19742', 'Đặc khu Cồn Cỏ', '44', NULL, NULL),
(1812, '19753', 'Phường Phú Xuân', '46', NULL, NULL),
(1813, '19774', 'Phường Kim Long', '46', NULL, NULL),
(1814, '19777', 'Phường Vỹ Dạ', '46', NULL, NULL),
(1815, '19789', 'Phường Thuận Hóa', '46', NULL, NULL),
(1816, '19804', 'Phường Hương An', '46', NULL, NULL),
(1817, '19813', 'Phường Thủy Xuân', '46', NULL, NULL),
(1818, '19815', 'Phường An Cựu', '46', NULL, NULL),
(1819, '19819', 'Phường Phong Điền', '46', NULL, NULL),
(1820, '19828', 'Phường Phong Phú', '46', NULL, NULL),
(1821, '19831', 'Phường Phong Dinh', '46', NULL, NULL),
(1822, '19858', 'Phường Phong Thái', '46', NULL, NULL),
(1823, '19867', 'Xã Quảng Điền', '46', NULL, NULL),
(1824, '19873', 'Phường Phong Quảng', '46', NULL, NULL),
(1825, '19885', 'Xã Đan Điền', '46', NULL, NULL),
(1826, '19900', 'Phường Thuận An', '46', NULL, NULL),
(1827, '19909', 'Phường Dương Nỗ', '46', NULL, NULL),
(1828, '19918', 'Xã Phú Hồ', '46', NULL, NULL),
(1829, '19930', 'Phường Mỹ Thượng', '46', NULL, NULL),
(1830, '19942', 'Xã Phú Vang', '46', NULL, NULL),
(1831, '19945', 'Xã Phú Vinh', '46', NULL, NULL),
(1832, '19960', 'Phường Phú Bài', '46', NULL, NULL),
(1833, '19969', 'Phường Thanh Thủy', '46', NULL, NULL),
(1834, '19975', 'Phường Hương Thủy', '46', NULL, NULL),
(1835, '19996', 'Phường Hương Trà', '46', NULL, NULL),
(1836, '20014', 'Phường Hóa Châu', '46', NULL, NULL),
(1837, '20017', 'Phường Kim Trà', '46', NULL, NULL),
(1838, '20035', 'Xã Bình Điền', '46', NULL, NULL),
(1839, '20044', 'Xã A Lưới 2', '46', NULL, NULL),
(1840, '20050', 'Xã A Lưới 5', '46', NULL, NULL),
(1841, '20056', 'Xã A Lưới 1', '46', NULL, NULL),
(1842, '20071', 'Xã A Lưới 3', '46', NULL, NULL),
(1843, '20101', 'Xã A Lưới 4', '46', NULL, NULL),
(1844, '20107', 'Xã Phú Lộc', '46', NULL, NULL),
(1845, '20122', 'Xã Vinh Lộc', '46', NULL, NULL),
(1846, '20131', 'Xã Hưng Lộc', '46', NULL, NULL),
(1847, '20137', 'Xã Chân Mây - Lăng Cô', '46', NULL, NULL),
(1848, '20140', 'Xã Lộc An', '46', NULL, NULL),
(1849, '20161', 'Xã Khe Tre', '46', NULL, NULL),
(1850, '20179', 'Xã Nam Đông', '46', NULL, NULL),
(1851, '20182', 'Xã Long Quảng', '46', NULL, NULL),
(1852, '20194', 'Phường Hải Vân', '48', NULL, NULL),
(1853, '20197', 'Phường Liên Chiểu', '48', NULL, NULL),
(1854, '20200', 'Phường Hòa Khánh', '48', NULL, NULL),
(1855, '20209', 'Phường Thanh Khê', '48', NULL, NULL),
(1856, '20242', 'Phường Hải Châu', '48', NULL, NULL),
(1857, '20257', 'Phường Hòa Cường', '48', NULL, NULL),
(1858, '20260', 'Phường Cẩm Lệ', '48', NULL, NULL),
(1859, '20263', 'Phường Sơn Trà', '48', NULL, NULL),
(1860, '20275', 'Phường An Hải', '48', NULL, NULL),
(1861, '20285', 'Phường Ngũ Hành Sơn', '48', NULL, NULL),
(1862, '20305', 'Phường An Khê', '48', NULL, NULL),
(1863, '20308', 'Xã Bà Nà', '48', NULL, NULL),
(1864, '20314', 'Phường Hòa Xuân', '48', NULL, NULL),
(1865, '20320', 'Xã Hòa Vang', '48', NULL, NULL),
(1866, '20332', 'Xã Hòa Tiến', '48', NULL, NULL),
(1867, '20333', 'Đặc khu Hoàng Sa', '48', NULL, NULL),
(1868, '20335', 'Phường Bàn Thạch', '48', NULL, NULL),
(1869, '20341', 'Phường Tam Kỳ', '48', NULL, NULL),
(1870, '20350', 'Phường Hương Trà', '48', NULL, NULL),
(1871, '20356', 'Phường Quảng Phú', '48', NULL, NULL),
(1872, '20364', 'Xã Chiên Đàn', '48', NULL, NULL),
(1873, '20380', 'Xã Tây Hồ', '48', NULL, NULL),
(1874, '20392', 'Xã Phú Ninh', '48', NULL, NULL),
(1875, '20401', 'Phường Hội An Tây', '48', NULL, NULL),
(1876, '20410', 'Phường Hội An', '48', NULL, NULL),
(1877, '20413', 'Phường Hội An Đông', '48', NULL, NULL),
(1878, '20434', 'Xã Tân Hiệp', '48', NULL, NULL),
(1879, '20443', 'Xã Hùng Sơn', '48', NULL, NULL),
(1880, '20455', 'Xã Tây Giang', '48', NULL, NULL),
(1881, '20458', 'Xã Avương', '48', NULL, NULL),
(1882, '20467', 'Xã Đông Giang', '48', NULL, NULL),
(1883, '20476', 'Xã Sông Kôn', '48', NULL, NULL),
(1884, '20485', 'Xã Sông Vàng', '48', NULL, NULL),
(1885, '20494', 'Xã Bến Hiên', '48', NULL, NULL),
(1886, '20500', 'Xã Đại Lộc', '48', NULL, NULL),
(1887, '20506', 'Xã Thượng Đức', '48', NULL, NULL),
(1888, '20515', 'Xã Hà Nha', '48', NULL, NULL),
(1889, '20539', 'Xã Vu Gia', '48', NULL, NULL),
(1890, '20542', 'Xã Phú Thuận', '48', NULL, NULL),
(1891, '20551', 'Phường Điện Bàn', '48', NULL, NULL),
(1892, '20557', 'Phường Điện Bàn Bắc', '48', NULL, NULL),
(1893, '20569', 'Xã Điện Bàn Tây', '48', NULL, NULL),
(1894, '20575', 'Phường An Thắng', '48', NULL, NULL),
(1895, '20579', 'Phường Điện Bàn Đông', '48', NULL, NULL),
(1896, '20587', 'Xã Gò Nổi', '48', NULL, NULL),
(1897, '20599', 'Xã Nam Phước', '48', NULL, NULL),
(1898, '20611', 'Xã Thu Bồn', '48', NULL, NULL),
(1899, '20623', 'Xã Duy Xuyên', '48', NULL, NULL),
(1900, '20635', 'Xã Duy Nghĩa', '48', NULL, NULL),
(1901, '20641', 'Xã Quế Sơn', '48', NULL, NULL),
(1902, '20650', 'Xã Xuân Phú', '48', NULL, NULL),
(1903, '20656', 'Xã Nông Sơn', '48', NULL, NULL),
(1904, '20662', 'Xã Quế Sơn Trung', '48', NULL, NULL),
(1905, '20669', 'Xã Quế Phước', '48', NULL, NULL),
(1906, '20695', 'Xã Thạnh Mỹ', '48', NULL, NULL),
(1907, '20698', 'Xã La Êê', '48', NULL, NULL),
(1908, '20704', 'Xã La Dêê', '48', NULL, NULL),
(1909, '20707', 'Xã Nam Giang', '48', NULL, NULL),
(1910, '20710', 'Xã Bến Giằng', '48', NULL, NULL),
(1911, '20716', 'Xã Đắc Pring', '48', NULL, NULL),
(1912, '20722', 'Xã Khâm Đức', '48', NULL, NULL),
(1913, '20728', 'Xã Phước Hiệp', '48', NULL, NULL),
(1914, '20734', 'Xã Phước Năng', '48', NULL, NULL),
(1915, '20740', 'Xã Phước Chánh', '48', NULL, NULL),
(1916, '20752', 'Xã Phước Thành', '48', NULL, NULL),
(1917, '20767', 'Xã Việt An', '48', NULL, NULL),
(1918, '20770', 'Xã Phước Trà', '48', NULL, NULL),
(1919, '20779', 'Xã Hiệp Đức', '48', NULL, NULL),
(1920, '20791', 'Xã Thăng Bình', '48', NULL, NULL),
(1921, '20794', 'Xã Thăng An', '48', NULL, NULL),
(1922, '20818', 'Xã Đồng Dương', '48', NULL, NULL),
(1923, '20827', 'Xã Thăng Phú', '48', NULL, NULL),
(1924, '20836', 'Xã Thăng Trường', '48', NULL, NULL),
(1925, '20848', 'Xã Thăng Điền', '48', NULL, NULL),
(1926, '20854', 'Xã Tiên Phước', '48', NULL, NULL),
(1927, '20857', 'Xã Sơn Cẩm Hà', '48', NULL, NULL),
(1928, '20875', 'Xã Lãnh Ngọc', '48', NULL, NULL),
(1929, '20878', 'Xã Thạnh Bình', '48', NULL, NULL),
(1930, '20900', 'Xã Trà My', '48', NULL, NULL),
(1931, '20908', 'Xã Trà Liên', '48', NULL, NULL),
(1932, '20920', 'Xã Trà Đốc', '48', NULL, NULL),
(1933, '20923', 'Xã Trà Tân', '48', NULL, NULL),
(1934, '20929', 'Xã Trà Giáp', '48', NULL, NULL),
(1935, '20938', 'Xã Trà Leng', '48', NULL, NULL),
(1936, '20941', 'Xã Trà Tập', '48', NULL, NULL),
(1937, '20944', 'Xã Nam Trà My', '48', NULL, NULL),
(1938, '20950', 'Xã Trà Linh', '48', NULL, NULL),
(1939, '20959', 'Xã Trà Vân', '48', NULL, NULL),
(1940, '20965', 'Xã Núi Thành', '48', NULL, NULL),
(1941, '20971', 'Xã Tam Xuân', '48', NULL, NULL),
(1942, '20977', 'Xã Đức Phú', '48', NULL, NULL),
(1943, '20984', 'Xã Tam Anh', '48', NULL, NULL),
(1944, '20992', 'Xã Tam Hải', '48', NULL, NULL),
(1945, '21004', 'Xã Tam Mỹ', '48', NULL, NULL),
(1946, '21025', 'Phường Cẩm Thành', '51', NULL, NULL),
(1947, '21028', 'Phường Nghĩa Lộ', '51', NULL, NULL),
(1948, '21034', 'Xã An Phú', '51', NULL, NULL),
(1949, '21040', 'Xã Bình Sơn', '51', NULL, NULL),
(1950, '21061', 'Xã Vạn Tường', '51', NULL, NULL),
(1951, '21085', 'Xã Bình Minh', '51', NULL, NULL),
(1952, '21100', 'Xã Bình Chương', '51', NULL, NULL),
(1953, '21109', 'Xã Đông Sơn', '51', NULL, NULL),
(1954, '21115', 'Xã Trà Bồng', '51', NULL, NULL),
(1955, '21124', 'Xã Thanh Bồng', '51', NULL, NULL),
(1956, '21127', 'Xã Đông Trà Bồng', '51', NULL, NULL),
(1957, '21136', 'Xã Cà Đam', '51', NULL, NULL),
(1958, '21154', 'Xã Tây Trà', '51', NULL, NULL),
(1959, '21157', 'Xã Tây Trà Bồng', '51', NULL, NULL),
(1960, '21172', 'Phường Trương Quang Trọng', '51', NULL, NULL),
(1961, '21181', 'Xã Thọ Phong', '51', NULL, NULL),
(1962, '21196', 'Xã Trường Giang', '51', NULL, NULL),
(1963, '21205', 'Xã Ba Gia', '51', NULL, NULL),
(1964, '21211', 'Xã Tịnh Khê', '51', NULL, NULL),
(1965, '21220', 'Xã Sơn Tịnh', '51', NULL, NULL),
(1966, '21235', 'Xã Tư Nghĩa', '51', NULL, NULL),
(1967, '21238', 'Xã Vệ Giang', '51', NULL, NULL),
(1968, '21244', 'Xã Trà Giang', '51', NULL, NULL),
(1969, '21250', 'Xã Nghĩa Giang', '51', NULL, NULL),
(1970, '21289', 'Xã Sơn Hà', '51', NULL, NULL),
(1971, '21292', 'Xã Sơn Hạ', '51', NULL, NULL),
(1972, '21307', 'Xã Sơn Linh', '51', NULL, NULL),
(1973, '21319', 'Xã Sơn Thủy', '51', NULL, NULL),
(1974, '21325', 'Xã Sơn Kỳ', '51', NULL, NULL),
(1975, '21334', 'Xã Sơn Tây Thượng', '51', NULL, NULL),
(1976, '21340', 'Xã Sơn Tây', '51', NULL, NULL),
(1977, '21343', 'Xã Sơn Tây Hạ', '51', NULL, NULL),
(1978, '21349', 'Xã Sơn Mai', '51', NULL, NULL),
(1979, '21361', 'Xã Minh Long', '51', NULL, NULL),
(1980, '21364', 'Xã Nghĩa Hành', '51', NULL, NULL),
(1981, '21370', 'Xã Phước Giang', '51', NULL, NULL),
(1982, '21385', 'Xã Đình Cương', '51', NULL, NULL),
(1983, '21388', 'Xã Thiện Tín', '51', NULL, NULL),
(1984, '21400', 'Xã Mộ Đức', '51', NULL, NULL),
(1985, '21409', 'Xã Long Phụng', '51', NULL, NULL),
(1986, '21421', 'Xã Mỏ Cày', '51', NULL, NULL),
(1987, '21433', 'Xã Lân Phong', '51', NULL, NULL),
(1988, '21439', 'Phường Đức Phổ', '51', NULL, NULL),
(1989, '21451', 'Phường Trà Câu', '51', NULL, NULL),
(1990, '21457', 'Xã Nguyễn Nghiêm', '51', NULL, NULL),
(1991, '21472', 'Xã Khánh Cường', '51', NULL, NULL),
(1992, '21478', 'Phường Sa Huỳnh', '51', NULL, NULL),
(1993, '21484', 'Xã Ba Tơ', '51', NULL, NULL),
(1994, '21490', 'Xã Ba Vinh', '51', NULL, NULL),
(1995, '21496', 'Xã Ba Động', '51', NULL, NULL),
(1996, '21499', 'Xã Ba Dinh', '51', NULL, NULL),
(1997, '21520', 'Xã Đặng Thùy Trâm', '51', NULL, NULL),
(1998, '21523', 'Xã Ba Tô', '51', NULL, NULL),
(1999, '21529', 'Xã Ba Vì', '51', NULL, NULL),
(2000, '21538', 'Xã Ba Xa', '51', NULL, NULL),
(2001, '21548', 'Đặc khu Lý Sơn', '51', NULL, NULL),
(2002, '21553', 'Phường Quy Nhơn Bắc', '52', NULL, NULL),
(2003, '21583', 'Phường Quy Nhơn', '52', NULL, NULL),
(2004, '21589', 'Phường Quy Nhơn Tây', '52', NULL, NULL),
(2005, '21592', 'Phường Quy Nhơn Nam', '52', NULL, NULL),
(2006, '21601', 'Phường Quy Nhơn Đông', '52', NULL, NULL),
(2007, '21607', 'Xã Nhơn Châu', '52', NULL, NULL),
(2008, '21609', 'Xã An Lão', '52', NULL, NULL),
(2009, '21616', 'Xã An Vinh', '52', NULL, NULL),
(2010, '21622', 'Xã An Toàn', '52', NULL, NULL),
(2011, '21628', 'Xã An Hòa', '52', NULL, NULL),
(2012, '21637', 'Phường Tam Quan', '52', NULL, NULL),
(2013, '21640', 'Phường Bồng Sơn', '52', NULL, NULL),
(2014, '21655', 'Phường Hoài Nhơn Bắc', '52', NULL, NULL),
(2015, '21661', 'Phường Hoài Nhơn Tây', '52', NULL, NULL),
(2016, '21664', 'Phường Hoài Nhơn', '52', NULL, NULL),
(2017, '21670', 'Phường Hoài Nhơn Đông', '52', NULL, NULL),
(2018, '21673', 'Phường Hoài Nhơn Nam', '52', NULL, NULL),
(2019, '21688', 'Xã Hoài Ân', '52', NULL, NULL),
(2020, '21697', 'Xã Ân Hảo', '52', NULL, NULL),
(2021, '21703', 'Xã Vạn Đức', '52', NULL, NULL),
(2022, '21715', 'Xã Ân Tường', '52', NULL, NULL),
(2023, '21727', 'Xã Kim Sơn', '52', NULL, NULL),
(2024, '21730', 'Xã Phù Mỹ', '52', NULL, NULL),
(2025, '21733', 'Xã Bình Dương', '52', NULL, NULL),
(2026, '21739', 'Xã Phù Mỹ Bắc', '52', NULL, NULL),
(2027, '21751', 'Xã Phù Mỹ Đông', '52', NULL, NULL),
(2028, '21757', 'Xã Phù Mỹ Tây', '52', NULL, NULL),
(2029, '21769', 'Xã An Lương', '52', NULL, NULL),
(2030, '21775', 'Xã Phù Mỹ Nam', '52', NULL, NULL),
(2031, '21786', 'Xã Vĩnh Thạnh', '52', NULL, NULL),
(2032, '21787', 'Xã Vĩnh Sơn', '52', NULL, NULL),
(2033, '21796', 'Xã Vĩnh Thịnh', '52', NULL, NULL),
(2034, '21805', 'Xã Vĩnh Quang', '52', NULL, NULL),
(2035, '21808', 'Xã Tây Sơn', '52', NULL, NULL),
(2036, '21817', 'Xã Bình Hiệp', '52', NULL, NULL),
(2037, '21820', 'Xã Bình Khê', '52', NULL, NULL),
(2038, '21829', 'Xã Bình An', '52', NULL, NULL),
(2039, '21835', 'Xã Bình Phú', '52', NULL, NULL),
(2040, '21853', 'Xã Phù Cát', '52', NULL, NULL),
(2041, '21859', 'Xã Đề Gi', '52', NULL, NULL),
(2042, '21868', 'Xã Hội Sơn', '52', NULL, NULL),
(2043, '21871', 'Xã Hòa Hội', '52', NULL, NULL),
(2044, '21880', 'Xã Cát Tiến', '52', NULL, NULL),
(2045, '21892', 'Xã Xuân An', '52', NULL, NULL),
(2046, '21901', 'Xã Ngô Mây', '52', NULL, NULL),
(2047, '21907', 'Phường Bình Định', '52', NULL, NULL),
(2048, '21910', 'Phường An Nhơn', '52', NULL, NULL),
(2049, '21925', 'Phường An Nhơn Bắc', '52', NULL, NULL);
INSERT INTO `wards` (`id`, `ward_code`, `name`, `province_code`, `created_at`, `updated_at`) VALUES
(2050, '21934', 'Phường An Nhơn Đông', '52', NULL, NULL),
(2051, '21940', 'Xã An Nhơn Tây', '52', NULL, NULL),
(2052, '21943', 'Phường An Nhơn Nam', '52', NULL, NULL),
(2053, '21952', 'Xã Tuy Phước', '52', NULL, NULL),
(2054, '21964', 'Xã Tuy Phước Bắc', '52', NULL, NULL),
(2055, '21970', 'Xã Tuy Phước Đông', '52', NULL, NULL),
(2056, '21985', 'Xã Tuy Phước Tây', '52', NULL, NULL),
(2057, '21994', 'Xã Vân Canh', '52', NULL, NULL),
(2058, '21997', 'Xã Canh Liên', '52', NULL, NULL),
(2059, '22006', 'Xã Canh Vinh', '52', NULL, NULL),
(2060, '22015', 'Phường Tuy Hòa', '66', NULL, NULL),
(2061, '22045', 'Phường Bình Kiến', '66', NULL, NULL),
(2062, '22051', 'Phường Sông Cầu', '66', NULL, NULL),
(2063, '22057', 'Xã Xuân Lộc', '66', NULL, NULL),
(2064, '22060', 'Xã Xuân Cảnh', '66', NULL, NULL),
(2065, '22075', 'Xã Xuân Thọ', '66', NULL, NULL),
(2066, '22076', 'Phường Xuân Đài', '66', NULL, NULL),
(2067, '22081', 'Xã Đồng Xuân', '66', NULL, NULL),
(2068, '22090', 'Xã Xuân Lãnh', '66', NULL, NULL),
(2069, '22096', 'Xã Phú Mỡ', '66', NULL, NULL),
(2070, '22111', 'Xã Xuân Phước', '66', NULL, NULL),
(2071, '22114', 'Xã Tuy An Bắc', '66', NULL, NULL),
(2072, '22120', 'Xã Tuy An Đông', '66', NULL, NULL),
(2073, '22132', 'Xã Tuy An Tây', '66', NULL, NULL),
(2074, '22147', 'Xã Ô Loan', '66', NULL, NULL),
(2075, '22153', 'Xã Tuy An Nam', '66', NULL, NULL),
(2076, '22165', 'Xã Sơn Hòa', '66', NULL, NULL),
(2077, '22171', 'Xã Tây Sơn', '66', NULL, NULL),
(2078, '22177', 'Xã Vân Hòa', '66', NULL, NULL),
(2079, '22192', 'Xã Suối Trai', '66', NULL, NULL),
(2080, '22207', 'Xã Sông Hinh', '66', NULL, NULL),
(2081, '22222', 'Xã Đức Bình', '66', NULL, NULL),
(2082, '22225', 'Xã Ea Bá', '66', NULL, NULL),
(2083, '22237', 'Xã Ea Ly', '66', NULL, NULL),
(2084, '22240', 'Phường Phú Yên', '66', NULL, NULL),
(2085, '22250', 'Xã Sơn Thành', '66', NULL, NULL),
(2086, '22255', 'Xã Tây Hòa', '66', NULL, NULL),
(2087, '22258', 'Phường Đông Hòa', '66', NULL, NULL),
(2088, '22261', 'Phường Hòa Hiệp', '66', NULL, NULL),
(2089, '22276', 'Xã Hòa Thịnh', '66', NULL, NULL),
(2090, '22285', 'Xã Hòa Mỹ', '66', NULL, NULL),
(2091, '22291', 'Xã Hòa Xuân', '66', NULL, NULL),
(2092, '22303', 'Xã Phú Hòa 2', '66', NULL, NULL),
(2093, '22319', 'Xã Phú Hòa 1', '66', NULL, NULL),
(2094, '22333', 'Phường Bắc Nha Trang', '56', NULL, NULL),
(2095, '22366', 'Phường Nha Trang', '56', NULL, NULL),
(2096, '22390', 'Phường Tây Nha Trang', '56', NULL, NULL),
(2097, '22402', 'Phường Nam Nha Trang', '56', NULL, NULL),
(2098, '22411', 'Phường Bắc Cam Ranh', '56', NULL, NULL),
(2099, '22420', 'Phường Cam Ranh', '56', NULL, NULL),
(2100, '22423', 'Phường Ba Ngòi', '56', NULL, NULL),
(2101, '22432', 'Phường Cam Linh', '56', NULL, NULL),
(2102, '22435', 'Xã Cam Hiệp', '56', NULL, NULL),
(2103, '22453', 'Xã Cam Lâm', '56', NULL, NULL),
(2104, '22465', 'Xã Cam An', '56', NULL, NULL),
(2105, '22480', 'Xã Nam Cam Ranh', '56', NULL, NULL),
(2106, '22489', 'Xã Vạn Ninh', '56', NULL, NULL),
(2107, '22498', 'Xã Tu Bông', '56', NULL, NULL),
(2108, '22504', 'Xã Đại Lãnh', '56', NULL, NULL),
(2109, '22516', 'Xã Vạn Thắng', '56', NULL, NULL),
(2110, '22525', 'Xã Vạn Hưng', '56', NULL, NULL),
(2111, '22528', 'Phường Ninh Hòa', '56', NULL, NULL),
(2112, '22546', 'Xã Bắc Ninh Hòa', '56', NULL, NULL),
(2113, '22552', 'Xã Tây Ninh Hòa', '56', NULL, NULL),
(2114, '22558', 'Xã Hòa Trí', '56', NULL, NULL),
(2115, '22561', 'Phường Đông Ninh Hòa', '56', NULL, NULL),
(2116, '22576', 'Xã Tân Định', '56', NULL, NULL),
(2117, '22591', 'Phường Hòa Thắng', '56', NULL, NULL),
(2118, '22597', 'Xã Nam Ninh Hòa', '56', NULL, NULL),
(2119, '22609', 'Xã Khánh Vĩnh', '56', NULL, NULL),
(2120, '22612', 'Xã Trung Khánh Vĩnh', '56', NULL, NULL),
(2121, '22615', 'Xã Bắc Khánh Vĩnh', '56', NULL, NULL),
(2122, '22624', 'Xã Tây Khánh Vĩnh', '56', NULL, NULL),
(2123, '22648', 'Xã Nam Khánh Vĩnh', '56', NULL, NULL),
(2124, '22651', 'Xã Diên Khánh', '56', NULL, NULL),
(2125, '22657', 'Xã Diên Điền', '56', NULL, NULL),
(2126, '22660', 'Xã Diên Lâm', '56', NULL, NULL),
(2127, '22672', 'Xã Diên Thọ', '56', NULL, NULL),
(2128, '22678', 'Xã Diên Lạc', '56', NULL, NULL),
(2129, '22702', 'Xã Suối Hiệp', '56', NULL, NULL),
(2130, '22708', 'Xã Suối Dầu', '56', NULL, NULL),
(2131, '22714', 'Xã Khánh Sơn', '56', NULL, NULL),
(2132, '22720', 'Xã Tây Khánh Sơn', '56', NULL, NULL),
(2133, '22732', 'Xã Đông Khánh Sơn', '56', NULL, NULL),
(2134, '22736', 'Đặc khu Trường Sa', '56', NULL, NULL),
(2135, '22738', 'Phường Đô Vinh', '56', NULL, NULL),
(2136, '22741', 'Phường Bảo An', '56', NULL, NULL),
(2137, '22759', 'Phường Phan Rang', '56', NULL, NULL),
(2138, '22780', 'Phường Đông Hải', '56', NULL, NULL),
(2139, '22786', 'Xã Bác Ái Tây', '56', NULL, NULL),
(2140, '22795', 'Xã Bác Ái', '56', NULL, NULL),
(2141, '22801', 'Xã Bác Ái Đông', '56', NULL, NULL),
(2142, '22810', 'Xã Ninh Sơn', '56', NULL, NULL),
(2143, '22813', 'Xã Lâm Sơn', '56', NULL, NULL),
(2144, '22822', 'Xã Mỹ Sơn', '56', NULL, NULL),
(2145, '22828', 'Xã Anh Dũng', '56', NULL, NULL),
(2146, '22834', 'Phường Ninh Chử', '56', NULL, NULL),
(2147, '22840', 'Xã Công Hải', '56', NULL, NULL),
(2148, '22846', 'Xã Vĩnh Hải', '56', NULL, NULL),
(2149, '22849', 'Xã Thuận Bắc', '56', NULL, NULL),
(2150, '22852', 'Xã Ninh Hải', '56', NULL, NULL),
(2151, '22861', 'Xã Xuân Hải', '56', NULL, NULL),
(2152, '22870', 'Xã Ninh Phước', '56', NULL, NULL),
(2153, '22873', 'Xã Phước Hậu', '56', NULL, NULL),
(2154, '22888', 'Xã Phước Dinh', '56', NULL, NULL),
(2155, '22891', 'Xã Phước Hữu', '56', NULL, NULL),
(2156, '22897', 'Xã Thuận Nam', '56', NULL, NULL),
(2157, '22900', 'Xã Phước Hà', '56', NULL, NULL),
(2158, '22909', 'Xã Cà Ná', '56', NULL, NULL),
(2159, '22918', 'Phường Mũi Né', '68', NULL, NULL),
(2160, '22924', 'Phường Phú Thủy', '68', NULL, NULL),
(2161, '22933', 'Phường Hàm Thắng', '68', NULL, NULL),
(2162, '22945', 'Phường Phan Thiết', '68', NULL, NULL),
(2163, '22954', 'Phường Tiến Thành', '68', NULL, NULL),
(2164, '22960', 'Phường Bình Thuận', '68', NULL, NULL),
(2165, '22963', 'Xã Tuyên Quang', '68', NULL, NULL),
(2166, '22969', 'Xã Liên Hương', '68', NULL, NULL),
(2167, '22972', 'Xã Phan Rí Cửa', '68', NULL, NULL),
(2168, '22978', 'Xã Tuy Phong', '68', NULL, NULL),
(2169, '22981', 'Xã Vĩnh Hảo', '68', NULL, NULL),
(2170, '23005', 'Xã Bắc Bình', '68', NULL, NULL),
(2171, '23008', 'Xã Phan Sơn', '68', NULL, NULL),
(2172, '23020', 'Xã Hải Ninh', '68', NULL, NULL),
(2173, '23023', 'Xã Sông Lũy', '68', NULL, NULL),
(2174, '23032', 'Xã Lương Sơn', '68', NULL, NULL),
(2175, '23041', 'Xã Hồng Thái', '68', NULL, NULL),
(2176, '23053', 'Xã Hòa Thắng', '68', NULL, NULL),
(2177, '23059', 'Xã Hàm Thuận', '68', NULL, NULL),
(2178, '23065', 'Xã La Dạ', '68', NULL, NULL),
(2179, '23074', 'Xã Đông Giang', '68', NULL, NULL),
(2180, '23086', 'Xã Hồng Sơn', '68', NULL, NULL),
(2181, '23089', 'Xã Hàm Thuận Bắc', '68', NULL, NULL),
(2182, '23095', 'Xã Hàm Liêm', '68', NULL, NULL),
(2183, '23110', 'Xã Hàm Thuận Nam', '68', NULL, NULL),
(2184, '23122', 'Xã Hàm Thạnh', '68', NULL, NULL),
(2185, '23128', 'Xã Hàm Kiệm', '68', NULL, NULL),
(2186, '23134', 'Xã Tân Lập', '68', NULL, NULL),
(2187, '23143', 'Xã Tân Thành', '68', NULL, NULL),
(2188, '23149', 'Xã Tánh Linh', '68', NULL, NULL),
(2189, '23152', 'Xã Bắc Ruộng', '68', NULL, NULL),
(2190, '23158', 'Xã Nghị Đức', '68', NULL, NULL),
(2191, '23173', 'Xã Đồng Kho', '68', NULL, NULL),
(2192, '23188', 'Xã Suối Kiết', '68', NULL, NULL),
(2193, '23191', 'Xã Đức Linh', '68', NULL, NULL),
(2194, '23194', 'Xã Hoài Đức', '68', NULL, NULL),
(2195, '23200', 'Xã Nam Thành', '68', NULL, NULL),
(2196, '23227', 'Xã Trà Tân', '68', NULL, NULL),
(2197, '23230', 'Xã Tân Minh', '68', NULL, NULL),
(2198, '23231', 'Phường Phước Hội', '68', NULL, NULL),
(2199, '23235', 'Phường La Gi', '68', NULL, NULL),
(2200, '23236', 'Xã Hàm Tân', '68', NULL, NULL),
(2201, '23246', 'Xã Tân Hải', '68', NULL, NULL),
(2202, '23266', 'Xã Sơn Mỹ', '68', NULL, NULL),
(2203, '23272', 'Đặc khu Phú Quý', '68', NULL, NULL),
(2204, '23284', 'Phường Đăk Cấm', '51', NULL, NULL),
(2205, '23293', 'Phường Kon Tum', '51', NULL, NULL),
(2206, '23302', 'Phường Đăk Bla', '51', NULL, NULL),
(2207, '23317', 'Xã Ngọk Bay', '51', NULL, NULL),
(2208, '23326', 'Xã Ia Chim', '51', NULL, NULL),
(2209, '23332', 'Xã Đăk Rơ Wa', '51', NULL, NULL),
(2210, '23341', 'Xã Đăk Pék', '51', NULL, NULL),
(2211, '23344', 'Xã Đăk Plô', '51', NULL, NULL),
(2212, '23356', 'Xã Xốp', '51', NULL, NULL),
(2213, '23365', 'Xã Ngọc Linh', '51', NULL, NULL),
(2214, '23368', 'Xã Đăk Long', '51', NULL, NULL),
(2215, '23374', 'Xã Đăk Môn', '51', NULL, NULL),
(2216, '23377', 'Xã Bờ Y', '51', NULL, NULL),
(2217, '23383', 'Xã Dục Nông', '51', NULL, NULL),
(2218, '23392', 'Xã Sa Loong', '51', NULL, NULL),
(2219, '23401', 'Xã Đăk Tô', '51', NULL, NULL),
(2220, '23416', 'Xã Đăk Sao', '51', NULL, NULL),
(2221, '23419', 'Xã Đăk Tờ Kan', '51', NULL, NULL),
(2222, '23425', 'Xã Tu Mơ Rông', '51', NULL, NULL),
(2223, '23428', 'Xã Ngọk Tụ', '51', NULL, NULL),
(2224, '23430', 'Xã Kon Đào', '51', NULL, NULL),
(2225, '23446', 'Xã Măng Ri', '51', NULL, NULL),
(2226, '23455', 'Xã Măng Bút', '51', NULL, NULL),
(2227, '23473', 'Xã Măng Đen', '51', NULL, NULL),
(2228, '23476', 'Xã Kon Plông', '51', NULL, NULL),
(2229, '23479', 'Xã Đăk Rve', '51', NULL, NULL),
(2230, '23485', 'Xã Đăk Kôi', '51', NULL, NULL),
(2231, '23497', 'Xã Kon Braih', '51', NULL, NULL),
(2232, '23500', 'Xã Đăk Hà', '51', NULL, NULL),
(2233, '23504', 'Xã Đăk Pxi', '51', NULL, NULL),
(2234, '23510', 'Xã Đăk Ui', '51', NULL, NULL),
(2235, '23512', 'Xã Đăk Mar', '51', NULL, NULL),
(2236, '23515', 'Xã Ngọk Réo', '51', NULL, NULL),
(2237, '23527', 'Xã Sa Thầy', '51', NULL, NULL),
(2238, '23530', 'Xã Rờ Kơi', '51', NULL, NULL),
(2239, '23534', 'Xã Sa Bình', '51', NULL, NULL),
(2240, '23535', 'Xã Ia Đal', '51', NULL, NULL),
(2241, '23536', 'Xã Mô Rai', '51', NULL, NULL),
(2242, '23538', 'Xã Ia Tơi', '51', NULL, NULL),
(2243, '23548', 'Xã Ya Ly', '51', NULL, NULL),
(2244, '23563', 'Phường Diên Hồng', '52', NULL, NULL),
(2245, '23575', 'Phường Pleiku', '52', NULL, NULL),
(2246, '23584', 'Phường Thống Nhất', '52', NULL, NULL),
(2247, '23586', 'Phường Hội Phú', '52', NULL, NULL),
(2248, '23590', 'Xã Biển Hồ', '52', NULL, NULL),
(2249, '23602', 'Phường An Phú', '52', NULL, NULL),
(2250, '23611', 'Xã Gào', '52', NULL, NULL),
(2251, '23614', 'Phường An Bình', '52', NULL, NULL),
(2252, '23617', 'Phường An Khê', '52', NULL, NULL),
(2253, '23629', 'Xã Cửu An', '52', NULL, NULL),
(2254, '23638', 'Xã Kbang', '52', NULL, NULL),
(2255, '23644', 'Xã Đak Rong', '52', NULL, NULL),
(2256, '23647', 'Xã Sơn Lang', '52', NULL, NULL),
(2257, '23650', 'Xã Krong', '52', NULL, NULL),
(2258, '23668', 'Xã Tơ Tung', '52', NULL, NULL),
(2259, '23674', 'Xã Kông Bơ La', '52', NULL, NULL),
(2260, '23677', 'Xã Đak Đoa', '52', NULL, NULL),
(2261, '23683', 'Xã Đak Sơmei', '52', NULL, NULL),
(2262, '23701', 'Xã Kon Gang', '52', NULL, NULL),
(2263, '23710', 'Xã Ia Băng', '52', NULL, NULL),
(2264, '23714', 'Xã KDang', '52', NULL, NULL),
(2265, '23722', 'Xã Chư Păh', '52', NULL, NULL),
(2266, '23728', 'Xã Ia Khươl', '52', NULL, NULL),
(2267, '23734', 'Xã Ia Ly', '52', NULL, NULL),
(2268, '23737', 'Xã Ia Mơ', '52', NULL, NULL),
(2269, '23749', 'Xã Ia Phí', '52', NULL, NULL),
(2270, '23764', 'Xã Ia Grai', '52', NULL, NULL),
(2271, '23767', 'Xã Ia Hrung', '52', NULL, NULL),
(2272, '23776', 'Xã Ia Krái', '52', NULL, NULL),
(2273, '23782', 'Xã Ia O', '52', NULL, NULL),
(2274, '23788', 'Xã Ia Chia', '52', NULL, NULL),
(2275, '23794', 'Xã Mang Yang', '52', NULL, NULL),
(2276, '23798', 'Xã Ayun', '52', NULL, NULL),
(2277, '23799', 'Xã Hra', '52', NULL, NULL),
(2278, '23812', 'Xã Lơ Pang', '52', NULL, NULL),
(2279, '23818', 'Xã Kon Chiêng', '52', NULL, NULL),
(2280, '23824', 'Xã Kông Chro', '52', NULL, NULL),
(2281, '23830', 'Xã Chư Krey', '52', NULL, NULL),
(2282, '23833', 'Xã Ya Ma', '52', NULL, NULL),
(2283, '23839', 'Xã SRó', '52', NULL, NULL),
(2284, '23842', 'Xã Đăk Song', '52', NULL, NULL),
(2285, '23851', 'Xã Chơ Long', '52', NULL, NULL),
(2286, '23857', 'Xã Đức Cơ', '52', NULL, NULL),
(2287, '23866', 'Xã Ia Krêl', '52', NULL, NULL),
(2288, '23869', 'Xã Ia Dơk', '52', NULL, NULL),
(2289, '23872', 'Xã Ia Dom', '52', NULL, NULL),
(2290, '23881', 'Xã Ia Pnôn', '52', NULL, NULL),
(2291, '23884', 'Xã Ia Nan', '52', NULL, NULL),
(2292, '23887', 'Xã Chư Prông', '52', NULL, NULL),
(2293, '23896', 'Xã Bàu Cạn', '52', NULL, NULL),
(2294, '23908', 'Xã Ia Tôr', '52', NULL, NULL),
(2295, '23911', 'Xã Ia Boòng', '52', NULL, NULL),
(2296, '23917', 'Xã Ia Púch', '52', NULL, NULL),
(2297, '23926', 'Xã Ia Pia', '52', NULL, NULL),
(2298, '23935', 'Xã Ia Lâu', '52', NULL, NULL),
(2299, '23941', 'Xã Chư Sê', '52', NULL, NULL),
(2300, '23942', 'Xã Chư Pưh', '52', NULL, NULL),
(2301, '23947', 'Xã Bờ Ngoong', '52', NULL, NULL),
(2302, '23954', 'Xã Al Bá', '52', NULL, NULL),
(2303, '23971', 'Xã Ia Hrú', '52', NULL, NULL),
(2304, '23977', 'Xã Ia Ko', '52', NULL, NULL),
(2305, '23986', 'Xã Ia Le', '52', NULL, NULL),
(2306, '23995', 'Xã Đak Pơ', '52', NULL, NULL),
(2307, '24007', 'Xã Ya Hội', '52', NULL, NULL),
(2308, '24013', 'Xã Pờ Tó', '52', NULL, NULL),
(2309, '24022', 'Xã Ia Pa', '52', NULL, NULL),
(2310, '24028', 'Xã Ia Tul', '52', NULL, NULL),
(2311, '24043', 'Xã Phú Thiện', '52', NULL, NULL),
(2312, '24044', 'Phường Ayun Pa', '52', NULL, NULL),
(2313, '24049', 'Xã Chư A Thai', '52', NULL, NULL),
(2314, '24061', 'Xã Ia Hiao', '52', NULL, NULL),
(2315, '24065', 'Xã Ia Rbol', '52', NULL, NULL),
(2316, '24073', 'Xã Ia Sao', '52', NULL, NULL),
(2317, '24076', 'Xã Phú Túc', '52', NULL, NULL),
(2318, '24100', 'Xã Ia Dreh', '52', NULL, NULL),
(2319, '24109', 'Xã Uar', '52', NULL, NULL),
(2320, '24112', 'Xã Ia Rsai', '52', NULL, NULL),
(2321, '24121', 'Phường Tân Lập', '66', NULL, NULL),
(2322, '24133', 'Phường Buôn Ma Thuột', '66', NULL, NULL),
(2323, '24154', 'Phường Thành Nhất', '66', NULL, NULL),
(2324, '24163', 'Phường Tân An', '66', NULL, NULL),
(2325, '24169', 'Phường Ea Kao', '66', NULL, NULL),
(2326, '24175', 'Xã Hòa Phú', '66', NULL, NULL),
(2327, '24181', 'Xã Ea Drăng', '66', NULL, NULL),
(2328, '24184', 'Xã Ea H’Leo', '66', NULL, NULL),
(2329, '24187', 'Xã Ea Hiao', '66', NULL, NULL),
(2330, '24193', 'Xã Ea Wy', '66', NULL, NULL),
(2331, '24208', 'Xã Ea Khăl', '66', NULL, NULL),
(2332, '24211', 'Xã Ea Súp', '66', NULL, NULL),
(2333, '24214', 'Xã Ia Lốp', '66', NULL, NULL),
(2334, '24217', 'Xã Ea Rốk', '66', NULL, NULL),
(2335, '24221', 'Xã Ia Rvê', '66', NULL, NULL),
(2336, '24229', 'Xã Ea Bung', '66', NULL, NULL),
(2337, '24235', 'Xã Buôn Đôn', '66', NULL, NULL),
(2338, '24241', 'Xã Ea Wer', '66', NULL, NULL),
(2339, '24250', 'Xã Ea Nuôl', '66', NULL, NULL),
(2340, '24259', 'Xã Quảng Phú', '66', NULL, NULL),
(2341, '24265', 'Xã Ea Kiết', '66', NULL, NULL),
(2342, '24277', 'Xã Ea Tul', '66', NULL, NULL),
(2343, '24280', 'Xã Cư M’gar', '66', NULL, NULL),
(2344, '24286', 'Xã Ea M’Droh', '66', NULL, NULL),
(2345, '24301', 'Xã Cuôr Đăng', '66', NULL, NULL),
(2346, '24305', 'Phường Buôn Hồ', '66', NULL, NULL),
(2347, '24310', 'Xã Krông Búk', '66', NULL, NULL),
(2348, '24313', 'Xã Cư Pơng', '66', NULL, NULL),
(2349, '24316', 'Xã Pơng Drang', '66', NULL, NULL),
(2350, '24328', 'Xã Ea Drông', '66', NULL, NULL),
(2351, '24340', 'Phường Cư Bao', '66', NULL, NULL),
(2352, '24343', 'Xã Krông Năng', '66', NULL, NULL),
(2353, '24346', 'Xã Dliê Ya', '66', NULL, NULL),
(2354, '24352', 'Xã Tam Giang', '66', NULL, NULL),
(2355, '24364', 'Xã Phú Xuân', '66', NULL, NULL),
(2356, '24373', 'Xã Ea Kar', '66', NULL, NULL),
(2357, '24376', 'Xã Ea Knốp', '66', NULL, NULL),
(2358, '24400', 'Xã Ea Păl', '66', NULL, NULL),
(2359, '24403', 'Xã Ea Ô', '66', NULL, NULL),
(2360, '24406', 'Xã Cư Yang', '66', NULL, NULL),
(2361, '24412', 'Xã M’Drắk', '66', NULL, NULL),
(2362, '24415', 'Xã Cư Prao', '66', NULL, NULL),
(2363, '24433', 'Xã Ea Riêng', '66', NULL, NULL),
(2364, '24436', 'Xã Cư M’ta', '66', NULL, NULL),
(2365, '24444', 'Xã Krông Á', '66', NULL, NULL),
(2366, '24445', 'Xã Ea Trang', '66', NULL, NULL),
(2367, '24448', 'Xã Krông Bông', '66', NULL, NULL),
(2368, '24454', 'Xã Dang Kang', '66', NULL, NULL),
(2369, '24472', 'Xã Hòa Sơn', '66', NULL, NULL),
(2370, '24478', 'Xã Cư Pui', '66', NULL, NULL),
(2371, '24484', 'Xã Yang Mao', '66', NULL, NULL),
(2372, '24490', 'Xã Krông Pắc', '66', NULL, NULL),
(2373, '24496', 'Xã Ea Kly', '66', NULL, NULL),
(2374, '24502', 'Xã Ea Phê', '66', NULL, NULL),
(2375, '24505', 'Xã Ea Knuếc', '66', NULL, NULL),
(2376, '24526', 'Xã Tân Tiến', '66', NULL, NULL),
(2377, '24529', 'Xã Vụ Bổn', '66', NULL, NULL),
(2378, '24538', 'Xã Krông Ana', '66', NULL, NULL),
(2379, '24540', 'Xã Ea Ning', '66', NULL, NULL),
(2380, '24544', 'Xã Ea Ktur', '66', NULL, NULL),
(2381, '24559', 'Xã Ea Na', '66', NULL, NULL),
(2382, '24561', 'Xã Dray Bhăng', '66', NULL, NULL),
(2383, '24568', 'Xã Dur Kmăl', '66', NULL, NULL),
(2384, '24580', 'Xã Liên Sơn Lắk', '66', NULL, NULL),
(2385, '24595', 'Xã Đắk Liêng', '66', NULL, NULL),
(2386, '24598', 'Xã Đắk Phơi', '66', NULL, NULL),
(2387, '24604', 'Xã Krông Nô', '66', NULL, NULL),
(2388, '24607', 'Xã Nam Ka', '66', NULL, NULL),
(2389, '24611', 'Phường Bắc Gia Nghĩa', '68', NULL, NULL),
(2390, '24615', 'Phường Nam Gia Nghĩa', '68', NULL, NULL),
(2391, '24616', 'Xã Quảng Sơn', '68', NULL, NULL),
(2392, '24617', 'Phường Đông Gia Nghĩa', '68', NULL, NULL),
(2393, '24620', 'Xã Quảng Hòa', '68', NULL, NULL),
(2394, '24631', 'Xã Quảng Khê', '68', NULL, NULL),
(2395, '24637', 'Xã Tà Đùng', '68', NULL, NULL),
(2396, '24640', 'Xã Cư Jút', '68', NULL, NULL),
(2397, '24646', 'Xã Đắk Wil', '68', NULL, NULL),
(2398, '24649', 'Xã Nam Dong', '68', NULL, NULL),
(2399, '24664', 'Xã Đức Lập', '68', NULL, NULL),
(2400, '24670', 'Xã Đắk Mil', '68', NULL, NULL),
(2401, '24678', 'Xã Đắk Sắk', '68', NULL, NULL),
(2402, '24682', 'Xã Thuận An', '68', NULL, NULL),
(2403, '24688', 'Xã Krông Nô', '68', NULL, NULL),
(2404, '24697', 'Xã Nam Đà', '68', NULL, NULL),
(2405, '24703', 'Xã Nâm Nung', '68', NULL, NULL),
(2406, '24712', 'Xã Quảng Phú', '68', NULL, NULL),
(2407, '24717', 'Xã Đức An', '68', NULL, NULL),
(2408, '24718', 'Xã Đắk Song', '68', NULL, NULL),
(2409, '24722', 'Xã Thuận Hạnh', '68', NULL, NULL),
(2410, '24730', 'Xã Trường Xuân', '68', NULL, NULL),
(2411, '24733', 'Xã Kiến Đức', '68', NULL, NULL),
(2412, '24736', 'Xã Quảng Trực', '68', NULL, NULL),
(2413, '24739', 'Xã Tuy Đức', '68', NULL, NULL),
(2414, '24748', 'Xã Quảng Tân', '68', NULL, NULL),
(2415, '24751', 'Xã Nhân Cơ', '68', NULL, NULL),
(2416, '24760', 'Xã Quảng Tín', '68', NULL, NULL),
(2417, '24778', 'Phường Lâm Viên - Đà Lạt', '68', NULL, NULL),
(2418, '24781', 'Phường Xuân Hương - Đà Lạt', '68', NULL, NULL),
(2419, '24787', 'Phường Cam Ly - Đà Lạt', '68', NULL, NULL),
(2420, '24805', 'Phường Xuân Trường - Đà Lạt', '68', NULL, NULL),
(2421, '24820', 'Phường 2 Bảo Lộc', '68', NULL, NULL),
(2422, '24823', 'Phường 1 Bảo Lộc', '68', NULL, NULL),
(2423, '24829', 'Phường B\'Lao', '68', NULL, NULL),
(2424, '24841', 'Phường 3 Bảo Lộc', '68', NULL, NULL),
(2425, '24846', 'Phường Lang Biang - Đà Lạt', '68', NULL, NULL),
(2426, '24848', 'Xã Lạc Dương', '68', NULL, NULL),
(2427, '24853', 'Xã Đam Rông 4', '68', NULL, NULL),
(2428, '24868', 'Xã Nam Ban Lâm Hà', '68', NULL, NULL),
(2429, '24871', 'Xã Đinh Văn Lâm Hà', '68', NULL, NULL),
(2430, '24875', 'Xã Đam Rông 3', '68', NULL, NULL),
(2431, '24877', 'Xã Đam Rông 2', '68', NULL, NULL),
(2432, '24883', 'Xã Nam Hà Lâm Hà', '68', NULL, NULL),
(2433, '24886', 'Xã Đam Rông 1', '68', NULL, NULL),
(2434, '24895', 'Xã Phú Sơn Lâm Hà', '68', NULL, NULL),
(2435, '24907', 'Xã Phúc Thọ Lâm Hà', '68', NULL, NULL),
(2436, '24916', 'Xã Tân Hà Lâm Hà', '68', NULL, NULL),
(2437, '24931', 'Xã Đơn Dương', '68', NULL, NULL),
(2438, '24934', 'Xã D\'Ran', '68', NULL, NULL),
(2439, '24943', 'Xã Ka Đô', '68', NULL, NULL),
(2440, '24955', 'Xã Quảng Lập', '68', NULL, NULL),
(2441, '24958', 'Xã Đức Trọng', '68', NULL, NULL),
(2442, '24967', 'Xã Hiệp Thạnh', '68', NULL, NULL),
(2443, '24976', 'Xã Tân Hội', '68', NULL, NULL),
(2444, '24985', 'Xã Ninh Gia', '68', NULL, NULL),
(2445, '24988', 'Xã Tà Năng', '68', NULL, NULL),
(2446, '24991', 'Xã Tà Hine', '68', NULL, NULL),
(2447, '25000', 'Xã Di Linh', '68', NULL, NULL),
(2448, '25007', 'Xã Đinh Trang Thượng', '68', NULL, NULL),
(2449, '25015', 'Xã Gia Hiệp', '68', NULL, NULL),
(2450, '25018', 'Xã Bảo Thuận', '68', NULL, NULL),
(2451, '25036', 'Xã Hòa Ninh', '68', NULL, NULL),
(2452, '25042', 'Xã Hòa Bắc', '68', NULL, NULL),
(2453, '25051', 'Xã Sơn Điền', '68', NULL, NULL),
(2454, '25054', 'Xã Bảo Lâm 1', '68', NULL, NULL),
(2455, '25057', 'Xã Bảo Lâm 5', '68', NULL, NULL),
(2456, '25063', 'Xã Bảo Lâm 4', '68', NULL, NULL),
(2457, '25084', 'Xã Bảo Lâm 2', '68', NULL, NULL),
(2458, '25093', 'Xã Bảo Lâm 3', '68', NULL, NULL),
(2459, '25099', 'Xã Đạ Huoai', '68', NULL, NULL),
(2460, '25105', 'Xã Đạ Huoai 2', '68', NULL, NULL),
(2461, '25114', 'Xã Đạ Huoai 3', '68', NULL, NULL),
(2462, '25126', 'Xã Đạ Tẻh', '68', NULL, NULL),
(2463, '25135', 'Xã Đạ Tẻh 3', '68', NULL, NULL),
(2464, '25138', 'Xã Đạ Tẻh 2', '68', NULL, NULL),
(2465, '25159', 'Xã Cát Tiên', '68', NULL, NULL),
(2466, '25162', 'Xã Cát Tiên 3', '68', NULL, NULL),
(2467, '25180', 'Xã Cát Tiên 2', '68', NULL, NULL),
(2468, '25195', 'Phường Bình Phước', '75', NULL, NULL),
(2469, '25210', 'Phường Đồng Xoài', '75', NULL, NULL),
(2470, '25217', 'Phường Phước Long', '75', NULL, NULL),
(2471, '25220', 'Phường Phước Bình', '75', NULL, NULL),
(2472, '25222', 'Xã Bù Gia Mập', '75', NULL, NULL),
(2473, '25225', 'Xã Đăk Ơ', '75', NULL, NULL),
(2474, '25231', 'Xã Đa Kia', '75', NULL, NULL),
(2475, '25246', 'Xã Bình Tân', '75', NULL, NULL),
(2476, '25252', 'Xã Phú Riềng', '75', NULL, NULL),
(2477, '25255', 'Xã Long Hà', '75', NULL, NULL),
(2478, '25261', 'Xã Phú Trung', '75', NULL, NULL),
(2479, '25267', 'Xã Phú Nghĩa', '75', NULL, NULL),
(2480, '25270', 'Xã Lộc Ninh', '75', NULL, NULL),
(2481, '25279', 'Xã Lộc Tấn', '75', NULL, NULL),
(2482, '25280', 'Xã Lộc Thạnh', '75', NULL, NULL),
(2483, '25292', 'Xã Lộc Quang', '75', NULL, NULL),
(2484, '25294', 'Xã Lộc Thành', '75', NULL, NULL),
(2485, '25303', 'Xã Lộc Hưng', '75', NULL, NULL),
(2486, '25308', 'Xã Thiện Hưng', '75', NULL, NULL),
(2487, '25309', 'Xã Hưng Phước', '75', NULL, NULL),
(2488, '25318', 'Xã Tân Tiến', '75', NULL, NULL),
(2489, '25326', 'Phường Bình Long', '75', NULL, NULL),
(2490, '25333', 'Phường An Lộc', '75', NULL, NULL),
(2491, '25345', 'Xã Tân Hưng', '75', NULL, NULL),
(2492, '25349', 'Xã Minh Đức', '75', NULL, NULL),
(2493, '25351', 'Xã Tân Quan', '75', NULL, NULL),
(2494, '25357', 'Xã Tân Khai', '75', NULL, NULL),
(2495, '25363', 'Xã Đồng Phú', '75', NULL, NULL),
(2496, '25378', 'Xã Tân Lợi', '75', NULL, NULL),
(2497, '25387', 'Xã Thuận Lợi', '75', NULL, NULL),
(2498, '25390', 'Xã Đồng Tâm', '75', NULL, NULL),
(2499, '25396', 'Xã Bù Đăng', '75', NULL, NULL),
(2500, '25399', 'Xã Đak Nhau', '75', NULL, NULL),
(2501, '25402', 'Xã Thọ Sơn', '75', NULL, NULL),
(2502, '25405', 'Xã Bom Bo', '75', NULL, NULL),
(2503, '25417', 'Xã Nghĩa Trung', '75', NULL, NULL),
(2504, '25420', 'Xã Phước Sơn', '75', NULL, NULL),
(2505, '25432', 'Phường Chơn Thành', '75', NULL, NULL),
(2506, '25441', 'Phường Minh Hưng', '75', NULL, NULL),
(2507, '25450', 'Xã Nha Bích', '75', NULL, NULL),
(2508, '25459', 'Phường Tân Ninh', '80', NULL, NULL),
(2509, '25480', 'Phường Bình Minh', '80', NULL, NULL),
(2510, '25486', 'Xã Tân Biên', '80', NULL, NULL),
(2511, '25489', 'Xã Tân Lập', '80', NULL, NULL),
(2512, '25498', 'Xã Thạnh Bình', '80', NULL, NULL),
(2513, '25510', 'Xã Trà Vong', '80', NULL, NULL),
(2514, '25516', 'Xã Tân Châu', '80', NULL, NULL),
(2515, '25522', 'Xã Tân Đông', '80', NULL, NULL),
(2516, '25525', 'Xã Tân Hội', '80', NULL, NULL),
(2517, '25531', 'Xã Tân Hòa', '80', NULL, NULL),
(2518, '25534', 'Xã Tân Thành', '80', NULL, NULL),
(2519, '25549', 'Xã Tân Phú', '80', NULL, NULL),
(2520, '25552', 'Xã Dương Minh Châu', '80', NULL, NULL),
(2521, '25567', 'Phường Ninh Thạnh', '80', NULL, NULL),
(2522, '25573', 'Xã Cầu Khởi', '80', NULL, NULL),
(2523, '25579', 'Xã Lộc Ninh', '80', NULL, NULL),
(2524, '25585', 'Xã Châu Thành', '80', NULL, NULL),
(2525, '25588', 'Xã Hảo Đước', '80', NULL, NULL),
(2526, '25591', 'Xã Phước Vinh', '80', NULL, NULL),
(2527, '25606', 'Xã Hòa Hội', '80', NULL, NULL),
(2528, '25621', 'Xã Ninh Điền', '80', NULL, NULL),
(2529, '25630', 'Phường Long Hoa', '80', NULL, NULL),
(2530, '25633', 'Phường Thanh Điền', '80', NULL, NULL),
(2531, '25645', 'Phường Hòa Thành', '80', NULL, NULL),
(2532, '25654', 'Phường Gò Dầu', '80', NULL, NULL),
(2533, '25657', 'Xã Thạnh Đức', '80', NULL, NULL),
(2534, '25663', 'Xã Phước Thạnh', '80', NULL, NULL),
(2535, '25666', 'Xã Truông Mít', '80', NULL, NULL),
(2536, '25672', 'Phường Gia Lộc', '80', NULL, NULL),
(2537, '25681', 'Xã Bến Cầu', '80', NULL, NULL),
(2538, '25684', 'Xã Long Chữ', '80', NULL, NULL),
(2539, '25702', 'Xã Long Thuận', '80', NULL, NULL),
(2540, '25708', 'Phường Trảng Bàng', '80', NULL, NULL),
(2541, '25711', 'Xã Hưng Thuận', '80', NULL, NULL),
(2542, '25729', 'Xã Phước Chỉ', '80', NULL, NULL),
(2543, '25732', 'Phường An Tịnh', '80', NULL, NULL),
(2544, '25747', 'Phường Thủ Dầu Một', '79', NULL, NULL),
(2545, '25750', 'Phường Phú Lợi', '79', NULL, NULL),
(2546, '25760', 'Phường Bình Dương', '79', NULL, NULL),
(2547, '25768', 'Phường Phú An', '79', NULL, NULL),
(2548, '25771', 'Phường Chánh Hiệp', '79', NULL, NULL),
(2549, '25777', 'Xã Dầu Tiếng', '79', NULL, NULL),
(2550, '25780', 'Xã Minh Thạnh', '79', NULL, NULL),
(2551, '25792', 'Xã Long Hòa', '79', NULL, NULL),
(2552, '25807', 'Xã Thanh An', '79', NULL, NULL),
(2553, '25813', 'Phường Bến Cát', '79', NULL, NULL),
(2554, '25819', 'Xã Trừ Văn Thố', '79', NULL, NULL),
(2555, '25822', 'Xã Bàu Bàng', '79', NULL, NULL),
(2556, '25837', 'Phường Chánh Phú Hòa', '79', NULL, NULL),
(2557, '25840', 'Phường Long Nguyên', '79', NULL, NULL),
(2558, '25843', 'Phường Tây Nam', '79', NULL, NULL),
(2559, '25846', 'Phường Thới Hòa', '79', NULL, NULL),
(2560, '25849', 'Phường Hòa Lợi', '79', NULL, NULL),
(2561, '25858', 'Xã Phú Giáo', '79', NULL, NULL),
(2562, '25864', 'Xã Phước Thành', '79', NULL, NULL),
(2563, '25867', 'Xã An Long', '79', NULL, NULL),
(2564, '25882', 'Xã Phước Hòa', '79', NULL, NULL),
(2565, '25888', 'Phường Tân Uyên', '79', NULL, NULL),
(2566, '25891', 'Phường Tân Khánh', '79', NULL, NULL),
(2567, '25906', 'Xã Bắc Tân Uyên', '79', NULL, NULL),
(2568, '25909', 'Xã Thường Tân', '79', NULL, NULL),
(2569, '25912', 'Phường Vĩnh Tân', '79', NULL, NULL),
(2570, '25915', 'Phường Bình Cơ', '79', NULL, NULL),
(2571, '25920', 'Phường Tân Hiệp', '79', NULL, NULL),
(2572, '25942', 'Phường Dĩ An', '79', NULL, NULL),
(2573, '25945', 'Phường Tân Đông Hiệp', '79', NULL, NULL),
(2574, '25951', 'Phường Đông Hòa', '79', NULL, NULL),
(2575, '25966', 'Phường Lái Thiêu', '79', NULL, NULL),
(2576, '25969', 'Phường Thuận Giao', '79', NULL, NULL),
(2577, '25975', 'Phường An Phú', '79', NULL, NULL),
(2578, '25978', 'Phường Thuận An', '79', NULL, NULL),
(2579, '25987', 'Phường Bình Hòa', '79', NULL, NULL),
(2580, '25993', 'Phường Trảng Dài', '75', NULL, NULL),
(2581, '26005', 'Phường Hố Nai', '75', NULL, NULL),
(2582, '26017', 'Phường Tam Hiệp', '75', NULL, NULL),
(2583, '26020', 'Phường Long Bình', '75', NULL, NULL),
(2584, '26041', 'Phường Trấn Biên', '75', NULL, NULL),
(2585, '26068', 'Phường Biên Hòa', '75', NULL, NULL),
(2586, '26080', 'Phường Long Khánh', '75', NULL, NULL),
(2587, '26089', 'Phường Bình Lộc', '75', NULL, NULL),
(2588, '26098', 'Phường Bảo Vinh', '75', NULL, NULL),
(2589, '26104', 'Phường Xuân Lập', '75', NULL, NULL),
(2590, '26113', 'Phường Hàng Gòn', '75', NULL, NULL),
(2591, '26116', 'Xã Tân Phú', '75', NULL, NULL),
(2592, '26119', 'Xã Đak Lua', '75', NULL, NULL),
(2593, '26122', 'Xã Nam Cát Tiên', '75', NULL, NULL),
(2594, '26134', 'Xã Tà Lài', '75', NULL, NULL),
(2595, '26158', 'Xã Phú Lâm', '75', NULL, NULL),
(2596, '26170', 'Xã Trị An', '75', NULL, NULL),
(2597, '26173', 'Xã Phú Lý', '75', NULL, NULL),
(2598, '26179', 'Xã Tân An', '75', NULL, NULL),
(2599, '26188', 'Phường Tân Triều', '75', NULL, NULL),
(2600, '26206', 'Xã Định Quán', '75', NULL, NULL),
(2601, '26209', 'Xã Thanh Sơn', '75', NULL, NULL),
(2602, '26215', 'Xã Phú Vinh', '75', NULL, NULL),
(2603, '26221', 'Xã Phú Hòa', '75', NULL, NULL),
(2604, '26227', 'Xã La Ngà', '75', NULL, NULL),
(2605, '26248', 'Xã Trảng Bom', '75', NULL, NULL),
(2606, '26254', 'Xã Bàu Hàm', '75', NULL, NULL),
(2607, '26278', 'Xã Bình Minh', '75', NULL, NULL),
(2608, '26281', 'Xã Hưng Thịnh', '75', NULL, NULL),
(2609, '26296', 'Xã An Viễn', '75', NULL, NULL),
(2610, '26299', 'Xã Thống Nhất', '75', NULL, NULL),
(2611, '26311', 'Xã Gia Kiệm', '75', NULL, NULL),
(2612, '26326', 'Xã Dầu Giây', '75', NULL, NULL),
(2613, '26332', 'Xã Xuân Quế', '75', NULL, NULL),
(2614, '26341', 'Xã Cẩm Mỹ', '75', NULL, NULL),
(2615, '26347', 'Xã Xuân Đường', '75', NULL, NULL),
(2616, '26359', 'Xã Xuân Đông', '75', NULL, NULL),
(2617, '26362', 'Xã Sông Ray', '75', NULL, NULL),
(2618, '26368', 'Xã Long Thành', '75', NULL, NULL),
(2619, '26374', 'Phường Tam Phước', '75', NULL, NULL),
(2620, '26377', 'Phường Phước Tân', '75', NULL, NULL),
(2621, '26380', 'Phường Long Hưng', '75', NULL, NULL),
(2622, '26383', 'Xã An Phước', '75', NULL, NULL),
(2623, '26389', 'Xã Bình An', '75', NULL, NULL),
(2624, '26413', 'Xã Long Phước', '75', NULL, NULL),
(2625, '26422', 'Xã Phước Thái', '75', NULL, NULL),
(2626, '26425', 'Xã Xuân Lộc', '75', NULL, NULL),
(2627, '26428', 'Xã Xuân Bắc', '75', NULL, NULL),
(2628, '26434', 'Xã Xuân Thành', '75', NULL, NULL),
(2629, '26446', 'Xã Xuân Hòa', '75', NULL, NULL),
(2630, '26458', 'Xã Xuân Phú', '75', NULL, NULL),
(2631, '26461', 'Xã Xuân Định', '75', NULL, NULL),
(2632, '26485', 'Xã Nhơn Trạch', '75', NULL, NULL),
(2633, '26491', 'Xã Đại Phước', '75', NULL, NULL),
(2634, '26503', 'Xã Phước An', '75', NULL, NULL),
(2635, '26506', 'Phường Vũng Tàu', '79', NULL, NULL),
(2636, '26526', 'Phường Tam Thắng', '79', NULL, NULL),
(2637, '26536', 'Phường Rạch Dừa', '79', NULL, NULL),
(2638, '26542', 'Phường Phước Thắng', '79', NULL, NULL),
(2639, '26545', 'Xã Long Sơn', '79', NULL, NULL),
(2640, '26560', 'Phường Bà Rịa', '79', NULL, NULL),
(2641, '26566', 'Phường Long Hương', '79', NULL, NULL),
(2642, '26572', 'Phường Tam Long', '79', NULL, NULL),
(2643, '26575', 'Xã Ngãi Giao', '79', NULL, NULL),
(2644, '26584', 'Xã Xuân Sơn', '79', NULL, NULL),
(2645, '26590', 'Xã Bình Giã', '79', NULL, NULL),
(2646, '26596', 'Xã Châu Đức', '79', NULL, NULL),
(2647, '26608', 'Xã Kim Long', '79', NULL, NULL),
(2648, '26617', 'Xã Nghĩa Thành', '79', NULL, NULL),
(2649, '26620', 'Xã Hồ Tràm', '79', NULL, NULL),
(2650, '26632', 'Xã Xuyên Mộc', '79', NULL, NULL),
(2651, '26638', 'Xã Bàu Lâm', '79', NULL, NULL),
(2652, '26641', 'Xã Hòa Hội', '79', NULL, NULL),
(2653, '26647', 'Xã Hòa Hiệp', '79', NULL, NULL),
(2654, '26656', 'Xã Bình Châu', '79', NULL, NULL),
(2655, '26659', 'Xã Long Điền', '79', NULL, NULL),
(2656, '26662', 'Xã Long Hải', '79', NULL, NULL),
(2657, '26680', 'Xã Đất Đỏ', '79', NULL, NULL),
(2658, '26686', 'Xã Phước Hải', '79', NULL, NULL),
(2659, '26704', 'Phường Phú Mỹ', '79', NULL, NULL),
(2660, '26710', 'Phường Tân Hải', '79', NULL, NULL),
(2661, '26713', 'Phường Tân Phước', '79', NULL, NULL),
(2662, '26725', 'Phường Tân Thành', '79', NULL, NULL),
(2663, '26728', 'Xã Châu Pha', '79', NULL, NULL),
(2664, '26732', 'Đặc khu Côn Đảo', '79', NULL, NULL),
(2665, '26737', 'Phường Tân Định', '79', NULL, NULL),
(2666, '26740', 'Phường Sài Gòn', '79', NULL, NULL),
(2667, '26743', 'Phường Bến Thành', '79', NULL, NULL),
(2668, '26758', 'Phường Cầu Ông Lãnh', '79', NULL, NULL),
(2669, '26767', 'Phường An Phú Đông', '79', NULL, NULL),
(2670, '26773', 'Phường Thới An', '79', NULL, NULL),
(2671, '26782', 'Phường Tân Thới Hiệp', '79', NULL, NULL),
(2672, '26785', 'Phường Trung Mỹ Tây', '79', NULL, NULL),
(2673, '26791', 'Phường Đông Hưng Thuận', '79', NULL, NULL),
(2674, '26800', 'Phường Linh Xuân', '79', NULL, NULL),
(2675, '26803', 'Phường Tam Bình', '79', NULL, NULL),
(2676, '26809', 'Phường Hiệp Bình', '79', NULL, NULL),
(2677, '26824', 'Phường Thủ Đức', '79', NULL, NULL),
(2678, '26833', 'Phường Long Bình', '79', NULL, NULL),
(2679, '26842', 'Phường Tăng Nhơn Phú', '79', NULL, NULL),
(2680, '26848', 'Phường Phước Long', '79', NULL, NULL),
(2681, '26857', 'Phường Long Phước', '79', NULL, NULL),
(2682, '26860', 'Phường Long Trường', '79', NULL, NULL),
(2683, '26876', 'Phường An Nhơn', '79', NULL, NULL),
(2684, '26878', 'Phường An Hội Đông', '79', NULL, NULL),
(2685, '26882', 'Phường An Hội Tây', '79', NULL, NULL),
(2686, '26884', 'Phường Gò Vấp', '79', NULL, NULL),
(2687, '26890', 'Phường Hạnh Thông', '79', NULL, NULL),
(2688, '26898', 'Phường Thông Tây Hội', '79', NULL, NULL),
(2689, '26905', 'Phường Bình Lợi Trung', '79', NULL, NULL),
(2690, '26911', 'Phường Bình Quới', '79', NULL, NULL),
(2691, '26929', 'Phường Bình Thạnh', '79', NULL, NULL),
(2692, '26944', 'Phường Gia Định', '79', NULL, NULL),
(2693, '26956', 'Phường Thạnh Mỹ Tây', '79', NULL, NULL),
(2694, '26968', 'Phường Tân Sơn Nhất', '79', NULL, NULL),
(2695, '26977', 'Phường Tân Sơn Hòa', '79', NULL, NULL),
(2696, '26983', 'Phường Bảy Hiền', '79', NULL, NULL),
(2697, '26995', 'Phường Tân Hòa', '79', NULL, NULL),
(2698, '27004', 'Phường Tân Bình', '79', NULL, NULL),
(2699, '27007', 'Phường Tân Sơn', '79', NULL, NULL),
(2700, '27013', 'Phường Tây Thạnh', '79', NULL, NULL),
(2701, '27019', 'Phường Tân Sơn Nhì', '79', NULL, NULL),
(2702, '27022', 'Phường Phú Thọ Hòa', '79', NULL, NULL),
(2703, '27028', 'Phường Phú Thạnh', '79', NULL, NULL),
(2704, '27031', 'Phường Tân Phú', '79', NULL, NULL),
(2705, '27043', 'Phường Đức Nhuận', '79', NULL, NULL),
(2706, '27058', 'Phường Cầu Kiệu', '79', NULL, NULL),
(2707, '27073', 'Phường Phú Nhuận', '79', NULL, NULL),
(2708, '27094', 'Phường An Khánh', '79', NULL, NULL),
(2709, '27097', 'Phường Bình Trưng', '79', NULL, NULL),
(2710, '27112', 'Phường Cát Lái', '79', NULL, NULL),
(2711, '27139', 'Phường Xuân Hòa', '79', NULL, NULL),
(2712, '27142', 'Phường Nhiêu Lộc', '79', NULL, NULL),
(2713, '27154', 'Phường Bàn Cờ', '79', NULL, NULL),
(2714, '27163', 'Phường Hòa Hưng', '79', NULL, NULL),
(2715, '27169', 'Phường Diên Hồng', '79', NULL, NULL),
(2716, '27190', 'Phường Vườn Lài', '79', NULL, NULL),
(2717, '27211', 'Phường Hòa Bình', '79', NULL, NULL),
(2718, '27226', 'Phường Phú Thọ', '79', NULL, NULL),
(2719, '27232', 'Phường Bình Thới', '79', NULL, NULL),
(2720, '27238', 'Phường Minh Phụng', '79', NULL, NULL),
(2721, '27259', 'Phường Xóm Chiếu', '79', NULL, NULL),
(2722, '27265', 'Phường Khánh Hội', '79', NULL, NULL),
(2723, '27286', 'Phường Vĩnh Hội', '79', NULL, NULL),
(2724, '27301', 'Phường Chợ Quán', '79', NULL, NULL),
(2725, '27316', 'Phường An Đông', '79', NULL, NULL),
(2726, '27343', 'Phường Chợ Lớn', '79', NULL, NULL),
(2727, '27349', 'Phường Phú Lâm', '79', NULL, NULL),
(2728, '27364', 'Phường Bình Phú', '79', NULL, NULL),
(2729, '27367', 'Phường Bình Tây', '79', NULL, NULL),
(2730, '27373', 'Phường Bình Tiên', '79', NULL, NULL),
(2731, '27418', 'Phường Chánh Hưng', '79', NULL, NULL),
(2732, '27424', 'Phường Bình Đông', '79', NULL, NULL),
(2733, '27427', 'Phường Phú Định', '79', NULL, NULL),
(2734, '27439', 'Phường Bình Hưng Hòa', '79', NULL, NULL),
(2735, '27442', 'Phường Bình Tân', '79', NULL, NULL),
(2736, '27448', 'Phường Bình Trị Đông', '79', NULL, NULL),
(2737, '27457', 'Phường Tân Tạo', '79', NULL, NULL),
(2738, '27460', 'Phường An Lạc', '79', NULL, NULL),
(2739, '27475', 'Phường Tân Hưng', '79', NULL, NULL),
(2740, '27478', 'Phường Tân Thuận', '79', NULL, NULL),
(2741, '27484', 'Phường Phú Thuận', '79', NULL, NULL),
(2742, '27487', 'Phường Tân Mỹ', '79', NULL, NULL),
(2743, '27496', 'Xã Tân An Hội', '79', NULL, NULL),
(2744, '27508', 'Xã An Nhơn Tây', '79', NULL, NULL),
(2745, '27511', 'Xã Nhuận Đức', '79', NULL, NULL),
(2746, '27526', 'Xã Thái Mỹ', '79', NULL, NULL),
(2747, '27541', 'Xã Phú Hòa Đông', '79', NULL, NULL),
(2748, '27544', 'Xã Bình Mỹ', '79', NULL, NULL),
(2749, '27553', 'Xã Củ Chi', '79', NULL, NULL),
(2750, '27559', 'Xã Hóc Môn', '79', NULL, NULL),
(2751, '27568', 'Xã Đông Thạnh', '79', NULL, NULL),
(2752, '27577', 'Xã Xuân Thới Sơn', '79', NULL, NULL),
(2753, '27592', 'Xã Bà Điểm', '79', NULL, NULL),
(2754, '27595', 'Xã Tân Nhựt', '79', NULL, NULL),
(2755, '27601', 'Xã Vĩnh Lộc', '79', NULL, NULL),
(2756, '27604', 'Xã Tân Vĩnh Lộc', '79', NULL, NULL),
(2757, '27610', 'Xã Bình Lợi', '79', NULL, NULL),
(2758, '27619', 'Xã Bình Hưng', '79', NULL, NULL),
(2759, '27628', 'Xã Hưng Long', '79', NULL, NULL),
(2760, '27637', 'Xã Bình Chánh', '79', NULL, NULL),
(2761, '27655', 'Xã Nhà Bè', '79', NULL, NULL),
(2762, '27658', 'Xã Hiệp Phước', '79', NULL, NULL),
(2763, '27664', 'Xã Cần Giờ', '79', NULL, NULL),
(2764, '27667', 'Xã Bình Khánh', '79', NULL, NULL),
(2765, '27673', 'Xã An Thới Đông', '79', NULL, NULL),
(2766, '27676', 'Xã Thạnh An', '79', NULL, NULL),
(2767, '27694', 'Phường Long An', '80', NULL, NULL),
(2768, '27712', 'Phường Tân An', '80', NULL, NULL),
(2769, '27715', 'Phường Khánh Hậu', '80', NULL, NULL),
(2770, '27721', 'Xã Tân Hưng', '80', NULL, NULL),
(2771, '27727', 'Xã Hưng Điền', '80', NULL, NULL),
(2772, '27736', 'Xã Vĩnh Thạnh', '80', NULL, NULL),
(2773, '27748', 'Xã Vĩnh Châu', '80', NULL, NULL),
(2774, '27757', 'Xã Vĩnh Hưng', '80', NULL, NULL),
(2775, '27763', 'Xã Khánh Hưng', '80', NULL, NULL),
(2776, '27775', 'Xã Tuyên Bình', '80', NULL, NULL),
(2777, '27787', 'Phường Kiến Tường', '80', NULL, NULL),
(2778, '27793', 'Xã Bình Hiệp', '80', NULL, NULL),
(2779, '27811', 'Xã Bình Hòa', '80', NULL, NULL),
(2780, '27817', 'Xã Tuyên Thạnh', '80', NULL, NULL),
(2781, '27823', 'Xã Mộc Hóa', '80', NULL, NULL),
(2782, '27826', 'Xã Tân Thạnh', '80', NULL, NULL),
(2783, '27838', 'Xã Nhơn Hòa Lập', '80', NULL, NULL),
(2784, '27841', 'Xã Hậu Thạnh', '80', NULL, NULL),
(2785, '27856', 'Xã Nhơn Ninh', '80', NULL, NULL),
(2786, '27865', 'Xã Thạnh Hóa', '80', NULL, NULL),
(2787, '27868', 'Xã Bình Thành', '80', NULL, NULL),
(2788, '27877', 'Xã Thạnh Phước', '80', NULL, NULL),
(2789, '27889', 'Xã Tân Tây', '80', NULL, NULL),
(2790, '27898', 'Xã Đông Thành', '80', NULL, NULL),
(2791, '27907', 'Xã Mỹ Quý', '80', NULL, NULL),
(2792, '27925', 'Xã Đức Huệ', '80', NULL, NULL),
(2793, '27931', 'Xã Hậu Nghĩa', '80', NULL, NULL),
(2794, '27937', 'Xã Đức Hòa', '80', NULL, NULL),
(2795, '27943', 'Xã An Ninh', '80', NULL, NULL),
(2796, '27952', 'Xã Hiệp Hòa', '80', NULL, NULL),
(2797, '27964', 'Xã Đức Lập', '80', NULL, NULL),
(2798, '27976', 'Xã Mỹ Hạnh', '80', NULL, NULL),
(2799, '27979', 'Xã Hòa Khánh', '80', NULL, NULL),
(2800, '27991', 'Xã Bến Lức', '80', NULL, NULL),
(2801, '27994', 'Xã Thạnh Lợi', '80', NULL, NULL),
(2802, '28003', 'Xã Lương Hòa', '80', NULL, NULL),
(2803, '28015', 'Xã Bình Đức', '80', NULL, NULL),
(2804, '28018', 'Xã Mỹ Yên', '80', NULL, NULL),
(2805, '28036', 'Xã Thủ Thừa', '80', NULL, NULL),
(2806, '28051', 'Xã Mỹ Thạnh', '80', NULL, NULL),
(2807, '28066', 'Xã Mỹ An', '80', NULL, NULL),
(2808, '28072', 'Xã Tân Long', '80', NULL, NULL),
(2809, '28075', 'Xã Tân Trụ', '80', NULL, NULL),
(2810, '28087', 'Xã Nhựt Tảo', '80', NULL, NULL),
(2811, '28093', 'Xã Vàm Cỏ', '80', NULL, NULL),
(2812, '28108', 'Xã Cần Đước', '80', NULL, NULL),
(2813, '28114', 'Xã Rạch Kiến', '80', NULL, NULL),
(2814, '28126', 'Xã Long Cang', '80', NULL, NULL),
(2815, '28132', 'Xã Mỹ Lệ', '80', NULL, NULL),
(2816, '28138', 'Xã Tân Lân', '80', NULL, NULL),
(2817, '28144', 'Xã Long Hựu', '80', NULL, NULL),
(2818, '28159', 'Xã Cần Giuộc', '80', NULL, NULL),
(2819, '28165', 'Xã Phước Lý', '80', NULL, NULL),
(2820, '28177', 'Xã Mỹ Lộc', '80', NULL, NULL),
(2821, '28201', 'Xã Phước Vĩnh Tây', '80', NULL, NULL),
(2822, '28207', 'Xã Tân Tập', '80', NULL, NULL),
(2823, '28210', 'Xã Tầm Vu', '80', NULL, NULL),
(2824, '28222', 'Xã Vĩnh Công', '80', NULL, NULL),
(2825, '28225', 'Xã Thuận Mỹ', '80', NULL, NULL),
(2826, '28243', 'Xã An Lục Long', '80', NULL, NULL),
(2827, '28249', 'Phường Đạo Thạnh', '82', NULL, NULL),
(2828, '28261', 'Phường Mỹ Tho', '82', NULL, NULL),
(2829, '28270', 'Phường Thới Sơn', '82', NULL, NULL),
(2830, '28273', 'Phường Mỹ Phong', '82', NULL, NULL),
(2831, '28285', 'Phường Trung An', '82', NULL, NULL),
(2832, '28297', 'Phường Long Thuận', '82', NULL, NULL),
(2833, '28306', 'Phường Gò Công', '82', NULL, NULL),
(2834, '28315', 'Phường Bình Xuân', '82', NULL, NULL),
(2835, '28321', 'Xã Tân Phước 1', '82', NULL, NULL),
(2836, '28327', 'Xã Tân Phước 2', '82', NULL, NULL),
(2837, '28336', 'Xã Hưng Thạnh', '82', NULL, NULL),
(2838, '28345', 'Xã Tân Phước 3', '82', NULL, NULL),
(2839, '28360', 'Xã Cái Bè', '82', NULL, NULL),
(2840, '28366', 'Xã Hậu Mỹ', '82', NULL, NULL),
(2841, '28378', 'Xã Mỹ Thiện', '82', NULL, NULL),
(2842, '28393', 'Xã Hội Cư', '82', NULL, NULL),
(2843, '28405', 'Xã Mỹ Đức Tây', '82', NULL, NULL),
(2844, '28414', 'Xã Mỹ Lợi', '82', NULL, NULL),
(2845, '28426', 'Xã Thanh Hưng', '82', NULL, NULL),
(2846, '28429', 'Xã An Hữu', '82', NULL, NULL),
(2847, '28435', 'Phường Mỹ Phước Tây', '82', NULL, NULL),
(2848, '28436', 'Phường Thanh Hòa', '82', NULL, NULL),
(2849, '28439', 'Phường Cai Lậy', '82', NULL, NULL),
(2850, '28444', 'Xã Thạnh Phú', '82', NULL, NULL),
(2851, '28456', 'Xã Mỹ Thành', '82', NULL, NULL),
(2852, '28468', 'Xã Tân Phú', '82', NULL, NULL),
(2853, '28471', 'Xã Bình Phú', '82', NULL, NULL),
(2854, '28477', 'Phường Nhị Quý', '82', NULL, NULL),
(2855, '28501', 'Xã Hiệp Đức', '82', NULL, NULL),
(2856, '28504', 'Xã Long Tiên', '82', NULL, NULL),
(2857, '28516', 'Xã Ngũ Hiệp', '82', NULL, NULL),
(2858, '28519', 'Xã Châu Thành', '82', NULL, NULL),
(2859, '28525', 'Xã Tân Hương', '82', NULL, NULL),
(2860, '28537', 'Xã Long Hưng', '82', NULL, NULL),
(2861, '28543', 'Xã Long Định', '82', NULL, NULL),
(2862, '28564', 'Xã Bình Trưng', '82', NULL, NULL),
(2863, '28576', 'Xã Vĩnh Kim', '82', NULL, NULL),
(2864, '28582', 'Xã Kim Sơn', '82', NULL, NULL),
(2865, '28594', 'Xã Chợ Gạo', '82', NULL, NULL),
(2866, '28603', 'Xã Mỹ Tịnh An', '82', NULL, NULL),
(2867, '28615', 'Xã Lương Hòa Lạc', '82', NULL, NULL),
(2868, '28627', 'Xã Tân Thuận Bình', '82', NULL, NULL),
(2869, '28633', 'Xã An Thạnh Thủy', '82', NULL, NULL),
(2870, '28648', 'Xã Bình Ninh', '82', NULL, NULL),
(2871, '28651', 'Xã Vĩnh Bình', '82', NULL, NULL),
(2872, '28660', 'Xã Đồng Sơn', '82', NULL, NULL),
(2873, '28663', 'Xã Phú Thành', '82', NULL, NULL),
(2874, '28678', 'Xã Vĩnh Hựu', '82', NULL, NULL),
(2875, '28687', 'Xã Long Bình', '82', NULL, NULL),
(2876, '28693', 'Xã Tân Thới', '82', NULL, NULL),
(2877, '28696', 'Xã Tân Phú Đông', '82', NULL, NULL),
(2878, '28702', 'Xã Tân Hòa', '82', NULL, NULL),
(2879, '28720', 'Xã Gia Thuận', '82', NULL, NULL),
(2880, '28723', 'Xã Tân Đông', '82', NULL, NULL),
(2881, '28729', 'Phường Sơn Qui', '82', NULL, NULL),
(2882, '28738', 'Xã Tân Điền', '82', NULL, NULL),
(2883, '28747', 'Xã Gò Công Đông', '82', NULL, NULL),
(2884, '28756', 'Phường Phú Khương', '86', NULL, NULL),
(2885, '28777', 'Phường An Hội', '86', NULL, NULL),
(2886, '28783', 'Phường Sơn Đông', '86', NULL, NULL),
(2887, '28789', 'Phường Bến Tre', '86', NULL, NULL),
(2888, '28807', 'Xã Giao Long', '86', NULL, NULL),
(2889, '28810', 'Xã Phú Túc', '86', NULL, NULL),
(2890, '28840', 'Xã Tân Phú', '86', NULL, NULL),
(2891, '28858', 'Phường Phú Tân', '86', NULL, NULL),
(2892, '28861', 'Xã Tiên Thủy', '86', NULL, NULL),
(2893, '28870', 'Xã Chợ Lách', '86', NULL, NULL),
(2894, '28879', 'Xã Phú Phụng', '86', NULL, NULL),
(2895, '28894', 'Xã Vĩnh Thành', '86', NULL, NULL),
(2896, '28901', 'Xã Hưng Khánh Trung', '86', NULL, NULL),
(2897, '28903', 'Xã Mỏ Cày', '86', NULL, NULL),
(2898, '28915', 'Xã Phước Mỹ Trung', '86', NULL, NULL),
(2899, '28921', 'Xã Tân Thành Bình', '86', NULL, NULL),
(2900, '28945', 'Xã Đồng Khởi', '86', NULL, NULL),
(2901, '28948', 'Xã Nhuận Phú Tân', '86', NULL, NULL),
(2902, '28957', 'Xã An Định', '86', NULL, NULL),
(2903, '28969', 'Xã Thành Thới', '86', NULL, NULL),
(2904, '28981', 'Xã Hương Mỹ', '86', NULL, NULL),
(2905, '28984', 'Xã Giồng Trôm', '86', NULL, NULL),
(2906, '28987', 'Xã Lương Hòa', '86', NULL, NULL),
(2907, '28993', 'Xã Lương Phú', '86', NULL, NULL),
(2908, '28996', 'Xã Châu Hòa', '86', NULL, NULL),
(2909, '29020', 'Xã Phước Long', '86', NULL, NULL),
(2910, '29029', 'Xã Tân Hào', '86', NULL, NULL),
(2911, '29044', 'Xã Hưng Nhượng', '86', NULL, NULL),
(2912, '29050', 'Xã Bình Đại', '86', NULL, NULL),
(2913, '29062', 'Xã Phú Thuận', '86', NULL, NULL),
(2914, '29077', 'Xã Lộc Thuận', '86', NULL, NULL),
(2915, '29083', 'Xã Châu Hưng', '86', NULL, NULL),
(2916, '29089', 'Xã Thạnh Trị', '86', NULL, NULL),
(2917, '29104', 'Xã Thạnh Phước', '86', NULL, NULL),
(2918, '29107', 'Xã Thới Thuận', '86', NULL, NULL),
(2919, '29110', 'Xã Ba Tri', '86', NULL, NULL),
(2920, '29122', 'Xã Mỹ Chánh Hòa', '86', NULL, NULL),
(2921, '29125', 'Xã Bảo Thạnh', '86', NULL, NULL),
(2922, '29137', 'Xã Tân Xuân', '86', NULL, NULL),
(2923, '29143', 'Xã An Ngãi Trung', '86', NULL, NULL),
(2924, '29158', 'Xã An Hiệp', '86', NULL, NULL),
(2925, '29167', 'Xã Tân Thủy', '86', NULL, NULL),
(2926, '29182', 'Xã Thạnh Phú', '86', NULL, NULL),
(2927, '29191', 'Xã Quới Điền', '86', NULL, NULL),
(2928, '29194', 'Xã Đại Điền', '86', NULL, NULL),
(2929, '29221', 'Xã Thạnh Hải', '86', NULL, NULL),
(2930, '29224', 'Xã An Qui', '86', NULL, NULL),
(2931, '29227', 'Xã Thạnh Phong', '86', NULL, NULL),
(2932, '29242', 'Phường Trà Vinh', '86', NULL, NULL),
(2933, '29254', 'Phường Nguyệt Hóa', '86', NULL, NULL),
(2934, '29263', 'Phường Long Đức', '86', NULL, NULL),
(2935, '29266', 'Xã Càng Long', '86', NULL, NULL),
(2936, '29275', 'Xã An Trường', '86', NULL, NULL),
(2937, '29278', 'Xã Tân An', '86', NULL, NULL),
(2938, '29287', 'Xã Bình Phú', '86', NULL, NULL),
(2939, '29302', 'Xã Nhị Long', '86', NULL, NULL),
(2940, '29308', 'Xã Cầu Kè', '86', NULL, NULL),
(2941, '29317', 'Xã An Phú Tân', '86', NULL, NULL),
(2942, '29329', 'Xã Phong Thạnh', '86', NULL, NULL),
(2943, '29335', 'Xã Tam Ngãi', '86', NULL, NULL),
(2944, '29341', 'Xã Tiểu Cần', '86', NULL, NULL),
(2945, '29362', 'Xã Hùng Hòa', '86', NULL, NULL),
(2946, '29365', 'Xã Tập Ngãi', '86', NULL, NULL),
(2947, '29371', 'Xã Tân Hòa', '86', NULL, NULL),
(2948, '29374', 'Xã Châu Thành', '86', NULL, NULL),
(2949, '29386', 'Xã Song Lộc', '86', NULL, NULL),
(2950, '29398', 'Phường Hòa Thuận', '86', NULL, NULL),
(2951, '29407', 'Xã Hưng Mỹ', '86', NULL, NULL),
(2952, '29410', 'Xã Hòa Minh', '86', NULL, NULL),
(2953, '29413', 'Xã Long Hòa', '86', NULL, NULL),
(2954, '29416', 'Xã Cầu Ngang', '86', NULL, NULL),
(2955, '29419', 'Xã Mỹ Long', '86', NULL, NULL),
(2956, '29431', 'Xã Vinh Kim', '86', NULL, NULL),
(2957, '29446', 'Xã Nhị Trường', '86', NULL, NULL),
(2958, '29455', 'Xã Hiệp Mỹ', '86', NULL, NULL),
(2959, '29461', 'Xã Trà Cú', '86', NULL, NULL),
(2960, '29467', 'Xã Tập Sơn', '86', NULL, NULL),
(2961, '29476', 'Xã Lưu Nghiệp Anh', '86', NULL, NULL),
(2962, '29489', 'Xã Hàm Giang', '86', NULL, NULL),
(2963, '29491', 'Xã Đại An', '86', NULL, NULL),
(2964, '29497', 'Xã Đôn Châu', '86', NULL, NULL),
(2965, '29506', 'Xã Long Hiệp', '86', NULL, NULL),
(2966, '29512', 'Phường Duyên Hải', '86', NULL, NULL),
(2967, '29513', 'Xã Long Thành', '86', NULL, NULL),
(2968, '29516', 'Phường Trường Long Hòa', '86', NULL, NULL),
(2969, '29518', 'Xã Long Hữu', '86', NULL, NULL),
(2970, '29530', 'Xã Ngũ Lạc', '86', NULL, NULL),
(2971, '29533', 'Xã Long Vĩnh', '86', NULL, NULL),
(2972, '29536', 'Xã Đông Hải', '86', NULL, NULL),
(2973, '29551', 'Phường Long Châu', '86', NULL, NULL),
(2974, '29557', 'Phường Phước Hậu', '86', NULL, NULL),
(2975, '29566', 'Phường Tân Ngãi', '86', NULL, NULL),
(2976, '29584', 'Xã An Bình', '86', NULL, NULL),
(2977, '29590', 'Phường Thanh Đức', '86', NULL, NULL),
(2978, '29593', 'Phường Tân Hạnh', '86', NULL, NULL),
(2979, '29602', 'Xã Long Hồ', '86', NULL, NULL),
(2980, '29611', 'Xã Phú Quới', '86', NULL, NULL),
(2981, '29623', 'Xã Nhơn Phú', '86', NULL, NULL),
(2982, '29638', 'Xã Bình Phước', '86', NULL, NULL),
(2983, '29641', 'Xã Cái Nhum', '86', NULL, NULL),
(2984, '29653', 'Xã Tân Long Hội', '86', NULL, NULL),
(2985, '29659', 'Xã Trung Thành', '86', NULL, NULL),
(2986, '29668', 'Xã Quới An', '86', NULL, NULL),
(2987, '29677', 'Xã Quới Thiện', '86', NULL, NULL),
(2988, '29683', 'Xã Trung Hiệp', '86', NULL, NULL),
(2989, '29698', 'Xã Trung Ngãi', '86', NULL, NULL),
(2990, '29701', 'Xã Hiếu Phụng', '86', NULL, NULL),
(2991, '29713', 'Xã Hiếu Thành', '86', NULL, NULL),
(2992, '29719', 'Xã Tam Bình', '86', NULL, NULL),
(2993, '29728', 'Xã Cái Ngang', '86', NULL, NULL),
(2994, '29734', 'Xã Hòa Hiệp', '86', NULL, NULL),
(2995, '29740', 'Xã Song Phú', '86', NULL, NULL),
(2996, '29767', 'Xã Ngãi Tứ', '86', NULL, NULL),
(2997, '29770', 'Phường Cái Vồn', '86', NULL, NULL),
(2998, '29771', 'Phường Bình Minh', '86', NULL, NULL),
(2999, '29785', 'Xã Tân Lược', '86', NULL, NULL),
(3000, '29788', 'Xã Mỹ Thuận', '86', NULL, NULL),
(3001, '29800', 'Xã Tân Quới', '86', NULL, NULL),
(3002, '29812', 'Phường Đông Thành', '86', NULL, NULL),
(3003, '29821', 'Xã Trà Ôn', '86', NULL, NULL),
(3004, '29830', 'Xã Hòa Bình', '86', NULL, NULL),
(3005, '29836', 'Xã Trà Côn', '86', NULL, NULL),
(3006, '29845', 'Xã Vĩnh Xuân', '86', NULL, NULL),
(3007, '29857', 'Xã Lục Sĩ Thành', '86', NULL, NULL),
(3008, '29869', 'Phường Cao Lãnh', '82', NULL, NULL),
(3009, '29884', 'Phường Mỹ Ngãi', '82', NULL, NULL),
(3010, '29888', 'Phường Mỹ Trà', '82', NULL, NULL),
(3011, '29905', 'Phường Sa Đéc', '82', NULL, NULL),
(3012, '29926', 'Xã Tân Hồng', '82', NULL, NULL),
(3013, '29929', 'Xã Tân Hộ Cơ', '82', NULL, NULL),
(3014, '29938', 'Xã Tân Thành', '82', NULL, NULL),
(3015, '29944', 'Xã An Phước', '82', NULL, NULL),
(3016, '29954', 'Phường An Bình', '82', NULL, NULL),
(3017, '29955', 'Phường Hồng Ngự', '82', NULL, NULL),
(3018, '29971', 'Xã Thường Phước', '82', NULL, NULL),
(3019, '29978', 'Phường Thường Lạc', '82', NULL, NULL),
(3020, '29983', 'Xã Long Khánh', '82', NULL, NULL),
(3021, '29992', 'Xã Long Phú Thuận', '82', NULL, NULL),
(3022, '30001', 'Xã Tràm Chim', '82', NULL, NULL),
(3023, '30010', 'Xã Tam Nông', '82', NULL, NULL),
(3024, '30019', 'Xã An Hòa', '82', NULL, NULL),
(3025, '30025', 'Xã Phú Cường', '82', NULL, NULL),
(3026, '30028', 'Xã An Long', '82', NULL, NULL),
(3027, '30034', 'Xã Phú Thọ', '82', NULL, NULL),
(3028, '30037', 'Xã Tháp Mười', '82', NULL, NULL),
(3029, '30043', 'Xã Phương Thịnh', '82', NULL, NULL),
(3030, '30046', 'Xã Trường Xuân', '82', NULL, NULL),
(3031, '30055', 'Xã Mỹ Quí', '82', NULL, NULL),
(3032, '30061', 'Xã Đốc Binh Kiều', '82', NULL, NULL),
(3033, '30073', 'Xã Thanh Mỹ', '82', NULL, NULL),
(3034, '30076', 'Xã Mỹ Thọ', '82', NULL, NULL),
(3035, '30085', 'Xã Ba Sao', '82', NULL, NULL),
(3036, '30088', 'Xã Phong Mỹ', '82', NULL, NULL),
(3037, '30112', 'Xã Mỹ Hiệp', '82', NULL, NULL),
(3038, '30118', 'Xã Bình Hàng Trung', '82', NULL, NULL),
(3039, '30130', 'Xã Thanh Bình', '82', NULL, NULL),
(3040, '30154', 'Xã Tân Long', '82', NULL, NULL),
(3041, '30157', 'Xã Tân Thạnh', '82', NULL, NULL),
(3042, '30163', 'Xã Bình Thành', '82', NULL, NULL),
(3043, '30169', 'Xã Lấp Vò', '82', NULL, NULL),
(3044, '30178', 'Xã Mỹ An Hưng', '82', NULL, NULL),
(3045, '30184', 'Xã Tân Khánh Trung', '82', NULL, NULL),
(3046, '30208', 'Xã Hòa Long', '82', NULL, NULL),
(3047, '30214', 'Xã Tân Dương', '82', NULL, NULL),
(3048, '30226', 'Xã Lai Vung', '82', NULL, NULL),
(3049, '30235', 'Xã Phong Hòa', '82', NULL, NULL),
(3050, '30244', 'Xã Phú Hựu', '82', NULL, NULL),
(3051, '30253', 'Xã Tân Nhuận Đông', '82', NULL, NULL),
(3052, '30259', 'Xã Tân Phú Trung', '82', NULL, NULL),
(3053, '30292', 'Phường Bình Đức', '91', NULL, NULL),
(3054, '30301', 'Phường Mỹ Thới', '91', NULL, NULL),
(3055, '30307', 'Phường Long Xuyên', '91', NULL, NULL),
(3056, '30313', 'Xã Mỹ Hòa Hưng', '91', NULL, NULL);
INSERT INTO `wards` (`id`, `ward_code`, `name`, `province_code`, `created_at`, `updated_at`) VALUES
(3057, '30316', 'Phường Châu Đốc', '91', NULL, NULL),
(3058, '30325', 'Phường Vĩnh Tế', '91', NULL, NULL),
(3059, '30337', 'Xã An Phú', '91', NULL, NULL),
(3060, '30341', 'Xã Khánh Bình', '91', NULL, NULL),
(3061, '30346', 'Xã Nhơn Hội', '91', NULL, NULL),
(3062, '30352', 'Xã Phú Hữu', '91', NULL, NULL),
(3063, '30367', 'Xã Vĩnh Hậu', '91', NULL, NULL),
(3064, '30376', 'Phường Tân Châu', '91', NULL, NULL),
(3065, '30377', 'Phường Long Phú', '91', NULL, NULL),
(3066, '30385', 'Xã Vĩnh Xương', '91', NULL, NULL),
(3067, '30388', 'Xã Tân An', '91', NULL, NULL),
(3068, '30403', 'Xã Châu Phong', '91', NULL, NULL),
(3069, '30406', 'Xã Phú Tân', '91', NULL, NULL),
(3070, '30409', 'Xã Chợ Vàm', '91', NULL, NULL),
(3071, '30421', 'Xã Phú Lâm', '91', NULL, NULL),
(3072, '30430', 'Xã Hòa Lạc', '91', NULL, NULL),
(3073, '30436', 'Xã Phú An', '91', NULL, NULL),
(3074, '30445', 'Xã Bình Thạnh Đông', '91', NULL, NULL),
(3075, '30463', 'Xã Châu Phú', '91', NULL, NULL),
(3076, '30469', 'Xã Mỹ Đức', '91', NULL, NULL),
(3077, '30478', 'Xã Vĩnh Thạnh Trung', '91', NULL, NULL),
(3078, '30481', 'Xã Thạnh Mỹ Tây', '91', NULL, NULL),
(3079, '30487', 'Xã Bình Mỹ', '91', NULL, NULL),
(3080, '30502', 'Phường Thới Sơn', '91', NULL, NULL),
(3081, '30505', 'Phường Chi Lăng', '91', NULL, NULL),
(3082, '30520', 'Phường Tịnh Biên', '91', NULL, NULL),
(3083, '30526', 'Xã An Cư', '91', NULL, NULL),
(3084, '30538', 'Xã Núi Cấm', '91', NULL, NULL),
(3085, '30544', 'Xã Tri Tôn', '91', NULL, NULL),
(3086, '30547', 'Xã Ba Chúc', '91', NULL, NULL),
(3087, '30568', 'Xã Vĩnh Gia', '91', NULL, NULL),
(3088, '30577', 'Xã Ô Lâm', '91', NULL, NULL),
(3089, '30580', 'Xã Cô Tô', '91', NULL, NULL),
(3090, '30589', 'Xã An Châu', '91', NULL, NULL),
(3091, '30595', 'Xã Cần Đăng', '91', NULL, NULL),
(3092, '30604', 'Xã Vĩnh An', '91', NULL, NULL),
(3093, '30607', 'Xã Bình Hòa', '91', NULL, NULL),
(3094, '30619', 'Xã Vĩnh Hanh', '91', NULL, NULL),
(3095, '30628', 'Xã Chợ Mới', '91', NULL, NULL),
(3096, '30631', 'Xã Long Điền', '91', NULL, NULL),
(3097, '30643', 'Xã Cù Lao Giêng', '91', NULL, NULL),
(3098, '30658', 'Xã Nhơn Mỹ', '91', NULL, NULL),
(3099, '30664', 'Xã Long Kiến', '91', NULL, NULL),
(3100, '30673', 'Xã Hội An', '91', NULL, NULL),
(3101, '30682', 'Xã Thoại Sơn', '91', NULL, NULL),
(3102, '30685', 'Xã Phú Hòa', '91', NULL, NULL),
(3103, '30688', 'Xã Óc Eo', '91', NULL, NULL),
(3104, '30691', 'Xã Tây Phú', '91', NULL, NULL),
(3105, '30697', 'Xã Vĩnh Trạch', '91', NULL, NULL),
(3106, '30709', 'Xã Định Mỹ', '91', NULL, NULL),
(3107, '30742', 'Phường Rạch Giá', '91', NULL, NULL),
(3108, '30760', 'Phường Vĩnh Thông', '91', NULL, NULL),
(3109, '30766', 'Phường Tô Châu', '91', NULL, NULL),
(3110, '30769', 'Phường Hà Tiên', '91', NULL, NULL),
(3111, '30781', 'Xã Tiên Hải', '91', NULL, NULL),
(3112, '30787', 'Xã Kiên Lương', '91', NULL, NULL),
(3113, '30790', 'Xã Hòa Điền', '91', NULL, NULL),
(3114, '30793', 'Xã Vĩnh Điều', '91', NULL, NULL),
(3115, '30796', 'Xã Giang Thành', '91', NULL, NULL),
(3116, '30811', 'Xã Sơn Hải', '91', NULL, NULL),
(3117, '30814', 'Xã Hòn Nghệ', '91', NULL, NULL),
(3118, '30817', 'Xã Hòn Đất', '91', NULL, NULL),
(3119, '30823', 'Xã Bình Sơn', '91', NULL, NULL),
(3120, '30826', 'Xã Bình Giang', '91', NULL, NULL),
(3121, '30835', 'Xã Sơn Kiên', '91', NULL, NULL),
(3122, '30838', 'Xã Mỹ Thuận', '91', NULL, NULL),
(3123, '30850', 'Xã Tân Hiệp', '91', NULL, NULL),
(3124, '30856', 'Xã Tân Hội', '91', NULL, NULL),
(3125, '30874', 'Xã Thạnh Đông', '91', NULL, NULL),
(3126, '30880', 'Xã Châu Thành', '91', NULL, NULL),
(3127, '30886', 'Xã Thạnh Lộc', '91', NULL, NULL),
(3128, '30898', 'Xã Bình An', '91', NULL, NULL),
(3129, '30904', 'Xã Giồng Riềng', '91', NULL, NULL),
(3130, '30910', 'Xã Thạnh Hưng', '91', NULL, NULL),
(3131, '30928', 'Xã Ngọc Chúc', '91', NULL, NULL),
(3132, '30934', 'Xã Hòa Hưng', '91', NULL, NULL),
(3133, '30943', 'Xã Long Thạnh', '91', NULL, NULL),
(3134, '30949', 'Xã Hòa Thuận', '91', NULL, NULL),
(3135, '30952', 'Xã Gò Quao', '91', NULL, NULL),
(3136, '30958', 'Xã Định Hòa', '91', NULL, NULL),
(3137, '30970', 'Xã Vĩnh Hòa Hưng', '91', NULL, NULL),
(3138, '30982', 'Xã Vĩnh Tuy', '91', NULL, NULL),
(3139, '30985', 'Xã An Biên', '91', NULL, NULL),
(3140, '30988', 'Xã Tây Yên', '91', NULL, NULL),
(3141, '31006', 'Xã Đông Thái', '91', NULL, NULL),
(3142, '31012', 'Xã Vĩnh Hòa', '91', NULL, NULL),
(3143, '31018', 'Xã An Minh', '91', NULL, NULL),
(3144, '31024', 'Xã Đông Hòa', '91', NULL, NULL),
(3145, '31027', 'Xã U Minh Thượng', '91', NULL, NULL),
(3146, '31031', 'Xã Tân Thạnh', '91', NULL, NULL),
(3147, '31036', 'Xã Đông Hưng', '91', NULL, NULL),
(3148, '31042', 'Xã Vân Khánh', '91', NULL, NULL),
(3149, '31051', 'Xã Vĩnh Phong', '91', NULL, NULL),
(3150, '31064', 'Xã Vĩnh Bình', '91', NULL, NULL),
(3151, '31069', 'Xã Vĩnh Thuận', '91', NULL, NULL),
(3152, '31078', 'Đặc khu Phú Quốc', '91', NULL, NULL),
(3153, '31105', 'Đặc khu Thổ Châu', '91', NULL, NULL),
(3154, '31108', 'Đặc khu Kiên Hải', '91', NULL, NULL),
(3155, '31120', 'Phường Cái Khế', '92', NULL, NULL),
(3156, '31135', 'Phường Ninh Kiều', '92', NULL, NULL),
(3157, '31147', 'Phường Tân An', '92', NULL, NULL),
(3158, '31150', 'Phường An Bình', '92', NULL, NULL),
(3159, '31153', 'Phường Ô Môn', '92', NULL, NULL),
(3160, '31157', 'Phường Thới Long', '92', NULL, NULL),
(3161, '31162', 'Phường Phước Thới', '92', NULL, NULL),
(3162, '31168', 'Phường Bình Thủy', '92', NULL, NULL),
(3163, '31174', 'Phường Thới An Đông', '92', NULL, NULL),
(3164, '31183', 'Phường Long Tuyền', '92', NULL, NULL),
(3165, '31186', 'Phường Cái Răng', '92', NULL, NULL),
(3166, '31201', 'Phường Hưng Phú', '92', NULL, NULL),
(3167, '31207', 'Phường Thốt Nốt', '92', NULL, NULL),
(3168, '31213', 'Phường Tân Lộc', '92', NULL, NULL),
(3169, '31217', 'Phường Trung Nhứt', '92', NULL, NULL),
(3170, '31228', 'Phường Thuận Hưng', '92', NULL, NULL),
(3171, '31231', 'Xã Thạnh An', '92', NULL, NULL),
(3172, '31232', 'Xã Vĩnh Thạnh', '92', NULL, NULL),
(3173, '31237', 'Xã Vĩnh Trinh', '92', NULL, NULL),
(3174, '31246', 'Xã Thạnh Quới', '92', NULL, NULL),
(3175, '31249', 'Xã Thạnh Phú', '92', NULL, NULL),
(3176, '31255', 'Xã Trung Hưng', '92', NULL, NULL),
(3177, '31258', 'Xã Thới Lai', '92', NULL, NULL),
(3178, '31261', 'Xã Cờ Đỏ', '92', NULL, NULL),
(3179, '31264', 'Xã Thới Hưng', '92', NULL, NULL),
(3180, '31273', 'Xã Đông Hiệp', '92', NULL, NULL),
(3181, '31282', 'Xã Đông Thuận', '92', NULL, NULL),
(3182, '31288', 'Xã Trường Thành', '92', NULL, NULL),
(3183, '31294', 'Xã Trường Xuân', '92', NULL, NULL),
(3184, '31299', 'Xã Phong Điền', '92', NULL, NULL),
(3185, '31309', 'Xã Trường Long', '92', NULL, NULL),
(3186, '31315', 'Xã Nhơn Ái', '92', NULL, NULL),
(3187, '31321', 'Phường Vị Thanh', '92', NULL, NULL),
(3188, '31333', 'Phường Vị Tân', '92', NULL, NULL),
(3189, '31338', 'Xã Hỏa Lựu', '92', NULL, NULL),
(3190, '31340', 'Phường Ngã Bảy', '92', NULL, NULL),
(3191, '31342', 'Xã Tân Hòa', '92', NULL, NULL),
(3192, '31348', 'Xã Trường Long Tây', '92', NULL, NULL),
(3193, '31360', 'Xã Thạnh Xuân', '92', NULL, NULL),
(3194, '31366', 'Xã Châu Thành', '92', NULL, NULL),
(3195, '31369', 'Xã Đông Phước', '92', NULL, NULL),
(3196, '31378', 'Xã Phú Hữu', '92', NULL, NULL),
(3197, '31393', 'Xã Hòa An', '92', NULL, NULL),
(3198, '31396', 'Xã Hiệp Hưng', '92', NULL, NULL),
(3199, '31399', 'Xã Tân Bình', '92', NULL, NULL),
(3200, '31408', 'Xã Thạnh Hòa', '92', NULL, NULL),
(3201, '31411', 'Phường Đại Thành', '92', NULL, NULL),
(3202, '31420', 'Xã Phụng Hiệp', '92', NULL, NULL),
(3203, '31426', 'Xã Phương Bình', '92', NULL, NULL),
(3204, '31432', 'Xã Tân Phước Hưng', '92', NULL, NULL),
(3205, '31441', 'Xã Vị Thủy', '92', NULL, NULL),
(3206, '31453', 'Xã Vĩnh Thuận Đông', '92', NULL, NULL),
(3207, '31459', 'Xã Vĩnh Tường', '92', NULL, NULL),
(3208, '31465', 'Xã Vị Thanh 1', '92', NULL, NULL),
(3209, '31471', 'Phường Long Mỹ', '92', NULL, NULL),
(3210, '31473', 'Phường Long Bình', '92', NULL, NULL),
(3211, '31480', 'Phường Long Phú 1', '92', NULL, NULL),
(3212, '31489', 'Xã Vĩnh Viễn', '92', NULL, NULL),
(3213, '31492', 'Xã Lương Tâm', '92', NULL, NULL),
(3214, '31495', 'Xã Xà Phiên', '92', NULL, NULL),
(3215, '31507', 'Phường Sóc Trăng', '92', NULL, NULL),
(3216, '31510', 'Phường Phú Lợi', '92', NULL, NULL),
(3217, '31528', 'Xã Kế Sách', '92', NULL, NULL),
(3218, '31531', 'Xã An Lạc Thôn', '92', NULL, NULL),
(3219, '31537', 'Xã Phong Nẫm', '92', NULL, NULL),
(3220, '31540', 'Xã Thới An Hội', '92', NULL, NULL),
(3221, '31552', 'Xã Nhơn Mỹ', '92', NULL, NULL),
(3222, '31561', 'Xã Đại Hải', '92', NULL, NULL),
(3223, '31567', 'Xã Mỹ Tú', '92', NULL, NULL),
(3224, '31569', 'Xã Phú Tâm', '92', NULL, NULL),
(3225, '31570', 'Xã Hồ Đắc Kiện', '92', NULL, NULL),
(3226, '31579', 'Xã Long Hưng', '92', NULL, NULL),
(3227, '31582', 'Xã Thuận Hòa', '92', NULL, NULL),
(3228, '31591', 'Xã Mỹ Hương', '92', NULL, NULL),
(3229, '31594', 'Xã An Ninh', '92', NULL, NULL),
(3230, '31603', 'Xã Mỹ Phước', '92', NULL, NULL),
(3231, '31615', 'Xã An Thạnh', '92', NULL, NULL),
(3232, '31633', 'Xã Cù Lao Dung', '92', NULL, NULL),
(3233, '31639', 'Xã Long Phú', '92', NULL, NULL),
(3234, '31645', 'Xã Đại Ngãi', '92', NULL, NULL),
(3235, '31654', 'Xã Trường Khánh', '92', NULL, NULL),
(3236, '31666', 'Xã Tân Thạnh', '92', NULL, NULL),
(3237, '31673', 'Xã Trần Đề', '92', NULL, NULL),
(3238, '31675', 'Xã Liêu Tú', '92', NULL, NULL),
(3239, '31679', 'Xã Lịch Hội Thượng', '92', NULL, NULL),
(3240, '31684', 'Phường Mỹ Xuyên', '92', NULL, NULL),
(3241, '31687', 'Xã Tài Văn', '92', NULL, NULL),
(3242, '31699', 'Xã Thạnh Thới An', '92', NULL, NULL),
(3243, '31708', 'Xã Nhu Gia', '92', NULL, NULL),
(3244, '31717', 'Xã Hòa Tú', '92', NULL, NULL),
(3245, '31723', 'Xã Ngọc Tố', '92', NULL, NULL),
(3246, '31726', 'Xã Gia Hòa', '92', NULL, NULL),
(3247, '31732', 'Phường Ngã Năm', '92', NULL, NULL),
(3248, '31741', 'Xã Tân Long', '92', NULL, NULL),
(3249, '31753', 'Phường Mỹ Quới', '92', NULL, NULL),
(3250, '31756', 'Xã Phú Lộc', '92', NULL, NULL),
(3251, '31759', 'Xã Lâm Tân', '92', NULL, NULL),
(3252, '31777', 'Xã Vĩnh Lợi', '92', NULL, NULL),
(3253, '31783', 'Phường Vĩnh Châu', '92', NULL, NULL),
(3254, '31789', 'Phường Khánh Hòa', '92', NULL, NULL),
(3255, '31795', 'Xã Vĩnh Hải', '92', NULL, NULL),
(3256, '31804', 'Phường Vĩnh Phước', '92', NULL, NULL),
(3257, '31810', 'Xã Lai Hòa', '92', NULL, NULL),
(3258, '31825', 'Phường Bạc Liêu', '96', NULL, NULL),
(3259, '31834', 'Phường Vĩnh Trạch', '96', NULL, NULL),
(3260, '31840', 'Phường Hiệp Thành', '96', NULL, NULL),
(3261, '31843', 'Xã Hồng Dân', '96', NULL, NULL),
(3262, '31849', 'Xã Ninh Quới', '96', NULL, NULL),
(3263, '31858', 'Xã Vĩnh Lộc', '96', NULL, NULL),
(3264, '31864', 'Xã Ninh Thạnh Lợi', '96', NULL, NULL),
(3265, '31867', 'Xã Phước Long', '96', NULL, NULL),
(3266, '31876', 'Xã Vĩnh Phước', '96', NULL, NULL),
(3267, '31882', 'Xã Vĩnh Thanh', '96', NULL, NULL),
(3268, '31885', 'Xã Phong Hiệp', '96', NULL, NULL),
(3269, '31891', 'Xã Hòa Bình', '96', NULL, NULL),
(3270, '31894', 'Xã Châu Thới', '96', NULL, NULL),
(3271, '31900', 'Xã Vĩnh Lợi', '96', NULL, NULL),
(3272, '31906', 'Xã Hưng Hội', '96', NULL, NULL),
(3273, '31918', 'Xã Vĩnh Mỹ', '96', NULL, NULL),
(3274, '31927', 'Xã Vĩnh Hậu', '96', NULL, NULL),
(3275, '31942', 'Phường Giá Rai', '96', NULL, NULL),
(3276, '31951', 'Phường Láng Tròn', '96', NULL, NULL),
(3277, '31957', 'Xã Phong Thạnh', '96', NULL, NULL),
(3278, '31972', 'Xã Gành Hào', '96', NULL, NULL),
(3279, '31975', 'Xã Đông Hải', '96', NULL, NULL),
(3280, '31985', 'Xã Long Điền', '96', NULL, NULL),
(3281, '31988', 'Xã An Trạch', '96', NULL, NULL),
(3282, '31993', 'Xã Định Thành', '96', NULL, NULL),
(3283, '32002', 'Phường An Xuyên', '96', NULL, NULL),
(3284, '32014', 'Phường Lý Văn Lâm', '96', NULL, NULL),
(3285, '32025', 'Phường Tân Thành', '96', NULL, NULL),
(3286, '32041', 'Phường Hòa Thành', '96', NULL, NULL),
(3287, '32044', 'Xã Nguyễn Phích', '96', NULL, NULL),
(3288, '32047', 'Xã U Minh', '96', NULL, NULL),
(3289, '32059', 'Xã Khánh An', '96', NULL, NULL),
(3290, '32062', 'Xã Khánh Lâm', '96', NULL, NULL),
(3291, '32065', 'Xã Thới Bình', '96', NULL, NULL),
(3292, '32069', 'Xã Biển Bạch', '96', NULL, NULL),
(3293, '32071', 'Xã Trí Phải', '96', NULL, NULL),
(3294, '32083', 'Xã Tân Lộc', '96', NULL, NULL),
(3295, '32092', 'Xã Hồ Thị Kỷ', '96', NULL, NULL),
(3296, '32095', 'Xã Trần Văn Thời', '96', NULL, NULL),
(3297, '32098', 'Xã Sông Đốc', '96', NULL, NULL),
(3298, '32104', 'Xã Đá Bạc', '96', NULL, NULL),
(3299, '32110', 'Xã Khánh Bình', '96', NULL, NULL),
(3300, '32119', 'Xã Khánh Hưng', '96', NULL, NULL),
(3301, '32128', 'Xã Cái Nước', '96', NULL, NULL),
(3302, '32134', 'Xã Lương Thế Trân', '96', NULL, NULL),
(3303, '32137', 'Xã Tân Hưng', '96', NULL, NULL),
(3304, '32140', 'Xã Hưng Mỹ', '96', NULL, NULL),
(3305, '32152', 'Xã Đầm Dơi', '96', NULL, NULL),
(3306, '32155', 'Xã Tạ An Khương', '96', NULL, NULL),
(3307, '32161', 'Xã Trần Phán', '96', NULL, NULL),
(3308, '32167', 'Xã Tân Thuận', '96', NULL, NULL),
(3309, '32182', 'Xã Quách Phẩm', '96', NULL, NULL),
(3310, '32185', 'Xã Thanh Tùng', '96', NULL, NULL),
(3311, '32188', 'Xã Tân Tiến', '96', NULL, NULL),
(3312, '32191', 'Xã Năm Căn', '96', NULL, NULL),
(3313, '32201', 'Xã Đất Mới', '96', NULL, NULL),
(3314, '32206', 'Xã Tam Giang', '96', NULL, NULL),
(3315, '32212', 'Xã Cái Đôi Vàm', '96', NULL, NULL),
(3316, '32214', 'Xã Phú Mỹ', '96', NULL, NULL),
(3317, '32218', 'Xã Phú Tân', '96', NULL, NULL),
(3318, '32227', 'Xã Nguyễn Việt Khái', '96', NULL, NULL),
(3319, '32236', 'Xã Tân Ân', '96', NULL, NULL),
(3320, '32244', 'Xã Phan Ngọc Hiển', '96', NULL, NULL),
(3321, '32248', 'Xã Đất Mũi', '96', NULL, NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `address_books`
--
ALTER TABLE `address_books`
  ADD PRIMARY KEY (`id`),
  ADD KEY `address_books_user_id_foreign` (`user_id`),
  ADD KEY `address_books_province_code_foreign` (`province_code`),
  ADD KEY `address_books_ward_code_foreign` (`ward_code`);

--
-- Chỉ mục cho bảng `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Chỉ mục cho bảng `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Chỉ mục cho bảng `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_product_variants_id_foreign` (`product_variants_id`),
  ADD KEY `carts_flash_sale_items_id_foreign` (`flash_sale_items_id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_unique` (`name`);

--
-- Chỉ mục cho bảng `categories_vouchers`
--
ALTER TABLE `categories_vouchers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_vouchers_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `colors_color_name_unique` (`color_name`);

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_user_id_foreign` (`user_id`),
  ADD KEY `comments_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contacts_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `flash_sales`
--
ALTER TABLE `flash_sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `flash_sales_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `flash_sale_items`
--
ALTER TABLE `flash_sale_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `flash_sale_items_flash_sale_id_foreign` (`flash_sale_id`),
  ADD KEY `flash_sale_items_product_id_foreign` (`product_id`),
  ADD KEY `flash_sale_items_color_id_foreign` (`color_id`),
  ADD KEY `flash_sale_items_size_id_foreign` (`size_id`),
  ADD KEY `flash_sale_items_product_variant_id_foreign` (`product_variant_id`);

--
-- Chỉ mục cho bảng `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Chỉ mục cho bảng `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `lock_reasons`
--
ALTER TABLE `lock_reasons`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_code_order_unique` (`code_order`),
  ADD KEY `orders_province_code_foreign` (`province_code`),
  ADD KEY `orders_ward_code_foreign` (`ward_code`),
  ADD KEY `orders_voucher_id_foreign` (`voucher_id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_address_books_id_foreign` (`address_books_id`);

--
-- Chỉ mục cho bảng `order_histories`
--
ALTER TABLE `order_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_histories_order_id_foreign` (`order_id`);

--
-- Chỉ mục cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`),
  ADD KEY `order_items_product_variant_id_foreign` (`product_variant_id`),
  ADD KEY `order_items_flash_sale_items_id_foreign` (`flash_sale_items_id`);

--
-- Chỉ mục cho bảng `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Chỉ mục cho bảng `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_name_unique` (`name`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Chỉ mục cho bảng `product_variants`
--
ALTER TABLE `product_variants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_variants_name_unique` (`name`),
  ADD KEY `product_variants_product_id_foreign` (`product_id`),
  ADD KEY `product_variants_color_id_foreign` (`color_id`),
  ADD KEY `product_variants_size_id_foreign` (`size_id`);

--
-- Chỉ mục cho bảng `provinces`
--
ALTER TABLE `provinces`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `provinces_province_code_unique` (`province_code`),
  ADD UNIQUE KEY `provinces_code_unique` (`code`);

--
-- Chỉ mục cho bảng `refund_logs`
--
ALTER TABLE `refund_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `refund_logs_refund_id_foreign` (`refund_id`);

--
-- Chỉ mục cho bảng `refund_money`
--
ALTER TABLE `refund_money`
  ADD PRIMARY KEY (`id`),
  ADD KEY `refund_money_user_id_foreign` (`user_id`),
  ADD KEY `refund_money_order_id_foreign` (`order_id`);

--
-- Chỉ mục cho bảng `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_product_id_foreign` (`product_id`),
  ADD KEY `reviews_user_id_foreign` (`user_id`),
  ADD KEY `reviews_admin_id_foreign` (`admin_id`);

--
-- Chỉ mục cho bảng `review_replies`
--
ALTER TABLE `review_replies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `review_replies_review_id_foreign` (`review_id`),
  ADD KEY `review_replies_admin_id_foreign` (`admin_id`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Chỉ mục cho bảng `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Chỉ mục cho bảng `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Chỉ mục cho bảng `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sizes_size_name_unique` (`size_name`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_google_id_unique` (`google_id`),
  ADD KEY `users_province_code_foreign` (`province_code`),
  ADD KEY `users_ward_code_foreign` (`ward_code`),
  ADD KEY `users_locked_by_foreign` (`locked_by`);

--
-- Chỉ mục cho bảng `user_locks`
--
ALTER TABLE `user_locks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_locks_user_id_foreign` (`user_id`),
  ADD KEY `user_locks_lock_reason_id_foreign` (`lock_reason_id`),
  ADD KEY `user_locks_locked_by_foreign` (`locked_by`);

--
-- Chỉ mục cho bảng `vouchers`
--
ALTER TABLE `vouchers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vouchers_code_unique` (`code`),
  ADD KEY `vouchers_category_id_foreign` (`category_id`);

--
-- Chỉ mục cho bảng `vouchers_histories`
--
ALTER TABLE `vouchers_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vouchers_histories_voucher_id_foreign` (`voucher_id`),
  ADD KEY `vouchers_histories_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `vouchers_logs`
--
ALTER TABLE `vouchers_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vouchers_logs_actor_foreign` (`actor`);

--
-- Chỉ mục cho bảng `vouchers_users`
--
ALTER TABLE `vouchers_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vouchers_users_user_id_voucher_id_unique` (`user_id`,`voucher_id`),
  ADD KEY `vouchers_users_voucher_id_foreign` (`voucher_id`);

--
-- Chỉ mục cho bảng `wards`
--
ALTER TABLE `wards`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `wards_ward_code_unique` (`ward_code`) USING BTREE,
  ADD KEY `wards_province_code_index` (`province_code`) USING BTREE;

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `address_books`
--
ALTER TABLE `address_books`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `categories_vouchers`
--
ALTER TABLE `categories_vouchers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `colors`
--
ALTER TABLE `colors`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `flash_sales`
--
ALTER TABLE `flash_sales`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `flash_sale_items`
--
ALTER TABLE `flash_sale_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `lock_reasons`
--
ALTER TABLE `lock_reasons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT cho bảng `order_histories`
--
ALTER TABLE `order_histories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT cho bảng `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT cho bảng `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT cho bảng `provinces`
--
ALTER TABLE `provinces`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT cho bảng `refund_logs`
--
ALTER TABLE `refund_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `refund_money`
--
ALTER TABLE `refund_money`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `review_replies`
--
ALTER TABLE `review_replies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `user_locks`
--
ALTER TABLE `user_locks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `vouchers`
--
ALTER TABLE `vouchers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `vouchers_histories`
--
ALTER TABLE `vouchers_histories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `vouchers_logs`
--
ALTER TABLE `vouchers_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `vouchers_users`
--
ALTER TABLE `vouchers_users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `wards`
--
ALTER TABLE `wards`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3322;

--
-- Ràng buộc đối với các bảng kết xuất
--

--
-- Ràng buộc cho bảng `address_books`
--
ALTER TABLE `address_books`
  ADD CONSTRAINT `address_books_province_code_foreign` FOREIGN KEY (`province_code`) REFERENCES `provinces` (`province_code`) ON DELETE CASCADE,
  ADD CONSTRAINT `address_books_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `address_books_ward_code_foreign` FOREIGN KEY (`ward_code`) REFERENCES `wards` (`ward_code`) ON DELETE CASCADE;

--
-- Ràng buộc cho bảng `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_flash_sale_items_id_foreign` FOREIGN KEY (`flash_sale_items_id`) REFERENCES `flash_sale_items` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `carts_product_variants_id_foreign` FOREIGN KEY (`product_variants_id`) REFERENCES `product_variants` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ràng buộc cho bảng `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ràng buộc cho bảng `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `contacts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ràng buộc cho bảng `flash_sales`
--
ALTER TABLE `flash_sales`
  ADD CONSTRAINT `flash_sales_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ràng buộc cho bảng `flash_sale_items`
--
ALTER TABLE `flash_sale_items`
  ADD CONSTRAINT `flash_sale_items_color_id_foreign` FOREIGN KEY (`color_id`) REFERENCES `colors` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `flash_sale_items_flash_sale_id_foreign` FOREIGN KEY (`flash_sale_id`) REFERENCES `flash_sales` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `flash_sale_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `flash_sale_items_product_variant_id_foreign` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `flash_sale_items_size_id_foreign` FOREIGN KEY (`size_id`) REFERENCES `sizes` (`id`) ON DELETE CASCADE;

--
-- Ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_address_books_id_foreign` FOREIGN KEY (`address_books_id`) REFERENCES `address_books` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_province_code_foreign` FOREIGN KEY (`province_code`) REFERENCES `provinces` (`province_code`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_voucher_id_foreign` FOREIGN KEY (`voucher_id`) REFERENCES `vouchers` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_ward_code_foreign` FOREIGN KEY (`ward_code`) REFERENCES `wards` (`ward_code`) ON DELETE CASCADE;

--
-- Ràng buộc cho bảng `order_histories`
--
ALTER TABLE `order_histories`
  ADD CONSTRAINT `order_histories_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Ràng buộc cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_flash_sale_items_id_foreign` FOREIGN KEY (`flash_sale_items_id`) REFERENCES `flash_sale_items` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `order_items_product_variant_id_foreign` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`id`) ON DELETE SET NULL;

--
-- Ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Ràng buộc cho bảng `product_variants`
--
ALTER TABLE `product_variants`
  ADD CONSTRAINT `product_variants_color_id_foreign` FOREIGN KEY (`color_id`) REFERENCES `colors` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_variants_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_variants_size_id_foreign` FOREIGN KEY (`size_id`) REFERENCES `sizes` (`id`) ON DELETE CASCADE;

--
-- Ràng buộc cho bảng `refund_logs`
--
ALTER TABLE `refund_logs`
  ADD CONSTRAINT `refund_logs_refund_id_foreign` FOREIGN KEY (`refund_id`) REFERENCES `refund_money` (`id`) ON DELETE CASCADE;

--
-- Ràng buộc cho bảng `refund_money`
--
ALTER TABLE `refund_money`
  ADD CONSTRAINT `refund_money_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `refund_money_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ràng buộc cho bảng `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ràng buộc cho bảng `review_replies`
--
ALTER TABLE `review_replies`
  ADD CONSTRAINT `review_replies_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `review_replies_review_id_foreign` FOREIGN KEY (`review_id`) REFERENCES `reviews` (`id`) ON DELETE CASCADE;

--
-- Ràng buộc cho bảng `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ràng buộc cho bảng `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_locked_by_foreign` FOREIGN KEY (`locked_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `users_province_code_foreign` FOREIGN KEY (`province_code`) REFERENCES `provinces` (`province_code`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_ward_code_foreign` FOREIGN KEY (`ward_code`) REFERENCES `wards` (`ward_code`) ON DELETE CASCADE;

--
-- Ràng buộc cho bảng `user_locks`
--
ALTER TABLE `user_locks`
  ADD CONSTRAINT `user_locks_lock_reason_id_foreign` FOREIGN KEY (`lock_reason_id`) REFERENCES `lock_reasons` (`id`) ON DELETE RESTRICT,
  ADD CONSTRAINT `user_locks_locked_by_foreign` FOREIGN KEY (`locked_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `user_locks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ràng buộc cho bảng `vouchers`
--
ALTER TABLE `vouchers`
  ADD CONSTRAINT `vouchers_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories_vouchers` (`id`) ON DELETE CASCADE;

--
-- Ràng buộc cho bảng `vouchers_histories`
--
ALTER TABLE `vouchers_histories`
  ADD CONSTRAINT `vouchers_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `vouchers_histories_voucher_id_foreign` FOREIGN KEY (`voucher_id`) REFERENCES `vouchers` (`id`) ON DELETE CASCADE;

--
-- Ràng buộc cho bảng `vouchers_logs`
--
ALTER TABLE `vouchers_logs`
  ADD CONSTRAINT `vouchers_logs_actor_foreign` FOREIGN KEY (`actor`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ràng buộc cho bảng `vouchers_users`
--
ALTER TABLE `vouchers_users`
  ADD CONSTRAINT `vouchers_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vouchers_users_voucher_id_foreign` FOREIGN KEY (`voucher_id`) REFERENCES `vouchers` (`id`) ON DELETE CASCADE;

--
-- Ràng buộc cho bảng `wards`
--
ALTER TABLE `wards`
  ADD CONSTRAINT `wards_province_code_foreign` FOREIGN KEY (`province_code`) REFERENCES `provinces` (`province_code`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
