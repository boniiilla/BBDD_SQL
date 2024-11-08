-- MySQL dump 10.13  Distrib 8.0.30, for Linux (x86_64)
--
-- Host: localhost    Database: starwars
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `affiliations`
--

DROP TABLE IF EXISTS `affiliations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `affiliations` (
  `id` int NOT NULL,
  `affiliation` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `affiliations`
--

LOCK TABLES `affiliations` WRITE;
/*!40000 ALTER TABLE `affiliations` DISABLE KEYS */;
INSERT INTO `affiliations` VALUES (0,'Without Affiliation'),(1,'Jedi Order'),(2,'Rebel Alliance'),(3,'Galactic Republic'),(4,'Galactic Empire'),(5,'Sith'),(6,'Galactic Senate'),(7,'Alderaan Royal Family'),(8,'Confederacy Independent Systems'),(9,'Trade Federation'),(10,'Gungan Grand Army'),(11,'Naboo Royal Space Fighter Corps'),(12,'Naboo Royal Guards'),(13,'Techno Union');
/*!40000 ALTER TABLE `affiliations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deaths`
--

DROP TABLE IF EXISTS `deaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deaths` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_people` int DEFAULT NULL,
  `id_killer` int DEFAULT NULL,
  `id_film` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_people` (`id_people`),
  KEY `id_killer` (`id_killer`),
  KEY `id_film` (`id_film`),
  CONSTRAINT `deaths_ibfk_1` FOREIGN KEY (`id_people`) REFERENCES `people` (`id`),
  CONSTRAINT `deaths_ibfk_2` FOREIGN KEY (`id_killer`) REFERENCES `people` (`id`),
  CONSTRAINT `deaths_ibfk_3` FOREIGN KEY (`id_film`) REFERENCES `films` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deaths`
--

LOCK TABLES `deaths` WRITE;
/*!40000 ALTER TABLE `deaths` DISABLE KEYS */;
INSERT INTO `deaths` VALUES (1,4,21,6),(2,9,21,4),(3,10,4,4),(4,12,1,4),(5,15,14,4),(6,16,5,6),(7,21,4,6),(8,32,44,1),(9,33,21,6),(10,37,79,NULL),(11,44,10,1),(12,51,21,3),(13,53,21,3),(14,56,21,3),(15,60,4,NULL),(16,61,70,2),(17,63,4,3),(18,67,4,3),(19,68,12,4),(20,69,51,2),(21,70,69,2),(22,76,4,3),(23,77,4,3),(24,79,10,3),(25,81,4,4),(26,92,1,4),(27,93,29,6),(28,96,4,5);
/*!40000 ALTER TABLE `deaths` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `films`
--

DROP TABLE IF EXISTS `films`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `films` (
  `id` int NOT NULL,
  `episode` varchar(12) DEFAULT NULL,
  `title` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `films`
--

LOCK TABLES `films` WRITE;
/*!40000 ALTER TABLE `films` DISABLE KEYS */;
INSERT INTO `films` VALUES (1,'Episode I','The Phantom Menace'),(2,'Episode II','Attack of the Clones'),(3,'Episode III','Revenge of the Sith'),(4,'Episode IV','A New Hope'),(5,'Episode V','The Empire Strikes Back'),(6,'Episode VI','Return of the Jedi');
/*!40000 ALTER TABLE `films` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `people`
--

DROP TABLE IF EXISTS `people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `people` (
  `id` int NOT NULL,
  `name` text,
  `height` int DEFAULT NULL,
  `mass` float DEFAULT NULL,
  `hair_color` text,
  `skin_color` text,
  `eye_color` text,
  `birth_year` text,
  `gender` text,
  `planet_id` int NOT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `planet_id` (`planet_id`),
  CONSTRAINT `people_ibfk_1` FOREIGN KEY (`planet_id`) REFERENCES `planets` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `people`
--

LOCK TABLES `people` WRITE;
/*!40000 ALTER TABLE `people` DISABLE KEYS */;
INSERT INTO `people` VALUES (1,'Luke Skywalker',172,77,'blond','fair','blue','19BBY','male',1,'2014-12-09 12:50:52','2014-12-20 20:17:57'),(2,'C-3PO',167,75,'n/a','gold','yellow','112BBY','n/a',1,'2014-12-10 14:10:51','2014-12-20 20:17:50'),(3,'R2-D2',96,32,'n/a','white, blue','red','33BBY','n/a',8,'2014-12-10 14:11:50','2014-12-20 20:17:50'),(4,'Darth Vader',202,136,'none','white','yellow','41.9BBY','male',1,'2014-12-10 14:18:21','2014-12-20 20:17:50'),(5,'Leia Organa',150,49,'brown','light','brown','19BBY','female',2,'2014-12-10 14:20:10','2014-12-20 20:17:50'),(6,'Owen Lars',178,120,'brown, grey','light','blue','52BBY','male',1,'2014-12-10 14:52:14','2014-12-20 20:17:50'),(7,'Whitesun lars',165,75,'brown','light','blue','47BBY','female',1,'2014-12-10 14:53:41','2014-12-20 20:17:50'),(8,'R5-D4',97,32,'n/a','white, red','red',NULL,'n/a',1,'2014-12-10 14:57:51','2014-12-20 20:17:50'),(9,'Biggs Darklighter',183,84,'black','light','brown','24BBY','male',1,'2014-12-10 14:59:51','2014-12-20 20:17:50'),(10,'Obi-Wan Kenobi',182,77,'auburn, white','fair','blue-gray','57BBY','male',20,'2014-12-10 15:16:29','2014-12-20 20:17:50'),(11,'Anakin Skywalker',188,84,'blond','fair','blue','41.9BBY','male',1,'2014-12-10 15:20:44','2014-12-20 20:17:50'),(12,'Wilhuff Tarkin',180,NULL,'auburn, grey','fair','blue','64BBY','male',21,'2014-12-10 15:26:56','2014-12-20 20:17:50'),(13,'Chewbacca',228,112,'brown',NULL,'blue','200BBY','male',14,'2014-12-10 15:42:45','2014-12-20 20:17:50'),(14,'Han Solo',180,80,'brown','fair','brown','29BBY','male',22,'2014-12-10 15:49:15','2014-12-20 20:17:50'),(15,'Greedo',173,74,'n/a','green','black','44BBY','male',23,'2014-12-10 16:03:30','2014-12-20 20:17:50'),(16,'Jabba Desilijic Tiure',175,1358,'n/a','green-tan, brown','orange','600BBY','hermaphrodite',24,'2014-12-10 16:11:32','2014-12-20 20:17:50'),(18,'Wedge Antilles',170,77,'brown','fair','hazel','21BBY','male',22,'2014-12-12 10:08:06','2014-12-20 20:17:50'),(19,'Jek Tono Porkins',180,110,'brown','fair','blue',NULL,'male',26,'2014-12-12 10:16:57','2014-12-20 20:17:50'),(20,'Yoda',66,17,'white','green','brown','896BBY','male',28,'2014-12-15 11:26:01','2014-12-20 20:17:50'),(21,'Palpatine',170,75,'grey','pale','yellow','82BBY','male',8,'2014-12-15 11:48:06','2014-12-20 20:17:50'),(22,'Boba Fett',183,78.2,'black','fair','brown','31.5BBY','male',10,'2014-12-15 11:49:32','2014-12-20 20:17:50'),(23,'IG-88',200,140,'none','metal','red','15BBY','none',28,'2014-12-15 11:51:10','2014-12-20 20:17:50'),(24,'Bossk',190,113,'none','green','red','53BBY','male',29,'2014-12-15 11:53:49','2014-12-20 20:17:50'),(25,'Lando Calrissian',177,79,'black','dark','brown','31BBY','male',30,'2014-12-15 11:56:33','2014-12-20 20:17:50'),(26,'Lobot',175,79,'none','light','blue','37BBY','male',6,'2014-12-15 12:01:57','2014-12-20 20:17:50'),(27,'Ackbar',180,83,'none','brown mottle','orange','41BBY','male',31,'2014-12-18 10:07:51','2014-12-20 20:17:50'),(28,'Mon Mothma',150,NULL,'auburn','fair','blue','48BBY','female',32,'2014-12-18 10:12:39','2014-12-20 20:17:50'),(29,'Arvel Crynyd',NULL,NULL,'brown','fair','brown',NULL,'male',28,'2014-12-18 10:16:33','2014-12-20 20:17:50'),(30,'Wicket Systri Warrick',88,20,'brown','brown','brown','8BBY','male',7,'2014-12-18 10:21:59','2014-12-20 20:17:50'),(31,'Nien Nunb',160,68,'none','grey','black',NULL,'male',33,'2014-12-18 10:26:19','2014-12-20 20:17:50'),(32,'Qui-Gon Jinn',193,89,'brown','fair','blue','92BBY','male',28,'2014-12-19 15:54:54','2014-12-20 20:17:50'),(33,'Nute Gunray',191,90,'none','mottled green','red',NULL,'male',18,'2014-12-19 16:05:57','2014-12-20 20:17:50'),(34,'Finis Valorum',170,NULL,'blond','fair','blue','91BBY','male',9,'2014-12-19 16:21:46','2014-12-20 20:17:50'),(35,'Jar Jar Binks',196,66,'none','orange','orange','52BBY','male',8,'2014-12-19 16:29:32','2014-12-20 20:17:50'),(36,'Padmé Amidala',165,45,'brown','light','brown','46BBY','female',8,'2014-12-19 16:28:27','2016-04-20 15:06:32'),(37,'Roos Tarpals',224,82,'none','grey','orange',NULL,'male',8,'2014-12-19 16:32:57','2014-12-20 20:17:50'),(38,'Rugor Nass',206,NULL,'none','green','orange',NULL,'male',8,'2014-12-19 16:33:39','2014-12-20 20:17:50'),(39,'Ric Olié',183,NULL,'brown','fair','blue',NULL,'male',8,'2014-12-19 16:45:02','2014-12-20 20:17:50'),(40,'Watto',137,NULL,'black','blue, grey','yellow',NULL,'male',34,'2014-12-19 16:48:55','2014-12-20 20:17:50'),(41,'Sebulba',112,40,'none','grey, red','orange',NULL,'male',35,'2014-12-19 16:53:03','2014-12-20 20:17:50'),(42,'Quarsh Panaka',183,NULL,'black','dark','brown','62BBY','male',8,'2014-12-19 16:55:43','2014-12-20 20:17:50'),(43,'Shmi Skywalker',163,NULL,'black','fair','brown','72BBY','female',1,'2014-12-19 16:57:41','2014-12-20 20:17:50'),(44,'Darth Maul',175,80,'none','red','yellow','54BBY','male',36,'2014-12-19 17:00:42','2014-12-20 20:17:50'),(45,'Bib Fortuna',180,NULL,'none','pale','pink',NULL,'male',37,'2014-12-20 08:47:03','2014-12-20 20:17:50'),(46,'Ayla Secura',178,55,'none','blue','hazel','48BBY','female',37,'2014-12-20 08:48:01','2014-12-20 20:17:50'),(47,'Ratts Tyerell',79,15,'none','grey, blue',NULL,NULL,'male',38,'2014-12-20 08:53:15','2016-06-30 10:52:20'),(48,'Dud Bolt',94,45,'none','blue, grey','yellow',NULL,'male',39,'2014-12-20 08:57:32','2014-12-20 20:17:50'),(49,'Gasgano',122,NULL,'none','white, blue','black',NULL,'male',40,'2014-12-20 09:02:12','2014-12-20 20:17:50'),(50,'Ben Quadinaros',163,65,'none','grey, green, yellow','orange',NULL,'male',41,'2014-12-20 09:08:34','2014-12-20 20:17:50'),(51,'Mace Windu',188,84,'none','dark','brown','72BBY','male',42,'2014-12-20 09:12:31','2014-12-20 20:17:50'),(52,'Ki-Adi-Mundi',198,82,'white','pale','yellow','92BBY','male',43,'2014-12-20 09:15:32','2014-12-20 20:17:50'),(53,'Kit Fisto',196,87,'none','green','black',NULL,'male',44,'2014-12-20 09:18:57','2014-12-20 20:17:50'),(54,'Eeth Koth',171,NULL,'black','brown','brown',NULL,'male',45,'2014-12-20 09:26:48','2014-12-20 20:17:50'),(55,'Adi Gallia',184,50,'none','dark','blue',NULL,'female',9,'2014-12-20 09:29:12','2014-12-20 20:17:50'),(56,'Saesee Tiin',188,NULL,'none','pale','orange',NULL,'male',47,'2014-12-20 09:32:12','2014-12-20 20:17:50'),(57,'Yarael Poof',264,NULL,'none','white','yellow',NULL,'male',48,'2014-12-20 09:34:49','2014-12-20 20:17:50'),(58,'Plo Koon',188,80,'none','orange','black','22BBY','male',49,'2014-12-20 09:49:20','2014-12-20 20:17:50'),(59,'Mas Amedda',196,NULL,'none','blue','blue',NULL,'male',50,'2014-12-20 09:53:26','2014-12-20 20:17:50'),(60,'Gregar Typho',185,85,'black','dark','brown',NULL,'male',8,'2014-12-20 10:10:10','2014-12-20 20:17:50'),(61,'Cordé',157,NULL,'brown','light','brown',NULL,'female',8,'2014-12-20 10:11:40','2014-12-20 20:17:50'),(62,'Cliegg Lars',183,NULL,'brown','fair','blue','82BBY','male',1,'2014-12-20 14:59:04','2014-12-20 20:17:50'),(63,'Poggle the Lesser',183,80,'none','green','yellow',NULL,'male',11,'2014-12-20 15:40:44','2014-12-20 20:17:50'),(64,'Luminara Unduli',170,56.2,'black','yellow','blue','58BBY','female',51,'2014-12-20 15:45:54','2014-12-20 20:17:50'),(65,'Barriss Offee',166,50,'black','yellow','blue','40BBY','female',51,'2014-12-20 15:46:40','2014-12-20 20:17:50'),(66,'Dormé',165,NULL,'brown','light','brown',NULL,'female',8,'2014-12-20 15:49:15','2014-12-20 20:17:50'),(67,'Dooku',193,80,'white','fair','brown','102BBY','male',52,'2014-12-20 15:52:15','2014-12-20 20:17:50'),(68,'Bail Prestor Organa',191,NULL,'black','tan','brown','67BBY','male',2,'2014-12-20 15:53:09','2014-12-20 20:17:50'),(69,'Jango Fett',183,79,'black','tan','brown','66BBY','male',53,'2014-12-20 15:54:42','2014-12-20 20:17:50'),(70,'Zam Wesell',168,55,'blonde','fair, green, yellow','yellow',NULL,'female',54,'2014-12-20 15:57:44','2014-12-20 20:17:50'),(71,'Dexter Jettster',198,102,'none','brown','yellow',NULL,'male',55,'2014-12-20 16:28:27','2014-12-20 20:17:50'),(72,'Lama Su',229,88,'none','grey','black',NULL,'male',10,'2014-12-20 16:30:50','2014-12-20 20:17:50'),(73,'Taun We',213,NULL,'none','grey','black',NULL,'female',10,'2014-12-20 16:31:21','2014-12-20 20:17:50'),(74,'Jocasta Nu',167,NULL,'white','fair','blue',NULL,'female',9,'2014-12-20 16:32:52','2014-12-20 20:17:50'),(75,'R4-P17',96,NULL,'none','silver, red','red, blue',NULL,'female',28,'2014-12-20 16:43:36','2014-12-20 20:17:50'),(76,'Wat Tambor',193,48,'none','green, grey',NULL,NULL,'male',56,'2014-12-20 16:53:53','2014-12-20 20:17:50'),(77,'San Hill',191,NULL,'none','grey','gold',NULL,'male',57,'2014-12-20 16:58:17','2014-12-20 20:17:50'),(78,'Shaak Ti',178,57,'none','red, blue, white','black',NULL,'female',58,'2014-12-20 17:44:01','2014-12-20 20:17:50'),(79,'Grievous',216,159,'none','brown, white','green, yellow',NULL,'male',59,'2014-12-20 18:43:53','2014-12-20 20:17:50'),(80,'Tarfful',234,136,'brown','brown','blue',NULL,'male',14,'2014-12-20 18:46:34','2014-12-20 20:17:50'),(81,'Raymus Antilles',188,79,'brown','light','brown',NULL,'male',2,'2014-12-20 18:49:36','2014-12-20 20:17:50'),(82,'Sly Moore',178,48,'none','pale','white',NULL,'female',60,'2014-12-20 19:18:38','2014-12-20 20:17:50'),(83,'Tion Medon',206,80,'none','grey','black',NULL,'male',12,'2014-12-20 19:35:04','2014-12-20 20:17:50'),(89,'Cornelius Evazan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL),(90,'Ponda Baba',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL),(91,'General Rieekan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL),(92,'Admiral Motti',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL),(93,'Admiral Piett',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL),(94,'Major Bren Derlin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL),(95,'Rancor Keeper',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL),(96,'Admiral Ozzel',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL),(97,'Finn',NULL,NULL,'black','dark','dark',NULL,'male',28,'2015-04-17 04:52:41','2015-04-17 04:52:41'),(98,'Rey',NULL,NULL,'brown','light','hazel',NULL,'female',28,'2015-04-17 04:54:01','2015-04-17 04:54:01'),(99,'Poe Dameron',NULL,NULL,'brown','light','brown',NULL,'male',28,'2015-04-17 04:55:22','2015-04-17 04:55:22'),(100,'BB8',NULL,NULL,'none','none','black',NULL,'none',28,'2015-04-17 04:57:38','2015-04-17 04:57:38'),(101,'Captain Phasma',NULL,NULL,NULL,NULL,NULL,NULL,'female',28,'2015-10-13 08:35:39','2015-10-13 08:35:39');
/*!40000 ALTER TABLE `people` ENABLE KEYS */;
UNLOCK TABLES;

-- *** NOTA: Num ABY (After Battle of Yavin) i Num BBY (Before Battle of Yavin) *** 
-- *** https://starwars.fandom.com/wiki/Timeline_of_galactic_history ***
--
-- Table structure for table `people_affiliations`
--

DROP TABLE IF EXISTS `people_affiliations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `people_affiliations` (
  `id_people` int NOT NULL,
  `id_affiliation` int NOT NULL,
  PRIMARY KEY (`id_people`,`id_affiliation`),
  KEY `id_affiliation` (`id_affiliation`),
  CONSTRAINT `people_affiliations_ibfk_1` FOREIGN KEY (`id_people`) REFERENCES `people` (`id`),
  CONSTRAINT `people_affiliations_ibfk_2` FOREIGN KEY (`id_affiliation`) REFERENCES `affiliations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `people_affiliations`
--

LOCK TABLES `people_affiliations` WRITE;
/*!40000 ALTER TABLE `people_affiliations` DISABLE KEYS */;
INSERT INTO `people_affiliations` VALUES (2,0),(6,0),(7,0),(8,0),(15,0),(16,0),(22,0),(23,0),(24,0),(26,0),(40,0),(41,0),(43,0),(45,0),(47,0),(48,0),(49,0),(50,0),(61,0),(62,0),(63,0),(66,0),(69,0),(70,0),(71,0),(72,0),(83,0),(89,0),(90,0),(95,0),(1,1),(10,1),(11,1),(20,1),(32,1),(46,1),(51,1),(52,1),(53,1),(54,1),(55,1),(56,1),(57,1),(58,1),(64,1),(65,1),(67,1),(74,1),(75,1),(78,1),(1,2),(3,2),(5,2),(9,2),(13,2),(14,2),(18,2),(19,2),(25,2),(27,2),(28,2),(29,2),(30,2),(31,2),(68,2),(91,2),(94,2),(3,3),(12,3),(21,3),(34,3),(35,3),(36,3),(37,3),(59,3),(73,3),(80,3),(82,3),(4,4),(92,4),(93,4),(96,4),(4,5),(44,5),(5,6),(81,7),(33,8),(76,8),(77,8),(79,8),(38,10),(39,11),(42,12),(60,12);
/*!40000 ALTER TABLE `people_affiliations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `people_films`
--

DROP TABLE IF EXISTS `people_films`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `people_films` (
  `id_people` int NOT NULL,
  `id_film` int NOT NULL,
  PRIMARY KEY (`id_people`,`id_film`),
  KEY `id_film` (`id_film`),
  CONSTRAINT `people_films_ibfk_1` FOREIGN KEY (`id_people`) REFERENCES `people` (`id`),
  CONSTRAINT `people_films_ibfk_2` FOREIGN KEY (`id_film`) REFERENCES `films` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `people_films`
--

LOCK TABLES `people_films` WRITE;
/*!40000 ALTER TABLE `people_films` DISABLE KEYS */;
INSERT INTO `people_films` VALUES (2,1),(3,1),(10,1),(11,1),(20,1),(21,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(38,1),(39,1),(40,1),(41,1),(42,1),(43,1),(44,1),(46,1),(47,1),(48,1),(49,1),(50,1),(51,1),(52,1),(53,1),(54,1),(55,1),(56,1),(57,1),(58,1),(59,1),(2,2),(3,2),(6,2),(7,2),(10,2),(11,2),(20,2),(21,2),(22,2),(33,2),(35,2),(36,2),(40,2),(43,2),(46,2),(51,2),(52,2),(53,2),(58,2),(59,2),(60,2),(61,2),(62,2),(63,2),(64,2),(65,2),(66,2),(67,2),(68,2),(69,2),(70,2),(71,2),(72,2),(73,2),(74,2),(75,2),(76,2),(77,2),(78,2),(82,2),(2,3),(3,3),(4,3),(6,3),(7,3),(10,3),(11,3),(13,3),(20,3),(21,3),(33,3),(36,3),(46,3),(51,3),(52,3),(53,3),(54,3),(55,3),(56,3),(58,3),(63,3),(64,3),(67,3),(68,3),(76,3),(78,3),(79,3),(80,3),(81,3),(82,3),(83,3),(1,4),(2,4),(3,4),(4,4),(5,4),(6,4),(7,4),(8,4),(9,4),(10,4),(12,4),(13,4),(14,4),(15,4),(18,4),(19,4),(81,4),(89,4),(90,4),(1,5),(2,5),(3,5),(4,5),(5,5),(13,5),(14,5),(18,5),(20,5),(21,5),(22,5),(23,5),(24,5),(25,5),(26,5),(91,5),(92,5),(93,5),(94,5),(96,5),(1,6),(2,6),(3,6),(4,6),(5,6),(13,6),(14,6),(16,6),(18,6),(20,6),(21,6),(22,6),(25,6),(27,6),(28,6),(29,6),(30,6),(31,6),(45,6),(93,6),(95,6);
/*!40000 ALTER TABLE `people_films` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planets`
--

DROP TABLE IF EXISTS `planets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `planets` (
  `id` int NOT NULL,
  `name` text,
  `rotation_period` int DEFAULT NULL,
  `orbital_period` int DEFAULT NULL,
  `diameter` int DEFAULT NULL,
  `climate` text,
  `gravity` text,
  `terrain` text,
  `surface_water` text,
  `population` bigint DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planets`
--

LOCK TABLES `planets` WRITE;
/*!40000 ALTER TABLE `planets` DISABLE KEYS */;
INSERT INTO `planets` VALUES (0,'Unknow planet',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1,'Tatooine',23,304,10465,'arid','1 standard','desert','1',200000,'2014-12-09 12:50:50','2014-12-21 19:48:04'),(2,'Alderaan',24,364,12500,'temperate','1 standard','grasslands, mountains','40',2000000000,'2014-12-10 10:35:48','2014-12-20 19:58:18'),(3,'Yavin IV',24,4818,10200,'temperate, tropical','1 standard','jungle, rainforests','8',1000,'2014-12-10 10:37:19','2014-12-20 19:58:18'),(4,'Hoth',23,549,7200,'frozen','1.1 standard','tundra, ice caves, mountain ranges','100',NULL,'2014-12-10 10:39:14','2014-12-20 19:58:18'),(5,'Dagobah',23,341,8900,'murky','N/A','swamp, jungles','8',NULL,'2014-12-10 10:42:23','2014-12-20 19:58:18'),(6,'Bespin',12,5110,118000,'temperate','1.5 (surface), 1 standard (Cloud City)','gas giant','0',6000000,'2014-12-10 10:43:55','2014-12-20 19:58:18'),(7,'Endor',18,402,4900,'temperate','0.85 standard','forests, mountains, lakes','8',30000000,'2014-12-10 10:50:29','2014-12-20 19:58:18'),(8,'Naboo',26,312,12120,'temperate','1 standard','grassy hills, swamps, forests, mountains','12',4500000000,'2014-12-10 10:52:31','2014-12-20 19:58:18'),(9,'Coruscant',24,368,12240,'temperate','1 standard','cityscape, mountains',NULL,1000000000000,'2014-12-10 10:54:14','2014-12-20 19:58:18'),(10,'Kamino',27,463,19720,'temperate','1 standard','ocean','100',1000000000,'2014-12-10 11:45:07','2014-12-20 19:58:18'),(11,'Geonosis',30,256,11370,'temperate, arid','0.9 standard','rock, desert, mountain, barren','5',100000000000,'2014-12-10 11:47:22','2014-12-20 19:58:18'),(12,'Utapau',27,351,12900,'temperate, arid, windy','1 standard','scrublands, savanna, canyons, sinkholes','0.9',95000000,'2014-12-10 11:49:01','2014-12-20 19:58:18'),(13,'Mustafar',36,412,4200,'hot','1 standard','volcanoes, lava rivers, mountains, caves','0',20000,'2014-12-10 11:50:17','2014-12-20 19:58:18'),(14,'Kashyyyk',26,381,12765,'tropical','1 standard','jungle, forests, lakes, rivers','60',45000000,'2014-12-10 12:32:00','2014-12-20 19:58:18'),(15,'Polis Massa',24,590,0,'artificial temperate','0.56 standard','airless asteroid','0',1000000,'2014-12-10 12:33:46','2014-12-20 19:58:18'),(16,'Mygeeto',12,167,10088,'frigid','1 standard','glaciers, mountains, ice canyons',NULL,19000000,'2014-12-10 12:43:39','2014-12-20 19:58:18'),(17,'Felucia',34,231,9100,'hot, humid','0.75 standard','fungus forests',NULL,8500000,'2014-12-10 12:44:50','2014-12-20 19:58:18'),(18,'Cato Neimoidia',25,278,0,'temperate, moist','1 standard','mountains, fields, forests, rock arches',NULL,10000000,'2014-12-10 12:46:29','2014-12-20 19:58:18'),(19,'Saleucami',26,392,14920,'hot',NULL,'caves, desert, mountains, volcanoes',NULL,1400000000,'2014-12-10 12:47:47','2014-12-20 19:58:18'),(20,'Stewjon',NULL,NULL,0,'temperate','1 standard','grass',NULL,NULL,'2014-12-10 15:16:27','2014-12-20 19:58:18'),(21,'Eriadu',24,360,13490,'polluted','1 standard','cityscape',NULL,22000000000,'2014-12-10 15:26:54','2014-12-20 19:58:18'),(22,'Corellia',25,329,11000,'temperate','1 standard','plains, urban, hills, forests','70',3000000000,'2014-12-10 15:49:12','2014-12-20 19:58:18'),(23,'Rodia',29,305,7549,'hot','1 standard','jungles, oceans, urban, swamps','60',1300000000,'2014-12-10 16:03:28','2014-12-20 19:58:18'),(24,'Nal Hutta',87,413,12150,'temperate','1 standard','urban, oceans, swamps, bogs',NULL,7000000000,'2014-12-10 16:11:29','2014-12-20 19:58:18'),(25,'Dantooine',25,378,9830,'temperate','1 standard','oceans, savannas, mountains, grasslands',NULL,1000,'2014-12-10 16:23:30','2014-12-20 19:58:18'),(26,'Bestine IV',26,680,6400,'temperate',NULL,'rocky islands, oceans','98',62000000,'2014-12-12 10:16:55','2014-12-20 19:58:18'),(27,'Ord Mantell',26,334,14050,'temperate','1 standard','plains, seas, mesas','10',4000000000,'2014-12-15 11:23:42','2014-12-20 19:58:18'),(28,'Unknown',0,0,0,NULL,NULL,NULL,NULL,NULL,'2014-12-15 11:26:00','2014-12-20 19:58:18'),(29,'Trandosha',25,371,0,'arid','0.62 standard','mountains, seas, grasslands, deserts',NULL,42000000,'2014-12-15 11:53:48','2014-12-20 19:58:18'),(30,'Socorro',20,326,0,'arid','1 standard','deserts, mountains',NULL,300000000,'2014-12-15 11:56:31','2014-12-20 19:58:18'),(31,'Mon Cala',21,398,11030,'temperate','1','oceans, reefs, islands','100',27000000000,'2014-12-18 10:07:02','2014-12-20 19:58:18'),(32,'Chandrila',20,368,13500,'temperate','1','plains, forests','40',1200000000,'2014-12-18 10:11:52','2014-12-20 19:58:18'),(33,'Sullust',20,263,12780,'superheated','1','mountains, volcanoes, rocky deserts','5',18500000000,'2014-12-18 10:25:40','2014-12-20 19:58:18'),(34,'Toydaria',21,184,7900,'temperate','1','swamps, lakes',NULL,11000000,'2014-12-19 16:47:54','2014-12-20 19:58:18'),(35,'Malastare',26,201,18880,'arid, temperate, tropical','1.56','swamps, deserts, jungles, mountains',NULL,2000000000,'2014-12-19 16:52:13','2014-12-20 19:58:18'),(36,'Dathomir',24,491,10480,'temperate','0.9','forests, deserts, savannas',NULL,5200,'2014-12-19 17:00:40','2014-12-20 19:58:18'),(37,'Ryloth',30,305,10600,'temperate, arid, subartic','1','mountains, valleys, deserts, tundra','5',1500000000,'2014-12-20 08:46:26','2014-12-20 19:58:18'),(38,'Aleen Minor',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-20 08:52:23','2014-12-20 19:58:18'),(39,'Vulpter',22,391,14900,'temperate, artic','1','urban, barren',NULL,421000000,'2014-12-20 08:56:59','2014-12-20 19:58:18'),(40,'Troiken',NULL,NULL,NULL,NULL,NULL,'desert, tundra, rainforests, mountains',NULL,NULL,'2014-12-20 09:01:37','2014-12-20 19:58:18'),(41,'Tund',48,1770,12190,NULL,NULL,'barren, ash',NULL,0,'2014-12-20 09:07:30','2014-12-20 19:58:18'),(42,'Haruun Kal',25,383,10120,'temperate','0.98','toxic cloudsea, plateaus, volcanoes',NULL,705300,'2014-12-20 09:12:29','2014-12-20 19:58:18'),(43,'Cerea',27,386,NULL,'temperate','1','verdant','20',450000000,'2014-12-20 09:14:48','2014-12-20 19:58:18'),(44,'Glee Anselm',33,206,15600,'tropical, temperate','1','lakes, islands, swamps, seas','80',500000000,'2014-12-20 09:18:26','2014-12-20 19:58:18'),(45,'Iridonia',29,413,NULL,NULL,NULL,'rocky canyons, acid pools',NULL,NULL,'2014-12-20 09:26:06','2014-12-20 19:58:18'),(46,'Tholoth',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-20 09:28:31','2014-12-20 19:58:18'),(47,'Iktotch',22,481,NULL,'arid, rocky, windy','1','rocky',NULL,NULL,'2014-12-20 09:31:32','2014-12-20 19:58:19'),(48,'Quermia',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-20 09:34:08','2014-12-20 19:58:19'),(49,'Dorin',22,409,13400,'temperate','1',NULL,NULL,NULL,'2014-12-20 09:48:36','2014-12-20 19:58:19'),(50,'Champala',27,318,NULL,'temperate','1','oceans, rainforests, plateaus',NULL,3500000000,'2014-12-20 09:52:52','2014-12-20 19:58:19'),(51,'Mirial',NULL,NULL,NULL,NULL,NULL,'deserts',NULL,NULL,'2014-12-20 15:44:46','2014-12-20 19:58:19'),(52,'Serenno',NULL,NULL,NULL,NULL,NULL,'rainforests, rivers, mountains',NULL,NULL,'2014-12-20 15:52:13','2014-12-20 19:58:19'),(53,'Concord Dawn',NULL,NULL,NULL,NULL,NULL,'jungles, forests, deserts',NULL,NULL,'2014-12-20 15:54:40','2014-12-20 19:58:19'),(54,'Zolan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-20 15:56:37','2014-12-20 19:58:19'),(55,'Ojom',NULL,NULL,NULL,'frigid',NULL,'oceans, glaciers','100',500000000,'2014-12-20 16:27:41','2014-12-20 19:58:19'),(56,'Skako',27,384,NULL,'temperate','1','urban, vines',NULL,500000000000,'2014-12-20 16:50:48','2014-12-20 19:58:19'),(57,'Muunilinst',28,412,13800,'temperate','1','plains, forests, hills, mountains','25',5000000000,'2014-12-20 16:57:47','2014-12-20 19:58:19'),(58,'Shili',NULL,NULL,NULL,'temperate','1','cities, savannahs, seas, plains',NULL,NULL,'2014-12-20 17:43:14','2014-12-20 19:58:19'),(59,'Kalee',23,378,13850,'arid, temperate, tropical','1','rainforests, cliffs, canyons, seas',NULL,4000000000,'2014-12-20 18:43:51','2014-12-20 19:58:19'),(60,'Umbara',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-12-20 19:18:36','2014-12-20 19:58:19'),(61,'Jakku',NULL,NULL,NULL,NULL,NULL,'deserts',NULL,NULL,'2015-04-17 04:55:58','2015-04-17 04:55:58');
/*!40000 ALTER TABLE `planets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

ALTER TABLE films ADD column SpanishTitle VARCHAR(32);
ALTER TABLE films ADD column data YEAR;

UPDATE films SET SpanishTitle = 'La amenaza fantasma', data = 1999 WHERE id=1;
UPDATE films SET SpanishTitle = 'El ataque de los clones', data = 2002 WHERE id=2;
UPDATE films SET SpanishTitle = 'La venganza de los Sith', data = 2005 WHERE id=3;
UPDATE films SET SpanishTitle = 'Una nueva esperanza', data = 1977 WHERE id=4;
UPDATE films SET SpanishTitle = 'El Imperio contraataca', data = 1980 WHERE id=5;
UPDATE films SET SpanishTitle = 'El retorno del Jedi', data = 1983 WHERE id=6;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-08 20:48:43
