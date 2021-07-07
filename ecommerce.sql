-- MySQL dump 10.13  Distrib 5.7.34, for Linux (x86_64)
--
-- Host: localhost    Database: ecommerce
-- ------------------------------------------------------
-- Server version	5.7.34-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clientepj`
--

DROP TABLE IF EXISTS `clientepj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientepj` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  `endereco` varchar(200) NOT NULL,
  `cep` int(8) NOT NULL,
  `cidade` varchar(200) NOT NULL,
  `uf` varchar(2) NOT NULL,
  `telefone` varchar(12) NOT NULL,
  `cnpj` varchar(14) NOT NULL,
  `ie` varchar(12) NOT NULL,
  `email` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientepj`
--

LOCK TABLES `clientepj` WRITE;
/*!40000 ALTER TABLE `clientepj` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientepj` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  `endereco` varchar(200) NOT NULL,
  `cep` int(8) NOT NULL,
  `cidade` varchar(200) NOT NULL,
  `uf` varchar(2) NOT NULL,
  `telefone` varchar(12) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrada_produtos`
--

DROP TABLE IF EXISTS `entrada_produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrada_produtos` (
  `id` bigint(20) NOT NULL,
  `id_produto` bigint(20) DEFAULT NULL,
  `id_fornecedor` int(11) DEFAULT NULL,
  `qtde` int(11) DEFAULT NULL,
  `valor_unitario` decimal(9,2) DEFAULT '0.00',
  `data_entrada` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrada_produtos`
--

LOCK TABLES `entrada_produtos` WRITE;
/*!40000 ALTER TABLE `entrada_produtos` DISABLE KEYS */;
INSERT INTO `entrada_produtos` VALUES (1,1,NULL,12,1.47,'2021-07-03'),(2,2,NULL,3,25.00,'2021-07-03'),(3,3,NULL,5,33.66,'2021-07-03'),(4,4,NULL,30,1.37,'2021-07-03'),(5,5,NULL,12,12.23,'2021-07-03'),(6,6,NULL,12,17.24,'2021-07-03'),(7,7,NULL,9,3.17,'2021-07-03'),(8,8,NULL,12,2.23,'2021-07-03'),(9,9,NULL,3,12.41,'2021-07-03'),(10,10,NULL,10,1.63,'2021-07-03'),(11,11,NULL,4,1.79,'2021-07-03'),(12,12,NULL,6,16.71,'2021-07-03'),(13,13,NULL,5,24.57,'2021-07-03'),(14,14,NULL,2,56.21,'2021-07-03'),(15,15,NULL,30,1.94,'2021-07-03'),(16,16,NULL,20,8.14,'2021-07-03'),(17,17,NULL,5,24.93,'2021-07-03'),(18,18,NULL,3,5.00,'2021-07-03'),(19,19,NULL,2,6.67,'2021-07-03'),(20,20,NULL,5,3.84,'2021-07-03'),(21,21,NULL,50,1.35,'2021-07-03'),(22,22,NULL,2,7.87,'2021-07-03'),(23,23,NULL,2,8.23,'2021-07-03'),(24,24,NULL,2,7.99,'2021-07-03'),(25,25,NULL,2,7.99,'2021-07-03'),(26,26,NULL,5,36.07,'2021-07-03'),(27,27,NULL,5,17.28,'2021-07-03'),(28,28,NULL,5,27.28,'2021-07-03');
/*!40000 ALTER TABLE `entrada_produtos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`localhost`*/ /*!50003 TRIGGER `TRG_EntradaProduto_AI` AFTER INSERT ON `entrada_produtos`
FOR EACH ROW
BEGIN
      CALL SP_AtualizaEstoque (new.id_produto, new.qtde, new.valor_unitario);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`localhost`*/ /*!50003 TRIGGER `TRG_EntradaProduto_AU` AFTER UPDATE ON `entrada_produtos`
FOR EACH ROW
BEGIN
      CALL SP_AtualizaEstoque (new.id_produto, new.qtde - old.qtde, new.valor_unitario);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`localhost`*/ /*!50003 TRIGGER `TRG_EntradaProduto_AD` AFTER DELETE ON `entrada_produtos`
FOR EACH ROW
BEGIN
      CALL SP_AtualizaEstoque (old.id_produto, old.qtde * -1, old.valor_unitario);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `estoque`
--

DROP TABLE IF EXISTS `estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estoque` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_produto` int(11) DEFAULT NULL,
  `qtde` int(11) DEFAULT NULL,
  `valor_unitario` decimal(9,2) DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque`
--

LOCK TABLES `estoque` WRITE;
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
INSERT INTO `estoque` VALUES (1,1,12,1.47),(2,2,3,25.00),(3,3,5,33.66),(4,4,30,1.37),(5,5,12,12.23),(6,6,12,17.24),(7,7,9,3.17),(8,8,12,2.23),(9,9,3,12.41),(10,10,10,1.63),(11,11,4,1.79),(12,12,6,16.71),(13,13,5,24.57),(14,14,2,56.21),(15,15,30,1.94),(16,16,20,8.14),(17,17,5,24.93),(18,18,3,5.00),(19,19,2,6.67),(20,20,5,3.84),(21,21,50,1.35),(22,22,2,7.87),(23,23,2,8.23),(24,24,2,7.99),(25,25,2,7.99),(26,26,5,36.07),(27,27,5,17.28),(28,28,5,27.28);
/*!40000 ALTER TABLE `estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedores`
--

DROP TABLE IF EXISTS `fornecedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fornecedores` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  `endereco` varchar(200) NOT NULL,
  `cep` varchar(8) NOT NULL,
  `cidade` varchar(200) NOT NULL,
  `uf` varchar(2) NOT NULL,
  `telefone` varchar(12) NOT NULL,
  `cnpj` varchar(14) NOT NULL,
  `ie` varchar(12) NOT NULL,
  `email` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedores`
--

LOCK TABLES `fornecedores` WRITE;
/*!40000 ALTER TABLE `fornecedores` DISABLE KEYS */;
INSERT INTO `fornecedores` VALUES (1,'MC IND E COM DE PANELAS E UTIL DOM EIREL','RUA CARNOT, 628 - CANINDE','03032030','SAO PAULO','SP','11 2106-6565','09306720000154','149962702112','financeiro@fogoazul.com.br'),(2,'JLG GOLA UTILIDADES DOMESTICAS','RUA CARNOT - BOX 06, 654 - CANINDE','03032030','SAO PAULO','SP','11 2106-6565','30222052000173','119322928110','financeiro@fogoazul.com.br');
/*!40000 ALTER TABLE `fornecedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo`
--

DROP TABLE IF EXISTS `grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `grupo` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo`
--

LOCK TABLES `grupo` WRITE;
/*!40000 ALTER TABLE `grupo` DISABLE KEYS */;
INSERT INTO `grupo` VALUES (1,'PANELA'),(2,'FOGAO'),(3,'MOVEIS'),(4,'FERRAGENS'),(5,'UTIL DOMESTICAS'),(6,'CAFETEIRA'),(7,'CANECAO'),(8,'LEITEIRA');
/*!40000 ALTER TABLE `grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locacao`
--

DROP TABLE IF EXISTS `locacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locacao` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `locacao` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locacao`
--

LOCK TABLES `locacao` WRITE;
/*!40000 ALTER TABLE `locacao` DISABLE KEYS */;
INSERT INTO `locacao` VALUES (1,'A001'),(2,'A002'),(3,'A003'),(4,'A004'),(5,'A005'),(6,'A006'),(7,'A007'),(8,'A008'),(9,'A009'),(10,'A010'),(11,'A011'),(12,'A012'),(13,'A013'),(14,'A014'),(15,'A015'),(16,'A016'),(17,'A017'),(18,'A018'),(19,'A019'),(20,'A020'),(21,'A021'),(22,'A022'),(23,'A023'),(24,'A024'),(25,'A025'),(26,'A026'),(27,'A027'),(28,'A028'),(29,'A029'),(30,'A030'),(31,'A031'),(32,'A032'),(33,'A033'),(34,'A034'),(35,'A035'),(36,'A036'),(37,'A037'),(38,'A038'),(39,'A039'),(40,'A040'),(41,'A041'),(42,'A042'),(43,'A043'),(44,'A043'),(45,'A045'),(46,'A046'),(47,'A047'),(48,'A048'),(49,'A049'),(50,'A050'),(51,'A051'),(52,'A052'),(53,'A053'),(54,'A054'),(55,'A055'),(56,'A056'),(57,'A057'),(58,'A058'),(59,'A059'),(60,'A060'),(61,'A061'),(62,'A062'),(63,'A063'),(64,'A064'),(65,'A065'),(66,'A066'),(67,'A067'),(68,'A068'),(69,'A069'),(70,'A070'),(71,'A071'),(72,'A072'),(73,'A073'),(74,'A074'),(75,'A075'),(76,'A076'),(77,'A077'),(78,'A078'),(79,'A079'),(80,'A080'),(81,'A081'),(82,'A082'),(83,'A083'),(84,'A084'),(85,'A085'),(86,'A086'),(87,'A087'),(88,'A088'),(89,'A089'),(90,'A090'),(91,'A091'),(92,'A092'),(93,'A093'),(94,'A094'),(95,'A095'),(96,'A096'),(97,'A097'),(98,'A098'),(99,'A099'),(100,'A100');
/*!40000 ALTER TABLE `locacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marca` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `marca` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` VALUES (1,'CLOCK'),(2,'EMPRESS'),(3,'ERILAR'),(4,'FULGOR'),(5,'GLOBO'),(6,'LARES'),(7,'MARMICOC'),(8,'NIGRO'),(9,'ROCHEDO'),(10,'PANEX'),(11,'PENEDO'),(12,'TRAMONTINA'),(13,'DAKO'),(14,'BRASTEMP'),(15,'ARNO'),(16,'PHILCO'),(17,'BRITANIA'),(18,'UNIV PANELA'),(19,'UNIV FOGAO'),(20,'UNIV MOVEIS'),(21,'UNIV FERRAGENS'),(22,'UNIV UTIL DOMEST'),(23,'CAFETEIRA ITALIA'),(24,'UNIV CANECAO'),(25,'UNIV LEITEIRA'),(26,'IMAR'),(27,'ALCAST'),(28,'VALENCIA'),(29,'RENATA'),(30,'SUPRENS');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produtos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_grupo` bigint(20) DEFAULT NULL,
  `id_marca` bigint(20) DEFAULT NULL,
  `id_locacao` bigint(20) DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT 'A',
  `descricao` varchar(200) NOT NULL,
  `estoque_min` int(11) NOT NULL,
  `estoque_max` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_grupo_produtos` (`id_grupo`),
  KEY `fk_marca_produtos` (`id_marca`),
  CONSTRAINT `fk_grupo_produtos` FOREIGN KEY (`id_grupo`) REFERENCES `grupo` (`id`),
  CONSTRAINT `fk_marca_produtos` FOREIGN KEY (`id_marca`) REFERENCES `marca` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (1,6,23,1,'A','CABO CAFET ITALIANA 03 CAFES G.R M 2',3,5),(2,1,3,2,'A','BORR PAN PRESS SILIC ERILAR 13-18-22l FINA GUAM',3,5),(3,2,26,3,'A','REGULADOR GD 2000 - 02KG/H IMAR',3,5),(4,1,18,4,'A','BORR PAN PRESS SILIC MULTIUSO 7L AZ CWA',5,10),(5,1,8,5,'A','BORR PAN PRESS SILIC ETERNA NIGRO 3-4,5-6L S/PQ CWA',5,10),(6,1,4,6,'A','BORR PAN PRESS COMUM FULGOR 12-20L GUAM',5,10),(7,1,12,7,'A','CABO PANELA TIPO TRAMONTINA C028 LL',3,5),(8,1,18,8,'A','CABO PANELA 03F PQ C063 LL M3',5,10),(9,1,27,9,'A','BORR PAN PRESS SILIC 3D ALCAST 4,5L S/PIQ CWA',5,10),(10,6,23,10,'A','CABO CAFET ITALIANA 06 CAFES G.R M 2',3,5),(11,6,23,11,'A','CABO CAFET ITALIANA 09 CAFES G.R M 2',3,5),(12,1,8,12,'A','BORR PAN PRESS SILIC ETERNA NIGRO 4,5L GUAM',5,10),(13,1,4,13,'A','BORR PAN PRESS COMUM FULGOR 12-15-20L GUAM',5,10),(14,1,12,14,'A','CABO PANELA SUPERIOR TAMPA VALENCIA TRAM',3,5),(15,1,10,15,'A','BORR PAN PRESS SILIC PANEX LIDER 3-4-5-7L GUAM',5,10),(16,2,28,16,'A','MANGUEIRA GLP 18*10MM 1250MM RENATA',5,10),(17,1,9,17,'A','BORR PAN PRESS SILIC ROCHEDO 11,4-20,8L GUAM',5,10),(18,6,23,18,'A','GUARNICAO CAFET ITALIANA 03 CAFES GUAM PT 2',3,5),(19,6,23,19,'A','GUARNICAO CAFET ITALIANA 06 CAFES GUAM PT 2',3,5),(20,6,23,20,'A','GUARNICAO CAFET ITALIANA 09 CAFES GUAM PT 2',3,5),(21,4,30,21,'A','ABRACADEIRA PRESS 5/8 * 3/4 M 10',10,25),(22,4,21,22,'A','REBITE PANELA 5/32 * 8 PT 100GR',10,25),(23,4,21,23,'A','REBITE PANELA 5/32 * 22 PT 100GR',10,25),(24,4,21,24,'A','REBITE PANELA 3/16 * 11 PT 100GR',10,25),(25,4,21,25,'A','REBITE PANELA 5/32 * 10 PT 100GR',10,25),(26,2,26,26,'A','REGULADOR GD 506/01 ALIANCA',3,5),(27,2,26,27,'A','REGULADOR PQ IMAR',3,5),(28,2,26,28,'A','REGULADOR PQ NV 504/1 ALIANCA',3,5),(29,1,18,10,'A','ALCA CAÇAROLA PANELA PRESS A025 LL M3',5,35);
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saida_produto`
--

DROP TABLE IF EXISTS `saida_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `saida_produto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_produto` int(11) DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `qtde` int(11) DEFAULT NULL,
  `data_saida` date DEFAULT NULL,
  `valor_unitario` decimal(9,2) DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saida_produto`
--

LOCK TABLES `saida_produto` WRITE;
/*!40000 ALTER TABLE `saida_produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `saida_produto` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`localhost`*/ /*!50003 TRIGGER `TRG_SaidaProduto_AI` AFTER INSERT ON `saida_produto`
FOR EACH ROW
BEGIN
      CALL SP_AtualizaEstoque (new.id_produto, new.qtde * -1, new.valor_unitario);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`localhost`*/ /*!50003 TRIGGER `TRG_SaidaProduto_AU` AFTER UPDATE ON `saida_produto`
FOR EACH ROW
BEGIN
      CALL SP_AtualizaEstoque (new.id_produto, old.qtde - new.qtde, new.valor_unitario);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`localhost`*/ /*!50003 TRIGGER `TRG_SaidaProduto_AD` AFTER DELETE ON `saida_produto`
FOR EACH ROW
BEGIN
      CALL SP_AtualizaEstoque (old.id_produto, old.qtde, old.valor_unitario);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id_usuario` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(200) NOT NULL,
  `senha` varchar(250) NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'mbfreitas0@gmail.com','$2b$10$e5vaALvyq4tiF3wSqP4cmeJ/en8R2uJ1LYouuBmEl5B3hecCRdKTi');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-07  6:45:58
