-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: food_delivery
-- ------------------------------------------------------
-- Server version	8.0.46

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `courrier`
--

DROP TABLE IF EXISTS `courrier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courrier` (
  `userId` varchar(36) NOT NULL,
  `phoneNumber` varchar(20) NOT NULL,
  `passwordHash` varchar(255) NOT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `phoneNumber` (`phoneNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courrier`
--

LOCK TABLES `courrier` WRITE;
/*!40000 ALTER TABLE `courrier` DISABLE KEYS */;
INSERT INTO `courrier` VALUES ('a3f27507-8cc5-4bd5-ae43-c1d3452213c5','71512115','$2b$10$sztXfk8aj8IYiZYnpnDvAODu6GGiQeLEInRBESoaXeDxx517DHvum');
/*!40000 ALTER TABLE `courrier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `userId` varchar(36) NOT NULL,
  `email` varchar(100) NOT NULL,
  `passwordHash` varchar(255) NOT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('63ab3cfc-8bb5-47a9-9f70-807bbfa55e11','test@test.com','$2b$10$ffolJgW0pEVY.J55tX6JEeGxLdl8eXKvbiV6tGiEohY6Pe.zIIEfi'),('d2f673c8-e50a-48c3-8925-ee96c907794c','temraztaher@gmail.com','$2b$10$nSXYBR6rWRWP2LMv8mOhFujM.oSLzJ2Xz8zmbr/egns4WUo9bP.AC');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deliveryassignment`
--

DROP TABLE IF EXISTS `deliveryassignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deliveryassignment` (
  `assignmentId` varchar(36) NOT NULL,
  `orderId` varchar(36) NOT NULL,
  `courierId` varchar(36) NOT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`assignmentId`),
  KEY `orderId` (`orderId`),
  KEY `courierId` (`courierId`),
  CONSTRAINT `deliveryassignment_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `order` (`orderId`),
  CONSTRAINT `deliveryassignment_ibfk_2` FOREIGN KEY (`courierId`) REFERENCES `courrier` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliveryassignment`
--

LOCK TABLES `deliveryassignment` WRITE;
/*!40000 ALTER TABLE `deliveryassignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `deliveryassignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menuitem`
--

DROP TABLE IF EXISTS `menuitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menuitem` (
  `itemId` varchar(36) NOT NULL,
  `restaurantId` varchar(36) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` text,
  PRIMARY KEY (`itemId`),
  KEY `restaurantId` (`restaurantId`),
  CONSTRAINT `menuitem_ibfk_1` FOREIGN KEY (`restaurantId`) REFERENCES `restaurant` (`restaurantId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menuitem`
--

LOCK TABLES `menuitem` WRITE;
/*!40000 ALTER TABLE `menuitem` DISABLE KEYS */;
INSERT INTO `menuitem` VALUES ('ba08bb82-26b8-457e-8b6f-92175ff7b458','40b433c7-62c6-4e7b-8932-118723a6194d','esfef',23.00,'afff'),('bb788046-72d9-4ee6-bca4-bf6b245d22ea','40b433c7-62c6-4e7b-8932-118723a6194d','fhh',23.00,'fss');
/*!40000 ALTER TABLE `menuitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `orderId` varchar(36) NOT NULL,
  `customerId` varchar(36) NOT NULL,
  `restaurantId` varchar(36) NOT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`orderId`),
  KEY `customerId` (`customerId`),
  KEY `restaurantId` (`restaurantId`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`customerId`) REFERENCES `customer` (`userId`),
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`restaurantId`) REFERENCES `restaurant` (`restaurantId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderitem`
--

DROP TABLE IF EXISTS `orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderitem` (
  `id` int NOT NULL AUTO_INCREMENT,
  `orderId` varchar(36) NOT NULL,
  `itemName` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_order_item` (`orderId`,`itemName`),
  CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `order` (`orderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitem`
--

LOCK TABLES `orderitem` WRITE;
/*!40000 ALTER TABLE `orderitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant` (
  `restaurantId` varchar(36) NOT NULL,
  `restaurantName` varchar(100) NOT NULL,
  `managerId` varchar(36) NOT NULL,
  PRIMARY KEY (`restaurantId`),
  KEY `managerId` (`managerId`),
  CONSTRAINT `restaurant_ibfk_1` FOREIGN KEY (`managerId`) REFERENCES `restaurantmanager` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES ('40b433c7-62c6-4e7b-8932-118723a6194d','Gourmet Burgers','0d31fb1f-5ba6-4838-9b10-6f0bb5964094');
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurantmanager`
--

DROP TABLE IF EXISTS `restaurantmanager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurantmanager` (
  `userId` varchar(36) NOT NULL,
  `restaurantName` varchar(100) NOT NULL,
  `passwordHash` varchar(255) NOT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `restaurantName` (`restaurantName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurantmanager`
--

LOCK TABLES `restaurantmanager` WRITE;
/*!40000 ALTER TABLE `restaurantmanager` DISABLE KEYS */;
INSERT INTO `restaurantmanager` VALUES ('0d31fb1f-5ba6-4838-9b10-6f0bb5964094','Gourmet Burgers','$2b$10$BSnvj3FoYSOes4ZvIKPXTeeCa5P83OjUDLhYyLuWg48gdGKsjkCfe');
/*!40000 ALTER TABLE `restaurantmanager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `session` (
  `token` varchar(64) NOT NULL,
  `userId` varchar(36) NOT NULL,
  `role` varchar(20) NOT NULL,
  `userEmail` varchar(100) DEFAULT NULL,
  `restaurantName` varchar(100) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session`
--

LOCK TABLES `session` WRITE;
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
INSERT INTO `session` VALUES ('9730a9192b40225af8cb8ebe1f82984e709a7b13a81c680451ac56adde316ae4','a3f27507-8cc5-4bd5-ae43-c1d3452213c5','Courrier',NULL,NULL,'2026-05-10 14:06:19'),('c7930dfebc0a62760896bba218f81ab3ff97805cd17444755cedbe540624cd63','d2f673c8-e50a-48c3-8925-ee96c907794c','Customer','temraztaher@gmail.com',NULL,'2026-05-10 13:56:25'),('f9b8383675fc314e53663adbc22a78be9246530dad769c334cd63b98915d7fb3','63ab3cfc-8bb5-47a9-9f70-807bbfa55e11','Customer','test@test.com',NULL,'2026-05-10 13:36:56');
/*!40000 ALTER TABLE `session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-10 18:00:45
