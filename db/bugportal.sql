-- MySQL dump 10.14  Distrib 5.5.40-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: bugportal
-- ------------------------------------------------------
-- Server version	5.5.40-MariaDB

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
-- Table structure for table `bugs`
--

DROP TABLE IF EXISTS `bugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bugs` (
  `bug_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `posted_by` varchar(64) NOT NULL DEFAULT 'Unknown',
  `posted_on` datetime DEFAULT NULL,
  `domain` varchar(32) NOT NULL,
  `overview` varchar(64) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'Pending',
  `description` varchar(500) NOT NULL,
  `assign_to` varchar(64) NOT NULL DEFAULT 'Not Assigned',
  `assign_on` datetime DEFAULT NULL,
  `solved_on` datetime DEFAULT NULL,
  `solution` varchar(250) NOT NULL DEFAULT 'Not Solved',
  `feedback` varchar(64) NOT NULL DEFAULT '--------',
  `filter` varchar(15) NOT NULL DEFAULT 'Block',
  PRIMARY KEY (`bug_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='Will store all bugs info';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `consumers`
--

DROP TABLE IF EXISTS `consumers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consumers` (
  `username` varchar(64) NOT NULL,
  `password` varchar(64) NOT NULL,
  `email` varchar(64) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `city` varchar(64) DEFAULT NULL,
  `consumer_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gender` varchar(20) DEFAULT NULL,
  `dob` varchar(20) DEFAULT NULL,
  `joined_on` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`consumer_id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `experts`
--

DROP TABLE IF EXISTS `experts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `experts` (
  `expert_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `password` varchar(64) NOT NULL,
  `address` varchar(150) DEFAULT NULL,
  `phone` longtext NOT NULL,
  `email` varchar(64) NOT NULL,
  `domain` varchar(45) NOT NULL,
  `city` varchar(45) DEFAULT NULL,
  `gender` varchar(15) DEFAULT NULL,
  `dob` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`expert_id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `monitors`
--

DROP TABLE IF EXISTS `monitors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monitors` (
  `username` varchar(64) NOT NULL,
  `password` varchar(64) NOT NULL,
  `monitor_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`monitor_id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `pro_name` varchar(64) NOT NULL,
  `pro_desc` varchar(128) NOT NULL,
  `pro_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`pro_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-04-04 13:40:28
