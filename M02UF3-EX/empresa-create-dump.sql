-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: empresa
-- ------------------------------------------------------
-- Server version	8.0.36
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clients`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `codi_cli` int NOT NULL,
  `nom_cli` varchar(30) NOT NULL,
  `nif` char(9) DEFAULT NULL,
  `adreca` varchar(30) DEFAULT NULL,
  `ciutat` varchar(20) DEFAULT NULL,
  `telefon` char(9) DEFAULT NULL,
  PRIMARY KEY (`codi_cli`),
  UNIQUE KEY `nif` (`nif`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `departaments`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departaments` (
  `nom_dpt` varchar(20) NOT NULL,
  `ciutat_dpt` varchar(20) NOT NULL,
  `telefon` char(9) DEFAULT NULL,
  PRIMARY KEY (`nom_dpt`,`ciutat_dpt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `empleats`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleats` (
  `codi_empl` int NOT NULL,
  `nom_empl` varchar(20) DEFAULT NULL,
  `cognom_empl` varchar(20) DEFAULT NULL,
  `sou` double DEFAULT NULL,
  `nom_dpt` varchar(20) DEFAULT NULL,
  `ciutat_dpt` varchar(20) DEFAULT NULL,
  `num_proj` int DEFAULT NULL,
  PRIMARY KEY (`codi_empl`),
  KEY `nom_dpt` (`nom_dpt`,`ciutat_dpt`),
  KEY `num_proj` (`num_proj`),
  CONSTRAINT `empleats_ibfk_1` FOREIGN KEY (`nom_dpt`, `ciutat_dpt`) REFERENCES `departaments` (`nom_dpt`, `ciutat_dpt`),
  CONSTRAINT `empleats_ibfk_2` FOREIGN KEY (`num_proj`) REFERENCES `projectes` (`codi_proj`),
  CONSTRAINT `empleats_chk_1` CHECK ((`sou` > 12500))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projectes`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projectes` (
  `codi_proj` int NOT NULL,
  `nom_proj` char(20) DEFAULT NULL,
  `preu` double DEFAULT NULL,
  `data_inici` date DEFAULT NULL,
  `data_prev_fi` date DEFAULT NULL,
  `data_fi` date DEFAULT NULL,
  `codi_client` int DEFAULT NULL,
  PRIMARY KEY (`codi_proj`),
  KEY `codi_client` (`codi_client`),
  CONSTRAINT `projectes_ibfk_1` FOREIGN KEY (`codi_client`) REFERENCES `clients` (`codi_cli`),
  CONSTRAINT `projectes_chk_1` CHECK ((`data_inici` < `data_prev_fi`)),
  CONSTRAINT `projectes_chk_2` CHECK ((`data_inici` < `data_fi`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-22  9:02:07
