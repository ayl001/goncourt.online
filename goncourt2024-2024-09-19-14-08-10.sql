-- Adminer 4.7.8 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `auteur`;
CREATE TABLE `auteur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `surname` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `cv` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `editor`;
CREATE TABLE `editor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `Livre`;
CREATE TABLE `Livre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(50) NOT NULL,
  `id_auteur` int(11) NOT NULL,
  `digest` longtext,
  `editor_id` int(11) NOT NULL,
  `parution` date NOT NULL,
  `nb_pages` int(11) NOT NULL,
  `ISBN` bigint(20) NOT NULL,
  `prix` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_auteur` (`id_auteur`),
  KEY `editor_id` (`editor_id`),
  CONSTRAINT `livre_ibfk_1` FOREIGN KEY (`id_auteur`) REFERENCES `auteur` (`id`),
  CONSTRAINT `livre_ibfk_2` FOREIGN KEY (`editor_id`) REFERENCES `editor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `main_characters`;
CREATE TABLE `main_characters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_livre` int(11) NOT NULL,
  `personnage` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_livre` (`id_livre`),
  CONSTRAINT `main_characters_ibfk_1` FOREIGN KEY (`id_livre`) REFERENCES `Livre` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `selection`;
CREATE TABLE `selection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stage` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `selection_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `Livre` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- 2024-09-19 12:08:10
