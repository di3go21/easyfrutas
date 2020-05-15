-- MySQL dump 10.13  Distrib 8.0.20, for Linux (x86_64)
--
-- Host: localhost    Database: easyfrutas
-- ------------------------------------------------------
-- Server version	8.0.20-0ubuntu0.20.04.1

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
-- Table structure for table `eproducto`
--

DROP TABLE IF EXISTS `eproducto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eproducto` (
  `k` int NOT NULL AUTO_INCREMENT,
  `asnombre` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `afprecioKG` decimal(6,2) NOT NULL,
  `afstockKG` float(6,2) NOT NULL,
  PRIMARY KEY (`k`),
  UNIQUE KEY `asnombre_UNIQUE` (`asnombre`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eproducto`
--

LOCK TABLES `eproducto` WRITE;
/*!40000 ALTER TABLE `eproducto` DISABLE KEYS */;
INSERT INTO `eproducto` VALUES (1,'kiwi',2.69,100.00),(2,'manzana royal',1.69,100.00),(3,'limón',2.39,100.00),(4,'mandarina',1.99,100.00),(5,'naranja',1.35,100.00),(6,'manzana golden',1.59,100.00),(7,'plátano de canarias',1.99,100.00),(8,'fresón',1.19,100.00),(9,'melón',1.65,100.00),(10,'banana',0.99,100.00),(11,'aguacate',4.95,100.00),(12,'manzana granny',1.79,100.00),(13,'piña',0.99,100.00),(14,'uva roja',3.25,100.00),(15,'mango',2.85,100.00),(16,'uva negra',4.98,100.00),(17,'lima',0.55,100.00),(18,'pera',1.49,100.00);
/*!40000 ALTER TABLE `eproducto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erventaproducto`
--

DROP TABLE IF EXISTS `erventaproducto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `erventaproducto` (
  `xventa` int NOT NULL,
  `xproducto` int NOT NULL,
  `afkg` float(3,2) NOT NULL,
  `afcoste` float(5,2) NOT NULL,
  KEY `fkproducto_idx` (`xproducto`),
  KEY `fkventa_idx` (`xventa`),
  CONSTRAINT `fkproducto` FOREIGN KEY (`xproducto`) REFERENCES `eproducto` (`k`),
  CONSTRAINT `fkventa` FOREIGN KEY (`xventa`) REFERENCES `eventa` (`k`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erventaproducto`
--

LOCK TABLES `erventaproducto` WRITE;
/*!40000 ALTER TABLE `erventaproducto` DISABLE KEYS */;
/*!40000 ALTER TABLE `erventaproducto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eusuario`
--

DROP TABLE IF EXISTS `eusuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eusuario` (
  `k` int NOT NULL AUTO_INCREMENT,
  `asnombre` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `asapeliido` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `asemail` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ascontrasenia` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `asdireccion` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `astelefono` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `adfechareg` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `ahhorareg` varchar(8) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`k`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eusuario`
--

LOCK TABLES `eusuario` WRITE;
/*!40000 ALTER TABLE `eusuario` DISABLE KEYS */;
INSERT INTO `eusuario` VALUES (1,'diego','leiva','di3go21@gmail.com','4d186321c1a7f0f354b297e8914ab240',NULL,NULL,NULL,NULL),(2,'hola','adios','loco','7815696ecbf1c96e6894b779456d330e','sssss','asdasd','sss','sasd'),(3,'morgan','leiva','morgan@catmail.es','25f9e794323b453885f5181f1b624d0b','corona verde','687765015','2020-05-10','14:31:39'),(4,'prueba','passEsMorgan','prueba@test.es','f73dde2d8c7879ae8d1fcdc03c4ffebc','asdasdas','95951','2020-05-10','15:40:42'),(5,'asd','asdasd','asdasdasd@asdasd','4297f44b13955235245b2497399d7a93','123123','31231213','2020-05-10','18:41:51'),(6,'asdasd','asdasd','asdasd@asdasd','a8f5f167f44f4964e6c998dee827110c','asdasd','asdasd','2020-05-10','18:48:54'),(7,'asdas','asdasd','asdasd2asd2asdas@asda','a3dcb4d229de6fde0db5686dee47145d','asdasd','asdasd','2020-05-10','18:56:54'),(8,'asdasd','asdas','asdasd','7815696ecbf1c96e6894b779456d330e','a','a','2020-05-10','18:57:50');
/*!40000 ALTER TABLE `eusuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventa`
--

DROP TABLE IF EXISTS `eventa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventa` (
  `k` int NOT NULL AUTO_INCREMENT,
  `xusuario` int NOT NULL,
  `afpreciototal` float(5,2) NOT NULL,
  PRIMARY KEY (`k`),
  KEY `fkusuario_idx` (`xusuario`),
  CONSTRAINT `fkusuario` FOREIGN KEY (`xusuario`) REFERENCES `eusuario` (`k`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventa`
--

LOCK TABLES `eventa` WRITE;
/*!40000 ALTER TABLE `eventa` DISABLE KEYS */;
/*!40000 ALTER TABLE `eventa` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-15 12:23:04
