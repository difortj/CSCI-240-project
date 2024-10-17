-- MySQL dump 10.13  Distrib 8.0.39, for Linux (x86_64)
--
-- Host: localhost    Database: WW2_Aircraft_Carriers
-- ------------------------------------------------------
-- Server version	8.0.39-0ubuntu0.24.04.2

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
-- Table structure for table `AircraftCarriers`
--

DROP TABLE IF EXISTS `AircraftCarriers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AircraftCarriers` (
  `CarrierID` varchar(10) NOT NULL,
  `ShipID` int DEFAULT NULL,
  `NumberofAircraft` int DEFAULT NULL,
  `Runwaylengthinfeet` int DEFAULT NULL,
  `CommissionDate` date DEFAULT NULL,
  PRIMARY KEY (`CarrierID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AircraftCarriers`
--

LOCK TABLES `AircraftCarriers` WRITE;
/*!40000 ALTER TABLE `AircraftCarriers` DISABLE KEYS */;
INSERT INTO `AircraftCarriers` VALUES ('CV-2',4,78,888,'1927-12-14'),('CV-5',2,90,824,'1937-09-30'),('CV-6',1,96,809,'1938-05-12'),('CV-8',3,72,824,'1941-10-20'),('IJN-1',5,91,855,'1927-03-25'),('IJN-2',6,90,812,'1929-11-30');
/*!40000 ALTER TABLE `AircraftCarriers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Battles`
--

DROP TABLE IF EXISTS `Battles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Battles` (
  `BattleID` int NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Date` varchar(50) DEFAULT NULL,
  `Location` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`BattleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Battles`
--

LOCK TABLES `Battles` WRITE;
/*!40000 ALTER TABLE `Battles` DISABLE KEYS */;
INSERT INTO `Battles` VALUES (1,'Pearl Harbor','Dec 7, 1941','Pearl Harbor'),(2,'Battle of Coral Sea','May 4-8, 1942','Coral Sea'),(3,'Battle of Midway','Jun 4-7, 1942','Midway Atoll'),(4,'Doolittle Raid','Apr 18, 1942','Tokyo'),(5,'Battle of Santa Cruz','Oct 25-27, 1942','Santa Cruz Island'),(6,'Battle of the Philippine Sea','Jun 19-20, 1944','Philippine Sea');
/*!40000 ALTER TABLE `Battles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Operations`
--

DROP TABLE IF EXISTS `Operations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Operations` (
  `ShipID` int DEFAULT NULL,
  `BattleID` int DEFAULT NULL,
  `Shipoutcome` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Operations`
--

LOCK TABLES `Operations` WRITE;
/*!40000 ALTER TABLE `Operations` DISABLE KEYS */;
INSERT INTO `Operations` VALUES (1,3,'Survived'),(1,4,'Survived'),(1,5,'Survived'),(1,6,'Survived'),(2,2,'Survived'),(2,3,'Sunk'),(3,3,'Survived'),(3,4,'Survived'),(3,5,'Sunk'),(4,2,'Sunk'),(5,1,'Survived'),(5,3,'Sunk'),(6,1,'Survived'),(6,3,'Sunk');
/*!40000 ALTER TABLE `Operations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ship`
--

DROP TABLE IF EXISTS `Ship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ship` (
  `ShipID` int NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ShipID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ship`
--

LOCK TABLES `Ship` WRITE;
/*!40000 ALTER TABLE `Ship` DISABLE KEYS */;
INSERT INTO `Ship` VALUES (1,'USS Enterprise'),(2,'USS Yorktown'),(3,'USS Hornet'),(4,'USS Lexington'),(5,'IJN Akagi'),(6,'IJN Kaga');
/*!40000 ALTER TABLE `Ship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ShipCommanders`
--

DROP TABLE IF EXISTS `ShipCommanders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ShipCommanders` (
  `CommanderID` int NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Rank` varchar(20) DEFAULT NULL,
  `ShipID` int DEFAULT NULL,
  PRIMARY KEY (`CommanderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ShipCommanders`
--

LOCK TABLES `ShipCommanders` WRITE;
/*!40000 ALTER TABLE `ShipCommanders` DISABLE KEYS */;
INSERT INTO `ShipCommanders` VALUES (1,'Newton H. White','Captain',1),(2,'Charles A. Pownall','Captain',1),(3,'Ernest D. McWhorter','Captain',2),(4,'Elliott Buckmaster','Captain',2),(5,'Marc A. Mitscher','Captain',3),(6,'Taijiro Aoki','Captain',5);
/*!40000 ALTER TABLE `ShipCommanders` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-17  5:16:17
