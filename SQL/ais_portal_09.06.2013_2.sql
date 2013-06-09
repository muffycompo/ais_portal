/*
Navicat MySQL Data Transfer

Source Server         : LocalDevDB
Source Server Version : 50524
Source Host           : localhost:3306
Source Database       : ais_portal

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2013-06-09 15:17:12
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of academic_sessions
-- ----------------------------
INSERT INTO `academic_sessions` VALUES ('1', '2012/2013', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of biodata
-- ----------------------------
INSERT INTO `biodata` VALUES ('1', null, '13', '2000-02-12', 'Babur', '17878547', '5', '1', '8', '118', '33', '31', '33', '4', '5_passport.jpg', '9');
INSERT INTO `biodata` VALUES ('2', null, '14', '1999-02-12', 'Hausa', '19577138', '6', '1', '5', '118', '33', '31', '33', '4', '6_passport.jpg', '9');
INSERT INTO `biodata` VALUES ('3', null, '53', '1960-01-01', 'Yakurr', '16953536', '7', '1', '9', '118', '33', '32', '33', '4', '7_passport.jpg', '9');
INSERT INTO `biodata` VALUES ('4', null, '10', '2003-02-12', 'Hausa', '67242424', '8', '2', '17', '118', '33', '32', '33', '4', '8_passport.jpg', '9');
INSERT INTO `biodata` VALUES ('5', 'Another', '13', '2000-02-12', 'Kanuri', '19437483', '9', '1', '8', '118', '1', '2', '8', '1', '9_passport.jpg', '7');

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
  KEY `fk_entrance_examination_users1_idx` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of entrance_examination
-- ----------------------------
INSERT INTO `entrance_examination` VALUES ('1', '100', '45', '56', '78', '13', '54', '5');
INSERT INTO `entrance_examination` VALUES ('2', '87', '64', '83', '75', '34', '45', '6');
INSERT INTO `entrance_examination` VALUES ('3', '45', '78', '38', '69', '86', '87', '7');
INSERT INTO `entrance_examination` VALUES ('4', '87', '87', '68', '78', '60', '31', '8');

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
  KEY `fk_medical_records_users1_idx` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of medical_records
-- ----------------------------
INSERT INTO `medical_records` VALUES ('1', 'Medical Hospital', 'Some Hospital', 'Demo Doctor', '08030796088', '466343', 'O', 'AA', 'None', '', 'No', '', '5');
INSERT INTO `medical_records` VALUES ('2', 'Medical Hospital', 'Listings in Demo Area', 'Dr. Mustapha Umar', '08036879223', '18432', 'A', 'AS', 'Yes', 'Reacts To Excess Stress', 'No', '', '6');
INSERT INTO `medical_records` VALUES ('3', 'Medical Hospital', 'Another Hospital', 'Demo Doctor', '08036879223', '989321', 'O', 'AA', 'None', '', 'No', '', '7');
INSERT INTO `medical_records` VALUES ('4', 'Medical Hospital', 'Another Hospital', 'Demo Doctor', '08030796088', '786343', 'B', 'AA', 'None', '', 'No', '', '8');
INSERT INTO `medical_records` VALUES ('5', 'Medical Hospital', 'Hospital', 'Dr. Mustapha Usman', '08030796088', '7863432', 'A', 'AS', 'None', '', 'No', '', '9');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of official_use
-- ----------------------------
INSERT INTO `official_use` VALUES ('1', '5', '31', '1', '33', '2', 'AR/13/390478');
INSERT INTO `official_use` VALUES ('2', '6', '31', '1', '33', '1', 'AR/13/109227');
INSERT INTO `official_use` VALUES ('3', '7', '32', '1', '33', '1', 'AR/13/937228');
INSERT INTO `official_use` VALUES ('4', '8', '32', '1', '33', '1', 'AR/13/136882');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of parental_information
-- ----------------------------
INSERT INTO `parental_information` VALUES ('1', 'Demo Father', 'Civil Servant', '1', 'Somewhere in Nevada', '08002341234', 'Demo Mother', 'House Wife', '1', '08002341234', '5');
INSERT INTO `parental_information` VALUES ('2', 'Umar A. Muhammad', 'Civil Servant', '1', 'Somewhere', '08030796088', 'Demo Mother', 'House Wife', '1', '08030796088', '6');
INSERT INTO `parental_information` VALUES ('3', 'Dr. Sample Father', 'Civil Servant', '1', 'Another Address', '08030796088', 'Demo Mother', 'Lawyer', '1', '08030796088', '7');
INSERT INTO `parental_information` VALUES ('4', 'Demo Father', 'Civil Servant', '1', 'Another Residential Address', '08030796088', 'Amina Hassan', 'Banker', '1', '08030796088', '8');
INSERT INTO `parental_information` VALUES ('5', 'Umar A. Muhammad', 'Civil Servant', '1', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam,', '08030796088', 'Amina Hassan', 'House Wife', '1', '08030796088', '9');

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pins
-- ----------------------------
INSERT INTO `pins` VALUES ('1', '230779485127', '1', '1');
INSERT INTO `pins` VALUES ('2', '121567026073', '1', '1');
INSERT INTO `pins` VALUES ('3', '108015380130', '1', '1');
INSERT INTO `pins` VALUES ('4', '141201293637', '1', '1');
INSERT INTO `pins` VALUES ('5', '194586413821', '1', '1');
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
  KEY `fk_pin_payments_pins1_idx` (`pin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pin_payments
-- ----------------------------
INSERT INTO `pin_payments` VALUES ('1', 'Jonathan', 'Doe', '2500', 'AR-6831579', '2013-06-09', 'Ais Accountant', '1');
INSERT INTO `pin_payments` VALUES ('2', 'Mfawa', 'Onen', '2500', 'AR-5052592', '2013-06-09', 'Ais Accountant', '2');
INSERT INTO `pin_payments` VALUES ('3', 'Williams', 'Onen', '2500', 'AR-5705575', '2013-06-09', 'Ais Accountant', '3');
INSERT INTO `pin_payments` VALUES ('4', 'Demo', 'Student', '2500', 'AR-6848013', '2013-06-09', 'Ais Accountant', '4');
INSERT INTO `pin_payments` VALUES ('5', 'Test', 'Applicant', '2500', 'AR-7646302', '2013-06-09', 'AIS Administrator', '5');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of religions
-- ----------------------------
INSERT INTO `religions` VALUES ('1', 'Islam');

-- ----------------------------
-- Table structure for results
-- ----------------------------
DROP TABLE IF EXISTS `results`;
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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of results
-- ----------------------------
INSERT INTO `results` VALUES ('1', 'AR/13/390478', '17', '1', '1', '1', '1', '33', '2');
INSERT INTO `results` VALUES ('2', 'AR/13/390478', '8', '2', '1', '1', '1', '33', '2');
INSERT INTO `results` VALUES ('3', 'AR/13/390478', '4', '3', '1', '1', '1', '33', '2');
INSERT INTO `results` VALUES ('4', 'AR/13/390478', '25', '4', '1', '1', '1', '33', '2');
INSERT INTO `results` VALUES ('5', 'AR/13/109227', '15', '1', '1', '1', '1', '33', '2');
INSERT INTO `results` VALUES ('6', 'AR/13/109227', '6', '2', '1', '1', '1', '33', '2');
INSERT INTO `results` VALUES ('7', 'AR/13/109227', '6', '3', '1', '1', '1', '33', '2');
INSERT INTO `results` VALUES ('8', 'AR/13/109227', '30', '4', '1', '1', '1', '33', '2');
INSERT INTO `results` VALUES ('9', 'AR/13/937228', '16', '1', '1', '1', '1', '33', '2');
INSERT INTO `results` VALUES ('10', 'AR/13/937228', '8', '2', '1', '1', '1', '33', '2');
INSERT INTO `results` VALUES ('11', 'AR/13/937228', '7', '3', '1', '1', '1', '33', '2');
INSERT INTO `results` VALUES ('12', 'AR/13/937228', '35', '4', '1', '1', '1', '33', '2');
INSERT INTO `results` VALUES ('13', 'AR/13/136882', '14', '1', '1', '1', '1', '33', '2');
INSERT INTO `results` VALUES ('14', 'AR/13/136882', '5', '2', '1', '1', '1', '33', '2');
INSERT INTO `results` VALUES ('15', 'AR/13/136882', '8', '3', '1', '1', '1', '33', '2');
INSERT INTO `results` VALUES ('16', 'AR/13/136882', '42', '4', '1', '1', '1', '33', '2');
INSERT INTO `results` VALUES ('17', 'AR/13/390478', '15', '1', '4', '1', '1', '33', '2');
INSERT INTO `results` VALUES ('18', 'AR/13/390478', '6', '2', '4', '1', '1', '33', '2');
INSERT INTO `results` VALUES ('19', 'AR/13/390478', '5', '3', '4', '1', '1', '33', '2');
INSERT INTO `results` VALUES ('20', 'AR/13/390478', '50', '4', '4', '1', '1', '33', '2');
INSERT INTO `results` VALUES ('21', 'AR/13/109227', '18', '1', '4', '1', '1', '33', '2');
INSERT INTO `results` VALUES ('22', 'AR/13/109227', '6', '2', '4', '1', '1', '33', '2');
INSERT INTO `results` VALUES ('23', 'AR/13/109227', '7', '3', '4', '1', '1', '33', '2');
INSERT INTO `results` VALUES ('24', 'AR/13/109227', '40', '4', '4', '1', '1', '33', '2');
INSERT INTO `results` VALUES ('25', 'AR/13/937228', '12', '1', '4', '1', '1', '33', '2');
INSERT INTO `results` VALUES ('26', 'AR/13/937228', '8', '2', '4', '1', '1', '33', '2');
INSERT INTO `results` VALUES ('27', 'AR/13/136882', '16', '1', '4', '1', '1', '33', '2');
INSERT INTO `results` VALUES ('28', 'AR/13/136882', '7', '2', '4', '1', '1', '33', '2');
INSERT INTO `results` VALUES ('29', 'AR/13/136882', '7', '3', '4', '1', '1', '33', '2');
INSERT INTO `results` VALUES ('30', 'AR/13/136882', '47', '4', '4', '1', '1', '33', '2');
INSERT INTO `results` VALUES ('31', 'AR/13/937228', '9', '3', '4', '1', '1', '33', '2');
INSERT INTO `results` VALUES ('32', 'AR/13/937228', '38', '4', '4', '1', '1', '33', '2');
INSERT INTO `results` VALUES ('33', 'AR/13/390478', '15', '1', '5', '1', '1', '33', '2');
INSERT INTO `results` VALUES ('34', 'AR/13/390478', '8', '2', '5', '1', '1', '33', '2');
INSERT INTO `results` VALUES ('35', 'AR/13/390478', '7.5', '3', '5', '1', '1', '33', '2');
INSERT INTO `results` VALUES ('36', 'AR/13/390478', '52', '4', '5', '1', '1', '33', '2');
INSERT INTO `results` VALUES ('37', 'AR/13/109227', '14', '1', '5', '1', '1', '33', '2');
INSERT INTO `results` VALUES ('38', 'AR/13/109227', '8', '2', '5', '1', '1', '33', '2');
INSERT INTO `results` VALUES ('39', 'AR/13/109227', '7', '3', '5', '1', '1', '33', '2');
INSERT INTO `results` VALUES ('40', 'AR/13/109227', '46', '4', '5', '1', '1', '33', '2');
INSERT INTO `results` VALUES ('41', 'AR/13/937228', '15', '1', '5', '1', '1', '33', '2');
INSERT INTO `results` VALUES ('42', 'AR/13/937228', '5', '2', '5', '1', '1', '33', '2');
INSERT INTO `results` VALUES ('43', 'AR/13/937228', '8', '3', '5', '1', '1', '33', '2');
INSERT INTO `results` VALUES ('44', 'AR/13/937228', '47.5', '4', '5', '1', '1', '33', '2');
INSERT INTO `results` VALUES ('45', 'AR/13/136882', '10', '1', '5', '1', '1', '33', '2');
INSERT INTO `results` VALUES ('46', 'AR/13/136882', '6', '2', '5', '1', '1', '33', '2');
INSERT INTO `results` VALUES ('47', 'AR/13/136882', '5', '3', '5', '1', '1', '33', '2');
INSERT INTO `results` VALUES ('48', 'AR/13/136882', '58', '4', '5', '1', '1', '33', '2');

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
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`,`payment_category_id`,`class_id`,`term_id`),
  KEY `fk_schedule_of_fees_payment_categories1_idx` (`payment_category_id`),
  KEY `fk_schedule_of_fees_classes1_idx` (`class_id`),
  KEY `fk_schedule_of_fees_terms1_idx` (`term_id`),
  CONSTRAINT `fk_schedule_of_fees_payment_categories1` FOREIGN KEY (`payment_category_id`) REFERENCES `payment_categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1690 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of schedule_of_fees
-- ----------------------------
INSERT INTO `schedule_of_fees` VALUES ('1', '0', '45000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('2', '0', '2500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('3', '0', '1000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('4', '0', '4000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('5', '0', '1000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('6', '0', '500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('7', '0', '8000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('8', '0', '2200', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('9', '0', '2000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('10', '0', '2000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('11', '0', '3000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('12', '0', '500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('13', '0', '500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('14', '0', '53000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('15', '0', '2500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('16', '0', '1000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('17', '0', '7000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('18', '0', '3000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('19', '0', '2000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('20', '0', '9000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('21', '0', '2500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('22', '0', '2200', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('23', '0', '2000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('24', '0', '3000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('25', '0', '500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('26', '0', '500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('27', '0', '53000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('28', '0', '2500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('29', '0', '1000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('30', '0', '7000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('31', '0', '3000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('32', '0', '2000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('33', '0', '9000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('34', '0', '2500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('35', '0', '2200', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('36', '0', '2000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('37', '0', '3000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('38', '0', '500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('39', '0', '500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('40', '0', '53000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('41', '0', '2500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('42', '0', '1000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('43', '0', '7000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('44', '0', '3000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('45', '0', '2000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('46', '0', '9000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('47', '0', '2500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('48', '0', '2200', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('49', '0', '2000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('50', '0', '3000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('51', '0', '500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('52', '0', '500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('53', '0', '53000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('54', '0', '2500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('55', '0', '1000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('56', '0', '7000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('57', '0', '3000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('58', '0', '2000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('59', '0', '9000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('60', '0', '2500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('61', '0', '2200', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('62', '0', '2000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('63', '0', '3000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('64', '0', '500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('65', '0', '500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('66', '0', '53000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('67', '0', '2500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('68', '0', '1000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('69', '0', '7000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('70', '0', '3000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('71', '0', '2000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('72', '0', '9000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('73', '0', '2500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('74', '0', '2200', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('75', '0', '2000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('76', '0', '3000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('77', '0', '500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('78', '0', '500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('79', '0', '53000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('80', '0', '2500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('81', '0', '1000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('82', '0', '7000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('83', '0', '3000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('84', '0', '2000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('85', '0', '9000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('86', '0', '2500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('87', '0', '2200', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('88', '0', '2000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('89', '0', '3000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('90', '0', '500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('91', '0', '500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('92', '0', '53000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('93', '0', '2500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('94', '0', '1000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('95', '0', '8000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('96', '0', '3000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('97', '0', '2000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('98', '0', '9000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('99', '0', '2500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('100', '0', '2200', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('101', '0', '2000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('102', '0', '3000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('103', '0', '500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('104', '0', '500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('105', '0', '53000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('106', '0', '2500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('107', '0', '1000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('108', '0', '8000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('109', '0', '3000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('110', '0', '2000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('111', '0', '9000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('112', '0', '2500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('113', '0', '2200', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('114', '0', '2000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('115', '0', '3000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('116', '0', '500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('117', '0', '500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('118', '0', '53000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('119', '0', '2500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('120', '0', '1000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('121', '0', '8000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('122', '0', '3000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('123', '0', '2000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('124', '0', '9000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('125', '0', '2500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('126', '0', '2200', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('127', '0', '2000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('128', '0', '3000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('129', '0', '500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('130', '0', '500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('131', '0', '55000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('132', '0', '3000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('133', '0', '1000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('134', '0', '14000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('135', '0', '4500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('136', '0', '2000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('137', '0', '12300', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('138', '0', '2800', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('139', '0', '2500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('140', '0', '2000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('141', '0', '3500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('142', '0', '500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('143', '0', '500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('144', '0', '1000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('145', '0', '500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('146', '0', '8000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('147', '0', '55000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('148', '0', '3000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('149', '0', '1000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('150', '0', '14000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('151', '0', '4500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('152', '0', '2000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('153', '0', '12300', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('154', '0', '2800', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('155', '0', '2500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('156', '0', '2000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('157', '0', '3500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('158', '0', '500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('159', '0', '500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('160', '0', '1000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('161', '0', '500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('162', '0', '8000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('163', '0', '55000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('164', '0', '3000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('165', '0', '1000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('166', '0', '14000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('167', '0', '4500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('168', '0', '2000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('169', '0', '12300', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('170', '0', '2800', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('171', '0', '2500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('172', '0', '2000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('173', '0', '3500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('174', '0', '500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('175', '0', '500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('176', '0', '1000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('177', '0', '500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('178', '0', '8000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('179', '0', '55000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('180', '0', '3000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('181', '0', '1000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('182', '0', '14000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('183', '0', '4500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('184', '0', '2000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('185', '0', '12300', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('186', '0', '2800', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('187', '0', '2500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('188', '0', '2000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('189', '0', '3500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('190', '0', '500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('191', '0', '500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('192', '0', '1000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('193', '0', '500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('194', '0', '8000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('195', '0', '55000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('196', '0', '3000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('197', '0', '1000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('198', '0', '14000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('199', '0', '4500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('200', '0', '2000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('201', '0', '12300', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('202', '0', '2800', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('203', '0', '2500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('204', '0', '2000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('205', '0', '3500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('206', '0', '500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('207', '0', '500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('208', '0', '1000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('209', '0', '500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('210', '0', '8000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('211', '0', '55000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('212', '0', '3000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('213', '0', '1000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('214', '0', '14000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('215', '0', '4500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('216', '0', '2000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('217', '0', '12300', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('218', '0', '2800', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('219', '0', '2500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('220', '0', '2000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('221', '0', '3500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('222', '0', '500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('223', '0', '500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('224', '0', '1000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('225', '0', '500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('226', '0', '8000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('227', '0', '55000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('228', '0', '3000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('229', '0', '1000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('230', '0', '14000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('231', '0', '4500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('232', '0', '2000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('233', '0', '12300', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('234', '0', '2800', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('235', '0', '2500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('236', '0', '2000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('237', '0', '3500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('238', '0', '500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('239', '0', '500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('240', '0', '1000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('241', '0', '500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('242', '0', '8000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('243', '0', '55000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('244', '0', '3000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('245', '0', '1000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('246', '0', '14000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('247', '0', '4500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('248', '0', '2000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('249', '0', '12300', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('250', '0', '2800', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('251', '0', '2500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('252', '0', '2000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('253', '0', '3500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('254', '0', '500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('255', '0', '500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('256', '0', '1000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('257', '0', '500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('258', '0', '8000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('259', '0', '57000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('260', '0', '3000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('261', '0', '1000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('262', '0', '15000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('263', '0', '5000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('264', '0', '2000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('265', '0', '12500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('266', '0', '3000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('267', '0', '2800', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('268', '0', '2000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('269', '0', '3500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('270', '0', '500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('271', '0', '500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('272', '0', '1000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('273', '0', '500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('274', '0', '8000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('275', '0', '57000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('276', '0', '3000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('277', '0', '1000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('278', '0', '15000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('279', '0', '5000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('280', '0', '2000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('281', '0', '12500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('282', '0', '3000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('283', '0', '2800', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('284', '0', '2000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('285', '0', '3500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('286', '0', '500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('287', '0', '500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('288', '0', '1000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('289', '0', '500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('290', '0', '8000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('291', '0', '57000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('292', '0', '3000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('293', '0', '1000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('294', '0', '15000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('295', '0', '5000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('296', '0', '2000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('297', '0', '12500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('298', '0', '3000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('299', '0', '2800', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('300', '0', '2000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('301', '0', '3500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('302', '0', '500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('303', '0', '500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('304', '0', '1000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('305', '0', '500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('306', '0', '8000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('307', '0', '57000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('308', '0', '3000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('309', '0', '1000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('310', '0', '15000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('311', '0', '5000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('312', '0', '2000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('313', '0', '12500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('314', '0', '3000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('315', '0', '2800', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('316', '0', '2000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('317', '0', '3500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('318', '0', '500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('319', '0', '500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('320', '0', '1000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('321', '0', '500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('322', '0', '8000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('323', '0', '57000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('324', '0', '3000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('325', '0', '1000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('326', '0', '15000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('327', '0', '5000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('328', '0', '2000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('329', '0', '12500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('330', '0', '3000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('331', '0', '2800', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('332', '0', '2000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('333', '0', '3500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('334', '0', '500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('335', '0', '500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('336', '0', '1000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('337', '0', '500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('338', '0', '8000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('339', '0', '57000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('340', '0', '3000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('341', '0', '1000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('342', '0', '15000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('343', '0', '5000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('344', '0', '2000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('345', '0', '12500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('346', '0', '3000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('347', '0', '2800', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('348', '0', '2000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('349', '0', '3500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('350', '0', '500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('351', '0', '500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('352', '0', '1000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('353', '0', '500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('354', '0', '8000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('355', '0', '60000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('356', '0', '4000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('357', '0', '1000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('358', '0', '19000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('359', '0', '5500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('360', '0', '1500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('361', '0', '700', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('362', '0', '2500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('363', '0', '15500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('364', '0', '3500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('365', '0', '2000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('366', '0', '5000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('367', '0', '500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('368', '0', '500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('369', '0', '8000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('370', '0', '2500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('371', '0', '8000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('372', '0', '60000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('373', '0', '4000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('374', '0', '1000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('375', '0', '19000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('376', '0', '5500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('377', '0', '1500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('378', '0', '700', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('379', '0', '2500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('380', '0', '15500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('381', '0', '3500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('382', '0', '2000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('383', '0', '5000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('384', '0', '500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('385', '0', '500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('386', '0', '8000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('387', '0', '2500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('388', '0', '8000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('389', '0', '60000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('390', '0', '4000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('391', '0', '1000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('392', '0', '19000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('393', '0', '5500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('394', '0', '1500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('395', '0', '700', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('396', '0', '2500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('397', '0', '15500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('398', '0', '3500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('399', '0', '2000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('400', '0', '5000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('401', '0', '500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('402', '0', '500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('403', '0', '8000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('404', '0', '2500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('405', '0', '8000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('406', '0', '60000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('407', '0', '4000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('408', '0', '1000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('409', '0', '19000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('410', '0', '5500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('411', '0', '1500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('412', '0', '700', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('413', '0', '2500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('414', '0', '15500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('415', '0', '3500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('416', '0', '2000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('417', '0', '5000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('418', '0', '500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('419', '0', '500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('420', '0', '8000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('421', '0', '2500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('422', '0', '8000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('423', '0', '60000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('424', '0', '4000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('425', '0', '1000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('426', '0', '19000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('427', '0', '5500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('428', '0', '1500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('429', '0', '700', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('430', '0', '2500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('431', '0', '15500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('432', '0', '3500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('433', '0', '2000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('434', '0', '5000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('435', '0', '500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('436', '0', '500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('437', '0', '8000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('438', '0', '2500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('439', '0', '8000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('440', '0', '60000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('441', '0', '4000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('442', '0', '1000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('443', '0', '19000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('444', '0', '5500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('445', '0', '1500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('446', '0', '700', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('447', '0', '2500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('448', '0', '15500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('449', '0', '3500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('450', '0', '2000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('451', '0', '5000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('452', '0', '500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('453', '0', '500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('454', '0', '8000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('455', '0', '2500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('456', '0', '8000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('457', '0', '60000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('458', '0', '4000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('459', '0', '1000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('460', '0', '19000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('461', '0', '5500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('462', '0', '1500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('463', '0', '700', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('464', '0', '2500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('465', '0', '15500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('466', '0', '3500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('467', '0', '2000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('468', '0', '5000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('469', '0', '500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('470', '0', '500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('471', '0', '8000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('472', '0', '2500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('473', '0', '8000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('474', '0', '60000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('475', '0', '4000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('476', '0', '1000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('477', '0', '19000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('478', '0', '5500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('479', '0', '1500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('480', '0', '700', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('481', '0', '2500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('482', '0', '15500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('483', '0', '3500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('484', '0', '2000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('485', '0', '5000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('486', '0', '500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('487', '0', '500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('488', '0', '8000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('489', '0', '2500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('490', '0', '8000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('491', '0', '75000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('492', '0', '5000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('493', '0', '1000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('494', '0', '25000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('495', '0', '6500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('496', '0', '1500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('497', '0', '1000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('498', '0', '3000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('499', '0', '17000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('500', '0', '3800', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('501', '0', '2000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('502', '0', '5000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('503', '0', '500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('504', '0', '500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('505', '0', '8000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('506', '0', '5000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('507', '0', '8000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('508', '0', '75000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('509', '0', '5000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('510', '0', '1000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('511', '0', '25000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('512', '0', '6500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('513', '0', '1500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('514', '0', '1000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('515', '0', '3000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('516', '0', '17000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('517', '0', '3800', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('518', '0', '2000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('519', '0', '5000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('520', '0', '500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('521', '0', '500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('522', '0', '8000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('523', '0', '5000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('524', '0', '8000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('525', '0', '75000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('526', '0', '5000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('527', '0', '1000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('528', '0', '25000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('529', '0', '6500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('530', '0', '1500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('531', '0', '1000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('532', '0', '3000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('533', '0', '17000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('534', '0', '3800', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('535', '0', '2000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('536', '0', '5000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('537', '0', '500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('538', '0', '500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('539', '0', '8000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('540', '0', '5000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('541', '0', '8000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('542', '0', '75000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('543', '0', '5000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('544', '0', '1000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('545', '0', '25000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('546', '0', '6500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('547', '0', '1500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('548', '0', '1000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('549', '0', '3000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('550', '0', '17000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('551', '0', '3800', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('552', '0', '2000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('553', '0', '5000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('554', '0', '500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('555', '0', '500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('556', '0', '8000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('557', '0', '5000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('558', '0', '8000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('559', '0', '75000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('560', '0', '5000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('561', '0', '1000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('562', '0', '25000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('563', '0', '6500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('564', '0', '1500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('565', '0', '1000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('566', '0', '3000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('567', '0', '17000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('568', '0', '3800', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('569', '0', '2000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('570', '0', '5000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('571', '0', '500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('572', '0', '500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('573', '0', '8000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('574', '0', '5000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('575', '0', '8000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('576', '0', '75000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('577', '0', '5000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('578', '0', '1000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('579', '0', '25000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('580', '0', '6500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('581', '0', '1500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('582', '0', '1000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('583', '0', '3000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('584', '0', '17000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('585', '0', '3800', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('586', '0', '2000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('587', '0', '5000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('588', '0', '500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('589', '0', '500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('590', '0', '8000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('591', '0', '5000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('592', '0', '8000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('593', '0', '75000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('594', '0', '5000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('595', '0', '1000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('596', '0', '25000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('597', '0', '6500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('598', '0', '1500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('599', '0', '1000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('600', '0', '3000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('601', '0', '17000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('602', '0', '3800', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('603', '0', '2000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('604', '0', '5000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('605', '0', '500', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('606', '0', '500', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('607', '0', '8000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('608', '0', '5000', '0', '0', '1', '1');
INSERT INTO `schedule_of_fees` VALUES ('609', '0', '8000', '0', '0', '2', '1');
INSERT INTO `schedule_of_fees` VALUES ('610', '0', '45000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('611', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('612', '0', '4000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('613', '0', '1000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('614', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('615', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('616', '0', '3000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('617', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('618', '0', '53000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('619', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('620', '0', '7000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('621', '0', '3000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('622', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('623', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('624', '0', '3000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('625', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('626', '0', '53000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('627', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('628', '0', '7000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('629', '0', '3000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('630', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('631', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('632', '0', '3000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('633', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('634', '0', '53000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('635', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('636', '0', '7000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('637', '0', '3000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('638', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('639', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('640', '0', '3000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('641', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('642', '0', '53000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('643', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('644', '0', '7000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('645', '0', '3000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('646', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('647', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('648', '0', '3000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('649', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('650', '0', '53000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('651', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('652', '0', '7000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('653', '0', '3000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('654', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('655', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('656', '0', '3000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('657', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('658', '0', '53000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('659', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('660', '0', '7000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('661', '0', '3000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('662', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('663', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('664', '0', '3000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('665', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('666', '0', '53000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('667', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('668', '0', '8000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('669', '0', '3000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('670', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('671', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('672', '0', '3000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('673', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('674', '0', '53000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('675', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('676', '0', '8000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('677', '0', '3000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('678', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('679', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('680', '0', '3000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('681', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('682', '0', '53000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('683', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('684', '0', '8000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('685', '0', '3000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('686', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('687', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('688', '0', '3000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('689', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('690', '0', '55000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('691', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('692', '0', '14000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('693', '0', '4500', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('694', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('695', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('696', '0', '3500', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('697', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('698', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('699', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('700', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('701', '0', '55000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('702', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('703', '0', '14000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('704', '0', '4500', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('705', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('706', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('707', '0', '3500', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('708', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('709', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('710', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('711', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('712', '0', '55000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('713', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('714', '0', '14000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('715', '0', '4500', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('716', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('717', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('718', '0', '3500', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('719', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('720', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('721', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('722', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('723', '0', '55000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('724', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('725', '0', '14000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('726', '0', '4500', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('727', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('728', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('729', '0', '3500', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('730', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('731', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('732', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('733', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('734', '0', '55000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('735', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('736', '0', '14000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('737', '0', '4500', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('738', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('739', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('740', '0', '3500', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('741', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('742', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('743', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('744', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('745', '0', '55000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('746', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('747', '0', '14000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('748', '0', '4500', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('749', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('750', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('751', '0', '3500', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('752', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('753', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('754', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('755', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('756', '0', '55000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('757', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('758', '0', '14000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('759', '0', '4500', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('760', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('761', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('762', '0', '3500', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('763', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('764', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('765', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('766', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('767', '0', '55000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('768', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('769', '0', '14000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('770', '0', '4500', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('771', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('772', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('773', '0', '3500', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('774', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('775', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('776', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('777', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('778', '0', '57000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('779', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('780', '0', '15000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('781', '0', '5000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('782', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('783', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('784', '0', '3500', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('785', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('786', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('787', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('788', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('789', '0', '57000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('790', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('791', '0', '15000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('792', '0', '5000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('793', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('794', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('795', '0', '3500', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('796', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('797', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('798', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('799', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('800', '0', '57000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('801', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('802', '0', '15000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('803', '0', '5000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('804', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('805', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('806', '0', '3500', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('807', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('808', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('809', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('810', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('811', '0', '57000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('812', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('813', '0', '15000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('814', '0', '5000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('815', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('816', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('817', '0', '3500', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('818', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('819', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('820', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('821', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('822', '0', '57000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('823', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('824', '0', '15000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('825', '0', '5000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('826', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('827', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('828', '0', '3500', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('829', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('830', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('831', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('832', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('833', '0', '57000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('834', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('835', '0', '15000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('836', '0', '5000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('837', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('838', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('839', '0', '3500', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('840', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('841', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('842', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('843', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('844', '0', '60000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('845', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('846', '0', '19000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('847', '0', '5500', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('848', '0', '1500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('849', '0', '700', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('850', '0', '2500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('851', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('852', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('853', '0', '5000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('854', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('855', '0', '2500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('856', '0', '60000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('857', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('858', '0', '19000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('859', '0', '5500', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('860', '0', '1500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('861', '0', '700', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('862', '0', '2500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('863', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('864', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('865', '0', '5000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('866', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('867', '0', '2500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('868', '0', '60000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('869', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('870', '0', '19000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('871', '0', '5500', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('872', '0', '1500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('873', '0', '700', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('874', '0', '2500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('875', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('876', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('877', '0', '5000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('878', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('879', '0', '2500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('880', '0', '60000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('881', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('882', '0', '19000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('883', '0', '5500', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('884', '0', '1500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('885', '0', '700', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('886', '0', '2500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('887', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('888', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('889', '0', '5000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('890', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('891', '0', '2500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('892', '0', '60000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('893', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('894', '0', '19000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('895', '0', '5500', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('896', '0', '1500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('897', '0', '700', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('898', '0', '2500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('899', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('900', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('901', '0', '5000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('902', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('903', '0', '2500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('904', '0', '60000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('905', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('906', '0', '19000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('907', '0', '5500', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('908', '0', '1500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('909', '0', '700', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('910', '0', '2500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('911', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('912', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('913', '0', '5000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('914', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('915', '0', '2500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('916', '0', '60000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('917', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('918', '0', '19000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('919', '0', '5500', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('920', '0', '1500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('921', '0', '700', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('922', '0', '2500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('923', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('924', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('925', '0', '5000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('926', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('927', '0', '2500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('928', '0', '60000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('929', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('930', '0', '19000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('931', '0', '5500', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('932', '0', '1500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('933', '0', '700', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('934', '0', '2500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('935', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('936', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('937', '0', '5000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('938', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('939', '0', '2500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('940', '0', '75000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('941', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('942', '0', '25000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('943', '0', '6500', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('944', '0', '1500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('945', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('946', '0', '3000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('947', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('948', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('949', '0', '5000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('950', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('951', '0', '5000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('952', '0', '75000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('953', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('954', '0', '25000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('955', '0', '6500', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('956', '0', '1500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('957', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('958', '0', '3000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('959', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('960', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('961', '0', '5000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('962', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('963', '0', '5000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('964', '0', '75000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('965', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('966', '0', '25000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('967', '0', '6500', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('968', '0', '1500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('969', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('970', '0', '3000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('971', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('972', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('973', '0', '5000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('974', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('975', '0', '5000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('976', '0', '75000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('977', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('978', '0', '23000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('979', '0', '6500', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('980', '0', '1500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('981', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('982', '0', '3000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('983', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('984', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('985', '0', '5000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('986', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('987', '0', '5000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('988', '0', '75000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('989', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('990', '0', '23000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('991', '0', '6500', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('992', '0', '1500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('993', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('994', '0', '3000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('995', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('996', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('997', '0', '5000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('998', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('999', '0', '5000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1000', '0', '75000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1001', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1002', '0', '23000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1003', '0', '6500', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1004', '0', '1500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1005', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1006', '0', '3000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1007', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1008', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1009', '0', '5000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1010', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1011', '0', '5000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1012', '0', '75000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1013', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1014', '0', '23000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1015', '0', '6500', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1016', '0', '1500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1017', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1018', '0', '3000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1019', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1020', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1021', '0', '5000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1022', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1023', '0', '5000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1024', '0', '45000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1025', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1026', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1027', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1028', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1029', '0', '53000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1030', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1031', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1032', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1033', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1034', '0', '53000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1035', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1036', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1037', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1038', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1039', '0', '53000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1040', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1041', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1042', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1043', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1044', '0', '53000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1045', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1046', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1047', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1048', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1049', '0', '53000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1050', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1051', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1052', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1053', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1054', '0', '53000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1055', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1056', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1057', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1058', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1059', '0', '53000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1060', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1061', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1062', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1063', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1064', '0', '53000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1065', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1066', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1067', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1068', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1069', '0', '53000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1070', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1071', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1072', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1073', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1074', '0', '55000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1075', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1076', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1077', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1078', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1079', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1080', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1081', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1082', '0', '8000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1083', '0', '55000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1084', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1085', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1086', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1087', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1088', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1089', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1090', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1091', '0', '8000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1092', '0', '55000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1093', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1094', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1095', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1096', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1097', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1098', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1099', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1100', '0', '8000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1101', '0', '55000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1102', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1103', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1104', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1105', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1106', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1107', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1108', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1109', '0', '8000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1110', '0', '55000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1111', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1112', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1113', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1114', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1115', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1116', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1117', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1118', '0', '8000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1119', '0', '55000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1120', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1121', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1122', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1123', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1124', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1125', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1126', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1127', '0', '8000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1128', '0', '55000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1129', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1130', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1131', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1132', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1133', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1134', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1135', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1136', '0', '8000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1137', '0', '55000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1138', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1139', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1140', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1141', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1142', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1143', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1144', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1145', '0', '8000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1146', '0', '57000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1147', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1148', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1149', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1150', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1151', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1152', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1153', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1154', '0', '8000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1155', '0', '57000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1156', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1157', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1158', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1159', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1160', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1161', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1162', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1163', '0', '8000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1164', '0', '57000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1165', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1166', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1167', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1168', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1169', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1170', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1171', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1172', '0', '8000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1173', '0', '57000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1174', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1175', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1176', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1177', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1178', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1179', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1180', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1181', '0', '8000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1182', '0', '57000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1183', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1184', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1185', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1186', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1187', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1188', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1189', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1190', '0', '8000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1191', '0', '57000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1192', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1193', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1194', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1195', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1196', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1197', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1198', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1199', '0', '8000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1200', '0', '60000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1201', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1202', '0', '1500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1203', '0', '700', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1204', '0', '2500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1205', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1206', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1207', '0', '8000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1208', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1209', '0', '2500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1210', '0', '60000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1211', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1212', '0', '1500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1213', '0', '700', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1214', '0', '2500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1215', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1216', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1217', '0', '8000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1218', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1219', '0', '2500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1220', '0', '60000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1221', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1222', '0', '1500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1223', '0', '700', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1224', '0', '2500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1225', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1226', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1227', '0', '8000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1228', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1229', '0', '2500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1230', '0', '60000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1231', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1232', '0', '1500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1233', '0', '700', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1234', '0', '2500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1235', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1236', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1237', '0', '8000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1238', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1239', '0', '2500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1240', '0', '60000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1241', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1242', '0', '1500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1243', '0', '700', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1244', '0', '2500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1245', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1246', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1247', '0', '8000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1248', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1249', '0', '2500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1250', '0', '60000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1251', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1252', '0', '1500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1253', '0', '700', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1254', '0', '2500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1255', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1256', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1257', '0', '8000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1258', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1259', '0', '2500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1260', '0', '60000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1261', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1262', '0', '1500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1263', '0', '700', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1264', '0', '2500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1265', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1266', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1267', '0', '8000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1268', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1269', '0', '2500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1270', '0', '5000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1271', '0', '60000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1272', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1273', '0', '1500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1274', '0', '700', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1275', '0', '2500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1276', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1277', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1278', '0', '8000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1279', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1280', '0', '2500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1281', '0', '5000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1282', '0', '75000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1283', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1284', '0', '1500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1285', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1286', '0', '3000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1287', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1288', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1289', '0', '8000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1290', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1291', '0', '5000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1292', '0', '75000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1293', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1294', '0', '1500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1295', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1296', '0', '3000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1297', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1298', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1299', '0', '8000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1300', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1301', '0', '5000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1302', '0', '75000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1303', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1304', '0', '1500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1305', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1306', '0', '3000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1307', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1308', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1309', '0', '8000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1310', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1311', '0', '5000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1312', '0', '75000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1313', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1314', '0', '1500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1315', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1316', '0', '3000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1317', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1318', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1319', '0', '8000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1320', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1321', '0', '5000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1322', '0', '75000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1323', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1324', '0', '1500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1325', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1326', '0', '3000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1327', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1328', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1329', '0', '8000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1330', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1331', '0', '5000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1332', '0', '75000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1333', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1334', '0', '1500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1335', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1336', '0', '3000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1337', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1338', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1339', '0', '8000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1340', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1341', '0', '5000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1342', '0', '10000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1343', '0', '75000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1344', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1345', '0', '1500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1346', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1347', '0', '3000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1348', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1349', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1350', '0', '8000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1351', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1352', '0', '5000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1353', '0', '10000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1354', '0', '45000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1355', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1356', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1357', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1358', '0', '1000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1359', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1360', '0', '53000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1361', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1362', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1363', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1364', '0', '1000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1365', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1366', '0', '53000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1367', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1368', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1369', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1370', '0', '1000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1371', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1372', '0', '53000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1373', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1374', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1375', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1376', '0', '1000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1377', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1378', '0', '53000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1379', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1380', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1381', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1382', '0', '1000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1383', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1384', '0', '53000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1385', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1386', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1387', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1388', '0', '1000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1389', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1390', '0', '53000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1391', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1392', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1393', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1394', '0', '1000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1395', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1396', '0', '53000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1397', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1398', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1399', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1400', '0', '1000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1401', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1402', '0', '53000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1403', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1404', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1405', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1406', '0', '1000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1407', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1408', '0', '53000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1409', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1410', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1411', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1412', '0', '1000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1413', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1414', '0', '55000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1415', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1416', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1417', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1418', '0', '2000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1419', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1420', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1421', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1422', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1423', '0', '55000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1424', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1425', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1426', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1427', '0', '2000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1428', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1429', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1430', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1431', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1432', '0', '55000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1433', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1434', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1435', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1436', '0', '2000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1437', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1438', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1439', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1440', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1441', '0', '55000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1442', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1443', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1444', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1445', '0', '2000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1446', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1447', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1448', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1449', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1450', '0', '55000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1451', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1452', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1453', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1454', '0', '2000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1455', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1456', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1457', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1458', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1459', '0', '55000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1460', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1461', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1462', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1463', '0', '2000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1464', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1465', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1466', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1467', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1468', '0', '55000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1469', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1470', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1471', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1472', '0', '2000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1473', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1474', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1475', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1476', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1477', '0', '55000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1478', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1479', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1480', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1481', '0', '2000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1482', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1483', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1484', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1485', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1486', '0', '57000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1487', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1488', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1489', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1490', '0', '2000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1491', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1492', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1493', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1494', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1495', '0', '57000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1496', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1497', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1498', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1499', '0', '2000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1500', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1501', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1502', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1503', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1504', '0', '57000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1505', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1506', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1507', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1508', '0', '2000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1509', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1510', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1511', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1512', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1513', '0', '57000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1514', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1515', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1516', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1517', '0', '2000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1518', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1519', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1520', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1521', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1522', '0', '57000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1523', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1524', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1525', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1526', '0', '2000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1527', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1528', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1529', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1530', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1531', '0', '57000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1532', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1533', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1534', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1535', '0', '2000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1536', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1537', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1538', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1539', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1540', '0', '60000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1541', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1542', '0', '1500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1543', '0', '700', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1544', '0', '2500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1545', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1546', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1547', '0', '2000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1548', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1549', '0', '2500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1550', '0', '60000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1551', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1552', '0', '1500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1553', '0', '700', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1554', '0', '2500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1555', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1556', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1557', '0', '2000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1558', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1559', '0', '2500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1560', '0', '60000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1561', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1562', '0', '1500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1563', '0', '700', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1564', '0', '2500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1565', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1566', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1567', '0', '2000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1568', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1569', '0', '2500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1570', '0', '60000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1571', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1572', '0', '1500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1573', '0', '700', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1574', '0', '2500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1575', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1576', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1577', '0', '2000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1578', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1579', '0', '2500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1580', '0', '60000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1581', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1582', '0', '1500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1583', '0', '700', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1584', '0', '2500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1585', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1586', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1587', '0', '2000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1588', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1589', '0', '2500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1590', '0', '60000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1591', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1592', '0', '1500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1593', '0', '700', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1594', '0', '2500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1595', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1596', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1597', '0', '2000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1598', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1599', '0', '2500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1600', '0', '60000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1601', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1602', '0', '1500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1603', '0', '700', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1604', '0', '2500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1605', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1606', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1607', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1608', '0', '2500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1609', '0', '8000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1610', '0', '60000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1611', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1612', '0', '1500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1613', '0', '700', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1614', '0', '2500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1615', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1616', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1617', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1618', '0', '2500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1619', '0', '8000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1620', '0', '75000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1621', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1622', '0', '1500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1623', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1624', '0', '3000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1625', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1626', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1627', '0', '2000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1628', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1629', '0', '5000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1630', '0', '75000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1631', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1632', '0', '1500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1633', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1634', '0', '3000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1635', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1636', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1637', '0', '2000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1638', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1639', '0', '5000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1640', '0', '75000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1641', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1642', '0', '1500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1643', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1644', '0', '3000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1645', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1646', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1647', '0', '2000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1648', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1649', '0', '5000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1650', '0', '75000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1651', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1652', '0', '1500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1653', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1654', '0', '3000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1655', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1656', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1657', '0', '2000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1658', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1659', '0', '5000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1660', '0', '75000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1661', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1662', '0', '1500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1663', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1664', '0', '3000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1665', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1666', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1667', '0', '2000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1668', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1669', '0', '5000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1670', '0', '75000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1671', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1672', '0', '1500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1673', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1674', '0', '3000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1675', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1676', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1677', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1678', '0', '5000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1679', '0', '8000', '0', '0', '2', '2');
INSERT INTO `schedule_of_fees` VALUES ('1680', '0', '75000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1681', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1682', '0', '1500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1683', '0', '1000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1684', '0', '3000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1685', '0', '8000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1686', '0', '2000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1687', '0', '500', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1688', '0', '5000', '0', '0', '1', '2');
INSERT INTO `schedule_of_fees` VALUES ('1689', '0', '8000', '0', '0', '2', '2');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of schools_attended
-- ----------------------------
INSERT INTO `schools_attended` VALUES ('1', 'Federal Govt. College, Maiduguri', '25', '31', '2001', '2005', '5');
INSERT INTO `schools_attended` VALUES ('2', 'Roberto Nursery/primary School Wuse 2 Abuja', '1', '31', '2005', '2009', '6');
INSERT INTO `schools_attended` VALUES ('3', 'Kings Private School', '5', '29', '2005', '2007', '7');
INSERT INTO `schools_attended` VALUES ('4', 'Federal Govt. College, Maiduguri', '2', '24', '2001', '2005', '8');
INSERT INTO `schools_attended` VALUES ('5', 'Kings Private School', '2', '5', '2001', '2005', '9');

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
INSERT INTO `sessions` VALUES ('xymOvdHFqUviaf4XbNrXYV0ER9SMAIEXJJnP4br3', '1370787311', 'a:9:{s:10:\"csrf_token\";s:40:\"jZmAxopDRWCSsAKNVo7hhBmkYWOr4hdSOEngDCGB\";s:5:\":new:\";a:0:{}s:5:\":old:\";a:0:{}s:35:\"laravel_auth_drivers_eloquent_login\";i:1;s:7:\"user_id\";i:1;s:5:\"email\";s:16:\"admin@ais.sch.ng\";s:9:\"firstname\";s:3:\"AIS\";s:7:\"surname\";s:13:\"Administrator\";s:7:\"role_id\";i:5;}');

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
INSERT INTO `teachers_and_classes` VALUES ('3', '33');
INSERT INTO `teachers_and_classes` VALUES ('4', '36');

-- ----------------------------
-- Table structure for teachers_and_subjects
-- ----------------------------
DROP TABLE IF EXISTS `teachers_and_subjects`;
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

-- ----------------------------
-- Records of teachers_and_subjects
-- ----------------------------
INSERT INTO `teachers_and_subjects` VALUES ('3', '1', '33', '1');
INSERT INTO `teachers_and_subjects` VALUES ('4', '2', '33', '1');
INSERT INTO `teachers_and_subjects` VALUES ('4', '3', '33', '1');
INSERT INTO `teachers_and_subjects` VALUES ('3', '4', '33', '1');
INSERT INTO `teachers_and_subjects` VALUES ('3', '5', '33', '1');

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
  CONSTRAINT `fk_users_roles` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'AIS', 'Administrator', 'admin@ais.sch.ng', '$2a$08$gvoTOqCQAq.BXmYDILZMDeAliMtr8gRx7IJFW6vfnZ5uri6XrmSw6', '5');
INSERT INTO `users` VALUES ('2', 'Ais', 'Accountant', 'accountant@ais.sch.ng', '$2a$08$iO4suE.bWKqD8JfJCQqGuu6eZSo/g6BWMBgp7uSlwNsJWkw9d/lmS', '3');
INSERT INTO `users` VALUES ('3', 'Ais', 'Teacher One', 'teacher1@ais.sch.ng', '$2a$08$ALWZigL7oSYAXNNvxFv8r.1SrQq9r6FXfUyrWS/0doNNelKNff186', '2');
INSERT INTO `users` VALUES ('4', 'Ais', 'Teacher Two', 'teacher2@ais.sch.ng', '$2a$08$2CMGQzsGBwBw/IrMT9.L4OM3JSI0oyzInpcVYcMljt0f4aSK9NLPi', '2');
INSERT INTO `users` VALUES ('5', 'Jonathan', 'Doe', 'jonhdoe@demo.com', '$2a$08$2u3aDnUE1wYPvVIxLJQDGeL00RKkhgX/IPOuf3uYejn7AE3M/K3mC', '1');
INSERT INTO `users` VALUES ('6', 'Mfawa', 'Onen', 'muffycompoqm@gmail.com', '$2a$08$r9USeTqPLNz9olJRgQSiUOlcYQjhag6ACqOHJI4KTLpdXmCYc9wbO', '1');
INSERT INTO `users` VALUES ('7', 'Williams', 'Onen', 'kiwixcompome@googlemail.com', '$2a$08$tTQXk8jW8wv2e/DNBMpWK.pFIYsc0AV2ephC5skoQeb.4SIzfsLV2', '1');
INSERT INTO `users` VALUES ('8', 'Demo', 'Student', 'student@demo.com', '$2a$08$0JP0ovnHIgGI.92CksCptOHdxni2JR7j0/Wqnh2MhoJZNvk3CEXb6', '1');
INSERT INTO `users` VALUES ('9', 'Test', 'User', 'test@demo.com', '$2a$08$Smgz1qMSdmckeTh1eFhLTOpDotb.7Z9SsexptiXqQ7BwgltNjQ9p.', '1');
