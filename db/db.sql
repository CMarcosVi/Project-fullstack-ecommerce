CREATE DATABASE  IF NOT EXISTS `products` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `products`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: products
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `computers`
--

DROP TABLE IF EXISTS `computers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `computers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(120) DEFAULT NULL,
  `processador` varchar(180) DEFAULT NULL,
  `fonte` varchar(180) DEFAULT NULL,
  `placa_mae` varchar(180) DEFAULT NULL,
  `memoria_ram` varchar(180) DEFAULT NULL,
  `placa_de_video` varchar(75) NOT NULL,
  `ssd` varchar(45) NOT NULL,
  `gabinete` varchar(180) DEFAULT NULL,
  `fan_gabinete` varchar(45) NOT NULL,
  `garantia` varchar(45) NOT NULL,
  `sistema_operacional` varchar(75) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `computers`
--

LOCK TABLES `computers` WRITE;
/*!40000 ALTER TABLE `computers` DISABLE KEYS */;
INSERT INTO `computers` VALUES (1,'Ryzen 9,RTX 4090, 64GB ram','AMD Ryzen 9 5900X 3.7GHz (4.8GHz Turbo)','Asus 850W Rog Thor 850p2 gaming','SuperFrame B550M Legendary Series Chipset B550, AMD, AM4, mATX, DDR4','Kingston Fury Beast, RGB, 32GB, 6000MHz, DDR5, CL36, Branco','RTX 4090 Asus NVIDIA ROG Strix, 24 GB GDDR6X, ARGB, DLSS, Ray Tracing','SSD 1TB NVMe M.2 2280 Samsung 990 PRO','GABINETE TT CORE P8 TG WALL','Sim','2 Anos','Windows 11'),(2,'Ryzen 9,RTX 4090, 64GB ram','AMD Ryzen 9 5900X 3.7GHz (4.8GHz Turbo)','Asus 850W Rog Thor 850p2 gaming','SuperFrame B550M Legendary Series Chipset B550, AMD, AM4, mATX, DDR4','Kingston Fury Beast, RGB, 32GB, 6000MHz, DDR5, CL36, Branco','RX 7900 XTX OC Edition TUF Gaming Asus AMD, 24 GB GDDR6, ARGB','SSD 1TB NVMe M.2 2280 Samsung 990 PRO','GABINETE TT CORE P8 TG WALL','Sim','2 Anos','Windows 11'),(3,'Intel I9 14900K ,RTX 4090, 64GB ram','Intel Core i9 14900K Box (LGA 1700/24 Cores / 32 Threads / 3.6 GHz (6.0GHz Turbo) / 36MB Cache) ','Asus 850W Rog Thor 850p2 gaming','GIGABYTE Z790 AORUS Elite AX (LGA 1700/Intel Z790/ATX/ DDR5/Quad M.2/PCIe 5.0/USB 3.2 Gen2X2 Type-C/Intel WiFi 6E/2.5GbE LAN/Q-Flash Plus/PCIe EZ-Latch','Kingston Fury Beast, RGB, 32GB, 6000MHz, DDR5, CL36, Branco','RTX 4090 Asus NVIDIA ROG Strix, 24 GB GDDR6X, ARGB, DLSS, Ray Tracing','SSD 1TB NVMe M.2 2280 Samsung 990 PRO','GABINETE TT CORE P8 TG WALL','Sim','2 Anos','Windows 11'),(4,'Intel i7-14700F, GeForce RTX 4060 Ti 8GB, 16GB DDR4, SSD 480GB M.2',' i7 14700KF 14ª Geração 3.4 GHz (5.6GHz Turbo) 33MB Cache LGA 1700','ATX 650W - CV650-80 PLUS BRONZE ','GIGABYTE Z790 AORUS Elite AX (LGA 1700/Intel Z790/ATX/ DDR5/Quad M.2/PCIe 5.0/USB 3.2 Gen2X2 Type-C/Intel WiFi 6E/2.5GbE LAN/Q-Flash Plus/PCIe EZ-Latch','Memória de 16GB DIMM DDR4 3200Mhz FURY Beast 1,35V ','Geforce Rtx 4060 1-click Oc 2x V2, 8gb, Gddr6, 128bits','SSD Kingston NV2 500GB NVMe M.2 2280','GABINETE POUTER 3','Sim','2 Ano','Windows 11');
/*!40000 ALTER TABLE `computers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consoles`
--

DROP TABLE IF EXISTS `consoles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consoles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `price` float NOT NULL,
  `company` varchar(45) NOT NULL,
  `used` tinyint NOT NULL,
  `type` varchar(45) DEFAULT NULL,
  `imgs` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consoles`
--

LOCK TABLES `consoles` WRITE;
/*!40000 ALTER TABLE `consoles` DISABLE KEYS */;
INSERT INTO `consoles` VALUES (1,'Xbox One S',2299,'Microsoft',0,'console','xbox-one-s.png'),(2,'Xbox Series X',3799,'Microsoft',0,'console','xbox-series-x.png'),(3,'Playstation 4',2499,'Sony',0,'console','playstation-4.png'),(4,'Playstation 5',3599,'Sony',0,'console','playstation-5.png'),(5,'Nintendo Switch',1899,'Nintendo',0,'console','nintendo-switch.png'),(6,'God of war Ragnarok',249,'Sony',0,'console','GOWR.webp'),(7,'BloodBorn',59,'Sony',0,'console','bloodborn.jpg'),(8,'Uncharted 4 A Thief\'s End',60,'Sony',0,'console','uncharted-4-a-thief-s-end.webp'),(9,'Forza Horizon 4',129,'Microsoft',0,'console','forza-horizon-4.jpg'),(10,'Halo 5',99,'Microsoft',0,'console','halo-5-guardians.webp'),(11,'Gear of war 5',149,'Microsoft',0,'console','gears-5.jpg'),(12,'Hades',329,'Nintendo',0,'console','hades-ns.png'),(13,'Doom Eternal',259,'Nintendo',0,'console','doom-eternal-ns.jpg'),(14,'Dragon Ball Xenoverse 2',135,'Nintendo',0,'console','dragon-ball-xenoverse-2-ns.webp');
/*!40000 ALTER TABLE `consoles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drinks`
--

DROP TABLE IF EXISTS `drinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drinks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `flavour` varchar(45) NOT NULL,
  `price` float NOT NULL,
  `aging_time` varchar(45) NOT NULL,
  `amount` int NOT NULL,
  `alcohol_content` int NOT NULL,
  `type` varchar(20) DEFAULT NULL,
  `imgs` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drinks`
--

LOCK TABLES `drinks` WRITE;
/*!40000 ALTER TABLE `drinks` DISABLE KEYS */;
INSERT INTO `drinks` VALUES (1,'Royal salute 21 anos','frutado, completo e com um defumado sutil',859,'21',700,40,'drink','Royal-Salute-21.png'),(2,'Double Cask 12 anos','mel, frutas cítricas e gengibre',765,'12',700,40,'drink','the_macallan_double_cask_12.png'),(3,'Bourbon Willett 700ml','notas de toffee, canela e baunilha',560,'10',700,47,'drink','willett-pot-still-reserve-small-batch.png'),(4,'Blue Label','Avelãs, frutas cítricas, baunilha e mel',1110,'20',750,40,'drink','jhonny-walker-blue-label.png'),(5,'Green Label','Levemente turfado e marítimo',390,'15',750,40,'drink','johnny-walker-green-label.webp'),(6,'Black Label','frutado, com notas cítricas, baunilha e nozes',209,'12',1000,40,'drink','johnny-walker-black-label.png'),(7,'Chivas Regal 18 anos','frutas secas,caramelo,chocolate amargo',459,'18',750,40,'drink','chivas-18-anos.png'),(8,'Glenfiddich','Chocolate, maçã, laranja, mel, nozes e passas',442,'12',750,40,'drink','Glenfiddich-Single-Malt-12-anos.png'),(9,'Red Label','doce e áspero, toques de canela e pimenta',88,'8',1000,40,'drink','RED-LABEL-1L-1.png'),(10,'Ballantines Finest Blended Escocês','chocolate ao leite, maçã e baunilha',89,'8',1000,40,'drink','ballantines-8-anos.png'),(11,'White Horse','sabor encorpado,turfado e um sabor quente',59,'8',700,43,'drink','Whisky-White-Horse-1l.png'),(12,'Jack Daniels','robusto,carvalho tostado,baunilha e caramelo',139,'8',1000,40,'drink','jack-daniels-1l.png');
/*!40000 ALTER TABLE `drinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foods`
--

DROP TABLE IF EXISTS `foods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `foods` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `weight` float NOT NULL,
  `type` varchar(30) NOT NULL,
  `price` int NOT NULL,
  `imgs` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foods`
--

LOCK TABLES `foods` WRITE;
/*!40000 ALTER TABLE `foods` DISABLE KEYS */;
INSERT INTO `foods` VALUES (1,'Banana_prata',1000,'food',6,'Banana-Prata.png'),(2,'Uva',1500,'food',12,'uva.png'),(3,'Abacate',1000,'food',5,'abacate.png'),(4,'Maça',1000,'food',8,'maca.webp'),(5,'Abacaxi',1000,'food',4,'abacaxi.png'),(6,'Laranja',1000,'food',5,'laranja.png'),(7,'Amendoin',1005,'food',10,'amendoin.webp'),(8,'Cenoura',1000,'food',3,'cenoura.png'),(9,'Brocolis',1000,'food',15,'brocolis.jpg'),(10,'Arroz',5000,'food',23,'arroz.png'),(11,'Feijão',1000,'food',11,'feijao.png'),(12,'Aveia',1000,'food',9,'aveia.png');
/*!40000 ALTER TABLE `foods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kitchenproducts`
--

DROP TABLE IF EXISTS `kitchenproducts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kitchenproducts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `price` float NOT NULL,
  `material` varchar(20) NOT NULL,
  `brand` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kitchenproducts`
--

LOCK TABLES `kitchenproducts` WRITE;
/*!40000 ALTER TABLE `kitchenproducts` DISABLE KEYS */;
INSERT INTO `kitchenproducts` VALUES (1,'kit 12 colheres de aço inox',50,'Aço inox','Tramontina'),(2,'kit 24 peças garfo e faca inox',60,'Aço inox','Continental'),(3,'kit 30 panos de prato',14,'algodão ','Sem marca'),(4,'Fogão 4 bocas Esmaltec',692,'Aço,Vidro','Esmaltec'),(5,'Fogão 6 bocas',1100,'Açõ,vidro','Waves');
/*!40000 ALTER TABLE `kitchenproducts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smartphones`
--

DROP TABLE IF EXISTS `smartphones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `smartphones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `brand` varchar(20) NOT NULL,
  `price` float DEFAULT NULL,
  `camera` int NOT NULL,
  `peso` float NOT NULL,
  `Capacidade` float NOT NULL,
  `tela` varchar(15) NOT NULL,
  `processador` varchar(45) NOT NULL,
  `bateria` int NOT NULL,
  `type` varchar(20) DEFAULT NULL,
  `imgs` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smartphones`
--

LOCK TABLES `smartphones` WRITE;
/*!40000 ALTER TABLE `smartphones` DISABLE KEYS */;
INSERT INTO `smartphones` VALUES (1,'Iphone 15','Apple',4699,48,187,256,'6.69','A16_Bionic',4400,'smartphone','Iphone-15.png'),(2,'Samsung S24 Ultra','Samsung',6999,200,232,256,'6.8','Snapdragon_8_Gen_3',5000,'smartphone','Galaxy-S24-Ultra.png'),(3,'Samsung Galaxy Z Fold 6','Samsung',10000,50,239,512,'7.6 ','Snapdragon_8_Gen_3',4400,'smartphone','Samsung-Galaxy-Z-Fold-6.png'),(4,'Motorola Edge 50 Ultra 5G','Motorola',5399,50,197,512,'6.7','Snapdragon_8_Gen_3',4500,'smartphone','Motorola-Edge-50-Ultra-5G.png'),(5,'Samsung A55','Samsung',1899,50,213,256,'6.6','SAMSUNG_Exynos_1480',5000,'smartphone','samsung-galaxy-a55.png'),(6,'Motorola Edge 40','Motorola',1659,50,172,256,'6.55','Dimensity_8020_MediaTek',4400,'smartphone','Motorola_Edge-40.png'),(7,'Samsung S23','Samsung',2499,50,168,256,'6.1','Snapdragon_8_Gen_2_Qualcomm_SM8550-AB',3900,'smartphone','Galaxy-S23.png'),(8,'POCO X5 Pro 5G','Xiaomi ',1399,108,181,128,'6.67','Snapdragon_778G',5000,'smartphone','Poco-X5-Pro-5G.png'),(9,'POCO C65','Xiaomi ',1099,50,192,128,'6.74','Helio_G85',5000,'smartphone','POCO-C65.png'),(10,'Samsung Galaxy A15','Samsung',899,50,200,256,'6.5','Helio_G99',5000,'smartphone','Samsung-Galaxy-a15.png'),(11,'Moto G54','Motorola',1149,50,177,128,'6.5','Dimensity_7020',5000,'smartphone','Motorola-G54.png'),(12,'Realme C67','Xiaomi ',1150,50,190,128,'6.72','Dimensity_6100_Plus',5000,'smartphone','Realme-C67.png');
/*!40000 ALTER TABLE `smartphones` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-09 17:22:43
CREATE DATABASE  IF NOT EXISTS `usuarios` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `usuarios`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: usuarios
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `passwordtoken`
--

DROP TABLE IF EXISTS `passwordtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passwordtoken` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` varchar(45) NOT NULL,
  `user_id` int NOT NULL,
  `used` tinyint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_passwordtoken_users_idx` (`user_id`),
  CONSTRAINT `FK_passwordtoken_users` FOREIGN KEY (`user_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passwordtoken`
--

LOCK TABLES `passwordtoken` WRITE;
/*!40000 ALTER TABLE `passwordtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `passwordtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(120) NOT NULL,
  `role` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'name','email@gmail.com','$2b$10$XMsUMPVkzR1jjLItTjuSpuHXx7JGoi1QH5KLGPl8NwfyaM07JiMom','0');
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

-- Dump completed on 2024-08-09 17:22:43
