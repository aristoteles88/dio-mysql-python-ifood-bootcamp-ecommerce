-- MySQL dump 10.13  Distrib 8.0.33, for Linux (x86_64)
--
-- Host: mysql    Database: ecommerce
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'Maria','M','Silva','12345678910',NULL,'Rua Silva de prata 29, Carangola - Cidade das flores'),(2,'Matheus','O','Pimentel','12254654980',NULL,'Rua Almeida 289, Centro - Cidade das flores'),(3,'Ricardo','F','Silva','82739476591',NULL,'Avenida almeida vinha 1009, Centro - Cidade das flores'),(4,'Julia','S','Franca','92837401982',NULL,'Rua laranjeiras 861, Centro - Cidade das flores'),(5,'Roberta','G','Assis','82038471082',NULL,'Avenida Koller 19, Centro - Cidade das flores'),(6,'Isabela','M','Cruz','92337401809',NULL,'Rua Alameda das flores 28, Carangola - Cidade das flores');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
INSERT INTO `delivery` VALUES (1,1,'Aguardando envio',NULL),(2,2,'Entregue','QE12341234BR'),(3,3,'Entregue','QR12345411BR'),(4,4,'Em transito',NULL);
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `order_info`
--

LOCK TABLES `orderInfo` WRITE;
/*!40000 ALTER TABLE `orderInfo` DISABLE KEYS */;
INSERT INTO `orderInfo` VALUES (1,1,'Em processamento','Compra via app',NULL,1),(2,2,'Em processamento','Compra via web',50,1),(3,6,'Confirmado',NULL,NULL,10),(4,1,'Em processamento','Compra via telefone',150,2);
/*!40000 ALTER TABLE `orderInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `paymentMethod`
--

LOCK TABLES `paymentMethod` WRITE;
/*!40000 ALTER TABLE `paymentMethod` DISABLE KEYS */;
INSERT INTO `paymentMethod` VALUES (1,1,'Cartao credito','1234 1234 1234 1234 432'),(1,2,'Cartao Debito','1234 4321 1234 4321 123'),(2,1,'Boleto',NULL),(4,3,'Deposito/Transferencia',NULL),(6,10,'Cartao credito','1423 1423 1423 1423 332');
/*!40000 ALTER TABLE `paymentMethod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Fone de ouvido',0,'Eletronico',4,NULL),(2,'Barbie Elsa',1,'Brinquedo',3,NULL),(3,'Body carters',1,'Vestimenta',5,NULL),(4,'Microfone Vedo',0,'Eletronico',4,NULL),(5,'Sofa retratil',0,'Moveis',3,'3x57x80'),(6,'Farinha de arrox',0,'Alimentacao',2,NULL),(7,'Fire Stick Amazon',0,'Eletronico',3,NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `productOrder`
--

LOCK TABLES `productOrder` WRITE;
/*!40000 ALTER TABLE `productOrder` DISABLE KEYS */;
INSERT INTO `productOrder` VALUES (1,1,2,NULL),(2,1,1,NULL),(3,2,1,NULL);
/*!40000 ALTER TABLE `productOrder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `productSeller`
--

LOCK TABLES `productSeller` WRITE;
/*!40000 ALTER TABLE `productSeller` DISABLE KEYS */;
INSERT INTO `productSeller` VALUES (1,6,80),(2,7,10);
/*!40000 ALTER TABLE `productSeller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `productSupplier`
--

LOCK TABLES `productSupplier` WRITE;
/*!40000 ALTER TABLE `productSupplier` DISABLE KEYS */;
INSERT INTO `productSupplier` VALUES (1,1),(1,2),(2,4),(2,5),(3,3);
/*!40000 ALTER TABLE `productSupplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `seller`
--

LOCK TABLES `seller` WRITE;
/*!40000 ALTER TABLE `seller` DISABLE KEYS */;
INSERT INTO `seller` VALUES (1,'Tech eletronics',NULL,'987123645000198',NULL,'Rio de Janeiro','21987654321'),(2,'Butique Durgas',NULL,NULL,'12344321143','Rio de Janeiro','21123456789'),(3,'Kids World',NULL,'123412341000243',NULL,'Sao Paulo','11918273645'),(4,'Eletronicos Valma',NULL,'958694857000315',NULL,'Sao Paulo','11984758475');
/*!40000 ALTER TABLE `seller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `storage`
--

LOCK TABLES `storage` WRITE;
/*!40000 ALTER TABLE `storage` DISABLE KEYS */;
INSERT INTO `storage` VALUES (1,'Rio de Janeiro',1000),(2,'Rio de Janeiro',500),(3,'Sao Paulo',10),(4,'Sao Paulo',100),(5,'Sao Paulo',10),(6,'Brasilia',60);
/*!40000 ALTER TABLE `storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `storageLocation`
--

LOCK TABLES `productStorage` WRITE;
/*!40000 ALTER TABLE `productStorage` DISABLE KEYS */;
INSERT INTO `productStorage` VALUES (2,1,500),(6,2,400),(3,4,33),(1,5,10);
/*!40000 ALTER TABLE `productStorage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'Almeida e filhos','123234345000123','21999999999'),(2,'Eletronicos Silva','543765987000214','11488584738'),(3,'Eletronicos Valma','958694857000315','11984758475');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-27 17:59:33
