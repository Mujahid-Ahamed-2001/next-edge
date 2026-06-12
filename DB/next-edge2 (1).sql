-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 12, 2026 at 08:42 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `next-edge2`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_types`
--

CREATE TABLE `account_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type_name` varchar(100) NOT NULL,
  `type_code` varchar(50) NOT NULL,
  `normal_balance` enum('debit','credit') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `account_types`
--

INSERT INTO `account_types` (`id`, `type_name`, `type_code`, `normal_balance`) VALUES
(1, 'Assets', 'ASSET', 'debit'),
(2, 'Liabilities', 'LIABILITY', 'credit'),
(3, 'Equity', 'EQUITY', 'credit'),
(4, 'Income', 'INCOME', 'credit'),
(5, 'Cost of Sales', 'COS', 'debit'),
(6, 'Expenses', 'EXPENSE', 'debit');

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `module_name` varchar(150) DEFAULT NULL,
  `action_type` varchar(100) DEFAULT NULL,
  `record_id` bigint(20) UNSIGNED DEFAULT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `old_values` longtext DEFAULT NULL,
  `new_values` longtext DEFAULT NULL,
  `ip_address` varchar(100) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `address_line_1` varchar(255) DEFAULT NULL,
  `address_line_2` varchar(255) DEFAULT NULL,
  `city` varchar(150) DEFAULT NULL,
  `district` varchar(150) DEFAULT NULL,
  `province` varchar(150) DEFAULT NULL,
  `country` varchar(150) DEFAULT NULL,
  `postal_code` varchar(50) DEFAULT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `address_line_1`, `address_line_2`, `city`, `district`, `province`, `country`, `postal_code`, `latitude`, `longitude`, `created_at`) VALUES
(1, '123 Galle Road', NULL, 'Colombo', NULL, 'Western', 'Sri Lanka', '00300', NULL, NULL, '2026-06-12 23:52:34');

-- --------------------------------------------------------

--
-- Table structure for table `address_relations`
--

CREATE TABLE `address_relations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `module_name` varchar(100) DEFAULT NULL,
  `record_id` bigint(20) UNSIGNED DEFAULT NULL,
  `address_id` bigint(20) UNSIGNED DEFAULT NULL,
  `address_type` enum('billing','shipping','office','warehouse','home','branch') DEFAULT NULL,
  `is_primary` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `address_relations`
--

INSERT INTO `address_relations` (`id`, `module_name`, `record_id`, `address_id`, `address_type`, `is_primary`) VALUES
(1, 'customers', 1, 1, 'billing', 1),
(2, 'customers', 1, 1, 'shipping', 1);

-- --------------------------------------------------------

--
-- Table structure for table `api_logs`
--

CREATE TABLE `api_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `endpoint` varchar(500) DEFAULT NULL,
  `request_method` varchar(20) DEFAULT NULL,
  `request_headers` longtext DEFAULT NULL,
  `request_body` longtext DEFAULT NULL,
  `response_code` int(11) DEFAULT NULL,
  `response_body` longtext DEFAULT NULL,
  `ip_address` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `audit_logs`
--

CREATE TABLE `audit_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `table_name` varchar(255) DEFAULT NULL,
  `record_id` bigint(20) UNSIGNED DEFAULT NULL,
  `action_type` enum('insert','update','delete') DEFAULT NULL,
  `old_values` longtext DEFAULT NULL,
  `new_values` longtext DEFAULT NULL,
  `changed_by` bigint(20) UNSIGNED DEFAULT NULL,
  `changed_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bank_accounts`
--

CREATE TABLE `bank_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `account_name` varchar(255) DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `branch_name` varchar(255) DEFAULT NULL,
  `chart_account_id` bigint(20) UNSIGNED NOT NULL,
  `status_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bank_accounts`
--

INSERT INTO `bank_accounts` (`id`, `account_name`, `bank_name`, `account_number`, `branch_name`, `chart_account_id`, `status_id`, `is_active`) VALUES
(1, 'Main Operational', 'Commercial Bank', '1002938475', NULL, 5, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(500) NOT NULL,
  `slug` varchar(500) NOT NULL,
  `short_description` text DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `author_id` bigint(20) UNSIGNED DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `view_count` bigint(20) UNSIGNED DEFAULT 0,
  `status_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `website_active` tinyint(1) DEFAULT 1,
  `featured` tinyint(1) DEFAULT 0,
  `is_deleted` tinyint(1) DEFAULT 0,
  `deleted_at` datetime DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `title`, `slug`, `short_description`, `content`, `author_id`, `published_at`, `view_count`, `status_id`, `is_active`, `website_active`, `featured`, `is_deleted`, `deleted_at`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'The Future of E-Commerce in 2026', 'future-of-ecommerce-2026', 'A look into upcoming digital retail trends.', NULL, 1, '2026-06-13 12:00:00', 0, 1, 1, 1, 0, 0, NULL, 1, NULL, '2026-06-12 23:52:35', '2026-06-12 23:52:35');

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `status_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `website_active` tinyint(1) DEFAULT 1,
  `featured` tinyint(1) DEFAULT 0,
  `is_deleted` tinyint(1) DEFAULT 0,
  `deleted_at` datetime DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `parent_id`, `category_name`, `slug`, `description`, `status_id`, `is_active`, `website_active`, `featured`, `is_deleted`, `deleted_at`, `created_by`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Technology Trends', 'technology-trends', NULL, 1, 1, 1, 0, 0, NULL, 1, '2026-06-12 23:52:35', '2026-06-12 23:52:35');

-- --------------------------------------------------------

--
-- Table structure for table `blog_category_relations`
--

CREATE TABLE `blog_category_relations` (
  `blog_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blog_category_relations`
--

INSERT INTO `blog_category_relations` (`blog_id`, `category_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `blog_contents`
--

CREATE TABLE `blog_contents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blog_id` bigint(20) UNSIGNED NOT NULL,
  `content_type` enum('text','image','video','html') DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `display_order` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blog_contents`
--

INSERT INTO `blog_contents` (`id`, `blog_id`, `content_type`, `content`, `display_order`) VALUES
(1, 1, 'html', '<p>In 2026, AI-driven personalization is redefining the customer experience...</p>', 1);

-- --------------------------------------------------------

--
-- Table structure for table `blog_views`
--

CREATE TABLE `blog_views` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blog_id` bigint(20) UNSIGNED NOT NULL,
  `ip_address` varchar(100) DEFAULT NULL,
  `country` varchar(150) DEFAULT NULL,
  `city` varchar(150) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `viewed_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_code` varchar(50) DEFAULT NULL,
  `branch_name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `city` varchar(150) DEFAULT NULL,
  `district` varchar(150) DEFAULT NULL,
  `country` varchar(150) DEFAULT NULL,
  `is_head_office` tinyint(1) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `branch_code`, `branch_name`, `email`, `phone`, `city`, `district`, `country`, `is_head_office`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'HO', 'Next Edge Head Office', 'sales@next-edge.lk', '+94770206960', 'Kalutara', 'Kalutara', 'Sri Lanka', 1, 1, '2026-06-12 23:48:46', '2026-06-12 23:48:46');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `brand_name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `status_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `website_active` tinyint(1) DEFAULT 1,
  `featured` tinyint(1) DEFAULT 0,
  `is_deleted` tinyint(1) DEFAULT 0,
  `deleted_at` datetime DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `brand_name`, `slug`, `status_id`, `is_active`, `website_active`, `featured`, `is_deleted`, `deleted_at`, `website`) VALUES
(1, 'NextEdge Tech', 'nextedge-tech', 1, 1, 1, 1, 0, NULL, NULL),
(2, 'TechCorp Solutions', 'techcorp-solutions', 1, 1, 1, 0, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `session_token` varchar(255) DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `customer_id`, `session_token`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'sess_xyz987abc123', '2026-06-14 12:00:00', '2026-06-13 00:12:38', '2026-06-13 00:12:38');

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cart_id` bigint(20) UNSIGNED NOT NULL,
  `item_type` enum('product','service','service_package') DEFAULT NULL,
  `product_variant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `service_id` bigint(20) UNSIGNED DEFAULT NULL,
  `service_package_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quantity` decimal(18,4) DEFAULT 1.0000,
  `unit_price` decimal(18,2) DEFAULT 0.00,
  `line_total` decimal(18,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart_items`
--

INSERT INTO `cart_items` (`id`, `cart_id`, `item_type`, `product_variant_id`, `service_id`, `service_package_id`, `quantity`, `unit_price`, `line_total`) VALUES
(1, 1, 'product', 1, NULL, NULL, 2.0000, 250000.00, 500000.00);

-- --------------------------------------------------------

--
-- Table structure for table `chart_of_accounts`
--

CREATE TABLE `chart_of_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `account_code` varchar(50) NOT NULL,
  `account_name` varchar(255) NOT NULL,
  `account_type_id` bigint(20) UNSIGNED NOT NULL,
  `description` text DEFAULT NULL,
  `is_system` tinyint(1) DEFAULT 0,
  `allow_manual_entries` tinyint(1) DEFAULT 1,
  `status_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chart_of_accounts`
--

INSERT INTO `chart_of_accounts` (`id`, `parent_id`, `account_code`, `account_name`, `account_type_id`, `description`, `is_system`, `allow_manual_entries`, `status_id`, `is_active`, `created_at`) VALUES
(1, NULL, '1000', 'Assets', 1, NULL, 1, 1, NULL, 1, '2026-06-12 23:26:27'),
(2, 1, '1100', 'Cash & Cash Equivalents', 1, NULL, 1, 1, NULL, 1, '2026-06-12 23:26:27'),
(3, 2, '1110', 'Cash On Hand', 1, NULL, 1, 1, NULL, 1, '2026-06-12 23:26:27'),
(4, 2, '1120', 'Petty Cash', 1, NULL, 1, 1, NULL, 1, '2026-06-12 23:26:27'),
(5, 2, '1130', 'Commercial Bank Account', 1, NULL, 1, 1, NULL, 1, '2026-06-12 23:26:27'),
(6, 2, '1140', 'Sampath Bank Account', 1, NULL, 1, 1, NULL, 1, '2026-06-12 23:26:27'),
(7, 2, '1150', 'PayHere Clearing Account', 1, NULL, 1, 1, NULL, 1, '2026-06-12 23:26:27'),
(8, 2, '1160', 'Stripe Clearing Account', 1, NULL, 1, 1, NULL, 1, '2026-06-12 23:26:27'),
(9, 1, '1200', 'Accounts Receivable', 1, NULL, 1, 1, NULL, 1, '2026-06-12 23:26:27'),
(10, 1, '1300', 'Inventory Assets', 1, NULL, 1, 1, NULL, 1, '2026-06-12 23:26:27'),
(11, 1, '1400', 'Fixed Assets', 1, NULL, 1, 1, NULL, 1, '2026-06-12 23:26:27'),
(12, 10, '1410', 'Computers & Equipment', 1, NULL, 1, 1, NULL, 1, '2026-06-12 23:26:27'),
(13, 10, '1420', 'Furniture & Fixtures', 1, NULL, 1, 1, NULL, 1, '2026-06-12 23:26:27'),
(14, 10, '1430', 'Vehicles', 1, NULL, 1, 1, NULL, 1, '2026-06-12 23:26:27'),
(15, NULL, '2000', 'Liabilities', 2, NULL, 1, 1, NULL, 1, '2026-06-12 23:26:27'),
(16, 14, '2100', 'Accounts Payable', 2, NULL, 1, 1, NULL, 1, '2026-06-12 23:26:27'),
(17, 14, '2200', 'Taxes Payable', 2, NULL, 1, 1, NULL, 1, '2026-06-12 23:26:27'),
(18, 14, '2300', 'Customer Deposits', 2, NULL, 1, 1, NULL, 1, '2026-06-12 23:26:27'),
(19, 14, '2400', 'Accrued Expenses', 2, NULL, 1, 1, NULL, 1, '2026-06-12 23:26:27'),
(20, NULL, '3000', 'Equity', 3, NULL, 1, 1, NULL, 1, '2026-06-12 23:26:27'),
(21, 19, '3100', 'Owner Capital', 3, NULL, 1, 1, NULL, 1, '2026-06-12 23:26:27'),
(22, 19, '3200', 'Retained Earnings', 3, NULL, 1, 1, NULL, 1, '2026-06-12 23:26:27'),
(23, 19, '3300', 'Current Year Earnings', 3, NULL, 1, 1, NULL, 1, '2026-06-12 23:26:27'),
(24, NULL, '4000', 'Income', 4, NULL, 1, 1, NULL, 1, '2026-06-12 23:26:27'),
(25, 23, '4100', 'Product Sales Income', 4, NULL, 1, 1, NULL, 1, '2026-06-12 23:26:27'),
(26, 23, '4200', 'Service Sales Income', 4, NULL, 1, 1, NULL, 1, '2026-06-12 23:26:27'),
(27, 23, '4300', 'Shipping Income', 4, NULL, 1, 1, NULL, 1, '2026-06-12 23:26:27'),
(28, 23, '4400', 'Other Income', 4, NULL, 1, 1, NULL, 1, '2026-06-12 23:26:27'),
(29, 23, '4500', 'Interest Income', 4, NULL, 1, 1, NULL, 1, '2026-06-12 23:26:27'),
(30, NULL, '5000', 'Cost of Sales', 5, NULL, 1, 1, NULL, 1, '2026-06-12 23:26:27'),
(31, 29, '5100', 'Product Cost of Sales', 5, NULL, 1, 1, NULL, 1, '2026-06-12 23:26:27'),
(32, 29, '5200', 'Service Delivery Costs', 5, NULL, 1, 1, NULL, 1, '2026-06-12 23:26:27'),
(33, NULL, '6000', 'Expenses', 6, NULL, 1, 1, NULL, 1, '2026-06-12 23:26:27'),
(34, 32, '6100', 'Salaries Expense', 6, NULL, 1, 1, NULL, 1, '2026-06-12 23:26:27'),
(35, 32, '6200', 'Rent Expense', 6, NULL, 1, 1, NULL, 1, '2026-06-12 23:26:27'),
(36, 32, '6300', 'Utilities Expense', 6, NULL, 1, 1, NULL, 1, '2026-06-12 23:26:27'),
(37, 32, '6400', 'Marketing Expense', 6, NULL, 1, 1, NULL, 1, '2026-06-12 23:26:27'),
(38, 32, '6500', 'Bank Charges', 6, NULL, 1, 1, NULL, 1, '2026-06-12 23:26:27'),
(39, 32, '6600', 'Software Subscriptions', 6, NULL, 1, 1, NULL, 1, '2026-06-12 23:26:27'),
(40, 32, '6700', 'Office Supplies', 6, NULL, 1, 1, NULL, 1, '2026-06-12 23:26:27'),
(41, 32, '6800', 'Internet & Communication', 6, NULL, 1, 1, NULL, 1, '2026-06-12 23:26:27'),
(42, 32, '6900', 'Travel Expense', 6, NULL, 1, 1, NULL, 1, '2026-06-12 23:26:27'),
(43, 32, '7000', 'Depreciation Expense', 6, NULL, 1, 1, NULL, 1, '2026-06-12 23:26:27'),
(44, 32, '7100', 'Miscellaneous Expense', 6, NULL, 1, 1, NULL, 1, '2026-06-12 23:26:27');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_name` varchar(255) DEFAULT NULL,
  `website_url` varchar(500) DEFAULT NULL,
  `status_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `website_active` tinyint(1) DEFAULT 1,
  `industry` varchar(255) DEFAULT NULL,
  `short_description` text DEFAULT NULL,
  `featured` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `client_name`, `website_url`, `status_id`, `is_active`, `website_active`, `industry`, `short_description`, `featured`, `created_at`) VALUES
(1, 'TechWave Solutions', NULL, 1, 1, 1, 'IT Services', NULL, 0, '2026-06-13 00:12:36');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coupon_code` varchar(100) DEFAULT NULL,
  `coupon_name` varchar(255) DEFAULT NULL,
  `discount_type` enum('percentage','fixed') DEFAULT NULL,
  `discount_value` decimal(18,2) DEFAULT NULL,
  `minimum_order_amount` decimal(18,2) DEFAULT 0.00,
  `usage_limit` int(11) DEFAULT NULL,
  `usage_count` int(11) DEFAULT 0,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `coupon_code`, `coupon_name`, `discount_type`, `discount_value`, `minimum_order_amount`, `usage_limit`, `usage_count`, `start_date`, `end_date`, `is_active`) VALUES
(1, 'WELCOME10', 'Welcome Customer Discount', 'percentage', 10.00, 0.00, NULL, 0, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `coupon_usage`
--

CREATE TABLE `coupon_usage` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coupon_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `used_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `currency_name` varchar(100) DEFAULT NULL,
  `country_name` varchar(100) DEFAULT NULL,
  `currency_code` varchar(10) NOT NULL,
  `currency_symbol` varchar(20) DEFAULT NULL,
  `exchange_rate` decimal(18,6) DEFAULT 1.000000,
  `is_default` tinyint(1) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `currency_name`, `country_name`, `currency_code`, `currency_symbol`, `exchange_rate`, `is_default`, `is_active`) VALUES
(1, 'Leke', 'Albania', 'ALL', 'Lek', 1.000000, 0, 1),
(2, 'Dollars', 'America', 'USD', '$', 1.000000, 0, 1),
(3, 'Afghanis', 'Afghanistan', 'AFN', '؋', 1.000000, 0, 1),
(4, 'Pesos', 'Argentina', 'ARS', '$', 1.000000, 0, 1),
(5, 'Guilders', 'Aruba', 'AWG', 'ƒ', 1.000000, 0, 1),
(6, 'Dollars', 'Australia', 'AUD', '$', 1.000000, 0, 1),
(7, 'New Manats', 'Azerbaijan', 'AZN', 'ман', 1.000000, 0, 1),
(8, 'Dollars', 'Bahamas', 'BSD', '$', 1.000000, 0, 1),
(9, 'Dollars', 'Barbados', 'BBD', '$', 1.000000, 0, 1),
(10, 'Rubles', 'Belarus', 'BYR', 'p.', 1.000000, 0, 1),
(11, 'Euro', 'Belgium', 'EUR', '€', 1.000000, 0, 1),
(12, 'Dollars', 'Beliz', 'BZD', 'BZ$', 1.000000, 0, 1),
(13, 'Dollars', 'Bermuda', 'BMD', '$', 1.000000, 0, 1),
(14, 'Bolivianos', 'Bolivia', 'BOB', '$b', 1.000000, 0, 1),
(15, 'Convertible Marka', 'Bosnia and Herzegovina', 'BAM', 'KM', 1.000000, 0, 1),
(16, 'Pula', 'Botswana', 'BWP', 'P', 1.000000, 0, 1),
(17, 'Leva', 'Bulgaria', 'BGN', 'лв', 1.000000, 0, 1),
(18, 'Reais', 'Brazil', 'BRL', 'R$', 1.000000, 0, 1),
(19, 'Pounds', 'Britain (United Kingdom)', 'GBP', '£', 1.000000, 0, 1),
(20, 'Dollars', 'Brunei Darussalam', 'BND', '$', 1.000000, 0, 1),
(21, 'Riels', 'Cambodia', 'KHR', '៛', 1.000000, 0, 1),
(22, 'Dollars', 'Canada', 'CAD', '$', 1.000000, 0, 1),
(23, 'Dollars', 'Cayman Islands', 'KYD', '$', 1.000000, 0, 1),
(24, 'Pesos', 'Chile', 'CLP', '$', 1.000000, 0, 1),
(25, 'Yuan Renminbi', 'China', 'CNY', '¥', 1.000000, 0, 1),
(26, 'Pesos', 'Colombia', 'COP', '$', 1.000000, 0, 1),
(27, 'Colón', 'Costa Rica', 'CRC', '₡', 1.000000, 0, 1),
(28, 'Kuna', 'Croatia', 'HRK', 'kn', 1.000000, 0, 1),
(29, 'Pesos', 'Cuba', 'CUP', '₱', 1.000000, 0, 1),
(30, 'Euro', 'Cyprus', 'EUR', '€', 1.000000, 0, 1),
(31, 'Koruny', 'Czech Republic', 'CZK', 'Kč', 1.000000, 0, 1),
(32, 'Kroner', 'Denmark', 'DKK', 'kr', 1.000000, 0, 1),
(33, 'Pesos', 'Dominican Republic', 'DOP ', 'RD$', 1.000000, 0, 1),
(34, 'Dollars', 'East Caribbean', 'XCD', '$', 1.000000, 0, 1),
(35, 'Pounds', 'Egypt', 'EGP', '£', 1.000000, 0, 1),
(36, 'Colones', 'El Salvador', 'SVC', '$', 1.000000, 0, 1),
(37, 'Pounds', 'England (United Kingdom)', 'GBP', '£', 1.000000, 0, 1),
(38, 'Euro', 'Euro', 'EUR', '€', 1.000000, 0, 1),
(39, 'Pounds', 'Falkland Islands', 'FKP', '£', 1.000000, 0, 1),
(40, 'Dollars', 'Fiji', 'FJD', '$', 1.000000, 0, 1),
(41, 'Euro', 'France', 'EUR', '€', 1.000000, 0, 1),
(42, 'Cedis', 'Ghana', 'GHC', '¢', 1.000000, 0, 1),
(43, 'Pounds', 'Gibraltar', 'GIP', '£', 1.000000, 0, 1),
(44, 'Euro', 'Greece', 'EUR', '€', 1.000000, 0, 1),
(45, 'Quetzales', 'Guatemala', 'GTQ', 'Q', 1.000000, 0, 1),
(46, 'Pounds', 'Guernsey', 'GGP', '£', 1.000000, 0, 1),
(47, 'Dollars', 'Guyana', 'GYD', '$', 1.000000, 0, 1),
(48, 'Euro', 'Holland (Netherlands)', 'EUR', '€', 1.000000, 0, 1),
(49, 'Lempiras', 'Honduras', 'HNL', 'L', 1.000000, 0, 1),
(50, 'Dollars', 'Hong Kong', 'HKD', '$', 1.000000, 0, 1),
(51, 'Forint', 'Hungary', 'HUF', 'Ft', 1.000000, 0, 1),
(52, 'Kronur', 'Iceland', 'ISK', 'kr', 1.000000, 0, 1),
(53, 'Rupees', 'India', 'INR', 'Rp', 1.000000, 0, 1),
(54, 'Rupiahs', 'Indonesia', 'IDR', 'Rp', 1.000000, 0, 1),
(55, 'Rials', 'Iran', 'IRR', '﷼', 1.000000, 0, 1),
(56, 'Euro', 'Ireland', 'EUR', '€', 1.000000, 0, 1),
(57, 'Pounds', 'Isle of Man', 'IMP', '£', 1.000000, 0, 1),
(58, 'New Shekels', 'Israel', 'ILS', '₪', 1.000000, 0, 1),
(59, 'Euro', 'Italy', 'EUR', '€', 1.000000, 0, 1),
(60, 'Dollars', 'Jamaica', 'JMD', 'J$', 1.000000, 0, 1),
(61, 'Yen', 'Japan', 'JPY', '¥', 1.000000, 0, 1),
(62, 'Pounds', 'Jersey', 'JEP', '£', 1.000000, 0, 1),
(63, 'Tenge', 'Kazakhstan', 'KZT', 'лв', 1.000000, 0, 1),
(64, 'Won', 'Korea (North)', 'KPW', '₩', 1.000000, 0, 1),
(65, 'Won', 'Korea (South)', 'KRW', '₩', 1.000000, 0, 1),
(66, 'Soms', 'Kyrgyzstan', 'KGS', 'лв', 1.000000, 0, 1),
(67, 'Kips', 'Laos', 'LAK', '₭', 1.000000, 0, 1),
(68, 'Lati', 'Latvia', 'LVL', 'Ls', 1.000000, 0, 1),
(69, 'Pounds', 'Lebanon', 'LBP', '£', 1.000000, 0, 1),
(70, 'Dollars', 'Liberia', 'LRD', '$', 1.000000, 0, 1),
(71, 'Switzerland Francs', 'Liechtenstein', 'CHF', 'CHF', 1.000000, 0, 1),
(72, 'Litai', 'Lithuania', 'LTL', 'Lt', 1.000000, 0, 1),
(73, 'Euro', 'Luxembourg', 'EUR', '€', 1.000000, 0, 1),
(74, 'Denars', 'Macedonia', 'MKD', 'ден', 1.000000, 0, 1),
(75, 'Ringgits', 'Malaysia', 'MYR', 'RM', 1.000000, 0, 1),
(76, 'Euro', 'Malta', 'EUR', '€', 1.000000, 0, 1),
(77, 'Rupees', 'Mauritius', 'MUR', '₨', 1.000000, 0, 1),
(78, 'Pesos', 'Mexico', 'MXN', '$', 1.000000, 0, 1),
(79, 'Tugriks', 'Mongolia', 'MNT', '₮', 1.000000, 0, 1),
(80, 'Meticais', 'Mozambique', 'MZN', 'MT', 1.000000, 0, 1),
(81, 'Dollars', 'Namibia', 'NAD', '$', 1.000000, 0, 1),
(82, 'Rupees', 'Nepal', 'NPR', '₨', 1.000000, 0, 1),
(83, 'Guilders', 'Netherlands Antilles', 'ANG', 'ƒ', 1.000000, 0, 1),
(84, 'Euro', 'Netherlands', 'EUR', '€', 1.000000, 0, 1),
(85, 'Dollars', 'New Zealand', 'NZD', '$', 1.000000, 0, 1),
(86, 'Cordobas', 'Nicaragua', 'NIO', 'C$', 1.000000, 0, 1),
(87, 'Nairas', 'Nigeria', 'NGN', '₦', 1.000000, 0, 1),
(88, 'Won', 'North Korea', 'KPW', '₩', 1.000000, 0, 1),
(89, 'Krone', 'Norway', 'NOK', 'kr', 1.000000, 0, 1),
(90, 'Rials', 'Oman', 'OMR', '﷼', 1.000000, 0, 1),
(91, 'Rupees', 'Pakistan', 'PKR', '₨', 1.000000, 0, 1),
(92, 'Balboa', 'Panama', 'PAB', 'B/.', 1.000000, 0, 1),
(93, 'Guarani', 'Paraguay', 'PYG', 'Gs', 1.000000, 0, 1),
(94, 'Nuevos Soles', 'Peru', 'PEN', 'S/.', 1.000000, 0, 1),
(95, 'Pesos', 'Philippines', 'PHP', 'Php', 1.000000, 0, 1),
(96, 'Zlotych', 'Poland', 'PLN', 'zł', 1.000000, 0, 1),
(97, 'Rials', 'Qatar', 'QAR', '﷼', 1.000000, 0, 1),
(98, 'New Lei', 'Romania', 'RON', 'lei', 1.000000, 0, 1),
(99, 'Rubles', 'Russia', 'RUB', 'руб', 1.000000, 0, 1),
(100, 'Pounds', 'Saint Helena', 'SHP', '£', 1.000000, 0, 1),
(101, 'Riyals', 'Saudi Arabia', 'SAR', '﷼', 1.000000, 0, 1),
(102, 'Dinars', 'Serbia', 'RSD', 'Дин.', 1.000000, 0, 1),
(103, 'Rupees', 'Seychelles', 'SCR', '₨', 1.000000, 0, 1),
(104, 'Dollars', 'Singapore', 'SGD', '$', 1.000000, 0, 1),
(105, 'Euro', 'Slovenia', 'EUR', '€', 1.000000, 0, 1),
(106, 'Dollars', 'Solomon Islands', 'SBD', '$', 1.000000, 0, 1),
(107, 'Shillings', 'Somalia', 'SOS', 'S', 1.000000, 0, 1),
(108, 'Rand', 'South Africa', 'ZAR', 'R', 1.000000, 0, 1),
(109, 'Won', 'South Korea', 'KRW', '₩', 1.000000, 0, 1),
(110, 'Euro', 'Spain', 'EUR', '€', 1.000000, 0, 1),
(111, 'Rupees', 'Sri Lanka', 'LKR', '₨', 1.000000, 0, 1),
(112, 'Kronor', 'Sweden', 'SEK', 'kr', 1.000000, 0, 1),
(113, 'Francs', 'Switzerland', 'CHF', 'CHF', 1.000000, 0, 1),
(114, 'Dollars', 'Suriname', 'SRD', '$', 1.000000, 0, 1),
(115, 'Pounds', 'Syria', 'SYP', '£', 1.000000, 0, 1),
(116, 'New Dollars', 'Taiwan', 'TWD', 'NT$', 1.000000, 0, 1),
(117, 'Baht', 'Thailand', 'THB', '฿', 1.000000, 0, 1),
(118, 'Dollars', 'Trinidad and Tobago', 'TTD', 'TT$', 1.000000, 0, 1),
(119, 'Lira', 'Turkey', 'TRY', 'TL', 1.000000, 0, 1),
(120, 'Liras', 'Turkey', 'TRL', '£', 1.000000, 0, 1),
(121, 'Dollars', 'Tuvalu', 'TVD', '$', 1.000000, 0, 1),
(122, 'Hryvnia', 'Ukraine', 'UAH', '₴', 1.000000, 0, 1),
(123, 'Pounds', 'United Kingdom', 'GBP', '£', 1.000000, 0, 1),
(124, 'Dollars', 'United States of America', 'USD', '$', 1.000000, 0, 1),
(125, 'Pesos', 'Uruguay', 'UYU', '$U', 1.000000, 0, 1),
(126, 'Sums', 'Uzbekistan', 'UZS', 'лв', 1.000000, 0, 1),
(127, 'Euro', 'Vatican City', 'EUR', '€', 1.000000, 0, 1),
(128, 'Bolivares Fuertes', 'Venezuela', 'VEF', 'Bs', 1.000000, 0, 1),
(129, 'Dong', 'Vietnam', 'VND', '₫', 1.000000, 0, 1),
(130, 'Rials', 'Yemen', 'YER', '﷼', 1.000000, 0, 1),
(131, 'Zimbabwe Dollars', 'Zimbabwe', 'ZWD', 'Z$', 1.000000, 0, 1),
(132, 'Rupees', 'India', 'INR', '₹', 1.000000, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

CREATE TABLE `currency` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country` varchar(100) DEFAULT NULL,
  `currency` varchar(100) DEFAULT NULL,
  `code` varchar(100) DEFAULT NULL,
  `symbol` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`id`, `country`, `currency`, `code`, `symbol`) VALUES
(1, 'Albania', 'Leke', 'ALL', 'Lek'),
(2, 'America', 'Dollars', 'USD', '$'),
(3, 'Afghanistan', 'Afghanis', 'AFN', '؋'),
(4, 'Argentina', 'Pesos', 'ARS', '$'),
(5, 'Aruba', 'Guilders', 'AWG', 'ƒ'),
(6, 'Australia', 'Dollars', 'AUD', '$'),
(7, 'Azerbaijan', 'New Manats', 'AZN', 'ман'),
(8, 'Bahamas', 'Dollars', 'BSD', '$'),
(9, 'Barbados', 'Dollars', 'BBD', '$'),
(10, 'Belarus', 'Rubles', 'BYR', 'p.'),
(11, 'Belgium', 'Euro', 'EUR', '€'),
(12, 'Beliz', 'Dollars', 'BZD', 'BZ$'),
(13, 'Bermuda', 'Dollars', 'BMD', '$'),
(14, 'Bolivia', 'Bolivianos', 'BOB', '$b'),
(15, 'Bosnia and Herzegovina', 'Convertible Marka', 'BAM', 'KM'),
(16, 'Botswana', 'Pula', 'BWP', 'P'),
(17, 'Bulgaria', 'Leva', 'BGN', 'лв'),
(18, 'Brazil', 'Reais', 'BRL', 'R$'),
(19, 'Britain (United Kingdom)', 'Pounds', 'GBP', '£'),
(20, 'Brunei Darussalam', 'Dollars', 'BND', '$'),
(21, 'Cambodia', 'Riels', 'KHR', '៛'),
(22, 'Canada', 'Dollars', 'CAD', '$'),
(23, 'Cayman Islands', 'Dollars', 'KYD', '$'),
(24, 'Chile', 'Pesos', 'CLP', '$'),
(25, 'China', 'Yuan Renminbi', 'CNY', '¥'),
(26, 'Colombia', 'Pesos', 'COP', '$'),
(27, 'Costa Rica', 'Colón', 'CRC', '₡'),
(28, 'Croatia', 'Kuna', 'HRK', 'kn'),
(29, 'Cuba', 'Pesos', 'CUP', '₱'),
(30, 'Cyprus', 'Euro', 'EUR', '€'),
(31, 'Czech Republic', 'Koruny', 'CZK', 'Kč'),
(32, 'Denmark', 'Kroner', 'DKK', 'kr'),
(33, 'Dominican Republic', 'Pesos', 'DOP ', 'RD$'),
(34, 'East Caribbean', 'Dollars', 'XCD', '$'),
(35, 'Egypt', 'Pounds', 'EGP', '£'),
(36, 'El Salvador', 'Colones', 'SVC', '$'),
(37, 'England (United Kingdom)', 'Pounds', 'GBP', '£'),
(38, 'Euro', 'Euro', 'EUR', '€'),
(39, 'Falkland Islands', 'Pounds', 'FKP', '£'),
(40, 'Fiji', 'Dollars', 'FJD', '$'),
(41, 'France', 'Euro', 'EUR', '€'),
(42, 'Ghana', 'Cedis', 'GHC', '¢'),
(43, 'Gibraltar', 'Pounds', 'GIP', '£'),
(44, 'Greece', 'Euro', 'EUR', '€'),
(45, 'Guatemala', 'Quetzales', 'GTQ', 'Q'),
(46, 'Guernsey', 'Pounds', 'GGP', '£'),
(47, 'Guyana', 'Dollars', 'GYD', '$'),
(48, 'Holland (Netherlands)', 'Euro', 'EUR', '€'),
(49, 'Honduras', 'Lempiras', 'HNL', 'L'),
(50, 'Hong Kong', 'Dollars', 'HKD', '$'),
(51, 'Hungary', 'Forint', 'HUF', 'Ft'),
(52, 'Iceland', 'Kronur', 'ISK', 'kr'),
(53, 'India', 'Rupees', 'INR', 'Rp'),
(54, 'Indonesia', 'Rupiahs', 'IDR', 'Rp'),
(55, 'Iran', 'Rials', 'IRR', '﷼'),
(56, 'Ireland', 'Euro', 'EUR', '€'),
(57, 'Isle of Man', 'Pounds', 'IMP', '£'),
(58, 'Israel', 'New Shekels', 'ILS', '₪'),
(59, 'Italy', 'Euro', 'EUR', '€'),
(60, 'Jamaica', 'Dollars', 'JMD', 'J$'),
(61, 'Japan', 'Yen', 'JPY', '¥'),
(62, 'Jersey', 'Pounds', 'JEP', '£'),
(63, 'Kazakhstan', 'Tenge', 'KZT', 'лв'),
(64, 'Korea (North)', 'Won', 'KPW', '₩'),
(65, 'Korea (South)', 'Won', 'KRW', '₩'),
(66, 'Kyrgyzstan', 'Soms', 'KGS', 'лв'),
(67, 'Laos', 'Kips', 'LAK', '₭'),
(68, 'Latvia', 'Lati', 'LVL', 'Ls'),
(69, 'Lebanon', 'Pounds', 'LBP', '£'),
(70, 'Liberia', 'Dollars', 'LRD', '$'),
(71, 'Liechtenstein', 'Switzerland Francs', 'CHF', 'CHF'),
(72, 'Lithuania', 'Litai', 'LTL', 'Lt'),
(73, 'Luxembourg', 'Euro', 'EUR', '€'),
(74, 'Macedonia', 'Denars', 'MKD', 'ден'),
(75, 'Malaysia', 'Ringgits', 'MYR', 'RM'),
(76, 'Malta', 'Euro', 'EUR', '€'),
(77, 'Mauritius', 'Rupees', 'MUR', '₨'),
(78, 'Mexico', 'Pesos', 'MXN', '$'),
(79, 'Mongolia', 'Tugriks', 'MNT', '₮'),
(80, 'Mozambique', 'Meticais', 'MZN', 'MT'),
(81, 'Namibia', 'Dollars', 'NAD', '$'),
(82, 'Nepal', 'Rupees', 'NPR', '₨'),
(83, 'Netherlands Antilles', 'Guilders', 'ANG', 'ƒ'),
(84, 'Netherlands', 'Euro', 'EUR', '€'),
(85, 'New Zealand', 'Dollars', 'NZD', '$'),
(86, 'Nicaragua', 'Cordobas', 'NIO', 'C$'),
(87, 'Nigeria', 'Nairas', 'NGN', '₦'),
(88, 'North Korea', 'Won', 'KPW', '₩'),
(89, 'Norway', 'Krone', 'NOK', 'kr'),
(90, 'Oman', 'Rials', 'OMR', '﷼'),
(91, 'Pakistan', 'Rupees', 'PKR', '₨'),
(92, 'Panama', 'Balboa', 'PAB', 'B/.'),
(93, 'Paraguay', 'Guarani', 'PYG', 'Gs'),
(94, 'Peru', 'Nuevos Soles', 'PEN', 'S/.'),
(95, 'Philippines', 'Pesos', 'PHP', 'Php'),
(96, 'Poland', 'Zlotych', 'PLN', 'zł'),
(97, 'Qatar', 'Rials', 'QAR', '﷼'),
(98, 'Romania', 'New Lei', 'RON', 'lei'),
(99, 'Russia', 'Rubles', 'RUB', 'руб'),
(100, 'Saint Helena', 'Pounds', 'SHP', '£'),
(101, 'Saudi Arabia', 'Riyals', 'SAR', '﷼'),
(102, 'Serbia', 'Dinars', 'RSD', 'Дин.'),
(103, 'Seychelles', 'Rupees', 'SCR', '₨'),
(104, 'Singapore', 'Dollars', 'SGD', '$'),
(105, 'Slovenia', 'Euro', 'EUR', '€'),
(106, 'Solomon Islands', 'Dollars', 'SBD', '$'),
(107, 'Somalia', 'Shillings', 'SOS', 'S'),
(108, 'South Africa', 'Rand', 'ZAR', 'R'),
(109, 'South Korea', 'Won', 'KRW', '₩'),
(110, 'Spain', 'Euro', 'EUR', '€'),
(111, 'Sri Lanka', 'Rupees', 'LKR', '₨'),
(112, 'Sweden', 'Kronor', 'SEK', 'kr'),
(113, 'Switzerland', 'Francs', 'CHF', 'CHF'),
(114, 'Suriname', 'Dollars', 'SRD', '$'),
(115, 'Syria', 'Pounds', 'SYP', '£'),
(116, 'Taiwan', 'New Dollars', 'TWD', 'NT$'),
(117, 'Thailand', 'Baht', 'THB', '฿'),
(118, 'Trinidad and Tobago', 'Dollars', 'TTD', 'TT$'),
(119, 'Turkey', 'Lira', 'TRY', 'TL'),
(120, 'Turkey', 'Liras', 'TRL', '£'),
(121, 'Tuvalu', 'Dollars', 'TVD', '$'),
(122, 'Ukraine', 'Hryvnia', 'UAH', '₴'),
(123, 'United Kingdom', 'Pounds', 'GBP', '£'),
(124, 'United States of America', 'Dollars', 'USD', '$'),
(125, 'Uruguay', 'Pesos', 'UYU', '$U'),
(126, 'Uzbekistan', 'Sums', 'UZS', 'лв'),
(127, 'Vatican City', 'Euro', 'EUR', '€'),
(128, 'Venezuela', 'Bolivares Fuertes', 'VEF', 'Bs'),
(129, 'Vietnam', 'Dong', 'VND', '₫'),
(130, 'Yemen', 'Rials', 'YER', '﷼'),
(131, 'Zimbabwe', 'Zimbabwe Dollars', 'ZWD', 'Z$'),
(132, 'India', 'Rupees', 'INR', '₹');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_code` varchar(100) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `first_name` varchar(150) DEFAULT NULL,
  `last_name` varchar(150) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `credit_limit` decimal(18,2) DEFAULT NULL,
  `tax_no` varchar(100) DEFAULT NULL,
  `status_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `user_id`, `customer_code`, `company_name`, `first_name`, `last_name`, `email`, `mobile`, `credit_limit`, `tax_no`, `status_id`) VALUES
(1, NULL, 'CUST-0001', 'Acme Corporation', 'John', 'Doe', 'john.doe@acme.com', '+94771234567', 500000.00, NULL, 36);

-- --------------------------------------------------------

--
-- Table structure for table `email_logs`
--

CREATE TABLE `email_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `recipient_email` varchar(255) DEFAULT NULL,
  `subject` varchar(500) DEFAULT NULL,
  `email_body` longtext DEFAULT NULL,
  `status` enum('pending','sent','failed') DEFAULT 'pending',
  `error_message` longtext DEFAULT NULL,
  `sent_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `expense_no` varchar(100) DEFAULT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `supplier_id` bigint(20) UNSIGNED DEFAULT NULL,
  `expense_date` date DEFAULT NULL,
  `total_amount` decimal(18,2) DEFAULT NULL,
  `status_id` bigint(20) UNSIGNED DEFAULT NULL,
  `remarks` longtext DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `expense_no`, `branch_id`, `supplier_id`, `expense_date`, `total_amount`, `status_id`, `remarks`, `created_by`, `created_at`) VALUES
(1, 'EXP-2606-001', 1, 1, '2026-06-12', 15000.00, 45, NULL, 1, '2026-06-13 00:12:37');

-- --------------------------------------------------------

--
-- Table structure for table `expense_items`
--

CREATE TABLE `expense_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `expense_id` bigint(20) UNSIGNED NOT NULL,
  `account_id` bigint(20) UNSIGNED NOT NULL,
  `description` text DEFAULT NULL,
  `amount` decimal(18,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `expense_items`
--

INSERT INTO `expense_items` (`id`, `expense_id`, `account_id`, `description`, `amount`) VALUES
(1, 1, 41, 'Monthly Office Fiber Connection', 15000.00);

-- --------------------------------------------------------

--
-- Table structure for table `general_ledger`
--

CREATE TABLE `general_ledger` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `account_id` bigint(20) UNSIGNED NOT NULL,
  `journal_entry_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_date` date NOT NULL,
  `debit_amount` decimal(18,2) DEFAULT 0.00,
  `credit_amount` decimal(18,2) DEFAULT 0.00,
  `running_balance` decimal(18,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `income_records`
--

CREATE TABLE `income_records` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `income_no` varchar(100) DEFAULT NULL,
  `income_date` date DEFAULT NULL,
  `account_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(18,2) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `status_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inquiry_email_recipients`
--

CREATE TABLE `inquiry_email_recipients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `form_id` bigint(20) UNSIGNED NOT NULL,
  `recipient_name` varchar(255) DEFAULT NULL,
  `recipient_email` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inquiry_email_templates`
--

CREATE TABLE `inquiry_email_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `form_id` bigint(20) UNSIGNED NOT NULL,
  `template_type` enum('admin_notification','customer_copy') DEFAULT NULL,
  `email_subject` varchar(500) DEFAULT NULL,
  `email_body` longtext DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inquiry_followups`
--

CREATE TABLE `inquiry_followups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `submission_id` bigint(20) UNSIGNED NOT NULL,
  `assigned_to` bigint(20) UNSIGNED DEFAULT NULL,
  `followup_note` longtext DEFAULT NULL,
  `next_followup_date` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inquiry_forms`
--

CREATE TABLE `inquiry_forms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `form_name` varchar(255) NOT NULL,
  `form_code` varchar(100) NOT NULL,
  `form_description` text DEFAULT NULL,
  `success_message` text DEFAULT NULL,
  `redirect_url` varchar(500) DEFAULT NULL,
  `send_admin_email` tinyint(1) DEFAULT 1,
  `send_customer_copy` tinyint(1) DEFAULT 0,
  `customer_email_field_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `website_active` tinyint(1) DEFAULT 1,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `internal_notes` longtext DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inquiry_forms`
--

INSERT INTO `inquiry_forms` (`id`, `form_name`, `form_code`, `form_description`, `success_message`, `redirect_url`, `send_admin_email`, `send_customer_copy`, `customer_email_field_id`, `status_id`, `is_active`, `website_active`, `created_by`, `internal_notes`, `created_at`, `updated_at`) VALUES
(1, 'General Contact Us', 'CONTACT_US', NULL, NULL, NULL, 1, 0, NULL, 1, 1, 1, 1, NULL, '2026-06-13 00:12:37', '2026-06-13 00:12:37');

-- --------------------------------------------------------

--
-- Table structure for table `inquiry_form_fields`
--

CREATE TABLE `inquiry_form_fields` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `form_id` bigint(20) UNSIGNED NOT NULL,
  `field_label` varchar(255) NOT NULL,
  `field_name` varchar(255) NOT NULL,
  `field_type` enum('text','textarea','email','number','phone','url','date','datetime','select','radio','checkbox','file','hidden','heading','html') DEFAULT NULL,
  `placeholder` varchar(255) DEFAULT NULL,
  `default_value` text DEFAULT NULL,
  `is_required` tinyint(1) DEFAULT 0,
  `is_unique` tinyint(1) DEFAULT 0,
  `display_order` int(11) DEFAULT 0,
  `width` enum('25','50','75','100') DEFAULT '100',
  `validation_regex` text DEFAULT NULL,
  `help_text` text DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inquiry_form_fields`
--

INSERT INTO `inquiry_form_fields` (`id`, `form_id`, `field_label`, `field_name`, `field_type`, `placeholder`, `default_value`, `is_required`, `is_unique`, `display_order`, `width`, `validation_regex`, `help_text`, `is_active`) VALUES
(1, 1, 'Full Name', 'full_name', 'text', NULL, NULL, 1, 0, 0, '100', NULL, NULL, 1),
(2, 1, 'Email Address', 'email', 'email', NULL, NULL, 1, 0, 0, '100', NULL, NULL, 1),
(3, 1, 'Message', 'message', 'textarea', NULL, NULL, 1, 0, 0, '100', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `inquiry_form_field_options`
--

CREATE TABLE `inquiry_form_field_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `field_id` bigint(20) UNSIGNED NOT NULL,
  `option_label` varchar(255) DEFAULT NULL,
  `option_value` varchar(255) DEFAULT NULL,
  `display_order` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inquiry_submissions`
--

CREATE TABLE `inquiry_submissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `form_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(100) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `status_id` bigint(20) UNSIGNED DEFAULT NULL,
  `submitted_at` datetime DEFAULT current_timestamp(),
  `assigned_to` bigint(20) UNSIGNED DEFAULT NULL,
  `assigned_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inquiry_submissions`
--

INSERT INTO `inquiry_submissions` (`id`, `form_id`, `customer_id`, `ip_address`, `user_agent`, `status_id`, `submitted_at`, `assigned_to`, `assigned_at`) VALUES
(1, 1, 1, NULL, NULL, 46, '2026-06-13 00:12:37', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `inquiry_submission_files`
--

CREATE TABLE `inquiry_submission_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `submission_id` bigint(20) UNSIGNED NOT NULL,
  `field_id` bigint(20) UNSIGNED NOT NULL,
  `media_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inquiry_submission_values`
--

CREATE TABLE `inquiry_submission_values` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `submission_id` bigint(20) UNSIGNED NOT NULL,
  `field_id` bigint(20) UNSIGNED NOT NULL,
  `submitted_value` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inquiry_submission_values`
--

INSERT INTO `inquiry_submission_values` (`id`, `submission_id`, `field_id`, `submitted_value`) VALUES
(1, 1, 1, 'John Doe'),
(2, 1, 2, 'john.doe@acme.com'),
(3, 1, 3, 'I would like to inquire about bulk ordering the NextEdge Laptops.');

-- --------------------------------------------------------

--
-- Table structure for table `inventory_stock`
--

CREATE TABLE `inventory_stock` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_variant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `qty_on_hand` decimal(18,4) DEFAULT 0.0000,
  `qty_reserved` decimal(18,4) DEFAULT 0.0000,
  `reorder_level` decimal(18,4) DEFAULT 0.0000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory_stock`
--

INSERT INTO `inventory_stock` (`id`, `warehouse_id`, `product_variant_id`, `qty_on_hand`, `qty_reserved`, `reorder_level`) VALUES
(1, 1, 1, 50.0000, 0.0000, 5.0000);

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_no` varchar(100) DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `invoice_date` datetime DEFAULT NULL,
  `due_date` datetime DEFAULT NULL,
  `subtotal` decimal(18,2) DEFAULT NULL,
  `tax_amount` decimal(18,2) DEFAULT NULL,
  `grand_total` decimal(18,2) DEFAULT NULL,
  `status_id` bigint(20) UNSIGNED DEFAULT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `currency_id` bigint(20) UNSIGNED DEFAULT NULL,
  `discount_amount` decimal(18,2) DEFAULT 0.00,
  `paid_amount` decimal(18,2) DEFAULT 0.00,
  `balance_amount` decimal(18,2) DEFAULT 0.00,
  `remarks` longtext DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `invoice_no`, `order_id`, `customer_id`, `invoice_date`, `due_date`, `subtotal`, `tax_amount`, `grand_total`, `status_id`, `branch_id`, `currency_id`, `discount_amount`, `paid_amount`, `balance_amount`, `remarks`, `created_by`) VALUES
(1, 'INV-2606-1001', 1, 1, '2026-06-13 10:00:00', '2026-06-27 10:00:00', 250000.00, 45000.00, 295000.00, 24, 1, 111, 0.00, 0.00, 295000.00, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `invoice_items`
--

CREATE TABLE `invoice_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` bigint(20) UNSIGNED NOT NULL,
  `item_type` enum('product','service','service_package') DEFAULT NULL,
  `product_variant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `service_id` bigint(20) UNSIGNED DEFAULT NULL,
  `service_package_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quantity` decimal(18,4) DEFAULT NULL,
  `unit_price` decimal(18,2) DEFAULT NULL,
  `discount_amount` decimal(18,2) DEFAULT 0.00,
  `tax_amount` decimal(18,2) DEFAULT 0.00,
  `line_total` decimal(18,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `invoice_items`
--

INSERT INTO `invoice_items` (`id`, `invoice_id`, `item_type`, `product_variant_id`, `service_id`, `service_package_id`, `quantity`, `unit_price`, `discount_amount`, `tax_amount`, `line_total`) VALUES
(1, 1, 'product', 1, NULL, NULL, 1.0000, 250000.00, 0.00, 45000.00, 295000.00);

-- --------------------------------------------------------

--
-- Table structure for table `journal_entries`
--

CREATE TABLE `journal_entries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `journal_no` varchar(100) DEFAULT NULL,
  `entry_date` date NOT NULL,
  `reference_type` varchar(100) DEFAULT NULL,
  `reference_id` bigint(20) UNSIGNED DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `journal_entries`
--

INSERT INTO `journal_entries` (`id`, `journal_no`, `entry_date`, `reference_type`, `reference_id`, `description`, `created_by`, `created_at`) VALUES
(1, 'JRN-2606-001', '2026-06-12', 'expense', 1, 'Payment for Fiber Connection', 1, '2026-06-13 00:12:37');

-- --------------------------------------------------------

--
-- Table structure for table `journal_entry_lines`
--

CREATE TABLE `journal_entry_lines` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `journal_entry_id` bigint(20) UNSIGNED NOT NULL,
  `account_id` bigint(20) UNSIGNED NOT NULL,
  `debit_amount` decimal(18,2) DEFAULT 0.00,
  `credit_amount` decimal(18,2) DEFAULT 0.00,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `journal_entry_lines`
--

INSERT INTO `journal_entry_lines` (`id`, `journal_entry_id`, `account_id`, `debit_amount`, `credit_amount`, `description`) VALUES
(1, 1, 41, 15000.00, 0.00, NULL),
(2, 1, 5, 0.00, 15000.00, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `media_folders`
--

CREATE TABLE `media_folders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `folder_name` varchar(255) NOT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `media_folders`
--

INSERT INTO `media_folders` (`id`, `parent_id`, `folder_name`, `created_by`, `created_at`) VALUES
(1, NULL, 'Products', 1, '2026-06-13 00:12:35'),
(2, NULL, 'Portfolios', 1, '2026-06-13 00:12:35');

-- --------------------------------------------------------

--
-- Table structure for table `media_library`
--

CREATE TABLE `media_library` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `folder_id` bigint(20) UNSIGNED DEFAULT NULL,
  `file_name` varchar(255) NOT NULL,
  `original_name` varchar(255) DEFAULT NULL,
  `file_extension` varchar(20) DEFAULT NULL,
  `mime_type` varchar(150) DEFAULT NULL,
  `file_size` bigint(20) UNSIGNED DEFAULT NULL,
  `storage_type` enum('database','filesystem','s3') DEFAULT 'filesystem',
  `file_blob` longblob DEFAULT NULL,
  `file_path` varchar(1000) DEFAULT NULL,
  `alt_text` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `caption` text DEFAULT NULL,
  `seo_filename` varchar(255) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `checksum` varchar(255) DEFAULT NULL,
  `uploaded_by` bigint(20) UNSIGNED DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `is_deleted` tinyint(1) DEFAULT 0,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `media_library`
--

INSERT INTO `media_library` (`id`, `folder_id`, `file_name`, `original_name`, `file_extension`, `mime_type`, `file_size`, `storage_type`, `file_blob`, `file_path`, `alt_text`, `title`, `caption`, `seo_filename`, `width`, `height`, `checksum`, `uploaded_by`, `is_active`, `is_deleted`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'nextedge-laptop-front.jpg', 'laptop-front.jpg', NULL, 'image/jpeg', NULL, 'filesystem', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, NULL, '2026-06-13 00:12:35', '2026-06-13 00:12:35'),
(2, 2, 'techwave-site-mockup.png', 'mockup.png', NULL, 'image/png', NULL, 'filesystem', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, NULL, '2026-06-13 00:12:35', '2026-06-13 00:12:35');

-- --------------------------------------------------------

--
-- Table structure for table `media_relations`
--

CREATE TABLE `media_relations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `media_id` bigint(20) UNSIGNED NOT NULL,
  `module_name` varchar(100) NOT NULL,
  `record_id` bigint(20) UNSIGNED NOT NULL,
  `media_type` varchar(100) DEFAULT NULL,
  `sort_order` int(11) DEFAULT 0,
  `is_primary` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `media_relations`
--

INSERT INTO `media_relations` (`id`, `media_id`, `module_name`, `record_id`, `media_type`, `sort_order`, `is_primary`) VALUES
(1, 1, 'products', 1, 'image', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` longtext DEFAULT NULL,
  `notification_type` varchar(100) DEFAULT NULL,
  `reference_type` varchar(100) DEFAULT NULL,
  `reference_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `read_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_no` varchar(100) NOT NULL,
  `quotation_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sales_rep_id` bigint(20) UNSIGNED DEFAULT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `currency_id` bigint(20) UNSIGNED DEFAULT NULL,
  `billing_address_id` bigint(20) UNSIGNED DEFAULT NULL,
  `shipping_address_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_source` enum('website','dashboard','pos','mobile_app') DEFAULT 'website',
  `status_id` bigint(20) UNSIGNED DEFAULT NULL,
  `subtotal` decimal(18,2) DEFAULT 0.00,
  `discount_amount` decimal(18,2) DEFAULT 0.00,
  `tax_amount` decimal(18,2) DEFAULT 0.00,
  `shipping_amount` decimal(18,2) DEFAULT 0.00,
  `grand_total` decimal(18,2) DEFAULT 0.00,
  `internal_remarks` longtext DEFAULT NULL,
  `customer_remarks` longtext DEFAULT NULL,
  `ordered_at` datetime DEFAULT current_timestamp(),
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_no`, `quotation_id`, `customer_id`, `sales_rep_id`, `branch_id`, `currency_id`, `billing_address_id`, `shipping_address_id`, `order_source`, `status_id`, `subtotal`, `discount_amount`, `tax_amount`, `shipping_amount`, `grand_total`, `internal_remarks`, `customer_remarks`, `ordered_at`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'ORD-2606-1001', NULL, 1, NULL, 1, 111, 1, 1, 'dashboard', 4, 250000.00, 0.00, 45000.00, 0.00, 295000.00, NULL, NULL, '2026-06-12 23:52:35', 1, NULL, '2026-06-12 23:52:35', '2026-06-12 23:52:35');

-- --------------------------------------------------------

--
-- Table structure for table `order_history`
--

CREATE TABLE `order_history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `status_id` bigint(20) UNSIGNED DEFAULT NULL,
  `remarks` longtext DEFAULT NULL,
  `changed_by` bigint(20) UNSIGNED DEFAULT NULL,
  `changed_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_variant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `service_id` bigint(20) UNSIGNED DEFAULT NULL,
  `service_package_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quantity` decimal(18,4) DEFAULT 1.0000,
  `unit_price` decimal(18,2) DEFAULT 0.00,
  `discount_amount` decimal(18,2) DEFAULT 0.00,
  `tax_amount` decimal(18,2) DEFAULT 0.00,
  `line_total` decimal(18,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_variant_id`, `service_id`, `service_package_id`, `quantity`, `unit_price`, `discount_amount`, `tax_amount`, `line_total`) VALUES
(1, 1, 1, NULL, NULL, 1.0000, 250000.00, 0.00, 45000.00, 295000.00);

-- --------------------------------------------------------

--
-- Table structure for table `order_notes`
--

CREATE TABLE `order_notes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `note_text` longtext DEFAULT NULL,
  `visible_to_customer` tinyint(1) DEFAULT 0,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_tracking`
--

CREATE TABLE `order_tracking` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `tracking_number` varchar(255) DEFAULT NULL,
  `tracking_status` varchar(255) DEFAULT NULL,
  `tracking_url` varchar(500) DEFAULT NULL,
  `updated_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `package_features`
--

CREATE TABLE `package_features` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `package_id` bigint(20) UNSIGNED NOT NULL,
  `group_id` bigint(20) UNSIGNED DEFAULT NULL,
  `feature_name` varchar(255) NOT NULL,
  `display_order` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `package_features`
--

INSERT INTO `package_features` (`id`, `package_id`, `group_id`, `feature_name`, `display_order`) VALUES
(1, 1, 1, 'Mobile Responsive Design', 1),
(2, 1, 1, 'Payment Gateway Integration', 2);

-- --------------------------------------------------------

--
-- Table structure for table `package_feature_groups`
--

CREATE TABLE `package_feature_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `package_id` bigint(20) UNSIGNED NOT NULL,
  `group_name` varchar(255) DEFAULT NULL,
  `display_order` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `package_feature_groups`
--

INSERT INTO `package_feature_groups` (`id`, `package_id`, `group_name`, `display_order`) VALUES
(1, 1, 'Core Functionality', 1);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_no` varchar(100) DEFAULT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_method_id` bigint(20) UNSIGNED DEFAULT NULL,
  `amount` decimal(18,2) DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `transaction_reference` varchar(255) DEFAULT NULL,
  `remarks` longtext DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `payment_no`, `customer_id`, `payment_method_id`, `amount`, `payment_date`, `transaction_reference`, `remarks`, `created_by`, `status_id`) VALUES
(1, 'PAY-2606-1001', 1, 1, 295000.00, '2026-06-13 11:30:00', 'TRX-99382-BANK', NULL, 1, 19);

-- --------------------------------------------------------

--
-- Table structure for table `payment_allocations`
--

CREATE TABLE `payment_allocations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_id` bigint(20) UNSIGNED NOT NULL,
  `reference_type` enum('order','invoice','quotation') DEFAULT NULL,
  `reference_id` bigint(20) UNSIGNED NOT NULL,
  `allocated_amount` decimal(18,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment_allocations`
--

INSERT INTO `payment_allocations` (`id`, `payment_id`, `reference_type`, `reference_id`, `allocated_amount`) VALUES
(1, 1, 'invoice', 1, 295000.00);

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `method_name` varchar(255) DEFAULT NULL,
  `method_code` varchar(100) DEFAULT NULL,
  `is_online` tinyint(1) DEFAULT 0,
  `status_id` bigint(20) UNSIGNED DEFAULT NULL,
  `description` text DEFAULT NULL,
  `processing_fee` decimal(18,2) DEFAULT 0.00,
  `sort_order` int(11) DEFAULT 0,
  `website_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `method_name`, `method_code`, `is_online`, `status_id`, `description`, `processing_fee`, `sort_order`, `website_active`) VALUES
(1, 'Bank Transfer', 'BANK_TRANSFER', 0, 1, 'Direct bank to bank transfer', 0.00, 1, 1),
(2, 'Credit Card (Stripe)', 'STRIPE', 1, 1, 'Pay securely with your credit card', 0.00, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `permission_name` varchar(255) NOT NULL,
  `permission_code` varchar(255) NOT NULL,
  `module_name` varchar(150) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `permission_name`, `permission_code`, `module_name`, `created_at`) VALUES
(1, 'Full System Access', 'ALL_ACCESS', 'system', '2026-06-12 23:48:47'),
(2, 'Manage Users', 'MANAGE_USERS', 'users', '2026-06-12 23:48:47'),
(3, 'Manage Products', 'MANAGE_PRODUCTS', 'products', '2026-06-12 23:48:47'),
(4, 'Manage Services', 'MANAGE_SERVICES', 'services', '2026-06-12 23:48:47'),
(5, 'Manage Orders', 'MANAGE_ORDERS', 'orders', '2026-06-12 23:48:47'),
(6, 'Manage Inventory', 'MANAGE_INVENTORY', 'inventory', '2026-06-12 23:48:47'),
(7, 'Manage Customers', 'MANAGE_CUSTOMERS', 'customers', '2026-06-12 23:48:47'),
(8, 'Manage Reports', 'MANAGE_REPORTS', 'reports', '2026-06-12 23:48:47');

-- --------------------------------------------------------

--
-- Table structure for table `portfolios`
--

CREATE TABLE `portfolios` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(500) NOT NULL,
  `slug` varchar(500) NOT NULL,
  `short_description` text DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `project_url` varchar(1000) DEFAULT NULL,
  `completion_date` date DEFAULT NULL,
  `view_count` bigint(20) UNSIGNED DEFAULT 0,
  `status_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `website_active` tinyint(1) DEFAULT 1,
  `featured` tinyint(1) DEFAULT 0,
  `is_deleted` tinyint(1) DEFAULT 0,
  `deleted_at` datetime DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `portfolios`
--

INSERT INTO `portfolios` (`id`, `title`, `slug`, `short_description`, `content`, `client_id`, `project_url`, `completion_date`, `view_count`, `status_id`, `is_active`, `website_active`, `featured`, `is_deleted`, `deleted_at`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'TechWave Corporate Website', 'techwave-corporate-website', NULL, NULL, 1, NULL, NULL, 0, 1, 1, 1, 0, 0, NULL, 1, NULL, '2026-06-13 00:12:36', '2026-06-13 00:12:36');

-- --------------------------------------------------------

--
-- Table structure for table `portfolio_categories`
--

CREATE TABLE `portfolio_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `status_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `website_active` tinyint(1) DEFAULT 1,
  `featured` tinyint(1) DEFAULT 0,
  `is_deleted` tinyint(1) DEFAULT 0,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `portfolio_categories`
--

INSERT INTO `portfolio_categories` (`id`, `parent_id`, `category_name`, `slug`, `description`, `status_id`, `is_active`, `website_active`, `featured`, `is_deleted`, `deleted_at`, `created_at`) VALUES
(1, NULL, 'Web Development', 'web-development', NULL, 1, 1, 1, 0, 0, NULL, '2026-06-13 00:12:36');

-- --------------------------------------------------------

--
-- Table structure for table `portfolio_category_relations`
--

CREATE TABLE `portfolio_category_relations` (
  `portfolio_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `portfolio_category_relations`
--

INSERT INTO `portfolio_category_relations` (`portfolio_id`, `category_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `portfolio_contents`
--

CREATE TABLE `portfolio_contents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `portfolio_id` bigint(20) UNSIGNED NOT NULL,
  `content_type` enum('text','image','video','html') DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `display_order` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `portfolio_views`
--

CREATE TABLE `portfolio_views` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `portfolio_id` bigint(20) UNSIGNED NOT NULL,
  `ip_address` varchar(100) DEFAULT NULL,
  `country` varchar(150) DEFAULT NULL,
  `city` varchar(150) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `viewed_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_type` enum('simple','variant') NOT NULL DEFAULT 'simple',
  `product_name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `sku` varchar(150) DEFAULT NULL,
  `barcode` varchar(255) DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tax_id` bigint(20) UNSIGNED DEFAULT NULL,
  `website_sort_order` int(11) DEFAULT 0,
  `unit_of_measure` varchar(50) DEFAULT 'PCS',
  `short_description` text DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `track_inventory` tinyint(1) DEFAULT 1,
  `allow_backorder` tinyint(1) DEFAULT 0,
  `minimum_order_qty` decimal(18,4) DEFAULT 1.0000,
  `maximum_order_qty` decimal(18,4) DEFAULT NULL,
  `status_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `website_active` tinyint(1) DEFAULT 1,
  `featured` tinyint(1) DEFAULT 0,
  `is_deleted` tinyint(1) DEFAULT 0,
  `deleted_at` datetime DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_type`, `product_name`, `slug`, `sku`, `barcode`, `brand_id`, `tax_id`, `website_sort_order`, `unit_of_measure`, `short_description`, `description`, `track_inventory`, `allow_backorder`, `minimum_order_qty`, `maximum_order_qty`, `status_id`, `is_active`, `website_active`, `featured`, `is_deleted`, `deleted_at`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'simple', 'NextEdge Pro Developer Laptop', 'nextedge-pro-developer-laptop', 'NE-LPT-PRO-01', NULL, 1, 1, 0, 'PCS', NULL, NULL, 1, 0, 1.0000, NULL, 29, 1, 1, 0, 0, NULL, 1, NULL, '2026-06-12 23:52:34', '2026-06-12 23:52:34');

-- --------------------------------------------------------

--
-- Table structure for table `product_attributes`
--

CREATE TABLE `product_attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `attribute_name` varchar(255) NOT NULL,
  `display_order` int(11) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_attributes`
--

INSERT INTO `product_attributes` (`id`, `product_id`, `attribute_name`, `display_order`, `is_active`, `created_at`) VALUES
(1, 1, 'Color', 0, 1, '2026-06-13 00:12:35');

-- --------------------------------------------------------

--
-- Table structure for table `product_attribute_values`
--

CREATE TABLE `product_attribute_values` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attribute_id` bigint(20) UNSIGNED NOT NULL,
  `value_name` varchar(255) NOT NULL,
  `display_order` int(11) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_attribute_values`
--

INSERT INTO `product_attribute_values` (`id`, `attribute_id`, `value_name`, `display_order`, `is_active`, `created_at`) VALUES
(1, 1, 'Space Gray', 0, 1, '2026-06-13 00:12:35'),
(2, 1, 'Silver', 0, 1, '2026-06-13 00:12:35');

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `status_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `website_active` tinyint(1) DEFAULT 1,
  `featured` tinyint(1) DEFAULT 0,
  `is_deleted` tinyint(1) DEFAULT 0,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`id`, `parent_id`, `category_name`, `slug`, `description`, `status_id`, `is_active`, `website_active`, `featured`, `is_deleted`, `deleted_at`) VALUES
(1, NULL, 'Hardware', 'hardware', NULL, 1, 1, 1, 0, 0, NULL),
(2, 1, 'Laptops', 'laptops', NULL, 1, 1, 1, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_category_relations`
--

CREATE TABLE `product_category_relations` (
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_category_relations`
--

INSERT INTO `product_category_relations` (`product_id`, `category_id`) VALUES
(1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `product_variants`
--

CREATE TABLE `product_variants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `variant_name` varchar(255) DEFAULT NULL,
  `sku` varchar(150) DEFAULT NULL,
  `barcode` varchar(255) DEFAULT NULL,
  `cost_price` decimal(18,2) DEFAULT 0.00,
  `selling_price` decimal(18,2) DEFAULT 0.00,
  `weight` decimal(18,4) DEFAULT NULL,
  `length` decimal(18,4) DEFAULT NULL,
  `width` decimal(18,4) DEFAULT NULL,
  `height` decimal(18,4) DEFAULT NULL,
  `status_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `website_active` tinyint(1) DEFAULT 1,
  `is_deleted` tinyint(1) DEFAULT 0,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_variants`
--

INSERT INTO `product_variants` (`id`, `product_id`, `variant_name`, `sku`, `barcode`, `cost_price`, `selling_price`, `weight`, `length`, `width`, `height`, `status_id`, `is_active`, `website_active`, `is_deleted`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Default', 'NE-LPT-PRO-01-DEF', NULL, 180000.00, 250000.00, NULL, NULL, NULL, NULL, 29, 1, 1, 0, NULL, '2026-06-12 23:52:34', '2026-06-12 23:52:34');

-- --------------------------------------------------------

--
-- Table structure for table `product_variant_attribute_values`
--

CREATE TABLE `product_variant_attribute_values` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `variant_id` bigint(20) UNSIGNED NOT NULL,
  `attribute_value_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_variant_attribute_values`
--

INSERT INTO `product_variant_attribute_values` (`id`, `variant_id`, `attribute_value_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `promotions`
--

CREATE TABLE `promotions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `promotion_name` varchar(255) DEFAULT NULL,
  `promotion_type` enum('percentage','fixed') DEFAULT NULL,
  `discount_value` decimal(18,2) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `status_id` bigint(20) UNSIGNED DEFAULT NULL,
  `website_active` tinyint(1) DEFAULT 1,
  `is_deleted` tinyint(1) DEFAULT 0,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `promotions`
--

INSERT INTO `promotions` (`id`, `promotion_name`, `promotion_type`, `discount_value`, `start_date`, `end_date`, `is_active`, `status_id`, `website_active`, `is_deleted`, `deleted_at`) VALUES
(1, 'Summer Hardware Sale', 'fixed', 5000.00, NULL, NULL, 1, 1, 1, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `promotion_products`
--

CREATE TABLE `promotion_products` (
  `promotion_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `promotion_products`
--

INSERT INTO `promotion_products` (`promotion_id`, `product_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `promotion_services`
--

CREATE TABLE `promotion_services` (
  `promotion_id` bigint(20) UNSIGNED NOT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotations`
--

CREATE TABLE `quotations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quotation_no` varchar(100) DEFAULT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sales_rep_id` bigint(20) UNSIGNED DEFAULT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status_id` bigint(20) UNSIGNED DEFAULT NULL,
  `valid_until` date DEFAULT NULL,
  `subtotal` decimal(18,2) DEFAULT 0.00,
  `discount_amount` decimal(18,2) DEFAULT 0.00,
  `tax_amount` decimal(18,2) DEFAULT 0.00,
  `grand_total` decimal(18,2) DEFAULT 0.00,
  `converted_to_order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `converted_at` datetime DEFAULT NULL,
  `internal_remarks` longtext DEFAULT NULL,
  `customer_remarks` longtext DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quotations`
--

INSERT INTO `quotations` (`id`, `quotation_no`, `customer_id`, `sales_rep_id`, `branch_id`, `status_id`, `valid_until`, `subtotal`, `discount_amount`, `tax_amount`, `grand_total`, `converted_to_order_id`, `converted_at`, `internal_remarks`, `customer_remarks`, `created_at`) VALUES
(1, 'QTN-2606-1001', 1, 1, 1, 12, NULL, 85000.00, 0.00, 15300.00, 100300.00, NULL, NULL, NULL, NULL, '2026-06-13 00:12:36');

-- --------------------------------------------------------

--
-- Table structure for table `quotation_items`
--

CREATE TABLE `quotation_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quotation_id` bigint(20) UNSIGNED NOT NULL,
  `item_type` enum('product','service','service_package') DEFAULT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` decimal(18,4) DEFAULT NULL,
  `unit_price` decimal(18,2) DEFAULT NULL,
  `line_total` decimal(18,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quotation_items`
--

INSERT INTO `quotation_items` (`id`, `quotation_id`, `item_type`, `item_id`, `quantity`, `unit_price`, `line_total`) VALUES
(1, 1, 'service_package', 1, 1.0000, 85000.00, 85000.00);

-- --------------------------------------------------------

--
-- Table structure for table `quotation_remarks`
--

CREATE TABLE `quotation_remarks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quotation_id` bigint(20) UNSIGNED NOT NULL,
  `remark_type` enum('internal','customer','system') DEFAULT 'internal',
  `remark_text` longtext NOT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `review_replies`
--

CREATE TABLE `review_replies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `review_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `reply_text` longtext DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_name` varchar(150) NOT NULL,
  `role_code` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_system_role` tinyint(1) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role_name`, `role_code`, `description`, `is_system_role`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'SUPER_ADMIN', 'Full system access', 1, 1, '2026-06-12 23:48:47', '2026-06-12 23:48:47'),
(2, 'Admin', 'ADMIN', 'Administrative access', 1, 1, '2026-06-12 23:48:47', '2026-06-12 23:48:47'),
(3, 'Sales Executive', 'SALES_EXECUTIVE', 'Sales operations', 0, 1, '2026-06-12 23:48:47', '2026-06-12 23:48:47'),
(4, 'Inventory Manager', 'INVENTORY_MANAGER', 'Inventory operations', 0, 1, '2026-06-12 23:48:47', '2026-06-12 23:48:47'),
(5, 'Customer', 'CUSTOMER', 'Website customer', 0, 1, '2026-06-12 23:48:47', '2026-06-12 23:48:47');

-- --------------------------------------------------------

--
-- Table structure for table `role_permissions`
--

CREATE TABLE `role_permissions` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `permission_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role_permissions`
--

INSERT INTO `role_permissions` (`role_id`, `permission_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8);

-- --------------------------------------------------------

--
-- Table structure for table `sales_representatives`
--

CREATE TABLE `sales_representatives` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `staff_id` bigint(20) UNSIGNED DEFAULT NULL,
  `rep_code` varchar(100) DEFAULT NULL,
  `commission_type` enum('fixed','percentage') DEFAULT 'percentage',
  `commission_value` decimal(18,2) DEFAULT 0.00,
  `status_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales_representatives`
--

INSERT INTO `sales_representatives` (`id`, `staff_id`, `rep_code`, `commission_type`, `commission_value`, `status_id`, `is_active`, `created_at`) VALUES
(1, 1, 'REP-001', 'percentage', 5.00, 50, 1, '2026-06-13 00:12:36');

-- --------------------------------------------------------

--
-- Table structure for table `seo_meta`
--

CREATE TABLE `seo_meta` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `module_name` varchar(100) DEFAULT NULL,
  `record_id` bigint(20) UNSIGNED DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `canonical_url` varchar(500) DEFAULT NULL,
  `og_title` varchar(255) DEFAULT NULL,
  `og_description` text DEFAULT NULL,
  `og_image_media_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `service_name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `short_description` text DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `estimated_delivery_days` int(11) DEFAULT NULL,
  `status_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `website_active` tinyint(1) DEFAULT 1,
  `featured` tinyint(1) DEFAULT 0,
  `is_deleted` tinyint(1) DEFAULT 0,
  `deleted_at` datetime DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `service_name`, `slug`, `short_description`, `description`, `estimated_delivery_days`, `status_id`, `is_active`, `website_active`, `featured`, `is_deleted`, `deleted_at`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'E-Commerce Website Setup', 'ecommerce-website-setup', 'Full-stack e-commerce deployment.', NULL, 14, 33, 1, 1, 0, 0, NULL, 1, NULL, '2026-06-12 23:52:35', '2026-06-12 23:52:35');

-- --------------------------------------------------------

--
-- Table structure for table `service_categories`
--

CREATE TABLE `service_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `status_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `website_active` tinyint(1) DEFAULT 1,
  `featured` tinyint(1) DEFAULT 0,
  `is_deleted` tinyint(1) DEFAULT 0,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service_categories`
--

INSERT INTO `service_categories` (`id`, `parent_id`, `category_name`, `slug`, `description`, `status_id`, `is_active`, `website_active`, `featured`, `is_deleted`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Software Development', 'software-development', NULL, 1, 1, 1, 0, 0, NULL, '2026-06-12 23:52:34', '2026-06-12 23:52:34');

-- --------------------------------------------------------

--
-- Table structure for table `service_category_relations`
--

CREATE TABLE `service_category_relations` (
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service_contents`
--

CREATE TABLE `service_contents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `content_type` enum('text','image','video','html') DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `display_order` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service_faqs`
--

CREATE TABLE `service_faqs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `question` varchar(500) DEFAULT NULL,
  `answer` longtext DEFAULT NULL,
  `display_order` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service_faqs`
--

INSERT INTO `service_faqs` (`id`, `service_id`, `question`, `answer`, `display_order`) VALUES
(1, 1, 'Do you provide hosting services?', 'Yes, the first year of cloud hosting is included in all packages.', 0);

-- --------------------------------------------------------

--
-- Table structure for table `service_packages`
--

CREATE TABLE `service_packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `package_name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `short_description` text DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `cost_price` decimal(18,2) DEFAULT 0.00,
  `selling_price` decimal(18,2) DEFAULT 0.00,
  `estimated_delivery_days` int(11) DEFAULT NULL,
  `status_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `website_active` tinyint(1) DEFAULT 1,
  `featured` tinyint(1) DEFAULT 0,
  `is_deleted` tinyint(1) DEFAULT 0,
  `display_order` int(11) DEFAULT 0,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service_packages`
--

INSERT INTO `service_packages` (`id`, `service_id`, `package_name`, `slug`, `short_description`, `description`, `cost_price`, `selling_price`, `estimated_delivery_days`, `status_id`, `is_active`, `website_active`, `featured`, `is_deleted`, `display_order`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Standard Startup Package', 'standard-startup-package', NULL, NULL, 30000.00, 85000.00, 14, 33, 1, 1, 0, 0, 0, NULL, '2026-06-12 23:52:35', '2026-06-12 23:52:35');

-- --------------------------------------------------------

--
-- Table structure for table `service_reviews`
--

CREATE TABLE `service_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `rating` decimal(3,2) DEFAULT 0.00,
  `review_text` longtext DEFAULT NULL,
  `is_approved` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `employee_no` varchar(100) DEFAULT NULL,
  `first_name` varchar(150) DEFAULT NULL,
  `last_name` varchar(150) DEFAULT NULL,
  `nic` varchar(50) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` enum('male','female','other') DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `joining_date` date DEFAULT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `designation` varchar(150) DEFAULT NULL,
  `department` varchar(150) DEFAULT NULL,
  `basic_salary` decimal(18,2) DEFAULT 0.00,
  `status_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `user_id`, `employee_no`, `first_name`, `last_name`, `nic`, `dob`, `gender`, `email`, `mobile`, `joining_date`, `branch_id`, `designation`, `department`, `basic_salary`, `status_id`) VALUES
(1, 1, 'EMP001', 'System', 'Administrator', NULL, NULL, NULL, 'Admin@next-edge.lk', '+94770206960', '2026-06-12', 1, 'CEO', 'Management', 0.00, 50);

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

CREATE TABLE `statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status_code` varchar(150) DEFAULT NULL,
  `module_name` varchar(150) DEFAULT NULL,
  `status_name` varchar(150) DEFAULT NULL,
  `status_color` varchar(50) DEFAULT NULL,
  `sort_order` int(11) DEFAULT 0,
  `is_default` tinyint(1) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `statuses`
--

INSERT INTO `statuses` (`id`, `status_code`, `module_name`, `status_name`, `status_color`, `sort_order`, `is_default`, `is_active`) VALUES
(1, 'ACTIVE', 'common', 'Active', '#28a745', 1, 1, 1),
(2, 'INACTIVE', 'common', 'Inactive', '#dc3545', 2, 0, 1),
(3, 'PENDING', 'orders', 'Pending', '#ffc107', 1, 1, 1),
(4, 'CONFIRMED', 'orders', 'Confirmed', '#17a2b8', 2, 0, 1),
(5, 'PROCESSING', 'orders', 'Processing', '#007bff', 3, 0, 1),
(6, 'PACKED', 'orders', 'Packed', '#6f42c1', 4, 0, 1),
(7, 'DISPATCHED', 'orders', 'Dispatched', '#6610f2', 5, 0, 1),
(8, 'DELIVERED', 'orders', 'Delivered', '#28a745', 6, 0, 1),
(9, 'CANCELLED', 'orders', 'Cancelled', '#dc3545', 7, 0, 1),
(10, 'RETURNED', 'orders', 'Returned', '#fd7e14', 8, 0, 1),
(11, 'DRAFT', 'quotations', 'Draft', '#6c757d', 1, 1, 1),
(12, 'SENT', 'quotations', 'Sent', '#17a2b8', 2, 0, 1),
(13, 'VIEWED', 'quotations', 'Viewed', '#007bff', 3, 0, 1),
(14, 'ACCEPTED', 'quotations', 'Accepted', '#28a745', 4, 0, 1),
(15, 'REJECTED', 'quotations', 'Rejected', '#dc3545', 5, 0, 1),
(16, 'EXPIRED', 'quotations', 'Expired', '#343a40', 6, 0, 1),
(17, 'CONVERTED', 'quotations', 'Converted to Order', '#20c997', 7, 0, 1),
(18, 'PENDING', 'payments', 'Pending', '#ffc107', 1, 1, 1),
(19, 'PAID', 'payments', 'Paid', '#28a745', 2, 0, 1),
(20, 'FAILED', 'payments', 'Failed', '#dc3545', 3, 0, 1),
(21, 'REFUNDED', 'payments', 'Refunded', '#fd7e14', 4, 0, 1),
(22, 'PARTIAL', 'payments', 'Partially Paid', '#17a2b8', 5, 0, 1),
(23, 'DRAFT', 'invoices', 'Draft', '#6c757d', 1, 1, 1),
(24, 'ISSUED', 'invoices', 'Issued', '#007bff', 2, 0, 1),
(25, 'PARTIAL', 'invoices', 'Partially Paid', '#17a2b8', 3, 0, 1),
(26, 'PAID', 'invoices', 'Paid', '#28a745', 4, 0, 1),
(27, 'OVERDUE', 'invoices', 'Overdue', '#dc3545', 5, 0, 1),
(28, 'VOID', 'invoices', 'Void', '#343a40', 6, 0, 1),
(29, 'ACTIVE', 'products', 'Active', '#28a745', 1, 1, 1),
(30, 'INACTIVE', 'products', 'Inactive', '#dc3545', 2, 0, 1),
(31, 'OUT_OF_STOCK', 'products', 'Out Of Stock', '#fd7e14', 3, 0, 1),
(32, 'DISCONTINUED', 'products', 'Discontinued', '#343a40', 4, 0, 1),
(33, 'ACTIVE', 'services', 'Active', '#28a745', 1, 1, 1),
(34, 'INACTIVE', 'services', 'Inactive', '#dc3545', 2, 0, 1),
(35, 'COMING_SOON', 'services', 'Coming Soon', '#17a2b8', 3, 0, 1),
(36, 'ACTIVE', 'customers', 'Active', '#28a745', 1, 1, 1),
(37, 'INACTIVE', 'customers', 'Inactive', '#dc3545', 2, 0, 1),
(38, 'BLOCKED', 'customers', 'Blocked', '#343a40', 3, 0, 1),
(39, 'ACTIVE', 'suppliers', 'Active', '#28a745', 1, 1, 1),
(40, 'INACTIVE', 'suppliers', 'Inactive', '#dc3545', 2, 0, 1),
(41, 'BLACKLISTED', 'suppliers', 'Blacklisted', '#343a40', 3, 0, 1),
(42, 'DRAFT', 'expenses', 'Draft', '#6c757d', 1, 1, 1),
(43, 'APPROVED', 'expenses', 'Approved', '#28a745', 2, 0, 1),
(44, 'REJECTED', 'expenses', 'Rejected', '#dc3545', 3, 0, 1),
(45, 'PAID', 'expenses', 'Paid', '#17a2b8', 4, 0, 1),
(46, 'NEW', 'inquiries', 'New', '#007bff', 1, 1, 1),
(47, 'ASSIGNED', 'inquiries', 'Assigned', '#17a2b8', 2, 0, 1),
(48, 'IN_PROGRESS', 'inquiries', 'In Progress', '#ffc107', 3, 0, 1),
(49, 'CLOSED', 'inquiries', 'Closed', '#28a745', 4, 0, 1),
(50, 'ACTIVE', 'staff', 'Active', '#28a745', 1, 1, 1),
(51, 'INACTIVE', 'staff', 'Inactive', '#dc3545', 2, 0, 1),
(52, 'ON_LEAVE', 'staff', 'On Leave', '#ffc107', 3, 0, 1),
(53, 'TERMINATED', 'staff', 'Terminated', '#343a40', 4, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stock_movements`
--

CREATE TABLE `stock_movements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_variant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `movement_type` enum('purchase','sale','return','adjustment','transfer') DEFAULT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `qty_before` decimal(18,4) DEFAULT NULL,
  `qty_change` decimal(18,4) DEFAULT NULL,
  `qty_after` decimal(18,4) DEFAULT NULL,
  `reference_type` varchar(100) DEFAULT NULL,
  `reference_no` varchar(100) DEFAULT NULL,
  `reference_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `supplier_code` varchar(100) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `contact_person` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `payment_terms` varchar(255) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `tax_no` varchar(100) DEFAULT NULL,
  `credit_days` int(11) DEFAULT 0,
  `status_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `supplier_code`, `company_name`, `contact_person`, `email`, `payment_terms`, `mobile`, `tax_no`, `credit_days`, `status_id`) VALUES
(1, 'SUP-0001', 'Global IT Distributors', 'Jane Smith', 'jane.s@globalit.com', 'Net 30', '+94711234567', NULL, 30, 39);

-- --------------------------------------------------------

--
-- Table structure for table `supplier_bank_accounts`
--

CREATE TABLE `supplier_bank_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `supplier_id` bigint(20) UNSIGNED NOT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `account_name` varchar(255) DEFAULT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `branch_name` varchar(255) DEFAULT NULL,
  `swift_code` varchar(100) DEFAULT NULL,
  `is_primary` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `setting_group` varchar(100) DEFAULT NULL,
  `setting_key` varchar(255) DEFAULT NULL,
  `setting_value` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `setting_group`, `setting_key`, `setting_value`) VALUES
(1, 'general', 'company_name', 'Next Edge Technologies'),
(2, 'general', 'base_currency', 'LKR'),
(3, 'email', 'smtp_host', 'smtp.next-edge.lk'),
(4, 'ecommerce', 'allow_guest_checkout', 'true');

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tax_name` varchar(100) NOT NULL,
  `tax_code` varchar(100) DEFAULT NULL,
  `tax_percentage` decimal(10,4) NOT NULL,
  `tax_type` enum('inclusive','exclusive') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `taxes`
--

INSERT INTO `taxes` (`id`, `tax_name`, `tax_code`, `tax_percentage`, `tax_type`) VALUES
(1, 'VAT 18%', 'VAT18', 18.0000, 'exclusive'),
(2, 'No Tax', 'NONE', 0.0000, 'exclusive');

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `testimonial_text` longtext DEFAULT NULL,
  `rating` decimal(2,1) DEFAULT NULL,
  `status_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `website_active` tinyint(1) DEFAULT 1,
  `featured` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `customer_name`, `customer_id`, `company_name`, `designation`, `testimonial_text`, `rating`, `status_id`, `is_active`, `website_active`, `featured`, `created_at`) VALUES
(1, 'John Doe', 1, 'Acme Corporation', NULL, 'NextEdge delivered our new e-commerce platform ahead of schedule. Exceptional service!', 5.0, 1, 1, 1, 0, '2026-06-13 00:12:36');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `password_hash` varchar(255) DEFAULT NULL,
  `login_type` enum('staff','customer','supplier','system') NOT NULL,
  `email_verified` tinyint(1) DEFAULT 0,
  `failed_login_attempts` int(11) DEFAULT 0,
  `locked_until` datetime DEFAULT NULL,
  `mobile_verified` tinyint(1) DEFAULT 0,
  `last_login` datetime DEFAULT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `status_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `is_deleted` tinyint(1) DEFAULT 0,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `mobile`, `password_hash`, `login_type`, `email_verified`, `failed_login_attempts`, `locked_until`, `mobile_verified`, `last_login`, `remember_token`, `status_id`, `is_active`, `is_deleted`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'superadmin', 'Admin@next-edge.lk', '+94770206960', '63afea2fba5359682f704b79640cb803', 'system', 1, 0, NULL, 1, NULL, NULL, 1, 1, 0, NULL, '2026-06-12 23:48:47', '2026-06-12 23:48:47');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`user_id`, `role_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `warehouses`
--

CREATE TABLE `warehouses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `warehouse_code` varchar(100) DEFAULT NULL,
  `warehouse_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `warehouses`
--

INSERT INTO `warehouses` (`id`, `branch_id`, `warehouse_code`, `warehouse_name`) VALUES
(1, 1, 'WH-MAIN', 'Main Distribution Center');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `customer_id`, `created_at`) VALUES
(1, 1, '2026-06-13 00:12:38');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist_items`
--

CREATE TABLE `wishlist_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `wishlist_id` bigint(20) UNSIGNED NOT NULL,
  `item_type` enum('product','service','service_package') NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wishlist_items`
--

INSERT INTO `wishlist_items` (`id`, `wishlist_id`, `item_type`, `item_id`, `created_at`) VALUES
(1, 1, 'service_package', 1, '2026-06-13 00:12:38');

-- --------------------------------------------------------

--
-- Table structure for table `workflow_automations`
--

CREATE TABLE `workflow_automations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `workflow_name` varchar(255) DEFAULT NULL,
  `trigger_module` varchar(100) DEFAULT NULL,
  `trigger_event` varchar(100) DEFAULT NULL,
  `action_type` varchar(100) DEFAULT NULL,
  `action_configuration` longtext DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `workflow_execution_logs`
--

CREATE TABLE `workflow_execution_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `workflow_id` bigint(20) UNSIGNED NOT NULL,
  `reference_type` varchar(100) DEFAULT NULL,
  `reference_id` bigint(20) UNSIGNED DEFAULT NULL,
  `execution_status` enum('success','failed') DEFAULT NULL,
  `response_message` longtext DEFAULT NULL,
  `executed_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_types`
--
ALTER TABLE `account_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `type_code` (`type_code`);

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `branch_id` (`branch_id`),
  ADD KEY `idx_module` (`module_name`),
  ADD KEY `idx_record` (`record_id`);

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `address_relations`
--
ALTER TABLE `address_relations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `address_id` (`address_id`),
  ADD KEY `idx_module_record` (`module_name`,`record_id`);

--
-- Indexes for table `api_logs`
--
ALTER TABLE `api_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `changed_by` (`changed_by`);

--
-- Indexes for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chart_account_id` (`chart_account_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `author_id` (`author_id`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `blog_category_relations`
--
ALTER TABLE `blog_category_relations`
  ADD PRIMARY KEY (`blog_id`,`category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `blog_contents`
--
ALTER TABLE `blog_contents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_id` (`blog_id`);

--
-- Indexes for table `blog_views`
--
ALTER TABLE `blog_views`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_id` (`blog_id`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `branch_code` (`branch_code`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `status_id` (`status_id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_id` (`cart_id`),
  ADD KEY `product_variant_id` (`product_variant_id`),
  ADD KEY `service_id` (`service_id`),
  ADD KEY `service_package_id` (`service_package_id`);

--
-- Indexes for table `chart_of_accounts`
--
ALTER TABLE `chart_of_accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account_code` (`account_code`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `account_type_id` (`account_type_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupon_code` (`coupon_code`);

--
-- Indexes for table `coupon_usage`
--
ALTER TABLE `coupon_usage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coupon_id` (`coupon_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customer_code` (`customer_code`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `idx_customer_code` (`customer_code`);

--
-- Indexes for table `email_logs`
--
ALTER TABLE `email_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `expense_no` (`expense_no`),
  ADD KEY `branch_id` (`branch_id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `expense_items`
--
ALTER TABLE `expense_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expense_id` (`expense_id`),
  ADD KEY `account_id` (`account_id`);

--
-- Indexes for table `general_ledger`
--
ALTER TABLE `general_ledger`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `journal_entry_id` (`journal_entry_id`);

--
-- Indexes for table `income_records`
--
ALTER TABLE `income_records`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `income_no` (`income_no`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `inquiry_email_recipients`
--
ALTER TABLE `inquiry_email_recipients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `form_id` (`form_id`);

--
-- Indexes for table `inquiry_email_templates`
--
ALTER TABLE `inquiry_email_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `form_id` (`form_id`);

--
-- Indexes for table `inquiry_followups`
--
ALTER TABLE `inquiry_followups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `submission_id` (`submission_id`),
  ADD KEY `assigned_to` (`assigned_to`);

--
-- Indexes for table `inquiry_forms`
--
ALTER TABLE `inquiry_forms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `form_code` (`form_code`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `inquiry_form_fields`
--
ALTER TABLE `inquiry_form_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `form_id` (`form_id`);

--
-- Indexes for table `inquiry_form_field_options`
--
ALTER TABLE `inquiry_form_field_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `field_id` (`field_id`);

--
-- Indexes for table `inquiry_submissions`
--
ALTER TABLE `inquiry_submissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `form_id` (`form_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indexes for table `inquiry_submission_files`
--
ALTER TABLE `inquiry_submission_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `submission_id` (`submission_id`),
  ADD KEY `field_id` (`field_id`),
  ADD KEY `media_id` (`media_id`);

--
-- Indexes for table `inquiry_submission_values`
--
ALTER TABLE `inquiry_submission_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `submission_id` (`submission_id`),
  ADD KEY `field_id` (`field_id`);

--
-- Indexes for table `inventory_stock`
--
ALTER TABLE `inventory_stock`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `warehouse_id` (`warehouse_id`,`product_variant_id`),
  ADD KEY `product_variant_id` (`product_variant_id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `invoice_no` (`invoice_no`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indexes for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_id` (`invoice_id`),
  ADD KEY `product_variant_id` (`product_variant_id`),
  ADD KEY `service_id` (`service_id`),
  ADD KEY `service_package_id` (`service_package_id`);

--
-- Indexes for table `journal_entries`
--
ALTER TABLE `journal_entries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `journal_no` (`journal_no`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `journal_entry_lines`
--
ALTER TABLE `journal_entry_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `journal_entry_id` (`journal_entry_id`),
  ADD KEY `account_id` (`account_id`);

--
-- Indexes for table `media_folders`
--
ALTER TABLE `media_folders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `media_library`
--
ALTER TABLE `media_library`
  ADD PRIMARY KEY (`id`),
  ADD KEY `folder_id` (`folder_id`),
  ADD KEY `uploaded_by` (`uploaded_by`),
  ADD KEY `idx_file_name` (`file_name`),
  ADD KEY `idx_mime_type` (`mime_type`),
  ADD KEY `idx_storage_type` (`storage_type`);

--
-- Indexes for table `media_relations`
--
ALTER TABLE `media_relations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_id` (`media_id`),
  ADD KEY `idx_module_record` (`module_name`,`record_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_no` (`order_no`),
  ADD KEY `quotation_id` (`quotation_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `sales_rep_id` (`sales_rep_id`),
  ADD KEY `branch_id` (`branch_id`),
  ADD KEY `currency_id` (`currency_id`),
  ADD KEY `billing_address_id` (`billing_address_id`),
  ADD KEY `shipping_address_id` (`shipping_address_id`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `order_history`
--
ALTER TABLE `order_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `changed_by` (`changed_by`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_variant_id` (`product_variant_id`),
  ADD KEY `service_id` (`service_id`),
  ADD KEY `service_package_id` (`service_package_id`);

--
-- Indexes for table `order_notes`
--
ALTER TABLE `order_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `order_tracking`
--
ALTER TABLE `order_tracking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `package_features`
--
ALTER TABLE `package_features`
  ADD PRIMARY KEY (`id`),
  ADD KEY `package_id` (`package_id`);

--
-- Indexes for table `package_feature_groups`
--
ALTER TABLE `package_feature_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `package_id` (`package_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payment_no` (`payment_no`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `payment_method_id` (`payment_method_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `payment_allocations`
--
ALTER TABLE `payment_allocations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_id` (`payment_id`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permission_code` (`permission_code`);

--
-- Indexes for table `portfolios`
--
ALTER TABLE `portfolios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `portfolio_categories`
--
ALTER TABLE `portfolio_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indexes for table `portfolio_category_relations`
--
ALTER TABLE `portfolio_category_relations`
  ADD PRIMARY KEY (`portfolio_id`,`category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `portfolio_contents`
--
ALTER TABLE `portfolio_contents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `portfolio_id` (`portfolio_id`);

--
-- Indexes for table `portfolio_views`
--
ALTER TABLE `portfolio_views`
  ADD PRIMARY KEY (`id`),
  ADD KEY `portfolio_id` (`portfolio_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD UNIQUE KEY `sku` (`sku`),
  ADD UNIQUE KEY `barcode` (`barcode`),
  ADD KEY `brand_id` (`brand_id`),
  ADD KEY `tax_id` (`tax_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `idx_product_name` (`product_name`),
  ADD KEY `idx_barcode` (`barcode`),
  ADD KEY `idx_sku` (`sku`),
  ADD KEY `idx_featured` (`featured`),
  ADD KEY `idx_slug` (`slug`),
  ADD KEY `idx_status` (`status_id`),
  ADD KEY `idx_active` (`is_active`),
  ADD KEY `idx_website` (`website_active`);

--
-- Indexes for table `product_attributes`
--
ALTER TABLE `product_attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product_attribute_values`
--
ALTER TABLE `product_attribute_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attribute_id` (`attribute_id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indexes for table `product_category_relations`
--
ALTER TABLE `product_category_relations`
  ADD PRIMARY KEY (`product_id`,`category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sku` (`sku`),
  ADD UNIQUE KEY `barcode` (`barcode`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `idx_product` (`product_id`),
  ADD KEY `idx_sku` (`sku`),
  ADD KEY `idx_barcode` (`barcode`);

--
-- Indexes for table `product_variant_attribute_values`
--
ALTER TABLE `product_variant_attribute_values`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `variant_id` (`variant_id`,`attribute_value_id`),
  ADD KEY `attribute_value_id` (`attribute_value_id`);

--
-- Indexes for table `promotions`
--
ALTER TABLE `promotions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indexes for table `promotion_products`
--
ALTER TABLE `promotion_products`
  ADD PRIMARY KEY (`promotion_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `promotion_services`
--
ALTER TABLE `promotion_services`
  ADD PRIMARY KEY (`promotion_id`,`service_id`),
  ADD KEY `service_id` (`service_id`);

--
-- Indexes for table `quotations`
--
ALTER TABLE `quotations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `quotation_no` (`quotation_no`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `sales_rep_id` (`sales_rep_id`),
  ADD KEY `branch_id` (`branch_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indexes for table `quotation_items`
--
ALTER TABLE `quotation_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quotation_id` (`quotation_id`);

--
-- Indexes for table `quotation_remarks`
--
ALTER TABLE `quotation_remarks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quotation_id` (`quotation_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `review_replies`
--
ALTER TABLE `review_replies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `review_id` (`review_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `role_code` (`role_code`);

--
-- Indexes for table `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD PRIMARY KEY (`role_id`,`permission_id`),
  ADD KEY `permission_id` (`permission_id`);

--
-- Indexes for table `sales_representatives`
--
ALTER TABLE `sales_representatives`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rep_code` (`rep_code`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indexes for table `seo_meta`
--
ALTER TABLE `seo_meta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `og_image_media_id` (`og_image_media_id`),
  ADD KEY `idx_module_record` (`module_name`,`record_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `service_categories`
--
ALTER TABLE `service_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indexes for table `service_category_relations`
--
ALTER TABLE `service_category_relations`
  ADD PRIMARY KEY (`service_id`,`category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `service_contents`
--
ALTER TABLE `service_contents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_id` (`service_id`);

--
-- Indexes for table `service_faqs`
--
ALTER TABLE `service_faqs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_id` (`service_id`);

--
-- Indexes for table `service_packages`
--
ALTER TABLE `service_packages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `service_id` (`service_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indexes for table `service_reviews`
--
ALTER TABLE `service_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_id` (`service_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employee_no` (`employee_no`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `branch_id` (`branch_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indexes for table `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_movements`
--
ALTER TABLE `stock_movements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `branch_id` (`branch_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `product_variant_id` (`product_variant_id`),
  ADD KEY `warehouse_id` (`warehouse_id`),
  ADD KEY `idx_ref` (`reference_type`,`reference_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `supplier_code` (`supplier_code`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `idx_supplier_code` (`supplier_code`);

--
-- Indexes for table `supplier_bank_accounts`
--
ALTER TABLE `supplier_bank_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `setting_group` (`setting_group`,`setting_key`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `mobile` (`mobile`),
  ADD KEY `idx_email` (`email`),
  ADD KEY `idx_mobile` (`mobile`),
  ADD KEY `status_id` (`status_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `warehouses`
--
ALTER TABLE `warehouses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `wishlist_items`
--
ALTER TABLE `wishlist_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wishlist_id` (`wishlist_id`,`item_type`,`item_id`);

--
-- Indexes for table `workflow_automations`
--
ALTER TABLE `workflow_automations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `workflow_execution_logs`
--
ALTER TABLE `workflow_execution_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `workflow_id` (`workflow_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_types`
--
ALTER TABLE `account_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `address_relations`
--
ALTER TABLE `address_relations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `api_logs`
--
ALTER TABLE `api_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `audit_logs`
--
ALTER TABLE `audit_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `blog_contents`
--
ALTER TABLE `blog_contents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `blog_views`
--
ALTER TABLE `blog_views`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `chart_of_accounts`
--
ALTER TABLE `chart_of_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `coupon_usage`
--
ALTER TABLE `coupon_usage`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT for table `currency`
--
ALTER TABLE `currency`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `email_logs`
--
ALTER TABLE `email_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `expense_items`
--
ALTER TABLE `expense_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `general_ledger`
--
ALTER TABLE `general_ledger`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `income_records`
--
ALTER TABLE `income_records`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inquiry_email_recipients`
--
ALTER TABLE `inquiry_email_recipients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inquiry_email_templates`
--
ALTER TABLE `inquiry_email_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inquiry_followups`
--
ALTER TABLE `inquiry_followups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inquiry_forms`
--
ALTER TABLE `inquiry_forms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `inquiry_form_fields`
--
ALTER TABLE `inquiry_form_fields`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `inquiry_form_field_options`
--
ALTER TABLE `inquiry_form_field_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inquiry_submissions`
--
ALTER TABLE `inquiry_submissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `inquiry_submission_files`
--
ALTER TABLE `inquiry_submission_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inquiry_submission_values`
--
ALTER TABLE `inquiry_submission_values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `inventory_stock`
--
ALTER TABLE `inventory_stock`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `invoice_items`
--
ALTER TABLE `invoice_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `journal_entries`
--
ALTER TABLE `journal_entries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `journal_entry_lines`
--
ALTER TABLE `journal_entry_lines`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `media_folders`
--
ALTER TABLE `media_folders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `media_library`
--
ALTER TABLE `media_library`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `media_relations`
--
ALTER TABLE `media_relations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `order_history`
--
ALTER TABLE `order_history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `order_notes`
--
ALTER TABLE `order_notes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_tracking`
--
ALTER TABLE `order_tracking`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `package_features`
--
ALTER TABLE `package_features`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `package_feature_groups`
--
ALTER TABLE `package_feature_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payment_allocations`
--
ALTER TABLE `payment_allocations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `portfolios`
--
ALTER TABLE `portfolios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `portfolio_categories`
--
ALTER TABLE `portfolio_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `portfolio_contents`
--
ALTER TABLE `portfolio_contents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `portfolio_views`
--
ALTER TABLE `portfolio_views`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_attributes`
--
ALTER TABLE `product_attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_attribute_values`
--
ALTER TABLE `product_attribute_values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_variant_attribute_values`
--
ALTER TABLE `product_variant_attribute_values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `promotions`
--
ALTER TABLE `promotions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `quotations`
--
ALTER TABLE `quotations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `quotation_items`
--
ALTER TABLE `quotation_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `quotation_remarks`
--
ALTER TABLE `quotation_remarks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `review_replies`
--
ALTER TABLE `review_replies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sales_representatives`
--
ALTER TABLE `sales_representatives`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `seo_meta`
--
ALTER TABLE `seo_meta`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `service_categories`
--
ALTER TABLE `service_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `service_contents`
--
ALTER TABLE `service_contents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service_faqs`
--
ALTER TABLE `service_faqs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `service_packages`
--
ALTER TABLE `service_packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `service_reviews`
--
ALTER TABLE `service_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `statuses`
--
ALTER TABLE `statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `stock_movements`
--
ALTER TABLE `stock_movements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `supplier_bank_accounts`
--
ALTER TABLE `supplier_bank_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `warehouses`
--
ALTER TABLE `warehouses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wishlist_items`
--
ALTER TABLE `wishlist_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `workflow_automations`
--
ALTER TABLE `workflow_automations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `workflow_execution_logs`
--
ALTER TABLE `workflow_execution_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD CONSTRAINT `activity_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `activity_logs_ibfk_2` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`);

--
-- Constraints for table `address_relations`
--
ALTER TABLE `address_relations`
  ADD CONSTRAINT `address_relations_ibfk_1` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`id`);

--
-- Constraints for table `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD CONSTRAINT `audit_logs_ibfk_1` FOREIGN KEY (`changed_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  ADD CONSTRAINT `bank_accounts_ibfk_1` FOREIGN KEY (`chart_account_id`) REFERENCES `chart_of_accounts` (`id`),
  ADD CONSTRAINT `bank_accounts_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`);

--
-- Constraints for table `blogs`
--
ALTER TABLE `blogs`
  ADD CONSTRAINT `blogs_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `blogs_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  ADD CONSTRAINT `blogs_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `blogs_ibfk_4` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD CONSTRAINT `blog_categories_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `blog_categories` (`id`),
  ADD CONSTRAINT `blog_categories_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  ADD CONSTRAINT `blog_categories_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `blog_category_relations`
--
ALTER TABLE `blog_category_relations`
  ADD CONSTRAINT `blog_category_relations_ibfk_1` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `blog_category_relations_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `blog_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `blog_contents`
--
ALTER TABLE `blog_contents`
  ADD CONSTRAINT `blog_contents_ibfk_1` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `blog_views`
--
ALTER TABLE `blog_views`
  ADD CONSTRAINT `blog_views_ibfk_1` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `brands`
--
ALTER TABLE `brands`
  ADD CONSTRAINT `brands_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`);

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_items_ibfk_2` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`id`),
  ADD CONSTRAINT `cart_items_ibfk_3` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`),
  ADD CONSTRAINT `cart_items_ibfk_4` FOREIGN KEY (`service_package_id`) REFERENCES `service_packages` (`id`);

--
-- Constraints for table `chart_of_accounts`
--
ALTER TABLE `chart_of_accounts`
  ADD CONSTRAINT `chart_of_accounts_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `chart_of_accounts` (`id`),
  ADD CONSTRAINT `chart_of_accounts_ibfk_2` FOREIGN KEY (`account_type_id`) REFERENCES `account_types` (`id`),
  ADD CONSTRAINT `chart_of_accounts_ibfk_3` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`);

--
-- Constraints for table `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`);

--
-- Constraints for table `coupon_usage`
--
ALTER TABLE `coupon_usage`
  ADD CONSTRAINT `coupon_usage_ibfk_1` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`),
  ADD CONSTRAINT `coupon_usage_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `coupon_usage_ibfk_3` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `customers_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`);

--
-- Constraints for table `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`),
  ADD CONSTRAINT `expenses_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`),
  ADD CONSTRAINT `expenses_ibfk_3` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  ADD CONSTRAINT `expenses_ibfk_4` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `expense_items`
--
ALTER TABLE `expense_items`
  ADD CONSTRAINT `expense_items_ibfk_1` FOREIGN KEY (`expense_id`) REFERENCES `expenses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `expense_items_ibfk_2` FOREIGN KEY (`account_id`) REFERENCES `chart_of_accounts` (`id`);

--
-- Constraints for table `general_ledger`
--
ALTER TABLE `general_ledger`
  ADD CONSTRAINT `general_ledger_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `chart_of_accounts` (`id`),
  ADD CONSTRAINT `general_ledger_ibfk_2` FOREIGN KEY (`journal_entry_id`) REFERENCES `journal_entries` (`id`);

--
-- Constraints for table `income_records`
--
ALTER TABLE `income_records`
  ADD CONSTRAINT `income_records_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `chart_of_accounts` (`id`),
  ADD CONSTRAINT `income_records_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  ADD CONSTRAINT `income_records_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `inquiry_email_recipients`
--
ALTER TABLE `inquiry_email_recipients`
  ADD CONSTRAINT `inquiry_email_recipients_ibfk_1` FOREIGN KEY (`form_id`) REFERENCES `inquiry_forms` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `inquiry_email_templates`
--
ALTER TABLE `inquiry_email_templates`
  ADD CONSTRAINT `inquiry_email_templates_ibfk_1` FOREIGN KEY (`form_id`) REFERENCES `inquiry_forms` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `inquiry_followups`
--
ALTER TABLE `inquiry_followups`
  ADD CONSTRAINT `inquiry_followups_ibfk_1` FOREIGN KEY (`submission_id`) REFERENCES `inquiry_submissions` (`id`),
  ADD CONSTRAINT `inquiry_followups_ibfk_2` FOREIGN KEY (`assigned_to`) REFERENCES `users` (`id`);

--
-- Constraints for table `inquiry_forms`
--
ALTER TABLE `inquiry_forms`
  ADD CONSTRAINT `inquiry_forms_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  ADD CONSTRAINT `inquiry_forms_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `inquiry_form_fields`
--
ALTER TABLE `inquiry_form_fields`
  ADD CONSTRAINT `inquiry_form_fields_ibfk_1` FOREIGN KEY (`form_id`) REFERENCES `inquiry_forms` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `inquiry_form_field_options`
--
ALTER TABLE `inquiry_form_field_options`
  ADD CONSTRAINT `inquiry_form_field_options_ibfk_1` FOREIGN KEY (`field_id`) REFERENCES `inquiry_form_fields` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `inquiry_submissions`
--
ALTER TABLE `inquiry_submissions`
  ADD CONSTRAINT `inquiry_submissions_ibfk_1` FOREIGN KEY (`form_id`) REFERENCES `inquiry_forms` (`id`),
  ADD CONSTRAINT `inquiry_submissions_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `inquiry_submissions_ibfk_3` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`);

--
-- Constraints for table `inquiry_submission_files`
--
ALTER TABLE `inquiry_submission_files`
  ADD CONSTRAINT `inquiry_submission_files_ibfk_1` FOREIGN KEY (`submission_id`) REFERENCES `inquiry_submissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `inquiry_submission_files_ibfk_2` FOREIGN KEY (`field_id`) REFERENCES `inquiry_form_fields` (`id`),
  ADD CONSTRAINT `inquiry_submission_files_ibfk_3` FOREIGN KEY (`media_id`) REFERENCES `media_library` (`id`);

--
-- Constraints for table `inquiry_submission_values`
--
ALTER TABLE `inquiry_submission_values`
  ADD CONSTRAINT `inquiry_submission_values_ibfk_1` FOREIGN KEY (`submission_id`) REFERENCES `inquiry_submissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `inquiry_submission_values_ibfk_2` FOREIGN KEY (`field_id`) REFERENCES `inquiry_form_fields` (`id`);

--
-- Constraints for table `inventory_stock`
--
ALTER TABLE `inventory_stock`
  ADD CONSTRAINT `inventory_stock_ibfk_1` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`),
  ADD CONSTRAINT `inventory_stock_ibfk_2` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`id`);

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `invoices_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `invoices_ibfk_3` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`);

--
-- Constraints for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD CONSTRAINT `invoice_items_ibfk_1` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `invoice_items_ibfk_2` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `invoice_items_ibfk_3` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `invoice_items_ibfk_4` FOREIGN KEY (`service_package_id`) REFERENCES `service_packages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `journal_entries`
--
ALTER TABLE `journal_entries`
  ADD CONSTRAINT `journal_entries_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `journal_entry_lines`
--
ALTER TABLE `journal_entry_lines`
  ADD CONSTRAINT `journal_entry_lines_ibfk_1` FOREIGN KEY (`journal_entry_id`) REFERENCES `journal_entries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `journal_entry_lines_ibfk_2` FOREIGN KEY (`account_id`) REFERENCES `chart_of_accounts` (`id`);

--
-- Constraints for table `media_folders`
--
ALTER TABLE `media_folders`
  ADD CONSTRAINT `media_folders_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `media_folders` (`id`),
  ADD CONSTRAINT `media_folders_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `media_library`
--
ALTER TABLE `media_library`
  ADD CONSTRAINT `media_library_ibfk_1` FOREIGN KEY (`folder_id`) REFERENCES `media_folders` (`id`),
  ADD CONSTRAINT `media_library_ibfk_2` FOREIGN KEY (`uploaded_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `media_relations`
--
ALTER TABLE `media_relations`
  ADD CONSTRAINT `media_relations_ibfk_1` FOREIGN KEY (`media_id`) REFERENCES `media_library` (`id`);

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`quotation_id`) REFERENCES `quotations` (`id`),
  ADD CONSTRAINT `orders_ibfk_10` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`sales_rep_id`) REFERENCES `sales_representatives` (`id`),
  ADD CONSTRAINT `orders_ibfk_4` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`),
  ADD CONSTRAINT `orders_ibfk_5` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `orders_ibfk_6` FOREIGN KEY (`billing_address_id`) REFERENCES `addresses` (`id`),
  ADD CONSTRAINT `orders_ibfk_7` FOREIGN KEY (`shipping_address_id`) REFERENCES `addresses` (`id`),
  ADD CONSTRAINT `orders_ibfk_8` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  ADD CONSTRAINT `orders_ibfk_9` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_history`
--
ALTER TABLE `order_history`
  ADD CONSTRAINT `order_history_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_history_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  ADD CONSTRAINT `order_history_ibfk_3` FOREIGN KEY (`changed_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_3` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_4` FOREIGN KEY (`service_package_id`) REFERENCES `service_packages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_notes`
--
ALTER TABLE `order_notes`
  ADD CONSTRAINT `order_notes_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_notes_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_tracking`
--
ALTER TABLE `order_tracking`
  ADD CONSTRAINT `order_tracking_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `package_features`
--
ALTER TABLE `package_features`
  ADD CONSTRAINT `package_features_ibfk_1` FOREIGN KEY (`package_id`) REFERENCES `service_packages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `package_feature_groups`
--
ALTER TABLE `package_feature_groups`
  ADD CONSTRAINT `package_feature_groups_ibfk_1` FOREIGN KEY (`package_id`) REFERENCES `service_packages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  ADD CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `payments_ibfk_3` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`),
  ADD CONSTRAINT `payments_ibfk_4` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `payment_allocations`
--
ALTER TABLE `payment_allocations`
  ADD CONSTRAINT `payment_allocations_ibfk_1` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`);

--
-- Constraints for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD CONSTRAINT `payment_methods_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`);

--
-- Constraints for table `portfolios`
--
ALTER TABLE `portfolios`
  ADD CONSTRAINT `portfolios_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  ADD CONSTRAINT `portfolios_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  ADD CONSTRAINT `portfolios_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `portfolios_ibfk_4` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `portfolio_categories`
--
ALTER TABLE `portfolio_categories`
  ADD CONSTRAINT `portfolio_categories_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `portfolio_categories` (`id`),
  ADD CONSTRAINT `portfolio_categories_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`);

--
-- Constraints for table `portfolio_category_relations`
--
ALTER TABLE `portfolio_category_relations`
  ADD CONSTRAINT `portfolio_category_relations_ibfk_1` FOREIGN KEY (`portfolio_id`) REFERENCES `portfolios` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `portfolio_category_relations_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `portfolio_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `portfolio_contents`
--
ALTER TABLE `portfolio_contents`
  ADD CONSTRAINT `portfolio_contents_ibfk_1` FOREIGN KEY (`portfolio_id`) REFERENCES `portfolios` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `portfolio_views`
--
ALTER TABLE `portfolio_views`
  ADD CONSTRAINT `portfolio_views_ibfk_1` FOREIGN KEY (`portfolio_id`) REFERENCES `portfolios` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`tax_id`) REFERENCES `taxes` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_ibfk_3` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_ibfk_4` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_ibfk_5` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `product_attributes`
--
ALTER TABLE `product_attributes`
  ADD CONSTRAINT `product_attributes_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_attribute_values`
--
ALTER TABLE `product_attribute_values`
  ADD CONSTRAINT `product_attribute_values_ibfk_1` FOREIGN KEY (`attribute_id`) REFERENCES `product_attributes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD CONSTRAINT `product_categories_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `product_categories` (`id`),
  ADD CONSTRAINT `product_categories_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`);

--
-- Constraints for table `product_category_relations`
--
ALTER TABLE `product_category_relations`
  ADD CONSTRAINT `product_category_relations_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `product_category_relations_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `product_categories` (`id`);

--
-- Constraints for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD CONSTRAINT `product_variants_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_variants_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`);

--
-- Constraints for table `product_variant_attribute_values`
--
ALTER TABLE `product_variant_attribute_values`
  ADD CONSTRAINT `product_variant_attribute_values_ibfk_1` FOREIGN KEY (`variant_id`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_variant_attribute_values_ibfk_2` FOREIGN KEY (`attribute_value_id`) REFERENCES `product_attribute_values` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `promotions`
--
ALTER TABLE `promotions`
  ADD CONSTRAINT `promotions_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`);

--
-- Constraints for table `promotion_products`
--
ALTER TABLE `promotion_products`
  ADD CONSTRAINT `promotion_products_ibfk_1` FOREIGN KEY (`promotion_id`) REFERENCES `promotions` (`id`),
  ADD CONSTRAINT `promotion_products_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `promotion_services`
--
ALTER TABLE `promotion_services`
  ADD CONSTRAINT `promotion_services_ibfk_1` FOREIGN KEY (`promotion_id`) REFERENCES `promotions` (`id`),
  ADD CONSTRAINT `promotion_services_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`);

--
-- Constraints for table `quotations`
--
ALTER TABLE `quotations`
  ADD CONSTRAINT `quotations_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `quotations_ibfk_2` FOREIGN KEY (`sales_rep_id`) REFERENCES `sales_representatives` (`id`),
  ADD CONSTRAINT `quotations_ibfk_3` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`),
  ADD CONSTRAINT `quotations_ibfk_4` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`);

--
-- Constraints for table `quotation_items`
--
ALTER TABLE `quotation_items`
  ADD CONSTRAINT `quotation_items_ibfk_1` FOREIGN KEY (`quotation_id`) REFERENCES `quotations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `quotation_remarks`
--
ALTER TABLE `quotation_remarks`
  ADD CONSTRAINT `quotation_remarks_ibfk_1` FOREIGN KEY (`quotation_id`) REFERENCES `quotations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `quotation_remarks_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `review_replies`
--
ALTER TABLE `review_replies`
  ADD CONSTRAINT `review_replies_ibfk_1` FOREIGN KEY (`review_id`) REFERENCES `service_reviews` (`id`),
  ADD CONSTRAINT `review_replies_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD CONSTRAINT `role_permissions_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `role_permissions_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`);

--
-- Constraints for table `sales_representatives`
--
ALTER TABLE `sales_representatives`
  ADD CONSTRAINT `sales_representatives_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`),
  ADD CONSTRAINT `sales_representatives_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`);

--
-- Constraints for table `seo_meta`
--
ALTER TABLE `seo_meta`
  ADD CONSTRAINT `seo_meta_ibfk_1` FOREIGN KEY (`og_image_media_id`) REFERENCES `media_library` (`id`);

--
-- Constraints for table `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `services_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  ADD CONSTRAINT `services_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `services_ibfk_3` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `service_categories`
--
ALTER TABLE `service_categories`
  ADD CONSTRAINT `service_categories_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `service_categories` (`id`),
  ADD CONSTRAINT `service_categories_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`);

--
-- Constraints for table `service_category_relations`
--
ALTER TABLE `service_category_relations`
  ADD CONSTRAINT `service_category_relations_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`),
  ADD CONSTRAINT `service_category_relations_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `service_categories` (`id`);

--
-- Constraints for table `service_contents`
--
ALTER TABLE `service_contents`
  ADD CONSTRAINT `service_contents_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `service_faqs`
--
ALTER TABLE `service_faqs`
  ADD CONSTRAINT `service_faqs_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `service_packages`
--
ALTER TABLE `service_packages`
  ADD CONSTRAINT `service_packages_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`),
  ADD CONSTRAINT `service_packages_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`);

--
-- Constraints for table `service_reviews`
--
ALTER TABLE `service_reviews`
  ADD CONSTRAINT `service_reviews_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`),
  ADD CONSTRAINT `service_reviews_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `staff_ibfk_2` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`),
  ADD CONSTRAINT `staff_ibfk_3` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`);

--
-- Constraints for table `stock_movements`
--
ALTER TABLE `stock_movements`
  ADD CONSTRAINT `stock_movements_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`),
  ADD CONSTRAINT `stock_movements_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `stock_movements_ibfk_3` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`id`),
  ADD CONSTRAINT `stock_movements_ibfk_4` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`);

--
-- Constraints for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD CONSTRAINT `suppliers_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`);

--
-- Constraints for table `supplier_bank_accounts`
--
ALTER TABLE `supplier_bank_accounts`
  ADD CONSTRAINT `supplier_bank_accounts_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`);

--
-- Constraints for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD CONSTRAINT `testimonials_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  ADD CONSTRAINT `testimonials_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`);

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `user_roles_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `warehouses`
--
ALTER TABLE `warehouses`
  ADD CONSTRAINT `warehouses_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`);

--
-- Constraints for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Constraints for table `wishlist_items`
--
ALTER TABLE `wishlist_items`
  ADD CONSTRAINT `wishlist_items_ibfk_1` FOREIGN KEY (`wishlist_id`) REFERENCES `wishlists` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `workflow_execution_logs`
--
ALTER TABLE `workflow_execution_logs`
  ADD CONSTRAINT `workflow_execution_logs_ibfk_1` FOREIGN KEY (`workflow_id`) REFERENCES `workflow_automations` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
