CREATE DATABASE IF NOT EXISTS `chk`;
USE `chk`;

DROP TABLE IF EXISTS `chk`;
CREATE TABLE `chk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` DATETIME DEFAULT current_timestamp,
  PRIMARY KEY (`id`)
);