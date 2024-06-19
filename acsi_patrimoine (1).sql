-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 19 juin 2024 à 23:14
-- Version du serveur : 8.2.0
-- Version de PHP : 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `acsi_patrimoine`
--

-- --------------------------------------------------------

--
-- Structure de la table `biens`
--

DROP TABLE IF EXISTS `biens`;
CREATE TABLE IF NOT EXISTS `biens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `date_acquisition` date DEFAULT NULL,
  `categorie` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `quantite_stock` int DEFAULT NULL,
  `etat` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'actif',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `biens`
--

INSERT INTO `biens` (`id`, `nom`, `description`, `date_acquisition`, `categorie`, `created_at`, `updated_at`, `quantite_stock`, `etat`, `deleted_at`) VALUES
(13, 'Tasse', 'Joilies', '2024-06-20', 'Immobilier', '2024-06-19 21:13:27', '2024-06-19 21:13:34', 41, 'supprimé', '2024-06-19 21:13:34'),
(12, 'Ordinateur', 'Très performant', '2024-06-20', 'Machine', '2024-06-19 21:11:37', '2024-06-19 21:12:50', 47, 'supprimé', '2024-06-19 21:12:50');

-- --------------------------------------------------------

--
-- Structure de la table `cache`
--

DROP TABLE IF EXISTS `cache`;
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `commandes`
--

DROP TABLE IF EXISTS `commandes`;
CREATE TABLE IF NOT EXISTS `commandes` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `fournisseur_id` bigint UNSIGNED NOT NULL,
  `date_commande` date NOT NULL,
  `details` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `commandes_fournisseur_id_foreign` (`fournisseur_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `contrats`
--

DROP TABLE IF EXISTS `contrats`;
CREATE TABLE IF NOT EXISTS `contrats` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `details` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `entres`
--

DROP TABLE IF EXISTS `entres`;
CREATE TABLE IF NOT EXISTS `entres` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fournisseur_id` int DEFAULT NULL,
  `bien_id` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `quantite` int NOT NULL DEFAULT '0',
  `prix_total` decimal(10,0) DEFAULT NULL,
  `date_acquisition` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `entres`
--

INSERT INTO `entres` (`id`, `fournisseur_id`, `bien_id`, `created_at`, `updated_at`, `quantite`, `prix_total`, `date_acquisition`) VALUES
(22, 3, 1, '2024-06-18 15:51:14', '2024-06-18 15:51:14', 20, 20000, '2024-06-18');

-- --------------------------------------------------------

--
-- Structure de la table `etats_localisations_biens`
--

DROP TABLE IF EXISTS `etats_localisations_biens`;
CREATE TABLE IF NOT EXISTS `etats_localisations_biens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `bien_id` bigint UNSIGNED NOT NULL,
  `etat` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `localisation` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `etats_localisations_biens_bien_id_foreign` (`bien_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `fournisseurs`
--

DROP TABLE IF EXISTS `fournisseurs`;
CREATE TABLE IF NOT EXISTS `fournisseurs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `adresse` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `telephone` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `fournisseurs`
--

INSERT INTO `fournisseurs` (`id`, `nom`, `adresse`, `telephone`, `email`, `created_at`, `updated_at`) VALUES
(1, 'Croix du Sud', 'Pointe-Noire Congo', '242055417429', 'pharma_sud@yahoo.fr', '2024-06-19 11:32:46', '2024-06-19 11:37:35'),
(17, 'Burotop Iris', 'Pointe-Noire Congo', '242056056056', 'pnr@burotopiris.com', '2024-06-19 11:37:19', '2024-06-19 11:37:19');

-- --------------------------------------------------------

--
-- Structure de la table `historique_biens`
--

DROP TABLE IF EXISTS `historique_biens`;
CREATE TABLE IF NOT EXISTS `historique_biens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `entre_id` bigint UNSIGNED DEFAULT NULL,
  `action` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Achat',
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `historique_biens_bien_id_foreign` (`entre_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `historique_biens`
--

INSERT INTO `historique_biens` (`id`, `entre_id`, `action`, `description`, `created_at`, `updated_at`) VALUES
(6, 1, 'Achat', 'Fournisseur : Mabiala alain, Date de livraison : 2024-06-18', '2024-06-18 15:51:14', '2024-06-18 15:51:14');

-- --------------------------------------------------------

--
-- Structure de la table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `options` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `livraisons`
--

DROP TABLE IF EXISTS `livraisons`;
CREATE TABLE IF NOT EXISTS `livraisons` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `commande_id` bigint UNSIGNED NOT NULL,
  `date_livraison` date NOT NULL,
  `details` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `livraisons_commande_id_foreign` (`commande_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_06_17_231526_create_biens_table', 1),
(5, '2024_06_17_231536_create_historique_biens_table', 1),
(6, '2024_06_17_231550_create_etats_localisations_biens_table', 1),
(7, '2024_06_17_231609_create_commandes_table', 1),
(8, '2024_06_17_231622_create_livraisons_table', 1),
(9, '2024_06_17_231632_create_contrats_table', 1),
(10, '2024_06_17_231644_create_fournisseurs_table', 1),
(11, '2024_06_17_231654_create_relations_fournisseurs_table', 1),
(12, '2024_06_17_231707_create_stocks_table', 1),
(13, '2024_06_19_220654_add_attribute_to_biens_table', 2),
(14, '2024_06_19_221614_add_attribute_to_biens_table', 3);

-- --------------------------------------------------------

--
-- Structure de la table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `relations_fournisseurs`
--

DROP TABLE IF EXISTS `relations_fournisseurs`;
CREATE TABLE IF NOT EXISTS `relations_fournisseurs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `fournisseur_id` bigint UNSIGNED NOT NULL,
  `relation` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `relations_fournisseurs_fournisseur_id_foreign` (`fournisseur_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `payload` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('IpwVBr9hvDvzMSPd17dunBra0MH9zsABvOVwhgxp', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYll3bDI2WkFTcUZQck1rTXNTMmVoQjQ4ejlLMG1yNEgzY3h6bHZZNiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1718834410),
('0tnd4ahAXXM2EXxCq3p4w9wZbx6XyNljCe9lSxTY', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUU8xQWpRZ3dhMVBaVnlmQ3BjbHBSdlladndIdHlTQ2JrVk13RkxEWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1718834760),
('rlYJVqYsLhUimgHaxeJnI29bqcqBCfYmCtLGtvMb', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36 Edg/126.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidUxHd2s4QVl5aFdERVJaMzdnMGNTMEhWNWd0eTN6TFpOeFpBZHdTdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9oaXN0b3JpcXVlcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1718838816),
('QPqqx7m9aZy6cQHjAODTcu6icOJM7U9hGneiV9DF', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQW1BUXlOOGhCbUVQZnVpVUwxeVdRZmdmeHY0S1A0Vjhmdjh4bkVjNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1718832774),
('hHRvpoGVqTKQq9TvPMfpno3dO4JYnK33xlFdYas8', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVFhFUHNZVFk0Y3dmMEZaU0tvNU95UmxGRUltbXlNSzR3MEcwRXFOQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1718832819),
('lTFzrVl3vTOZFSlqDZ4KBwQPKO9Hep5qLUeHzQOI', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia3BqcTlHWVBTYTYxUDJOZ2pBdmNpMzdDeEtZTHFiN1pBY0N5cVd3YiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1718832830),
('JHIfSdBY1nup6Dg9UrtRSfjfJVQKA4dSvAJMxXNk', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZmxvMXJjU1hSQ0JTOXBiM3dpNUZpd0hRTU1kT2hyeFhUdUpldjZIbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1718832864),
('L62k1Pq9umv20xaLHZMr7pR7RC16g3JTofG2tuxh', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicUJ6cVl3dFlab0ZzOFA1TjZpS1d0dFRDZHBLZWZJR2x2Y1M0NDNUViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1718832867),
('YTHobksG6SMfrN3UUknNwPIuvpdkfFJcwn5xLX3P', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ2RBSDlhVFoxaXNkWjh0SG1NZkczMnpmNE8wTTQxUGpMbjh6NHdocSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1718832928),
('PKsZf75DlYZW5p6rW5Id49lyPEOzB4CaquddA5ql', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicFB5dkFIdmpXSUg5OUZiZThTWWFWU3B2eHhoNEFuN0l5VEZvSXgxdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1718833018),
('ZlnAqay5t2KPjC9NXY3uoWblOh3MmjsEjanMgmfJ', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSlRmV0dMd1hzanBjQTNPNExrOEl4TkNPS25vSW02SGI4Um5pNVg5cSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1718833061),
('nD4R0nMQf7EFVHuds0H0fG2Gqtypl85I7eojoxW0', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV040ZmlHNmZmeGN6UFQzZEROWnZORjZBNnNhQ1BIRVpFdEc4cVl0RyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1718833079),
('E0Mv9u8kA04LZAvP1cSdwjpdG75gIZZFsC52i1vk', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUGxVQU9VZ0I3NVc3VkE5akVORTVoRXUzRW5PWjA4TGo1TlMyMnhqbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1718833091),
('5tIqLNwAKAIvAM70kJPDTaJPDTMXx7NaT1Hi6MpU', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRkNsZEppZlZjemM5TFNaTmZQc0lWc3lWendXeTd5b3hvdjlEcmNNbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1718833128),
('sJNhmLYgtOkeNFSpE8qAVj8ERZj5kqTZtfuBEGyp', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieGRvRnJoeTVHMUFSV2JJNHhFUU16WkFocG1uVTFlVWZWck9hRDFhYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1718833234),
('ubgsDu2xFNHOxWoaEyp2x2o0uD9fgia4976cDvjO', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicEpjYk1DS2ppS3VKQ0swaUV3V0FocDUzSHJ4bEFCTjBmV3ZnbTVLciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1718833316),
('Xtu1IJcE8KZK8JhLjWa4cPqeldCyULSOXjFokytx', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibjhCc0xwN2p5emI2MktUMlNyOThROFhMVjNRMFN3dVVZVVFxZkFpZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1718833370),
('Z0NweG0enrGYmUER1GMjpf9Y7XKqNuj9URN1bbOh', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia1BQNjg1V0I0QkZ4NkF1ZFZqckRqV3pybmI3aTluOUVIb2dsa1FjbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1718833457),
('sbwFLVkUGLTYgjs6REXDVt5L1O2jILtGvyjhw1KW', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR01oTHV1cXVod2ZOY210U2RTeXJ3YkY1Q3Q3ak0xUE5IY09Hb2FWMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1718833468),
('tfA5N58ttauYjga7Mi8XhofhEOMdeIder0S8sGmd', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia3hyMVZxOXN5Uk9GVktkbkxSVHBoMkQ3QnMzSDhvbEQyVHVUZW9HNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1718834781),
('LBJgjxmrFsyQwb0Sq1iBFSRLqBUTyqWqfq5mECD1', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUm44S1plSFI1cXRDeHYzOHpSTWl1TDlSMXlNVFFsOGxJWlJBdFVjVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1718835292),
('yBrX31INfOUwYQj2F7hKcDaecHZtuPPqvkY0IqGh', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUXRpYkdDeGlFY2ZSdG80YnQwRURKeE5lOElhRVZlOEt1dDZCMlpZeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1718835307),
('OdhqcqMbd2tJYjXqq1YtF7EfdNzMQ799SFuTuzjq', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibHhJMjJrU2FsSVNJZG1CcjhwclFoVUhnN2puTmtJdEdaaGtNbU1USSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1718835333),
('KxAw0fLAcx3KMd6pjuIgL0br34a959o4bNJtxiQq', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZWJzUmQ3S3VOeXdGU3BYeVNpS1JLdEtsUlh3WHlYVEZpcVBkbXg3ViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1718835450),
('DrqT7kcv873Plkn0zbdaSzHYwzy1XRp8WhLm95G3', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicVB4TnZqcE9IVDBZQjZSakhyMGJkdFJEWEsxNzJGZ3pFNExDNUQ2ZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1718835509),
('1aH9LzNE2YJSKMu708VfWQJibp38YmiJhkQWJJiX', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibVR2SHVGMmVpcUlOVm1IWndvUWxkSnZFa0plNlY4a2IwRGw5M2lEdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1718836251),
('BgoQxw5gzMP319AaX2nNS1LoZq1jhcvIYHtPhmi1', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQUxIWEF6TERPT3EzRzRRQnp5NDBFRlJSYVpGblpKUzFBamRtaXRjMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1718836264),
('zgoC2KTEXMSZ5V1DQ7sjByEpaOGsNi6chYpe4397', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVm53TnVwZjZza0V0QmlWTmxRWjg0R09RdVpqekV0MlFPRmVDTWpudCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1718837031),
('zrlibct28NUF6YyPHASLwcI9qcBFbwfrxsYiZuav', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSGh4czhNdTVqN1pSbnB2TzM5a0ZQOWJsNGJsZUFtT2UxYUQ2SjJBNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1718838277),
('lCiIa0DlfFpu87lB7VPcQUHbDJDDBHDEbOw8UCff', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV1dyMHJOSHp5YXVKN3k1UWVRVlFNUE5VWjJPeEJPdFdiMTQ3TkZqZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1718838283),
('Zx6N9hBPFcDmnsYprfGz8abLkqOxKQYyAgi613Uu', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiektMaUVtWndERFk0QVY2ZkdPVHIyeklHYkkyR3QzQkIxUDZRWWtpZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1718838463),
('Sd1ZbByk2Q5rn947oXLokeszfEgBxs0j2V4rrtHV', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ1RZTGV1aU55bkpOS1E3cmRvN0xyZHdKQ2k3bmRyeDFQc2tEZ3RxcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1718838466),
('597KJ7YrxRNcn3uvWX2GAkRI26ewzKZ5QOdrM2ZA', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNGIxM0xYcEFSaDJjRXR6UUVIMzFWeURhclFpMEd4UmdpdmlydWtHQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1718838751),
('SFvaax0xhsKndHT6yBvrbtyEdS1xuh5fkiUaZmgC', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic3RHYjlNMm1qRTcwMHpYUURCb3N5TVFxQUx0TmgxYmRnT2xMV3o1eSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1718838756),
('4c1qn6SYa9SKdkAR4v1YPVfVEJbNzVZsy0u52WoW', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNEFpd09yVGlIcVhWVnZ3MUxaUUNGV2s2ZmtzQVdHUHpzZzlSUmw0WSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1718838760);

-- --------------------------------------------------------

--
-- Structure de la table `stocks`
--

DROP TABLE IF EXISTS `stocks`;
CREATE TABLE IF NOT EXISTS `stocks` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `bien_id` bigint UNSIGNED NOT NULL,
  `quantite` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stocks_bien_id_foreign` (`bien_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
