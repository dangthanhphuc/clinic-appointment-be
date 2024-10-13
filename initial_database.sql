CREATE DATABASE  IF NOT EXISTS `clinic_appointment` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `clinic_appointment`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: clinic_appointment
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `date_of_birth` date NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `gender` bit(1) NOT NULL,
  `img_url` varchar(255) DEFAULT 'none.jpg',
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE') NOT NULL,
  `username` varchar(255) NOT NULL,
  `role_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKmi8vkhus4xbdbqcac2jm4spvd` (`username`),
  KEY `FK7h9x5fnfw47l8lkeas20rmsva` (`role_id`),
  CONSTRAINT `FK7h9x5fnfw47l8lkeas20rmsva` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'Suite 59','1985-08-25','dspeachley0@alibaba.com',_binary '','none.jpg','Dun Speachley','$2a$04$UmjvIONHV74KSqgN.IIkf.WBVcSxaJWis2QDp2ydEl/F0ieZ75vQC','549-785-3771','INACTIVE','dspeachley0',4),(2,'Room 828','1984-05-01',NULL,_binary '\0','none.jpg','Maurizio Worlidge','$2a$04$.9y0LuFK5OssIud6l1Spqux3kjSl2PmZ3eENRTboulLDrybLtZ6O2',NULL,'ACTIVE','mworlidge1',4),(3,'20th Floor','1983-06-16','dsissot2@wsj.com',_binary '','none.jpg','Dyann Sissot','$2a$04$N/5Ty/QvEMYAExfauZFKq.9HE1J.45CAHOep71pj1y/lzx3avs0Hq','633-297-4589','ACTIVE','dsissot2',4),(4,'Apt 300','1993-06-18','chabbes3@cdc.gov',_binary '','none.jpg','Carlyle Habbes','$2a$04$Z3.XOYKMrtjAt2cN0kLEs.VcdT6O4ypkMFABoiCjrZnK7XIi1Rw3O','126-178-6909','INACTIVE','chabbes3',4),(5,NULL,'1982-02-06','lvedishchev4@hexun.com',_binary '\0','none.jpg','Lloyd Vedishchev','$2a$04$X707ifjF96EuFMaw10h7seVB/djPPQpyVBbV7w5NPoOIM2kWIwUmK','791-908-5611','INACTIVE','lvedishchev4',4);
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_types`
--

DROP TABLE IF EXISTS `appointment_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_types` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_types`
--

LOCK TABLES `appointment_types` WRITE;
/*!40000 ALTER TABLE `appointment_types` DISABLE KEYS */;
INSERT INTO `appointment_types` VALUES (1,'Personal history of malig carcinoid tumor of bronc and lung','Kiểm tra sức khỏe định kỳ'),(2,'Macrogenia','Tư vấn ban đầu'),(3,'Puncture wound with foreign body of unspecified breast','Điều trị'),(4,'Disp fx of ant column of unsp acetab, 7thG','Tái kiểm tra'),(5,'Striking against or struck by football helmet, sequela','Kiểm tra kết quả xét nghiệm'),(6,'Prolonged stay in weightless environment, sequela','Tư vấn y tế'),(7,'Exposure of other prosth matrl into organ or tissue, subs','Khám sức khỏe trước khi đi du lịch hoặc phẫu thuật'),(8,'Inj musc/tend anterior grp at lower leg level, left leg','Tái khám'),(9,'Frostbite with tissue necrosis of wrist','Tư vấn dinh dưỡng'),(10,'Type 1 diab with prolif diab rtnop with comb detach, r eye','Khám phụ khoa hoặc nam học'),(11,'Driver of 3-whl mv injured in clsn w hv veh in traf, init','Tư vấn tâm lý'),(12,'Oth fx left patella, subs for opn fx type 3A/B/C w nonunion','Đo đạc sức khỏe'),(13,'Oth fx upr & low end l fibula, 7thN','Chẩn đoán hình ảnh');
/*!40000 ALTER TABLE `appointment_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointments` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `end_time` datetime(6) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `price` float NOT NULL,
  `start_time` datetime(6) NOT NULL,
  `status` enum('ESF','SDF') NOT NULL,
  `doctor_id` bigint NOT NULL,
  `patient_id` bigint DEFAULT NULL,
  `result_id` bigint DEFAULT NULL,
  `appointment_type_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKqgvu2j0v80fbjus9nktcr1xh8` (`result_id`),
  KEY `FKmujeo4tymoo98cmf7uj3vsv76` (`doctor_id`),
  KEY `FK8exap5wmg8kmb1g1rx3by21yt` (`patient_id`),
  KEY `FK4w02y7li81c7pqo2bs8r21nfp` (`appointment_type_id`),
  CONSTRAINT `FK1942sgbmu30vuh2aex7x11hui` FOREIGN KEY (`result_id`) REFERENCES `results` (`id`),
  CONSTRAINT `FK4w02y7li81c7pqo2bs8r21nfp` FOREIGN KEY (`appointment_type_id`) REFERENCES `appointment_types` (`id`),
  CONSTRAINT `FK8exap5wmg8kmb1g1rx3by21yt` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`),
  CONSTRAINT `FKmujeo4tymoo98cmf7uj3vsv76` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_specialties`
--

DROP TABLE IF EXISTS `doctor_specialties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_specialties` (
  `doctor_id` bigint NOT NULL,
  `specialty_id` bigint NOT NULL,
  PRIMARY KEY (`doctor_id`,`specialty_id`),
  KEY `FK8gbyvkfmm5a01nmd5jberd993` (`specialty_id`),
  CONSTRAINT `FK8gbyvkfmm5a01nmd5jberd993` FOREIGN KEY (`specialty_id`) REFERENCES `specialties` (`id`),
  CONSTRAINT `FKas1tsi4uakiu7q90rnvsgvhfv` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_specialties`
--

LOCK TABLES `doctor_specialties` WRITE;
/*!40000 ALTER TABLE `doctor_specialties` DISABLE KEYS */;
INSERT INTO `doctor_specialties` VALUES (1,1),(40,1),(41,1),(80,1),(2,2),(39,2),(42,2),(79,2),(3,3),(38,3),(43,3),(78,3),(4,4),(37,4),(44,4),(77,4),(5,5),(36,5),(45,5),(76,5),(6,6),(35,6),(46,6),(75,6),(7,7),(34,7),(47,7),(74,7),(8,8),(33,8),(48,8),(73,8),(9,9),(32,9),(49,9),(72,9),(10,10),(31,10),(50,10),(71,10),(11,11),(30,11),(51,11),(70,11),(12,12),(29,12),(52,12),(69,12),(13,13),(28,13),(53,13),(68,13),(14,14),(27,14),(54,14),(67,14),(15,15),(26,15),(55,15),(66,15),(16,16),(25,16),(56,16),(65,16),(17,17),(24,17),(57,17),(64,17),(18,18),(23,18),(58,18),(63,18),(19,19),(22,19),(59,19),(62,19),(20,20),(21,20),(60,20),(61,20),(20,21),(21,21),(60,21),(61,21),(19,22),(22,22),(59,22),(62,22),(18,23),(23,23),(58,23),(63,23),(17,24),(24,24),(57,24),(64,24),(16,25),(25,25),(56,25),(65,25),(15,26),(26,26),(55,26),(66,26),(14,27),(27,27),(54,27),(67,27),(13,28),(28,28),(53,28),(68,28),(12,29),(29,29),(52,29),(69,29),(11,30),(30,30),(51,30),(70,30),(10,31),(31,31),(50,31),(71,31),(9,32),(32,32),(49,32),(72,32),(8,33),(33,33),(48,33),(73,33),(7,34),(34,34),(47,34),(74,34),(6,35),(35,35),(46,35),(75,35),(5,36),(36,36),(45,36),(76,36),(4,37),(37,37),(44,37),(77,37),(3,38),(38,38),(43,38),(78,38),(2,39),(39,39),(42,39),(79,39),(1,40),(40,40),(41,40),(80,40);
/*!40000 ALTER TABLE `doctor_specialties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctors` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `date_of_birth` date NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `gender` bit(1) NOT NULL,
  `img_url` varchar(255) DEFAULT 'none.jpg',
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE') NOT NULL,
  `username` varchar(255) NOT NULL,
  `introduce` varchar(255) DEFAULT NULL,
  `position` varchar(255) NOT NULL,
  `years_of_experience` int NOT NULL,
  `role_id` bigint NOT NULL,
  `location_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK15xrlsp4drthssb0ns4pghcfk` (`username`),
  KEY `FK9iag4bevvgrodko05wslagv4a` (`role_id`),
  KEY `FKhytqmshssfmijf7a8a13ttdox` (`location_id`),
  CONSTRAINT `FK9iag4bevvgrodko05wslagv4a` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `FKhytqmshssfmijf7a8a13ttdox` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctors`
--

LOCK TABLES `doctors` WRITE;
/*!40000 ALTER TABLE `doctors` DISABLE KEYS */;
INSERT INTO `doctors` VALUES (1,'Apt 1621','1987-10-05','lbirtwhistle0@prweb.com',_binary '','none.jpg','Lindie Birtwhistle','$2a$04$.KJfIccbj3EkmHa86oUxR.3qRS2DjhawD9bY3HVO8YmGI4CzRGvAW','266-660-2252','ACTIVE','lbirtwhistle0','Corpus luteum cyst of right ovary','Giám đốc',12,2,11),(2,'10th Floor','1993-05-03','tdowdney1@samsung.com',_binary '','none.jpg','Tersina Dowdney','$2a$04$XxnnNomw/oW7dcS/2f/hFu.851i63jW2/Nrfa8/dmLY5Yqm.2LEOG','328-954-0056','INACTIVE','tdowdney1',NULL,'Phó giám đốc',9,2,42),(3,'Apt 1076','1997-04-11','estopper2@desdev.cn',_binary '\0','none.jpg','Evangelia Stopper','$2a$04$m57dQQdLEmpH7pZusxX3d.4dbkrjSQLkj.IIhpMl.aP.NttUarbPa','219-507-9212','INACTIVE','estopper2',NULL,'Trưởng khoa',31,2,12),(4,NULL,'1998-10-22','hbolley3@hao123.com',_binary '\0','none.jpg','Hermia Bolley','$2a$04$mbj5JIu5FWx8MS6tf7fas.UkBn/wJfR9fAMzqg7n2dNxQB6H9DMR6','815-455-2278','INACTIVE','hbolley3','Toxic effect of soaps, undetermined, subsequent encounter','Bác sĩ',16,2,31),(5,'18th Floor','1994-03-30','spleat4@google.com.br',_binary '','none.jpg','Steffie Pleat','$2a$04$X4ocJ3P7ozVGcI8iRNdaeeOipxDPfge/Nj0BqzoGu3D.z.OzIilFe',NULL,'ACTIVE','spleat4',NULL,'Phó giám đốc',38,2,49),(6,'Suite 46','1988-03-14',NULL,_binary '','none.jpg','Joann Boothe','$2a$04$Zp40teqaFrcuZixfAD/k0.0TBgmwsZWuc8nao3d6daDKhrRQp/2oS','629-819-7838','ACTIVE','jboothe5','Pneumatic hammer syndrome, sequela','Phó giám đốc',25,2,26),(7,'Room 1061','1996-09-11',NULL,_binary '','none.jpg','Daune Farrand','$2a$04$rVPCFAOpaHTUySmwDfQ6iOuNSYLaai7vxEzU.TZZFNfQWOQwU.OhW','451-163-7584','ACTIVE','dfarrand6','Bicipital tendinitis, unspecified shoulder','Bác sĩ',30,2,15),(8,'PO Box 40769','1984-09-24',NULL,_binary '','none.jpg','Fairleigh Nichol','$2a$04$IQt4mYJD0r7ooWRgEbRXBOu/5nOifaiOW/kCTreGgFKQrh5X2Apoa','654-640-5078','INACTIVE','fnichol7','Acute respiratory failure, unspecified whether with hypoxia or hypercapnia','Bác sĩ',26,2,53),(9,NULL,'1981-07-03','nharce8@eventbrite.com',_binary '','none.jpg','Nola Harce','$2a$04$9p6tB721..WGLIJAWjvxleyvp8qOdEr7TYKfpHaS0MnVPKxjg7Tn2',NULL,'ACTIVE','nharce8','Poisoning by unspecified fibrinolysis-affecting drugs, accidental (unintentional), sequela','Trưởng khoa',19,2,13),(10,NULL,'1989-08-01','aaxelby9@hao123.com',_binary '','none.jpg','Ailsun Axelby','$2a$04$11uY//KgA/tCWbsiCTu8EOpzT1PW3HtSc4YCf1K8IYpmItzgQAOPS','400-438-4285','ACTIVE','aaxelby9','Unspecified injury of unspecified muscle(s) and tendon(s) at lower leg level, right leg','Phó giám đốc',33,2,38),(11,NULL,'1994-03-28','ejahnischa@meetup.com',_binary '','none.jpg','Edythe Jahnisch','$2a$04$m8OqWgvsEkooSlif7DA7Y.CHfRs5sqnoiz9Leavsav6NLrjexLYCu','927-168-6638','INACTIVE','ejahnischa','Atherosclerosis of autologous vein bypass graft(s) of the extremities with gangrene, bilateral legs','Bác sĩ',30,2,29),(12,'Suite 98','1985-02-20','kzannettib@forbes.com',_binary '\0','none.jpg','Krysta Zannetti','$2a$04$LfOnxOxXtlcqkYBfG9jpVuVKPZ3Tkv0sgyfSwqDx3pJjeRt/rTHGa',NULL,'ACTIVE','kzannettib','Unspecified superficial injury of unspecified parts of thorax','Trưởng khoa',26,2,58),(13,'Suite 22','1996-10-04','jcockshottc@loc.gov',_binary '\0','none.jpg','Janeen Cockshott','$2a$04$TQjy/UIEUoFjKZW4e00pGuxzseql.5eKNaoaol18Aea80.s6SIqP2','984-852-8065','INACTIVE','jcockshottc','Chronic or unspecified peptic ulcer, site unspecified, with hemorrhage','Phó giám đốc',9,2,32),(14,'Suite 31','1984-06-15','ibrideaud@squarespace.com',_binary '\0','none.jpg','Irv Brideau','$2a$04$KJM5ZTSyRUoUmgQ6NX8s1uBCOvH2t36DwUuG4Xz11C3rhCc7dC8nq','710-294-3405','ACTIVE','ibrideaud','Other ambulatory health services establishments as the place of occurrence of the external cause','Phó giám đốc',6,2,34),(15,'Suite 55','1999-08-24','ghallborde@independent.co.uk',_binary '\0','none.jpg','Gayleen Hallbord','$2a$04$ZuxDs8NAT2zUhapdquDD4.wtTXNfSRQ6KTb9MTnsEqu9G.ZxZMKsy','110-501-2728','INACTIVE','ghallborde','Poisoning by, adverse effect of and underdosing of mineralocorticoids and their antagonists','Giám đốc',23,2,16),(16,NULL,'1984-01-13',NULL,_binary '','none.jpg','Zorina Shilladay','$2a$04$O/ePfS5.AVnPnKUGEUnAteStkSAZTPTg7dPnquVkMeagiQA4KGU.q','295-298-2302','ACTIVE','zshilladayf','Subway car as the place of occurrence of the external cause','Bác sĩ',29,2,19),(17,NULL,'1994-03-15','ymcisaacg@google.it',_binary '\0','none.jpg','Yurik McIsaac','$2a$04$GIeN238c686.GAt0jwZGLuOLtnUJlYHVFpPnEQUqMNVrvv9UneQWy',NULL,'ACTIVE','ymcisaacg',NULL,'Phó giám đốc',12,2,45),(18,'Suite 64','1995-04-04','igavanh@nih.gov',_binary '','none.jpg','Ibbie Gavan','$2a$04$dqo78OyxIl8Iscge.K3XXOjRNoVE6hRv5nZF59.TVQTXCShO8ugju',NULL,'ACTIVE','igavanh',NULL,'Bác sĩ',11,2,31),(19,'Room 197','1981-10-06',NULL,_binary '\0','none.jpg','Fonzie Childrens','$2a$04$Uq7xZfGzchltPmca7f/yxexRdVjXsYJTAPk90h5v5IpBU0WRIeEi6','237-625-5395','ACTIVE','fchildrensi','Nondisplaced segmental fracture of shaft of right tibia, initial encounter for open fracture type I or II','Bác sĩ',35,2,18),(20,'PO Box 39690','1982-04-02','jcotonj@last.fm',_binary '','none.jpg','Jean Coton','$2a$04$yRAS5YV1a.LXXL9EAElPz.IggzgntKVe39EdUutc4JHe4EyFWkkvu','662-581-5678','ACTIVE','jcotonj','Contusion of unspecified external genital organ, female, sequela','Bác sĩ',21,2,29),(21,'20th Floor','1984-12-10','dhaingek@opera.com',_binary '\0','none.jpg','Derek Hainge','$2a$04$vbr6fcMJ9u8rwMzTGkPTcOOjgsoZYLLjaH7.HnO3rWWulWWu0K1kW',NULL,'INACTIVE','dhaingek','Poisoning by other opioids, assault, sequela','Phó giám đốc',30,2,16),(22,'6th Floor','1990-01-07','noswaldl@tripadvisor.com',_binary '','none.jpg','Nelly Oswald','$2a$04$8ipV6mzx7YUaaVbcQ8TeMexeHJVe2G1KUYY34dXZbveSlSlKdXLrW',NULL,'INACTIVE','noswaldl','Hair color and hair shaft abnormalities','Phó giám đốc',20,2,35),(23,NULL,'1985-01-27',NULL,_binary '','none.jpg','Kerry Redmell','$2a$04$zNaZ0IMPi56FT57IBg1TL.ovbA/8/8H.A0uz7NkFCoNJH5PcAPHLi','906-476-4685','ACTIVE','kredmellm',NULL,'Trưởng khoa',14,2,3),(24,NULL,'1982-08-24','jhughfn@storify.com',_binary '','none.jpg','Janeen Hughf','$2a$04$q5MR6gg.x2yX0NUYsvIsye8bR1PK02jq5fxwCvO9VhazwopB/VRGm','858-441-2902','INACTIVE','jhughfn',NULL,'Bác sĩ',26,2,9),(25,'Apt 1381','1985-01-22','iparello@uiuc.edu',_binary '','none.jpg','Ianthe Parell','$2a$04$ks61ecbf.d9plRup6HF6SeSAJOaU7N7hb3zkshdtmT527C1UZUgwu','341-291-5532','INACTIVE','iparello','Salter-Harris Type III physeal fracture of phalanx of right toe, subsequent encounter for fracture with delayed healing','Bác sĩ',24,2,26),(26,NULL,'1997-02-14',NULL,_binary '','none.jpg','Analise Hadeke','$2a$04$dEfGFhEesSeqnnB04FhfJ.vlrebg8NDQZmCByzOxcW.tTXg7lXFba',NULL,'ACTIVE','ahadekep',NULL,'Trưởng khoa',19,2,8),(27,NULL,'1995-08-09','mlowndesbroughq@howstuffworks.com',_binary '\0','none.jpg','Melinde Lowndesbrough','$2a$04$YyXighoB9k5NT.GMyPzxIuuFC3imqDH65eCQ0e07tzlpX4PgRmSIC','867-644-8918','INACTIVE','mlowndesbroughq',NULL,'Giám đốc',10,2,43),(28,NULL,'1996-12-09','vlowder@shop-pro.jp',_binary '','none.jpg','Vinny Lowde','$2a$04$Bxrof2RHXF92BDoJdCcDsOHTUrDqSwUl6AxBXAS3iCEfcvLJQviIi','354-734-6142','INACTIVE','vlowder','Burn of second degree of multiple sites of unspecified ankle and foot','Phó giám đốc',29,2,4),(29,'16th Floor','1999-08-24',NULL,_binary '\0','none.jpg','Sileas Pieterick','$2a$04$ABDnfaM87JHlXvdnqFM/jeOA41DqfPfOgmSNkTizze/gEMDPu7fsS',NULL,'INACTIVE','spietericks','Poisoning by salicylates, intentional self-harm','Giám đốc',35,2,59),(30,NULL,'1993-05-07',NULL,_binary '','none.jpg','Gaylene Woolcocks','$2a$04$K5JJOwsKcr3nKRgqFIPRG.DkXhz1HTssXOFxA2qqvSFRmK1dIiawy','881-655-4710','ACTIVE','gwoolcockst','Other specified diabetes mellitus with proliferative diabetic retinopathy with combined traction retinal detachment and rhegmatogenous retinal detachment, unspecified eye','Bác sĩ',14,2,18),(31,'Room 69','1998-12-04',NULL,_binary '','none.jpg','Golda Wolfit','$2a$04$t6IVnLHxaF/o3y9jNK5mleV/YGRRSnVruALrprGU/S0MwQKFn20Tm','685-208-7900','INACTIVE','gwolfitu','Abnormal results of other function studies of eye','Trưởng khoa',12,2,53),(32,'Room 973','1988-11-07','ggilmorev@ifeng.com',_binary '\0','none.jpg','Garvy Gilmore','$2a$04$wCzUg9r9hmmX1rsQRvxaMOYLOxr8AhjKMC3TOdz3WpQFhzIId9VBm','187-206-3030','INACTIVE','ggilmorev','Poisoning by other bacterial vaccines, accidental (unintentional)','Phó giám đốc',8,2,21),(33,'Room 346','1992-09-30',NULL,_binary '','none.jpg','Shayne Sparling','$2a$04$Fg9JXrgrvyWjLHuJUeJ1buMuRdc/GRyL84I9YsMYbxT9/CHNBREAW','638-363-7765','ACTIVE','ssparlingw','Other injury of stomach, subsequent encounter','Bác sĩ',31,2,25),(34,'Suite 16','1983-06-20','ssepeyx@hubpages.com',_binary '','none.jpg','Skylar Sepey','$2a$04$K6AmXPiGqRnCxTt1syo6i.8G9YyKRXShYUOSq4kAlBV/KTf313Ev6','241-837-1593','ACTIVE','ssepeyx',NULL,'Bác sĩ',8,2,57),(35,'PO Box 51823','1987-05-03',NULL,_binary '','none.jpg','Duane Perrone','$2a$04$6IXjgtIFGIS0D4BvrKRPp.SZaNlXx5WdYgXYgZF6szkEONXv.o6nK','450-138-4568','INACTIVE','dperroney',NULL,'Giám đốc',22,2,60),(36,'Suite 94','1998-02-16','kangoodz@cornell.edu',_binary '','none.jpg','Kori Angood','$2a$04$5Px4NTqUDEF/c9RZIfD32e230HZEIuU2d1TV61T1zfo1KAjlEHc86','982-607-0803','INACTIVE','kangoodz','Toxic effect of carbon dioxide, accidental (unintentional), subsequent encounter','Giám đốc',21,2,56),(37,'6th Floor','1988-09-06','urishworth10@hc360.com',_binary '\0','none.jpg','Ulla Rishworth','$2a$04$8pkcvmidcXG5DXa5OzMXeezrofGUFUyvnou4ty/LT05qoQBd0eXhS','396-714-9757','ACTIVE','urishworth10',NULL,'Phó giám đốc',15,2,23),(38,NULL,'1982-05-07',NULL,_binary '\0','none.jpg','Wilow Bourchier','$2a$04$ok0hwPvn8272GJbY7fTqEeHpMNx37ajlSMgTdyUmj7Cg0iei6DCzC','206-815-0872','ACTIVE','wbourchier11','Other sequelae following unspecified cerebrovascular disease','Giám đốc',18,2,29),(39,NULL,'1989-12-31','mpassman12@ucoz.ru',_binary '\0','none.jpg','Martyn Passman','$2a$04$ZmEIFUDyHFv2l1zIEge2Z.FrTLWWPn/lwVbH1wFNMK9hWZ/0c9fDm','598-805-5127','ACTIVE','mpassman12','Embolism due to vascular prosthetic devices, implants and grafts, initial encounter','Trưởng khoa',36,2,8),(40,NULL,'1992-05-12','arobker13@cornell.edu',_binary '','none.jpg','Adriena Robker','$2a$04$yEXWXoUs4OMZG0JIlf9fFORbiuVmLW7KYahuIHZDlyjFuq0w9BaF.','781-534-8171','ACTIVE','arobker13','Unspecified injury of left foot, sequela','Phó giám đốc',14,2,57),(41,'Apt 1335','1991-01-15','pdowding14@youtu.be',_binary '','none.jpg','Poul Dowding','$2a$04$iM4lVXFHSLiMYI25w1Zd7ebbY8nqqoQaANfXCQ8bzUhWGXUN5qY1m','420-488-8732','ACTIVE','pdowding14',NULL,'Bác sĩ',5,2,11),(42,'Apt 445','1999-07-02','lcomport15@about.com',_binary '','none.jpg','Lucius Comport','$2a$04$abTrXFY.veXsxzLB9zi7JeR5BrbmNxWUJMd37BO77xkcMkTs82E5K','418-423-0889','INACTIVE','lcomport15',NULL,'Giám đốc',22,2,23),(43,'PO Box 11717','1990-06-12','seilhart16@microsoft.com',_binary '\0','none.jpg','Sarah Eilhart','$2a$04$lSP5Q9KWyQjhlB1fT0sH9ufZfJr64NDCdaqJcJirOGMHHO/WPT1zq',NULL,'INACTIVE','seilhart16',NULL,'Phó giám đốc',11,2,19),(44,NULL,'1988-09-01','cmccalister17@squarespace.com',_binary '','none.jpg','Charleen McCalister','$2a$04$yXj9.V7ydgdQ3ymdD1tmbeygaIJSVvvRptpsj0IZ/BT2RmSFtoNPO',NULL,'ACTIVE','cmccalister17','Pedestrian on foot injured in collision with roller-skater, sequela','Trưởng khoa',39,2,39),(45,NULL,'1992-10-20','kleishman18@privacy.gov.au',_binary '\0','none.jpg','Konstantin Leishman','$2a$04$2G/TYMSHy6zLAUko9ML7BOGpn.exlu9jT2dnlDoW6K0x8etu.R0IC','786-147-0124','INACTIVE','kleishman18','Drowning and submersion due to other accident to sailboat, sequela','Giám đốc',37,2,16),(46,'Room 1897','1982-05-12','amullen19@seesaa.net',_binary '','none.jpg','Ambros Mullen','$2a$04$m8c.8Xz06LNDq9xwKOhOs.SPtxfYSR1NOiAbCINa2.rVXZ8jyYRx6',NULL,'ACTIVE','amullen19','Male with sex chromosome mosaicism','Trưởng khoa',25,2,22),(47,'Room 91','1985-01-23','joxlee1a@netvibes.com',_binary '','none.jpg','Jennette Oxlee','$2a$04$B3.no.znnTpc58bBVtC26.mfCuNpWVVKb/aWQqpH0dnk7CvW8cQJS',NULL,'ACTIVE','joxlee1a',NULL,'Trưởng khoa',27,2,59),(48,NULL,'1982-04-08','cbarkworth1b@salon.com',_binary '','none.jpg','Cull Barkworth','$2a$04$UQT8dcJLcD8RrinBeod/JOw.LQE7XTVI.UoOHdaNLLiURRKtQN0q2',NULL,'INACTIVE','cbarkworth1b','Adhesions due to foreign body accidentally left in body following heart catheterization','Giám đốc',37,2,28),(49,'Apt 1119','1982-12-28','gshills1c@cnbc.com',_binary '\0','none.jpg','Gwendolin Shills','$2a$04$TshFEPJ5uyzkvFSHSlh/NeK8DMvFQaj/pwXXAsW6SbnQu8qh1NMg6','285-601-9246','ACTIVE','gshills1c',NULL,'Trưởng khoa',10,2,18),(50,NULL,'1986-08-18','ashaw1d@google.fr',_binary '\0','none.jpg','Anastasie Shaw','$2a$04$vG7rdpwFHJ5183LNhElybuohY6DQC4eUuaFpnbzUWbtLvSBF85S76',NULL,'INACTIVE','ashaw1d','Fracture of proximal phalanx of thumb','Phó giám đốc',33,2,24),(51,'Apt 683','1990-12-28','yskittreal1e@meetup.com',_binary '\0','none.jpg','Yehudit Skittreal','$2a$04$hdMo61JqtYDuqo9IE8nc6.1LQRXqkkhZkdm7cSvBx8kVvscrJAxnu','340-695-0347','ACTIVE','yskittreal1e',NULL,'Giám đốc',5,2,48),(52,'15th Floor','1994-02-28',NULL,_binary '\0','none.jpg','Georgia Hundey','$2a$04$jCNMt4MRRCBiIsIGgiULxO8lPKq.yxosP7gJW19ZFjp7WjeFF3qrG','166-997-2173','INACTIVE','ghundey1f',NULL,'Bác sĩ',13,2,2),(53,'PO Box 84850','1988-12-01',NULL,_binary '','none.jpg','Liane MacVaugh','$2a$04$pTq10ksMGTSY0x5Qf533Fen3ePuoASMveLbn.skZI5zk4MEKbI3KW','314-837-6720','ACTIVE','lmacvaugh1g',NULL,'Bác sĩ',18,2,32),(54,'13th Floor','1991-11-01',NULL,_binary '','none.jpg','Sandy Jirick','$2a$04$LPF6b6848YNJUVeljAqLNOEIR01tKKwtMrDk/ZuQ1ZQq/rXDBoTLG','853-374-6301','INACTIVE','sjirick1h','Displaced articular fracture of head of unspecified femur, subsequent encounter for open fracture type I or II with delayed healing','Trưởng khoa',25,2,1),(55,'Room 361','1992-02-09',NULL,_binary '','none.jpg','Pinchas Ruffles','$2a$04$VXqiLUxKvUQdlj7x1zrb/uT3reyHXz/fE/8mA2aC2qvgUlobN0xFa','400-181-2510','ACTIVE','pruffles1i','Displaced intertrochanteric fracture of unspecified femur, sequela','Trưởng khoa',11,2,38),(56,'Suite 96','1981-01-04','pmeyrick1j@topsy.com',_binary '','none.jpg','Penelopa Meyrick','$2a$04$7LlldRUWRc6fFm.zGfvF2.QUj8EBEYhHt4UOvO28pmE3Bad8w1NUS','805-703-0106','ACTIVE','pmeyrick1j','Burn of second degree of toe(s) (nail)','Trưởng khoa',24,2,12),(57,'Apt 1581','1984-07-31','fgladdis1k@istockphoto.com',_binary '\0','none.jpg','Francyne Gladdis','$2a$04$Ypk7XcCU8Qi/Vmgh.vRiK.HaqLVJdFWjsAQELmOWiVVgBmSN2RTiq','281-933-2042','ACTIVE','fgladdis1k','Other extraarticular fracture of lower end of left radius','Phó giám đốc',34,2,30),(58,NULL,'1982-04-27','tamys1l@indiatimes.com',_binary '\0','none.jpg','Torey Amys','$2a$04$IL.sslzcvUhQfuG9apFRhexSKKLHeNbDUObxwCax2U.pp6cDt4HT.',NULL,'INACTIVE','tamys1l',NULL,'Bác sĩ',37,2,17),(59,'Suite 2','1982-01-03','dvictory1m@fotki.com',_binary '','none.jpg','Drusi Victory','$2a$04$Y.bshAoXk5TFb43g8JIn1.Y.W9kwnNxrhS3XekjllNFZdE3efXOZm','204-493-1789','INACTIVE','dvictory1m','Unspecified fracture of unspecified metacarpal bone, initial encounter for closed fracture','Bác sĩ',27,2,42),(60,NULL,'1996-12-21','lelse1n@blogtalkradio.com',_binary '','none.jpg','Lamond Else','$2a$04$5xti/hh2B6/UNcV7euP3xOPT8YSlB4PCxB3eb1T/48Fo3bfF2vl0W','489-802-9216','INACTIVE','lelse1n','Rheumatoid vasculitis with rheumatoid arthritis of shoulder','Phó giám đốc',17,2,37),(61,'Apt 1733','1983-07-14',NULL,_binary '','none.jpg','Loren Gallally','$2a$04$O4TEsTlcvfJZf4o6v7IqLut6zeKam0iGH2Ax0GIQy13C4aKCC0dPC','647-952-2238','INACTIVE','lgallally1o','Displaced fracture of navicular [scaphoid] of left foot, subsequent encounter for fracture with delayed healing','Phó giám đốc',17,2,56),(62,'19th Floor','1990-05-24','jeckery1p@nih.gov',_binary '','none.jpg','Jaymie Eckery','$2a$04$.EU87GHjD0V2QNBqy1SlqO1FC80A3q1Gxc0BjWK1tLa9aJ6wXR2jy','756-843-1563','INACTIVE','jeckery1p',NULL,'Phó giám đốc',32,2,5),(63,NULL,'1986-04-27',NULL,_binary '','none.jpg','Aviva Battey','$2a$04$zQqb27PZ6w.fz61wvcj.suGtlKrjxNzLigY2HMA.Beqa7B17rqrp.','642-375-3746','ACTIVE','abattey1q','Abscess of eyelid unspecified eye, unspecified eyelid','Bác sĩ',15,2,34),(64,NULL,'1980-12-22','msloane1r@chronoengine.com',_binary '\0','none.jpg','Marice Sloane','$2a$04$OQ2f/pErFdbzChWa2CJUW.s7zqtrD3HFKMbeJSv7bUnhMHLvnSeRi','450-195-4714','INACTIVE','msloane1r',NULL,'Phó giám đốc',13,2,1),(65,NULL,'1981-10-25','efishpond1s@facebook.com',_binary '\0','none.jpg','Evaleen Fishpond','$2a$04$Eda957d1a9zT.FZJyIbF1udH9numFG/ljBW1.RtF5.1Nzz5GW/ZoW','734-170-6400','INACTIVE','efishpond1s','Retained (old) magnetic foreign body in posterior wall of globe, unspecified eye','Giám đốc',7,2,59),(66,'Room 861','1985-04-14','ayantsurev1t@archive.org',_binary '\0','none.jpg','Anna-maria Yantsurev','$2a$04$I5xqKubjheiiBvdQGNTj4.xNRR9LYgCb70RGyJ3y8XlpegjQ6wnBG','376-955-5229','INACTIVE','ayantsurev1t',NULL,'Phó giám đốc',35,2,23),(67,NULL,'1989-09-22',NULL,_binary '','none.jpg','Rheta Busfield','$2a$04$dQeP//.wluVdf4dEplMnE.5LwAHnXGaO8uW09ZxvGOj1lFoTos0k6','832-905-0665','ACTIVE','rbusfield1u','Military operations involving other destruction of aircraft, civilian','Giám đốc',25,2,18),(68,'PO Box 74843','1995-08-16','mfolger1v@bravesites.com',_binary '','none.jpg','Moyna Folger','$2a$04$ouPKo7wZSQU6aP4Km2B3V.sHGO4kdXcOwGCVc78GqY7mFVM6rCthS','708-737-0255','ACTIVE','mfolger1v','Displaced fracture of epiphysis (separation) (upper) of right femur, subsequent encounter for open fracture type IIIA, IIIB, or IIIC with routine healing','Giám đốc',20,2,40),(69,'Room 1664','1983-09-25','glambkin1w@unc.edu',_binary '\0','none.jpg','Gustav Lambkin','$2a$04$BmpLGAU2CcuoIzTgvkCTmuOR0lM45b9eaNUsmMghj96.pVkd0KEMK','766-275-9989','ACTIVE','glambkin1w',NULL,'Bác sĩ',21,2,59),(70,NULL,'1991-11-25','liannini1x@about.me',_binary '\0','none.jpg','Lizabeth Iannini','$2a$04$7kSO2UjTxVQHTnk21jApQ.qtJn1fZTOh9In.QfBvxGbCCcCJ/xITC','514-141-4645','ACTIVE','liannini1x',NULL,'Bác sĩ',22,2,4),(71,'PO Box 89568','1995-12-14','cfroome1y@europa.eu',_binary '','none.jpg','Charmain Froome','$2a$04$sfGjAoIl/pmmlFwKQ9axb.q1FLoExO5SHQVao1rvbx9604xF4H8fu',NULL,'INACTIVE','cfroome1y','Displaced fracture of anterior process of unspecified calcaneus, initial encounter for closed fracture','Phó giám đốc',38,2,56),(72,NULL,'1984-12-09','kjoburn1z@merriam-webster.com',_binary '\0','none.jpg','Kirby Joburn','$2a$04$K1ZYqHLYu8Hcl5LCyGMj9eGaWKaQ2lTBIzzohON4u.8SM.4g/tzuq','582-322-1709','INACTIVE','kjoburn1z','Other specified arthritis, unspecified hip','Giám đốc',31,2,42),(73,'Room 1666','1982-09-09','cebhardt20@redcross.org',_binary '\0','none.jpg','Carmine Ebhardt','$2a$04$8dc5Z9FxOl2ajkuKaqmgN.64jhWsgTx2N0F1yXXb4zszOfZC1xPoe','656-976-7807','INACTIVE','cebhardt20','Toxic effect of venom of hornets, undetermined, sequela','Bác sĩ',24,2,28),(74,'Suite 100','1994-03-21','rhardwick21@dion.ne.jp',_binary '','none.jpg','Rayshell Hardwick','$2a$04$dJ9uG7etHt5.70tUbdTc4OiLW7JXXBobMuF/2ProfDBvOdIgsbPA6','945-763-7803','INACTIVE','rhardwick21','External constriction of unspecified part of neck, initial encounter','Bác sĩ',16,2,25),(75,'Suite 4','1995-08-11','cmaybey22@usa.gov',_binary '\0','none.jpg','Callean Maybey','$2a$04$wSx3BE1fDGxzEFccD9EZOOd0tEE4LxEBcRqzfPUfVHDNI8KPm6WMK','710-528-5466','INACTIVE','cmaybey22','Drug-induced chronic gout, unspecified elbow, with tophus (tophi)','Trưởng khoa',12,2,35),(76,NULL,'1993-01-26','jdagnall23@cdc.gov',_binary '\0','none.jpg','Janot Dagnall','$2a$04$4wNCFGHCGRW.696Vt1QDD.EJ0FZjbWak726jRmsaho0ooLCOHf5zC',NULL,'ACTIVE','jdagnall23','Salter-Harris Type IV physeal fracture of right metatarsal, initial encounter for closed fracture','Phó giám đốc',26,2,55),(77,NULL,'1982-08-31',NULL,_binary '','none.jpg','Audry Ruhben','$2a$04$PkWgTZZDu589SZv8nkayKO8aMo6S/h02nfpC6C8.B4DB3Me95Y1Em',NULL,'INACTIVE','aruhben24','Adverse effect of stimulant laxatives, sequela','Trưởng khoa',23,2,32),(78,NULL,'1992-02-13',NULL,_binary '\0','none.jpg','Margaux Hirschmann','$2a$04$Jg6.l9WE9frhsOvxBIo6LeYApXpom5h.iWY7GvQBrchTkpjYAO2Cm',NULL,'ACTIVE','mhirschmann25','Open angle with borderline findings, high risk, bilateral','Bác sĩ',23,2,7),(79,'5th Floor','1991-06-05',NULL,_binary '','none.jpg','Nicola Cantillion','$2a$04$zIycHAG/hguxlYt4i83V2OhapCLKOJNxpoMTyrqZMMaAofn3MZzd.',NULL,'INACTIVE','ncantillion26','Explosion of mine placed during war operations but exploding after cessation of hostilities, military personnel','Bác sĩ',31,2,56),(80,'Room 1304','1995-03-21',NULL,_binary '','none.jpg','Werner Marzelle','$2a$04$kJZ/HNYsTDqUFNvQU5fWG.sFUAZJBcsjQeaRphvq958OkZ3yFPB/G','448-850-4282','ACTIVE','wmarzelle27','Pathological fracture, pelvis, subsequent encounter for fracture with nonunion','Giám đốc',19,2,52);
/*!40000 ALTER TABLE `doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flyway_schema_history`
--

DROP TABLE IF EXISTS `flyway_schema_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flyway_schema_history` (
  `installed_rank` int NOT NULL,
  `version` varchar(50) DEFAULT NULL,
  `description` varchar(200) NOT NULL,
  `type` varchar(20) NOT NULL,
  `script` varchar(1000) NOT NULL,
  `checksum` int DEFAULT NULL,
  `installed_by` varchar(100) NOT NULL,
  `installed_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `execution_time` int NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`installed_rank`),
  KEY `flyway_schema_history_s_idx` (`success`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flyway_schema_history`
--

LOCK TABLES `flyway_schema_history` WRITE;
/*!40000 ALTER TABLE `flyway_schema_history` DISABLE KEYS */;
INSERT INTO `flyway_schema_history` VALUES (1,'0','<< Flyway Baseline >>','BASELINE','<< Flyway Baseline >>',NULL,'root','2024-10-13 11:43:08',0,1);
/*!40000 ALTER TABLE `flyway_schema_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location_specialties`
--

DROP TABLE IF EXISTS `location_specialties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location_specialties` (
  `location_id` bigint NOT NULL,
  `specialty_id` bigint NOT NULL,
  PRIMARY KEY (`location_id`,`specialty_id`),
  KEY `FKskmmd83l6my83vneeaml116s3` (`specialty_id`),
  CONSTRAINT `FK9s1nokd81gt6snn5on53h2n6i` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`),
  CONSTRAINT `FKskmmd83l6my83vneeaml116s3` FOREIGN KEY (`specialty_id`) REFERENCES `specialties` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location_specialties`
--

LOCK TABLES `location_specialties` WRITE;
/*!40000 ALTER TABLE `location_specialties` DISABLE KEYS */;
INSERT INTO `location_specialties` VALUES (1,1),(14,1),(27,1),(41,1),(54,1),(1,2),(14,2),(28,2),(41,2),(54,2),(1,3),(15,3),(28,3),(41,3),(55,3),(2,4),(15,4),(28,4),(42,4),(55,4),(2,5),(15,5),(29,5),(42,5),(55,5),(2,6),(16,6),(29,6),(42,6),(56,6),(3,7),(16,7),(29,7),(43,7),(56,7),(3,8),(16,8),(30,8),(43,8),(56,8),(3,9),(17,9),(30,9),(43,9),(57,9),(4,10),(17,10),(30,10),(44,10),(57,10),(4,11),(17,11),(31,11),(44,11),(57,11),(4,12),(18,12),(31,12),(44,12),(58,12),(5,13),(18,13),(31,13),(45,13),(58,13),(5,14),(18,14),(32,14),(45,14),(58,14),(5,15),(19,15),(32,15),(45,15),(59,15),(6,16),(19,16),(32,16),(46,16),(59,16),(6,17),(19,17),(33,17),(46,17),(59,17),(6,18),(20,18),(33,18),(46,18),(60,18),(7,19),(20,19),(33,19),(47,19),(60,19),(7,20),(20,20),(34,20),(47,20),(60,20),(1,21),(7,21),(21,21),(34,21),(47,21),(1,22),(8,22),(21,22),(34,22),(48,22),(1,23),(8,23),(21,23),(35,23),(48,23),(2,24),(8,24),(22,24),(35,24),(48,24),(2,25),(9,25),(22,25),(35,25),(49,25),(2,26),(9,26),(22,26),(36,26),(49,26),(3,27),(9,27),(23,27),(36,27),(49,27),(3,28),(10,28),(23,28),(36,28),(50,28),(3,29),(10,29),(23,29),(37,29),(50,29),(4,30),(10,30),(24,30),(37,30),(50,30),(4,31),(11,31),(24,31),(37,31),(51,31),(4,32),(11,32),(24,32),(38,32),(51,32),(5,33),(11,33),(25,33),(38,33),(51,33),(5,34),(12,34),(25,34),(38,34),(52,34),(5,35),(12,35),(25,35),(39,35),(52,35),(6,36),(12,36),(26,36),(39,36),(52,36),(6,37),(13,37),(26,37),(39,37),(53,37),(6,38),(13,38),(26,38),(40,38),(53,38),(7,39),(13,39),(27,39),(40,39),(53,39),(7,40),(14,40),(27,40),(40,40),(54,40);
/*!40000 ALTER TABLE `location_specialties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `img_url` varchar(255) DEFAULT 'none.jpg',
  `name` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `medical_facility_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK466m33xan5upxcxpjotvdcks8` (`medical_facility_id`),
  CONSTRAINT `FK466m33xan5upxcxpjotvdcks8` FOREIGN KEY (`medical_facility_id`) REFERENCES `medical_facilities` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,'2 Nancy Alley','Replacement of Right Femoral Artery with Nonautologous Tissue Substitute, Open Approach','smerrgan0@booking.com','http://dummyimage.com/179x100.png/5fa2dd/ffffff','Laboratoires M&L','681-871-5421',16),(2,'4932 Birchwood Pass','Dilation of Left Peroneal Artery, Bifurcation, with Two Drug-eluting Intraluminal Devices, Open Approach','gskrzynski1@devhub.com','http://dummyimage.com/181x100.png/cc0000/ffffff','International Labs, Inc.','995-235-4155',11),(3,'49775 Kim Center','Division of Left Hip Bursa and Ligament, Percutaneous Approach','gkurton2@behance.net','http://dummyimage.com/244x100.png/dddddd/000000','Taro Pharmaceuticals U.S.A., Inc.','989-165-4567',7),(4,'3 Springs Junction','Removal of Internal Fixation Device from Left Ulna, Percutaneous Approach','skybert3@opensource.org','http://dummyimage.com/156x100.png/dddddd/000000','Combe Incorporated','344-300-5802',22),(5,'9100 Chinook Place','Supplement Cerebral Meninges with Nonautologous Tissue Substitute, Percutaneous Endoscopic Approach','llittrell4@dropbox.com','http://dummyimage.com/209x100.png/ff4444/ffffff','Cardinal Health','805-515-6512',2),(6,'297 Anderson Drive','Fluoroscopy of Bilateral Internal Carotid Arteries using High Osmolar Contrast, Laser Intraoperative','ghaughian5@bravesites.com','http://dummyimage.com/130x100.png/5fa2dd/ffffff','Parke-Davis Div of Pfizer Inc','998-668-8355',8),(7,'7 Old Gate Crossing','Supplement Cervical Vertebral Joint with Autologous Tissue Substitute, Percutaneous Endoscopic Approach','lofficer6@statcounter.com','http://dummyimage.com/187x100.png/cc0000/ffffff','West-Ward Pharmaceutical Corp','714-452-0936',21),(8,'1402 Manitowish Junction','Removal of Infusion Device from Endocrine Gland, External Approach','kcracknall7@w3.org','http://dummyimage.com/177x100.png/dddddd/000000','Nelco Laboratories, Inc.','938-895-4910',5),(9,'54964 Waywood Crossing','Reposition Right Metatarsal-Phalangeal Joint with Internal Fixation Device, Percutaneous Approach','llaborda8@addtoany.com','http://dummyimage.com/122x100.png/ff4444/ffffff','Perrigo New York Inc','219-624-8845',10),(10,'54813 Kennedy Park','Alteration of Left Elbow Region with Nonautologous Tissue Substitute, Percutaneous Endoscopic Approach','mliggins9@umn.edu','http://dummyimage.com/241x100.png/cc0000/ffffff','State of Florida DOH Central Pharmacy','343-855-8900',3),(11,'697 Brentwood Plaza','Supplement Right Thorax Bursa and Ligament with Autologous Tissue Substitute, Open Approach','dlorenta@biglobe.ne.jp','http://dummyimage.com/189x100.png/ff4444/ffffff','REMEDYREPACK INC.','375-499-5692',23),(12,'523 Farmco Point','Fusion of 2 or more Cervical Vertebral Joints with Autologous Tissue Substitute, Posterior Approach, Posterior Column, Percutaneous Approach','wcollingridgeb@twitter.com','http://dummyimage.com/227x100.png/dddddd/000000','Baxter Healthcare Corporation','445-811-2183',29),(13,'125 Jana Avenue','Fluoroscopy of Corpora Cavernosa using Low Osmolar Contrast','losmintc@bizjournals.com','http://dummyimage.com/126x100.png/ff4444/ffffff','ALK-Abello, Inc.','460-894-3588',19),(14,'77 Elmside Crossing','Restriction of Left Brachial Vein, Open Approach','kgaenord@sina.com.cn','http://dummyimage.com/166x100.png/cc0000/ffffff','Aurobindo Pharma Limited','969-816-6923',8),(15,'9891 Independence Street','Transfer Olfactory Nerve to Accessory Nerve, Percutaneous Endoscopic Approach','adickere@seesaa.net','http://dummyimage.com/131x100.png/5fa2dd/ffffff','MEIJER, INC.','410-773-6645',29),(16,'4 Del Mar Circle','Beam Radiation of Chest Wall using Electrons','speddief@google.com.br','http://dummyimage.com/163x100.png/5fa2dd/ffffff','McKesson Packaging Services Business Unit of McKesson Corporation','114-971-2561',17),(17,'83 Fremont Parkway','Revision of Autologous Tissue Substitute in Right Breast, Via Natural or Artificial Opening Endoscopic','rloutheaneg@eepurl.com','http://dummyimage.com/194x100.png/cc0000/ffffff','Apotex Corp.','631-435-9204',14),(18,'0 Dexter Pass','Removal of External Fixation Device from Right Carpal Joint, External Approach','mgarzah@gmpg.org','http://dummyimage.com/161x100.png/cc0000/ffffff','Nelco Laboratories, Inc.','185-143-4022',19),(19,'8420 Clemons Hill','Measurement of Cardiac Sampling and Pressure, Right Heart, Open Approach','spurdoni@surveymonkey.com','http://dummyimage.com/162x100.png/5fa2dd/ffffff','Sani Home Products International LLC','288-723-7316',8),(20,'6 Gale Parkway','Supplement Right Metacarpocarpal Joint with Nonautologous Tissue Substitute, Open Approach','aansterj@timesonline.co.uk','http://dummyimage.com/180x100.png/cc0000/ffffff','Dolgencorp Inc','771-818-1433',7),(21,'889 Lake View Court','Repair Left Inguinal Lymphatic, Percutaneous Endoscopic Approach','rashbeek@blogspot.com','http://dummyimage.com/209x100.png/cc0000/ffffff','KAISER FOUNDATION HOSPITALS','402-598-9321',18),(22,'00949 Northport Drive','Low Dose Rate (LDR) Brachytherapy of Pelvic Region using Other Isotope','bcorbenl@businessinsider.com','http://dummyimage.com/181x100.png/dddddd/000000','Benefit Cosmetics, LLC','702-219-7664',16),(23,'6 Corscot Parkway','Release Scrotum, Percutaneous Endoscopic Approach','hstovingm@domainmarket.com','http://dummyimage.com/194x100.png/5fa2dd/ffffff','Kinray Inc','460-126-4842',18),(24,'0860 Dakota Plaza','Bypass Coronary Artery, One Artery from Left Internal Mammary with Autologous Arterial Tissue, Open Approach','solearyn@posterous.com','http://dummyimage.com/152x100.png/5fa2dd/ffffff','HyVee Inc','130-236-1437',27),(25,'4109 Darwin Circle','Male Reproductive System, Replacement','bcollero@goo.gl','http://dummyimage.com/110x100.png/ff4444/ffffff','Sun Pharma Global FZE','711-939-5047',5),(26,'86 Sage Way','Dilation of Right Renal Artery with Four or More Intraluminal Devices, Percutaneous Endoscopic Approach','emartyntsevp@tinypic.com','http://dummyimage.com/179x100.png/5fa2dd/ffffff','Aphena Pharma Solutions - Tennessee, LLC','476-709-3822',25),(27,'85 Truax Plaza','Robotic Assisted Procedure of Trunk Region, Open Approach','rairdq@theatlantic.com','http://dummyimage.com/184x100.png/cc0000/ffffff','Major Pharmaceuticals','242-306-9841',20),(28,'1675 Alpine Avenue','Dilation of Right External Iliac Artery with Three Drug-eluting Intraluminal Devices, Open Approach','rdelagnesr@engadget.com','http://dummyimage.com/186x100.png/ff4444/ffffff','MedImmune, LLC','869-427-3947',7),(29,'9 Main Way','Supplement Left Knee Region with Autologous Tissue Substitute, Open Approach','jsherbournes@de.vu','http://dummyimage.com/202x100.png/cc0000/ffffff','Nostrum Laboratories Inc.','507-227-0280',5),(30,'5924 Dexter Alley','Drainage of Right Metacarpal, Percutaneous Approach','mlyddyardt@google.co.jp','http://dummyimage.com/142x100.png/5fa2dd/ffffff','Insight Pharmaceuticals','961-651-1099',19),(31,'279 Fuller Pass','Repair Right Frontal Sinus, Percutaneous Approach','eorru@pagesperso-orange.fr','http://dummyimage.com/135x100.png/dddddd/000000','BCM Cosmetique SAS','851-917-9933',11),(32,'63 Brentwood Crossing','Decompression, Circulatory, Single','sburgisiv@sciencedirect.com','http://dummyimage.com/229x100.png/dddddd/000000','Amerisource Bergen','604-805-3547',9),(33,'25 Dottie Junction','Insertion of Radioactive Element into Lower Back, Percutaneous Endoscopic Approach','fheitzw@jiathis.com','http://dummyimage.com/193x100.png/5fa2dd/ffffff','Proficient Rx LP','284-378-8412',7),(34,'6 Mockingbird Road','Transfer Left Foot Tendon, Open Approach','ttroppmannx@printfriendly.com','http://dummyimage.com/190x100.png/ff4444/ffffff','VENTURA INTERNATIONAL LTD','499-798-7284',30),(35,'685 Laurel Center','Dilation of Right Vertebral Artery, Bifurcation, with Two Drug-eluting Intraluminal Devices, Percutaneous Approach','akonigy@linkedin.com','http://dummyimage.com/188x100.png/ff4444/ffffff','Bryant Ranch Prepack','635-514-6664',30),(36,'49184 Sugar Lane','Fusion of Left Metatarsal-Tarsal Joint with Synthetic Substitute, Open Approach','fnobesz@instagram.com','http://dummyimage.com/235x100.png/ff4444/ffffff','MGS Group Limited','365-633-6281',16),(37,'44 Talmadge Drive','Release Lower Esophagus, Percutaneous Approach','clawday10@reference.com','http://dummyimage.com/143x100.png/ff4444/ffffff','Pharmadel LLC','984-322-3047',12),(38,'4 Pine View Trail','Supplement Right Peroneal Artery with Autologous Tissue Substitute, Percutaneous Endoscopic Approach','tbearblock11@wisc.edu','http://dummyimage.com/171x100.png/ff4444/ffffff','Galen US Incorporated','486-210-1798',15),(39,'83911 Ohio Hill','Osteopathic Treatment of Lower Extremities using Muscle Energy-Isotonic Forces','alygo12@boston.com','http://dummyimage.com/231x100.png/dddddd/000000','QUALITY CHOICE (Chain Drug Marketing Association)','516-825-9232',2),(40,'9 Mosinee Center','Repair Atrial Septum, Percutaneous Approach','nglyn13@wsj.com','http://dummyimage.com/230x100.png/ff4444/ffffff','Preferred Pharmaceuticals, Inc.','611-489-0600',11),(41,'327 Kingsford Pass','Removal of Drainage Device from Pancreatic Duct, Via Natural or Artificial Opening','ebathow14@wsj.com','http://dummyimage.com/177x100.png/dddddd/000000','Terumo Corporation','120-905-6283',12),(42,'53507 Derek Hill','Drainage of Lumbar Plexus, Percutaneous Approach, Diagnostic','mworsnip15@altervista.org','http://dummyimage.com/240x100.png/ff4444/ffffff','Safeway','138-578-3493',3),(43,'0417 Hermina Point','Transfusion of Autologous Antihemophilic Factors into Peripheral Vein, Percutaneous Approach','echin16@loc.gov','http://dummyimage.com/247x100.png/5fa2dd/ffffff','PD-Rx Pharmaceuticals, Inc.','756-113-1636',19),(44,'18518 Buhler Alley','Replacement of Left Thumb Phalanx with Nonautologous Tissue Substitute, Percutaneous Approach','hwilbraham17@pagesperso-orange.fr','http://dummyimage.com/121x100.png/dddddd/000000','Boehringer Ingelheim Pharmaceuticals, Inc.','294-622-3271',13),(45,'0909 Union Pass','Drainage of Small Intestine with Drainage Device, Via Natural or Artificial Opening','wscamadin18@macromedia.com','http://dummyimage.com/208x100.png/dddddd/000000','Space Brands Limited','794-498-6238',30),(46,'7961 Forest Point','Repair Cervical Plexus, Percutaneous Endoscopic Approach','pclaybourn19@unicef.org','http://dummyimage.com/165x100.png/ff4444/ffffff','McKesson Contract Packaging','307-264-5803',15),(47,'67879 Gulseth Terrace','Replacement of Right Acetabulum with Nonautologous Tissue Substitute, Percutaneous Approach','mdellit1a@com.com','http://dummyimage.com/105x100.png/ff4444/ffffff','H E B','106-753-9813',28),(48,'5215 Drewry Crossing','Dilation of Right Hand Artery with Four or More Drug-eluting Intraluminal Devices, Open Approach','afirth1b@seattletimes.com','http://dummyimage.com/126x100.png/dddddd/000000','NOVANA MEDICAL LLC','562-463-5692',17),(49,'124 Pine View Junction','Release Left Lower Leg Tendon, External Approach','ccroan1c@ovh.net','http://dummyimage.com/248x100.png/ff4444/ffffff','Lake Erie Medical DBA Quality Care Products LLC','326-714-2144',13),(50,'58 Merchant Court','Destruction of Right Middle Lobe Bronchus, Percutaneous Endoscopic Approach','hgerling1d@a8.net','http://dummyimage.com/119x100.png/dddddd/000000','Target Corporation','783-588-5668',2),(51,'8 Ridge Oak Lane','Supplement Intracranial Artery with Nonautologous Tissue Substitute, Open Approach','lcrickmore1e@usnews.com','http://dummyimage.com/169x100.png/5fa2dd/ffffff','Dr. Waltons, Incorporated','251-921-0160',18),(52,'0420 Veith Pass','Ultrasonography of Inferior Vena Cava, Guidance','sduckwith1f@usatoday.com','http://dummyimage.com/119x100.png/dddddd/000000','McKesson Packaging Services a business unit of McKesson Corporation','973-657-2066',9),(53,'59259 Kenwood Pass','Bypass Left Kidney Pelvis to Ileocutaneous with Autologous Tissue Substitute, Percutaneous Endoscopic Approach','acosti1g@twitpic.com','http://dummyimage.com/200x100.png/cc0000/ffffff','Qualitest Pharmaceuticals','304-675-2219',5),(54,'307 Oak Valley Alley','Pheresis of Plasma, Single','jgarfield1h@indiatimes.com','http://dummyimage.com/107x100.png/cc0000/ffffff','West-ward Pharmaceutical Corp','917-482-9362',2),(55,'959 Dixon Trail','Release Left Upper Eyelid, Open Approach','fhonnan1i@aboutads.info','http://dummyimage.com/133x100.png/ff4444/ffffff','REMEDYREPACK INC.','223-837-9758',11),(56,'2706 Ridgeway Road','Excision of Left Upper Leg Muscle, Percutaneous Approach, Diagnostic','vkeenlayside1j@php.net','http://dummyimage.com/223x100.png/dddddd/000000','Apotheca Company','404-594-0099',26),(57,'9 International Avenue','Removal of Intermittent Pressure Device on Left Toe','mbooy1k@statcounter.com','http://dummyimage.com/223x100.png/dddddd/000000','Dr. Reddy\'s Laboratories Limited','268-222-4097',16),(58,'15913 Johnson Road','Revision of Drainage Device in Trachea, Percutaneous Approach','emarklin1l@wikimedia.org','http://dummyimage.com/213x100.png/5fa2dd/ffffff','Eli Lilly and Company','202-428-3363',24),(59,'4 Ridge Oak Park','Alteration of Left Upper Leg with Synthetic Substitute, Percutaneous Approach','bleathem1m@sciencedaily.com','http://dummyimage.com/244x100.png/ff4444/ffffff','Jubilant HollisterStier LLC','394-474-0745',10),(60,'0 Meadow Valley Hill','Excision of Left Sternoclavicular Joint, Percutaneous Approach, Diagnostic','cmcgookin1n@statcounter.com','http://dummyimage.com/185x100.png/dddddd/000000','PD-Rx Pharmaceuticals, Inc.','974-281-4180',7);
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medical_facilities`
--

DROP TABLE IF EXISTS `medical_facilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medical_facilities` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` enum('CLINIC','HOSPITAL') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical_facilities`
--

LOCK TABLES `medical_facilities` WRITE;
/*!40000 ALTER TABLE `medical_facilities` DISABLE KEYS */;
INSERT INTO `medical_facilities` VALUES (1,'CVS Pharmacy','HOSPITAL'),(2,'H E B','HOSPITAL'),(3,'Fischer Pharmaceuticals Ltd','HOSPITAL'),(4,'Nelco Laboratories, Inc.','CLINIC'),(5,'Lake Erie Medical DBA Quality Care Products LLC','CLINIC'),(6,'Shield Line LLC','CLINIC'),(7,'Ventura Corporation LTD','HOSPITAL'),(8,'Aidarex Pharmaceuticals LLC','CLINIC'),(9,'Larasan Pharmaceutical Corporation','HOSPITAL'),(10,'PD-Rx Pharmaceuticals, Inc.','HOSPITAL'),(11,'AbbVie Inc.','CLINIC'),(12,'Northstar Rx LLC','CLINIC'),(13,'Parfums Christian Dior','CLINIC'),(14,'Hospira, Inc.','CLINIC'),(15,'Cardinal Health','CLINIC'),(16,'Neutrogena Corporation','CLINIC'),(17,'American Sales Company','CLINIC'),(18,'7-Eleven','CLINIC'),(19,'Kroger','CLINIC'),(20,'Shopko Stores Operating Co., LLC','CLINIC'),(21,'American Health Packaging','CLINIC'),(22,'Jazz Pharmaceuticals, Inc.','CLINIC'),(23,'Health Care Products','CLINIC'),(24,'ALK-Abello, Inc.','CLINIC'),(25,'Nelco Laboratories, Inc.','CLINIC'),(26,'ARMY AND AIR FORCE EXCHANGE SERVICE','CLINIC'),(27,'Physicians Total Care, Inc.','HOSPITAL'),(28,'Major Pharmaceuticals','CLINIC'),(29,'Kroger Company','HOSPITAL'),(30,'BJWC','HOSPITAL');
/*!40000 ALTER TABLE `medical_facilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `date_of_birth` date NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `gender` bit(1) NOT NULL,
  `img_url` varchar(255) DEFAULT 'none.jpg',
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE') NOT NULL,
  `username` varchar(255) NOT NULL,
  `role_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKmyobm1tnc2tqmyk2fxl8ujpfj` (`username`),
  KEY `FKpppkfarbu7vd9ib0b5m4hxsmf` (`role_id`),
  CONSTRAINT `FKpppkfarbu7vd9ib0b5m4hxsmf` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (1,'Suite 59','1985-08-25','dspeachley0@alibaba.com',_binary '','none.jpg','Dun Speachley','$2a$04$UmjvIONHV74KSqgN.IIkf.WBVcSxaJWis2QDp2ydEl/F0ieZ75vQC','549-785-3771','INACTIVE','dspeachley0',1),(2,'Room 828','1984-05-01',NULL,_binary '\0','none.jpg','Maurizio Worlidge','$2a$04$.9y0LuFK5OssIud6l1Spqux3kjSl2PmZ3eENRTboulLDrybLtZ6O2',NULL,'ACTIVE','mworlidge1',1),(3,'20th Floor','1983-06-16','dsissot2@wsj.com',_binary '','none.jpg','Dyann Sissot','$2a$04$N/5Ty/QvEMYAExfauZFKq.9HE1J.45CAHOep71pj1y/lzx3avs0Hq','633-297-4589','ACTIVE','dsissot2',1),(4,'Apt 300','1993-06-18','chabbes3@cdc.gov',_binary '','none.jpg','Carlyle Habbes','$2a$04$Z3.XOYKMrtjAt2cN0kLEs.VcdT6O4ypkMFABoiCjrZnK7XIi1Rw3O','126-178-6909','INACTIVE','chabbes3',1),(5,NULL,'1982-02-06','lvedishchev4@hexun.com',_binary '\0','none.jpg','Lloyd Vedishchev','$2a$04$X707ifjF96EuFMaw10h7seVB/djPPQpyVBbV7w5NPoOIM2kWIwUmK','791-908-5611','INACTIVE','lvedishchev4',1),(6,NULL,'1997-01-11','etithecott5@squarespace.com',_binary '\0','none.jpg','Eve Tithecott','$2a$04$PsREi5pUcUV7kUgkOfyd1.GlB4iVH/Trboj9BWQ7ObLpTCgOswlOS','550-906-5752','INACTIVE','etithecott5',1),(7,'PO Box 43847','1991-12-29','aingraham6@marketwatch.com',_binary '\0','none.jpg','Alexandr Ingraham','$2a$04$zPEYDRTxdDlcjC0ykaJ15.cqVsgBY/pvQLvcsnTj4zBhBgl5smusK',NULL,'ACTIVE','aingraham6',1),(8,NULL,'1999-05-11','ydenny7@craigslist.org',_binary '','none.jpg','Yorker Denny','$2a$04$e5vj5I/zOb9bgc/VXXHNxuqgNEea7LQu4lBxjVxXihN727sW/8B2C','869-178-5165','INACTIVE','ydenny7',1),(9,'Room 1292','1993-05-31','lcutler8@europa.eu',_binary '\0','none.jpg','Lorena Cutler','$2a$04$keDcAN1N0.Kr7zRUFIHYWeJ6YHA4XmWuqY86kMSQhr9qIhz1uRw6a','431-697-3435','INACTIVE','lcutler8',1),(10,'Suite 9','1995-06-01',NULL,_binary '','none.jpg','Kyle Cankett','$2a$04$uAtdgPWWGozK65E7hNhfausXDz4AXV5JrD42eTwA5aPPIx3wha7WC','580-242-7514','ACTIVE','kcankett9',1),(11,NULL,'1987-07-31',NULL,_binary '\0','none.jpg','Mathilda O\'Siaghail','$2a$04$VUImg0YHZze96dslvZb4iOVSNlQIpcQuZ.2/NgAgmaeNrzaVNa1DW',NULL,'INACTIVE','mosiaghaila',1),(12,NULL,'1995-05-03',NULL,_binary '','none.jpg','Jeniffer Ince','$2a$04$EFJAWlHT/ltdYKnHks7KKOfFjDLBl7litsS7vlSIriiMIYCmXl9Eu','268-948-4835','INACTIVE','jinceb',1),(13,'Room 1195','1998-01-10',NULL,_binary '\0','none.jpg','Kellsie Kettlesting','$2a$04$psJ28SXkZ9185HNuQuhUH.cOJPvcWz2mhBt.JG1IArDsaw0xL8wmK',NULL,'INACTIVE','kkettlestingc',1),(14,NULL,'1992-10-26',NULL,_binary '','none.jpg','Godart Keppy','$2a$04$kaR.J8Q9cZ6MbCA7Bg3h/u3hZ6ewCICW3hdWCW9SMhYukztSkSA.S',NULL,'ACTIVE','gkeppyd',1),(15,'11th Floor','1996-11-04','sscritche@omniture.com',_binary '\0','none.jpg','Sabine Scritch','$2a$04$WT3tCoc9g0qv8ubc1Op4WeD1dsPeXiOqnEZ/3dr2LdQ0af1RVDAb6','452-457-2285','INACTIVE','sscritche',1),(16,'Suite 40','1999-04-08','aanscombef@biglobe.ne.jp',_binary '\0','none.jpg','Aeriela Anscombe','$2a$04$TWjPe3i4FM5Q9TyRszPUBeryMXh.Xi8U.v0RbKD3dblj8KyOHQng6','585-573-1198','ACTIVE','aanscombef',1),(17,'PO Box 5468','1997-01-11','ifleethamg@miibeian.gov.cn',_binary '','none.jpg','Iorgos Fleetham','$2a$04$myL13mGLwWJmnA9hMDDb9OMaBGbJrK6utEyG1c5pAbL6gBY8qCyqG','739-769-7265','INACTIVE','ifleethamg',1),(18,'16th Floor','1997-07-13','chessh@techcrunch.com',_binary '\0','none.jpg','Codie Hess','$2a$04$MZXoF0brC.n.MzWXMLlZoensnwNKs0HAmYoERu7McR6JevBPdUa/O','594-561-7945','ACTIVE','chessh',1),(19,'10th Floor','1985-02-28',NULL,_binary '\0','none.jpg','Marje Bondesen','$2a$04$JeOZ1FNuK0C.lOql..z1w.itMhaF57PJGWJkv9ZjE1kTGcPXCGBJW','596-840-8116','INACTIVE','mbondeseni',1),(20,NULL,'1987-05-24','emclanej@biglobe.ne.jp',_binary '\0','none.jpg','Emeline McLane','$2a$04$dJICcR3MmSgmKlwWtvRRZuxh/M6wmm/sZfXueBuVJzLCC9ucKGHtO',NULL,'ACTIVE','emclanej',1);
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `result_images`
--

DROP TABLE IF EXISTS `result_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `result_images` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `result_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1002inerfi88y7c9k8tisckxk` (`result_id`),
  CONSTRAINT `FK1002inerfi88y7c9k8tisckxk` FOREIGN KEY (`result_id`) REFERENCES `results` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result_images`
--

LOCK TABLES `result_images` WRITE;
/*!40000 ALTER TABLE `result_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `result_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `results`
--

DROP TABLE IF EXISTS `results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `results` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `advice` varchar(255) DEFAULT NULL,
  `clinical_diagnosis` varchar(255) NOT NULL,
  `diagnostic_results` varchar(255) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `treatment_plan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `results`
--

LOCK TABLES `results` WRITE;
/*!40000 ALTER TABLE `results` DISABLE KEYS */;
/*!40000 ALTER TABLE `results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'PATIENT'),(2,'DOCTOR'),(3,'MANAGER'),(4,'ADMINISTRATOR');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specialties`
--

DROP TABLE IF EXISTS `specialties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `specialties` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specialties`
--

LOCK TABLES `specialties` WRITE;
/*!40000 ALTER TABLE `specialties` DISABLE KEYS */;
INSERT INTO `specialties` VALUES (1,'Y học cổ truyền'),(2,'Truyền nhiễm'),(3,'Tim mạch'),(4,'Lão khoa'),(5,'Chấn thương chỉnh hình'),(6,'Ngoại tổng quát'),(7,'Gây mê hồi sức'),(8,'Y học dự phòng'),(9,'Nội thận'),(10,'Tai - Mũi - Họng'),(11,'Nội tiết'),(12,'Tâm thần'),(13,'Hô hấp'),(14,'Xét nghiệm'),(15,'Huyết học'),(16,'Ung bướu'),(17,'Nội thần kinh'),(18,'Lao - bệnh phổi'),(19,'Ngoại thần kinh'),(20,'Y học thể thao'),(21,'Cơ xương khớp'),(22,'Sản phụ khoa'),(23,'Nhãn khoa'),(24,'Nam khoa'),(25,'Vô sinh hiếm muộn'),(26,'Ngoại tiết niệu'),(27,'Nội tổng quát'),(28,'Răng - Hàm - Mặt'),(29,'Ngoại niệu'),(30,'Dinh dưỡng'),(31,'Tiêu hoá'),(32,'Nhi khoa'),(33,'Da liễu'),(34,'Ngoại lồng ngực - mạch máu'),(35,'Chẩn đoán hình ảnh'),(36,'Ngôn ngữ trị liệu'),(37,'Phục hồi chức năng - Vật lý trị liệu'),(38,'Phẫu thuật tạo hình (Thẩm mỹ)'),(39,'Tâm lý'),(40,'Hồi sức cấp cứu');
/*!40000 ALTER TABLE `specialties` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-13 20:55:51
