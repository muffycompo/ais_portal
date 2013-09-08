/*
Navicat MySQL Data Transfer

Source Server         : LocalDevDB
Source Server Version : 50612
Source Host           : localhost:3306
Source Database       : ais_portal

Target Server Type    : MYSQL
Target Server Version : 50612
File Encoding         : 65001

Date: 2013-09-09 00:51:09
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
-- Table structure for assignments_and_notes
-- ----------------------------
DROP TABLE IF EXISTS `assignments_and_notes`;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of assignments_and_notes
-- ----------------------------
INSERT INTO `assignments_and_notes` VALUES ('2', 'Ss1A Maths Assignment', '2', '/uploads/assignments/ss1a_maths_assignment.pdf', '1', '33', '3', '2013-07-10 08:00:40');
INSERT INTO `assignments_and_notes` VALUES ('3', 'Ss2A English Assignment', '2', '/uploads/assignments/ss2a_english_assignment.pdf', '2', '36', '4', '2013-07-02 08:00:18');

-- ----------------------------
-- Table structure for assignment_submissions
-- ----------------------------
DROP TABLE IF EXISTS `assignment_submissions`;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of assignment_submissions
-- ----------------------------
INSERT INTO `assignment_submissions` VALUES ('3', '2', '6', '4', '2013-07-03 00:01:57', '/uploads/assignments/submissions/6/assignment_submission_1372806117_6_2.pdf');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of biodata
-- ----------------------------
INSERT INTO `biodata` VALUES ('1', null, '13', '2000-02-12', 'Babur', '17878547', '5', '1', '8', '118', '33', '31', '33', '4', '5_passport.jpg', '9', '1');
INSERT INTO `biodata` VALUES ('2', null, '14', '1999-02-12', 'Hausa', '19577138', '6', '1', '5', '118', '33', '31', '33', '4', '6_passport.jpg', '9', '2');
INSERT INTO `biodata` VALUES ('3', null, '53', '1960-01-01', 'Yakurr', '16953536', '7', '1', '9', '118', '33', '32', '33', '4', '7_passport.jpg', '9', '2');
INSERT INTO `biodata` VALUES ('4', null, '10', '2003-02-12', 'Hausa', '67242424', '8', '2', '17', '118', '33', '32', '33', '4', '8_passport.jpg', '9', '1');
INSERT INTO `biodata` VALUES ('5', 'Another', '13', '2000-02-12', 'Kanuri', '19437483', '9', '1', '8', '118', '8', '2', '8', '1', '9_passport.jpg', '9', '1');
INSERT INTO `biodata` VALUES ('6', 'USA', '15', '1998-02-12', 'Hause', '48091802', '10', '1', '15', '118', '36', '32', '34', '4', '10_passport.jpg', '9', '1');
INSERT INTO `biodata` VALUES ('7', 'Guru', '13', '1999-10-14', 'yakurr', '23937735', '12', '1', '9', '118', '1', '30', '31', '3', '12_passport.jpg', '7', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of class_attendance
-- ----------------------------
INSERT INTO `class_attendance` VALUES ('5', '2', '2013-07-03 15:54:34', 'AR/13/390478', '3', '1', '33', '1', '1', null);
INSERT INTO `class_attendance` VALUES ('6', '1', '2013-07-03 15:55:07', 'AR/13/109227', '3', '1', '33', '1', '1', null);
INSERT INTO `class_attendance` VALUES ('7', '1', '2013-07-03 15:55:20', 'AR/13/937228', '3', '1', '33', '1', '1', null);
INSERT INTO `class_attendance` VALUES ('8', '3', '2013-07-03 15:55:37', 'AR/13/136882', '3', '1', '33', '1', '1', 'Medical Checkup');
INSERT INTO `class_attendance` VALUES ('9', '1', '2013-07-03 15:56:24', 'AR/13/109227', '3', '1', '33', '1', '1', null);

-- ----------------------------
-- Table structure for deductions
-- ----------------------------
DROP TABLE IF EXISTS `deductions`;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of entrance_examination
-- ----------------------------
INSERT INTO `entrance_examination` VALUES ('1', '100', '45', '56', '78', '13', '54', '5');
INSERT INTO `entrance_examination` VALUES ('2', '87', '64', '83', '75', '34', '45', '6');
INSERT INTO `entrance_examination` VALUES ('3', '45', '78', '38', '69', '86', '87', '7');
INSERT INTO `entrance_examination` VALUES ('4', '87', '87', '68', '78', '60', '31', '8');
INSERT INTO `entrance_examination` VALUES ('5', '45', '64', '68', '78', '81', '31', '9');
INSERT INTO `entrance_examination` VALUES ('6', '56', '87', '65', '45', '67', '54', '10');

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of events
-- ----------------------------
INSERT INTO `events` VALUES ('10', 'Test Event 2', 'http://www.maomuffy.com', '2013-07-05 08:00:58', null, '1', '1', '36', '1');

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
  `incentive_type_id` int(11) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of medical_records
-- ----------------------------
INSERT INTO `medical_records` VALUES ('1', 'Medical Hospital', 'Some Hospital', 'Demo Doctor', '08030796088', '466343', 'O', 'AA', 'None', '', 'No', '', '5');
INSERT INTO `medical_records` VALUES ('2', 'Medical Hospital', 'Listings in Demo Area', 'Dr. Mustapha Umar', '08036879223', '18432', 'A', 'AS', 'Yes', 'Reacts To Excess Stress', 'No', '', '6');
INSERT INTO `medical_records` VALUES ('3', 'Medical Hospital', 'Another Hospital', 'Demo Doctor', '08036879223', '989321', 'O', 'AA', 'None', '', 'No', '', '7');
INSERT INTO `medical_records` VALUES ('4', 'Medical Hospital', 'Another Hospital', 'Demo Doctor', '08030796088', '786343', 'B', 'AA', 'None', '', 'No', '', '8');
INSERT INTO `medical_records` VALUES ('5', 'Medical Hospital', 'Hospital', 'Dr. Mustapha Usman', '08030796088', '7863432', 'A', 'AS', 'None', '', 'No', '', '9');
INSERT INTO `medical_records` VALUES ('6', 'Medical Hospital', 'Nevada', 'Dr. Who Bond', '08059443154', '12345', 'O+', 'AA', 'No', '', 'No', '', '10');
INSERT INTO `medical_records` VALUES ('7', 'Hthrojkjij', 'fbjkniril', 'Dr. Jones', '08058993334', '334556', 'O+', 'AA', 'Yes', 'Pesnut And Fava Beans', 'No', '', '12');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of official_use
-- ----------------------------
INSERT INTO `official_use` VALUES ('1', '5', '31', '1', '33', '2', 'AR/13/390478');
INSERT INTO `official_use` VALUES ('2', '6', '31', '1', '33', '1', 'AR/13/109227');
INSERT INTO `official_use` VALUES ('3', '7', '32', '1', '33', '1', 'AR/13/937228');
INSERT INTO `official_use` VALUES ('4', '8', '32', '1', '33', '1', 'AR/13/136882');
INSERT INTO `official_use` VALUES ('5', '9', '2', '1', '8', '1', 'AR/13/937283');
INSERT INTO `official_use` VALUES ('6', '10', '32', '1', '36', '1', 'AR/13/827358');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of parental_information
-- ----------------------------
INSERT INTO `parental_information` VALUES ('1', 'Demo Father', 'Civil Servant', '1', 'Somewhere in Nevada', '08002341234', 'Demo Mother', 'House Wife', '1', '08002341234', '5');
INSERT INTO `parental_information` VALUES ('2', 'Umar A. Muhammad', 'Civil Servant', '1', 'Somewhere', '08030796088', 'Demo Mother', 'House Wife', '1', '08030796088', '6');
INSERT INTO `parental_information` VALUES ('3', 'Dr. Sample Father', 'Civil Servant', '1', 'Another Address', '08030796088', 'Demo Mother', 'Lawyer', '1', '08030796088', '7');
INSERT INTO `parental_information` VALUES ('4', 'Demo Father', 'Civil Servant', '1', 'Another Residential Address', '08030796088', 'Amina Hassan', 'Banker', '1', '08030796088', '8');
INSERT INTO `parental_information` VALUES ('5', 'Umar A. Muhammad', 'Civil Servant', '1', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam,', '08030796088', 'Amina Hassan', 'House Wife', '1', '08030796088', '9');
INSERT INTO `parental_information` VALUES ('6', 'Dr. Hewlett Packard', 'Computer Developer', '1', 'Sillicon Valley', '(080) 5944 3154', 'Prof. Catherine Packard', 'C.E.O GitHub', '1', '(080) 5944 3154', '10');
INSERT INTO `parental_information` VALUES ('7', 'David Ahhh', 'suicide bomber', '1', 'no.23 bomb cresent, aljawabi close beside binladin\"s kitchen', '08030689003', 'Ahhh Jidda', 'Nany', '1', '08030689003', '12');

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
INSERT INTO `pins` VALUES ('6', '357420443205', '1', '1');
INSERT INTO `pins` VALUES ('7', '141120128813', '1', '1');
INSERT INTO `pins` VALUES ('8', '135610207019', '1', '1');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pin_payments
-- ----------------------------
INSERT INTO `pin_payments` VALUES ('1', 'Jonathan', 'Doe', '2500', 'AR-6831579', '2013-06-09', 'Ais Accountant', '1');
INSERT INTO `pin_payments` VALUES ('2', 'Mfawa', 'Onen', '2500', 'AR-5052592', '2013-06-09', 'Ais Accountant', '2');
INSERT INTO `pin_payments` VALUES ('3', 'Williams', 'Onen', '2500', 'AR-5705575', '2013-06-09', 'Ais Accountant', '3');
INSERT INTO `pin_payments` VALUES ('4', 'Demo', 'Student', '2500', 'AR-6848013', '2013-06-09', 'Ais Accountant', '4');
INSERT INTO `pin_payments` VALUES ('5', 'Test', 'Applicant', '2500', 'AR-7646302', '2013-06-09', 'AIS Administrator', '5');
INSERT INTO `pin_payments` VALUES ('6', 'Michael', 'Dell', '2500', 'AR-3925691', '2013-06-14', 'AIS Administrator', '6');
INSERT INTO `pin_payments` VALUES ('7', 'Eno', 'Onen', '2500', '18257927', '2013-07-20', 'Ais Accountant', '7');
INSERT INTO `pin_payments` VALUES ('8', 'Eno', 'David', '2500', '20935350', '2013-07-20', 'Ais Accountant', '8');

-- ----------------------------
-- Table structure for questions_bank
-- ----------------------------
DROP TABLE IF EXISTS `questions_bank`;
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

-- ----------------------------
-- Records of questions_bank
-- ----------------------------
INSERT INTO `questions_bank` VALUES ('3', '3', '33', '1', 'Ss1 A Maths Exam First Term', '/uploads/questions_bank/ss1_a_maths_exam_first_term.doc');
INSERT INTO `questions_bank` VALUES ('4', '4', '36', '2', 'Ss2 A English Exam First Term', '/uploads/questions_bank/ss2_a_english_exam_first_term.pdf');

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
-- Table structure for salaries
-- ----------------------------
DROP TABLE IF EXISTS `salaries`;
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
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`class_from_id`,`class_to_id`,`user_id`),
  KEY `fk_schools_attended_classes1_idx` (`class_from_id`),
  KEY `fk_schools_attended_classes2_idx` (`class_to_id`),
  KEY `fk_schools_attended_users1_idx` (`user_id`),
  CONSTRAINT `fk_schools_attended_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of schools_attended
-- ----------------------------
INSERT INTO `schools_attended` VALUES ('1', 'Federal Govt. College, Maiduguri', '25', '31', '2001', '2005', '5');
INSERT INTO `schools_attended` VALUES ('2', 'Roberto Nursery/primary School Wuse 2 Abuja', '1', '31', '2005', '2009', '6');
INSERT INTO `schools_attended` VALUES ('3', 'Kings Private School', '5', '29', '2005', '2007', '7');
INSERT INTO `schools_attended` VALUES ('4', 'Federal Govt. College, Maiduguri', '2', '24', '2001', '2005', '8');
INSERT INTO `schools_attended` VALUES ('5', 'Kings Private School', '2', '5', '2001', '2005', '9');
INSERT INTO `schools_attended` VALUES ('6', 'Fgc Maiduguri', '29', '32', '2004', '2005', '10');
INSERT INTO `schools_attended` VALUES ('7', 'Kps', '1', '24', '2006', '2013', '12');

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
INSERT INTO `sessions` VALUES ('Y82LhHsQydrxvBBrfLPrH7ibGieD9phiTKm0DgWy', '1378684097', 'a:9:{s:10:\"csrf_token\";s:40:\"A08UtYRBRkoJnJUuVoffOXLwIZFrbK4OLQE567bI\";s:5:\":new:\";a:0:{}s:5:\":old:\";a:0:{}s:35:\"laravel_auth_drivers_eloquent_login\";i:1;s:7:\"user_id\";i:1;s:5:\"email\";s:16:\"admin@ais.sch.ng\";s:9:\"firstname\";s:3:\"AIS\";s:7:\"surname\";s:13:\"Administrator\";s:7:\"role_id\";i:5;}');

-- ----------------------------
-- Table structure for staff_attendance
-- ----------------------------
DROP TABLE IF EXISTS `staff_attendance`;
CREATE TABLE `staff_attendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attendance_date` datetime DEFAULT NULL,
  `staff_id` int(11) NOT NULL,
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

-- ----------------------------
-- Records of staff_records
-- ----------------------------
INSERT INTO `staff_records` VALUES ('1', 'AIS/1234', 'Mfawa Alfred Onen', 'Somewhere in Nevada', '(080) 5944 3154', 'muffycompoqm@gmail.com', 'B.sc Geography', '2013-09-06', '', '2', '2013-09-06', '1378504763_passport.jpg', '1', '9', '118', '1', '0026511233', '5');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'AIS', 'Administrator', 'admin@ais.sch.ng', '$2a$08$gvoTOqCQAq.BXmYDILZMDeAliMtr8gRx7IJFW6vfnZ5uri6XrmSw6', '5');
INSERT INTO `users` VALUES ('2', 'Ais', 'Accountant', 'accountant@ais.sch.ng', '$2a$08$iO4suE.bWKqD8JfJCQqGuu6eZSo/g6BWMBgp7uSlwNsJWkw9d/lmS', '3');
INSERT INTO `users` VALUES ('3', 'Ais', 'Teacher One', 'teacher1@ais.sch.ng', '$2a$08$ALWZigL7oSYAXNNvxFv8r.1SrQq9r6FXfUyrWS/0doNNelKNff186', '2');
INSERT INTO `users` VALUES ('4', 'Ais', 'Teacher Two', 'teacher2@ais.sch.ng', '$2a$08$2CMGQzsGBwBw/IrMT9.L4OM3JSI0oyzInpcVYcMljt0f4aSK9NLPi', '2');
INSERT INTO `users` VALUES ('5', 'Jonathan', 'Doe', 'jonhdoe@demo.com', '$2a$08$2u3aDnUE1wYPvVIxLJQDGeL00RKkhgX/IPOuf3uYejn7AE3M/K3mC', '1');
INSERT INTO `users` VALUES ('6', 'Mfawa', 'Onen', 'muffycompoqm@gmail.com', '$2a$08$2RDvLgpkpw0PIK5NwCuBZOvnFdgPd672n1HAzIOPDb45hsZRYvhzO', '1');
INSERT INTO `users` VALUES ('7', 'Williams', 'Onen', 'kiwixcompome@googlemail.com', '$2a$08$tTQXk8jW8wv2e/DNBMpWK.pFIYsc0AV2ephC5skoQeb.4SIzfsLV2', '1');
INSERT INTO `users` VALUES ('8', 'Demo', 'Student', 'student@demo.com', '$2a$08$0JP0ovnHIgGI.92CksCptOHdxni2JR7j0/Wqnh2MhoJZNvk3CEXb6', '1');
INSERT INTO `users` VALUES ('9', 'Test', 'User', 'test@demo.com', '$2a$08$Smgz1qMSdmckeTh1eFhLTOpDotb.7Z9SsexptiXqQ7BwgltNjQ9p.', '1');
INSERT INTO `users` VALUES ('10', 'Michael', 'Dell', 'systemadmin@binghamuni.edu.ng', '$2a$08$0PscoE/i3PUl/TrhdjWpfu5dSqYyAhQIySzfaSZ9t3A9.oMMZ5yei', '1');
INSERT INTO `users` VALUES ('11', 'Eno', 'Onen', 'denguru4@gmail.com', '$2a$08$wFQRs.DtwTNNEb2BjyIaaOxDdgTj4/neXrjlOCnWlN0ZbG5VM5H9C', '1');
INSERT INTO `users` VALUES ('12', 'Eno', 'David', 'denguru@gmail.com', '$2a$08$ajtSm0v9CRTriub8Pr0dQ.kUZrC8SgqMFuSLOSNGLtjH9.9Fz64oW', '1');

-- ----------------------------
-- Event structure for ais_event_cleaner
-- ----------------------------
DROP EVENT IF EXISTS `ais_event_cleaner`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` EVENT `ais_event_cleaner` ON SCHEDULE EVERY 3 HOUR STARTS '2013-06-24 01:01:52' ON COMPLETION NOT PRESERVE ENABLE COMMENT 'Deletes Passed AIS Calendar Events' DO DELETE FROM events WHERE CURDATE() > DATE(end_date) OR (CURDATE() > DATE(start_date) AND all_day = 1)
;;
DELIMITER ;
