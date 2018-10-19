-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: 35.202.33.75    Database: wordpress
-- ------------------------------------------------------
-- Server version	5.5.5-10.2.17-MariaDB-1:10.2.17+maria~bionic

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bdb_accounts`
--

DROP TABLE IF EXISTS `bdb_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bdb_accounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `opening_balance` double(15,4) NOT NULL DEFAULT 0.0000,
  `bank_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_company_id_index` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bdb_accounts`
--

LOCK TABLES `bdb_accounts` WRITE;
/*!40000 ALTER TABLE `bdb_accounts` DISABLE KEYS */;
INSERT INTO `bdb_accounts` VALUES (1,1,'Cash','1','USD',0.0000,'Cash',NULL,NULL,1,'2018-10-18 21:04:24','2018-10-18 21:04:24',NULL);
/*!40000 ALTER TABLE `bdb_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bdb_bill_histories`
--

DROP TABLE IF EXISTS `bdb_bill_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bdb_bill_histories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `status_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bill_histories_company_id_index` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bdb_bill_histories`
--

LOCK TABLES `bdb_bill_histories` WRITE;
/*!40000 ALTER TABLE `bdb_bill_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `bdb_bill_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bdb_bill_items`
--

DROP TABLE IF EXISTS `bdb_bill_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bdb_bill_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` double(7,2) NOT NULL,
  `price` double(15,4) NOT NULL,
  `total` double(15,4) NOT NULL,
  `tax` double(15,4) NOT NULL DEFAULT 0.0000,
  `tax_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bill_items_company_id_index` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bdb_bill_items`
--

LOCK TABLES `bdb_bill_items` WRITE;
/*!40000 ALTER TABLE `bdb_bill_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `bdb_bill_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bdb_bill_payments`
--

DROP TABLE IF EXISTS `bdb_bill_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bdb_bill_payments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `paid_at` datetime NOT NULL,
  `amount` double(15,4) NOT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_rate` double(15,8) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bill_payments_company_id_index` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bdb_bill_payments`
--

LOCK TABLES `bdb_bill_payments` WRITE;
/*!40000 ALTER TABLE `bdb_bill_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `bdb_bill_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bdb_bill_statuses`
--

DROP TABLE IF EXISTS `bdb_bill_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bdb_bill_statuses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bill_statuses_company_id_index` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bdb_bill_statuses`
--

LOCK TABLES `bdb_bill_statuses` WRITE;
/*!40000 ALTER TABLE `bdb_bill_statuses` DISABLE KEYS */;
INSERT INTO `bdb_bill_statuses` VALUES (1,1,'Draft','draft','2018-10-18 21:04:24','2018-10-18 21:04:24',NULL),(2,1,'Received','received','2018-10-18 21:04:24','2018-10-18 21:04:24',NULL),(3,1,'Partial','partial','2018-10-18 21:04:24','2018-10-18 21:04:24',NULL),(4,1,'Paid','paid','2018-10-18 21:04:24','2018-10-18 21:04:24',NULL);
/*!40000 ALTER TABLE `bdb_bill_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bdb_bill_totals`
--

DROP TABLE IF EXISTS `bdb_bill_totals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bdb_bill_totals` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(15,4) NOT NULL,
  `sort_order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bill_totals_company_id_index` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bdb_bill_totals`
--

LOCK TABLES `bdb_bill_totals` WRITE;
/*!40000 ALTER TABLE `bdb_bill_totals` DISABLE KEYS */;
/*!40000 ALTER TABLE `bdb_bill_totals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bdb_bills`
--

DROP TABLE IF EXISTS `bdb_bills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bdb_bills` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `bill_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bill_status_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billed_at` datetime NOT NULL,
  `due_at` datetime NOT NULL,
  `amount` double(15,4) NOT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_rate` double(15,8) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `vendor_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vendor_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vendor_tax_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vendor_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vendor_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `category_id` int(11) NOT NULL DEFAULT 1,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bills_company_id_bill_number_deleted_at_unique` (`company_id`,`bill_number`,`deleted_at`),
  KEY `bills_company_id_index` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bdb_bills`
--

LOCK TABLES `bdb_bills` WRITE;
/*!40000 ALTER TABLE `bdb_bills` DISABLE KEYS */;
/*!40000 ALTER TABLE `bdb_bills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bdb_categories`
--

DROP TABLE IF EXISTS `bdb_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bdb_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_company_id_index` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bdb_categories`
--

LOCK TABLES `bdb_categories` WRITE;
/*!40000 ALTER TABLE `bdb_categories` DISABLE KEYS */;
INSERT INTO `bdb_categories` VALUES (1,1,'Transfer','other','#605ca8',1,'2018-10-18 21:04:24','2018-10-18 21:04:24',NULL),(2,1,'Deposit','income','#f39c12',1,'2018-10-18 21:04:24','2018-10-18 21:04:24',NULL),(3,1,'Sales','income','#6da252',1,'2018-10-18 21:04:24','2018-10-18 21:04:24',NULL),(4,1,'Other','expense','#d2d6de',1,'2018-10-18 21:04:24','2018-10-18 21:04:24',NULL),(5,1,'General','item','#00c0ef',1,'2018-10-18 21:04:25','2018-10-18 21:04:25',NULL);
/*!40000 ALTER TABLE `bdb_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bdb_companies`
--

DROP TABLE IF EXISTS `bdb_companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bdb_companies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `domain` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bdb_companies`
--

LOCK TABLES `bdb_companies` WRITE;
/*!40000 ALTER TABLE `bdb_companies` DISABLE KEYS */;
INSERT INTO `bdb_companies` VALUES (1,'',1,'2018-10-18 21:04:24','2018-10-18 21:04:24',NULL);
/*!40000 ALTER TABLE `bdb_companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bdb_currencies`
--

DROP TABLE IF EXISTS `bdb_currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bdb_currencies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` double(15,8) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `precision` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol_first` int(11) NOT NULL DEFAULT 1,
  `decimal_mark` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thousands_separator` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `currencies_company_id_code_deleted_at_unique` (`company_id`,`code`,`deleted_at`),
  KEY `currencies_company_id_index` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bdb_currencies`
--

LOCK TABLES `bdb_currencies` WRITE;
/*!40000 ALTER TABLE `bdb_currencies` DISABLE KEYS */;
INSERT INTO `bdb_currencies` VALUES (1,1,'US Dollar','USD',1.00000000,1,'2018-10-18 21:04:25','2018-10-18 21:04:25',NULL,'2','$',1,'.',','),(2,1,'Euro','EUR',1.25000000,1,'2018-10-18 21:04:25','2018-10-18 21:04:25',NULL,'2','€',1,',','.'),(3,1,'British Pound','GBP',1.60000000,1,'2018-10-18 21:04:25','2018-10-18 21:04:25',NULL,'2','£',1,'.',','),(4,1,'Turkish Lira','TRY',0.80000000,1,'2018-10-18 21:04:25','2018-10-18 21:04:25',NULL,'2','₺',1,',','.');
/*!40000 ALTER TABLE `bdb_currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bdb_customers`
--

DROP TABLE IF EXISTS `bdb_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bdb_customers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customers_company_id_email_deleted_at_unique` (`company_id`,`email`,`deleted_at`),
  KEY `customers_company_id_index` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bdb_customers`
--

LOCK TABLES `bdb_customers` WRITE;
/*!40000 ALTER TABLE `bdb_customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `bdb_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bdb_failed_jobs`
--

DROP TABLE IF EXISTS `bdb_failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bdb_failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bdb_failed_jobs`
--

LOCK TABLES `bdb_failed_jobs` WRITE;
/*!40000 ALTER TABLE `bdb_failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `bdb_failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bdb_invoice_histories`
--

DROP TABLE IF EXISTS `bdb_invoice_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bdb_invoice_histories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `status_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_histories_company_id_index` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bdb_invoice_histories`
--

LOCK TABLES `bdb_invoice_histories` WRITE;
/*!40000 ALTER TABLE `bdb_invoice_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `bdb_invoice_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bdb_invoice_items`
--

DROP TABLE IF EXISTS `bdb_invoice_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bdb_invoice_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` double(7,2) NOT NULL,
  `price` double(15,4) NOT NULL,
  `total` double(15,4) NOT NULL,
  `tax` double(15,4) NOT NULL DEFAULT 0.0000,
  `tax_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_items_company_id_index` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bdb_invoice_items`
--

LOCK TABLES `bdb_invoice_items` WRITE;
/*!40000 ALTER TABLE `bdb_invoice_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `bdb_invoice_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bdb_invoice_payments`
--

DROP TABLE IF EXISTS `bdb_invoice_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bdb_invoice_payments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `paid_at` datetime NOT NULL,
  `amount` double(15,4) NOT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_rate` double(15,8) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_payments_company_id_index` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bdb_invoice_payments`
--

LOCK TABLES `bdb_invoice_payments` WRITE;
/*!40000 ALTER TABLE `bdb_invoice_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `bdb_invoice_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bdb_invoice_statuses`
--

DROP TABLE IF EXISTS `bdb_invoice_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bdb_invoice_statuses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_statuses_company_id_index` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bdb_invoice_statuses`
--

LOCK TABLES `bdb_invoice_statuses` WRITE;
/*!40000 ALTER TABLE `bdb_invoice_statuses` DISABLE KEYS */;
INSERT INTO `bdb_invoice_statuses` VALUES (1,1,'Draft','draft','2018-10-18 21:04:25','2018-10-18 21:04:25',NULL),(2,1,'Sent','sent','2018-10-18 21:04:25','2018-10-18 21:04:25',NULL),(3,1,'Viewed','viewed','2018-10-18 21:04:25','2018-10-18 21:04:25',NULL),(4,1,'Approved','approved','2018-10-18 21:04:25','2018-10-18 21:04:25',NULL),(5,1,'Partial','partial','2018-10-18 21:04:25','2018-10-18 21:04:25',NULL),(6,1,'Paid','paid','2018-10-18 21:04:25','2018-10-18 21:04:25',NULL);
/*!40000 ALTER TABLE `bdb_invoice_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bdb_invoice_totals`
--

DROP TABLE IF EXISTS `bdb_invoice_totals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bdb_invoice_totals` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(15,4) NOT NULL,
  `sort_order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_totals_company_id_index` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bdb_invoice_totals`
--

LOCK TABLES `bdb_invoice_totals` WRITE;
/*!40000 ALTER TABLE `bdb_invoice_totals` DISABLE KEYS */;
/*!40000 ALTER TABLE `bdb_invoice_totals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bdb_invoices`
--

DROP TABLE IF EXISTS `bdb_invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bdb_invoices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `invoice_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_status_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoiced_at` datetime NOT NULL,
  `due_at` datetime NOT NULL,
  `amount` double(15,4) NOT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_rate` double(15,8) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_tax_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `category_id` int(11) NOT NULL DEFAULT 1,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `invoices_company_id_invoice_number_deleted_at_unique` (`company_id`,`invoice_number`,`deleted_at`),
  KEY `invoices_company_id_index` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bdb_invoices`
--

LOCK TABLES `bdb_invoices` WRITE;
/*!40000 ALTER TABLE `bdb_invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `bdb_invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bdb_items`
--

DROP TABLE IF EXISTS `bdb_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bdb_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sale_price` double(15,4) NOT NULL,
  `purchase_price` double(15,4) NOT NULL,
  `quantity` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `tax_id` int(11) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `items_company_id_sku_deleted_at_unique` (`company_id`,`sku`,`deleted_at`),
  KEY `items_company_id_index` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bdb_items`
--

LOCK TABLES `bdb_items` WRITE;
/*!40000 ALTER TABLE `bdb_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `bdb_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bdb_jobs`
--

DROP TABLE IF EXISTS `bdb_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bdb_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_reserved_at_index` (`queue`,`reserved_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bdb_jobs`
--

LOCK TABLES `bdb_jobs` WRITE;
/*!40000 ALTER TABLE `bdb_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `bdb_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bdb_media`
--

DROP TABLE IF EXISTS `bdb_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bdb_media` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `disk` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `directory` varchar(68) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filename` varchar(121) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` varchar(28) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `aggregate_type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `media_disk_directory_filename_extension_unique` (`disk`,`directory`,`filename`,`extension`),
  KEY `media_disk_directory_index` (`disk`,`directory`),
  KEY `media_aggregate_type_index` (`aggregate_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bdb_media`
--

LOCK TABLES `bdb_media` WRITE;
/*!40000 ALTER TABLE `bdb_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `bdb_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bdb_mediables`
--

DROP TABLE IF EXISTS `bdb_mediables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bdb_mediables` (
  `media_id` int(10) unsigned NOT NULL,
  `mediable_type` varchar(152) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mediable_id` int(10) unsigned NOT NULL,
  `tag` varchar(68) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(10) unsigned NOT NULL,
  PRIMARY KEY (`media_id`,`mediable_type`,`mediable_id`,`tag`),
  KEY `mediables_mediable_id_mediable_type_index` (`mediable_id`,`mediable_type`),
  KEY `mediables_tag_index` (`tag`),
  KEY `mediables_order_index` (`order`),
  CONSTRAINT `mediables_media_id_foreign` FOREIGN KEY (`media_id`) REFERENCES `bdb_media` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bdb_mediables`
--

LOCK TABLES `bdb_mediables` WRITE;
/*!40000 ALTER TABLE `bdb_mediables` DISABLE KEYS */;
/*!40000 ALTER TABLE `bdb_mediables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bdb_migrations`
--

DROP TABLE IF EXISTS `bdb_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bdb_migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bdb_migrations`
--

LOCK TABLES `bdb_migrations` WRITE;
/*!40000 ALTER TABLE `bdb_migrations` DISABLE KEYS */;
INSERT INTO `bdb_migrations` VALUES (1,'2017_09_01_000000_create_accounts_table',1),(2,'2017_09_01_000000_create_bills_table',1),(3,'2017_09_01_000000_create_categories_table',1),(4,'2017_09_01_000000_create_companies_table',1),(5,'2017_09_01_000000_create_currencies_table',1),(6,'2017_09_01_000000_create_customers_table',1),(7,'2017_09_01_000000_create_invoices_table',1),(8,'2017_09_01_000000_create_items_table',1),(9,'2017_09_01_000000_create_jobs_table',1),(10,'2017_09_01_000000_create_modules_table',1),(11,'2017_09_01_000000_create_notifications_table',1),(12,'2017_09_01_000000_create_password_resets_table',1),(13,'2017_09_01_000000_create_payments_table',1),(14,'2017_09_01_000000_create_revenues_table',1),(15,'2017_09_01_000000_create_roles_table',1),(16,'2017_09_01_000000_create_sessions_table',1),(17,'2017_09_01_000000_create_settings_table',1),(18,'2017_09_01_000000_create_taxes_table',1),(19,'2017_09_01_000000_create_transfers_table',1),(20,'2017_09_01_000000_create_users_table',1),(21,'2017_09_01_000000_create_vendors_table',1),(22,'2017_09_19_delete_offline_file',1),(23,'2017_10_11_000000_create_bill_totals_table',1),(24,'2017_10_11_000000_create_invoice_totals_table',1),(25,'2017_11_16_000000_create_failed_jobs_table',1),(26,'2017_12_09_000000_add_currency_columns',1),(27,'2017_12_30_000000_create_mediable_tables',1),(28,'2018_01_03_000000_drop_attachment_column_bill_payments_table',1),(29,'2018_01_03_000000_drop_attachment_column_bills_table',1),(30,'2018_01_03_000000_drop_attachment_column_invoice_payments_table',1),(31,'2018_01_03_000000_drop_attachment_column_invoices_table',1),(32,'2018_01_03_000000_drop_attachment_column_payments_table',1),(33,'2018_01_03_000000_drop_attachment_column_revenues_table',1),(34,'2018_01_03_000000_drop_picture_column_items_table',1),(35,'2018_01_03_000000_drop_picture_column_users_table',1),(36,'2018_04_23_000000_add_category_column_invoices_bills',1),(37,'2018_04_26_000000_create_recurring_table',1),(38,'2018_04_30_000000_add_parent_column',1),(39,'2018_06_23_000000_modify_email_column',1),(40,'2018_06_30_000000_modify_enabled_column',1),(41,'2018_07_07_000000_modify_date_column',1),(42,'2020_01_01_000000_add_locale_column',1);
/*!40000 ALTER TABLE `bdb_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bdb_module_histories`
--

DROP TABLE IF EXISTS `bdb_module_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bdb_module_histories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `category` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `module_histories_company_id_module_id_index` (`company_id`,`module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bdb_module_histories`
--

LOCK TABLES `bdb_module_histories` WRITE;
/*!40000 ALTER TABLE `bdb_module_histories` DISABLE KEYS */;
INSERT INTO `bdb_module_histories` VALUES (1,1,1,'payment-gateways','1.0.0','OfflinePayment installed','2018-10-18 21:04:25','2018-10-18 21:04:25',NULL),(2,1,2,'payment-gateways','1.0.0','PaypalStandard installed','2018-10-18 21:04:25','2018-10-18 21:04:25',NULL);
/*!40000 ALTER TABLE `bdb_module_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bdb_modules`
--

DROP TABLE IF EXISTS `bdb_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bdb_modules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `alias` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `modules_company_id_alias_deleted_at_unique` (`company_id`,`alias`,`deleted_at`),
  KEY `modules_company_id_index` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bdb_modules`
--

LOCK TABLES `bdb_modules` WRITE;
/*!40000 ALTER TABLE `bdb_modules` DISABLE KEYS */;
INSERT INTO `bdb_modules` VALUES (1,1,'offlinepayment',1,'2018-10-18 21:04:25','2018-10-18 21:04:25',NULL),(2,1,'paypalstandard',1,'2018-10-18 21:04:25','2018-10-18 21:04:25',NULL);
/*!40000 ALTER TABLE `bdb_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bdb_notifications`
--

DROP TABLE IF EXISTS `bdb_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bdb_notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` int(10) unsigned NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_id_notifiable_type_index` (`notifiable_id`,`notifiable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bdb_notifications`
--

LOCK TABLES `bdb_notifications` WRITE;
/*!40000 ALTER TABLE `bdb_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `bdb_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bdb_password_resets`
--

DROP TABLE IF EXISTS `bdb_password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bdb_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bdb_password_resets`
--

LOCK TABLES `bdb_password_resets` WRITE;
/*!40000 ALTER TABLE `bdb_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `bdb_password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bdb_payments`
--

DROP TABLE IF EXISTS `bdb_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bdb_payments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `paid_at` datetime NOT NULL,
  `amount` double(15,4) NOT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_rate` double(15,8) NOT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `payments_company_id_index` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bdb_payments`
--

LOCK TABLES `bdb_payments` WRITE;
/*!40000 ALTER TABLE `bdb_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `bdb_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bdb_permissions`
--

DROP TABLE IF EXISTS `bdb_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bdb_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bdb_permissions`
--

LOCK TABLES `bdb_permissions` WRITE;
/*!40000 ALTER TABLE `bdb_permissions` DISABLE KEYS */;
INSERT INTO `bdb_permissions` VALUES (1,'read-admin-panel','Read Admin Panel','Read Admin Panel','2018-10-18 21:03:40','2018-10-18 21:03:40'),(2,'read-api','Read Api','Read Api','2018-10-18 21:03:40','2018-10-18 21:03:40'),(3,'create-auth-users','Create Auth Users','Create Auth Users','2018-10-18 21:03:40','2018-10-18 21:03:40'),(4,'read-auth-users','Read Auth Users','Read Auth Users','2018-10-18 21:03:40','2018-10-18 21:03:40'),(5,'update-auth-users','Update Auth Users','Update Auth Users','2018-10-18 21:03:41','2018-10-18 21:03:41'),(6,'delete-auth-users','Delete Auth Users','Delete Auth Users','2018-10-18 21:03:41','2018-10-18 21:03:41'),(7,'create-auth-roles','Create Auth Roles','Create Auth Roles','2018-10-18 21:03:41','2018-10-18 21:03:41'),(8,'read-auth-roles','Read Auth Roles','Read Auth Roles','2018-10-18 21:03:41','2018-10-18 21:03:41'),(9,'update-auth-roles','Update Auth Roles','Update Auth Roles','2018-10-18 21:03:41','2018-10-18 21:03:41'),(10,'delete-auth-roles','Delete Auth Roles','Delete Auth Roles','2018-10-18 21:03:42','2018-10-18 21:03:42'),(11,'create-auth-permissions','Create Auth Permissions','Create Auth Permissions','2018-10-18 21:03:42','2018-10-18 21:03:42'),(12,'read-auth-permissions','Read Auth Permissions','Read Auth Permissions','2018-10-18 21:03:42','2018-10-18 21:03:42'),(13,'update-auth-permissions','Update Auth Permissions','Update Auth Permissions','2018-10-18 21:03:42','2018-10-18 21:03:42'),(14,'delete-auth-permissions','Delete Auth Permissions','Delete Auth Permissions','2018-10-18 21:03:42','2018-10-18 21:03:42'),(15,'read-auth-profile','Read Auth Profile','Read Auth Profile','2018-10-18 21:03:43','2018-10-18 21:03:43'),(16,'update-auth-profile','Update Auth Profile','Update Auth Profile','2018-10-18 21:03:43','2018-10-18 21:03:43'),(17,'create-common-companies','Create Common Companies','Create Common Companies','2018-10-18 21:03:43','2018-10-18 21:03:43'),(18,'read-common-companies','Read Common Companies','Read Common Companies','2018-10-18 21:03:43','2018-10-18 21:03:43'),(19,'update-common-companies','Update Common Companies','Update Common Companies','2018-10-18 21:03:44','2018-10-18 21:03:44'),(20,'delete-common-companies','Delete Common Companies','Delete Common Companies','2018-10-18 21:03:44','2018-10-18 21:03:44'),(21,'create-common-import','Create Common Import','Create Common Import','2018-10-18 21:03:44','2018-10-18 21:03:44'),(22,'create-common-items','Create Common Items','Create Common Items','2018-10-18 21:03:44','2018-10-18 21:03:44'),(23,'read-common-items','Read Common Items','Read Common Items','2018-10-18 21:03:44','2018-10-18 21:03:44'),(24,'update-common-items','Update Common Items','Update Common Items','2018-10-18 21:03:45','2018-10-18 21:03:45'),(25,'delete-common-items','Delete Common Items','Delete Common Items','2018-10-18 21:03:45','2018-10-18 21:03:45'),(26,'delete-common-uploads','Delete Common Uploads','Delete Common Uploads','2018-10-18 21:03:45','2018-10-18 21:03:45'),(27,'create-incomes-invoices','Create Incomes Invoices','Create Incomes Invoices','2018-10-18 21:03:45','2018-10-18 21:03:45'),(28,'read-incomes-invoices','Read Incomes Invoices','Read Incomes Invoices','2018-10-18 21:03:45','2018-10-18 21:03:45'),(29,'update-incomes-invoices','Update Incomes Invoices','Update Incomes Invoices','2018-10-18 21:03:46','2018-10-18 21:03:46'),(30,'delete-incomes-invoices','Delete Incomes Invoices','Delete Incomes Invoices','2018-10-18 21:03:46','2018-10-18 21:03:46'),(31,'create-incomes-revenues','Create Incomes Revenues','Create Incomes Revenues','2018-10-18 21:03:46','2018-10-18 21:03:46'),(32,'read-incomes-revenues','Read Incomes Revenues','Read Incomes Revenues','2018-10-18 21:03:46','2018-10-18 21:03:46'),(33,'update-incomes-revenues','Update Incomes Revenues','Update Incomes Revenues','2018-10-18 21:03:46','2018-10-18 21:03:46'),(34,'delete-incomes-revenues','Delete Incomes Revenues','Delete Incomes Revenues','2018-10-18 21:03:47','2018-10-18 21:03:47'),(35,'create-incomes-customers','Create Incomes Customers','Create Incomes Customers','2018-10-18 21:03:47','2018-10-18 21:03:47'),(36,'read-incomes-customers','Read Incomes Customers','Read Incomes Customers','2018-10-18 21:03:47','2018-10-18 21:03:47'),(37,'update-incomes-customers','Update Incomes Customers','Update Incomes Customers','2018-10-18 21:03:47','2018-10-18 21:03:47'),(38,'delete-incomes-customers','Delete Incomes Customers','Delete Incomes Customers','2018-10-18 21:03:47','2018-10-18 21:03:47'),(39,'create-expenses-bills','Create Expenses Bills','Create Expenses Bills','2018-10-18 21:03:48','2018-10-18 21:03:48'),(40,'read-expenses-bills','Read Expenses Bills','Read Expenses Bills','2018-10-18 21:03:48','2018-10-18 21:03:48'),(41,'update-expenses-bills','Update Expenses Bills','Update Expenses Bills','2018-10-18 21:03:48','2018-10-18 21:03:48'),(42,'delete-expenses-bills','Delete Expenses Bills','Delete Expenses Bills','2018-10-18 21:03:48','2018-10-18 21:03:48'),(43,'create-expenses-payments','Create Expenses Payments','Create Expenses Payments','2018-10-18 21:03:48','2018-10-18 21:03:48'),(44,'read-expenses-payments','Read Expenses Payments','Read Expenses Payments','2018-10-18 21:03:49','2018-10-18 21:03:49'),(45,'update-expenses-payments','Update Expenses Payments','Update Expenses Payments','2018-10-18 21:03:49','2018-10-18 21:03:49'),(46,'delete-expenses-payments','Delete Expenses Payments','Delete Expenses Payments','2018-10-18 21:03:49','2018-10-18 21:03:49'),(47,'create-expenses-vendors','Create Expenses Vendors','Create Expenses Vendors','2018-10-18 21:03:49','2018-10-18 21:03:49'),(48,'read-expenses-vendors','Read Expenses Vendors','Read Expenses Vendors','2018-10-18 21:03:49','2018-10-18 21:03:49'),(49,'update-expenses-vendors','Update Expenses Vendors','Update Expenses Vendors','2018-10-18 21:03:50','2018-10-18 21:03:50'),(50,'delete-expenses-vendors','Delete Expenses Vendors','Delete Expenses Vendors','2018-10-18 21:03:50','2018-10-18 21:03:50'),(51,'create-banking-accounts','Create Banking Accounts','Create Banking Accounts','2018-10-18 21:03:50','2018-10-18 21:03:50'),(52,'read-banking-accounts','Read Banking Accounts','Read Banking Accounts','2018-10-18 21:03:50','2018-10-18 21:03:50'),(53,'update-banking-accounts','Update Banking Accounts','Update Banking Accounts','2018-10-18 21:03:50','2018-10-18 21:03:50'),(54,'delete-banking-accounts','Delete Banking Accounts','Delete Banking Accounts','2018-10-18 21:03:51','2018-10-18 21:03:51'),(55,'create-banking-transfers','Create Banking Transfers','Create Banking Transfers','2018-10-18 21:03:51','2018-10-18 21:03:51'),(56,'read-banking-transfers','Read Banking Transfers','Read Banking Transfers','2018-10-18 21:03:51','2018-10-18 21:03:51'),(57,'update-banking-transfers','Update Banking Transfers','Update Banking Transfers','2018-10-18 21:03:51','2018-10-18 21:03:51'),(58,'delete-banking-transfers','Delete Banking Transfers','Delete Banking Transfers','2018-10-18 21:03:51','2018-10-18 21:03:51'),(59,'read-banking-transactions','Read Banking Transactions','Read Banking Transactions','2018-10-18 21:03:52','2018-10-18 21:03:52'),(60,'create-settings-categories','Create Settings Categories','Create Settings Categories','2018-10-18 21:03:52','2018-10-18 21:03:52'),(61,'read-settings-categories','Read Settings Categories','Read Settings Categories','2018-10-18 21:03:52','2018-10-18 21:03:52'),(62,'update-settings-categories','Update Settings Categories','Update Settings Categories','2018-10-18 21:03:52','2018-10-18 21:03:52'),(63,'delete-settings-categories','Delete Settings Categories','Delete Settings Categories','2018-10-18 21:03:52','2018-10-18 21:03:52'),(64,'read-settings-settings','Read Settings Settings','Read Settings Settings','2018-10-18 21:03:53','2018-10-18 21:03:53'),(65,'update-settings-settings','Update Settings Settings','Update Settings Settings','2018-10-18 21:03:53','2018-10-18 21:03:53'),(66,'create-settings-taxes','Create Settings Taxes','Create Settings Taxes','2018-10-18 21:03:53','2018-10-18 21:03:53'),(67,'read-settings-taxes','Read Settings Taxes','Read Settings Taxes','2018-10-18 21:03:53','2018-10-18 21:03:53'),(68,'update-settings-taxes','Update Settings Taxes','Update Settings Taxes','2018-10-18 21:03:53','2018-10-18 21:03:53'),(69,'delete-settings-taxes','Delete Settings Taxes','Delete Settings Taxes','2018-10-18 21:03:54','2018-10-18 21:03:54'),(70,'create-settings-currencies','Create Settings Currencies','Create Settings Currencies','2018-10-18 21:03:54','2018-10-18 21:03:54'),(71,'read-settings-currencies','Read Settings Currencies','Read Settings Currencies','2018-10-18 21:03:54','2018-10-18 21:03:54'),(72,'update-settings-currencies','Update Settings Currencies','Update Settings Currencies','2018-10-18 21:03:54','2018-10-18 21:03:54'),(73,'delete-settings-currencies','Delete Settings Currencies','Delete Settings Currencies','2018-10-18 21:03:54','2018-10-18 21:03:54'),(74,'read-settings-modules','Read Settings Modules','Read Settings Modules','2018-10-18 21:03:55','2018-10-18 21:03:55'),(75,'update-settings-modules','Update Settings Modules','Update Settings Modules','2018-10-18 21:03:55','2018-10-18 21:03:55'),(76,'read-modules-home','Read Modules Home','Read Modules Home','2018-10-18 21:03:55','2018-10-18 21:03:55'),(77,'read-modules-tiles','Read Modules Tiles','Read Modules Tiles','2018-10-18 21:03:55','2018-10-18 21:03:55'),(78,'create-modules-item','Create Modules Item','Create Modules Item','2018-10-18 21:03:56','2018-10-18 21:03:56'),(79,'read-modules-item','Read Modules Item','Read Modules Item','2018-10-18 21:03:56','2018-10-18 21:03:56'),(80,'update-modules-item','Update Modules Item','Update Modules Item','2018-10-18 21:03:56','2018-10-18 21:03:56'),(81,'delete-modules-item','Delete Modules Item','Delete Modules Item','2018-10-18 21:03:56','2018-10-18 21:03:56'),(82,'create-modules-token','Create Modules Token','Create Modules Token','2018-10-18 21:03:56','2018-10-18 21:03:56'),(83,'update-modules-token','Update Modules Token','Update Modules Token','2018-10-18 21:03:57','2018-10-18 21:03:57'),(84,'read-modules-my','Read Modules My','Read Modules My','2018-10-18 21:03:57','2018-10-18 21:03:57'),(85,'read-install-updates','Read Install Updates','Read Install Updates','2018-10-18 21:03:57','2018-10-18 21:03:57'),(86,'update-install-updates','Update Install Updates','Update Install Updates','2018-10-18 21:03:57','2018-10-18 21:03:57'),(87,'read-notifications','Read Notifications','Read Notifications','2018-10-18 21:03:57','2018-10-18 21:03:57'),(88,'update-notifications','Update Notifications','Update Notifications','2018-10-18 21:03:58','2018-10-18 21:03:58'),(89,'read-reports-income-summary','Read Reports Income Summary','Read Reports Income Summary','2018-10-18 21:03:58','2018-10-18 21:03:58'),(90,'read-reports-expense-summary','Read Reports Expense Summary','Read Reports Expense Summary','2018-10-18 21:03:58','2018-10-18 21:03:58'),(91,'read-reports-income-expense-summary','Read Reports Income Expense Summary','Read Reports Income Expense Summary','2018-10-18 21:03:58','2018-10-18 21:03:58'),(92,'read-reports-profit-loss','Read Reports Profit Loss','Read Reports Profit Loss','2018-10-18 21:03:58','2018-10-18 21:03:58'),(93,'read-reports-tax-summary','Read Reports Tax Summary','Read Reports Tax Summary','2018-10-18 21:03:59','2018-10-18 21:03:59'),(94,'read-customer-panel','Read Customer Panel','Read Customer Panel','2018-10-18 21:04:10','2018-10-18 21:04:10'),(95,'read-customers-invoices','Read Customers Invoices','Read Customers Invoices','2018-10-18 21:04:10','2018-10-18 21:04:10'),(96,'update-customers-invoices','Update Customers Invoices','Update Customers Invoices','2018-10-18 21:04:10','2018-10-18 21:04:10'),(97,'read-customers-payments','Read Customers Payments','Read Customers Payments','2018-10-18 21:04:10','2018-10-18 21:04:10'),(98,'update-customers-payments','Update Customers Payments','Update Customers Payments','2018-10-18 21:04:10','2018-10-18 21:04:10'),(99,'read-customers-transactions','Read Customers Transactions','Read Customers Transactions','2018-10-18 21:04:11','2018-10-18 21:04:11'),(100,'read-customers-profile','Read Customers Profile','Read Customers Profile','2018-10-18 21:04:11','2018-10-18 21:04:11'),(101,'update-customers-profile','Update Customers Profile','Update Customers Profile','2018-10-18 21:04:11','2018-10-18 21:04:11');
/*!40000 ALTER TABLE `bdb_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bdb_recurring`
--

DROP TABLE IF EXISTS `bdb_recurring`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bdb_recurring` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `recurable_id` int(10) unsigned NOT NULL,
  `recurable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `frequency` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `interval` int(11) NOT NULL DEFAULT 1,
  `started_at` datetime NOT NULL,
  `count` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recurring_recurable_id_recurable_type_index` (`recurable_id`,`recurable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bdb_recurring`
--

LOCK TABLES `bdb_recurring` WRITE;
/*!40000 ALTER TABLE `bdb_recurring` DISABLE KEYS */;
/*!40000 ALTER TABLE `bdb_recurring` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bdb_revenues`
--

DROP TABLE IF EXISTS `bdb_revenues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bdb_revenues` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `paid_at` datetime NOT NULL,
  `amount` double(15,4) NOT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_rate` double(15,8) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `revenues_company_id_index` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bdb_revenues`
--

LOCK TABLES `bdb_revenues` WRITE;
/*!40000 ALTER TABLE `bdb_revenues` DISABLE KEYS */;
/*!40000 ALTER TABLE `bdb_revenues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bdb_role_permissions`
--

DROP TABLE IF EXISTS `bdb_role_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bdb_role_permissions` (
  `role_id` int(10) unsigned NOT NULL,
  `permission_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`permission_id`),
  KEY `role_permissions_permission_id_foreign` (`permission_id`),
  CONSTRAINT `role_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `bdb_permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `bdb_roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bdb_role_permissions`
--

LOCK TABLES `bdb_role_permissions` WRITE;
/*!40000 ALTER TABLE `bdb_role_permissions` DISABLE KEYS */;
INSERT INTO `bdb_role_permissions` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,17),(1,18),(1,19),(1,20),(1,21),(1,22),(1,23),(1,24),(1,25),(1,26),(1,27),(1,28),(1,29),(1,30),(1,31),(1,32),(1,33),(1,34),(1,35),(1,36),(1,37),(1,38),(1,39),(1,40),(1,41),(1,42),(1,43),(1,44),(1,45),(1,46),(1,47),(1,48),(1,49),(1,50),(1,51),(1,52),(1,53),(1,54),(1,55),(1,56),(1,57),(1,58),(1,59),(1,60),(1,61),(1,62),(1,63),(1,64),(1,65),(1,66),(1,67),(1,68),(1,69),(1,70),(1,71),(1,72),(1,73),(1,74),(1,75),(1,76),(1,77),(1,78),(1,79),(1,80),(1,81),(1,82),(1,83),(1,84),(1,85),(1,86),(1,87),(1,88),(1,89),(1,90),(1,91),(1,92),(1,93),(2,1),(2,15),(2,16),(2,17),(2,18),(2,19),(2,20),(2,21),(2,22),(2,23),(2,24),(2,25),(2,27),(2,28),(2,29),(2,30),(2,31),(2,32),(2,33),(2,34),(2,35),(2,36),(2,37),(2,38),(2,39),(2,40),(2,41),(2,42),(2,43),(2,44),(2,45),(2,46),(2,47),(2,48),(2,49),(2,50),(2,51),(2,52),(2,53),(2,54),(2,55),(2,56),(2,57),(2,58),(2,59),(2,60),(2,61),(2,62),(2,63),(2,64),(2,65),(2,66),(2,67),(2,68),(2,69),(2,70),(2,71),(2,72),(2,73),(2,74),(2,75),(2,85),(2,86),(2,87),(2,88),(2,89),(2,90),(2,91),(2,92),(2,93),(3,94),(3,95),(3,96),(3,97),(3,98),(3,99),(3,100),(3,101);
/*!40000 ALTER TABLE `bdb_role_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bdb_roles`
--

DROP TABLE IF EXISTS `bdb_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bdb_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bdb_roles`
--

LOCK TABLES `bdb_roles` WRITE;
/*!40000 ALTER TABLE `bdb_roles` DISABLE KEYS */;
INSERT INTO `bdb_roles` VALUES (1,'admin','Admin','Admin','2018-10-18 21:03:40','2018-10-18 21:03:40'),(2,'manager','Manager','Manager','2018-10-18 21:03:59','2018-10-18 21:03:59'),(3,'customer','Customer','Customer','2018-10-18 21:04:10','2018-10-18 21:04:10');
/*!40000 ALTER TABLE `bdb_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bdb_sessions`
--

DROP TABLE IF EXISTS `bdb_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bdb_sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  UNIQUE KEY `sessions_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bdb_sessions`
--

LOCK TABLES `bdb_sessions` WRITE;
/*!40000 ALTER TABLE `bdb_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `bdb_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bdb_settings`
--

DROP TABLE IF EXISTS `bdb_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bdb_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_company_id_key_unique` (`company_id`,`key`),
  KEY `settings_company_id_index` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bdb_settings`
--

LOCK TABLES `bdb_settings` WRITE;
/*!40000 ALTER TABLE `bdb_settings` DISABLE KEYS */;
INSERT INTO `bdb_settings` VALUES (1,1,'general.default_account','1'),(2,1,'general.date_format','d M Y'),(3,1,'general.date_separator','space'),(4,1,'general.timezone','Europe/London'),(5,1,'general.percent_position','after'),(6,1,'general.invoice_number_prefix','INV-'),(7,1,'general.invoice_number_digit','5'),(8,1,'general.invoice_number_next','1'),(9,1,'general.default_payment_method','offlinepayment.cash.1'),(10,1,'general.email_protocol','mail'),(11,1,'general.email_sendmail_path','/usr/sbin/sendmail -bs'),(12,1,'general.send_invoice_reminder','0'),(13,1,'general.schedule_invoice_days','1,3,5,10'),(14,1,'general.send_bill_reminder','0'),(15,1,'general.schedule_bill_days','10,5,3,1'),(16,1,'general.schedule_time','09:00'),(17,1,'general.admin_theme','skin-green-light'),(18,1,'general.list_limit','25'),(19,1,'general.use_gravatar','0'),(20,1,'general.session_handler','file'),(21,1,'general.session_lifetime','30'),(22,1,'general.file_size','2'),(23,1,'general.file_types','pdf,jpeg,jpg,png'),(24,1,'general.company_name','Sample Company'),(25,1,'general.company_email','test@test.com'),(26,1,'general.default_currency','USD'),(27,1,'general.default_locale','en-GB'),(28,1,'offlinepayment.methods','[{\"code\":\"offlinepayment.cash.1\",\"name\":\"Cash\",\"order\":\"1\",\"description\":null},{\"code\":\"offlinepayment.bank_transfer.2\",\"name\":\"Bank Transfer\",\"order\":\"2\",\"description\":null}]');
/*!40000 ALTER TABLE `bdb_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bdb_taxes`
--

DROP TABLE IF EXISTS `bdb_taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bdb_taxes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` double(15,4) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `taxes_company_id_index` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bdb_taxes`
--

LOCK TABLES `bdb_taxes` WRITE;
/*!40000 ALTER TABLE `bdb_taxes` DISABLE KEYS */;
INSERT INTO `bdb_taxes` VALUES (1,1,'Tax Exempt',0.0000,1,'2018-10-18 21:04:26','2018-10-18 21:04:26',NULL),(2,1,'Normal Tax',5.0000,1,'2018-10-18 21:04:26','2018-10-18 21:04:26',NULL),(3,1,'Sales Tax',15.0000,1,'2018-10-18 21:04:26','2018-10-18 21:04:26',NULL);
/*!40000 ALTER TABLE `bdb_taxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bdb_transfers`
--

DROP TABLE IF EXISTS `bdb_transfers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bdb_transfers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `revenue_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transfers_company_id_index` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bdb_transfers`
--

LOCK TABLES `bdb_transfers` WRITE;
/*!40000 ALTER TABLE `bdb_transfers` DISABLE KEYS */;
/*!40000 ALTER TABLE `bdb_transfers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bdb_user_companies`
--

DROP TABLE IF EXISTS `bdb_user_companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bdb_user_companies` (
  `user_id` int(10) unsigned NOT NULL,
  `company_id` int(10) unsigned NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`user_id`,`company_id`,`user_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bdb_user_companies`
--

LOCK TABLES `bdb_user_companies` WRITE;
/*!40000 ALTER TABLE `bdb_user_companies` DISABLE KEYS */;
INSERT INTO `bdb_user_companies` VALUES (1,1,'users');
/*!40000 ALTER TABLE `bdb_user_companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bdb_user_permissions`
--

DROP TABLE IF EXISTS `bdb_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bdb_user_permissions` (
  `user_id` int(10) unsigned NOT NULL,
  `permission_id` int(10) unsigned NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`user_id`,`permission_id`,`user_type`),
  KEY `user_permissions_permission_id_foreign` (`permission_id`),
  CONSTRAINT `user_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `bdb_permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bdb_user_permissions`
--

LOCK TABLES `bdb_user_permissions` WRITE;
/*!40000 ALTER TABLE `bdb_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `bdb_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bdb_user_roles`
--

DROP TABLE IF EXISTS `bdb_user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bdb_user_roles` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`,`user_type`),
  KEY `user_roles_role_id_foreign` (`role_id`),
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `bdb_roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bdb_user_roles`
--

LOCK TABLES `bdb_user_roles` WRITE;
/*!40000 ALTER TABLE `bdb_user_roles` DISABLE KEYS */;
INSERT INTO `bdb_user_roles` VALUES (1,1,'users');
/*!40000 ALTER TABLE `bdb_user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bdb_users`
--

DROP TABLE IF EXISTS `bdb_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bdb_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_logged_in_at` timestamp NULL DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en-GB',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_deleted_at_unique` (`email`,`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bdb_users`
--

LOCK TABLES `bdb_users` WRITE;
/*!40000 ALTER TABLE `bdb_users` DISABLE KEYS */;
INSERT INTO `bdb_users` VALUES (1,'','admin@test.com','$2y$10$2y5liIhsuedkGua8d4Y.GOurSQ4p02KHGPH5rXCY166ldyMmgt.q2',NULL,'2018-10-18 21:04:48',1,'2018-10-18 21:04:26','2018-10-18 21:04:48',NULL,'en-GB');
/*!40000 ALTER TABLE `bdb_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bdb_vendors`
--

DROP TABLE IF EXISTS `bdb_vendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bdb_vendors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vendors_company_id_email_deleted_at_unique` (`company_id`,`email`,`deleted_at`),
  KEY `vendors_company_id_index` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bdb_vendors`
--

LOCK TABLES `bdb_vendors` WRITE;
/*!40000 ALTER TABLE `bdb_vendors` DISABLE KEYS */;
/*!40000 ALTER TABLE `bdb_vendors` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-18 15:19:51
