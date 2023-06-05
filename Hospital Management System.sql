-- MariaDB dump 10.19  Distrib 10.4.18-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: hospital
-- ------------------------------------------------------
-- Server version	10.4.18-MariaDB

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
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointment` (
  `Appointment_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Date` varchar(255) NOT NULL,
  `DOCTOR_ID` int(11) NOT NULL,
  `Patient_ID` int(11) NOT NULL,
  PRIMARY KEY (`Appointment_ID`),
  KEY `DOCTOR_ID` (`DOCTOR_ID`),
  KEY `Patient_ID` (`Patient_ID`),
  CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`DOCTOR_ID`) REFERENCES `doctor` (`Doctor_ID`),
  CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`Patient_ID`) REFERENCES `patient` (`Patient_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` VALUES (1,'2021-01-22',1,2),(2,'2021-02-12',2,1),(3,'2021-02-24',3,4),(4,'2021-04-01',4,5),(5,'2021-05-06',5,3),(6,'2021-07-09',2,1);
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disease`
--

DROP TABLE IF EXISTS `disease`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disease` (
  `Disease_ID` int(11) NOT NULL,
  `Disease_type` varchar(255) NOT NULL,
  `Disease_name` varchar(255) NOT NULL,
  PRIMARY KEY (`Disease_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disease`
--

LOCK TABLES `disease` WRITE;
/*!40000 ALTER TABLE `disease` DISABLE KEYS */;
INSERT INTO `disease` VALUES (1,'communicable disease','corona'),(2,'hereditary disease','Diabetes'),(3,'non-communicable disease','cancer'),(4,'heart disease','Coronary artery'),(5,'Liver disease','Hepatitis');
/*!40000 ALTER TABLE `disease` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disease_report`
--

DROP TABLE IF EXISTS `disease_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disease_report` (
  `Report_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Patient_ID` int(11) NOT NULL,
  `Disease_ID` int(11) NOT NULL,
  PRIMARY KEY (`Report_ID`),
  KEY `Disease_ID` (`Disease_ID`),
  KEY `Patient_ID` (`Patient_ID`),
  CONSTRAINT `disease_report_ibfk_1` FOREIGN KEY (`Disease_ID`) REFERENCES `disease` (`Disease_ID`),
  CONSTRAINT `disease_report_ibfk_2` FOREIGN KEY (`Patient_ID`) REFERENCES `patient` (`Patient_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disease_report`
--

LOCK TABLES `disease_report` WRITE;
/*!40000 ALTER TABLE `disease_report` DISABLE KEYS */;
INSERT INTO `disease_report` VALUES (1,2,1),(2,1,3),(3,3,2),(4,5,4),(5,4,5);
/*!40000 ALTER TABLE `disease_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctor` (
  `Name` varchar(255) NOT NULL,
  `Doctor_ID` int(11) NOT NULL AUTO_INCREMENT,
  `location` varchar(255) NOT NULL,
  `Phone` varchar(255) NOT NULL,
  PRIMARY KEY (`Doctor_ID`),
  UNIQUE KEY `Phone` (`Phone`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES ('Ashim',1,'Jhapa','988-091-28'),('Nilesh',2,'Hetauda','977-112-36'),('Ruku',3,'Simra','966-464-24'),('Bedisha',4,'Gaighat','101-505-75'),('Dibyan',5,'Pokhara','057-921-04');
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient` (
  `Name` varchar(255) NOT NULL,
  `Patient_ID` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  PRIMARY KEY (`Patient_ID`),
  UNIQUE KEY `Phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES ('Amrita',1,'Pathlaiya','981-847-970'),('Anita',2,'Fattepur','981-927-000'),('Nischal',3,'Dharan','982-771-784'),('Anuska',4,'Biratnagar','901-255-366'),('Anju',5,'Lahan','001-231-444');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-28  9:50:59
