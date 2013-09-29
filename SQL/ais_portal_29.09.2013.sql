/*
Navicat MySQL Data Transfer

Source Server         : LocalDevDB
Source Server Version : 50612
Source Host           : localhost:3306
Source Database       : ais_portal

Target Server Type    : MYSQL
Target Server Version : 50612
File Encoding         : 65001

Date: 2013-09-29 19:01:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for academic_sessions
-- ----------------------------
DROP TABLE IF EXISTS `academic_sessions`;
CREATE TABLE `academic_sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `academic_session` varchar(10) DEFAULT NULL,
  `active_session` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of academic_sessions
-- ----------------------------
INSERT INTO `academic_sessions` VALUES ('1', '2012/2013', '0');
INSERT INTO `academic_sessions` VALUES ('2', '2013/2014', '1');
INSERT INTO `academic_sessions` VALUES ('5', '2014/2015', '0');

-- ----------------------------
-- Table structure for admission_recommendation
-- ----------------------------
DROP TABLE IF EXISTS `admission_recommendation`;
CREATE TABLE `admission_recommendation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admission_remark` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admission_recommendation
-- ----------------------------
INSERT INTO `admission_recommendation` VALUES ('1', 'Admitted on Merit');
INSERT INTO `admission_recommendation` VALUES ('2', 'Admitted on Trial');
INSERT INTO `admission_recommendation` VALUES ('3', 'No Admission');

-- ----------------------------
-- Table structure for application_type
-- ----------------------------
DROP TABLE IF EXISTS `application_type`;
CREATE TABLE `application_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of application_type
-- ----------------------------
INSERT INTO `application_type` VALUES ('1', 'Nursery');
INSERT INTO `application_type` VALUES ('2', 'Primary');
INSERT INTO `application_type` VALUES ('3', 'Junior Secondary');
INSERT INTO `application_type` VALUES ('4', 'Senior Secondary');

-- ----------------------------
-- Table structure for assessment_types
-- ----------------------------
DROP TABLE IF EXISTS `assessment_types`;
CREATE TABLE `assessment_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of assessment_types
-- ----------------------------
INSERT INTO `assessment_types` VALUES ('1', '1st CA (20%)');
INSERT INTO `assessment_types` VALUES ('2', '2nd CA (10%)');
INSERT INTO `assessment_types` VALUES ('3', '3rd CA (10%)');
INSERT INTO `assessment_types` VALUES ('4', 'Exam (60%)');

-- ----------------------------
-- Table structure for assignments_and_notes
-- ----------------------------
DROP TABLE IF EXISTS `assignments_and_notes`;
CREATE TABLE `assignments_and_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `an_type` tinyint(4) DEFAULT NULL,
  `an_file_path` varchar(255) DEFAULT NULL,
  `subject_id` int(11) NOT NULL DEFAULT '0',
  `class_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `submission_deadline` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`subject_id`,`class_id`,`user_id`),
  KEY `fk_assignments_and_notes_subjects1_idx` (`subject_id`),
  KEY `fk_assignments_and_notes_classes1_idx` (`class_id`),
  KEY `fk_assignments_and_notes_users1_idx` (`user_id`),
  CONSTRAINT `fk_assignments_and_notes_classes1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_assignments_and_notes_subjects1` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_assignments_and_notes_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of assignments_and_notes
-- ----------------------------

-- ----------------------------
-- Table structure for assignment_submissions
-- ----------------------------
DROP TABLE IF EXISTS `assignment_submissions`;
CREATE TABLE `assignment_submissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assignment_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `assignment_score` float DEFAULT NULL,
  `submission_date` datetime DEFAULT NULL,
  `assignment_file_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`assignment_id`,`user_id`),
  KEY `fk_assignment_submissions_assignments_and_notes1_idx` (`assignment_id`),
  KEY `fk_assignment_submissions_users1_idx` (`user_id`),
  CONSTRAINT `fk_assignment_submissions_assignments_and_notes1` FOREIGN KEY (`assignment_id`) REFERENCES `assignments_and_notes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_assignment_submissions_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of assignment_submissions
-- ----------------------------

-- ----------------------------
-- Table structure for banks
-- ----------------------------
DROP TABLE IF EXISTS `banks`;
CREATE TABLE `banks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bank_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of banks
-- ----------------------------
INSERT INTO `banks` VALUES ('1', 'Zenith Bank');
INSERT INTO `banks` VALUES ('2', 'Diamond Bank');
INSERT INTO `banks` VALUES ('3', 'EcoBank');
INSERT INTO `banks` VALUES ('4', 'UBA Bank');
INSERT INTO `banks` VALUES ('5', 'GTBank');
INSERT INTO `banks` VALUES ('6', 'Keystone Bank');

-- ----------------------------
-- Table structure for biodata
-- ----------------------------
DROP TABLE IF EXISTS `biodata`;
CREATE TABLE `biodata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `othernames` varchar(100) DEFAULT NULL,
  `age` int(3) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `tribe` varchar(30) DEFAULT NULL,
  `form_no` varchar(8) DEFAULT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `gender_id` int(11) NOT NULL DEFAULT '0',
  `state_id` int(11) NOT NULL DEFAULT '0',
  `nationality_id` int(11) NOT NULL DEFAULT '0',
  `current_class_id` int(11) NOT NULL DEFAULT '0',
  `last_class_id` int(11) NOT NULL DEFAULT '0',
  `csai_id` int(11) NOT NULL DEFAULT '0',
  `application_type_id` int(11) NOT NULL DEFAULT '0',
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
  CONSTRAINT `fk_biodata_nationality1` FOREIGN KEY (`nationality_id`) REFERENCES `nationality` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_biodata_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_biodata_application_type1` FOREIGN KEY (`application_type_id`) REFERENCES `application_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_biodata_gender1` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_biodata_states1` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2615 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of biodata
-- ----------------------------
INSERT INTO `biodata` VALUES ('1308', '', '8', '2005-06-02', null, '20131234', '42', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1309', 'SHUIBU', '15', '1998-03-03', null, '20131235', '43', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1310', 'GARBAI', '18', '1995-04-05', null, '20131236', '44', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1311', 'GARBAI', '18', '1995-05-03', null, '20131237', '45', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1312', '', '9', '2004-07-21', null, '20131238', '46', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1313', 'USMAN', '14', '1999-09-06', null, '20131239', '47', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1314', '', '2', '2011-09-06', null, '20131240', '48', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1315', 'MUHAMMAD', '4', '2009-02-08', null, '20131241', '49', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1316', '', '7', '2006-07-09', null, '20131242', '50', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1317', '', '9', '2004-08-12', null, '20131243', '51', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1318', '', '17', '1996-03-31', null, '20131244', '52', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1319', '', '5', '2008-03-19', null, '20131245', '53', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1320', 'SEKONI', '9', '2003-11-28', null, '20131246', '54', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1321', '', '8', '2005-04-25', null, '20131247', '55', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1322', 'ADAMU', '9', '2004-04-25', null, '20131248', '56', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1323', '', '8', '2005-07-16', null, '20131249', '57', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1324', 'AJIBOLA', '11', '2002-05-01', null, '20131250', '58', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1325', 'YALWA', '12', '2001-08-06', null, '20131251', '59', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1326', 'EHEZOZA', '10', '2002-11-21', null, '20131252', '60', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1327', '', '12', '2001-03-29', null, '20131253', '61', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1328', '', '10', '2003-09-24', null, '20131254', '62', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1329', 'OLUMUYIINA', '8', '2004-12-04', null, '20131255', '63', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1330', 'SANI', '12', '2001-05-03', null, '20131256', '64', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1331', '', '11', '2002-08-17', null, '20131257', '65', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1332', 'DANLADI', '10', '2003-05-18', null, '20131258', '66', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1333', 'MOHAMMED', '11', '2002-03-23', null, '20131259', '67', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1334', 'RABO', '5', '2008-02-21', null, '20131260', '68', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1335', '', '13', '2000-06-19', null, '20131261', '69', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1336', 'ABDULRAZAQ', '14', '1999-06-14', null, '20131262', '70', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1337', '', '12', '2001-08-30', null, '20131263', '71', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1338', '', '19', '1994-09-23', null, '20131264', '72', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1339', 'MODIBBO', '3', '2010-04-09', null, '20131265', '73', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1340', 'MUHAMMED', '13', '1999-11-29', null, '20131266', '74', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1341', '', '5', '2008-01-03', null, '20131267', '75', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1342', '', '18', '1995-03-17', null, '20131268', '76', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1343', 'HUSSAIN MUNIR', '2', '2011-09-05', null, '20131269', '77', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1344', '', '15', '1998-03-23', null, '20131270', '78', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1345', 'ALIYU', '14', '1999-01-31', null, '20131271', '79', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1346', 'YAHUZA', '10', '2003-03-26', null, '20131272', '80', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1347', '', '10', '2003-04-20', null, '20131273', '81', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1348', 'YAZEED', '11', '2002-09-24', null, '20131274', '82', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1349', 'MOHAMMED', '10', '2003-05-28', null, '20131275', '83', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1350', 'MUH\'D', '13', '2000-04-13', null, '20131276', '84', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1351', '', '13', '2000-07-31', null, '20131277', '85', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1352', 'MOHAMMAD', '6', '2007-08-28', null, '20131278', '86', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1353', 'FAROUK', '10', '2003-05-05', null, '20131279', '87', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1354', 'ZAILANI', '5', '2008-03-14', null, '20131280', '88', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1355', 'AMIRA', '2', '2011-09-06', null, '20131281', '89', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1356', 'ABDUL RAZAG', '11', '2001-12-07', null, '20131282', '90', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1357', 'ABDULRAZAQ', '4', '2008-12-23', null, '20131283', '91', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1358', '', '15', '1997-12-10', null, '20131284', '92', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1359', 'ILIYASU', '11', '2001-12-25', null, '20131285', '93', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1360', 'OHIKU', '17', '1995-10-25', null, '20131286', '94', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1361', 'ABDULRAZAQ', '17', '1995-10-22', null, '20131287', '95', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1362', 'AMOTO OSAMA', '13', '2000-06-17', null, '20131288', '96', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1363', '', '7', '2006-09-28', null, '20131289', '97', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1364', 'KAWU', '8', '2005-03-07', null, '20131290', '98', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1365', '', '10', '2002-10-21', null, '20131291', '99', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1366', 'KAWU', '12', '2000-12-18', null, '20131292', '100', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1367', 'BABALOLA', '12', '2001-01-02', null, '20131293', '101', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1368', 'TOLUWALOPE', '15', '1998-04-05', null, '20131294', '102', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1369', 'AHMAD', '8', '2005-02-16', null, '20131295', '103', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1370', 'ADAMU', '16', '1997-04-04', null, '20131296', '104', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1371', 'UMAR', '12', '2001-01-04', null, '20131297', '105', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1372', 'SABO', '12', '2001-03-03', null, '20131298', '106', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1373', '', '8', '2004-10-07', null, '20131299', '107', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1374', '', '10', '2003-09-04', null, '20131300', '108', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1375', '', '8', '2005-03-12', null, '20131301', '109', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1376', '', '13', '1999-12-17', null, '20131302', '110', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1377', 'GARBA', '6', '2007-05-02', null, '20131303', '111', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1378', 'MUSTAFA', '6', '2007-06-25', null, '20131304', '112', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1379', '', '4', '2009-09-01', null, '20131305', '113', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1380', 'MUSTAPHA', '3', '2010-02-07', null, '20131306', '114', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1381', 'DEEDAT', '8', '2005-03-09', null, '20131307', '115', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1382', 'MAIMUNA', '11', '2001-10-04', null, '20131308', '116', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1383', '', '9', '2003-11-08', null, '20131309', '117', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1384', 'MAYOWA', '12', '2001-07-30', null, '20131310', '118', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1385', 'SALAMATU', '3', '2009-10-06', null, '20131311', '119', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1386', 'ABDULLAHI MOHD', '13', '2000-07-04', null, '20131312', '120', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1387', '', '2', '2011-09-05', null, '20131313', '121', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1388', '', '12', '2001-01-07', null, '20131314', '122', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1389', 'GALADIMA', '6', '2006-11-27', null, '20131315', '123', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1390', 'AMINU', '5', '2008-06-18', null, '20131316', '124', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1391', 'BALA', '8', '2005-05-26', null, '20131317', '125', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1392', '', '5', '2008-05-08', null, '20131318', '126', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1393', '', '9', '2004-09-28', null, '20131319', '127', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1394', '', '10', '2003-01-15', null, '20131320', '128', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1395', '', '14', '1999-05-25', null, '20131321', '129', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1396', 'MODIBBO', '2', '2011-09-06', null, '20131322', '130', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1397', '', '11', '2002-03-03', null, '20131323', '131', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1398', '', '2', '2011-09-06', null, '20131324', '132', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1399', 'SADEEQ', '14', '1999-07-27', null, '20131325', '133', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1400', 'MUSTAPHA', '14', '1998-12-08', null, '20131326', '134', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1401', 'SADEEQ', '9', '2003-11-09', null, '20131327', '135', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1402', 'USMAN', '9', '2004-01-25', null, '20131328', '136', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1403', 'SADIQ', '12', '2001-06-01', null, '20131329', '137', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1404', '', '10', '2002-11-06', null, '20131330', '138', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1405', 'DANLADI', '8', '2005-01-16', null, '20131331', '139', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1406', 'IBRAHIM', '7', '2006-05-22', null, '20131332', '140', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1407', '', '14', '1999-04-14', null, '20131333', '141', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1408', 'ALIYU', '2', '2011-09-06', null, '20131334', '142', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1409', '', '13', '1999-11-17', null, '20131335', '143', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1410', 'MATO', '2', '2011-09-06', null, '20131336', '144', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1411', 'AL-AMIN', '12', '2001-06-25', null, '20131337', '145', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1412', 'TIJJANI', '13', '2000-02-03', null, '20131338', '146', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1413', 'BUNU', '13', '1999-12-29', null, '20131339', '147', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1414', 'B.', '16', '1996-10-13', null, '20131340', '148', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1415', 'UMAR', '17', '1996-02-22', null, '20131341', '149', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1416', '', '9', '2004-06-02', null, '20131342', '150', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1417', 'HISHAM', '6', '2007-08-16', null, '20131343', '151', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1418', 'MAHMUD', '12', '2001-04-13', null, '20131344', '152', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1419', 'SADIQ', '8', '2005-04-16', null, '20131345', '153', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1420', 'GARBA', '5', '2008-03-19', null, '20131346', '154', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1421', '', '6', '2007-06-04', null, '20131347', '155', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1422', 'MARI', '9', '2004-05-05', null, '20131348', '156', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1423', 'JIBO', '18', '1995-06-01', null, '20131349', '157', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1424', 'AL-AMIN', '3', '2010-05-09', null, '20131350', '158', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1425', 'ATIKU', '11', '2002-07-03', null, '20131351', '159', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1426', '', '13', '2000-03-02', null, '20131352', '160', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1427', 'UMAR', '13', '2000-04-21', null, '20131353', '161', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1428', 'BUNU', '13', '2000-01-02', null, '20131354', '162', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1429', 'IBRAHIM', '3', '2010-04-10', null, '20131355', '163', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1430', 'USMAN', '17', '1996-02-22', null, '20131356', '164', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1431', 'SAID', '16', '1997-03-11', null, '20131357', '165', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1432', '', '14', '1999-01-24', null, '20131358', '166', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1433', 'MUNIR', '13', '1999-11-06', null, '20131359', '167', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1434', '', '9', '2004-01-07', null, '20131360', '168', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1435', '', '6', '2006-11-11', null, '20131361', '169', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1436', '', '18', '1995-05-31', null, '20131362', '170', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1437', 'IBRAHIM', '8', '2005-03-26', null, '20131363', '171', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1438', 'MUHAMMAD', '4', '2009-07-15', null, '20131364', '172', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1439', '', '3', '2009-11-01', null, '20131365', '173', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1440', 'GALADO', '18', '1995-05-31', null, '20131366', '174', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1441', 'ELLEMAN', '15', '1998-05-11', null, '20131367', '175', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1442', 'ELLEMANQ', '10', '2003-09-16', null, '20131368', '176', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1443', 'ELLEMAN', '7', '2005-09-30', null, '20131369', '177', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1444', 'ELLEMAN', '5', '2007-12-13', null, '20131370', '178', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1445', 'GIADE', '10', '2002-12-08', null, '20131371', '179', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1446', 'IBRAHIM', '3', '2010-03-18', null, '20131372', '180', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1447', 'AHMED', '11', '2002-01-02', null, '20131373', '181', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1448', 'AHMAD', '14', '1998-10-09', null, '20131374', '182', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1449', 'HADI', '9', '2004-05-02', null, '20131375', '183', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1450', 'GARBA', '3', '2009-12-11', null, '20131376', '184', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1451', '', '18', '1995-04-17', null, '20131377', '185', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1452', 'AMMAL', '4', '2008-10-03', null, '20131378', '186', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1453', 'OHINE', '5', '2008-05-13', null, '20131379', '187', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1454', 'USMAN', '9', '2004-09-21', null, '20131380', '188', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1455', '', '7', '2005-11-02', null, '20131381', '189', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1456', 'YARADUA', '12', '2001-02-01', null, '20131382', '190', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1457', 'ALKALI', '19', '1994-07-24', null, '20131383', '191', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1458', 'MOHAMMED', '8', '2004-12-12', null, '20131384', '192', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1459', 'RAYYANU', '18', '1995-08-08', null, '20131385', '193', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1460', 'ALIYU', '7', '2005-12-06', null, '20131386', '194', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1461', 'MOHAMMED', '7', '2005-12-12', null, '20131387', '195', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1462', 'MUHAMMED', '8', '2005-09-09', null, '20131388', '196', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1463', '', '6', '2007-03-12', null, '20131389', '197', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1464', '', '6', '2007-02-28', null, '20131390', '198', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1465', '', '13', '2000-09-20', null, '20131391', '199', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1466', 'BUSTANI', '12', '2001-03-25', null, '20131392', '200', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1467', '', '12', '2001-06-13', null, '20131393', '201', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1468', '', '4', '2009-09-04', null, '20131394', '202', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1469', 'ADAMU', '10', '2003-01-31', null, '20131395', '203', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1470', 'SANI', '4', '2009-06-02', null, '20131396', '204', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1471', 'BABA', '6', '2007-06-13', null, '20131397', '205', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1472', 'ADAMU', '18', '1995-08-08', null, '20131398', '206', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1473', 'BABANGIDA', '15', '1998-05-21', null, '20131399', '207', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1474', 'RABIU', '15', '1997-12-31', null, '20131400', '208', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1475', 'HARUNA', '13', '2000-08-08', null, '20131401', '209', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1476', '', '12', '2001-07-27', null, '20131402', '210', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1477', 'HAFIZ', '8', '2005-03-21', null, '20131403', '211', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1478', 'BALA', '7', '2005-12-11', null, '20131404', '212', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1479', 'ABBA', '15', '1998-06-04', null, '20131405', '213', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1480', 'YUSUF', '8', '2995-01-30', null, '20131406', '214', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1481', 'HAUWA', '5', '2007-10-12', null, '20131407', '215', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1482', 'MUSTAPHA', '13', '2000-05-04', null, '20131408', '216', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1483', '', '16', '1997-07-05', null, '20131409', '217', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1484', 'ABDULLAHI', '16', '1996-12-20', null, '20131410', '218', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1485', 'INNA', '11', '2002-07-30', null, '20131411', '219', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1486', 'IBRAHIM', '10', '2003-07-23', null, '20131412', '220', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1487', 'USMAN', '12', '2001-09-27', null, '20131413', '221', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1488', 'YERIMA', '2', '2011-09-05', null, '20131414', '222', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1489', 'SANI', '9', '2004-05-06', null, '20131415', '223', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1490', 'MAHMUD', '2', '2011-09-05', null, '20131416', '224', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1491', 'UMMI', '10', '2003-02-02', null, '20131417', '225', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1492', 'ABUBAKAR', '9', '2004-04-29', null, '20131418', '226', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1493', '', '9', '2004-07-11', null, '20131419', '227', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1494', 'GIDADO', '8', '2004-11-23', null, '20131420', '228', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1495', 'DANLADI', '9', '2004-06-25', null, '20131421', '229', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1496', 'ABUBAKAR', '10', '2002-10-01', null, '20131422', '230', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1497', '', '18', '1995-07-04', null, '20131423', '231', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1498', 'BAKO', '17', '1996-02-11', null, '20131424', '232', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1499', 'HAFIZ', '14', '1999-08-07', null, '20131425', '233', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1500', '', '15', '1998-07-14', null, '20131426', '234', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1501', '', '16', '1997-07-07', null, '20131427', '235', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1502', 'FIDAUSS', '13', '1999-10-07', null, '20131428', '236', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1503', 'MOHAMMED ', '16', '1997-09-16', null, '20131429', '237', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1504', '', '16', '1997-08-25', null, '20131430', '238', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1505', 'ALIYU', '11', '2002-04-27', null, '20131431', '239', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1506', '', '16', '1997-07-19', null, '20131432', '240', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1507', 'AMINU', '13', '1999-11-14', null, '20131433', '241', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1508', 'UMMI', '8', '2005-07-05', null, '20131434', '242', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1509', 'MAHMUD', '8', '2005-06-17', null, '20131435', '243', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1510', 'HASSAN', '15', '1998-04-16', null, '20131436', '244', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1511', '', '2', '2011-09-06', null, '20131437', '245', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1512', 'GOSTA', '9', '2004-08-05', null, '20131438', '246', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1513', 'MOHAMMED', '7', '2005-11-20', null, '20131439', '247', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1514', '', '14', '1999-01-01', null, '20131440', '248', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1515', 'AMINU', '16', '1997-06-20', null, '20131441', '249', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1516', '', '14', '1999-07-27', null, '20131442', '250', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1517', 'MUSA', '15', '1997-12-15', null, '20131443', '251', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1518', 'NANA', '15', '1998-05-24', null, '20131444', '252', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1519', '', '9', '2004-03-02', null, '20131445', '253', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1520', '', '6', '2007-08-22', null, '20131446', '254', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1521', '', '15', '1998-05-02', null, '20131447', '255', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1522', 'MUHAMMAD', '15', '1998-05-02', null, '20131448', '256', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1523', '', '6', '2007-07-30', null, '20131449', '257', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1524', 'GIADE', '6', '2007-05-19', null, '20131450', '258', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1525', '', '9', '2004-01-06', null, '20131451', '259', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1526', 'YAYA', '13', '1999-11-25', null, '20131452', '260', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1527', 'BELLO', '13', '2000-08-17', null, '20131453', '261', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1528', '', '13', '1999-11-18', null, '20131454', '262', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1529', 'UMMI', '5', '2008-01-13', null, '20131455', '263', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1530', 'DIMARI', '18', '1994-10-19', null, '20131456', '264', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1531', 'JIBRIL G.', '3', '2010-06-03', null, '20131457', '265', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1532', 'JIBO', '13', '1999-10-13', null, '20131458', '266', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1533', 'UMMI', '9', '2004-09-08', null, '20131459', '267', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1534', 'MUJELI', '5', '2008-07-01', null, '20131460', '268', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1535', '', '5', '2008-03-04', null, '20131461', '269', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1536', 'ADEDOYIN', '4', '2008-11-20', null, '20131462', '270', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1537', '', '4', '2009-01-01', null, '20131463', '271', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1538', 'GARBA', '12', '2001-08-14', null, '20131464', '272', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1539', 'ABDULKADIR', '4', '2008-10-01', null, '20131465', '273', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1540', 'ADAM', '4', '2009-04-23', null, '20131466', '274', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1541', 'BAKO', '6', '2006-11-29', null, '20131467', '275', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1542', '', '17', '1996-02-11', null, '20131468', '276', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1543', '', '18', '1995-05-01', null, '20131469', '277', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1544', '', '18', '1995-07-03', null, '20131470', '278', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1545', '', '17', '1995-12-04', null, '20131471', '279', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1546', 'IBRAHIM', '17', '1996-01-12', null, '20131472', '280', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1547', 'IBRAHIM', '16', '1997-08-24', null, '20131473', '281', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1548', 'ABDULLAHI', '18', '1995-03-04', null, '20131474', '282', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1549', 'SADIQ', '13', '1999-12-30', null, '20131475', '283', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1550', 'BUSAYO', '8', '2004-12-20', null, '20131476', '284', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1551', 'ALIYU', '9', '2004-07-04', null, '20131477', '285', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1552', '', '2', '2011-09-06', null, '20131478', '286', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1553', 'OVIZA', '12', '2001-02-23', null, '20131479', '287', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1554', '', '12', '2000-10-12', null, '20131480', '288', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1555', 'ADNAN', '11', '2002-06-07', null, '20131481', '289', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1556', 'MUSA', '6', '2007-06-28', null, '20131482', '290', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1557', 'SHEHU', '10', '2003-01-01', null, '20131483', '291', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1558', 'H.', '7', '2006-05-23', null, '20131484', '292', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1559', '', '16', '1997-07-03', null, '20131485', '293', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1560', '', '3', '2010-01-04', null, '20131486', '294', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1561', '', '4', '2009-09-08', null, '20131487', '295', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1562', 'OLAREWAJU', '13', '1999-12-27', null, '20131488', '296', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1563', 'MAIDABINO', '6', '2006-11-02', null, '20131489', '297', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1564', 'ADAMU', '9', '2003-12-19', null, '20131490', '298', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1565', 'MOHAMMED', '7', '2005-11-25', null, '20131491', '299', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1566', '', '16', '1997-09-25', null, '20131492', '300', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1567', 'SALEH', '8', '2005-06-03', null, '20131493', '301', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1568', '', '13', '1999-10-27', null, '20131494', '302', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1569', 'YAHAYA', '6', '2006-12-20', null, '20131495', '303', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1570', 'MUSA', '13', '2000-08-23', null, '20131496', '304', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1571', 'AHMAD', '11', '2001-11-08', null, '20131497', '305', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1572', 'ALIYU', '12', '2000-11-22', null, '20131498', '306', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1573', 'YAHAYA', '8', '2005-06-30', null, '20131499', '307', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1574', '', '15', '1998-05-01', null, '20131500', '308', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1575', 'IMAM', '2', '2011-09-06', null, '20131501', '309', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1576', 'ABDULLAHI', '16', '1996-12-22', null, '20131502', '310', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1577', 'ABDULLAHI', '4', '2009-09-09', null, '20131503', '311', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1578', 'UMAR', '9', '2004-04-02', null, '20131504', '312', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1579', 'TIJANI', '9', '2003-11-21', null, '20131505', '313', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1580', 'AMIR', '8', '2005-03-15', null, '20131506', '314', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1581', 'SIDI', '13', '1999-12-21', null, '20131507', '315', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1582', '', '4', '2009-09-16', null, '20131508', '316', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1583', 'DANLADI', '12', '2001-09-19', null, '20131509', '317', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1584', 'MOHAMMED', '12', '2001-07-10', null, '20131510', '318', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1585', '', '20', '1993-08-02', null, '20131511', '319', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1586', 'GOSTA', '14', '1998-11-11', null, '20131512', '320', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1587', 'ABBA', '8', '2005-01-28', null, '20131513', '321', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1588', 'KOGARI', '8', '2005-03-20', null, '20131514', '322', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1589', 'AL-AMIN', '7', '2005-12-21', null, '20131515', '323', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1590', 'KHALIFA MOHAMMAD', '8', '2005-07-31', null, '20131516', '324', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1591', 'ADAMU', '8', '2005-08-01', null, '20131517', '325', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1592', 'MOHAMMED', '15', '1998-04-04', null, '20131518', '326', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1593', 'MAIKANO', '7', '2006-07-21', null, '20131519', '327', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1594', 'DANLADI', '13', '2000-01-05', null, '20131520', '328', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1595', 'MADAKI', '7', '2005-10-02', null, '20131521', '329', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1596', 'Tajudeen', '16', '1996-11-15', null, '20131522', '330', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1597', '', '6', '2006-12-31', null, '20131523', '331', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1598', 'GARBA', '7', '2006-05-03', null, '20131524', '332', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1599', 'ALIBABA', '11', '2002-08-09', null, '20131525', '333', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1600', 'NASIR', '11', '2002-02-22', null, '20131526', '334', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1601', '', '20', '1993-01-22', null, '20131527', '335', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1602', '', '16', '0017-02-05', null, '20131528', '336', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1603', '', '3', '2010-01-03', null, '20131529', '337', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1604', 'SADIYA', '14', '1998-10-02', null, '20131530', '338', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1605', 'ABUBAKAR', '17', '1996-07-31', null, '20131531', '339', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1606', 'ALIYU', '9', '2004-04-11', null, '20131532', '340', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1607', '', '16', '1997-08-19', null, '20131533', '341', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1608', 'AL-HASSAN', '8', '2004-10-23', null, '20131534', '342', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1609', 'SADDEEQ', '13', '2000-04-29', null, '20131535', '343', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1610', 'ABDULLAHI', '17', '1996-04-11', null, '20131536', '344', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1611', 'ABDULRAHMAN', '9', '2004-02-01', null, '20131537', '345', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1612', '', '15', '1997-12-19', null, '20131538', '346', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1613', '', '11', '2001-10-05', null, '20131539', '347', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1614', '', '17', '1996-03-18', null, '20131540', '348', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1615', 'AHMED', '16', '1997-07-17', null, '20131541', '349', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1616', 'GAFAI', '12', '2001-03-02', null, '20131542', '350', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1617', 'IBRAHIM', '11', '2001-11-05', null, '20131543', '351', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1618', 'M', '2', '2011-09-06', null, '20131544', '352', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1619', '', '19', '1994-04-24', null, '20131545', '353', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1620', 'UMAR FAROUQ', '7', '2006-01-16', null, '20131546', '354', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1621', 'BABA', '8', '2005-02-02', null, '20131547', '355', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1622', 'SANI', '16', '1997-09-23', null, '20131548', '356', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1623', '', '6', '2007-08-02', null, '20131549', '357', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1624', '', '7', '2006-02-22', null, '20131550', '358', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1625', '', '13', '1999-10-10', null, '20131551', '359', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1626', '', '14', '1999-05-15', null, '20131552', '360', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1627', '', '10', '2003-06-07', null, '20131553', '361', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1628', 'HARUNA', '12', '2001-05-05', null, '20131554', '362', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1629', 'HUSNAH', '17', '1996-06-23', null, '20131555', '363', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1630', '', '15', '1998-07-16', null, '20131556', '364', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1631', 'SULEIMAN', '15', '1998-02-12', null, '20131557', '365', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1632', 'SADIQ', '6', '2007-05-03', null, '20131558', '366', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1633', '', '6', '2007-08-19', null, '20131559', '367', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1634', 'OLAYINKA', '13', '2000-05-29', null, '20131560', '368', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1635', 'AHMAD', '19', '1993-10-21', null, '20131561', '369', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1636', '', '14', '1999-04-03', null, '20131562', '370', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1637', 'SALMAN', '10', '2003-08-23', null, '20131563', '371', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1638', '', '2', '2011-09-06', null, '20131564', '372', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1639', 'MUAZU', '14', '1999-04-10', null, '20131565', '373', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1640', 'AHMAD', '19', '1993-10-20', null, '20131566', '374', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1641', '', '3', '2009-10-30', null, '20131567', '375', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1642', '', '10', '2003-08-22', null, '20131568', '376', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1643', 'MUHAMMAD', '2', '2011-09-06', null, '20131569', '377', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1644', 'MUHAMMAD', '2', '2011-09-06', null, '20131570', '378', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1645', '', '14', '1999-05-24', null, '20131571', '379', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1646', '', '6', '2007-06-06', null, '20131572', '380', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1647', 'AISHA MUHAMMAD', '5', '2008-05-27', null, '20131573', '381', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1648', '', '19', '1994-02-13', null, '20131574', '382', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1649', '', '14', '1999-03-26', null, '20131575', '383', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1650', 'AMINU', '10', '2003-09-25', null, '20131576', '384', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1651', 'KOGARI', '11', '2001-10-10', null, '20131577', '385', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1652', 'MOHAMMED', '13', '2000-02-02', null, '20131578', '386', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1653', 'IBRAHIM', '6', '2007-05-28', null, '20131579', '387', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1654', 'JIBIR', '7', '2005-11-30', null, '20131580', '388', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1655', 'OYIZA', '12', '2001-08-27', null, '20131581', '389', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1656', '', '6', '2007-07-23', null, '20131582', '390', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1657', 'MUAZU', '11', '2002-01-31', null, '20131583', '391', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1658', 'AMINU', '15', '1997-11-22', null, '20131584', '392', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1659', 'SHINKAFI', '14', '1999-04-30', null, '20131585', '393', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1660', 'MUSA', '9', '2004-01-31', null, '20131586', '394', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1661', '', '2', '2011-09-06', null, '20131587', '395', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1662', 'ABDULLAHI', '6', '2007-05-04', null, '20131588', '396', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1663', 'IBRAHIM', '5', '2008-01-21', null, '20131589', '397', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1664', '', '7', '2006-04-12', null, '20131590', '398', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1665', '', '6', '2007-01-02', null, '20131591', '399', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1666', '', '16', '1997-08-01', null, '20131592', '400', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1667', 'B.', '14', '1998-11-02', null, '20131593', '401', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1668', 'IKRAM', '7', '2006-02-13', null, '20131594', '402', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1669', 'BALA', '10', '2003-01-11', null, '20131595', '403', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1670', 'IBRAHIM', '4', '2009-05-09', null, '20131596', '404', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1671', 'MOHAMMED', '10', '2003-08-07', null, '20131597', '405', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1672', '', '6', '2006-11-02', null, '20131598', '406', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1673', '', '2', '2011-09-06', null, '20131599', '407', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1674', 'MOHAMMED', '18', '1994-10-12', null, '20131600', '408', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1675', 'YAKUBU', '12', '2000-12-18', null, '20131601', '409', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1676', '', '14', '1999-03-10', null, '20131602', '410', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1677', 'OMOTOLANI', '14', '1998-12-01', null, '20131603', '411', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1678', '.I.', '5', '2008-05-12', null, '20131604', '412', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1679', 'ADAMU', '5', '2008-01-10', null, '20131605', '413', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1680', 'K.', '14', '1999-03-09', null, '20131606', '414', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1681', 'HASSAIN MUNIR', '15', '1997-10-08', null, '20131607', '415', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1682', 'MOHAMMAD', '10', '2002-12-18', null, '20131608', '416', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1683', '', '10', '2003-05-20', null, '20131609', '417', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1684', 'IBRAHIM', '10', '2002-10-01', null, '20131610', '418', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1685', 'HASSAIN MUNIR', '15', '1997-10-08', null, '20131611', '419', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1686', 'LAMIDO', '8', '2005-05-05', null, '20131612', '420', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1687', 'UMAR', '5', '2008-01-01', null, '20131613', '421', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1688', '', '9', '2004-07-28', null, '20131614', '422', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1689', 'MUHAMMAD', '16', '1997-08-12', null, '20131615', '423', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1690', 'BALA', '18', '1995-06-17', null, '20131616', '424', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1691', '', '14', '1999-01-03', null, '20131617', '425', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1692', '', '12', '2000-11-18', null, '20131618', '426', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1693', 'BELLO', '8', '2005-02-02', null, '20131619', '427', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1694', 'BELLO', '7', '2006-07-16', null, '20131620', '428', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1695', 'BELLO', '18', '1995-06-16', null, '20131621', '429', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1696', 'IYA', '12', '2001-05-05', null, '20131622', '430', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1697', 'U.', '16', '1996-10-02', null, '20131623', '431', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1698', '', '13', '1999-12-25', null, '20131624', '432', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1699', 'JIBRIN', '7', '2006-03-13', null, '20131625', '433', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1700', 'AMINU', '14', '1999-03-31', null, '20131626', '434', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1701', 'SALMANU', '16', '1996-11-14', null, '20131627', '435', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1702', 'USMAN', '6', '2007-05-21', null, '20131628', '436', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1703', '', '4', '2009-02-09', null, '20131629', '437', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1704', 'YUSUF', '5', '2008-03-13', null, '20131630', '438', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1705', 'DANLAWAN', '12', '2000-10-10', null, '20131631', '439', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1706', 'L.', '14', '1999-01-24', null, '20131632', '440', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1707', '', '6', '2007-03-08', null, '20131633', '441', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1708', 'OHINE', '9', '2004-08-23', null, '20131634', '442', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1709', 'GBEMISOLA', '14', '1998-12-20', null, '20131635', '443', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1710', 'USMAN', '14', '1999-03-08', null, '20131636', '444', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1711', 'FATIMA', '12', '2001-07-06', null, '20131637', '445', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1712', 'LAWAL', '11', '2002-08-24', null, '20131638', '446', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1713', 'SHEHU', '12', '2001-08-25', null, '20131639', '447', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1714', 'MUHAMMED', '6', '2007-09-29', null, '20131640', '448', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1715', '', '12', '2001-04-25', null, '20131641', '449', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1716', '', '11', '2001-11-30', null, '20131642', '450', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1717', 'AMINU', '16', '1997-06-10', null, '20131643', '451', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1718', '', '12', '2001-06-16', null, '20131644', '452', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1719', 'SADIQ', '9', '2004-07-17', null, '20131645', '453', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1720', '', '7', '2006-02-02', null, '20131646', '454', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1721', 'MUHIBBA', '8', '2005-07-30', null, '20131647', '455', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1722', 'ADBOLOWA', '12', '2001-05-23', null, '20131648', '456', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1723', 'YALWA', '12', '2001-04-02', null, '20131649', '457', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1724', 'IZE', '10', '0031-04-10', null, '20131650', '458', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1725', 'YAKUB', '19', '1994-06-26', null, '20131651', '459', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1726', 'ADEDAMOLA', '14', '1999-05-30', null, '20131652', '460', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1727', 'YAKUBU', '20', '1993-06-27', null, '20131653', '461', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1728', '', '2', '2011-09-06', null, '20131654', '462', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1729', 'GALADIMA', '11', '2002-01-06', null, '20131655', '463', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1730', 'ADEDAYO', '10', '2003-08-27', null, '20131656', '464', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1731', 'OSIMIHA', '4', '2008-11-07', null, '20131657', '465', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1732', '', '5', '2008-05-01', null, '20131658', '466', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1733', 'OLADELE', '12', '2001-03-12', null, '20131659', '467', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1734', '', '6', '2007-01-10', null, '20131660', '468', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1735', 'ADEDIWURA', '6', '2007-03-26', null, '20131661', '469', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1736', '', '17', '1996-05-04', null, '20131662', '470', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1737', '', '9', '2004-07-24', null, '20131663', '471', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1738', 'MUSTAPHA', '2', '2011-09-06', null, '20131664', '472', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1739', 'BABA', '17', '1996-05-03', null, '20131665', '473', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1740', 'ALKALI', '16', '1997-08-07', null, '20131666', '474', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1741', 'UMAR', '8', '2004-10-12', null, '20131667', '475', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1742', 'OMAYE', '7', '2006-02-08', null, '20131668', '476', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1743', 'ALKALI', '15', '1998-08-06', null, '20131669', '477', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1744', 'UMAR', '7', '2006-08-24', null, '20131670', '478', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1745', '', '14', '1999-03-18', null, '20131671', '479', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1746', '', '2', '2011-09-05', null, '20131672', '480', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1747', 'IBRAHIM', '14', '1999-02-16', null, '20131673', '481', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1748', 'ZAHRA', '13', '1999-12-27', null, '20131674', '482', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1749', 'MUHAMMAD', '13', '2000-06-21', null, '20131675', '483', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1750', 'JIDDA GELLA', '13', '1999-10-30', null, '20131676', '484', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1751', 'MAHMUD', '11', '2002-06-28', null, '20131677', '485', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1752', 'SHUAIBU', '11', '2001-10-26', null, '20131678', '486', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1753', 'USMAN', '10', '2003-02-27', null, '20131679', '487', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1754', 'MUHAMMAD', '15', '1998-05-24', null, '20131680', '488', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1755', 'HUSSEINI', '10', '2003-07-23', null, '20131681', '489', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1756', 'DANLADI', '9', '2004-05-31', null, '20131682', '490', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1757', '', '19', '1993-12-31', null, '20131683', '491', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1758', 'ADAMU', '8', '2005-08-28', null, '20131684', '492', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1759', 'YUSUF', '11', '2001-10-29', null, '20131685', '493', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1760', '', '8', '2004-12-11', null, '20131686', '494', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1761', '', '16', '1997-04-25', null, '20131687', '495', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1762', '', '16', '1997-08-23', null, '20131688', '496', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1763', 'HALLIRU AMINU', '15', '1997-12-06', null, '20131689', '497', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1764', 'ABUBAKAR', '10', '2002-11-19', null, '20131690', '498', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1765', 'ABUBAKAR', '12', '2001-06-01', null, '20131691', '499', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1766', 'IBRAHIM', '7', '2005-12-17', null, '20131692', '500', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1767', 'ABUBAKAR', '9', '2004-03-17', null, '20131693', '501', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1768', 'ZARA', '9', '2004-03-12', null, '20131694', '502', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1769', 'MOHAMMAD', '18', '1995-07-08', null, '20131695', '503', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1770', 'MUHAMMAD', '12', '2001-05-19', null, '20131696', '504', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1771', 'ABDU SALEH', '14', '1999-02-14', null, '20131697', '505', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1772', 'MOHAMMED', '14', '1999-07-13', null, '20131698', '506', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1773', 'UMAR', '6', '2007-03-20', null, '20131699', '507', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1774', 'HASSAN', '6', '2006-12-03', null, '20131700', '508', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1775', 'AMEERA', '7', '2006-08-02', null, '20131701', '509', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1776', '', '5', '2007-10-11', null, '20131702', '510', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1777', '', '7', '2006-08-08', null, '20131703', '511', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1778', 'RAYYANU', '6', '2007-01-22', null, '20131704', '512', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1779', '', '10', '2002-11-09', null, '20131705', '513', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1780', '', '2', '2011-09-06', null, '20131706', '514', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1781', '', '2', '2011-09-05', null, '20131707', '515', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1782', 'DANYADADO', '5', '2007-12-05', null, '20131708', '516', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1783', 'JAJERE', '7', '2006-06-12', null, '20131709', '517', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1784', 'BUSTANI', '6', '2007-08-30', null, '20131710', '518', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1785', 'SHINKAFI', '8', '2005-05-04', null, '20131711', '519', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1786', 'ZAHRA', '14', '1998-10-07', null, '20131712', '520', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1787', '', '14', '1999-08-15', null, '20131713', '521', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1788', 'USMAN', '11', '2002-02-26', null, '20131714', '522', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1789', 'ZAKARI', '13', '1999-10-06', null, '20131715', '523', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1790', '', '5', '2008-06-07', null, '20131716', '524', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1791', 'JIBRIL G.', '14', '1999-02-10', null, '20131717', '525', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1792', 'MATO', '12', '2001-05-21', null, '20131718', '526', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1793', 'USMAN', '12', '2000-11-15', null, '20131719', '527', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1794', 'ZAHRA', '5', '2007-10-05', null, '20131720', '528', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1795', '', '11', '2001-11-19', null, '20131721', '529', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1796', '', '5', '2008-06-10', null, '20131722', '530', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1797', '', '11', '2002-07-23', null, '20131723', '531', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1798', 'ABDULKADIR', '6', '2006-11-19', null, '20131724', '532', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1799', 'NASIDI', '4', '2009-07-23', null, '20131725', '533', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1800', 'ABDUL', '6', '2007-03-27', null, '20131726', '534', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1801', '', '18', '1995-07-07', null, '20131727', '535', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1802', '', '18', '1994-11-27', null, '20131728', '536', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1803', 'A.', '17', '1995-11-28', null, '20131729', '537', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1804', 'J.', '16', '1996-10-24', null, '20131730', '538', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1805', 'MANNIR', '16', '1997-08-22', null, '20131731', '539', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1806', '', '7', '2006-06-20', null, '20131732', '540', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1807', 'MUSA', '15', '1998-03-22', null, '20131733', '541', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1808', 'LADIDI', '7', '2005-10-23', null, '20131734', '542', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1809', 'NASIRU ADAMU', '12', '2000-09-30', null, '20131735', '543', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1810', 'ABDULLAHI', '8', '2004-12-08', null, '20131736', '544', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1811', '', '15', '1997-10-25', null, '20131737', '545', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1812', 'BINTA ZARAH', '8', '2004-12-24', null, '20131738', '546', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1813', 'NANA', '9', '2004-05-23', null, '20131739', '547', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1814', '', '2', '2011-09-06', null, '20131740', '548', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1815', 'MUSTAFA', '11', '2002-08-13', null, '20131741', '549', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1816', '', '9', '2004-01-26', null, '20131742', '550', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1817', 'MOHAMMED', '11', '2001-11-16', null, '20131743', '551', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1818', '', '14', '1998-11-22', null, '20131744', '552', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1819', '', '11', '2001-11-15', null, '20131745', '553', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1820', '', '5', '2008-04-15', null, '20131746', '554', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1821', 'AYOTUNDE', '13', '2000-07-11', null, '20131747', '555', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1822', 'ADAVIDI', '4', '2008-11-07', null, '20131748', '556', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1823', 'IBRAHIM', '15', '1997-11-27', null, '20131749', '557', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1824', 'USMAN', '13', '1999-10-23', null, '20131750', '558', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1825', 'FARUK', '7', '2006-06-03', null, '20131751', '559', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1826', '', '5', '2007-12-15', null, '20131752', '560', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1827', '', '8', '2005-03-19', null, '20131753', '561', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1828', 'NANA', '14', '1998-12-28', null, '20131754', '562', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1829', '', '15', '1998-06-06', null, '20131755', '563', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1830', '', '17', '1996-07-22', null, '20131756', '564', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1831', 'SHARIFF', '13', '2000-04-07', null, '20131757', '565', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1832', 'DANLAWAN', '6', '2007-09-04', null, '20131758', '566', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1833', 'FATIMA', '8', '2005-06-28', null, '20131759', '567', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1834', 'OLUWATIMILEHIN', '9', '2004-08-18', null, '20131760', '568', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1835', 'OLORUNTOBA', '9', '2003-10-25', null, '20131761', '569', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1836', '', '12', '2001-06-03', null, '20131762', '570', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1837', 'SANI', '14', '1999-05-05', null, '20131763', '571', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1838', 'NURUDEEN', '6', '2007-04-21', null, '20131764', '572', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1839', 'GAMBO', '11', '2002-08-11', null, '20131765', '573', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1840', 'BAKO', '10', '2003-06-10', null, '20131766', '574', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1841', 'USMAN', '11', '2001-10-03', null, '20131767', '575', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1842', 'MONILOLA', '15', '1998-05-24', null, '20131768', '576', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1843', 'MAHMUD KAZAURE', '7', '2005-11-15', null, '20131769', '577', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1844', 'MOHAMMED', '9', '2004-07-01', null, '20131770', '578', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1845', 'AMALI', '7', '2005-12-03', null, '20131771', '579', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1846', 'BURBUR', '13', '2000-08-05', null, '20131772', '580', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1847', 'IBRAHIM', '4', '2009-06-09', null, '20131773', '581', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1848', 'MUFIDAH', '10', '2003-04-26', null, '20131774', '582', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1849', 'ALIYU', '17', '1996-08-07', null, '20131775', '583', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1850', 'MUSTAFA', '7', '2005-11-03', null, '20131776', '584', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1851', 'ALWALI', '7', '2005-11-20', null, '20131777', '585', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1852', '', '6', '2006-11-18', null, '20131778', '586', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1853', 'ABUBAKAR', '13', '2000-08-16', null, '20131779', '587', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1854', 'OJOTULE', '13', '2000-05-10', null, '20131780', '588', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1855', 'SANI', '18', '1995-09-18', null, '20131781', '589', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1856', '', '12', '2000-09-30', null, '20131782', '590', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1857', '', '14', '1999-05-20', null, '20131783', '591', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1858', '', '9', '2004-03-06', null, '20131784', '592', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1859', 'LAWAL', '18', '1995-09-17', null, '20131785', '593', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1860', 'ALVEERA', '17', '1995-12-01', null, '20131786', '594', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1861', 'MAIDABINO', '13', '2000-08-31', null, '20131787', '595', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1862', '', '8', '2005-09-01', null, '20131788', '596', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1863', '', '12', '2001-05-08', null, '20131789', '597', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1864', 'ABUBAKAR', '11', '2002-06-11', null, '20131790', '598', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1865', 'SANI', '10', '2003-01-14', null, '20131791', '599', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1866', 'OJONUGWA', '15', '1998-09-03', null, '20131792', '600', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1867', 'ABDU-RAHMAN', '12', '2001-07-17', null, '20131793', '601', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1868', 'USMAN', '8', '2004-11-03', null, '20131794', '602', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1869', 'SANI', '15', '1998-03-13', null, '20131795', '603', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1870', 'BALA', '9', '2004-06-19', null, '20131796', '604', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1871', 'SHEHU', '7', '2006-08-02', null, '20131797', '605', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1872', 'AMINU', '7', '2006-03-27', null, '20131798', '606', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1873', 'MUSTAPHA', '7', '2006-04-26', null, '20131799', '607', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1874', 'LAU', '11', '2002-07-09', null, '20131800', '608', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1875', '', '10', '2002-10-29', null, '20131801', '609', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1876', 'UMAR', '7', '2006-03-01', null, '20131802', '610', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1877', 'MOHAMMED', '8', '2005-02-27', null, '20131803', '611', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1878', '', '13', '2000-09-24', null, '20131804', '612', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1879', 'KASIM', '2', '2011-09-06', null, '20131805', '613', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1880', 'UMAR', '15', '1998-03-23', null, '20131806', '614', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1881', 'JEGA', '13', '1999-11-20', null, '20131807', '615', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1882', '', '13', '2000-09-11', null, '20131808', '616', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1883', 'USMAN BALA', '6', '2007-05-11', null, '20131809', '617', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1884', '', '15', '1997-10-01', null, '20131810', '618', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1885', 'BELLO', '15', '1998-06-23', null, '20131811', '619', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1886', 'DAYA', '15', '1998-03-12', null, '20131812', '620', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1887', 'BAKO', '15', '1998-02-17', null, '20131813', '621', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1888', 'MOHAMMED', '8', '2004-12-09', null, '20131814', '622', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1889', 'SULAIMAN', '10', '2002-11-30', null, '20131815', '623', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1890', '', '10', '2003-07-01', null, '20131816', '624', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1891', 'ABBA', '15', '1998-05-31', null, '20131817', '625', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1892', '', '14', '1998-10-23', null, '20131818', '626', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1893', '', '8', '2004-10-18', null, '20131819', '627', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1894', '', '5', '2008-01-06', null, '20131820', '628', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1895', 'KHALID', '4', '2009-04-29', null, '20131821', '629', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1896', 'ABIOLA', '14', '1998-10-16', null, '20131822', '630', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1897', '', '17', '1996-01-01', null, '20131823', '631', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1898', 'ABIOLA', '14', '1998-10-16', null, '20131824', '632', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1899', 'OZIONU', '17', '1996-05-18', null, '20131825', '633', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1900', 'MUSTAPHA', '13', '2000-09-10', null, '20131826', '634', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1901', 'USMAN', '16', '1997-01-06', null, '20131827', '635', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1902', 'MOHAMMED ', '18', '1995-08-06', null, '20131828', '636', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1903', 'ADAMU', '9', '2004-07-30', null, '20131829', '637', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1904', 'YAAQUB', '5', '2008-04-15', null, '20131830', '638', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1905', 'JEGA', '5', '2008-03-10', null, '20131831', '639', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1906', 'KELANI', '16', '1997-09-28', null, '20131832', '640', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1907', 'GAMBO', '12', '2001-09-20', null, '20131833', '641', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1908', 'SADIYA', '5', '2007-10-10', null, '20131834', '642', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1909', 'ADNAN', '5', '2007-10-10', null, '20131835', '643', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1910', 'IBRAHIM', '13', '2000-07-17', null, '20131836', '644', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1911', '', '24', '1989-07-01', null, '20131837', '645', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1912', 'OJOMACHEUSU', '9', '2004-09-16', null, '20131838', '646', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1913', 'BAKO', '9', '2004-08-11', null, '20131839', '647', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1914', 'NIKE', '16', '1996-11-14', null, '20131840', '648', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1915', 'ADEBIMPE', '14', '1999-06-24', null, '20131841', '649', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1916', 'ABDULLAHI', '2', '2011-09-06', null, '20131842', '650', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1917', 'DANLADI', '6', '2007-06-23', null, '20131843', '651', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1918', 'ABDULLAHI', '5', '2008-04-29', null, '20131844', '652', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1919', 'IDRIS', '12', '2001-08-01', null, '20131845', '653', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1920', '', '8', '2005-04-11', null, '20131846', '654', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1921', '', '10', '2003-06-09', null, '20131847', '655', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1922', '', '6', '2006-10-10', null, '20131848', '656', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1923', '', '15', '1998-03-02', null, '20131849', '657', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1924', 'OZIOHU', '15', '1998-09-11', null, '20131850', '658', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1925', 'MUAZU', '11', '2001-12-15', null, '20131851', '659', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1926', 'ZAHRADEEN', '5', '2007-12-12', null, '20131852', '660', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1927', 'MOHAMMAD', '7', '2006-03-24', null, '20131853', '661', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1928', '', '11', '2001-11-10', null, '20131854', '662', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1929', 'ABDULSALAM', '3', '2009-10-06', null, '20131855', '663', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1930', 'SURAYA', '8', '2005-02-21', null, '20131856', '664', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1931', '', '10', '2003-08-31', null, '20131857', '665', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1932', 'ADAMU', '11', '2002-06-25', null, '20131858', '666', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1933', '', '11', '2001-10-18', null, '20131859', '667', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1934', '', '8', '2005-05-30', null, '20131860', '668', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1935', 'YUSUF', '9', '2003-10-16', null, '20131861', '669', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1936', '', '10', '2003-04-07', null, '20131862', '670', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1937', 'SULAIMAN', '2', '2011-09-06', null, '20131863', '671', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1938', 'ABARSHI', '12', '2001-03-13', null, '20131864', '672', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1939', 'ALIYU', '2', '2011-09-05', null, '20131865', '673', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1940', '', '5', '2008-03-07', null, '20131866', '674', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1941', '', '4', '2009-03-30', null, '20131867', '675', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1942', 'ALIBABA', '9', '2004-07-31', null, '20131868', '676', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1943', 'UWANI', '13', '1999-12-24', null, '20131869', '677', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1944', 'SIDI', '8', '2005-03-05', null, '20131870', '678', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1945', 'BELLO', '12', '2001-04-24', null, '20131871', '679', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1946', 'NJIDDA', '4', '2009-09-20', null, '20131872', '680', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1947', 'MUFIDAT', '4', '2008-10-03', null, '20131873', '681', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1948', 'GAFAI', '3', '2009-10-27', null, '20131874', '682', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1949', 'MUFIDAT', '10', '2003-03-11', null, '20131875', '683', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1950', 'NANA', '13', '2000-07-30', null, '20131876', '684', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1951', 'UMMI', '6', '2007-05-07', null, '20131877', '685', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1952', 'M.', '6', '2007-07-12', null, '20131878', '686', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1953', 'BOMAI', '6', '2007-07-12', null, '20131879', '687', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1954', 'LAILA', '8', '2005-03-12', null, '20131880', '688', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1955', '', '2', '2011-09-06', null, '20131881', '689', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1956', 'MAIJIDDA', '12', '2000-12-15', null, '20131882', '690', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1957', 'MUHAMMAD', '14', '1999-04-27', null, '20131883', '691', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1958', 'BUNU', '12', '2000-12-02', null, '20131884', '692', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1959', '', '6', '2006-11-18', null, '20131885', '693', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1960', '', '5', '2008-04-21', null, '20131886', '694', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1961', 'IYA', '10', '2003-08-20', null, '20131887', '695', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1962', 'BAKO', '19', '1994-07-20', null, '20131888', '696', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1963', '', '19', '1994-07-20', null, '20131889', '697', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1964', 'FAROUK', '8', '2005-02-21', null, '20131890', '698', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1965', '', '2', '2011-09-05', null, '20131891', '699', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1966', 'HAMIDU', '10', '2003-05-22', null, '20131892', '700', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1967', 'K.', '14', '1998-10-30', null, '20131893', '701', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1968', 'ALIYU', '13', '2000-07-17', null, '20131894', '702', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1969', 'BAFFA', '15', '1998-02-22', null, '20131895', '703', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1970', '', '9', '2004-05-03', null, '20131896', '704', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1971', '', '8', '2005-04-14', null, '20131897', '705', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1972', 'ADAMU', '8', '2005-02-07', null, '20131898', '706', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1973', 'RAMALAN', '11', '2002-09-17', null, '20131899', '707', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1974', 'MUAZZAM', '10', '2002-11-06', null, '20131900', '708', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1975', '', '9', '2003-11-28', null, '20131901', '709', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1976', 'SARDUNA', '16', '1997-05-28', null, '20131902', '710', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1977', 'MUSA', '20', '1993-07-03', null, '20131903', '711', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1978', '', '8', '2004-12-02', null, '20131904', '712', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1979', 'ISA', '8', '2005-09-05', null, '20131905', '713', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1980', 'MARYAM', '6', '2007-06-09', null, '20131906', '714', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1981', '', '7', '2006-03-25', null, '20131907', '715', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1982', 'ABDULRAHMAN', '14', '1999-05-31', null, '20131908', '716', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1983', 'ADAMU', '2', '2011-09-06', null, '20131909', '717', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1984', 'K', '5', '2008-03-19', null, '20131910', '718', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1985', 'KHALIL', '14', '1998-10-31', null, '20131911', '719', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1986', 'USMAN', '6', '2007-05-11', null, '20131912', '720', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1987', 'SULAIMAN', '14', '1999-09-04', null, '20131913', '721', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1988', 'MUSA', '14', '1999-05-18', null, '20131914', '722', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1989', '', '13', '2000-08-25', null, '20131915', '723', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1990', 'ISHAQ', '10', '2003-09-09', null, '20131916', '724', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1991', 'MOHAMMED', '18', '1995-03-04', null, '20131917', '725', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1992', 'YAKUB', '13', '1999-11-01', null, '20131918', '726', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1993', '', '5', '2008-05-21', null, '20131919', '727', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1994', '', '11', '2001-11-03', null, '20131920', '728', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1995', 'AMIR', '10', '2003-04-07', null, '20131921', '729', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1996', 'MUHAMMAD', '5', '2007-10-10', null, '20131922', '730', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1997', 'SUHAILAT', '5', '2007-12-23', null, '20131923', '731', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1998', 'ADAEZA', '13', '2000-05-07', null, '20131924', '732', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('1999', 'SULEIMAN', '16', '1996-12-03', null, '20131925', '733', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2000', '', '11', '2002-06-04', null, '20131926', '734', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2001', 'HASSAN', '11', '2001-11-03', null, '20131927', '735', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2002', 'BUNU', '15', '1997-10-16', null, '20131928', '736', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2003', 'IDRIS', '6', '2006-12-30', null, '20131929', '737', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2004', '', '2', '2011-09-05', null, '20131930', '738', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2005', 'ADO', '3', '2010-03-06', null, '20131931', '739', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2006', 'MAIDABINO', '10', '2003-02-03', null, '20131932', '740', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2007', 'BELLO', '8', '2005-06-05', null, '20131933', '741', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2008', '', '8', '2005-07-22', null, '20131934', '742', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2009', '', '2', '2011-09-06', null, '20131935', '743', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2010', '', '2', '2011-04-10', null, '20131936', '744', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2011', '', '13', '2000-01-20', null, '20131937', '745', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2012', 'HANIFA', '14', '1999-03-22', null, '20131938', '746', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2013', 'SALISU', '15', '1998-07-26', null, '20131939', '747', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2014', '', '24', '1989-09-20', null, '20131940', '748', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2015', '', '8', '2005-09-11', null, '20131941', '749', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2016', 'YAKUBU', '8', '2005-04-09', null, '20131942', '750', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2017', 'ABBA', '15', '1998-06-19', null, '20131943', '751', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2018', 'ABUBAKAR', '10', '2003-09-10', null, '20131944', '752', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2019', 'MOHAMMAD', '7', '2006-06-06', null, '20131945', '753', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2020', 'ABDULRAHMAN', '6', '2006-11-17', null, '20131946', '754', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2021', '', '15', '1998-04-14', null, '20131947', '755', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2022', 'IMAM', '10', '2002-10-31', null, '20131948', '756', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2023', 'YAKUBU', '4', '2008-10-08', null, '20131949', '757', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2024', 'MUHAMMAD', '16', '1997-03-15', null, '20131950', '758', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2025', '', '10', '2003-03-02', null, '20131951', '759', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2026', '', '14', '1998-12-09', null, '20131952', '760', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2027', 'ABUBAKAR MUHAMMED', '15', '1998-03-02', null, '20131953', '761', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2028', 'RAMALAN', '15', '1998-03-06', null, '20131954', '762', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2029', 'EMEKA', '12', '2001-01-18', null, '20131955', '763', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2030', '', '2', '2011-09-06', null, '20131956', '764', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2031', 'KOGARI', '19', '1993-11-05', null, '20131957', '765', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2032', 'IGIENEKPEME', '9', '2004-06-10', null, '20131958', '766', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2033', '', '8', '2005-08-03', null, '20131959', '767', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2034', '', '2', '2011-09-06', null, '20131960', '768', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2035', 'ABUBAKAR', '16', '1997-04-04', null, '20131961', '769', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2036', 'JIBO', '15', '1998-08-01', null, '20131962', '770', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2037', 'BAKO', '17', '1996-03-15', null, '20131963', '771', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2038', '', '17', '1995-10-23', null, '20131964', '772', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2039', 'MUSTAPHA', '17', '1995-10-23', null, '20131965', '773', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2040', '', '14', '1999-04-03', null, '20131966', '774', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2041', 'HASSAN M.', '16', '1997-03-03', null, '20131967', '775', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2042', 'MARI', '7', '2006-07-19', null, '20131968', '776', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2043', 'OSHIOMA', '6', '2007-09-06', null, '20131969', '777', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2044', 'UMAR', '16', '1997-01-27', null, '20131970', '778', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2045', 'MAIRIGA', '16', '1997-01-26', null, '20131971', '779', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2046', 'ABDULKAREEM AHMAD', '12', '2000-11-10', null, '20131972', '780', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2047', '', '9', '2004-03-26', null, '20131973', '781', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2048', 'SHAFIHI', '14', '1999-09-15', null, '20131974', '782', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2049', 'ALIYU', '10', '2002-10-26', null, '20131975', '783', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2050', 'UMMAIMA', '10', '2003-08-11', null, '20131976', '784', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2051', 'FATIMA', '12', '2001-09-01', null, '20131977', '785', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2052', '', '10', '2003-05-01', null, '20131978', '786', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2053', '', '14', '1999-06-02', null, '20131979', '787', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2054', '', '10', '2003-01-04', null, '20131980', '788', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2055', '', '8', '2005-02-25', null, '20131981', '789', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2056', 'SANI', '14', '1999-01-01', null, '20131982', '790', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2057', '', '6', '2007-02-01', null, '20131983', '791', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2058', 'TEMITOPE', '6', '2007-02-27', null, '20131984', '792', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2059', 'IBRAHIM', '6', '2006-10-05', null, '20131985', '793', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2060', '', '10', '2002-11-09', null, '20131986', '794', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2061', 'YAKASAI', '10', '2003-05-07', null, '20131987', '795', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2062', '', '5', '2008-05-06', null, '20131988', '796', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2063', 'BABA', '17', '1996-02-10', null, '20131989', '797', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2064', 'UMAR', '13', '2000-04-01', null, '20131990', '798', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2065', 'USMAN', '12', '2000-11-13', null, '20131991', '799', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2066', 'MOHAMMED', '11', '2002-05-22', null, '20131992', '800', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2067', '', '7', '2006-05-29', null, '20131993', '801', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2068', '', '13', '2000-05-23', null, '20131994', '802', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2069', '', '5', '2008-07-04', null, '20131995', '803', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2070', 'NURUDEEN', '10', '2003-02-10', null, '20131996', '804', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2071', 'NANA', '10', '2003-09-27', null, '20131997', '805', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2072', 'MOHAMMED', '13', '2000-07-12', null, '20131998', '806', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2073', 'NAJIM', '9', '2003-11-11', null, '20131999', '807', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2074', '', '5', '2008-07-20', null, '20132000', '808', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2075', '', '7', '2006-08-11', null, '20132001', '809', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2076', 'ABUBAKAR', '13', '2000-01-01', null, '20132002', '810', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2077', 'IZE', '16', '1997-09-18', null, '20132003', '811', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2078', 'UMAR', '16', '1997-01-17', null, '20132004', '812', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2079', 'MUSA', '4', '2009-09-08', null, '20132005', '813', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2080', 'BAKO', '17', '1996-03-15', null, '20132006', '814', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2081', '', '8', '2004-11-15', null, '20132007', '815', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2082', 'ABDULKADIR', '11', '2002-03-05', null, '20132008', '816', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2083', '', '9', '2003-12-02', null, '20132009', '817', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2084', 'MUAZU', '15', '1998-09-10', null, '20132010', '818', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2085', 'USMAN', '5', '2007-11-11', null, '20132011', '819', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2086', 'SULEIMAN', '2', '2011-09-06', null, '20132012', '820', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2087', 'UMAR', '6', '2007-03-12', null, '20132013', '821', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2088', '', '4', '2009-01-08', null, '20132014', '822', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2089', '', '13', '2000-08-10', null, '20132015', '823', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2090', '', '9', '2003-12-19', null, '20132016', '824', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2091', 'LAILA', '8', '2005-07-21', null, '20132017', '825', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2092', '', '7', '2006-06-21', null, '20132018', '826', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2093', '', '8', '2005-07-10', null, '20132019', '827', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2094', 'ASTA DICKO', '12', '2001-05-29', null, '20132020', '828', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2095', 'TIJJANI', '8', '2004-11-14', null, '20132021', '829', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2096', '', '10', '2002-10-27', null, '20132022', '830', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2097', 'YALWA', '10', '2003-03-01', null, '20132023', '831', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2098', 'AL-KHALIF', '12', '2001-06-28', null, '20132024', '832', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2099', 'GUMMI', '10', '2003-01-04', null, '20132025', '833', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2100', 'RAMALAN', '10', '2003-05-28', null, '20132026', '834', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2101', 'BAPPAH', '11', '2002-05-07', null, '20132027', '835', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2102', '', '12', '2000-09-30', null, '20132028', '836', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2103', 'SARATU', '9', '2004-02-28', null, '20132029', '837', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2104', '', '4', '2009-03-01', null, '20132030', '838', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2105', '', '7', '2006-08-14', null, '20132031', '839', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2106', '', '11', '2002-05-09', null, '20132032', '840', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2107', 'KUKURI', '3', '2010-01-01', null, '20132033', '841', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2108', 'I.', '16', '1996-11-01', null, '20132034', '842', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2109', 'MUHAMMED', '14', '1998-10-03', null, '20132035', '843', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2110', 'AHMED', '6', '2006-10-23', null, '20132036', '844', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2111', 'AMINU', '8', '0005-01-12', null, '20132037', '845', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2112', 'AMEER', '9', '2004-03-31', null, '20132038', '846', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2113', 'USMAN', '7', '2005-10-04', null, '20132039', '847', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2114', '', '17', '1996-01-01', null, '20132040', '848', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2115', '', '12', '2001-09-07', null, '20132041', '849', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2116', '', '2', '2011-09-05', null, '20132042', '850', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2117', 'AHMAD', '9', '2003-10-08', null, '20132043', '851', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2118', 'KABIR', '13', '2000-02-11', null, '20132044', '852', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2119', '', '13', '2000-06-13', null, '20132045', '853', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2120', 'BAKO', '14', '1998-10-27', null, '20132046', '854', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2121', 'SEKONI', '12', '2001-09-11', null, '20132047', '855', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2122', '', '11', '2002-06-11', null, '20132048', '856', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2123', '', '13', '2000-05-05', null, '20132049', '857', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2124', 'ABDUR-RAHMAN', '12', '2001-01-01', null, '20132050', '858', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2125', 'MAHMUD', '9', '2004-05-22', null, '20132051', '859', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2126', '', '17', '1996-07-02', null, '20132052', '860', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2127', 'KABIR', '17', '1996-05-14', null, '20132053', '861', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2128', '', '17', '1996-06-15', null, '20132054', '862', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2129', 'AHMAD', '12', '2001-06-26', null, '20132055', '863', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2130', 'A', '2', '2011-09-05', null, '20132056', '864', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2131', 'AMINU', '16', '1996-12-31', null, '20132057', '865', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2132', '', '17', '1996-07-31', null, '20132058', '866', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2133', 'TEMITOPE', '15', '1998-08-30', null, '20132059', '867', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2134', 'AL-AMIN', '9', '2004-03-03', null, '20132060', '868', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2135', 'AMINU', '7', '0006-01-21', null, '20132061', '869', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2136', 'UMAR', '7', '2005-11-27', null, '20132062', '870', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2137', 'MOHAMMED', '8', '2005-06-16', null, '20132063', '871', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2138', 'IBRAHIM', '6', '2006-10-10', null, '20132064', '872', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2139', 'MOHAMMED', '24', '1989-07-14', null, '20132065', '873', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2140', '', '7', '2006-03-28', null, '20132066', '874', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2141', 'MOHAMMED', '7', '2006-05-03', null, '20132067', '875', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2142', 'SALISU', '7', '2006-06-11', null, '20132068', '876', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2143', 'HABIB', '6', '2006-12-25', null, '20132069', '877', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2144', 'GHAJI', '15', '1998-02-18', null, '20132070', '878', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2145', 'IYE', '10', '2003-01-31', null, '20132071', '879', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2146', 'SANI', '5', '2008-07-07', null, '20132072', '880', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2147', 'UMAR', '6', '2007-06-07', null, '20132073', '881', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2148', '', '13', '2000-01-06', null, '20132074', '882', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2149', 'AMIRA', '12', '2001-06-21', null, '20132075', '883', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2150', 'AUWAL', '13', '2000-07-23', null, '20132076', '884', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2151', '', '7', '2006-07-13', null, '20132077', '885', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2152', '', '5', '2008-01-08', null, '20132078', '886', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2153', 'O.A.', '11', '2001-10-11', null, '20132079', '887', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2154', 'YARIMAWA', '11', '2001-12-14', null, '20132080', '888', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2155', '', '7', '2006-08-01', null, '20132081', '889', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2156', '', '17', '1996-06-15', null, '20132082', '890', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2157', 'DATTI', '17', '1996-07-02', null, '20132083', '891', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2158', 'USMAN', '17', '1996-05-14', null, '20132084', '892', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2159', 'JARKASA', '17', '1996-07-30', null, '20132085', '893', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2160', 'BAZZA', '7', '2006-03-02', null, '20132086', '894', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2161', 'TEMITOPE', '14', '1999-02-11', null, '20132087', '895', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2162', 'ABDULKDIR', '9', '2003-10-02', null, '20132088', '896', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2163', '', '16', '1997-07-28', null, '20132089', '897', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2164', 'IBRAHIM', '12', '2001-08-06', null, '20132090', '898', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2165', ' MURTALA', '8', '2005-05-27', null, '20132091', '899', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2166', 'AL-AMIN', '7', '2005-10-03', null, '20132092', '900', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2167', 'AMINU', '5', '2008-02-21', null, '20132093', '901', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2168', 'MUSTAPHA', '7', '2006-05-18', null, '20132094', '902', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2169', 'AWWAL', '12', '2001-07-29', null, '20132095', '903', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2170', 'MUBARAK', '9', '2004-01-24', null, '20132096', '904', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2171', 'ABIMBOLA', '10', '2003-06-04', null, '20132097', '905', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2172', '', '9', '2004-06-01', null, '20132098', '906', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2173', '', '11', '2002-05-31', null, '20132099', '907', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2174', 'MUNTAQA', '9', '2003-12-10', null, '20132100', '908', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2175', 'AL-AMIN', '9', '2004-07-28', null, '20132101', '909', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2176', 'HASHIR', '9', '2003-10-01', null, '20132102', '910', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2177', 'HUSSAINI A.', '9', '2004-08-26', null, '20132103', '911', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2178', 'MUSTAFA', '16', '1997-02-22', null, '20132104', '912', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2179', '', '7', '2006-05-06', null, '20132105', '913', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2180', '', '9', '2004-08-19', null, '20132106', '914', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2181', 'ISLAM', '6', '2007-07-26', null, '20132107', '915', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2182', 'AKRAM', '14', '1999-06-30', null, '20132108', '916', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2183', '', '2', '2011-09-06', null, '20132109', '917', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2184', 'KAMALDEEN', '8', '2005-05-27', null, '20132110', '918', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2185', 'AMEER', '6', '2007-07-18', null, '20132111', '919', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2186', 'RABIU', '10', '2003-08-12', null, '20132112', '920', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2187', '', '14', '1999-02-17', null, '20132113', '921', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2188', 'YERIMA', '13', '2000-05-05', null, '20132114', '922', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2189', 'KAZIR', '4', '2009-04-07', null, '20132115', '923', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2190', '', '4', '2009-03-10', null, '20132116', '924', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2191', 'IDRIS', '5', '2008-04-09', null, '20132117', '925', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2192', 'UMAR', '5', '2008-08-23', null, '20132118', '926', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2193', 'ADEMOLA', '12', '2001-02-06', null, '20132119', '927', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2194', '', '6', '2006-12-03', null, '20132120', '928', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2195', 'OLOHON T.', '14', '1999-08-01', null, '20132121', '929', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2196', '', '14', '1999-01-08', null, '20132122', '930', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2197', 'O.', '14', '1998-11-29', null, '20132123', '931', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2198', '', '14', '1999-03-02', null, '20132124', '932', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2199', 'YALWA', '10', '2003-02-20', null, '20132125', '933', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2200', '', '16', '1997-04-08', null, '20132126', '934', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2201', 'HAFIZ', '11', '2002-04-04', null, '20132127', '935', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2202', 'ADAMU', '3', '2010-02-15', null, '20132128', '936', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2203', 'ODE', '10', '2003-02-02', null, '20132129', '937', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2204', 'TEINA', '14', '1999-01-24', null, '20132130', '938', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2205', '', '19', '1994-08-16', null, '20132131', '939', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2206', '', '11', '2002-03-14', null, '20132132', '940', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2207', 'OLUWATOMI', '10', '2003-09-23', null, '20132133', '941', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2208', 'KAKA', '5', '2008-04-05', null, '20132134', '942', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2209', 'TEINA', '13', '1999-11-28', null, '20132135', '943', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2210', 'MAIDABINO', '11', '2001-12-23', null, '20132136', '944', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2211', 'MAHMUD', '11', '2002-04-14', null, '20132137', '945', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2212', 'MUHSIN', '10', '2003-08-07', null, '20132138', '946', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2213', '', '18', '1995-08-22', null, '20132139', '947', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2214', 'AMIR', '11', '2002-07-17', null, '20132140', '948', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2215', 'JAMILU', '15', '1997-12-16', null, '20132141', '949', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2216', 'NASIR', '7', '2006-05-20', null, '20132142', '950', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2217', 'JASINI', '6', '2006-10-13', null, '20132143', '951', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2218', 'ABDULLAHI', '7', '2005-12-02', null, '20132144', '952', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2219', 'MUHAMMAD', '14', '1999-02-19', null, '20132145', '953', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2220', 'ABBA', '7', '2006-07-28', null, '20132146', '954', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2221', 'USMAN', '2', '2011-09-06', null, '20132147', '955', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2222', 'AL-MUSTAPHA', '5', '2008-04-17', null, '20132148', '956', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2223', 'AL-AMIN', '4', '2008-12-17', null, '20132149', '957', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2224', 'NASEER', '9', '2004-07-31', null, '20132150', '958', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2225', 'IDRIS', '14', '1999-09-20', null, '20132151', '959', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2226', 'YAKASAI', '13', '2000-01-01', null, '20132152', '960', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2227', 'IDREES', '4', '2009-09-29', null, '20132153', '961', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2228', 'SHAFIQ', '4', '2009-01-01', null, '20132154', '962', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2229', 'AMIR', '4', '2009-03-03', null, '20132155', '963', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2230', 'USMAN', '6', '2007-09-09', null, '20132156', '964', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2231', '', '13', '2000-05-17', null, '20132157', '965', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2232', 'HAFIS', '7', '2006-08-09', null, '20132158', '966', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2233', 'BARKINDO', '5', '2008-07-09', null, '20132159', '967', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2234', 'AL-AMIN', '7', '2006-07-21', null, '20132160', '968', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2235', 'AL-AMIN', '3', '2010-01-04', null, '20132161', '969', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2236', 'ALIYU', '6', '2007-03-05', null, '20132162', '970', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2237', 'SHETTIMA', '3', '2010-09-05', null, '20132163', '971', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2238', 'DALTI', '16', '1997-02-26', null, '20132164', '972', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2239', 'AMINU', '10', '2003-05-06', null, '20132165', '973', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2240', 'ABDULLAHI', '7', '2006-06-01', null, '20132166', '974', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2241', '', '9', '2003-11-30', null, '20132167', '975', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2242', 'MUSTAFA', '7', '2005-11-18', null, '20132168', '976', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2243', '', '11', '2002-03-31', null, '20132169', '977', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2244', 'BELLO', '16', '1997-08-29', null, '20132170', '978', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2245', '', '9', '2004-02-17', null, '20132171', '979', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2246', 'JAMMEEL', '8', '2005-04-02', null, '20132172', '980', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2247', 'MAIDA-BINO', '9', '2003-11-22', null, '20132173', '981', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2248', 'YUSUF', '6', '2007-02-20', null, '20132174', '982', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2249', 'HUSSAINI', '5', '2008-07-24', null, '20132175', '983', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2250', 'ALIYU', '6', '2007-06-11', null, '20132176', '984', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2251', 'MUBARAK', '6', '2006-10-31', null, '20132177', '985', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2252', 'NAFSU', '5', '2008-05-01', null, '20132178', '986', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2253', '', '7', '2006-01-01', null, '20132179', '987', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2254', '', '7', '2006-01-01', null, '20132180', '988', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2255', '', '15', '1998-05-26', null, '20132181', '989', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2256', 'HADI', '6', '2007-05-04', null, '20132182', '990', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2257', 'NURUDDEEN', '18', '1994-11-04', null, '20132183', '991', '2', '37', '118', '1', '1', '1', '1', null, '9', '1');
INSERT INTO `biodata` VALUES ('2258', 'NURA ', '13', '2000-07-06', null, '20132184', '992', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2259', 'O.', '12', '2001-01-31', null, '20132185', '993', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2260', 'CHUBADO', '9', '2003-12-30', null, '20132186', '994', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2261', 'JARAFU', '8', '2005-04-10', null, '20132187', '995', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2262', 'TEINA', '14', '1999-09-25', null, '20132188', '996', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2263', '', '4', '2008-10-05', null, '20132189', '997', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2264', 'JAFIYA', '5', '2008-04-04', null, '20132190', '998', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2265', 'KHALIFA', '12', '2000-10-29', null, '20132191', '999', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2266', 'ABUBAKAR', '8', '2005-03-01', null, '20132192', '1000', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2267', 'AHMAD', '7', '2006-03-07', null, '20132193', '1001', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2268', 'ABUBAKAR', '5', '2008-02-28', null, '20132194', '1002', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2269', 'SULAIMAN', '14', '1998-10-13', null, '20132195', '1003', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2270', '', '14', '1998-10-09', null, '20132196', '1004', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2271', 'SADIQ', '11', '2002-04-01', null, '20132197', '1005', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2272', 'ENEYE', '9', '2004-08-24', null, '20132198', '1006', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2273', '', '13', '1999-12-23', null, '20132199', '1007', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2274', 'GIDADO', '13', '2000-09-27', null, '20132200', '1008', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2275', '', '9', '2004-02-02', null, '20132201', '1009', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2276', 'ALKALI', '2', '2011-09-06', null, '20132202', '1010', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2277', 'YUSUF', '12', '2001-09-22', null, '20132203', '1011', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2278', ' KUTA', '7', '2006-06-18', null, '20132204', '1012', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2279', 'KUTA', '4', '2008-11-02', null, '20132205', '1013', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2280', 'MUJAHEED', '7', '2006-06-18', null, '20132206', '1014', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2281', 'IYA', '9', '2003-11-03', null, '20132207', '1015', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2282', 'ABDULLAHI', '3', '2009-10-01', null, '20132208', '1016', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2283', 'SANI', '17', '1996-05-19', null, '20132209', '1017', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2284', '', '18', '1995-08-22', null, '20132210', '1018', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2285', 'MUHAMMED', '4', '2008-10-13', null, '20132211', '1019', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2286', 'JEGA', '8', '2005-06-21', null, '20132212', '1020', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2287', '', '11', '2002-03-02', null, '20132213', '1021', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2288', '', '11', '2002-07-17', null, '20132214', '1022', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2289', '', '12', '2001-08-01', null, '20132215', '1023', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2290', 'GAFAI', '7', '2006-04-22', null, '20132216', '1024', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2291', '', '11', '2002-09-18', null, '20132217', '1025', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2292', 'MOHAMMED', '6', '2006-10-15', null, '20132218', '1026', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2293', 'YUSUF', '14', '1999-04-04', null, '20132219', '1027', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2294', 'KHALID', '11', '2002-01-05', null, '20132220', '1028', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2295', '', '6', '2007-06-17', null, '20132221', '1029', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2296', '', '11', '2002-09-18', null, '20132222', '1030', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2297', '', '16', '1997-04-19', null, '20132223', '1031', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2298', 'USMAN', '11', '2002-01-03', null, '20132224', '1032', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2299', '', '13', '1999-11-01', null, '20132225', '1033', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2300', 'MAIKANO', '4', '0009-04-08', null, '20132226', '1034', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2301', '', '13', '2000-03-06', null, '20132227', '1035', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2302', '', '8', '2005-07-26', null, '20132228', '1036', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2303', 'ALIBABA', '6', '2007-07-31', null, '20132229', '1037', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2304', 'ALIYU', '10', '2003-05-08', null, '20132230', '1038', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2305', '', '9', '2004-03-01', null, '20132231', '1039', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2306', 'ZAKUYAH', '7', '2006-07-21', null, '20132232', '1040', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2307', '', '12', '2001-04-09', null, '20132233', '1041', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2308', 'A.', '6', '2007-04-01', null, '20132234', '1042', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2309', 'GIDADO', '14', '1999-04-22', null, '20132235', '1043', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2310', '', '5', '2008-05-18', null, '20132236', '1044', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2311', '', '17', '1996-01-20', null, '20132237', '1045', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2312', 'NNAMDI', '10', '2002-10-28', null, '20132238', '1046', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2313', '', '12', '2001-04-09', null, '20132239', '1047', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2314', 'HABIB', '17', '1996-01-20', null, '20132240', '1048', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2315', 'AHMED', '4', '2009-07-05', null, '20132241', '1049', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2316', '', '6', '2007-06-25', null, '20132242', '1050', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2317', 'BAPPAH', '10', '2003-06-27', null, '20132243', '1051', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2318', 'FIRDAUS', '16', '1997-09-15', null, '20132244', '1052', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2319', 'USMAN', '14', '1998-09-30', null, '20132245', '1053', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2320', '', '10', '2003-08-28', null, '20132246', '1054', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2321', 'TAINI', '16', '1996-12-25', null, '20132247', '1055', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2322', 'TAINI', '5', '2008-03-07', null, '20132248', '1056', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2323', '', '13', '1999-11-20', null, '20132249', '1057', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2324', 'JEGA', '16', '1996-12-24', null, '20132250', '1058', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2325', 'IBRAHIM', '15', '1997-12-27', null, '20132251', '1059', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2326', '', '9', '2004-05-29', null, '20132252', '1060', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2327', '', '8', '2005-09-03', null, '20132253', '1061', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2328', '', '5', '2007-11-01', null, '20132254', '1062', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2329', '', '14', '1999-05-23', null, '20132255', '1063', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2330', 'MOHAMMED', '11', '2001-10-15', null, '20132256', '1064', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2331', '', '6', '2007-03-31', null, '20132257', '1065', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2332', 'YAKARAI', '8', '2005-09-11', null, '20132258', '1066', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2333', '', '8', '2005-09-11', null, '20132259', '1067', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2334', '', '2', '2011-09-06', null, '20132260', '1068', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2335', '', '8', '2005-01-02', null, '20132261', '1069', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2336', '.F.', '8', '2005-08-05', null, '20132262', '1070', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2337', 'ABDULLAHI', '5', '2008-01-04', null, '20132263', '1071', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2338', '', '16', '1997-06-07', null, '20132264', '1072', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2339', 'ENEHU', '7', '2006-01-30', null, '20132265', '1073', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2340', 'AYOMIDE', '5', '2008-03-31', null, '20132266', '1074', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2341', 'MAIKANO', '15', '1998-04-04', null, '20132267', '1075', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2342', 'IBRAHIM', '14', '1998-12-31', null, '20132268', '1076', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2343', '', '17', '1996-06-09', null, '20132269', '1077', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2344', '', '8', '2005-06-22', null, '20132270', '1078', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2345', 'SULEIMAN', '8', '2005-08-19', null, '20132271', '1079', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2346', 'TIJANI', '9', '2004-02-24', null, '20132272', '1080', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2347', 'UMMU-KULTHUM', '2', '2011-09-06', null, '20132273', '1081', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2348', 'ABUBAKAR', '17', '1996-02-03', null, '20132274', '1082', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2349', 'ABUBAKAR', '16', '1997-03-28', null, '20132275', '1083', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2350', 'A.', '16', '1997-03-27', null, '20132276', '1084', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2351', 'MATAWALLE', '6', '2007-04-26', null, '20132277', '1085', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2352', 'IBRAHIM', '4', '2009-03-08', null, '20132278', '1086', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2353', '', '2', '2011-09-05', null, '20132279', '1087', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2354', 'ZUBAIRU', '7', '2005-12-21', null, '20132280', '1088', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2355', '', '5', '2007-11-11', null, '20132281', '1089', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2356', 'OYIZA', '5', '2007-10-24', null, '20132282', '1090', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2357', 'UMMA', '6', '2007-02-05', null, '20132283', '1091', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2358', 'MAHMUD', '5', '2008-05-01', null, '20132284', '1092', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2359', 'UMAR', '8', '2004-10-21', null, '20132285', '1093', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2360', '', '14', '1999-09-19', null, '20132286', '1094', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2361', '', '7', '2006-08-29', null, '20132287', '1095', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2362', '', '2', '2011-09-05', null, '20132288', '1096', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2363', 'HABIB', '14', '1999-06-11', null, '20132289', '1097', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2364', '', '11', '2001-11-06', null, '20132290', '1098', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2365', 'UMMI', '7', '2006-02-04', null, '20132291', '1099', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2366', 'DAYA', '17', '1996-07-26', null, '20132292', '1100', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2367', '', '16', '1996-11-23', null, '20132293', '1101', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2368', 'MUHAMMED', '8', '2005-08-07', null, '20132294', '1102', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2369', '', '8', '2005-09-03', null, '20132295', '1103', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2370', '', '3', '2010-01-07', null, '20132296', '1104', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2371', '', '13', '2000-08-30', null, '20132297', '1105', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2372', 'ALIYU', '14', '1998-12-31', null, '20132298', '1106', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2373', 'ALIYU', '15', '1998-01-12', null, '20132299', '1107', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2374', 'RILWAN', '13', '2000-04-01', null, '20132300', '1108', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2375', 'TUKUR', '17', '1996-09-23', null, '20132301', '1109', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2376', 'MUSTAPHA', '6', '2006-12-06', null, '20132302', '1110', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2377', '', '5', '2008-03-22', null, '20132303', '1111', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2378', '', '12', '2001-05-10', null, '20132304', '1112', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2379', 'YAAQUB', '8', '2005-03-09', null, '20132305', '1113', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2380', 'MAIDAWA', '9', '2004-08-08', null, '20132306', '1114', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2381', 'ADAM', '14', '1999-07-15', null, '20132307', '1115', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2382', 'MAIKANO', '12', '2001-03-20', null, '20132308', '1116', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2383', 'MAIDABINO', '6', '2006-10-04', null, '20132309', '1117', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2384', '', '13', '2000-05-24', null, '20132310', '1118', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2385', 'ABUBAKAR', '10', '2003-03-21', null, '20132311', '1119', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2386', 'ABUBAKAR', '17', '1996-06-16', null, '20132312', '1120', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2387', 'CHUBADO', '17', '1996-05-02', null, '20132313', '1121', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2388', 'TIJJANI', '17', '1996-05-01', null, '20132314', '1122', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2389', 'ADAMU', '17', '1996-06-14', null, '20132315', '1123', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2390', '', '14', '1999-03-21', null, '20132316', '1124', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2391', 'BASHIR ', '11', '2002-02-09', null, '20132317', '1125', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2392', 'SADAUKI', '10', '2003-09-09', null, '20132318', '1126', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2393', 'UMAIMA', '12', '2001-08-08', null, '20132319', '1127', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2394', 'AMINU', '6', '2007-08-03', null, '20132320', '1128', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2395', 'AHMAD', '7', '2006-06-17', null, '20132321', '1129', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2396', 'TIJJANI', '7', '2006-06-05', null, '20132322', '1130', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2397', '', '13', '2000-08-05', null, '20132323', '1131', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2398', 'MUSA', '17', '1996-06-20', null, '20132324', '1132', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2399', '', '15', '1997-11-07', null, '20132325', '1133', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2400', 'SAIDU', '7', '2006-09-15', null, '20132326', '1134', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2401', 'AMALI', '18', '1995-06-22', null, '20132327', '1135', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2402', 'FOLASHADE', '13', '2000-05-08', null, '20132328', '1136', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2403', '', '11', '2002-06-08', null, '20132329', '1137', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2404', '', '15', '1998-09-02', null, '20132330', '1138', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2405', 'FOLASHADE', '6', '2007-04-30', null, '20132331', '1139', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2406', '', '6', '1007-01-10', null, '20132332', '1140', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2407', 'JEGA', '14', '1999-07-07', null, '20132333', '1141', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2408', 'SANI', '16', '1997-01-05', null, '20132334', '1142', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2409', '', '9', '2003-10-27', null, '20132335', '1143', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2410', 'GAMBO', '11', '2002-01-03', null, '20132336', '1144', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2411', 'TASIU', '14', '1999-06-09', null, '20132337', '1145', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2412', 'MUSA', '17', '1996-02-25', null, '20132338', '1146', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2413', 'ABDUSSAMAD', '6', '2007-02-21', null, '20132339', '1147', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2414', '', '4', '2008-12-16', null, '20132340', '1148', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2415', 'SANUSI', '17', '1996-02-24', null, '20132341', '1149', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2416', 'IBRAHIM', '16', '1997-03-02', null, '20132342', '1150', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2417', '', '5', '2008-09-04', null, '20132343', '1151', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2418', 'ISMAIL', '5', '2008-07-01', null, '20132344', '1152', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2419', 'MUHAMMAD', '7', '2006-03-05', null, '20132345', '1153', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2420', '', '15', '1998-09-29', null, '20132346', '1154', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2421', 'SULTAN', '20', '1993-09-02', null, '20132347', '1155', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2422', 'ABDULLAHI', '3', '2009-11-24', null, '20132348', '1156', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2423', '', '6', '2006-11-09', null, '20132349', '1157', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2424', '', '6', '2006-11-09', null, '20132350', '1158', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2425', '', '14', '1998-10-15', null, '20132351', '1159', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2426', '', '15', '1998-08-29', null, '20132352', '1160', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2427', '', '6', '2007-02-23', null, '20132353', '1161', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2428', '', '15', '1997-10-29', null, '20132354', '1162', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2429', '', '12', '2000-12-24', null, '20132355', '1163', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2430', '', '16', '1996-10-03', null, '20132356', '1164', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2431', 'MUHAMMED', '17', '1996-09-25', null, '20132357', '1165', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2432', '', '14', '1999-09-04', null, '20132358', '1166', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2433', 'SUNUSI', '17', '1996-09-25', null, '20132359', '1167', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2434', '', '8', '2005-06-17', null, '20132360', '1168', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2435', '', '10', '2002-11-23', null, '20132361', '1169', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2436', 'MUHAMMAD', '9', '2003-11-22', null, '20132362', '1170', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2437', 'AMINU', '9', '2004-07-11', null, '20132363', '1171', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2438', 'ABDULKADIR', '9', '2004-08-30', null, '20132364', '1172', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2439', '', '8', '2005-03-21', null, '20132365', '1173', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2440', 'ADAMU', '14', '1999-09-29', null, '20132366', '1174', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2441', 'ABUBAKAR', '17', '1996-07-02', null, '20132367', '1175', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2442', '', '6', '2006-12-31', null, '20132368', '1176', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2443', '', '6', '2006-12-31', null, '20132369', '1177', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2444', '', '17', '1996-06-21', null, '20132370', '1178', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2445', 'OKOCHILE', '11', '2002-06-23', null, '20132371', '1179', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2446', 'ABUBAKAR', '16', '1997-06-07', null, '20132372', '1180', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2447', 'ABDULRAHMAN', '13', '1999-12-31', null, '20132373', '1181', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2448', 'ABDULRAHMAN', '12', '2001-07-07', null, '20132374', '1182', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2449', 'MUSTAPHA', '8', '2005-06-23', null, '20132375', '1183', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2450', 'AHMED', '8', '2005-09-18', null, '20132376', '1184', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2451', '', '13', '2000-01-18', null, '20132377', '1185', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2452', 'IMAN', '16', '1997-01-24', null, '20132378', '1186', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2453', 'ANAHI .O', '4', '2008-11-11', null, '20132379', '1187', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2454', 'IMAN', '16', '1997-01-24', null, '20132380', '1188', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2455', 'MAIKANO', '11', '2002-01-12', null, '20132381', '1189', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2456', '', '7', '2006-08-06', null, '20132382', '1190', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2457', '', '17', '1996-09-20', null, '20132383', '1191', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2458', 'SABO', '15', '1997-10-27', null, '20132384', '1192', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2459', 'SHEHU', '8', '2005-04-19', null, '20132385', '1193', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2460', 'AS-SHARIF', '10', '2002-12-11', null, '20132386', '1194', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2461', 'ALOAYE', '13', '2000-04-24', null, '20132387', '1195', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2462', 'O.', '11', '2002-05-06', null, '20132388', '1196', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2463', '', '10', '2003-05-01', null, '20132389', '1197', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2464', '', '16', '1997-03-24', null, '20132390', '1198', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2465', '', '2', '2011-09-06', null, '20132391', '1199', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2466', 'MUSA', '7', '2006-04-05', null, '20132392', '1200', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2467', '', '17', '1995-12-31', null, '20132393', '1201', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2468', '', '17', '1995-12-31', null, '20132394', '1202', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2469', 'HALIMA', '2', '2011-09-06', null, '20132395', '1203', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2470', 'AHMAD', '13', '2000-06-12', null, '20132396', '1204', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2471', '', '2', '2011-09-06', null, '20132397', '1205', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2472', 'BOLAJI', '12', '2001-01-03', null, '20132398', '1206', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2473', 'ABDULRAZAQ', '12', '2001-03-02', null, '20132399', '1207', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2474', 'ADAMU', '8', '2005-06-12', null, '20132400', '1208', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2475', 'MAIMUNA', '12', '2001-01-13', null, '20132401', '1209', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2476', 'MUHAMMAD', '17', '1996-05-07', null, '20132402', '1210', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2477', '', '5', '2008-03-03', null, '20132403', '1211', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2478', 'IBRAHIM', '17', '1996-05-06', null, '20132404', '1212', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2479', '', '14', '1999-08-06', null, '20132405', '1213', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2480', 'FAROUK', '12', '2000-12-11', null, '20132406', '1214', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2481', 'TANKO', '12', '2001-09-29', null, '20132407', '1215', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2482', 'FARK', '18', '1995-01-28', null, '20132408', '1216', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2483', 'DAUDA', '11', '2002-03-12', null, '20132409', '1217', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2484', '', '10', '2003-06-18', null, '20132410', '1218', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2485', 'MATO', '9', '2004-04-16', null, '20132411', '1219', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2486', 'FARUK', '2', '2011-09-05', null, '20132412', '1220', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2487', 'ABUBAKAR', '9', '2003-12-02', null, '20132413', '1221', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2488', 'ADAM', '11', '2002-09-19', null, '20132414', '1222', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2489', 'USMAN', '7', '2006-09-27', null, '20132415', '1223', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2490', '', '7', '2005-11-30', null, '20132416', '1224', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2491', 'BUNU', '7', '2006-05-07', null, '20132417', '1225', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2492', 'MOHAMMED', '9', '2004-04-03', null, '20132418', '1226', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2493', 'MAHMUD', '13', '1999-10-11', null, '20132419', '1227', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2494', '', '12', '2001-03-02', null, '20132420', '1228', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2495', 'ISAH', '17', '1996-01-07', null, '20132421', '1229', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2496', 'TIJANI', '12', '2000-11-16', null, '20132422', '1230', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2497', 'MOHAMMED', '3', '2010-02-09', null, '20132423', '1231', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2498', '', '7', '2005-10-04', null, '20132424', '1232', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2499', 'FAROUQ', '18', '1995-01-28', null, '20132425', '1233', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2500', 'SIDI', '16', '1997-02-14', null, '20132426', '1234', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2501', '', '7', '2006-07-17', null, '20132427', '1235', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2502', '', '14', '1999-08-09', null, '20132428', '1236', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2503', 'ADAMA YUSUF', '9', '0104-05-30', null, '20132429', '1237', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2504', 'AHMAD', '19', '1993-10-31', null, '20132430', '1238', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2505', '', '10', '2003-08-13', null, '20132431', '1239', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2506', '', '12', '2000-11-15', null, '20132432', '1240', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2507', 'KABIR', '11', '2001-10-15', null, '20132433', '1241', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2508', 'KABIR', '11', '2001-10-15', null, '20132434', '1242', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2509', '', '18', '1994-10-31', null, '20132435', '1243', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2510', 'SHUAIBU', '11', '2002-02-02', null, '20132436', '1244', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2511', '', '12', '2001-04-05', null, '20132437', '1245', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2512', 'U', '2', '2011-09-04', null, '20132438', '1246', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2513', 'MUHAMMED', '10', '2003-01-15', null, '20132439', '1247', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2514', 'MUSA', '2', '2011-09-06', null, '20132440', '1248', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2515', 'GOSTA', '9', '2004-08-26', null, '20132441', '1249', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2516', 'HAFIZ', '11', '2001-10-22', null, '20132442', '1250', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2517', 'ADAMU', '12', '2001-03-27', null, '20132443', '1251', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2518', 'A', '14', '1999-05-27', null, '20132444', '1252', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2519', 'ALI', '7', '2006-05-05', null, '20132445', '1253', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2520', '', '5', '2008-01-10', null, '20132446', '1254', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2521', 'OLUWATOBI', '6', '2007-06-14', null, '20132447', '1255', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2522', 'YALWA', '11', '2002-02-27', null, '20132448', '1256', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2523', '', '2', '2011-09-06', null, '20132449', '1257', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2524', 'YUSUF', '2', '2011-09-06', null, '20132450', '1258', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2525', 'NURAIN', '8', '2005-06-11', null, '20132451', '1259', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2526', 'USMAN', '5', '2008-09-01', null, '20132452', '1260', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2527', 'ANABA', '3', '2010-06-04', null, '20132453', '1261', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2528', 'ANABA', '5', '2008-06-30', null, '20132454', '1262', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2529', 'GARBA', '5', '2008-09-02', null, '20132455', '1263', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2530', 'BAHIJJA', '15', '1998-01-07', null, '20132456', '1264', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2531', 'MAIDABINO', '11', '2001-10-06', null, '20132457', '1265', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2532', 'MOHAMMED', '7', '2005-10-09', null, '20132458', '1266', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2533', '', '5', '2008-03-10', null, '20132459', '1267', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2534', '', '13', '2000-01-11', null, '20132460', '1268', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2535', 'KHALIFA', '7', '2006-08-09', null, '20132461', '1269', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2536', '', '7', '2005-12-15', null, '20132462', '1270', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2537', 'USMAN', '6', '2006-10-18', null, '20132463', '1271', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2538', 'MOHAMMED', '15', '1998-09-11', null, '20132464', '1272', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2539', 'TILDE', '15', '1998-06-19', null, '20132465', '1273', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2540', '', '7', '2005-10-23', null, '20132466', '1274', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2541', 'MAIKANO', '15', '1998-04-04', null, '20132467', '1275', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2542', '', '6', '2006-11-04', null, '20132468', '1276', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2543', '', '17', '1996-07-22', null, '20132469', '1277', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2544', 'UBALE', '15', '1998-05-05', null, '20132470', '1278', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2545', '', '14', '1999-02-25', null, '20132471', '1279', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2546', 'TILDE', '15', '1998-06-19', null, '20132472', '1280', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2547', '', '6', '2006-11-14', null, '20132473', '1281', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2548', 'KABIR', '9', '2004-03-29', null, '20132474', '1282', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2549', 'ABDULKAREEM AHMAD', '11', '2002-05-17', null, '20132475', '1283', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2550', 'MUHAMMAD', '12', '2001-04-25', null, '20132476', '1284', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2551', 'MUHAMMAD', '21', '1992-04-09', null, '20132477', '1285', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2552', '', '9', '2003-12-07', null, '20132478', '1286', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2553', 'MOHAMMED', '9', '2003-10-01', null, '20132479', '1287', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2554', 'AISHA', '8', '2005-03-02', null, '20132480', '1288', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2555', '', '5', '2008-07-08', null, '20132481', '1289', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2556', 'GOSTA', '9', '2003-10-16', null, '20132482', '1290', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2557', 'KELANI', '12', '2001-04-11', null, '20132483', '1291', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2558', 'USMAN', '7', '2006-08-01', null, '20132484', '1292', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2559', '', '6', '2006-11-04', null, '20132485', '1293', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2560', 'IZE MAMA', '11', '2002-07-12', null, '20132486', '1294', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2561', '', '14', '1999-08-06', null, '20132487', '1295', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2562', 'RAMALAN', '13', '2000-05-06', null, '20132488', '1296', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2563', 'MANI', '2', '2011-09-05', null, '20132489', '1297', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2564', ' BABANKOGI', '5', '2008-07-09', null, '20132490', '1298', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2565', 'ILELAH', '12', '2001-03-24', null, '20132491', '1299', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2566', 'ABDULLAHI', '9', '2003-10-15', null, '20132492', '1300', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2567', 'ABUBAKAR', '13', '2000-07-29', null, '20132493', '1301', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2568', '', '2', '2011-09-05', null, '20132494', '1302', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2569', 'USMAN', '9', '2004-08-05', null, '20132495', '1303', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2570', '', '14', '1998-11-01', null, '20132496', '1304', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2571', '', '14', '1999-07-01', null, '20132497', '1305', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2572', 'AJOKE', '17', '1996-09-01', null, '20132498', '1306', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2573', 'KOGARI', '2', '2011-09-06', null, '20132499', '1307', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2574', '', '7', '2006-04-08', null, '20132500', '1308', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2575', 'ABUBAKAR', '11', '2002-05-14', null, '20132501', '1309', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2576', 'ABUBAKAR', '8', '2004-12-18', null, '20132502', '1310', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2577', 'TINUKE', '15', '1998-05-01', null, '20132503', '1311', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2578', 'BIRCHI', '14', '1998-10-17', null, '20132504', '1312', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2579', 'MOHAMMED', '14', '1999-07-14', null, '20132505', '1313', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2580', '', '7', '2006-06-16', null, '20132506', '1314', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2581', 'MUSA', '2', '2011-09-06', null, '20132507', '1315', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2582', '', '5', '2008-02-28', null, '20132508', '1316', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2583', '', '15', '1998-07-29', null, '20132509', '1317', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2584', '', '7', '2006-09-11', null, '20132510', '1318', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2585', 'BUNU', '8', '2005-06-03', null, '20132511', '1319', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2586', '', '7', '2005-10-13', null, '20132512', '1320', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2587', '', '13', '1999-12-22', null, '20132513', '1321', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2588', 'SANUSI', '14', '1999-06-02', null, '20132514', '1322', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2589', 'GARBA', '13', '2000-09-25', null, '20132515', '1323', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2590', 'KABIRU', '2', '2011-05-03', null, '20132516', '1324', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2591', 'GAMBO', '14', '1999-09-11', null, '20132517', '1325', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2592', 'UMAR', '12', '2001-03-06', null, '20132518', '1326', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2593', 'BELLO ', '10', '2002-10-26', null, '20132519', '1327', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2594', '', '13', '2000-07-15', null, '20132520', '1328', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2595', 'HAMASANI', '16', '1997-03-10', null, '20132521', '1329', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2596', 'MOHAMMED', '7', '0016-01-06', null, '20132522', '1330', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2597', '', '16', '1996-10-08', null, '20132523', '1331', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2598', 'ABIDEEN', '19', '1994-09-06', null, '20132524', '1332', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2599', 'IMRAN', '15', '1998-06-19', null, '20132525', '1333', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2600', 'MANGA', '11', '2002-03-03', null, '20132526', '1334', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2601', '', '6', '2007-07-01', null, '20132527', '1335', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2602', 'KAKA', '7', '2005-10-03', null, '20132528', '1336', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2603', 'BURBBUR', '6', '2007-05-27', null, '20132529', '1337', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2604', '', '11', '2002-03-21', null, '20132530', '1338', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2605', 'MUHAMMAD', '8', '2005-05-01', null, '20132531', '1339', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2606', 'HALADU', '16', '1996-10-08', null, '20132532', '1340', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2607', '', '15', '1998-02-28', null, '20132533', '1341', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2608', '', '11', '2002-06-13', null, '20132534', '1342', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2609', '', '5', '2008-03-27', null, '20132535', '1343', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2610', 'MAHMUD', '11', '2002-07-17', null, '20132536', '1344', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2611', '', '11', '2002-04-25', null, '20132537', '1345', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2612', 'BABA', '13', '2000-05-20', null, '20132538', '1346', '2', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2613', 'FARUK', '11', '2002-03-03', null, '20132539', '1347', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');
INSERT INTO `biodata` VALUES ('2614', 'OMOTOLANI', '8', '2004-11-11', null, '20132540', '1348', '1', '37', '118', '1', '1', '1', '1', null, '9', '2');

-- ----------------------------
-- Table structure for classes
-- ----------------------------
DROP TABLE IF EXISTS `classes`;
CREATE TABLE `classes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of classes
-- ----------------------------
INSERT INTO `classes` VALUES ('1', 'Play Class');
INSERT INTO `classes` VALUES ('2', 'Nursery 1A');
INSERT INTO `classes` VALUES ('3', 'Nursery 1B');
INSERT INTO `classes` VALUES ('4', 'Nursery 1C');
INSERT INTO `classes` VALUES ('5', 'Nursery 2A');
INSERT INTO `classes` VALUES ('6', 'Nursery 2B');
INSERT INTO `classes` VALUES ('7', 'Nursery 2C');
INSERT INTO `classes` VALUES ('8', 'Nursery 3A');
INSERT INTO `classes` VALUES ('9', 'Nursery 3B');
INSERT INTO `classes` VALUES ('10', 'Nursery 3C');
INSERT INTO `classes` VALUES ('11', 'Primary 1A');
INSERT INTO `classes` VALUES ('12', 'Primary 1B');
INSERT INTO `classes` VALUES ('13', 'Primary 1C');
INSERT INTO `classes` VALUES ('14', 'Primary 2A');
INSERT INTO `classes` VALUES ('15', 'Primary 2B');
INSERT INTO `classes` VALUES ('16', 'Primary 2C');
INSERT INTO `classes` VALUES ('17', 'Primary 3A');
INSERT INTO `classes` VALUES ('18', 'Primary 3B');
INSERT INTO `classes` VALUES ('19', 'Primary 4A');
INSERT INTO `classes` VALUES ('20', 'Primary 4B');
INSERT INTO `classes` VALUES ('21', 'Primary 4C');
INSERT INTO `classes` VALUES ('22', 'Primary 5A');
INSERT INTO `classes` VALUES ('23', 'Primary 5B');
INSERT INTO `classes` VALUES ('24', 'Primary 6A');
INSERT INTO `classes` VALUES ('25', 'JSS 1A');
INSERT INTO `classes` VALUES ('26', 'JSS 1B');
INSERT INTO `classes` VALUES ('27', 'JSS 1C');
INSERT INTO `classes` VALUES ('28', 'JSS 2A');
INSERT INTO `classes` VALUES ('29', 'JSS 2B');
INSERT INTO `classes` VALUES ('30', 'JSS 2C');
INSERT INTO `classes` VALUES ('31', 'JSS 3A');
INSERT INTO `classes` VALUES ('32', 'JSS 3B');
INSERT INTO `classes` VALUES ('33', 'SS1 A');
INSERT INTO `classes` VALUES ('34', 'SS1 B');
INSERT INTO `classes` VALUES ('35', 'SS1 C');
INSERT INTO `classes` VALUES ('36', 'SS2 A');
INSERT INTO `classes` VALUES ('37', 'SS2 B');
INSERT INTO `classes` VALUES ('38', 'SS3 A');
INSERT INTO `classes` VALUES ('39', 'SS3 B');

-- ----------------------------
-- Table structure for class_attendance
-- ----------------------------
DROP TABLE IF EXISTS `class_attendance`;
CREATE TABLE `class_attendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attendance_type_id` int(11) DEFAULT NULL,
  `attendance_date` datetime DEFAULT NULL,
  `admission_no` varchar(15) DEFAULT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `term_id` int(11) NOT NULL DEFAULT '0',
  `class_id` int(11) NOT NULL DEFAULT '0',
  `academic_session_id` int(11) NOT NULL DEFAULT '0',
  `subject_id` int(11) NOT NULL DEFAULT '0',
  `attendance_reason` text,
  PRIMARY KEY (`id`,`user_id`,`term_id`,`class_id`,`academic_session_id`,`subject_id`),
  KEY `fk_class_attendance_users1_idx` (`user_id`),
  KEY `fk_class_attendance_terms1_idx` (`term_id`),
  KEY `fk_class_attendance_classes1_idx` (`class_id`),
  KEY `fk_class_attendance_academic_sessions1_idx` (`academic_session_id`),
  KEY `fk_class_attendance_subjects1_idx` (`subject_id`),
  CONSTRAINT `fk_class_attendance_academic_sessions1` FOREIGN KEY (`academic_session_id`) REFERENCES `academic_sessions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_class_attendance_classes1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_class_attendance_subjects1` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_class_attendance_terms1` FOREIGN KEY (`term_id`) REFERENCES `terms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_class_attendance_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of class_attendance
-- ----------------------------

-- ----------------------------
-- Table structure for deductions
-- ----------------------------
DROP TABLE IF EXISTS `deductions`;
CREATE TABLE `deductions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) NOT NULL DEFAULT '0',
  `deduction_date` date DEFAULT NULL,
  `deduction_type_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`staff_id`,`deduction_type_id`),
  KEY `fk_deductions_staff_records1_idx` (`staff_id`),
  KEY `fk_deductions_deduction_types1_idx` (`deduction_type_id`),
  CONSTRAINT `fk_deductions_deduction_types1` FOREIGN KEY (`deduction_type_id`) REFERENCES `deduction_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_deductions_staff_records1` FOREIGN KEY (`staff_id`) REFERENCES `staff_records` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of deductions
-- ----------------------------
INSERT INTO `deductions` VALUES ('2', '1', '2013-09-10', '2');

-- ----------------------------
-- Table structure for deduction_types
-- ----------------------------
DROP TABLE IF EXISTS `deduction_types`;
CREATE TABLE `deduction_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deduction_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of deduction_types
-- ----------------------------
INSERT INTO `deduction_types` VALUES ('1', 'Staff Children Scholarship');
INSERT INTO `deduction_types` VALUES ('2', 'Pension');
INSERT INTO `deduction_types` VALUES ('3', '3 Days Lateness');
INSERT INTO `deduction_types` VALUES ('4', 'Rent - Single Apartment');
INSERT INTO `deduction_types` VALUES ('5', 'Rent - Double Apartment');
INSERT INTO `deduction_types` VALUES ('6', 'Rent - Shared Apartment');

-- ----------------------------
-- Table structure for designations
-- ----------------------------
DROP TABLE IF EXISTS `designations`;
CREATE TABLE `designations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of designations
-- ----------------------------
INSERT INTO `designations` VALUES ('1', 'Ordinary Staff');
INSERT INTO `designations` VALUES ('2', 'Principal');
INSERT INTO `designations` VALUES ('3', 'Vice Principal');
INSERT INTO `designations` VALUES ('4', 'HOD/Senior Master');
INSERT INTO `designations` VALUES ('5', 'Exam Officer');
INSERT INTO `designations` VALUES ('6', 'Head Cleaner/Security');
INSERT INTO `designations` VALUES ('7', 'Special Duty/Extension');

-- ----------------------------
-- Table structure for entrance_examination
-- ----------------------------
DROP TABLE IF EXISTS `entrance_examination`;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of entrance_examination
-- ----------------------------

-- ----------------------------
-- Table structure for events
-- ----------------------------
DROP TABLE IF EXISTS `events`;
CREATE TABLE `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_title` varchar(160) DEFAULT NULL,
  `event_url` text,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `all_day` tinyint(4) DEFAULT '0',
  `event_for_group_id` int(11) NOT NULL DEFAULT '0',
  `student_class_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`event_for_group_id`,`user_id`),
  KEY `fk_events_classes1_idx` (`student_class_id`),
  KEY `fk_events_event_group1_idx` (`event_for_group_id`),
  KEY `fk_events_users1_idx` (`user_id`),
  CONSTRAINT `fk_events_classes1` FOREIGN KEY (`student_class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_events_event_group1` FOREIGN KEY (`event_for_group_id`) REFERENCES `event_group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_events_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of events
-- ----------------------------

-- ----------------------------
-- Table structure for event_group
-- ----------------------------
DROP TABLE IF EXISTS `event_group`;
CREATE TABLE `event_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_group_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of event_group
-- ----------------------------
INSERT INTO `event_group` VALUES ('1', 'Students');
INSERT INTO `event_group` VALUES ('2', 'Teachers');
INSERT INTO `event_group` VALUES ('3', 'All Users');

-- ----------------------------
-- Table structure for gender
-- ----------------------------
DROP TABLE IF EXISTS `gender`;
CREATE TABLE `gender` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gender_name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gender
-- ----------------------------
INSERT INTO `gender` VALUES ('1', 'Male');
INSERT INTO `gender` VALUES ('2', 'Female');
INSERT INTO `gender` VALUES ('3', 'Other');

-- ----------------------------
-- Table structure for incentives
-- ----------------------------
DROP TABLE IF EXISTS `incentives`;
CREATE TABLE `incentives` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `incentive_name` varchar(255) DEFAULT NULL,
  `incentive_percentage` float DEFAULT NULL,
  `incentive_type_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`incentive_type_id`),
  KEY `fk_incentives_incentive_types1_idx` (`incentive_type_id`),
  CONSTRAINT `fk_incentives_incentive_types1` FOREIGN KEY (`incentive_type_id`) REFERENCES `incentive_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of incentives
-- ----------------------------
INSERT INTO `incentives` VALUES ('2', 'Medical', '30', '1');
INSERT INTO `incentives` VALUES ('3', 'Transport', '20', '1');
INSERT INTO `incentives` VALUES ('4', 'Housing', '40', '1');
INSERT INTO `incentives` VALUES ('5', 'Pension', '7.5', '1');
INSERT INTO `incentives` VALUES ('6', 'Principal', '50', '2');
INSERT INTO `incentives` VALUES ('7', 'Vice Principal', '30', '2');
INSERT INTO `incentives` VALUES ('9', 'Hod/senior Master', '10', '2');
INSERT INTO `incentives` VALUES ('10', 'Exam Officer', '5', '2');
INSERT INTO `incentives` VALUES ('11', 'Head Cleaner/security', '5', '2');
INSERT INTO `incentives` VALUES ('12', 'Special Duty/extension', '5', '2');

-- ----------------------------
-- Table structure for incentive_types
-- ----------------------------
DROP TABLE IF EXISTS `incentive_types`;
CREATE TABLE `incentive_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `incentive_type_name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of incentive_types
-- ----------------------------
INSERT INTO `incentive_types` VALUES ('1', 'General');
INSERT INTO `incentive_types` VALUES ('2', 'Designated');

-- ----------------------------
-- Table structure for laravel_migrations
-- ----------------------------
DROP TABLE IF EXISTS `laravel_migrations`;
CREATE TABLE `laravel_migrations` (
  `bundle` varchar(50) NOT NULL,
  `name` varchar(200) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`bundle`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of laravel_migrations
-- ----------------------------
INSERT INTO `laravel_migrations` VALUES ('application', '2013_05_01_160704_create_session_table', '1');

-- ----------------------------
-- Table structure for medical_records
-- ----------------------------
DROP TABLE IF EXISTS `medical_records`;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of medical_records
-- ----------------------------

-- ----------------------------
-- Table structure for nationality
-- ----------------------------
DROP TABLE IF EXISTS `nationality`;
CREATE TABLE `nationality` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nationality_name` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nationality
-- ----------------------------
INSERT INTO `nationality` VALUES ('1', 'Andorra');
INSERT INTO `nationality` VALUES ('2', 'United Arab Emirate');
INSERT INTO `nationality` VALUES ('3', 'Afghanistan');
INSERT INTO `nationality` VALUES ('4', 'Antigua - Barbuda');
INSERT INTO `nationality` VALUES ('5', 'Anguilla');
INSERT INTO `nationality` VALUES ('6', 'Albania');
INSERT INTO `nationality` VALUES ('7', 'Armenia');
INSERT INTO `nationality` VALUES ('8', 'Argentina');
INSERT INTO `nationality` VALUES ('9', 'Australia');
INSERT INTO `nationality` VALUES ('10', 'Aruba');
INSERT INTO `nationality` VALUES ('11', 'Azerbaijan');
INSERT INTO `nationality` VALUES ('12', 'Bosnia');
INSERT INTO `nationality` VALUES ('13', 'Barbados');
INSERT INTO `nationality` VALUES ('14', 'Bangladesh');
INSERT INTO `nationality` VALUES ('15', 'Belgium');
INSERT INTO `nationality` VALUES ('16', 'Burkina Faso');
INSERT INTO `nationality` VALUES ('17', 'Bulgaria');
INSERT INTO `nationality` VALUES ('18', 'Bahrain');
INSERT INTO `nationality` VALUES ('19', 'Burundi');
INSERT INTO `nationality` VALUES ('20', 'Benin');
INSERT INTO `nationality` VALUES ('21', 'Bermuda');
INSERT INTO `nationality` VALUES ('22', 'Brunei');
INSERT INTO `nationality` VALUES ('23', 'Bolivia');
INSERT INTO `nationality` VALUES ('24', 'Brazil');
INSERT INTO `nationality` VALUES ('25', 'Bahamas');
INSERT INTO `nationality` VALUES ('26', 'Bhutan');
INSERT INTO `nationality` VALUES ('27', 'Botswana');
INSERT INTO `nationality` VALUES ('28', 'Belarus');
INSERT INTO `nationality` VALUES ('29', 'Belize');
INSERT INTO `nationality` VALUES ('30', 'Canada');
INSERT INTO `nationality` VALUES ('31', 'Curacao');
INSERT INTO `nationality` VALUES ('32', 'Central Africa Republic');
INSERT INTO `nationality` VALUES ('33', 'Congo');
INSERT INTO `nationality` VALUES ('34', 'Switzerland');
INSERT INTO `nationality` VALUES ('35', 'Christmas Island');
INSERT INTO `nationality` VALUES ('36', 'Cook Islands');
INSERT INTO `nationality` VALUES ('37', 'Chile');
INSERT INTO `nationality` VALUES ('38', 'Cameroon');
INSERT INTO `nationality` VALUES ('39', 'China');
INSERT INTO `nationality` VALUES ('40', 'Colombia');
INSERT INTO `nationality` VALUES ('41', 'Costa Rica');
INSERT INTO `nationality` VALUES ('42', 'Cote D\'Ivoire');
INSERT INTO `nationality` VALUES ('43', 'Cuba');
INSERT INTO `nationality` VALUES ('44', 'Cape Verde');
INSERT INTO `nationality` VALUES ('45', 'Cyprus');
INSERT INTO `nationality` VALUES ('46', 'Czech Republic');
INSERT INTO `nationality` VALUES ('47', 'Germany');
INSERT INTO `nationality` VALUES ('48', 'Djibouti');
INSERT INTO `nationality` VALUES ('49', 'Denmark');
INSERT INTO `nationality` VALUES ('50', 'Dominica');
INSERT INTO `nationality` VALUES ('51', 'Dominican Republic');
INSERT INTO `nationality` VALUES ('52', 'Algeria');
INSERT INTO `nationality` VALUES ('53', 'Ecuador');
INSERT INTO `nationality` VALUES ('54', 'Estonia');
INSERT INTO `nationality` VALUES ('55', 'Egypt');
INSERT INTO `nationality` VALUES ('56', 'Eritrea');
INSERT INTO `nationality` VALUES ('57', 'Spain');
INSERT INTO `nationality` VALUES ('58', 'Ethiopia');
INSERT INTO `nationality` VALUES ('59', 'Finland');
INSERT INTO `nationality` VALUES ('60', 'Fiji');
INSERT INTO `nationality` VALUES ('61', 'Faroe Islands');
INSERT INTO `nationality` VALUES ('62', 'France');
INSERT INTO `nationality` VALUES ('63', 'Great Britain');
INSERT INTO `nationality` VALUES ('64', 'Grenada');
INSERT INTO `nationality` VALUES ('65', 'Georgia');
INSERT INTO `nationality` VALUES ('66', 'Ghana');
INSERT INTO `nationality` VALUES ('67', 'Greenland');
INSERT INTO `nationality` VALUES ('68', 'Guinea');
INSERT INTO `nationality` VALUES ('69', 'Guadaloupe');
INSERT INTO `nationality` VALUES ('70', 'Equatorial Guinea');
INSERT INTO `nationality` VALUES ('71', 'Greece');
INSERT INTO `nationality` VALUES ('72', 'Guatemala');
INSERT INTO `nationality` VALUES ('73', 'Guam');
INSERT INTO `nationality` VALUES ('74', 'Guyana');
INSERT INTO `nationality` VALUES ('75', 'Hong Kong');
INSERT INTO `nationality` VALUES ('76', 'Honduras');
INSERT INTO `nationality` VALUES ('77', 'Croatia');
INSERT INTO `nationality` VALUES ('78', 'Haiti');
INSERT INTO `nationality` VALUES ('79', 'Hungary');
INSERT INTO `nationality` VALUES ('80', 'Iran');
INSERT INTO `nationality` VALUES ('81', 'Indonesia');
INSERT INTO `nationality` VALUES ('82', 'Israel');
INSERT INTO `nationality` VALUES ('83', 'India');
INSERT INTO `nationality` VALUES ('84', 'Iraq');
INSERT INTO `nationality` VALUES ('85', 'Ireland');
INSERT INTO `nationality` VALUES ('86', 'Iceland');
INSERT INTO `nationality` VALUES ('87', 'Italy');
INSERT INTO `nationality` VALUES ('88', 'Jamaica');
INSERT INTO `nationality` VALUES ('89', 'Jordan');
INSERT INTO `nationality` VALUES ('90', 'Japan');
INSERT INTO `nationality` VALUES ('91', 'Kenya');
INSERT INTO `nationality` VALUES ('92', 'Kyrgyzstan');
INSERT INTO `nationality` VALUES ('93', 'Cambodia');
INSERT INTO `nationality` VALUES ('94', 'Kiribati');
INSERT INTO `nationality` VALUES ('95', 'Korea');
INSERT INTO `nationality` VALUES ('96', 'Kuwait');
INSERT INTO `nationality` VALUES ('97', 'Kazakhstan');
INSERT INTO `nationality` VALUES ('98', 'Laos');
INSERT INTO `nationality` VALUES ('99', 'Lebanon');
INSERT INTO `nationality` VALUES ('100', 'St Lucia');
INSERT INTO `nationality` VALUES ('101', 'Liechtenstein');
INSERT INTO `nationality` VALUES ('102', 'Liberia');
INSERT INTO `nationality` VALUES ('103', 'Luxembourg');
INSERT INTO `nationality` VALUES ('104', 'Latvia');
INSERT INTO `nationality` VALUES ('105', 'Lybia');
INSERT INTO `nationality` VALUES ('106', 'Morocco');
INSERT INTO `nationality` VALUES ('107', 'Moldova');
INSERT INTO `nationality` VALUES ('108', 'Macedonia');
INSERT INTO `nationality` VALUES ('109', 'Mali');
INSERT INTO `nationality` VALUES ('110', 'Myanmar');
INSERT INTO `nationality` VALUES ('111', 'Mongolia');
INSERT INTO `nationality` VALUES ('112', 'Malta');
INSERT INTO `nationality` VALUES ('113', 'Mexico');
INSERT INTO `nationality` VALUES ('114', 'Malaysia');
INSERT INTO `nationality` VALUES ('115', 'Mozambique');
INSERT INTO `nationality` VALUES ('116', 'Namibia');
INSERT INTO `nationality` VALUES ('117', 'Niger');
INSERT INTO `nationality` VALUES ('118', 'Nigeria');
INSERT INTO `nationality` VALUES ('119', 'Nicaragua');
INSERT INTO `nationality` VALUES ('120', 'Netherlands');
INSERT INTO `nationality` VALUES ('121', 'Norway');
INSERT INTO `nationality` VALUES ('122', 'Nepal');
INSERT INTO `nationality` VALUES ('123', 'Nauru');
INSERT INTO `nationality` VALUES ('124', 'New Zealand');
INSERT INTO `nationality` VALUES ('125', 'Oman');
INSERT INTO `nationality` VALUES ('126', 'Panama');
INSERT INTO `nationality` VALUES ('127', 'Peru');
INSERT INTO `nationality` VALUES ('128', 'Philippines');
INSERT INTO `nationality` VALUES ('129', 'Pakistan');
INSERT INTO `nationality` VALUES ('130', 'Poland');
INSERT INTO `nationality` VALUES ('131', 'Puerto Rico');
INSERT INTO `nationality` VALUES ('132', 'Portugal');
INSERT INTO `nationality` VALUES ('133', 'Paraguay');
INSERT INTO `nationality` VALUES ('134', 'Qatar');
INSERT INTO `nationality` VALUES ('135', 'Romania');
INSERT INTO `nationality` VALUES ('136', 'Russia');
INSERT INTO `nationality` VALUES ('137', 'Rwanda');
INSERT INTO `nationality` VALUES ('138', 'Saudi Arabia');
INSERT INTO `nationality` VALUES ('139', 'Sudan');
INSERT INTO `nationality` VALUES ('140', 'Sweden');
INSERT INTO `nationality` VALUES ('141', 'Singapore');
INSERT INTO `nationality` VALUES ('142', 'Slovenia');
INSERT INTO `nationality` VALUES ('143', 'Slovakia');
INSERT INTO `nationality` VALUES ('144', 'San Marino');
INSERT INTO `nationality` VALUES ('145', 'Senegal');
INSERT INTO `nationality` VALUES ('146', 'Somalia');
INSERT INTO `nationality` VALUES ('147', 'Suriname');
INSERT INTO `nationality` VALUES ('148', 'Serbia - Montenegro');
INSERT INTO `nationality` VALUES ('149', 'El Salvador');
INSERT INTO `nationality` VALUES ('150', 'Syria');
INSERT INTO `nationality` VALUES ('151', 'Chad');
INSERT INTO `nationality` VALUES ('152', 'Togo');
INSERT INTO `nationality` VALUES ('153', 'Thailand');
INSERT INTO `nationality` VALUES ('154', 'Tokelau');
INSERT INTO `nationality` VALUES ('155', 'Tunisia');
INSERT INTO `nationality` VALUES ('156', 'Tonga');
INSERT INTO `nationality` VALUES ('157', 'Turkey');
INSERT INTO `nationality` VALUES ('158', 'Tridinidad Tobago');
INSERT INTO `nationality` VALUES ('159', 'Taiwan');
INSERT INTO `nationality` VALUES ('160', 'Ukraine');
INSERT INTO `nationality` VALUES ('161', 'United Kingdom');
INSERT INTO `nationality` VALUES ('162', 'United States');
INSERT INTO `nationality` VALUES ('163', 'Uruguay');
INSERT INTO `nationality` VALUES ('164', 'Vatican');
INSERT INTO `nationality` VALUES ('165', 'Venezuela');
INSERT INTO `nationality` VALUES ('166', 'Vietnam');
INSERT INTO `nationality` VALUES ('167', 'South Africa');
INSERT INTO `nationality` VALUES ('168', 'Zimbawe');

-- ----------------------------
-- Table structure for official_use
-- ----------------------------
DROP TABLE IF EXISTS `official_use`;
CREATE TABLE `official_use` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `last_class_id` int(11) NOT NULL,
  `present_class_id` int(11) NOT NULL,
  `aic_id` int(11) NOT NULL,
  `admission_recommendation_id` int(11) NOT NULL DEFAULT '0',
  `admission_no` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id`,`user_id`,`last_class_id`,`present_class_id`,`aic_id`,`admission_recommendation_id`),
  KEY `fk_official_use_admission_recommendation1_idx` (`admission_recommendation_id`),
  KEY `fk_official_use_classes1_idx` (`last_class_id`),
  KEY `fk_official_use_classes2_idx` (`present_class_id`),
  KEY `fk_official_use_classes3_idx` (`aic_id`),
  KEY `fk_official_use_users1_idx` (`user_id`),
  CONSTRAINT `fk_official_use_admission_recommendation1` FOREIGN KEY (`admission_recommendation_id`) REFERENCES `admission_recommendation` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_official_use_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1308 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of official_use
-- ----------------------------
INSERT INTO `official_use` VALUES ('1', '42', '1', '1', '1', '1', 'AIS/07/429');
INSERT INTO `official_use` VALUES ('2', '43', '1', '1', '1', '1', 'AIS/02/732');
INSERT INTO `official_use` VALUES ('3', '44', '1', '1', '1', '1', 'AIS/10/2023');
INSERT INTO `official_use` VALUES ('4', '45', '1', '1', '1', '1', 'AIS/11/069');
INSERT INTO `official_use` VALUES ('5', '46', '1', '1', '1', '1', 'AIS/08/620');
INSERT INTO `official_use` VALUES ('6', '47', '1', '1', '1', '1', 'AIS/05/033');
INSERT INTO `official_use` VALUES ('7', '48', '1', '1', '1', '1', 'AIS/08/2008');
INSERT INTO `official_use` VALUES ('8', '49', '1', '1', '1', '1', 'AIS/11/2236');
INSERT INTO `official_use` VALUES ('9', '50', '1', '1', '1', '1', 'AIS/09/137');
INSERT INTO `official_use` VALUES ('10', '51', '1', '1', '1', '1', 'AIS/08/680');
INSERT INTO `official_use` VALUES ('11', '52', '1', '1', '1', '1', 'AIS/08/825');
INSERT INTO `official_use` VALUES ('12', '53', '1', '1', '1', '1', 'AIS/08/225');
INSERT INTO `official_use` VALUES ('13', '54', '1', '1', '1', '1', 'AIS/07/518');
INSERT INTO `official_use` VALUES ('14', '55', '1', '1', '1', '1', 'AIS/08/150');
INSERT INTO `official_use` VALUES ('15', '56', '1', '1', '1', '1', 'AIS/09/063');
INSERT INTO `official_use` VALUES ('16', '57', '1', '1', '1', '1', 'AIS/09/203');
INSERT INTO `official_use` VALUES ('17', '58', '1', '1', '1', '1', 'AIS/10/3070');
INSERT INTO `official_use` VALUES ('18', '59', '1', '1', '1', '1', 'AIS/11/2182');
INSERT INTO `official_use` VALUES ('19', '60', '1', '1', '1', '1', 'AIS/10/2063');
INSERT INTO `official_use` VALUES ('20', '61', '1', '1', '1', '1', 'AIS/10/2088');
INSERT INTO `official_use` VALUES ('21', '62', '1', '1', '1', '1', 'AIS/10/2090');
INSERT INTO `official_use` VALUES ('22', '63', '1', '1', '1', '1', 'AIS/07/489');
INSERT INTO `official_use` VALUES ('23', '64', '1', '1', '1', '1', 'AIS/05/268');
INSERT INTO `official_use` VALUES ('24', '65', '1', '1', '1', '1', 'AIS/08/740');
INSERT INTO `official_use` VALUES ('25', '66', '1', '1', '1', '1', 'AIS/SS/11/08');
INSERT INTO `official_use` VALUES ('26', '67', '1', '1', '1', '1', 'AIS/08/512');
INSERT INTO `official_use` VALUES ('27', '68', '1', '1', '1', '1', 'AIS/08/686');
INSERT INTO `official_use` VALUES ('28', '69', '1', '1', '1', '1', 'AIS/11/2135');
INSERT INTO `official_use` VALUES ('29', '70', '1', '1', '1', '1', 'AIS/08/645');
INSERT INTO `official_use` VALUES ('30', '71', '1', '1', '1', '1', 'AIS/09/2015');
INSERT INTO `official_use` VALUES ('31', '72', '1', '1', '1', '1', 'AIS/SS/10/02');
INSERT INTO `official_use` VALUES ('32', '73', '1', '1', '1', '1', 'AIS/08/175');
INSERT INTO `official_use` VALUES ('33', '74', '1', '1', '1', '1', 'AIS/09/066');
INSERT INTO `official_use` VALUES ('34', '75', '1', '1', '1', '1', 'AIS/05/174');
INSERT INTO `official_use` VALUES ('35', '76', '1', '1', '1', '1', 'AIS/06/200');
INSERT INTO `official_use` VALUES ('36', '77', '1', '1', '1', '1', 'AIS/06/780');
INSERT INTO `official_use` VALUES ('37', '78', '1', '1', '1', '1', 'AIS/07/4890');
INSERT INTO `official_use` VALUES ('38', '79', '1', '1', '1', '1', 'AIS/08/542');
INSERT INTO `official_use` VALUES ('39', '80', '1', '1', '1', '1', 'AIS/08/604');
INSERT INTO `official_use` VALUES ('40', '81', '1', '1', '1', '1', 'AIS/08/672');
INSERT INTO `official_use` VALUES ('41', '82', '1', '1', '1', '1', 'AIS/08/773');
INSERT INTO `official_use` VALUES ('42', '83', '1', '1', '1', '1', 'AIS/09/119');
INSERT INTO `official_use` VALUES ('43', '84', '1', '1', '1', '1', 'AIS/11/2234');
INSERT INTO `official_use` VALUES ('44', '85', '1', '1', '1', '1', 'AIS/11/2260');
INSERT INTO `official_use` VALUES ('45', '86', '1', '1', '1', '1', 'AIS/SS/11/08');
INSERT INTO `official_use` VALUES ('46', '87', '1', '1', '1', '1', 'AIS/09/181');
INSERT INTO `official_use` VALUES ('47', '88', '1', '1', '1', '1', 'AIS/09/187');
INSERT INTO `official_use` VALUES ('48', '89', '1', '1', '1', '1', 'AIS/08/796');
INSERT INTO `official_use` VALUES ('49', '90', '1', '1', '1', '1', 'AIS/07/497');
INSERT INTO `official_use` VALUES ('50', '91', '1', '1', '1', '1', 'AIS/SS/10/03');
INSERT INTO `official_use` VALUES ('51', '92', '1', '1', '1', '1', 'AIS/10/3029');
INSERT INTO `official_use` VALUES ('52', '93', '1', '1', '1', '1', 'AIS/08/730');
INSERT INTO `official_use` VALUES ('53', '94', '1', '1', '1', '1', 'AIS/07/430');
INSERT INTO `official_use` VALUES ('54', '95', '1', '1', '1', '1', 'AIS/08/602');
INSERT INTO `official_use` VALUES ('55', '96', '1', '1', '1', '1', 'AIS/07/824');
INSERT INTO `official_use` VALUES ('56', '97', '1', '1', '1', '1', 'AIS/09/204');
INSERT INTO `official_use` VALUES ('57', '98', '1', '1', '1', '1', 'AIS/08/575');
INSERT INTO `official_use` VALUES ('58', '99', '1', '1', '1', '1', 'AIS/08/678');
INSERT INTO `official_use` VALUES ('59', '100', '1', '1', '1', '1', 'AIS/SS/11/07');
INSERT INTO `official_use` VALUES ('60', '101', '1', '1', '1', '1', 'AIS/10/3046');
INSERT INTO `official_use` VALUES ('61', '102', '1', '1', '1', '1', 'AIS/07/635');
INSERT INTO `official_use` VALUES ('62', '103', '1', '1', '1', '1', 'AIS/07/442');
INSERT INTO `official_use` VALUES ('63', '104', '1', '1', '1', '1', 'AIS/08/778');
INSERT INTO `official_use` VALUES ('64', '105', '1', '1', '1', '1', 'AIS/09/017');
INSERT INTO `official_use` VALUES ('65', '106', '1', '1', '1', '1', 'AIS/09/038');
INSERT INTO `official_use` VALUES ('66', '107', '1', '1', '1', '1', 'AIS/09/106');
INSERT INTO `official_use` VALUES ('67', '108', '1', '1', '1', '1', 'AIS/09/188');
INSERT INTO `official_use` VALUES ('68', '109', '1', '1', '1', '1', 'AIS/11/107');
INSERT INTO `official_use` VALUES ('69', '110', '1', '1', '1', '1', 'AIS/11/2150');
INSERT INTO `official_use` VALUES ('70', '111', '1', '1', '1', '1', 'AIS/11/2205');
INSERT INTO `official_use` VALUES ('71', '112', '1', '1', '1', '1', 'AIS/04/219');
INSERT INTO `official_use` VALUES ('72', '113', '1', '1', '1', '1', 'AIS/05/304');
INSERT INTO `official_use` VALUES ('73', '114', '1', '1', '1', '1', 'AIS/08/671');
INSERT INTO `official_use` VALUES ('74', '115', '1', '1', '1', '1', 'AIS/03/831');
INSERT INTO `official_use` VALUES ('75', '116', '1', '1', '1', '1', 'AIS/09/019');
INSERT INTO `official_use` VALUES ('76', '117', '1', '1', '1', '1', 'AIS/06/349');
INSERT INTO `official_use` VALUES ('77', '118', '1', '1', '1', '1', 'AIS/03/146');
INSERT INTO `official_use` VALUES ('78', '119', '1', '1', '1', '1', 'AIS/11/2102');
INSERT INTO `official_use` VALUES ('79', '120', '1', '1', '1', '1', 'AIS/07/180');
INSERT INTO `official_use` VALUES ('80', '121', '1', '1', '1', '1', 'AIS/08/176');
INSERT INTO `official_use` VALUES ('81', '122', '1', '1', '1', '1', 'AIS/11/2194');
INSERT INTO `official_use` VALUES ('82', '123', '1', '1', '1', '1', 'AIS/08/729');
INSERT INTO `official_use` VALUES ('83', '124', '1', '1', '1', '1', 'AIS/10/2085');
INSERT INTO `official_use` VALUES ('84', '125', '1', '1', '1', '1', 'AIS/11/2255');
INSERT INTO `official_use` VALUES ('85', '126', '1', '1', '1', '1', 'AIS/10/2020');
INSERT INTO `official_use` VALUES ('86', '127', '1', '1', '1', '1', 'AIS/10/3040');
INSERT INTO `official_use` VALUES ('87', '128', '1', '1', '1', '1', 'AIS/05/270');
INSERT INTO `official_use` VALUES ('88', '129', '1', '1', '1', '1', 'AIS/07/490');
INSERT INTO `official_use` VALUES ('89', '130', '1', '1', '1', '1', 'AIS/08/174');
INSERT INTO `official_use` VALUES ('90', '131', '1', '1', '1', '1', 'AIS/08/2030');
INSERT INTO `official_use` VALUES ('91', '132', '1', '1', '1', '1', 'AIS/09/022');
INSERT INTO `official_use` VALUES ('92', '133', '1', '1', '1', '1', 'AIS/02/044');
INSERT INTO `official_use` VALUES ('93', '134', '1', '1', '1', '1', 'AIS/02/045');
INSERT INTO `official_use` VALUES ('94', '135', '1', '1', '1', '1', 'AIS/06/350');
INSERT INTO `official_use` VALUES ('95', '136', '1', '1', '1', '1', 'AIS/07/443');
INSERT INTO `official_use` VALUES ('96', '137', '1', '1', '1', '1', 'AIS/07/460');
INSERT INTO `official_use` VALUES ('97', '138', '1', '1', '1', '1', 'AIS/07/478');
INSERT INTO `official_use` VALUES ('98', '139', '1', '1', '1', '1', 'AIS/07/510');
INSERT INTO `official_use` VALUES ('99', '140', '1', '1', '1', '1', 'AIS/08/616');
INSERT INTO `official_use` VALUES ('100', '141', '1', '1', '1', '1', 'AIS/08/618');
INSERT INTO `official_use` VALUES ('101', '142', '1', '1', '1', '1', 'AIS/08/670');
INSERT INTO `official_use` VALUES ('102', '143', '1', '1', '1', '1', 'AIS/08/719');
INSERT INTO `official_use` VALUES ('103', '144', '1', '1', '1', '1', 'AIS/08/762');
INSERT INTO `official_use` VALUES ('104', '145', '1', '1', '1', '1', 'AIS/08/790');
INSERT INTO `official_use` VALUES ('105', '146', '1', '1', '1', '1', 'AIS/09/032');
INSERT INTO `official_use` VALUES ('106', '147', '1', '1', '1', '1', 'AIS/09/042');
INSERT INTO `official_use` VALUES ('107', '148', '1', '1', '1', '1', 'AIS/09/099');
INSERT INTO `official_use` VALUES ('108', '149', '1', '1', '1', '1', 'AIS/09/122');
INSERT INTO `official_use` VALUES ('109', '150', '1', '1', '1', '1', 'AIS/09/198');
INSERT INTO `official_use` VALUES ('110', '151', '1', '1', '1', '1', 'AIS/09/751');
INSERT INTO `official_use` VALUES ('111', '152', '1', '1', '1', '1', 'AIS/10/2014');
INSERT INTO `official_use` VALUES ('112', '153', '1', '1', '1', '1', 'AIS/10/2040');
INSERT INTO `official_use` VALUES ('113', '154', '1', '1', '1', '1', 'AIS/10/3073');
INSERT INTO `official_use` VALUES ('114', '155', '1', '1', '1', '1', 'AIS/10/3083');
INSERT INTO `official_use` VALUES ('115', '156', '1', '1', '1', '1', 'AIS/11/2147');
INSERT INTO `official_use` VALUES ('116', '157', '1', '1', '1', '1', 'AIS/11/2221');
INSERT INTO `official_use` VALUES ('117', '158', '1', '1', '1', '1', 'AIS/11/2291');
INSERT INTO `official_use` VALUES ('118', '159', '1', '1', '1', '1', 'AIS/11/2298');
INSERT INTO `official_use` VALUES ('119', '160', '1', '1', '1', '1', 'AIS/11/2312');
INSERT INTO `official_use` VALUES ('120', '161', '1', '1', '1', '1', 'AIS/11/2313');
INSERT INTO `official_use` VALUES ('121', '162', '1', '1', '1', '1', 'AIS/SS/10/03');
INSERT INTO `official_use` VALUES ('122', '163', '1', '1', '1', '1', 'AIS/SS/11/08');
INSERT INTO `official_use` VALUES ('123', '164', '1', '1', '1', '1', 'AIS/08/183');
INSERT INTO `official_use` VALUES ('124', '165', '1', '1', '1', '1', 'AIS/09/039');
INSERT INTO `official_use` VALUES ('125', '166', '1', '1', '1', '1', 'AIS/09/213');
INSERT INTO `official_use` VALUES ('126', '167', '1', '1', '1', '1', 'AIS/04/115');
INSERT INTO `official_use` VALUES ('127', '168', '1', '1', '1', '1', 'AIS/05/301');
INSERT INTO `official_use` VALUES ('128', '169', '1', '1', '1', '1', 'AIS/08/172');
INSERT INTO `official_use` VALUES ('129', '170', '1', '1', '1', '1', 'AIS/08/708');
INSERT INTO `official_use` VALUES ('130', '171', '1', '1', '1', '1', 'AIS/10/3066');
INSERT INTO `official_use` VALUES ('131', '172', '1', '1', '1', '1', 'AIS/11/2104');
INSERT INTO `official_use` VALUES ('132', '173', '1', '1', '1', '1', 'AIS/11/2148');
INSERT INTO `official_use` VALUES ('133', '174', '1', '1', '1', '1', 'AIS/SS/10/01');
INSERT INTO `official_use` VALUES ('134', '175', '1', '1', '1', '1', 'AIS/08/792');
INSERT INTO `official_use` VALUES ('135', '176', '1', '1', '1', '1', 'AIS/08/793');
INSERT INTO `official_use` VALUES ('136', '177', '1', '1', '1', '1', 'AIS/08/794');
INSERT INTO `official_use` VALUES ('137', '178', '1', '1', '1', '1', 'AIS/10/1048');
INSERT INTO `official_use` VALUES ('138', '179', '1', '1', '1', '1', 'AIS/10/3084');
INSERT INTO `official_use` VALUES ('139', '180', '1', '1', '1', '1', 'AIS/10/4042');
INSERT INTO `official_use` VALUES ('140', '181', '1', '1', '1', '1', 'AIS/08/804');
INSERT INTO `official_use` VALUES ('141', '182', '1', '1', '1', '1', 'AIS/11/2243');
INSERT INTO `official_use` VALUES ('142', '183', '1', '1', '1', '1', 'AIS/08/185');
INSERT INTO `official_use` VALUES ('143', '184', '1', '1', '1', '1', 'AIS/11/2125');
INSERT INTO `official_use` VALUES ('144', '185', '1', '1', '1', '1', 'AIS/SS/11/05');
INSERT INTO `official_use` VALUES ('145', '186', '1', '1', '1', '1', 'AIS/11/2271');
INSERT INTO `official_use` VALUES ('146', '187', '1', '1', '1', '1', 'AIS/11/2268');
INSERT INTO `official_use` VALUES ('147', '188', '1', '1', '1', '1', 'AIS/06/392');
INSERT INTO `official_use` VALUES ('148', '189', '1', '1', '1', '1', 'AIS/07/679');
INSERT INTO `official_use` VALUES ('149', '190', '1', '1', '1', '1', 'AIS/08/569');
INSERT INTO `official_use` VALUES ('150', '191', '1', '1', '1', '1', 'AIS/08/698');
INSERT INTO `official_use` VALUES ('151', '192', '1', '1', '1', '1', 'AIS/09/101');
INSERT INTO `official_use` VALUES ('152', '193', '1', '1', '1', '1', 'AIS/09/103');
INSERT INTO `official_use` VALUES ('153', '194', '1', '1', '1', '1', 'AIS/09/117');
INSERT INTO `official_use` VALUES ('154', '195', '1', '1', '1', '1', 'AIS/09/189');
INSERT INTO `official_use` VALUES ('155', '196', '1', '1', '1', '1', 'AIS/10/2048');
INSERT INTO `official_use` VALUES ('156', '197', '1', '1', '1', '1', 'AIS/10/2055');
INSERT INTO `official_use` VALUES ('157', '198', '1', '1', '1', '1', 'AIS/10/3015');
INSERT INTO `official_use` VALUES ('158', '199', '1', '1', '1', '1', 'AIS/10/3033');
INSERT INTO `official_use` VALUES ('159', '200', '1', '1', '1', '1', 'AIS/10/3035');
INSERT INTO `official_use` VALUES ('160', '201', '1', '1', '1', '1', 'AIS/11/2100');
INSERT INTO `official_use` VALUES ('161', '202', '1', '1', '1', '1', 'AIS/11/2210');
INSERT INTO `official_use` VALUES ('162', '203', '1', '1', '1', '1', 'AIS/11/2311');
INSERT INTO `official_use` VALUES ('163', '204', '1', '1', '1', '1', 'AIS/11/2318');
INSERT INTO `official_use` VALUES ('164', '205', '1', '1', '1', '1', 'AIS/07/441');
INSERT INTO `official_use` VALUES ('165', '206', '1', '1', '1', '1', 'AIS/SS/10/01');
INSERT INTO `official_use` VALUES ('166', '207', '1', '1', '1', '1', 'AIS/02/020');
INSERT INTO `official_use` VALUES ('167', '208', '1', '1', '1', '1', 'AIS/06/115');
INSERT INTO `official_use` VALUES ('168', '209', '1', '1', '1', '1', 'AIS/07/465');
INSERT INTO `official_use` VALUES ('169', '210', '1', '1', '1', '1', 'AIS/07/538');
INSERT INTO `official_use` VALUES ('170', '211', '1', '1', '1', '1', 'AIS/08/690');
INSERT INTO `official_use` VALUES ('171', '212', '1', '1', '1', '1', 'AIS/08/735');
INSERT INTO `official_use` VALUES ('172', '213', '1', '1', '1', '1', 'AIS/09/133');
INSERT INTO `official_use` VALUES ('173', '214', '1', '1', '1', '1', 'AIS/09/215');
INSERT INTO `official_use` VALUES ('174', '215', '1', '1', '1', '1', 'AIS/10/1044');
INSERT INTO `official_use` VALUES ('175', '216', '1', '1', '1', '1', 'AIS/03/089');
INSERT INTO `official_use` VALUES ('176', '217', '1', '1', '1', '1', 'AIS/05/254');
INSERT INTO `official_use` VALUES ('177', '218', '1', '1', '1', '1', 'AIS/05/287');
INSERT INTO `official_use` VALUES ('178', '219', '1', '1', '1', '1', 'AIS/05/308');
INSERT INTO `official_use` VALUES ('179', '220', '1', '1', '1', '1', 'AIS/05/826');
INSERT INTO `official_use` VALUES ('180', '221', '1', '1', '1', '1', 'AIS/06/379');
INSERT INTO `official_use` VALUES ('181', '222', '1', '1', '1', '1', 'AIS/06/423');
INSERT INTO `official_use` VALUES ('182', '223', '1', '1', '1', '1', 'AIS/06/509');
INSERT INTO `official_use` VALUES ('183', '224', '1', '1', '1', '1', 'AIS/07/148');
INSERT INTO `official_use` VALUES ('184', '225', '1', '1', '1', '1', 'AIS/07/162');
INSERT INTO `official_use` VALUES ('185', '226', '1', '1', '1', '1', 'AIS/07/367');
INSERT INTO `official_use` VALUES ('186', '227', '1', '1', '1', '1', 'AIS/07/424');
INSERT INTO `official_use` VALUES ('187', '228', '1', '1', '1', '1', 'AIS/07/448');
INSERT INTO `official_use` VALUES ('188', '229', '1', '1', '1', '1', 'AIS/07/449');
INSERT INTO `official_use` VALUES ('189', '230', '1', '1', '1', '1', 'AIS/07/461');
INSERT INTO `official_use` VALUES ('190', '231', '1', '1', '1', '1', 'AIS/07/503');
INSERT INTO `official_use` VALUES ('191', '232', '1', '1', '1', '1', 'AIS/07/504');
INSERT INTO `official_use` VALUES ('192', '233', '1', '1', '1', '1', 'AIS/07/652');
INSERT INTO `official_use` VALUES ('193', '234', '1', '1', '1', '1', 'AIS/08/179');
INSERT INTO `official_use` VALUES ('194', '235', '1', '1', '1', '1', 'AIS/08/181');
INSERT INTO `official_use` VALUES ('195', '236', '1', '1', '1', '1', 'AIS/08/528');
INSERT INTO `official_use` VALUES ('196', '237', '1', '1', '1', '1', 'AIS/08/591');
INSERT INTO `official_use` VALUES ('197', '238', '1', '1', '1', '1', 'AIS/08/599');
INSERT INTO `official_use` VALUES ('198', '239', '1', '1', '1', '1', 'AIS/08/601');
INSERT INTO `official_use` VALUES ('199', '240', '1', '1', '1', '1', 'AIS/08/646');
INSERT INTO `official_use` VALUES ('200', '241', '1', '1', '1', '1', 'AIS/08/650');
INSERT INTO `official_use` VALUES ('201', '242', '1', '1', '1', '1', 'AIS/08/666');
INSERT INTO `official_use` VALUES ('202', '243', '1', '1', '1', '1', 'AIS/08/679');
INSERT INTO `official_use` VALUES ('203', '244', '1', '1', '1', '1', 'AIS/08/768');
INSERT INTO `official_use` VALUES ('204', '245', '1', '1', '1', '1', 'AIS/08/781');
INSERT INTO `official_use` VALUES ('205', '246', '1', '1', '1', '1', 'AIS/08/787');
INSERT INTO `official_use` VALUES ('206', '247', '1', '1', '1', '1', 'AIS/08/789');
INSERT INTO `official_use` VALUES ('207', '248', '1', '1', '1', '1', 'AIS/09/035');
INSERT INTO `official_use` VALUES ('208', '249', '1', '1', '1', '1', 'AIS/09/037');
INSERT INTO `official_use` VALUES ('209', '250', '1', '1', '1', '1', 'AIS/09/040');
INSERT INTO `official_use` VALUES ('210', '251', '1', '1', '1', '1', 'AIS/09/049');
INSERT INTO `official_use` VALUES ('211', '252', '1', '1', '1', '1', 'AIS/09/098');
INSERT INTO `official_use` VALUES ('212', '253', '1', '1', '1', '1', 'AIS/09/192');
INSERT INTO `official_use` VALUES ('213', '254', '1', '1', '1', '1', 'AIS/09/199');
INSERT INTO `official_use` VALUES ('214', '255', '1', '1', '1', '1', 'AIS/10/1053');
INSERT INTO `official_use` VALUES ('215', '256', '1', '1', '1', '1', 'AIS/10/2004');
INSERT INTO `official_use` VALUES ('216', '257', '1', '1', '1', '1', 'AIS/10/2044');
INSERT INTO `official_use` VALUES ('217', '258', '1', '1', '1', '1', 'AIS/10/2086');
INSERT INTO `official_use` VALUES ('218', '259', '1', '1', '1', '1', 'AIS/10/3010');
INSERT INTO `official_use` VALUES ('219', '260', '1', '1', '1', '1', 'AIS/10/3020');
INSERT INTO `official_use` VALUES ('220', '261', '1', '1', '1', '1', 'AIS/10/3023');
INSERT INTO `official_use` VALUES ('221', '262', '1', '1', '1', '1', 'AIS/10/3053');
INSERT INTO `official_use` VALUES ('222', '263', '1', '1', '1', '1', 'AIS/10/3079');
INSERT INTO `official_use` VALUES ('223', '264', '1', '1', '1', '1', 'AIS/11/2153');
INSERT INTO `official_use` VALUES ('224', '265', '1', '1', '1', '1', 'AIS/11/2175');
INSERT INTO `official_use` VALUES ('225', '266', '1', '1', '1', '1', 'AIS/11/2213');
INSERT INTO `official_use` VALUES ('226', '267', '1', '1', '1', '1', 'AIS/11/2249');
INSERT INTO `official_use` VALUES ('227', '268', '1', '1', '1', '1', 'AIS/11/2262');
INSERT INTO `official_use` VALUES ('228', '269', '1', '1', '1', '1', 'AIS/11/2264');
INSERT INTO `official_use` VALUES ('229', '270', '1', '1', '1', '1', 'AIS/11/2270');
INSERT INTO `official_use` VALUES ('230', '271', '1', '1', '1', '1', 'AIS/11/2279');
INSERT INTO `official_use` VALUES ('231', '272', '1', '1', '1', '1', 'AIS/11/2296');
INSERT INTO `official_use` VALUES ('232', '273', '1', '1', '1', '1', 'AIS/11/2305');
INSERT INTO `official_use` VALUES ('233', '274', '1', '1', '1', '1', 'AIS/11/2308');
INSERT INTO `official_use` VALUES ('234', '275', '1', '1', '1', '1', 'AIS/SS/10/00');
INSERT INTO `official_use` VALUES ('235', '276', '1', '1', '1', '1', 'AIS/SS/10/01');
INSERT INTO `official_use` VALUES ('236', '277', '1', '1', '1', '1', 'AIS/SS/10/02');
INSERT INTO `official_use` VALUES ('237', '278', '1', '1', '1', '1', 'AIS/SS/10/03');
INSERT INTO `official_use` VALUES ('238', '279', '1', '1', '1', '1', 'AIS/SS/11/05');
INSERT INTO `official_use` VALUES ('239', '280', '1', '1', '1', '1', 'AIS/SS/11/05');
INSERT INTO `official_use` VALUES ('240', '281', '1', '1', '1', '1', 'AIS/SS/11/09');
INSERT INTO `official_use` VALUES ('241', '282', '1', '1', '1', '1', 'AIS/09/054');
INSERT INTO `official_use` VALUES ('242', '283', '1', '1', '1', '1', 'AIS/03/071');
INSERT INTO `official_use` VALUES ('243', '284', '1', '1', '1', '1', 'AIS/07/529');
INSERT INTO `official_use` VALUES ('244', '285', '1', '1', '1', '1', 'AIS/07/5290');
INSERT INTO `official_use` VALUES ('245', '286', '1', '1', '1', '1', 'AIS/08/7880');
INSERT INTO `official_use` VALUES ('246', '287', '1', '1', '1', '1', 'AIS/10/3012');
INSERT INTO `official_use` VALUES ('247', '288', '1', '1', '1', '1', 'AIS/04/104');
INSERT INTO `official_use` VALUES ('248', '289', '1', '1', '1', '1', 'AIS/05/288');
INSERT INTO `official_use` VALUES ('249', '290', '1', '1', '1', '1', 'AIS/09/161');
INSERT INTO `official_use` VALUES ('250', '291', '1', '1', '1', '1', 'AIS/11/2300');
INSERT INTO `official_use` VALUES ('251', '292', '1', '1', '1', '1', 'AIS/08/724');
INSERT INTO `official_use` VALUES ('252', '293', '1', '1', '1', '1', 'AIS/09/033');
INSERT INTO `official_use` VALUES ('253', '294', '1', '1', '1', '1', 'AIS/11/2267');
INSERT INTO `official_use` VALUES ('254', '295', '1', '1', '1', '1', 'AIS/11/2304');
INSERT INTO `official_use` VALUES ('255', '296', '1', '1', '1', '1', 'AIS/09/091');
INSERT INTO `official_use` VALUES ('256', '297', '1', '1', '1', '1', 'AIS/02/257');
INSERT INTO `official_use` VALUES ('257', '298', '1', '1', '1', '1', 'AIS/08/224');
INSERT INTO `official_use` VALUES ('258', '299', '1', '1', '1', '1', 'AIS/09/191');
INSERT INTO `official_use` VALUES ('259', '300', '1', '1', '1', '1', 'AIS/10/2074');
INSERT INTO `official_use` VALUES ('260', '301', '1', '1', '1', '1', 'AIS/11/2164');
INSERT INTO `official_use` VALUES ('261', '302', '1', '1', '1', '1', 'AIS/11/2196');
INSERT INTO `official_use` VALUES ('262', '303', '1', '1', '1', '1', 'AIS/11/2232');
INSERT INTO `official_use` VALUES ('263', '304', '1', '1', '1', '1', 'AIS/09/109');
INSERT INTO `official_use` VALUES ('264', '305', '1', '1', '1', '1', 'AIS/08/656');
INSERT INTO `official_use` VALUES ('265', '306', '1', '1', '1', '1', 'AIS/09/201');
INSERT INTO `official_use` VALUES ('266', '307', '1', '1', '1', '1', 'AIS/08/2012');
INSERT INTO `official_use` VALUES ('267', '308', '1', '1', '1', '1', 'AIS/08/651');
INSERT INTO `official_use` VALUES ('268', '309', '1', '1', '1', '1', 'AIS/11/2113');
INSERT INTO `official_use` VALUES ('269', '310', '1', '1', '1', '1', 'AIS/11/2174');
INSERT INTO `official_use` VALUES ('270', '311', '1', '1', '1', '1', 'AIS/11/2240');
INSERT INTO `official_use` VALUES ('271', '312', '1', '1', '1', '1', 'AIS/08/805');
INSERT INTO `official_use` VALUES ('272', '313', '1', '1', '1', '1', 'AIS/10/3049');
INSERT INTO `official_use` VALUES ('273', '314', '1', '1', '1', '1', 'AIS/11/2261');
INSERT INTO `official_use` VALUES ('274', '315', '1', '1', '1', '1', 'AIS/11/2280');
INSERT INTO `official_use` VALUES ('275', '316', '1', '1', '1', '1', 'AIS/11/2110');
INSERT INTO `official_use` VALUES ('276', '317', '1', '1', '1', '1', 'AIS/04/216');
INSERT INTO `official_use` VALUES ('277', '318', '1', '1', '1', '1', 'AIS/05/249');
INSERT INTO `official_use` VALUES ('278', '319', '1', '1', '1', '1', 'AIS/05/549');
INSERT INTO `official_use` VALUES ('279', '320', '1', '1', '1', '1', 'AIS/07/477');
INSERT INTO `official_use` VALUES ('280', '321', '1', '1', '1', '1', 'AIS/07/506');
INSERT INTO `official_use` VALUES ('281', '322', '1', '1', '1', '1', 'AIS/08/677');
INSERT INTO `official_use` VALUES ('282', '323', '1', '1', '1', '1', 'AIS/08/694');
INSERT INTO `official_use` VALUES ('283', '324', '1', '1', '1', '1', 'AIS/08/7350');
INSERT INTO `official_use` VALUES ('284', '325', '1', '1', '1', '1', 'AIS/09/018');
INSERT INTO `official_use` VALUES ('285', '326', '1', '1', '1', '1', 'AIS/09/059');
INSERT INTO `official_use` VALUES ('286', '327', '1', '1', '1', '1', 'AIS/09/087');
INSERT INTO `official_use` VALUES ('287', '328', '1', '1', '1', '1', 'AIS/09/105');
INSERT INTO `official_use` VALUES ('288', '329', '1', '1', '1', '1', 'AIS/09/795');
INSERT INTO `official_use` VALUES ('289', '330', '1', '1', '1', '1', 'AIS/11/0148');
INSERT INTO `official_use` VALUES ('290', '331', '1', '1', '1', '1', 'AIS/11/2156');
INSERT INTO `official_use` VALUES ('291', '332', '1', '1', '1', '1', 'AIS/11/2198');
INSERT INTO `official_use` VALUES ('292', '333', '1', '1', '1', '1', 'AIS/11/2207');
INSERT INTO `official_use` VALUES ('293', '334', '1', '1', '1', '1', 'AIS/11/2219');
INSERT INTO `official_use` VALUES ('294', '335', '1', '1', '1', '1', 'AIS/SS/10/02');
INSERT INTO `official_use` VALUES ('295', '336', '1', '1', '1', '1', 'AIS/SS/11/04');
INSERT INTO `official_use` VALUES ('296', '337', '1', '1', '1', '1', 'AIS/11/2138');
INSERT INTO `official_use` VALUES ('297', '338', '1', '1', '1', '1', 'AIS/09/078');
INSERT INTO `official_use` VALUES ('298', '339', '1', '1', '1', '1', 'AIS/08/582');
INSERT INTO `official_use` VALUES ('299', '340', '1', '1', '1', '1', 'AIS/11/2288');
INSERT INTO `official_use` VALUES ('300', '341', '1', '1', '1', '1', 'AIS/09/172');
INSERT INTO `official_use` VALUES ('301', '342', '1', '1', '1', '1', 'AIS/10/3052');
INSERT INTO `official_use` VALUES ('302', '343', '1', '1', '1', '1', 'AIS/10/3003');
INSERT INTO `official_use` VALUES ('303', '344', '1', '1', '1', '1', 'AIS/11/2256');
INSERT INTO `official_use` VALUES ('304', '345', '1', '1', '1', '1', 'AIS/06/458');
INSERT INTO `official_use` VALUES ('305', '346', '1', '1', '1', '1', 'AIS/07/222');
INSERT INTO `official_use` VALUES ('306', '347', '1', '1', '1', '1', 'AIS/07/636');
INSERT INTO `official_use` VALUES ('307', '348', '1', '1', '1', '1', 'AIS/08/567');
INSERT INTO `official_use` VALUES ('308', '349', '1', '1', '1', '1', 'AIS/08/589');
INSERT INTO `official_use` VALUES ('309', '350', '1', '1', '1', '1', 'AIS/08/625');
INSERT INTO `official_use` VALUES ('310', '351', '1', '1', '1', '1', 'AIS/08/631');
INSERT INTO `official_use` VALUES ('311', '352', '1', '1', '1', '1', 'AIS/08/785');
INSERT INTO `official_use` VALUES ('312', '353', '1', '1', '1', '1', 'AIS/09/041');
INSERT INTO `official_use` VALUES ('313', '354', '1', '1', '1', '1', 'AIS/09/142');
INSERT INTO `official_use` VALUES ('314', '355', '1', '1', '1', '1', 'AIS/09/211');
INSERT INTO `official_use` VALUES ('315', '356', '1', '1', '1', '1', 'AIS/10/2022');
INSERT INTO `official_use` VALUES ('316', '357', '1', '1', '1', '1', 'AIS/10/2067');
INSERT INTO `official_use` VALUES ('317', '358', '1', '1', '1', '1', 'AIS/10/3006');
INSERT INTO `official_use` VALUES ('318', '359', '1', '1', '1', '1', 'AIS/10/3014');
INSERT INTO `official_use` VALUES ('319', '360', '1', '1', '1', '1', 'AIS/10/3069');
INSERT INTO `official_use` VALUES ('320', '361', '1', '1', '1', '1', 'AIS/11/2215');
INSERT INTO `official_use` VALUES ('321', '362', '1', '1', '1', '1', 'AIS/SS/11/06');
INSERT INTO `official_use` VALUES ('322', '363', '1', '1', '1', '1', 'AIS/SS/11/08');
INSERT INTO `official_use` VALUES ('323', '364', '1', '1', '1', '1', 'AIS/10/2060');
INSERT INTO `official_use` VALUES ('324', '365', '1', '1', '1', '1', 'AIS/SS/10/02');
INSERT INTO `official_use` VALUES ('325', '366', '1', '1', '1', '1', 'AIS/10/2081');
INSERT INTO `official_use` VALUES ('326', '367', '1', '1', '1', '1', 'AIS/09/138');
INSERT INTO `official_use` VALUES ('327', '368', '1', '1', '1', '1', 'AIS/10/2095');
INSERT INTO `official_use` VALUES ('328', '369', '1', '1', '1', '1', 'AIS/07/496');
INSERT INTO `official_use` VALUES ('329', '370', '1', '1', '1', '1', 'AIS/08/2023');
INSERT INTO `official_use` VALUES ('330', '371', '1', '1', '1', '1', 'AIS/08/733');
INSERT INTO `official_use` VALUES ('331', '372', '1', '1', '1', '1', 'AIS/08/783');
INSERT INTO `official_use` VALUES ('332', '373', '1', '1', '1', '1', 'AIS/10/1037');
INSERT INTO `official_use` VALUES ('333', '374', '1', '1', '1', '1', 'AIS/SS/10/01');
INSERT INTO `official_use` VALUES ('334', '375', '1', '1', '1', '1', 'AIS/09/163');
INSERT INTO `official_use` VALUES ('335', '376', '1', '1', '1', '1', 'AIS/07/511');
INSERT INTO `official_use` VALUES ('336', '377', '1', '1', '1', '1', 'AIS/08/566');
INSERT INTO `official_use` VALUES ('337', '378', '1', '1', '1', '1', 'AIS/08/806');
INSERT INTO `official_use` VALUES ('338', '379', '1', '1', '1', '1', 'AIS/09/195');
INSERT INTO `official_use` VALUES ('339', '380', '1', '1', '1', '1', 'AIS/10/2056');
INSERT INTO `official_use` VALUES ('340', '381', '1', '1', '1', '1', 'AIS/10/3098');
INSERT INTO `official_use` VALUES ('341', '382', '1', '1', '1', '1', 'AIS/08/585');
INSERT INTO `official_use` VALUES ('342', '383', '1', '1', '1', '1', 'AIS/10/3019');
INSERT INTO `official_use` VALUES ('343', '384', '1', '1', '1', '1', 'AIS/08/608');
INSERT INTO `official_use` VALUES ('344', '385', '1', '1', '1', '1', 'AIS/08/628');
INSERT INTO `official_use` VALUES ('345', '386', '1', '1', '1', '1', 'AIS/08/638');
INSERT INTO `official_use` VALUES ('346', '387', '1', '1', '1', '1', 'AIS/10/2057');
INSERT INTO `official_use` VALUES ('347', '388', '1', '1', '1', '1', 'AIS/11/2203');
INSERT INTO `official_use` VALUES ('348', '389', '1', '1', '1', '1', 'AIS/SS/10/01');
INSERT INTO `official_use` VALUES ('349', '390', '1', '1', '1', '1', 'AIS/08/193');
INSERT INTO `official_use` VALUES ('350', '391', '1', '1', '1', '1', 'AIS/10/2053');
INSERT INTO `official_use` VALUES ('351', '392', '1', '1', '1', '1', 'AIS/10/3005');
INSERT INTO `official_use` VALUES ('352', '393', '1', '1', '1', '1', 'AIS/10/3057');
INSERT INTO `official_use` VALUES ('353', '394', '1', '1', '1', '1', 'AIS/06/420');
INSERT INTO `official_use` VALUES ('354', '395', '1', '1', '1', '1', 'AIS/06/346');
INSERT INTO `official_use` VALUES ('355', '396', '1', '1', '1', '1', 'AIS/09/125');
INSERT INTO `official_use` VALUES ('356', '397', '1', '1', '1', '1', 'AIS/10/2058');
INSERT INTO `official_use` VALUES ('357', '398', '1', '1', '1', '1', 'AIS/09/144');
INSERT INTO `official_use` VALUES ('358', '399', '1', '1', '1', '1', 'AIS/08/723');
INSERT INTO `official_use` VALUES ('359', '400', '1', '1', '1', '1', 'AIS/09/095');
INSERT INTO `official_use` VALUES ('360', '401', '1', '1', '1', '1', 'AIS/09/089');
INSERT INTO `official_use` VALUES ('361', '402', '1', '1', '1', '1', 'AIS/09/182');
INSERT INTO `official_use` VALUES ('362', '403', '1', '1', '1', '1', 'AIS/08/987');
INSERT INTO `official_use` VALUES ('363', '404', '1', '1', '1', '1', 'AIS/11/2111');
INSERT INTO `official_use` VALUES ('364', '405', '1', '1', '1', '1', 'AIS/11/2321');
INSERT INTO `official_use` VALUES ('365', '406', '1', '1', '1', '1', 'AIS/11/2201');
INSERT INTO `official_use` VALUES ('366', '407', '1', '1', '1', '1', 'AIS/07/249');
INSERT INTO `official_use` VALUES ('367', '408', '1', '1', '1', '1', 'AIS/09/174');
INSERT INTO `official_use` VALUES ('368', '409', '1', '1', '1', '1', 'AIS/11/2184');
INSERT INTO `official_use` VALUES ('369', '410', '1', '1', '1', '1', 'AIS/08/564');
INSERT INTO `official_use` VALUES ('370', '411', '1', '1', '1', '1', 'AIS/09/043');
INSERT INTO `official_use` VALUES ('371', '412', '1', '1', '1', '1', 'AIS/10/2011');
INSERT INTO `official_use` VALUES ('372', '413', '1', '1', '1', '1', 'AIS/10/2078');
INSERT INTO `official_use` VALUES ('373', '414', '1', '1', '1', '1', 'AIS/SS/11/06');
INSERT INTO `official_use` VALUES ('374', '415', '1', '1', '1', '1', 'AIS/04/081');
INSERT INTO `official_use` VALUES ('375', '416', '1', '1', '1', '1', 'AIS/08/760');
INSERT INTO `official_use` VALUES ('376', '417', '1', '1', '1', '1', 'AIS/09/156');
INSERT INTO `official_use` VALUES ('377', '418', '1', '1', '1', '1', 'AIS/11/2226');
INSERT INTO `official_use` VALUES ('378', '419', '1', '1', '1', '1', 'AIS/SS/10/03');
INSERT INTO `official_use` VALUES ('379', '420', '1', '1', '1', '1', 'AIS/11/2292');
INSERT INTO `official_use` VALUES ('380', '421', '1', '1', '1', '1', 'AIS/11/2283');
INSERT INTO `official_use` VALUES ('381', '422', '1', '1', '1', '1', 'AIS/08/177');
INSERT INTO `official_use` VALUES ('382', '423', '1', '1', '1', '1', 'AIS/08/579');
INSERT INTO `official_use` VALUES ('383', '424', '1', '1', '1', '1', 'AIS/08/712');
INSERT INTO `official_use` VALUES ('384', '425', '1', '1', '1', '1', 'AIS/09/061');
INSERT INTO `official_use` VALUES ('385', '426', '1', '1', '1', '1', 'AIS/10/3021');
INSERT INTO `official_use` VALUES ('386', '427', '1', '1', '1', '1', 'AIS/11/2238');
INSERT INTO `official_use` VALUES ('387', '428', '1', '1', '1', '1', 'AIS/11/2239 ');
INSERT INTO `official_use` VALUES ('388', '429', '1', '1', '1', '1', 'AIS/SS/10/02');
INSERT INTO `official_use` VALUES ('389', '430', '1', '1', '1', '1', 'AIS/11/2257');
INSERT INTO `official_use` VALUES ('390', '431', '1', '1', '1', '1', 'AIS/SS/11/05');
INSERT INTO `official_use` VALUES ('391', '432', '1', '1', '1', '1', 'AIS/11/2258');
INSERT INTO `official_use` VALUES ('392', '433', '1', '1', '1', '1', 'AIS/06/333');
INSERT INTO `official_use` VALUES ('393', '434', '1', '1', '1', '1', 'AIS/08/187');
INSERT INTO `official_use` VALUES ('394', '435', '1', '1', '1', '1', 'AIS/09/072');
INSERT INTO `official_use` VALUES ('395', '436', '1', '1', '1', '1', 'AIS/10/2026');
INSERT INTO `official_use` VALUES ('396', '437', '1', '1', '1', '1', 'AIS/10/2046');
INSERT INTO `official_use` VALUES ('397', '438', '1', '1', '1', '1', 'AIS/11/2133');
INSERT INTO `official_use` VALUES ('398', '439', '1', '1', '1', '1', 'AIS/11/2146');
INSERT INTO `official_use` VALUES ('399', '440', '1', '1', '1', '1', 'AIS/11/2180');
INSERT INTO `official_use` VALUES ('400', '441', '1', '1', '1', '1', 'AIS/11/2317');
INSERT INTO `official_use` VALUES ('401', '442', '1', '1', '1', '1', 'AIS/07/743');
INSERT INTO `official_use` VALUES ('402', '443', '1', '1', '1', '1', 'AIS/08/711');
INSERT INTO `official_use` VALUES ('403', '444', '1', '1', '1', '1', 'AIS/07/326');
INSERT INTO `official_use` VALUES ('404', '445', '1', '1', '1', '1', 'AIS/08/761');
INSERT INTO `official_use` VALUES ('405', '446', '1', '1', '1', '1', 'AIS/09/025');
INSERT INTO `official_use` VALUES ('406', '447', '1', '1', '1', '1', 'AIS/11/2301');
INSERT INTO `official_use` VALUES ('407', '448', '1', '1', '1', '1', 'AIS/11/2129');
INSERT INTO `official_use` VALUES ('408', '449', '1', '1', '1', '1', 'AIS/10/1038');
INSERT INTO `official_use` VALUES ('409', '450', '1', '1', '1', '1', 'AIS/07/797');
INSERT INTO `official_use` VALUES ('410', '451', '1', '1', '1', '1', 'AIS/SS/11/09');
INSERT INTO `official_use` VALUES ('411', '452', '1', '1', '1', '1', 'AIS/10/3096');
INSERT INTO `official_use` VALUES ('412', '453', '1', '1', '1', '1', 'AIS/10/1043');
INSERT INTO `official_use` VALUES ('413', '454', '1', '1', '1', '1', 'AIS/09/135');
INSERT INTO `official_use` VALUES ('414', '455', '1', '1', '1', '1', 'AIS/10/3092');
INSERT INTO `official_use` VALUES ('415', '456', '1', '1', '1', '1', 'AIS/05/2240');
INSERT INTO `official_use` VALUES ('416', '457', '1', '1', '1', '1', 'AIS/05/275');
INSERT INTO `official_use` VALUES ('417', '458', '1', '1', '1', '1', 'AIS/SS/11/05');
INSERT INTO `official_use` VALUES ('418', '459', '1', '1', '1', '1', 'AIS/SS/10/03');
INSERT INTO `official_use` VALUES ('419', '460', '1', '1', '1', '1', 'AIS/02/092');
INSERT INTO `official_use` VALUES ('420', '461', '1', '1', '1', '1', 'AIS/07/546');
INSERT INTO `official_use` VALUES ('421', '462', '1', '1', '1', '1', 'AIS/08/833');
INSERT INTO `official_use` VALUES ('422', '463', '1', '1', '1', '1', 'AIS/08/518');
INSERT INTO `official_use` VALUES ('423', '464', '1', '1', '1', '1', 'AIS/07/302');
INSERT INTO `official_use` VALUES ('424', '465', '1', '1', '1', '1', 'AIS/11/2143');
INSERT INTO `official_use` VALUES ('425', '466', '1', '1', '1', '1', 'AIS/11/2116');
INSERT INTO `official_use` VALUES ('426', '467', '1', '1', '1', '1', 'AIS/08/640');
INSERT INTO `official_use` VALUES ('427', '468', '1', '1', '1', '1', 'AIS/08/741');
INSERT INTO `official_use` VALUES ('428', '469', '1', '1', '1', '1', 'AIS/09/113');
INSERT INTO `official_use` VALUES ('429', '470', '1', '1', '1', '1', 'AIS/08/776');
INSERT INTO `official_use` VALUES ('430', '471', '1', '1', '1', '1', 'AIS/08/2011');
INSERT INTO `official_use` VALUES ('431', '472', '1', '1', '1', '1', 'AIS/08/759');
INSERT INTO `official_use` VALUES ('432', '473', '1', '1', '1', '1', 'AIS/SS/11/07');
INSERT INTO `official_use` VALUES ('433', '474', '1', '1', '1', '1', 'AIS/06/368');
INSERT INTO `official_use` VALUES ('434', '475', '1', '1', '1', '1', 'AIS/09/016');
INSERT INTO `official_use` VALUES ('435', '476', '1', '1', '1', '1', 'AIS/10/1050');
INSERT INTO `official_use` VALUES ('436', '477', '1', '1', '1', '1', 'AIS/SS/11/07');
INSERT INTO `official_use` VALUES ('437', '478', '1', '1', '1', '1', 'AIS/10/2013');
INSERT INTO `official_use` VALUES ('438', '479', '1', '1', '1', '1', 'AIS/08/311');
INSERT INTO `official_use` VALUES ('439', '480', '1', '1', '1', '1', 'AIS/08/525');
INSERT INTO `official_use` VALUES ('440', '481', '1', '1', '1', '1', 'AIS/11/2193');
INSERT INTO `official_use` VALUES ('441', '482', '1', '1', '1', '1', 'AIS/02/064');
INSERT INTO `official_use` VALUES ('442', '483', '1', '1', '1', '1', 'AIS/03/128');
INSERT INTO `official_use` VALUES ('443', '484', '1', '1', '1', '1', 'AIS/05/256');
INSERT INTO `official_use` VALUES ('444', '485', '1', '1', '1', '1', 'AIS/05/290');
INSERT INTO `official_use` VALUES ('445', '486', '1', '1', '1', '1', 'AIS/05/293');
INSERT INTO `official_use` VALUES ('446', '487', '1', '1', '1', '1', 'AIS/05/310');
INSERT INTO `official_use` VALUES ('447', '488', '1', '1', '1', '1', 'AIS/06/047');
INSERT INTO `official_use` VALUES ('448', '489', '1', '1', '1', '1', 'AIS/06/165');
INSERT INTO `official_use` VALUES ('449', '490', '1', '1', '1', '1', 'AIS/07/451');
INSERT INTO `official_use` VALUES ('450', '491', '1', '1', '1', '1', 'AIS/07/492');
INSERT INTO `official_use` VALUES ('451', '492', '1', '1', '1', '1', 'AIS/07/597');
INSERT INTO `official_use` VALUES ('452', '493', '1', '1', '1', '1', 'AIS/08/168');
INSERT INTO `official_use` VALUES ('453', '494', '1', '1', '1', '1', 'AIS/08/2014');
INSERT INTO `official_use` VALUES ('454', '495', '1', '1', '1', '1', 'AIS/08/2015');
INSERT INTO `official_use` VALUES ('455', '496', '1', '1', '1', '1', 'AIS/08/534');
INSERT INTO `official_use` VALUES ('456', '497', '1', '1', '1', '1', 'AIS/08/562');
INSERT INTO `official_use` VALUES ('457', '498', '1', '1', '1', '1', 'AIS/08/595');
INSERT INTO `official_use` VALUES ('458', '499', '1', '1', '1', '1', 'AIS/08/598');
INSERT INTO `official_use` VALUES ('459', '500', '1', '1', '1', '1', 'AIS/08/603');
INSERT INTO `official_use` VALUES ('460', '501', '1', '1', '1', '1', 'AIS/08/626');
INSERT INTO `official_use` VALUES ('461', '502', '1', '1', '1', '1', 'AIS/08/674');
INSERT INTO `official_use` VALUES ('462', '503', '1', '1', '1', '1', 'AIS/08/692');
INSERT INTO `official_use` VALUES ('463', '504', '1', '1', '1', '1', 'AIS/08/702');
INSERT INTO `official_use` VALUES ('464', '505', '1', '1', '1', '1', 'AIS/08/705');
INSERT INTO `official_use` VALUES ('465', '506', '1', '1', '1', '1', 'AIS/09/031');
INSERT INTO `official_use` VALUES ('466', '507', '1', '1', '1', '1', 'AIS/09/093');
INSERT INTO `official_use` VALUES ('467', '508', '1', '1', '1', '1', 'AIS/09/094');
INSERT INTO `official_use` VALUES ('468', '509', '1', '1', '1', '1', 'AIS/09/123');
INSERT INTO `official_use` VALUES ('469', '510', '1', '1', '1', '1', 'AIS/09/139');
INSERT INTO `official_use` VALUES ('470', '511', '1', '1', '1', '1', 'AIS/09/146');
INSERT INTO `official_use` VALUES ('471', '512', '1', '1', '1', '1', 'AIS/09/165');
INSERT INTO `official_use` VALUES ('472', '513', '1', '1', '1', '1', 'AIS/09/177');
INSERT INTO `official_use` VALUES ('473', '514', '1', '1', '1', '1', 'AIS/09/222');
INSERT INTO `official_use` VALUES ('474', '515', '1', '1', '1', '1', 'AIS/10/2043');
INSERT INTO `official_use` VALUES ('475', '516', '1', '1', '1', '1', 'AIS/10/2079');
INSERT INTO `official_use` VALUES ('476', '517', '1', '1', '1', '1', 'AIS/10/2084');
INSERT INTO `official_use` VALUES ('477', '518', '1', '1', '1', '1', 'AIS/10/2091');
INSERT INTO `official_use` VALUES ('478', '519', '1', '1', '1', '1', 'AIS/10/3024');
INSERT INTO `official_use` VALUES ('479', '520', '1', '1', '1', '1', 'AIS/10/3042');
INSERT INTO `official_use` VALUES ('480', '521', '1', '1', '1', '1', 'AIS/10/3090');
INSERT INTO `official_use` VALUES ('481', '522', '1', '1', '1', '1', 'AIS/11/21/21');
INSERT INTO `official_use` VALUES ('482', '523', '1', '1', '1', '1', 'AIS/11/2151');
INSERT INTO `official_use` VALUES ('483', '524', '1', '1', '1', '1', 'AIS/11/2172');
INSERT INTO `official_use` VALUES ('484', '525', '1', '1', '1', '1', 'AIS/11/2176');
INSERT INTO `official_use` VALUES ('485', '526', '1', '1', '1', '1', 'AIS/11/2183');
INSERT INTO `official_use` VALUES ('486', '527', '1', '1', '1', '1', 'AIS/11/2199');
INSERT INTO `official_use` VALUES ('487', '528', '1', '1', '1', '1', 'AIS/11/2254');
INSERT INTO `official_use` VALUES ('488', '529', '1', '1', '1', '1', 'AIS/11/2281');
INSERT INTO `official_use` VALUES ('489', '530', '1', '1', '1', '1', 'AIS/11/2289');
INSERT INTO `official_use` VALUES ('490', '531', '1', '1', '1', '1', 'AIS/11/2293');
INSERT INTO `official_use` VALUES ('491', '532', '1', '1', '1', '1', 'AIS/11/2306');
INSERT INTO `official_use` VALUES ('492', '533', '1', '1', '1', '1', 'AIS/11/2320');
INSERT INTO `official_use` VALUES ('493', '534', '1', '1', '1', '1', 'AIS/SS/10/02');
INSERT INTO `official_use` VALUES ('494', '535', '1', '1', '1', '1', 'AIS/SS/10/03');
INSERT INTO `official_use` VALUES ('495', '536', '1', '1', '1', '1', 'AIS/SS/10/04');
INSERT INTO `official_use` VALUES ('496', '537', '1', '1', '1', '1', 'AIS/SS/11/06');
INSERT INTO `official_use` VALUES ('497', '538', '1', '1', '1', '1', 'AIS/SS/11/06');
INSERT INTO `official_use` VALUES ('498', '539', '1', '1', '1', '1', 'AIS/09/228');
INSERT INTO `official_use` VALUES ('499', '540', '1', '1', '1', '1', 'AIS/10/2077');
INSERT INTO `official_use` VALUES ('500', '541', '1', '1', '1', '1', 'AIS/11/2178');
INSERT INTO `official_use` VALUES ('501', '542', '1', '1', '1', '1', 'AIS/08/752');
INSERT INTO `official_use` VALUES ('502', '543', '1', '1', '1', '1', 'AIS/03/110');
INSERT INTO `official_use` VALUES ('503', '544', '1', '1', '1', '1', 'AIS/07/520');
INSERT INTO `official_use` VALUES ('504', '545', '1', '1', '1', '1', 'AIS/08/2010');
INSERT INTO `official_use` VALUES ('505', '546', '1', '1', '1', '1', 'AIS/08/597');
INSERT INTO `official_use` VALUES ('506', '547', '1', '1', '1', '1', 'AIS/08/700');
INSERT INTO `official_use` VALUES ('507', '548', '1', '1', '1', '1', 'AIS/08/757');
INSERT INTO `official_use` VALUES ('508', '549', '1', '1', '1', '1', 'AIS/05/224');
INSERT INTO `official_use` VALUES ('509', '550', '1', '1', '1', '1', 'AIS/06/372');
INSERT INTO `official_use` VALUES ('510', '551', '1', '1', '1', '1', 'AIS/07/791');
INSERT INTO `official_use` VALUES ('511', '552', '1', '1', '1', '1', 'AIS/07/421');
INSERT INTO `official_use` VALUES ('512', '553', '1', '1', '1', '1', 'AIS/11/2167');
INSERT INTO `official_use` VALUES ('513', '554', '1', '1', '1', '1', 'AIS/10/3039');
INSERT INTO `official_use` VALUES ('514', '555', '1', '1', '1', '1', 'AIS/07/004');
INSERT INTO `official_use` VALUES ('515', '556', '1', '1', '1', '1', 'AIS/11/2144');
INSERT INTO `official_use` VALUES ('516', '557', '1', '1', '1', '1', 'AIS/09/056');
INSERT INTO `official_use` VALUES ('517', '558', '1', '1', '1', '1', 'AIS/09/081');
INSERT INTO `official_use` VALUES ('518', '559', '1', '1', '1', '1', 'AIS/09/127');
INSERT INTO `official_use` VALUES ('519', '560', '1', '1', '1', '1', 'AIS/09/193');
INSERT INTO `official_use` VALUES ('520', '561', '1', '1', '1', '1', 'AIS/10/3055');
INSERT INTO `official_use` VALUES ('521', '562', '1', '1', '1', '1', 'AIS/08/565');
INSERT INTO `official_use` VALUES ('522', '563', '1', '1', '1', '1', 'AIS/07/507');
INSERT INTO `official_use` VALUES ('523', '564', '1', '1', '1', '1', 'AIS/09/173');
INSERT INTO `official_use` VALUES ('524', '565', '1', '1', '1', '1', 'AIS/10/3086');
INSERT INTO `official_use` VALUES ('525', '566', '1', '1', '1', '1', 'AIS/11/2155');
INSERT INTO `official_use` VALUES ('526', '567', '1', '1', '1', '1', 'AIS/09/126');
INSERT INTO `official_use` VALUES ('527', '568', '1', '1', '1', '1', 'AIS/07/039');
INSERT INTO `official_use` VALUES ('528', '569', '1', '1', '1', '1', 'AIS/09/080');
INSERT INTO `official_use` VALUES ('529', '570', '1', '1', '1', '1', 'AIS/09/024');
INSERT INTO `official_use` VALUES ('530', '571', '1', '1', '1', '1', 'AIS/10/2093');
INSERT INTO `official_use` VALUES ('531', '572', '1', '1', '1', '1', 'AIS/11/2158');
INSERT INTO `official_use` VALUES ('532', '573', '1', '1', '1', '1', 'AIS/11/2273');
INSERT INTO `official_use` VALUES ('533', '574', '1', '1', '1', '1', 'AIS/05/325');
INSERT INTO `official_use` VALUES ('534', '575', '1', '1', '1', '1', 'AIS/08/380');
INSERT INTO `official_use` VALUES ('535', '576', '1', '1', '1', '1', 'AIS/08/647');
INSERT INTO `official_use` VALUES ('536', '577', '1', '1', '1', '1', 'AIS/08/753');
INSERT INTO `official_use` VALUES ('537', '578', '1', '1', '1', '1', 'AIS/09/112');
INSERT INTO `official_use` VALUES ('538', '579', '1', '1', '1', '1', 'AIS/10/3027');
INSERT INTO `official_use` VALUES ('539', '580', '1', '1', '1', '1', 'AIS/11/2105');
INSERT INTO `official_use` VALUES ('540', '581', '1', '1', '1', '1', 'AIS/08/683');
INSERT INTO `official_use` VALUES ('541', '582', '1', '1', '1', '1', 'AIS/06/819');
INSERT INTO `official_use` VALUES ('542', '583', '1', '1', '1', '1', 'AIS/SS/10/04');
INSERT INTO `official_use` VALUES ('543', '584', '1', '1', '1', '1', 'AIS/08/695');
INSERT INTO `official_use` VALUES ('544', '585', '1', '1', '1', '1', 'AIS/08/675');
INSERT INTO `official_use` VALUES ('545', '586', '1', '1', '1', '1', 'AIS/10/1056');
INSERT INTO `official_use` VALUES ('546', '587', '1', '1', '1', '1', 'AIS/03/115');
INSERT INTO `official_use` VALUES ('547', '588', '1', '1', '1', '1', 'AIS/08/641');
INSERT INTO `official_use` VALUES ('548', '589', '1', '1', '1', '1', 'AIS/08/704');
INSERT INTO `official_use` VALUES ('549', '590', '1', '1', '1', '1', 'AIS/09/036');
INSERT INTO `official_use` VALUES ('550', '591', '1', '1', '1', '1', 'AIS/10/3034');
INSERT INTO `official_use` VALUES ('551', '592', '1', '1', '1', '1', 'AIS/11/2197');
INSERT INTO `official_use` VALUES ('552', '593', '1', '1', '1', '1', 'AIS/SS/10/02');
INSERT INTO `official_use` VALUES ('553', '594', '1', '1', '1', '1', 'AIS/SS/10/04');
INSERT INTO `official_use` VALUES ('554', '595', '1', '1', '1', '1', 'AIS/05/260');
INSERT INTO `official_use` VALUES ('555', '596', '1', '1', '1', '1', 'AIS/08/756');
INSERT INTO `official_use` VALUES ('556', '597', '1', '1', '1', '1', 'AIS/04/998');
INSERT INTO `official_use` VALUES ('557', '598', '1', '1', '1', '1', 'AIS/05/295');
INSERT INTO `official_use` VALUES ('558', '599', '1', '1', '1', '1', 'AIS/06/373');
INSERT INTO `official_use` VALUES ('559', '600', '1', '1', '1', '1', 'AIS/06/488');
INSERT INTO `official_use` VALUES ('560', '601', '1', '1', '1', '1', 'AIS/07/099');
INSERT INTO `official_use` VALUES ('561', '602', '1', '1', '1', '1', 'AIS/08/2002');
INSERT INTO `official_use` VALUES ('562', '603', '1', '1', '1', '1', 'AIS/08/527');
INSERT INTO `official_use` VALUES ('563', '604', '1', '1', '1', '1', 'AIS/08/588');
INSERT INTO `official_use` VALUES ('564', '605', '1', '1', '1', '1', 'AIS/08/682');
INSERT INTO `official_use` VALUES ('565', '606', '1', '1', '1', '1', 'AIS/08/689');
INSERT INTO `official_use` VALUES ('566', '607', '1', '1', '1', '1', 'AIS/08/721');
INSERT INTO `official_use` VALUES ('567', '608', '1', '1', '1', '1', 'AIS/08/754');
INSERT INTO `official_use` VALUES ('568', '609', '1', '1', '1', '1', 'AIS/09/002');
INSERT INTO `official_use` VALUES ('569', '610', '1', '1', '1', '1', 'AIS/09/005');
INSERT INTO `official_use` VALUES ('570', '611', '1', '1', '1', '1', 'AIS/09/107');
INSERT INTO `official_use` VALUES ('571', '612', '1', '1', '1', '1', 'AIS/09/114');
INSERT INTO `official_use` VALUES ('572', '613', '1', '1', '1', '1', 'AIS/09/186');
INSERT INTO `official_use` VALUES ('573', '614', '1', '1', '1', '1', 'AIS/11/2163');
INSERT INTO `official_use` VALUES ('574', '615', '1', '1', '1', '1', 'AIS/11/2170');
INSERT INTO `official_use` VALUES ('575', '616', '1', '1', '1', '1', 'AIS/11/2185');
INSERT INTO `official_use` VALUES ('576', '617', '1', '1', '1', '1', 'AIS/11/2235');
INSERT INTO `official_use` VALUES ('577', '618', '1', '1', '1', '1', 'AIS/SS/10/03');
INSERT INTO `official_use` VALUES ('578', '619', '1', '1', '1', '1', 'AIS/SS/11/05');
INSERT INTO `official_use` VALUES ('579', '620', '1', '1', '1', '1', 'AIS/11/2278');
INSERT INTO `official_use` VALUES ('580', '621', '1', '1', '1', '1', 'AIS/02/037');
INSERT INTO `official_use` VALUES ('581', '622', '1', '1', '1', '1', 'AIS/07/571');
INSERT INTO `official_use` VALUES ('582', '623', '1', '1', '1', '1', 'AIS/09/001');
INSERT INTO `official_use` VALUES ('583', '624', '1', '1', '1', '1', 'AIS/10/1049');
INSERT INTO `official_use` VALUES ('584', '625', '1', '1', '1', '1', 'AIS/10/3013');
INSERT INTO `official_use` VALUES ('585', '626', '1', '1', '1', '1', 'AIS/10/3018');
INSERT INTO `official_use` VALUES ('586', '627', '1', '1', '1', '1', 'AIS/10/3044');
INSERT INTO `official_use` VALUES ('587', '628', '1', '1', '1', '1', 'AIS/11/2118');
INSERT INTO `official_use` VALUES ('588', '629', '1', '1', '1', '1', 'AIS/11/2122');
INSERT INTO `official_use` VALUES ('589', '630', '1', '1', '1', '1', 'AIS/SS/11/06');
INSERT INTO `official_use` VALUES ('590', '631', '1', '1', '1', '1', 'AIS/SS/11/08');
INSERT INTO `official_use` VALUES ('591', '632', '1', '1', '1', '1', 'AIS/08/573');
INSERT INTO `official_use` VALUES ('592', '633', '1', '1', '1', '1', 'AIS/SS/11/08');
INSERT INTO `official_use` VALUES ('593', '634', '1', '1', '1', '1', 'AIS/04/158');
INSERT INTO `official_use` VALUES ('594', '635', '1', '1', '1', '1', 'AIS/08/594');
INSERT INTO `official_use` VALUES ('595', '636', '1', '1', '1', '1', 'AIS/08/600');
INSERT INTO `official_use` VALUES ('596', '637', '1', '1', '1', '1', 'AIS/08/619');
INSERT INTO `official_use` VALUES ('597', '638', '1', '1', '1', '1', 'AIS/10/2016');
INSERT INTO `official_use` VALUES ('598', '639', '1', '1', '1', '1', 'AIS/11/2123');
INSERT INTO `official_use` VALUES ('599', '640', '1', '1', '1', '1', 'AIS/SS/11/05');
INSERT INTO `official_use` VALUES ('600', '641', '1', '1', '1', '1', 'AIS/11/2171');
INSERT INTO `official_use` VALUES ('601', '642', '1', '1', '1', '1', 'AIS/11/2160');
INSERT INTO `official_use` VALUES ('602', '643', '1', '1', '1', '1', 'AIS/11/2161');
INSERT INTO `official_use` VALUES ('603', '644', '1', '1', '1', '1', 'AIS/11/2212');
INSERT INTO `official_use` VALUES ('604', '645', '1', '1', '1', '1', 'AIS/SS/11/07');
INSERT INTO `official_use` VALUES ('605', '646', '1', '1', '1', '1', 'AIS/08/623');
INSERT INTO `official_use` VALUES ('606', '647', '1', '1', '1', '1', 'AIS/08/676');
INSERT INTO `official_use` VALUES ('607', '648', '1', '1', '1', '1', 'AIS/09/090');
INSERT INTO `official_use` VALUES ('608', '649', '1', '1', '1', '1', 'AIS/08/649');
INSERT INTO `official_use` VALUES ('609', '650', '1', '1', '1', '1', 'AIS/08/696');
INSERT INTO `official_use` VALUES ('610', '651', '1', '1', '1', '1', 'AIS/10/2038');
INSERT INTO `official_use` VALUES ('611', '652', '1', '1', '1', '1', 'AIS/11/2131');
INSERT INTO `official_use` VALUES ('612', '653', '1', '1', '1', '1', 'AIS/11/2187');
INSERT INTO `official_use` VALUES ('613', '654', '1', '1', '1', '1', 'AIS/11/2202');
INSERT INTO `official_use` VALUES ('614', '655', '1', '1', '1', '1', 'AIS/11/2225');
INSERT INTO `official_use` VALUES ('615', '656', '1', '1', '1', '1', 'AIS/09/202');
INSERT INTO `official_use` VALUES ('616', '657', '1', '1', '1', '1', 'AIS/04/171');
INSERT INTO `official_use` VALUES ('617', '658', '1', '1', '1', '1', 'AIS/08/581');
INSERT INTO `official_use` VALUES ('618', '659', '1', '1', '1', '1', 'AIS/08/632');
INSERT INTO `official_use` VALUES ('619', '660', '1', '1', '1', '1', 'AIS/09/162');
INSERT INTO `official_use` VALUES ('620', '661', '1', '1', '1', '1', 'AIS/09/180');
INSERT INTO `official_use` VALUES ('621', '662', '1', '1', '1', '1', 'AIS/10/1046');
INSERT INTO `official_use` VALUES ('622', '663', '1', '1', '1', '1', 'AIS/11/2101');
INSERT INTO `official_use` VALUES ('623', '664', '1', '1', '1', '1', 'AIS/08/667');
INSERT INTO `official_use` VALUES ('624', '665', '1', '1', '1', '1', 'AIS/11/2223');
INSERT INTO `official_use` VALUES ('625', '666', '1', '1', '1', '1', 'AIS/07/483');
INSERT INTO `official_use` VALUES ('626', '667', '1', '1', '1', '1', 'AIS/08/178');
INSERT INTO `official_use` VALUES ('627', '668', '1', '1', '1', '1', 'AIS/08/2001');
INSERT INTO `official_use` VALUES ('628', '669', '1', '1', '1', '1', 'AIS/08/668');
INSERT INTO `official_use` VALUES ('629', '670', '1', '1', '1', '1', 'AIS/08/763');
INSERT INTO `official_use` VALUES ('630', '671', '1', '1', '1', '1', 'AIS/09/069');
INSERT INTO `official_use` VALUES ('631', '672', '1', '1', '1', '1', 'AIS/09/168');
INSERT INTO `official_use` VALUES ('632', '673', '1', '1', '1', '1', 'AIS/09/200');
INSERT INTO `official_use` VALUES ('633', '674', '1', '1', '1', '1', 'AIS/10/2007');
INSERT INTO `official_use` VALUES ('634', '675', '1', '1', '1', '1', 'AIS/11/2108');
INSERT INTO `official_use` VALUES ('635', '676', '1', '1', '1', '1', 'AIS/11/2208');
INSERT INTO `official_use` VALUES ('636', '677', '1', '1', '1', '1', 'AIS/11/2231');
INSERT INTO `official_use` VALUES ('637', '678', '1', '1', '1', '1', 'AIS/11/2272');
INSERT INTO `official_use` VALUES ('638', '679', '1', '1', '1', '1', 'AIS/11/2302');
INSERT INTO `official_use` VALUES ('639', '680', '1', '1', '1', '1', 'AIS/07/827');
INSERT INTO `official_use` VALUES ('640', '681', '1', '1', '1', '1', 'AIS/09/120');
INSERT INTO `official_use` VALUES ('641', '682', '1', '1', '1', '1', 'AIS/10/2065');
INSERT INTO `official_use` VALUES ('642', '683', '1', '1', '1', '1', 'AIS/10/2082');
INSERT INTO `official_use` VALUES ('643', '684', '1', '1', '1', '1', 'AIS/11/2106');
INSERT INTO `official_use` VALUES ('644', '685', '1', '1', '1', '1', 'AIS/11/2140');
INSERT INTO `official_use` VALUES ('645', '686', '1', '1', '1', '1', 'AIS/11/21O9');
INSERT INTO `official_use` VALUES ('646', '687', '1', '1', '1', '1', 'AIS/11/2222');
INSERT INTO `official_use` VALUES ('647', '688', '1', '1', '1', '1', 'AIS/08/184');
INSERT INTO `official_use` VALUES ('648', '689', '1', '1', '1', '1', 'AIS/08/750');
INSERT INTO `official_use` VALUES ('649', '690', '1', '1', '1', '1', 'AIS/10/3038');
INSERT INTO `official_use` VALUES ('650', '691', '1', '1', '1', '1', 'AIS/09/096');
INSERT INTO `official_use` VALUES ('651', '692', '1', '1', '1', '1', 'AIS/09/029');
INSERT INTO `official_use` VALUES ('652', '693', '1', '1', '1', '1', 'AIS/10/1055');
INSERT INTO `official_use` VALUES ('653', '694', '1', '1', '1', '1', 'AIS/10/2003');
INSERT INTO `official_use` VALUES ('654', '695', '1', '1', '1', '1', 'AIS/11/2294');
INSERT INTO `official_use` VALUES ('655', '696', '1', '1', '1', '1', 'AIS/04/166');
INSERT INTO `official_use` VALUES ('656', '697', '1', '1', '1', '1', 'AIS/SS/10/00');
INSERT INTO `official_use` VALUES ('657', '698', '1', '1', '1', '1', 'AIS/08/669');
INSERT INTO `official_use` VALUES ('658', '699', '1', '1', '1', '1', 'AIS/08/2017');
INSERT INTO `official_use` VALUES ('659', '700', '1', '1', '1', '1', 'AIS/08/607');
INSERT INTO `official_use` VALUES ('660', '701', '1', '1', '1', '1', 'AIS/SS/11/06');
INSERT INTO `official_use` VALUES ('661', '702', '1', '1', '1', '1', 'AIS/02/809');
INSERT INTO `official_use` VALUES ('662', '703', '1', '1', '1', '1', 'AIS/07/491');
INSERT INTO `official_use` VALUES ('663', '704', '1', '1', '1', '1', 'AIS/07/519');
INSERT INTO `official_use` VALUES ('664', '705', '1', '1', '1', '1', 'AIS/08/2016');
INSERT INTO `official_use` VALUES ('665', '706', '1', '1', '1', '1', 'AIS/08/662');
INSERT INTO `official_use` VALUES ('666', '707', '1', '1', '1', '1', 'AIS/08/684');
INSERT INTO `official_use` VALUES ('667', '708', '1', '1', '1', '1', 'AIS/09/004');
INSERT INTO `official_use` VALUES ('668', '709', '1', '1', '1', '1', 'AIS/09/027');
INSERT INTO `official_use` VALUES ('669', '710', '1', '1', '1', '1', 'AIS/09/044');
INSERT INTO `official_use` VALUES ('670', '711', '1', '1', '1', '1', 'AIS/09/048');
INSERT INTO `official_use` VALUES ('671', '712', '1', '1', '1', '1', 'AIS/09/052');
INSERT INTO `official_use` VALUES ('672', '713', '1', '1', '1', '1', 'AIS/09/100');
INSERT INTO `official_use` VALUES ('673', '714', '1', '1', '1', '1', 'AIS/09/116');
INSERT INTO `official_use` VALUES ('674', '715', '1', '1', '1', '1', 'AIS/09/166');
INSERT INTO `official_use` VALUES ('675', '716', '1', '1', '1', '1', 'AIS/09/179');
INSERT INTO `official_use` VALUES ('676', '717', '1', '1', '1', '1', 'AIS/09/190');
INSERT INTO `official_use` VALUES ('677', '718', '1', '1', '1', '1', 'AIS/10/1045');
INSERT INTO `official_use` VALUES ('678', '719', '1', '1', '1', '1', 'AIS/10/2025');
INSERT INTO `official_use` VALUES ('679', '720', '1', '1', '1', '1', 'AIS/10/2059');
INSERT INTO `official_use` VALUES ('680', '721', '1', '1', '1', '1', 'AIS/10/2092');
INSERT INTO `official_use` VALUES ('681', '722', '1', '1', '1', '1', 'AIS/10/2096');
INSERT INTO `official_use` VALUES ('682', '723', '1', '1', '1', '1', 'AIS/10/2098');
INSERT INTO `official_use` VALUES ('683', '724', '1', '1', '1', '1', 'AIS/10/3067');
INSERT INTO `official_use` VALUES ('684', '725', '1', '1', '1', '1', 'AIS/10/3087');
INSERT INTO `official_use` VALUES ('685', '726', '1', '1', '1', '1', 'AIS/10/3091');
INSERT INTO `official_use` VALUES ('686', '727', '1', '1', '1', '1', 'AIS/11/2142');
INSERT INTO `official_use` VALUES ('687', '728', '1', '1', '1', '1', 'AIS/11/2188');
INSERT INTO `official_use` VALUES ('688', '729', '1', '1', '1', '1', 'AIS/11/2211');
INSERT INTO `official_use` VALUES ('689', '730', '1', '1', '1', '1', 'AIS/11/2248');
INSERT INTO `official_use` VALUES ('690', '731', '1', '1', '1', '1', 'AIS/11/2253');
INSERT INTO `official_use` VALUES ('691', '732', '1', '1', '1', '1', 'AIS/11/2277');
INSERT INTO `official_use` VALUES ('692', '733', '1', '1', '1', '1', 'AIS/SS/10/01');
INSERT INTO `official_use` VALUES ('693', '734', '1', '1', '1', '1', 'AIS/08/999');
INSERT INTO `official_use` VALUES ('694', '735', '1', '1', '1', '1', 'AIS/09/034');
INSERT INTO `official_use` VALUES ('695', '736', '1', '1', '1', '1', 'AIS/09/050');
INSERT INTO `official_use` VALUES ('696', '737', '1', '1', '1', '1', 'AIS/09/167');
INSERT INTO `official_use` VALUES ('697', '738', '1', '1', '1', '1', 'AIS/07/552');
INSERT INTO `official_use` VALUES ('698', '739', '1', '1', '1', '1', 'AIS/11/2137');
INSERT INTO `official_use` VALUES ('699', '740', '1', '1', '1', '1', 'AIS/05/3030');
INSERT INTO `official_use` VALUES ('700', '741', '1', '1', '1', '1', 'AIS/08/699');
INSERT INTO `official_use` VALUES ('701', '742', '1', '1', '1', '1', 'AIS/11/2303');
INSERT INTO `official_use` VALUES ('702', '743', '1', '1', '1', '1', 'AIS/07/617');
INSERT INTO `official_use` VALUES ('703', '744', '1', '1', '1', '1', 'AIS/11/2314');
INSERT INTO `official_use` VALUES ('704', '745', '1', '1', '1', '1', 'AIS/08/764');
INSERT INTO `official_use` VALUES ('705', '746', '1', '1', '1', '1', 'AIS/08/642');
INSERT INTO `official_use` VALUES ('706', '747', '1', '1', '1', '1', 'AIS/10/3085');
INSERT INTO `official_use` VALUES ('707', '748', '1', '1', '1', '1', 'AIS/06/319');
INSERT INTO `official_use` VALUES ('708', '749', '1', '1', '1', '1', 'AIS/08/7370');
INSERT INTO `official_use` VALUES ('709', '750', '1', '1', '1', '1', 'AIS/10/3051');
INSERT INTO `official_use` VALUES ('710', '751', '1', '1', '1', '1', 'AIS/11/2162');
INSERT INTO `official_use` VALUES ('711', '752', '1', '1', '1', '1', 'AIS/07/528');
INSERT INTO `official_use` VALUES ('712', '753', '1', '1', '1', '1', 'AIS/08/788');
INSERT INTO `official_use` VALUES ('713', '754', '1', '1', '1', '1', 'AIS/09/178');
INSERT INTO `official_use` VALUES ('714', '755', '1', '1', '1', '1', 'AIS/10/2045');
INSERT INTO `official_use` VALUES ('715', '756', '1', '1', '1', '1', 'AIS/10/3031');
INSERT INTO `official_use` VALUES ('716', '757', '1', '1', '1', '1', 'AIS/10/3080');
INSERT INTO `official_use` VALUES ('717', '758', '1', '1', '1', '1', 'AIS/11/2115');
INSERT INTO `official_use` VALUES ('718', '759', '1', '1', '1', '1', 'AIS/11/2290');
INSERT INTO `official_use` VALUES ('719', '760', '1', '1', '1', '1', 'AIS/SS/11/06');
INSERT INTO `official_use` VALUES ('720', '761', '1', '1', '1', '1', 'AIS/08/769');
INSERT INTO `official_use` VALUES ('721', '762', '1', '1', '1', '1', 'AIS/08/653');
INSERT INTO `official_use` VALUES ('722', '763', '1', '1', '1', '1', 'AIS/09/011');
INSERT INTO `official_use` VALUES ('723', '764', '1', '1', '1', '1', 'AIS/08/2009');
INSERT INTO `official_use` VALUES ('724', '765', '1', '1', '1', '1', 'AIS/08/707');
INSERT INTO `official_use` VALUES ('725', '766', '1', '1', '1', '1', 'AIS/09/208');
INSERT INTO `official_use` VALUES ('726', '767', '1', '1', '1', '1', 'AIS/08/693');
INSERT INTO `official_use` VALUES ('727', '768', '1', '1', '1', '1', 'AIS/08/830');
INSERT INTO `official_use` VALUES ('728', '769', '1', '1', '1', '1', 'AIS/10/3009');
INSERT INTO `official_use` VALUES ('729', '770', '1', '1', '1', '1', 'AIS/11/2179');
INSERT INTO `official_use` VALUES ('730', '771', '1', '1', '1', '1', 'AIS/04/241');
INSERT INTO `official_use` VALUES ('731', '772', '1', '1', '1', '1', 'AIS/SS/10/03');
INSERT INTO `official_use` VALUES ('732', '773', '1', '1', '1', '1', 'AIS/02/006');
INSERT INTO `official_use` VALUES ('733', '774', '1', '1', '1', '1', 'AIS/08/2000');
INSERT INTO `official_use` VALUES ('734', '775', '1', '1', '1', '1', 'AIS/09/097');
INSERT INTO `official_use` VALUES ('735', '776', '1', '1', '1', '1', 'AIS/09/131');
INSERT INTO `official_use` VALUES ('736', '777', '1', '1', '1', '1', 'AIS/09/209');
INSERT INTO `official_use` VALUES ('737', '778', '1', '1', '1', '1', 'AIS/02/073');
INSERT INTO `official_use` VALUES ('738', '779', '1', '1', '1', '1', 'AIS/SS/11/07');
INSERT INTO `official_use` VALUES ('739', '780', '1', '1', '1', '1', 'AIS/06/329');
INSERT INTO `official_use` VALUES ('740', '781', '1', '1', '1', '1', 'AIS/08/610');
INSERT INTO `official_use` VALUES ('741', '782', '1', '1', '1', '1', 'AIS/09/076');
INSERT INTO `official_use` VALUES ('742', '783', '1', '1', '1', '1', 'AIS/09/068');
INSERT INTO `official_use` VALUES ('743', '784', '1', '1', '1', '1', 'AIS/06/396');
INSERT INTO `official_use` VALUES ('744', '785', '1', '1', '1', '1', 'AIS/06/407');
INSERT INTO `official_use` VALUES ('745', '786', '1', '1', '1', '1', 'AIS/10/3071');
INSERT INTO `official_use` VALUES ('746', '787', '1', '1', '1', '1', 'AIS/06/056');
INSERT INTO `official_use` VALUES ('747', '788', '1', '1', '1', '1', 'AIS/06/164');
INSERT INTO `official_use` VALUES ('748', '789', '1', '1', '1', '1', 'AIS/09/053');
INSERT INTO `official_use` VALUES ('749', '790', '1', '1', '1', '1', 'AIS/09/062');
INSERT INTO `official_use` VALUES ('750', '791', '1', '1', '1', '1', 'AIS/09/221');
INSERT INTO `official_use` VALUES ('751', '792', '1', '1', '1', '1', 'AIS/10/2076');
INSERT INTO `official_use` VALUES ('752', '793', '1', '1', '1', '1', 'AIS/10/3068');
INSERT INTO `official_use` VALUES ('753', '794', '1', '1', '1', '1', 'AIS/10/3082');
INSERT INTO `official_use` VALUES ('754', '795', '1', '1', '1', '1', 'AIS/11/2251');
INSERT INTO `official_use` VALUES ('755', '796', '1', '1', '1', '1', 'AIS/SS/11/09');
INSERT INTO `official_use` VALUES ('756', '797', '1', '1', '1', '1', 'AIS/09/210');
INSERT INTO `official_use` VALUES ('757', '798', '1', '1', '1', '1', 'AIS/04/225');
INSERT INTO `official_use` VALUES ('758', '799', '1', '1', '1', '1', 'AIS/05/298');
INSERT INTO `official_use` VALUES ('759', '800', '1', '1', '1', '1', 'AIS/08/643');
INSERT INTO `official_use` VALUES ('760', '801', '1', '1', '1', '1', 'AIS/10/2072');
INSERT INTO `official_use` VALUES ('761', '802', '1', '1', '1', '1', 'AIS/10/3008');
INSERT INTO `official_use` VALUES ('762', '803', '1', '1', '1', '1', 'AIS/11/2134');
INSERT INTO `official_use` VALUES ('763', '804', '1', '1', '1', '1', 'AIS/11/2209');
INSERT INTO `official_use` VALUES ('764', '805', '1', '1', '1', '1', 'AIS/07/388');
INSERT INTO `official_use` VALUES ('765', '806', '1', '1', '1', '1', 'AIS/08/613');
INSERT INTO `official_use` VALUES ('766', '807', '1', '1', '1', '1', 'AIS/09/170');
INSERT INTO `official_use` VALUES ('767', '808', '1', '1', '1', '1', 'AIS/10/2009');
INSERT INTO `official_use` VALUES ('768', '809', '1', '1', '1', '1', 'AIS/10/2061');
INSERT INTO `official_use` VALUES ('769', '810', '1', '1', '1', '1', 'AIS/10/2087');
INSERT INTO `official_use` VALUES ('770', '811', '1', '1', '1', '1', 'AIS/09/086');
INSERT INTO `official_use` VALUES ('771', '812', '1', '1', '1', '1', 'AIS/SS/11/08');
INSERT INTO `official_use` VALUES ('772', '813', '1', '1', '1', '1', 'AIS/11/2126');
INSERT INTO `official_use` VALUES ('773', '814', '1', '1', '1', '1', 'AIS/SS/10/02');
INSERT INTO `official_use` VALUES ('774', '815', '1', '1', '1', '1', 'AIS/10/2033');
INSERT INTO `official_use` VALUES ('775', '816', '1', '1', '1', '1', 'AIS/06/315');
INSERT INTO `official_use` VALUES ('776', '817', '1', '1', '1', '1', 'AIS/06/820');
INSERT INTO `official_use` VALUES ('777', '818', '1', '1', '1', '1', 'AIS/09/055');
INSERT INTO `official_use` VALUES ('778', '819', '1', '1', '1', '1', 'AIS/10/3075');
INSERT INTO `official_use` VALUES ('779', '820', '1', '1', '1', '1', 'AIS/08/182');
INSERT INTO `official_use` VALUES ('780', '821', '1', '1', '1', '1', 'AIS/09/2010');
INSERT INTO `official_use` VALUES ('781', '822', '1', '1', '1', '1', 'AIS/11/2145');
INSERT INTO `official_use` VALUES ('782', '823', '1', '1', '1', '1', 'AIS/11/2285');
INSERT INTO `official_use` VALUES ('783', '824', '1', '1', '1', '1', 'AIS/10/1054');
INSERT INTO `official_use` VALUES ('784', '825', '1', '1', '1', '1', 'AIS/09/207');
INSERT INTO `official_use` VALUES ('785', '826', '1', '1', '1', '1', 'AIS/09/149');
INSERT INTO `official_use` VALUES ('786', '827', '1', '1', '1', '1', 'AIS/09/153');
INSERT INTO `official_use` VALUES ('787', '828', '1', '1', '1', '1', 'AIS/08/673');
INSERT INTO `official_use` VALUES ('788', '829', '1', '1', '1', '1', 'AIS/09/157');
INSERT INTO `official_use` VALUES ('789', '830', '1', '1', '1', '1', 'AIS/10/3048');
INSERT INTO `official_use` VALUES ('790', '831', '1', '1', '1', '1', 'AIS/06/163');
INSERT INTO `official_use` VALUES ('791', '832', '1', '1', '1', '1', 'AIS/02/810');
INSERT INTO `official_use` VALUES ('792', '833', '1', '1', '1', '1', 'AIS/05/311');
INSERT INTO `official_use` VALUES ('793', '834', '1', '1', '1', '1', 'AIS/08/782');
INSERT INTO `official_use` VALUES ('794', '835', '1', '1', '1', '1', 'AIS/05/312');
INSERT INTO `official_use` VALUES ('795', '836', '1', '1', '1', '1', 'AIS/07/476');
INSERT INTO `official_use` VALUES ('796', '837', '1', '1', '1', '1', 'AIS/09/220');
INSERT INTO `official_use` VALUES ('797', '838', '1', '1', '1', '1', 'AIS/10/2000');
INSERT INTO `official_use` VALUES ('798', '839', '1', '1', '1', '1', 'AIS/11/2157');
INSERT INTO `official_use` VALUES ('799', '840', '1', '1', '1', '1', 'AIS/05/300');
INSERT INTO `official_use` VALUES ('800', '841', '1', '1', '1', '1', 'AIS/11/2269');
INSERT INTO `official_use` VALUES ('801', '842', '1', '1', '1', '1', 'AIS/SS/11/05');
INSERT INTO `official_use` VALUES ('802', '843', '1', '1', '1', '1', 'AIS/04/096');
INSERT INTO `official_use` VALUES ('803', '844', '1', '1', '1', '1', 'AIS/08/726');
INSERT INTO `official_use` VALUES ('804', '845', '1', '1', '1', '1', 'AIS/07/453');
INSERT INTO `official_use` VALUES ('805', '846', '1', '1', '1', '1', 'AIS/08/447');
INSERT INTO `official_use` VALUES ('806', '847', '1', '1', '1', '1', 'AIS/08/664');
INSERT INTO `official_use` VALUES ('807', '848', '1', '1', '1', '1', 'AIS/08/808');
INSERT INTO `official_use` VALUES ('808', '849', '1', '1', '1', '1', 'AIS/10/3062');
INSERT INTO `official_use` VALUES ('809', '850', '1', '1', '1', '1', 'AIS/08/660');
INSERT INTO `official_use` VALUES ('810', '851', '1', '1', '1', '1', 'AIS/07/435');
INSERT INTO `official_use` VALUES ('811', '852', '1', '1', '1', '1', 'AIS/08/485');
INSERT INTO `official_use` VALUES ('812', '853', '1', '1', '1', '1', 'AIS/03/133');
INSERT INTO `official_use` VALUES ('813', '854', '1', '1', '1', '1', 'AIS/04/207');
INSERT INTO `official_use` VALUES ('814', '855', '1', '1', '1', '1', 'AIS/06/375');
INSERT INTO `official_use` VALUES ('815', '856', '1', '1', '1', '1', 'AIS/06/380');
INSERT INTO `official_use` VALUES ('816', '857', '1', '1', '1', '1', 'AIS/06/382');
INSERT INTO `official_use` VALUES ('817', '858', '1', '1', '1', '1', 'AIS/07/133');
INSERT INTO `official_use` VALUES ('818', '859', '1', '1', '1', '1', 'AIS/07/454');
INSERT INTO `official_use` VALUES ('819', '860', '1', '1', '1', '1', 'AIS/07/500');
INSERT INTO `official_use` VALUES ('820', '861', '1', '1', '1', '1', 'AIS/07/501');
INSERT INTO `official_use` VALUES ('821', '862', '1', '1', '1', '1', 'AIS/07/502');
INSERT INTO `official_use` VALUES ('822', '863', '1', '1', '1', '1', 'AIS/07/516');
INSERT INTO `official_use` VALUES ('823', '864', '1', '1', '1', '1', 'AIS/08/531');
INSERT INTO `official_use` VALUES ('824', '865', '1', '1', '1', '1', 'AIS/08/568');
INSERT INTO `official_use` VALUES ('825', '866', '1', '1', '1', '1', 'AIS/08/574');
INSERT INTO `official_use` VALUES ('826', '867', '1', '1', '1', '1', 'AIS/08/592');
INSERT INTO `official_use` VALUES ('827', '868', '1', '1', '1', '1', 'AIS/08/621');
INSERT INTO `official_use` VALUES ('828', '869', '1', '1', '1', '1', 'AIS/08/658');
INSERT INTO `official_use` VALUES ('829', '870', '1', '1', '1', '1', 'AIS/08/685');
INSERT INTO `official_use` VALUES ('830', '871', '1', '1', '1', '1', 'AIS/08/722');
INSERT INTO `official_use` VALUES ('831', '872', '1', '1', '1', '1', 'AIS/08/734');
INSERT INTO `official_use` VALUES ('832', '873', '1', '1', '1', '1', 'AIS/08/775');
INSERT INTO `official_use` VALUES ('833', '874', '1', '1', '1', '1', 'AIS/09/147');
INSERT INTO `official_use` VALUES ('834', '875', '1', '1', '1', '1', 'AIS/09/176');
INSERT INTO `official_use` VALUES ('835', '876', '1', '1', '1', '1', 'AIS/09/185');
INSERT INTO `official_use` VALUES ('836', '877', '1', '1', '1', '1', 'AIS/09/194');
INSERT INTO `official_use` VALUES ('837', '878', '1', '1', '1', '1', 'AIS/09/223');
INSERT INTO `official_use` VALUES ('838', '879', '1', '1', '1', '1', 'AIS/10/1052');
INSERT INTO `official_use` VALUES ('839', '880', '1', '1', '1', '1', 'AIS/10/2015');
INSERT INTO `official_use` VALUES ('840', '881', '1', '1', '1', '1', 'AIS/10/2035');
INSERT INTO `official_use` VALUES ('841', '882', '1', '1', '1', '1', 'AIS/10/3025');
INSERT INTO `official_use` VALUES ('842', '883', '1', '1', '1', '1', 'AIS/10/3036');
INSERT INTO `official_use` VALUES ('843', '884', '1', '1', '1', '1', 'AIS/10/3064');
INSERT INTO `official_use` VALUES ('844', '885', '1', '1', '1', '1', 'AIS/10/3074');
INSERT INTO `official_use` VALUES ('845', '886', '1', '1', '1', '1', 'AIS/11/2117');
INSERT INTO `official_use` VALUES ('846', '887', '1', '1', '1', '1', 'AIS/11/2166');
INSERT INTO `official_use` VALUES ('847', '888', '1', '1', '1', '1', 'AIS/11/2189');
INSERT INTO `official_use` VALUES ('848', '889', '1', '1', '1', '1', 'AIS/11/2244');
INSERT INTO `official_use` VALUES ('849', '890', '1', '1', '1', '1', 'AIS/SS/10/00');
INSERT INTO `official_use` VALUES ('850', '891', '1', '1', '1', '1', 'AIS/SS/10/00');
INSERT INTO `official_use` VALUES ('851', '892', '1', '1', '1', '1', 'AIS/SS/10/00');
INSERT INTO `official_use` VALUES ('852', '893', '1', '1', '1', '1', 'AIS/SS/11/07');
INSERT INTO `official_use` VALUES ('853', '894', '1', '1', '1', '1', 'AIS/11/2246');
INSERT INTO `official_use` VALUES ('854', '895', '1', '1', '1', '1', 'AIS/10/2028');
INSERT INTO `official_use` VALUES ('855', '896', '1', '1', '1', '1', 'AIS/06/821');
INSERT INTO `official_use` VALUES ('856', '897', '1', '1', '1', '1', 'AIS/08/249');
INSERT INTO `official_use` VALUES ('857', '898', '1', '1', '1', '1', 'AIS/08/634');
INSERT INTO `official_use` VALUES ('858', '899', '1', '1', '1', '1', 'AIS/08/687');
INSERT INTO `official_use` VALUES ('859', '900', '1', '1', '1', '1', 'AIS/08/716');
INSERT INTO `official_use` VALUES ('860', '901', '1', '1', '1', '1', 'AIS/09/224');
INSERT INTO `official_use` VALUES ('861', '902', '1', '1', '1', '1', 'AIS/09/225');
INSERT INTO `official_use` VALUES ('862', '903', '1', '1', '1', '1', 'AIS/09/226');
INSERT INTO `official_use` VALUES ('863', '904', '1', '1', '1', '1', 'AIS/09/227');
INSERT INTO `official_use` VALUES ('864', '905', '1', '1', '1', '1', 'AIS/05/334');
INSERT INTO `official_use` VALUES ('865', '906', '1', '1', '1', '1', 'AIS/07/508');
INSERT INTO `official_use` VALUES ('866', '907', '1', '1', '1', '1', 'AIS/07/5120');
INSERT INTO `official_use` VALUES ('867', '908', '1', '1', '1', '1', 'AIS/08/6930');
INSERT INTO `official_use` VALUES ('868', '909', '1', '1', '1', '1', 'AIS/08/742');
INSERT INTO `official_use` VALUES ('869', '910', '1', '1', '1', '1', 'AIS/09/013');
INSERT INTO `official_use` VALUES ('870', '911', '1', '1', '1', '1', 'AIS/09/021');
INSERT INTO `official_use` VALUES ('871', '912', '1', '1', '1', '1', 'AIS/09/028');
INSERT INTO `official_use` VALUES ('872', '913', '1', '1', '1', '1', 'AIS/09/084');
INSERT INTO `official_use` VALUES ('873', '914', '1', '1', '1', '1', 'AIS/09/130');
INSERT INTO `official_use` VALUES ('874', '915', '1', '1', '1', '1', 'AIS/09/158');
INSERT INTO `official_use` VALUES ('875', '916', '1', '1', '1', '1', 'AIS/09/175');
INSERT INTO `official_use` VALUES ('876', '917', '1', '1', '1', '1', 'AIS/09/197');
INSERT INTO `official_use` VALUES ('877', '918', '1', '1', '1', '1', 'AIS/10/2062');
INSERT INTO `official_use` VALUES ('878', '919', '1', '1', '1', '1', 'AIS/10/3041');
INSERT INTO `official_use` VALUES ('879', '920', '1', '1', '1', '1', 'AIS/10/3045');
INSERT INTO `official_use` VALUES ('880', '921', '1', '1', '1', '1', 'AIS/10/3076');
INSERT INTO `official_use` VALUES ('881', '922', '1', '1', '1', '1', 'AIS/11/2120');
INSERT INTO `official_use` VALUES ('882', '923', '1', '1', '1', '1', 'AIS/11/2121');
INSERT INTO `official_use` VALUES ('883', '924', '1', '1', '1', '1', 'AIS/11/2128');
INSERT INTO `official_use` VALUES ('884', '925', '1', '1', '1', '1', 'AIS/11/2263');
INSERT INTO `official_use` VALUES ('885', '926', '1', '1', '1', '1', 'AIS/08/605');
INSERT INTO `official_use` VALUES ('886', '927', '1', '1', '1', '1', 'AIS/08/627');
INSERT INTO `official_use` VALUES ('887', '928', '1', '1', '1', '1', 'AIS/09/121');
INSERT INTO `official_use` VALUES ('888', '929', '1', '1', '1', '1', 'AIS/09/058');
INSERT INTO `official_use` VALUES ('889', '930', '1', '1', '1', '1', 'AIS/09/085');
INSERT INTO `official_use` VALUES ('890', '931', '1', '1', '1', '1', 'AIS/SS/11/04');
INSERT INTO `official_use` VALUES ('891', '932', '1', '1', '1', '1', 'AIS/08/572');
INSERT INTO `official_use` VALUES ('892', '933', '1', '1', '1', '1', 'AIS/03/192');
INSERT INTO `official_use` VALUES ('893', '934', '1', '1', '1', '1', 'AIS/05/306');
INSERT INTO `official_use` VALUES ('894', '935', '1', '1', '1', '1', 'AIS/08/584');
INSERT INTO `official_use` VALUES ('895', '936', '1', '1', '1', '1', 'AIS/09/196');
INSERT INTO `official_use` VALUES ('896', '937', '1', '1', '1', '1', 'AIS/11/2114');
INSERT INTO `official_use` VALUES ('897', '938', '1', '1', '1', '1', 'AIS/11/2227');
INSERT INTO `official_use` VALUES ('898', '939', '1', '1', '1', '1', 'AIS/11/2245');
INSERT INTO `official_use` VALUES ('899', '940', '1', '1', '1', '1', 'AIS/08/771');
INSERT INTO `official_use` VALUES ('900', '941', '1', '1', '1', '1', 'AIS/07/183');
INSERT INTO `official_use` VALUES ('901', '942', '1', '1', '1', '1', 'AIS/06/356');
INSERT INTO `official_use` VALUES ('902', '943', '1', '1', '1', '1', 'AIS/11/2141');
INSERT INTO `official_use` VALUES ('903', '944', '1', '1', '1', '1', 'AIS/05/302');
INSERT INTO `official_use` VALUES ('904', '945', '1', '1', '1', '1', 'AIS/06/384');
INSERT INTO `official_use` VALUES ('905', '946', '1', '1', '1', '1', 'AIS/07/505');
INSERT INTO `official_use` VALUES ('906', '947', '1', '1', '1', '1', 'AIS/08/142');
INSERT INTO `official_use` VALUES ('907', '948', '1', '1', '1', '1', 'AIS/08/2035');
INSERT INTO `official_use` VALUES ('908', '949', '1', '1', '1', '1', 'AIS/08/557');
INSERT INTO `official_use` VALUES ('909', '950', '1', '1', '1', '1', 'AIS/08/583');
INSERT INTO `official_use` VALUES ('910', '951', '1', '1', '1', '1', 'AIS/08/713');
INSERT INTO `official_use` VALUES ('911', '952', '1', '1', '1', '1', 'AIS/08/727');
INSERT INTO `official_use` VALUES ('912', '953', '1', '1', '1', '1', 'AIS/08/728');
INSERT INTO `official_use` VALUES ('913', '954', '1', '1', '1', '1', 'AIS/09/075');
INSERT INTO `official_use` VALUES ('914', '955', '1', '1', '1', '1', 'AIS/09/134');
INSERT INTO `official_use` VALUES ('915', '956', '1', '1', '1', '1', 'AIS/09/765');
INSERT INTO `official_use` VALUES ('916', '957', '1', '1', '1', '1', 'AIS/10/2019');
INSERT INTO `official_use` VALUES ('917', '958', '1', '1', '1', '1', 'AIS/10/2083');
INSERT INTO `official_use` VALUES ('918', '959', '1', '1', '1', '1', 'AIS/10/2094');
INSERT INTO `official_use` VALUES ('919', '960', '1', '1', '1', '1', 'AIS/10/3032');
INSERT INTO `official_use` VALUES ('920', '961', '1', '1', '1', '1', 'AIS/11/2112');
INSERT INTO `official_use` VALUES ('921', '962', '1', '1', '1', '1', 'AIS/11/2132');
INSERT INTO `official_use` VALUES ('922', '963', '1', '1', '1', '1', 'AIS/11/2154');
INSERT INTO `official_use` VALUES ('923', '964', '1', '1', '1', '1', 'AIS/11/2159');
INSERT INTO `official_use` VALUES ('924', '965', '1', '1', '1', '1', 'AIS/11/2190');
INSERT INTO `official_use` VALUES ('925', '966', '1', '1', '1', '1', 'AIS/11/2233');
INSERT INTO `official_use` VALUES ('926', '967', '1', '1', '1', '1', 'AIS/11/2241');
INSERT INTO `official_use` VALUES ('927', '968', '1', '1', '1', '1', 'AIS/11/2247');
INSERT INTO `official_use` VALUES ('928', '969', '1', '1', '1', '1', 'AIS/11/2266');
INSERT INTO `official_use` VALUES ('929', '970', '1', '1', '1', '1', 'AIS/11/2287');
INSERT INTO `official_use` VALUES ('930', '971', '1', '1', '1', '1', 'AIS/11/2322');
INSERT INTO `official_use` VALUES ('931', '972', '1', '1', '1', '1', 'AIS/SS/11/07');
INSERT INTO `official_use` VALUES ('932', '973', '1', '1', '1', '1', 'AIS/10/2012');
INSERT INTO `official_use` VALUES ('933', '974', '1', '1', '1', '1', 'AIS/11/2218');
INSERT INTO `official_use` VALUES ('934', '975', '1', '1', '1', '1', 'AIS/08/717');
INSERT INTO `official_use` VALUES ('935', '976', '1', '1', '1', '1', 'AIS/06/357');
INSERT INTO `official_use` VALUES ('936', '977', '1', '1', '1', '1', 'AIS/08/731');
INSERT INTO `official_use` VALUES ('937', '978', '1', '1', '1', '1', 'AIS/05/433');
INSERT INTO `official_use` VALUES ('938', '979', '1', '1', '1', '1', 'AIS/07/493');
INSERT INTO `official_use` VALUES ('939', '980', '1', '1', '1', '1', 'AIS/07/512');
INSERT INTO `official_use` VALUES ('940', '981', '1', '1', '1', '1', 'AIS/08/446');
INSERT INTO `official_use` VALUES ('941', '982', '1', '1', '1', '1', 'AIS/08/580');
INSERT INTO `official_use` VALUES ('942', '983', '1', '1', '1', '1', 'AIS/09/128');
INSERT INTO `official_use` VALUES ('943', '984', '1', '1', '1', '1', 'AIS/10/2018');
INSERT INTO `official_use` VALUES ('944', '985', '1', '1', '1', '1', 'AIS/10/2039');
INSERT INTO `official_use` VALUES ('945', '986', '1', '1', '1', '1', 'AIS/10/2050');
INSERT INTO `official_use` VALUES ('946', '987', '1', '1', '1', '1', 'AIS/10/2069');
INSERT INTO `official_use` VALUES ('947', '988', '1', '1', '1', '1', 'AIS/10/3060');
INSERT INTO `official_use` VALUES ('948', '989', '1', '1', '1', '1', 'AIS/11/2177');
INSERT INTO `official_use` VALUES ('949', '990', '1', '1', '1', '1', 'AIS/11/2242');
INSERT INTO `official_use` VALUES ('950', '991', '1', '1', '1', '1', 'AIS/10/2049');
INSERT INTO `official_use` VALUES ('951', '992', '1', '1', '1', '1', 'AIS/SS/10/02');
INSERT INTO `official_use` VALUES ('952', '993', '1', '1', '1', '1', 'AIS/10/2032');
INSERT INTO `official_use` VALUES ('953', '994', '1', '1', '1', '1', 'AIS/08/635');
INSERT INTO `official_use` VALUES ('954', '995', '1', '1', '1', '1', 'AIS/08/780');
INSERT INTO `official_use` VALUES ('955', '996', '1', '1', '1', '1', 'AIS/11/2214');
INSERT INTO `official_use` VALUES ('956', '997', '1', '1', '1', '1', 'AIS/02/049');
INSERT INTO `official_use` VALUES ('957', '998', '1', '1', '1', '1', 'AIS/10/2001');
INSERT INTO `official_use` VALUES ('958', '999', '1', '1', '1', '1', 'AIS/11/2119');
INSERT INTO `official_use` VALUES ('959', '1000', '1', '1', '1', '1', 'AIS/04/811');
INSERT INTO `official_use` VALUES ('960', '1001', '1', '1', '1', '1', 'AIS/08/749');
INSERT INTO `official_use` VALUES ('961', '1002', '1', '1', '1', '1', 'AIS/09/124');
INSERT INTO `official_use` VALUES ('962', '1003', '1', '1', '1', '1', 'AIS/09/183');
INSERT INTO `official_use` VALUES ('963', '1004', '1', '1', '1', '1', 'AIS/10/3061');
INSERT INTO `official_use` VALUES ('964', '1005', '1', '1', '1', '1', 'AIS/11/2275');
INSERT INTO `official_use` VALUES ('965', '1006', '1', '1', '1', '1', 'AIS/11/2276');
INSERT INTO `official_use` VALUES ('966', '1007', '1', '1', '1', '1', 'AIS/11/2316');
INSERT INTO `official_use` VALUES ('967', '1008', '1', '1', '1', '1', 'AIS/08/766');
INSERT INTO `official_use` VALUES ('968', '1009', '1', '1', '1', '1', 'AIS/06/287');
INSERT INTO `official_use` VALUES ('969', '1010', '1', '1', '1', '1', 'AIS/08/396');
INSERT INTO `official_use` VALUES ('970', '1011', '1', '1', '1', '1', 'AIS/10/2005');
INSERT INTO `official_use` VALUES ('971', '1012', '1', '1', '1', '1', 'AIS/10/3059');
INSERT INTO `official_use` VALUES ('972', '1013', '1', '1', '1', '1', 'AIS/103059');
INSERT INTO `official_use` VALUES ('973', '1014', '1', '1', '1', '1', 'AIS/11/2206');
INSERT INTO `official_use` VALUES ('974', '1015', '1', '1', '1', '1', 'AIS/11/2310');
INSERT INTO `official_use` VALUES ('975', '1016', '1', '1', '1', '1', 'AIS/SS/10/04');
INSERT INTO `official_use` VALUES ('976', '1017', '1', '1', '1', '1', 'AIS/09/092');
INSERT INTO `official_use` VALUES ('977', '1018', '1', '1', '1', '1', 'AIS/11/2191');
INSERT INTO `official_use` VALUES ('978', '1019', '1', '1', '1', '1', 'AIS/11/2307');
INSERT INTO `official_use` VALUES ('979', '1020', '1', '1', '1', '1', 'AIS/SS/10/03');
INSERT INTO `official_use` VALUES ('980', '1021', '1', '1', '1', '1', 'AIS/10/2010');
INSERT INTO `official_use` VALUES ('981', '1022', '1', '1', '1', '1', 'AIS/08/663');
INSERT INTO `official_use` VALUES ('982', '1023', '1', '1', '1', '1', 'AIS/08/1000');
INSERT INTO `official_use` VALUES ('983', '1024', '1', '1', '1', '1', 'AIS/08/624');
INSERT INTO `official_use` VALUES ('984', '1025', '1', '1', '1', '1', 'AIS/09/008');
INSERT INTO `official_use` VALUES ('985', '1026', '1', '1', '1', '1', 'AIS/09/010');
INSERT INTO `official_use` VALUES ('986', '1027', '1', '1', '1', '1', 'AIS/09/046');
INSERT INTO `official_use` VALUES ('987', '1028', '1', '1', '1', '1', 'AIS/10/2034');
INSERT INTO `official_use` VALUES ('988', '1029', '1', '1', '1', '1', 'AIS/10/3078');
INSERT INTO `official_use` VALUES ('989', '1030', '1', '1', '1', '1', 'AIS/11/2220');
INSERT INTO `official_use` VALUES ('990', '1031', '1', '1', '1', '1', 'AIS/10/3037');
INSERT INTO `official_use` VALUES ('991', '1032', '1', '1', '1', '1', 'AIS/02/052');
INSERT INTO `official_use` VALUES ('992', '1033', '1', '1', '1', '1', 'AIS/SS/11/05');
INSERT INTO `official_use` VALUES ('993', '1034', '1', '1', '1', '1', 'AIS/09/006');
INSERT INTO `official_use` VALUES ('994', '1035', '1', '1', '1', '1', 'AIS/09/217');
INSERT INTO `official_use` VALUES ('995', '1036', '1', '1', '1', '1', 'AIS/11/2200');
INSERT INTO `official_use` VALUES ('996', '1037', '1', '1', '1', '1', 'AIS/11/2217');
INSERT INTO `official_use` VALUES ('997', '1038', '1', '1', '1', '1', 'AIS/06/882');
INSERT INTO `official_use` VALUES ('998', '1039', '1', '1', '1', '1', 'AIS/10/3058');
INSERT INTO `official_use` VALUES ('999', '1040', '1', '1', '1', '1', 'AIS/10/3081');
INSERT INTO `official_use` VALUES ('1000', '1041', '1', '1', '1', '1', 'AIS/09/148');
INSERT INTO `official_use` VALUES ('1001', '1042', '1', '1', '1', '1', 'AIS/10/3011');
INSERT INTO `official_use` VALUES ('1002', '1043', '1', '1', '1', '1', 'AIS/11/2169');
INSERT INTO `official_use` VALUES ('1003', '1044', '1', '1', '1', '1', 'AIS/10/2006');
INSERT INTO `official_use` VALUES ('1004', '1045', '1', '1', '1', '1', 'AIS/SS/10/00');
INSERT INTO `official_use` VALUES ('1005', '1046', '1', '1', '1', '1', 'AIS/09/079');
INSERT INTO `official_use` VALUES ('1006', '1047', '1', '1', '1', '1', 'AIS/08/228');
INSERT INTO `official_use` VALUES ('1007', '1048', '1', '1', '1', '1', 'AIS/07/5200');
INSERT INTO `official_use` VALUES ('1008', '1049', '1', '1', '1', '1', 'AIS/11/2181');
INSERT INTO `official_use` VALUES ('1009', '1050', '1', '1', '1', '1', 'AIS/10/2037');
INSERT INTO `official_use` VALUES ('1010', '1051', '1', '1', '1', '1', 'AIS/11/2229');
INSERT INTO `official_use` VALUES ('1011', '1052', '1', '1', '1', '1', 'AIS/09/065');
INSERT INTO `official_use` VALUES ('1012', '1053', '1', '1', '1', '1', 'AIS/09/082');
INSERT INTO `official_use` VALUES ('1013', '1054', '1', '1', '1', '1', 'AIS/09/045');
INSERT INTO `official_use` VALUES ('1014', '1055', '1', '1', '1', '1', 'AIS/SS/10/01');
INSERT INTO `official_use` VALUES ('1015', '1056', '1', '1', '1', '1', 'AIS/08/537');
INSERT INTO `official_use` VALUES ('1016', '1057', '1', '1', '1', '1', 'AIS/11/2149');
INSERT INTO `official_use` VALUES ('1017', '1058', '1', '1', '1', '1', 'AIS/11/');
INSERT INTO `official_use` VALUES ('1018', '1059', '1', '1', '1', '1', 'AIS/08/648');
INSERT INTO `official_use` VALUES ('1019', '1060', '1', '1', '1', '1', 'AIS/07/394');
INSERT INTO `official_use` VALUES ('1020', '1061', '1', '1', '1', '1', 'AIS/10/2073');
INSERT INTO `official_use` VALUES ('1021', '1062', '1', '1', '1', '1', 'AIS/10/2021');
INSERT INTO `official_use` VALUES ('1022', '1063', '1', '1', '1', '1', 'AIS/10/2099');
INSERT INTO `official_use` VALUES ('1023', '1064', '1', '1', '1', '1', 'AIS/10/3095');
INSERT INTO `official_use` VALUES ('1024', '1065', '1', '1', '1', '1', 'AIS/10/2066');
INSERT INTO `official_use` VALUES ('1025', '1066', '1', '1', '1', '1', 'AIS/08/561');
INSERT INTO `official_use` VALUES ('1026', '1067', '1', '1', '1', '1', 'AIS/10/2041');
INSERT INTO `official_use` VALUES ('1027', '1068', '1', '1', '1', '1', 'AIS/10/4041');
INSERT INTO `official_use` VALUES ('1028', '1069', '1', '1', '1', '1', 'AIS/08/2013');
INSERT INTO `official_use` VALUES ('1029', '1070', '1', '1', '1', '1', 'AIS/08/779');
INSERT INTO `official_use` VALUES ('1030', '1071', '1', '1', '1', '1', 'AIS/09/154');
INSERT INTO `official_use` VALUES ('1031', '1072', '1', '1', '1', '1', 'AIS/10/2054');
INSERT INTO `official_use` VALUES ('1032', '1073', '1', '1', '1', '1', 'AIS/08/655');
INSERT INTO `official_use` VALUES ('1033', '1074', '1', '1', '1', '1', 'AIS/09/160');
INSERT INTO `official_use` VALUES ('1034', '1075', '1', '1', '1', '1', 'AIS/09/070');
INSERT INTO `official_use` VALUES ('1035', '1076', '1', '1', '1', '1', 'AIS/08/807');
INSERT INTO `official_use` VALUES ('1036', '1077', '1', '1', '1', '1', 'AIS/08/748');
INSERT INTO `official_use` VALUES ('1037', '1078', '1', '1', '1', '1', 'AIS/07/172');
INSERT INTO `official_use` VALUES ('1038', '1079', '1', '1', '1', '1', 'AIS/08/774');
INSERT INTO `official_use` VALUES ('1039', '1080', '1', '1', '1', '1', 'AIS/10/3043');
INSERT INTO `official_use` VALUES ('1040', '1081', '1', '1', '1', '1', 'AIS/08/703');
INSERT INTO `official_use` VALUES ('1041', '1082', '1', '1', '1', '1', 'AIS/08/577');
INSERT INTO `official_use` VALUES ('1042', '1083', '1', '1', '1', '1', 'AIS/08/596');
INSERT INTO `official_use` VALUES ('1043', '1084', '1', '1', '1', '1', 'AIS/SS/11/07');
INSERT INTO `official_use` VALUES ('1044', '1085', '1', '1', '1', '1', 'AIS/09/2011');
INSERT INTO `official_use` VALUES ('1045', '1086', '1', '1', '1', '1', 'AIS/11/2136');
INSERT INTO `official_use` VALUES ('1046', '1087', '1', '1', '1', '1', 'AIS/07/738');
INSERT INTO `official_use` VALUES ('1047', '1088', '1', '1', '1', '1', 'AIS/09/152');
INSERT INTO `official_use` VALUES ('1048', '1089', '1', '1', '1', '1', 'AIS/10/2068');
INSERT INTO `official_use` VALUES ('1049', '1090', '1', '1', '1', '1', 'AIS/10/2036');
INSERT INTO `official_use` VALUES ('1050', '1091', '1', '1', '1', '1', 'AIS/10/3089');
INSERT INTO `official_use` VALUES ('1051', '1092', '1', '1', '1', '1', 'AIS/09/218');
INSERT INTO `official_use` VALUES ('1052', '1093', '1', '1', '1', '1', 'AIS/07/521');
INSERT INTO `official_use` VALUES ('1053', '1094', '1', '1', '1', '1', 'AIS/10/3002');
INSERT INTO `official_use` VALUES ('1054', '1095', '1', '1', '1', '1', 'AIS/09/132');
INSERT INTO `official_use` VALUES ('1055', '1096', '1', '1', '1', '1', 'AIS/08/688');
INSERT INTO `official_use` VALUES ('1056', '1097', '1', '1', '1', '1', 'AIS/07/485');
INSERT INTO `official_use` VALUES ('1057', '1098', '1', '1', '1', '1', 'AIS/08/540');
INSERT INTO `official_use` VALUES ('1058', '1099', '1', '1', '1', '1', 'AIS/08/714');
INSERT INTO `official_use` VALUES ('1059', '1100', '1', '1', '1', '1', 'AIS/SS/11/08');
INSERT INTO `official_use` VALUES ('1060', '1101', '1', '1', '1', '1', 'AIS/SS/10/03');
INSERT INTO `official_use` VALUES ('1061', '1102', '1', '1', '1', '1', 'AIS/08/701');
INSERT INTO `official_use` VALUES ('1062', '1103', '1', '1', '1', '1', 'AIS/11/2204');
INSERT INTO `official_use` VALUES ('1063', '1104', '1', '1', '1', '1', 'AIS/11/2282');
INSERT INTO `official_use` VALUES ('1064', '1105', '1', '1', '1', '1', 'AIS/07/812');
INSERT INTO `official_use` VALUES ('1065', '1106', '1', '1', '1', '1', 'AIS/10/2024');
INSERT INTO `official_use` VALUES ('1066', '1107', '1', '1', '1', '1', 'AIS/SS/11/07');
INSERT INTO `official_use` VALUES ('1067', '1108', '1', '1', '1', '1', 'AIS/05/234');
INSERT INTO `official_use` VALUES ('1068', '1109', '1', '1', '1', '1', 'AIS/08/173');
INSERT INTO `official_use` VALUES ('1069', '1110', '1', '1', '1', '1', 'AIS/08/606');
INSERT INTO `official_use` VALUES ('1070', '1111', '1', '1', '1', '1', 'AIS/05/309');
INSERT INTO `official_use` VALUES ('1071', '1112', '1', '1', '1', '1', 'AIS/08/513');
INSERT INTO `official_use` VALUES ('1072', '1113', '1', '1', '1', '1', 'AIS/10/2052');
INSERT INTO `official_use` VALUES ('1073', '1114', '1', '1', '1', '1', 'AIS/10/2070');
INSERT INTO `official_use` VALUES ('1074', '1115', '1', '1', '1', '1', 'AIS/11/2309');
INSERT INTO `official_use` VALUES ('1075', '1116', '1', '1', '1', '1', 'AIS/09/169');
INSERT INTO `official_use` VALUES ('1076', '1117', '1', '1', '1', '1', 'AIS/07/515');
INSERT INTO `official_use` VALUES ('1077', '1118', '1', '1', '1', '1', 'AIS/10/3016');
INSERT INTO `official_use` VALUES ('1078', '1119', '1', '1', '1', '1', 'AIS/11/2297');
INSERT INTO `official_use` VALUES ('1079', '1120', '1', '1', '1', '1', 'AIS/10/2080');
INSERT INTO `official_use` VALUES ('1080', '1121', '1', '1', '1', '1', 'AIS/08/6640');
INSERT INTO `official_use` VALUES ('1081', '1122', '1', '1', '1', '1', 'AIS/08/578');
INSERT INTO `official_use` VALUES ('1082', '1123', '1', '1', '1', '1', 'AIS/08/828');
INSERT INTO `official_use` VALUES ('1083', '1124', '1', '1', '1', '1', 'AIS/09/171');
INSERT INTO `official_use` VALUES ('1084', '1125', '1', '1', '1', '1', 'AIS/SS/10/02');
INSERT INTO `official_use` VALUES ('1085', '1126', '1', '1', '1', '1', 'AIS/SS/11/06');
INSERT INTO `official_use` VALUES ('1086', '1127', '1', '1', '1', '1', 'AIS/09/060');
INSERT INTO `official_use` VALUES ('1087', '1128', '1', '1', '1', '1', 'AIS/10/3065');
INSERT INTO `official_use` VALUES ('1088', '1129', '1', '1', '1', '1', 'AIS/07/436');
INSERT INTO `official_use` VALUES ('1089', '1130', '1', '1', '1', '1', 'AIS/09/003');
INSERT INTO `official_use` VALUES ('1090', '1131', '1', '1', '1', '1', 'AIS/08/189');
INSERT INTO `official_use` VALUES ('1091', '1132', '1', '1', '1', '1', 'AIS/08/622');
INSERT INTO `official_use` VALUES ('1092', '1133', '1', '1', '1', '1', 'AIS/10/3054');
INSERT INTO `official_use` VALUES ('1093', '1134', '1', '1', '1', '1', 'AIS/10/3097');
INSERT INTO `official_use` VALUES ('1094', '1135', '1', '1', '1', '1', 'AIS/10/3022');
INSERT INTO `official_use` VALUES ('1095', '1136', '1', '1', '1', '1', 'AIS/07/498');
INSERT INTO `official_use` VALUES ('1096', '1137', '1', '1', '1', '1', 'AIS/08/539');
INSERT INTO `official_use` VALUES ('1097', '1138', '1', '1', '1', '1', 'AIS/09/104');
INSERT INTO `official_use` VALUES ('1098', '1139', '1', '1', '1', '1', 'AIS/SS/10/00');
INSERT INTO `official_use` VALUES ('1099', '1140', '1', '1', '1', '1', 'AIS/03/134');
INSERT INTO `official_use` VALUES ('1100', '1141', '1', '1', '1', '1', 'AIS/11/2228');
INSERT INTO `official_use` VALUES ('1101', '1142', '1', '1', '1', '1', 'AIS/06/324');
INSERT INTO `official_use` VALUES ('1102', '1143', '1', '1', '1', '1', 'AIS/08/186');
INSERT INTO `official_use` VALUES ('1103', '1144', '1', '1', '1', '1', 'AIS/09/145');
INSERT INTO `official_use` VALUES ('1104', '1145', '1', '1', '1', '1', 'AIS/10/2097');
INSERT INTO `official_use` VALUES ('1105', '1146', '1', '1', '1', '1', 'AIS/SS/11/08');
INSERT INTO `official_use` VALUES ('1106', '1147', '1', '1', '1', '1', 'AIS/10/1047');
INSERT INTO `official_use` VALUES ('1107', '1148', '1', '1', '1', '1', 'AIS/11/2319');
INSERT INTO `official_use` VALUES ('1108', '1149', '1', '1', '1', '1', 'AIS/02/066');
INSERT INTO `official_use` VALUES ('1109', '1150', '1', '1', '1', '1', 'AIS/08/571');
INSERT INTO `official_use` VALUES ('1110', '1151', '1', '1', '1', '1', 'AIS/09/205');
INSERT INTO `official_use` VALUES ('1111', '1152', '1', '1', '1', '1', 'AIS/11/2139');
INSERT INTO `official_use` VALUES ('1112', '1153', '1', '1', '1', '1', 'AIS/SS/11/07');
INSERT INTO `official_use` VALUES ('1113', '1154', '1', '1', '1', '1', 'AIS/08/576');
INSERT INTO `official_use` VALUES ('1114', '1155', '1', '1', '1', '1', 'AIS/10/2008');
INSERT INTO `official_use` VALUES ('1115', '1156', '1', '1', '1', '1', 'AIS/11/2130');
INSERT INTO `official_use` VALUES ('1116', '1157', '1', '1', '1', '1', 'AIS/08/739');
INSERT INTO `official_use` VALUES ('1117', '1158', '1', '1', '1', '1', 'AIS/08/767');
INSERT INTO `official_use` VALUES ('1118', '1159', '1', '1', '1', '1', 'AIS/09/876');
INSERT INTO `official_use` VALUES ('1119', '1160', '1', '1', '1', '1', 'AIS/11/2265');
INSERT INTO `official_use` VALUES ('1120', '1161', '1', '1', '1', '1', 'AIS/11/2295');
INSERT INTO `official_use` VALUES ('1121', '1162', '1', '1', '1', '1', 'AIS/11/2295');
INSERT INTO `official_use` VALUES ('1122', '1163', '1', '1', '1', '1', 'AIS/10/3028');
INSERT INTO `official_use` VALUES ('1123', '1164', '1', '1', '1', '1', 'AIS/07/533');
INSERT INTO `official_use` VALUES ('1124', '1165', '1', '1', '1', '1', 'AIS/10/2047');
INSERT INTO `official_use` VALUES ('1125', '1166', '1', '1', '1', '1', 'AIS/10/3088');
INSERT INTO `official_use` VALUES ('1126', '1167', '1', '1', '1', '1', 'AIS/05/813');
INSERT INTO `official_use` VALUES ('1127', '1168', '1', '1', '1', '1', 'AIS/08/590');
INSERT INTO `official_use` VALUES ('1128', '1169', '1', '1', '1', '1', 'AIS/08/710');
INSERT INTO `official_use` VALUES ('1129', '1170', '1', '1', '1', '1', 'AIS/10/3004');
INSERT INTO `official_use` VALUES ('1130', '1171', '1', '1', '1', '1', 'AIS/SS/10/01');
INSERT INTO `official_use` VALUES ('1131', '1172', '1', '1', '1', '1', 'AIS/08/736');
INSERT INTO `official_use` VALUES ('1132', '1173', '1', '1', '1', '1', 'AIS/07/432');
INSERT INTO `official_use` VALUES ('1133', '1174', '1', '1', '1', '1', 'AIS/10/3072');
INSERT INTO `official_use` VALUES ('1134', '1175', '1', '1', '1', '1', 'AIS/10/3000');
INSERT INTO `official_use` VALUES ('1135', '1176', '1', '1', '1', '1', 'AIS/09/015');
INSERT INTO `official_use` VALUES ('1136', '1177', '1', '1', '1', '1', 'AIS/09/118');
INSERT INTO `official_use` VALUES ('1137', '1178', '1', '1', '1', '1', 'AIS/09/102');
INSERT INTO `official_use` VALUES ('1138', '1179', '1', '1', '1', '1', 'AIS/08/637');
INSERT INTO `official_use` VALUES ('1139', '1180', '1', '1', '1', '1', 'AIS/SS/11/04');
INSERT INTO `official_use` VALUES ('1140', '1181', '1', '1', '1', '1', 'AIS/07/480');
INSERT INTO `official_use` VALUES ('1141', '1182', '1', '1', '1', '1', 'AIS/08/473');
INSERT INTO `official_use` VALUES ('1142', '1183', '1', '1', '1', '1', 'AIS/08/691');
INSERT INTO `official_use` VALUES ('1143', '1184', '1', '1', '1', '1', 'AIS/09/151');
INSERT INTO `official_use` VALUES ('1144', '1185', '1', '1', '1', '1', 'AIS/11/2173');
INSERT INTO `official_use` VALUES ('1145', '1186', '1', '1', '1', '1', 'AIS/08/709');
INSERT INTO `official_use` VALUES ('1146', '1187', '1', '1', '1', '1', 'AIS/10/2002');
INSERT INTO `official_use` VALUES ('1147', '1188', '1', '1', '1', '1', 'AIS/SS/10/00');
INSERT INTO `official_use` VALUES ('1148', '1189', '1', '1', '1', '1', 'AIS/09/007');
INSERT INTO `official_use` VALUES ('1149', '1190', '1', '1', '1', '1', 'AIS/09/150');
INSERT INTO `official_use` VALUES ('1150', '1191', '1', '1', '1', '1', 'AIS/09/077');
INSERT INTO `official_use` VALUES ('1151', '1192', '1', '1', '1', '1', 'AIS/09/064');
INSERT INTO `official_use` VALUES ('1152', '1193', '1', '1', '1', '1', 'AIS/11/2299');
INSERT INTO `official_use` VALUES ('1153', '1194', '1', '1', '1', '1', 'AIS/04/271');
INSERT INTO `official_use` VALUES ('1154', '1195', '1', '1', '1', '1', 'AIS/10/3001');
INSERT INTO `official_use` VALUES ('1155', '1196', '1', '1', '1', '1', 'AIS/11/2216');
INSERT INTO `official_use` VALUES ('1156', '1197', '1', '1', '1', '1', 'AIS/10/3047');
INSERT INTO `official_use` VALUES ('1157', '1198', '1', '1', '1', '1', 'AIS/10/3063');
INSERT INTO `official_use` VALUES ('1158', '1199', '1', '1', '1', '1', 'AIS/08/2006');
INSERT INTO `official_use` VALUES ('1159', '1200', '1', '1', '1', '1', 'AIS/09/136');
INSERT INTO `official_use` VALUES ('1160', '1201', '1', '1', '1', '1', 'AIS/05/247');
INSERT INTO `official_use` VALUES ('1161', '1202', '1', '1', '1', '1', 'AIS/SS/10/01');
INSERT INTO `official_use` VALUES ('1162', '1203', '1', '1', '1', '1', 'AIS/03/107');
INSERT INTO `official_use` VALUES ('1163', '1204', '1', '1', '1', '1', 'AIS/08/120');
INSERT INTO `official_use` VALUES ('1164', '1205', '1', '1', '1', '1', 'AIS/05/282');
INSERT INTO `official_use` VALUES ('1165', '1206', '1', '1', '1', '1', 'AIS/07/829');
INSERT INTO `official_use` VALUES ('1166', '1207', '1', '1', '1', '1', 'AIS/09/026');
INSERT INTO `official_use` VALUES ('1167', '1208', '1', '1', '1', '1', 'AIS/08/657');
INSERT INTO `official_use` VALUES ('1168', '1209', '1', '1', '1', '1', 'AIS/04/233');
INSERT INTO `official_use` VALUES ('1169', '1210', '1', '1', '1', '1', 'AIS/08/5800');
INSERT INTO `official_use` VALUES ('1170', '1211', '1', '1', '1', '1', 'AIS/11/2252');
INSERT INTO `official_use` VALUES ('1171', '1212', '1', '1', '1', '1', 'AIS/SS/11/06');
INSERT INTO `official_use` VALUES ('1172', '1213', '1', '1', '1', '1', 'AIS/10/3017');
INSERT INTO `official_use` VALUES ('1173', '1214', '1', '1', '1', '1', 'AIS/04/188');
INSERT INTO `official_use` VALUES ('1174', '1215', '1', '1', '1', '1', 'AIS/04/220');
INSERT INTO `official_use` VALUES ('1175', '1216', '1', '1', '1', '1', 'AIS/05/046');
INSERT INTO `official_use` VALUES ('1176', '1217', '1', '1', '1', '1', 'AIS/05/303');
INSERT INTO `official_use` VALUES ('1177', '1218', '1', '1', '1', '1', 'AIS/06/398');
INSERT INTO `official_use` VALUES ('1178', '1219', '1', '1', '1', '1', 'AIS/07/745');
INSERT INTO `official_use` VALUES ('1179', '1220', '1', '1', '1', '1', 'AIS/08/661');
INSERT INTO `official_use` VALUES ('1180', '1221', '1', '1', '1', '1', 'AIS/08/777');
INSERT INTO `official_use` VALUES ('1181', '1222', '1', '1', '1', '1', 'AIS/08/784');
INSERT INTO `official_use` VALUES ('1182', '1223', '1', '1', '1', '1', 'AIS/08/816');
INSERT INTO `official_use` VALUES ('1183', '1224', '1', '1', '1', '1', 'AIS/09/108');
INSERT INTO `official_use` VALUES ('1184', '1225', '1', '1', '1', '1', 'AIS/09/111');
INSERT INTO `official_use` VALUES ('1185', '1226', '1', '1', '1', '1', 'AIS/09/184');
INSERT INTO `official_use` VALUES ('1186', '1227', '1', '1', '1', '1', 'AIS/09/219');
INSERT INTO `official_use` VALUES ('1187', '1228', '1', '1', '1', '1', 'AIS/10/1051');
INSERT INTO `official_use` VALUES ('1188', '1229', '1', '1', '1', '1', 'AIS/10/2089');
INSERT INTO `official_use` VALUES ('1189', '1230', '1', '1', '1', '1', 'AIS/10/3056');
INSERT INTO `official_use` VALUES ('1190', '1231', '1', '1', '1', '1', 'AIS/11/2274');
INSERT INTO `official_use` VALUES ('1191', '1232', '1', '1', '1', '1', 'AIS/11/2286');
INSERT INTO `official_use` VALUES ('1192', '1233', '1', '1', '1', '1', 'AIS/SS/10/01');
INSERT INTO `official_use` VALUES ('1193', '1234', '1', '1', '1', '1', 'AIS/SS/11/09');
INSERT INTO `official_use` VALUES ('1194', '1235', '1', '1', '1', '1', 'AIS/09/212');
INSERT INTO `official_use` VALUES ('1195', '1236', '1', '1', '1', '1', 'AIS/07/481');
INSERT INTO `official_use` VALUES ('1196', '1237', '1', '1', '1', '1', 'AIS/03/104');
INSERT INTO `official_use` VALUES ('1197', '1238', '1', '1', '1', '1', 'AIS/07/4970');
INSERT INTO `official_use` VALUES ('1198', '1239', '1', '1', '1', '1', 'AIS/10/3050');
INSERT INTO `official_use` VALUES ('1199', '1240', '1', '1', '1', '1', 'AIS/08/814');
INSERT INTO `official_use` VALUES ('1200', '1241', '1', '1', '1', '1', 'AIS/05/195');
INSERT INTO `official_use` VALUES ('1201', '1242', '1', '1', '1', '1', 'AIS/05/199');
INSERT INTO `official_use` VALUES ('1202', '1243', '1', '1', '1', '1', 'AIS/SS/10/00');
INSERT INTO `official_use` VALUES ('1203', '1244', '1', '1', '1', '1', 'AIS/02/032');
INSERT INTO `official_use` VALUES ('1204', '1245', '1', '1', '1', '1', 'AIS/04/193');
INSERT INTO `official_use` VALUES ('1205', '1246', '1', '1', '1', '1', 'AIS/06/386');
INSERT INTO `official_use` VALUES ('1206', '1247', '1', '1', '1', '1', 'AIS/06/822');
INSERT INTO `official_use` VALUES ('1207', '1248', '1', '1', '1', '1', 'AIS/07/123');
INSERT INTO `official_use` VALUES ('1208', '1249', '1', '1', '1', '1', 'AIS/07/440');
INSERT INTO `official_use` VALUES ('1209', '1250', '1', '1', '1', '1', 'AIS/07/629');
INSERT INTO `official_use` VALUES ('1210', '1251', '1', '1', '1', '1', 'AIS/08/1002');
INSERT INTO `official_use` VALUES ('1211', '1252', '1', '1', '1', '1', 'AIS/08/2003');
INSERT INTO `official_use` VALUES ('1212', '1253', '1', '1', '1', '1', 'AIS/08/2007');
INSERT INTO `official_use` VALUES ('1213', '1254', '1', '1', '1', '1', 'AIS/09/030');
INSERT INTO `official_use` VALUES ('1214', '1255', '1', '1', '1', '1', 'AIS/09/051');
INSERT INTO `official_use` VALUES ('1215', '1256', '1', '1', '1', '1', 'AIS/09/129');
INSERT INTO `official_use` VALUES ('1216', '1257', '1', '1', '1', '1', 'AIS/09/159');
INSERT INTO `official_use` VALUES ('1217', '1258', '1', '1', '1', '1', 'AIS/09/214');
INSERT INTO `official_use` VALUES ('1218', '1259', '1', '1', '1', '1', 'AIS/10/2075');
INSERT INTO `official_use` VALUES ('1219', '1260', '1', '1', '1', '1', 'AIS/11/2124');
INSERT INTO `official_use` VALUES ('1220', '1261', '1', '1', '1', '1', 'AIS/11/2127');
INSERT INTO `official_use` VALUES ('1221', '1262', '1', '1', '1', '1', 'AIS/11/2250');
INSERT INTO `official_use` VALUES ('1222', '1263', '1', '1', '1', '1', 'AIS/11/2284');
INSERT INTO `official_use` VALUES ('1223', '1264', '1', '1', '1', '1', 'AIS/08/570');
INSERT INTO `official_use` VALUES ('1224', '1265', '1', '1', '1', '1', 'AIS/05/3020');
INSERT INTO `official_use` VALUES ('1225', '1266', '1', '1', '1', '1', 'AIS/09/155');
INSERT INTO `official_use` VALUES ('1226', '1267', '1', '1', '1', '1', 'AIS/10/2064');
INSERT INTO `official_use` VALUES ('1227', '1268', '1', '1', '1', '1', 'AIS/03/815');
INSERT INTO `official_use` VALUES ('1228', '1269', '1', '1', '1', '1', 'AIS/08/720');
INSERT INTO `official_use` VALUES ('1229', '1270', '1', '1', '1', '1', 'AIS/08/737');
INSERT INTO `official_use` VALUES ('1230', '1271', '1', '1', '1', '1', 'AIS/08/755');
INSERT INTO `official_use` VALUES ('1231', '1272', '1', '1', '1', '1', 'AIS/07/276');
INSERT INTO `official_use` VALUES ('1232', '1273', '1', '1', '1', '1', 'AIS/09/088');
INSERT INTO `official_use` VALUES ('1233', '1274', '1', '1', '1', '1', 'AIS/08/659');
INSERT INTO `official_use` VALUES ('1234', '1275', '1', '1', '1', '1', 'AIS/09/071');
INSERT INTO `official_use` VALUES ('1235', '1276', '1', '1', '1', '1', 'AIS/09/140');
INSERT INTO `official_use` VALUES ('1236', '1277', '1', '1', '1', '1', 'AIS/SS/10/04');
INSERT INTO `official_use` VALUES ('1237', '1278', '1', '1', '1', '1', 'AIS/10/3093');
INSERT INTO `official_use` VALUES ('1238', '1279', '1', '1', '1', '1', 'AIS/08/614');
INSERT INTO `official_use` VALUES ('1239', '1280', '1', '1', '1', '1', 'AIS/09/083');
INSERT INTO `official_use` VALUES ('1240', '1281', '1', '1', '1', '1', 'AIS/09/110');
INSERT INTO `official_use` VALUES ('1241', '1282', '1', '1', '1', '1', 'AIS/07/456');
INSERT INTO `official_use` VALUES ('1242', '1283', '1', '1', '1', '1', 'AIS/07/347');
INSERT INTO `official_use` VALUES ('1243', '1284', '1', '1', '1', '1', 'AIS/06/322');
INSERT INTO `official_use` VALUES ('1244', '1285', '1', '1', '1', '1', 'AIS/07/5180');
INSERT INTO `official_use` VALUES ('1245', '1286', '1', '1', '1', '1', 'AIS/08/586');
INSERT INTO `official_use` VALUES ('1246', '1287', '1', '1', '1', '1', 'AIS/09/020');
INSERT INTO `official_use` VALUES ('1247', '1288', '1', '1', '1', '1', 'AIS/09/023');
INSERT INTO `official_use` VALUES ('1248', '1289', '1', '1', '1', '1', 'AIS/09/074');
INSERT INTO `official_use` VALUES ('1249', '1290', '1', '1', '1', '1', 'AIS/11/103');
INSERT INTO `official_use` VALUES ('1250', '1291', '1', '1', '1', '1', 'AIS/11/2192');
INSERT INTO `official_use` VALUES ('1251', '1292', '1', '1', '1', '1', 'AIS/11/2195');
INSERT INTO `official_use` VALUES ('1252', '1293', '1', '1', '1', '1', 'AIS/09/141');
INSERT INTO `official_use` VALUES ('1253', '1294', '1', '1', '1', '1', 'AIS/04/327');
INSERT INTO `official_use` VALUES ('1254', '1295', '1', '1', '1', '1', 'AIS/10/3007');
INSERT INTO `official_use` VALUES ('1255', '1296', '1', '1', '1', '1', 'AIS/08/612');
INSERT INTO `official_use` VALUES ('1256', '1297', '1', '1', '1', '1', 'AIS/06/744');
INSERT INTO `official_use` VALUES ('1257', '1298', '1', '1', '1', '1', 'AIS/08/725');
INSERT INTO `official_use` VALUES ('1258', '1299', '1', '1', '1', '1', 'AIS/05/276');
INSERT INTO `official_use` VALUES ('1259', '1300', '1', '1', '1', '1', 'AIS/06/033');
INSERT INTO `official_use` VALUES ('1260', '1301', '1', '1', '1', '1', 'AIS/06/377');
INSERT INTO `official_use` VALUES ('1261', '1302', '1', '1', '1', '1', 'AIS/07/431');
INSERT INTO `official_use` VALUES ('1262', '1303', '1', '1', '1', '1', 'AIS/07/457');
INSERT INTO `official_use` VALUES ('1263', '1304', '1', '1', '1', '1', 'AIS/08/2024');
INSERT INTO `official_use` VALUES ('1264', '1305', '1', '1', '1', '1', 'AIS/08/587');
INSERT INTO `official_use` VALUES ('1265', '1306', '1', '1', '1', '1', 'AIS/08/654');
INSERT INTO `official_use` VALUES ('1266', '1307', '1', '1', '1', '1', 'AIS/08/706');
INSERT INTO `official_use` VALUES ('1267', '1308', '1', '1', '1', '1', 'AIS/08/715');
INSERT INTO `official_use` VALUES ('1268', '1309', '1', '1', '1', '1', 'AIS/08/758');
INSERT INTO `official_use` VALUES ('1269', '1310', '1', '1', '1', '1', 'AIS/09/009');
INSERT INTO `official_use` VALUES ('1270', '1311', '1', '1', '1', '1', 'AIS/09/014');
INSERT INTO `official_use` VALUES ('1271', '1312', '1', '1', '1', '1', 'AIS/09/057');
INSERT INTO `official_use` VALUES ('1272', '1313', '1', '1', '1', '1', 'AIS/09/067');
INSERT INTO `official_use` VALUES ('1273', '1314', '1', '1', '1', '1', 'AIS/09/073');
INSERT INTO `official_use` VALUES ('1274', '1315', '1', '1', '1', '1', 'AIS/09/143');
INSERT INTO `official_use` VALUES ('1275', '1316', '1', '1', '1', '1', 'AIS/10/2017');
INSERT INTO `official_use` VALUES ('1276', '1317', '1', '1', '1', '1', 'AIS/10/2030');
INSERT INTO `official_use` VALUES ('1277', '1318', '1', '1', '1', '1', 'AIS/10/2042');
INSERT INTO `official_use` VALUES ('1278', '1319', '1', '1', '1', '1', 'AIS/10/2051');
INSERT INTO `official_use` VALUES ('1279', '1320', '1', '1', '1', '1', 'AIS/10/2071');
INSERT INTO `official_use` VALUES ('1280', '1321', '1', '1', '1', '1', 'AIS/10/3026');
INSERT INTO `official_use` VALUES ('1281', '1322', '1', '1', '1', '1', 'AIS/10/3030');
INSERT INTO `official_use` VALUES ('1282', '1323', '1', '1', '1', '1', 'AIS/10/3077');
INSERT INTO `official_use` VALUES ('1283', '1324', '1', '1', '1', '1', 'AIS/11/2152');
INSERT INTO `official_use` VALUES ('1284', '1325', '1', '1', '1', '1', 'AIS/11/2165');
INSERT INTO `official_use` VALUES ('1285', '1326', '1', '1', '1', '1', 'AIS/11/2230');
INSERT INTO `official_use` VALUES ('1286', '1327', '1', '1', '1', '1', 'AIS/11/2237');
INSERT INTO `official_use` VALUES ('1287', '1328', '1', '1', '1', '1', 'AIS/11/2259');
INSERT INTO `official_use` VALUES ('1288', '1329', '1', '1', '1', '1', 'AIS/SS/11/04');
INSERT INTO `official_use` VALUES ('1289', '1330', '1', '1', '1', '1', 'AIS/SS/11/04');
INSERT INTO `official_use` VALUES ('1290', '1331', '1', '1', '1', '1', 'AIS/SS/11/05');
INSERT INTO `official_use` VALUES ('1291', '1332', '1', '1', '1', '1', 'AIS/08/563');
INSERT INTO `official_use` VALUES ('1292', '1333', '1', '1', '1', '1', 'AIS/10/3094');
INSERT INTO `official_use` VALUES ('1293', '1334', '1', '1', '1', '1', 'AIS/11/2186');
INSERT INTO `official_use` VALUES ('1294', '1335', '1', '1', '1', '1', 'AIS/09/2014');
INSERT INTO `official_use` VALUES ('1295', '1336', '1', '1', '1', '1', 'AIS/09/115');
INSERT INTO `official_use` VALUES ('1296', '1337', '1', '1', '1', '1', 'AIS/09/164');
INSERT INTO `official_use` VALUES ('1297', '1338', '1', '1', '1', '1', 'AIS/11/2315');
INSERT INTO `official_use` VALUES ('1298', '1339', '1', '1', '1', '1', 'AIS/11/2224');
INSERT INTO `official_use` VALUES ('1299', '1340', '1', '1', '1', '1', 'AIS/SS/11/08');
INSERT INTO `official_use` VALUES ('1300', '1341', '1', '1', '1', '1', 'AIS/10/2031');
INSERT INTO `official_use` VALUES ('1301', '1342', '1', '1', '1', '1', 'AIS/08/630');
INSERT INTO `official_use` VALUES ('1302', '1343', '1', '1', '1', '1', 'AIS/09/206');
INSERT INTO `official_use` VALUES ('1303', '1344', '1', '1', '1', '1', 'AIS/09/216');
INSERT INTO `official_use` VALUES ('1304', '1345', '1', '1', '1', '1', 'AIS/10/2027');
INSERT INTO `official_use` VALUES ('1305', '1346', '1', '1', '1', '1', 'AIS/07/124');
INSERT INTO `official_use` VALUES ('1306', '1347', '1', '1', '1', '1', 'AIS/09/012');
INSERT INTO `official_use` VALUES ('1307', '1348', '1', '1', '1', '1', 'AIS/08/803');

-- ----------------------------
-- Table structure for parental_information
-- ----------------------------
DROP TABLE IF EXISTS `parental_information`;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of parental_information
-- ----------------------------

-- ----------------------------
-- Table structure for payments
-- ----------------------------
DROP TABLE IF EXISTS `payments`;
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

-- ----------------------------
-- Records of payments
-- ----------------------------

-- ----------------------------
-- Table structure for payment_categories
-- ----------------------------
DROP TABLE IF EXISTS `payment_categories`;
CREATE TABLE `payment_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of payment_categories
-- ----------------------------
INSERT INTO `payment_categories` VALUES ('1', 'Tuition');
INSERT INTO `payment_categories` VALUES ('2', 'Medical');
INSERT INTO `payment_categories` VALUES ('3', 'Computer');
INSERT INTO `payment_categories` VALUES ('4', 'Library');
INSERT INTO `payment_categories` VALUES ('5', 'Examination');
INSERT INTO `payment_categories` VALUES ('6', 'Special Islamic Programme');
INSERT INTO `payment_categories` VALUES ('7', 'ICT Services');
INSERT INTO `payment_categories` VALUES ('8', 'E-Learning');
INSERT INTO `payment_categories` VALUES ('9', 'Graduation');
INSERT INTO `payment_categories` VALUES ('10', 'P.T.A');
INSERT INTO `payment_categories` VALUES ('11', 'Science/Art Practical Levy');
INSERT INTO `payment_categories` VALUES ('12', 'Prize-Giving Day Levy');
INSERT INTO `payment_categories` VALUES ('13', 'Textbooks');
INSERT INTO `payment_categories` VALUES ('14', 'Notebooks');
INSERT INTO `payment_categories` VALUES ('15', 'Development Fee');
INSERT INTO `payment_categories` VALUES ('16', 'Registration');
INSERT INTO `payment_categories` VALUES ('17', 'Uniform');
INSERT INTO `payment_categories` VALUES ('18', 'Sport Wear');
INSERT INTO `payment_categories` VALUES ('19', 'Student Booklet');
INSERT INTO `payment_categories` VALUES ('20', 'Sweater');
INSERT INTO `payment_categories` VALUES ('21', 'WAEC');
INSERT INTO `payment_categories` VALUES ('22', 'NECO');
INSERT INTO `payment_categories` VALUES ('23', 'JSCE');
INSERT INTO `payment_categories` VALUES ('24', 'Common Entrance');
INSERT INTO `payment_categories` VALUES ('25', 'Printing');
INSERT INTO `payment_categories` VALUES ('26', 'Cafeteria');
INSERT INTO `payment_categories` VALUES ('27', 'Quarter Fees');
INSERT INTO `payment_categories` VALUES ('28', 'Half Fees');
INSERT INTO `payment_categories` VALUES ('29', 'Full Fees');

-- ----------------------------
-- Table structure for pins
-- ----------------------------
DROP TABLE IF EXISTS `pins`;
CREATE TABLE `pins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pin_no` varchar(12) DEFAULT NULL,
  `usage_status` int(2) DEFAULT NULL,
  `issuance_status` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pins
-- ----------------------------
INSERT INTO `pins` VALUES ('1', '230779485127', '0', '0');
INSERT INTO `pins` VALUES ('2', '121567026073', '0', '0');
INSERT INTO `pins` VALUES ('3', '108015380130', '0', '0');
INSERT INTO `pins` VALUES ('4', '141201293637', '0', '0');
INSERT INTO `pins` VALUES ('5', '194586413821', '0', '0');
INSERT INTO `pins` VALUES ('6', '357420443205', '0', '0');
INSERT INTO `pins` VALUES ('7', '141120128813', '0', '0');
INSERT INTO `pins` VALUES ('8', '135610207019', '0', '0');
INSERT INTO `pins` VALUES ('9', '550032331121', '0', '0');
INSERT INTO `pins` VALUES ('10', '136737982056', '0', '0');
INSERT INTO `pins` VALUES ('11', '112276447113', '0', '0');
INSERT INTO `pins` VALUES ('12', '846477048222', '0', '0');
INSERT INTO `pins` VALUES ('13', '165021485145', '0', '0');
INSERT INTO `pins` VALUES ('14', '817366208154', '0', '0');
INSERT INTO `pins` VALUES ('15', '414110808198', '0', '0');

-- ----------------------------
-- Table structure for pin_payments
-- ----------------------------
DROP TABLE IF EXISTS `pin_payments`;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pin_payments
-- ----------------------------

-- ----------------------------
-- Table structure for questions_bank
-- ----------------------------
DROP TABLE IF EXISTS `questions_bank`;
CREATE TABLE `questions_bank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `class_id` int(11) NOT NULL DEFAULT '0',
  `subject_id` int(11) NOT NULL DEFAULT '0',
  `question_title` varchar(255) DEFAULT NULL,
  `question_file_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`user_id`,`class_id`,`subject_id`),
  KEY `fk_questions_bank_users1_idx` (`user_id`),
  KEY `fk_questions_bank_classes1_idx` (`class_id`),
  KEY `fk_questions_bank_subjects1_idx` (`subject_id`),
  CONSTRAINT `fk_questions_bank_classes1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_questions_bank_subjects1` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_questions_bank_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of questions_bank
-- ----------------------------

-- ----------------------------
-- Table structure for registered_subjects
-- ----------------------------
DROP TABLE IF EXISTS `registered_subjects`;
CREATE TABLE `registered_subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`subject_id`,`class_id`),
  KEY `fk_registered_subjects_subjects1_idx` (`subject_id`),
  KEY `fk_registered_subjects_classes1_idx` (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=413 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of registered_subjects
-- ----------------------------
INSERT INTO `registered_subjects` VALUES ('1', '1', '2');
INSERT INTO `registered_subjects` VALUES ('7', '1', '3');
INSERT INTO `registered_subjects` VALUES ('13', '1', '4');
INSERT INTO `registered_subjects` VALUES ('20', '1', '5');
INSERT INTO `registered_subjects` VALUES ('29', '1', '6');
INSERT INTO `registered_subjects` VALUES ('38', '1', '7');
INSERT INTO `registered_subjects` VALUES ('47', '1', '8');
INSERT INTO `registered_subjects` VALUES ('56', '1', '9');
INSERT INTO `registered_subjects` VALUES ('65', '1', '10');
INSERT INTO `registered_subjects` VALUES ('75', '1', '11');
INSERT INTO `registered_subjects` VALUES ('87', '1', '12');
INSERT INTO `registered_subjects` VALUES ('99', '1', '13');
INSERT INTO `registered_subjects` VALUES ('111', '1', '14');
INSERT INTO `registered_subjects` VALUES ('123', '1', '15');
INSERT INTO `registered_subjects` VALUES ('135', '1', '16');
INSERT INTO `registered_subjects` VALUES ('147', '1', '17');
INSERT INTO `registered_subjects` VALUES ('159', '1', '18');
INSERT INTO `registered_subjects` VALUES ('171', '1', '19');
INSERT INTO `registered_subjects` VALUES ('184', '1', '20');
INSERT INTO `registered_subjects` VALUES ('197', '1', '21');
INSERT INTO `registered_subjects` VALUES ('210', '1', '22');
INSERT INTO `registered_subjects` VALUES ('223', '1', '23');
INSERT INTO `registered_subjects` VALUES ('236', '1', '24');
INSERT INTO `registered_subjects` VALUES ('248', '1', '25');
INSERT INTO `registered_subjects` VALUES ('263', '1', '26');
INSERT INTO `registered_subjects` VALUES ('278', '1', '27');
INSERT INTO `registered_subjects` VALUES ('293', '1', '28');
INSERT INTO `registered_subjects` VALUES ('311', '1', '29');
INSERT INTO `registered_subjects` VALUES ('329', '1', '30');
INSERT INTO `registered_subjects` VALUES ('347', '1', '31');
INSERT INTO `registered_subjects` VALUES ('366', '1', '32');
INSERT INTO `registered_subjects` VALUES ('393', '1', '36');
INSERT INTO `registered_subjects` VALUES ('399', '1', '37');
INSERT INTO `registered_subjects` VALUES ('74', '2', '11');
INSERT INTO `registered_subjects` VALUES ('86', '2', '12');
INSERT INTO `registered_subjects` VALUES ('98', '2', '13');
INSERT INTO `registered_subjects` VALUES ('110', '2', '14');
INSERT INTO `registered_subjects` VALUES ('122', '2', '15');
INSERT INTO `registered_subjects` VALUES ('134', '2', '16');
INSERT INTO `registered_subjects` VALUES ('146', '2', '17');
INSERT INTO `registered_subjects` VALUES ('158', '2', '18');
INSERT INTO `registered_subjects` VALUES ('294', '2', '28');
INSERT INTO `registered_subjects` VALUES ('312', '2', '29');
INSERT INTO `registered_subjects` VALUES ('330', '2', '30');
INSERT INTO `registered_subjects` VALUES ('348', '2', '31');
INSERT INTO `registered_subjects` VALUES ('367', '2', '32');
INSERT INTO `registered_subjects` VALUES ('389', '2', '36');
INSERT INTO `registered_subjects` VALUES ('400', '2', '37');
INSERT INTO `registered_subjects` VALUES ('388', '3', '36');
INSERT INTO `registered_subjects` VALUES ('390', '4', '36');
INSERT INTO `registered_subjects` VALUES ('391', '5', '36');
INSERT INTO `registered_subjects` VALUES ('2', '6', '2');
INSERT INTO `registered_subjects` VALUES ('8', '6', '3');
INSERT INTO `registered_subjects` VALUES ('14', '6', '4');
INSERT INTO `registered_subjects` VALUES ('21', '6', '5');
INSERT INTO `registered_subjects` VALUES ('30', '6', '6');
INSERT INTO `registered_subjects` VALUES ('39', '6', '7');
INSERT INTO `registered_subjects` VALUES ('48', '6', '8');
INSERT INTO `registered_subjects` VALUES ('57', '6', '9');
INSERT INTO `registered_subjects` VALUES ('66', '6', '10');
INSERT INTO `registered_subjects` VALUES ('76', '6', '11');
INSERT INTO `registered_subjects` VALUES ('88', '6', '12');
INSERT INTO `registered_subjects` VALUES ('100', '6', '13');
INSERT INTO `registered_subjects` VALUES ('112', '6', '14');
INSERT INTO `registered_subjects` VALUES ('124', '6', '15');
INSERT INTO `registered_subjects` VALUES ('136', '6', '16');
INSERT INTO `registered_subjects` VALUES ('148', '6', '17');
INSERT INTO `registered_subjects` VALUES ('160', '6', '18');
INSERT INTO `registered_subjects` VALUES ('172', '6', '19');
INSERT INTO `registered_subjects` VALUES ('185', '6', '20');
INSERT INTO `registered_subjects` VALUES ('198', '6', '21');
INSERT INTO `registered_subjects` VALUES ('211', '6', '22');
INSERT INTO `registered_subjects` VALUES ('224', '6', '23');
INSERT INTO `registered_subjects` VALUES ('237', '6', '24');
INSERT INTO `registered_subjects` VALUES ('3', '7', '2');
INSERT INTO `registered_subjects` VALUES ('9', '7', '3');
INSERT INTO `registered_subjects` VALUES ('15', '7', '4');
INSERT INTO `registered_subjects` VALUES ('22', '7', '5');
INSERT INTO `registered_subjects` VALUES ('31', '7', '6');
INSERT INTO `registered_subjects` VALUES ('40', '7', '7');
INSERT INTO `registered_subjects` VALUES ('49', '7', '8');
INSERT INTO `registered_subjects` VALUES ('58', '7', '9');
INSERT INTO `registered_subjects` VALUES ('67', '7', '10');
INSERT INTO `registered_subjects` VALUES ('4', '8', '2');
INSERT INTO `registered_subjects` VALUES ('10', '8', '3');
INSERT INTO `registered_subjects` VALUES ('16', '8', '4');
INSERT INTO `registered_subjects` VALUES ('23', '8', '5');
INSERT INTO `registered_subjects` VALUES ('32', '8', '6');
INSERT INTO `registered_subjects` VALUES ('41', '8', '7');
INSERT INTO `registered_subjects` VALUES ('50', '8', '8');
INSERT INTO `registered_subjects` VALUES ('59', '8', '9');
INSERT INTO `registered_subjects` VALUES ('68', '8', '10');
INSERT INTO `registered_subjects` VALUES ('5', '9', '2');
INSERT INTO `registered_subjects` VALUES ('11', '9', '3');
INSERT INTO `registered_subjects` VALUES ('17', '9', '4');
INSERT INTO `registered_subjects` VALUES ('24', '9', '5');
INSERT INTO `registered_subjects` VALUES ('33', '9', '6');
INSERT INTO `registered_subjects` VALUES ('42', '9', '7');
INSERT INTO `registered_subjects` VALUES ('51', '9', '8');
INSERT INTO `registered_subjects` VALUES ('60', '9', '9');
INSERT INTO `registered_subjects` VALUES ('69', '9', '10');
INSERT INTO `registered_subjects` VALUES ('83', '9', '11');
INSERT INTO `registered_subjects` VALUES ('95', '9', '12');
INSERT INTO `registered_subjects` VALUES ('107', '9', '13');
INSERT INTO `registered_subjects` VALUES ('118', '9', '14');
INSERT INTO `registered_subjects` VALUES ('130', '9', '15');
INSERT INTO `registered_subjects` VALUES ('142', '9', '16');
INSERT INTO `registered_subjects` VALUES ('154', '9', '17');
INSERT INTO `registered_subjects` VALUES ('166', '9', '18');
INSERT INTO `registered_subjects` VALUES ('177', '9', '19');
INSERT INTO `registered_subjects` VALUES ('190', '9', '20');
INSERT INTO `registered_subjects` VALUES ('203', '9', '21');
INSERT INTO `registered_subjects` VALUES ('216', '9', '22');
INSERT INTO `registered_subjects` VALUES ('229', '9', '23');
INSERT INTO `registered_subjects` VALUES ('242', '9', '24');
INSERT INTO `registered_subjects` VALUES ('255', '9', '25');
INSERT INTO `registered_subjects` VALUES ('270', '9', '26');
INSERT INTO `registered_subjects` VALUES ('285', '9', '27');
INSERT INTO `registered_subjects` VALUES ('303', '9', '28');
INSERT INTO `registered_subjects` VALUES ('321', '9', '29');
INSERT INTO `registered_subjects` VALUES ('339', '9', '30');
INSERT INTO `registered_subjects` VALUES ('357', '9', '31');
INSERT INTO `registered_subjects` VALUES ('376', '9', '32');
INSERT INTO `registered_subjects` VALUES ('387', '9', '36');
INSERT INTO `registered_subjects` VALUES ('407', '9', '37');
INSERT INTO `registered_subjects` VALUES ('6', '10', '2');
INSERT INTO `registered_subjects` VALUES ('12', '10', '3');
INSERT INTO `registered_subjects` VALUES ('18', '10', '4');
INSERT INTO `registered_subjects` VALUES ('25', '10', '5');
INSERT INTO `registered_subjects` VALUES ('34', '10', '6');
INSERT INTO `registered_subjects` VALUES ('43', '10', '7');
INSERT INTO `registered_subjects` VALUES ('52', '10', '8');
INSERT INTO `registered_subjects` VALUES ('61', '10', '9');
INSERT INTO `registered_subjects` VALUES ('70', '10', '10');
INSERT INTO `registered_subjects` VALUES ('84', '10', '11');
INSERT INTO `registered_subjects` VALUES ('96', '10', '12');
INSERT INTO `registered_subjects` VALUES ('108', '10', '13');
INSERT INTO `registered_subjects` VALUES ('119', '10', '14');
INSERT INTO `registered_subjects` VALUES ('131', '10', '15');
INSERT INTO `registered_subjects` VALUES ('143', '10', '16');
INSERT INTO `registered_subjects` VALUES ('155', '10', '17');
INSERT INTO `registered_subjects` VALUES ('167', '10', '18');
INSERT INTO `registered_subjects` VALUES ('178', '10', '19');
INSERT INTO `registered_subjects` VALUES ('191', '10', '20');
INSERT INTO `registered_subjects` VALUES ('204', '10', '21');
INSERT INTO `registered_subjects` VALUES ('217', '10', '22');
INSERT INTO `registered_subjects` VALUES ('230', '10', '23');
INSERT INTO `registered_subjects` VALUES ('243', '10', '24');
INSERT INTO `registered_subjects` VALUES ('256', '10', '25');
INSERT INTO `registered_subjects` VALUES ('271', '10', '26');
INSERT INTO `registered_subjects` VALUES ('286', '10', '27');
INSERT INTO `registered_subjects` VALUES ('304', '10', '28');
INSERT INTO `registered_subjects` VALUES ('322', '10', '29');
INSERT INTO `registered_subjects` VALUES ('340', '10', '30');
INSERT INTO `registered_subjects` VALUES ('358', '10', '31');
INSERT INTO `registered_subjects` VALUES ('377', '10', '32');
INSERT INTO `registered_subjects` VALUES ('384', '10', '36');
INSERT INTO `registered_subjects` VALUES ('410', '10', '37');
INSERT INTO `registered_subjects` VALUES ('19', '11', '5');
INSERT INTO `registered_subjects` VALUES ('28', '11', '6');
INSERT INTO `registered_subjects` VALUES ('37', '11', '7');
INSERT INTO `registered_subjects` VALUES ('46', '11', '8');
INSERT INTO `registered_subjects` VALUES ('55', '11', '9');
INSERT INTO `registered_subjects` VALUES ('64', '11', '10');
INSERT INTO `registered_subjects` VALUES ('73', '11', '11');
INSERT INTO `registered_subjects` VALUES ('85', '11', '12');
INSERT INTO `registered_subjects` VALUES ('97', '11', '13');
INSERT INTO `registered_subjects` VALUES ('109', '11', '14');
INSERT INTO `registered_subjects` VALUES ('121', '11', '15');
INSERT INTO `registered_subjects` VALUES ('133', '11', '16');
INSERT INTO `registered_subjects` VALUES ('145', '11', '17');
INSERT INTO `registered_subjects` VALUES ('157', '11', '18');
INSERT INTO `registered_subjects` VALUES ('169', '11', '19');
INSERT INTO `registered_subjects` VALUES ('182', '11', '20');
INSERT INTO `registered_subjects` VALUES ('195', '11', '21');
INSERT INTO `registered_subjects` VALUES ('208', '11', '22');
INSERT INTO `registered_subjects` VALUES ('221', '11', '23');
INSERT INTO `registered_subjects` VALUES ('234', '11', '24');
INSERT INTO `registered_subjects` VALUES ('247', '11', '25');
INSERT INTO `registered_subjects` VALUES ('262', '11', '26');
INSERT INTO `registered_subjects` VALUES ('277', '11', '27');
INSERT INTO `registered_subjects` VALUES ('292', '11', '28');
INSERT INTO `registered_subjects` VALUES ('310', '11', '29');
INSERT INTO `registered_subjects` VALUES ('328', '11', '30');
INSERT INTO `registered_subjects` VALUES ('346', '11', '31');
INSERT INTO `registered_subjects` VALUES ('365', '11', '32');
INSERT INTO `registered_subjects` VALUES ('394', '11', '36');
INSERT INTO `registered_subjects` VALUES ('397', '11', '37');
INSERT INTO `registered_subjects` VALUES ('27', '12', '5');
INSERT INTO `registered_subjects` VALUES ('36', '12', '6');
INSERT INTO `registered_subjects` VALUES ('45', '12', '7');
INSERT INTO `registered_subjects` VALUES ('54', '12', '8');
INSERT INTO `registered_subjects` VALUES ('63', '12', '9');
INSERT INTO `registered_subjects` VALUES ('72', '12', '10');
INSERT INTO `registered_subjects` VALUES ('77', '13', '11');
INSERT INTO `registered_subjects` VALUES ('89', '13', '12');
INSERT INTO `registered_subjects` VALUES ('101', '13', '13');
INSERT INTO `registered_subjects` VALUES ('113', '13', '14');
INSERT INTO `registered_subjects` VALUES ('125', '13', '15');
INSERT INTO `registered_subjects` VALUES ('137', '13', '16');
INSERT INTO `registered_subjects` VALUES ('149', '13', '17');
INSERT INTO `registered_subjects` VALUES ('161', '13', '18');
INSERT INTO `registered_subjects` VALUES ('78', '14', '11');
INSERT INTO `registered_subjects` VALUES ('90', '14', '12');
INSERT INTO `registered_subjects` VALUES ('102', '14', '13');
INSERT INTO `registered_subjects` VALUES ('179', '14', '19');
INSERT INTO `registered_subjects` VALUES ('192', '14', '20');
INSERT INTO `registered_subjects` VALUES ('205', '14', '21');
INSERT INTO `registered_subjects` VALUES ('218', '14', '22');
INSERT INTO `registered_subjects` VALUES ('231', '14', '23');
INSERT INTO `registered_subjects` VALUES ('244', '14', '24');
INSERT INTO `registered_subjects` VALUES ('79', '15', '11');
INSERT INTO `registered_subjects` VALUES ('91', '15', '12');
INSERT INTO `registered_subjects` VALUES ('103', '15', '13');
INSERT INTO `registered_subjects` VALUES ('114', '15', '14');
INSERT INTO `registered_subjects` VALUES ('126', '15', '15');
INSERT INTO `registered_subjects` VALUES ('138', '15', '16');
INSERT INTO `registered_subjects` VALUES ('150', '15', '17');
INSERT INTO `registered_subjects` VALUES ('162', '15', '18');
INSERT INTO `registered_subjects` VALUES ('173', '15', '19');
INSERT INTO `registered_subjects` VALUES ('186', '15', '20');
INSERT INTO `registered_subjects` VALUES ('199', '15', '21');
INSERT INTO `registered_subjects` VALUES ('212', '15', '22');
INSERT INTO `registered_subjects` VALUES ('225', '15', '23');
INSERT INTO `registered_subjects` VALUES ('238', '15', '24');
INSERT INTO `registered_subjects` VALUES ('252', '15', '25');
INSERT INTO `registered_subjects` VALUES ('267', '15', '26');
INSERT INTO `registered_subjects` VALUES ('282', '15', '27');
INSERT INTO `registered_subjects` VALUES ('300', '15', '28');
INSERT INTO `registered_subjects` VALUES ('318', '15', '29');
INSERT INTO `registered_subjects` VALUES ('336', '15', '30');
INSERT INTO `registered_subjects` VALUES ('354', '15', '31');
INSERT INTO `registered_subjects` VALUES ('373', '15', '32');
INSERT INTO `registered_subjects` VALUES ('403', '15', '37');
INSERT INTO `registered_subjects` VALUES ('26', '16', '5');
INSERT INTO `registered_subjects` VALUES ('35', '16', '6');
INSERT INTO `registered_subjects` VALUES ('44', '16', '7');
INSERT INTO `registered_subjects` VALUES ('53', '16', '8');
INSERT INTO `registered_subjects` VALUES ('62', '16', '9');
INSERT INTO `registered_subjects` VALUES ('71', '16', '10');
INSERT INTO `registered_subjects` VALUES ('80', '16', '11');
INSERT INTO `registered_subjects` VALUES ('92', '16', '12');
INSERT INTO `registered_subjects` VALUES ('104', '16', '13');
INSERT INTO `registered_subjects` VALUES ('115', '16', '14');
INSERT INTO `registered_subjects` VALUES ('127', '16', '15');
INSERT INTO `registered_subjects` VALUES ('139', '16', '16');
INSERT INTO `registered_subjects` VALUES ('151', '16', '17');
INSERT INTO `registered_subjects` VALUES ('163', '16', '18');
INSERT INTO `registered_subjects` VALUES ('174', '16', '19');
INSERT INTO `registered_subjects` VALUES ('187', '16', '20');
INSERT INTO `registered_subjects` VALUES ('200', '16', '21');
INSERT INTO `registered_subjects` VALUES ('213', '16', '22');
INSERT INTO `registered_subjects` VALUES ('226', '16', '23');
INSERT INTO `registered_subjects` VALUES ('239', '16', '24');
INSERT INTO `registered_subjects` VALUES ('257', '16', '25');
INSERT INTO `registered_subjects` VALUES ('272', '16', '26');
INSERT INTO `registered_subjects` VALUES ('287', '16', '27');
INSERT INTO `registered_subjects` VALUES ('305', '16', '28');
INSERT INTO `registered_subjects` VALUES ('323', '16', '29');
INSERT INTO `registered_subjects` VALUES ('341', '16', '30');
INSERT INTO `registered_subjects` VALUES ('359', '16', '31');
INSERT INTO `registered_subjects` VALUES ('378', '16', '32');
INSERT INTO `registered_subjects` VALUES ('81', '17', '11');
INSERT INTO `registered_subjects` VALUES ('93', '17', '12');
INSERT INTO `registered_subjects` VALUES ('105', '17', '13');
INSERT INTO `registered_subjects` VALUES ('116', '17', '14');
INSERT INTO `registered_subjects` VALUES ('128', '17', '15');
INSERT INTO `registered_subjects` VALUES ('140', '17', '16');
INSERT INTO `registered_subjects` VALUES ('152', '17', '17');
INSERT INTO `registered_subjects` VALUES ('164', '17', '18');
INSERT INTO `registered_subjects` VALUES ('175', '17', '19');
INSERT INTO `registered_subjects` VALUES ('188', '17', '20');
INSERT INTO `registered_subjects` VALUES ('201', '17', '21');
INSERT INTO `registered_subjects` VALUES ('214', '17', '22');
INSERT INTO `registered_subjects` VALUES ('227', '17', '23');
INSERT INTO `registered_subjects` VALUES ('240', '17', '24');
INSERT INTO `registered_subjects` VALUES ('253', '17', '25');
INSERT INTO `registered_subjects` VALUES ('268', '17', '26');
INSERT INTO `registered_subjects` VALUES ('283', '17', '27');
INSERT INTO `registered_subjects` VALUES ('301', '17', '28');
INSERT INTO `registered_subjects` VALUES ('319', '17', '29');
INSERT INTO `registered_subjects` VALUES ('337', '17', '30');
INSERT INTO `registered_subjects` VALUES ('82', '18', '11');
INSERT INTO `registered_subjects` VALUES ('94', '18', '12');
INSERT INTO `registered_subjects` VALUES ('106', '18', '13');
INSERT INTO `registered_subjects` VALUES ('117', '18', '14');
INSERT INTO `registered_subjects` VALUES ('129', '18', '15');
INSERT INTO `registered_subjects` VALUES ('141', '18', '16');
INSERT INTO `registered_subjects` VALUES ('153', '18', '17');
INSERT INTO `registered_subjects` VALUES ('165', '18', '18');
INSERT INTO `registered_subjects` VALUES ('176', '18', '19');
INSERT INTO `registered_subjects` VALUES ('189', '18', '20');
INSERT INTO `registered_subjects` VALUES ('202', '18', '21');
INSERT INTO `registered_subjects` VALUES ('215', '18', '22');
INSERT INTO `registered_subjects` VALUES ('228', '18', '23');
INSERT INTO `registered_subjects` VALUES ('241', '18', '24');
INSERT INTO `registered_subjects` VALUES ('254', '18', '25');
INSERT INTO `registered_subjects` VALUES ('269', '18', '26');
INSERT INTO `registered_subjects` VALUES ('284', '18', '27');
INSERT INTO `registered_subjects` VALUES ('302', '18', '28');
INSERT INTO `registered_subjects` VALUES ('320', '18', '29');
INSERT INTO `registered_subjects` VALUES ('338', '18', '30');
INSERT INTO `registered_subjects` VALUES ('356', '18', '31');
INSERT INTO `registered_subjects` VALUES ('375', '18', '32');
INSERT INTO `registered_subjects` VALUES ('120', '19', '14');
INSERT INTO `registered_subjects` VALUES ('132', '19', '15');
INSERT INTO `registered_subjects` VALUES ('144', '19', '16');
INSERT INTO `registered_subjects` VALUES ('156', '19', '17');
INSERT INTO `registered_subjects` VALUES ('168', '19', '18');
INSERT INTO `registered_subjects` VALUES ('299', '19', '28');
INSERT INTO `registered_subjects` VALUES ('317', '19', '29');
INSERT INTO `registered_subjects` VALUES ('335', '19', '30');
INSERT INTO `registered_subjects` VALUES ('353', '19', '31');
INSERT INTO `registered_subjects` VALUES ('372', '19', '32');
INSERT INTO `registered_subjects` VALUES ('392', '19', '36');
INSERT INTO `registered_subjects` VALUES ('409', '19', '37');
INSERT INTO `registered_subjects` VALUES ('180', '20', '19');
INSERT INTO `registered_subjects` VALUES ('193', '20', '20');
INSERT INTO `registered_subjects` VALUES ('206', '20', '21');
INSERT INTO `registered_subjects` VALUES ('219', '20', '22');
INSERT INTO `registered_subjects` VALUES ('232', '20', '23');
INSERT INTO `registered_subjects` VALUES ('245', '20', '24');
INSERT INTO `registered_subjects` VALUES ('258', '20', '25');
INSERT INTO `registered_subjects` VALUES ('273', '20', '26');
INSERT INTO `registered_subjects` VALUES ('288', '20', '27');
INSERT INTO `registered_subjects` VALUES ('306', '20', '28');
INSERT INTO `registered_subjects` VALUES ('324', '20', '29');
INSERT INTO `registered_subjects` VALUES ('342', '20', '30');
INSERT INTO `registered_subjects` VALUES ('360', '20', '31');
INSERT INTO `registered_subjects` VALUES ('379', '20', '32');
INSERT INTO `registered_subjects` VALUES ('385', '20', '36');
INSERT INTO `registered_subjects` VALUES ('411', '20', '37');
INSERT INTO `registered_subjects` VALUES ('181', '21', '19');
INSERT INTO `registered_subjects` VALUES ('194', '21', '20');
INSERT INTO `registered_subjects` VALUES ('207', '21', '21');
INSERT INTO `registered_subjects` VALUES ('220', '21', '22');
INSERT INTO `registered_subjects` VALUES ('233', '21', '23');
INSERT INTO `registered_subjects` VALUES ('246', '21', '24');
INSERT INTO `registered_subjects` VALUES ('170', '22', '19');
INSERT INTO `registered_subjects` VALUES ('183', '22', '20');
INSERT INTO `registered_subjects` VALUES ('196', '22', '21');
INSERT INTO `registered_subjects` VALUES ('209', '22', '22');
INSERT INTO `registered_subjects` VALUES ('222', '22', '23');
INSERT INTO `registered_subjects` VALUES ('235', '22', '24');
INSERT INTO `registered_subjects` VALUES ('296', '22', '28');
INSERT INTO `registered_subjects` VALUES ('314', '22', '29');
INSERT INTO `registered_subjects` VALUES ('332', '22', '30');
INSERT INTO `registered_subjects` VALUES ('350', '22', '31');
INSERT INTO `registered_subjects` VALUES ('369', '22', '32');
INSERT INTO `registered_subjects` VALUES ('402', '22', '37');
INSERT INTO `registered_subjects` VALUES ('249', '23', '25');
INSERT INTO `registered_subjects` VALUES ('264', '23', '26');
INSERT INTO `registered_subjects` VALUES ('279', '23', '27');
INSERT INTO `registered_subjects` VALUES ('250', '24', '25');
INSERT INTO `registered_subjects` VALUES ('265', '24', '26');
INSERT INTO `registered_subjects` VALUES ('280', '24', '27');
INSERT INTO `registered_subjects` VALUES ('298', '24', '28');
INSERT INTO `registered_subjects` VALUES ('316', '24', '29');
INSERT INTO `registered_subjects` VALUES ('334', '24', '30');
INSERT INTO `registered_subjects` VALUES ('352', '24', '31');
INSERT INTO `registered_subjects` VALUES ('371', '24', '32');
INSERT INTO `registered_subjects` VALUES ('251', '25', '25');
INSERT INTO `registered_subjects` VALUES ('266', '25', '26');
INSERT INTO `registered_subjects` VALUES ('281', '25', '27');
INSERT INTO `registered_subjects` VALUES ('297', '25', '28');
INSERT INTO `registered_subjects` VALUES ('315', '25', '29');
INSERT INTO `registered_subjects` VALUES ('333', '25', '30');
INSERT INTO `registered_subjects` VALUES ('351', '25', '31');
INSERT INTO `registered_subjects` VALUES ('370', '25', '32');
INSERT INTO `registered_subjects` VALUES ('259', '26', '25');
INSERT INTO `registered_subjects` VALUES ('274', '26', '26');
INSERT INTO `registered_subjects` VALUES ('289', '26', '27');
INSERT INTO `registered_subjects` VALUES ('307', '26', '28');
INSERT INTO `registered_subjects` VALUES ('325', '26', '29');
INSERT INTO `registered_subjects` VALUES ('343', '26', '30');
INSERT INTO `registered_subjects` VALUES ('361', '26', '31');
INSERT INTO `registered_subjects` VALUES ('380', '26', '32');
INSERT INTO `registered_subjects` VALUES ('260', '27', '25');
INSERT INTO `registered_subjects` VALUES ('275', '27', '26');
INSERT INTO `registered_subjects` VALUES ('290', '27', '27');
INSERT INTO `registered_subjects` VALUES ('308', '27', '28');
INSERT INTO `registered_subjects` VALUES ('326', '27', '29');
INSERT INTO `registered_subjects` VALUES ('344', '27', '30');
INSERT INTO `registered_subjects` VALUES ('349', '27', '31');
INSERT INTO `registered_subjects` VALUES ('362', '27', '31');
INSERT INTO `registered_subjects` VALUES ('368', '27', '32');
INSERT INTO `registered_subjects` VALUES ('381', '27', '32');
INSERT INTO `registered_subjects` VALUES ('261', '28', '25');
INSERT INTO `registered_subjects` VALUES ('276', '28', '26');
INSERT INTO `registered_subjects` VALUES ('291', '28', '27');
INSERT INTO `registered_subjects` VALUES ('309', '28', '28');
INSERT INTO `registered_subjects` VALUES ('327', '28', '29');
INSERT INTO `registered_subjects` VALUES ('345', '28', '30');
INSERT INTO `registered_subjects` VALUES ('363', '28', '31');
INSERT INTO `registered_subjects` VALUES ('382', '28', '32');
INSERT INTO `registered_subjects` VALUES ('364', '29', '31');
INSERT INTO `registered_subjects` VALUES ('383', '29', '32');
INSERT INTO `registered_subjects` VALUES ('395', '29', '36');
INSERT INTO `registered_subjects` VALUES ('386', '30', '36');
INSERT INTO `registered_subjects` VALUES ('406', '30', '37');
INSERT INTO `registered_subjects` VALUES ('396', '31', '36');
INSERT INTO `registered_subjects` VALUES ('398', '32', '37');
INSERT INTO `registered_subjects` VALUES ('401', '33', '37');
INSERT INTO `registered_subjects` VALUES ('295', '34', '28');
INSERT INTO `registered_subjects` VALUES ('313', '34', '29');
INSERT INTO `registered_subjects` VALUES ('331', '34', '30');
INSERT INTO `registered_subjects` VALUES ('404', '34', '37');
INSERT INTO `registered_subjects` VALUES ('405', '35', '37');
INSERT INTO `registered_subjects` VALUES ('408', '36', '37');
INSERT INTO `registered_subjects` VALUES ('412', '37', '37');
INSERT INTO `registered_subjects` VALUES ('355', '38', '31');
INSERT INTO `registered_subjects` VALUES ('374', '38', '32');

-- ----------------------------
-- Table structure for religions
-- ----------------------------
DROP TABLE IF EXISTS `religions`;
CREATE TABLE `religions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `religion_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of religions
-- ----------------------------
INSERT INTO `religions` VALUES ('1', 'Islam');
INSERT INTO `religions` VALUES ('2', 'Other');

-- ----------------------------
-- Table structure for results
-- ----------------------------
DROP TABLE IF EXISTS `results`;
CREATE TABLE `results` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admission_no` varchar(12) DEFAULT NULL,
  `score` float DEFAULT NULL,
  `assessment_type_id` int(11) NOT NULL DEFAULT '0',
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
  CONSTRAINT `fk_results_assessment_types1` FOREIGN KEY (`assessment_type_id`) REFERENCES `assessment_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of results
-- ----------------------------

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('1', 'Student');
INSERT INTO `roles` VALUES ('2', 'Teacher');
INSERT INTO `roles` VALUES ('3', 'Accountant');
INSERT INTO `roles` VALUES ('4', 'Ecommerce');
INSERT INTO `roles` VALUES ('5', 'Administrator');

-- ----------------------------
-- Table structure for salaries
-- ----------------------------
DROP TABLE IF EXISTS `salaries`;
CREATE TABLE `salaries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `basic_monthly_salary` float DEFAULT NULL,
  `bonus` float DEFAULT NULL,
  `staff_id` int(11) NOT NULL DEFAULT '0',
  `payment_date` date DEFAULT NULL,
  PRIMARY KEY (`id`,`staff_id`),
  KEY `fk_salaries_staff_records1_idx` (`staff_id`),
  CONSTRAINT `fk_salaries_staff_records1` FOREIGN KEY (`staff_id`) REFERENCES `staff_records` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of salaries
-- ----------------------------
INSERT INTO `salaries` VALUES ('2', '20000', '0', '1', '2013-09-07');

-- ----------------------------
-- Table structure for schedule_of_fees
-- ----------------------------
DROP TABLE IF EXISTS `schedule_of_fees`;
CREATE TABLE `schedule_of_fees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_category_id` int(11) NOT NULL DEFAULT '0',
  `amount` float DEFAULT NULL,
  `class_id` int(11) NOT NULL,
  `term_id` int(11) NOT NULL,
  `recurring_payment` int(2) NOT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`,`payment_category_id`,`class_id`,`term_id`),
  KEY `fk_schedule_of_fees_payment_categories1_idx` (`payment_category_id`),
  KEY `fk_schedule_of_fees_classes1_idx` (`class_id`),
  KEY `fk_schedule_of_fees_terms1_idx` (`term_id`),
  CONSTRAINT `fk_schedule_of_fees_payment_categories1` FOREIGN KEY (`payment_category_id`) REFERENCES `payment_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1690 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of schedule_of_fees
-- ----------------------------
INSERT INTO `schedule_of_fees` VALUES ('1', '1', '45000', '1', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('2', '16', '2500', '1', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('3', '2', '1000', '1', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('4', '13', '4000', '1', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('5', '14', '1000', '1', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('6', '5', '500', '1', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('7', '17', '8000', '1', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('8', '18', '2200', '1', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('9', '20', '2000', '1', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('10', '7', '2000', '1', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('11', '15', '3000', '1', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('12', '10', '500', '1', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('13', '19', '500', '1', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('14', '1', '53000', '2', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('15', '16', '2500', '2', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('16', '2', '1000', '2', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('17', '13', '7000', '2', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('18', '14', '3000', '2', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('19', '5', '2000', '2', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('20', '17', '9000', '2', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('21', '18', '2500', '2', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('22', '20', '2200', '2', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('23', '7', '2000', '2', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('24', '15', '3000', '2', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('25', '10', '500', '2', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('26', '19', '500', '2', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('27', '1', '53000', '3', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('28', '16', '2500', '3', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('29', '2', '1000', '3', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('30', '13', '7000', '3', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('31', '14', '3000', '3', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('32', '5', '2000', '3', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('33', '17', '9000', '3', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('34', '18', '2500', '3', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('35', '20', '2200', '3', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('36', '7', '2000', '3', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('37', '15', '3000', '3', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('38', '10', '500', '3', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('39', '19', '500', '3', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('40', '1', '53000', '4', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('41', '16', '2500', '4', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('42', '2', '1000', '4', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('43', '13', '7000', '4', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('44', '14', '3000', '4', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('45', '5', '2000', '4', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('46', '17', '9000', '4', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('47', '18', '2500', '4', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('48', '20', '2200', '4', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('49', '7', '2000', '4', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('50', '15', '3000', '4', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('51', '10', '500', '4', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('52', '19', '500', '4', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('53', '1', '53000', '5', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('54', '16', '2500', '5', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('55', '2', '1000', '5', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('56', '13', '7000', '5', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('57', '14', '3000', '5', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('58', '5', '2000', '5', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('59', '17', '9000', '5', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('60', '18', '2500', '5', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('61', '20', '2200', '5', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('62', '7', '2000', '5', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('63', '15', '3000', '5', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('64', '10', '500', '5', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('65', '19', '500', '5', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('66', '1', '53000', '6', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('67', '16', '2500', '6', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('68', '2', '1000', '6', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('69', '13', '7000', '6', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('70', '14', '3000', '6', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('71', '5', '2000', '6', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('72', '17', '9000', '6', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('73', '18', '2500', '6', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('74', '20', '2200', '6', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('75', '7', '2000', '6', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('76', '15', '3000', '6', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('77', '10', '500', '6', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('78', '19', '500', '6', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('79', '1', '53000', '7', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('80', '16', '2500', '7', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('81', '2', '1000', '7', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('82', '13', '7000', '7', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('83', '14', '3000', '7', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('84', '5', '2000', '7', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('85', '17', '9000', '7', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('86', '18', '2500', '7', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('87', '20', '2200', '7', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('88', '7', '2000', '7', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('89', '15', '3000', '7', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('90', '10', '500', '7', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('91', '19', '500', '7', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('92', '1', '53000', '8', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('93', '16', '2500', '8', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('94', '2', '1000', '8', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('95', '13', '8000', '8', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('96', '14', '3000', '8', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('97', '5', '2000', '8', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('98', '17', '9000', '8', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('99', '18', '2500', '8', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('100', '20', '2200', '8', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('101', '7', '2000', '8', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('102', '15', '3000', '8', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('103', '10', '500', '8', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('104', '19', '500', '8', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('105', '1', '53000', '9', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('106', '16', '2500', '9', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('107', '2', '1000', '9', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('108', '13', '8000', '9', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('109', '14', '3000', '9', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('110', '5', '2000', '9', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('111', '17', '9000', '9', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('112', '18', '2500', '9', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('113', '20', '2200', '9', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('114', '7', '2000', '9', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('115', '15', '3000', '9', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('116', '10', '500', '9', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('117', '19', '500', '9', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('118', '1', '53000', '10', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('119', '16', '2500', '10', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('120', '2', '1000', '10', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('121', '13', '8000', '10', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('122', '14', '3000', '10', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('123', '5', '2000', '10', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('124', '17', '9000', '10', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('125', '18', '2500', '10', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('126', '20', '2200', '10', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('127', '7', '2000', '10', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('128', '15', '3000', '10', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('129', '10', '500', '10', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('130', '19', '500', '10', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('131', '1', '55000', '11', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('132', '16', '3000', '11', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('133', '2', '1000', '11', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('134', '13', '14000', '11', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('135', '14', '4500', '11', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('136', '5', '2000', '11', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('137', '17', '12300', '11', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('138', '18', '2800', '11', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('139', '20', '2500', '11', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('140', '7', '2000', '11', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('141', '15', '3500', '11', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('142', '10', '500', '11', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('143', '19', '500', '11', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('144', '3', '1000', '11', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('145', '4', '500', '11', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('146', '6', '8000', '11', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('147', '1', '55000', '12', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('148', '16', '3000', '12', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('149', '2', '1000', '12', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('150', '13', '14000', '12', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('151', '14', '4500', '12', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('152', '5', '2000', '12', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('153', '17', '12300', '12', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('154', '18', '2800', '12', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('155', '20', '2500', '12', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('156', '7', '2000', '12', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('157', '15', '3500', '12', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('158', '10', '500', '12', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('159', '19', '500', '12', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('160', '3', '1000', '12', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('161', '4', '500', '12', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('162', '6', '8000', '12', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('163', '1', '55000', '13', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('164', '16', '3000', '13', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('165', '2', '1000', '13', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('166', '13', '14000', '13', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('167', '14', '4500', '13', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('168', '5', '2000', '13', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('169', '17', '12300', '13', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('170', '18', '2800', '13', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('171', '20', '2500', '13', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('172', '7', '2000', '13', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('173', '15', '3500', '13', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('174', '10', '500', '13', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('175', '19', '500', '13', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('176', '3', '1000', '13', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('177', '4', '500', '13', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('178', '6', '8000', '13', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('179', '1', '55000', '14', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('180', '16', '3000', '14', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('181', '2', '1000', '14', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('182', '13', '14000', '14', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('183', '14', '4500', '14', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('184', '5', '2000', '14', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('185', '17', '12300', '14', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('186', '18', '2800', '14', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('187', '20', '2500', '14', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('188', '7', '2000', '14', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('189', '15', '3500', '14', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('190', '10', '500', '14', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('191', '19', '500', '14', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('192', '3', '1000', '14', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('193', '4', '500', '14', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('194', '6', '8000', '14', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('195', '1', '55000', '15', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('196', '16', '3000', '15', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('197', '2', '1000', '15', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('198', '13', '14000', '15', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('199', '14', '4500', '15', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('200', '5', '2000', '15', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('201', '17', '12300', '15', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('202', '18', '2800', '15', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('203', '20', '2500', '15', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('204', '7', '2000', '15', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('205', '15', '3500', '15', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('206', '10', '500', '15', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('207', '19', '500', '15', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('208', '3', '1000', '15', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('209', '4', '500', '15', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('210', '6', '8000', '15', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('211', '1', '55000', '16', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('212', '16', '3000', '16', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('213', '2', '1000', '16', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('214', '13', '14000', '16', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('215', '14', '4500', '16', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('216', '5', '2000', '16', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('217', '17', '12300', '16', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('218', '18', '2800', '16', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('219', '20', '2500', '16', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('220', '7', '2000', '16', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('221', '15', '3500', '16', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('222', '10', '500', '16', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('223', '19', '500', '16', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('224', '3', '1000', '16', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('225', '4', '500', '16', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('226', '6', '8000', '16', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('227', '1', '55000', '17', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('228', '16', '3000', '17', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('229', '2', '1000', '17', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('230', '13', '14000', '17', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('231', '14', '4500', '17', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('232', '5', '2000', '17', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('233', '17', '12300', '17', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('234', '18', '2800', '17', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('235', '20', '2500', '17', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('236', '7', '2000', '17', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('237', '15', '3500', '17', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('238', '10', '500', '17', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('239', '19', '500', '17', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('240', '3', '1000', '17', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('241', '4', '500', '17', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('242', '6', '8000', '17', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('243', '1', '55000', '18', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('244', '16', '3000', '18', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('245', '2', '1000', '18', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('246', '13', '14000', '18', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('247', '14', '4500', '18', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('248', '5', '2000', '18', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('249', '17', '12300', '18', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('250', '18', '2800', '18', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('251', '20', '2500', '18', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('252', '7', '2000', '18', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('253', '15', '3500', '18', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('254', '10', '500', '18', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('255', '19', '500', '18', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('256', '3', '1000', '18', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('257', '4', '500', '18', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('258', '6', '8000', '18', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('259', '1', '57000', '19', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('260', '16', '3000', '19', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('261', '2', '1000', '19', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('262', '13', '15000', '19', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('263', '14', '5000', '19', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('264', '5', '2000', '19', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('265', '17', '12500', '19', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('266', '18', '3000', '19', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('267', '20', '2800', '19', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('268', '7', '2000', '19', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('269', '15', '3500', '19', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('270', '10', '500', '19', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('271', '19', '500', '19', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('272', '3', '1000', '19', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('273', '4', '500', '19', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('274', '6', '8000', '19', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('275', '1', '57000', '20', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('276', '16', '3000', '20', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('277', '2', '1000', '20', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('278', '13', '15000', '20', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('279', '14', '5000', '20', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('280', '5', '2000', '20', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('281', '17', '12500', '20', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('282', '18', '3000', '20', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('283', '20', '2800', '20', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('284', '7', '2000', '20', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('285', '15', '3500', '20', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('286', '10', '500', '20', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('287', '19', '500', '20', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('288', '3', '1000', '20', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('289', '4', '500', '20', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('290', '6', '8000', '20', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('291', '1', '57000', '21', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('292', '16', '3000', '21', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('293', '2', '1000', '21', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('294', '13', '15000', '21', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('295', '14', '5000', '21', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('296', '5', '2000', '21', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('297', '17', '12500', '21', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('298', '18', '3000', '21', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('299', '20', '2800', '21', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('300', '7', '2000', '21', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('301', '15', '3500', '21', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('302', '10', '500', '21', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('303', '19', '500', '21', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('304', '3', '1000', '21', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('305', '4', '500', '21', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('306', '6', '8000', '21', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('307', '1', '57000', '22', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('308', '16', '3000', '22', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('309', '2', '1000', '22', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('310', '13', '15000', '22', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('311', '14', '5000', '22', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('312', '5', '2000', '22', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('313', '17', '12500', '22', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('314', '18', '3000', '22', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('315', '20', '2800', '22', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('316', '7', '2000', '22', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('317', '15', '3500', '22', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('318', '10', '500', '22', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('319', '19', '500', '22', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('320', '3', '1000', '22', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('321', '4', '500', '22', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('322', '6', '8000', '22', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('323', '1', '57000', '23', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('324', '16', '3000', '23', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('325', '2', '1000', '23', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('326', '13', '15000', '23', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('327', '14', '5000', '23', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('328', '5', '2000', '23', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('329', '17', '12500', '23', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('330', '18', '3000', '23', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('331', '20', '2800', '23', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('332', '7', '2000', '23', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('333', '15', '3500', '23', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('334', '10', '500', '23', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('335', '19', '500', '23', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('336', '3', '1000', '23', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('337', '4', '500', '23', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('338', '6', '8000', '23', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('339', '1', '57000', '24', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('340', '16', '3000', '24', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('341', '2', '1000', '24', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('342', '13', '15000', '24', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('343', '14', '5000', '24', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('344', '5', '2000', '24', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('345', '17', '12500', '24', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('346', '18', '3000', '24', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('347', '20', '2800', '24', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('348', '7', '2000', '24', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('349', '15', '3500', '24', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('350', '10', '500', '24', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('351', '19', '500', '24', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('352', '3', '1000', '24', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('353', '4', '500', '24', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('354', '6', '8000', '24', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('355', '1', '60000', '25', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('356', '16', '4000', '25', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('357', '2', '1000', '25', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('358', '13', '19000', '25', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('359', '14', '5500', '25', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('360', '3', '1500', '25', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('361', '4', '700', '25', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('362', '5', '2500', '25', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('363', '17', '15500', '25', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('364', '18', '3500', '25', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('365', '7', '2000', '25', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('366', '15', '5000', '25', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('367', '10', '500', '25', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('368', '19', '500', '25', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('369', '6', '8000', '25', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('370', '11', '2500', '25', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('371', '8', '8000', '25', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('372', '1', '60000', '26', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('373', '16', '4000', '26', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('374', '2', '1000', '26', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('375', '13', '19000', '26', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('376', '14', '5500', '26', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('377', '3', '1500', '26', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('378', '4', '700', '26', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('379', '5', '2500', '26', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('380', '17', '15500', '26', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('381', '18', '3500', '26', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('382', '7', '2000', '26', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('383', '15', '5000', '26', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('384', '10', '500', '26', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('385', '19', '500', '26', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('386', '6', '8000', '26', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('387', '11', '2500', '26', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('388', '8', '8000', '26', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('389', '1', '60000', '27', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('390', '16', '4000', '27', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('391', '2', '1000', '27', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('392', '13', '19000', '27', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('393', '14', '5500', '27', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('394', '3', '1500', '27', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('395', '4', '700', '27', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('396', '5', '2500', '27', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('397', '17', '15500', '27', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('398', '18', '3500', '27', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('399', '7', '2000', '27', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('400', '15', '5000', '27', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('401', '10', '500', '27', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('402', '19', '500', '27', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('403', '6', '8000', '27', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('404', '11', '2500', '27', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('405', '8', '8000', '27', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('406', '1', '60000', '28', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('407', '16', '4000', '28', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('408', '2', '1000', '28', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('409', '13', '19000', '28', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('410', '14', '5500', '28', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('411', '3', '1500', '28', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('412', '4', '700', '28', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('413', '5', '2500', '28', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('414', '17', '15500', '28', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('415', '18', '3500', '28', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('416', '7', '2000', '28', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('417', '15', '5000', '28', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('418', '10', '500', '28', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('419', '19', '500', '28', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('420', '6', '8000', '28', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('421', '11', '2500', '28', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('422', '8', '8000', '28', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('423', '1', '60000', '29', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('424', '16', '4000', '29', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('425', '2', '1000', '29', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('426', '13', '19000', '29', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('427', '14', '5500', '29', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('428', '3', '1500', '29', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('429', '4', '700', '29', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('430', '5', '2500', '29', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('431', '17', '15500', '29', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('432', '18', '3500', '29', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('433', '7', '2000', '29', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('434', '15', '5000', '29', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('435', '10', '500', '29', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('436', '19', '500', '29', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('437', '6', '8000', '29', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('438', '11', '2500', '29', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('439', '8', '8000', '29', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('440', '1', '60000', '30', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('441', '16', '4000', '30', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('442', '2', '1000', '30', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('443', '13', '19000', '30', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('444', '14', '5500', '30', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('445', '3', '1500', '30', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('446', '4', '700', '30', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('447', '5', '2500', '30', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('448', '17', '15500', '30', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('449', '18', '3500', '30', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('450', '7', '2000', '30', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('451', '15', '5000', '30', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('452', '10', '500', '30', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('453', '19', '500', '30', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('454', '6', '8000', '30', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('455', '11', '2500', '30', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('456', '8', '8000', '30', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('457', '1', '60000', '31', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('458', '16', '4000', '31', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('459', '2', '1000', '31', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('460', '13', '19000', '31', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('461', '14', '5500', '31', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('462', '3', '1500', '31', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('463', '4', '700', '31', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('464', '5', '2500', '31', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('465', '17', '15500', '31', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('466', '18', '3500', '31', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('467', '7', '2000', '31', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('468', '15', '5000', '31', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('469', '10', '500', '31', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('470', '19', '500', '31', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('471', '6', '8000', '31', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('472', '11', '2500', '31', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('473', '8', '8000', '31', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('474', '1', '60000', '32', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('475', '16', '4000', '32', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('476', '2', '1000', '32', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('477', '13', '19000', '32', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('478', '14', '5500', '32', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('479', '3', '1500', '32', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('480', '4', '700', '32', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('481', '5', '2500', '32', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('482', '17', '15500', '32', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('483', '18', '3500', '32', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('484', '7', '2000', '32', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('485', '15', '5000', '32', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('486', '10', '500', '32', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('487', '19', '500', '32', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('488', '6', '8000', '32', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('489', '11', '2500', '32', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('490', '8', '8000', '32', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('491', '1', '75000', '33', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('492', '16', '5000', '33', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('493', '2', '1000', '33', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('494', '13', '25000', '33', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('495', '14', '6500', '33', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('496', '3', '1500', '33', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('497', '4', '1000', '33', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('498', '5', '3000', '33', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('499', '17', '17000', '33', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('500', '18', '3800', '33', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('501', '7', '2000', '33', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('502', '15', '5000', '33', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('503', '10', '500', '33', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('504', '19', '500', '33', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('505', '6', '8000', '33', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('506', '11', '5000', '33', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('507', '8', '8000', '33', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('508', '1', '75000', '34', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('509', '16', '5000', '34', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('510', '2', '1000', '34', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('511', '13', '25000', '34', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('512', '14', '6500', '34', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('513', '3', '1500', '34', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('514', '4', '1000', '34', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('515', '5', '3000', '34', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('516', '17', '17000', '34', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('517', '18', '3800', '34', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('518', '7', '2000', '34', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('519', '15', '5000', '34', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('520', '10', '500', '34', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('521', '19', '500', '34', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('522', '6', '8000', '34', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('523', '11', '5000', '34', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('524', '8', '8000', '34', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('525', '1', '75000', '35', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('526', '16', '5000', '35', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('527', '2', '1000', '35', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('528', '13', '25000', '35', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('529', '14', '6500', '35', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('530', '3', '1500', '35', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('531', '4', '1000', '35', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('532', '5', '3000', '35', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('533', '17', '17000', '35', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('534', '18', '3800', '35', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('535', '7', '2000', '35', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('536', '15', '5000', '35', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('537', '10', '500', '35', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('538', '19', '500', '35', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('539', '6', '8000', '35', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('540', '11', '5000', '35', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('541', '8', '8000', '35', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('542', '1', '75000', '36', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('543', '16', '5000', '36', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('544', '2', '1000', '36', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('545', '13', '25000', '36', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('546', '14', '6500', '36', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('547', '3', '1500', '36', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('548', '4', '1000', '36', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('549', '5', '3000', '36', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('550', '17', '17000', '36', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('551', '18', '3800', '36', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('552', '7', '2000', '36', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('553', '15', '5000', '36', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('554', '10', '500', '36', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('555', '19', '500', '36', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('556', '6', '8000', '36', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('557', '11', '5000', '36', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('558', '8', '8000', '36', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('559', '1', '75000', '37', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('560', '16', '5000', '37', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('561', '2', '1000', '37', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('562', '13', '25000', '37', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('563', '14', '6500', '37', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('564', '3', '1500', '37', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('565', '4', '1000', '37', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('566', '5', '3000', '37', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('567', '17', '17000', '37', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('568', '18', '3800', '37', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('569', '7', '2000', '37', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('570', '15', '5000', '37', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('571', '10', '500', '37', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('572', '19', '500', '37', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('573', '6', '8000', '37', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('574', '11', '5000', '37', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('575', '8', '8000', '37', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('576', '1', '75000', '38', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('577', '16', '5000', '38', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('578', '2', '1000', '38', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('579', '13', '25000', '38', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('580', '14', '6500', '38', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('581', '3', '1500', '38', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('582', '4', '1000', '38', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('583', '5', '3000', '38', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('584', '17', '17000', '38', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('585', '18', '3800', '38', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('586', '7', '2000', '38', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('587', '15', '5000', '38', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('588', '10', '500', '38', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('589', '19', '500', '38', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('590', '6', '8000', '38', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('591', '11', '5000', '38', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('592', '8', '8000', '38', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('593', '1', '75000', '39', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('594', '16', '5000', '39', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('595', '2', '1000', '39', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('596', '13', '25000', '39', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('597', '14', '6500', '39', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('598', '3', '1500', '39', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('599', '4', '1000', '39', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('600', '5', '3000', '39', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('601', '17', '17000', '39', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('602', '18', '3800', '39', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('603', '7', '2000', '39', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('604', '15', '5000', '39', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('605', '10', '500', '39', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('606', '19', '500', '39', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('607', '6', '8000', '39', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('608', '11', '5000', '39', '1', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('609', '8', '8000', '39', '1', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('610', '1', '45000', '1', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('611', '2', '1000', '1', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('612', '13', '4000', '1', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('613', '14', '1000', '1', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('614', '5', '500', '1', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('615', '7', '2000', '1', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('616', '15', '3000', '1', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('617', '10', '500', '1', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('618', '1', '53000', '2', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('619', '2', '1000', '2', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('620', '13', '7000', '2', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('621', '14', '3000', '2', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('622', '5', '2000', '2', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('623', '7', '2000', '2', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('624', '15', '3000', '2', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('625', '10', '500', '2', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('626', '1', '53000', '3', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('627', '2', '1000', '3', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('628', '13', '7000', '3', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('629', '14', '3000', '3', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('630', '5', '2000', '3', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('631', '7', '2000', '3', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('632', '15', '3000', '3', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('633', '10', '500', '3', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('634', '1', '53000', '4', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('635', '2', '1000', '4', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('636', '13', '7000', '4', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('637', '14', '3000', '4', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('638', '5', '2000', '4', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('639', '7', '2000', '4', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('640', '15', '3000', '4', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('641', '10', '500', '4', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('642', '1', '53000', '5', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('643', '2', '1000', '5', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('644', '13', '7000', '5', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('645', '14', '3000', '5', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('646', '5', '2000', '5', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('647', '7', '2000', '5', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('648', '15', '3000', '5', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('649', '10', '500', '5', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('650', '1', '53000', '6', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('651', '2', '1000', '6', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('652', '13', '7000', '6', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('653', '14', '3000', '6', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('654', '5', '2000', '6', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('655', '7', '2000', '6', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('656', '15', '3000', '6', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('657', '10', '500', '6', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('658', '1', '53000', '7', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('659', '2', '1000', '7', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('660', '13', '7000', '7', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('661', '14', '3000', '7', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('662', '5', '2000', '7', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('663', '7', '2000', '7', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('664', '15', '3000', '7', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('665', '10', '500', '7', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('666', '1', '53000', '8', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('667', '2', '1000', '8', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('668', '13', '8000', '8', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('669', '14', '3000', '8', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('670', '5', '2000', '8', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('671', '7', '2000', '8', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('672', '15', '3000', '8', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('673', '10', '500', '8', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('674', '1', '53000', '9', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('675', '2', '1000', '9', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('676', '13', '8000', '9', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('677', '14', '3000', '9', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('678', '5', '2000', '9', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('679', '7', '2000', '9', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('680', '15', '3000', '9', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('681', '10', '500', '9', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('682', '1', '53000', '10', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('683', '2', '1000', '10', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('684', '13', '8000', '10', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('685', '14', '3000', '10', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('686', '5', '2000', '10', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('687', '7', '2000', '10', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('688', '15', '3000', '10', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('689', '10', '500', '10', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('690', '1', '55000', '11', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('691', '2', '1000', '11', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('692', '13', '14000', '11', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('693', '14', '4500', '11', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('694', '5', '2000', '11', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('695', '7', '2000', '11', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('696', '15', '3500', '11', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('697', '10', '500', '11', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('698', '3', '1000', '11', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('699', '4', '500', '11', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('700', '6', '8000', '11', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('701', '1', '55000', '12', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('702', '2', '1000', '12', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('703', '13', '14000', '12', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('704', '14', '4500', '12', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('705', '5', '2000', '12', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('706', '7', '2000', '12', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('707', '15', '3500', '12', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('708', '10', '500', '12', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('709', '3', '1000', '12', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('710', '4', '500', '12', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('711', '6', '8000', '12', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('712', '1', '55000', '13', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('713', '2', '1000', '13', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('714', '13', '14000', '13', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('715', '14', '4500', '13', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('716', '5', '2000', '13', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('717', '7', '2000', '13', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('718', '15', '3500', '13', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('719', '10', '500', '13', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('720', '3', '1000', '13', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('721', '4', '500', '13', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('722', '6', '8000', '13', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('723', '1', '55000', '14', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('724', '2', '1000', '14', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('725', '13', '14000', '14', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('726', '14', '4500', '14', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('727', '5', '2000', '14', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('728', '7', '2000', '14', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('729', '15', '3500', '14', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('730', '10', '500', '14', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('731', '3', '1000', '14', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('732', '4', '500', '14', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('733', '6', '8000', '14', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('734', '1', '55000', '15', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('735', '2', '1000', '15', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('736', '13', '14000', '15', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('737', '14', '4500', '15', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('738', '5', '2000', '15', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('739', '7', '2000', '15', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('740', '15', '3500', '15', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('741', '10', '500', '15', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('742', '3', '1000', '15', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('743', '4', '500', '15', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('744', '6', '8000', '15', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('745', '1', '55000', '16', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('746', '2', '1000', '16', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('747', '13', '14000', '16', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('748', '14', '4500', '16', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('749', '5', '2000', '16', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('750', '7', '2000', '16', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('751', '15', '3500', '16', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('752', '10', '500', '16', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('753', '3', '1000', '16', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('754', '4', '500', '16', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('755', '6', '8000', '16', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('756', '1', '55000', '17', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('757', '2', '1000', '17', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('758', '13', '14000', '17', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('759', '14', '4500', '17', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('760', '5', '2000', '17', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('761', '7', '2000', '17', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('762', '15', '3500', '17', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('763', '10', '500', '17', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('764', '3', '1000', '17', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('765', '4', '500', '17', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('766', '6', '8000', '17', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('767', '1', '55000', '17', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('768', '2', '1000', '18', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('769', '13', '14000', '18', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('770', '14', '4500', '18', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('771', '5', '2000', '18', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('772', '7', '2000', '18', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('773', '15', '3500', '18', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('774', '10', '500', '18', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('775', '3', '1000', '18', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('776', '4', '500', '18', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('777', '6', '8000', '18', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('778', '1', '57000', '19', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('779', '2', '1000', '19', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('780', '13', '15000', '19', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('781', '14', '5000', '19', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('782', '5', '2000', '19', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('783', '7', '2000', '19', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('784', '15', '3500', '19', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('785', '10', '500', '19', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('786', '3', '1000', '19', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('787', '4', '500', '19', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('788', '6', '8000', '19', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('789', '1', '57000', '20', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('790', '2', '1000', '20', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('791', '13', '15000', '20', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('792', '14', '5000', '20', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('793', '5', '2000', '20', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('794', '7', '2000', '20', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('795', '15', '3500', '20', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('796', '10', '500', '20', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('797', '3', '1000', '20', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('798', '4', '500', '20', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('799', '6', '8000', '20', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('800', '1', '57000', '21', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('801', '2', '1000', '21', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('802', '13', '15000', '21', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('803', '14', '5000', '21', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('804', '5', '2000', '21', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('805', '7', '2000', '21', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('806', '15', '3500', '21', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('807', '10', '500', '21', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('808', '3', '1000', '21', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('809', '4', '500', '21', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('810', '6', '8000', '21', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('811', '1', '57000', '22', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('812', '2', '1000', '22', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('813', '13', '15000', '22', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('814', '14', '5000', '22', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('815', '5', '2000', '22', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('816', '7', '2000', '22', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('817', '15', '3500', '22', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('818', '10', '500', '22', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('819', '3', '1000', '22', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('820', '4', '500', '22', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('821', '6', '8000', '22', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('822', '1', '57000', '23', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('823', '2', '1000', '23', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('824', '13', '15000', '23', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('825', '14', '5000', '23', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('826', '5', '2000', '23', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('827', '7', '2000', '23', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('828', '15', '3500', '23', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('829', '10', '500', '23', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('830', '3', '1000', '23', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('831', '4', '500', '23', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('832', '6', '8000', '23', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('833', '1', '57000', '24', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('834', '2', '1000', '24', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('835', '13', '15000', '24', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('836', '14', '5000', '24', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('837', '5', '2000', '24', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('838', '7', '2000', '24', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('839', '15', '3500', '24', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('840', '10', '500', '24', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('841', '3', '1000', '24', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('842', '4', '500', '24', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('843', '6', '8000', '24', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('844', '1', '60000', '25', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('845', '2', '1000', '25', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('846', '13', '19000', '25', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('847', '14', '5500', '25', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('848', '3', '1500', '25', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('849', '4', '700', '25', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('850', '5', '2500', '25', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('851', '6', '8000', '25', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('852', '7', '2000', '25', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('853', '15', '5000', '25', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('854', '10', '500', '25', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('855', '11', '2500', '25', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('856', '1', '60000', '26', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('857', '2', '1000', '26', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('858', '13', '19000', '26', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('859', '14', '5500', '26', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('860', '3', '1500', '26', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('861', '4', '700', '26', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('862', '5', '2500', '26', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('863', '6', '8000', '26', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('864', '7', '2000', '26', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('865', '15', '5000', '26', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('866', '10', '500', '26', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('867', '11', '2500', '26', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('868', '1', '60000', '27', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('869', '2', '1000', '27', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('870', '13', '19000', '27', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('871', '14', '5500', '27', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('872', '3', '1500', '27', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('873', '4', '700', '27', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('874', '5', '2500', '27', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('875', '6', '8000', '27', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('876', '7', '2000', '27', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('877', '15', '5000', '27', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('878', '10', '500', '27', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('879', '11', '2500', '27', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('880', '1', '60000', '28', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('881', '2', '1000', '28', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('882', '13', '19000', '28', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('883', '14', '5500', '28', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('884', '3', '1500', '28', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('885', '4', '700', '28', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('886', '5', '2500', '28', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('887', '6', '8000', '28', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('888', '7', '2000', '28', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('889', '15', '5000', '28', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('890', '10', '500', '28', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('891', '11', '2500', '28', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('892', '1', '60000', '29', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('893', '2', '1000', '29', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('894', '13', '19000', '29', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('895', '14', '5500', '29', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('896', '3', '1500', '29', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('897', '4', '700', '29', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('898', '5', '2500', '29', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('899', '6', '8000', '29', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('900', '7', '2000', '29', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('901', '15', '5000', '29', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('902', '10', '500', '29', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('903', '11', '2500', '29', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('904', '1', '60000', '30', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('905', '2', '1000', '30', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('906', '13', '19000', '30', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('907', '14', '5500', '30', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('908', '3', '1500', '30', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('909', '4', '700', '30', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('910', '5', '2500', '30', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('911', '6', '8000', '30', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('912', '7', '2000', '30', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('913', '15', '5000', '30', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('914', '10', '500', '30', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('915', '11', '2500', '30', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('916', '1', '60000', '31', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('917', '2', '1000', '31', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('918', '13', '19000', '31', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('919', '14', '5500', '31', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('920', '3', '1500', '31', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('921', '4', '700', '31', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('922', '5', '2500', '31', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('923', '6', '8000', '31', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('924', '7', '2000', '31', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('925', '15', '5000', '31', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('926', '10', '500', '31', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('927', '11', '2500', '31', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('928', '1', '60000', '32', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('929', '2', '1000', '32', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('930', '13', '19000', '32', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('931', '14', '5500', '32', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('932', '3', '1500', '32', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('933', '4', '700', '32', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('934', '5', '2500', '32', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('935', '6', '8000', '32', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('936', '7', '2000', '32', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('937', '15', '5000', '32', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('938', '10', '500', '32', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('939', '11', '2500', '32', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('940', '1', '75000', '33', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('941', '2', '1000', '33', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('942', '13', '25000', '33', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('943', '14', '6500', '33', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('944', '3', '1500', '33', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('945', '4', '1000', '33', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('946', '5', '3000', '33', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('947', '6', '8000', '33', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('948', '7', '2000', '33', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('949', '15', '5000', '33', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('950', '10', '500', '33', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('951', '11', '5000', '33', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('952', '1', '75000', '34', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('953', '2', '1000', '34', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('954', '13', '25000', '34', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('955', '14', '6500', '34', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('956', '3', '1500', '34', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('957', '4', '1000', '34', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('958', '5', '3000', '34', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('959', '6', '8000', '34', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('960', '7', '2000', '34', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('961', '15', '5000', '34', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('962', '10', '500', '34', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('963', '11', '5000', '34', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('964', '1', '75000', '35', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('965', '2', '1000', '35', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('966', '13', '25000', '35', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('967', '14', '6500', '35', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('968', '3', '1500', '35', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('969', '4', '1000', '35', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('970', '5', '3000', '35', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('971', '6', '8000', '35', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('972', '7', '2000', '35', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('973', '15', '5000', '35', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('974', '10', '500', '35', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('975', '11', '5000', '35', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('976', '1', '75000', '36', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('977', '2', '1000', '36', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('978', '13', '23000', '36', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('979', '14', '6500', '36', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('980', '3', '1500', '36', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('981', '4', '1000', '36', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('982', '5', '3000', '36', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('983', '6', '8000', '36', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('984', '7', '2000', '36', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('985', '15', '5000', '36', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('986', '10', '500', '36', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('987', '11', '5000', '36', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('988', '1', '75000', '37', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('989', '2', '1000', '37', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('990', '13', '23000', '37', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('991', '14', '6500', '37', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('992', '3', '1500', '37', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('993', '4', '1000', '37', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('994', '5', '3000', '37', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('995', '6', '8000', '37', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('996', '7', '2000', '37', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('997', '15', '5000', '37', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('998', '10', '500', '37', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('999', '11', '5000', '37', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1000', '1', '75000', '38', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1001', '2', '1000', '38', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1002', '13', '23000', '38', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1003', '14', '6500', '38', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1004', '3', '1500', '38', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1005', '4', '1000', '38', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1006', '5', '3000', '38', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1007', '6', '8000', '38', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1008', '7', '2000', '38', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1009', '15', '5000', '38', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1010', '10', '500', '38', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1011', '11', '5000', '38', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1012', '1', '75000', '39', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1013', '2', '1000', '39', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1014', '13', '23000', '39', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1015', '14', '6500', '39', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1016', '3', '1500', '39', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1017', '4', '1000', '39', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1018', '5', '3000', '39', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1019', '6', '8000', '39', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1020', '7', '2000', '39', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1021', '15', '5000', '39', '1', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1022', '10', '500', '39', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1023', '11', '5000', '39', '1', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1024', '1', '45000', '1', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1025', '2', '1000', '1', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1026', '5', '500', '1', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1027', '7', '2000', '1', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1028', '10', '500', '1', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1029', '1', '53000', '2', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1030', '2', '1000', '2', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1031', '5', '2000', '2', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1032', '7', '2000', '2', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1033', '10', '500', '2', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1034', '1', '53000', '3', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1035', '2', '1000', '3', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1036', '5', '2000', '3', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1037', '7', '2000', '3', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1038', '10', '500', '3', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1039', '1', '53000', '4', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1040', '2', '1000', '4', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1041', '5', '2000', '4', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1042', '7', '2000', '4', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1043', '10', '500', '4', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1044', '1', '53000', '5', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1045', '2', '1000', '5', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1046', '5', '2000', '5', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1047', '7', '2000', '5', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1048', '10', '500', '5', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1049', '1', '53000', '6', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1050', '2', '1000', '6', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1051', '5', '2000', '6', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1052', '7', '2000', '6', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1053', '10', '500', '6', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1054', '1', '53000', '7', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1055', '2', '1000', '7', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1056', '5', '2000', '7', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1057', '7', '2000', '7', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1058', '10', '500', '7', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1059', '1', '53000', '8', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1060', '2', '1000', '8', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1061', '5', '2000', '8', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1062', '7', '2000', '8', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1063', '10', '500', '8', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1064', '1', '53000', '9', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1065', '2', '1000', '9', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1066', '5', '2000', '9', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1067', '7', '2000', '9', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1068', '10', '500', '9', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1069', '1', '53000', '10', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1070', '2', '1000', '10', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1071', '5', '2000', '10', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1072', '7', '2000', '10', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1073', '10', '500', '10', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1074', '1', '55000', '11', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1075', '2', '1000', '11', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1076', '5', '2000', '11', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1077', '7', '2000', '11', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1078', '10', '500', '11', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1079', '3', '1000', '11', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1080', '4', '500', '11', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1081', '6', '8000', '11', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1082', '8', '8000', '11', '2', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1083', '1', '55000', '12', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1084', '2', '1000', '12', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1085', '5', '2000', '12', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1086', '7', '2000', '12', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1087', '10', '500', '12', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1088', '3', '1000', '12', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1089', '4', '500', '12', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1090', '6', '8000', '12', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1091', '8', '8000', '12', '2', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1092', '1', '55000', '13', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1093', '2', '1000', '13', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1094', '5', '2000', '13', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1095', '7', '2000', '13', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1096', '10', '500', '13', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1097', '3', '1000', '13', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1098', '4', '500', '13', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1099', '6', '8000', '13', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1100', '8', '8000', '13', '2', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1101', '1', '55000', '14', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1102', '2', '1000', '14', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1103', '5', '2000', '14', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1104', '7', '2000', '14', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1105', '10', '500', '14', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1106', '3', '1000', '14', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1107', '4', '500', '14', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1108', '6', '8000', '14', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1109', '8', '8000', '14', '2', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1110', '1', '55000', '15', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1111', '2', '1000', '15', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1112', '5', '2000', '15', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1113', '7', '2000', '15', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1114', '10', '500', '15', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1115', '3', '1000', '15', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1116', '4', '500', '15', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1117', '6', '8000', '15', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1118', '8', '8000', '15', '2', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1119', '1', '55000', '16', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1120', '2', '1000', '16', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1121', '5', '2000', '16', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1122', '7', '2000', '16', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1123', '10', '500', '16', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1124', '3', '1000', '16', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1125', '4', '500', '16', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1126', '6', '8000', '16', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1127', '8', '8000', '16', '2', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1128', '1', '55000', '17', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1129', '2', '1000', '17', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1130', '5', '2000', '17', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1131', '7', '2000', '17', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1132', '10', '500', '17', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1133', '3', '1000', '17', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1134', '4', '500', '17', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1135', '6', '8000', '17', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1136', '8', '8000', '17', '2', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1137', '1', '55000', '18', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1138', '2', '1000', '18', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1139', '5', '2000', '18', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1140', '7', '2000', '18', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1141', '10', '500', '18', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1142', '3', '1000', '18', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1143', '4', '500', '18', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1144', '6', '8000', '18', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1145', '8', '8000', '18', '2', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1146', '1', '57000', '19', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1147', '2', '1000', '19', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1148', '5', '2000', '19', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1149', '7', '2000', '19', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1150', '10', '500', '19', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1151', '3', '1000', '19', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1152', '4', '500', '19', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1153', '6', '8000', '19', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1154', '8', '8000', '19', '2', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1155', '1', '57000', '20', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1156', '2', '1000', '20', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1157', '5', '2000', '20', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1158', '7', '2000', '20', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1159', '10', '500', '20', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1160', '3', '1000', '20', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1161', '4', '500', '20', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1162', '6', '8000', '20', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1163', '8', '8000', '20', '2', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1164', '1', '57000', '21', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1165', '2', '1000', '21', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1166', '5', '2000', '21', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1167', '7', '2000', '21', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1168', '10', '500', '21', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1169', '3', '1000', '21', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1170', '4', '500', '21', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1171', '6', '8000', '21', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1172', '8', '8000', '21', '2', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1173', '1', '57000', '22', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1174', '2', '1000', '22', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1175', '5', '2000', '22', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1176', '7', '2000', '22', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1177', '10', '500', '22', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1178', '3', '1000', '22', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1179', '4', '500', '22', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1180', '6', '8000', '22', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1181', '8', '8000', '22', '2', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1182', '1', '57000', '23', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1183', '2', '1000', '23', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1184', '5', '2000', '23', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1185', '7', '2000', '23', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1186', '10', '500', '23', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1187', '3', '1000', '23', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1188', '4', '500', '23', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1189', '6', '8000', '23', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1190', '8', '8000', '23', '2', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1191', '1', '57000', '24', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1192', '2', '1000', '24', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1193', '5', '2000', '24', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1194', '7', '2000', '24', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1195', '10', '500', '24', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1196', '3', '1000', '24', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1197', '4', '500', '24', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1198', '6', '8000', '24', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1199', '8', '8000', '24', '2', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1200', '1', '60000', '25', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1201', '2', '1000', '25', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1202', '3', '1500', '25', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1203', '4', '700', '25', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1204', '5', '2500', '25', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1205', '6', '8000', '25', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1206', '7', '2000', '25', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1207', '8', '8000', '25', '2', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1208', '10', '500', '25', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1209', '11', '2500', '25', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1210', '1', '60000', '26', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1211', '2', '1000', '26', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1212', '3', '1500', '26', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1213', '4', '700', '26', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1214', '5', '2500', '26', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1215', '6', '8000', '26', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1216', '7', '2000', '26', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1217', '8', '8000', '26', '2', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1218', '10', '500', '26', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1219', '11', '2500', '26', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1220', '1', '60000', '27', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1221', '2', '1000', '27', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1222', '3', '1500', '27', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1223', '4', '700', '27', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1224', '5', '2500', '27', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1225', '6', '8000', '27', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1226', '7', '2000', '27', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1227', '8', '8000', '27', '2', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1228', '10', '500', '27', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1229', '11', '2500', '27', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1230', '1', '60000', '28', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1231', '2', '1000', '28', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1232', '3', '1500', '28', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1233', '4', '700', '28', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1234', '5', '2500', '28', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1235', '6', '8000', '28', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1236', '7', '2000', '28', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1237', '8', '8000', '28', '2', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1238', '10', '500', '28', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1239', '11', '2500', '28', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1240', '1', '60000', '29', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1241', '2', '1000', '29', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1242', '3', '1500', '29', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1243', '4', '700', '29', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1244', '5', '2500', '29', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1245', '6', '8000', '29', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1246', '7', '2000', '29', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1247', '8', '8000', '29', '2', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1248', '10', '500', '29', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1249', '11', '2500', '29', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1250', '1', '60000', '30', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1251', '2', '1000', '30', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1252', '3', '1500', '30', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1253', '4', '700', '30', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1254', '5', '2500', '30', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1255', '6', '8000', '30', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1256', '7', '2000', '30', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1257', '8', '8000', '30', '2', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1258', '10', '500', '30', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1259', '11', '2500', '30', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1260', '1', '60000', '31', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1261', '2', '1000', '31', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1262', '3', '1500', '31', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1263', '4', '700', '31', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1264', '5', '2500', '31', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1265', '6', '8000', '31', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1266', '7', '2000', '31', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1267', '8', '8000', '31', '2', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1268', '10', '500', '31', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1269', '11', '2500', '31', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1270', '9', '5000', '31', '2', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1271', '1', '60000', '32', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1272', '2', '1000', '32', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1273', '3', '1500', '32', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1274', '4', '700', '32', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1275', '5', '2500', '32', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1276', '6', '8000', '32', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1277', '7', '2000', '32', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1278', '8', '8000', '32', '2', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1279', '10', '500', '32', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1280', '11', '2500', '32', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1281', '9', '5000', '32', '2', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1282', '1', '75000', '33', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1283', '2', '1000', '33', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1284', '3', '1500', '33', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1285', '4', '1000', '33', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1286', '5', '3000', '33', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1287', '6', '8000', '33', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1288', '7', '2000', '33', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1289', '8', '8000', '33', '2', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1290', '10', '500', '33', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1291', '11', '5000', '33', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1292', '1', '75000', '34', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1293', '2', '1000', '34', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1294', '3', '1500', '34', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1295', '4', '1000', '34', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1296', '5', '3000', '34', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1297', '6', '8000', '34', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1298', '7', '2000', '34', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1299', '8', '8000', '34', '2', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1300', '10', '500', '34', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1301', '11', '5000', '34', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1302', '1', '75000', '35', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1303', '2', '1000', '35', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1304', '3', '1500', '35', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1305', '4', '1000', '35', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1306', '5', '3000', '35', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1307', '6', '8000', '35', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1308', '7', '2000', '35', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1309', '8', '8000', '35', '2', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1310', '10', '500', '35', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1311', '11', '5000', '35', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1312', '1', '75000', '36', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1313', '2', '1000', '36', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1314', '3', '1500', '36', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1315', '4', '1000', '36', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1316', '5', '3000', '36', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1317', '6', '8000', '36', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1318', '7', '2000', '36', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1319', '8', '8000', '36', '2', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1320', '10', '500', '36', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1321', '11', '5000', '36', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1322', '1', '75000', '37', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1323', '2', '1000', '37', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1324', '3', '1500', '37', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1325', '4', '1000', '37', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1326', '5', '3000', '37', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1327', '6', '8000', '37', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1328', '7', '2000', '37', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1329', '8', '8000', '37', '2', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1330', '10', '500', '37', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1331', '11', '5000', '37', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1332', '1', '75000', '38', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1333', '2', '1000', '38', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1334', '3', '1500', '38', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1335', '4', '1000', '38', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1336', '5', '3000', '38', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1337', '6', '8000', '38', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1338', '7', '2000', '38', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1339', '8', '8000', '38', '2', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1340', '10', '500', '38', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1341', '11', '5000', '38', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1342', '9', '10000', '38', '2', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1343', '1', '75000', '39', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1344', '2', '1000', '39', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1345', '3', '1500', '39', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1346', '4', '1000', '39', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1347', '5', '3000', '39', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1348', '6', '8000', '39', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1349', '7', '2000', '39', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1350', '8', '8000', '39', '2', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1351', '10', '500', '39', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1352', '11', '5000', '39', '2', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1353', '9', '10000', '39', '2', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1354', '1', '45000', '1', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1355', '2', '1000', '1', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1356', '5', '500', '1', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1357', '7', '2000', '1', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1358', '12', '1000', '1', '3', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1359', '10', '500', '1', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1360', '1', '53000', '2', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1361', '2', '1000', '2', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1362', '5', '2000', '2', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1363', '7', '2000', '2', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1364', '12', '1000', '2', '3', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1365', '10', '500', '2', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1366', '1', '53000', '3', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1367', '2', '1000', '3', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1368', '5', '2000', '3', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1369', '7', '2000', '3', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1370', '12', '1000', '3', '3', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1371', '10', '500', '3', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1372', '1', '53000', '4', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1373', '2', '1000', '4', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1374', '5', '2000', '4', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1375', '7', '2000', '4', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1376', '12', '1000', '4', '3', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1377', '10', '500', '4', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1378', '1', '53000', '5', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1379', '2', '1000', '5', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1380', '5', '2000', '5', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1381', '7', '2000', '5', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1382', '12', '1000', '5', '3', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1383', '10', '500', '5', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1384', '1', '53000', '6', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1385', '2', '1000', '6', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1386', '5', '2000', '6', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1387', '7', '2000', '6', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1388', '12', '1000', '6', '3', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1389', '10', '500', '6', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1390', '1', '53000', '7', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1391', '2', '1000', '7', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1392', '5', '2000', '7', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1393', '7', '2000', '7', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1394', '12', '1000', '7', '3', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1395', '10', '500', '7', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1396', '1', '53000', '8', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1397', '2', '1000', '8', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1398', '5', '2000', '8', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1399', '7', '2000', '8', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1400', '12', '1000', '8', '3', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1401', '10', '500', '8', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1402', '1', '53000', '9', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1403', '2', '1000', '9', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1404', '5', '2000', '9', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1405', '7', '2000', '9', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1406', '12', '1000', '9', '3', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1407', '10', '500', '9', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1408', '1', '53000', '10', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1409', '2', '1000', '10', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1410', '5', '2000', '10', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1411', '7', '2000', '10', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1412', '12', '1000', '10', '3', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1413', '10', '500', '10', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1414', '1', '55000', '11', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1415', '2', '1000', '11', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1416', '5', '2000', '11', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1417', '7', '2000', '11', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1418', '12', '2000', '11', '3', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1419', '10', '500', '11', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1420', '3', '1000', '11', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1421', '4', '500', '11', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1422', '6', '8000', '11', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1423', '1', '55000', '12', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1424', '2', '1000', '12', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1425', '5', '2000', '12', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1426', '7', '2000', '12', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1427', '12', '2000', '12', '3', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1428', '10', '500', '12', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1429', '3', '1000', '12', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1430', '4', '500', '12', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1431', '6', '8000', '12', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1432', '1', '55000', '13', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1433', '2', '1000', '13', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1434', '5', '2000', '13', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1435', '7', '2000', '13', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1436', '12', '2000', '13', '3', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1437', '10', '500', '13', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1438', '3', '1000', '13', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1439', '4', '500', '13', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1440', '6', '8000', '13', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1441', '1', '55000', '14', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1442', '2', '1000', '14', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1443', '5', '2000', '14', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1444', '7', '2000', '14', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1445', '12', '2000', '14', '3', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1446', '10', '500', '14', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1447', '3', '1000', '14', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1448', '4', '500', '14', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1449', '6', '8000', '14', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1450', '1', '55000', '15', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1451', '2', '1000', '15', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1452', '5', '2000', '15', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1453', '7', '2000', '15', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1454', '12', '2000', '15', '3', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1455', '10', '500', '15', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1456', '3', '1000', '15', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1457', '4', '500', '15', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1458', '6', '8000', '15', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1459', '1', '55000', '16', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1460', '2', '1000', '16', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1461', '5', '2000', '16', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1462', '7', '2000', '16', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1463', '12', '2000', '16', '3', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1464', '10', '500', '16', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1465', '3', '1000', '16', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1466', '4', '500', '16', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1467', '6', '8000', '16', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1468', '1', '55000', '17', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1469', '2', '1000', '17', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1470', '5', '2000', '17', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1471', '7', '2000', '17', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1472', '12', '2000', '17', '3', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1473', '10', '500', '17', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1474', '3', '1000', '17', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1475', '4', '500', '17', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1476', '6', '8000', '17', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1477', '1', '55000', '18', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1478', '2', '1000', '18', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1479', '5', '2000', '18', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1480', '7', '2000', '18', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1481', '12', '2000', '18', '3', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1482', '10', '500', '18', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1483', '3', '1000', '18', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1484', '4', '500', '18', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1485', '6', '8000', '18', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1486', '1', '57000', '19', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1487', '2', '1000', '19', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1488', '5', '2000', '19', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1489', '7', '2000', '19', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1490', '12', '2000', '19', '3', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1491', '10', '500', '19', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1492', '3', '1000', '19', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1493', '4', '500', '19', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1494', '6', '8000', '19', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1495', '1', '57000', '20', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1496', '2', '1000', '20', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1497', '5', '2000', '20', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1498', '7', '2000', '20', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1499', '12', '2000', '20', '3', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1500', '10', '500', '20', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1501', '3', '1000', '20', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1502', '4', '500', '20', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1503', '6', '8000', '20', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1504', '1', '57000', '21', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1505', '2', '1000', '21', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1506', '5', '2000', '21', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1507', '7', '2000', '21', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1508', '12', '2000', '21', '3', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1509', '10', '500', '21', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1510', '3', '1000', '21', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1511', '4', '500', '21', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1512', '6', '8000', '21', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1513', '1', '57000', '22', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1514', '2', '1000', '22', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1515', '5', '2000', '22', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1516', '7', '2000', '22', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1517', '12', '2000', '22', '3', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1518', '10', '500', '22', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1519', '3', '1000', '22', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1520', '4', '500', '22', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1521', '6', '8000', '22', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1522', '1', '57000', '23', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1523', '2', '1000', '23', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1524', '5', '2000', '23', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1525', '7', '2000', '23', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1526', '12', '2000', '23', '3', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1527', '10', '500', '23', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1528', '3', '1000', '23', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1529', '4', '500', '23', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1530', '6', '8000', '23', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1531', '1', '57000', '24', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1532', '2', '1000', '24', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1533', '5', '2000', '24', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1534', '7', '2000', '24', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1535', '12', '2000', '24', '3', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1536', '10', '500', '24', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1537', '3', '1000', '24', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1538', '4', '500', '24', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1539', '6', '8000', '24', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1540', '1', '60000', '25', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1541', '2', '1000', '25', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1542', '3', '1500', '25', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1543', '4', '700', '25', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1544', '5', '2500', '25', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1545', '6', '8000', '25', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1546', '7', '2000', '25', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1547', '12', '2000', '25', '3', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1548', '10', '500', '25', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1549', '11', '2500', '25', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1550', '1', '60000', '26', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1551', '2', '1000', '26', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1552', '3', '1500', '26', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1553', '4', '700', '26', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1554', '5', '2500', '26', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1555', '6', '8000', '26', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1556', '7', '2000', '26', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1557', '12', '2000', '26', '3', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1558', '10', '500', '26', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1559', '11', '2500', '26', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1560', '1', '60000', '27', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1561', '2', '1000', '27', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1562', '3', '1500', '27', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1563', '4', '700', '27', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1564', '5', '2500', '27', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1565', '6', '8000', '27', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1566', '7', '2000', '27', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1567', '12', '2000', '27', '3', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1568', '10', '500', '27', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1569', '11', '2500', '27', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1570', '1', '60000', '28', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1571', '2', '1000', '28', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1572', '3', '1500', '28', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1573', '4', '700', '28', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1574', '5', '2500', '28', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1575', '6', '8000', '28', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1576', '7', '2000', '28', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1577', '12', '2000', '28', '3', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1578', '10', '500', '28', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1579', '11', '2500', '28', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1580', '1', '60000', '29', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1581', '2', '1000', '29', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1582', '3', '1500', '29', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1583', '4', '700', '29', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1584', '5', '2500', '29', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1585', '6', '8000', '29', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1586', '7', '2000', '29', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1587', '12', '2000', '29', '3', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1588', '10', '500', '29', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1589', '11', '2500', '29', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1590', '1', '60000', '30', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1591', '2', '1000', '30', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1592', '3', '1500', '30', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1593', '4', '700', '30', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1594', '5', '2500', '30', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1595', '6', '8000', '30', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1596', '7', '2000', '30', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1597', '12', '2000', '30', '3', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1598', '10', '500', '30', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1599', '11', '2500', '30', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1600', '1', '60000', '31', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1601', '2', '1000', '31', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1602', '3', '1500', '31', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1603', '4', '700', '31', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1604', '5', '2500', '31', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1605', '6', '8000', '31', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1606', '7', '2000', '31', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1607', '10', '500', '31', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1608', '11', '2500', '31', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1609', '8', '8000', '31', '3', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1610', '1', '60000', '32', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1611', '2', '1000', '32', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1612', '3', '1500', '32', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1613', '4', '700', '32', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1614', '5', '2500', '32', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1615', '6', '8000', '32', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1616', '7', '2000', '32', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1617', '10', '500', '32', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1618', '11', '2500', '32', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1619', '8', '8000', '32', '3', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1620', '1', '75000', '33', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1621', '2', '1000', '33', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1622', '3', '1500', '33', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1623', '4', '1000', '33', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1624', '5', '3000', '33', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1625', '6', '8000', '33', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1626', '7', '2000', '33', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1627', '12', '2000', '33', '3', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1628', '10', '500', '33', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1629', '11', '5000', '33', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1630', '1', '75000', '34', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1631', '2', '1000', '34', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1632', '3', '1500', '34', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1633', '4', '1000', '34', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1634', '5', '3000', '34', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1635', '6', '8000', '34', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1636', '7', '2000', '34', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1637', '12', '2000', '34', '3', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1638', '10', '500', '34', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1639', '11', '5000', '34', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1640', '1', '75000', '35', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1641', '2', '1000', '35', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1642', '3', '1500', '35', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1643', '4', '1000', '35', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1644', '5', '3000', '35', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1645', '6', '8000', '35', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1646', '7', '2000', '35', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1647', '12', '2000', '35', '3', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1648', '10', '500', '35', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1649', '11', '5000', '35', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1650', '1', '75000', '36', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1651', '2', '1000', '36', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1652', '3', '1500', '36', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1653', '4', '1000', '36', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1654', '5', '3000', '36', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1655', '6', '8000', '36', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1656', '7', '2000', '36', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1657', '12', '2000', '36', '3', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1658', '10', '500', '36', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1659', '11', '5000', '36', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1660', '1', '75000', '37', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1661', '2', '1000', '37', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1662', '3', '1500', '37', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1663', '4', '1000', '37', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1664', '5', '3000', '37', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1665', '6', '8000', '37', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1666', '7', '2000', '37', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1667', '12', '2000', '37', '3', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1668', '10', '500', '37', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1669', '11', '5000', '37', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1670', '1', '75000', '38', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1671', '2', '1000', '38', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1672', '3', '1500', '38', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1673', '4', '1000', '38', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1674', '5', '3000', '38', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1675', '6', '8000', '38', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1676', '7', '2000', '38', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1677', '10', '500', '38', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1678', '11', '5000', '38', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1679', '8', '8000', '38', '3', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1680', '1', '75000', '39', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1681', '2', '1000', '39', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1682', '3', '1500', '39', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1683', '4', '1000', '39', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1684', '5', '3000', '39', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1685', '6', '8000', '39', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1686', '7', '2000', '39', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1687', '10', '500', '39', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1688', '11', '5000', '39', '3', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1689', '8', '8000', '39', '3', '2', '2');

-- ----------------------------
-- Table structure for schools_attended
-- ----------------------------
DROP TABLE IF EXISTS `schools_attended`;
CREATE TABLE `schools_attended` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `school_name` varchar(200) DEFAULT NULL,
  `class_from_id` int(11) NOT NULL,
  `class_to_id` int(11) NOT NULL,
  `year_from` int(4) DEFAULT NULL,
  `year_to` int(4) DEFAULT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`class_from_id`,`class_to_id`,`user_id`),
  KEY `fk_schools_attended_classes1_idx` (`class_from_id`),
  KEY `fk_schools_attended_classes2_idx` (`class_to_id`),
  KEY `fk_schools_attended_users1_idx` (`user_id`),
  CONSTRAINT `fk_schools_attended_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of schools_attended
-- ----------------------------

-- ----------------------------
-- Table structure for sessions
-- ----------------------------
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` varchar(40) NOT NULL,
  `last_activity` int(11) NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sessions
-- ----------------------------
INSERT INTO `sessions` VALUES ('BtRXz8QfibydtVoUnFyogDda0ozGa1iLOSlTDDxY', '1380477507', 'a:9:{s:10:\"csrf_token\";s:40:\"t12sPYL8S2ya9COozRyEVPxjkkMfjPqHWKGMYAJo\";s:5:\":new:\";a:0:{}s:5:\":old:\";a:0:{}s:35:\"laravel_auth_drivers_eloquent_login\";i:991;s:7:\"user_id\";i:991;s:5:\"email\";s:27:\"muhammed.ibrahim@ais.sch.ng\";s:9:\"firstname\";s:9:\"MUHAMMED \";s:7:\"surname\";s:7:\"IBRAHIM\";s:7:\"role_id\";i:1;}');

-- ----------------------------
-- Table structure for staff_attendance
-- ----------------------------
DROP TABLE IF EXISTS `staff_attendance`;
CREATE TABLE `staff_attendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attendance_date` datetime DEFAULT NULL,
  `staff_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`staff_id`),
  KEY `fk_staff_attendance_staff_records1_idx` (`staff_id`),
  CONSTRAINT `fk_staff_attendance_staff_records1` FOREIGN KEY (`staff_id`) REFERENCES `staff_records` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of staff_attendance
-- ----------------------------

-- ----------------------------
-- Table structure for staff_records
-- ----------------------------
DROP TABLE IF EXISTS `staff_records`;
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
  `gender_id` int(11) NOT NULL DEFAULT '0',
  `state_of_origin` int(11) NOT NULL DEFAULT '0',
  `nationality_id` int(11) NOT NULL DEFAULT '0',
  `designation_id` int(11) NOT NULL DEFAULT '0',
  `bank_account_number` varchar(10) DEFAULT NULL,
  `bank_id` int(11) NOT NULL DEFAULT '0',
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

-- ----------------------------
-- Records of staff_records
-- ----------------------------
INSERT INTO `staff_records` VALUES ('1', 'AIS/1234', 'Mfawa Alfred Onen', 'Somewhere in Nevada', '(080) 5944 3154', 'muffycompoqm@gmail.com', 'B.sc Geography', '2013-09-06', '', '2', '2013-09-06', '1379707318_passport.jpg', '1', '9', '118', '1', '0026511233', '5');

-- ----------------------------
-- Table structure for states
-- ----------------------------
DROP TABLE IF EXISTS `states`;
CREATE TABLE `states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of states
-- ----------------------------
INSERT INTO `states` VALUES ('1', 'Abia');
INSERT INTO `states` VALUES ('2', 'Adamawa');
INSERT INTO `states` VALUES ('3', 'Akwa-Ibom');
INSERT INTO `states` VALUES ('4', 'Anambra');
INSERT INTO `states` VALUES ('5', 'Bauchi');
INSERT INTO `states` VALUES ('6', 'Bayelsa');
INSERT INTO `states` VALUES ('7', 'Benue');
INSERT INTO `states` VALUES ('8', 'Borno');
INSERT INTO `states` VALUES ('9', 'Cross River');
INSERT INTO `states` VALUES ('10', 'Delta');
INSERT INTO `states` VALUES ('11', 'Ebonyi');
INSERT INTO `states` VALUES ('12', 'Edo');
INSERT INTO `states` VALUES ('13', 'Ekiti');
INSERT INTO `states` VALUES ('14', 'Enugu');
INSERT INTO `states` VALUES ('15', 'Gombe');
INSERT INTO `states` VALUES ('16', 'Imo');
INSERT INTO `states` VALUES ('17', 'Jigawa');
INSERT INTO `states` VALUES ('18', 'Kaduna');
INSERT INTO `states` VALUES ('19', 'Kano');
INSERT INTO `states` VALUES ('20', 'Katsina');
INSERT INTO `states` VALUES ('21', 'Kebbi');
INSERT INTO `states` VALUES ('22', 'Kogi');
INSERT INTO `states` VALUES ('23', 'Kwara');
INSERT INTO `states` VALUES ('24', 'Lagos');
INSERT INTO `states` VALUES ('25', 'Nasarawa');
INSERT INTO `states` VALUES ('26', 'Niger');
INSERT INTO `states` VALUES ('27', 'Ogun');
INSERT INTO `states` VALUES ('28', 'Ondo');
INSERT INTO `states` VALUES ('29', 'Osun');
INSERT INTO `states` VALUES ('30', 'Oyo');
INSERT INTO `states` VALUES ('31', 'Plateau');
INSERT INTO `states` VALUES ('32', 'Rivers');
INSERT INTO `states` VALUES ('33', 'Sokoto');
INSERT INTO `states` VALUES ('34', 'Taraba');
INSERT INTO `states` VALUES ('35', 'Yobe');
INSERT INTO `states` VALUES ('36', 'Zamfara');
INSERT INTO `states` VALUES ('37', 'FCT');
INSERT INTO `states` VALUES ('38', 'Other');

-- ----------------------------
-- Table structure for subjects
-- ----------------------------
DROP TABLE IF EXISTS `subjects`;
CREATE TABLE `subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject_name` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of subjects
-- ----------------------------
INSERT INTO `subjects` VALUES ('1', 'Mathematics');
INSERT INTO `subjects` VALUES ('2', 'English');
INSERT INTO `subjects` VALUES ('3', 'Biology');
INSERT INTO `subjects` VALUES ('4', 'Chemistry');
INSERT INTO `subjects` VALUES ('5', 'Physics');
INSERT INTO `subjects` VALUES ('6', 'Phonics');
INSERT INTO `subjects` VALUES ('7', 'Handwriting');
INSERT INTO `subjects` VALUES ('8', 'Fine Arts');
INSERT INTO `subjects` VALUES ('9', 'Qur’an');
INSERT INTO `subjects` VALUES ('10', 'Arabic');
INSERT INTO `subjects` VALUES ('11', 'Islamic Religious Knowledge');
INSERT INTO `subjects` VALUES ('12', 'Health Habits');
INSERT INTO `subjects` VALUES ('13', 'Writing');
INSERT INTO `subjects` VALUES ('14', 'Computer studies');
INSERT INTO `subjects` VALUES ('15', 'Creative Arts');
INSERT INTO `subjects` VALUES ('16', 'Social Studies');
INSERT INTO `subjects` VALUES ('17', 'Basic Science');
INSERT INTO `subjects` VALUES ('18', 'Agricultural Science');
INSERT INTO `subjects` VALUES ('19', 'Information Technology');
INSERT INTO `subjects` VALUES ('20', 'Civic Education');
INSERT INTO `subjects` VALUES ('21', 'Vocational');
INSERT INTO `subjects` VALUES ('22', 'French');
INSERT INTO `subjects` VALUES ('23', 'Comprehension');
INSERT INTO `subjects` VALUES ('24', 'Hausa Language');
INSERT INTO `subjects` VALUES ('25', 'Basic Technology');
INSERT INTO `subjects` VALUES ('26', 'Business Studies');
INSERT INTO `subjects` VALUES ('27', 'Home Economics');
INSERT INTO `subjects` VALUES ('28', 'Physical Health Education (P.H.E)');
INSERT INTO `subjects` VALUES ('29', 'Technical Drawing');
INSERT INTO `subjects` VALUES ('30', 'Animal Husbandry');
INSERT INTO `subjects` VALUES ('31', 'Data Processing');
INSERT INTO `subjects` VALUES ('32', 'Government ');
INSERT INTO `subjects` VALUES ('33', 'Commerce');
INSERT INTO `subjects` VALUES ('34', 'Economics');
INSERT INTO `subjects` VALUES ('35', 'Literature');
INSERT INTO `subjects` VALUES ('36', 'Geography');
INSERT INTO `subjects` VALUES ('37', 'Principles of Accounts');
INSERT INTO `subjects` VALUES ('38', 'General Science');

-- ----------------------------
-- Table structure for teachers_and_classes
-- ----------------------------
DROP TABLE IF EXISTS `teachers_and_classes`;
CREATE TABLE `teachers_and_classes` (
  `user_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`class_id`),
  KEY `fk_users_has_classes_classes1_idx` (`class_id`),
  KEY `fk_users_has_classes_users1_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teachers_and_classes
-- ----------------------------
INSERT INTO `teachers_and_classes` VALUES ('3', '2');
INSERT INTO `teachers_and_classes` VALUES ('4', '3');
INSERT INTO `teachers_and_classes` VALUES ('5', '4');
INSERT INTO `teachers_and_classes` VALUES ('6', '5');
INSERT INTO `teachers_and_classes` VALUES ('7', '6');
INSERT INTO `teachers_and_classes` VALUES ('8', '7');
INSERT INTO `teachers_and_classes` VALUES ('9', '8');
INSERT INTO `teachers_and_classes` VALUES ('10', '9');
INSERT INTO `teachers_and_classes` VALUES ('11', '10');
INSERT INTO `teachers_and_classes` VALUES ('12', '11');
INSERT INTO `teachers_and_classes` VALUES ('13', '12');
INSERT INTO `teachers_and_classes` VALUES ('14', '13');
INSERT INTO `teachers_and_classes` VALUES ('15', '14');
INSERT INTO `teachers_and_classes` VALUES ('16', '15');
INSERT INTO `teachers_and_classes` VALUES ('17', '16');
INSERT INTO `teachers_and_classes` VALUES ('18', '17');
INSERT INTO `teachers_and_classes` VALUES ('19', '18');
INSERT INTO `teachers_and_classes` VALUES ('20', '19');
INSERT INTO `teachers_and_classes` VALUES ('21', '20');
INSERT INTO `teachers_and_classes` VALUES ('22', '21');
INSERT INTO `teachers_and_classes` VALUES ('23', '22');
INSERT INTO `teachers_and_classes` VALUES ('24', '23');
INSERT INTO `teachers_and_classes` VALUES ('25', '24');
INSERT INTO `teachers_and_classes` VALUES ('26', '25');
INSERT INTO `teachers_and_classes` VALUES ('27', '26');
INSERT INTO `teachers_and_classes` VALUES ('28', '27');
INSERT INTO `teachers_and_classes` VALUES ('29', '28');
INSERT INTO `teachers_and_classes` VALUES ('30', '29');
INSERT INTO `teachers_and_classes` VALUES ('31', '30');
INSERT INTO `teachers_and_classes` VALUES ('32', '31');
INSERT INTO `teachers_and_classes` VALUES ('33', '32');
INSERT INTO `teachers_and_classes` VALUES ('34', '33');
INSERT INTO `teachers_and_classes` VALUES ('35', '34');
INSERT INTO `teachers_and_classes` VALUES ('36', '35');
INSERT INTO `teachers_and_classes` VALUES ('37', '36');
INSERT INTO `teachers_and_classes` VALUES ('38', '37');
INSERT INTO `teachers_and_classes` VALUES ('39', '38');
INSERT INTO `teachers_and_classes` VALUES ('40', '39');

-- ----------------------------
-- Table structure for teachers_and_subjects
-- ----------------------------
DROP TABLE IF EXISTS `teachers_and_subjects`;
CREATE TABLE `teachers_and_subjects` (
  `user_id` int(11) NOT NULL DEFAULT '0',
  `subject_id` int(11) NOT NULL DEFAULT '0',
  `class_id` int(11) NOT NULL,
  `term_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`subject_id`,`class_id`,`term_id`),
  KEY `fk_users_has_subjects_subjects1_idx` (`subject_id`),
  KEY `fk_users_has_subjects_users1_idx` (`user_id`),
  KEY `fk_teachers_and_subjects_classes1_idx` (`class_id`),
  KEY `fk_teachers_and_subjects_terms1_idx` (`term_id`),
  CONSTRAINT `fk_users_has_subjects_subjects1` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_users_has_subjects_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teachers_and_subjects
-- ----------------------------

-- ----------------------------
-- Table structure for terms
-- ----------------------------
DROP TABLE IF EXISTS `terms`;
CREATE TABLE `terms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `term` varchar(15) DEFAULT NULL,
  `active_term` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of terms
-- ----------------------------
INSERT INTO `terms` VALUES ('1', 'First Term', '1');
INSERT INTO `terms` VALUES ('2', 'Second Term', '0');
INSERT INTO `terms` VALUES ('3', 'Third Term', '0');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(25) DEFAULT NULL,
  `surname` varchar(45) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `role_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`role_id`),
  KEY `fk_users_roles_idx` (`role_id`),
  CONSTRAINT `fk_users_roles` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1349 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'Ais', 'Administrator', 'admin@ais.sch.ng', '$2a$08$tfFzi9y9Tmhb..WyTfA4t.miWanQ3dBiMfWlfThrnlKoM3Qk9Oyd6', '5');
INSERT INTO `users` VALUES ('2', 'Ais', 'Accountant', 'accountant@ais.sch.ng', '$2a$08$3erG/D8OrKDh31nxkEXfB.pC1TJdX.f8LkS/AFX9kE0L3x/e.JN8K', '3');
INSERT INTO `users` VALUES ('3', 'Abdulkarim', 'Adam', 'abdulkarim.adam@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '2');
INSERT INTO `users` VALUES ('4', 'Mohammad', 'Labaran', 'mohammad.labaran@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '2');
INSERT INTO `users` VALUES ('5', 'Abubakar', 'Anvoh', 'abubakar.anvoh@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '2');
INSERT INTO `users` VALUES ('6', 'Saratu', 'Lawal', 'saratu.lawal@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '2');
INSERT INTO `users` VALUES ('7', 'Ngozi', 'Oboli', 'ngozi.oboli@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '2');
INSERT INTO `users` VALUES ('8', 'Hashiya', 'Sheidu', 'hashiya.sheidu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '2');
INSERT INTO `users` VALUES ('9', 'Salimat', 'Abdul-Gaffar', 'salimat.abdul@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '2');
INSERT INTO `users` VALUES ('10', 'Samiat', 'Ibrahim', 'samiat.ibrahim@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '2');
INSERT INTO `users` VALUES ('11', 'Amina', 'Zoru', 'amina.zoru@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '2');
INSERT INTO `users` VALUES ('12', 'Rosemary', 'Ojochegbe', 'rosemary.ojochegbe@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '2');
INSERT INTO `users` VALUES ('13', 'lfeoma', 'Okechukwu', 'lfeoma.okechukwu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '2');
INSERT INTO `users` VALUES ('14', 'Hannatu', 'Sanni', 'hannatu.sanni@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '2');
INSERT INTO `users` VALUES ('15', 'Ali', 'Eze', 'ali.eze@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '2');
INSERT INTO `users` VALUES ('16', 'Suleiman', 'Muhammad', 'suleiman.muhammad@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '2');
INSERT INTO `users` VALUES ('17', 'Jude', 'Peter', 'jude.peter@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '2');
INSERT INTO `users` VALUES ('18', 'Daniel', 'Young', 'daniel.young@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '2');
INSERT INTO `users` VALUES ('19', 'Ramalan', 'Fatimah', 'ramalan.fatimah@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '2');
INSERT INTO `users` VALUES ('20', 'Alabi', 'Abubakar', 'alabi.abubakar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '2');
INSERT INTO `users` VALUES ('21', 'Ambrose', 'Unwerhauve', 'ambrose.unwerhauve@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '2');
INSERT INTO `users` VALUES ('22', 'Riskat', 'Abubakar', 'riskat.abubakar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '2');
INSERT INTO `users` VALUES ('23', 'Muritala', 'Maigari', 'muritala.maigari@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '2');
INSERT INTO `users` VALUES ('24', 'Muibat', 'Jaiyeala', 'muibat.jaiyeala@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '2');
INSERT INTO `users` VALUES ('25', 'Muhammad', 'Awwal', 'muhammad.awwal@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '2');
INSERT INTO `users` VALUES ('26', 'Kemi', 'Esther', 'kemi.esther@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '2');
INSERT INTO `users` VALUES ('27', 'Sherifat', 'Ayuba', 'sherifat.ayuba@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '2');
INSERT INTO `users` VALUES ('28', 'Razzaqi', 'Abbas', 'razzaqi.abbas@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '2');
INSERT INTO `users` VALUES ('29', 'Habiba', 'Omolara', 'habiba.omolara@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '2');
INSERT INTO `users` VALUES ('30', 'Umar', 'Mababub', 'umar.mababub@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '2');
INSERT INTO `users` VALUES ('31', 'Faisal', 'Abubakar', 'faisal.abubakar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '2');
INSERT INTO `users` VALUES ('32', 'Suleiman', 'lsah', 'suleiman.isah@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '2');
INSERT INTO `users` VALUES ('33', 'Kehinde', 'Oladayo', 'kehinde.oladayo@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '2');
INSERT INTO `users` VALUES ('34', 'Oyevvale', 'Femi', 'oyevvale.femi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '2');
INSERT INTO `users` VALUES ('35', 'Atiyu', 'M', 'atiyu.m@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '2');
INSERT INTO `users` VALUES ('36', 'Emmanuel', 'Babatude', 'emmanuel.babatude@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '2');
INSERT INTO `users` VALUES ('37', 'Olaniyan', 'Olatunji', 'olaniyan.olatunji@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '2');
INSERT INTO `users` VALUES ('38', 'Joseph', '', 'joseph@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '2');
INSERT INTO `users` VALUES ('39', 'Lawal', 'Ahmed', 'lawal.ahmed@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '2');
INSERT INTO `users` VALUES ('40', 'Alfred', 'Mngbari', 'alfred.mngbari@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '2');
INSERT INTO `users` VALUES ('42', 'AASIYA', 'USMAN', 'aasiya.usman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('43', 'ABBA', 'LAWAL', 'abba.lawal@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('44', 'ABBA', 'KASHIM', 'abba.kashim@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('45', 'ABBA', 'KASHIM', 'abba.kashim2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('46', 'ABBAS', 'MUSA', 'abbas.musa@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('47', 'ABDALLAH', 'MARI', 'abdallah.mari@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('48', 'ABDALLAH', 'MOHAMMAD', 'abdallah.mohammad@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('49', 'ABDALLAH', 'YAKUBU', 'abdallah.yakubu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('50', 'ABDILMAJIB', 'ABDULBASIT ', 'abdilmajib.abdulbasit@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('51', 'ABDUL HAKIM', 'IBRAHIM', 'abdulhakim.ibrahim@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('52', 'ABDUL WAHAB', 'MUHAMMAD ', 'abdulwahab.muhammad@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('53', 'ABDULAHAD', 'SADIQ', 'abdulahad.sadiq@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('54', 'ABDULALIM', 'ISMAIL', 'abdulalim.ismail@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('55', 'ABDULAZIZ', 'OTHMAN', 'abdulaziz.othman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('56', 'ABDULBASIT', 'ABDULLAH', 'abdulbasit.abdullah@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('57', 'ABDULFATAI', 'YUNUS ', 'abdulfatai.yunus@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('58', 'ABDULHAFIZ', 'YEKEEN', 'abdulhafiz.yekeen@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('59', 'ABDUL-HAFIZ', 'ALIYU', 'abdul-hafiz.aliyu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('60', 'ABDULHAKEEM', 'ABDULAZEEZ', 'abdulhakeem.abdulazeez@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('61', 'ABDUL-HAKEEM', 'ABUBAKAR', 'abdul-hakeem.abubakar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('62', 'ABDULHANNAN', 'YUSUF', 'abdulhannan.yusuf@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('63', 'ABDULINADUD', 'ISMAIL ALATISE', 'abdulinadud.ismailalatise@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('64', 'ABDULJABBAR', 'IBRAHIM', 'abduljabbar.ibrahim@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('65', 'ABDUL-JABBAR', 'DIKKO', 'abdul-jabbar.dikko@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('66', 'ABDULJALAL', 'ABUBAKAR', 'abduljalal.abubakar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('67', 'ABDUL-JALAL', 'WANKA', 'abdul-jalal.wanka@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('68', 'ABDUL-JALAL', 'MOHAMMED', 'abdul-jalal.mohammed@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('69', 'ABDULJALEEL', 'HUSSEINI', 'abduljaleel.husseini@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('70', 'ABDULKADIR', 'BELLO', 'abdulkadir.bello@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('71', 'ABDULKADIR', 'NIIMAT ', 'abdulkadir.niimat@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('72', 'ABDULKADIR', 'KABIR', 'abdulkadir.kabir@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('73', 'ABDULLAH', 'AMINU USMAN', 'abdullah.aminuusman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('74', 'ABDULLAH', 'UMAR', 'abdullah.umar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('75', 'ABDULLAHI', 'USMAN ALIYU', 'abdullahi.usmanaliyu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('76', 'ABDULLAHI', 'MOHAMMED', 'abdullahi.mohammed@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('77', 'ABDULLAHI', 'YAKASAI', 'abdullahi.yakasai@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('78', 'ABDULLAHI', 'BAKOJI', 'abdullahi.bakoji@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('79', 'ABDULLAHI', 'NURUDEEN', 'abdullahi.nurudeen@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('80', 'ABDULLAHI', 'IDRIS', 'abdullahi.idris@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('81', 'ABDULLAHI', 'ISAH', 'abdullahi.isah@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('82', 'ABDULLAHI', 'SANI', 'abdullahi.sani@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('83', 'ABDULLAHI', 'MOAHAMMED ', 'abdullahi.moahammed@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('84', 'ABDULLAHI', 'BUKAR', 'abdullahi.bukar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('85', 'ABDULLAHI', 'MOHAMMED', 'abdullahi.mohammed2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('86', 'ABDULLAHI', 'AMINU', 'abdullahi.aminu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('87', 'ABDULLAHI ', 'AHMED', 'abdullahi.ahmed@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('88', 'ABDULLAHI ', 'BABANKOGI', 'abdullahi.babankogi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('89', 'ABDULLAHI MOHD', 'BAKOJI', 'abdullahimohd.bakoji@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('90', 'ABDULMALIK', 'BELLO', 'abdulmalik.bello@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('91', 'ABDULMALIK', 'BELLO', 'abdulmalik.bello2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('92', 'ABDULMANNAN', 'YUSUF', 'abdulmannan.yusuf@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('93', 'ABDULMUGNIY', 'BELLO', 'abdulmugniy.bello@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('94', 'ABDULMUIZZ', 'BELLO', 'abdulmuizz.bello@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('95', 'ABDULMUMINI', 'BELLO', 'abdulmumini.bello@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('96', 'ABDULMUQSIT', 'BELLO', 'abdulmuqsit.bello@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('97', 'ABDULMUSAWWIR', 'YUNUS', 'abdulmusawwir.yunus@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('98', 'ABDULQADIR', 'SHUAIBU', 'abdulqadir.shuaibu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('99', 'ABDULQADIR', 'BADAMASI', 'abdulqadir.badamasi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('100', 'ABDULQADIR', 'SHUAIBU', 'abdulqadir.shuaibu2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('101', 'ABDULRAHAMAN', 'BADMOS', 'abdulrahaman.badmos@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('102', 'ABDUL-RAHIM', 'SHIRO', 'abdul-rahim.shiro@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('103', 'ABDULRAHMAN', 'HASSAN', 'abdulrahman.hassan@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('104', 'ABDULRAHMAN', 'SANI', 'abdulrahman.sani@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('105', 'ABDULRAHMAN', 'BASHAR', 'abdulrahman.bashar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('106', 'ABDULRAHMAN', 'ALBASU', 'abdulrahman.albasu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('107', 'ABDULRAHMAN', 'SAGIR MUSA', 'abdulrahman.sagirmusa@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('108', 'ABDULRAHMAN', 'ABDULRAZAQ', 'abdulrahman.abdulrazaq@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('109', 'ABDULRAHMAN', 'UMAR LAU', 'abdulrahman.umarlau@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('110', 'ABDULRAHMAN', 'ABUBAKAR', 'abdulrahman.abubakar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('111', 'ABDULRAHMAN', 'IDRIS', 'abdulrahman.idris@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('112', 'ABDUL-RAHMAN', 'KOLOBE', 'abdul-rahman.kolobe@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('113', 'ABDUL-RAHMAN', 'ABUBAKAR', 'abdul-rahman.abubakar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('114', 'ABDUL-RAHMAN', 'SULEIMAN', 'abdul-rahman.suleiman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('115', 'ABDULRAHMAN ', 'TAMIM', 'abdulrahman.tamim@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('116', 'ABDULRAZAQ', 'ISAKOTO', 'abdulrazaq.isakoto@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('117', 'ABDULRRAHMAN', 'SANI', 'abdulrrahman.sani@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('118', 'ABDULSALAM', 'USMAN', 'abdulsalam.usman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('119', 'ABDULSALAM', 'HUSSAINA', 'abdulsalam.hussaina@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('120', 'ABDULSAMAD', 'BAKOJI', 'abdulsamad.bakoji@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('121', 'ABDULSAMAD', 'UMAR MODIBBO', 'abdulsamad.umarmodibbo@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('122', 'ABDULSAMAD', 'SULEIMAN', 'abdulsamad.suleiman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('123', 'ABDULSMAD', 'IBRAHIM', 'abdulsmad.ibrahim@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('124', 'ABDURRAHEEM', 'HALLIRU', 'abdurraheem.halliru@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('125', 'ABDURRAHMAN', 'HASSAN', 'abdurrahman.hassan@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('126', 'ABDUR-RAHMAN', 'MUHAMMED', 'abdur-rahman.muhammed@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('127', 'ABDURRAUF', 'MIQDAD ', 'abdurrauf.miqdad@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('128', 'ABDUSSAMAD', 'OTHMAN', 'abdussamad.othman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('129', 'ABDUSSAMAD', 'BADAMASI', 'abdussamad.badamasi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('130', 'ABIDA', 'UMAR USMAN', 'abida.umarusman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('131', 'ABIDA', 'SANI', 'abida.sani@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('132', 'ABIDA', 'HABIB', 'abida.habib@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('133', 'ABUBAKAR', 'ISAH', 'abubakar.isah@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('134', 'ABUBAKAR', 'SHEHU', 'abubakar.shehu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('135', 'ABUBAKAR', 'UMAR', 'abubakar.umar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('136', 'ABUBAKAR', 'MUSA', 'abubakar.musa@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('137', 'ABUBAKAR', 'ABUBAKAR', 'abubakar.abubakar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('138', 'ABUBAKAR', 'BADAMASI', 'abubakar.badamasi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('139', 'ABUBAKAR', 'ABUBAKAR', 'abubakar.abubakar2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('140', 'ABUBAKAR', 'ADAMU', 'abubakar.adamu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('141', 'ABUBAKAR', 'IBRAHIM', 'abubakar.ibrahim@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('142', 'ABUBAKAR', 'ABUBAKAR', 'abubakar.abubakar3@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('143', 'ABUBAKAR', 'SADIQ', 'abubakar.sadiq@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('144', 'ABUBAKAR', 'SANUSI', 'abubakar.sanusi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('145', 'ABUBAKAR', 'GARBA', 'abubakar.garba@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('146', 'ABUBAKAR', 'ALBASU', 'abubakar.albasu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('147', 'ABUBAKAR', 'LAWAN', 'abubakar.lawan@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('148', 'ABUBAKAR', 'LAWAL', 'abubakar.lawal@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('149', 'ABUBAKAR', 'SARATU', 'abubakar.saratu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('150', 'ABUBAKAR', 'NANA KHADIJA ', 'abubakar.nanakhadija@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('151', 'ABUBAKAR', 'BARDE', 'abubakar.barde@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('152', 'ABUBAKAR', 'GAZARA', 'abubakar.gazara@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('153', 'ABUBAKAR', 'ABDULLAHI', 'abubakar.abdullahi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('154', 'ABUBAKAR', 'USMAN', 'abubakar.garba2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('155', 'ABUBAKAR', 'IBRAHIM', 'abubakar.ibrahim2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('156', 'ABUBAKAR', 'USMAN', 'abubakar.usman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('157', 'ABUBAKAR', 'MOHAMMED', 'abubakar.mohammed@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('158', 'ABUBAKAR', 'GARBA', 'abubakar.garba3@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('159', 'ABUBAKAR', 'KUCHAZI', 'abubakar.kuchazi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('160', 'ABUBAKAR', 'HARUNA', 'abubakar.haruna@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('161', 'ABUBAKAR', 'MUHAMMED', 'abubakar.muhammed@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('162', 'ABUBAKAR', 'LAWAN', 'abubakar.lawan2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('163', 'ABUBAKAR', 'GARBA', 'abubakar.garba4@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('164', 'ABUBAKAR ', 'MOHAMMED ', 'abubakar.mohammed@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('165', 'ABUBAKAR ', 'RABE', 'abubakar.rabe@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('166', 'ABUBAKAR SADIQ', 'SANI', 'abubakar.sani@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('167', 'ADAM', 'HUSSAIN', 'adam.hussain@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('168', 'ADAM', 'SANI', 'adam.sani@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('169', 'ADAM', 'YUGUDA', 'adam.yuguda@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('170', 'ADAM', 'UMAR ALIYU', 'adam.umaraliyu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('171', 'ADAM', 'DANLADI', 'adam.danladi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('172', 'ADAM', 'ABDULLAHI', 'adam.abdullahi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('173', 'ADAM', 'SHUAIBU', 'adam.shuaibu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('174', 'ADAM ', 'UMAR', 'adam.umar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('175', 'ADAMU', 'ISAH', 'adamu.isah@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('176', 'ADAMU', 'AMINAT', 'adamu.aminat@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('177', 'ADAMU', 'MUSA', 'adamu.musa@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('178', 'ADAMU', 'FATIMA', 'adamu.fatima@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('179', 'ADAMU', 'IBRAHIM', 'adamu.giade@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('180', 'ADAMU', 'IBRAHIM', 'adamu.ibrahim@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('181', 'ADIL', 'RAJI', 'adil.raji@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('182', 'ADIL', 'IYA', 'adil.iya@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('183', 'ADNAN', 'DANFULANI', 'adnan.danfulani@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('184', 'ADNAN', 'AL-AMIN', 'adnan.al-amin@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('185', 'ADNAN', 'MUSTAPHA', 'adnan.mustapha@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('186', 'AFOLASADE', 'ADELEKE', 'afolasade.adeleke@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('187', 'AFRAH', 'BELLO', 'afrah.bello@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('188', 'AHMAD', 'HUSSAIN', 'ahmad.hussain@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('189', 'AHMAD', 'USMAN', 'ahmad.usman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('190', 'AHMAD', 'ALIYU', 'ahmad.aliyu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('191', 'AHMAD', 'MOHAMMED', 'ahmad.mohammed@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('192', 'AHMAD', 'ADAM', 'ahmad.adam@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('193', 'AHMAD', 'SANI', 'ahmad.sani@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('194', 'AHMAD', 'ABUBAKAR', 'ahmad.abubakar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('195', 'AHMAD', 'SALAWU', 'ahmad.salawu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('196', 'AHMAD', 'ABDULLAHI ', 'ahmad.abdullahi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('197', 'AHMAD', 'ZAYYAN', 'ahmad.zayyan@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('198', 'AHMAD', 'SHUAIBU', 'ahmad.shuaibu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('199', 'AHMAD', 'IBRAHIM', 'ahmad.ibrahim@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('200', 'AHMAD', 'SHEHU', 'ahmad.shehu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('201', 'AHMAD', 'SULEIMAN', 'ahmad.suleiman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('202', 'AHMAD', 'AMIN', 'ahmad.amin@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('203', 'AHMAD', 'ZAKKA', 'ahmad.zakka@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('204', 'AHMAD', 'SHAMSUDDEEN', 'ahmad.shamsuddeen@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('205', 'AHMAD ', 'MOMOH', 'ahmad.momoh@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('206', 'AHMAD ', 'MOAHAMMED ', 'ahmad.moahammed@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('207', 'AHMED', 'ISHAH', 'ahmed.ishah@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('208', 'AHMED', 'DANKYARANA', 'ahmed.dankyarana@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('209', 'AHMED', 'SANI', 'ahmed.sani@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('210', 'AHMED', 'NASIRU', 'ahmed.nasiru@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('211', 'AHMED', 'SHEHU', 'ahmed.shehu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('212', 'AHMED', 'BELLO', 'ahmed.bello@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('213', 'AHMED', 'ZORU', 'ahmed.zoru@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('214', 'AHMED', 'LAWAN ', 'ahmed.lawan@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('215', 'AHMED', 'BAPPAH', 'ahmed.bappah@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('216', 'AISHA', 'SULEIMAN', 'aisha.suleiman2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('217', 'AISHA', 'AHMED', 'aisha.ahmed2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('218', 'AISHA', 'MUHAMMAD', 'aisha.muhammad2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('219', 'AISHA', 'AMINU', 'aisha.aminu2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('220', 'AISHA', 'KAITA', 'aisha.kaita@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('221', 'AISHA', 'ISA', 'aisha.isa@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('222', 'AISHA', 'ABUBAKAR', 'aisha.abubakar2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('223', 'AISHA', 'IBRAHIM', 'aisha.ibrahim2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('224', 'AISHA', 'BELLO ', 'aisha.bello2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('225', 'AISHA', 'AHMED', 'aisha.ahmed@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('226', 'AISHA', 'MIYIM', 'aisha.miyim@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('227', 'AISHA', 'USMAN ALIYU', 'aisha.usmanaliyu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('228', 'AISHA', 'AHMED', 'aisha.ahmed3@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('229', 'AISHA', 'UMAR', 'aisha.umar2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('230', 'AISHA', 'SADIQ', 'aisha.sadiq@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('231', 'AISHA', 'BELLO', 'aisha.bello2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('232', 'AISHA', 'ABDULLAHI', 'aisha.abdullahi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('233', 'AISHA', 'SHEHU', 'aisha.shehu2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('234', 'AISHA', 'ABDULRAZAQ', 'aisha.abdulrazaq@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('235', 'AISHA', 'UMAR ', 'aisha.umar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('236', 'AISHA', 'MOHAMMED', 'aisha.mohammed2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('237', 'AISHA', 'KABIR', 'aisha.kabir@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('238', 'AISHA', 'MUSA', 'aisha.musa2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('239', 'AISHA', 'ABUBAKAR', 'aisha.abubakar3@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('240', 'AISHA', 'DALHAT', 'aisha.dalhat@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('241', 'AISHA', 'MUAZU', 'aisha.muazu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('242', 'AISHA', 'SHEHU', 'aisha.shehu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('243', 'AISHA', 'GAZARA', 'aisha.gazara@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('244', 'AISHA', 'ABUBAKAR', 'aisha.abubakar4@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('245', 'AISHA', 'IBRAHIM', 'aisha.ibrahim3@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('246', 'AISHA', 'UMAR', 'aisha.umar3@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('247', 'AISHA', 'KUCHITA', 'aisha.kuchita@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('248', 'AISHA', 'SULEIMAN', 'aisha.suleiman3@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('249', 'AISHA', 'KAWU', 'aisha.kawu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('250', 'AISHA', 'MUSTAPHA', 'aisha.mustapha@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('251', 'AISHA', 'AHMED', 'aisha.ahmed4@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('252', 'AISHA', 'BELLO', 'aisha.bello@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('253', 'AISHA', 'SAIDU', 'aisha.saidu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('254', 'AISHA', 'ABDULAZIZ', 'aisha.abdulaziz@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('255', 'AISHA', 'YAHUZA', 'aisha.yahuza@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('256', 'AISHA', 'SANI', 'aisha.sani@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('257', 'AISHA', 'SHUAB', 'aisha.shuab@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('258', 'AISHA', 'IBRAHIM', 'aisha.ibrahim@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('259', 'AISHA', 'DALHATU', 'aisha.dalhatu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('260', 'AISHA', 'MUHAMMAD', 'aisha.muhammad@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('261', 'AISHA', 'BELLO DAHIRU', 'aisha.bellodahiru@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('262', 'AISHA', 'ADEWALE', 'aisha.adewale@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('263', 'AISHA', 'MAHMOOD ', 'aisha.mahmood@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('264', 'AISHA', 'MUHAMMED', 'aisha.dimari@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('265', 'AISHA', 'MUHAMMED', 'aisha.muhammed@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('266', 'AISHA', 'MOHAMMED', 'aisha.mohammed3@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('267', 'AISHA', 'YAHAYA', 'aisha.yahaya@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('268', 'AISHA', 'ABUBAKAR', 'aisha.abubakar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('269', 'AISHA', 'YUSUF', 'aisha.yusuf@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('270', 'AISHA', 'ONIYE', 'aisha.oniye@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('271', 'AISHA', 'UMAR', 'aisha.umar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('272', 'AISHA', 'USMAN', 'aisha.usman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('273', 'AISHA', 'MODIBBO', 'aisha.modibbo@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('274', 'AISHA', 'MUSA', 'aisha.musa@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('275', 'AISHA', 'ABDULLLAHI', 'aisha.abdulllahi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('276', 'AISHA', 'SULEIMAN', 'aisha.suleiman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('277', 'AISHA', 'BELLO ', 'aisha.bello@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('278', 'AISHA', 'AMINU', 'aisha.aminu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('279', 'AISHA', 'AL-QASIM', 'aisha.al-qasim@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('280', 'AISHA', 'MUSA ', 'aisha.musa@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('281', 'AISHA', 'MOHAMMED', 'aisha.mohammed@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('282', 'AISHA ', 'KUNDILA', 'aisha.kundila@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('283', 'AISHAT', 'ILELAH', 'aishat.ilelah@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('284', 'AISHAT', 'USMAN', 'aishat.usman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('285', 'AISHAT', 'USMAN', 'aishat.usman2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('286', 'AISHAT', 'ZAKARIYYA', 'aishat.zakariyya@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('287', 'AISHAT', 'YUSUF', 'aishat.yusuf@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('288', 'AISHAT ADAMU', 'MOHAMMED', 'aishatadamu.mohammed@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('289', 'AISHATU', 'TANIMU', 'aishatu.tanimu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('290', 'AISHATU', 'BAGUDU', 'aishatu.bagudu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('291', 'AISHATU', 'USMAN', 'aishatu.usman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('292', 'AISHATU-HUMAIRAH', 'BOBBO', 'aishatu-humairah.bobbo@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('293', 'AKINTOYE', 'AMINA', 'akintoye.amina@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('294', 'AKRAM', 'BELLO', 'akram.bello@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('295', 'AKRAM', 'BELLO  AKRAM', 'akram.belloakram@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('296', 'ALAMEEN', 'OWOSENI', 'alameen.owoseni@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('297', 'AL-AMIN', 'MUKHTAR', 'al-amin.mukhtar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('298', 'AL-AMIN', 'SANI', 'al-amin.sani@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('299', 'AL-AMIN', 'SALAWU', 'al-amin.salawu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('300', 'AL-AMIN', 'AMINU', 'al-amin.aminu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('301', 'AL-AMIN', 'BATURE', 'al-amin.bature@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('302', 'AL-AMIN', 'ABBAS', 'al-amin.abbas@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('303', 'AL-AMIN', 'AL-QASIM', 'al-amin.al-qasim@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('304', 'AL-AMIN M.', 'YUSUF', 'al-aminm..yusuf@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('305', 'ALATISE', 'ISMAIL', 'alatise.ismail@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('306', 'ALBARA', 'ABDULKADIR ', 'albara.abdulkadir@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('307', 'ALHAJI', 'YAHAYA', 'alhaji.yahaya@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('308', 'ALHASSAN', 'HADI', 'alhassan.hadi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('309', 'ALHASSAN', 'BABANGIDA', 'alhassan.babangida@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('310', 'AL-HASSAN', 'LAWAL', 'alhassan.lawal@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('311', 'AL-HUSSAIN', 'LAWAL', 'alhussain.lawal@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('312', 'ALI', 'KUKURI', 'ali.kukuri@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('313', 'ALI', 'LAWAN', 'ali.lawan@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('314', 'ALI', 'MOHAMMED', 'ali.mohammed@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('315', 'ALI', 'GAMBO', 'ali.gambo@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('316', 'ALIA', 'OKANDEJI', 'alia.okandeji@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('317', 'ALIYU', 'ABUBAKAR', 'aliyu.abubakar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('318', 'ALIYU', 'BELLO', 'aliyu.bello@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('319', 'ALIYU', 'GARBA', 'aliyu.garba2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('320', 'ALIYU', 'UMAR', 'aliyu.gosta@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('321', 'ALIYU', 'HAMMANGA', 'aliyu.hammanga@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('322', 'ALIYU', 'AHMAD', 'aliyu.ahmad@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('323', 'ALIYU', 'GARBA', 'aliyu.alamin@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('324', 'ALIYU', 'JABBI', 'aliyu.jabbi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('325', 'ALIYU', 'ABDULLAHI', 'aliyu.abdullahi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('326', 'ALIYU', 'SULAIMAN', 'aliyu.sulaiman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('327', 'ALIYU', 'HARUNA', 'aliyu.haruna@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('328', 'ALIYU', 'UMAR', 'aliyu.umar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('329', 'ALIYU', 'IBRAHIM', 'aliyu.ibrahim@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('330', 'Aliyu', 'Abbas', 'aliyu.abbas2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('331', 'ALIYU', 'MAINA', 'aliyu.maina@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('332', 'ALIYU', 'IDRIS', 'aliyu.idris@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('333', 'ALIYU', 'MUHAMMED', 'aliyu.muhammed@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('334', 'ALIYU', 'MUSA', 'aliyu.musa@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('335', 'ALIYU', 'GARBA', 'aliyu.garba@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('336', 'ALIYU', 'ABBAS', 'aliyu.abbas@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('337', 'ALIYUL-HADI', 'DALHAT', 'aliyul-hadi.dalhat@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('338', 'ALKALI', 'SHETIMA', 'alkali.shetima@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('339', 'ALQASEEM', 'SADDEEQ', 'alqaseem.saddeeq@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('340', 'ALSADDIQ', 'ABDULKADIR', 'alsaddiq.abdulkadir@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('341', 'ALYASIN', 'ABBAS', 'alyasin.abbas@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('342', 'AMAR', 'IBN YAHAYA', 'amar.ibnyahaya@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('343', 'AMEERAH', 'ABUBAKAR ', 'ameerah.abubakar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('344', 'AMIDA', 'ALIYU', 'amida.aliyu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('345', 'AMINA', 'SULEIMAN', 'amina.suleiman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('346', 'AMINA', 'ABDULLAHI MOHD BAKOJI', 'amina.abdullahimohdbakoji@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('347', 'AMINA', 'MOHAMMED', 'amina.mohammed2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('348', 'AMINA', 'ABUBAKAR', 'amina.abubakar2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('349', 'AMINA', 'HARUNA', 'amina.haruna@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('350', 'AMINA', 'ISAH', 'amina.isah@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('351', 'AMINA', 'ADAMU', 'amina.adamu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('352', 'AMINA', 'BELLO', 'amina.bello@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('353', 'AMINA', 'ABDUL-HADI', 'amina.abdul-hadi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('354', 'AMINA', 'ABDULLAHI', 'amina.abdullahi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('355', 'AMINA', 'GONI', 'amina.goni@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('356', 'AMINA', 'IDRIS ', 'amina.idris@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('357', 'AMINA', 'BASHIR', 'amina.bashir@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('358', 'AMINA', 'ABDULAZIZ', 'amina.abdulaziz@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('359', 'AMINA', 'ABUBAKAR', 'amina.abubakar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('360', 'AMINA', 'IBRAHIM', 'amina.ibrahim@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('361', 'AMINA', 'MOHAMMED', 'amina.mohammed@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('362', 'AMINA', 'AHMAD', 'amina.ahmad@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('363', 'AMINA', 'BALARABE', 'amina.balarabe@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('364', 'AMINA ', 'USMAN', 'amina.usman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('365', 'AMINA ', 'ABDULHADI', 'amina.abdulhadi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('366', 'AMINA UMAIMA ', 'ABUBAKAR', 'aminaumaima.abubakar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('367', 'AMINAT', 'YUSUF', 'aminat.yusuf@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('368', 'AMINAT', 'ANOFI', 'aminat.anofi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('369', 'AMINU', 'AUDI', 'aminu.audi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('370', 'AMINU', 'ABUBAKAR', 'aminu.abubakar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('371', 'AMINU', 'ZARA', 'aminu.zara@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('372', 'AMINU', 'MUAZU', 'aminu.muazu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('373', 'AMINU', 'HAFSAT', 'aminu.hafsat@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('374', 'AMINU ', 'AUDI', 'aminu.audi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('375', 'AMINUDEEN', 'SULEIMAN', 'aminudeen.suleiman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('376', 'AMIR', 'ISAH', 'amir.isah@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('377', 'AMIR', 'ADAM', 'amir.adam@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('378', 'AMIRA', 'ADAMU', 'amira.adamu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('379', 'AMIRA', 'AJIYA MAMMAN', 'amira.ajiyamamman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('380', 'AMIRAH', 'ABDUL A. A.', 'amirah.abdula.a.@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('381', 'AMRA', 'KAWU', 'amra.kawu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('382', 'ANAS', 'SIRAJO', 'anas.sirajo@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('383', 'ANAS', 'DAHIRU', 'anas.dahiru@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('384', 'ASHRAF', 'MUSA', 'ashraf.musa@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('385', 'ASIYA', 'AHMAD ASIYA', 'asiya.ahmadasiya@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('386', 'ASIYA', 'JABBI', 'asiya.jabbi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('387', 'ASIYA', 'SULEIMAN', 'asiya.suleiman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('388', 'ASIYA', 'ABDULHAMID', 'asiya.abdulhamid@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('389', 'ASMAA ', 'YUSUF', 'asmaa.yusuf@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('390', 'ASMAU', 'YUSUF', 'asmau.yusuf@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('391', 'ASMAU', 'AMINU', 'asmau.aminu2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('392', 'ASMAU', 'HALIRU', 'asmau.haliru@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('393', 'ASMAU', 'AMINU', 'asmau.aminu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('394', 'ATIKU', 'IBRAHIM', 'atiku.ibrahim@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('395', 'AUDU', 'TAHIRA', 'audu.tahira@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('396', 'AWAD', 'SODANGI', 'awad.sodangi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('397', 'AYMAN', 'AMINU', 'ayman.aminu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('398', 'AYUBA', 'HUSSAIN', 'ayuba.hussain@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('399', 'AZEEZAT', 'MUSA', 'azeezat.musa@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('400', 'AZIZATU', 'SANI', 'azizatu.sani@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('401', 'BABABHASSAN', 'LAWAN', 'bababhassan.lawan@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('402', 'BABASHANI', 'BINTA', 'babashani.binta@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('403', 'BADIYA', 'BELLO', 'badiya.bello@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('404', 'BAFFA', 'SHUAIBU', 'baffa.shuaibu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('405', 'BAGONI', 'DIMARI', 'bagoni.dimari@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('406', 'BAHIJJA', 'SULEIMAN', 'bahijja.suleiman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('407', 'BAKOJI', 'ABDULLAHI', 'bakoji.abdullahi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('408', 'BALA', 'MOHAMMED ', 'bala.mohammed@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('409', 'BALKISU', 'JIBRIN', 'balkisu.jibrin@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('410', 'BARAKAT', 'ABDULLAHI', 'barakat.abdullahi2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('411', 'BARAKAT', 'OWOSENI', 'barakat.owoseni@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('412', 'BARAKAT', 'JIBRIN', 'barakat.jibrin@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('413', 'BARAKAT', 'IBRAHIM', 'barakat.ibrahim@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('414', 'BARAKAT', 'ABDULLAHI', 'barakat.abdullahi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('415', 'BASHIR', 'YAKASAI', 'bashir.yakasai2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('416', 'BASHIR', 'ALH JAMEEL', 'bashir.alhjameel@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('417', 'BASHIR', 'MARYAM', 'bashir.maryam@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('418', 'BASHIR', 'MUHAMMAD', 'bashir.muhammad@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('419', 'BASHIR', 'YAKASAI', 'bashir.yakasai@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('420', 'BASMAH', 'UMAR', 'basmah.umar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('421', 'BASSAM', 'LAMIDO', 'bassam.lamido@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('422', 'BELLO', 'UMAR', 'bello.umar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('423', 'BELLO', 'YUSUF', 'bello.yusuf@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('424', 'BELLO', 'BELLO', 'bello.bello@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('425', 'BELLO', 'KABIR', 'bello.kabir@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('426', 'BELLO', 'SADIYA', 'bello.sadiya@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('427', 'BELLO', 'SALAHU', 'bello.salahu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('428', 'BELLO', 'HABEEB', 'bello.habeeb@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('429', 'BELLO', 'BALA ', 'bello.bala@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('430', 'BILAL', 'AHMAD', 'bilal.ahmad@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('431', 'BILIKISU', 'ABDUL-AZEEZ', 'bilikisu.abdul-azeez@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('432', 'BILKISU', 'BELLO', 'bilkisu.bello@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('433', 'BILKISU', 'YAKUBU', 'bilkisu.yakubu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('434', 'BILKISU', 'DABO', 'bilkisu.dabo@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('435', 'BILKISU', 'ABARSHI', 'bilkisu.abarshi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('436', 'BILKISU', 'ABDULAZEEZ', 'bilkisu.abdulazeez@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('437', 'BILKISU', 'ABDULKADIR', 'bilkisu.abdulkadir2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('438', 'BILKISU', 'ABDUL-RAZAQ', 'bilkisu.abdul-razaq@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('439', 'BILKISU', 'JIKA', 'bilkisu.jika@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('440', 'BILKISU', 'ABDULKADIR', 'bilkisu.abdulkadir@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('441', 'BILKISU', 'SALISU', 'bilkisu.salisu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('442', 'BILQUEES', 'ABDULAZEEZ', 'bilquees.abdulazeez@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('443', 'BILQUESS', 'KALEJAIYE', 'bilquess.kalejaiye@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('444', 'BILYAMINI', 'MALAH', 'bilyamini.malah@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('445', 'BINTA', 'SADEEQ', 'binta.sadeeq@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('446', 'BINTU', 'BUNU', 'bintu.bunu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('447', 'BINYAMINU', 'USMAN', 'binyaminu.usman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('448', 'DAHIRU', 'MUHAMMED', 'dahiru.muhammed@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('449', 'DALHAT', 'USMAN ', 'dalhat.usman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('450', 'DIAGNE', 'MASSENE', 'diagne.massene@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('451', 'EIMAN', 'BUHARI', 'eiman.buhari@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('452', 'EL-YAKUB', 'AHMED ', 'el-yakub.ahmed@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('453', 'EL-YAKUOB', 'ABUBAKAR', 'el-yakuob.abubakar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('454', 'FADEELAH', 'SAEED', 'fadeelah.saeed@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('455', 'FADHIMA', 'ABUBAKAR', 'fadhima.abubakar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('456', 'FADIL', 'ADEYEMI', 'fadil.adeyemi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('457', 'FAHAD', 'ALIYU', 'fahad.aliyu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('458', 'FAIDAH', 'ABDULLAHI', 'faidah.abdullahi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('459', 'FAISA', 'TANKO', 'faisa.tanko@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('460', 'FAISAL', 'ADEYEMI', 'faisal.adeyemi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('461', 'FAISAL', 'TANKO', 'faisal.tanko@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('462', 'FAISAL', 'SANI', 'faisal.sani@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('463', 'FAISAL MOHAMMED', 'IBRAHIM', 'faisalmohammed.ibrahim@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('464', 'FAIZ', 'ADEYEMI', 'faiz.adeyemi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('465', 'FAIZA', 'YAHAYA', 'faiza.yahaya@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('466', 'FALMATA', 'MAINA', 'falmata.maina@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('467', 'FAREED', 'LAWAL ', 'fareed.lawal@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('468', 'FAREEDAH', 'MUSTAPHA', 'fareedah.mustapha@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('469', 'FARHANAH', 'ADEYEMI', 'farhanah.adeyemi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('470', 'FARIDA', 'KABIR BABA', 'farida.kabirbaba@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('471', 'FARIDAH', 'MUSTAPHA', 'faridah.mustapha@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('472', 'FARIDAH', 'SULEIMAN', 'faridah.suleiman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('473', 'FARIDAH', 'KABIR', 'faridah.kabir@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('474', 'FAROUK', 'MOHAMMED', 'farouk.mohammed@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('475', 'FAROUK', 'KAWU', 'farouk.kawu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('476', 'FAROUK', 'SHUAIBU', 'farouk.shuaibu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('477', 'FAROUK', 'MUHAMMAD', 'farouk.muhammad@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('478', 'FAROUQ', 'DALHAT', 'farouq.dalhat@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('479', 'FARUK', 'SANI', 'faruk.sani@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('480', 'FARUK', 'ABDULQADIR', 'faruk.abdulqadir@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('481', 'FATIHU', 'MUHAMMAD', 'fatihu.muhammad@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('482', 'FATIMA', 'MAHMOOD', 'fatima.mahmood@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('483', 'FATIMA', 'JIBRIL', 'fatima.jibril@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('484', 'FATIMA', 'AHMED', 'fatima.ahmed@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('485', 'FATIMA', 'BELLO', 'fatima.bello@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('486', 'FATIMA', 'LAWAL', 'fatima.lawal@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('487', 'FATIMA', 'ISA', 'fatima.isa@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('488', 'FATIMA', 'YUSUF', 'fatima.yusuf2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('489', 'FATIMA', 'MOHAMMED', 'fatima.mohammed@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('490', 'FATIMA', 'ABUBAKAR', 'fatima.abubakar2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('491', 'FATIMA', 'UMAR', 'fatima.umar2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('492', 'FATIMA', 'SANI', 'fatima.sani2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('493', 'FATIMA', 'USMAN', 'fatima.usman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('494', 'FATIMA', 'AUDU', 'fatima.audu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('495', 'FATIMA', 'ABUBAKAR', 'fatima.abubakar5@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('496', 'FATIMA', 'NASIRU', 'fatima.nasiru@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('497', 'FATIMA', 'AMINU', 'fatima.aminu2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('498', 'FATIMA', 'JAURO', 'fatima.jauro@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('499', 'FATIMA', 'MUSA', 'fatima.musa2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('500', 'FATIMA', 'ADAMU', 'fatima.adamu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('501', 'FATIMA', 'SHUAIBU', 'fatima.shuaibu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('502', 'FATIMA', 'ABUBAKAR', 'fatima.abubakar4@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('503', 'FATIMA', 'ZAMZAM', 'fatima.zamzam@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('504', 'FATIMA', 'SANI', 'fatima.sani3@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('505', 'FATIMA', 'OTHMAN', 'fatima.othman2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('506', 'FATIMA', 'KAWU', 'fatima.kawu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('507', 'FATIMA', 'BASHAR', 'fatima.bashar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('508', 'FATIMA', 'ABUBAKAR', 'fatima.abubakar3@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('509', 'FATIMA', 'IBRAHIM', 'fatima.ibrahim2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('510', 'FATIMA', 'YUSUF', 'fatima.yusuf3@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('511', 'FATIMA', 'ELBAFF', 'fatima.elbaff@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('512', 'FATIMA', 'SANI', 'fatima.sani4@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('513', 'FATIMA', 'ABUBAKAR', 'fatima.abubakar7@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('514', 'FATIMA', 'ZAYYANU', 'fatima.zayyanu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('515', 'FATIMA', 'AHMAD', 'fatima.ahmad@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('516', 'FATIMA', 'JAMAIL', 'fatima.jamail@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('517', 'FATIMA', 'MUSA', 'fatima.musa@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('518', 'FATIMA', 'SHEHU ', 'fatima.shehu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('519', 'FATIMA', 'AMINU', 'fatima.aminu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('520', 'FATIMA', 'IBRAHIM', 'fatima.ibrahim@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('521', 'FATIMA', 'HARUNA', 'fatima.haruna@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('522', 'FATIMA', 'KABIR', 'fatima.kabir2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('523', 'FATIMA', 'BALA', 'fatima.bala@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('524', 'FATIMA', 'MAINA', 'fatima.maina@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('525', 'FATIMA', 'MUHAMMED', 'fatima.muhammed2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('526', 'FATIMA', 'AUWALU', 'fatima.auwalu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('527', 'FATIMA', 'KABIR', 'fatima.kabir@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('528', 'FATIMA', 'MUHAMMAD', 'fatima.muhammad3@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('529', 'FATIMA', 'UMAR', 'fatima.umar4@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('530', 'FATIMA', 'ABUBAKAR', 'fatima.abubakar6@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('531', 'FATIMA', 'UMAR', 'fatima.umar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('532', 'FATIMA', 'MODIBBO', 'fatima.modibbo@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('533', 'FATIMA', 'YUSUF', 'fatima.yusuf@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('534', 'FATIMA', 'OTHMAN', 'fatima.othman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('535', 'FATIMA', 'MUHAMMED', 'fatima.muhammed@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('536', 'FATIMA', 'MUHAMMAD', 'fatima.muhammad@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('537', 'FATIMA', 'SANI', 'fatima.sani@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('538', 'FATIMA', 'ABUBAKAR', 'fatima.abubakar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('539', 'FATIMA ', 'OTHMAN ', 'fatima.othman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('540', 'FATIMA ', 'KABIRU', 'fatima.kabiru@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('541', 'FATIMA GAZARA', 'NASIR', 'fatimagazara.nasir@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('542', 'FATIMA ZARAH', 'MUSA', 'fatimazarah.musa@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('543', 'FATIMAH', 'YUSUF', 'fatimah.yusuf@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('544', 'FATIMAH', 'MUHAMMAD', 'fatimah.muhammad@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('545', 'FATIMAH', 'AUDU', 'fatimah.audu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('546', 'FATIMAH', 'SANI ABDULLAHI', 'fatimah.saniabdullahi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('547', 'FATIMAH', 'AMINU', 'fatimah.aminu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('548', 'FATIMAH', 'USMAN', 'fatimah.usman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('549', 'FATIMAH BOTULAH', 'KOLOBE', 'fatimahbotulah.kolobe@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('550', 'FAUZEEYA', 'USMAN', 'fauzeeya.usman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('551', 'FAUZIA', 'HAMMANGA', 'fauzia.hammanga@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('552', 'FAUZIYA', 'NASIRU', 'fauziya.nasiru@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('553', 'FAUZIYA', 'YAHAYA', 'fauziya.yahaya@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('554', 'FAUZIYYA', 'KABIRU', 'fauziyya.kabiru@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('555', 'FAWAZ', 'ADEROGBA', 'fawaz.aderogba@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('556', 'FAWWAZ', 'YAHAYA', 'fawwaz.yahaya@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('557', 'FAWZIYYAH', 'SALEH', 'fawziyyah.saleh@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('558', 'FIRDAUS', 'YAKUBU', 'firdaus.yakubu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('559', 'FIRDAUSI', 'ABDULLAHI', 'firdausi.abdullahi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('560', 'FIRDAUSI', 'UMAR LAU', 'firdausi.umarlau@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('561', 'FIRDAUSI', 'KABIRU', 'firdausi.kabiru@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('562', 'FIRDOUS', 'ABDULRAZAQ', 'firdous.abdulrazaq@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('563', 'FURAIRA', 'BELLO', 'furaira.bello@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('564', 'GARBA', 'MARYAM', 'garba.maryam@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('565', 'GHAZZALI', 'UJUDUD', 'ghazzali.ujudud@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('566', 'GIDADO', 'JIKA', 'gidado.jika@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('567', 'GIDADO ', 'AHMED ', 'gidado.ahmed@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('568', 'HABEEB', 'ADEROGBA', 'habeeb.aderogba@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('569', 'HABEEBULLAHI', 'OWOSENI', 'habeebullahi.owoseni@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('570', 'HABIB', 'YUSRA', 'habib.yusra@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('571', 'HABIB', 'USMAN', 'habib.usman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('572', 'HABIB', 'KELANI', 'habib.kelani@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('573', 'HABIB', 'SIDI', 'habib.sidi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('574', 'HABIBA', 'ABDULLAHI', 'habiba.abdullahi2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('575', 'HABIBA', 'MALAH', 'habiba.malah@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('576', 'HABIBA', 'SHIRO', 'habiba.shiro@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('577', 'HABIBA', 'ZUBAIR', 'habiba.zubair@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('578', 'HABIBA', 'ABDULLAHI', 'habiba.abdullahi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('579', 'HABIBA', 'ALHASSAN ', 'habiba.alhassan@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('580', 'HABIBA', 'HASSAN', 'habiba.hassan@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('581', 'HABIBA ', 'MAAJI', 'habiba.maaji@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('582', 'HABIBAH', 'SAEED', 'habibah.saeed@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('583', 'HABIBATULLAHI', 'ABDULKAREEM', 'habibatullahi.abdulkareem@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('584', 'HABIBULLAH', 'KOLOBE', 'habibullah.kolobe@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('585', 'HABU', 'KAZIR', 'habu.kazir@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('586', 'HADI', 'HAIDAR', 'hadi.haidar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('587', 'HADIZA', 'KABIRU', 'hadiza.kabiru@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('588', 'HADIZA', 'SHUAIB', 'hadiza.shuaib@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('589', 'HADIZA', 'LAWAL', 'hadiza.lawal@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('590', 'HADIZA', 'SAINE', 'hadiza.saine@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('591', 'HADIZA', 'EL-BAFF', 'hadiza.el-baff@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('592', 'HADIZA', 'SULEIMAN', 'hadiza.suleiman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('593', 'HADIZA', 'SANI', 'hadiza.sani@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('594', 'HADIZA', 'ALIYU', 'hadiza.aliyu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('595', 'HAFSAH', 'MUKHTAR', 'hafsah.mukhtar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('596', 'HAFSAH', 'USMAN', 'hafsah.usman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('597', 'HAFSAT', 'LABARAN', 'hafsat.labaran@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('598', 'HAFSAT', 'MIYIM', 'hafsat.miyim@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('599', 'HAFSAT', 'LAWAL', 'hafsat.lawal2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('600', 'HAFSAT', 'ALHASSAN', 'hafsat.alhassan@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('601', 'HAFSAT', 'SULEIMAN', 'hafsat.suleiman2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('602', 'HAFSAT', 'MUSA', 'hafsat.musa@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('603', 'HAFSAT', 'USMAN', 'hafsat.usman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('604', 'HAFSAT', 'BELLO', 'hafsat.bello2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('605', 'HAFSAT', 'KAURA', 'hafsat.kaura@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('606', 'HAFSAT', 'SALMAN', 'hafsat.salman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('607', 'HAFSAT', 'SULEIMAN', 'hafsat.suleiman3@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('608', 'HAFSAT', 'IDRIS', 'hafsat.idris@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('609', 'HAFSAT', 'SULEIMAN', 'hafsat.suleiman4@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('610', 'HAFSAT', 'BASHAR', 'hafsat.bashar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('611', 'HAFSAT', 'BELLO', 'hafsat.bello@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('612', 'HAFSAT', 'AHMAD', 'hafsat.ahmad@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('613', 'HAFSAT', 'LAWAL', 'hafsat.lawal@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('614', 'HAFSAT', 'SALISU', 'hafsat.salisu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('615', 'HAFSAT', 'HARUNA', 'hafsat.haruna@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('616', 'HAFSAT', 'SULEIMAN', 'hafsat.suleiman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('617', 'HAFSAT', 'BAPPAH', 'hafsat.bappah@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('618', 'HAFSAT', 'MOHAMMED', 'hafsat.mohammed@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('619', 'HAFSAT', 'BALA', 'hafsat.bala@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('620', 'HAFSAT ', 'SAIDU', 'hafsat.saidu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('621', 'HAJARA', 'ABDULLAHI', 'hajara.abdullahi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('622', 'HAJARA', 'BELLO', 'hajara.bello@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('623', 'HAJARA', 'AYAGI', 'hajara.ayagi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('624', 'HAJARA', 'YAHUZA', 'hajara.yahuza@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('625', 'HAJARA', 'MUKHTAR', 'hajara.mukhtar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('626', 'HAJARA', 'AABDULRAHMAN', 'hajara.aabdulrahman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('627', 'HAJARA', 'HARUNA', 'hajara.haruna@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('628', 'HAJARA', 'SULAIMAN', 'hajara.sulaiman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('629', 'HAJARA', 'MUSA', 'hajara.musa@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('630', 'HAJARA', 'LAWAL ', 'hajara.lawal@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('631', 'HAJARA', 'M.D MAGAJI', 'hajara.m.dmagaji@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('632', 'HAJARAH', 'LAWAL', 'hajarah.lawal@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('633', 'HAJARAH', 'MOHAMMED SAIQ', 'hajarah.mohammedsaiq@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('634', 'HALIMA', 'SULEIMAN', 'halima.suleiman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('635', 'HALIMA', 'BABA', 'halima.baba@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('636', 'HALIMA', 'KABIR', 'halima.kabir@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('637', 'HALIMA', 'IBRAHIM', 'halima.ibrahim@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('638', 'HALIMA', 'HABIB', 'halima.habib@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('639', 'HALIMA', 'HARUNA', 'halima.haruna@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('640', 'HALIMAH', 'NURUDEEN', 'halimah.nurudeen@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('641', 'HALIMATU SADIYA', 'IDRIS', 'halimatusadiya.idris@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('642', 'HALIMATUS', 'KILANI', 'halimatus.kilani@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('643', 'HAMZA', 'KILANI', 'hamza.kilani@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('644', 'HAMZA', 'ABDULLAHI', 'hamza.abdullahi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('645', 'HAMZA', 'ABDULLAZEEZ', 'hamza.abdullazeez@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('646', 'HANIFA', 'SHUAIB', 'hanifa.shuaib@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('647', 'HANIFA', 'ABDULLAHI', 'hanifa.abdullahi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('648', 'HANIFAH', 'IBRAHIM', 'hanifah.ibrahim@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('649', 'HANIFAT', 'ADEWUNI', 'hanifat.adewuni@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('650', 'HARUNA', 'IBRAHIM', 'haruna.ibrahim@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('651', 'HARUNA', 'ABUBAKAR', 'haruna.abubakar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('652', 'HARUNA', 'FARUK', 'haruna.faruk@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('653', 'HARUNA', 'MU\'AZU', 'haruna.muazu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('654', 'HARUNA', 'ABDULLAHI', 'haruna.abdullahi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('655', 'HARUNA', 'YUSUF', 'haruna.yusuf@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('656', 'HASHIM', 'IBRAHIM', 'hashim.ibrahim@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('657', 'HASIYA', 'USMAN ALIYU', 'hasiya.usmanaliyu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('658', 'HASIYA', 'MUSA', 'hasiya.musa@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('659', 'HASSAN', 'KHAIRAT', 'hassan.khairat@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('660', 'HASSAN', 'IMAM', 'hassan.imam@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('661', 'HASSAN', 'MALAFYA', 'hassan.malafya@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('662', 'HASSAN', 'AHMAD', 'hassan.ahmad@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('663', 'HASSAN', 'ABDULSALAM', 'hassan.abdulsalam@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('664', 'HASSANA', 'USMAN', 'hassana.usman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('665', 'HASSANA', 'ABDULLAHI', 'hassana.abdullahi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('666', 'HAUWA', 'MOHAMMED', 'hauwa.mohammed2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('667', 'HAUWA', 'UMAR', 'hauwa.umar2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('668', 'HAUWA', 'DANJUMA', 'hauwa.danjuma@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('669', 'HAUWA', 'USMAN', 'hauwa.usman2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('670', 'HAUWA', 'HAMZAH', 'hauwa.hamzah@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('671', 'HAUWA', 'MOHAMMED', 'hauwa.mohammed@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('672', 'HAUWA', 'SALMANU', 'hauwa.salmanu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('673', 'HAUWA', 'ABDULKADIR', 'hauwa.abdulkadir@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('674', 'HAUWA', 'UMAR', 'hauwa.umar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('675', 'HAUWA', 'GARBA', 'hauwa.garba@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('676', 'HAUWA', 'MUHAMMAD', 'hauwa.muhammad2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('677', 'HAUWA', 'USMAN', 'hauwa.usman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('678', 'HAUWA', 'GAMBO', 'hauwa.gambo@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('679', 'HAUWA', 'MUHAMMAD', 'hauwa.muhammad@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('680', 'HAUWAU', 'AHMED', 'hauwau.ahmed@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('681', 'HAUWAU', 'JIBRIL', 'hauwau.jibril2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('682', 'HAUWAU', 'ISA ', 'hauwau.isa@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('683', 'HAUWAU', 'JIBRIL', 'hauwau.jibril@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('684', 'HAUWA\'U', 'HARUNA', 'hauwau.haruna@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('685', 'HAUWA\'U', 'ABUBAKAR', 'hauwau.abubakar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('686', 'HAUWA\'U', 'AMINU', 'hauwau.aminu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('687', 'HAUWA\'U', 'ADAMU', 'hauwau.adamu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('688', 'HAWWA', 'SALEH', 'hawwa.saleh@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('689', 'HAWWA', 'MAHMOOD', 'hawwa.mahmood@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('690', 'HAWWA', 'DALHAT', 'hawwa.dalhat@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('691', 'HAYATU', 'ABDULLAHI', 'hayatu.abdullahi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('692', 'HAYYATUDDIN', 'LAWAN', 'hayyatuddin.lawan@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('693', 'HEBA', 'HAIDAR', 'heba.haidar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('694', 'HUSNA', 'HUSSAIN', 'husna.hussain@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('695', 'HUSNAMAAB', 'AHMAD', 'husnamaab.ahmad@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('696', 'HUSSAINA', 'DAHIRU ', 'hussaina.dahiru@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('697', 'HUSSAINA', 'DAHIRU BAKO', 'hussaina.dahirubako@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('698', 'HUSSAINI', 'USMAN', 'hussaini.usman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('699', 'HUZAIFA', 'SUFYAN', 'huzaifa.sufyan@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('700', 'HUZAIFAH', 'BOBBO', 'huzaifah.bobbo@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('701', 'IBRAHEEM', ' DALHATU', 'ibraheem.dalhatu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('702', 'IBRAHIM', 'NURUDEEN', 'ibrahim.nurudeen@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('703', 'IBRAHIM', 'SANI', 'ibrahim.sani2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('704', 'IBRAHIM', 'YUSUF', 'ibrahim.yusuf2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('705', 'IBRAHIM', 'AUDU', 'ibrahim.audu2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('706', 'IBRAHIM', 'ADAMU', 'ibrahim.adamu2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('707', 'IBRAHIM', 'MAHMOOD', 'ibrahim.mahmood@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('708', 'IBRAHIM', 'SANI', 'ibrahim.sani@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('709', 'IBRAHIM', 'KHALIL', 'ibrahim.khalil@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('710', 'IBRAHIM', 'DAHIRU', 'ibrahim.dahiru@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('711', 'IBRAHIM', 'AHMED', 'ibrahim.ahmed@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('712', 'IBRAHIM', 'SANI NDANUSA', 'ibrahim.sanindanusa@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('713', 'IBRAHIM', 'YAU', 'ibrahim.yau@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('714', 'IBRAHIM', 'ADAMU', 'ibrahim.adamu3@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('715', 'IBRAHIM', 'ABDULSALAM ', 'ibrahim.abdulsalam@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('716', 'IBRAHIM', 'SULEIMAN', 'ibrahim.suleiman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('717', 'IBRAHIM', 'IBRAHIM', 'ibrahim.ibrahim@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('718', 'IBRAHIM', 'YUSUF', 'ibrahim.yusuf@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('719', 'IBRAHIM', 'DALHATU', 'ibrahim.dalhatu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('720', 'IBRAHIM', 'YUSUF ', 'ibrahim.yusuf@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('721', 'IBRAHIM', 'MUHAMMAD', 'ibrahim.muhammad@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('722', 'IBRAHIM', 'NGGADA', 'ibrahim.nggada@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('723', 'IBRAHIM', 'AUDU', 'ibrahim.audu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('724', 'IBRAHIM', 'ABDULRAHMAN', 'ibrahim.abdulrahman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('725', 'IBRAHIM', 'ABUBAKAR', 'ibrahim.abubakar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('726', 'IBRAHIM', 'ADAMU', 'ibrahim.adamu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('727', 'IBRAHIM', 'BABAGANA', 'ibrahim.babagana@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('728', 'IBRAHIM', 'UMAR', 'ibrahim.umar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('729', 'IBRAHIM', 'ABBAS', 'ibrahim.abbas@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('730', 'IBRAHIM', 'JIBO', 'ibrahim.jibo@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('731', 'IBRAHIM', 'USMAN', 'ibrahim.usman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('732', 'IBRAHIM', 'MOHAMMED SADIQ', 'ibrahim.mohammedsadiq@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('733', 'IBRAHIM ', 'ABDULHADI', 'ibrahim.abdulhadi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('734', 'IBRAHIM ADAMU', 'MOHAMMED', 'ibrahimadamu.mohammed@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('735', 'IBTIHAJ', 'AHMED ', 'ibtihaj.ahmed@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('736', 'IDRIS', 'LAWAN', 'idris.lawan@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('737', 'IDRIS', 'YAHUZA', 'idris.yahuza@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('738', 'IHSANULA', 'MUKTAR', 'ihsanula.muktar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('739', 'IKHLAS', 'BURHAN', 'ikhlas.burhan@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('740', 'ILHAM', 'MUKHTAR', 'ilham.mukhtar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('741', 'ILIYASU', 'ABDUL MUTAALI', 'iliyasu.abdulmutaali@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('742', 'IMAN', 'MUHAMMED', 'iman.muhammed@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('743', 'IMANE', 'NENNE', 'imane.nenne@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('744', 'IMRAN', 'ABDULLAHI', 'imran.abdullahi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('745', 'IMURANA', 'MUHAMMED', 'imurana.muhammed@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('746', 'INNA', 'ALIM', 'inna.alim@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('747', 'ISA', 'MUHAMMAD', 'isa.muhammad@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('748', 'ISAH', 'MOHAMMED', 'isah.mohammed@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('749', 'ISAH', 'SADIQ', 'isah.sadiq@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('750', 'ISAMA', 'ADAMU', 'isama.adamu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('751', 'ISHAQ', 'SULEIMAN', 'ishaq.suleiman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('752', 'ISMAIL', 'KABIRU', 'ismail.kabiru@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('753', 'ISMAIL', 'JABBI', 'ismail.jabbi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('754', 'ISMAIL', 'SULEIMAN', 'ismail.suleiman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('755', 'ISMAIL', 'DALHATU', 'ismail.dalhatu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('756', 'ISMAIL', 'IBRAHIM', 'ismail.ibrahim@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('757', 'ISMAIL', 'ADAMU', 'ismail.adamu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('758', 'ISMAIL', 'ABDULLAHI', 'ismail.abdullahi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('759', 'ISMAIL', 'UMAR', 'ismail.umar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('760', 'JADAHAQ', 'LAWAL ', 'jadahaq.lawal@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('761', 'JADALHAQQ', 'LAWAL', 'jadalhaqq.lawal@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('762', 'JALALUDEEN', 'MAHMOOD', 'jalaludeen.mahmood@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('763', 'JALALUDEEN', 'USMAN', 'jalaludeen.usman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('764', 'JAMILA', 'ABUBAKAR', 'jamila.abubakar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('765', 'JAMILAT', 'AHMAD', 'jamilat.ahmad@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('766', 'JAMILLAH', 'SEGHOSIME', 'jamillah.seghosime@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('767', 'JAMILU', 'LABARAN', 'jamilu.labaran@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('768', 'JIBRIL', 'YAU ', 'jibril.yau@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('769', 'JIBRIL', 'SHARIF', 'jibril.sharif@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('770', 'JUBRIL', 'MOHAMMED', 'jubril.mohammed@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('771', 'KAALIB', 'DAHIRU', 'kaalib.dahiru@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('772', 'KABIR', 'SHEHU ', 'kabir.shehu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('773', 'KABIRU', 'SHEHU', 'kabiru.shehu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('774', 'KADIJA', 'ADEWALE', 'kadija.adewale@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('775', 'KADIJAT', 'SANNI', 'kadijat.sanni@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('776', 'KAMAL', 'USMAN', 'kamal.usman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('777', 'KAMAL', 'SEGHOSIME', 'kamal.seghosime@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('778', 'KAMALUDDEEN', 'MAIRIGA', 'kamaluddeen.mairiga@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('779', 'KAMALUDDEEN', 'UMAR', 'kamaluddeen.umar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('780', 'KAMILAH', 'MOMOH', 'kamilah.momoh@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('781', 'KAREEMAT', 'MUSTAPHA', 'kareemat.mustapha@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('782', 'KASIMU', 'OZETO', 'kasimu.ozeto@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('783', 'KAURA', 'ABUBAKAR', 'kaura.abubakar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('784', 'KAZIR', 'HABU', 'kazir.habu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('785', 'KAZIR', 'HABU', 'kazir.habu2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('786', 'KEHINDE', 'SALIU', 'kehinde.saliu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('787', 'KHADIJA', 'AHMED', 'khadija.ahmed@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('788', 'KHADIJA', 'USMAN ALIYU', 'khadija.usmanaliyu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('789', 'KHADIJA', 'LAWAL', 'khadija.lawal@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('790', 'KHADIJA', 'MOHAMMED ', 'khadija.mohammed@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('791', 'KHADIJA', 'HAMZA', 'khadija.hamza@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('792', 'KHADIJA', 'ADEWALE', 'khadija.adewale@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('793', 'KHADIJA', 'DALHATU', 'khadija.dalhatu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('794', 'KHADIJA', 'MUHAMMED', 'khadija.muhammed@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('795', 'KHADIJA', 'HUSSAIN', 'khadija.hussain@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('796', 'KHADIJA', 'ABDUL-HAMID', 'khadija.abdul-hamid@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('797', 'KHADIJA ', 'GONI', 'khadija.goni@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('798', 'KHADIJAH', 'MAIRIGA', 'khadijah.mairiga@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('799', 'KHADIJAH', 'MARI', 'khadijah.mari@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('800', 'KHADIJAH', 'KABIR', 'khadijah.kabir@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('801', 'KHADIJAH', 'ABDULLAHI', 'khadijah.abdullahi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('802', 'KHADIJAH', 'ABUBAKAR', 'khadijah.abubakar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('803', 'KHADIJAH', 'HUSSAIN', 'khadijah.hussain@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('804', 'KHADIJAH', 'KELANI', 'khadijah.kelani@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('805', 'KHADIJAT', 'IBRAHIM', 'khadijat.ibrahim@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('806', 'KHADIJAT', 'SALEH', 'khadijat.saleh@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('807', 'KHADIJAT', 'HASSAN A.', 'khadijat.hassana.@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('808', 'KHADIJAT', 'AHMED', 'khadijat.ahmed@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('809', 'KHADIJAT', 'SADEEQ', 'khadijat.sadeeq@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('810', 'KHADIJAT', 'IBRAHIM', 'khadijat.ibrahim2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('811', 'KHADIZA', 'YAKUBU A.', 'khadiza.yakubua.@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('812', 'KHADIZA', 'HAMMA', 'khadiza.hamma@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('813', 'KHALEED', 'SHEHU', 'khaleed.shehu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('814', 'KHALIB', 'DAHIRU', 'khalib.dahiru@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('815', 'KHALID', 'MUSA ', 'khalid.musa@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('816', 'KHALIFA', 'ADAMU', 'khalifa.adamu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('817', 'KHALIFA', 'LAWAL', 'khalifa.lawal@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('818', 'KHALIFA', 'IDRIS ', 'khalifa.idris@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('819', 'KHALIL', 'ABDULAZIZ', 'khalil.abdulaziz@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('820', 'KUDIRAT', 'MUSTAPHA', 'kudirat.mustapha@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('821', 'KUKURI', 'ABUBAKAR', 'kukuri.abubakar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('822', 'LABIBA', 'ABDULLAHI', 'labiba.abdullahi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('823', 'LAMIS', 'MAHARAZU', 'lamis.maharazu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('824', 'LARA', 'HAIDAR', 'lara.haidar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('825', 'LATEEFA', 'SEGHOSIME', 'lateefa.seghosime@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('826', 'LATIFA', 'YAHAYA', 'latifa.yahaya@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('827', 'LAWAL', 'FATHIA', 'lawal.fathia@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('828', 'LAYLA', 'ALIM', 'layla.alim@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('829', 'LUBABATU', 'ALBASU', 'lubabatu.albasu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('830', 'LUKEMAN', 'SADDEEQ', 'lukeman.saddeeq@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('831', 'LUKMAN', 'ALIYU', 'lukman.aliyu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('832', 'MAHMOOD', 'MAHMOOD', 'mahmood.mahmood@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('833', 'MAHMOUD', 'ABBAS', 'mahmoud.abbas@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('834', 'MAHMOUD', 'MAHMOUD', 'mahmoud.mahmoud@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('835', 'MAHMUD', 'ATTAHIRU', 'mahmud.attahiru@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('836', 'MAHMUD', 'BELLO', 'mahmud.bello@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('837', 'MAHMUD', 'BELLO', 'mahmud.bello2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('838', 'MAHMUD', 'ABUBAKAR', 'mahmud.abubakar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('839', 'MAHMUD', 'AMINU', 'mahmud.aminu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('840', 'MAIMUNA', 'YAHAYA ', 'maimuna.yahaya@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('841', 'MAIMUNA', 'UMAR', 'maimuna.umar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('842', 'MAIMUNA', 'ISAH', 'maimuna.isah@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('843', 'MAIMUNAT', 'JIBRIL', 'maimunat.jibril@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('844', 'MAISARATU', 'GALADIMA', 'maisaratu.galadima@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('845', 'MANAL', 'IBRAHIM', 'manal.ibrahim@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('846', 'MANSOOR', 'UMAR-FAROUK', 'mansoor.umar-farouk@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('847', 'MANSOOR', 'MOHAMMAD', 'mansoor.mohammad@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('848', 'MANSUR', 'AMINU', 'mansur.aminu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('849', 'MANSUR', 'HASSAN', 'mansur.hassan@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('850', 'MARDIYYA', 'DANJUMMA', 'mardiyya.danjumma@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('851', 'MARIYA', 'AUDI', 'mariya.audi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('852', 'MARIYA', 'SULEIMAN', 'mariya.suleiman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('853', 'MARYAM', 'SANI', 'maryam.sani@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('854', 'MARYAM', 'ABDULLAHI', 'maryam.abdullahi2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('855', 'MARYAM', 'ISMAIL', 'maryam.ismail@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('856', 'MARYAM', 'MANI', 'maryam.mani@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('857', 'MARYAM', 'MOHAMMED', 'maryam.mohammed@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('858', 'MARYAM', 'SULEIMAN', 'maryam.suleiman2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('859', 'MARYAM', 'BELLO', 'maryam.bello@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('860', 'MARYAM', 'ABBAS', 'maryam.abbas@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('861', 'MARYAM', 'USMAN', 'maryam.usman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('862', 'MARYAM', 'USMAN ALIYU', 'maryam.usmanaliyu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('863', 'MARYAM', 'AUDI', 'maryam.audi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('864', 'MARYAM', 'MUHAMMAD ', 'maryam.muhammad@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('865', 'MARYAM', 'GAYA', 'maryam.gaya@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('866', 'MARYAM', 'MANSUR', 'maryam.mansur2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('867', 'MARYAM', 'ANOFI', 'maryam.anofi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('868', 'MARYAM', 'GARBA', 'maryam.garba@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('869', 'MARYAM', 'MUSA', 'maryam.musa2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('870', 'MARYAM', 'MAIRIGA', 'maryam.mairiga@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('871', 'MARYAM', 'ZAMZAM', 'maryam.zamzam@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('872', 'MARYAM', 'SULEIMAN', 'maryam.suleiman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('873', 'MARYAM', 'WAKALA', 'maryam.wakala@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('874', 'MARYAM', 'JIRIL ', 'maryam.jiril@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('875', 'MARYAM', 'DIMARI', 'maryam.dimari@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('876', 'MARYAM', 'MOHAMMED ', 'maryam.mohammed@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('877', 'MARYAM', 'ADAMU', 'maryam.adamu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('878', 'MARYAM', 'ISMAIL ', 'maryam.ismail@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('879', 'MARYAM', 'SHUAIBU', 'maryam.shuaibu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('880', 'MARYAM', 'SANI UMAR', 'maryam.saniumar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('881', 'MARYAM', 'ALI ALKALI', 'maryam.alialkali@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('882', 'MARYAM', 'ABDULLAHI', 'maryam.abdullahi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('883', 'MARYAM', 'IMRAN', 'maryam.imran@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('884', 'MARYAM', 'MUHAMMAD', 'maryam.muhammad@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('885', 'MARYAM', 'IBRAHIM', 'maryam.ibrahim@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('886', 'MARYAM', 'MAINA', 'maryam.maina@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('887', 'MARYAM', 'YAKUBU', 'maryam.yakubu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('888', 'MARYAM', 'MUSA', 'maryam.musa@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('889', 'MARYAM', 'YUSUF ', 'maryam.yusuf@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('890', 'MARYAM', 'USMAN ALIYU', 'maryam.usmanaliyu2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('891', 'MARYAM', 'ABBAS ', 'maryam.abbas@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('892', 'MARYAM', 'KABIR ', 'maryam.kabir@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('893', 'MARYAM', 'MANSUR', 'maryam.mansur@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('894', 'MASARANA', 'MUSTAPHA', 'masarana.mustapha@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('895', 'MAZEEDATULKHAYR', 'ABDULRAUF', 'mazeedatulkhayr.abdulrauf@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('896', 'MOHAMMAD', 'ADAMU', 'mohammad.adamu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('897', 'MOHAMMAD', 'ABBAS', 'mohammad.abbas@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('898', 'MOHAMMAD', 'ADAMU', 'mohammad.adamu2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('899', 'MOHAMMAD', 'NASIR', 'mohammad.nasir@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('900', 'MOHAMMAD', 'IBRAHIM', 'mohammad.ibrahim@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('901', 'MOHAMMAD', 'YUSUF ', 'mohammad.yusuf@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('902', 'MOHAMMAD', 'SULEIMAN', 'mohammad.suleiman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('903', 'MOHAMMAD', 'SULEIMAN', 'mohammad.suleiman2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('904', 'MOHAMMAD ', 'SULEIMAN ', 'mohammad.suleiman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('905', 'MOHAMMED', 'USMAN', 'mohammed.usman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('906', 'MOHAMMED', 'YAHAYA', 'mohammed.yahaya@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('907', 'MOHAMMED', 'SULEIMAN', 'mohammed.suleiman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('908', 'MOHAMMED', 'ABDULLAHI', 'mohammed.abdullahi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('909', 'MOHAMMED', 'ABDULLAHI', 'mohammed.abdullahi2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('910', 'MOHAMMED', 'ADAM', 'mohammed.adam@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('911', 'MOHAMMED', 'HAMMAN', 'mohammed.hamman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('912', 'MOHAMMED', 'ABUBAKAR', 'mohammed.abubakar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('913', 'MOHAMMED', 'ABDULLAH', 'mohammed.abdullah@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('914', 'MOHAMMED', 'ABDULLAHI ', 'mohammed.abdullahi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('915', 'MOHAMMED', 'ALIYU', 'mohammed.aliyu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('916', 'MOHAMMED', 'BABASHANI', 'mohammed.babashani@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('917', 'MOHAMMED', 'HAYATU', 'mohammed.hayatu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('918', 'MOHAMMED', 'DANJUMA', 'mohammed.danjuma@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('919', 'MOHAMMED', 'IMRAN', 'mohammed.imran@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('920', 'MOHAMMED', 'SULAIMAN', 'mohammed.sulaiman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('921', 'MOHAMMED', 'IBRAHIM', 'mohammed.ibrahim@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('922', 'MOHAMMED', 'YUNUSA', 'mohammed.yunusa@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('923', 'MOHAMMED', 'HABU', 'mohammed.habu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('924', 'MOHAMMED', 'BABA GONI', 'mohammed.babagoni@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('925', 'MOHAMMED', 'AHMAD', 'mohammed.ahmad@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('926', 'MOHAMMED ', 'KUKURI', 'mohammed.kukuri@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('927', 'MOHAMMED BASHIR', 'ADEQUNI', 'mohammedbashir.adequni@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('928', 'MOHAMMED BELLO', 'MAHMUD', 'mohammedbello.mahmud@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('929', 'MOSHOOD', 'AMELE', 'moshood.amele@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('930', 'MOSHOOD', 'AMELE ', 'moshood.amele@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('931', 'MOUKTAR', 'SHUAIBU', 'mouktar.shuaibu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('932', 'MUAZU', 'LAWAL', 'muazu.lawal@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('933', 'MUBARAK', 'ALIYU', 'mubarak.aliyu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('934', 'MUBARAK', 'LABARAN', 'mubarak.labaran@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('935', 'MUBARAK', 'SHEHU', 'mubarak.shehu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('936', 'MUBARAK', 'IBRAHIM ', 'mubarak.ibrahim@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('937', 'MUBARAK', 'AMEH', 'mubarak.ameh@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('938', 'MUBARAK', 'MUHAMMED ', 'mubarak.muhammed@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('939', 'MUBARAK', 'YUSUF', 'mubarak.yusuf@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('940', 'MUBARAQ', 'SANI ABDULLAHI', 'mubaraq.saniabdullahi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('941', 'MUBEENAT', 'ISMAIL ALATISE', 'mubeenat.ismailalatise@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('942', 'MUDASSIR', 'SHETTIMA', 'mudassir.shettima@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('943', 'MUFTAU', 'MUHAMMED', 'muftau.muhammed@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('944', 'MUHAMMAD', 'MUKHTAR', 'muhammad.mukhtar2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('945', 'MUHAMMAD', 'GAZARA', 'muhammad.gazara@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('946', 'MUHAMMAD', 'ABBAS OSMAN', 'muhammad.abbasosman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('947', 'MUHAMMAD', 'USMAN', 'muhammad.usman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('948', 'MUHAMMAD', 'ADAM', 'muhammad.adam@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('949', 'MUHAMMAD', 'SHANU', 'muhammad.shanu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('950', 'MUHAMMAD', 'MUHAMMAD', 'muhammad.muhammad@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('951', 'MUHAMMAD', 'HAMMAWA', 'muhammad.hammawa@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('952', 'MUHAMMAD', 'BAMANGA', 'muhammad.bamanga@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('953', 'MUHAMMAD', 'SANI', 'muhammad.sani2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('954', 'MUHAMMAD', 'SALEH', 'muhammad.saleh2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('955', 'MUHAMMAD', 'SANI', 'muhammad.sani@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('956', 'MUHAMMAD', 'HAMZAH', 'muhammad.hamzah@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('957', 'MUHAMMAD', 'HARUNA', 'muhammad.haruna@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('958', 'MUHAMMAD', 'DALHAT', 'muhammad.dalhat@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('959', 'MUHAMMAD', 'AHMAD', 'muhammad.ahmad@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('960', 'MUHAMMAD', 'ADO', 'muhammad.ado@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('961', 'MUHAMMAD', 'MAHADI', 'muhammad.mahadi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('962', 'MUHAMMAD', 'LAWAL', 'muhammad.lawal@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('963', 'MUHAMMAD', 'MUKHTAR', 'muhammad.mukhtar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('964', 'MUHAMMAD', 'AMIR', 'muhammad.amir@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('965', 'MUHAMMAD', 'AMIN', 'muhammad.amin@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('966', 'MUHAMMAD', 'MUSA', 'muhammad.musa@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('967', 'MUHAMMAD', 'SULAIMAN', 'muhammad.sulaiman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('968', 'MUHAMMAD', 'ALIBABA', 'muhammad.alibaba@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('969', 'MUHAMMAD', 'SALEH', 'muhammad.saleh@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('970', 'MUHAMMAD', 'ABDULLADIR', 'muhammad.abdulladir@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('971', 'MUHAMMAD', 'KAKA', 'muhammad.kaka@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('972', 'MUHAMMAD', 'ABBAS', 'muhammad.abbas@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('973', 'MUHAMMAD ', 'SALIHU', 'muhammad.salihu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('974', 'MUHAMMAD MUHSIN', 'LAWAL', 'muhammadmuhsin.lawal@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('975', 'MUHAMMAD NASIR K.UMAR', 'ISA', 'muhammadnasirk.umar.isa@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('976', 'MUHAMMAD-ANNUUR', 'KOLOBE', 'muhammad-annuur.kolobe@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('977', 'MUHAMMAD-AUWALl', 'ABBAS', 'muhammad-auwall.abbas@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('978', 'MUHAMMED', 'SULEIMAN', 'muhammed.suleiman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('979', 'MUHAMMED', 'BADAMASI', 'muhammed.badamasi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('980', 'MUHAMMED', 'SULEIMAN', 'muhammed.suleiman2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('981', 'MUHAMMED', 'MUKHTAR', 'muhammed.mukhtar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('982', 'MUHAMMED', 'DIMARI', 'muhammed.dimari@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('983', 'MUHAMMED', 'RAHMAT', 'muhammed.rahmat@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('984', 'MUHAMMED', 'NDAKO', 'muhammed.ndako@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('985', 'MUHAMMED', 'ABUBAKAR', 'muhammed.abubakar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('986', 'MUHAMMED', 'YUSUF ', 'muhammed.yusuf@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('987', 'MUHAMMED', 'ZAYYAN', 'muhammed.zayyan@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('988', 'MUHAMMED', 'ZAYYAN', 'muhammed.zayyan2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('989', 'MUHAMMED', 'ADAMU', 'muhammed.adamu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('990', 'MUHAMMED', 'AHMAD', 'muhammed.ahmad@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('991', 'MUHAMMED ', 'IBRAHIM', 'muhammed.ibrahim@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('992', 'MUHAMMED ', 'ALIYU', 'muhammed.aliyu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('993', 'MUHAMMED NABEEL', 'ABDULRAUF ', 'muhammednabeel.abdulrauf@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('994', 'MUHKTAR', 'JADA', 'muhktar.jada@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('995', 'MUHSIN', 'HAMMAWA', 'muhsin.hammawa@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('996', 'MUIBAT', 'MUHAMMED', 'muibat.muhammed@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('997', 'MUJAHID', 'MUHAMMAD', 'mujahid.muhammad@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('998', 'MUJAHID', 'HAMMAWA', 'mujahid.hammawa@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('999', 'MUKHTAR', 'SHAGARI', 'mukhtar.shagari@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1000', 'MUKTAR', 'YERIMA', 'muktar.yerima@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1001', 'MUKTAR', 'AUDI', 'muktar.audi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1002', 'MUKTAR', 'MUYIM', 'muktar.muyim@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1003', 'MUKTAR', 'GUMI', 'muktar.gumi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1004', 'MUKTAR', 'MANNIR', 'muktar.mannir@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1005', 'MUNIBAT', 'MOHAMMED ', 'munibat.mohammed@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1006', 'MUNIRAT', 'MUHAMMED SADIQ', 'munirat.muhammedsadiq@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1007', 'MURJANU', 'SALISU', 'murjanu.salisu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1008', 'MURTALA', 'MUHAMMED', 'murtala.muhammed@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1009', 'MUSA', 'ABBA', 'musa.abba@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1010', 'MUSA', 'MOHAMMED', 'musa.mohammed@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1011', 'MUSA', 'AISHA', 'musa.aisha@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1012', 'MUSA', 'ALIYU ', 'musa.aliyu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1013', 'MUSA', 'ALIYU', 'musa.aliyu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1014', 'MUSA', 'BALLO', 'musa.ballo@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1015', 'MUSA', 'MOHAMMED', 'musa.mohammed2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1016', 'MUSA', 'HARUNA', 'musa.haruna@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1017', 'MUSAB', 'USMAN', 'musab.usman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1018', 'MUS\'AB', 'IBRAHIM', 'musab.ibrahim@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1019', 'MUS\'AB', 'MUSA', 'musab.musa@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1020', 'MUSHIN', 'ABBAS ', 'mushin.abbas@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1021', 'MUSLIMA', 'AHMED', 'muslima.ahmed@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1022', 'MUSTAFA', 'YUSUF', 'mustafa.yusuf@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1023', 'MUSTAPHA', 'MOHAMMED', 'mustapha.mohammed@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1024', 'MUSTAPHA', 'ISAH', 'mustapha.isah@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1025', 'MUSTAPHA', 'MUKHTAR', 'mustapha.mukhtar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1026', 'MUSTAPHA', 'ADAM', 'mustapha.adam@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1027', 'MUSTAPHA', 'BICHI', 'mustapha.bichi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1028', 'MUSTAPHA', 'MUSA ', 'mustapha.musa@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1029', 'MUSTAPHA', 'AUDU', 'mustapha.audu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1030', 'MUSTAPHA', 'MAINA', 'mustapha.maina@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1031', 'MUTMAINNAH', 'ABDUR RAUF', 'mutmainnah.abdurrauf@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1032', 'NABIL', 'WANKA', 'nabil.wanka@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1033', 'NABIL', 'MUSTAPHA', 'nabil.mustapha@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1034', 'NABILA', 'ALIYU', 'nabila.aliyu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1035', 'NABILA', 'HAMZA ', 'nabila.hamza@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1036', 'NABILA', 'ABUBAKAR', 'nabila.abubakar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1037', 'NABILA', 'MUHAMMED', 'nabila.muhammed@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1038', 'NAEEMA', 'NURUDEEN', 'naeema.nurudeen@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1039', 'NAFISA', 'HASSAN', 'nafisa.hassan@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1040', 'NAFISAH', 'ABDULRAZAK', 'nafisah.abdulrazak@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1041', 'NAILAH', 'SULAIMAN', 'nailah.sulaiman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1042', 'NAIMA', 'SABO', 'naima.sabo@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1043', 'NA\'IMATU', 'MAHMUD', 'naimatu.mahmud@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1044', 'NAJEEB', 'YUSUF', 'najeeb.yusuf@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1045', 'NAJEEBA', 'HABIB BARDE', 'najeeba.habibbarde@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1046', 'NAJEEBULLAH', 'USMAN', 'najeebullah.usman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1047', 'NAJIB', 'YAKUBU SHEHU', 'najib.yakubushehu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1048', 'NAJIBA', 'BARDE', 'najiba.barde@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1049', 'NAJMA', 'AZZAKI', 'najma.azzaki@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1050', 'NAJWA', 'TALMIZ', 'najwa.talmiz@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1051', 'NAMEER', 'BALA', 'nameer.bala@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1052', 'NANA', 'MOHAMMED ', 'nana.mohammed@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1053', 'NANA FIRDAUS', 'AMIN SAAD', 'nanafirdaus.aminsaad@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1054', 'NANA HAUWA', 'MUSA ', 'nanahauwa.musa@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1055', 'NANAFATIMA', 'OZETO', 'nanafatima.ozeto@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1056', 'NANA-FATIMA', 'OZETO', 'nana-fatima.ozeto@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1057', 'NANA-FATIMA', 'HAMZA', 'nana-fatima.hamza@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1058', 'NANA-HAFSAT', 'HARUNA', 'nana-hafsat.haruna@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1059', 'NASAIBA', 'ADAMU', 'nasaiba.adamu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1060', 'NASIR', 'USMAN ALIYU', 'nasir.usmanaliyu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1061', 'NASIR', 'IBRAHIM', 'nasir.ibrahim@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1062', 'NAWAAL', 'LAWAL', 'nawaal.lawal@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1063', 'NAZIF', 'AMINU', 'nazif.aminu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1064', 'NDAKO', 'AMINA', 'ndako.amina@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1065', 'NJAMEH', 'SAINE', 'njameh.saine@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1066', 'NUMAN', 'ADO', 'numan.ado@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1067', 'NURA', 'AHMAD', 'nura.ahmad@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1068', 'NURA', 'AHMAD ', 'nura.ahmad@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1069', 'NURUDDEN', 'MUHAMMAD', 'nurudden.muhammad@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1070', 'NURUDEEN', 'OJO', 'nurudeen.ojo@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1071', 'NUSAIBA', 'UMAR', 'nusaiba.umar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1072', 'NUSRA HANNATU', 'SHEHU', 'nusrahannatu.shehu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1073', 'NUUMAN', 'ABDULAZEEZ', 'nuuman.abdulazeez@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1074', 'OKANDEJI', 'AISHAT', 'okandeji.aishat@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1075', 'RABI', 'ALIYU', 'rabi.aliyu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1076', 'RABIA', 'ADAMU', 'rabia.adamu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1077', 'RABIAT', 'ABDULRAZAQ ', 'rabiat.abdulrazaq@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1078', 'RABIATU', 'ABDULLAHI MOHD BAKOJI', 'rabiatu.abdullahimohdbakoji@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1079', 'RABIATU', 'HUSSAIN', 'rabiatu.hussain@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1080', 'RABIATU', 'LAWAN', 'rabiatu.lawan@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1081', 'RABIU', 'HABIBU', 'rabiu.habibu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1082', 'RAFEEQ', 'SADEEQ', 'rafeeq.sadeeq@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1083', 'RAFEEQAH', 'SADDEEZ', 'rafeeqah.saddeez@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1084', 'RAFEEQAH', 'SADDEEQ', 'rafeeqah.saddeeq@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1085', 'RAHAMA', 'BELLO', 'rahama.bello@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1086', 'RAHINATU', 'SANI', 'rahinatu.sani@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1087', 'RAHMA', 'SULEIMAN', 'rahma.suleiman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1088', 'RAHMA', 'MUAZU', 'rahma.muazu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1089', 'RAHMA', 'ABDULLAHI', 'rahma.abdullahi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1090', 'RAHMANTLLAH ', 'SULEIMAN', 'rahmantllah.suleiman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1091', 'RAHMAT ', 'YUSUF IBRAHIM', 'rahmat.yusufibrahim@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1092', 'RAMLATU', 'BELLO', 'ramlatu.bello@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1093', 'RASHIDA', 'SULEIMAN', 'rashida.suleiman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1094', 'RASHIDAH', 'IS-HAQUE', 'rashidah.is-haque@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1095', 'RAYHAN', 'MUNIR', 'rayhan.munir@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1096', 'ROQEYBA', 'OLALEKAN', 'roqeyba.olalekan@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1097', 'RUKAYYA', 'BARDE', 'rukayya.barde@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1098', 'RUKAYYA', 'ABDULLAHI', 'rukayya.abdullahi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1099', 'RUKAYYA', 'MUSTAFA AHMED-RUFAI', 'rukayya.mustafaahmed-rufai@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1100', 'RUKAYYA', 'SAIDU', 'rukayya.saidu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1101', 'RUKKAIYA', 'IBRAHIM', 'rukkaiya.ibrahim@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1102', 'RUKKAIYATU', 'ZUBAIRU', 'rukkaiyatu.zubairu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1103', 'RUKKAYA', 'MAINA', 'rukkaya.maina@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1104', 'RUKKAYA', 'UMAR', 'rukkaya.umar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1105', 'RUMAISA', 'IBRAHIM', 'rumaisa.ibrahim@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1106', 'RUMAYSAU', 'IBRAHIM', 'rumaysau.ibrahim@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1107', 'RUMAYSA\'U', 'IBRAHIM', 'rumaysau.ibrahim2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1108', 'RUQAYYA', 'ABARSHI', 'ruqayya.abarshi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1109', 'RUQAYYA', 'JAMILU', 'ruqayya.jamilu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1110', 'SAAD', 'SULEIMAN', 'saad.suleiman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1111', 'SAADAT', 'KABIRU SANI ISAKOTO', 'saadat.kabirusaniisakoto@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1112', 'SAADATU', 'YUSUF', 'saadatu.yusuf@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1113', 'SAADATU', 'HABIB ', 'saadatu.habib@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1114', 'SADDIQAT ', 'ABDULRASHEED', 'saddiqat.abdulrasheed@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1115', 'SADEEQ', 'MUSA', 'sadeeq.musa@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1116', 'SADIA', 'MAL ALIYU', 'sadia.malaliyu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1117', 'SADIQ', 'MUKHTAR', 'sadiq.mukhtar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1118', 'SADIQ', 'ABUBAKAR ', 'sadiq.abubakar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1119', 'SADIQ', 'MUSA', 'sadiq.musa@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1120', 'SADIQ  .A.', 'ABDULRAZAQ ISAKOTO', 'sadiq.a..abdulrazaqisakoto@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1121', 'SADIYA', 'JADA', 'sadiya.jada@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1122', 'SAFIYA', 'SADAUKI', 'safiya.sadauki@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1123', 'SAFIYA', 'SANI', 'safiya.sani@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1124', 'SAFIYA', 'USMAN BASHIR', 'safiya.usmanbashir@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1125', 'SAFIYA', 'USMAN', 'safiya.usman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1126', 'SAFIYA', 'TIJJANI', 'safiya.tijjani@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1127', 'SAFIYYA', 'ADAM', 'safiyya.adam@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1128', 'SAFIYYA', 'HALLIRU', 'safiyya.halliru@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1129', 'SAGIR', 'AUDI', 'sagir.audi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1130', 'SAIBAT', 'ALBASU', 'saibat.albasu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1131', 'SAID', 'USMAN', 'said.usman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1132', 'SAIDA', 'SAGIR', 'saida.sagir@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1133', 'SAIDU', 'HUSSEINI', 'saidu.husseini@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1134', 'SAIDU', 'HUSSEINI', 'saidu.husseini2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1135', 'SAINAB', 'ALHASSAN', 'sainab.alhassan@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1136', 'SALAMATU', 'SHIRO', 'salamatu.shiro@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1137', 'SALAMATU', 'ABDULLAHI', 'salamatu.abdullahi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1138', 'SALAMATU', 'MOHAMMED ', 'salamatu.mohammed@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1139', 'SALAMATU', 'SHIRO', 'salamatu.shiro2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1140', 'SALIHU', 'YAHAYA', 'salihu.yahaya@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1141', 'SALIHU', 'HARUNA', 'salihu.haruna@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1142', 'SALIM', 'LAWAL', 'salim.lawal@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1143', 'SALIM', 'SALEH', 'salim.saleh@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1144', 'SALIM', 'ADAMU', 'salim.adamu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1145', 'SALIM', 'GACHI', 'salim.gachi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1146', 'SALIM', 'NASIR', 'salim.nasir@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1147', 'SALISU', 'KABIRU', 'salisu.kabiru@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1148', 'SALISU', 'ABDULMALIK', 'salisu.abdulmalik@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1149', 'SALMA', 'SANI', 'salma.sani@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1150', 'SALMA', 'MOHAMMED', 'salma.mohammed@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1151', 'SALMA', 'YUNUS ', 'salma.yunus@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1152', 'SALMA', 'SULEIMAN', 'salma.suleiman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1153', 'SALMA', 'IBRAHIM', 'salma.ibrahim@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1154', 'SALMAN', 'ABBA', 'salman.abba@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1155', 'SALMAN', 'USMAN', 'salman.usman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1156', 'SAMIRA', 'FARUK', 'samira.faruk@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1157', 'SANI', 'FAHAD', 'sani.fahad@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1158', 'SANI', 'SALIM', 'sani.salim@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1159', 'SANI', 'AHMAD', 'sani.ahmad@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1160', 'SANI', 'AMINA', 'sani.amina@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1161', 'SANI', 'ABUBAKAR', 'sani.abubakar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1162', 'SANI', 'ABUBAKAR', 'sani.abubakar2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1163', 'SANUSI', 'HALIRU', 'sanusi.haliru@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1164', 'SARATU', 'SULEIMAN', 'saratu.suleiman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1165', 'SARATU', 'NDAKO', 'saratu.ndako@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1166', 'SARATU', 'LIMAN', 'saratu.liman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1167', 'SAUDAT', 'SANI', 'saudat.sani@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1168', 'SAUDATU', 'ABUBAKAR', 'saudatu.abubakar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1169', 'SAUDATU', 'AMINU MUAZU', 'saudatu.aminumuazu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1170', 'SAUDATU', 'BALA', 'saudatu.bala@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1171', 'SAUDATU', 'MUAZU ', 'saudatu.muazu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1172', 'SAYYID', 'ADAMU', 'sayyid.adamu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1173', 'SEYNABONE', 'DIAGNE', 'seynabone.diagne@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1174', 'SHAAWA', 'ABDULLAHI', 'shaawa.abdullahi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1175', 'SHAMAU', 'SHARIF', 'shamau.sharif@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1176', 'SHEHU', 'KAMILA', 'shehu.kamila@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1177', 'SHEHU', 'KAMAL', 'shehu.kamal@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1178', 'SHUAIB SALISU', 'SALAHA', 'shuaibsalisu.salaha@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1179', 'SHUIAB', 'FARIDA', 'shuiab.farida@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1180', 'SIDDIQ', 'MUHAMMAD', 'siddiq.muhammad@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1181', 'SULEIMAN', 'AMINU', 'suleiman.aminu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1182', 'SULEIMAN', 'AISHATU', 'suleiman.aishatu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1183', 'SULEIMAN', 'HAMZA', 'suleiman.hamza@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1184', 'SULEIMAN', 'ABU', 'suleiman.abu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1185', 'SULEIMAN', 'MUHAMMAD', 'suleiman.muhammad@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1186', 'SULTANA', 'YUSUF', 'sultana.yusuf@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1187', 'SULTANA', 'BELLO', 'sultana.bello@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1188', 'SULTANA', 'MOHD YUSUF ', 'sultana.mohdyusuf@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1189', 'SUMAIYA', 'ALIYU', 'sumaiya.aliyu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1190', 'SUMAIYA', 'SANI  ', 'sumaiya.sani@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1191', 'SUMAYYA', 'MOHAMMED', 'sumayya.mohammed@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1192', 'SUWAIBATU', 'ALBASU', 'suwaibatu.albasu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1193', 'TAHA', 'USMAN', 'taha.usman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1194', 'TAHIR', 'MAHMOOD', 'tahir.mahmood@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1195', 'TAHIR', 'IBRAHIM', 'tahir.ibrahim@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1196', 'TAIBA', 'YAHAYA', 'taiba.yahaya@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1197', 'TAIYE', 'SALIU', 'taiye.saliu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1198', 'TANIMU', 'SAHALU', 'tanimu.sahalu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1199', 'TANZIL', 'BAKOJI', 'tanzil.bakoji@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1200', 'TAREEQ', 'OBANSA', 'tareeq.obansa@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1201', 'TASLIMA', 'ABBAS', 'taslima.abbas@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1202', 'TASLIMAH', 'ABBAS ', 'taslimah.abbas@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1203', 'TATA', 'ISSA', 'tata.issa@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1204', 'TIJANI', 'AHMED', 'tijani.ahmed@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1205', 'TOBEEB', 'KASSIM', 'tobeeb.kassim@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1206', 'TOYYIB', 'ABDULKADIR', 'toyyib.abdulkadir@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1207', 'TURKUR', 'MOHAMMED ', 'turkur.mohammed@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1208', 'UBAIDA', 'SIDI', 'ubaida.sidi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1209', 'UMAIMA', 'GIDADO', 'umaima.gidado@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1210', 'UMAIMA', 'IBRAHIM', 'umaima.ibrahim@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1211', 'UMAIMA', 'LABARAN', 'umaima.labaran@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1212', 'UMAINA', 'MUHAMMAD', 'umaina.muhammad@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1213', 'UMAINAH', 'HASAN', 'umainah.hasan@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1214', 'UMAR', 'USMAN ALIYU', 'umar.usmanaliyu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1215', 'UMAR', 'YAKUBU', 'umar.yakubu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1216', 'UMAR', 'AHMED', 'umar.ahmed@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1217', 'UMAR', 'FAROUQ', 'umar.farouq@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1218', 'UMAR', 'DANLADI UMAR', 'umar.danladiumar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1219', 'UMAR', 'SANUSI', 'umar.sanusi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1220', 'UMAR', 'IMRAN', 'umar.imran@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1221', 'UMAR', 'ABUBAKAR', 'umar.abubakar2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1222', 'UMAR', 'MUHAMMAD', 'umar.muhammad@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1223', 'UMAR', 'GARBA', 'umar.garba@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1224', 'UMAR', 'ABDULLAHI', 'umar.abdullahi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1225', 'UMAR', 'LAWAN', 'umar.lawan2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1226', 'UMAR', 'YUSUF', 'umar.yusuf@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1227', 'UMAR', 'BELLO', 'umar.bello@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1228', 'UMAR', 'YAHUZA', 'umar.yahuza@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1229', 'UMAR', 'MOHAMMED', 'umar.mohammed2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1230', 'UMAR', 'LAWAN', 'umar.lawan@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1231', 'UMAR', 'ABUBAKAR', 'umar.abubakar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1232', 'UMAR', 'MOHAMMED', 'umar.mohammed@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1233', 'UMAR', 'AHMAD ', 'umar.ahmad@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1234', 'UMAR', 'GAMBO', 'umar.gambo@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1235', 'UMAR FARUK', 'M. BELLO', 'umarfaruk.m.bello@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1236', 'UMAR-FAROUQ', 'MOHAMMED', 'umar-farouq.mohammed@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1237', 'UMAYYA', 'USMAN', 'umayya.usman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1238', 'UMMALHAIRI', 'AUDI', 'ummalhairi.audi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1239', 'UMMU KULTHUM', 'IBRAHIM', 'ummukulthum.ibrahim@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1240', 'UMMULAILA', 'SANI', 'ummulaila.sani@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1241', 'UMMULKHAIR', 'SULEIMAN', 'ummulkhair.suleiman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1242', 'UMMUN-NUR', 'SULEIMAN', 'ummun-nur.suleiman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1243', 'UMULKHAIR', 'AUDI ZAREWA', 'umulkhair.audizarewa@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1244', 'USMAN', 'LAWAL', 'usman.lawal@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1245', 'USMAN', 'DANLADI UMAR', 'usman.danladiumar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1246', 'USMAN', 'ALKALI', 'usman.alkali@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1247', 'USMAN', 'JIBRIL', 'usman.jibril@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1248', 'USMAN', ' ALAMINU', 'usman.alaminu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1249', 'USMAN', 'UMAR', 'usman.umar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1250', 'USMAN', 'SHEHU', 'usman.shehu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1251', 'USMAN', 'SANI', 'usman.sani@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1252', 'USMAN', 'NASIR', 'usman.nasir@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1253', 'USMAN', 'UMAR', 'usman.umar2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1254', 'USMAN', 'LAWAL ', 'usman.lawal@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1255', 'USMAN', 'BALOGUN', 'usman.balogun@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1256', 'USMAN', 'ALIYU', 'usman.aliyu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1257', 'USMAN', 'ABDULAZEEZ', 'usman.abdulazeez@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1258', 'USMAN', 'LAWAN', 'usman.lawan@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1259', 'USMAN', 'MUKTAR', 'usman.muktar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1260', 'USMAN', 'BELLO', 'usman.bello@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1261', 'USMAN', 'HUSSAINI', 'usman.hussaini@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1262', 'USMAN', 'HUSSAINI', 'usman.hussaini2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1263', 'USMAN', 'USMAN', 'usman.usman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1264', 'WAIMAN', 'BALA ', 'waiman.bala@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1265', 'WALEED', 'MUKHTAR', 'waleed.mukhtar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1266', 'WALID', 'BELLO', 'walid.bello@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1267', 'YAASMEEN OZICHU', 'MUSA', 'yaasmeenozichu.musa@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1268', 'YAHAYA', 'SANI', 'yahaya.sani@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1269', 'YAHYA ', 'KABIRU ', 'yahya.kabiru@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1270', 'YAQUB', 'HAMZAH', 'yaqub.hamzah@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1271', 'YAQUB', 'MALAH', 'yaqub.malah@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1272', 'YASIR', 'IBRAHIM', 'yasir.ibrahim@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1273', 'YASIR', 'IBRAHIM ', 'yasir.ibrahim@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1274', 'YASMIN', 'ABBAS', 'yasmin.abbas@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1275', 'YASMIN', 'ALIYU', 'yasmin.aliyu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1276', 'YASMIN', 'IBRAHIM', 'yasmin.ibrahim@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1277', 'YASMIN', 'IBRAHIM', 'yasmin.ibrahim2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1278', 'YAU', 'SAFIYANU', 'yau.safiyanu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1279', 'YAZID', 'MOHAMMED', 'yazid.mohammed@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1280', 'YAZID', 'IBRAHIM', 'yazid.ibrahim@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1281', 'YAZID', 'ALIYU MOHAMMED', 'yazid.aliyumohammed@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1282', 'YUHANASU', 'SULEIMAN', 'yuhanasu.suleiman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1283', 'YUMNA', 'MOMOH', 'yumna.momoh@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1284', 'YUSUF', 'MUHAMMAD', 'yusuf.muhammad@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1285', 'YUSUF', 'IBRAHIM', 'yusuf.ibrahim@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1286', 'YUSUF', 'ABDULLAHI', 'yusuf.abdullahi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1287', 'YUSUF', 'ABDULLAHI', 'yusuf.abdullahi2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1288', 'YUSUF', 'MOHAMMED ', 'yusuf.mohammed@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1289', 'YUSUF', 'ABDULLAHI', 'yusuf.abdullahi3@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1290', 'YUSUF', 'UMAR', 'yusuf.umar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1291', 'YUSUF', 'NURUDEEN', 'yusuf.nurudeen@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1292', 'YUSUF', 'BELLO', 'yusuf.bello@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1293', 'YUSURAH', 'IBRAHIM', 'yusurah.ibrahim@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1294', 'ZAFIRA', 'BELLO', 'zafira.bello@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1295', 'ZAHARADDEEN', 'AMINU', 'zaharaddeen.aminu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1296', 'ZAHIRA', 'MAHMOOD', 'zahira.mahmood@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1297', 'ZAHRA', 'IBRAHIM', 'zahra.ibrahim@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1298', 'ZAILANI', 'MUHAMMAD', 'zailani.muhammad@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1299', 'ZAINAB', 'SADIQ', 'zainab.sadiq@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1300', 'ZAINAB', 'AHMED', 'zainab.ahmed@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1301', 'ZAINAB', 'AHMED', 'zainab.ahmed2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1302', 'ZAINAB', 'ALKALI', 'zainab.alkali@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1303', 'ZAINAB', 'ISA', 'zainab.isa@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1304', 'ZAINAB', 'OYETUNDE', 'zainab.oyetunde2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1305', 'ZAINAB', 'SANI MOHAMMED', 'zainab.sanimohammed@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1306', 'ZAINAB', 'OYETUNDE', 'zainab.oyetunde@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1307', 'ZAINAB', 'AHMAD', 'zainab.ahmad2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1308', 'ZAINAB', 'ADAMU', 'zainab.adamu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1309', 'ZAINAB', 'GAMBO', 'zainab.gambo@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1310', 'ZAINAB', 'BELLO', 'zainab.bello@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1311', 'ZAINAB', 'ABDULMAJEED', 'zainab.abdulmajeed@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1312', 'ZAINAB', 'ABDUL-HADI', 'zainab.abdul-hadi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1313', 'ZAINAB', 'KAWU', 'zainab.kawu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1314', 'ZAINAB', 'ABUBAKAR', 'zainab.abubakar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1315', 'ZAINAB', 'USMAN', 'zainab.usman2@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1316', 'ZAINAB', 'ABDULLAHI', 'zainab.abdullahi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1317', 'ZAINAB', 'AMINU', 'zainab.aminu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1318', 'ZAINAB', 'AHMAD', 'zainab.ahmad@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1319', 'ZAINAB', 'LAWAN', 'zainab.lawan@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1320', 'ZAINAB', 'AHMAD ', 'zainab.ahmad@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1321', 'ZAINAB', 'SHUAIBU', 'zainab.shuaibu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1322', 'ZAINAB', 'MUHAMMAD', 'zainab.muhammad@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1323', 'ZAINAB', 'USMAN', 'zainab.usman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1324', 'ZAINAB', 'HABIB', 'zainab.habib@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1325', 'ZAINAB', 'IDRIS', 'zainab.idris@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1326', 'ZAINAB', 'HAMMA', 'zainab.hamma@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1327', 'ZAINAB', 'SALAHU', 'zainab.salahu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1328', 'ZAINAB', 'JIBRIN', 'zainab.jibrin@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1329', 'ZAINAB', 'ISMAILA', 'zainab.ismaila@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1330', 'ZAINAB', 'LAWAL', 'zainab.lawal@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1331', 'ZAINAB', 'SULEIMAN', 'zainab.suleiman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1332', 'ZAINU', 'ABUBAKAR SADDEEQ', 'zainu.abubakarsaddeeq@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1333', 'ZAKIYA', 'AISHA', 'zakiya.aisha@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1334', 'ZAKIYYA', 'ADAMU', 'zakiyya.adamu@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1335', 'ZAMZAM', 'MOHAMMED', 'zamzam.mohammed@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1336', 'ZARA', 'SHETTIMA', 'zara.shettima@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1337', 'ZARA', 'HASSAN', 'zara.hassan@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1338', 'ZARAH', 'ABUBAKAR', 'zarah.abubakar@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1339', 'ZARA\'U', 'ABDULLAHI', 'zarau.abdullahi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1340', 'ZAYNAB', 'SULEIMAN', 'zaynab.suleiman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1341', 'ZAYYAD', 'ABBAS', 'zayyad.abbas@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1342', 'ZINAT', 'ABDULLAHI', 'zinat.abdullahi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1343', 'ZUBAIDA', 'USMAN', 'zubaida.usman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1344', 'ZULAIHAT', 'BELLO', 'zulaihat.bello@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1345', 'ZULEHA', 'EL-BAFF', 'zuleha.el-baff@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1346', 'ZULQANIAN', 'SULEIMAN', 'zulqanian.suleiman@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1347', 'ZUWAIRA', 'ABDULLAHI', 'zuwaira.abdullahi@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');
INSERT INTO `users` VALUES ('1348', 'AALIYAH', 'LAWAL', 'aaliyah.lawal@ais.sch.ng', '$2a$08$3KE0T.BQh.3Js5Abtgntbek.kfj9Jy5yRRgy8VVqalzwa5r9jk6Ly', '1');

-- ----------------------------
-- Event structure for ais_event_cleaner
-- ----------------------------
DROP EVENT IF EXISTS `ais_event_cleaner`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` EVENT `ais_event_cleaner` ON SCHEDULE EVERY 3 HOUR STARTS '2013-06-24 01:01:52' ON COMPLETION NOT PRESERVE ENABLE COMMENT 'Deletes Passed AIS Calendar Events' DO DELETE FROM events WHERE CURDATE() > DATE(end_date) OR (CURDATE() > DATE(start_date) AND all_day = 1)
;;
DELIMITER ;
