-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idCliente` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  `Endereco` varchar(45) NOT NULL,
  `DataNascimento` date NOT NULL,
  `PessoaFisica` tinyint(1) NOT NULL,
  `PessoaJuridica` tinyint(1) NOT NULL,
  `Documento` varchar(14) NOT NULL,
  `RazaoSocial` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE KEY `unique_documento` (`Documento`),
  UNIQUE KEY `unique_razaoSocial` (`RazaoSocial`),
  CONSTRAINT `chk_cliente` CHECK ((`PessoaFisica` <> `PessoaJuridica`))
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Lucas Simoes','Rua São Caetano, 551','1989-12-27',1,0,'39595264822',NULL),(2,'Vitor Jeremias','Rua Verona, 100','1989-12-28',1,0,'12345678901',NULL),(3,'Alcir Dorigatti','Rua Carlos Burgos, 200','1989-11-27',1,0,'12345678902',NULL),(4,'Bruno Grou','Rua Juscelino Kubitsheck, 300','1989-10-27',1,0,'12345678903',NULL),(5,'Lucas Vido','Rua Genova, 116','1989-09-27',1,0,'12345678904',NULL),(6,'Rosana Maria Barassa','Rua 04, 10','1990-12-27',1,0,'12345678905',NULL),(7,'João Augusto Simões','Rua Ytaipu, 156,','1991-12-27',1,0,'12345678906',NULL),(8,'Rafael Louzada','Rua Traituba, 614','1988-12-27',1,0,'12345678907',NULL),(9,'Luis Henique Simões','Rua Jabaquara, 12','1987-12-27',1,0,'12345678908',NULL),(10,'Calabroza S.A','Rua Avanhandava, 12','2000-12-27',0,1,'12345678908987',NULL),(11,'Fundinvest','Rua Silva, 12','2021-12-27',0,1,'12345678908988','Fundo de Investimento ltda.'),(12,'Venda do Marcos','Rua Acbdef, 12','2007-12-27',0,1,'12345678908989','Marcos supermercado ltda.'),(13,'Academia AbcFit','Rua Qwertyu, 12','2009-12-27',0,1,'12345678908980','Centro de esportes s.a.');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-26 10:17:32
