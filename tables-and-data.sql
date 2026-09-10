CREATE DATABASE  IF NOT EXISTS `srf` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `srf`;
-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: srf
-- ------------------------------------------------------
-- Server version	9.6.0

--
-- Table structure for table `_prisma_migrations`
--

DROP TABLE IF EXISTS `_prisma_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checksum` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `finished_at` datetime DEFAULT NULL,
  `migration_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logs` text COLLATE utf8mb4_unicode_ci,
  `rolled_back_at` datetime DEFAULT NULL,
  `started_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `applied_steps_count` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_prisma_migrations`
--

LOCK TABLES `_prisma_migrations` WRITE;
/*!40000 ALTER TABLE `_prisma_migrations` DISABLE KEYS */;
INSERT INTO `_prisma_migrations` VALUES ('36f92a31-9af7-4060-b73f-0d09e4b9937b','e6dd744191823d5b7335818807b486d4428c63675ec483556a17074f895f1b03','2026-03-05 13:21:53.570','20260305132136_system_template_structure',NULL,NULL,'2026-03-05 13:21:36.792',1),('4589c10a-ea15-4404-9137-63e0db146f08','9c99d9b3651b8a43375a3a86849dee8cd866a75b8e7aa679df9858e0e4ac788a','2026-03-06 12:18:05.727','20260306121804_fix_card_link_is_optional',NULL,NULL,'2026-03-06 12:18:04.492',1),('bb899775-977d-43f3-bc55-48726c2659b7','dd7300f969f49ee55a6686a08cbf89b5870595482e8764db1b150125acc1fa74','2026-03-05 13:35:50.684','20260305133329_add_specific_database',NULL,NULL,'2026-03-05 13:33:29.953',1);
/*!40000 ALTER TABLE `_prisma_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agente_sorologico`
--

DROP TABLE IF EXISTS `agente_sorologico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agente_sorologico` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agente_sorologico`
--

LOCK TABLES `agente_sorologico` WRITE;
/*!40000 ALTER TABLE `agente_sorologico` DISABLE KEYS */;
INSERT INTO `agente_sorologico` VALUES (35,'Ehrlichia canis'),(36,'Babesia canis'),(37,'Leishmania chagasi'),(38,'Toxoplasma gondii'),(39,'Neospora caninum'),(40,'Bartonella henselae');
/*!40000 ALTER TABLE `agente_sorologico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agente_suspeito`
--

DROP TABLE IF EXISTS `agente_suspeito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agente_suspeito` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agente_suspeito`
--

LOCK TABLES `agente_suspeito` WRITE;
/*!40000 ALTER TABLE `agente_suspeito` DISABLE KEYS */;
INSERT INTO `agente_suspeito` VALUES (22,'Anaplasmataceae'),(23,'hemoplasmas'),(24,'piroplasmídeos'),(25,'Hepatozoon');
/*!40000 ALTER TABLE `agente_suspeito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `armazem`
--

DROP TABLE IF EXISTS `armazem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `armazem` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `armazem`
--

LOCK TABLES `armazem` WRITE;
/*!40000 ALTER TABLE `armazem` DISABLE KEYS */;
INSERT INTO `armazem` VALUES (61,'LEMa'),(62,'LEIMa'),(63,'IOC-FIOCRUZ'),(64,'ScienceVet'),(65,'ImunoDot'),(66,'LEGO'),(67,'VBBL'),(68,'CHIOC'),(69,'Prof. Darci');
/*!40000 ALTER TABLE `armazem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especie`
--

DROP TABLE IF EXISTS `especie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `especie` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especie`
--

LOCK TABLES `especie` WRITE;
/*!40000 ALTER TABLE `especie` DISABLE KEYS */;
INSERT INTO `especie` VALUES (65,'Canis lupus familiaris'),(66,'Felis catus'),(67,'Cerdocyon thous'),(68,'Procyon cancrivorus'),(69,'Chrysocyon brachyurus'),(70,'Conepatus semistriatus'),(71,'Nasua nasua'),(72,'Puma yagouaroundi'),(73,'Leopardus pardalis'),(74,'Puma concolor'),(75,'Lycalopex vetulus'),(76,'Eira barbara');
/*!40000 ALTER TABLE `especie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo_animal_morto`
--

DROP TABLE IF EXISTS `grupo_animal_morto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grupo_animal_morto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo_animal_morto`
--

LOCK TABLES `grupo_animal_morto` WRITE;
/*!40000 ALTER TABLE `grupo_animal_morto` DISABLE KEYS */;
INSERT INTO `grupo_animal_morto` VALUES (17,'Doméstico'),(18,'Silvestre');
/*!40000 ALTER TABLE `grupo_animal_morto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enum_origem_animal_morto`
--

DROP TABLE IF EXISTS `enum_origem_animal_morto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enum_origem_animal_morto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enum_origem_animal_morto`
--

LOCK TABLES `enum_origem_animal_morto` WRITE;
/*!40000 ALTER TABLE `enum_origem_animal_morto` DISABLE KEYS */;
INSERT INTO `enum_origem_animal_morto` VALUES (17,'Atropelamento'),(18,'Canil');
/*!40000 ALTER TABLE `enum_origem_animal_morto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `responsavel_coleta`
--

DROP TABLE IF EXISTS `responsavel_coleta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `responsavel_coleta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `responsavel_coleta`
--

LOCK TABLES `responsavel_coleta` WRITE;
/*!40000 ALTER TABLE `responsavel_coleta` DISABLE KEYS */;
INSERT INTO `responsavel_coleta` VALUES (24,'DER'),(25,'PEFBJ'),(26,'Prefeitura'),(27,'Natalie');
/*!40000 ALTER TABLE `responsavel_coleta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enum_status_animal_morto`
--

DROP TABLE IF EXISTS `enum_status_animal_morto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enum_status_animal_morto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enum_status_animal_morto`
--

LOCK TABLES `enum_status_animal_morto` WRITE;
/*!40000 ALTER TABLE `enum_status_animal_morto` DISABLE KEYS */;
INSERT INTO `enum_status_animal_morto` VALUES (30,'LEIMa'),(31,'PEFBJ'),(32,'Necropsia feita'),(33,'Em análise'),(34,'Freezer UNESP');
/*!40000 ALTER TABLE `enum_status_animal_morto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `animal_morto`
--

DROP TABLE IF EXISTS `animal_morto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animal_morto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_grupo_animal_morto` int NOT NULL,
  `id_especie` int NOT NULL,
  `id_origem_animal_morto` int NOT NULL,
  `id_status_animal_morto` int NOT NULL,
  `data_coleta` datetime NOT NULL,
  `id_responsavel_coleta` int NOT NULL,
  `longitude_coleta` double NOT NULL,
  `latitude_coleta` double NOT NULL,
  `link_imagem` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `observacao` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `codigo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQ_animal_morto_codigo` (`codigo`),
  KEY `animal_morto_id_grupo_animal_morto_fkey` (`id_grupo_animal_morto`),
  KEY `animal_morto_id_especie_fkey` (`id_especie`),
  KEY `animal_morto_id_origem_animal_morto_fkey` (`id_origem_animal_morto`),
  KEY `animal_morto_id_status_animal_morto_fkey` (`id_status_animal_morto`),
  KEY `animal_morto_id_responsavel_coleta_fkey` (`id_responsavel_coleta`),
  CONSTRAINT `animal_morto_id_especie_fkey` FOREIGN KEY (`id_especie`) REFERENCES `especie` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `animal_morto_id_grupo_animal_morto_fkey` FOREIGN KEY (`id_grupo_animal_morto`) REFERENCES `grupo_animal_morto` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `animal_morto_id_origem_animal_morto_fkey` FOREIGN KEY (`id_origem_animal_morto`) REFERENCES `enum_origem_animal_morto` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `animal_morto_id_responsavel_coleta_fkey` FOREIGN KEY (`id_responsavel_coleta`) REFERENCES `responsavel_coleta` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `animal_morto_id_status_animal_morto_fkey` FOREIGN KEY (`id_status_animal_morto`) REFERENCES `enum_status_animal_morto` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animal_morto`
--

LOCK TABLES `animal_morto` WRITE;
/*!40000 ALTER TABLE `animal_morto` DISABLE KEYS */;
/*!40000 ALTER TABLE `animal_morto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enum_condicao_reprodutiva`
--

DROP TABLE IF EXISTS `enum_condicao_reprodutiva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enum_condicao_reprodutiva` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enum_condicao_reprodutiva`
--

LOCK TABLES `enum_condicao_reprodutiva` WRITE;
/*!40000 ALTER TABLE `enum_condicao_reprodutiva` DISABLE KEYS */;
INSERT INTO `enum_condicao_reprodutiva` VALUES (49,'Nulípara'),(50,'Pré-púbere'),(51,'Pós-púbere'),(52,'Multípara/provavelmente lactante'),(53,'Indeterminada'),(54,'Primípara'),(55,'Castrada'),(56,'Multípara'),(57,'Lactante');
/*!40000 ALTER TABLE `enum_condicao_reprodutiva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enum_estado_clinico`
--

DROP TABLE IF EXISTS `enum_estado_clinico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enum_estado_clinico` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enum_estado_clinico`
--

LOCK TABLES `enum_estado_clinico` WRITE;
/*!40000 ALTER TABLE `enum_estado_clinico` DISABLE KEYS */;
INSERT INTO `enum_estado_clinico` VALUES (33,'Bom'),(34,'Regular'),(35,'Ruim'),(36,'Não se aplica');
/*!40000 ALTER TABLE `enum_estado_clinico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enum_estado_corporal`
--

DROP TABLE IF EXISTS `enum_estado_corporal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enum_estado_corporal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enum_estado_corporal`
--

LOCK TABLES `enum_estado_corporal` WRITE;
/*!40000 ALTER TABLE `enum_estado_corporal` DISABLE KEYS */;
INSERT INTO `enum_estado_corporal` VALUES (25,'Íntegro'),(26,'Danificado'),(27,'Decomposto');
/*!40000 ALTER TABLE `enum_estado_corporal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enum_faixa_etaria`
--

DROP TABLE IF EXISTS `enum_faixa_etaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enum_faixa_etaria` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enum_faixa_etaria`
--

LOCK TABLES `enum_faixa_etaria` WRITE;
/*!40000 ALTER TABLE `enum_faixa_etaria` DISABLE KEYS */;
INSERT INTO `enum_faixa_etaria` VALUES (26,'Jovem'),(27,'Adulto'),(28,'Idoso');
/*!40000 ALTER TABLE `enum_faixa_etaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enum_genero`
--

DROP TABLE IF EXISTS `enum_genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enum_genero` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enum_genero`
--

LOCK TABLES `enum_genero` WRITE;
/*!40000 ALTER TABLE `enum_genero` DISABLE KEYS */;
INSERT INTO `enum_genero` VALUES (1,'Masculino'),(2,'Feminino'),(3,'Prefiro não dizer');
/*!40000 ALTER TABLE `enum_genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enum_genero_animal`
--

DROP TABLE IF EXISTS `enum_genero_animal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enum_genero_animal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enum_genero_animal`
--

LOCK TABLES `enum_genero_animal` WRITE;
/*!40000 ALTER TABLE `enum_genero_animal` DISABLE KEYS */;
INSERT INTO `enum_genero_animal` VALUES (1,'Fêmea'),(2,'Macho');
/*!40000 ALTER TABLE `enum_genero_animal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enum_hidratacao`
--

DROP TABLE IF EXISTS `enum_hidratacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enum_hidratacao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enum_hidratacao`
--

LOCK TABLES `enum_hidratacao` WRITE;
/*!40000 ALTER TABLE `enum_hidratacao` DISABLE KEYS */;
INSERT INTO `enum_hidratacao` VALUES (27,'Hidratado'),(28,'Desidratação leve'),(29,'Desidratação moderada'),(30,'Desidratação grave'),(31,'Desidratação crítica');
/*!40000 ALTER TABLE `enum_hidratacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enum_interpretacao`
--

DROP TABLE IF EXISTS `enum_interpretacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enum_interpretacao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enum_interpretacao`
--

LOCK TABLES `enum_interpretacao` WRITE;
/*!40000 ALTER TABLE `enum_interpretacao` DISABLE KEYS */;
INSERT INTO `enum_interpretacao` VALUES (32,'Sem alterações'),(33,'Alterações discretas'),(34,'Alterações moderadas'),(35,'Alterações acentuadas'),(36,'Inconclusivo - amostra inadequada'),(37,'Não realizado');
/*!40000 ALTER TABLE `enum_interpretacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enum_interpretacao_analise_sorologica`
--

DROP TABLE IF EXISTS `enum_interpretacao_analise_sorologica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enum_interpretacao_analise_sorologica` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enum_interpretacao_analise_sorologica`
--

LOCK TABLES `enum_interpretacao_analise_sorologica` WRITE;
/*!40000 ALTER TABLE `enum_interpretacao_analise_sorologica` DISABLE KEYS */;
INSERT INTO `enum_interpretacao_analise_sorologica` VALUES (22,'Positivo'),(23,'Negativo'),(24,'Inconclusivo');
/*!40000 ALTER TABLE `enum_interpretacao_analise_sorologica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enum_metodo_cpcr`
--

DROP TABLE IF EXISTS `enum_metodo_cpcr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enum_metodo_cpcr` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enum_metodo_cpcr`
--

LOCK TABLES `enum_metodo_cpcr` WRITE;
/*!40000 ALTER TABLE `enum_metodo_cpcr` DISABLE KEYS */;
INSERT INTO `enum_metodo_cpcr` VALUES (17,'cPCR (PCR convencional)'),(18,'nPCR (nested PCR)'),(19,'cPCR e nPCR');
/*!40000 ALTER TABLE `enum_metodo_cpcr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enum_mucosa`
--

DROP TABLE IF EXISTS `enum_mucosa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enum_mucosa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enum_mucosa`
--

LOCK TABLES `enum_mucosa` WRITE;
/*!40000 ALTER TABLE `enum_mucosa` DISABLE KEYS */;
INSERT INTO `enum_mucosa` VALUES (22,'Hipocorada'),(23,'Normocorada'),(24,'Hiperêmica');
/*!40000 ALTER TABLE `enum_mucosa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enum_nivel_acesso`
--

DROP TABLE IF EXISTS `enum_nivel_acesso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enum_nivel_acesso` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` int NOT NULL,
  `nome` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enum_nivel_acesso`
--

LOCK TABLES `enum_nivel_acesso` WRITE;
/*!40000 ALTER TABLE `enum_nivel_acesso` DISABLE KEYS */;
INSERT INTO `enum_nivel_acesso` VALUES ('edit',2,'Editar'),('edit_unrestricted',3,'Editar sem restrições'),('read',1,'Ler');
/*!40000 ALTER TABLE `enum_nivel_acesso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enum_status_alocacao_amostra_necropsia`
--

DROP TABLE IF EXISTS `enum_status_alocacao_amostra_necropsia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enum_status_alocacao_amostra_necropsia` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enum_status_alocacao_amostra_necropsia`
--

LOCK TABLES `enum_status_alocacao_amostra_necropsia` WRITE;
/*!40000 ALTER TABLE `enum_status_alocacao_amostra_necropsia` DISABLE KEYS */;
INSERT INTO `enum_status_alocacao_amostra_necropsia` VALUES (13,'Aguardando processamento'),(14,'Processada');
/*!40000 ALTER TABLE `enum_status_alocacao_amostra_necropsia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enum_status_alocacao_amostra_veterinario`
--

DROP TABLE IF EXISTS `enum_status_alocacao_amostra_veterinario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enum_status_alocacao_amostra_veterinario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enum_status_alocacao_amostra_veterinario`
--

LOCK TABLES `enum_status_alocacao_amostra_veterinario` WRITE;
/*!40000 ALTER TABLE `enum_status_alocacao_amostra_veterinario` DISABLE KEYS */;
INSERT INTO `enum_status_alocacao_amostra_veterinario` VALUES (33,'Aguardando processamento'),(34,'Processada'),(35,'Armazenada'),(36,'Descartada');
/*!40000 ALTER TABLE `enum_status_alocacao_amostra_veterinario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enum_status_cpcr`
--

DROP TABLE IF EXISTS `enum_status_cpcr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enum_status_cpcr` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enum_status_cpcr`
--

LOCK TABLES `enum_status_cpcr` WRITE;
/*!40000 ALTER TABLE `enum_status_cpcr` DISABLE KEYS */;
INSERT INTO `enum_status_cpcr` VALUES (17,'Positivo'),(18,'Negativo'),(19,'Inconclusivo');
/*!40000 ALTER TABLE `enum_status_cpcr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enum_status_qpcr`
--

DROP TABLE IF EXISTS `enum_status_qpcr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enum_status_qpcr` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enum_status_qpcr`
--

LOCK TABLES `enum_status_qpcr` WRITE;
/*!40000 ALTER TABLE `enum_status_qpcr` DISABLE KEYS */;
INSERT INTO `enum_status_qpcr` VALUES (17,'Positivo'),(18,'Negativo'),(19,'Inconclusivo');
/*!40000 ALTER TABLE `enum_status_qpcr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enum_tipo_resultado_analise_sorologica`
--

DROP TABLE IF EXISTS `enum_tipo_resultado_analise_sorologica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enum_tipo_resultado_analise_sorologica` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enum_tipo_resultado_analise_sorologica`
--

LOCK TABLES `enum_tipo_resultado_analise_sorologica` WRITE;
/*!40000 ALTER TABLE `enum_tipo_resultado_analise_sorologica` DISABLE KEYS */;
INSERT INTO `enum_tipo_resultado_analise_sorologica` VALUES (15,'Título'),(16,'Densidade Óptica (D.O.)');
/*!40000 ALTER TABLE `enum_tipo_resultado_analise_sorologica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enum_tipo_vacina`
--

DROP TABLE IF EXISTS `enum_tipo_vacina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enum_tipo_vacina` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enum_tipo_vacina`
--

LOCK TABLES `enum_tipo_vacina` WRITE;
/*!40000 ALTER TABLE `enum_tipo_vacina` DISABLE KEYS */;
INSERT INTO `enum_tipo_vacina` VALUES (14,'Reforço'),(15,'Protocolo de filhote - V8');
/*!40000 ALTER TABLE `enum_tipo_vacina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tutor`
--

DROP TABLE IF EXISTS `tutor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tutor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_genero` int NOT NULL,
  `data_nascimento` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tutor_id_genero_fkey` (`id_genero`),
  CONSTRAINT `tutor_id_genero_fkey` FOREIGN KEY (`id_genero`) REFERENCES `enum_genero` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tutor`
--

LOCK TABLES `tutor` WRITE;
/*!40000 ALTER TABLE `tutor` DISABLE KEYS */;
/*!40000 ALTER TABLE `tutor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `necropsia`
--

DROP TABLE IF EXISTS `necropsia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `necropsia` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_animal_morto` int NOT NULL,
  `data_realizacao` datetime NOT NULL,
  `id_estado_corporal` int NOT NULL,
  `id_estado_clinico` int NOT NULL,
  `id_tutor` int DEFAULT NULL,
  `id_condicao_reprodutiva` int NOT NULL,
  `peso` double NOT NULL,
  `id_faixa_etaria` int NOT NULL,
  `observacao` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_genero_identificado` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `necropsia_id_animal_morto_key` (`id_animal_morto`),
  KEY `necropsia_id_estado_corporal_fkey` (`id_estado_corporal`),
  KEY `necropsia_id_estado_clinico_fkey` (`id_estado_clinico`),
  KEY `necropsia_id_tutor_fkey` (`id_tutor`),
  KEY `necropsia_id_condicao_reprodutiva_fkey` (`id_condicao_reprodutiva`),
  KEY `necropsia_id_faixa_etaria_fkey` (`id_faixa_etaria`),
  KEY `necropsia_id_genero_identificado_fkey` (`id_genero_identificado`),
  CONSTRAINT `necropsia_id_animal_morto_fkey` FOREIGN KEY (`id_animal_morto`) REFERENCES `animal_morto` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `necropsia_id_condicao_reprodutiva_fkey` FOREIGN KEY (`id_condicao_reprodutiva`) REFERENCES `enum_condicao_reprodutiva` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `necropsia_id_estado_clinico_fkey` FOREIGN KEY (`id_estado_clinico`) REFERENCES `enum_estado_clinico` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `necropsia_id_estado_corporal_fkey` FOREIGN KEY (`id_estado_corporal`) REFERENCES `enum_estado_corporal` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `necropsia_id_faixa_etaria_fkey` FOREIGN KEY (`id_faixa_etaria`) REFERENCES `enum_faixa_etaria` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `necropsia_id_genero_identificado_fkey` FOREIGN KEY (`id_genero_identificado`) REFERENCES `enum_genero_animal` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `necropsia_id_tutor_fkey` FOREIGN KEY (`id_tutor`) REFERENCES `tutor` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `necropsia`
--

LOCK TABLES `necropsia` WRITE;
/*!40000 ALTER TABLE `necropsia` DISABLE KEYS */;
/*!40000 ALTER TABLE `necropsia` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `tipo_amostra_necropsia`
--

DROP TABLE IF EXISTS `tipo_amostra_necropsia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_amostra_necropsia` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_amostra_necropsia`
--

LOCK TABLES `tipo_amostra_necropsia` WRITE;
/*!40000 ALTER TABLE `tipo_amostra_necropsia` DISABLE KEYS */;
INSERT INTO `tipo_amostra_necropsia` VALUES (98,'Pelo'),(99,'Sangue'),(100,'Ectoparasitos'),(101,'Baço congelado'),(102,'Baço em etanol'),(103,'Coração em formol'),(104,'Fígado em formol'),(105,'Fígado em etanol'),(106,'Fígado em RNA Later'),(107,'Pulmão em RNA Later'),(108,'Instestino em RNA Later'),(109,'Cérebro em RNA Later'),(110,'Helmintos'),(111,'Conteúdo Esstomacal'),(112,'Conteúdo Intestinal'),(113,'Pele'),(114,'Crânio'),(115,'Esqueleto'),(116,'Pulmão Congelado');
/*!40000 ALTER TABLE `tipo_amostra_necropsia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alocacao_amostra_necropsia`
--

DROP TABLE IF EXISTS `alocacao_amostra_necropsia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alocacao_amostra_necropsia` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_necropsia` int NOT NULL,
  `id_tipo_amostra` int NOT NULL,
  `id_armazenamento` int NOT NULL,
  `id_status` int NOT NULL,
  `link_imagem` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `observacao` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantidade` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `alocacao_amostra_necropsia_id_necropsia_id_tipo_amostra_key` (`id_necropsia`,`id_tipo_amostra`),
  KEY `alocacao_amostra_necropsia_id_armazenamento_fkey` (`id_armazenamento`),
  KEY `alocacao_amostra_necropsia_id_tipo_amostra_fkey` (`id_tipo_amostra`),
  KEY `alocacao_amostra_necropsia_id_status_fkey` (`id_status`),
  CONSTRAINT `alocacao_amostra_necropsia_id_armazenamento_fkey` FOREIGN KEY (`id_armazenamento`) REFERENCES `armazem` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `alocacao_amostra_necropsia_id_necropsia_fkey` FOREIGN KEY (`id_necropsia`) REFERENCES `necropsia` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `alocacao_amostra_necropsia_id_status_fkey` FOREIGN KEY (`id_status`) REFERENCES `enum_status_alocacao_amostra_necropsia` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `alocacao_amostra_necropsia_id_tipo_amostra_fkey` FOREIGN KEY (`id_tipo_amostra`) REFERENCES `tipo_amostra_necropsia` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alocacao_amostra_necropsia`
--

LOCK TABLES `alocacao_amostra_necropsia` WRITE;
/*!40000 ALTER TABLE `alocacao_amostra_necropsia` DISABLE KEYS */;
/*!40000 ALTER TABLE `alocacao_amostra_necropsia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_amostra_veterinaria`
--

DROP TABLE IF EXISTS `tipo_amostra_veterinaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_amostra_veterinaria` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_amostra_veterinaria`
--

LOCK TABLES `tipo_amostra_veterinaria` WRITE;
/*!40000 ALTER TABLE `tipo_amostra_veterinaria` DISABLE KEYS */;
INSERT INTO `tipo_amostra_veterinaria` VALUES (57,'Sangue (c/ e s/ EDTA)'),(58,'Soro'),(59,'Pêlo'),(60,'Medula'),(61,'Sangue (c/ EDTA)'),(62,'Sangue (s/ EDTA)'),(63,'Fecal Loops'),(64,'Swab'),(65,'Fezes');
/*!40000 ALTER TABLE `tipo_amostra_veterinaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `animal_vivo`
--

DROP TABLE IF EXISTS `animal_vivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animal_vivo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_especie` int NOT NULL,
  `nome` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_genero` int NOT NULL,
  `data_nascimento` datetime DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  `foto_animal` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_carteirinha` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_tutor` int DEFAULT NULL,
  `codigo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idade` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQ_animal_vivo_codigo` (`codigo`),
  KEY `animal_vivo_id_especie_fkey` (`id_especie`),
  KEY `animal_vivo_id_genero_fkey` (`id_genero`),
  KEY `animal_vivo_id_tutor_fkey` (`id_tutor`),
  CONSTRAINT `animal_vivo_id_especie_fkey` FOREIGN KEY (`id_especie`) REFERENCES `especie` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `animal_vivo_id_genero_fkey` FOREIGN KEY (`id_genero`) REFERENCES `enum_genero_animal` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `animal_vivo_id_tutor_fkey` FOREIGN KEY (`id_tutor`) REFERENCES `tutor` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animal_vivo`
--

LOCK TABLES `animal_vivo` WRITE;
/*!40000 ALTER TABLE `animal_vivo` DISABLE KEYS */;
/*!40000 ALTER TABLE `animal_vivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veterinario`
--

DROP TABLE IF EXISTS `veterinario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `veterinario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veterinario`
--

LOCK TABLES `veterinario` WRITE;
/*!40000 ALTER TABLE `veterinario` DISABLE KEYS */;
INSERT INTO `veterinario` VALUES (13,'Victoria Rosy Machado'),(14,'Gabriela Alves');
/*!40000 ALTER TABLE `veterinario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visita_veterinaria`
--

DROP TABLE IF EXISTS `visita_veterinaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visita_veterinaria` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_animal_vivo` int NOT NULL,
  `id_veterinario` int NOT NULL,
  `data` datetime NOT NULL,
  `foto_animal` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `observacao` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `visita_veterinaria_id_animal_vivo_id_veterinario_data_key` (`id_animal_vivo`,`id_veterinario`,`data`),
  KEY `visita_veterinaria_id_veterinario_fkey` (`id_veterinario`),
  CONSTRAINT `visita_veterinaria_id_animal_vivo_fkey` FOREIGN KEY (`id_animal_vivo`) REFERENCES `animal_vivo` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `visita_veterinaria_id_veterinario_fkey` FOREIGN KEY (`id_veterinario`) REFERENCES `veterinario` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visita_veterinaria`
--

LOCK TABLES `visita_veterinaria` WRITE;
/*!40000 ALTER TABLE `visita_veterinaria` DISABLE KEYS */;
/*!40000 ALTER TABLE `visita_veterinaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alocacao_amostra_veterinario`
--

DROP TABLE IF EXISTS `alocacao_amostra_veterinario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alocacao_amostra_veterinario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_visita_veterinaria` int NOT NULL,
  `id_tipo_amostra` int NOT NULL,
  `id_armazenamento` int NOT NULL,
  `id_status` int NOT NULL,
  `link_imagem` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `observacao` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantidade` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `alocacao_amostra_veterinario_id_visita_veterinaria_id_tipo_a_key` (`id_visita_veterinaria`,`id_tipo_amostra`),
  KEY `alocacao_amostra_veterinario_id_armazenamento_fkey` (`id_armazenamento`),
  KEY `alocacao_amostra_veterinario_id_tipo_amostra_fkey` (`id_tipo_amostra`),
  KEY `alocacao_amostra_veterinario_id_status_fkey` (`id_status`),
  CONSTRAINT `alocacao_amostra_veterinario_id_armazenamento_fkey` FOREIGN KEY (`id_armazenamento`) REFERENCES `armazem` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `alocacao_amostra_veterinario_id_status_fkey` FOREIGN KEY (`id_status`) REFERENCES `enum_status_alocacao_amostra_veterinario` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `alocacao_amostra_veterinario_id_tipo_amostra_fkey` FOREIGN KEY (`id_tipo_amostra`) REFERENCES `tipo_amostra_veterinaria` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `alocacao_amostra_veterinario_id_visita_veterinaria_fkey` FOREIGN KEY (`id_visita_veterinaria`) REFERENCES `visita_veterinaria` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alocacao_amostra_veterinario`
--

LOCK TABLES `alocacao_amostra_veterinario` WRITE;
/*!40000 ALTER TABLE `alocacao_amostra_veterinario` DISABLE KEYS */;
/*!40000 ALTER TABLE `alocacao_amostra_veterinario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especie_ectoparasito`
--

DROP TABLE IF EXISTS `especie_ectoparasito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `especie_ectoparasito` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especie_ectoparasito`
--

LOCK TABLES `especie_ectoparasito` WRITE;
/*!40000 ALTER TABLE `especie_ectoparasito` DISABLE KEYS */;
INSERT INTO `especie_ectoparasito` VALUES (67,'Ctenocephalides felis felis'),(68,'Ctenocephalides canis'),(69,'Tunga penetrans'),(70,'Rhipicephalus sanguineus'),(71,'Rhipicephalus linnaei'),(72,'Ambyomma sculptum'),(73,'Rhipicephalus microplus'),(74,'Trichodectes canis'),(75,'Linognathus setosus'),(76,'Sarcoptes scabiei var. canis'),(77,'Sarcoptes scabiei var. hominis'),(78,'Demodex canis'),(79,'Otodectes cynotis');
/*!40000 ALTER TABLE `especie_ectoparasito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especie_helminto`
--

DROP TABLE IF EXISTS `especie_helminto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `especie_helminto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especie_helminto`
--

LOCK TABLES `especie_helminto` WRITE;
/*!40000 ALTER TABLE `especie_helminto` DISABLE KEYS */;
INSERT INTO `especie_helminto` VALUES (93,'Toxocara cati'),(94,'Toxocara canis'),(95,'Ancylostoma caninum'),(96,'Ancylostoma braziliense'),(97,'Uncinaria stenocephala'),(98,'Dipylidium caninum'),(99,'Trichuris vulpis'),(100,'Cystoisospora caninum'),(101,'Giardia spp.'),(102,'Capillaria spp'),(103,'Spirocerca lupi'),(104,'Physaloptera spp'),(105,'Strongyloides stercoralis'),(106,'Taenia spp - Spirometra mansoni'),(107,'Dioctophyma renale'),(108,'Platynosomum spp'),(109,'Echinostoma spp'),(110,'Eimeria spp');
/*!40000 ALTER TABLE `especie_helminto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especie_ovo_cisto`
--

DROP TABLE IF EXISTS `especie_ovo_cisto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `especie_ovo_cisto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especie_ovo_cisto`
--

LOCK TABLES `especie_ovo_cisto` WRITE;
/*!40000 ALTER TABLE `especie_ovo_cisto` DISABLE KEYS */;
INSERT INTO `especie_ovo_cisto` VALUES (37,'Ancylostoma caninum'),(38,'Ancylostoma braziliense'),(39,'Uncinaria stenocephala'),(40,'Dipylidium caninum'),(41,'Trichuris vulpis'),(42,'Cystoisospora caninum'),(43,'Giardia spp.');
/*!40000 ALTER TABLE `especie_ovo_cisto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gene_alvo`
--

DROP TABLE IF EXISTS `gene_alvo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gene_alvo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gene_alvo`
--

LOCK TABLES `gene_alvo` WRITE;
/*!40000 ALTER TABLE `gene_alvo` DISABLE KEYS */;
INSERT INTO `gene_alvo` VALUES (1,'Gen Al 01');
/*!40000 ALTER TABLE `gene_alvo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genero_ectoparasito`
--

DROP TABLE IF EXISTS `genero_ectoparasito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genero_ectoparasito` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genero_ectoparasito`
--

LOCK TABLES `genero_ectoparasito` WRITE;
/*!40000 ALTER TABLE `genero_ectoparasito` DISABLE KEYS */;
INSERT INTO `genero_ectoparasito` VALUES (48,'Tunga'),(49,'Ctenocephalides'),(50,'Rhipicephalus'),(51,'Ambyomma'),(52,'Trichodectes'),(53,'Linognathus'),(54,'Sarcoptes'),(55,'Demodex'),(56,'Otodectes');
/*!40000 ALTER TABLE `genero_ectoparasito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `analise_ectoparasito_necropsia`
--

DROP TABLE IF EXISTS `analise_ectoparasito_necropsia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `analise_ectoparasito_necropsia` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_necropsia` int NOT NULL,
  `id_genero_ectoparasito` int NOT NULL,
  `id_especie_ectoparasito` int NOT NULL,
  `id_subespecie_ectoparasito` int NOT NULL,
  `quantidade_machos` int NOT NULL,
  `quantidade_femeas` int NOT NULL,
  `quantidade_ninfas` int NOT NULL,
  `quantidade_larvas` int NOT NULL,
  `quantidade_ovos` int NOT NULL,
  `observacao` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `analise_ectoparasito_necropsia_id_necropsia_id_genero_ectopa_key` (`id_necropsia`,`id_genero_ectoparasito`,`id_especie_ectoparasito`,`id_subespecie_ectoparasito`),
  KEY `analise_ectoparasito_necropsia_id_genero_ectoparasito_fkey` (`id_genero_ectoparasito`),
  KEY `analise_ectoparasito_necropsia_id_especie_ectoparasito_fkey` (`id_especie_ectoparasito`),
  KEY `analise_ectoparasito_necropsia_id_subespecie_ectoparasito_fkey` (`id_subespecie_ectoparasito`),
  CONSTRAINT `analise_ectoparasito_necropsia_id_especie_ectoparasito_fkey` FOREIGN KEY (`id_especie_ectoparasito`) REFERENCES `especie_ectoparasito` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `analise_ectoparasito_necropsia_id_genero_ectoparasito_fkey` FOREIGN KEY (`id_genero_ectoparasito`) REFERENCES `genero_ectoparasito` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `analise_ectoparasito_necropsia_id_necropsia_fkey` FOREIGN KEY (`id_necropsia`) REFERENCES `necropsia` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `analise_ectoparasito_necropsia_id_subespecie_ectoparasito_fkey` FOREIGN KEY (`id_subespecie_ectoparasito`) REFERENCES `especie_ectoparasito` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analise_ectoparasito_necropsia`
--

LOCK TABLES `analise_ectoparasito_necropsia` WRITE;
/*!40000 ALTER TABLE `analise_ectoparasito_necropsia` DISABLE KEYS */;
/*!40000 ALTER TABLE `analise_ectoparasito_necropsia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `analise_ectoparasito_veterinario`
--

DROP TABLE IF EXISTS `analise_ectoparasito_veterinario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `analise_ectoparasito_veterinario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_visita_veterinaria` int NOT NULL,
  `id_genero_ectoparasito` int NOT NULL,
  `id_especie_ectoparasito` int NOT NULL,
  `id_subespecie_ectoparasito` int NOT NULL,
  `quantidade_machos` int NOT NULL,
  `quantidade_femeas` int NOT NULL,
  `quantidade_ninfas` int NOT NULL,
  `quantidade_larvas` int NOT NULL,
  `quantidade_ovos` int NOT NULL,
  `observacao` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `analise_ectoparasito_veterinario_id_visita_veterinaria_id_ge_key` (`id_visita_veterinaria`,`id_genero_ectoparasito`,`id_especie_ectoparasito`,`id_subespecie_ectoparasito`),
  KEY `analise_ectoparasito_veterinario_id_genero_ectoparasito_fkey` (`id_genero_ectoparasito`),
  KEY `analise_ectoparasito_veterinario_id_especie_ectoparasito_fkey` (`id_especie_ectoparasito`),
  KEY `analise_ectoparasito_veterinario_id_subespecie_ectoparasito_fkey` (`id_subespecie_ectoparasito`),
  CONSTRAINT `analise_ectoparasito_veterinario_id_especie_ectoparasito_fkey` FOREIGN KEY (`id_especie_ectoparasito`) REFERENCES `especie_ectoparasito` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `analise_ectoparasito_veterinario_id_genero_ectoparasito_fkey` FOREIGN KEY (`id_genero_ectoparasito`) REFERENCES `genero_ectoparasito` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `analise_ectoparasito_veterinario_id_subespecie_ectoparasito_fkey` FOREIGN KEY (`id_subespecie_ectoparasito`) REFERENCES `especie_ectoparasito` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `analise_ectoparasito_veterinario_id_visita_veterinaria_fkey` FOREIGN KEY (`id_visita_veterinaria`) REFERENCES `visita_veterinaria` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analise_ectoparasito_veterinario`
--

LOCK TABLES `analise_ectoparasito_veterinario` WRITE;
/*!40000 ALTER TABLE `analise_ectoparasito_veterinario` DISABLE KEYS */;
/*!40000 ALTER TABLE `analise_ectoparasito_veterinario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tecnologia_processamento`
--

DROP TABLE IF EXISTS `tecnologia_processamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tecnologia_processamento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tecnologia_processamento`
--

LOCK TABLES `tecnologia_processamento` WRITE;
/*!40000 ALTER TABLE `tecnologia_processamento` DISABLE KEYS */;
INSERT INTO `tecnologia_processamento` VALUES (33,'Sedimentação espontânea (Hoffman-Pons-Janer / Lutz)'),(34,'Sedimentação em formol-éter ou formol-acetato de etila (Ritchie modificado)'),(35,'Flutuação em NaCl saturado (Willis-Mollay)'),(36,'Flutuação centrífuga em sulfato de zinco (Faust)'),(37,'Flutuação em sacarose (Sheather)'),(38,'Coloração para Cryptosporidium (Ziehl-Neelsen modificado / Kinyoun)');
/*!40000 ALTER TABLE `tecnologia_processamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teste_sorologico`
--

DROP TABLE IF EXISTS `teste_sorologico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teste_sorologico` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teste_sorologico`
--

LOCK TABLES `teste_sorologico` WRITE;
/*!40000 ALTER TABLE `teste_sorologico` DISABLE KEYS */;
INSERT INTO `teste_sorologico` VALUES (13,'ELISA (ensaio imunoenzimático)'),(14,'IFA/RIFI (reação de imunofluorescência indireta)');
/*!40000 ALTER TABLE `teste_sorologico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_amostra_cpcr`
--

DROP TABLE IF EXISTS `tipo_amostra_cpcr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_amostra_cpcr` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_amostra_cpcr`
--

LOCK TABLES `tipo_amostra_cpcr` WRITE;
/*!40000 ALTER TABLE `tipo_amostra_cpcr` DISABLE KEYS */;
INSERT INTO `tipo_amostra_cpcr` VALUES (37,'Sangue'),(38,'Pulmão'),(39,'Baço'),(40,'Coração'),(41,'Intestino'),(42,'Fígado'),(43,'Cérebro');
/*!40000 ALTER TABLE `tipo_amostra_cpcr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_amostra_qpcr`
--

DROP TABLE IF EXISTS `tipo_amostra_qpcr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_amostra_qpcr` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_amostra_qpcr`
--

LOCK TABLES `tipo_amostra_qpcr` WRITE;
/*!40000 ALTER TABLE `tipo_amostra_qpcr` DISABLE KEYS */;
INSERT INTO `tipo_amostra_qpcr` VALUES (37,'Sangue'),(38,'Pulmão'),(39,'Baço'),(40,'Coração'),(41,'Intestino'),(42,'Fígado'),(43,'Cérebro');
/*!40000 ALTER TABLE `tipo_amostra_qpcr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_extracao`
--

DROP TABLE IF EXISTS `tipo_extracao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_extracao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_extracao`
--

LOCK TABLES `tipo_extracao` WRITE;
/*!40000 ALTER TABLE `tipo_extracao` DISABLE KEYS */;
INSERT INTO `tipo_extracao` VALUES (17,'TRIzol®'),(18,'fenol-clorofórmio'),(19,'DNeasy®');
/*!40000 ALTER TABLE `tipo_extracao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_medida_corporal_necropsia`
--

DROP TABLE IF EXISTS `tipo_medida_corporal_necropsia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_medida_corporal_necropsia` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unidade` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_medida_corporal_necropsia`
--

LOCK TABLES `tipo_medida_corporal_necropsia` WRITE;
/*!40000 ALTER TABLE `tipo_medida_corporal_necropsia` DISABLE KEYS */;
INSERT INTO `tipo_medida_corporal_necropsia` VALUES (32,'Comprimeto do Corpo','cm'),(33,'Comprimento da cauda','cm'),(34,'Altura Escapular','cm'),(35,'Circunferência do pescoço','cm'),(36,'Circunferencia toraxica','cm'),(37,'Comprimento da cabeça','cm');
/*!40000 ALTER TABLE `tipo_medida_corporal_necropsia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_medida_corporal_veterinario`
--

DROP TABLE IF EXISTS `tipo_medida_corporal_veterinario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_medida_corporal_veterinario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unidade` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_medida_corporal_veterinario`
--

LOCK TABLES `tipo_medida_corporal_veterinario` WRITE;
/*!40000 ALTER TABLE `tipo_medida_corporal_veterinario` DISABLE KEYS */;
INSERT INTO `tipo_medida_corporal_veterinario` VALUES (53,'Comprimento total','cm'),(54,'Comprimento cabeça-corpo','cm'),(55,'Comprimento dorsal','cm'),(56,'Comprimento da cauda vertebral','cm'),(57,'Comprimento da cabeça','cm'),(58,'Largura da cabeça','cm'),(59,'Distância entre os olhos','cm'),(60,'Circunferência do pescoço','cm'),(61,'Circunferência torácica','cm'),(62,'Altura na cernelha (ombro frontal)','cm');
/*!40000 ALTER TABLE `tipo_medida_corporal_veterinario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `analise_fezes`
--

DROP TABLE IF EXISTS `analise_fezes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `analise_fezes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_visita_veterinaria` int NOT NULL,
  `peso` double NOT NULL,
  `id_tecnologia_processamento` int NOT NULL,
  `observacao` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `analise_fezes_id_tecnologia_processamento_fkey` (`id_tecnologia_processamento`),
  KEY `analise_fezes_id_visita_veterinaria_idx` (`id_visita_veterinaria`),
  CONSTRAINT `analise_fezes_id_tecnologia_processamento_fkey` FOREIGN KEY (`id_tecnologia_processamento`) REFERENCES `tecnologia_processamento` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `analise_fezes_id_visita_veterinaria_fkey` FOREIGN KEY (`id_visita_veterinaria`) REFERENCES `visita_veterinaria` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analise_fezes`
--

LOCK TABLES `analise_fezes` WRITE;
/*!40000 ALTER TABLE `analise_fezes` DISABLE KEYS */;
/*!40000 ALTER TABLE `analise_fezes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localizacao_helminto`
--

DROP TABLE IF EXISTS `localizacao_helminto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `localizacao_helminto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `localizacao_helminto_nome_key` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localizacao_helminto`
--

LOCK TABLES `localizacao_helminto` WRITE;
/*!40000 ALTER TABLE `localizacao_helminto` DISABLE KEYS */;
INSERT INTO `localizacao_helminto` VALUES (34,'Cavidade Toraxica'),(35,'Estomago'),(36,'Intestino'),(37,'Intestino delgado'),(33,'Pulmão'),(32,'Traqueia');
/*!40000 ALTER TABLE `localizacao_helminto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `analise_helminto`
--

DROP TABLE IF EXISTS `analise_helminto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `analise_helminto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_necropsia` int NOT NULL,
  `id_especie_helminto` int NOT NULL,
  `quantidade_machos` int NOT NULL,
  `quantidade_femeas` int NOT NULL,
  `quantidade_total` int NOT NULL,
  `observacao` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_localizacao` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `analise_helminto_id_necropsia_id_especie_helminto_id_localiz_key` (`id_necropsia`,`id_especie_helminto`,`id_localizacao`),
  KEY `analise_helminto_id_especie_helminto_fkey` (`id_especie_helminto`),
  KEY `analise_helminto_id_localizacao_fkey` (`id_localizacao`),
  CONSTRAINT `analise_helminto_id_especie_helminto_fkey` FOREIGN KEY (`id_especie_helminto`) REFERENCES `especie_helminto` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `analise_helminto_id_localizacao_fkey` FOREIGN KEY (`id_localizacao`) REFERENCES `localizacao_helminto` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `analise_helminto_id_necropsia_fkey` FOREIGN KEY (`id_necropsia`) REFERENCES `necropsia` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analise_helminto`
--

LOCK TABLES `analise_helminto` WRITE;
/*!40000 ALTER TABLE `analise_helminto` DISABLE KEYS */;
/*!40000 ALTER TABLE `analise_helminto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `analise_molecular`
--

DROP TABLE IF EXISTS `analise_molecular`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `analise_molecular` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_analise_fezes` int NOT NULL,
  `id_especie_ovo_cisto` int NOT NULL,
  `observacao` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `analise_molecular_id_analise_fezes_id_especie_ovo_cisto_key` (`id_analise_fezes`,`id_especie_ovo_cisto`),
  KEY `analise_molecular_id_especie_ovo_cisto_fkey` (`id_especie_ovo_cisto`),
  CONSTRAINT `analise_molecular_id_analise_fezes_fkey` FOREIGN KEY (`id_analise_fezes`) REFERENCES `analise_fezes` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `analise_molecular_id_especie_ovo_cisto_fkey` FOREIGN KEY (`id_especie_ovo_cisto`) REFERENCES `especie_ovo_cisto` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analise_molecular`
--

LOCK TABLES `analise_molecular` WRITE;
/*!40000 ALTER TABLE `analise_molecular` DISABLE KEYS */;
/*!40000 ALTER TABLE `analise_molecular` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `analise_ovo_cisto`
--

DROP TABLE IF EXISTS `analise_ovo_cisto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `analise_ovo_cisto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_analise_fezes` int NOT NULL,
  `id_especie_ovo_cisto` int NOT NULL,
  `quantidade` int NOT NULL,
  `observacao` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `analise_ovo_cisto_id_analise_fezes_id_especie_ovo_cisto_key` (`id_analise_fezes`,`id_especie_ovo_cisto`),
  KEY `analise_ovo_cisto_id_especie_ovo_cisto_fkey` (`id_especie_ovo_cisto`),
  CONSTRAINT `analise_ovo_cisto_id_analise_fezes_fkey` FOREIGN KEY (`id_analise_fezes`) REFERENCES `analise_fezes` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `analise_ovo_cisto_id_especie_ovo_cisto_fkey` FOREIGN KEY (`id_especie_ovo_cisto`) REFERENCES `especie_ovo_cisto` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analise_ovo_cisto`
--

LOCK TABLES `analise_ovo_cisto` WRITE;
/*!40000 ALTER TABLE `analise_ovo_cisto` DISABLE KEYS */;
/*!40000 ALTER TABLE `analise_ovo_cisto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `analise_sorologica`
--

DROP TABLE IF EXISTS `analise_sorologica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `analise_sorologica` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_visita_veterinaria` int NOT NULL,
  `id_teste_sorologico` int NOT NULL,
  `id_agente_sorologico` int NOT NULL,
  `resultado` double NOT NULL,
  `id_interpretacao` int NOT NULL,
  `id_tipo_resultado` int NOT NULL,
  `simbolo_ponto_corte` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor_ponto_corte` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `analise_sorologica_id_visita_veterinaria_key` (`id_visita_veterinaria`),
  KEY `analise_sorologica_id_teste_sorologico_fkey` (`id_teste_sorologico`),
  KEY `analise_sorologica_id_agente_sorologico_fkey` (`id_agente_sorologico`),
  KEY `analise_sorologica_id_interpretacao_fkey` (`id_interpretacao`),
  KEY `analise_sorologica_id_tipo_resultado_fkey` (`id_tipo_resultado`),
  CONSTRAINT `analise_sorologica_id_agente_sorologico_fkey` FOREIGN KEY (`id_agente_sorologico`) REFERENCES `agente_sorologico` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `analise_sorologica_id_interpretacao_fkey` FOREIGN KEY (`id_interpretacao`) REFERENCES `enum_interpretacao_analise_sorologica` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `analise_sorologica_id_teste_sorologico_fkey` FOREIGN KEY (`id_teste_sorologico`) REFERENCES `teste_sorologico` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `analise_sorologica_id_tipo_resultado_fkey` FOREIGN KEY (`id_tipo_resultado`) REFERENCES `enum_tipo_resultado_analise_sorologica` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `analise_sorologica_id_visita_veterinaria_fkey` FOREIGN KEY (`id_visita_veterinaria`) REFERENCES `visita_veterinaria` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analise_sorologica`
--

LOCK TABLES `analise_sorologica` WRITE;
/*!40000 ALTER TABLE `analise_sorologica` DISABLE KEYS */;
/*!40000 ALTER TABLE `analise_sorologica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vacina`
--

DROP TABLE IF EXISTS `vacina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vacina` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vacina`
--

LOCK TABLES `vacina` WRITE;
/*!40000 ALTER TABLE `vacina` DISABLE KEYS */;
INSERT INTO `vacina` VALUES (18,'V8'),(19,'Raiva');
/*!40000 ALTER TABLE `vacina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aplicacao_vacina`
--

DROP TABLE IF EXISTS `aplicacao_vacina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aplicacao_vacina` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_animal_vivo` int NOT NULL,
  `id_vacina` int NOT NULL,
  `id_visita_veterinaria` int DEFAULT NULL,
  `data` datetime NOT NULL,
  `id_tipo_vacina` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `aplicacao_vacina_id_animal_vivo_fkey` (`id_animal_vivo`),
  KEY `aplicacao_vacina_id_vacina_fkey` (`id_vacina`),
  KEY `aplicacao_vacina_id_visita_veterinaria_fkey` (`id_visita_veterinaria`),
  KEY `aplicacao_vacina_id_tipo_vacina_fkey` (`id_tipo_vacina`),
  CONSTRAINT `aplicacao_vacina_id_animal_vivo_fkey` FOREIGN KEY (`id_animal_vivo`) REFERENCES `animal_vivo` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `aplicacao_vacina_id_tipo_vacina_fkey` FOREIGN KEY (`id_tipo_vacina`) REFERENCES `enum_tipo_vacina` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `aplicacao_vacina_id_vacina_fkey` FOREIGN KEY (`id_vacina`) REFERENCES `vacina` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `aplicacao_vacina_id_visita_veterinaria_fkey` FOREIGN KEY (`id_visita_veterinaria`) REFERENCES `visita_veterinaria` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aplicacao_vacina`
--

LOCK TABLES `aplicacao_vacina` WRITE;
/*!40000 ALTER TABLE `aplicacao_vacina` DISABLE KEYS */;
/*!40000 ALTER TABLE `aplicacao_vacina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icone_categoria` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categoria_nome_key` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES ('0_animaisvivos','Animais Vivos','https://www.svgrepo.com/show/295893/pet-house-kennel.svg'),('1_animaismortos','Animais Mortos','https://www.svgrepo.com/show/493629/warning-triangle.svg'),('2_cadastrosbasicos','Cadastros Básicos','https://www.svgrepo.com/show/145158/form.svg');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_categoria`
--

DROP TABLE IF EXISTS `sub_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_categoria` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_categoria` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sub_categoria_nome_key` (`nome`),
  KEY `sub_categoria_id_categoria_fkey` (`id_categoria`),
  CONSTRAINT `sub_categoria_id_categoria_fkey` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_categoria`
--

LOCK TABLES `sub_categoria` WRITE;
/*!40000 ALTER TABLE `sub_categoria` DISABLE KEYS */;
INSERT INTO `sub_categoria` VALUES ('animais','0_Animais','0_animaisvivos'),('animaisatropelados','0_Animais Atropelados','1_animaismortos'),('entrevistas','1_Entrevistas','0_animaisvivos'),('exameseanalises','4_Exames e Análises','0_animaisvivos'),('geral','0_Geral','2_cadastrosbasicos'),('necropsias','1_Necrópsias','1_animaismortos'),('rastreiodegps','2_Rastreio de GPS','0_animaisvivos'),('resultadoseanalises','2_Resultados e Análises','1_animaismortos'),('veterinario','3_Veterinário','0_animaisvivos');
/*!40000 ALTER TABLE `sub_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formulario`
--

DROP TABLE IF EXISTS `formulario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formulario` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_sub_categoria` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `formulario_id_sub_categoria_fkey` (`id_sub_categoria`),
  CONSTRAINT `formulario_id_sub_categoria_fkey` FOREIGN KEY (`id_sub_categoria`) REFERENCES `sub_categoria` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formulario`
--

LOCK TABLES `formulario` WRITE;
/*!40000 ALTER TABLE `formulario` DISABLE KEYS */;
INSERT INTO `formulario` VALUES ('amostras-am','Amostra','necropsias'),('amostras-av','Amostra','veterinario'),('analiseectoparasitos-am','Análise de Ectoparasitos','resultadoseanalises'),('analiseectoparasitos-av','Ectoparasitos','exameseanalises'),('analisefezes','Fezes','exameseanalises'),('analisehelmintos','Análise de Helmintos','resultadoseanalises'),('analisemolecular','Molecular','exameseanalises'),('analiseovocistos','Ovos/Cistos','exameseanalises'),('animal-am','Animal','animaisatropelados'),('animal-av','Animal','animais'),('cadastrobasico-am','Animais Mortos','geral'),('cadastrobasico-av','Animais Vivos','geral'),('castracao','Castração','animais'),('entrevista','Entrevista','entrevistas'),('examefisico','Exame Físico','veterinario'),('necropsia','Necrópsia','necropsias'),('rastreiogps','Rastreio de GPS','rastreiodegps'),('resultadoexame-am','QPCR e CPCR','resultadoseanalises'),('resultadoexame-av','Hemograma/Bioquímico','exameseanalises'),('resultadosorologico','Sorologia','exameseanalises'),('tutor','Tutor','entrevistas'),('vacina','Vacina','veterinario'),('visitaveterinaria','Visita Veterinária','veterinario');
/*!40000 ALTER TABLE `formulario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcao`
--

DROP TABLE IF EXISTS `funcao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcao` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcao`
--

LOCK TABLES `funcao` WRITE;
/*!40000 ALTER TABLE `funcao` DISABLE KEYS */;
INSERT INTO `funcao` VALUES ('0','owner'),('1','admin'),('2','common');
/*!40000 ALTER TABLE `funcao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo`
--

DROP TABLE IF EXISTS `grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grupo` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `grupo_nome_key` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo`
--

LOCK TABLES `grupo` WRITE;
/*!40000 ALTER TABLE `grupo` DISABLE KEYS */;
INSERT INTO `grupo` VALUES ('entr','Entrevistador'),('leg','Legista'),('pesqecto','Pesquisador de Ectoparasitos'),('pesqfez','Pesquisador de Fezes'),('pesqhelm','Pesquisador de Helmintos'),('pesqsor','Pesquisador de Sorológico'),('vet','Veterinário');
/*!40000 ALTER TABLE `grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `senha` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_funcao` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2',
  `userPic` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario_email_key` (`email`),
  KEY `usuario_id_funcao_fkey` (`id_funcao`),
  CONSTRAINT `usuario_id_funcao_fkey` FOREIGN KEY (`id_funcao`) REFERENCES `funcao` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES ('09af1365-644c-4dd7-8a4b-f00b57024c95','Usuário Super Admin Exemplo','superadmin@exemplo.com','$2b$10$.OBvQt/OnVzFkMrrZ37/BeCrIiqsn93Ww04pxiwZKfCVyE4dHI/o2','0',NULL),('5d98ce9c-07fa-4046-b40e-54ff4c733590','Usuário Comum Exemplo','comum@exemplo.com','$2b$10$22PRwChwS218eAJNzkfrWOkwzqwSa3fantASuJoBCkKD7wzN/jqtq','2',NULL),('84ca85ea-1347-4b64-9525-b59a12aaee56','Usuário Admin Exemplo','admin@exemplo.com','$2b$10$wBU39Gj69jp2Jktjr6o2iuXzcNCn9EDdpkcQKq8Nms2UaMlUlXUpy','1',NULL);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditlog`
--

DROP TABLE IF EXISTS `auditlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditlog` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_usuario` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `acao` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_formulario` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `auditlog_id_usuario_fkey` (`id_usuario`),
  KEY `auditlog_id_formulario_fkey` (`id_formulario`),
  CONSTRAINT `auditlog_id_formulario_fkey` FOREIGN KEY (`id_formulario`) REFERENCES `formulario` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `auditlog_id_usuario_fkey` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditlog`
--

--
-- Table structure for table `autorizacao_grupo`
--

DROP TABLE IF EXISTS `autorizacao_grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autorizacao_grupo` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_grupo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_formulario` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_nivel_acesso` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `autorizacao_grupo_id_grupo_fkey` (`id_grupo`),
  KEY `autorizacao_grupo_id_formulario_fkey` (`id_formulario`),
  KEY `autorizacao_grupo_id_nivel_acesso_fkey` (`id_nivel_acesso`),
  CONSTRAINT `autorizacao_grupo_id_formulario_fkey` FOREIGN KEY (`id_formulario`) REFERENCES `formulario` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `autorizacao_grupo_id_grupo_fkey` FOREIGN KEY (`id_grupo`) REFERENCES `grupo` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `autorizacao_grupo_id_nivel_acesso_fkey` FOREIGN KEY (`id_nivel_acesso`) REFERENCES `enum_nivel_acesso` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autorizacao_grupo`
--

LOCK TABLES `autorizacao_grupo` WRITE;
/*!40000 ALTER TABLE `autorizacao_grupo` DISABLE KEYS */;
INSERT INTO `autorizacao_grupo` VALUES ('001','entr','analiseectoparasitos-am','read'),('002','entr','analiseectoparasitos-av','read'),('003','entr','analisefezes','read'),('004','entr','analisehelmintos','read'),('005','entr','analisemolecular','read'),('006','entr','analiseovocistos','read'),('007','entr','animal-am','read'),('008','entr','animal-av','edit'),('009','entr','entrevista','edit'),('010','entr','cadastrobasico-av','edit'),('011','entr','necropsia','read'),('012','entr','rastreiogps','edit'),('013','entr','resultadoexame-am','read'),('014','entr','resultadoexame-av','read'),('015','entr','resultadosorologico','read'),('016','entr','tutor','edit'),('017','entr','vacina','read'),('018','entr','visitaveterinaria','read'),('019','entr','amostras-av','read'),('020','entr','amostras-am','read'),('021','entr','examefisico','read'),('101','leg','analiseectoparasitos-am','read'),('102','leg','analiseectoparasitos-av','read'),('103','leg','analisefezes','read'),('104','leg','analisehelmintos','edit'),('105','leg','analisemolecular','read'),('106','leg','analiseovocistos','read'),('107','leg','animal-am','edit'),('108','leg','animal-av','read'),('109','leg','entrevista','read'),('110','leg','cadastrobasico-av','edit'),('111','leg','necropsia','edit'),('112','leg','rastreiogps','read'),('113','leg','resultadoexame-am','read'),('114','leg','resultadoexame-av','read'),('115','leg','resultadosorologico','read'),('116','leg','tutor','read'),('117','leg','vacina','read'),('118','leg','visitaveterinaria','read'),('119','leg','amostras-av','read'),('120','leg','amostras-am','read'),('121','leg','examefisico','read'),('201','pesqecto','analiseectoparasitos-am','edit'),('202','pesqecto','analiseectoparasitos-av','edit'),('203','pesqecto','analisefezes','read'),('204','pesqecto','analisehelmintos','read'),('205','pesqecto','analisemolecular','read'),('206','pesqecto','analiseovocistos','read'),('207','pesqecto','animal-am','read'),('208','pesqecto','animal-av','read'),('209','pesqecto','entrevista','read'),('210','pesqecto','cadastrobasico-av','read'),('211','pesqecto','necropsia','read'),('212','pesqecto','rastreiogps','read'),('213','pesqecto','resultadoexame-am','read'),('214','pesqecto','resultadoexame-av','read'),('215','pesqecto','resultadosorologico','read'),('216','pesqecto','tutor','read'),('217','pesqecto','vacina','read'),('218','pesqecto','visitaveterinaria','read'),('219','pesqecto','amostras-av','read'),('220','pesqecto','amostras-am','read'),('221','pesqecto','examefisico','read'),('301','pesqfez','analiseectoparasitos-am','read'),('302','pesqfez','analiseectoparasitos-av','read'),('303','pesqfez','analisefezes','edit'),('304','pesqfez','analisehelmintos','read'),('305','pesqfez','analisemolecular','edit'),('306','pesqfez','analiseovocistos','edit'),('307','pesqfez','animal-am','read'),('308','pesqfez','animal-av','read'),('309','pesqfez','entrevista','read'),('310','pesqfez','cadastrobasico-av','read'),('311','pesqfez','necropsia','read'),('312','pesqfez','rastreiogps','read'),('313','pesqfez','resultadoexame-am','read'),('314','pesqfez','resultadoexame-av','read'),('315','pesqfez','resultadosorologico','read'),('316','pesqfez','tutor','read'),('317','pesqfez','vacina','read'),('318','pesqfez','visitaveterinaria','read'),('319','pesqfez','amostras-av','read'),('320','pesqfez','amostras-am','read'),('321','pesqfez','examefisico','read'),('401','pesqhelm','analiseectoparasitos-am','read'),('402','pesqhelm','analiseectoparasitos-av','read'),('403','pesqhelm','analisefezes','edit'),('404','pesqhelm','analisehelmintos','edit'),('405','pesqhelm','analisemolecular','read'),('406','pesqhelm','analiseovocistos','edit'),('407','pesqhelm','animal-am','read'),('408','pesqhelm','animal-av','read'),('409','pesqhelm','entrevista','read'),('410','pesqhelm','cadastrobasico-av','read'),('411','pesqhelm','necropsia','read'),('412','pesqhelm','rastreiogps','read'),('413','pesqhelm','resultadoexame-am','read'),('414','pesqhelm','resultadoexame-av','read'),('415','pesqhelm','resultadosorologico','read'),('416','pesqhelm','tutor','read'),('417','pesqhelm','vacina','read'),('418','pesqhelm','visitaveterinaria','read'),('419','pesqhelm','amostras-av','read'),('420','pesqhelm','amostras-am','read'),('421','pesqhelm','examefisico','read'),('501','pesqsor','analiseectoparasitos-am','read'),('502','pesqsor','analiseectoparasitos-av','read'),('503','pesqsor','analisefezes','read'),('504','pesqsor','analisehelmintos','read'),('505','pesqsor','analisemolecular','read'),('506','pesqsor','analiseovocistos','read'),('507','pesqsor','animal-am','read'),('508','pesqsor','animal-av','read'),('509','pesqsor','entrevista','read'),('510','pesqsor','cadastrobasico-av','read'),('511','pesqsor','necropsia','read'),('512','pesqsor','rastreiogps','read'),('513','pesqsor','resultadoexame-am','edit'),('514','pesqsor','resultadoexame-av','edit'),('515','pesqsor','resultadosorologico','edit'),('516','pesqsor','tutor','read'),('517','pesqsor','vacina','read'),('518','pesqsor','visitaveterinaria','read'),('519','pesqsor','amostras-av','read'),('520','pesqsor','amostras-am','read'),('521','pesqsor','examefisico','read'),('601','vet','analiseectoparasitos-am','read'),('602','vet','analiseectoparasitos-av','read'),('603','vet','analisefezes','edit'),('604','vet','analisehelmintos','read'),('605','vet','analisemolecular','edit'),('606','vet','analiseovocistos','edit'),('607','vet','animal-am','read'),('608','vet','animal-av','edit'),('609','vet','entrevista','read'),('610','vet','cadastrobasico-av','edit'),('611','vet','necropsia','read'),('612','vet','rastreiogps','read'),('613','vet','resultadoexame-am','read'),('614','vet','resultadoexame-av','read'),('615','vet','resultadosorologico','read'),('616','vet','tutor','edit'),('617','vet','vacina','edit'),('618','vet','visitaveterinaria','edit'),('619','vet','amostras-av','edit'),('620','vet','amostras-am','read'),('621','vet','examefisico','edit');
/*!40000 ALTER TABLE `autorizacao_grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autorizacao_usuario`
--

DROP TABLE IF EXISTS `autorizacao_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autorizacao_usuario` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_usuario` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_formulario` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_nivel_acesso` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `autorizacao_usuario_id_usuario_fkey` (`id_usuario`),
  KEY `autorizacao_usuario_id_formulario_fkey` (`id_formulario`),
  KEY `autorizacao_usuario_id_nivel_acesso_fkey` (`id_nivel_acesso`),
  CONSTRAINT `autorizacao_usuario_id_formulario_fkey` FOREIGN KEY (`id_formulario`) REFERENCES `formulario` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `autorizacao_usuario_id_nivel_acesso_fkey` FOREIGN KEY (`id_nivel_acesso`) REFERENCES `enum_nivel_acesso` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `autorizacao_usuario_id_usuario_fkey` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autorizacao_usuario`
--

LOCK TABLES `autorizacao_usuario` WRITE;
/*!40000 ALTER TABLE `autorizacao_usuario` DISABLE KEYS */;
INSERT INTO `autorizacao_usuario` VALUES ('3083c04b-e5e2-4344-ab18-292699ead1dc','5d98ce9c-07fa-4046-b40e-54ff4c733590','cadastrobasico-av','read'),('6dadaf6b-c1e6-453e-96da-22de05145ba5','5d98ce9c-07fa-4046-b40e-54ff4c733590','visitaveterinaria','edit'),('ce7c791f-95cb-4a9f-bf16-62aeb82c5061','5d98ce9c-07fa-4046-b40e-54ff4c733590','amostras-av','read'),('d62682df-8be2-497e-b979-e4565a7ef0d6','5d98ce9c-07fa-4046-b40e-54ff4c733590','cadastrobasico-am','read'),('e76db212-b097-453f-912f-34b558d74eca','5d98ce9c-07fa-4046-b40e-54ff4c733590','examefisico','read');
/*!40000 ALTER TABLE `autorizacao_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `castracao`
--

DROP TABLE IF EXISTS `castracao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `castracao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_animal_vivo` int NOT NULL,
  `id_visita_veterinaria` int DEFAULT NULL,
  `data` datetime NOT NULL,
  `observacao` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `castracao_id_animal_vivo_key` (`id_animal_vivo`),
  UNIQUE KEY `castracao_id_visita_veterinaria_key` (`id_visita_veterinaria`),
  CONSTRAINT `castracao_id_animal_vivo_fkey` FOREIGN KEY (`id_animal_vivo`) REFERENCES `animal_vivo` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `castracao_id_visita_veterinaria_fkey` FOREIGN KEY (`id_visita_veterinaria`) REFERENCES `visita_veterinaria` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `castracao`
--

LOCK TABLES `castracao` WRITE;
/*!40000 ALTER TABLE `castracao` DISABLE KEYS */;
/*!40000 ALTER TABLE `castracao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changelog`
--

DROP TABLE IF EXISTS `changelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `changelog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_auditlog` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tabela` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_registro` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_acao` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dados_antigos` json DEFAULT NULL,
  `dados_novos` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `changelog_id_auditlog_fkey` (`id_auditlog`),
  CONSTRAINT `changelog_id_auditlog_fkey` FOREIGN KEY (`id_auditlog`) REFERENCES `auditlog` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=540 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changelog`
--

--
-- Table structure for table `destino_amostra`
--

DROP TABLE IF EXISTS `destino_amostra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `destino_amostra` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `destino_amostra`
--

LOCK TABLES `destino_amostra` WRITE;
/*!40000 ALTER TABLE `destino_amostra` DISABLE KEYS */;
INSERT INTO `destino_amostra` VALUES (2,'Leishmania'),(4,'Reserva'),(3,'Rosangela'),(1,'Teste sorológico'),(5,'Teste sorológico + Reserva');
/*!40000 ALTER TABLE `destino_amostra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dispositivo_rastreio`
--

DROP TABLE IF EXISTS `dispositivo_rastreio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dispositivo_rastreio` (
  `id` int NOT NULL AUTO_INCREMENT,
  `marca` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_serie` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dispositivo_rastreio`
--

LOCK TABLES `dispositivo_rastreio` WRITE;
/*!40000 ALTER TABLE `dispositivo_rastreio` DISABLE KEYS */;
INSERT INTO `dispositivo_rastreio` VALUES (17,'I-got',''),(18,'Columbus',''),(19,'Novo 1','');
/*!40000 ALTER TABLE `dispositivo_rastreio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrevista_tutor`
--

DROP TABLE IF EXISTS `entrevista_tutor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrevista_tutor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_tutor` int NOT NULL,
  `data` datetime NOT NULL,
  `observacao` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entrevista_tutor_id_tutor_key` (`id_tutor`),
  CONSTRAINT `entrevista_tutor_id_tutor_fkey` FOREIGN KEY (`id_tutor`) REFERENCES `tutor` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrevista_tutor`
--

LOCK TABLES `entrevista_tutor` WRITE;
/*!40000 ALTER TABLE `entrevista_tutor` DISABLE KEYS */;
/*!40000 ALTER TABLE `entrevista_tutor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrevista_animal`
--

DROP TABLE IF EXISTS `entrevista_animal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrevista_animal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_animal_vivo` int NOT NULL,
  `id_entrevista_tutor` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entrevista_animal_id_entrevista_tutor_fkey` (`id_entrevista_tutor`),
  KEY `entrevista_animal_id_animal_vivo_fkey` (`id_animal_vivo`),
  CONSTRAINT `entrevista_animal_id_animal_vivo_fkey` FOREIGN KEY (`id_animal_vivo`) REFERENCES `animal_vivo` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `entrevista_animal_id_entrevista_tutor_fkey` FOREIGN KEY (`id_entrevista_tutor`) REFERENCES `entrevista_tutor` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrevista_animal`
--

LOCK TABLES `entrevista_animal` WRITE;
/*!40000 ALTER TABLE `entrevista_animal` DISABLE KEYS */;
/*!40000 ALTER TABLE `entrevista_animal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enum_estado_geral_exame_fisico`
--

DROP TABLE IF EXISTS `enum_estado_geral_exame_fisico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enum_estado_geral_exame_fisico` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enum_estado_geral_exame_fisico`
--

LOCK TABLES `enum_estado_geral_exame_fisico` WRITE;
/*!40000 ALTER TABLE `enum_estado_geral_exame_fisico` DISABLE KEYS */;
INSERT INTO `enum_estado_geral_exame_fisico` VALUES (22,'Bom'),(23,'Regular'),(24,'Ruim');
/*!40000 ALTER TABLE `enum_estado_geral_exame_fisico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `envio_amostra_necropsia`
--

DROP TABLE IF EXISTS `envio_amostra_necropsia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `envio_amostra_necropsia` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_alocacao_amostra_necropsia` int NOT NULL,
  `id_armazenamento` int NOT NULL,
  `id_status` int NOT NULL,
  `quantidade` int NOT NULL,
  `data_envio` datetime NOT NULL,
  `observacao` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `envio_amostra_necropsia_id_alocacao_amostra_necropsia_id_arm_key` (`id_alocacao_amostra_necropsia`,`id_armazenamento`),
  KEY `envio_amostra_necropsia_id_armazenamento_fkey` (`id_armazenamento`),
  KEY `envio_amostra_necropsia_id_status_fkey` (`id_status`),
  CONSTRAINT `envio_amostra_necropsia_id_alocacao_amostra_necropsia_fkey` FOREIGN KEY (`id_alocacao_amostra_necropsia`) REFERENCES `alocacao_amostra_necropsia` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `envio_amostra_necropsia_id_armazenamento_fkey` FOREIGN KEY (`id_armazenamento`) REFERENCES `armazem` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `envio_amostra_necropsia_id_status_fkey` FOREIGN KEY (`id_status`) REFERENCES `enum_status_alocacao_amostra_necropsia` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `envio_amostra_necropsia`
--

LOCK TABLES `envio_amostra_necropsia` WRITE;
/*!40000 ALTER TABLE `envio_amostra_necropsia` DISABLE KEYS */;
/*!40000 ALTER TABLE `envio_amostra_necropsia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `envio_amostra_veterinario`
--

DROP TABLE IF EXISTS `envio_amostra_veterinario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `envio_amostra_veterinario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_alocacao_amostra_veterinario` int NOT NULL,
  `id_status` int NOT NULL,
  `quantidade` int NOT NULL,
  `data_envio` datetime NOT NULL,
  `observacao` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_destino_amostra` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `envio_amostra_veterinario_id_alocacao_amostra_veterinario_id_key` (`id_alocacao_amostra_veterinario`),
  KEY `envio_amostra_veterinario_id_status_fkey` (`id_status`),
  KEY `envio_amostra_veterinario_id_destino_fkey` (`id_destino_amostra`),
  CONSTRAINT `envio_amostra_veterinario_id_alocacao_amostra_veterinario_fkey` FOREIGN KEY (`id_alocacao_amostra_veterinario`) REFERENCES `alocacao_amostra_veterinario` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `envio_amostra_veterinario_id_destino_fkey` FOREIGN KEY (`id_destino_amostra`) REFERENCES `destino_amostra` (`id`),
  CONSTRAINT `envio_amostra_veterinario_id_status_fkey` FOREIGN KEY (`id_status`) REFERENCES `enum_status_alocacao_amostra_veterinario` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `envio_amostra_veterinario`
--

LOCK TABLES `envio_amostra_veterinario` WRITE;
/*!40000 ALTER TABLE `envio_amostra_veterinario` DISABLE KEYS */;
/*!40000 ALTER TABLE `envio_amostra_veterinario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exame_fisico`
--

DROP TABLE IF EXISTS `exame_fisico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exame_fisico` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_visita_veterinaria` int NOT NULL,
  `id_estado_geral` int NOT NULL,
  `FR` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FC` int NOT NULL,
  `temp_retal` double NOT NULL,
  `id_mucosa` int NOT NULL,
  `TPC` int NOT NULL,
  `id_hidratacao` int NOT NULL,
  `peso` double NOT NULL,
  `score` int NOT NULL,
  `observacao_coleta_sangue` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `observacao_exame_fisico` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `observacao_geral` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `exame_fisico_id_visita_veterinaria_key` (`id_visita_veterinaria`),
  KEY `exame_fisico_id_estado_geral_fkey` (`id_estado_geral`),
  KEY `exame_fisico_id_mucosa_fkey` (`id_mucosa`),
  KEY `exame_fisico_id_hidratacao_fkey` (`id_hidratacao`),
  CONSTRAINT `exame_fisico_id_estado_geral_fkey` FOREIGN KEY (`id_estado_geral`) REFERENCES `enum_estado_geral_exame_fisico` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `exame_fisico_id_hidratacao_fkey` FOREIGN KEY (`id_hidratacao`) REFERENCES `enum_hidratacao` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `exame_fisico_id_mucosa_fkey` FOREIGN KEY (`id_mucosa`) REFERENCES `enum_mucosa` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `exame_fisico_id_visita_veterinaria_fkey` FOREIGN KEY (`id_visita_veterinaria`) REFERENCES `visita_veterinaria` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exame_fisico`
--

LOCK TABLES `exame_fisico` WRITE;
/*!40000 ALTER TABLE `exame_fisico` DISABLE KEYS */;
/*!40000 ALTER TABLE `exame_fisico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medida_corporal_necropsia`
--

DROP TABLE IF EXISTS `medida_corporal_necropsia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medida_corporal_necropsia` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_necropsia` int NOT NULL,
  `id_tipo_medida_corporal` int NOT NULL,
  `valor` double NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `medida_corporal_necropsia_id_necropsia_id_tipo_medida_corpor_key` (`id_necropsia`,`id_tipo_medida_corporal`),
  KEY `medida_corporal_necropsia_id_tipo_medida_corporal_fkey` (`id_tipo_medida_corporal`),
  CONSTRAINT `medida_corporal_necropsia_id_necropsia_fkey` FOREIGN KEY (`id_necropsia`) REFERENCES `necropsia` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `medida_corporal_necropsia_id_tipo_medida_corporal_fkey` FOREIGN KEY (`id_tipo_medida_corporal`) REFERENCES `tipo_medida_corporal_necropsia` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medida_corporal_necropsia`
--

LOCK TABLES `medida_corporal_necropsia` WRITE;
/*!40000 ALTER TABLE `medida_corporal_necropsia` DISABLE KEYS */;
/*!40000 ALTER TABLE `medida_corporal_necropsia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medida_corporal_veterinario`
--

DROP TABLE IF EXISTS `medida_corporal_veterinario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medida_corporal_veterinario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_visita_veterinaria` int NOT NULL,
  `id_tipo_medida_corporal` int NOT NULL,
  `valor` double NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `medida_corporal_veterinario_id_visita_veterinaria_id_tipo_me_key` (`id_visita_veterinaria`,`id_tipo_medida_corporal`),
  KEY `medida_corporal_veterinario_id_tipo_medida_corporal_fkey` (`id_tipo_medida_corporal`),
  CONSTRAINT `medida_corporal_veterinario_id_tipo_medida_corporal_fkey` FOREIGN KEY (`id_tipo_medida_corporal`) REFERENCES `tipo_medida_corporal_veterinario` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `medida_corporal_veterinario_id_visita_veterinaria_fkey` FOREIGN KEY (`id_visita_veterinaria`) REFERENCES `visita_veterinaria` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medida_corporal_veterinario`
--

LOCK TABLES `medida_corporal_veterinario` WRITE;
/*!40000 ALTER TABLE `medida_corporal_veterinario` DISABLE KEYS */;
/*!40000 ALTER TABLE `medida_corporal_veterinario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metodo_monitoramento`
--

DROP TABLE IF EXISTS `metodo_monitoramento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metodo_monitoramento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodo_monitoramento`
--

LOCK TABLES `metodo_monitoramento` WRITE;
/*!40000 ALTER TABLE `metodo_monitoramento` DISABLE KEYS */;
INSERT INTO `metodo_monitoramento` VALUES (27,'Minimum Convex Polygon (MCP)'),(28,'Kernel Density Estimation (KDE)'),(29,'Autocorrelated Kernel Density Estimation (AKDE)'),(30,'Brownian Bridge Movement Model (BBMM)'),(31,'Dynamic Brownian Bridge Movement Model (dBBMM)');
/*!40000 ALTER TABLE `metodo_monitoramento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pergunta_animal`
--

DROP TABLE IF EXISTS `pergunta_animal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pergunta_animal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pergunta` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pergunta_animal_pergunta_key` (`pergunta`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pergunta_animal`
--

LOCK TABLES `pergunta_animal` WRITE;
/*!40000 ALTER TABLE `pergunta_animal` DISABLE KEYS */;
INSERT INTO `pergunta_animal` VALUES (67,'17) Cachorro/cadela - Sexo:'),(68,'17a) Caso seja fêmea, já teve alguma cria?'),(69,'17b) Se sim, quantas crias?'),(70,'17c) Ela deu cria no último ano?'),(71,'17d) Se sim, quantos filhotes?'),(72,'17e) Se sim, o que fizeram com os filhotes?'),(73,'18) Raça(s):'),(74,'19) Idade(s):'),(75,'20) Origem(ns):'),(76,'22) O seu cão te acompanha ou tenta te acompanhar quando você sai da sua casa e/ou vai a algum lugar além da sua casa?'),(77,'23) Caso algum adulto trabalhe na área rural (cafezal, gado, etc), o cachorro o acompanha nas atividades diárias?'),(78,'25) Seu cão é arisco ou medroso?'),(79,'25a) Se sim, de quem ele mais tem medo?'),(80,'26) Você percebe que seu cachorro tem medo de alguém?'),(81,'26a) Se sim, por quê?'),(82,'27) O seu cão \"faz festa\" quando te vê?'),(83,'43) Seu cão ingere carcaças ou restos de animais mortos?'),(84,'43a) Se sim, quais animais e qual a origem da carcaça (abatido em casa, encontrada na propriedade, etc)?'),(85,'44) O que o seu cão come com mais frequência?'),(86,'49) Onde dorme seu/sua cachorro/cadela?'),(87,'49a) Se outro, especificar:'),(88,'50) De vez em quando seu/sua cachorro/cadela passa muito tempo fora de casa?'),(89,'50a) Se sim, com que frequência sai?'),(90,'50b) Se sim, onde acha que ele(a) fica?'),(91,'51) Em caso de matilhas, você percebe se algum dos cães é o líder da matilha?'),(92,'51a) Se sim, qual?'),(93,'51b) Que tipo de comportamento ele tem que te faz achar que ele é o líder?'),(94,'55) Eles já conseguiram matar algum animal?'),(95,'55a) Se sim, quais?'),(96,'60) Quais vacinas já foram aplicadas?'),(97,'60a) Detalhar outras vacinas aplicadas:');
/*!40000 ALTER TABLE `pergunta_animal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pergunta_tutor`
--

DROP TABLE IF EXISTS `pergunta_tutor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pergunta_tutor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pergunta` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pergunta_tutor_pergunta_key` (`pergunta`)
) ENGINE=InnoDB AUTO_INCREMENT=292 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pergunta_tutor`
--

LOCK TABLES `pergunta_tutor` WRITE;
/*!40000 ALTER TABLE `pergunta_tutor` DISABLE KEYS */;
INSERT INTO `pergunta_tutor` VALUES (220,'1) Respondente:'),(233,'10) Com o que trabalham os adultos da casa?'),(234,'11) Quantas atividades vocês têm/realizam na propriedade?'),(235,'12) Em caso de produção agrícola, a produção é voltada para subsistência ou você trabalha como funcionário de outra pessoa?'),(236,'13) Você possui tratores ou algum outro tipo de maquinário agrícola? Se sim, quantos?'),(237,'14) Quais e quantos animais de estimação ou criação vocês têm na propriedade?'),(238,'14a) Gatos, são castrados?'),(239,'14b) Porcos, quantos?'),(240,'14c) Galinhas, quantos?'),(241,'14d) Vacas, quantos?'),(242,'14e) Cavalos, quantos?'),(243,'14f) Outras aves?'),(244,'15) Número de cachorros em casa:'),(245,'16) Por que vocês têm cachorro(a)?'),(221,'2) Idade:'),(246,'21) Tem alguém que é o principal responsável pelo(a) cachorro/cadela?'),(247,'21a) Se sim, quem? Sexo, Idade, Nível de escolaridade:'),(248,'24) Você já passeou ou passeia com seu(s) cão(es)?'),(249,'24a) Se sim, por qual região?'),(250,'28) Com que frequência você faz carinho no seu cachorro?'),(251,'29) Alguém na casa brinca com o cão?'),(252,'29a) Se sim, quem brinca?'),(253,'29b) Que tipo de brincadeira?'),(222,'3) Faz quantos anos que você mora aqui:'),(254,'30) O que você faz quando o seu cão faz algo de errado ou não te obedece?'),(255,'30a) Se castiga, que tipo de castigo?'),(256,'31) Você oferece petisco ao seu cachorro?'),(257,'32) Você sai de carro com o seu cachorro?'),(258,'33) Você dá banho ou tosa o seu cachorro?'),(259,'34) Na sua opinião, quanto trabalho seu cachorro dá no dia a dia?'),(260,'35) Seu(s) cão(es) fica animado e agitado quando você dá um petisco ou um brinquedo para ele(s)?'),(261,'36) Você gosta de ter seu cachorro por perto?'),(262,'37) Você acha que vai sofrer quando seu cão morrer?'),(263,'38) Quanto você acha que seu cachorro custa para você?'),(264,'39) Considerando todo o trabalho, você acha que vale a pena ter cães?'),(265,'39a) Por quê?'),(223,'4) Qual é o tipo de vínculo da sua família com a propriedade em que reside?'),(266,'40) Como é a alimentação do(a) seu/sua cachorro/cadela?'),(267,'40a) Se somente ração, qual?'),(268,'40b) Se outra, especificar:'),(269,'41) Qual o tipo de ração ofertada?'),(270,'41a) Marca e tipo, se houver:'),(271,'42) Quais os tipos de alimentos caseiros ofertados?'),(272,'42a) Se outro alimento caseiro, qual?'),(273,'45) Com qual frequência seu/sua cachorro/cachorra é alimentado(a)?'),(274,'45a) Se outros, especificar:'),(275,'46) A água oferecida ao cachorro/cadela é trocada/reposta com qual frequência?'),(276,'47) Mais alguém de fora oferece alimentos ao(à) seu/sua cachorro/cadela?'),(277,'47a) Se sim, quem e o que oferece?'),(278,'48) Seu cachorro fica solto?'),(279,'48a) Se sim, quais cães?'),(280,'52) Seu/sua cachorro/cadela corre atrás de bichos?'),(281,'52a) Se sim, o que você faz quando vê?'),(282,'53) De quais animais o(s) seu(s) cachorro(s) corre(m) atrás?'),(283,'54) No último ano, quantas vezes você viu o seu cachorro correr atrás de animais selvagens?'),(284,'56) Seu/sua cachorro/cadela traz para casa bichos que caçou na rua?'),(285,'56a) Se sim, quais bichos?'),(286,'57) Quais bichos eles evitam ou têm medo?'),(287,'58) Quais bichos você vê com frequência na sua propriedade?'),(288,'59) Você vacina seu/sua cachorro/cadela?'),(289,'59a) Se outro, especificar:'),(224,'5a) Quantas televisões há na sua casa?'),(225,'5b) Quantos freezers há na sua casa?'),(226,'5c) Quantas geladeiras há na sua casa?'),(227,'6) Você tem algum meio de transporte? Se sim, quais?'),(290,'61) Você sabe se aqui na cidade tem gente que caça com cachorros?'),(291,'61a) Se sim, o que você já viu ou ouviu?'),(228,'7) Nível de escolaridade:'),(229,'8a) Número de adultos que moram na casa (+18 anos):'),(230,'8b) Número de adolescentes que moram na casa (12 a 18 anos):'),(231,'8c) Número de crianças que moram na casa (0 a 12 anos):'),(232,'9) Nível de escolaridade dos demais residentes:');
/*!40000 ALTER TABLE `pergunta_tutor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opcao_resposta_animal`
--

DROP TABLE IF EXISTS `opcao_resposta_animal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `opcao_resposta_animal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_pergunta_animal` int NOT NULL,
  `resposta_possivel` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `opcao_resposta_animal_id_pergunta_animal_fkey` (`id_pergunta_animal`),
  CONSTRAINT `opcao_resposta_animal_id_pergunta_animal_fkey` FOREIGN KEY (`id_pergunta_animal`) REFERENCES `pergunta_animal` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opcao_resposta_animal`
--

LOCK TABLES `opcao_resposta_animal` WRITE;
/*!40000 ALTER TABLE `opcao_resposta_animal` DISABLE KEYS */;
INSERT INTO `opcao_resposta_animal` VALUES (89,67,'Macho'),(90,67,'Fêmea'),(91,68,'Não'),(92,68,'Sim'),(93,70,'Não'),(94,70,'Sim'),(95,76,'Com frequência'),(96,76,'De vez em quando'),(97,76,'Raramente'),(98,76,'Nunca'),(99,77,'Com frequência'),(100,77,'De vez em quando'),(101,77,'Raramente'),(102,77,'Nunca'),(103,78,'Não'),(104,78,'Sim'),(105,80,'Não, ele não tem medo'),(106,80,'Sim, tem medo de mim'),(107,80,'Sim, tem medo de outras pessoas'),(108,80,'Sim, tem medo de ambos'),(109,82,'Com frequência'),(110,82,'De vez em quando'),(111,82,'Raramente'),(112,82,'Nunca'),(113,83,'Sim'),(114,83,'Não'),(115,83,'Não sei'),(116,85,'Ração'),(117,85,'Resto de comida'),(118,85,'Animais de captura'),(119,85,'Restos de animais de criação que lhes são fornecidos'),(120,85,'Não sei'),(121,86,'Dentro de casa'),(122,86,'Em uma casinha do lado de fora da casa'),(123,86,'Em um pano/acolchoado em local coberto'),(124,86,'Outro'),(125,88,'Não'),(126,88,'Sim'),(127,91,'Não'),(128,91,'Sim'),(129,94,'Sim'),(130,94,'Não'),(131,96,'Raiva'),(132,96,'Múltipla (parvovirose, cinomose etc)');
/*!40000 ALTER TABLE `opcao_resposta_animal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opcao_resposta_tutor`
--

DROP TABLE IF EXISTS `opcao_resposta_tutor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `opcao_resposta_tutor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_pergunta_tutor` int NOT NULL,
  `resposta_possivel` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `opcao_resposta_tutor_id_pergunta_tutor_fkey` (`id_pergunta_tutor`),
  CONSTRAINT `opcao_resposta_tutor_id_pergunta_tutor_fkey` FOREIGN KEY (`id_pergunta_tutor`) REFERENCES `pergunta_tutor` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=415 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opcao_resposta_tutor`
--

LOCK TABLES `opcao_resposta_tutor` WRITE;
/*!40000 ALTER TABLE `opcao_resposta_tutor` DISABLE KEYS */;
INSERT INTO `opcao_resposta_tutor` VALUES (312,220,'Masculino'),(313,220,'Feminino'),(314,223,'Propriedade própria (quitada)'),(315,223,'Propriedade própria (financiada)'),(316,223,'Alugada'),(317,223,'Residência em troca de trabalho (ex.: caseiros, cuidadores)'),(318,223,'Propriedade comunitária (ex.: ocupações de terras, áreas coletivas)'),(319,223,'Propriedade em situação de posse (sem regularização formal)'),(320,223,'Outro'),(321,228,'Não frequentou escola'),(322,228,'Ensino fundamental incompleto'),(323,228,'Ensino fundamental completo'),(324,228,'Ensino médio incompleto'),(325,228,'Ensino médio completo'),(326,228,'Ensino superior incompleto'),(327,228,'Ensino superior completo'),(328,228,'Pós graduação latu sensu'),(329,228,'Pós graduação strictu sensu'),(330,245,'Gosto de animais domésticos'),(331,245,'Para tomar conta da casa'),(332,245,'Caçar'),(333,245,'Outro'),(334,246,'Não, todos cuidam do cachorro'),(335,246,'Sim'),(336,248,'Todos os dias'),(337,248,'Algumas vezes por semana'),(338,248,'Raramente'),(339,248,'Nunca'),(340,250,'Com frequência'),(341,250,'De vez em quando'),(342,250,'Raramente'),(343,250,'Nunca'),(344,251,'Sim'),(345,251,'Não'),(346,254,'Castiga'),(347,254,'Briga'),(348,254,'Outro'),(349,256,'Com frequência'),(350,256,'De vez em quando'),(351,256,'Raramente'),(352,256,'Nunca'),(353,257,'Com frequência'),(354,257,'De vez em quando'),(355,257,'Raramente'),(356,257,'Nunca'),(357,258,'Com frequência'),(358,258,'De vez em quando'),(359,258,'Raramente'),(360,258,'Nunca'),(361,259,'Quase nenhum trabalho'),(362,259,'Pouco trabalho'),(363,259,'Trabalho moderado'),(364,259,'Muito trabalho'),(365,260,'Sim'),(366,260,'Não'),(367,261,'Nunca'),(368,261,'Às vezes'),(369,261,'Sempre'),(370,262,'Não'),(371,262,'Muito pouco'),(372,262,'Pouco'),(373,262,'Bastante'),(374,262,'Demais'),(375,263,'Nada ou muito pouco'),(376,263,'Pouco'),(377,263,'Razoável'),(378,263,'Muito'),(379,264,'Não'),(380,264,'Mais ou menos'),(381,264,'Com certeza'),(382,266,'Alimenta-se somente com ração'),(383,266,'Alimenta-se com ração e comida de casa'),(384,266,'Alimenta-se somente com comida de casa'),(385,266,'Outra'),(386,269,'À granel'),(387,269,'Pacote fechado'),(388,271,'Resto de refeição'),(389,271,'Frango/carne/porco cozido ou frito'),(390,271,'Farelo de milho'),(391,271,'Outro'),(392,273,'Oferecemos alimento uma vez ao dia'),(393,273,'Oferecemos alimento duas vezes ao dia'),(394,273,'Oferecemos alimento de três ou mais vezes ao dia'),(395,273,'Outros'),(396,275,'Colocamos água nova quando ele bebe toda água'),(397,275,'Duas vezes ao dia, mesmo que ainda tenha água'),(398,275,'No mínimo três vezes ao dia'),(399,276,'Não'),(400,276,'Não sei'),(401,276,'Sim'),(402,278,'Não, nunca'),(403,278,'Sim, apenas à noite'),(404,278,'Sim, durante dia e noite'),(405,280,'Não'),(406,280,'Nunca vi'),(407,280,'Sim'),(408,284,'Não'),(409,284,'Sim'),(410,288,'Sim'),(411,288,'Não'),(412,288,'Outro'),(413,290,'Não'),(414,290,'Sim');
/*!40000 ALTER TABLE `opcao_resposta_tutor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rastreio_gps`
--

DROP TABLE IF EXISTS `rastreio_gps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rastreio_gps` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_animal_vivo` int NOT NULL,
  `id_dispositivo_rastreio` int NOT NULL,
  `data_inicio` datetime NOT NULL,
  `data_fim` datetime DEFAULT NULL,
  `observacao` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dias_monitorados` int NOT NULL,
  `pontos_localizacao` int NOT NULL,
  `area_vida` double NOT NULL,
  `id_metodo_monitoramento` int NOT NULL,
  `link_planilha_bruta` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_planilha_editada` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data_atualizacao_planilha_bruta` datetime DEFAULT NULL,
  `data_atualizacao_planilha_editada` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rastreio_gps_id_animal_vivo_key` (`id_animal_vivo`),
  KEY `rastreio_gps_id_dispositivo_rastreio_fkey` (`id_dispositivo_rastreio`),
  KEY `rastreio_gps_id_metodo_monitoramento_fkey` (`id_metodo_monitoramento`),
  CONSTRAINT `rastreio_gps_id_animal_vivo_fkey` FOREIGN KEY (`id_animal_vivo`) REFERENCES `animal_vivo` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `rastreio_gps_id_dispositivo_rastreio_fkey` FOREIGN KEY (`id_dispositivo_rastreio`) REFERENCES `dispositivo_rastreio` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `rastreio_gps_id_metodo_monitoramento_fkey` FOREIGN KEY (`id_metodo_monitoramento`) REFERENCES `metodo_monitoramento` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rastreio_gps`
--

LOCK TABLES `rastreio_gps` WRITE;
/*!40000 ALTER TABLE `rastreio_gps` DISABLE KEYS */;
/*!40000 ALTER TABLE `rastreio_gps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resposta_animal`
--

DROP TABLE IF EXISTS `resposta_animal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resposta_animal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_entrevista_animal` int NOT NULL,
  `id_pergunta_animal` int NOT NULL,
  `texto` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantidade` int DEFAULT NULL,
  `id_opcao_resposta_animal` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `resposta_animal_id_entrevista_animal_fkey` (`id_entrevista_animal`),
  KEY `resposta_animal_id_pergunta_animal_fkey` (`id_pergunta_animal`),
  KEY `resposta_animal_id_opcao_resposta_animal_fkey` (`id_opcao_resposta_animal`),
  CONSTRAINT `resposta_animal_id_entrevista_animal_fkey` FOREIGN KEY (`id_entrevista_animal`) REFERENCES `entrevista_animal` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `resposta_animal_id_opcao_resposta_animal_fkey` FOREIGN KEY (`id_opcao_resposta_animal`) REFERENCES `opcao_resposta_animal` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `resposta_animal_id_pergunta_animal_fkey` FOREIGN KEY (`id_pergunta_animal`) REFERENCES `pergunta_animal` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resposta_animal`
--

LOCK TABLES `resposta_animal` WRITE;
/*!40000 ALTER TABLE `resposta_animal` DISABLE KEYS */;
/*!40000 ALTER TABLE `resposta_animal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resposta_tutor`
--

DROP TABLE IF EXISTS `resposta_tutor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resposta_tutor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_entrevista_tutor` int NOT NULL,
  `id_pergunta_tutor` int NOT NULL,
  `texto` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantidade` int DEFAULT NULL,
  `id_opcao_resposta_tutor` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `resposta_tutor_id_entrevista_tutor_fkey` (`id_entrevista_tutor`),
  KEY `resposta_tutor_id_pergunta_tutor_fkey` (`id_pergunta_tutor`),
  KEY `resposta_tutor_id_opcao_resposta_tutor_fkey` (`id_opcao_resposta_tutor`),
  CONSTRAINT `resposta_tutor_id_entrevista_tutor_fkey` FOREIGN KEY (`id_entrevista_tutor`) REFERENCES `entrevista_tutor` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `resposta_tutor_id_opcao_resposta_tutor_fkey` FOREIGN KEY (`id_opcao_resposta_tutor`) REFERENCES `opcao_resposta_tutor` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `resposta_tutor_id_pergunta_tutor_fkey` FOREIGN KEY (`id_pergunta_tutor`) REFERENCES `pergunta_tutor` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resposta_tutor`
--

LOCK TABLES `resposta_tutor` WRITE;
/*!40000 ALTER TABLE `resposta_tutor` DISABLE KEYS */;
/*!40000 ALTER TABLE `resposta_tutor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resultado_cpcr`
--

DROP TABLE IF EXISTS `resultado_cpcr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resultado_cpcr` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_necropsia` int NOT NULL,
  `id_tipo_amostra` int NOT NULL,
  `data_realizacao` datetime NOT NULL,
  `id_tipo_extracao` int NOT NULL,
  `id_gene_alvo` int NOT NULL,
  `primer` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pb` int NOT NULL,
  `id_agente_suspeito` int NOT NULL,
  `id_metodo_cpcr` int NOT NULL,
  `id_resultado_cpcr` int NOT NULL,
  `controle` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `resultado_cpcr_id_necropsia_id_tipo_amostra_key` (`id_necropsia`,`id_tipo_amostra`),
  KEY `resultado_cpcr_id_tipo_extracao_fkey` (`id_tipo_extracao`),
  KEY `resultado_cpcr_id_gene_alvo_fkey` (`id_gene_alvo`),
  KEY `resultado_cpcr_id_agente_suspeito_fkey` (`id_agente_suspeito`),
  KEY `resultado_cpcr_id_metodo_cpcr_fkey` (`id_metodo_cpcr`),
  KEY `resultado_cpcr_id_resultado_cpcr_fkey` (`id_resultado_cpcr`),
  KEY `resultado_cpcr_id_tipo_amostra_fkey` (`id_tipo_amostra`),
  CONSTRAINT `resultado_cpcr_id_agente_suspeito_fkey` FOREIGN KEY (`id_agente_suspeito`) REFERENCES `agente_suspeito` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `resultado_cpcr_id_gene_alvo_fkey` FOREIGN KEY (`id_gene_alvo`) REFERENCES `gene_alvo` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `resultado_cpcr_id_metodo_cpcr_fkey` FOREIGN KEY (`id_metodo_cpcr`) REFERENCES `enum_metodo_cpcr` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `resultado_cpcr_id_necropsia_fkey` FOREIGN KEY (`id_necropsia`) REFERENCES `necropsia` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `resultado_cpcr_id_resultado_cpcr_fkey` FOREIGN KEY (`id_resultado_cpcr`) REFERENCES `enum_status_cpcr` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `resultado_cpcr_id_tipo_amostra_fkey` FOREIGN KEY (`id_tipo_amostra`) REFERENCES `tipo_amostra_cpcr` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `resultado_cpcr_id_tipo_extracao_fkey` FOREIGN KEY (`id_tipo_extracao`) REFERENCES `tipo_extracao` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resultado_cpcr`
--

LOCK TABLES `resultado_cpcr` WRITE;
/*!40000 ALTER TABLE `resultado_cpcr` DISABLE KEYS */;
/*!40000 ALTER TABLE `resultado_cpcr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resultado_exame`
--

DROP TABLE IF EXISTS `resultado_exame`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resultado_exame` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_visita_veterinaria` int NOT NULL,
  `eritrocitos` double NOT NULL,
  `hemoglobina` double NOT NULL,
  `hematocrito` double NOT NULL,
  `vcm` double NOT NULL,
  `hcm` double NOT NULL,
  `chcm` double NOT NULL,
  `plaquetas` double NOT NULL,
  `leucocitos` double NOT NULL,
  `bastonetes` double NOT NULL,
  `segmentados` double NOT NULL,
  `segmentados_percentual` double NOT NULL,
  `linfocitos` double NOT NULL,
  `linfocitos_percentual` double NOT NULL,
  `monocitos` double NOT NULL,
  `monocitos_percentual` double NOT NULL,
  `eosinofilos` double NOT NULL,
  `eosinofilos_percentual` double NOT NULL,
  `basofilos` double NOT NULL,
  `basofilos_percentual` double NOT NULL,
  `alt` double NOT NULL,
  `creatinina` double NOT NULL,
  `fosfatase_alcalina` double NOT NULL,
  `proteina_total` double NOT NULL,
  `ureia` double NOT NULL,
  `id_interpretacao` int NOT NULL,
  `observacao` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `resultado_exame_id_visita_veterinaria_key` (`id_visita_veterinaria`),
  KEY `resultado_exame_id_interpretacao_fkey` (`id_interpretacao`),
  CONSTRAINT `resultado_exame_id_interpretacao_fkey` FOREIGN KEY (`id_interpretacao`) REFERENCES `enum_interpretacao` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `resultado_exame_id_visita_veterinaria_fkey` FOREIGN KEY (`id_visita_veterinaria`) REFERENCES `visita_veterinaria` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resultado_exame`
--

LOCK TABLES `resultado_exame` WRITE;
/*!40000 ALTER TABLE `resultado_exame` DISABLE KEYS */;
/*!40000 ALTER TABLE `resultado_exame` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resultado_qpcr`
--

DROP TABLE IF EXISTS `resultado_qpcr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resultado_qpcr` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_necropsia` int NOT NULL,
  `id_tipo_amostra` int NOT NULL,
  `data_realizacao` datetime NOT NULL,
  `id_gene_alvo` int NOT NULL,
  `id_agente_suspeito` int NOT NULL,
  `ct_medio` double NOT NULL,
  `copias_estimadas` double NOT NULL,
  `id_resultado_qpcr` int NOT NULL,
  `controle` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `resultado_qpcr_id_necropsia_id_tipo_amostra_key` (`id_necropsia`,`id_tipo_amostra`),
  KEY `resultado_qpcr_id_gene_alvo_fkey` (`id_gene_alvo`),
  KEY `resultado_qpcr_id_agente_suspeito_fkey` (`id_agente_suspeito`),
  KEY `resultado_qpcr_id_resultado_qpcr_fkey` (`id_resultado_qpcr`),
  KEY `resultado_qpcr_id_tipo_amostra_fkey` (`id_tipo_amostra`),
  CONSTRAINT `resultado_qpcr_id_agente_suspeito_fkey` FOREIGN KEY (`id_agente_suspeito`) REFERENCES `agente_suspeito` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `resultado_qpcr_id_gene_alvo_fkey` FOREIGN KEY (`id_gene_alvo`) REFERENCES `gene_alvo` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `resultado_qpcr_id_necropsia_fkey` FOREIGN KEY (`id_necropsia`) REFERENCES `necropsia` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `resultado_qpcr_id_resultado_qpcr_fkey` FOREIGN KEY (`id_resultado_qpcr`) REFERENCES `enum_status_qpcr` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `resultado_qpcr_id_tipo_amostra_fkey` FOREIGN KEY (`id_tipo_amostra`) REFERENCES `tipo_amostra_qpcr` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resultado_qpcr`
--

LOCK TABLES `resultado_qpcr` WRITE;
/*!40000 ALTER TABLE `resultado_qpcr` DISABLE KEYS */;
/*!40000 ALTER TABLE `resultado_qpcr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitante`
--

DROP TABLE IF EXISTS `solicitante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solicitante` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `senha` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mensagem` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `solicitante_email_key` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitante`
--

LOCK TABLES `solicitante` WRITE;
/*!40000 ALTER TABLE `solicitante` DISABLE KEYS */;
/*!40000 ALTER TABLE `solicitante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token_redefinicao_senha`
--

DROP TABLE IF EXISTS `token_redefinicao_senha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `token_redefinicao_senha` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_usuario` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expira_em` datetime NOT NULL,
  `utilizado` tinyint(1) NOT NULL DEFAULT '0',
  `criado_em` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token_redefinicao_senha_token_key` (`token`),
  KEY `token_redefinicao_senha_id_usuario_fkey` (`id_usuario`),
  CONSTRAINT `token_redefinicao_senha_id_usuario_fkey` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token_redefinicao_senha`
--

LOCK TABLES `token_redefinicao_senha` WRITE;
/*!40000 ALTER TABLE `token_redefinicao_senha` DISABLE KEYS */;
INSERT INTO `token_redefinicao_senha` VALUES ('1d1d6e68-d774-447d-a331-2fe853612d0e','84ca85ea-1347-4b64-9525-b59a12aaee56','12ccffb7-e800-4dce-bc9e-d161b7710278','2026-06-04 01:27:51',1,'2026-06-04 01:12:51'),('5373e90b-1d96-4029-aa51-2a225a1b22a6','84ca85ea-1347-4b64-9525-b59a12aaee56','a48fbd9e-17e6-4d15-b21c-0e7d09c0f9dc','2026-06-04 00:59:29',1,'2026-06-04 00:44:29'),('5fad46d2-2f86-46d7-87cb-6f7c763ee935','84ca85ea-1347-4b64-9525-b59a12aaee56','f3969b0d-b1e4-4e1e-b414-88ec44cec8d7','2026-06-04 01:11:09',1,'2026-06-04 00:56:09'),('5fcc1e8b-ffd5-4a7b-a13d-bfc7a9bc62b9','84ca85ea-1347-4b64-9525-b59a12aaee56','494288dd-0dda-4c2a-bd63-e5001449daba','2026-06-04 01:23:22',1,'2026-06-04 01:08:22'),('863772e7-8ef5-45a1-a58a-464acdfecb83','84ca85ea-1347-4b64-9525-b59a12aaee56','f6e61236-bb5d-45da-a88f-0df65c73a761','2026-06-04 01:29:49',1,'2026-06-04 01:14:49'),('e7752a5f-ffba-48ee-81fb-2c51bc99b011','84ca85ea-1347-4b64-9525-b59a12aaee56','018c6b2e-bdb4-46cd-ac18-ed2c25c4552b','2026-06-04 01:00:23',1,'2026-06-04 00:45:23');
/*!40000 ALTER TABLE `token_redefinicao_senha` ENABLE KEYS */;
UNLOCK TABLES;

-- Dump completed on 2026-09-09 20:44:28
