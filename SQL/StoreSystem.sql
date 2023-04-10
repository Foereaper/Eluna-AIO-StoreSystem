-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.3.0.6589
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table store.store_categories
CREATE TABLE IF NOT EXISTS `store_categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(765) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `icon` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `requiredRank` int DEFAULT NULL,
  `flags` int unsigned NOT NULL DEFAULT '0',
  `enabled` int unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table store.store_categories: ~9 rows (approximately)
INSERT INTO `store_categories` (`id`, `name`, `icon`, `requiredRank`, `flags`, `enabled`) VALUES
	(1, 'Featured', 'inv_helmet_96', 0, 2, 1),
	(2, 'Titles', 'inv_scroll_11', 0, 0, 1),
	(3, 'Items', 'ability_warrior_challange', 0, 0, 1),
	(4, 'Mounts & Pets', 'inv_box_petcarrier_01', 0, 0, 1),
	(5, 'Boosts', 'spell_holy_surgeoflight', 0, 0, 1),
	(6, 'Services', 'vas_charactertransfer', 0, 0, 1),
	(7, 'Buffs', 'spell_holy_holynova', 0, 0, 1),
	(8, 'Outlet', 'inv_misc_toy_07', 0, 1, 1),
	(9, 'VIP', 'inv_misc_note_03', 4, 0, 1);

-- Dumping structure for table store.store_category_service_link
CREATE TABLE IF NOT EXISTS `store_category_service_link` (
  `category` int unsigned NOT NULL,
  `service` int unsigned NOT NULL,
  PRIMARY KEY (`category`,`service`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table store.store_category_service_link: ~14 rows (approximately)
INSERT INTO `store_category_service_link` (`category`, `service`) VALUES
	(2, 16),
	(3, 5),
	(3, 12),
	(3, 18),
	(4, 8),
	(4, 13),
	(5, 1),
	(5, 14),
	(5, 17),
	(6, 2),
	(6, 3),
	(6, 4),
	(7, 15);

-- Dumping structure for table store.store_currencies
CREATE TABLE IF NOT EXISTS `store_currencies` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` int unsigned NOT NULL DEFAULT '1',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `data` int NOT NULL DEFAULT '0',
  `tooltip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table store.store_currencies: ~2 rows (approximately)
INSERT INTO `store_currencies` (`id`, `type`, `name`, `icon`, `data`, `tooltip`) VALUES
	(1, 1, 'Gold', 'Gold', 0, 'This is normal gold.'),
	(2, 2, 'Item Token', 'Token', 4540, 'This is an item currency.');

-- Dumping structure for table store.store_logs
CREATE TABLE IF NOT EXISTS `store_logs` (
  `account` int DEFAULT NULL,
  `guid` int DEFAULT NULL,
  `serviceId` int DEFAULT NULL,
  `currencyId` int DEFAULT NULL,
  `cost` int DEFAULT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table store.store_logs: ~29 rows (approximately)
INSERT INTO `store_logs` (`account`, `guid`, `serviceId`, `currencyId`, `cost`, `time`) VALUES
	(1, 1, 12, 1, 10, '2023-04-07 03:03:06'),
	(1, 1, 12, 1, 5, '2023-04-07 03:04:23'),
	(1, 1, 13, 1, 10, '2023-04-07 03:20:42'),
	(1, 1, 8, 1, 30, '2023-04-07 03:25:36'),
	(1, 1, 12, 2, 5, '2023-04-07 20:04:22'),
	(1, 1, 12, 2, 5, '2023-04-07 20:07:47'),
	(1, 1, 12, 2, 5, '2023-04-07 20:07:50'),
	(1, 1, 12, 2, 5, '2023-04-07 20:10:04'),
	(1, 1, 12, 2, 5, '2023-04-07 20:21:48'),
	(1, 1, 12, 2, 5, '2023-04-07 20:22:01'),
	(1, 1, 12, 2, 5, '2023-04-07 20:22:38'),
	(1, 1, 12, 2, 5, '2023-04-07 20:23:45'),
	(1, 1, 12, 2, 5, '2023-04-07 20:26:19'),
	(1, 1, 13, 1, 10, '2023-04-08 01:14:35'),
	(1, 1, 1, 1, 10, '2023-04-08 01:22:52'),
	(1, 1, 1, 1, 10, '2023-04-08 01:24:07'),
	(1, 1, 1, 1, 10, '2023-04-08 01:25:51'),
	(1, 1, 4, 1, 5, '2023-04-08 01:35:36'),
	(1, 1, 16, 1, 10, '2023-04-08 01:41:41'),
	(1, 1, 16, 1, 10, '2023-04-08 01:44:49'),
	(1, 1, 5, 1, 10, '2023-04-08 04:45:17'),
	(1, 1, 1, 1, 10, '2023-04-08 19:50:20'),
	(1, 1, 1, 1, 10, '2023-04-08 19:51:13'),
	(1, 1, 12, 1, 5, '2023-04-08 19:52:20'),
	(1, 1, 12, 1, 5, '2023-04-08 19:55:03'),
	(1, 1, 12, 1, 5, '2023-04-08 22:23:33'),
	(1, 1, 12, 1, 5, '2023-04-08 23:19:16'),
	(1, 1, 1, 1, 10, '2023-04-09 02:02:07'),
	(1, 1, 1, 2, 10, '2023-04-09 02:06:11'),
	(1, 1, 5, 1, 10, '2023-04-09 02:34:41'),
	(1, 1, 15, 1, 1, '2023-04-09 03:01:37'),
	(1, 1, 18, 1, 50, '2023-04-09 03:29:32');

-- Dumping structure for table store.store_services
CREATE TABLE IF NOT EXISTS `store_services` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` int unsigned DEFAULT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `tooltipName` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `tooltipType` varchar(765) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tooltipText` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `icon` varchar(765) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `price` int DEFAULT NULL,
  `currency` int DEFAULT NULL,
  `hyperlinkId` int DEFAULT NULL,
  `creatureEntry` int DEFAULT NULL,
  `discountAmount` int DEFAULT NULL,
  `flags` int DEFAULT NULL,
  `reward_1` int unsigned DEFAULT NULL,
  `reward_2` int unsigned DEFAULT NULL,
  `reward_3` int unsigned DEFAULT NULL,
  `reward_4` int unsigned DEFAULT NULL,
  `reward_5` int unsigned DEFAULT NULL,
  `reward_6` int unsigned DEFAULT NULL,
  `reward_7` int unsigned DEFAULT NULL,
  `reward_8` int unsigned DEFAULT NULL,
  `rewardcount_1` int unsigned DEFAULT NULL,
  `rewardcount_2` int unsigned DEFAULT NULL,
  `rewardcount_3` int unsigned DEFAULT NULL,
  `rewardcount_4` int unsigned DEFAULT NULL,
  `rewardcount_5` int unsigned DEFAULT NULL,
  `rewardcount_6` int unsigned DEFAULT NULL,
  `rewardcount_7` int unsigned DEFAULT NULL,
  `rewardcount_8` int unsigned DEFAULT NULL,
  `new` int unsigned NOT NULL DEFAULT '0',
  `enabled` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table store.store_services: ~13 rows (approximately)
INSERT INTO `store_services` (`id`, `type`, `name`, `tooltipName`, `tooltipType`, `tooltipText`, `icon`, `price`, `currency`, `hyperlinkId`, `creatureEntry`, `discountAmount`, `flags`, `reward_1`, `reward_2`, `reward_3`, `reward_4`, `reward_5`, `reward_6`, `reward_7`, `reward_8`, `rewardcount_1`, `rewardcount_2`, `rewardcount_3`, `rewardcount_4`, `rewardcount_5`, `rewardcount_6`, `rewardcount_7`, `rewardcount_8`, `new`, `enabled`) VALUES
	(1, 8, 'Level Boost\r\n+10 Levels', 'Level Boost', '', 'Increase your characters levels by 10.', 'achievement_level_10', 10, 2, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
	(2, 7, 'Faction Change', 'Faction Change', '', 'Allows you to change your characters faction. Available after relogging.', 'vas_factionchange', 5, 1, 0, 0, 0, 0, 64, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
	(3, 7, 'Race Change', 'Race Change', '', 'Allows you to change your characters race. Available after relogging.', 'vas_racechange', 10, 1, 0, 0, 5, 0, 128, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
	(4, 7, 'Name Change', 'Name Change', '', 'Allows you to change your characters name. Available after relogging.', 'vas_namechange', 5, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
	(5, 1, 'Foam Sword\r\n(Two-Hand Sword)', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_sword_22', 10, 1, 45061, 45061, 0, 1, 45061, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1),
	(8, 3, 'Swift Spectral Tiger\r\n(Mount)', '', 'spell', '|cff00FFFFClick to preview!|r', 'ability_mount_spectraltiger', 30, 1, 42777, 24004, 0, 0, 42777, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1),
	(12, 1, 'Epic Purple Shirt\r\n(Shirt)', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_shirt_purple_01', 10, 1, 45037, 45037, 5, 1, 45037, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1),
	(13, 4, 'Prairie Chicken\r\n(Pet)', '', 'spell', '|cff00FFFFClick to preview!|r', 'spell_magic_polymorphchicken', 10, 1, 10686, 7392, 0, 0, 10686, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
	(14, 8, 'Level Boost\r\n+20 Levels', 'Level Boost', '', 'Increase your characters levels by 20.', 'achievement_level_20', 20, 1, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
	(15, 5, 'Buff\r\nBlessing of Might', 'Buff', '', 'Buffs you with Blessing of Might.', 'spell_holy_fistofjustice', 1, 1, 0, 0, 0, 0, 27140, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
	(16, 9, 'Title\r\nChampion of the Naaru', 'Title', '', 'Gives you the title Champion of the Naaru.', 'inv_mace_51', 10, 1, 0, 0, 0, 0, 53, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1),
	(17, 8, 'Level 60 Boost', 'Level Boost', '', 'Boosts your characters level to level 60!', 'achievement_level_60', 40, 1, 0, 0, 0, 1, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
	(18, 1, 'Tuxedo Set', 'Tuxedo Set', '', 'Express your great fashion sense with this full Tuxedo set!\r\n\r\nContains the following:\r\n\r\n1x Tuxedo Jacket\r\n1x Tuxedo Shirt\r\n1x Tuxedo Pants', 'inv_shirt_black_01', 50, 1, 0, 0, 0, 1, 10036, 10035, 10034, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
