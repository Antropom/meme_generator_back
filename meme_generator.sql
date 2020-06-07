-- MariaDB dump 10.17  Distrib 10.4.13-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: meme_generator
-- ------------------------------------------------------
-- Server version	10.4.13-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `base_pic`
--

DROP TABLE IF EXISTS `base_pic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `base_pic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wilder_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`wilder_id`),
  KEY `fk_base_pics_wilder1_idx` (`wilder_id`),
  CONSTRAINT `fk_base_pics_wilder1` FOREIGN KEY (`wilder_id`) REFERENCES `wilder` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_pic`
--

LOCK TABLES `base_pic` WRITE;
/*!40000 ALTER TABLE `base_pic` DISABLE KEYS */;
INSERT INTO `base_pic` VALUES (1,'audre_cpe','https://www.dropbox.com/s/iw98i0xca1li91z/audrey_cpe.png?raw=1',3),(2,'benoit_penseur','https://www.dropbox.com/s/rlq3vfcnp0r3qbh/benoit_penseur.png?raw=1',4),(3,'benoit','https://www.dropbox.com/s/kuc00ynn7g7cxrz/benoit.png?raw=1',4),(4,'judgement_face','https://www.dropbox.com/s/i1v76di17ttdv85/judgement_face.png?raw=1',1),(5,'sleepy','https://www.dropbox.com/s/ztj5bz9vpkf013q/sleepy.png?raw=1',2);
/*!40000 ALTER TABLE `base_pic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meme`
--

DROP TABLE IF EXISTS `meme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `txt1` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `txt2` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `base_pics_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`base_pics_id`),
  KEY `fk_memes_base_pics_idx` (`base_pics_id`),
  CONSTRAINT `fk_memes_base_pics` FOREIGN KEY (`base_pics_id`) REFERENCES `base_pic` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meme`
--

LOCK TABLES `meme` WRITE;
/*!40000 ALTER TABLE `meme` DISABLE KEYS */;
INSERT INTO `meme` VALUES (1,'test','test2',2);
/*!40000 ALTER TABLE `meme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wilder`
--

DROP TABLE IF EXISTS `wilder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wilder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wilder`
--

LOCK TABLES `wilder` WRITE;
/*!40000 ALTER TABLE `wilder` DISABLE KEYS */;
INSERT INTO `wilder` VALUES (1,'Geoffroy'),(2,'Louis'),(3,'Audrey'),(4,'Benoît');
/*!40000 ALTER TABLE `wilder` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-07 16:49:34
