CREATE DATABASE  IF NOT EXISTS `littlelemondb` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `littlelemondb`;
-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: littlelemondb
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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `AddressID` int NOT NULL AUTO_INCREMENT,
  `Street` varchar(255) NOT NULL,
  `City` varchar(255) NOT NULL,
  `State` varchar(255) NOT NULL,
  PRIMARY KEY (`AddressID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,'Kenyatta Avenue','Nairobi','Nairobi County'),(2,'Moi Avenue','Mombasa','Mombasa County'),(3,'Oginga Odinga Street','Kisumu','Kisumu County'),(4,'Kenyatta Street','Nakuru','Nakuru County'),(5,'Haile Selassie Avenue','Nairobi','Nairobi County'),(6,'Nkrumah Road','Mombasa','Mombasa County'),(7,'Tom Mboya Street','Nairobi','Nairobi County'),(8,'Uhuru Highway','Nairobi','Nairobi County'),(9,'Nyerere Road','Kisumu','Kisumu County'),(10,'Ronald Ngala Street','Nairobi','Nairobi County'),(11,'Archbishop Makarios','Nairobi','Nairobi County'),(12,'Digo Road','Mombasa','Mombasa County'),(13,'Gusii Road','Kisumu','Kisumu County'),(14,'Biashara Street','Nakuru','Nakuru County'),(15,'Hospital Road','Eldoret','Uasin Gishu County'),(16,'Uganda Road','Eldoret','Uasin Gishu County'),(17,'Kimathi Street','Nairobi','Nairobi County'),(18,'Mwembe Tayari Road','Mombasa','Mombasa County');
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `BookingID` int NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `TableNumber` int NOT NULL,
  `CustomerID` int NOT NULL,
  PRIMARY KEY (`BookingID`),
  KEY `booking_customer_id_idx` (`CustomerID`),
  CONSTRAINT `booking_customer_id` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (1,'2025-06-01',3,5),(2,'2025-06-02',7,12),(3,'2025-06-03',1,8),(4,'2025-06-04',10,3),(5,'2025-06-05',5,17),(6,'2025-06-07',2,1),(7,'2025-06-07',8,14),(8,'2025-06-08',4,9),(9,'2025-06-10',6,18),(10,'2025-06-11',9,6),(11,'2025-06-12',3,11),(12,'2025-06-14',7,2);
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `customerordersview`
--

DROP TABLE IF EXISTS `customerordersview`;
/*!50001 DROP VIEW IF EXISTS `customerordersview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `customerordersview` AS SELECT 
 1 AS `CustomerID`,
 1 AS `FullName`,
 1 AS `OrderID`,
 1 AS `TotalCost`,
 1 AS `MenuName`,
 1 AS `CourseName`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `CustomerID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `PhoneNumber` int NOT NULL,
  `HouseNumber` varchar(45) NOT NULL,
  `AddressID` int NOT NULL,
  PRIMARY KEY (`CustomerID`),
  KEY `customer_address_fk_idx` (`AddressID`),
  CONSTRAINT `customer_address_fk` FOREIGN KEY (`AddressID`) REFERENCES `addresses` (`AddressID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'James','Mwangi','james.mwangi@email.com',701234567,'14A',1),(2,'Aisha','Odhiambo','aisha.odhiambo@email.com',722345678,'7',2),(3,'Brian','Kipchoge','brian.kipchoge@email.com',733456789,'23B',3),(4,'Fatuma','Hassan','fatuma.hassan@email.com',744567890,'5',4),(5,'David','Otieno','david.otieno@email.com',755678901,'102',5),(6,'Grace','Njoroge','grace.njoroge@email.com',766789012,'8C',6),(7,'Samuel','Kamau','samuel.kamau@email.com',777890123,'31',7),(8,'Amina','Waweru','amina.waweru@email.com',788901234,'19',8),(9,'Peter','Mutua','peter.mutua@email.com',799012345,'6B',9),(10,'Linda','Achieng','linda.achieng@email.com',710123456,'47',10),(11,'Kevin','Gitau','kevin.gitau@email.com',721234567,'31',11),(12,'Mary','Chebet','mary.chebet@email.com',732345678,'88A',12),(13,'Joseph','Ndungu','joseph.ndungu@email.com',743456789,'12',13),(14,'Zara','Mohamed','zara.mohamed@email.com',754567890,'55',14),(15,'Clinton','Owino','clinton.owino@email.com',765678901,'9D',15),(16,'Esther','Kariuki','esther.kariuki@email.com',776789012,'26',3),(17,'Michael','Baraza','michael.baraza@email.com',787890123,'71B',7),(18,'Naomi','Simiyu','naomi.simiyu@email.com',798901234,'4',11);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deliveries`
--

DROP TABLE IF EXISTS `deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deliveries` (
  `DeliveryID` int NOT NULL AUTO_INCREMENT,
  `OrderId` int NOT NULL,
  `CustomerID` int NOT NULL,
  `AddressID` int NOT NULL,
  `DeliveryDate` date NOT NULL,
  `Status` varchar(45) NOT NULL,
  PRIMARY KEY (`DeliveryID`),
  KEY `delivery_address_fk_idx` (`AddressID`),
  KEY `delivery_order_fk_idx` (`OrderId`),
  KEY `delivery_customer_fk_idx` (`CustomerID`),
  CONSTRAINT `delivery_address_fk` FOREIGN KEY (`AddressID`) REFERENCES `addresses` (`AddressID`),
  CONSTRAINT `delivery_customer_fk` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`),
  CONSTRAINT `delivery_order_fk` FOREIGN KEY (`OrderId`) REFERENCES `orders` (`OrderID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliveries`
--

LOCK TABLES `deliveries` WRITE;
/*!40000 ALTER TABLE `deliveries` DISABLE KEYS */;
INSERT INTO `deliveries` VALUES (1,1,3,3,'2025-06-01','Delivered'),(2,2,11,11,'2025-06-02','Delivered'),(3,3,7,7,'2025-06-03','Delivered'),(4,4,15,15,'2025-06-04','Delivered'),(5,5,1,1,'2025-06-05','Delivered'),(6,6,9,9,'2025-06-07','Delivered'),(7,7,18,18,'2025-06-08','Delivered'),(8,8,5,5,'2025-06-09','Preparing'),(9,9,13,13,'2025-06-10','Preparing'),(10,10,6,6,'2025-06-11','Preparing'),(11,11,16,16,'2025-06-12','Transit'),(12,12,2,2,'2025-06-14','Transit');
/*!40000 ALTER TABLE `deliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menuitems`
--

DROP TABLE IF EXISTS `menuitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menuitems` (
  `MenuItemID` int NOT NULL AUTO_INCREMENT,
  `CourseName` varchar(255) DEFAULT NULL,
  `StarterName` varchar(255) NOT NULL,
  `DessertName` varchar(255) DEFAULT NULL,
  `MenuID` int DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`MenuItemID`),
  KEY `menuitem_menu_fk_idx` (`MenuID`),
  CONSTRAINT `menuitem_menu_fk` FOREIGN KEY (`MenuID`) REFERENCES `menus` (`MenuID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menuitems`
--

LOCK TABLES `menuitems` WRITE;
/*!40000 ALTER TABLE `menuitems` DISABLE KEYS */;
INSERT INTO `menuitems` VALUES (1,'Spaghetti Carbonara','Bruschetta','Tiramisu',1,1200.00),(2,'Chicken Marsala','Caprese Salad','Panna Cotta',1,1500.00),(3,'Pilau Rice & Beef','Kachumbari','Maandazi',2,850.00),(4,'Biryani Chicken','Samosa Platter','Halwa',2,950.00),(5,'Pad Thai Noodles','Spring Rolls','Mango Sticky Rice',3,1100.00),(6,'Sushi Platter','Edamame','Mochi Ice Cream',3,1800.00),(7,'Lamb Souvlaki','Hummus & Pita','Baklava',4,1350.00),(8,'Grilled Sea Bass','Stuffed Vine Leaves','Loukoumades',4,1600.00),(9,'BBQ Beef Ribs','Coleslaw Bites','Banana Pudding',5,1700.00),(10,'Pulled Pork Sandwich','Mac & Cheese Bites','Peach Cobbler',5,1050.00),(11,'Margherita Pizza','Garlic Bread','Cannoli',1,1000.00),(12,'Grilled Tilapia','Ukwaju Soup','Kashata',2,900.00);
/*!40000 ALTER TABLE `menuitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `MenuID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  PRIMARY KEY (`MenuID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'Italian Delights'),(2,'Swahili Treasures'),(3,'Asian Fusion'),(4,'Mediterranean Classics'),(5,'American BBQ');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `CustomerID` int NOT NULL,
  `Quantity` int DEFAULT NULL,
  `TotalCost` decimal(10,2) DEFAULT NULL,
  `MenuItemID` int DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `orders_customer_fk_idx` (`CustomerID`),
  KEY `orders_menu_item_idx` (`MenuItemID`),
  CONSTRAINT `orders_customer_fk` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`),
  CONSTRAINT `orders_menu_item` FOREIGN KEY (`MenuItemID`) REFERENCES `menuitems` (`MenuItemID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2025-06-01',3,2,1850.00,7),(2,'2025-06-02',11,1,1920.00,2),(3,'2025-06-03',7,3,1780.00,10),(4,'2025-06-04',15,1,1860.00,5),(5,'2025-06-05',1,2,1950.00,12),(6,'2025-06-07',9,1,1810.00,4),(7,'2025-06-08',18,2,1740.00,8),(8,'2025-06-09',5,1,1890.00,1),(9,'2025-06-10',13,3,1970.00,11),(10,'2025-06-11',6,1,1825.00,3),(11,'2025-06-12',16,2,1760.00,9),(12,'2025-06-14',2,1,1905.00,6);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `ordersview`
--

DROP TABLE IF EXISTS `ordersview`;
/*!50001 DROP VIEW IF EXISTS `ordersview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ordersview` AS SELECT 
 1 AS `OrderID`,
 1 AS `Quantity`,
 1 AS `TotalCost`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `StaffID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `Role` varchar(255) NOT NULL,
  `Salary` int NOT NULL,
  PRIMARY KEY (`StaffID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'Daniel','Kamau','Head Chef',85000),(2,'Wanjiru','Mwangi','Sous Chef',60000),(3,'Otieno','Odhiambo','Line Cook',35000),(4,'Amina','Hassan','Line Cook',35000),(5,'Fatuma','Njoroge','Pastry Chef',50000),(6,'Brian','Mutua','Restaurant Manager',90000),(7,'Grace','Achieng','Assistant Manager',65000),(8,'Samuel','Kipchoge','Waiter',28000),(9,'Naomi','Chebet','Waiter',28000),(10,'Kevin','Otieno','Waiter',28000),(11,'Zara','Mohamed','Waitress',28000),(12,'Peter','Gitau','Cashier',32000),(13,'Linda','Kariuki','Cashier',32000),(14,'Joseph','Baraza','Bartender',38000),(15,'Esther','Simiyu','Bartender',38000),(16,'Michael','Waweru','Cleaner',20000),(17,'Mary','Ndungu','Cleaner',20000),(18,'Clinton','Owino','Delivery Driver',30000);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `customerordersview`
--

/*!50001 DROP VIEW IF EXISTS `customerordersview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin1`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `customerordersview` AS select `c`.`CustomerID` AS `CustomerID`,concat(`c`.`FirstName`,' ',`c`.`LastName`) AS `FullName`,`o`.`OrderID` AS `OrderID`,`o`.`TotalCost` AS `TotalCost`,`mn`.`Name` AS `MenuName`,`mi`.`CourseName` AS `CourseName` from (((`customers` `c` join `orders` `o` on((`c`.`CustomerID` = `o`.`CustomerID`))) join `menuitems` `mi` on((`o`.`MenuItemID` = `mi`.`MenuItemID`))) join `menus` `mn` on((`mi`.`MenuID` = `mn`.`MenuID`))) where (`o`.`TotalCost` > 1000) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ordersview`
--

/*!50001 DROP VIEW IF EXISTS `ordersview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin1`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `ordersview` AS select `orders`.`OrderID` AS `OrderID`,`orders`.`Quantity` AS `Quantity`,`orders`.`TotalCost` AS `TotalCost` from `orders` where (`orders`.`Quantity` > 2) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-26  2:20:11
