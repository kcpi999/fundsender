-- MySQL dump 10.13  Distrib 5.5.47, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: usercash
-- ------------------------------------------------------
-- Server version	5.5.47-0ubuntu0.14.04.1

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
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `text` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,2,'have you ever been to Detroit City ?'),(2,4,'My hands are full, could you please help me open the door ?'),(3,4,'so very nice that would be'),(4,1,'Christmas time, coming soon.'),(5,1,'I gotta call my babushka and ask her for a date.'),(6,4,'subscribe button, I cant see it. Anyone ?'),(7,2,'Jacky, you so silent.');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES ('2016_07_14_081046_create_table_users',1),('2016_07_14_082016_create_table_comments',1),('2016_07_14_165543_alter_users_table',2),('2016_07_17_050837_create_table_transfers',3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transfers`
--

DROP TABLE IF EXISTS `transfers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transfers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_from_id` int(11) NOT NULL COMMENT 'Who sent money',
  `user_to_id` int(11) NOT NULL COMMENT 'Who recieves money',
  `amount` decimal(10,2) NOT NULL COMMENT 'amount of money',
  `token` varchar(13) COLLATE utf8_unicode_ci NOT NULL COMMENT 'token for preventing double execution due to http bugs',
  `comment` text COLLATE utf8_unicode_ci COMMENT 'comment',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 - done, 0 - not done.',
  `browser` varchar(512) COLLATE utf8_unicode_ci NOT NULL COMMENT 'request sender browser info',
  `ip` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'request sender IP',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token_ufrom_uto` (`token`,`user_from_id`,`user_to_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transfers`
--

LOCK TABLES `transfers` WRITE;
/*!40000 ALTER TABLE `transfers` DISABLE KEYS */;
INSERT INTO `transfers` VALUES (1,7,2,10.00,'1468736412259',NULL,1,'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:45.0) Gecko/20100101 Firefox/45.0','127.0.0.1','2016-07-17 00:20:12','2016-07-17 00:20:12'),(2,7,2,10.00,'1468736719820',NULL,1,'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:45.0) Gecko/20100101 Firefox/45.0','127.0.0.1','2016-07-17 00:25:19','2016-07-17 00:25:19'),(3,7,2,10.00,'1468736814870',NULL,1,'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:45.0) Gecko/20100101 Firefox/45.0','127.0.0.1','2016-07-17 00:26:54','2016-07-17 00:26:54'),(4,7,2,10.00,'1468736857832',NULL,1,'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:45.0) Gecko/20100101 Firefox/45.0','127.0.0.1','2016-07-17 00:27:37','2016-07-17 00:27:37'),(5,7,2,10.00,'1468736882011',NULL,1,'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:45.0) Gecko/20100101 Firefox/45.0','127.0.0.1','2016-07-17 00:28:02','2016-07-17 00:28:02'),(6,7,6,777.00,'1468759981033',NULL,1,'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:45.0) Gecko/20100101 Firefox/45.0','127.0.0.1','2016-07-17 06:53:01','2016-07-17 06:53:01'),(7,7,2,777.00,'1468760736365',NULL,1,'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:45.0) Gecko/20100101 Firefox/45.0','127.0.0.1','2016-07-17 07:05:36','2016-07-17 07:05:36'),(8,7,2,777.00,'1468760776032',NULL,1,'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:45.0) Gecko/20100101 Firefox/45.0','127.0.0.1','2016-07-17 07:06:16','2016-07-17 07:06:16'),(9,7,6,15.00,'1468760853224',NULL,1,'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:45.0) Gecko/20100101 Firefox/45.0','127.0.0.1','2016-07-17 07:07:33','2016-07-17 07:07:33'),(10,7,6,17.00,'1468761027010',NULL,1,'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:45.0) Gecko/20100101 Firefox/45.0','127.0.0.1','2016-07-17 07:10:27','2016-07-17 07:10:27'),(11,7,6,17.00,'1468761151220',NULL,1,'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:45.0) Gecko/20100101 Firefox/45.0','127.0.0.1','2016-07-17 07:12:31','2016-07-17 07:12:31'),(12,7,6,10.00,'1468761211849',NULL,1,'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:45.0) Gecko/20100101 Firefox/45.0','127.0.0.1','2016-07-17 07:13:31','2016-07-17 07:13:31'),(13,7,6,10.00,'1468761226777',NULL,1,'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:45.0) Gecko/20100101 Firefox/45.0','127.0.0.1','2016-07-17 07:13:46','2016-07-17 07:13:46'),(14,7,6,10.00,'1468761270423',NULL,1,'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:45.0) Gecko/20100101 Firefox/45.0','127.0.0.1','2016-07-17 07:14:30','2016-07-17 07:14:30'),(15,7,6,100.00,'1468761285580',NULL,1,'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:45.0) Gecko/20100101 Firefox/45.0','127.0.0.1','2016-07-17 07:14:45','2016-07-17 07:14:45'),(16,7,6,10.00,'1468761340953',NULL,1,'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:45.0) Gecko/20100101 Firefox/45.0','127.0.0.1','2016-07-17 07:15:41','2016-07-17 07:15:41'),(17,7,2,10.00,'1468761362993',NULL,1,'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:45.0) Gecko/20100101 Firefox/45.0','127.0.0.1','2016-07-17 07:16:03','2016-07-17 07:16:03'),(18,7,2,10.05,'1468761372438',NULL,1,'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:45.0) Gecko/20100101 Firefox/45.0','127.0.0.1','2016-07-17 07:16:12','2016-07-17 07:16:12'),(19,7,2,10.00,'1468761382406',NULL,1,'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:45.0) Gecko/20100101 Firefox/45.0','127.0.0.1','2016-07-17 07:16:22','2016-07-17 07:16:22'),(20,7,3,20.00,'1468761927308',NULL,1,'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:45.0) Gecko/20100101 Firefox/45.0','127.0.0.1','2016-07-17 07:25:27','2016-07-17 07:25:27'),(21,7,1,10.00,'1468764156596',NULL,1,'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:45.0) Gecko/20100101 Firefox/45.0','127.0.0.1','2016-07-17 08:02:36','2016-07-17 08:02:36'),(24,7,1,10.00,'1468764408744',NULL,1,'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:45.0) Gecko/20100101 Firefox/45.0','127.0.0.1','2016-07-17 08:06:48','2016-07-17 08:06:48'),(25,7,1,10.00,'1468764411499',NULL,1,'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:45.0) Gecko/20100101 Firefox/45.0','127.0.0.1','2016-07-17 08:06:51','2016-07-17 08:06:51'),(26,7,4,10.00,'1468772445708',NULL,1,'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:45.0) Gecko/20100101 Firefox/45.0','127.0.0.1','2016-07-17 10:20:45','2016-07-17 10:20:45'),(27,7,4,10.00,'1468772519379',NULL,1,'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:45.0) Gecko/20100101 Firefox/45.0','127.0.0.1','2016-07-17 10:21:59','2016-07-17 10:21:59'),(28,7,4,10.00,'1468772882806',NULL,1,'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:45.0) Gecko/20100101 Firefox/45.0','127.0.0.1','2016-07-17 10:28:02','2016-07-17 10:28:02'),(29,7,4,11.00,'1468772966538',NULL,1,'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:45.0) Gecko/20100101 Firefox/45.0','127.0.0.1','2016-07-17 10:29:26','2016-07-17 10:29:26'),(30,7,4,11.00,'1468774062712',NULL,1,'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:45.0) Gecko/20100101 Firefox/45.0','127.0.0.1','2016-07-17 10:47:42','2016-07-17 10:47:42'),(31,1,4,10.00,'1468774106307',NULL,1,'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:45.0) Gecko/20100101 Firefox/45.0','127.0.0.1','2016-07-17 10:48:26','2016-07-17 10:48:26'),(32,1,5,33.35,'1468774152900',NULL,1,'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:45.0) Gecko/20100101 Firefox/45.0','127.0.0.1','2016-07-17 10:49:12','2016-07-17 10:49:12'),(33,1,3,10.00,'1468774407316',NULL,1,'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:45.0) Gecko/20100101 Firefox/45.0','127.0.0.1','2016-07-17 10:53:27','2016-07-17 10:53:27'),(34,7,5,10.00,'1468775195197',NULL,1,'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:45.0) Gecko/20100101 Firefox/45.0','127.0.0.1','2016-07-17 11:06:35','2016-07-17 11:06:35'),(35,7,5,10.00,'1468775198688',NULL,1,'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:45.0) Gecko/20100101 Firefox/45.0','127.0.0.1','2016-07-17 11:06:38','2016-07-17 11:06:38'),(36,7,5,10.00,'1468775200427',NULL,1,'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:45.0) Gecko/20100101 Firefox/45.0','127.0.0.1','2016-07-17 11:06:40','2016-07-17 11:06:40'),(37,7,5,14.00,'1468775299034',NULL,1,'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:45.0) Gecko/20100101 Firefox/45.0','127.0.0.1','2016-07-17 11:08:19','2016-07-17 11:08:19');
/*!40000 ALTER TABLE `transfers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `balance` decimal(10,2) NOT NULL,
  `email` varchar(99) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Ivan',420979.00,NULL,'',NULL,NULL,'2016-07-17 10:53:27'),(2,'Maria Jacobs',306635.29,NULL,'',NULL,NULL,'2016-07-17 07:16:22'),(3,'Jacky',6000142.70,NULL,'',NULL,NULL,'2016-07-17 10:53:27'),(4,'Christie',621.26,NULL,'',NULL,NULL,'2016-07-17 10:48:26'),(5,'Melissa',77.35,'ii@ii.ii','$2y$10$4afG0n5R1wVm.vbd7Fnl2OaSfxgsPEV3NHKQkCMQ8n19mcpqJU1.u','4CWZ4s63XyHmsuoGoMT2uCpl6TFAw0jeisiSlPOIl883R6mfnGQqLiIwqWsb','2016-07-15 10:17:06','2016-07-17 11:08:19'),(6,'Jacobs',966.00,'ll@ll.ll','$2y$10$FA78.4ve8HlRHimYpmD6C.ILewYWrI1/Is.dsdPgQPGhcFemo9tTm','AlCkn4VcQJa2jYenp3IvNKZYXXOm6SIbpny3FERrvurastNUDwnXsLIWb84S','2016-07-15 12:39:33','2016-07-17 07:15:41'),(7,'Kristof',797379.60,'kkk@kk.kk','$2y$10$ife7FzKlH.DEtStXd.biO.ohN8/Sj0iFI.mbDEm/GfvgApsdd6Ce6','gUGsIjG7kT9gn2do52p9V5zAbcBTwKMNlrfZCpfXTGkh5BnjwMSUPxSMGK1R','2016-07-15 13:37:58','2016-07-17 11:15:11'),(8,'yyy',0.00,'yyy@yy.yy','$2y$10$MDem4Sr2FK93InxDT94EdOeHLdTC9QkFjH/tY5unzD8l9MU0DHwna','lmcmkz5pQ6RfRd0cqxs1j2rHKpeBJG7zPKIQrdiKUKugTwNi5NA8een3rfRo','2016-07-17 10:53:09','2016-07-17 11:06:16');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-18  0:16:04
