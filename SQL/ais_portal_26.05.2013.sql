/*
Navicat MySQL Data Transfer

Source Server         : LocalDevDB
Source Server Version : 50524
Source Host           : localhost:3306
Source Database       : ais_portal

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2013-05-26 22:52:31
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of academic_sessions
-- ----------------------------
INSERT INTO `academic_sessions` VALUES ('1', '2011/2012', '0');
INSERT INTO `academic_sessions` VALUES ('2', '2012/2013', '1');
INSERT INTO `academic_sessions` VALUES ('3', '2013/2014', '0');

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
-- Table structure for biodata
-- ----------------------------
DROP TABLE IF EXISTS `biodata`;
CREATE TABLE `biodata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`id`,`user_id`,`gender_id`,`state_id`,`nationality_id`,`current_class_id`,`last_class_id`,`csai_id`,`application_type_id`),
  KEY `fk_biodata_users1_idx` (`user_id`),
  KEY `fk_biodata_gender1_idx` (`gender_id`),
  KEY `fk_biodata_states1_idx` (`state_id`),
  KEY `fk_biodata_nationality1_idx` (`nationality_id`),
  KEY `fk_biodata_classes1_idx` (`last_class_id`),
  KEY `fk_biodata_classes2_idx` (`csai_id`),
  KEY `fk_biodata_application_type1_idx` (`application_type_id`),
  KEY `fk_biodata_classes3_idx` (`current_class_id`),
  CONSTRAINT `fk_biodata_application_type1` FOREIGN KEY (`application_type_id`) REFERENCES `application_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_biodata_gender1` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_biodata_nationality1` FOREIGN KEY (`nationality_id`) REFERENCES `nationality` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_biodata_states1` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_biodata_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of biodata
-- ----------------------------
INSERT INTO `biodata` VALUES ('1', '10', '2003-02-12', 'Yakurr', '13173436', '5', '1', '9', '118', '25', '24', '25', '3', '5_passport.jpg', '9');

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
  KEY `fk_entrance_examination_users1_idx` (`user_id`),
  CONSTRAINT `fk_entrance_examination_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of entrance_examination
-- ----------------------------
INSERT INTO `entrance_examination` VALUES ('1', '56', '54', '38', '47', '60', '87', '5');

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
  KEY `fk_medical_records_users1_idx` (`user_id`),
  CONSTRAINT `fk_medical_records_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of medical_records
-- ----------------------------
INSERT INTO `medical_records` VALUES ('1', 'Medical Hospital', 'Medical Hospital Address in the Valley', 'Dr. Who Bond', '08030796088', '46632', 'O+', 'AA', 'None', '', 'No', '', '5');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of official_use
-- ----------------------------
INSERT INTO `official_use` VALUES ('1', '5', '24', '24', '25', '1', 'AR/13/871992');

-- ----------------------------
-- Table structure for parental_information
-- ----------------------------
DROP TABLE IF EXISTS `parental_information`;
CREATE TABLE `parental_information` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `father_name` varchar(50) DEFAULT NULL,
  `father_occupation` varchar(20) DEFAULT NULL,
  `father_religion` varchar(10) DEFAULT NULL,
  `residential_address` text,
  `father_phone_no` varchar(15) DEFAULT NULL,
  `mother_name` varchar(50) DEFAULT NULL,
  `mother_occupation` varchar(20) DEFAULT NULL,
  `mother_religion` varchar(10) DEFAULT NULL,
  `mother_phone_no` varchar(15) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`user_id`),
  KEY `fk_parental_information_users1_idx` (`user_id`),
  CONSTRAINT `fk_parental_information_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of parental_information
-- ----------------------------
INSERT INTO `parental_information` VALUES ('3', 'Dr. Sample Father', 'Civil Servant', 'Islam', 'Somewhere in Nevada', '08030796088', 'Mrs. Sample Mother', 'Civil Servant', 'Islam', '08030796088', '5');

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
  KEY `fk_payments_academic_sessions1_idx` (`academic_session_id`),
  CONSTRAINT `fk_payments_academic_sessions1` FOREIGN KEY (`academic_session_id`) REFERENCES `academic_sessions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_payments_payment_categories1` FOREIGN KEY (`payment_category_id`) REFERENCES `payment_categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_payments_terms1` FOREIGN KEY (`term_id`) REFERENCES `terms` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `payment_name` varchar(20) DEFAULT NULL,
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
INSERT INTO `payment_categories` VALUES ('6', 'Special Islamic Prog');
INSERT INTO `payment_categories` VALUES ('7', 'ICT Services');
INSERT INTO `payment_categories` VALUES ('8', 'E-Learning');
INSERT INTO `payment_categories` VALUES ('9', 'Graduation');
INSERT INTO `payment_categories` VALUES ('10', 'P.T.A');
INSERT INTO `payment_categories` VALUES ('11', 'Science/Art Practica');
INSERT INTO `payment_categories` VALUES ('12', 'Prize-Giving Day Lev');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pins
-- ----------------------------
INSERT INTO `pins` VALUES ('1', '230779485127', '1', '1');
INSERT INTO `pins` VALUES ('2', '121567026073', '1', '1');
INSERT INTO `pins` VALUES ('3', '108015380130', '0', '0');
INSERT INTO `pins` VALUES ('4', '141201293637', '0', '0');
INSERT INTO `pins` VALUES ('5', '194586413821', '0', '0');
INSERT INTO `pins` VALUES ('6', '357420443205', '0', '0');
INSERT INTO `pins` VALUES ('7', '141120128813', '0', '0');
INSERT INTO `pins` VALUES ('8', '135610207019', '0', '0');
INSERT INTO `pins` VALUES ('9', '550032331121', '0', '0');
INSERT INTO `pins` VALUES ('10', '136737982056', '0', '0');

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
  KEY `fk_pin_payments_pins1_idx` (`pin_id`),
  CONSTRAINT `fk_pin_payments_pins1` FOREIGN KEY (`pin_id`) REFERENCES `pins` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pin_payments
-- ----------------------------
INSERT INTO `pin_payments` VALUES ('1', 'Mfawa', 'Alfred Onen', '2500', 'AR-1488474', '2013-05-19', 'Ais Accountant', '1');
INSERT INTO `pin_payments` VALUES ('2', 'Williams', 'Alfred Onen', '2500', 'AR-5639639', '2013-05-19', 'Ais Accountant', '2');

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
  KEY `fk_registered_subjects_classes1_idx` (`class_id`),
  CONSTRAINT `fk_registered_subjects_subjects1` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of registered_subjects
-- ----------------------------

-- ----------------------------
-- Table structure for results
-- ----------------------------
DROP TABLE IF EXISTS `results`;
CREATE TABLE `results` (
  `id` int(11) NOT NULL,
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
  CONSTRAINT `fk_results_academic_sessions1` FOREIGN KEY (`academic_session_id`) REFERENCES `academic_sessions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_results_assessment_types1` FOREIGN KEY (`assessment_type_id`) REFERENCES `assessment_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_results_subjects1` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_results_terms1` FOREIGN KEY (`term_id`) REFERENCES `terms` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Table structure for schedule_of_fees
-- ----------------------------
DROP TABLE IF EXISTS `schedule_of_fees`;
CREATE TABLE `schedule_of_fees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_category_id` int(11) NOT NULL,
  `amount` float DEFAULT NULL,
  `class_id` int(11) NOT NULL,
  `term_id` int(11) NOT NULL,
  `recurring_payment` int(2) NOT NULL,
  PRIMARY KEY (`id`,`payment_category_id`,`class_id`,`term_id`),
  KEY `fk_schedule_of_fees_payment_categories1_idx` (`payment_category_id`),
  KEY `fk_schedule_of_fees_classes1_idx` (`class_id`),
  KEY `fk_schedule_of_fees_terms1_idx` (`term_id`),
  CONSTRAINT `fk_schedule_of_fees_classes1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_schedule_of_fees_payment_categories1` FOREIGN KEY (`payment_category_id`) REFERENCES `payment_categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_schedule_of_fees_terms1` FOREIGN KEY (`term_id`) REFERENCES `terms` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of schedule_of_fees
-- ----------------------------

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
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`class_from_id`,`class_to_id`,`user_id`),
  KEY `fk_schools_attended_classes1_idx` (`class_from_id`),
  KEY `fk_schools_attended_classes2_idx` (`class_to_id`),
  KEY `fk_schools_attended_users1_idx` (`user_id`),
  CONSTRAINT `fk_schools_attended_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of schools_attended
-- ----------------------------
INSERT INTO `schools_attended` VALUES ('1', 'Kings Private School', '1', '23', '2006', '2012', '5');

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
INSERT INTO `sessions` VALUES ('46h62dTOPGmkU3StHVYrWi46tjJCNKGa1xlvLIAZ', '1369600021', 'a:3:{s:5:\":new:\";a:0:{}s:5:\":old:\";a:0:{}s:10:\"csrf_token\";s:40:\"BFZe6I1ja3ycGTX3vRhBC9egWevYmx3WgA0On6OM\";}');

-- ----------------------------
-- Table structure for states
-- ----------------------------
DROP TABLE IF EXISTS `states`;
CREATE TABLE `states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

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

-- ----------------------------
-- Table structure for subjects
-- ----------------------------
DROP TABLE IF EXISTS `subjects`;
CREATE TABLE `subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject_name` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of subjects
-- ----------------------------
INSERT INTO `subjects` VALUES ('1', 'Arabic');
INSERT INTO `subjects` VALUES ('2', 'Basic Science');
INSERT INTO `subjects` VALUES ('3', 'Creative Arts');
INSERT INTO `subjects` VALUES ('4', 'Basic Technology');
INSERT INTO `subjects` VALUES ('5', 'Social Studies');
INSERT INTO `subjects` VALUES ('6', 'Hausa');
INSERT INTO `subjects` VALUES ('7', 'Home Economics');
INSERT INTO `subjects` VALUES ('8', 'Quran');
INSERT INTO `subjects` VALUES ('9', 'English Studies');
INSERT INTO `subjects` VALUES ('10', 'Physical & H.E');
INSERT INTO `subjects` VALUES ('11', 'French');
INSERT INTO `subjects` VALUES ('12', 'Basic Science & Technology');
INSERT INTO `subjects` VALUES ('13', 'Agric Science');
INSERT INTO `subjects` VALUES ('14', 'Business Education');
INSERT INTO `subjects` VALUES ('15', 'Information Technology');
INSERT INTO `subjects` VALUES ('16', 'Mathematics');
INSERT INTO `subjects` VALUES ('17', 'I.R.S');
INSERT INTO `subjects` VALUES ('18', 'Civic Education');
INSERT INTO `subjects` VALUES ('19', 'Health Habit');
INSERT INTO `subjects` VALUES ('20', 'Phonics & Spelling');
INSERT INTO `subjects` VALUES ('21', 'Handwriting');
INSERT INTO `subjects` VALUES ('22', 'Social Norms');

-- ----------------------------
-- Table structure for teachers_and_classes
-- ----------------------------
DROP TABLE IF EXISTS `teachers_and_classes`;
CREATE TABLE `teachers_and_classes` (
  `user_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`class_id`),
  KEY `fk_users_has_classes_classes1_idx` (`class_id`),
  KEY `fk_users_has_classes_users1_idx` (`user_id`),
  CONSTRAINT `fk_users_has_classes_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teachers_and_classes
-- ----------------------------
INSERT INTO `teachers_and_classes` VALUES ('3', '25');
INSERT INTO `teachers_and_classes` VALUES ('4', '26');

-- ----------------------------
-- Table structure for teachers_and_subjects
-- ----------------------------
DROP TABLE IF EXISTS `teachers_and_subjects`;
CREATE TABLE `teachers_and_subjects` (
  `user_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`subject_id`,`class_id`),
  KEY `fk_users_has_subjects_subjects1_idx` (`subject_id`),
  KEY `fk_users_has_subjects_users1_idx` (`user_id`),
  KEY `fk_teachers_and_subjects_classes1_idx` (`class_id`),
  CONSTRAINT `fk_users_has_subjects_subjects1` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_has_subjects_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teachers_and_subjects
-- ----------------------------
INSERT INTO `teachers_and_subjects` VALUES ('4', '9', '24');
INSERT INTO `teachers_and_subjects` VALUES ('4', '9', '25');
INSERT INTO `teachers_and_subjects` VALUES ('3', '16', '24');

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
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`role_id`),
  KEY `fk_users_roles_idx` (`role_id`),
  CONSTRAINT `fk_users_roles` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'AIS', 'Administrator', 'admin@ais.sch.ng', '$2a$08$gvoTOqCQAq.BXmYDILZMDeAliMtr8gRx7IJFW6vfnZ5uri6XrmSw6', '5');
INSERT INTO `users` VALUES ('2', 'Ais', 'Accountant', 'accountant@ais.sch.ng', '$2a$08$iO4suE.bWKqD8JfJCQqGuu6eZSo/g6BWMBgp7uSlwNsJWkw9d/lmS', '3');
INSERT INTO `users` VALUES ('3', 'Ais', 'Teacher One', 'teacher1@ais.sch.ng', '$2a$08$ALWZigL7oSYAXNNvxFv8r.1SrQq9r6FXfUyrWS/0doNNelKNff186', '2');
INSERT INTO `users` VALUES ('4', 'Ais', 'Teacher Two', 'teacher2@ais.sch.ng', '$2a$08$2CMGQzsGBwBw/IrMT9.L4OM3JSI0oyzInpcVYcMljt0f4aSK9NLPi', '2');
INSERT INTO `users` VALUES ('5', 'Mfawa', 'Alfred Onen', 'muffycompoqm@gmail.com', '$2a$08$ULpRdWVJqzTVyrb8hghUy.a.joEqokMTsycnKQV1kwYluXILcIEUm', '1');
INSERT INTO `users` VALUES ('6', 'Williams', 'Alfred Onen', 'kiwixcompome@googlemail.com', '$2a$08$WntuhlneefTlFVYWbCGEZ.GbvalzoYBsJ1UkD5U52Uy9wdXimqkl6', '1');
