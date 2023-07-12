-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 28 juin 2023 à 13:29
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : ` database_animal`
--

-- Base de données : ` database_animal`

-- Table `administateur`
CREATE TABLE IF NOT EXISTS `administateur` (
  `id_admin` int(11) NOT NULL AUTO_INCREMENT, -- Identifiant de l'administrateur (clé primaire)
  `email` varchar(50) DEFAULT NULL, -- Adresse email de l'administrateur
  `password` varchar(50) DEFAULT NULL, -- Mot de passe de l'administrateur
  PRIMARY KEY (`id_admin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Table `connexion`
CREATE TABLE IF NOT EXISTS `connexion` (
  `id_connexion` int(11) NOT NULL AUTO_INCREMENT, -- Identifiant de la connexion (clé primaire)
  `email` varchar(50) NOT NULL, -- Adresse email de connexion
  `password` varchar(20) NOT NULL, -- Mot de passe de connexion
  PRIMARY KEY (`id_connexion`),
  CONSTRAINT `connexion_ibfk_1` FOREIGN KEY (`id_connexion`) REFERENCES `inscription_client` (`id_inscription_client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Table `contactez`
CREATE TABLE IF NOT EXISTS `contactez` (
  `id_contactez` int(11) NOT NULL AUTO_INCREMENT, -- Identifiant du contact (clé primaire)
  `nom` varchar(50) DEFAULT NULL, -- Nom du contact
  `email` varchar(50) DEFAULT NULL, -- Adresse email du contact
  `telephone` varchar(15) DEFAULT NULL, -- Numéro de téléphone du contact
  `id_inscription_client` int(100) NOT NULL, -- Identifiant de l'inscription client (clé étrangère)
  PRIMARY KEY (`id_contactez`),
  CONSTRAINT `contactez_ibfk_1` FOREIGN KEY (`id_inscription_client`) REFERENCES `inscription_client` (`id_inscription_client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Table `inscription_client`
CREATE TABLE IF NOT EXISTS `inscription_client` (
  `id_inscription_client` int(11) NOT NULL AUTO_INCREMENT, -- Identifiant de l'inscription client (clé primaire)
  `nom` varchar(50) DEFAULT NULL, -- Nom du client
  `prenom` varchar(20) DEFAULT NULL, -- Prénom du client
  `email` varchar(80) DEFAULT NULL, -- Adresse email du client
  `password` varchar(80) DEFAULT NULL, -- Mot de passe du client
  `confirm_password` varchar(80) DEFAULT NULL, -- Confirmation du mot de passe du client
  PRIMARY KEY (`id_inscription_client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Table `inserer`
CREATE TABLE IF NOT EXISTS `inserer` (
  `id_connexion` int(100) NOT NULL, -- Identifiant de connexion (clé étrangère)
  `id_stockage_contenu` int(100) NOT NULL, -- Identifiant de stockage de contenu (clé étrangère)
  PRIMARY KEY (`id_connexion`, `id_stockage_contenu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Table `membre`
CREATE TABLE IF NOT EXISTS `membre` (
  `id_inscription_client` int(100) NOT NULL, -- Identifiant de l'inscription client (clé étrangère)
  `id_connexion` int(100) NOT NULL, -- Identifiant de la connexion (clé étrangère)
  PRIMARY KEY (`id_inscription_client`, `id_connexion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Table `stockage_contenu`
CREATE TABLE IF NOT EXISTS `stockage_contenu` (
  `id_stockage_contenu` int(11) NOT NULL AUTO_INCREMENT, -- Identifiant de stockage de contenu (clé primaire)
  `titre` varchar(50) DEFAULT NULL, -- Titre du contenu
  `contenu` varchar(2500) DEFAULT NULL, -- Contenu
  `date_de_creation` varchar(10) DEFAULT NULL, -- Date de création du contenu
  `modification` varchar(2500) DEFAULT NULL, -- Modification du contenu
  PRIMARY KEY (`id_stockage_contenu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Table `verifie_contenu`
CREATE TABLE IF NOT EXISTS `verifie_contenu` (
  `id_admin` int(100) NOT NULL, -- Identifiant de l'administrateur (clé étrangère)
  `id_stockage_contenu` int(100) NOT NULL, -- Identifiant de stockage de contenu (clé étrangère)
  PRIMARY KEY (`id_admin`, `id_stockage_contenu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
COMMIT;



--
-- Index pour les tables déchargées
--

--
-- Index pour la table `administateur`
--
ALTER TABLE `administateur`
  ADD PRIMARY KEY (`id_admin`);

--
-- Index pour la table `connexion`
--
ALTER TABLE `connexion`
  ADD PRIMARY KEY (`id_connexion`);

--
-- Index pour la table `contactez`
--
ALTER TABLE `contactez`
  ADD PRIMARY KEY (`id_contactez`);

--
-- Index pour la table `inscription_client`
--
ALTER TABLE `inscription_client`
  ADD PRIMARY KEY (`id_inscription_client`);

--
-- Index pour la table `stockage_contenu`
--
ALTER TABLE `stockage_contenu`
  ADD PRIMARY KEY (`id_stockage_contenu`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `connexion`
--
ALTER TABLE `connexion`
  ADD CONSTRAINT `connexion_ibfk_1` FOREIGN KEY (`id_connexion`) REFERENCES `inscription_client` (`id_inscription_client`);

--
-- Contraintes pour la table `inscription_client`
--
ALTER TABLE `inscription_client`
  ADD CONSTRAINT `inscription_client_ibfk_1` FOREIGN KEY (`id_inscription_client`) REFERENCES `contactez` (`id_contactez`);
COMMIT;


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
