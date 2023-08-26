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
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `idPedido` int NOT NULL AUTO_INCREMENT,
  `DataCriado` datetime NOT NULL,
  `DataAtualizado` datetime NOT NULL,
  `pedidoStatus` enum('Cancelado','Confirmado','Processando','Enviado','Concluído') NOT NULL,
  `Descricao` varchar(45) DEFAULT NULL,
  `Valor` float NOT NULL,
  `Frete` float NOT NULL,
  `idCliente` int DEFAULT NULL,
  `idVendedor` int DEFAULT NULL,
  PRIMARY KEY (`idPedido`),
  KEY `fk_pedido_cliente` (`idCliente`),
  KEY `fk_pedido_vendedor` (`idVendedor`),
  CONSTRAINT `fk_pedido_cliente` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`) ON UPDATE CASCADE,
  CONSTRAINT `fk_pedido_vendedor` FOREIGN KEY (`idVendedor`) REFERENCES `vendedor` (`idVendedor`) ON UPDATE CASCADE,
  CONSTRAINT `chk_pedido_dataAtualizado` CHECK ((`DataAtualizado` >= `DataCriado`)),
  CONSTRAINT `chk_pedido_frete` CHECK ((`Frete` >= 0)),
  CONSTRAINT `chk_pedido_valor` CHECK ((`Valor` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,'2023-01-02 00:00:00','2023-01-02 00:00:00','Cancelado','Pedido peças de bicicleta',3300,0,1,1),(2,'2023-02-02 00:00:00','2023-02-05 00:00:00','Processando','Pedido peças de bicicleta',300,12.5,5,1),(3,'2023-02-10 00:00:00','2023-02-10 00:00:00','Processando','Pedido peças de carro',430,0,4,2),(4,'2023-03-15 00:00:00','2023-03-15 00:00:00','Enviado','Pedido loja de louças',199,13,12,4),(5,'2023-03-23 00:00:00','2023-03-26 00:00:00','Enviado','Pedido loja de louças',599,0,12,4),(6,'2023-05-02 00:00:00','2023-05-02 00:00:00','Concluído','Pedido loja de roupas',229.98,0,6,5),(7,'2023-06-03 00:00:00','2023-06-03 00:00:00','Concluído','Pedido loja de roupas',39.99,8,13,5),(8,'2023-06-07 00:00:00','2023-06-07 00:00:00','Concluído','Pedido loja de roupas',89.99,9,13,5);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
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
