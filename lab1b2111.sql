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
  PRIMARY KEY (`id_tch`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tchr`
--

LOCK TABLES `tchr` WRITE;
/*!40000 ALTER TABLE `tchr` DISABLE KEYS */;
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

-- Dump completed on 2014-11-21  9:20:26
