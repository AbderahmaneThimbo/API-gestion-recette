CREATE DATABASE  IF NOT EXISTS `gestion_recettes` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `gestion_recettes`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: gestion_recettes
-- ------------------------------------------------------
-- Server version	8.4.0

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
-- Table structure for table `recettes`
--

DROP TABLE IF EXISTS `recettes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recettes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titre` varchar(100) NOT NULL,
  `type` varchar(50) NOT NULL,
  `ingredients` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `titre` (`titre`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recettes`
--

LOCK TABLES `recettes` WRITE;
/*!40000 ALTER TABLE `recettes` DISABLE KEYS */;
INSERT INTO `recettes` VALUES (2,'omelette','entrée','Oeufs, Huile, oignon'),(4,'Tarte aux pommes maison','dessert','200g de farine, 100g de beurre, 4 pommes, 50g de sucre'),(5,'Salade César','entrée','100g de laitue, 50g de parmesan, 150g de poulet, sauce César, croûtons'),(6,'Spaghetti Bolognaise','plat','200g de spaghetti, 150g de boeuf haché, 100g de tomate, oignons, ail, huile d\'olive'),(7,'Quiche Lorraine','plat','200g de pâte brisée, 100g de lardons, 100g de crème fraîche, 3 oeufs'),(8,'Soupe à l\'oignon','entrée','500g d\'oignons, 100g de beurre, 1 litre de bouillon, pain, fromage râpé'),(9,'Tiramisu','dessert','250g de mascarpone, 3 oeufs, 100g de sucre, 100g de café, cacao en poudre, biscuits à la cuillère'),(10,'Poulet rôti','plat','1 poulet entier, 50g de beurre, ail, herbes de Provence, pommes de terre'),(11,'Mousse au chocolat','dessert','200g de chocolat noir, 4 oeufs, 50g de sucre, pincée de sel'),(12,'Velouté de potiron','entrée','500g de potiron, 1 oignon, 50g de crème fraîche, noix de muscade, sel, poivre'),(13,'Gratin dauphinois','plat','1kg de pommes de terre, 200g de crème, 100g de fromage râpé, ail, sel, poivre');
/*!40000 ALTER TABLE `recettes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-01 16:05:39
