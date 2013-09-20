-- MySQL dump 10.13  Distrib 5.6.12, for Win32 (x86)
--
-- Host: localhost    Database: ais_portal
-- ------------------------------------------------------
-- Server version	5.6.12-log

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
-- Table structure for table `academic_sessions`
--

DROP TABLE IF EXISTS `academic_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `academic_sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `academic_session` varchar(10) DEFAULT NULL,
  `active_session` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academic_sessions`
--

LOCK TABLES `academic_sessions` WRITE;
/*!40000 ALTER TABLE `academic_sessions` DISABLE KEYS */;
INSERT INTO `academic_sessions` VALUES (1,'2012/2013',0),(2,'2013/2014',1);
/*!40000 ALTER TABLE `academic_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admission_recommendation`
--

DROP TABLE IF EXISTS `admission_recommendation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admission_recommendation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admission_remark` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admission_recommendation`
--

LOCK TABLES `admission_recommendation` WRITE;
/*!40000 ALTER TABLE `admission_recommendation` DISABLE KEYS */;
INSERT INTO `admission_recommendation` VALUES (1,'Admitted on Merit'),(2,'Admitted on Trial'),(3,'No Admission');
/*!40000 ALTER TABLE `admission_recommendation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_type`
--

DROP TABLE IF EXISTS `application_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_type`
--

LOCK TABLES `application_type` WRITE;
/*!40000 ALTER TABLE `application_type` DISABLE KEYS */;
INSERT INTO `application_type` VALUES (1,'Nursery'),(2,'Primary'),(3,'Junior Secondary'),(4,'Senior Secondary');
/*!40000 ALTER TABLE `application_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_types`
--

DROP TABLE IF EXISTS `assessment_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_types`
--

LOCK TABLES `assessment_types` WRITE;
/*!40000 ALTER TABLE `assessment_types` DISABLE KEYS */;
INSERT INTO `assessment_types` VALUES (1,'1st CA (20%)'),(2,'2nd CA (10%)'),(3,'3rd CA (10%)'),(4,'Exam (60%)');
/*!40000 ALTER TABLE `assessment_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assignment_submissions`
--

DROP TABLE IF EXISTS `assignment_submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assignment_submissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assignment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `assignment_score` float DEFAULT NULL,
  `submission_date` datetime DEFAULT NULL,
  `assignment_file_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`assignment_id`,`user_id`),
  KEY `fk_assignment_submissions_assignments_and_notes1_idx` (`assignment_id`),
  KEY `fk_assignment_submissions_users1_idx` (`user_id`),
  CONSTRAINT `fk_assignment_submissions_assignments_and_notes1` FOREIGN KEY (`assignment_id`) REFERENCES `assignments_and_notes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_assignment_submissions_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignment_submissions`
--

LOCK TABLES `assignment_submissions` WRITE;
/*!40000 ALTER TABLE `assignment_submissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `assignment_submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assignments_and_notes`
--

DROP TABLE IF EXISTS `assignments_and_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assignments_and_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `an_type` tinyint(4) DEFAULT NULL,
  `an_file_path` varchar(255) DEFAULT NULL,
  `subject_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `submission_deadline` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`subject_id`,`class_id`,`user_id`),
  KEY `fk_assignments_and_notes_subjects1_idx` (`subject_id`),
  KEY `fk_assignments_and_notes_classes1_idx` (`class_id`),
  KEY `fk_assignments_and_notes_users1_idx` (`user_id`),
  CONSTRAINT `fk_assignments_and_notes_classes1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_assignments_and_notes_subjects1` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_assignments_and_notes_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignments_and_notes`
--

LOCK TABLES `assignments_and_notes` WRITE;
/*!40000 ALTER TABLE `assignments_and_notes` DISABLE KEYS */;
INSERT INTO `assignments_and_notes` VALUES (2,'Ss1A Maths Assignment',2,'/uploads/assignments/ss1a_maths_assignment.pdf',1,33,3,'2013-07-10 08:00:40'),(3,'Ss2A English Assignment',2,'/uploads/assignments/ss2a_english_assignment.pdf',2,36,4,'2013-07-02 08:00:18'),(4,'Demo Assignment',2,'/uploads/assignments/demo_assignment.docx',1,34,3,'2013-10-01 10:00:00');
/*!40000 ALTER TABLE `assignments_and_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banks`
--

DROP TABLE IF EXISTS `banks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bank_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banks`
--

LOCK TABLES `banks` WRITE;
/*!40000 ALTER TABLE `banks` DISABLE KEYS */;
INSERT INTO `banks` VALUES (1,'Zenith Bank'),(2,'Diamond Bank'),(3,'EcoBank'),(4,'UBA Bank'),(5,'GTBank'),(6,'Keystone Bank');
/*!40000 ALTER TABLE `banks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biodata`
--

DROP TABLE IF EXISTS `biodata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `biodata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `othernames` varchar(100) DEFAULT NULL,
  `age` int(3) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `tribe` varchar(30) DEFAULT NULL,
  `form_no` varchar(8) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `gender_id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `nationality_id` int(11) NOT NULL,
  `current_class_id` int(11) NOT NULL,
  `last_class_id` int(11) NOT NULL,
  `csai_id` int(11) NOT NULL,
  `application_type_id` int(11) NOT NULL,
  `passport_path` varchar(255) DEFAULT NULL,
  `reg_status` int(2) DEFAULT NULL,
  `student_status` int(2) NOT NULL,
  PRIMARY KEY (`id`,`user_id`,`gender_id`,`state_id`,`nationality_id`,`current_class_id`,`last_class_id`,`csai_id`,`application_type_id`),
  KEY `fk_biodata_users1_idx` (`user_id`),
  KEY `fk_biodata_gender1_idx` (`gender_id`),
  KEY `fk_biodata_states1_idx` (`state_id`),
  KEY `fk_biodata_nationality1_idx` (`nationality_id`),
  KEY `fk_biodata_classes1_idx` (`last_class_id`),
  KEY `fk_biodata_classes2_idx` (`csai_id`),
  KEY `fk_biodata_application_type1_idx` (`application_type_id`),
  KEY `fk_biodata_classes3_idx` (`current_class_id`),
  CONSTRAINT `fk_biodata_application_type1` FOREIGN KEY (`application_type_id`) REFERENCES `application_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_biodata_gender1` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_biodata_nationality1` FOREIGN KEY (`nationality_id`) REFERENCES `nationality` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_biodata_states1` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_biodata_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biodata`
--

LOCK TABLES `biodata` WRITE;
/*!40000 ALTER TABLE `biodata` DISABLE KEYS */;
INSERT INTO `biodata` VALUES (1,'Alfred',52,'1960-10-01','My tribe','60128666',5,1,9,118,34,32,34,4,'5_passport.jpg',9,1),(2,'',13,'2000-02-12','Bura','10184539',6,1,8,118,34,24,34,4,'6_passport.jpg',9,1);
/*!40000 ALTER TABLE `biodata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_attendance`
--

DROP TABLE IF EXISTS `class_attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class_attendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attendance_type_id` int(11) DEFAULT NULL,
  `attendance_date` datetime DEFAULT NULL,
  `admission_no` varchar(15) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `term_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `academic_session_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `attendance_reason` text,
  PRIMARY KEY (`id`,`user_id`,`term_id`,`class_id`,`academic_session_id`,`subject_id`),
  KEY `fk_class_attendance_users1_idx` (`user_id`),
  KEY `fk_class_attendance_terms1_idx` (`term_id`),
  KEY `fk_class_attendance_classes1_idx` (`class_id`),
  KEY `fk_class_attendance_academic_sessions1_idx` (`academic_session_id`),
  KEY `fk_class_attendance_subjects1_idx` (`subject_id`),
  CONSTRAINT `fk_class_attendance_academic_sessions1` FOREIGN KEY (`academic_session_id`) REFERENCES `academic_sessions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_class_attendance_classes1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_class_attendance_subjects1` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_class_attendance_terms1` FOREIGN KEY (`term_id`) REFERENCES `terms` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_class_attendance_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_attendance`
--

LOCK TABLES `class_attendance` WRITE;
/*!40000 ALTER TABLE `class_attendance` DISABLE KEYS */;
INSERT INTO `class_attendance` VALUES (1,1,'2013-09-19 20:21:08','AR/13/677038',3,1,34,2,1,NULL);
/*!40000 ALTER TABLE `class_attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES (1,'Play Class'),(2,'Nursery 1A'),(3,'Nursery 1B'),(4,'Nursery 1C'),(5,'Nursery 2A'),(6,'Nursery 2B'),(7,'Nursery 2C'),(8,'Nursery 3A'),(9,'Nursery 3B'),(10,'Nursery 3C'),(11,'Primary 1A'),(12,'Primary 1B'),(13,'Primary 1C'),(14,'Primary 2A'),(15,'Primary 2B'),(16,'Primary 2C'),(17,'Primary 3A'),(18,'Primary 3B'),(19,'Primary 4A'),(20,'Primary 4B'),(21,'Primary 4C'),(22,'Primary 5A'),(23,'Primary 5B'),(24,'Primary 6A'),(25,'JSS 1A'),(26,'JSS 1B'),(27,'JSS 1C'),(28,'JSS 2A'),(29,'JSS 2B'),(30,'JSS 2C'),(31,'JSS 3A'),(32,'JSS 3B'),(33,'SS1 A'),(34,'SS1 B'),(35,'SS1 C'),(36,'SS2 A'),(37,'SS2 B'),(38,'SS3 A'),(39,'SS3 B');
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deduction_types`
--

DROP TABLE IF EXISTS `deduction_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deduction_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deduction_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deduction_types`
--

LOCK TABLES `deduction_types` WRITE;
/*!40000 ALTER TABLE `deduction_types` DISABLE KEYS */;
INSERT INTO `deduction_types` VALUES (1,'Staff Children Scholarship'),(2,'Pension'),(3,'3 Days Lateness'),(4,'Rent - Single Apartment'),(5,'Rent - Double Apartment'),(6,'Rent - Shared Apartment');
/*!40000 ALTER TABLE `deduction_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deductions`
--

DROP TABLE IF EXISTS `deductions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deductions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) NOT NULL,
  `deduction_date` date DEFAULT NULL,
  `deduction_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`staff_id`,`deduction_type_id`),
  KEY `fk_deductions_staff_records1_idx` (`staff_id`),
  KEY `fk_deductions_deduction_types1_idx` (`deduction_type_id`),
  CONSTRAINT `fk_deductions_deduction_types1` FOREIGN KEY (`deduction_type_id`) REFERENCES `deduction_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_deductions_staff_records1` FOREIGN KEY (`staff_id`) REFERENCES `staff_records` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deductions`
--

LOCK TABLES `deductions` WRITE;
/*!40000 ALTER TABLE `deductions` DISABLE KEYS */;
INSERT INTO `deductions` VALUES (2,1,'2013-09-10',2);
/*!40000 ALTER TABLE `deductions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `designations`
--

DROP TABLE IF EXISTS `designations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `designations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `designations`
--

LOCK TABLES `designations` WRITE;
/*!40000 ALTER TABLE `designations` DISABLE KEYS */;
INSERT INTO `designations` VALUES (1,'Ordinary Staff'),(2,'Principal'),(3,'Vice Principal'),(4,'HOD/Senior Master'),(5,'Exam Officer'),(6,'Head Cleaner/Security'),(7,'Special Duty/Extension');
/*!40000 ALTER TABLE `designations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrance_examination`
--

DROP TABLE IF EXISTS `entrance_examination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrance_examination` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mathematics` float DEFAULT NULL,
  `english` float DEFAULT NULL,
  `science` float DEFAULT NULL,
  `social_science` float DEFAULT NULL,
  `quran` float DEFAULT NULL,
  `arabic` float DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`user_id`),
  KEY `fk_entrance_examination_users1_idx` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrance_examination`
--

LOCK TABLES `entrance_examination` WRITE;
/*!40000 ALTER TABLE `entrance_examination` DISABLE KEYS */;
INSERT INTO `entrance_examination` VALUES (1,100,45,56,78,13,54,5),(2,87,64,83,75,34,45,6),(3,45,78,38,69,86,87,7),(4,87,87,68,78,60,31,8),(5,45,64,68,78,81,31,9),(6,56,87,65,45,67,54,10),(7,56,78,87,65,56,52,5),(8,65,89,57,65,52,45,6);
/*!40000 ALTER TABLE `entrance_examination` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_group`
--

DROP TABLE IF EXISTS `event_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_group_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_group`
--

LOCK TABLES `event_group` WRITE;
/*!40000 ALTER TABLE `event_group` DISABLE KEYS */;
INSERT INTO `event_group` VALUES (1,'Students'),(2,'Teachers'),(3,'All Users');
/*!40000 ALTER TABLE `event_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_title` varchar(160) DEFAULT NULL,
  `event_url` text,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `all_day` tinyint(4) DEFAULT '0',
  `event_for_group_id` int(11) NOT NULL,
  `student_class_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`event_for_group_id`,`user_id`),
  KEY `fk_events_classes1_idx` (`student_class_id`),
  KEY `fk_events_event_group1_idx` (`event_for_group_id`),
  KEY `fk_events_users1_idx` (`user_id`),
  CONSTRAINT `fk_events_classes1` FOREIGN KEY (`student_class_id`) REFERENCES `classes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_events_event_group1` FOREIGN KEY (`event_for_group_id`) REFERENCES `event_group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_events_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gender`
--

DROP TABLE IF EXISTS `gender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gender` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gender_name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gender`
--

LOCK TABLES `gender` WRITE;
/*!40000 ALTER TABLE `gender` DISABLE KEYS */;
INSERT INTO `gender` VALUES (1,'Male'),(2,'Female'),(3,'Other');
/*!40000 ALTER TABLE `gender` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incentive_types`
--

DROP TABLE IF EXISTS `incentive_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `incentive_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `incentive_type_name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incentive_types`
--

LOCK TABLES `incentive_types` WRITE;
/*!40000 ALTER TABLE `incentive_types` DISABLE KEYS */;
INSERT INTO `incentive_types` VALUES (1,'General'),(2,'Designated');
/*!40000 ALTER TABLE `incentive_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incentives`
--

DROP TABLE IF EXISTS `incentives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `incentives` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `incentive_name` varchar(255) DEFAULT NULL,
  `incentive_percentage` float DEFAULT NULL,
  `incentive_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`incentive_type_id`),
  KEY `fk_incentives_incentive_types1_idx` (`incentive_type_id`),
  CONSTRAINT `fk_incentives_incentive_types1` FOREIGN KEY (`incentive_type_id`) REFERENCES `incentive_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incentives`
--

LOCK TABLES `incentives` WRITE;
/*!40000 ALTER TABLE `incentives` DISABLE KEYS */;
INSERT INTO `incentives` VALUES (2,'Medical',30,1),(3,'Transport',20,1),(4,'Housing',40,1),(5,'Pension',7.5,1),(6,'Principal',50,2),(7,'Vice Principal',30,2),(9,'Hod/senior Master',10,2),(10,'Exam Officer',5,2),(11,'Head Cleaner/security',5,2),(12,'Special Duty/extension',5,2);
/*!40000 ALTER TABLE `incentives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laravel_migrations`
--

DROP TABLE IF EXISTS `laravel_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `laravel_migrations` (
  `bundle` varchar(50) NOT NULL,
  `name` varchar(200) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`bundle`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laravel_migrations`
--

LOCK TABLES `laravel_migrations` WRITE;
/*!40000 ALTER TABLE `laravel_migrations` DISABLE KEYS */;
INSERT INTO `laravel_migrations` VALUES ('application','2013_05_01_160704_create_session_table',1);
/*!40000 ALTER TABLE `laravel_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medical_records`
--

DROP TABLE IF EXISTS `medical_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medical_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hospital_name` varchar(100) DEFAULT NULL,
  `hospital_address` text,
  `doctor_name` varchar(50) DEFAULT NULL,
  `doctor_phone_no` varchar(15) DEFAULT NULL,
  `child_file_no` varchar(20) DEFAULT NULL,
  `blood_group` varchar(3) DEFAULT NULL,
  `genotype` varchar(3) DEFAULT NULL,
  `allergic_reaction` varchar(6) DEFAULT NULL,
  `allergic_details` varchar(255) DEFAULT NULL,
  `disability` varchar(6) DEFAULT NULL,
  `disability_details` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`user_id`),
  KEY `fk_medical_records_users1_idx` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical_records`
--

LOCK TABLES `medical_records` WRITE;
/*!40000 ALTER TABLE `medical_records` DISABLE KEYS */;
INSERT INTO `medical_records` VALUES (1,'Medical Home','No. 13, medical street','Dr. No-Eh','08095878483','93889HB','A+','AA','No','','No','',5),(2,'Borno State Hospital','Hospital address','Dr. Memphis Jackson','08059443154','','O','AA','No','','No','',6);
/*!40000 ALTER TABLE `medical_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nationality`
--

DROP TABLE IF EXISTS `nationality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nationality` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nationality_name` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nationality`
--

LOCK TABLES `nationality` WRITE;
/*!40000 ALTER TABLE `nationality` DISABLE KEYS */;
INSERT INTO `nationality` VALUES (1,'Andorra'),(2,'United Arab Emirate'),(3,'Afghanistan'),(4,'Antigua - Barbuda'),(5,'Anguilla'),(6,'Albania'),(7,'Armenia'),(8,'Argentina'),(9,'Australia'),(10,'Aruba'),(11,'Azerbaijan'),(12,'Bosnia'),(13,'Barbados'),(14,'Bangladesh'),(15,'Belgium'),(16,'Burkina Faso'),(17,'Bulgaria'),(18,'Bahrain'),(19,'Burundi'),(20,'Benin'),(21,'Bermuda'),(22,'Brunei'),(23,'Bolivia'),(24,'Brazil'),(25,'Bahamas'),(26,'Bhutan'),(27,'Botswana'),(28,'Belarus'),(29,'Belize'),(30,'Canada'),(31,'Curacao'),(32,'Central Africa Republic'),(33,'Congo'),(34,'Switzerland'),(35,'Christmas Island'),(36,'Cook Islands'),(37,'Chile'),(38,'Cameroon'),(39,'China'),(40,'Colombia'),(41,'Costa Rica'),(42,'Cote D\'Ivoire'),(43,'Cuba'),(44,'Cape Verde'),(45,'Cyprus'),(46,'Czech Republic'),(47,'Germany'),(48,'Djibouti'),(49,'Denmark'),(50,'Dominica'),(51,'Dominican Republic'),(52,'Algeria'),(53,'Ecuador'),(54,'Estonia'),(55,'Egypt'),(56,'Eritrea'),(57,'Spain'),(58,'Ethiopia'),(59,'Finland'),(60,'Fiji'),(61,'Faroe Islands'),(62,'France'),(63,'Great Britain'),(64,'Grenada'),(65,'Georgia'),(66,'Ghana'),(67,'Greenland'),(68,'Guinea'),(69,'Guadaloupe'),(70,'Equatorial Guinea'),(71,'Greece'),(72,'Guatemala'),(73,'Guam'),(74,'Guyana'),(75,'Hong Kong'),(76,'Honduras'),(77,'Croatia'),(78,'Haiti'),(79,'Hungary'),(80,'Iran'),(81,'Indonesia'),(82,'Israel'),(83,'India'),(84,'Iraq'),(85,'Ireland'),(86,'Iceland'),(87,'Italy'),(88,'Jamaica'),(89,'Jordan'),(90,'Japan'),(91,'Kenya'),(92,'Kyrgyzstan'),(93,'Cambodia'),(94,'Kiribati'),(95,'Korea'),(96,'Kuwait'),(97,'Kazakhstan'),(98,'Laos'),(99,'Lebanon'),(100,'St Lucia'),(101,'Liechtenstein'),(102,'Liberia'),(103,'Luxembourg'),(104,'Latvia'),(105,'Lybia'),(106,'Morocco'),(107,'Moldova'),(108,'Macedonia'),(109,'Mali'),(110,'Myanmar'),(111,'Mongolia'),(112,'Malta'),(113,'Mexico'),(114,'Malaysia'),(115,'Mozambique'),(116,'Namibia'),(117,'Niger'),(118,'Nigeria'),(119,'Nicaragua'),(120,'Netherlands'),(121,'Norway'),(122,'Nepal'),(123,'Nauru'),(124,'New Zealand'),(125,'Oman'),(126,'Panama'),(127,'Peru'),(128,'Philippines'),(129,'Pakistan'),(130,'Poland'),(131,'Puerto Rico'),(132,'Portugal'),(133,'Paraguay'),(134,'Qatar'),(135,'Romania'),(136,'Russia'),(137,'Rwanda'),(138,'Saudi Arabia'),(139,'Sudan'),(140,'Sweden'),(141,'Singapore'),(142,'Slovenia'),(143,'Slovakia'),(144,'San Marino'),(145,'Senegal'),(146,'Somalia'),(147,'Suriname'),(148,'Serbia - Montenegro'),(149,'El Salvador'),(150,'Syria'),(151,'Chad'),(152,'Togo'),(153,'Thailand'),(154,'Tokelau'),(155,'Tunisia'),(156,'Tonga'),(157,'Turkey'),(158,'Tridinidad Tobago'),(159,'Taiwan'),(160,'Ukraine'),(161,'United Kingdom'),(162,'United States'),(163,'Uruguay'),(164,'Vatican'),(165,'Venezuela'),(166,'Vietnam'),(167,'South Africa'),(168,'Zimbawe');
/*!40000 ALTER TABLE `nationality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `official_use`
--

DROP TABLE IF EXISTS `official_use`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `official_use` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `last_class_id` int(11) NOT NULL,
  `present_class_id` int(11) NOT NULL,
  `aic_id` int(11) NOT NULL,
  `admission_recommendation_id` int(11) NOT NULL,
  `admission_no` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id`,`user_id`,`last_class_id`,`present_class_id`,`aic_id`,`admission_recommendation_id`),
  KEY `fk_official_use_admission_recommendation1_idx` (`admission_recommendation_id`),
  KEY `fk_official_use_classes1_idx` (`last_class_id`),
  KEY `fk_official_use_classes2_idx` (`present_class_id`),
  KEY `fk_official_use_classes3_idx` (`aic_id`),
  KEY `fk_official_use_users1_idx` (`user_id`),
  CONSTRAINT `fk_official_use_admission_recommendation1` FOREIGN KEY (`admission_recommendation_id`) REFERENCES `admission_recommendation` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_official_use_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `official_use`
--

LOCK TABLES `official_use` WRITE;
/*!40000 ALTER TABLE `official_use` DISABLE KEYS */;
INSERT INTO `official_use` VALUES (1,5,32,1,34,1,'AR/13/677038'),(2,6,24,1,34,1,'AR/13/172163');
/*!40000 ALTER TABLE `official_use` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parental_information`
--

DROP TABLE IF EXISTS `parental_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parental_information` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `father_name` varchar(50) DEFAULT NULL,
  `father_occupation` varchar(20) DEFAULT NULL,
  `father_religion` int(11) NOT NULL,
  `residential_address` text,
  `father_phone_no` varchar(15) DEFAULT NULL,
  `mother_name` varchar(50) DEFAULT NULL,
  `mother_occupation` varchar(20) DEFAULT NULL,
  `mother_religion` int(11) NOT NULL,
  `mother_phone_no` varchar(15) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`father_religion`,`mother_religion`,`user_id`),
  KEY `fk_parental_information_users1_idx` (`user_id`),
  KEY `fk_parental_information_religions1_idx` (`father_religion`),
  KEY `fk_parental_information_religions2_idx` (`mother_religion`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parental_information`
--

LOCK TABLES `parental_information` WRITE;
/*!40000 ALTER TABLE `parental_information` DISABLE KEYS */;
INSERT INTO `parental_information` VALUES (1,'Mr John Doe','Civil Servant',1,'No. 20, Aso rock villa','08098839922','Mrs Jane Doe','Civil Servant',1,'08098839922',5),(2,'Mr. John Kepler','Civil Servant',1,'Somewhere in Nevada','08059443154','Mrs. Amina John','Nurse',1,'08059443154',6);
/*!40000 ALTER TABLE `parental_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_categories`
--

DROP TABLE IF EXISTS `payment_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_categories`
--

LOCK TABLES `payment_categories` WRITE;
/*!40000 ALTER TABLE `payment_categories` DISABLE KEYS */;
INSERT INTO `payment_categories` VALUES (1,'Tuition'),(2,'Medical'),(3,'Computer'),(4,'Library'),(5,'Examination'),(6,'Special Islamic Programme'),(7,'ICT Services'),(8,'E-Learning'),(9,'Graduation'),(10,'P.T.A'),(11,'Science/Art Practical Levy'),(12,'Prize-Giving Day Levy'),(13,'Textbooks'),(14,'Notebooks'),(15,'Development Fee'),(16,'Registration'),(17,'Uniform'),(18,'Sport Wear'),(19,'Student Booklet'),(20,'Sweater'),(21,'WAEC'),(22,'NECO'),(23,'JSCE'),(24,'Common Entrance'),(25,'Printing'),(26,'Cafeteria'),(27,'Quarter Fees'),(28,'Half Fees'),(29,'Full Fees');
/*!40000 ALTER TABLE `payment_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admission_no` varchar(12) DEFAULT NULL,
  `paid_amount` float DEFAULT NULL,
  `date_of_payment` date DEFAULT NULL,
  `accountant_name` varchar(50) DEFAULT NULL,
  `teller_no` varchar(10) DEFAULT NULL,
  `receipt_no` varchar(10) DEFAULT NULL,
  `class_id` int(11) NOT NULL,
  `term_id` int(11) NOT NULL,
  `academic_session_id` int(11) NOT NULL,
  `payment_category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`class_id`,`term_id`,`academic_session_id`,`payment_category_id`),
  KEY `fk_payments_classes1_idx` (`class_id`),
  KEY `fk_payments_payment_categories1_idx` (`payment_category_id`),
  KEY `fk_payments_terms1_idx` (`term_id`),
  KEY `fk_payments_academic_sessions1_idx` (`academic_session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pin_payments`
--

DROP TABLE IF EXISTS `pin_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pin_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applicant_firstname` varchar(25) DEFAULT NULL,
  `applicant_surname` varchar(50) DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `receipt_no` varchar(10) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `accountant` varchar(50) DEFAULT NULL,
  `pin_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`pin_id`),
  KEY `fk_pin_payments_pins1_idx` (`pin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pin_payments`
--

LOCK TABLES `pin_payments` WRITE;
/*!40000 ALTER TABLE `pin_payments` DISABLE KEYS */;
INSERT INTO `pin_payments` VALUES (1,'Williams','Onen',2500,'10753718','2013-09-12','Ais Accountant',1),(2,'Student','Demo',2500,'17008946','2013-09-12','Ais Accountant',2);
/*!40000 ALTER TABLE `pin_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pins`
--

DROP TABLE IF EXISTS `pins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pin_no` varchar(12) DEFAULT NULL,
  `usage_status` int(2) DEFAULT NULL,
  `issuance_status` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pins`
--

LOCK TABLES `pins` WRITE;
/*!40000 ALTER TABLE `pins` DISABLE KEYS */;
INSERT INTO `pins` VALUES (1,'230779485127',1,1),(2,'121567026073',1,1),(3,'108015380130',0,0),(4,'141201293637',0,0),(5,'194586413821',0,0),(6,'357420443205',0,0),(7,'141120128813',0,0),(8,'135610207019',0,0),(9,'550032331121',0,0),(10,'136737982056',0,0);
/*!40000 ALTER TABLE `pins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions_bank`
--

DROP TABLE IF EXISTS `questions_bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions_bank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `question_title` varchar(255) DEFAULT NULL,
  `question_file_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`user_id`,`class_id`,`subject_id`),
  KEY `fk_questions_bank_users1_idx` (`user_id`),
  KEY `fk_questions_bank_classes1_idx` (`class_id`),
  KEY `fk_questions_bank_subjects1_idx` (`subject_id`),
  CONSTRAINT `fk_questions_bank_classes1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_questions_bank_subjects1` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_questions_bank_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions_bank`
--

LOCK TABLES `questions_bank` WRITE;
/*!40000 ALTER TABLE `questions_bank` DISABLE KEYS */;
INSERT INTO `questions_bank` VALUES (3,3,33,1,'Ss1 A Maths Exam First Term','/uploads/questions_bank/ss1_a_maths_exam_first_term.doc'),(4,4,36,2,'Ss2 A English Exam First Term','/uploads/questions_bank/ss2_a_english_exam_first_term.pdf');
/*!40000 ALTER TABLE `questions_bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registered_subjects`
--

DROP TABLE IF EXISTS `registered_subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registered_subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`subject_id`,`class_id`),
  KEY `fk_registered_subjects_subjects1_idx` (`subject_id`),
  KEY `fk_registered_subjects_classes1_idx` (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=413 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registered_subjects`
--

LOCK TABLES `registered_subjects` WRITE;
/*!40000 ALTER TABLE `registered_subjects` DISABLE KEYS */;
INSERT INTO `registered_subjects` VALUES (1,1,2),(7,1,3),(13,1,4),(20,1,5),(29,1,6),(38,1,7),(47,1,8),(56,1,9),(65,1,10),(75,1,11),(87,1,12),(99,1,13),(111,1,14),(123,1,15),(135,1,16),(147,1,17),(159,1,18),(171,1,19),(184,1,20),(197,1,21),(210,1,22),(223,1,23),(236,1,24),(248,1,25),(263,1,26),(278,1,27),(293,1,28),(311,1,29),(329,1,30),(347,1,31),(366,1,32),(393,1,36),(399,1,37),(74,2,11),(86,2,12),(98,2,13),(110,2,14),(122,2,15),(134,2,16),(146,2,17),(158,2,18),(294,2,28),(312,2,29),(330,2,30),(348,2,31),(367,2,32),(389,2,36),(400,2,37),(388,3,36),(390,4,36),(391,5,36),(2,6,2),(8,6,3),(14,6,4),(21,6,5),(30,6,6),(39,6,7),(48,6,8),(57,6,9),(66,6,10),(76,6,11),(88,6,12),(100,6,13),(112,6,14),(124,6,15),(136,6,16),(148,6,17),(160,6,18),(172,6,19),(185,6,20),(198,6,21),(211,6,22),(224,6,23),(237,6,24),(3,7,2),(9,7,3),(15,7,4),(22,7,5),(31,7,6),(40,7,7),(49,7,8),(58,7,9),(67,7,10),(4,8,2),(10,8,3),(16,8,4),(23,8,5),(32,8,6),(41,8,7),(50,8,8),(59,8,9),(68,8,10),(5,9,2),(11,9,3),(17,9,4),(24,9,5),(33,9,6),(42,9,7),(51,9,8),(60,9,9),(69,9,10),(83,9,11),(95,9,12),(107,9,13),(118,9,14),(130,9,15),(142,9,16),(154,9,17),(166,9,18),(177,9,19),(190,9,20),(203,9,21),(216,9,22),(229,9,23),(242,9,24),(255,9,25),(270,9,26),(285,9,27),(303,9,28),(321,9,29),(339,9,30),(357,9,31),(376,9,32),(387,9,36),(407,9,37),(6,10,2),(12,10,3),(18,10,4),(25,10,5),(34,10,6),(43,10,7),(52,10,8),(61,10,9),(70,10,10),(84,10,11),(96,10,12),(108,10,13),(119,10,14),(131,10,15),(143,10,16),(155,10,17),(167,10,18),(178,10,19),(191,10,20),(204,10,21),(217,10,22),(230,10,23),(243,10,24),(256,10,25),(271,10,26),(286,10,27),(304,10,28),(322,10,29),(340,10,30),(358,10,31),(377,10,32),(384,10,36),(410,10,37),(19,11,5),(28,11,6),(37,11,7),(46,11,8),(55,11,9),(64,11,10),(73,11,11),(85,11,12),(97,11,13),(109,11,14),(121,11,15),(133,11,16),(145,11,17),(157,11,18),(169,11,19),(182,11,20),(195,11,21),(208,11,22),(221,11,23),(234,11,24),(247,11,25),(262,11,26),(277,11,27),(292,11,28),(310,11,29),(328,11,30),(346,11,31),(365,11,32),(394,11,36),(397,11,37),(27,12,5),(36,12,6),(45,12,7),(54,12,8),(63,12,9),(72,12,10),(77,13,11),(89,13,12),(101,13,13),(113,13,14),(125,13,15),(137,13,16),(149,13,17),(161,13,18),(78,14,11),(90,14,12),(102,14,13),(179,14,19),(192,14,20),(205,14,21),(218,14,22),(231,14,23),(244,14,24),(79,15,11),(91,15,12),(103,15,13),(114,15,14),(126,15,15),(138,15,16),(150,15,17),(162,15,18),(173,15,19),(186,15,20),(199,15,21),(212,15,22),(225,15,23),(238,15,24),(252,15,25),(267,15,26),(282,15,27),(300,15,28),(318,15,29),(336,15,30),(354,15,31),(373,15,32),(403,15,37),(26,16,5),(35,16,6),(44,16,7),(53,16,8),(62,16,9),(71,16,10),(80,16,11),(92,16,12),(104,16,13),(115,16,14),(127,16,15),(139,16,16),(151,16,17),(163,16,18),(174,16,19),(187,16,20),(200,16,21),(213,16,22),(226,16,23),(239,16,24),(257,16,25),(272,16,26),(287,16,27),(305,16,28),(323,16,29),(341,16,30),(359,16,31),(378,16,32),(81,17,11),(93,17,12),(105,17,13),(116,17,14),(128,17,15),(140,17,16),(152,17,17),(164,17,18),(175,17,19),(188,17,20),(201,17,21),(214,17,22),(227,17,23),(240,17,24),(253,17,25),(268,17,26),(283,17,27),(301,17,28),(319,17,29),(337,17,30),(82,18,11),(94,18,12),(106,18,13),(117,18,14),(129,18,15),(141,18,16),(153,18,17),(165,18,18),(176,18,19),(189,18,20),(202,18,21),(215,18,22),(228,18,23),(241,18,24),(254,18,25),(269,18,26),(284,18,27),(302,18,28),(320,18,29),(338,18,30),(356,18,31),(375,18,32),(120,19,14),(132,19,15),(144,19,16),(156,19,17),(168,19,18),(299,19,28),(317,19,29),(335,19,30),(353,19,31),(372,19,32),(392,19,36),(409,19,37),(180,20,19),(193,20,20),(206,20,21),(219,20,22),(232,20,23),(245,20,24),(258,20,25),(273,20,26),(288,20,27),(306,20,28),(324,20,29),(342,20,30),(360,20,31),(379,20,32),(385,20,36),(411,20,37),(181,21,19),(194,21,20),(207,21,21),(220,21,22),(233,21,23),(246,21,24),(170,22,19),(183,22,20),(196,22,21),(209,22,22),(222,22,23),(235,22,24),(296,22,28),(314,22,29),(332,22,30),(350,22,31),(369,22,32),(402,22,37),(249,23,25),(264,23,26),(279,23,27),(250,24,25),(265,24,26),(280,24,27),(298,24,28),(316,24,29),(334,24,30),(352,24,31),(371,24,32),(251,25,25),(266,25,26),(281,25,27),(297,25,28),(315,25,29),(333,25,30),(351,25,31),(370,25,32),(259,26,25),(274,26,26),(289,26,27),(307,26,28),(325,26,29),(343,26,30),(361,26,31),(380,26,32),(260,27,25),(275,27,26),(290,27,27),(308,27,28),(326,27,29),(344,27,30),(349,27,31),(362,27,31),(368,27,32),(381,27,32),(261,28,25),(276,28,26),(291,28,27),(309,28,28),(327,28,29),(345,28,30),(363,28,31),(382,28,32),(364,29,31),(383,29,32),(395,29,36),(386,30,36),(406,30,37),(396,31,36),(398,32,37),(401,33,37),(295,34,28),(313,34,29),(331,34,30),(404,34,37),(405,35,37),(408,36,37),(412,37,37),(355,38,31),(374,38,32);
/*!40000 ALTER TABLE `registered_subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `religions`
--

DROP TABLE IF EXISTS `religions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `religions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `religion_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `religions`
--

LOCK TABLES `religions` WRITE;
/*!40000 ALTER TABLE `religions` DISABLE KEYS */;
INSERT INTO `religions` VALUES (1,'Islam'),(2,'Christian'),(3,'Other');
/*!40000 ALTER TABLE `religions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `results`
--

DROP TABLE IF EXISTS `results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `results` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admission_no` varchar(12) DEFAULT NULL,
  `score` float DEFAULT NULL,
  `assessment_type_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `term_id` int(11) NOT NULL,
  `academic_session_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `published` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`,`assessment_type_id`,`subject_id`,`term_id`,`academic_session_id`,`class_id`),
  KEY `fk_results_assessment_types1_idx` (`assessment_type_id`),
  KEY `fk_results_terms1_idx` (`term_id`),
  KEY `fk_results_academic_sessions1_idx` (`academic_session_id`),
  KEY `fk_results_subjects1_idx` (`subject_id`),
  KEY `fk_results_classes1_idx` (`class_id`),
  CONSTRAINT `fk_results_assessment_types1` FOREIGN KEY (`assessment_type_id`) REFERENCES `assessment_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `results`
--

LOCK TABLES `results` WRITE;
/*!40000 ALTER TABLE `results` DISABLE KEYS */;
INSERT INTO `results` VALUES (1,'AR/13/677038',10,1,1,1,2,34,2),(2,'AR/13/172163',15,1,1,1,2,34,2),(3,'AR/13/677038',5,2,1,1,2,34,2),(4,'AR/13/172163',6,2,1,1,2,34,2),(5,'AR/13/677038',8,3,1,1,2,34,2),(6,'AR/13/172163',4,3,1,1,2,34,2),(7,'AR/13/677038',45,4,1,1,2,34,2),(8,'AR/13/172163',40,4,1,1,2,34,2);
/*!40000 ALTER TABLE `results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Student'),(2,'Teacher'),(3,'Accountant'),(4,'Ecommerce'),(5,'Administrator');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salaries`
--

DROP TABLE IF EXISTS `salaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salaries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `basic_monthly_salary` float DEFAULT NULL,
  `bonus` float DEFAULT NULL,
  `staff_id` int(11) NOT NULL,
  `payment_date` date DEFAULT NULL,
  PRIMARY KEY (`id`,`staff_id`),
  KEY `fk_salaries_staff_records1_idx` (`staff_id`),
  CONSTRAINT `fk_salaries_staff_records1` FOREIGN KEY (`staff_id`) REFERENCES `staff_records` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salaries`
--

LOCK TABLES `salaries` WRITE;
/*!40000 ALTER TABLE `salaries` DISABLE KEYS */;
INSERT INTO `salaries` VALUES (2,20000,0,1,'2013-09-07');
/*!40000 ALTER TABLE `salaries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule_of_fees`
--

DROP TABLE IF EXISTS `schedule_of_fees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule_of_fees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_category_id` int(11) NOT NULL,
  `amount` float DEFAULT NULL,
  `class_id` int(11) NOT NULL,
  `term_id` int(11) NOT NULL,
  `recurring_payment` int(2) NOT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`,`payment_category_id`,`class_id`,`term_id`),
  KEY `fk_schedule_of_fees_payment_categories1_idx` (`payment_category_id`),
  KEY `fk_schedule_of_fees_classes1_idx` (`class_id`),
  KEY `fk_schedule_of_fees_terms1_idx` (`term_id`),
  CONSTRAINT `fk_schedule_of_fees_payment_categories1` FOREIGN KEY (`payment_category_id`) REFERENCES `payment_categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1690 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule_of_fees`
--

LOCK TABLES `schedule_of_fees` WRITE;
/*!40000 ALTER TABLE `schedule_of_fees` DISABLE KEYS */;
INSERT INTO `schedule_of_fees` VALUES (1,1,45000,1,1,1,1),(2,16,2500,1,1,2,1),(3,2,1000,1,1,1,1),(4,13,4000,1,1,2,1),(5,14,1000,1,1,2,1),(6,5,500,1,1,1,1),(7,17,8000,1,1,2,1),(8,18,2200,1,1,2,1),(9,20,2000,1,1,2,1),(10,7,2000,1,1,1,1),(11,15,3000,1,1,2,1),(12,10,500,1,1,1,1),(13,19,500,1,1,2,1),(14,1,53000,2,1,1,1),(15,16,2500,2,1,2,1),(16,2,1000,2,1,1,1),(17,13,7000,2,1,2,1),(18,14,3000,2,1,2,1),(19,5,2000,2,1,1,1),(20,17,9000,2,1,2,1),(21,18,2500,2,1,2,1),(22,20,2200,2,1,2,1),(23,7,2000,2,1,1,1),(24,15,3000,2,1,2,1),(25,10,500,2,1,1,1),(26,19,500,2,1,2,1),(27,1,53000,3,1,1,1),(28,16,2500,3,1,2,1),(29,2,1000,3,1,1,1),(30,13,7000,3,1,2,1),(31,14,3000,3,1,2,1),(32,5,2000,3,1,1,1),(33,17,9000,3,1,2,1),(34,18,2500,3,1,2,1),(35,20,2200,3,1,2,1),(36,7,2000,3,1,1,1),(37,15,3000,3,1,2,1),(38,10,500,3,1,1,1),(39,19,500,3,1,2,1),(40,1,53000,4,1,1,1),(41,16,2500,4,1,2,1),(42,2,1000,4,1,1,1),(43,13,7000,4,1,2,1),(44,14,3000,4,1,2,1),(45,5,2000,4,1,1,1),(46,17,9000,4,1,2,1),(47,18,2500,4,1,2,1),(48,20,2200,4,1,2,1),(49,7,2000,4,1,1,1),(50,15,3000,4,1,2,1),(51,10,500,4,1,1,1),(52,19,500,4,1,2,1),(53,1,53000,5,1,1,1),(54,16,2500,5,1,2,1),(55,2,1000,5,1,1,1),(56,13,7000,5,1,2,1),(57,14,3000,5,1,2,1),(58,5,2000,5,1,1,1),(59,17,9000,5,1,2,1),(60,18,2500,5,1,2,1),(61,20,2200,5,1,2,1),(62,7,2000,5,1,1,1),(63,15,3000,5,1,2,1),(64,10,500,5,1,1,1),(65,19,500,5,1,2,1),(66,1,53000,6,1,1,1),(67,16,2500,6,1,2,1),(68,2,1000,6,1,1,1),(69,13,7000,6,1,2,1),(70,14,3000,6,1,2,1),(71,5,2000,6,1,1,1),(72,17,9000,6,1,2,1),(73,18,2500,6,1,2,1),(74,20,2200,6,1,2,1),(75,7,2000,6,1,1,1),(76,15,3000,6,1,2,1),(77,10,500,6,1,1,1),(78,19,500,6,1,2,1),(79,1,53000,7,1,1,1),(80,16,2500,7,1,2,1),(81,2,1000,7,1,1,1),(82,13,7000,7,1,2,1),(83,14,3000,7,1,2,1),(84,5,2000,7,1,1,1),(85,17,9000,7,1,2,1),(86,18,2500,7,1,2,1),(87,20,2200,7,1,2,1),(88,7,2000,7,1,1,1),(89,15,3000,7,1,2,1),(90,10,500,7,1,1,1),(91,19,500,7,1,2,1),(92,1,53000,8,1,1,1),(93,16,2500,8,1,2,1),(94,2,1000,8,1,1,1),(95,13,8000,8,1,2,1),(96,14,3000,8,1,2,1),(97,5,2000,8,1,1,1),(98,17,9000,8,1,2,1),(99,18,2500,8,1,2,1),(100,20,2200,8,1,2,1),(101,7,2000,8,1,1,1),(102,15,3000,8,1,2,1),(103,10,500,8,1,1,1),(104,19,500,8,1,2,1),(105,1,53000,9,1,1,1),(106,16,2500,9,1,2,1),(107,2,1000,9,1,1,1),(108,13,8000,9,1,2,1),(109,14,3000,9,1,2,1),(110,5,2000,9,1,1,1),(111,17,9000,9,1,2,1),(112,18,2500,9,1,2,1),(113,20,2200,9,1,2,1),(114,7,2000,9,1,1,1),(115,15,3000,9,1,2,1),(116,10,500,9,1,1,1),(117,19,500,9,1,2,1),(118,1,53000,10,1,1,1),(119,16,2500,10,1,2,1),(120,2,1000,10,1,1,1),(121,13,8000,10,1,2,1),(122,14,3000,10,1,2,1),(123,5,2000,10,1,1,1),(124,17,9000,10,1,2,1),(125,18,2500,10,1,2,1),(126,20,2200,10,1,2,1),(127,7,2000,10,1,1,1),(128,15,3000,10,1,2,1),(129,10,500,10,1,1,1),(130,19,500,10,1,2,1),(131,1,55000,11,1,1,1),(132,16,3000,11,1,2,1),(133,2,1000,11,1,1,1),(134,13,14000,11,1,2,1),(135,14,4500,11,1,2,1),(136,5,2000,11,1,1,1),(137,17,12300,11,1,2,1),(138,18,2800,11,1,2,1),(139,20,2500,11,1,2,1),(140,7,2000,11,1,1,1),(141,15,3500,11,1,2,1),(142,10,500,11,1,1,1),(143,19,500,11,1,2,1),(144,3,1000,11,1,1,1),(145,4,500,11,1,1,1),(146,6,8000,11,1,1,1),(147,1,55000,12,1,1,1),(148,16,3000,12,1,2,1),(149,2,1000,12,1,1,1),(150,13,14000,12,1,2,1),(151,14,4500,12,1,2,1),(152,5,2000,12,1,1,1),(153,17,12300,12,1,2,1),(154,18,2800,12,1,2,1),(155,20,2500,12,1,2,1),(156,7,2000,12,1,1,1),(157,15,3500,12,1,2,1),(158,10,500,12,1,1,1),(159,19,500,12,1,2,1),(160,3,1000,12,1,1,1),(161,4,500,12,1,1,1),(162,6,8000,12,1,1,1),(163,1,55000,13,1,1,1),(164,16,3000,13,1,2,1),(165,2,1000,13,1,1,1),(166,13,14000,13,1,2,1),(167,14,4500,13,1,2,1),(168,5,2000,13,1,1,1),(169,17,12300,13,1,2,1),(170,18,2800,13,1,2,1),(171,20,2500,13,1,2,1),(172,7,2000,13,1,1,1),(173,15,3500,13,1,2,1),(174,10,500,13,1,1,1),(175,19,500,13,1,2,1),(176,3,1000,13,1,1,1),(177,4,500,13,1,1,1),(178,6,8000,13,1,1,1),(179,1,55000,14,1,1,1),(180,16,3000,14,1,2,1),(181,2,1000,14,1,1,1),(182,13,14000,14,1,2,1),(183,14,4500,14,1,2,1),(184,5,2000,14,1,1,1),(185,17,12300,14,1,2,1),(186,18,2800,14,1,2,1),(187,20,2500,14,1,2,1),(188,7,2000,14,1,1,1),(189,15,3500,14,1,2,1),(190,10,500,14,1,1,1),(191,19,500,14,1,2,1),(192,3,1000,14,1,1,1),(193,4,500,14,1,1,1),(194,6,8000,14,1,1,1),(195,1,55000,15,1,1,1),(196,16,3000,15,1,2,1),(197,2,1000,15,1,1,1),(198,13,14000,15,1,2,1),(199,14,4500,15,1,2,1),(200,5,2000,15,1,1,1),(201,17,12300,15,1,2,1),(202,18,2800,15,1,2,1),(203,20,2500,15,1,2,1),(204,7,2000,15,1,1,1),(205,15,3500,15,1,2,1),(206,10,500,15,1,1,1),(207,19,500,15,1,2,1),(208,3,1000,15,1,1,1),(209,4,500,15,1,1,1),(210,6,8000,15,1,1,1),(211,1,55000,16,1,1,1),(212,16,3000,16,1,2,1),(213,2,1000,16,1,1,1),(214,13,14000,16,1,2,1),(215,14,4500,16,1,2,1),(216,5,2000,16,1,1,1),(217,17,12300,16,1,2,1),(218,18,2800,16,1,2,1),(219,20,2500,16,1,2,1),(220,7,2000,16,1,1,1),(221,15,3500,16,1,2,1),(222,10,500,16,1,1,1),(223,19,500,16,1,2,1),(224,3,1000,16,1,1,1),(225,4,500,16,1,1,1),(226,6,8000,16,1,1,1),(227,1,55000,17,1,1,1),(228,16,3000,17,1,2,1),(229,2,1000,17,1,1,1),(230,13,14000,17,1,2,1),(231,14,4500,17,1,2,1),(232,5,2000,17,1,1,1),(233,17,12300,17,1,2,1),(234,18,2800,17,1,2,1),(235,20,2500,17,1,2,1),(236,7,2000,17,1,1,1),(237,15,3500,17,1,2,1),(238,10,500,17,1,1,1),(239,19,500,17,1,2,1),(240,3,1000,17,1,1,1),(241,4,500,17,1,1,1),(242,6,8000,17,1,1,1),(243,1,55000,18,1,1,1),(244,16,3000,18,1,2,1),(245,2,1000,18,1,1,1),(246,13,14000,18,1,2,1),(247,14,4500,18,1,2,1),(248,5,2000,18,1,1,1),(249,17,12300,18,1,2,1),(250,18,2800,18,1,2,1),(251,20,2500,18,1,2,1),(252,7,2000,18,1,1,1),(253,15,3500,18,1,2,1),(254,10,500,18,1,1,1),(255,19,500,18,1,2,1),(256,3,1000,18,1,1,1),(257,4,500,18,1,1,1),(258,6,8000,18,1,1,1),(259,1,57000,19,1,1,1),(260,16,3000,19,1,2,1),(261,2,1000,19,1,1,1),(262,13,15000,19,1,2,1),(263,14,5000,19,1,2,1),(264,5,2000,19,1,1,1),(265,17,12500,19,1,2,1),(266,18,3000,19,1,2,1),(267,20,2800,19,1,2,1),(268,7,2000,19,1,1,1),(269,15,3500,19,1,2,1),(270,10,500,19,1,1,1),(271,19,500,19,1,2,1),(272,3,1000,19,1,1,1),(273,4,500,19,1,1,1),(274,6,8000,19,1,1,1),(275,1,57000,20,1,1,1),(276,16,3000,20,1,2,1),(277,2,1000,20,1,1,1),(278,13,15000,20,1,2,1),(279,14,5000,20,1,2,1),(280,5,2000,20,1,1,1),(281,17,12500,20,1,2,1),(282,18,3000,20,1,2,1),(283,20,2800,20,1,2,1),(284,7,2000,20,1,1,1),(285,15,3500,20,1,2,1),(286,10,500,20,1,1,1),(287,19,500,20,1,2,1),(288,3,1000,20,1,1,1),(289,4,500,20,1,1,1),(290,6,8000,20,1,1,1),(291,1,57000,21,1,1,1),(292,16,3000,21,1,2,1),(293,2,1000,21,1,1,1),(294,13,15000,21,1,2,1),(295,14,5000,21,1,2,1),(296,5,2000,21,1,1,1),(297,17,12500,21,1,2,1),(298,18,3000,21,1,2,1),(299,20,2800,21,1,2,1),(300,7,2000,21,1,1,1),(301,15,3500,21,1,2,1),(302,10,500,21,1,1,1),(303,19,500,21,1,2,1),(304,3,1000,21,1,1,1),(305,4,500,21,1,1,1),(306,6,8000,21,1,1,1),(307,1,57000,22,1,1,1),(308,16,3000,22,1,2,1),(309,2,1000,22,1,1,1),(310,13,15000,22,1,2,1),(311,14,5000,22,1,2,1),(312,5,2000,22,1,1,1),(313,17,12500,22,1,2,1),(314,18,3000,22,1,2,1),(315,20,2800,22,1,2,1),(316,7,2000,22,1,1,1),(317,15,3500,22,1,2,1),(318,10,500,22,1,1,1),(319,19,500,22,1,2,1),(320,3,1000,22,1,1,1),(321,4,500,22,1,1,1),(322,6,8000,22,1,1,1),(323,1,57000,23,1,1,1),(324,16,3000,23,1,2,1),(325,2,1000,23,1,1,1),(326,13,15000,23,1,2,1),(327,14,5000,23,1,2,1),(328,5,2000,23,1,1,1),(329,17,12500,23,1,2,1),(330,18,3000,23,1,2,1),(331,20,2800,23,1,2,1),(332,7,2000,23,1,1,1),(333,15,3500,23,1,2,1),(334,10,500,23,1,1,1),(335,19,500,23,1,2,1),(336,3,1000,23,1,1,1),(337,4,500,23,1,1,1),(338,6,8000,23,1,1,1),(339,1,57000,24,1,1,1),(340,16,3000,24,1,2,1),(341,2,1000,24,1,1,1),(342,13,15000,24,1,2,1),(343,14,5000,24,1,2,1),(344,5,2000,24,1,1,1),(345,17,12500,24,1,2,1),(346,18,3000,24,1,2,1),(347,20,2800,24,1,2,1),(348,7,2000,24,1,1,1),(349,15,3500,24,1,2,1),(350,10,500,24,1,1,1),(351,19,500,24,1,2,1),(352,3,1000,24,1,1,1),(353,4,500,24,1,1,1),(354,6,8000,24,1,1,1),(355,1,60000,25,1,1,1),(356,16,4000,25,1,2,1),(357,2,1000,25,1,1,1),(358,13,19000,25,1,2,1),(359,14,5500,25,1,2,1),(360,3,1500,25,1,1,1),(361,4,700,25,1,1,1),(362,5,2500,25,1,1,1),(363,17,15500,25,1,2,1),(364,18,3500,25,1,2,1),(365,7,2000,25,1,1,1),(366,15,5000,25,1,2,1),(367,10,500,25,1,1,1),(368,19,500,25,1,2,1),(369,6,8000,25,1,1,1),(370,11,2500,25,1,1,1),(371,8,8000,25,1,2,1),(372,1,60000,26,1,1,1),(373,16,4000,26,1,2,1),(374,2,1000,26,1,1,1),(375,13,19000,26,1,2,1),(376,14,5500,26,1,2,1),(377,3,1500,26,1,1,1),(378,4,700,26,1,1,1),(379,5,2500,26,1,1,1),(380,17,15500,26,1,2,1),(381,18,3500,26,1,2,1),(382,7,2000,26,1,1,1),(383,15,5000,26,1,2,1),(384,10,500,26,1,1,1),(385,19,500,26,1,2,1),(386,6,8000,26,1,1,1),(387,11,2500,26,1,1,1),(388,8,8000,26,1,2,1),(389,1,60000,27,1,1,1),(390,16,4000,27,1,2,1),(391,2,1000,27,1,1,1),(392,13,19000,27,1,2,1),(393,14,5500,27,1,2,1),(394,3,1500,27,1,1,1),(395,4,700,27,1,1,1),(396,5,2500,27,1,1,1),(397,17,15500,27,1,2,1),(398,18,3500,27,1,2,1),(399,7,2000,27,1,1,1),(400,15,5000,27,1,2,1),(401,10,500,27,1,1,1),(402,19,500,27,1,2,1),(403,6,8000,27,1,1,1),(404,11,2500,27,1,1,1),(405,8,8000,27,1,2,1),(406,1,60000,28,1,1,1),(407,16,4000,28,1,2,1),(408,2,1000,28,1,1,1),(409,13,19000,28,1,2,1),(410,14,5500,28,1,2,1),(411,3,1500,28,1,1,1),(412,4,700,28,1,1,1),(413,5,2500,28,1,1,1),(414,17,15500,28,1,2,1),(415,18,3500,28,1,2,1),(416,7,2000,28,1,1,1),(417,15,5000,28,1,2,1),(418,10,500,28,1,1,1),(419,19,500,28,1,2,1),(420,6,8000,28,1,1,1),(421,11,2500,28,1,1,1),(422,8,8000,28,1,2,1),(423,1,60000,29,1,1,1),(424,16,4000,29,1,2,1),(425,2,1000,29,1,1,1),(426,13,19000,29,1,2,1),(427,14,5500,29,1,2,1),(428,3,1500,29,1,1,1),(429,4,700,29,1,1,1),(430,5,2500,29,1,1,1),(431,17,15500,29,1,2,1),(432,18,3500,29,1,2,1),(433,7,2000,29,1,1,1),(434,15,5000,29,1,2,1),(435,10,500,29,1,1,1),(436,19,500,29,1,2,1),(437,6,8000,29,1,1,1),(438,11,2500,29,1,1,1),(439,8,8000,29,1,2,1),(440,1,60000,30,1,1,1),(441,16,4000,30,1,2,1),(442,2,1000,30,1,1,1),(443,13,19000,30,1,2,1),(444,14,5500,30,1,2,1),(445,3,1500,30,1,1,1),(446,4,700,30,1,1,1),(447,5,2500,30,1,1,1),(448,17,15500,30,1,2,1),(449,18,3500,30,1,2,1),(450,7,2000,30,1,1,1),(451,15,5000,30,1,2,1),(452,10,500,30,1,1,1),(453,19,500,30,1,2,1),(454,6,8000,30,1,1,1),(455,11,2500,30,1,1,1),(456,8,8000,30,1,2,1),(457,1,60000,31,1,1,1),(458,16,4000,31,1,2,1),(459,2,1000,31,1,1,1),(460,13,19000,31,1,2,1),(461,14,5500,31,1,2,1),(462,3,1500,31,1,1,1),(463,4,700,31,1,1,1),(464,5,2500,31,1,1,1),(465,17,15500,31,1,2,1),(466,18,3500,31,1,2,1),(467,7,2000,31,1,1,1),(468,15,5000,31,1,2,1),(469,10,500,31,1,1,1),(470,19,500,31,1,2,1),(471,6,8000,31,1,1,1),(472,11,2500,31,1,1,1),(473,8,8000,31,1,2,1),(474,1,60000,32,1,1,1),(475,16,4000,32,1,2,1),(476,2,1000,32,1,1,1),(477,13,19000,32,1,2,1),(478,14,5500,32,1,2,1),(479,3,1500,32,1,1,1),(480,4,700,32,1,1,1),(481,5,2500,32,1,1,1),(482,17,15500,32,1,2,1),(483,18,3500,32,1,2,1),(484,7,2000,32,1,1,1),(485,15,5000,32,1,2,1),(486,10,500,32,1,1,1),(487,19,500,32,1,2,1),(488,6,8000,32,1,1,1),(489,11,2500,32,1,1,1),(490,8,8000,32,1,2,1),(491,1,75000,33,1,1,1),(492,16,5000,33,1,2,1),(493,2,1000,33,1,1,1),(494,13,25000,33,1,2,1),(495,14,6500,33,1,2,1),(496,3,1500,33,1,1,1),(497,4,1000,33,1,1,1),(498,5,3000,33,1,1,1),(499,17,17000,33,1,2,1),(500,18,3800,33,1,2,1),(501,7,2000,33,1,1,1),(502,15,5000,33,1,2,1),(503,10,500,33,1,1,1),(504,19,500,33,1,2,1),(505,6,8000,33,1,1,1),(506,11,5000,33,1,1,1),(507,8,8000,33,1,2,1),(508,1,75000,34,1,1,1),(509,16,5000,34,1,2,1),(510,2,1000,34,1,1,1),(511,13,25000,34,1,2,1),(512,14,6500,34,1,2,1),(513,3,1500,34,1,1,1),(514,4,1000,34,1,1,1),(515,5,3000,34,1,1,1),(516,17,17000,34,1,2,1),(517,18,3800,34,1,2,1),(518,7,2000,34,1,1,1),(519,15,5000,34,1,2,1),(520,10,500,34,1,1,1),(521,19,500,34,1,2,1),(522,6,8000,34,1,1,1),(523,11,5000,34,1,1,1),(524,8,8000,34,1,2,1),(525,1,75000,35,1,1,1),(526,16,5000,35,1,2,1),(527,2,1000,35,1,1,1),(528,13,25000,35,1,2,1),(529,14,6500,35,1,2,1),(530,3,1500,35,1,1,1),(531,4,1000,35,1,1,1),(532,5,3000,35,1,1,1),(533,17,17000,35,1,2,1),(534,18,3800,35,1,2,1),(535,7,2000,35,1,1,1),(536,15,5000,35,1,2,1),(537,10,500,35,1,1,1),(538,19,500,35,1,2,1),(539,6,8000,35,1,1,1),(540,11,5000,35,1,1,1),(541,8,8000,35,1,2,1),(542,1,75000,36,1,1,1),(543,16,5000,36,1,2,1),(544,2,1000,36,1,1,1),(545,13,25000,36,1,2,1),(546,14,6500,36,1,2,1),(547,3,1500,36,1,1,1),(548,4,1000,36,1,1,1),(549,5,3000,36,1,1,1),(550,17,17000,36,1,2,1),(551,18,3800,36,1,2,1),(552,7,2000,36,1,1,1),(553,15,5000,36,1,2,1),(554,10,500,36,1,1,1),(555,19,500,36,1,2,1),(556,6,8000,36,1,1,1),(557,11,5000,36,1,1,1),(558,8,8000,36,1,2,1),(559,1,75000,37,1,1,1),(560,16,5000,37,1,2,1),(561,2,1000,37,1,1,1),(562,13,25000,37,1,2,1),(563,14,6500,37,1,2,1),(564,3,1500,37,1,1,1),(565,4,1000,37,1,1,1),(566,5,3000,37,1,1,1),(567,17,17000,37,1,2,1),(568,18,3800,37,1,2,1),(569,7,2000,37,1,1,1),(570,15,5000,37,1,2,1),(571,10,500,37,1,1,1),(572,19,500,37,1,2,1),(573,6,8000,37,1,1,1),(574,11,5000,37,1,1,1),(575,8,8000,37,1,2,1),(576,1,75000,38,1,1,1),(577,16,5000,38,1,2,1),(578,2,1000,38,1,1,1),(579,13,25000,38,1,2,1),(580,14,6500,38,1,2,1),(581,3,1500,38,1,1,1),(582,4,1000,38,1,1,1),(583,5,3000,38,1,1,1),(584,17,17000,38,1,2,1),(585,18,3800,38,1,2,1),(586,7,2000,38,1,1,1),(587,15,5000,38,1,2,1),(588,10,500,38,1,1,1),(589,19,500,38,1,2,1),(590,6,8000,38,1,1,1),(591,11,5000,38,1,1,1),(592,8,8000,38,1,2,1),(593,1,75000,39,1,1,1),(594,16,5000,39,1,2,1),(595,2,1000,39,1,1,1),(596,13,25000,39,1,2,1),(597,14,6500,39,1,2,1),(598,3,1500,39,1,1,1),(599,4,1000,39,1,1,1),(600,5,3000,39,1,1,1),(601,17,17000,39,1,2,1),(602,18,3800,39,1,2,1),(603,7,2000,39,1,1,1),(604,15,5000,39,1,2,1),(605,10,500,39,1,1,1),(606,19,500,39,1,2,1),(607,6,8000,39,1,1,1),(608,11,5000,39,1,1,1),(609,8,8000,39,1,2,1),(610,1,45000,1,1,1,2),(611,2,1000,1,1,1,2),(612,13,4000,1,1,2,2),(613,14,1000,1,1,2,2),(614,5,500,1,1,1,2),(615,7,2000,1,1,1,2),(616,15,3000,1,1,2,2),(617,10,500,1,1,1,2),(618,1,53000,2,1,1,2),(619,2,1000,2,1,1,2),(620,13,7000,2,1,2,2),(621,14,3000,2,1,2,2),(622,5,2000,2,1,1,2),(623,7,2000,2,1,1,2),(624,15,3000,2,1,2,2),(625,10,500,2,1,1,2),(626,1,53000,3,1,1,2),(627,2,1000,3,1,1,2),(628,13,7000,3,1,2,2),(629,14,3000,3,1,2,2),(630,5,2000,3,1,1,2),(631,7,2000,3,1,1,2),(632,15,3000,3,1,2,2),(633,10,500,3,1,1,2),(634,1,53000,4,1,1,2),(635,2,1000,4,1,1,2),(636,13,7000,4,1,2,2),(637,14,3000,4,1,2,2),(638,5,2000,4,1,1,2),(639,7,2000,4,1,1,2),(640,15,3000,4,1,2,2),(641,10,500,4,1,1,2),(642,1,53000,5,1,1,2),(643,2,1000,5,1,1,2),(644,13,7000,5,1,2,2),(645,14,3000,5,1,2,2),(646,5,2000,5,1,1,2),(647,7,2000,5,1,1,2),(648,15,3000,5,1,2,2),(649,10,500,5,1,1,2),(650,1,53000,6,1,1,2),(651,2,1000,6,1,1,2),(652,13,7000,6,1,2,2),(653,14,3000,6,1,2,2),(654,5,2000,6,1,1,2),(655,7,2000,6,1,1,2),(656,15,3000,6,1,2,2),(657,10,500,6,1,1,2),(658,1,53000,7,1,1,2),(659,2,1000,7,1,1,2),(660,13,7000,7,1,2,2),(661,14,3000,7,1,2,2),(662,5,2000,7,1,1,2),(663,7,2000,7,1,1,2),(664,15,3000,7,1,2,2),(665,10,500,7,1,1,2),(666,1,53000,8,1,1,2),(667,2,1000,8,1,1,2),(668,13,8000,8,1,2,2),(669,14,3000,8,1,2,2),(670,5,2000,8,1,1,2),(671,7,2000,8,1,1,2),(672,15,3000,8,1,2,2),(673,10,500,8,1,1,2),(674,1,53000,9,1,1,2),(675,2,1000,9,1,1,2),(676,13,8000,9,1,2,2),(677,14,3000,9,1,2,2),(678,5,2000,9,1,1,2),(679,7,2000,9,1,1,2),(680,15,3000,9,1,2,2),(681,10,500,9,1,1,2),(682,1,53000,10,1,1,2),(683,2,1000,10,1,1,2),(684,13,8000,10,1,2,2),(685,14,3000,10,1,2,2),(686,5,2000,10,1,1,2),(687,7,2000,10,1,1,2),(688,15,3000,10,1,2,2),(689,10,500,10,1,1,2),(690,1,55000,11,1,1,2),(691,2,1000,11,1,1,2),(692,13,14000,11,1,2,2),(693,14,4500,11,1,2,2),(694,5,2000,11,1,1,2),(695,7,2000,11,1,1,2),(696,15,3500,11,1,2,2),(697,10,500,11,1,1,2),(698,3,1000,11,1,1,2),(699,4,500,11,1,1,2),(700,6,8000,11,1,1,2),(701,1,55000,12,1,1,2),(702,2,1000,12,1,1,2),(703,13,14000,12,1,2,2),(704,14,4500,12,1,2,2),(705,5,2000,12,1,1,2),(706,7,2000,12,1,1,2),(707,15,3500,12,1,2,2),(708,10,500,12,1,1,2),(709,3,1000,12,1,1,2),(710,4,500,12,1,1,2),(711,6,8000,12,1,1,2),(712,1,55000,13,1,1,2),(713,2,1000,13,1,1,2),(714,13,14000,13,1,2,2),(715,14,4500,13,1,2,2),(716,5,2000,13,1,1,2),(717,7,2000,13,1,1,2),(718,15,3500,13,1,2,2),(719,10,500,13,1,1,2),(720,3,1000,13,1,1,2),(721,4,500,13,1,1,2),(722,6,8000,13,1,1,2),(723,1,55000,14,1,1,2),(724,2,1000,14,1,1,2),(725,13,14000,14,1,2,2),(726,14,4500,14,1,2,2),(727,5,2000,14,1,1,2),(728,7,2000,14,1,1,2),(729,15,3500,14,1,2,2),(730,10,500,14,1,1,2),(731,3,1000,14,1,1,2),(732,4,500,14,1,1,2),(733,6,8000,14,1,1,2),(734,1,55000,15,1,1,2),(735,2,1000,15,1,1,2),(736,13,14000,15,1,2,2),(737,14,4500,15,1,2,2),(738,5,2000,15,1,1,2),(739,7,2000,15,1,1,2),(740,15,3500,15,1,2,2),(741,10,500,15,1,1,2),(742,3,1000,15,1,1,2),(743,4,500,15,1,1,2),(744,6,8000,15,1,1,2),(745,1,55000,16,1,1,2),(746,2,1000,16,1,1,2),(747,13,14000,16,1,2,2),(748,14,4500,16,1,2,2),(749,5,2000,16,1,1,2),(750,7,2000,16,1,1,2),(751,15,3500,16,1,2,2),(752,10,500,16,1,1,2),(753,3,1000,16,1,1,2),(754,4,500,16,1,1,2),(755,6,8000,16,1,1,2),(756,1,55000,17,1,1,2),(757,2,1000,17,1,1,2),(758,13,14000,17,1,2,2),(759,14,4500,17,1,2,2),(760,5,2000,17,1,1,2),(761,7,2000,17,1,1,2),(762,15,3500,17,1,2,2),(763,10,500,17,1,1,2),(764,3,1000,17,1,1,2),(765,4,500,17,1,1,2),(766,6,8000,17,1,1,2),(767,1,55000,17,1,1,2),(768,2,1000,18,1,1,2),(769,13,14000,18,1,2,2),(770,14,4500,18,1,2,2),(771,5,2000,18,1,1,2),(772,7,2000,18,1,1,2),(773,15,3500,18,1,2,2),(774,10,500,18,1,1,2),(775,3,1000,18,1,1,2),(776,4,500,18,1,1,2),(777,6,8000,18,1,1,2),(778,1,57000,19,1,1,2),(779,2,1000,19,1,1,2),(780,13,15000,19,1,2,2),(781,14,5000,19,1,2,2),(782,5,2000,19,1,1,2),(783,7,2000,19,1,1,2),(784,15,3500,19,1,2,2),(785,10,500,19,1,1,2),(786,3,1000,19,1,1,2),(787,4,500,19,1,1,2),(788,6,8000,19,1,1,2),(789,1,57000,20,1,1,2),(790,2,1000,20,1,1,2),(791,13,15000,20,1,2,2),(792,14,5000,20,1,2,2),(793,5,2000,20,1,1,2),(794,7,2000,20,1,1,2),(795,15,3500,20,1,2,2),(796,10,500,20,1,1,2),(797,3,1000,20,1,1,2),(798,4,500,20,1,1,2),(799,6,8000,20,1,1,2),(800,1,57000,21,1,1,2),(801,2,1000,21,1,1,2),(802,13,15000,21,1,2,2),(803,14,5000,21,1,2,2),(804,5,2000,21,1,1,2),(805,7,2000,21,1,1,2),(806,15,3500,21,1,2,2),(807,10,500,21,1,1,2),(808,3,1000,21,1,1,2),(809,4,500,21,1,1,2),(810,6,8000,21,1,1,2),(811,1,57000,22,1,1,2),(812,2,1000,22,1,1,2),(813,13,15000,22,1,2,2),(814,14,5000,22,1,2,2),(815,5,2000,22,1,1,2),(816,7,2000,22,1,1,2),(817,15,3500,22,1,2,2),(818,10,500,22,1,1,2),(819,3,1000,22,1,1,2),(820,4,500,22,1,1,2),(821,6,8000,22,1,1,2),(822,1,57000,23,1,1,2),(823,2,1000,23,1,1,2),(824,13,15000,23,1,2,2),(825,14,5000,23,1,2,2),(826,5,2000,23,1,1,2),(827,7,2000,23,1,1,2),(828,15,3500,23,1,2,2),(829,10,500,23,1,1,2),(830,3,1000,23,1,1,2),(831,4,500,23,1,1,2),(832,6,8000,23,1,1,2),(833,1,57000,24,1,1,2),(834,2,1000,24,1,1,2),(835,13,15000,24,1,2,2),(836,14,5000,24,1,2,2),(837,5,2000,24,1,1,2),(838,7,2000,24,1,1,2),(839,15,3500,24,1,2,2),(840,10,500,24,1,1,2),(841,3,1000,24,1,1,2),(842,4,500,24,1,1,2),(843,6,8000,24,1,1,2),(844,1,60000,25,1,1,2),(845,2,1000,25,1,1,2),(846,13,19000,25,1,2,2),(847,14,5500,25,1,2,2),(848,3,1500,25,1,1,2),(849,4,700,25,1,1,2),(850,5,2500,25,1,1,2),(851,6,8000,25,1,1,2),(852,7,2000,25,1,1,2),(853,15,5000,25,1,2,2),(854,10,500,25,1,1,2),(855,11,2500,25,1,1,2),(856,1,60000,26,1,1,2),(857,2,1000,26,1,1,2),(858,13,19000,26,1,2,2),(859,14,5500,26,1,2,2),(860,3,1500,26,1,1,2),(861,4,700,26,1,1,2),(862,5,2500,26,1,1,2),(863,6,8000,26,1,1,2),(864,7,2000,26,1,1,2),(865,15,5000,26,1,2,2),(866,10,500,26,1,1,2),(867,11,2500,26,1,1,2),(868,1,60000,27,1,1,2),(869,2,1000,27,1,1,2),(870,13,19000,27,1,2,2),(871,14,5500,27,1,2,2),(872,3,1500,27,1,1,2),(873,4,700,27,1,1,2),(874,5,2500,27,1,1,2),(875,6,8000,27,1,1,2),(876,7,2000,27,1,1,2),(877,15,5000,27,1,2,2),(878,10,500,27,1,1,2),(879,11,2500,27,1,1,2),(880,1,60000,28,1,1,2),(881,2,1000,28,1,1,2),(882,13,19000,28,1,2,2),(883,14,5500,28,1,2,2),(884,3,1500,28,1,1,2),(885,4,700,28,1,1,2),(886,5,2500,28,1,1,2),(887,6,8000,28,1,1,2),(888,7,2000,28,1,1,2),(889,15,5000,28,1,2,2),(890,10,500,28,1,1,2),(891,11,2500,28,1,1,2),(892,1,60000,29,1,1,2),(893,2,1000,29,1,1,2),(894,13,19000,29,1,2,2),(895,14,5500,29,1,2,2),(896,3,1500,29,1,1,2),(897,4,700,29,1,1,2),(898,5,2500,29,1,1,2),(899,6,8000,29,1,1,2),(900,7,2000,29,1,1,2),(901,15,5000,29,1,2,2),(902,10,500,29,1,1,2),(903,11,2500,29,1,1,2),(904,1,60000,30,1,1,2),(905,2,1000,30,1,1,2),(906,13,19000,30,1,2,2),(907,14,5500,30,1,2,2),(908,3,1500,30,1,1,2),(909,4,700,30,1,1,2),(910,5,2500,30,1,1,2),(911,6,8000,30,1,1,2),(912,7,2000,30,1,1,2),(913,15,5000,30,1,2,2),(914,10,500,30,1,1,2),(915,11,2500,30,1,1,2),(916,1,60000,31,1,1,2),(917,2,1000,31,1,1,2),(918,13,19000,31,1,2,2),(919,14,5500,31,1,2,2),(920,3,1500,31,1,1,2),(921,4,700,31,1,1,2),(922,5,2500,31,1,1,2),(923,6,8000,31,1,1,2),(924,7,2000,31,1,1,2),(925,15,5000,31,1,2,2),(926,10,500,31,1,1,2),(927,11,2500,31,1,1,2),(928,1,60000,32,1,1,2),(929,2,1000,32,1,1,2),(930,13,19000,32,1,2,2),(931,14,5500,32,1,2,2),(932,3,1500,32,1,1,2),(933,4,700,32,1,1,2),(934,5,2500,32,1,1,2),(935,6,8000,32,1,1,2),(936,7,2000,32,1,1,2),(937,15,5000,32,1,2,2),(938,10,500,32,1,1,2),(939,11,2500,32,1,1,2),(940,1,75000,33,1,1,2),(941,2,1000,33,1,1,2),(942,13,25000,33,1,2,2),(943,14,6500,33,1,2,2),(944,3,1500,33,1,1,2),(945,4,1000,33,1,1,2),(946,5,3000,33,1,1,2),(947,6,8000,33,1,1,2),(948,7,2000,33,1,1,2),(949,15,5000,33,1,2,2),(950,10,500,33,1,1,2),(951,11,5000,33,1,1,2),(952,1,75000,34,1,1,2),(953,2,1000,34,1,1,2),(954,13,25000,34,1,2,2),(955,14,6500,34,1,2,2),(956,3,1500,34,1,1,2),(957,4,1000,34,1,1,2),(958,5,3000,34,1,1,2),(959,6,8000,34,1,1,2),(960,7,2000,34,1,1,2),(961,15,5000,34,1,2,2),(962,10,500,34,1,1,2),(963,11,5000,34,1,1,2),(964,1,75000,35,1,1,2),(965,2,1000,35,1,1,2),(966,13,25000,35,1,2,2),(967,14,6500,35,1,2,2),(968,3,1500,35,1,1,2),(969,4,1000,35,1,1,2),(970,5,3000,35,1,1,2),(971,6,8000,35,1,1,2),(972,7,2000,35,1,1,2),(973,15,5000,35,1,2,2),(974,10,500,35,1,1,2),(975,11,5000,35,1,1,2),(976,1,75000,36,1,1,2),(977,2,1000,36,1,1,2),(978,13,23000,36,1,2,2),(979,14,6500,36,1,2,2),(980,3,1500,36,1,1,2),(981,4,1000,36,1,1,2),(982,5,3000,36,1,1,2),(983,6,8000,36,1,1,2),(984,7,2000,36,1,1,2),(985,15,5000,36,1,2,2),(986,10,500,36,1,1,2),(987,11,5000,36,1,1,2),(988,1,75000,37,1,1,2),(989,2,1000,37,1,1,2),(990,13,23000,37,1,2,2),(991,14,6500,37,1,2,2),(992,3,1500,37,1,1,2),(993,4,1000,37,1,1,2),(994,5,3000,37,1,1,2),(995,6,8000,37,1,1,2),(996,7,2000,37,1,1,2),(997,15,5000,37,1,2,2),(998,10,500,37,1,1,2),(999,11,5000,37,1,1,2),(1000,1,75000,38,1,1,2),(1001,2,1000,38,1,1,2),(1002,13,23000,38,1,2,2),(1003,14,6500,38,1,2,2),(1004,3,1500,38,1,1,2),(1005,4,1000,38,1,1,2),(1006,5,3000,38,1,1,2),(1007,6,8000,38,1,1,2),(1008,7,2000,38,1,1,2),(1009,15,5000,38,1,2,2),(1010,10,500,38,1,1,2),(1011,11,5000,38,1,1,2),(1012,1,75000,39,1,1,2),(1013,2,1000,39,1,1,2),(1014,13,23000,39,1,2,2),(1015,14,6500,39,1,2,2),(1016,3,1500,39,1,1,2),(1017,4,1000,39,1,1,2),(1018,5,3000,39,1,1,2),(1019,6,8000,39,1,1,2),(1020,7,2000,39,1,1,2),(1021,15,5000,39,1,2,2),(1022,10,500,39,1,1,2),(1023,11,5000,39,1,1,2),(1024,1,45000,1,2,1,2),(1025,2,1000,1,2,1,2),(1026,5,500,1,2,1,2),(1027,7,2000,1,2,1,2),(1028,10,500,1,2,1,2),(1029,1,53000,2,2,1,2),(1030,2,1000,2,2,1,2),(1031,5,2000,2,2,1,2),(1032,7,2000,2,2,1,2),(1033,10,500,2,2,1,2),(1034,1,53000,3,2,1,2),(1035,2,1000,3,2,1,2),(1036,5,2000,3,2,1,2),(1037,7,2000,3,2,1,2),(1038,10,500,3,2,1,2),(1039,1,53000,4,2,1,2),(1040,2,1000,4,2,1,2),(1041,5,2000,4,2,1,2),(1042,7,2000,4,2,1,2),(1043,10,500,4,2,1,2),(1044,1,53000,5,2,1,2),(1045,2,1000,5,2,1,2),(1046,5,2000,5,2,1,2),(1047,7,2000,5,2,1,2),(1048,10,500,5,2,1,2),(1049,1,53000,6,2,1,2),(1050,2,1000,6,2,1,2),(1051,5,2000,6,2,1,2),(1052,7,2000,6,2,1,2),(1053,10,500,6,2,1,2),(1054,1,53000,7,2,1,2),(1055,2,1000,7,2,1,2),(1056,5,2000,7,2,1,2),(1057,7,2000,7,2,1,2),(1058,10,500,7,2,1,2),(1059,1,53000,8,2,1,2),(1060,2,1000,8,2,1,2),(1061,5,2000,8,2,1,2),(1062,7,2000,8,2,1,2),(1063,10,500,8,2,1,2),(1064,1,53000,9,2,1,2),(1065,2,1000,9,2,1,2),(1066,5,2000,9,2,1,2),(1067,7,2000,9,2,1,2),(1068,10,500,9,2,1,2),(1069,1,53000,10,2,1,2),(1070,2,1000,10,2,1,2),(1071,5,2000,10,2,1,2),(1072,7,2000,10,2,1,2),(1073,10,500,10,2,1,2),(1074,1,55000,11,2,1,2),(1075,2,1000,11,2,1,2),(1076,5,2000,11,2,1,2),(1077,7,2000,11,2,1,2),(1078,10,500,11,2,1,2),(1079,3,1000,11,2,1,2),(1080,4,500,11,2,1,2),(1081,6,8000,11,2,1,2),(1082,8,8000,11,2,2,2),(1083,1,55000,12,2,1,2),(1084,2,1000,12,2,1,2),(1085,5,2000,12,2,1,2),(1086,7,2000,12,2,1,2),(1087,10,500,12,2,1,2),(1088,3,1000,12,2,1,2),(1089,4,500,12,2,1,2),(1090,6,8000,12,2,1,2),(1091,8,8000,12,2,2,2),(1092,1,55000,13,2,1,2),(1093,2,1000,13,2,1,2),(1094,5,2000,13,2,1,2),(1095,7,2000,13,2,1,2),(1096,10,500,13,2,1,2),(1097,3,1000,13,2,1,2),(1098,4,500,13,2,1,2),(1099,6,8000,13,2,1,2),(1100,8,8000,13,2,2,2),(1101,1,55000,14,2,1,2),(1102,2,1000,14,2,1,2),(1103,5,2000,14,2,1,2),(1104,7,2000,14,2,1,2),(1105,10,500,14,2,1,2),(1106,3,1000,14,2,1,2),(1107,4,500,14,2,1,2),(1108,6,8000,14,2,1,2),(1109,8,8000,14,2,2,2),(1110,1,55000,15,2,1,2),(1111,2,1000,15,2,1,2),(1112,5,2000,15,2,1,2),(1113,7,2000,15,2,1,2),(1114,10,500,15,2,1,2),(1115,3,1000,15,2,1,2),(1116,4,500,15,2,1,2),(1117,6,8000,15,2,1,2),(1118,8,8000,15,2,2,2),(1119,1,55000,16,2,1,2),(1120,2,1000,16,2,1,2),(1121,5,2000,16,2,1,2),(1122,7,2000,16,2,1,2),(1123,10,500,16,2,1,2),(1124,3,1000,16,2,1,2),(1125,4,500,16,2,1,2),(1126,6,8000,16,2,1,2),(1127,8,8000,16,2,2,2),(1128,1,55000,17,2,1,2),(1129,2,1000,17,2,1,2),(1130,5,2000,17,2,1,2),(1131,7,2000,17,2,1,2),(1132,10,500,17,2,1,2),(1133,3,1000,17,2,1,2),(1134,4,500,17,2,1,2),(1135,6,8000,17,2,1,2),(1136,8,8000,17,2,2,2),(1137,1,55000,18,2,1,2),(1138,2,1000,18,2,1,2),(1139,5,2000,18,2,1,2),(1140,7,2000,18,2,1,2),(1141,10,500,18,2,1,2),(1142,3,1000,18,2,1,2),(1143,4,500,18,2,1,2),(1144,6,8000,18,2,1,2),(1145,8,8000,18,2,2,2),(1146,1,57000,19,2,1,2),(1147,2,1000,19,2,1,2),(1148,5,2000,19,2,1,2),(1149,7,2000,19,2,1,2),(1150,10,500,19,2,1,2),(1151,3,1000,19,2,1,2),(1152,4,500,19,2,1,2),(1153,6,8000,19,2,1,2),(1154,8,8000,19,2,2,2),(1155,1,57000,20,2,1,2),(1156,2,1000,20,2,1,2),(1157,5,2000,20,2,1,2),(1158,7,2000,20,2,1,2),(1159,10,500,20,2,1,2),(1160,3,1000,20,2,1,2),(1161,4,500,20,2,1,2),(1162,6,8000,20,2,1,2),(1163,8,8000,20,2,2,2),(1164,1,57000,21,2,1,2),(1165,2,1000,21,2,1,2),(1166,5,2000,21,2,1,2),(1167,7,2000,21,2,1,2),(1168,10,500,21,2,1,2),(1169,3,1000,21,2,1,2),(1170,4,500,21,2,1,2),(1171,6,8000,21,2,1,2),(1172,8,8000,21,2,2,2),(1173,1,57000,22,2,1,2),(1174,2,1000,22,2,1,2),(1175,5,2000,22,2,1,2),(1176,7,2000,22,2,1,2),(1177,10,500,22,2,1,2),(1178,3,1000,22,2,1,2),(1179,4,500,22,2,1,2),(1180,6,8000,22,2,1,2),(1181,8,8000,22,2,2,2),(1182,1,57000,23,2,1,2),(1183,2,1000,23,2,1,2),(1184,5,2000,23,2,1,2),(1185,7,2000,23,2,1,2),(1186,10,500,23,2,1,2),(1187,3,1000,23,2,1,2),(1188,4,500,23,2,1,2),(1189,6,8000,23,2,1,2),(1190,8,8000,23,2,2,2),(1191,1,57000,24,2,1,2),(1192,2,1000,24,2,1,2),(1193,5,2000,24,2,1,2),(1194,7,2000,24,2,1,2),(1195,10,500,24,2,1,2),(1196,3,1000,24,2,1,2),(1197,4,500,24,2,1,2),(1198,6,8000,24,2,1,2),(1199,8,8000,24,2,2,2),(1200,1,60000,25,2,1,2),(1201,2,1000,25,2,1,2),(1202,3,1500,25,2,1,2),(1203,4,700,25,2,1,2),(1204,5,2500,25,2,1,2),(1205,6,8000,25,2,1,2),(1206,7,2000,25,2,1,2),(1207,8,8000,25,2,2,2),(1208,10,500,25,2,1,2),(1209,11,2500,25,2,1,2),(1210,1,60000,26,2,1,2),(1211,2,1000,26,2,1,2),(1212,3,1500,26,2,1,2),(1213,4,700,26,2,1,2),(1214,5,2500,26,2,1,2),(1215,6,8000,26,2,1,2),(1216,7,2000,26,2,1,2),(1217,8,8000,26,2,2,2),(1218,10,500,26,2,1,2),(1219,11,2500,26,2,1,2),(1220,1,60000,27,2,1,2),(1221,2,1000,27,2,1,2),(1222,3,1500,27,2,1,2),(1223,4,700,27,2,1,2),(1224,5,2500,27,2,1,2),(1225,6,8000,27,2,1,2),(1226,7,2000,27,2,1,2),(1227,8,8000,27,2,2,2),(1228,10,500,27,2,1,2),(1229,11,2500,27,2,1,2),(1230,1,60000,28,2,1,2),(1231,2,1000,28,2,1,2),(1232,3,1500,28,2,1,2),(1233,4,700,28,2,1,2),(1234,5,2500,28,2,1,2),(1235,6,8000,28,2,1,2),(1236,7,2000,28,2,1,2),(1237,8,8000,28,2,2,2),(1238,10,500,28,2,1,2),(1239,11,2500,28,2,1,2),(1240,1,60000,29,2,1,2),(1241,2,1000,29,2,1,2),(1242,3,1500,29,2,1,2),(1243,4,700,29,2,1,2),(1244,5,2500,29,2,1,2),(1245,6,8000,29,2,1,2),(1246,7,2000,29,2,1,2),(1247,8,8000,29,2,2,2),(1248,10,500,29,2,1,2),(1249,11,2500,29,2,1,2),(1250,1,60000,30,2,1,2),(1251,2,1000,30,2,1,2),(1252,3,1500,30,2,1,2),(1253,4,700,30,2,1,2),(1254,5,2500,30,2,1,2),(1255,6,8000,30,2,1,2),(1256,7,2000,30,2,1,2),(1257,8,8000,30,2,2,2),(1258,10,500,30,2,1,2),(1259,11,2500,30,2,1,2),(1260,1,60000,31,2,1,2),(1261,2,1000,31,2,1,2),(1262,3,1500,31,2,1,2),(1263,4,700,31,2,1,2),(1264,5,2500,31,2,1,2),(1265,6,8000,31,2,1,2),(1266,7,2000,31,2,1,2),(1267,8,8000,31,2,2,2),(1268,10,500,31,2,1,2),(1269,11,2500,31,2,1,2),(1270,9,5000,31,2,2,2),(1271,1,60000,32,2,1,2),(1272,2,1000,32,2,1,2),(1273,3,1500,32,2,1,2),(1274,4,700,32,2,1,2),(1275,5,2500,32,2,1,2),(1276,6,8000,32,2,1,2),(1277,7,2000,32,2,1,2),(1278,8,8000,32,2,2,2),(1279,10,500,32,2,1,2),(1280,11,2500,32,2,1,2),(1281,9,5000,32,2,2,2),(1282,1,75000,33,2,1,2),(1283,2,1000,33,2,1,2),(1284,3,1500,33,2,1,2),(1285,4,1000,33,2,1,2),(1286,5,3000,33,2,1,2),(1287,6,8000,33,2,1,2),(1288,7,2000,33,2,1,2),(1289,8,8000,33,2,2,2),(1290,10,500,33,2,1,2),(1291,11,5000,33,2,1,2),(1292,1,75000,34,2,1,2),(1293,2,1000,34,2,1,2),(1294,3,1500,34,2,1,2),(1295,4,1000,34,2,1,2),(1296,5,3000,34,2,1,2),(1297,6,8000,34,2,1,2),(1298,7,2000,34,2,1,2),(1299,8,8000,34,2,2,2),(1300,10,500,34,2,1,2),(1301,11,5000,34,2,1,2),(1302,1,75000,35,2,1,2),(1303,2,1000,35,2,1,2),(1304,3,1500,35,2,1,2),(1305,4,1000,35,2,1,2),(1306,5,3000,35,2,1,2),(1307,6,8000,35,2,1,2),(1308,7,2000,35,2,1,2),(1309,8,8000,35,2,2,2),(1310,10,500,35,2,1,2),(1311,11,5000,35,2,1,2),(1312,1,75000,36,2,1,2),(1313,2,1000,36,2,1,2),(1314,3,1500,36,2,1,2),(1315,4,1000,36,2,1,2),(1316,5,3000,36,2,1,2),(1317,6,8000,36,2,1,2),(1318,7,2000,36,2,1,2),(1319,8,8000,36,2,2,2),(1320,10,500,36,2,1,2),(1321,11,5000,36,2,1,2),(1322,1,75000,37,2,1,2),(1323,2,1000,37,2,1,2),(1324,3,1500,37,2,1,2),(1325,4,1000,37,2,1,2),(1326,5,3000,37,2,1,2),(1327,6,8000,37,2,1,2),(1328,7,2000,37,2,1,2),(1329,8,8000,37,2,2,2),(1330,10,500,37,2,1,2),(1331,11,5000,37,2,1,2),(1332,1,75000,38,2,1,2),(1333,2,1000,38,2,1,2),(1334,3,1500,38,2,1,2),(1335,4,1000,38,2,1,2),(1336,5,3000,38,2,1,2),(1337,6,8000,38,2,1,2),(1338,7,2000,38,2,1,2),(1339,8,8000,38,2,2,2),(1340,10,500,38,2,1,2),(1341,11,5000,38,2,1,2),(1342,9,10000,38,2,2,2),(1343,1,75000,39,2,1,2),(1344,2,1000,39,2,1,2),(1345,3,1500,39,2,1,2),(1346,4,1000,39,2,1,2),(1347,5,3000,39,2,1,2),(1348,6,8000,39,2,1,2),(1349,7,2000,39,2,1,2),(1350,8,8000,39,2,2,2),(1351,10,500,39,2,1,2),(1352,11,5000,39,2,1,2),(1353,9,10000,39,2,2,2),(1354,1,45000,1,3,1,2),(1355,2,1000,1,3,1,2),(1356,5,500,1,3,1,2),(1357,7,2000,1,3,1,2),(1358,12,1000,1,3,2,2),(1359,10,500,1,3,1,2),(1360,1,53000,2,3,1,2),(1361,2,1000,2,3,1,2),(1362,5,2000,2,3,1,2),(1363,7,2000,2,3,1,2),(1364,12,1000,2,3,2,2),(1365,10,500,2,3,1,2),(1366,1,53000,3,3,1,2),(1367,2,1000,3,3,1,2),(1368,5,2000,3,3,1,2),(1369,7,2000,3,3,1,2),(1370,12,1000,3,3,2,2),(1371,10,500,3,3,1,2),(1372,1,53000,4,3,1,2),(1373,2,1000,4,3,1,2),(1374,5,2000,4,3,1,2),(1375,7,2000,4,3,1,2),(1376,12,1000,4,3,2,2),(1377,10,500,4,3,1,2),(1378,1,53000,5,3,1,2),(1379,2,1000,5,3,1,2),(1380,5,2000,5,3,1,2),(1381,7,2000,5,3,1,2),(1382,12,1000,5,3,2,2),(1383,10,500,5,3,1,2),(1384,1,53000,6,3,1,2),(1385,2,1000,6,3,1,2),(1386,5,2000,6,3,1,2),(1387,7,2000,6,3,1,2),(1388,12,1000,6,3,2,2),(1389,10,500,6,3,1,2),(1390,1,53000,7,3,1,2),(1391,2,1000,7,3,1,2),(1392,5,2000,7,3,1,2),(1393,7,2000,7,3,1,2),(1394,12,1000,7,3,2,2),(1395,10,500,7,3,1,2),(1396,1,53000,8,3,1,2),(1397,2,1000,8,3,1,2),(1398,5,2000,8,3,1,2),(1399,7,2000,8,3,1,2),(1400,12,1000,8,3,2,2),(1401,10,500,8,3,1,2),(1402,1,53000,9,3,1,2),(1403,2,1000,9,3,1,2),(1404,5,2000,9,3,1,2),(1405,7,2000,9,3,1,2),(1406,12,1000,9,3,2,2),(1407,10,500,9,3,1,2),(1408,1,53000,10,3,1,2),(1409,2,1000,10,3,1,2),(1410,5,2000,10,3,1,2),(1411,7,2000,10,3,1,2),(1412,12,1000,10,3,2,2),(1413,10,500,10,3,1,2),(1414,1,55000,11,3,1,2),(1415,2,1000,11,3,1,2),(1416,5,2000,11,3,1,2),(1417,7,2000,11,3,1,2),(1418,12,2000,11,3,2,2),(1419,10,500,11,3,1,2),(1420,3,1000,11,3,1,2),(1421,4,500,11,3,1,2),(1422,6,8000,11,3,1,2),(1423,1,55000,12,3,1,2),(1424,2,1000,12,3,1,2),(1425,5,2000,12,3,1,2),(1426,7,2000,12,3,1,2),(1427,12,2000,12,3,2,2),(1428,10,500,12,3,1,2),(1429,3,1000,12,3,1,2),(1430,4,500,12,3,1,2),(1431,6,8000,12,3,1,2),(1432,1,55000,13,3,1,2),(1433,2,1000,13,3,1,2),(1434,5,2000,13,3,1,2),(1435,7,2000,13,3,1,2),(1436,12,2000,13,3,2,2),(1437,10,500,13,3,1,2),(1438,3,1000,13,3,1,2),(1439,4,500,13,3,1,2),(1440,6,8000,13,3,1,2),(1441,1,55000,14,3,1,2),(1442,2,1000,14,3,1,2),(1443,5,2000,14,3,1,2),(1444,7,2000,14,3,1,2),(1445,12,2000,14,3,2,2),(1446,10,500,14,3,1,2),(1447,3,1000,14,3,1,2),(1448,4,500,14,3,1,2),(1449,6,8000,14,3,1,2),(1450,1,55000,15,3,1,2),(1451,2,1000,15,3,1,2),(1452,5,2000,15,3,1,2),(1453,7,2000,15,3,1,2),(1454,12,2000,15,3,2,2),(1455,10,500,15,3,1,2),(1456,3,1000,15,3,1,2),(1457,4,500,15,3,1,2),(1458,6,8000,15,3,1,2),(1459,1,55000,16,3,1,2),(1460,2,1000,16,3,1,2),(1461,5,2000,16,3,1,2),(1462,7,2000,16,3,1,2),(1463,12,2000,16,3,2,2),(1464,10,500,16,3,1,2),(1465,3,1000,16,3,1,2),(1466,4,500,16,3,1,2),(1467,6,8000,16,3,1,2),(1468,1,55000,17,3,1,2),(1469,2,1000,17,3,1,2),(1470,5,2000,17,3,1,2),(1471,7,2000,17,3,1,2),(1472,12,2000,17,3,2,2),(1473,10,500,17,3,1,2),(1474,3,1000,17,3,1,2),(1475,4,500,17,3,1,2),(1476,6,8000,17,3,1,2),(1477,1,55000,18,3,1,2),(1478,2,1000,18,3,1,2),(1479,5,2000,18,3,1,2),(1480,7,2000,18,3,1,2),(1481,12,2000,18,3,2,2),(1482,10,500,18,3,1,2),(1483,3,1000,18,3,1,2),(1484,4,500,18,3,1,2),(1485,6,8000,18,3,1,2),(1486,1,57000,19,3,1,2),(1487,2,1000,19,3,1,2),(1488,5,2000,19,3,1,2),(1489,7,2000,19,3,1,2),(1490,12,2000,19,3,2,2),(1491,10,500,19,3,1,2),(1492,3,1000,19,3,1,2),(1493,4,500,19,3,1,2),(1494,6,8000,19,3,1,2),(1495,1,57000,20,3,1,2),(1496,2,1000,20,3,1,2),(1497,5,2000,20,3,1,2),(1498,7,2000,20,3,1,2),(1499,12,2000,20,3,2,2),(1500,10,500,20,3,1,2),(1501,3,1000,20,3,1,2),(1502,4,500,20,3,1,2),(1503,6,8000,20,3,1,2),(1504,1,57000,21,3,1,2),(1505,2,1000,21,3,1,2),(1506,5,2000,21,3,1,2),(1507,7,2000,21,3,1,2),(1508,12,2000,21,3,2,2),(1509,10,500,21,3,1,2),(1510,3,1000,21,3,1,2),(1511,4,500,21,3,1,2),(1512,6,8000,21,3,1,2),(1513,1,57000,22,3,1,2),(1514,2,1000,22,3,1,2),(1515,5,2000,22,3,1,2),(1516,7,2000,22,3,1,2),(1517,12,2000,22,3,2,2),(1518,10,500,22,3,1,2),(1519,3,1000,22,3,1,2),(1520,4,500,22,3,1,2),(1521,6,8000,22,3,1,2),(1522,1,57000,23,3,1,2),(1523,2,1000,23,3,1,2),(1524,5,2000,23,3,1,2),(1525,7,2000,23,3,1,2),(1526,12,2000,23,3,2,2),(1527,10,500,23,3,1,2),(1528,3,1000,23,3,1,2),(1529,4,500,23,3,1,2),(1530,6,8000,23,3,1,2),(1531,1,57000,24,3,1,2),(1532,2,1000,24,3,1,2),(1533,5,2000,24,3,1,2),(1534,7,2000,24,3,1,2),(1535,12,2000,24,3,2,2),(1536,10,500,24,3,1,2),(1537,3,1000,24,3,1,2),(1538,4,500,24,3,1,2),(1539,6,8000,24,3,1,2),(1540,1,60000,25,3,1,2),(1541,2,1000,25,3,1,2),(1542,3,1500,25,3,1,2),(1543,4,700,25,3,1,2),(1544,5,2500,25,3,1,2),(1545,6,8000,25,3,1,2),(1546,7,2000,25,3,1,2),(1547,12,2000,25,3,2,2),(1548,10,500,25,3,1,2),(1549,11,2500,25,3,1,2),(1550,1,60000,26,3,1,2),(1551,2,1000,26,3,1,2),(1552,3,1500,26,3,1,2),(1553,4,700,26,3,1,2),(1554,5,2500,26,3,1,2),(1555,6,8000,26,3,1,2),(1556,7,2000,26,3,1,2),(1557,12,2000,26,3,2,2),(1558,10,500,26,3,1,2),(1559,11,2500,26,3,1,2),(1560,1,60000,27,3,1,2),(1561,2,1000,27,3,1,2),(1562,3,1500,27,3,1,2),(1563,4,700,27,3,1,2),(1564,5,2500,27,3,1,2),(1565,6,8000,27,3,1,2),(1566,7,2000,27,3,1,2),(1567,12,2000,27,3,2,2),(1568,10,500,27,3,1,2),(1569,11,2500,27,3,1,2),(1570,1,60000,28,3,1,2),(1571,2,1000,28,3,1,2),(1572,3,1500,28,3,1,2),(1573,4,700,28,3,1,2),(1574,5,2500,28,3,1,2),(1575,6,8000,28,3,1,2),(1576,7,2000,28,3,1,2),(1577,12,2000,28,3,2,2),(1578,10,500,28,3,1,2),(1579,11,2500,28,3,1,2),(1580,1,60000,29,3,1,2),(1581,2,1000,29,3,1,2),(1582,3,1500,29,3,1,2),(1583,4,700,29,3,1,2),(1584,5,2500,29,3,1,2),(1585,6,8000,29,3,1,2),(1586,7,2000,29,3,1,2),(1587,12,2000,29,3,2,2),(1588,10,500,29,3,1,2),(1589,11,2500,29,3,1,2),(1590,1,60000,30,3,1,2),(1591,2,1000,30,3,1,2),(1592,3,1500,30,3,1,2),(1593,4,700,30,3,1,2),(1594,5,2500,30,3,1,2),(1595,6,8000,30,3,1,2),(1596,7,2000,30,3,1,2),(1597,12,2000,30,3,2,2),(1598,10,500,30,3,1,2),(1599,11,2500,30,3,1,2),(1600,1,60000,31,3,1,2),(1601,2,1000,31,3,1,2),(1602,3,1500,31,3,1,2),(1603,4,700,31,3,1,2),(1604,5,2500,31,3,1,2),(1605,6,8000,31,3,1,2),(1606,7,2000,31,3,1,2),(1607,10,500,31,3,1,2),(1608,11,2500,31,3,1,2),(1609,8,8000,31,3,2,2),(1610,1,60000,32,3,1,2),(1611,2,1000,32,3,1,2),(1612,3,1500,32,3,1,2),(1613,4,700,32,3,1,2),(1614,5,2500,32,3,1,2),(1615,6,8000,32,3,1,2),(1616,7,2000,32,3,1,2),(1617,10,500,32,3,1,2),(1618,11,2500,32,3,1,2),(1619,8,8000,32,3,2,2),(1620,1,75000,33,3,1,2),(1621,2,1000,33,3,1,2),(1622,3,1500,33,3,1,2),(1623,4,1000,33,3,1,2),(1624,5,3000,33,3,1,2),(1625,6,8000,33,3,1,2),(1626,7,2000,33,3,1,2),(1627,12,2000,33,3,2,2),(1628,10,500,33,3,1,2),(1629,11,5000,33,3,1,2),(1630,1,75000,34,3,1,2),(1631,2,1000,34,3,1,2),(1632,3,1500,34,3,1,2),(1633,4,1000,34,3,1,2),(1634,5,3000,34,3,1,2),(1635,6,8000,34,3,1,2),(1636,7,2000,34,3,1,2),(1637,12,2000,34,3,2,2),(1638,10,500,34,3,1,2),(1639,11,5000,34,3,1,2),(1640,1,75000,35,3,1,2),(1641,2,1000,35,3,1,2),(1642,3,1500,35,3,1,2),(1643,4,1000,35,3,1,2),(1644,5,3000,35,3,1,2),(1645,6,8000,35,3,1,2),(1646,7,2000,35,3,1,2),(1647,12,2000,35,3,2,2),(1648,10,500,35,3,1,2),(1649,11,5000,35,3,1,2),(1650,1,75000,36,3,1,2),(1651,2,1000,36,3,1,2),(1652,3,1500,36,3,1,2),(1653,4,1000,36,3,1,2),(1654,5,3000,36,3,1,2),(1655,6,8000,36,3,1,2),(1656,7,2000,36,3,1,2),(1657,12,2000,36,3,2,2),(1658,10,500,36,3,1,2),(1659,11,5000,36,3,1,2),(1660,1,75000,37,3,1,2),(1661,2,1000,37,3,1,2),(1662,3,1500,37,3,1,2),(1663,4,1000,37,3,1,2),(1664,5,3000,37,3,1,2),(1665,6,8000,37,3,1,2),(1666,7,2000,37,3,1,2),(1667,12,2000,37,3,2,2),(1668,10,500,37,3,1,2),(1669,11,5000,37,3,1,2),(1670,1,75000,38,3,1,2),(1671,2,1000,38,3,1,2),(1672,3,1500,38,3,1,2),(1673,4,1000,38,3,1,2),(1674,5,3000,38,3,1,2),(1675,6,8000,38,3,1,2),(1676,7,2000,38,3,1,2),(1677,10,500,38,3,1,2),(1678,11,5000,38,3,1,2),(1679,8,8000,38,3,2,2),(1680,1,75000,39,3,1,2),(1681,2,1000,39,3,1,2),(1682,3,1500,39,3,1,2),(1683,4,1000,39,3,1,2),(1684,5,3000,39,3,1,2),(1685,6,8000,39,3,1,2),(1686,7,2000,39,3,1,2),(1687,10,500,39,3,1,2),(1688,11,5000,39,3,1,2),(1689,8,8000,39,3,2,2);
/*!40000 ALTER TABLE `schedule_of_fees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schools_attended`
--

DROP TABLE IF EXISTS `schools_attended`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schools_attended` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `school_name` varchar(200) DEFAULT NULL,
  `class_from_id` int(11) NOT NULL,
  `class_to_id` int(11) NOT NULL,
  `year_from` int(4) DEFAULT NULL,
  `year_to` int(4) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`class_from_id`,`class_to_id`,`user_id`),
  KEY `fk_schools_attended_classes1_idx` (`class_from_id`),
  KEY `fk_schools_attended_classes2_idx` (`class_to_id`),
  KEY `fk_schools_attended_users1_idx` (`user_id`),
  CONSTRAINT `fk_schools_attended_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schools_attended`
--

LOCK TABLES `schools_attended` WRITE;
/*!40000 ALTER TABLE `schools_attended` DISABLE KEYS */;
INSERT INTO `schools_attended` VALUES (1,'Kings College',1,32,1995,2006,5),(2,'Fgc Maiduguri',11,24,2004,2010,6);
/*!40000 ALTER TABLE `schools_attended` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` varchar(40) NOT NULL,
  `last_activity` int(11) NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('1g5II2oLbzmPCwatht2Hy40wF0i5BFmXdA1gJQcY',1379622416,'a:3:{s:10:\"csrf_token\";s:40:\"6SZHgNFnlfAJc4Pzm7S2JwNzewJKpe2LpOh89U9c\";s:5:\":new:\";a:0:{}s:5:\":old:\";a:0:{}}'),('U3NRy5ecjmgDy5CjhidMp9MwWoKIxvrxuBKWGi4l',1379663582,'a:3:{s:5:\":new:\";a:0:{}s:5:\":old:\";a:0:{}s:10:\"csrf_token\";s:40:\"JKLrxg5hoB61LzftutLwpZvb4WEr4brPwRvlkGn9\";}');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_attendance`
--

DROP TABLE IF EXISTS `staff_attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff_attendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attendance_date` datetime DEFAULT NULL,
  `staff_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`staff_id`),
  KEY `fk_staff_attendance_staff_records1_idx` (`staff_id`),
  CONSTRAINT `fk_staff_attendance_staff_records1` FOREIGN KEY (`staff_id`) REFERENCES `staff_records` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_attendance`
--

LOCK TABLES `staff_attendance` WRITE;
/*!40000 ALTER TABLE `staff_attendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff_attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_records`
--

DROP TABLE IF EXISTS `staff_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_no` varchar(50) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `address` text,
  `contact_phone` varchar(50) DEFAULT NULL,
  `email_address` varchar(50) DEFAULT NULL,
  `qualification` text,
  `date_of_birth` date DEFAULT NULL,
  `department` text,
  `years_of_experience` int(3) DEFAULT NULL,
  `employment_date` date DEFAULT NULL,
  `passport` varchar(255) DEFAULT NULL,
  `gender_id` int(11) NOT NULL,
  `state_of_origin` int(11) NOT NULL,
  `nationality_id` int(11) NOT NULL,
  `designation_id` int(11) NOT NULL,
  `bank_account_number` varchar(10) DEFAULT NULL,
  `bank_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`gender_id`,`state_of_origin`,`nationality_id`,`designation_id`,`bank_id`),
  KEY `fk_staff_records_gender1_idx` (`gender_id`),
  KEY `fk_staff_records_states1_idx` (`state_of_origin`),
  KEY `fk_staff_records_nationality1_idx` (`nationality_id`),
  KEY `fk_staff_records_designations1_idx` (`designation_id`),
  KEY `fk_staff_records_banks1_idx` (`bank_id`),
  CONSTRAINT `fk_staff_records_banks1` FOREIGN KEY (`bank_id`) REFERENCES `banks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_staff_records_designations1` FOREIGN KEY (`designation_id`) REFERENCES `designations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_staff_records_gender1` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_staff_records_nationality1` FOREIGN KEY (`nationality_id`) REFERENCES `nationality` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_staff_records_states1` FOREIGN KEY (`state_of_origin`) REFERENCES `states` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_records`
--

LOCK TABLES `staff_records` WRITE;
/*!40000 ALTER TABLE `staff_records` DISABLE KEYS */;
INSERT INTO `staff_records` VALUES (1,'AIS/1234','Mfawa Alfred Onen','Somewhere in Nevada','(080) 5944 3154','muffycompoqm@gmail.com','B.sc Geography','2013-09-06','',2,'2013-09-06','1378504763_passport.jpg',1,9,118,1,'0026511233',5);
/*!40000 ALTER TABLE `staff_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES (1,'Abia'),(2,'Adamawa'),(3,'Akwa-Ibom'),(4,'Anambra'),(5,'Bauchi'),(6,'Bayelsa'),(7,'Benue'),(8,'Borno'),(9,'Cross River'),(10,'Delta'),(11,'Ebonyi'),(12,'Edo'),(13,'Ekiti'),(14,'Enugu'),(15,'Gombe'),(16,'Imo'),(17,'Jigawa'),(18,'Kaduna'),(19,'Kano'),(20,'Katsina'),(21,'Kebbi'),(22,'Kogi'),(23,'Kwara'),(24,'Lagos'),(25,'Nasarawa'),(26,'Niger'),(27,'Ogun'),(28,'Ondo'),(29,'Osun'),(30,'Oyo'),(31,'Plateau'),(32,'Rivers'),(33,'Sokoto'),(34,'Taraba'),(35,'Yobe'),(36,'Zamfara'),(37,'FCT'),(38,'Other');
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject_name` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES (1,'Mathematics'),(2,'English'),(3,'Biology'),(4,'Chemistry'),(5,'Physics'),(6,'Phonics'),(7,'Handwriting'),(8,'Fine Arts'),(9,'Qur’an'),(10,'Arabic'),(11,'Islamic Religious Knowledge'),(12,'Health Habits'),(13,'Writing'),(14,'Computer studies'),(15,'Creative Arts'),(16,'Social Studies'),(17,'Basic Science'),(18,'Agricultural Science'),(19,'Information Technology'),(20,'Civic Education'),(21,'Vocational'),(22,'French'),(23,'Comprehension'),(24,'Hausa Language'),(25,'Basic Technology'),(26,'Business Studies'),(27,'Home Economics'),(28,'Physical Health Education (P.H.E)'),(29,'Technical Drawing'),(30,'Animal Husbandry'),(31,'Data Processing'),(32,'Government '),(33,'Commerce'),(34,'Economics'),(35,'Literature'),(36,'Geography'),(37,'Principles of Accounts'),(38,'General Science');
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachers_and_classes`
--

DROP TABLE IF EXISTS `teachers_and_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teachers_and_classes` (
  `user_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`class_id`),
  KEY `fk_users_has_classes_classes1_idx` (`class_id`),
  KEY `fk_users_has_classes_users1_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers_and_classes`
--

LOCK TABLES `teachers_and_classes` WRITE;
/*!40000 ALTER TABLE `teachers_and_classes` DISABLE KEYS */;
/*!40000 ALTER TABLE `teachers_and_classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachers_and_subjects`
--

DROP TABLE IF EXISTS `teachers_and_subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teachers_and_subjects` (
  `user_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `term_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`subject_id`,`class_id`,`term_id`),
  KEY `fk_users_has_subjects_subjects1_idx` (`subject_id`),
  KEY `fk_users_has_subjects_users1_idx` (`user_id`),
  KEY `fk_teachers_and_subjects_classes1_idx` (`class_id`),
  KEY `fk_teachers_and_subjects_terms1_idx` (`term_id`),
  CONSTRAINT `fk_users_has_subjects_subjects1` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_has_subjects_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers_and_subjects`
--

LOCK TABLES `teachers_and_subjects` WRITE;
/*!40000 ALTER TABLE `teachers_and_subjects` DISABLE KEYS */;
INSERT INTO `teachers_and_subjects` VALUES (3,1,34,1),(4,2,34,1);
/*!40000 ALTER TABLE `teachers_and_subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terms`
--

DROP TABLE IF EXISTS `terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `terms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `term` varchar(15) DEFAULT NULL,
  `active_term` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terms`
--

LOCK TABLES `terms` WRITE;
/*!40000 ALTER TABLE `terms` DISABLE KEYS */;
INSERT INTO `terms` VALUES (1,'First Term',1),(2,'Second Term',0),(3,'Third Term',0);
/*!40000 ALTER TABLE `terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(25) DEFAULT NULL,
  `surname` varchar(45) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`role_id`),
  KEY `fk_users_roles_idx` (`role_id`),
  CONSTRAINT `fk_users_roles` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'AIS','Administrator','admin@ais.sch.ng','$2a$08$gvoTOqCQAq.BXmYDILZMDeAliMtr8gRx7IJFW6vfnZ5uri6XrmSw6',5),(2,'Ais','Accountant','accountant@ais.sch.ng','$2a$08$iO4suE.bWKqD8JfJCQqGuu6eZSo/g6BWMBgp7uSlwNsJWkw9d/lmS',3),(3,'Ais','Teacher One','teacher1@ais.sch.ng','$2a$08$ALWZigL7oSYAXNNvxFv8r.1SrQq9r6FXfUyrWS/0doNNelKNff186',2),(4,'Ais','Teacher Two','teacher2@ais.sch.ng','$2a$08$2CMGQzsGBwBw/IrMT9.L4OM3JSI0oyzInpcVYcMljt0f4aSK9NLPi',2),(5,'Williams','Onen','williamsonen@kiwixcompo.com','$2a$08$frrTigMiSjTN/fyJVDu9buvTnPbZNvjj97Ksmc0g5f9aGXo/ZQfry',1),(6,'Student','Demo','muffycompoqm@gmail.com','$2a$08$VKWexrb2XWMz8eXObYsO9ee62kB9yLSPOyfSVdyKGJkIBEw5HxQjm',1);
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

-- Dump completed on 2013-09-20  9:02:48
