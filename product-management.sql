-- -------------------------------------------------------------
-- TablePlus 6.0.0(550)
--
-- https://tableplus.com/
--
-- Database: product-management
-- Generation Time: 2024-11-09 01:59:50.6270
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `price` decimal(10,2) NOT NULL,
  `stock` int DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_product_id_unique` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_11_06_183613_create_products_table', 2);

INSERT INTO `products` (`id`, `product_id`, `name`, `description`, `price`, `stock`, `image`, `created_at`, `updated_at`) VALUES
(12, 'ipad-pro-m2-11', 'iPad Pro 11\" WiFi+Cellular (4th Gen) M2 Chip', 'Display	Liquid Retina display 11-inch (diagonal)\r\nCamera	Rear 12MP+10MP | Front 12MP\r\nROM	128GB | 256GB\r\nBattery	Built-in 28.65-watt-hour rechargeable lithium-polymer battery\r\nOS	iPadOS 16\r\nSensors	Face ID LiDAR Scanner Three-axis gyro Accelerometer Barometer Ambient light sensor\r\nGPU	10-core GPU\r\nCPU	8-core CPU with 4 performance cores and 4 efficiency cores\r\nChipset	M2', 124999.00, 8, 'products/PmYixrs8Jo18YCSOIzPMU3OWSDPBDaBE7wJJ1NCu.jpg', '2024-11-08 18:51:05', '2024-11-08 18:51:05'),
(16, 'mac-air-m2', 'MacBook Air 13\" M2 Chip 8/256GB Silver', 'MacBook Air 13\" M2 Chip 8/256GB Silver\r\nThe new Apple MacBook Air 13\" M2 Chip 8/256GB Silver is a marvel of design and technology, bringing cutting-edge performance and unmatched portability to meet the needs of students, professionals, and creatives alike. Built to deliver high-speed performance while remaining incredibly light, the MacBook Air 13” M2 Chip is the ultimate laptop for anyone on the go.', 124999.00, 20, 'products/Ms9OpCJMHfbisFva9GLAhu8SMCMdauPJRIDouzNR.jpg', '2024-11-08 11:16:25', '2024-11-08 17:05:06'),
(17, 'mac-air-m3', 'MacBook Air M3 Chip 15\" 8/256GB Midnight', 'MacBook Air M3 Chip 15\"\r\nTMacBook Air 15\" with the powerful Apple M3 chip is built to elevate your work and play. This ultraportable laptop combines high-end performance, stunning visuals, and advanced functionality—all in a super-lightweight package. Perfect for students, professionals, and creatives, the MacBook Air with the M3 chip brings Apple’s cutting-edge technology to your fingertips. With a sleek design, lasting battery life, and rich media capabilities, this MacBook redefines productivity and entertainment on the go.', 164999.00, 10, 'products/Mn73JvobFD9bOggV2PKsyynpx2ccXQtfNqbkfD4n.jpg', '2024-11-08 18:18:15', '2024-11-08 18:19:00'),
(18, 'mac-air-m3-silver', 'MacBook Air 13\" M3 Chip 8/256GB Silver', 'MacBook Air 13\" M3 Chip 8/256GB Silver (8C CPU 8C GPU)\r\nMacBook Air 13\" M3 Chip 8/256GB Silver (8C CPU 8C GPU) redefines sleek power. Equipped with the advanced Apple M3 chip, this MacBook Air combines performance and energy efficiency, making it ideal for both productivity and creative applications. With its Midnight finish, vibrant display, and powerful media engine, the M3 MacBook Air is perfect for users seeking a portable yet powerful device.', 134999.00, 12, 'products/kxft5TWce3pxuvXN55kwuEEII6jcSnUCSSvx7w0P.jpg', '2024-11-08 18:21:42', '2024-11-08 18:21:42'),
(19, 'mac-air-m3-gray', 'MacBook Pro 14\" M3 Chip 8/512GB Space Gray', 'MacBook Pro 14\" M3 Chip 8/512GB Space Gray (8C CPU 10C GPU)\r\nMacBook Pro 14\" M3 Chip 8/512GB Space Gray (8C CPU 10C GPU) is designed for professionals and power users who demand performance, efficiency, and a stunning display. With its sleek Space Gray finish, this model features an 8-core CPU, 10-core GPU, and Apple\'s cutting-edge Neural Engine, making it a go-to for tasks ranging from video editing to software', 209999.00, 10, 'products/0T2GVGQayv7eYi82bkTHpn9T7r46uMUlEUr8bA95.jpg', '2024-11-08 18:23:00', '2024-11-08 18:23:00'),
(20, 'mac-air-m3-space', 'MacBook Air 13\" M2 Chip 8/256GB Space Gray', 'MacBook Air 13\" M2 Chip 8/256GB Space Gray\r\nThe new Apple MacBook Air 13\" M2 Chip 8/256GB Silver is a marvel of design and technology, bringing cutting-edge performance and unmatched portability to meet the needs of students, professionals, and creatives alike. Built to deliver high-speed performance while remaining incredibly light, the MacBook Air 13” M2 Chip is the ultimate laptop for anyone on the go.', 124999.00, 10, 'products/2ei0FrMDkg7ePDGhnyky6e4Gx20CjGAiCjr2JMKU.jpg', '2024-11-08 18:24:57', '2024-11-08 18:24:57'),
(21, 'mac-air-m3-15', 'MacBook Air M3 Chip 15\" 8/256GB Space Gray', 'MacBook Air M3 Chip 15\" 8/256GB Space Gray\r\nThe MacBook Air M3 Chip 15\" 8/256GB Space Gray with the powerful Apple M3 chip is built to elevate your work and play. This ultraportable laptop combines high-end performance, stunning visuals, and advanced functionality—all in a super-lightweight package. Perfect for students, professionals, and creatives, the MacBook Air with the M3 chip brings Apple’s cutting-edge technology to your fingertips. With a sleek design, lasting battery life, and rich media capabilities, this MacBook redefines productivity and entertainment on the go.', 154999.00, 10, 'products/W2irWMFUam487GseDhjYhrZawh56z5zursFEujVD.jpg', '2024-11-08 18:26:41', '2024-11-08 18:26:41'),
(22, 'imac-24-m3', 'iMac 24\" M3 Chip - Stunning 4.5k Retina Display', '24-inch iMac M3 - Apple Authorised Official Price in Bangladesh\r\nThe iMac series from Apple has maintained a dominant position in the all-in-one PC market for some time now. The 2021 redesign of the iMac, powered by Apple\'s groundbreaking M3 chip, has comprehensively surpassed its competitors. For those seeking an all-in-one desktop PC, the iMac remains the sole compelling choice. The redesign has transformed the iMac from a simple computer into a mesmerizing device. With the introduction of the latest M3 processors, iMacs are more powerful than ever.\r\nSupercharged with M3: The new iMacs are now supercharged with the M3 chip, making it one of the most powerful all-in-one computers on the market. Apple Silicone\'s integration of processor, graphics, memory, and more onto a single chip maximizes the performance within a sleek, ultra-thin design.', 213999.00, 10, 'products/sSijOsEr7PxCvSGxDCninV1VQR73hmbW4viki6xS.jpg', '2024-11-08 18:28:49', '2024-11-08 18:30:39'),
(23, 'mac-air-m1', 'MacBook Air 13\" M1 Chip 8/256GB', 'Apple 13\" MacBook Air (2020) M1 Features, 2024 Updated Pricing & Availability in Bangladesh\r\nDominate your daily tasks with the Apple MacBook Air a premium yet portable powerhouse. Engineered with the revolutionary M1 chip, this Air delivers incredible speed, stunning visuals, and exceptional efficiency, making it perfect for students, professionals, and creators alike. Let\'s explore what makes this model tick and uncover its availability and pricing in Bangladesh.', 109999.00, 12, 'products/3gOR21NuoYNnkgXExg26UOvnKoJuRbKrpzLwVDFq.jpg', '2024-11-08 18:32:01', '2024-11-08 18:32:01'),
(24, 'mac-air-m3-16', 'MacBook Pro 16\" M3 Pro Chip 18/512GB Silver', 'MacBook Pro 16\" M3 Pro Chip 18/512GB Silver (12C CPU 18C GPU)\r\nMacBook Pro 16\" M3 Pro Chip 18/512GB Silver Experience unmatched performance and versatility. Equipped with Apple’s powerful M3 Pro chip, a 12-core CPU, and an 18-core GPU, this MacBook Pro is built for professionals who demand superior computing power. Whether you\'re working on complex video editing, 3D rendering, or handling intensive multitasking, the MacBook Pro 16\" provides the performance and efficiency to handle it all. The stunning 16.2-inch Liquid Retina display brings your projects to life with incredible color accuracy and brightness, making it perfect for creative professionals and power users alike.', 319999.00, 12, 'products/PrLeVUWcD1PkJ8sIkh4WtkGela6M3fhpXYVVG7ao.jpg', '2024-11-08 18:34:06', '2024-11-08 18:34:06'),
(25, 'mac-mini-m2', 'Apple Mac mini 2023 M2 Chip', 'MacBook Pro 14\" M3 Pro 18/512GB Space Black (11C CPU 14C GPU) combines cutting-edge performance with a sleek design. Powered by Apple\'s advanced M3 Pro chip, featuring an 11-core CPU and a 14-core GPU, this MacBook Pro is built to handle demanding tasks with ease. Whether you’re editing high-resolution videos, running complex applications, or simply multitasking, this device offers incredible speed and efficiency.', 84999.00, 13, 'products/20qhr79A0T41tfo6v5djaB7EYQlBVxW6pB1dSlYF.jpg', '2024-11-08 18:37:00', '2024-11-08 18:37:00'),
(26, 'mac-pro-m2-16', 'MacBook Pro 16\" M2 Max Chip 32/1TB Space Gray', 'MacBook Pro 16\" M2 Max Chip 32/1TB Space Gray (12C CPU 38C GPU)\r\nMacBook Pro 16\" M2 Max Chip is a powerhouse designed for professionals who demand top performance, immersive display quality, and reliable battery life. Packed with Apple\'s latest M2 Max Chip, a vibrant Liquid Retina XDR display, and unmatched audio quality, this MacBook Pro redefines what a laptop can do. Discover why it\'s a must-have for creators, developers, and business professionals.', 404999.00, 13, 'products/aDidZj4kTnu9pG8Y6552nMx7np3oDczHBIjQypPv.jpg', '2024-11-08 18:38:54', '2024-11-08 18:38:54'),
(27, 'mac-pro-m1-13', 'MacBook Pro 13\" M1 Chip 8/256GB Space Gray', 'MacBook Pro 13\" M1 Chip 8/256GB Space Gray\r\nThe MacBook Pro 13\" M1 Chip is a powerful, portable, and sleek laptop designed for both professionals and casual users. Featuring Apple’s revolutionary M1 chip, it delivers incredible performance, exceptional battery life, and an immersive Retina display, all in a lightweight and compact form. Whether you\'re a student, creative professional, or business user, this MacBook Pro is equipped to handle your everyday tasks with ease and efficiency.', 127990.00, 12, 'products/KZpPmtoHRIo6wLgshAM55KKFeDzcCHpo1YjI3TK8.jpg', '2024-11-08 18:40:34', '2024-11-08 18:40:34'),
(28, 'ipad-pro-m4-11', 'iPad Pro 11\" WiFi M4 Chip 256GB Space Black with Standard Glass', 'iPad Pro 11\" WiFi M4 Chip 256GB Space Black with Standard Glass\r\nThe iPad Pro 11\" with the groundbreaking M4 chip, designed to unleash creativity and productivity like never before. With an Ultra Retina XDR display, exceptional performance, and industry-leading features, the iPad Pro 11\" is perfect for designers, artists, professionals, and students alike. Experience true versatility with the latest iPadOS 18, delivering powerful capabilities in a sleek, portable device.', 136999.00, 12, 'products/sEuKunE3eL36UjjK8zWL0Y6ehag5kpZiKNHDOUpv.jpg', '2024-11-08 18:43:42', '2024-11-08 18:43:42'),
(29, 'ipad-air-m2-13', 'iPad Air 13\" WiFi M2 Chip', 'Specification\r\nSize and Weight	Wi-Fi models 1.36 pounds (617 grams)\r\nDisplay	Liquid Retina display LED backlit Multi‑Touch display with IPS technology 2732-by-2048-pixel resolution at 264 ppi Wide color (P3) True Tone Fingerprint-resistant oleophobic coating Fully laminated Antireflective coating 600 nits brightness Supports Apple Pencil Pro Supports Apple Pencil (USB‑C) Apple Pencil hover\r\nChip	M2\r\nMedia Engine	Hardware-accelerated H.264 and HEVC Video decode engine Video encode engine\r\nCamera	12MP Wide camera, ƒ/1.8 aperture Digital zoom up to 5x Five-element lens Autofocus with Focus Pixels Panorama (up to 63MP) Smart HDR 4 Wide color capture for photos and Live Photos Photo geotagging Auto image stabilization Burst mode Image formats captured: HEIF and JPEG', 109999.00, 12, 'products/EDDXrxXaX42H9pDm3YGyW9NPsIP8Ieyzb0AAEZNj.jpg', '2024-11-08 18:45:41', '2024-11-08 18:45:41'),
(30, 'ipad-9th-64', 'iPad 9th Generation WiFi 64GB Space Gray', 'iPad 2021 9th generation WiFi\r\nThe iPad (9th Generation) WiFi is a versatile and user-friendly device, ideal for students, families, and anyone who needs a high-quality tablet at an affordable price. Powered by the A13 Bionic chip, this iPad delivers fast performance, a stunning Retina display, and a suite of essential features for work, learning, and entertainment. Whether you\'re streaming, video calling, or exploring creative apps, the iPad (9th Gen) offers the power and reliability you need to stay connected and productive.', 39999.00, 3, 'products/osJx3LVdUeDaxbq6JuVU13OZQCearBJBIhwKNUfo.jpg', '2024-11-08 18:47:26', '2024-11-08 18:47:26'),
(31, 'ipad-pro-m4-13', 'iPad Pro 13\" WiFi+Cellular M4 Chip', 'Wi-Fi + Cellular models	Up to 9 hours of surfing the web using cellular data network\r\nSize	width 8.48 inches (215.5 mm) height 11.09 inches (281.6 mm) depth 0.20 inch (5.1 mm)\r\nChip	M4\r\nCPU	9-core CPU with 3 performance cores and 6 efficiency cores\r\nGPU	10-core GPU, Hardware-accelerated ray tracing 16-core Neural Engine\r\nCamera	12MP Wide camera, ƒ/1.8 aperture Digital zoom up to 5x Five‑element lens Adaptive True Tone flash Panorama (up to 63MP) Sapphire crystal lens cover Autofocus with Focus Pixels Smart HDR 4 Wide color capture for photos and Live Photos Advanced red-eye correction Photo geotagging Auto image stabilization Burst mode Image formats captured: HEIF and JPEG', 199999.00, 7, 'products/SMEHCUoTEBGHoaYCY4PRFNvLzsyLnovIjYAeZIR3.jpg', '2024-11-08 18:49:21', '2024-11-08 18:49:21'),
(33, 'mac-air-m3-starlight', 'MacBook Air M3 Chip 15\" 8/256GB Starlight (8C CPU 10C GPU)', 'MacBook Air M3 Chip 15\" 8/256GB Starlight\r\nThe MacBook Air M3 Chip 15\" 8/256GB Starlight with the powerful Apple M3 chip is built to elevate your work and play. This ultraportable laptop combines high-end performance, stunning visuals, and advanced functionality—all in a super-lightweight package. Perfect for students, professionals, and creatives, the MacBook Air with the M3 chip brings Apple’s cutting-edge technology to your fingertips. With a sleek design, lasting battery life, and rich media capabilities, this MacBook redefines productivity and entertainment on the go.', 164999.00, 7, 'products/8y0ivnk1HEQylV5gSEfhqGwrSizUWzj6d2zwseQS.jpg', '2024-11-08 19:23:15', '2024-11-08 19:23:15'),
(34, 'mac-pro-m3-max', 'MacBook Pro 16\" M3 Max Chip 48/1TB Space Black (16C CPU 40C GPU)', 'MacBook Pro 16\" M3 Max Chip 48/1TB Space Black (16C CPU 40C GPU)\r\nMacBook Pro 16\" M3 Max Chip is the ultimate laptop for power users who demand extreme performance. Equipped with a 16-core CPU, 40-core GPU, and 48GB of unified memory, this MacBook Pro is designed to handle the most intensive tasks with ease, whether it\'s video editing, 3D rendering, or machine learning. Finished in sleek Space Black, this model offers a blend of elegance and raw power, making it the perfect tool for professionals and creatives alike.', 549999.00, 13, 'products/XCi7gjrd1YGiWV3L3nUVI6G0IfhZWvJykqH5usjz.jpg', '2024-11-08 19:26:19', '2024-11-08 19:26:19'),
(35, 'mac-air-m2-silver', 'MacBook Air 13\" M2 Chip 8/256GB Silver', 'MacBook Air 13\" M2 Chip 8/256GB Silver\r\nThe new Apple MacBook Air 13\" M2 Chip 8/256GB Silver is a marvel of design and technology, bringing cutting-edge performance and unmatched portability to meet the needs of students, professionals, and creatives alike. Built to deliver high-speed performance while remaining incredibly light, the MacBook Air 13” M2 Chip is the ultimate laptop for anyone on the go.', 124999.00, 5, 'products/aNAiPcQzL1psMwkVtuCcDp7LchU8941izpdby6mW.jpg', '2024-11-08 19:29:27', '2024-11-08 19:29:27'),
(36, 'mac-pro-m3-silver', 'MacBook Pro 16\" M3 Pro Chip 18/512GB Silver (12C CPU 18C GPU)', 'MacBook Pro 16\" M3 Pro Chip 18/512GB Silver (12C CPU 18C GPU)\r\nMacBook Pro 16\" M3 Pro Chip 18/512GB Silver Experience unmatched performance and versatility. Equipped with Apple’s powerful M3 Pro chip, a 12-core CPU, and an 18-core GPU, this MacBook Pro is built for professionals who demand superior computing power. Whether you\'re working on complex video editing, 3D rendering, or handling intensive multitasking, the MacBook Pro 16\" provides the performance and efficiency to handle it all. The stunning 16.2-inch Liquid Retina display brings your projects to life with incredible color accuracy and brightness, making it perfect for creative professionals and power users alike.', 319999.00, 9, 'products/wtiFiczUI1mGSAPjZJwiJAhUN3hazpXoM1AIEBtf.jpg', '2024-11-08 19:32:34', '2024-11-08 19:32:34'),
(37, 'mac-pro-m3-1tb', 'MacBook Pro 16\" M3 Max Chip 36/1TB Sliver (14C CPU 30C GPU)', 'MacBook Pro 16\" M3 Max Chip 36/1TB Sliver (14C CPU 30C GPU)\r\nMacBook Pro 16\" M3 Max Chip 36/1TB Sliver (14C CPU 30C GPU) is the ultimate laptop for power users who demand extreme performance. Equipped with a 16-core CPU, 40-core GPU, and 48GB of unified memory, this MacBook Pro is designed to handle the most intensive tasks with ease, whether it\'s video editing, 3D rendering, or machine learning. Finished in sleek Space Black, this model offers a blend of elegance and raw power, making it the perfect tool for professionals and creatives alike.', 479999.00, 2, 'products/oMRwuwIaC1raIJ2Xn9QNcygc3dbxBoBfygqKP1dn.jpg', '2024-11-08 19:33:44', '2024-11-08 19:33:44'),
(38, 'mac-pro-m1-max-gray', 'MacBook Pro 16\" M1 Max Chip 64/2TB Space Gray', 'MacBook Pro 16\" M1 Max Chip 64/2TB Space Gray\r\nThe MacBook Pro 16\" M1 Max Chip is the powerhouse you\'ve been waiting for. Built for professionals who need ultimate performance, it combines Apple\'s most advanced M1 Max chip, 64GB of RAM, and 2TB of SSD storage to tackle the most demanding tasks with ease. Whether you\'re a video editor, 3D designer, or software developer, this MacBook Pro is designed to deliver uncompromised speed and efficiency, along with a stunning 16.2-inch Liquid Retina XDR display.', 399999.00, 7, 'products/XV0pXW938z5TXp5iHwQwz0JyOGbHkMqw54rJYy3O.jpg', '2024-11-08 19:36:31', '2024-11-08 19:36:31'),
(39, 'mac-pro-m2-gray', 'MacBook Pro 13\" M2 Chip 16/1TB Space Gray', 'MacBook Pro 13\" M2 Chip 16/1TB Space Gray\r\nThe MacBook Pro 13\" M2 Chip 16/1TB Space Gray is crafted for those who demand a portable yet powerful solution. With Apple\'s latest M2 chip, 16GB of RAM, and a 1TB SSD, this laptop delivers a seamless experience for work, creative projects, and more. Whether you\'re multitasking, editing videos, or designing, the MacBook Pro 13\" offers everything you need to excel.', 249999.00, 8, 'products/99rO2M0JodcyY7kmucZXED8tVgD1Vg2pCljwrTUC.jpg', '2024-11-08 19:39:11', '2024-11-08 19:39:11'),
(40, 'mac-pro-m2-32', 'MacBook Pro 14\" M2 Max Chip 32/1TB Space Gray (12C CPU 30C GPU)', 'MacBook Pro 14\" M2 Max Chip 32/1TB Space Gray (12C CPU 30C GPU)\r\nThe MacBook Pro 14\" M2 Max Chip brings unparalleled power, performance, and stunning visuals in a portable design. With Apple’s latest M2 Max chip featuring a 12-core CPU and a 30-core GPU, this laptop is built to handle even the most demanding professional tasks with ease. Whether you\'re a video editor, graphic designer, or software developer, the 32GB RAM and 1TB SSD storage ensure lightning-fast performance and ample space for your projects. The 14.2-inch Liquid Retina XDR display takes visuals to a whole new level, making it the perfect companion for creative professionals in need of top-tier performance.', 409000.00, 8, 'products/KDz9ioiqC1OneMejZ2R56dTstV3falG3rh25sNSB.jpg', '2024-11-08 19:42:06', '2024-11-08 19:42:06'),
(41, 'mac-air-m2-midnight', 'MacBook Air 13\" M2 Chip 8/512GB Midnight', 'MacBook Air 13\" M2 Chip 8/512GB Midnight\r\nThe new Apple MacBook Air 13\" M2 Chip 8/512GB Midnight is a marvel of design and technology, bringing cutting-edge performance and unmatched portability to meet the needs of students, professionals, and creatives alike. Built to deliver high-speed performance while remaining incredibly light, the MacBook Air 13” M2 Chip is the ultimate laptop for anyone on the go.', 159999.00, 13, 'products/YXkNEHQMeS0T2qfkSjinWz3cQq8aMGG9bol0tN4F.jpg', '2024-11-08 19:46:07', '2024-11-08 19:46:07'),
(42, 'mac-pro-m3-black', 'MacBook Pro 14\" M3 Max Chip 36/1TB Space Black', 'MacBook Pro 14\" M3 Max Chip 36/1TB Space Black (14C CPU 30C GPU)\r\nIntroducing the MacBook Pro 14\" M3 Max Chip 36/1TB in Space Black — a powerhouse for professionals who demand top-tier performance. With its cutting-edge 14-core CPU, 30-core GPU, and an impressive 36GB of unified memory, this laptop delivers unmatched speed and efficiency. Whether you\'re editing high-resolution videos, creating 3D graphics, or multitasking across demanding applications, the MacBook Pro M3 Max ensures everything runs seamlessly. It’s designed for creators, developers, and innovators who need power without compromise.', 459999.00, 11, 'products/WdF4mAsPz3ywTSk0xB87aaeivzqUC3JEZ6OWOvEz.jpg', '2024-11-08 19:49:27', '2024-11-08 19:49:27');

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('QxObkzFdOCtQiOZ4NvJgxeuW4BXkifOmctGtkad0', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicmJ1azF3N2lhc0JLeTZxbGJCV09zTDlTclVqMDVtU0Y0eUJLOEJ5eSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wcm9kdWN0cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1731095530);



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;