-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: the_tech_blogs_db
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `comment_text` varchar(255) NOT NULL,
  `user_id` int NOT NULL,
  `post_id` int NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'Testing comments kt June 2020',1,3,'2020-06-18 05:57:11','2020-06-18 05:57:11'),(2,'Testing2 comments kt June 2020',1,3,'2020-06-18 06:40:39','2020-06-18 06:40:39');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `post_url` varchar(255) NOT NULL,
  `user_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `post_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,'Runbuddy reaches 2 million subscribers','https://techblogsample/press',1,'2020-06-17 22:55:37','2020-06-18 06:47:13'),(3,'And again Runbuddy reaches 2 million subscribers','https://runbuddy.com/press',1,'2020-06-18 05:56:03','2020-06-18 05:56:03'),(4,'Runbuddy reaches 2 million subscribers','https://runbuddy.com/press',1,'2020-06-18 05:56:37','2020-06-18 06:38:43'),(5,'Runbuddy reaches 1 million subscribers','https://runbuddy.com/press',1,'2020-06-18 06:35:08','2020-06-18 06:35:08'),(6,'And again Runbuddy reaches 2 million subscribers','https://runbuddy.com/press',1,'2020-06-18 06:35:12','2020-06-18 06:35:12'),(7,'Runbuddy reaches 3 million subscribers','https://runbuddy.com/press',1,'2020-06-18 06:38:02','2020-06-18 06:38:02'),(9,'Runbuddy reaches 4 million subscribers','https://runbuddy.com/press',1,'2020-06-18 06:46:53','2020-06-18 06:46:53');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `session` (
  `sid` varchar(36) NOT NULL,
  `expires` datetime DEFAULT NULL,
  `data` text,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session`
--

LOCK TABLES `session` WRITE;
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
INSERT INTO `session` VALUES ('1IQJgG9-wpNhQqnPRwFLoszaVOq2DRsC','2020-06-19 13:35:02','{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"user_id\":13,\"username\":\"Sonia\",\"loggedIn\":true}','2020-06-18 13:33:33','2020-06-18 13:35:02'),('2yCLodVmS7T_CARk3FZPHQbNZSsWeLeM','2020-06-19 13:32:51','{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"user_id\":10,\"username\":\"Ed\",\"loggedIn\":true}','2020-06-18 13:32:22','2020-06-18 13:32:51'),('4Nfy6yqjjWdxINv_OdcvhRdaAfUd4mqA','2020-06-19 13:35:23','{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"user_id\":13,\"username\":\"Sonia\",\"loggedIn\":true}','2020-06-18 13:35:10','2020-06-18 13:35:23'),('9CGXW7Z6miENTdtpYq_AqBRyi6oGTNh-','2020-06-19 12:48:25','{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"user_id\":12,\"username\":\"Sam\",\"loggedIn\":true}','2020-06-18 12:46:46','2020-06-18 12:48:25'),('dIaQu6yjo8V47ZD6TB9Jyn9jUr9Vvhq4','2020-06-19 14:38:19','{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}','2020-06-18 14:15:26','2020-06-18 14:38:19'),('lkMHb90P8CPq033e7PbYUKih2agxrSGB','2020-06-19 13:33:24','{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"user_id\":10,\"username\":\"Ed\",\"loggedIn\":true}','2020-06-18 13:32:59','2020-06-18 13:33:24'),('TDiK6zVexJ0p73FSC7QCoEoBwNAnB-Rt','2020-06-19 13:09:24','{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}','2020-06-18 13:09:18','2020-06-18 13:09:24'),('VilenDsBwCSYL00NtaonAhhh9jyQ86HG','2020-06-19 14:44:29','{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}','2020-06-18 14:44:27','2020-06-18 14:44:29'),('YK6QRn6Y1hKoqCsPH2Q-M26ZCYbZflTF','2020-06-19 14:49:37','{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}','2020-06-18 14:49:07','2020-06-18 14:49:37');
/*!40000 ALTER TABLE `session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Lernatino','lernatin0@gmail.com','$2b$10$7FXKkb4hz92DTz0k.XGNaOnQXC2PXmYLfRkGLG12S9AmohxvrOLMK'),(2,'Mary','mary@gmail.com','$2b$10$IlQ2SCDM1.suYJ3g3In/9u3/2n31/D8wgU98tDvZ5JiZODgJEDDtO'),(7,'Carl','carl@gmail.com','$2b$10$prj71WFibCpHv1Qwbt2TPuiAu8Nc4NcwzN38H7rfSsYIAndBd0jmi'),(8,'Sabine','sab@gmail.com','$2b$10$CRZiJesrbItwpyT45TowhOFbQqn8OvJ6dvUHMZFcXV6cdN7lobuoe'),(10,'Ed','ed@gmail.com','$2b$10$G.KT1mYiOC6Ot4Dc.rO1COZShKs7RdG.z.gIDZCoXfwQjeoMhS24O'),(11,'Safron','safron@gmail.com','$2b$10$7HdnY/Xug6So6RWe9FK0rue4duMsWm56I8DgFyuPjgFXIRkiKOu2q'),(12,'Sam','sam@hotmail.com','$2b$10$8CqwYYwCuyLVqVMgRuVhPuKSogCan.JJDSv80DU/vdT2zxOm/AjJq'),(13,'Sonia','sonia@company.ca','$2b$10$uIMBPaWVjBVYVGUsX0NL7e8b8xFEsdHPbrYOyhnmjqWogUDIVra52'),(14,'Fred','fred@lake.com','$2b$10$kseAqm4xiCVssJZsPlbrAu5WPtGt8Z52cJGS9mT5cD42cNoZR2oPq');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vote`
--

DROP TABLE IF EXISTS `vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vote` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `post_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vote_post_id_user_id_unique` (`user_id`,`post_id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `vote_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `vote_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vote`
--

LOCK TABLES `vote` WRITE;
/*!40000 ALTER TABLE `vote` DISABLE KEYS */;
INSERT INTO `vote` VALUES (1,1,1),(3,1,4),(10,8,7);
/*!40000 ALTER TABLE `vote` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-19  2:17:15
