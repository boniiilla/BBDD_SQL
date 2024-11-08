-- MySQL dump 10.13  Distrib 5.6.22, for Linux (i686)
--
-- Host: localhost    Database: vendes
-- ------------------------------------------------------
-- Server version	5.6.22

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
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clients` (
  `num_clie` int(11) NOT NULL AUTO_INCREMENT,
  `societat` varchar(20) NOT NULL,
  `ven_clie` int(4) DEFAULT NULL,
  `credit` int(4) DEFAULT NULL,
  `pais` int(11) DEFAULT NULL,
  `idioma` enum('Alemany','Castella','Catala','Angles','Italia','Frances','Rus') DEFAULT 'Angles',
  PRIMARY KEY (`num_clie`),
  KEY `ven_clie` (`ven_clie`),
  KEY `pais` (`pais`),
  CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`ven_clie`) REFERENCES `venedors` (`num_ven`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `clients_ibfk_2` FOREIGN KEY (`pais`) REFERENCES `pais` (`num_pais`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2125 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` (`num_clie`, `societat`, `ven_clie`, `credit`, `pais`, `idioma`) VALUES (2101,'Jones Mfg',106,65000,3,'Angles'),(2102,'First Corp',101,65000,3,'Angles'),(2103,'Acme Mfg',105,50000,1,'Angles'),(2105,'AAA Investments',101,45000,2,'Catala'),(2106,'Fred Lewis Corp.',102,65000,5,'Frances'),(2107,'Ace International',110,35000,2,'Castella'),(2108,'Holm & Landis',109,55000,6,'Catala'),(2109,'Chen Associates',107,25000,1,'Alemany'),(2111,'JCP Inc',103,50000,6,'Alemany'),(2112,'Zetacorp',108,50000,4,'Italia'),(2113,'Ian & Schmidt',104,20000,3,'Angles'),(2114,'Orion Corp',102,20000,4,'Italia'),(2115,'Smithson Corp',101,20000,4,'Italia'),(2117,'J.P. Sinclair',106,35000,1,'Angles'),(2118,'Midwest Systems',108,60000,2,'Castella'),(2119,'Solomon Inc',109,25000,5,'Frances'),(2120,'Rico Enterprises',102,50000,6,'Angles'),(2121,'QMA Assoc',103,45000,3,'Angles'),(2122,'Three-Way Lines',105,30000,6,'Frances'),(2123,'Carter & Sons',102,40000,7,'Rus'),(2124,'Peter Brothers',107,40000,4,'Angles');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comandes`
--

DROP TABLE IF EXISTS `comandes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comandes` (
  `num_comanda` int(11) NOT NULL AUTO_INCREMENT,
  `descripcio` varchar(60) DEFAULT 'Comanda articles diversos...',
  `data_comanda` date NOT NULL,
  `clie` int(4) NOT NULL,
  `ven` int(4) DEFAULT NULL,
  `iva` int(2) unsigned NOT NULL DEFAULT '21',
  `dte` int(2) DEFAULT '0',
  PRIMARY KEY (`num_comanda`),
  KEY `clie` (`clie`),
  KEY `ven` (`ven`),
  CONSTRAINT `comandes_ibfk_1` FOREIGN KEY (`clie`) REFERENCES `clients` (`num_clie`) ON UPDATE CASCADE,
  CONSTRAINT `comandes_ibfk_2` FOREIGN KEY (`ven`) REFERENCES `venedors` (`num_ven`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=113070 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comandes`
--

LOCK TABLES `comandes` WRITE;
/*!40000 ALTER TABLE `comandes` DISABLE KEYS */;
INSERT INTO `comandes` (`num_comanda`, `descripcio`, `data_comanda`, `clie`, `ven`, `iva`, `dte`) VALUES (112963,'Comanda client VIP','1989-12-17',2103,105,21,0),(112968,'Comanda client VIP','1989-12-10',2102,101,21,0),(112975,'Comanda client VIP','1989-10-12',2111,103,21,0),(112979,'Comanda client VIP','1989-12-10',2114,102,21,0),(112983,'Comanda client VIP','1989-12-27',2103,105,21,0),(112987,'Comanda articles diversos...','1989-12-31',2103,105,21,5),(112989,'Comanda articles diversos...','1990-01-03',2101,106,21,5),(112992,'Comanda articles diversos...','1989-11-04',2118,108,21,10),(112993,'Comanda articles diversos...','1989-01-04',2106,102,21,10),(112997,'Comanda articles diversos...','1990-08-01',2124,107,21,0),(113003,'Comanda articles diversos...','1990-01-25',2108,109,21,0),(113007,'Comanda articles diversos...','1990-08-01',2112,108,21,0),(113012,'Comanda articles diversos...','1990-11-01',2111,105,21,0),(113013,'Comanda articles diversos...','1990-01-14',2118,108,21,0),(113024,'Comanda articles diversos...','1990-01-20',2114,108,21,0),(113027,'Comanda articles diversos...','1990-01-22',2103,105,21,0),(113034,'Comanda web','1990-01-29',2107,110,21,0),(113042,'Comanda web','1990-02-02',2113,101,21,0),(113045,'Comanda web','1990-02-02',2112,108,21,0),(113048,'Comanda web','1990-02-10',2120,102,21,0),(113049,'Comanda web','1990-10-02',2118,108,21,0),(113051,'Comanda web','1990-10-02',2118,108,21,25),(113055,'Comanda web','1990-02-15',2108,101,21,25),(113057,'Comanda articles diversos...','1990-02-18',2111,103,21,15),(113058,'Comanda articles diversos...','1990-02-23',2108,109,21,15),(113062,'Comanda articles diversos...','1990-02-24',2124,107,21,5),(113065,'Comanda articles diversos...','1990-02-27',2106,102,21,3),(113069,'Comanda articles diversos...','1990-02-03',2109,107,21,3);
/*!40000 ALTER TABLE `comandes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detall`
--

DROP TABLE IF EXISTS `detall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detall` (
  `num_comanda` int(11) NOT NULL,
  `fab` char(3) NOT NULL DEFAULT '',
  `producte` char(5) NOT NULL DEFAULT '',
  `quantitat` int(4) unsigned NOT NULL,
  `preu` decimal(8,2) unsigned DEFAULT NULL,
  PRIMARY KEY (`num_comanda`,`fab`,`producte`),
  KEY `fab` (`fab`,`producte`),
  CONSTRAINT `detall_ibfk_1` FOREIGN KEY (`num_comanda`) REFERENCES `comandes` (`num_comanda`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detall_ibfk_2` FOREIGN KEY (`fab`, `producte`) REFERENCES `productes` (`id_fab`, `id_producte`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detall`
--

LOCK TABLES `detall` WRITE;
/*!40000 ALTER TABLE `detall` DISABLE KEYS */;
INSERT INTO `detall` (`num_comanda`, `fab`, `producte`, `quantitat`, `preu`) VALUES (112963,'aci','41004',28,117.00),(112968,'aci','41004',34,117.00),(112975,'aci','4100x',5,25.00),(112975,'fea','114',10,243.00),(112975,'rei','2a44g',6,350.00),(112979,'aci','4100z',6,2500.00),(112983,'aci','41004',6,117.00),(112987,'aci','4100y',11,2750.00),(112989,'fea','114',6,243.00),(112992,'aci','41002',10,76.00),(112993,'rei','2a45c',24,79.00),(112997,'bic','41003',1,652.00),(113003,'imm','779c',3,1875.00),(113007,'imm','773c',3,975.00),(113012,'aci','41003',35,107.00),(113013,'bic','41003',1,652.00),(113024,'qsa','xk47',20,355.00),(113027,'aci','41002',54,76.00),(113034,'rei','2a45c',8,79.00),(113042,'aci','41001',5,55.00),(113042,'rei','2a44r',5,4500.00),(113045,'rei','2a44r',10,4500.00),(113048,'imm','779c',2,1875.00),(113049,'qsa','xk47',2,355.00),(113051,'qsa','xk47',4,355.00),(113055,'aci','4100x',6,25.00),(113055,'bic','41003',1,652.00),(113055,'rei','2a45c',10,79.00),(113057,'aci','4100x',24,25.00),(113058,'fea','112',10,148.00),(113062,'fea','114',10,243.00),(113065,'qsa','xk47',6,355.00),(113069,'imm','775c',22,1425.00);
/*!40000 ALTER TABLE `detall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oficines`
--

DROP TABLE IF EXISTS `oficines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oficines` (
  `oficina` int(4) NOT NULL,
  `ciutat` varchar(15) NOT NULL,
  `regio` varchar(10) NOT NULL,
  `dir` int(4) DEFAULT NULL,
  `objectiu` int(4) DEFAULT NULL,
  `vendes` int(4) NOT NULL,
  PRIMARY KEY (`oficina`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oficines`
--

LOCK TABLES `oficines` WRITE;
/*!40000 ALTER TABLE `oficines` DISABLE KEYS */;
INSERT INTO `oficines` (`oficina`, `ciutat`, `regio`, `dir`, `objectiu`, `vendes`) VALUES (11,'New York','Est',106,575000,692637),(12,'Chicago','Est',104,800000,735042),(13,'Atlanta','Est',105,350000,367911),(21,'Los Angeles','Oest',108,725000,835915),(22,'Denver','Oest',108,300000,186042);
/*!40000 ALTER TABLE `oficines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pais` (
  `num_pais` int(11) NOT NULL AUTO_INCREMENT,
  `nompais` varchar(25) NOT NULL,
  PRIMARY KEY (`num_pais`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
INSERT INTO `pais` (`num_pais`, `nompais`) VALUES (1,'Alemanyya'),(2,'Espanya'),(3,'Regne Unit'),(4,'Italia'),(5,'França'),(6,'Luxemburg'),(7,'Rusia'),(8,'EEUU');
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productes`
--

DROP TABLE IF EXISTS `productes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productes` (
  `id_fab` char(3) NOT NULL,
  `id_producte` char(5) NOT NULL,
  `descripcio` varchar(20) NOT NULL,
  `precio` decimal(8,2) unsigned DEFAULT NULL,
  `stock` int(4) unsigned NOT NULL,
  `imatge` varchar(60) DEFAULT 'noimatge.png',
  PRIMARY KEY (`id_fab`,`id_producte`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productes`
--

LOCK TABLES `productes` WRITE;
/*!40000 ALTER TABLE `productes` DISABLE KEYS */;
INSERT INTO `productes` (`id_fab`, `id_producte`, `descripcio`, `precio`, `stock`, `imatge`) VALUES ('aci','41001','Articulo Tipo 1',55.00,271,'noimatge.png'),('aci','41002','Articulo Tipo 2',76.00,166,'noimatge.png'),('aci','41003','Articulo Tipo 3',107.00,200,'noimatge.png'),('aci','41004','Articulo Tipo 4',117.00,136,'noimatge.png'),('aci','4100x','Ajustador',25.00,29,'noimatge.png'),('aci','4100y','Desmontador',2750.00,24,'noimatge.png'),('aci','4100z','Montador',2500.00,28,'noimatge.png'),('bic','41003','Tirador',652.00,0,'tirador.png'),('bic','41089','Reten',225.00,78,'noimatge.png'),('bic','41672','Placa',180.00,0,'noimatge.png'),('fea','112','Cubierta',148.00,115,'noimatge.png'),('fea','114','Bancada Motor',243.00,5,'noimatge.png'),('imm','773c','Abrazadera 300-lb',975.00,28,'noimatge.png'),('imm','775c','Abrazadera 500-lb',1425.00,5,'noimatge.png'),('imm','779c','Abrazadera 900-lb',1875.00,9,'noimatge.png'),('imm','887h','Soporte Abrazadera',54.00,223,'noimatge.png'),('imm','887p','Perno Abrazadera',250.00,24,'perno.png'),('imm','887x','Reten Abrazadera',475.00,32,'noimatge.png'),('qsa','xk47','Reductor',355.00,38,'noimatge.png'),('qsa','xk48','Reductor',134.00,203,'noimatge.png'),('qsa','xk48a','Reductor',117.00,37,'noimatge.png'),('rei','2a44g','Pasador Bisagra',350.00,14,'pasador.png'),('rei','2a44l','Bisagra Izqda.',4500.00,12,'bisagra.png'),('rei','2a44r','Bisagra Dcha.',4500.00,12,'bisagra.png'),('rei','2a45c','Union  Trinquete',79.00,200,'noimatge.png');
/*!40000 ALTER TABLE `productes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venedors`
--

DROP TABLE IF EXISTS `venedors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venedors` (
  `num_ven` int(4) NOT NULL,
  `nom` varchar(15) NOT NULL,
  `any_naix` int(4) DEFAULT NULL,
  `oficina_ven` int(4) DEFAULT NULL,
  `titol` varchar(10) DEFAULT NULL,
  `contracte` date NOT NULL,
  `director` int(4) DEFAULT NULL,
  `quota` int(4) DEFAULT NULL,
  `vendes` int(4) NOT NULL,
  PRIMARY KEY (`num_ven`),
  KEY `oficina_ven` (`oficina_ven`),
  CONSTRAINT `venedors_ibfk_1` FOREIGN KEY (`oficina_ven`) REFERENCES `oficines` (`oficina`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venedors`
--

LOCK TABLES `venedors` WRITE;
/*!40000 ALTER TABLE `venedors` DISABLE KEYS */;
INSERT INTO `venedors` (`num_ven`, `nom`, `any_naix`, `oficina_ven`, `titol`, `contracte`, `director`, `quota`, `vendes`) VALUES (101,'Dan Roberts',1945,12,'Venedor','1986-10-20',104,300000,307925),(102,'Sue Smith',1948,21,'Venedor','1986-12-10',108,350000,474050),(103,'Paul Cruz',1968,12,'Venedor','1987-03-01',104,275000,289330),(104,'Bob Smith',1960,12,'Director','1987-05-19',106,200000,142594),(105,'Bill Adams',1965,13,'Venedor','1998-02-12',104,350000,367911),(106,'Sam Clark',1952,11,'Gerent','1988-06-14',NULL,275000,299967),(107,'Nancy Angelli',1975,22,'Venedor','2005-11-14',108,300000,186042),(108,'Larry Fitch',1962,21,'Director','1989-12-10',106,350000,361865),(109,'Mary Jones',1980,11,'Venedor','2000-10-12',106,300000,392725),(110,'Tom Snyder',1970,NULL,'Venedor','1990-01-13',101,NULL,79451);
/*!40000 ALTER TABLE `venedors` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-01-14 12:08:27
