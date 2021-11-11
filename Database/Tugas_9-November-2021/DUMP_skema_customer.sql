-- MySQL dump 10.13  Distrib 8.0.26, for Linux (x86_64)
--
-- Host: localhost    Database: skema_customer
-- ------------------------------------------------------
-- Server version	8.0.27-0ubuntu0.21.04.1

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
-- Table structure for table `Picture`
--

DROP TABLE IF EXISTS `Picture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Picture` (
  `PictureID` int unsigned NOT NULL AUTO_INCREMENT,
  `PictureData` longblob NOT NULL,
  `FileName` varchar(100) NOT NULL,
  `FileType` varchar(10) NOT NULL,
  PRIMARY KEY (`PictureID`),
  UNIQUE KEY `FileName` (`FileName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Picture`
--

LOCK TABLES `Picture` WRITE;
/*!40000 ALTER TABLE `Picture` DISABLE KEYS */;
/*!40000 ALTER TABLE `Picture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblCustomer`
--

DROP TABLE IF EXISTS `tblCustomer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblCustomer` (
  `CustomerID` int unsigned NOT NULL AUTO_INCREMENT,
  `TitleID` int unsigned NOT NULL,
  `FirstName` varchar(30) NOT NULL,
  `MiddleName` varchar(30) NOT NULL,
  `LastName` varchar(30) NOT NULL,
  `SuffixID` int unsigned NOT NULL,
  `CompanyID` int unsigned DEFAULT NULL,
  `JobTitle` varchar(30) DEFAULT NULL,
  `PictureID` int unsigned DEFAULT NULL,
  `EmailTypeID` int unsigned NOT NULL,
  `Email1` varchar(100) DEFAULT NULL,
  `Email2` varchar(100) DEFAULT NULL,
  `Email3` varchar(100) DEFAULT NULL,
  `WebPageAddress` varchar(100) DEFAULT NULL,
  `IMAddress` varchar(100) DEFAULT NULL,
  `PhoneNumberTypeID` int unsigned NOT NULL,
  `PhoneNumberTypeID1` int unsigned DEFAULT NULL,
  `PhoneNumberTypeID2` int unsigned DEFAULT NULL,
  `PhoneNumberTypeID3` int unsigned DEFAULT NULL,
  `AddressTypeID` int unsigned DEFAULT NULL,
  `Notes` varchar(100) DEFAULT NULL,
  `TempID` int unsigned DEFAULT NULL,
  `RatingID` int unsigned NOT NULL,
  `SalesPersonID` int unsigned DEFAULT NULL,
  PRIMARY KEY (`CustomerID`),
  KEY `fk_customer_TitleID` (`TitleID`),
  KEY `fk_customer_SuffixID` (`SuffixID`),
  KEY `fk_customer_PictureID` (`PictureID`),
  KEY `fk_customer_PhoneNumberTypeID` (`PhoneNumberTypeID`),
  KEY `fk_customer_PhoneNumberTypeID1` (`PhoneNumberTypeID1`),
  KEY `fk_customer_PhoneNumberTypeID2` (`PhoneNumberTypeID2`),
  KEY `fk_customer_PhoneNumberTypeID3` (`PhoneNumberTypeID3`),
  KEY `fk_customer_AddressTypeID` (`AddressTypeID`),
  CONSTRAINT `fk_customer_AddressTypeID` FOREIGN KEY (`AddressTypeID`) REFERENCES `tlkAddressType` (`AddressTypeID`),
  CONSTRAINT `fk_customer_PhoneNumberTypeID` FOREIGN KEY (`PhoneNumberTypeID`) REFERENCES `tlkPhoneNumberType` (`PhoneNumberTypeID`),
  CONSTRAINT `fk_customer_PhoneNumberTypeID1` FOREIGN KEY (`PhoneNumberTypeID1`) REFERENCES `tlkPhoneNumberType_1` (`PhoneNumberTypeID`),
  CONSTRAINT `fk_customer_PhoneNumberTypeID2` FOREIGN KEY (`PhoneNumberTypeID2`) REFERENCES `tlkPhoneNumberType_2` (`PhoneNumberTypeID`),
  CONSTRAINT `fk_customer_PhoneNumberTypeID3` FOREIGN KEY (`PhoneNumberTypeID3`) REFERENCES `tlkPhoneNumberType_3` (`PhoneNumberTypeID`),
  CONSTRAINT `fk_customer_PictureID` FOREIGN KEY (`PictureID`) REFERENCES `Picture` (`PictureID`),
  CONSTRAINT `fk_customer_SuffixID` FOREIGN KEY (`SuffixID`) REFERENCES `tlkSuffix` (`SuffixID`),
  CONSTRAINT `fk_customer_TitleID` FOREIGN KEY (`TitleID`) REFERENCES `tlkTitle` (`TitleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblCustomer`
--

LOCK TABLES `tblCustomer` WRITE;
/*!40000 ALTER TABLE `tblCustomer` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblCustomer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblCustomerPhoneNumbers`
--

DROP TABLE IF EXISTS `tblCustomerPhoneNumbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblCustomerPhoneNumbers` (
  `ContactPhoneNumberID` int unsigned NOT NULL AUTO_INCREMENT,
  `CustomerID` int unsigned NOT NULL,
  `PhoneNumberTypeID` int unsigned NOT NULL,
  `PhoneNumber` varchar(12) DEFAULT NULL,
  `Extension` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`ContactPhoneNumberID`),
  KEY `fk_cust_phone_customer_id` (`CustomerID`),
  KEY `fk_cust_phone_type_id` (`PhoneNumberTypeID`),
  CONSTRAINT `fk_cust_phone_customer_id` FOREIGN KEY (`CustomerID`) REFERENCES `tblCustomer` (`CustomerID`),
  CONSTRAINT `fk_cust_phone_type_id` FOREIGN KEY (`PhoneNumberTypeID`) REFERENCES `tlkPhoneNumberType` (`PhoneNumberTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblCustomerPhoneNumbers`
--

LOCK TABLES `tblCustomerPhoneNumbers` WRITE;
/*!40000 ALTER TABLE `tblCustomerPhoneNumbers` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblCustomerPhoneNumbers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlkAddressType`
--

DROP TABLE IF EXISTS `tlkAddressType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tlkAddressType` (
  `AddressTypeID` int unsigned NOT NULL AUTO_INCREMENT,
  `AddressType` varchar(100) NOT NULL,
  PRIMARY KEY (`AddressTypeID`),
  UNIQUE KEY `AddressType` (`AddressType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlkAddressType`
--

LOCK TABLES `tlkAddressType` WRITE;
/*!40000 ALTER TABLE `tlkAddressType` DISABLE KEYS */;
/*!40000 ALTER TABLE `tlkAddressType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlkPhoneNumberType`
--

DROP TABLE IF EXISTS `tlkPhoneNumberType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tlkPhoneNumberType` (
  `PhoneNumberTypeID` int unsigned NOT NULL AUTO_INCREMENT,
  `PhoneNumberType` varchar(100) NOT NULL,
  PRIMARY KEY (`PhoneNumberTypeID`),
  UNIQUE KEY `PhoneNumberType` (`PhoneNumberType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlkPhoneNumberType`
--

LOCK TABLES `tlkPhoneNumberType` WRITE;
/*!40000 ALTER TABLE `tlkPhoneNumberType` DISABLE KEYS */;
/*!40000 ALTER TABLE `tlkPhoneNumberType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlkPhoneNumberType_1`
--

DROP TABLE IF EXISTS `tlkPhoneNumberType_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tlkPhoneNumberType_1` (
  `PhoneNumberTypeID` int unsigned NOT NULL AUTO_INCREMENT,
  `PhoneNumberType` varchar(100) NOT NULL,
  PRIMARY KEY (`PhoneNumberTypeID`),
  UNIQUE KEY `PhoneNumberType` (`PhoneNumberType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlkPhoneNumberType_1`
--

LOCK TABLES `tlkPhoneNumberType_1` WRITE;
/*!40000 ALTER TABLE `tlkPhoneNumberType_1` DISABLE KEYS */;
/*!40000 ALTER TABLE `tlkPhoneNumberType_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlkPhoneNumberType_2`
--

DROP TABLE IF EXISTS `tlkPhoneNumberType_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tlkPhoneNumberType_2` (
  `PhoneNumberTypeID` int unsigned NOT NULL AUTO_INCREMENT,
  `PhoneNumberType` varchar(100) NOT NULL,
  PRIMARY KEY (`PhoneNumberTypeID`),
  UNIQUE KEY `PhoneNumberType` (`PhoneNumberType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlkPhoneNumberType_2`
--

LOCK TABLES `tlkPhoneNumberType_2` WRITE;
/*!40000 ALTER TABLE `tlkPhoneNumberType_2` DISABLE KEYS */;
/*!40000 ALTER TABLE `tlkPhoneNumberType_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlkPhoneNumberType_3`
--

DROP TABLE IF EXISTS `tlkPhoneNumberType_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tlkPhoneNumberType_3` (
  `PhoneNumberTypeID` int unsigned NOT NULL AUTO_INCREMENT,
  `PhoneNumberType` varchar(100) NOT NULL,
  PRIMARY KEY (`PhoneNumberTypeID`),
  UNIQUE KEY `PhoneNumberType` (`PhoneNumberType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlkPhoneNumberType_3`
--

LOCK TABLES `tlkPhoneNumberType_3` WRITE;
/*!40000 ALTER TABLE `tlkPhoneNumberType_3` DISABLE KEYS */;
/*!40000 ALTER TABLE `tlkPhoneNumberType_3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlkSuffix`
--

DROP TABLE IF EXISTS `tlkSuffix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tlkSuffix` (
  `SuffixID` int unsigned NOT NULL AUTO_INCREMENT,
  `Suffix` varchar(100) NOT NULL,
  PRIMARY KEY (`SuffixID`),
  UNIQUE KEY `Suffix` (`Suffix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlkSuffix`
--

LOCK TABLES `tlkSuffix` WRITE;
/*!40000 ALTER TABLE `tlkSuffix` DISABLE KEYS */;
/*!40000 ALTER TABLE `tlkSuffix` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlkTitle`
--

DROP TABLE IF EXISTS `tlkTitle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tlkTitle` (
  `TitleID` int unsigned NOT NULL AUTO_INCREMENT,
  `Title` varchar(100) NOT NULL,
  PRIMARY KEY (`TitleID`),
  UNIQUE KEY `Title` (`Title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlkTitle`
--

LOCK TABLES `tlkTitle` WRITE;
/*!40000 ALTER TABLE `tlkTitle` DISABLE KEYS */;
/*!40000 ALTER TABLE `tlkTitle` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-11 15:20:51
