-- MariaDB dump 10.18  Distrib 10.5.8-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: asede
-- ------------------------------------------------------
-- Server version	10.5.8-MariaDB-1:10.5.8+maria~bionic

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
-- Table structure for table `komentar`
--

DROP TABLE IF EXISTS `komentar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `komentar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mim_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `time` datetime NOT NULL,
  `vote` int(11) NOT NULL,
  `content` text NOT NULL,
  `hidden` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `mim_id` (`mim_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `komentar_ibfk_1` FOREIGN KEY (`mim_id`) REFERENCES `mim` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `komentar_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `komentar`
--

LOCK TABLES `komentar` WRITE;
/*!40000 ALTER TABLE `komentar` DISABLE KEYS */;
INSERT INTO `komentar` VALUES (1,1,2,'2020-11-16 10:35:31',0,'Sudah ku bilang HDD Toshiba jelek',0),(2,1,3,'2020-11-16 10:36:01',2,'gak bisa nyeting ruter jangan sok keras',0);
/*!40000 ALTER TABLE `komentar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `komentar_vote`
--

DROP TABLE IF EXISTS `komentar_vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `komentar_vote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `komentar_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `time` datetime NOT NULL DEFAULT current_timestamp(),
  `vote` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `komentar_id` (`komentar_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `komentar_vote_ibfk_1` FOREIGN KEY (`komentar_id`) REFERENCES `komentar` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `komentar_vote_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `komentar_vote`
--

LOCK TABLES `komentar_vote` WRITE;
/*!40000 ALTER TABLE `komentar_vote` DISABLE KEYS */;
/*!40000 ALTER TABLE `komentar_vote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mim`
--

DROP TABLE IF EXISTS `mim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mim` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `time` datetime NOT NULL DEFAULT current_timestamp(),
  `title` text NOT NULL,
  `content` text NOT NULL,
  `image_url` text NOT NULL,
  `source` text DEFAULT NULL,
  `vote` int(11) NOT NULL DEFAULT 0,
  `nsfw` int(11) NOT NULL,
  `hidden` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `mim_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mim`
--

LOCK TABLES `mim` WRITE;
/*!40000 ALTER TABLE `mim` DISABLE KEYS */;
INSERT INTO `mim` VALUES (1,1,'2020-11-16 10:33:08','FF vs Bensin Impek','game baru dari mihotod pengalihan isu . tetap kawal 8-2 . eh free fire','/mim/ff.jpg','FB Dukung FF',2,0,0),(2,2,'2020-11-16 11:40:01','Perbandingan Waifu Sejuta Umat FF vs Bensin','keqing dibaca kencing (hanya bocil ar  yang tau)','/mim/ff2.jpg',NULL,6,0,0);
/*!40000 ALTER TABLE `mim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mim_vote`
--

DROP TABLE IF EXISTS `mim_vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mim_vote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mim_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `time` datetime NOT NULL,
  `vote` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mim_id` (`mim_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `mim_vote_ibfk_1` FOREIGN KEY (`mim_id`) REFERENCES `mim` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `mim_vote_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mim_vote`
--

LOCK TABLES `mim_vote` WRITE;
/*!40000 ALTER TABLE `mim_vote` DISABLE KEYS */;
/*!40000 ALTER TABLE `mim_vote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `email` text NOT NULL,
  `nohp` text NOT NULL,
  `bio` text DEFAULT NULL,
  `ua` text DEFAULT NULL,
  `verified` int(11) NOT NULL DEFAULT 0,
  `post_limit` int(11) NOT NULL DEFAULT 2,
  `banned` int(11) NOT NULL DEFAULT 0,
  `banned_reason` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'DukungFF','4d7adba9d164f9b91f62a61378e597adb0c979a15720509c3c1c4339aeecc87226d05fbe064bd0db12b031f1c9925725703224bd0e0dc02cfc61be33449845ac','dukungff@gmail.com','081234567890','Dukung Free Fire Sebagai Game Terbaik Official Asede Account\r\n\r\nFacebook : FB.com/DukungFF\r\nFacebook (Cadangan) : FB.com/DukungFF2','Titit 6.9/420',1,2,0,NULL),(2,'HenryNasution','4d7adba9d164f9b91f62a61378e597adb0c979a15720509c3c1c4339aeecc87226d05fbe064bd0db12b031f1c9925725703224bd0e0dc02cfc61be33449845ac','uwa@ngacokamu.com','081234567890','Harddisk Toshiba jelek saran saya ganti','Titit 6.9/420',0,2,0,NULL),(3,'emthoifur','4d7adba9d164f9b91f62a61378e597adb0c979a15720509c3c1c4339aeecc87226d05fbe064bd0db12b031f1c9925725703224bd0e0dc02cfc61be33449845ac','nyeting@ruter.com','081234567890','Hari gini masih gak bisa nyeting ruter . wassalam','Titit 6.9/420',0,2,0,NULL),(4,'ronihartono','4d7adba9d164f9b91f62a61378e597adb0c979a15720509c3c1c4339aeecc87226d05fbe064bd0db12b031f1c9925725703224bd0e0dc02cfc61be33449845ac','kamu@bohong.com','081234567890','KAMU BOHONG!!!','Titit 6.9/420',0,2,0,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-01  3:28:38
