CREATE DATABASE  IF NOT EXISTS `clinic_appointment` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `clinic_appointment`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: clinic_appointment
-- ------------------------------------------------------
-- Server version	8.0.39
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
  `introduce` varchar(255) NOT NULL,
  `position` varchar(255) NOT NULL,
  `years_of_experience` int NOT NULL,
  `id` bigint NOT NULL,
  `location_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKhytqmshssfmijf7a8a13ttdox` (`location_id`),
  CONSTRAINT `FKgisys6qm9qflq8w4npdhxafne` FOREIGN KEY (`id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKhytqmshssfmijf7a8a13ttdox` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctors`
--

LOCK TABLES `doctors` WRITE;
/*!40000 ALTER TABLE `doctors` DISABLE KEYS */;
INSERT INTO `doctors` VALUES ('Pain in left elbow','Phó giám đốc',14,1,1),('Burn of third degree of multiple sites of right shoulder and upper limb, except wrist and hand','Giám đốc',20,2,2),('Incarcerated fracture (avulsion) of medial epicondyle of unspecified humerus','Phó giám đốc',12,3,3),('Fibrosis due to other internal prosthetic devices, implants and grafts, initial encounter','Giám đốc',28,4,4),('Struck by skate blades, initial encounter','Bác sĩ',22,5,5),('Burn of first degree of unspecified upper arm, subsequent encounter','Giám đốc',29,6,6),('Sprain of jaw, bilateral','Phó giám đốc',12,7,7),('Calculus of gallbladder and bile duct with acute and chronic cholecystitis without obstruction','Trưởng khoa',26,8,8),('Other injury of unspecified muscles, fascia and tendons at forearm level, unspecified arm, sequela','Phó giám đốc',21,9,9),('Displaced fracture of posterior process of unspecified talus, subsequent encounter for fracture with malunion','Bác sĩ',16,10,10),('Unspecified fracture of T5-T6 vertebra, subsequent encounter for fracture with nonunion','Giám đốc',15,11,11),('Other disturbances of oral epithelium, including tongue','Phó giám đốc',12,12,12),('Passenger on bus injured in collision with unspecified motor vehicles in traffic accident, initial encounter','Giám đốc',24,13,13),('Burn of first degree of left wrist, initial encounter','Phó giám đốc',21,14,14),('Other specified injury of blood vessel of right middle finger, sequela','Giám đốc',24,15,15),('Struck by falling object on sailboat, sequela','Giám đốc',24,16,16),('Nondisplaced transverse fracture of shaft of left fibula, subsequent encounter for open fracture type I or II with malunion','Trưởng khoa',16,17,17),('Sprain of metacarpophalangeal joint of right thumb, initial encounter','Phó giám đốc',27,18,18),('Toxic effect of other insecticides, undetermined','Phó giám đốc',27,19,19),('Maternal care for high head at term, other fetus','Bác sĩ',12,20,20),('Unspecified fracture of upper end of left ulna, subsequent encounter for open fracture type I or II with routine healing','Giám đốc',30,21,21),('Displaced other extraarticular fracture of left calcaneus, sequela','Trưởng khoa',30,22,22),('Unspecified fracture of shaft of left ulna, subsequent encounter for open fracture type IIIA, IIIB, or IIIC with nonunion','Bác sĩ',23,23,23),('Other specified multiple gestation with two or more monoamniotic fetuses, unspecified trimester','Phó giám đốc',14,24,24),('Breakdown (mechanical) of vascular dialysis catheter','Trưởng khoa',25,25,25),('Insect bite (nonvenomous) of right wrist, initial encounter','Bác sĩ',15,26,26),('Unspecified superficial injury of unspecified ankle, subsequent encounter','Phó giám đốc',11,27,27),('Unspecified injury of flexor muscle, fascia and tendon of right index finger at wrist and hand level, sequela','Bác sĩ',26,28,28),('Poisoning by oxytocic drugs, assault, initial encounter','Bác sĩ',18,29,29),('Failure to introduce or to remove other tube or instrument','Trưởng khoa',13,30,30),('Other accident to other private fixed-wing aircraft injuring occupant, initial encounter','Bác sĩ',28,31,31),('Postprocedural seroma of a genitourinary system organ or structure following a genitourinary system procedure','Giám đốc',24,32,32),('Posterior cyclitis, right eye','Trưởng khoa',15,33,33),('Dieulafoy lesion of intestine','Trưởng khoa',20,34,34),('Other specified injuries of ankle and foot','Giám đốc',16,35,35),('Atherosclerosis of native arteries of other extremities with ulceration','Giám đốc',21,36,36),('Acute embolism and thrombosis of deep veins of upper extremity','Phó giám đốc',29,37,37),('Strain of extensor muscle, fascia and tendon of right index finger at wrist and hand level, initial encounter','Trưởng khoa',16,38,38),('Contact with electric knife','Phó giám đốc',13,39,39),('Daycare center childcare provider, perpetrator of maltreatment and neglect','Trưởng khoa',30,40,40),('Benign paroxysmal vertigo, bilateral','Phó giám đốc',24,41,41),('Intentional self-harm by jumping from a high place','Giám đốc',26,42,42),('Unspecified open wound of left breast, initial encounter','Bác sĩ',27,43,43),('Other specified injury of other blood vessels at wrist and hand level of unspecified arm, sequela','Bác sĩ',19,44,44),('Nondisplaced fracture of right ulna styloid process, initial encounter for open fracture type I or II','Bác sĩ',25,45,45),('Lesion of radial nerve, right upper limb','Trưởng khoa',17,46,46),('Other calcification of muscle, right hand','Phó giám đốc',28,47,47),('Barton\'s fracture of unspecified radius, subsequent encounter for open fracture type I or II with nonunion','Bác sĩ',25,48,48),('Adverse effect of monoamine-oxidase-inhibitor antidepressants','Giám đốc',14,49,49),('Acquired absence of other specified parts of digestive tract','Giám đốc',12,50,50),('Pathological fracture, other site, subsequent encounter for fracture with routine healing','Bác sĩ',28,51,51),('Aluminosis (of lung)','Giám đốc',21,52,52),('Medium chain acyl CoA dehydrogenase deficiency','Trưởng khoa',21,53,53),('Corrosion of second degree of male genital region, subsequent encounter','Phó giám đốc',12,54,54),('Other osteoporosis with current pathological fracture, femur','Bác sĩ',17,55,55),('Fracture of anterior column [iliopubic] of acetabulum','Trưởng khoa',21,56,56),('Toxic effect of nitrogen oxides, assault','Phó giám đốc',20,57,57),('Nondisplaced subtrochanteric fracture of left femur, subsequent encounter for open fracture type I or II with routine healing','Giám đốc',30,58,58),('Breakdown (mechanical) of implanted penile prosthesis, initial encounter','Giám đốc',20,59,59),('Person on outside of special agricultural vehicle injured in traffic accident, subsequent encounter','Phó giám đốc',11,60,60),('Nondisplaced comminuted supracondylar fracture without intercondylar fracture of unspecified humerus, initial encounter for open fracture','Phó giám đốc',19,61,1),('Other transitory neonatal disorders of thyroid function, not elsewhere classified','Bác sĩ',18,62,2),('Postprocedural hematoma of a respiratory system organ or structure following other procedure','Giám đốc',15,63,3),('Other specified injury of unspecified blood vessel at lower leg level, right leg, sequela','Bác sĩ',16,64,4),('Allescheriasis','Bác sĩ',28,65,5),('Unspecified open wound of unspecified front wall of thorax with penetration into thoracic cavity','Phó giám đốc',15,66,6),('Contracture of muscle, ankle and foot','Bác sĩ',14,67,7),('Displaced unspecified condyle fracture of lower end of unspecified femur, subsequent encounter for open fracture type I or II with malunion','Phó giám đốc',13,68,8),('Unspecified injury of flexor muscle, fascia and tendon of left middle finger at forearm level, sequela','Phó giám đốc',18,69,9),('Necrosis of amputation stump, left upper extremity','Giám đốc',17,70,10),('Nondisplaced dome fracture of right acetabulum','Bác sĩ',23,71,11),('Ankylosing spondylitis of cervicothoracic region','Bác sĩ',16,72,12),('Adrenomedullary hyperfunction','Trưởng khoa',28,73,13),('Corrosion of first degree of left palm, subsequent encounter','Trưởng khoa',14,74,14),('Displaced associated transverse-posterior fracture of left acetabulum, initial encounter for closed fracture','Trưởng khoa',24,75,15),('Functional intestinal disorder, unspecified','Trưởng khoa',17,76,16),('Other sprain of left shoulder joint','Trưởng khoa',26,77,17),('Laceration of extensor muscle, fascia and tendon of left ring finger at wrist and hand level, sequela','Trưởng khoa',28,78,18),('Partial traumatic metacarpophalangeal amputation of right little finger, initial encounter','Giám đốc',20,79,19),('Localized swelling, mass and lump, right upper limb','Bác sĩ',24,80,20);
/*!40000 ALTER TABLE `doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flyway_schema_history`
--

-- DROP TABLE IF EXISTS `flyway_schema_history`;
-- *!40101 SET @saved_cs_client     = @@character_set_client */;
-- /*!50503 SET character_set_client = utf8mb4 */;
-- CREATE TABLE `flyway_schema_history` (
--  `installed_rank` int NOT NULL,
--  `version` varchar(50) DEFAULT NULL,
--  `description` varchar(200) NOT NULL,
--  `type` varchar(20) NOT NULL,
--  `script` varchar(1000) NOT NULL,
--  `checksum` int DEFAULT NULL,
--  `installed_by` varchar(100) NOT NULL,
--  `installed_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
--  `execution_time` int NOT NULL,
--  `success` tinyint(1) NOT NULL,
--  PRIMARY KEY (`installed_rank`),
--  KEY `flyway_schema_history_s_idx` (`success`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
-- /*!40101 SET character_set_client = @saved_cs_client */;
--

-- Dumping data for table `flyway_schema_history`


-- LOCK TABLES `flyway_schema_history` WRITE;
-- /*!40000 ALTER TABLE `flyway_schema_history` DISABLE KEYS */;
-- INSERT INTO `flyway_schema_history` VALUES (1,'0','<< Flyway Baseline >>','BASELINE','<< Flyway Baseline >>',NULL,'root','2024-09-20 23:27:36',0,1),(2,'1','create insert trigger on patient and doctor','SQL','V1__create_insert_trigger_on_patient_and_doctor.sql',-610846377,'root','2024-09-20 23:27:37',17,1);
-- /*!40000 ALTER TABLE `flyway_schema_history` ENABLE KEYS */;
-- UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
-- Table structure for table `medical_facility_specialties`
--

DROP TABLE IF EXISTS `medical_facility_specialties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medical_facility_specialties` (
  `medical_facility_id` bigint NOT NULL,
  `specialty_id` bigint NOT NULL,
  PRIMARY KEY (`medical_facility_id`,`specialty_id`),
  KEY `FKn66fbi3ebukpy2dch8dbq8l9l` (`specialty_id`),
  CONSTRAINT `FKn66fbi3ebukpy2dch8dbq8l9l` FOREIGN KEY (`specialty_id`) REFERENCES `specialties` (`id`),
  CONSTRAINT `FKnfrlslsidso3hruy6lochpa3v` FOREIGN KEY (`medical_facility_id`) REFERENCES `medical_facilities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical_facility_specialties`
--

LOCK TABLES `medical_facility_specialties` WRITE;
/*!40000 ALTER TABLE `medical_facility_specialties` DISABLE KEYS */;
INSERT INTO `medical_facility_specialties` VALUES (6,1),(18,1),(25,1),(26,2),(6,3),(7,3),(15,3),(27,3),(14,4),(18,4),(4,5),(15,5),(20,5),(8,6),(7,7),(27,7),(30,7),(13,8),(14,8),(24,9),(1,10),(4,10),(12,10),(22,11),(25,11),(28,11),(30,11),(15,12),(28,12),(2,13),(21,13),(25,13),(8,14),(8,15),(15,15),(29,15),(16,16),(17,16),(25,16),(6,17),(9,17),(15,17),(17,17),(20,17),(7,18),(18,18),(21,18),(16,19),(30,19),(11,21),(14,21),(25,21),(27,21),(4,22),(5,22),(6,22),(14,22),(22,22),(26,22),(9,23),(28,23),(6,24),(14,24),(25,24),(26,24),(30,24),(8,25),(10,25),(14,25),(23,26),(3,27),(29,27),(10,28),(18,29),(26,29),(10,31),(13,31),(28,31),(4,32),(7,32),(2,33),(30,33),(14,34),(19,34),(22,34),(9,36),(13,36),(30,36),(8,37),(30,37),(14,38),(15,38),(30,38),(8,39),(21,39),(23,39),(9,40),(14,40),(16,40),(20,40);
/*!40000 ALTER TABLE `medical_facility_specialties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients` (
  `medical_history` varchar(255) DEFAULT NULL,
  `id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FKn8xphvlp05nd3ydg0p1rbdaom` FOREIGN KEY (`id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES ('Bilat rad neck dissect',81),('Anorectal myomectomy',82),('C & s-endocrine',83),('Pancreatic anastomosis',84),('Open sigmoidectomy NEC',85),('Opn pull-thru res rectum',86),('Toxicology-peritoneum',87),('Suture duoden ulcer site',88),('Inner ear injection',89),('Esophagoscopy NEC',90),('Referral for drug rehab',91),('Insert intestinal tube',92),('Reopen recent lap site',93),('Hepatic dx proc NEC',94),('Excision of knee NEC',95),('Total repair of tapvc',96),('Liver repair NEC',97),('Conjunctival op NEC',98),('Other tenotomy',99),('Intravenous pyelogram',100);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specialties`
--

LOCK TABLES `specialties` WRITE;
/*!40000 ALTER TABLE `specialties` DISABLE KEYS */;
INSERT INTO `specialties` VALUES (1,'Y học cổ truyền'),(2,'Truyền nhiễm'),(3,'Tim mạch'),(4,'Lão khoa'),(5,'Chấn thương chỉnh hình'),(6,'Ngoại tổng quát'),(7,'Gây mê hồi sức'),(8,'Y học dự phòng'),(9,'Nội thận'),(10,'Tai - Mũi - Họng'),(11,'Nội tiết'),(12,'Tâm thần'),(13,'Hô hấp'),(14,'Xét nghiệm'),(15,'Huyết học'),(16,'Ung bướu'),(17,'Nội thần kinh'),(18,'Lao - bệnh phổi'),(19,'Ngoại thần kinh'),(20,'Y học thể thao'),(21,'Cơ xương khớp'),(22,'Sản phụ khoa'),(23,'Nhãn khoa'),(24,'Nam khoa'),(25,'Vô sinh hiếm muộn'),(26,'Ngoại tiết niệu'),(27,'Nội tổng quát'),(28,'Răng - Hàm - Mặt'),(29,'Ngoại niệu'),(30,'Dinh dưỡng'),(31,'Tiêu hoá'),(32,'Nhi khoa'),(33,'Da liễu'),(34,'Ngoại lồng ngực - mạch máu'),(35,'Chẩn đoán hình ảnh'),(36,'Ngôn ngữ trị liệu'),(37,'Phục hồi chức năng - Vật lý trị liệu'),(38,'Phẫu thuật tạo hình (Thẩm mỹ)'),(39,'Tâm lý'),(40,'Hồi sức cấp cứu');
/*!40000 ALTER TABLE `specialties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `type` varchar(31) NOT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `date_of_birth` date NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `gender` bit(1) NOT NULL,
  `img_url` varchar(255) DEFAULT 'none.jpg',
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE') DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `role_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKr43af9ap4edm43mmtq01oddj6` (`username`),
  KEY `FKp56c1712k691lhsyewcssf40f` (`role_id`),
  CONSTRAINT `FKp56c1712k691lhsyewcssf40f` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('MANAGER',1,'81064 Bobwhite Place','1995-01-27','bsermin0@webnode.com',_binary '\0','http://dummyimage.com/112x100.png/dddddd/000000','Brucie Sermin','$2a$04$IUKKjHFZfRT9s3Gdp6FyHOTOxXxArByMmTfkcEYIDsLEd1GOu.eIi','151-975-5147','INACTIVE','bsermin0',2),('DOCTOR',2,'004 Del Sol Crossing','1994-10-28','mtourmell1@t-online.de',_binary '','http://dummyimage.com/147x100.png/dddddd/000000','Mair Tourmell','$2a$04$elftS3jII9uccstmePKq6OXBBU.qG.IGaqx5X6wrAW5esbyKe0tGi','717-840-3215','INACTIVE','mtourmell1',2),('DOCTOR',3,'18 Elmside Plaza','1999-08-13','cmarrett2@imageshack.us',_binary '\0','http://dummyimage.com/225x100.png/5fa2dd/ffffff','Cris Marrett','$2a$04$kpg3w1Wtxl7mPEjTo3AVpuFqsx9bApyjG9iFkw9fetYzXhZuA/EGy','724-164-5915','INACTIVE','cmarrett2',2),('DOCTOR',4,'34525 Parkside Avenue','2002-07-09','cvan3@jiathis.com',_binary '\0','http://dummyimage.com/181x100.png/dddddd/000000','Cammi Van Velden','$2a$04$/3dwpgeHAYKii4XE1TAIu.qZmcoWHTJN4YHBpf6TaB25KgU/zep3e','776-554-2964','ACTIVE','cvan3',3),('ADMINISTRATOR',5,'48568 Dottie Pass','2002-09-03','sbrandle4@technorati.com',_binary '\0','http://dummyimage.com/248x100.png/5fa2dd/ffffff','Sauncho Brandle','$2a$04$h9tbHjpt/WfP0NDlCdlhR.nfRgHawNFTDp0.malRwlw3r9/GybOIa','281-789-6843','ACTIVE','sbrandle4',2),('DOCTOR',6,'37 Sycamore Circle','2005-04-10','dausher5@simplemachines.org',_binary '','http://dummyimage.com/154x100.png/cc0000/ffffff','Dierdre Ausher','$2a$04$.QAkbUA2BqvCXiex/0dWr.a2IVRdmK8EWN9oY86GzZTKOKp3Jgvl2','762-120-5857','ACTIVE','dausher5',2),('MANAGER',7,'2116 Meadow Ridge Pass','1997-07-11','nedelheit6@ucsd.edu',_binary '\0','http://dummyimage.com/102x100.png/cc0000/ffffff','Nonnah Edelheit','$2a$04$lCLflbae2X8gIsqm.VVaneMHYs9NvT8B2.gOTLhQ56ws8RJBVQVuO','948-759-8549','ACTIVE','nedelheit6',2),('DOCTOR',8,'393 Novick Street','2003-08-28','tbuffy7@amazon.co.jp',_binary '\0','http://dummyimage.com/222x100.png/5fa2dd/ffffff','Thurstan Buffy','$2a$04$swNra7b7FeEZKp0OoUkHZuJhIZyrdLRwUwMsqninpnqYjGKMlGxpu','654-368-1239','INACTIVE','tbuffy7',1),('DOCTOR',9,'0 Annamark Drive','1996-08-03','wkinane8@last.fm',_binary '','http://dummyimage.com/171x100.png/dddddd/000000','Waldemar Kinane','$2a$04$N1UPfePyYirHFYadmM7Qx.9o0skjSXWiNubeHMxqx7efo4zTlX5pu','103-755-9007','ACTIVE','wkinane8',4),('ADMINISTRATOR',10,'829 Waxwing Court','2000-06-15','kwoolmore9@networksolutions.com',_binary '','http://dummyimage.com/125x100.png/5fa2dd/ffffff','Kaleena Woolmore','$2a$04$Ht9Z6JSZntmDnbw7cywPRevBImOgBoKUm/vDx/BA9YA6/R8Rijqw2','880-781-4948','INACTIVE','kwoolmore9',4),('PATIENT',11,'8 Havey Point','2004-06-07','yhawkena@nyu.edu',_binary '','http://dummyimage.com/213x100.png/cc0000/ffffff','Yuri Hawken','$2a$04$mbxIilZIsL5ICnNAGS67QOt8fbPmDXtF/wHumsapJxE/rNkh0aZ/a','399-321-2235','INACTIVE','yhawkena',2),('DOCTOR',12,'8 Reinke Parkway','1990-10-27','chartasb@so-net.ne.jp',_binary '\0','http://dummyimage.com/171x100.png/dddddd/000000','Coletta Hartas','$2a$04$fn6BR8VVeRqJAzA2aRlJS.ujhfGHZchRBz3wusaq5UGi3YlIHYPJO','306-645-5807','ACTIVE','chartasb',2),('DOCTOR',13,'3 Huxley Circle','1999-08-21','rpellantc@imageshack.us',_binary '\0','http://dummyimage.com/158x100.png/ff4444/ffffff','Roger Pellant','$2a$04$0D2xk.HFBioHHFZkTj.ykudFl8EWP0eaTm8PR7HJNECsoj/oAle6O','802-431-7762','INACTIVE','rpellantc',4),('DOCTOR',14,'79723 Nevada Way','2001-09-23','kduckeringd@sphinn.com',_binary '','http://dummyimage.com/188x100.png/dddddd/000000','Kathie Duckering','$2a$04$NHiOmLE/YZXCoQvl1QLu3ul/8uaGHBYm1y3IHykKPNHXlKSQRxLla','436-452-1850','ACTIVE','kduckeringd',1),('DOCTOR',15,'90448 Mallard Terrace','2002-03-21','nhoneyghane@nsw.gov.au',_binary '','http://dummyimage.com/194x100.png/ff4444/ffffff','Nathanial Honeyghan','$2a$04$IQshE2NyvZO8DgNo0Y8ZlukACCuw7T23uDRyh7.miOFf0RmZw1PKq','270-288-0652','ACTIVE','nhoneyghane',1),('DOCTOR',16,'8 Eagle Crest Court','2004-06-02','dalthorpef@goo.gl',_binary '','http://dummyimage.com/167x100.png/5fa2dd/ffffff','Dotti Althorpe','$2a$04$tOITWsFCaBprMsOrN/h0L.E8anK6elTCrGRMflQuNbX/nnQmyIe9a','381-563-6523','ACTIVE','dalthorpef',2),('PATIENT',17,'31 Lotheville Crossing','1991-09-19','lyokelmang@illinois.edu',_binary '\0','http://dummyimage.com/249x100.png/cc0000/ffffff','Letti Yokelman','$2a$04$M2y1yPqtSO0EOovptxxuL.d2Gi0uV8vWIWAXVxwORWRZX89YQR3NS','646-854-6106','ACTIVE','lyokelmang',2),('PATIENT',18,'89 Luster Road','2004-01-27','pnorewoodh@wordpress.org',_binary '\0','http://dummyimage.com/238x100.png/dddddd/000000','Puff Norewood','$2a$04$5x.eC7UtHyBbVSTtX.lUJOgun440Cl1fcp6lj000WbTxnK4okTUuO','686-157-9867','ACTIVE','pnorewoodh',1),('PATIENT',19,'1 Vernon Place','1998-11-18','konolandi@networksolutions.com',_binary '','http://dummyimage.com/110x100.png/dddddd/000000','Kelcey O\'Noland','$2a$04$1.tuvi0qEKEXgHTJ40QSGeNtCF1XFPnWyVFHgFpttPuiStK4w.NJa','468-346-8057','INACTIVE','konolandi',2),('PATIENT',20,'0 Iowa Hill','2004-03-06','gharsesj@jimdo.com',_binary '','http://dummyimage.com/196x100.png/dddddd/000000','Gibby Harses','$2a$04$N.MuwcGPnGnSR.PpfWauxuRgu.EmKd0qV0F/DL3YzyQX2XWY.eyuy','943-652-6743','INACTIVE','gharsesj',3),('PATIENT',21,'7 Oak Circle','1999-07-16','kjanatkak@angelfire.com',_binary '','http://dummyimage.com/191x100.png/cc0000/ffffff','Kleon Janatka','$2a$04$fmKnruwUJ4ZY24mtnr9bk.n0ozhlpuWZyeLT3UAPxyC.GeYBi8JQS','616-230-8467','ACTIVE','kjanatkak',3),('MANAGER',22,'6 Waubesa Park','1998-07-13','gsaffonl@yellowbook.com',_binary '\0','http://dummyimage.com/153x100.png/cc0000/ffffff','Graham Saffon','$2a$04$DdKlGybhdC9W.auWMOqW9eAdGOHMLqkCx0ldWwZmHGlWF1SMBkEqy','149-923-5364','ACTIVE','gsaffonl',1),('DOCTOR',23,'426 Ryan Circle','1997-10-31','sallchinm@networkadvertising.org',_binary '','http://dummyimage.com/206x100.png/5fa2dd/ffffff','Shelden Allchin','$2a$04$Zo2lVnImhJZ.FO7Hr4w9w.UPyEpwnxJLN4CmAQb2GtSaGkXeaDM6C','147-974-1871','ACTIVE','sallchinm',4),('PATIENT',24,'7 Duke Terrace','1993-06-16','lsaladinon@naver.com',_binary '\0','http://dummyimage.com/237x100.png/dddddd/000000','Layne Saladino','$2a$04$WL/SlilogsBae7nm/LnjfewOJZOKp4t2r3h6MJmawiJwHGtB40ODO','218-875-8760','ACTIVE','lsaladinon',1),('MANAGER',25,'8844 Swallow Center','1998-01-14','hwillshawo@taobao.com',_binary '','http://dummyimage.com/203x100.png/5fa2dd/ffffff','Hedvige Willshaw','$2a$04$eZu9DL0olaDH2exAw.eF4eesKr28bNfooidApKWoLaDTeSkPMy2xa','325-328-9304','INACTIVE','hwillshawo',2),('DOCTOR',26,'76 Merrick Terrace','1995-03-19','agrangep@sourceforge.net',_binary '','http://dummyimage.com/130x100.png/5fa2dd/ffffff','Ag Grange','$2a$04$Os93ud4ChMJtLyAce3yDZeWpgsx0lDNps6WppDTGBKTWBvQ1X9Jmy','482-814-8321','INACTIVE','agrangep',2),('PATIENT',27,'173 Nancy Hill','2002-09-24','bgrahlmansq@squidoo.com',_binary '','http://dummyimage.com/243x100.png/cc0000/ffffff','Benedicta Grahlmans','$2a$04$S8EXiXeTn/05GbI12kw7Yu8WdyEHbxAlF.rhMCgHA3IFc7r65kYTm','418-835-7729','ACTIVE','bgrahlmansq',1),('DOCTOR',28,'371 Elka Court','1995-10-25','leasunr@microsoft.com',_binary '','http://dummyimage.com/242x100.png/cc0000/ffffff','Lorelle Easun','$2a$04$GJhkIJ0sfmGCPpsiCjnSU.164102Mi3hO.Z6Wk0fN5L4re4p8NFgW','764-478-0526','INACTIVE','leasunr',1),('PATIENT',29,'2 Twin Pines Park','1998-02-27','bhaacks@mozilla.org',_binary '','http://dummyimage.com/246x100.png/5fa2dd/ffffff','Barbie Haack','$2a$04$echnGJodF2dycfFdvXzy0Ozfz7I.gkRXsayLafSj6LRw2JRXuC9/y','889-101-5541','ACTIVE','bhaacks',2),('DOCTOR',30,'8427 Karstens Crossing','1994-01-08','rbenettinit@studiopress.com',_binary '\0','http://dummyimage.com/245x100.png/5fa2dd/ffffff','Roseanna Benettini','$2a$04$5Jz0mpol.I4XswKTuiZ6EeWzBnKrBRocVJEPnAHzOFvgNC2qpXLDq','259-649-2366','ACTIVE','rbenettinit',1),('DOCTOR',31,'20 Graedel Center','1994-01-27','akillgusu@tinyurl.com',_binary '\0','http://dummyimage.com/185x100.png/cc0000/ffffff','Arnuad Killgus','$2a$04$pR10ve5GqIGUyTMP5mGs0O1vuJx2NS6e6pH.9QBdxt4cbNzXRRTdS','733-516-1943','ACTIVE','akillgusu',2),('DOCTOR',32,'162 Loomis Crossing','2003-08-09','afinnv@hatena.ne.jp',_binary '','http://dummyimage.com/224x100.png/cc0000/ffffff','Antonia Finn','$2a$04$QfzMMr7vKrJnosURiOqZVOWG3o2wOTrWGkUGjE86L32VMpSWx.vfS','322-731-5914','INACTIVE','afinnv',3),('DOCTOR',33,'57 Grover Plaza','1992-11-21','gbarusw@artisteer.com',_binary '','http://dummyimage.com/133x100.png/5fa2dd/ffffff','Gregor Barus','$2a$04$pt2q1d0DmBDOc/ND.5AI9emYf89KEqccpfNpkDTGdifkvv1j8z8u2','847-179-6924','ACTIVE','gbarusw',1),('PATIENT',34,'31595 Darwin Parkway','2004-09-30','ethravesx@lycos.com',_binary '\0','http://dummyimage.com/121x100.png/5fa2dd/ffffff','Elsa Thraves','$2a$04$so2R8a3bv4HbIiTnH9zTZ.PCeGDuQlndMDImVIuToJ8ujTZ5ZyOAm','325-306-2577','INACTIVE','ethravesx',1),('PATIENT',35,'993 Pierstorff Lane','1996-12-07','agallahuey@youtube.com',_binary '','http://dummyimage.com/103x100.png/5fa2dd/ffffff','Aloisia Gallahue','$2a$04$lpLuV2UgmD2g9sVz/SGKKueRvmdWbEsRtxnVjNVr/ivqFRfcTYoKe','764-315-6892','ACTIVE','agallahuey',1),('MANAGER',36,'6 Glendale Junction','2004-05-03','gfillgatez@ed.gov',_binary '','http://dummyimage.com/187x100.png/ff4444/ffffff','Gracie Fillgate','$2a$04$GPhGb9m3Z.i5FJHnTdMYBert3snN1/1ab7Sarl4uliRAglGiImj6q','215-807-6059','ACTIVE','gfillgatez',2),('ADMINISTRATOR',37,'9 Bobwhite Place','1993-08-13','ccinelli10@tripadvisor.com',_binary '\0','http://dummyimage.com/152x100.png/cc0000/ffffff','Candide Cinelli','$2a$04$4/MZfD2u.uQTKFSt2TfpN.LgHceNxxYrXHRlZ9s8iESYdw45KeyBK','498-670-3635','ACTIVE','ccinelli10',2),('DOCTOR',38,'856 Sullivan Center','1993-09-10','abussey11@bbb.org',_binary '','http://dummyimage.com/127x100.png/5fa2dd/ffffff','Alwyn Bussey','$2a$04$GuyM4SugExPo.U.Ym6J.uuXHUmhLlUk2eu57qlITzLMfHHd4/X0gq','239-631-0559','ACTIVE','abussey11',2),('DOCTOR',39,'9875 Spohn Street','1993-06-18','achidlow12@tumblr.com',_binary '\0','http://dummyimage.com/110x100.png/cc0000/ffffff','Alyosha Chidlow','$2a$04$sThxjN.31P6XyJ17mBFgNutrU7jmnsrs9yND7zOnV6q1ldvfI1SrS','117-145-7323','ACTIVE','achidlow12',2),('PATIENT',40,'60 Maple Way','1999-11-06','abrach13@auda.org.au',_binary '','http://dummyimage.com/221x100.png/cc0000/ffffff','Arty Brach','$2a$04$9p84fRj6DXSPgfWqWAlPbOsYWSlal2Vx0tNm2lDotrX6D5NXxWJGK','165-843-3961','ACTIVE','abrach13',1),('MANAGER',41,'8081 Bashford Junction','1992-09-05','jvecard14@unc.edu',_binary '\0','http://dummyimage.com/232x100.png/5fa2dd/ffffff','Julia Vecard','$2a$04$6EApSCgrKlTqZac7DlRK5.dBieTsFTG3gsLqdvdltlKjAndVMbwRm','769-201-1730','ACTIVE','jvecard14',2),('DOCTOR',42,'946 Annamark Place','1996-07-24','dquigg15@amazon.com',_binary '','http://dummyimage.com/146x100.png/5fa2dd/ffffff','Dennison Quigg','$2a$04$ACabcVH/zt17vmjcn.643O9lfb5Hl6MZz5Kmn/AOwz4szzOtc1smW','340-818-7227','ACTIVE','dquigg15',4),('DOCTOR',43,'9373 Myrtle Terrace','2000-04-30','bweson16@princeton.edu',_binary '','http://dummyimage.com/198x100.png/5fa2dd/ffffff','Benjy Weson','$2a$04$mT1qKZCdFBB5cNUl7iL3ieC8BisSjt7K2fuSZiHZHYbW/v3tCw7tC','143-773-1069','INACTIVE','bweson16',1),('DOCTOR',44,'459 Scofield Court','1991-04-10','bkidgell17@illinois.edu',_binary '','http://dummyimage.com/163x100.png/ff4444/ffffff','Brigg Kidgell','$2a$04$2gPDLmnLZz0A4m17XeG.PuqSAZWYxn7.Wl62HzKm8Z9EDiew./ju.','770-864-5922','INACTIVE','bkidgell17',2),('PATIENT',45,'3 Amoth Pass','2003-04-04','tkitchen18@smugmug.com',_binary '','http://dummyimage.com/122x100.png/ff4444/ffffff','Terrel Kitchen','$2a$04$4rjnHL7c6vWyc0lH/Z8Xze5lxfRl4wMstbMRKAjTVEQN1awQaokyW','548-520-5739','ACTIVE','tkitchen18',2),('DOCTOR',46,'1438 Sugar Pass','1996-04-24','aniess19@nymag.com',_binary '','http://dummyimage.com/204x100.png/dddddd/000000','Arni Niess','$2a$04$IgsuEXOz7YmZ0ZBePFVS0.7FYnR7ZW.oCRLL0kHZG751JgMsG0y/a','226-960-6347','ACTIVE','aniess19',2),('PATIENT',47,'078 Scott Alley','1992-07-08','jdrepp1a@auda.org.au',_binary '\0','http://dummyimage.com/164x100.png/ff4444/ffffff','Jase Drepp','$2a$04$rGsJn8tjKtQ2ZjKH8aQnnuI19K8apLtEJENqdGeMt0qybop8Mi99i','648-843-2238','ACTIVE','jdrepp1a',2),('DOCTOR',48,'5 Crest Line Trail','2002-07-07','sdennison1b@4shared.com',_binary '\0','http://dummyimage.com/112x100.png/ff4444/ffffff','Smitty Dennison','$2a$04$iAmfxe5YXjkNwz/uuRCrreyuWPE9jgyYLR5glnrbfIJz4UeXbWPpq','130-813-5999','INACTIVE','sdennison1b',4),('DOCTOR',49,'78030 Namekagon Point','1991-05-05','cblaze1c@independent.co.uk',_binary '','http://dummyimage.com/236x100.png/ff4444/ffffff','Charley Blaze','$2a$04$D3VSunHhESJGyoVzvNALH.6VdQD7ZKgo59EY1JovROgtxldyZik02','555-381-0584','ACTIVE','cblaze1c',2),('DOCTOR',50,'9571 Pearson Trail','1992-10-26','fmillgate1d@slideshare.net',_binary '','http://dummyimage.com/142x100.png/5fa2dd/ffffff','Flory Millgate','$2a$04$khCuD61OMDPRdb3rMdaMIub6qQtlzPBEuWChq8g8QoauRAoLpXJVq','651-529-3924','ACTIVE','fmillgate1d',2),('DOCTOR',51,'147 Barnett Parkway','2002-08-10','bfairbourne1e@paginegialle.it',_binary '','http://dummyimage.com/199x100.png/5fa2dd/ffffff','Boothe Fairbourne','$2a$04$GBVGBBvkmonlEEyv64Ym1OssvT7Q6SyOD9wlA9sE2bMqdxbvaLdCO','312-821-8374','ACTIVE','bfairbourne1e',2),('ADMINISTRATOR',52,'3048 Mitchell Road','2000-01-07','nmoyes1f@cafepress.com',_binary '\0','http://dummyimage.com/103x100.png/cc0000/ffffff','Nate Moyes','$2a$04$7bjZNhrVB24yQt/vVh/vmOXdSsz/MVFLBY4wqa3VeZFXy0/gBueUi','225-238-0468','INACTIVE','nmoyes1f',1),('MANAGER',53,'14615 Clemons Avenue','2002-09-29','cramet1g@spotify.com',_binary '','http://dummyimage.com/114x100.png/dddddd/000000','Caralie Ramet','$2a$04$Bbq/VicdYhXLRJe6ahqd7OBAqqdEPBvaHNRElfky8GEq8E.WYa0Ia','501-352-9444','ACTIVE','cramet1g',2),('PATIENT',54,'954 Pierstorff Place','2002-06-13','rconahy1h@hexun.com',_binary '','http://dummyimage.com/147x100.png/5fa2dd/ffffff','Rodi Conahy','$2a$04$scTROtUBzxSwTJ.WzTZdW.vWE13rpaqL7K1W5bKNEwcDlDOEEsdcm','320-293-1728','ACTIVE','rconahy1h',4),('DOCTOR',55,'62419 Brown Place','2002-02-14','sgeggie1i@bloomberg.com',_binary '','http://dummyimage.com/169x100.png/5fa2dd/ffffff','Sherman Geggie','$2a$04$TNGsw4ddOxDl4qe9D.yZXui/QZGXe8hsT2KQfwiUxyLec.j.pkd5S','375-593-4270','ACTIVE','sgeggie1i',2),('DOCTOR',56,'102 Morrow Trail','1992-08-15','bgiraudy1j@sciencedaily.com',_binary '\0','http://dummyimage.com/243x100.png/dddddd/000000','Brandy Giraudy','$2a$04$KgjoRjRwDiJDTxcPiiBsZeRx4eW6hSnWdZOZ.OBHcWAfLRyLB35ZK','174-593-9145','ACTIVE','bgiraudy1j',3),('DOCTOR',57,'38640 South Point','2001-05-31','ghunnaball1k@forbes.com',_binary '','http://dummyimage.com/202x100.png/cc0000/ffffff','Gunner Hunnaball','$2a$04$CWlB7tpEEyfoZTl.Et3/vOIx8jHnr.mp65Ld5dKhmgdnaA.VHUUwe','592-942-6518','INACTIVE','ghunnaball1k',1),('DOCTOR',58,'91701 Bashford Terrace','1991-02-08','lsunnucks1l@technorati.com',_binary '','http://dummyimage.com/214x100.png/dddddd/000000','Lenard Sunnucks','$2a$04$JMNS0MYbfGX0U3ZlQwlOx.kOU/w/1xMRY8k8vZrC6WRP5HJKUfIw6','434-952-0010','ACTIVE','lsunnucks1l',4),('MANAGER',59,'62850 Dakota Point','1993-06-08','rheliet1m@privacy.gov.au',_binary '','http://dummyimage.com/131x100.png/5fa2dd/ffffff','Roslyn Heliet','$2a$04$vAvJb4jqfRLO/5VclwILi.Lkzwkx7u4a1NzTuNUw6cO3yPeBPKXd6','428-624-1335','ACTIVE','rheliet1m',4),('DOCTOR',60,'4283 Veith Plaza','2000-07-18','gpaschke1n@smh.com.au',_binary '\0','http://dummyimage.com/173x100.png/dddddd/000000','Gino Paschke','$2a$04$VHAVaOdWlSkXdLfL9pfo1OtUcnZdqICfGchczWXzxRu.7QzZHFk5O','838-829-0895','ACTIVE','gpaschke1n',3),('PATIENT',61,'09550 Shopko Crossing','1992-08-07','rwetherald1o@elpais.com',_binary '\0','http://dummyimage.com/159x100.png/dddddd/000000','Rutherford Wetherald','$2a$04$4LhCTC92lHZnWGuxLLRlpevxF/zShU/MF.jyU5IYrO8hXyaZPmlE6','270-335-0115','ACTIVE','rwetherald1o',4),('PATIENT',62,'899 Oneill Avenue','2003-01-17','asaladino1p@seattletimes.com',_binary '\0','http://dummyimage.com/192x100.png/dddddd/000000','Aline Saladino','$2a$04$rqbr0eroFa0jiKpc69UPm.zOZu7UlAjvJK.YbgG5djDPP8GjOtAQC','451-366-3659','ACTIVE','asaladino1p',1),('DOCTOR',63,'7 Sunnyside Drive','2000-07-05','rmcgarvie1q@i2i.jp',_binary '','http://dummyimage.com/105x100.png/dddddd/000000','Rockie McGarvie','$2a$04$icSvOpO4FyOlru4yQSUsg.0sE7Mr2Zu8/jZUoQd/JXbOq2Jly32Bq','579-139-1173','INACTIVE','rmcgarvie1q',1),('MANAGER',64,'56945 Ohio Road','2005-04-01','gellerby1r@qq.com',_binary '','http://dummyimage.com/134x100.png/dddddd/000000','Gaelan Ellerby','$2a$04$ASk.4MFWW9AOOClppMxVBuRyUgxkSAQGo8Ce6lqh0NQROZkmOb.AC','535-756-9276','INACTIVE','gellerby1r',2),('DOCTOR',65,'8430 Chinook Junction','2003-05-28','kcaulkett1s@vistaprint.com',_binary '','http://dummyimage.com/122x100.png/5fa2dd/ffffff','Kassey Caulkett','$2a$04$5c6ZkKXcnvvXMPc5XBnp8uBdiOImn7b25kGhuD7BhFy2ECdrqzCKK','356-947-7464','INACTIVE','kcaulkett1s',4),('DOCTOR',66,'13115 Gateway Center','2005-04-29','lpostill1t@dyndns.org',_binary '\0','http://dummyimage.com/249x100.png/ff4444/ffffff','Lindsey Postill','$2a$04$f5ySEQymqWW6fJofHHlNc.u.G.aqt3s7H8tp4N6GgQyz79ag/vo/u','223-361-5396','ACTIVE','lpostill1t',3),('PATIENT',67,'1 4th Way','1996-11-23','apauletti1u@com.com',_binary '\0','http://dummyimage.com/199x100.png/cc0000/ffffff','Adel Pauletti','$2a$04$CeSnL12/MRxGs8mPGliFfOHkuvkeXjcxqdxe/Bm25H8F7Fesqc07O','817-412-2378','ACTIVE','apauletti1u',1),('DOCTOR',68,'6 John Wall Drive','1992-12-04','agladtbach1v@scribd.com',_binary '\0','http://dummyimage.com/218x100.png/5fa2dd/ffffff','Adele Gladtbach','$2a$04$fMz8zZRHQ82L.QzibX0TXea336OFMAZjhsO/Ss3VSSlaH3greskES','558-636-0088','ACTIVE','agladtbach1v',2),('PATIENT',69,'24 Claremont Drive','1998-08-26','rmorse1w@disqus.com',_binary '','http://dummyimage.com/212x100.png/ff4444/ffffff','Robin Morse','$2a$04$P00Vm9/wSqbPEKpsalDb4.w2Rb2JwfKV4b/dZhHb6O2mio45qdqke','522-962-4905','ACTIVE','rmorse1w',2),('DOCTOR',70,'0 Maple Wood Pass','2001-01-23','ncroyden1x@dell.com',_binary '\0','http://dummyimage.com/154x100.png/ff4444/ffffff','Noell Croyden','$2a$04$WsQAuiCZGmgO1/JczJxCYeMpAJZibTydMugVIxBihP0k7zy9..j7a','664-206-3368','ACTIVE','ncroyden1x',2),('ADMINISTRATOR',71,'05 Stephen Terrace','2000-04-11','bmacpaden1y@usgs.gov',_binary '','http://dummyimage.com/189x100.png/cc0000/ffffff','Bernarr MacPaden','$2a$04$pFp61TakL3H8eBGvNC9iJe75.zqsDxbHfxk6zuCHoPsV9NEfEvfs2','285-633-4080','ACTIVE','bmacpaden1y',1),('MANAGER',72,'4446 Loomis Place','2003-01-01','espelman1z@furl.net',_binary '','http://dummyimage.com/158x100.png/dddddd/000000','Enrichetta Spelman','$2a$04$DubVgwbHGhzI1EwwJB8nouonX9i7J0JmPuSbMbxnlkkINf4HZ5DYO','696-964-9389','ACTIVE','espelman1z',2),('DOCTOR',73,'1 Warrior Junction','2004-05-19','adominiak20@economist.com',_binary '\0','http://dummyimage.com/125x100.png/5fa2dd/ffffff','Ambros Dominiak','$2a$04$kh9tcCwK5PzMEGgrJXkr7ua0fmljV.3POnoV./x3MSSi1kLiTb.MG','737-160-8578','ACTIVE','adominiak20',2),('MANAGER',74,'68 Laurel Avenue','1998-02-09','fpointon21@domainmarket.com',_binary '\0','http://dummyimage.com/114x100.png/dddddd/000000','Florenza Pointon','$2a$04$7jMcEp7AJ1FchX.3flmrNOyA/p/voY669YJHjyDmL5oIuP3RJJI4W','274-474-2453','ACTIVE','fpointon21',2),('DOCTOR',75,'61946 Butternut Court','2004-01-15','fcoggin22@alibaba.com',_binary '','http://dummyimage.com/223x100.png/ff4444/ffffff','Fergus Coggin','$2a$04$xKDOn5FLMU1IUYrdP.Nyy.3CMkQYku/LqtmQnoIZtE/FTvRVz2SO6','833-805-6315','ACTIVE','fcoggin22',2),('PATIENT',76,'98381 Grover Terrace','2004-11-29','geglaise23@sitemeter.com',_binary '','http://dummyimage.com/185x100.png/cc0000/ffffff','Gerek Eglaise','$2a$04$NgViDh7L9.gV4oG1oMbJnO07jorIgtr106vMy.zD/.W/XvQzd5GTS','935-256-6231','ACTIVE','geglaise23',1),('ADMINISTRATOR',77,'0 Blue Bill Park Center','1997-06-25','abalke24@wikimedia.org',_binary '\0','http://dummyimage.com/149x100.png/5fa2dd/ffffff','Adrian Balke','$2a$04$H9DgK2x.PEhRfKriVvqZce8LhW3Ks.RSS6Nl0N7MNFVlKXOjH6Z0a','217-316-8034','ACTIVE','abalke24',2),('MANAGER',78,'3262 Mendota Plaza','1991-09-11','ccamous25@xrea.com',_binary '','http://dummyimage.com/195x100.png/5fa2dd/ffffff','Christye Camous','$2a$04$FaZBNBFR7z8bu08q5Q1RDu7DQG8dsukbEruZORu1C2t73w.ewKjkC','473-367-6637','ACTIVE','ccamous25',4),('DOCTOR',79,'7 Hallows Place','1996-01-07','afairfoul26@merriam-webster.com',_binary '','http://dummyimage.com/194x100.png/dddddd/000000','Annecorinne Fairfoul','$2a$04$CVa1VCkVcPu7eYKk6T9u1uzek15mBt5GOIoheYzZlUUPOGAH5hBFW','467-486-4753','ACTIVE','afairfoul26',2),('DOCTOR',80,'4 Banding Place','1998-03-31','amc27@vinaora.com',_binary '\0','http://dummyimage.com/166x100.png/ff4444/ffffff','Adoree Mc Pake','$2a$04$H.26dBrONetmBLQvGoETxev2HB2bFuIQrfIAouiIX8EXo7DbOeWiu','788-911-7315','ACTIVE','amc27',2),('ADMINISTRATOR',81,'4 Parkside Drive','1993-06-17','mledner28@techcrunch.com',_binary '\0','http://dummyimage.com/154x100.png/cc0000/ffffff','Mile Ledner','$2a$04$bCkW7EjGGq3C244vg7npQON82OZ9A/TFGHMgtqG92u9Llx8GM6tTC','126-922-5057','ACTIVE','mledner28',2),('DOCTOR',82,'48807 Dexter Park','1997-01-12','wyakutin29@bloglines.com',_binary '','http://dummyimage.com/198x100.png/dddddd/000000','Woody Yakutin','$2a$04$mwcc9mrJzLeLuzav06e5qOpVLR1Bh7.X8jdIFsImwcKavq3fgOq1.','994-923-0419','ACTIVE','wyakutin29',4),('DOCTOR',83,'82 Valley Edge Lane','2002-01-17','cdoldon2a@paginegialle.it',_binary '\0','http://dummyimage.com/129x100.png/5fa2dd/ffffff','Celle Doldon','$2a$04$J1wxGT/ALThvL3sXC3WLq.dmWP7WhqDiBLCAN.7zqfinBeC3GaKge','916-528-5192','ACTIVE','cdoldon2a',2),('MANAGER',84,'76484 High Crossing Hill','1997-07-19','nhallowes2b@senate.gov',_binary '','http://dummyimage.com/178x100.png/ff4444/ffffff','Natalya Hallowes','$2a$04$V/ccDZZ9hjm9a06R1EW6eOpy34o4cGLBt5q6BPGC5YdhIcFZGrNmm','668-379-7290','ACTIVE','nhallowes2b',2),('MANAGER',85,'33 Brickson Park Way','1991-03-04','mshaw2c@linkedin.com',_binary '','http://dummyimage.com/132x100.png/ff4444/ffffff','Morris Shaw','$2a$04$WH.mOGb0oLKbV.M/TbWHZ.E4kVrfysrwj4y/TlGqs/PE1Q5jPZ892','841-919-5896','ACTIVE','mshaw2c',4),('ADMINISTRATOR',86,'145 Clove Junction','1996-12-04','cpennoni2d@examiner.com',_binary '','http://dummyimage.com/250x100.png/5fa2dd/ffffff','Carlina Pennoni','$2a$04$o2.lQ.ehH9vRAdq45Cg8p.XYlXaD12VZkTWG4Sn0TUeANRZfWCEku','343-492-5074','INACTIVE','cpennoni2d',1),('DOCTOR',87,'65962 Bunker Hill Center','1992-08-24','jluten2e@weibo.com',_binary '\0','http://dummyimage.com/235x100.png/ff4444/ffffff','Jordan Luten','$2a$04$YRuQ4RC/Sjqd0ufv6b0OaODmKWLqaivAh/9kEoIbA4HxfXw7ryxqW','164-959-3445','ACTIVE','jluten2e',3),('PATIENT',88,'30472 Bellgrove Lane','1999-04-15','rhannan2f@microsoft.com',_binary '\0','http://dummyimage.com/171x100.png/dddddd/000000','Rolland Hannan','$2a$04$PCmw2aLuz3ZKW2WRq6TInOCixOOBjhAfZCdArKl9YN1kjCpDSFSc2','313-818-6042','ACTIVE','rhannan2f',4),('DOCTOR',89,'8112 Michigan Court','1999-01-11','pveryan2g@ask.com',_binary '\0','http://dummyimage.com/112x100.png/dddddd/000000','Peyton Veryan','$2a$04$PouSW3dgBgTa0RSzMG9LbOmujXXU3pNIm5Mjk4AshB/x17GwUWdwS','782-650-2015','ACTIVE','pveryan2g',1),('DOCTOR',90,'39881 Harbort Place','2004-02-01','emacparland2h@bloglovin.com',_binary '\0','http://dummyimage.com/248x100.png/ff4444/ffffff','Evelina MacParland','$2a$04$ar.2q3WeK8w.R.GPa6cK/OKR4gQUSpKW1Zck3eV3WzBn4WIh9trc6','266-285-2995','ACTIVE','emacparland2h',2),('DOCTOR',91,'62 Mesta Center','2005-01-12','egarlick2i@oracle.com',_binary '\0','http://dummyimage.com/172x100.png/dddddd/000000','Enriqueta Garlick','$2a$04$997y/RWRJ/hGauZncIk2UOY/3ZWeQU6PXUL50fM3bV9uusYgJlvN.','608-250-1498','INACTIVE','egarlick2i',2),('MANAGER',92,'0 Hollow Ridge Plaza','2000-06-15','tdarker2j@tmall.com',_binary '\0','http://dummyimage.com/167x100.png/cc0000/ffffff','Tyson Darker','$2a$04$9FyQF1BzhipfwSbL0WsfPuZbK27JE/ZaNyItCkl680Bo17BccxojO','143-702-3731','ACTIVE','tdarker2j',2),('DOCTOR',93,'1 Delladonna Terrace','2001-11-28','brapo2k@parallels.com',_binary '\0','http://dummyimage.com/176x100.png/dddddd/000000','Barby Rapo','$2a$04$UA39PUMWP9DwdVrXpyJx8eD.wLTUZCCswIC.AGGe9i3Jasxg/Xeqi','773-836-4726','ACTIVE','brapo2k',2),('DOCTOR',94,'02704 Badeau Point','2000-08-22','naizic2l@webnode.com',_binary '\0','http://dummyimage.com/141x100.png/cc0000/ffffff','Norton Aizic','$2a$04$eKeJuBVuHcm6/nxKZ1eVJ.N/DW3/izhr3CbrJCLjoGRSJqJTGgnyK','127-336-2061','INACTIVE','naizic2l',2),('DOCTOR',95,'3 Dexter Court','1995-06-17','kduck2m@bing.com',_binary '\0','http://dummyimage.com/134x100.png/ff4444/ffffff','Karmen Duck','$2a$04$Q6URjJqhLl4uBOcYFnwJf.hnH7yLKiQ2lALjMGyyrwJ9Tpp/Ik7f.','957-119-2317','ACTIVE','kduck2m',2),('DOCTOR',96,'58935 Linden Way','2003-06-29','fcrisp2n@reuters.com',_binary '','http://dummyimage.com/154x100.png/ff4444/ffffff','Fiann Crisp','$2a$04$PHLjLQz8fBRpGGYv0bIGOOKl.2PFLfj03iiIpXpwgZBXccp0zTRsy','640-727-9091','ACTIVE','fcrisp2n',2),('ADMINISTRATOR',97,'996 Talisman Drive','1997-12-21','jdevaney2o@hostgator.com',_binary '\0','http://dummyimage.com/179x100.png/cc0000/ffffff','Jarrod Devaney','$2a$04$GYu0qwqvMHo7b00MFZ518unKZnvwSh1/ULz1oShCAPQNLo6c81/ZC','204-762-9375','INACTIVE','jdevaney2o',1),('DOCTOR',98,'1 Veith Park','1991-01-01','bbobasch2p@xinhuanet.com',_binary '\0','http://dummyimage.com/213x100.png/ff4444/ffffff','Blinni Bobasch','$2a$04$8rEDg7wVo0bhlbvpPpxVp.J5ql7nkNqYWOlP8OldWSk3gqfhoAXry','639-362-6330','ACTIVE','bbobasch2p',1),('DOCTOR',99,'65 Banding Pass','2001-09-05','bhawker2q@scientificamerican.com',_binary '\0','http://dummyimage.com/109x100.png/5fa2dd/ffffff','Bartholomeo Hawker','$2a$04$uEaPqzFcOsXm4v7.bAD3uOMasevibpQYdauKfOIfM/8Zoc1c0.SvW','904-700-8665','ACTIVE','bhawker2q',2),('PATIENT',100,'42271 Anthes Junction','1990-07-25','dhearse2r@walmart.com',_binary '','http://dummyimage.com/249x100.png/ff4444/ffffff','Dominik Hearse','$2a$04$QIfJ7ZyZHUoxAb9PVLzz2eOCDteIyE1M/hYoTdwVIOs6jobjLJU4u','955-742-8098','ACTIVE','dhearse2r',4);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-21  6:29:13
