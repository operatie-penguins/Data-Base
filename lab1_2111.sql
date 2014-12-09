-- MySQL dump 10.13  Distrib 5.5.40, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: lab1
-- ------------------------------------------------------
-- Server version	5.5.40-0+wheezy1

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
-- Table structure for table `contract`
--

DROP TABLE IF EXISTS `contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contract` (
  `id_cont` int(11) NOT NULL,
  `id_stud` int(11) DEFAULT NULL,
  `datet` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_crs` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_cont`),
  KEY `id_stud` (`id_stud`),
  KEY `id_crs` (`id_crs`),
  CONSTRAINT `contract_ibfk_1` FOREIGN KEY (`id_stud`) REFERENCES `student` (`id_stud`),
  CONSTRAINT `contract_ibfk_2` FOREIGN KEY (`id_crs`) REFERENCES `course` (`id_crs`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contract`
--

LOCK TABLES `contract` WRITE;
/*!40000 ALTER TABLE `contract` DISABLE KEYS */;
INSERT INTO `contract` VALUES (1,2,'2012-12-14 20:00:00',3),(2,1,'2011-10-09 20:00:00',4),(4,5,'2011-10-09 20:00:00',2),(5,3,'2011-10-09 20:00:00',5);
/*!40000 ALTER TABLE `contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `id_crs` int(11) NOT NULL,
  `title` varchar(20) DEFAULT NULL,
  `defcrs` varchar(20) DEFAULT NULL,
  `cost` int(11) DEFAULT NULL,
  `hur` int(11) DEFAULT NULL,
  `id_tch` int(11) DEFAULT NULL,
  `typcrs` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_crs`),
  KEY `id_tch` (`id_tch`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`id_tch`) REFERENCES `tchr` (`id_tch`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'SQL_1','hell',500,17,4,'pro'),(2,'AVTU','qwe',600,18,5,'pro'),(3,'IRE','hte',700,98,1,'norm'),(4,'SQL_true','jyi',800,24,2,'norm'),(5,'IET','jyi',900,21,3,'easy'),(6,'IRE','jyi',1000,20,3,'easy'),(7,'SQL_1','jyi',2000,40,4,'profi'),(8,'SQL_1','jyi',1700,35,4,'norm'),(9,'IET','fgh',1700,38,1,'easy');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `id_stud` int(11) NOT NULL,
  `name_stud` varchar(20) DEFAULT NULL,
  `org` varchar(20) DEFAULT NULL,
  `cont` varchar(20) DEFAULT NULL,
  `cty` varchar(20) DEFAULT NULL,
  `cntr` varchar(20) DEFAULT NULL,
  `discnt` int(11) DEFAULT NULL,
  `sx` char(1) DEFAULT NULL,
  PRIMARY KEY (`id_stud`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'Nikolay Gogol\'','Repushko','533-64-72','Vologda','Russia',15,'m'),(2,'Vladimir Kolesnikov','Oblako','vladobl@ya.ru','Moscow','Russia',1,'m'),(3,'Yuana Ruduia','Oblako','Yaobl@ya.ru','Moscow','Russia',0,'f'),(4,'Anna Rud\'','Rostel','Rud@ya.ru','Moscow','Russia',4,'f'),(5,'Mikhail Konov','kievstar','kievstar@ya.ru','Kiev','Ukrane',3,'m');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tchr`
--

DROP TABLE IF EXISTS `tchr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tchr` (
  `id_tch` int(11) NOT NULL,
  `nametch` varchar(20) DEFAULT NULL,
  `conttch` varchar(20) DEFAULT NULL,
  `sx_tc` char(1) DEFAULT NULL,
  `cost_per_hour` int(11) DEFAULT NULL,
  `degree` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_tch`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tchr`
--

LOCK TABLES `tchr` WRITE;
/*!40000 ALTER TABLE `tchr` DISABLE KEYS */;
INSERT INTO `tchr` VALUES (1,'Serge\' Retov','123-14-51','m',500,'none'),(2,'Oleg Torov','123-14-52','m',1100,'none'),(3,'Serge\' Mokrov','123-14-53','m',700,'docent'),(4,'Grogori\' Merov','123-14-54','m',1300,'professor'),(5,'Maria Veskova','123-14-55','f',900,'professor'),(6,'Yana Berkova','123-14-56','f',800,'docent'),(7,'Vera Sarovskaia','123-14-57','f',800,'none');
/*!40000 ALTER TABLE `tchr` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-11-22 15:27:17
