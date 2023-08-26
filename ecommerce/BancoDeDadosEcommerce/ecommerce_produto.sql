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
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `idProduto` int NOT NULL AUTO_INCREMENT,
  `Descricao` varchar(45) NOT NULL,
  `Categoria` varchar(20) NOT NULL,
  `Valor` float NOT NULL,
  `EmEstoque` enum('True','False') DEFAULT 'True',
  `idFornecedor` int NOT NULL,
  PRIMARY KEY (`idProduto`),
  KEY `fk_fornecedor` (`idFornecedor`),
  CONSTRAINT `fk_fornecedor` FOREIGN KEY (`idFornecedor`) REFERENCES `fornecedor` (`idFornecedor`) ON UPDATE CASCADE,
  CONSTRAINT `chk_valor` CHECK ((`Valor` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'Bicicleta Aro 29','Bicicletas',3000,'True',1),(2,'Pneu Aro 29','Peças Bicicleta',200,'False',1),(3,'Câmbio Traseiro Shimano','Peças Bicicleta',300,'True',1),(4,'Escapamento','Peças carros',600,'False',2),(5,'Volante','Peças carros',250,'True',2),(6,'Tampo porta-mala','Peças carros',180,'True',3),(7,'Jogo de talher Tramontina','Utensílio Doméstico',199,'True',4),(8,'Jogo de panelas Rochedo','Utensílio Doméstico',599,'True',4),(9,'Vaso Cerâmica 1.5m','Decoração',199,'True',4),(10,'Calça Jeans 38','Moda Feminina',89.99,'True',5),(11,'Vestido Longo G','Moda Feminina',139.99,'True',5),(12,'Camiseta Baby Look M','Moda Feminina',39.99,'True',6),(13,'Calça Jeans 42','Moda Masculina',89.99,'True',6),(14,'Casaco Preto G','Moda Masculina',139.99,'True',6),(15,'Camiseta Estampada M','Moda Masculina',39.99,'True',6);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-26 10:17:31
