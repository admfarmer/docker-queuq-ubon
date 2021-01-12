/*
 Navicat Premium Data Transfer

 Source Server         : Server-Hi34-Out
 Source Server Type    : MySQL
 Source Server Version : 100320
 Source Host           : 203.113.117.66:3388
 Source Schema         : queue

 Target Server Type    : MySQL
 Target Server Version : 100320
 File Encoding         : 65001

 Date: 12/01/2021 10:39:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for q4u_departments
-- ----------------------------
DROP TABLE IF EXISTS `q4u_departments`;
CREATE TABLE `q4u_departments` (
  `department_id` int(6) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`department_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of q4u_departments
-- ----------------------------
BEGIN;
INSERT INTO `q4u_departments` VALUES (1, 'ศัลยกรรม');
INSERT INTO `q4u_departments` VALUES (2, 'สูติกรรม นรีเวช');
INSERT INTO `q4u_departments` VALUES (3, 'ทันตกรรม');
INSERT INTO `q4u_departments` VALUES (4, 'กายภาพบำบัด');
INSERT INTO `q4u_departments` VALUES (5, 'แพทย์แผนไทย');
INSERT INTO `q4u_departments` VALUES (6, 'คลินิคโรคเรื้อรัง');
INSERT INTO `q4u_departments` VALUES (7, 'เวชกรรมชุมชน');
INSERT INTO `q4u_departments` VALUES (8, 'ตรวจโรคทั่วไป');
INSERT INTO `q4u_departments` VALUES (9, 'เภสัชกรรม');
INSERT INTO `q4u_departments` VALUES (10, 'รังสีการแพทย์');
INSERT INTO `q4u_departments` VALUES (11, 'เทคนิคการแพทย์');
INSERT INTO `q4u_departments` VALUES (12, 'คลอด-ห้องผ่าตัด');
INSERT INTO `q4u_departments` VALUES (13, 'อุบัติเหตุ-ฉุกเฉิน');
COMMIT;

-- ----------------------------
-- Table structure for q4u_person
-- ----------------------------
DROP TABLE IF EXISTS `q4u_person`;
CREATE TABLE `q4u_person` (
  `hn` varchar(15) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `sex` char(1) DEFAULT NULL,
  PRIMARY KEY (`hn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of q4u_person
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for q4u_priorities
-- ----------------------------
DROP TABLE IF EXISTS `q4u_priorities`;
CREATE TABLE `q4u_priorities` (
  `priority_id` int(3) NOT NULL AUTO_INCREMENT,
  `priority_name` varchar(50) DEFAULT NULL,
  `priority_prefix` char(1) DEFAULT NULL,
  `priority_color` varchar(100) DEFAULT NULL,
  `priority_order` int(11) DEFAULT 1,
  PRIMARY KEY (`priority_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of q4u_priorities
-- ----------------------------
BEGIN;
INSERT INTO `q4u_priorities` VALUES (1, 'ปกติ', '1', '', 1);
INSERT INTO `q4u_priorities` VALUES (2, 'URGENT', '2', NULL, 1);
INSERT INTO `q4u_priorities` VALUES (3, 'EMERGENCY', '3', NULL, 1);
INSERT INTO `q4u_priorities` VALUES (4, 'VIP', '4', NULL, 1);
INSERT INTO `q4u_priorities` VALUES (5, '70 ปีขึ้นไป', '5', NULL, 1);
INSERT INTO `q4u_priorities` VALUES (6, 'ผู้นำศาสนา พระ', '6', NULL, 1);
INSERT INTO `q4u_priorities` VALUES (7, 'รถนั่ง-รถนอน', '7', NULL, 1);
INSERT INTO `q4u_priorities` VALUES (8, 'เจ้าหน้าที่', '8', NULL, 1);
COMMIT;

-- ----------------------------
-- Table structure for q4u_provider_types
-- ----------------------------
DROP TABLE IF EXISTS `q4u_provider_types`;
CREATE TABLE `q4u_provider_types` (
  `provider_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `provider_type_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT 'รหัสประเภทผู้ให้บริการ',
  PRIMARY KEY (`provider_type_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of q4u_provider_types
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for q4u_queue
-- ----------------------------
DROP TABLE IF EXISTS `q4u_queue`;
CREATE TABLE `q4u_queue` (
  `queue_id` int(12) NOT NULL AUTO_INCREMENT,
  `hn` varchar(15) DEFAULT NULL,
  `vn` varchar(16) NOT NULL,
  `service_point_id` int(3) NOT NULL,
  `priority_id` int(3) DEFAULT NULL,
  `room_id` int(2) DEFAULT NULL COMMENT 'ช่องบริการ',
  `date_serv` date NOT NULL COMMENT 'วันที่รับบริการ',
  `time_serv` time DEFAULT NULL,
  `queue_number` varchar(10) DEFAULT NULL COMMENT 'หมายเลขQ',
  `his_queue` varchar(6) DEFAULT NULL COMMENT 'หมายเลขQ(Hosxp)',
  `queue_status_id` int(1) DEFAULT NULL COMMENT 'สถานะQ',
  `mark_pending` enum('N','Y') DEFAULT 'N' COMMENT 'N=Not pending Y=pending',
  `remark` text DEFAULT NULL COMMENT 'หมายเหตุรับบริการ',
  `date_create` datetime NOT NULL COMMENT 'เวลาสร้างQ',
  `date_update` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'เวลาปรับปรุ่งQ',
  `pending_to_service_point_id` int(3) DEFAULT NULL,
  `is_interview` char(1) DEFAULT 'N',
  `is_completed` char(1) DEFAULT 'N',
  `queue_running` int(6) DEFAULT NULL,
  `queue_interview` int(11) DEFAULT NULL,
  `is_cancel` enum('Y','N') DEFAULT 'N',
  PRIMARY KEY (`queue_id`) USING BTREE,
  UNIQUE KEY `q4u_queue_un` (`queue_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=139498 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of q4u_queue
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for q4u_queue_detail
-- ----------------------------
DROP TABLE IF EXISTS `q4u_queue_detail`;
CREATE TABLE `q4u_queue_detail` (
  `service_point_id` int(3) NOT NULL,
  `date_serv` date NOT NULL,
  `last_queue` int(11) DEFAULT NULL,
  `room_id` int(3) NOT NULL,
  `queue_id` int(11) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`service_point_id`,`date_serv`,`room_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of q4u_queue_detail
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for q4u_queue_group_detail
-- ----------------------------
DROP TABLE IF EXISTS `q4u_queue_group_detail`;
CREATE TABLE `q4u_queue_group_detail` (
  `service_point_id` int(3) NOT NULL,
  `date_serv` date NOT NULL,
  `last_queue` int(11) DEFAULT NULL,
  `room_id` int(3) NOT NULL,
  `queue_id` int(11) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `queue_running` int(6) NOT NULL,
  PRIMARY KEY (`service_point_id`,`date_serv`,`room_id`,`queue_running`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of q4u_queue_group_detail
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for q4u_queue_number
-- ----------------------------
DROP TABLE IF EXISTS `q4u_queue_number`;
CREATE TABLE `q4u_queue_number` (
  `service_point_id` int(3) NOT NULL,
  `date_serv` date NOT NULL,
  `current_queue` int(11) DEFAULT 0,
  `update_date` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `priority_id` int(3) DEFAULT NULL,
  PRIMARY KEY (`service_point_id`,`date_serv`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of q4u_queue_number
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for q4u_queue_status
-- ----------------------------
DROP TABLE IF EXISTS `q4u_queue_status`;
CREATE TABLE `q4u_queue_status` (
  `queue_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `queue_status_name` varchar(20) DEFAULT NULL,
  `queue_status_desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`queue_status_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of q4u_queue_status
-- ----------------------------
BEGIN;
INSERT INTO `q4u_queue_status` VALUES (1, 'waiting', 'รอตรวจ');
INSERT INTO `q4u_queue_status` VALUES (2, 'cancel', 'ยกเลิการให้บริการ');
INSERT INTO `q4u_queue_status` VALUES (3, 'skip', 'ข้าม(เรียกแล้วไม่มา)');
INSERT INTO `q4u_queue_status` VALUES (4, 'transfer', 'ส่งตรวจต่อ');
INSERT INTO `q4u_queue_status` VALUES (5, 'consult', 'รอกลับมาตรวจให้(เช่นส่ง lab)');
INSERT INTO `q4u_queue_status` VALUES (9, 'serviced', 'ให้บริการเรียบร้อย');
COMMIT;

-- ----------------------------
-- Table structure for q4u_service_point_prefix
-- ----------------------------
DROP TABLE IF EXISTS `q4u_service_point_prefix`;
CREATE TABLE `q4u_service_point_prefix` (
  `service_point_id` int(3) NOT NULL COMMENT 'รหัสจุดบริการ',
  `prefix` char(1) NOT NULL COMMENT 'อักษรย่อ(แต่ละแผนก)',
  `service_point_status_id` int(3) DEFAULT 1 COMMENT '0=ไม่ใช้งาน 1=ใช้าน ',
  PRIMARY KEY (`service_point_id`,`prefix`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of q4u_service_point_prefix
-- ----------------------------
BEGIN;
INSERT INTO `q4u_service_point_prefix` VALUES (1, 'A', 1);
INSERT INTO `q4u_service_point_prefix` VALUES (2, 'B', 1);
INSERT INTO `q4u_service_point_prefix` VALUES (3, 'C', 1);
INSERT INTO `q4u_service_point_prefix` VALUES (4, 'D', 1);
COMMIT;

-- ----------------------------
-- Table structure for q4u_service_point_status
-- ----------------------------
DROP TABLE IF EXISTS `q4u_service_point_status`;
CREATE TABLE `q4u_service_point_status` (
  `service_point_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `service_point_status_name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`service_point_status_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of q4u_service_point_status
-- ----------------------------
BEGIN;
INSERT INTO `q4u_service_point_status` VALUES (1, 'active');
INSERT INTO `q4u_service_point_status` VALUES (2, 'pending');
COMMIT;

-- ----------------------------
-- Table structure for q4u_service_point_type
-- ----------------------------
DROP TABLE IF EXISTS `q4u_service_point_type`;
CREATE TABLE `q4u_service_point_type` (
  `service_point_type_id` int(3) NOT NULL,
  `service_point_type_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`service_point_type_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of q4u_service_point_type
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for q4u_service_points
-- ----------------------------
DROP TABLE IF EXISTS `q4u_service_points`;
CREATE TABLE `q4u_service_points` (
  `service_point_id` int(3) NOT NULL AUTO_INCREMENT,
  `service_point_name` varchar(100) DEFAULT NULL COMMENT 'ชื่อจุดบริการ',
  `service_point_abbr` varchar(50) DEFAULT NULL COMMENT 'ชื่อย่อจุดบริการ',
  `local_code` varchar(6) DEFAULT NULL COMMENT 'รหัสที่ใช้ภายในสถานพยาบาล',
  `standard43_code` varchar(5) DEFAULT NULL COMMENT 'รหัส clinic ตามมาตรฐาน 43 แฟ้ม',
  `service_point_type_id` int(3) DEFAULT NULL COMMENT 'รหัสประเภทจุดบริการ',
  `topic` varchar(50) DEFAULT NULL COMMENT 'publisher ของ mqtt (กรณี h4udb hdc+topic_h4u)',
  `prefix` char(2) DEFAULT NULL,
  `department_id` int(3) DEFAULT NULL,
  `kios` char(1) DEFAULT 'N',
  `use_old_queue` enum('Y','N') DEFAULT 'N',
  `group_compare` enum('Y','N') DEFAULT NULL COMMENT '''เชื่อมคิวกลุ่มกับตารางคิว Y=แก้ไขตารางคิว N=ไม่แก้ไขตารางคิว''',
  `priority_queue_running` enum('Y','N') DEFAULT 'N' COMMENT 'ออกเลขคิวตามประเภทผู้ป่วย',
  `sound_id` int(11) DEFAULT NULL COMMENT 'รหัสเสียงเรียก',
  `sound_speed` decimal(3,2) DEFAULT NULL COMMENT 'ความเร็วเสียงเรียก',
  PRIMARY KEY (`service_point_id`) USING BTREE,
  UNIQUE KEY `service_point_un_point_name` (`service_point_name`) USING BTREE,
  UNIQUE KEY `idx_topic` (`topic`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of q4u_service_points
-- ----------------------------
BEGIN;
INSERT INTO `q4u_service_points` VALUES (1, 'แผนกทันตกรรม', 'DT', '40100', NULL, NULL, '6105557133', 'B', 3, 'Y', 'N', 'Y', 'N', 1, 1.00);
INSERT INTO `q4u_service_points` VALUES (2, 'เวชปฏิบัติทั่วไป', 'OPD', '10100', NULL, NULL, '3027634006', 'O', 8, 'Y', 'N', 'Y', 'N', 12, 1.00);
INSERT INTO `q4u_service_points` VALUES (3, 'กายภาพบำบัด', 'PT', 'P0100', NULL, NULL, '2454027941', 'P', 4, 'N', 'N', 'Y', 'N', 12, 1.00);
INSERT INTO `q4u_service_points` VALUES (4, 'แพทย์แผนไทย', 'TTM', 'T0100', NULL, NULL, '1258897366', 'T', 5, 'Y', 'N', 'Y', 'N', 1, 1.00);
INSERT INTO `q4u_service_points` VALUES (5, 'ห้องอุบัติเหตุฉุกเฉิน', 'ER', '20100', NULL, NULL, '3006074437', 'E', 13, 'Y', 'N', 'Y', 'N', 12, 1.00);
INSERT INTO `q4u_service_points` VALUES (6, 'ห้องรอคลอด', 'LR', 'L0100', NULL, NULL, '5557696070', 'R', 12, 'N', 'N', 'Y', 'N', 12, 1.00);
INSERT INTO `q4u_service_points` VALUES (7, 'สุขาภิบาลและป้องกันโรค', 'SK', '60100', NULL, NULL, '3380216897', 'S', 7, 'N', 'N', 'Y', 'N', 10, 1.00);
INSERT INTO `q4u_service_points` VALUES (8, 'เวชปฏิบัติครอบครัว', 'HPT', '50100', NULL, NULL, '7442412604', 'C', 7, 'N', 'N', 'Y', 'N', 10, 1.00);
INSERT INTO `q4u_service_points` VALUES (9, 'คลินิกเบาหวาน', 'DM', 'D0100', NULL, NULL, '4104497954', 'D', 6, 'N', 'N', 'Y', 'N', 12, 1.00);
INSERT INTO `q4u_service_points` VALUES (10, 'คลินิกความดัน', 'HT', 'H0100', NULL, NULL, '3591810634', 'H', 6, 'N', 'N', 'Y', 'N', 12, 1.00);
INSERT INTO `q4u_service_points` VALUES (11, 'เทคนิคการแพทย์', 'LAB', '70100', NULL, NULL, '1437381103', 'L', 11, 'N', 'N', 'Y', 'N', 1, 1.00);
INSERT INTO `q4u_service_points` VALUES (12, 'รังสีการแพทย์', 'XRY', '80100', NULL, NULL, '1768955411', 'X', 10, 'N', 'N', 'Y', 'N', 1, 1.00);
INSERT INTO `q4u_service_points` VALUES (13, 'Asthma/COPD', 'ASM', 'A0100', NULL, NULL, '5949605349', 'A', 6, 'N', 'N', 'Y', 'N', 12, 1.00);
INSERT INTO `q4u_service_points` VALUES (14, 'คลินิกรักษ์สุขภาพ', 'ADS', 'I0100', NULL, NULL, '7787573746', 'I', 6, 'N', 'N', 'Y', 'N', 12, 1.00);
INSERT INTO `q4u_service_points` VALUES (15, 'คลินิกจิตเวช', 'PS', 'F0100', NULL, NULL, '5287875921', 'F', 6, 'N', 'N', 'Y', 'N', 1, 1.00);
INSERT INTO `q4u_service_points` VALUES (16, 'Wafarin', 'WFR', 'W0100', NULL, NULL, '8901707643', 'W', 6, 'N', 'N', 'Y', 'N', 12, 1.00);
INSERT INTO `q4u_service_points` VALUES (17, 'CKD', 'CKD', 'K0100', NULL, NULL, '4249702764', 'K', 6, 'N', 'N', 'Y', 'N', 12, 1.00);
INSERT INTO `q4u_service_points` VALUES (18, 'เภสัชกรรม', 'PHM', 'M0100', NULL, NULL, '9505768464', 'M', 9, 'N', 'N', 'Y', 'N', 1, 1.00);
COMMIT;

-- ----------------------------
-- Table structure for q4u_service_rooms
-- ----------------------------
DROP TABLE IF EXISTS `q4u_service_rooms`;
CREATE TABLE `q4u_service_rooms` (
  `service_point_id` int(3) NOT NULL COMMENT 'รหัสจุดบริการ',
  `room_number` int(2) NOT NULL COMMENT 'หมายเลขห้องตรวจ',
  `room_name` varchar(50) DEFAULT NULL COMMENT 'ชื่อห้องตรวจ',
  `room_id` int(6) NOT NULL AUTO_INCREMENT,
  `sound_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`room_id`) USING BTREE,
  UNIQUE KEY `service_rooms_un` (`room_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of q4u_service_rooms
-- ----------------------------
BEGIN;
INSERT INTO `q4u_service_rooms` VALUES (1, 1, 'ทันตกรรมเตียง 1', 2, NULL);
INSERT INTO `q4u_service_rooms` VALUES (2, 1, 'ห้องตรวจ 1', 6, NULL);
INSERT INTO `q4u_service_rooms` VALUES (2, 2, 'ห้องตรวจ 2', 7, NULL);
INSERT INTO `q4u_service_rooms` VALUES (2, 3, 'ห้องตรวจ 3', 8, NULL);
INSERT INTO `q4u_service_rooms` VALUES (3, 1, 'กายภาพทั่วไป 1', 9, NULL);
INSERT INTO `q4u_service_rooms` VALUES (4, 1, 'แผนไทยเตียง 1', 11, NULL);
INSERT INTO `q4u_service_rooms` VALUES (4, 2, 'แผนไทยเตียง 2', 12, NULL);
INSERT INTO `q4u_service_rooms` VALUES (1, 2, 'ทันตกรรมเตียง 2', 13, NULL);
INSERT INTO `q4u_service_rooms` VALUES (4, 3, 'แผนไทยเตียง 3', 14, NULL);
INSERT INTO `q4u_service_rooms` VALUES (3, 2, 'กายภาพทั่วไป 2', 15, NULL);
INSERT INTO `q4u_service_rooms` VALUES (5, 9, 'ห้องอุบัติเหตุฉุกเฉิน', 16, NULL);
INSERT INTO `q4u_service_rooms` VALUES (6, 1, 'ห้องรอคลอดเตียง 1', 20, NULL);
INSERT INTO `q4u_service_rooms` VALUES (6, 2, 'ห้องรอคลอดเตียง 2', 21, NULL);
INSERT INTO `q4u_service_rooms` VALUES (6, 3, 'ห้องรอคลอดเตียง 3', 22, NULL);
INSERT INTO `q4u_service_rooms` VALUES (7, 1, 'ห้องตรวจพิเศษ', 23, NULL);
INSERT INTO `q4u_service_rooms` VALUES (8, 1, 'ห้องตรวจพิเศษ 1', 24, NULL);
INSERT INTO `q4u_service_rooms` VALUES (8, 2, 'ห้องตรวจพิเศษ 2', 25, NULL);
INSERT INTO `q4u_service_rooms` VALUES (10, 1, 'ห้องตรวจพิเศษ', 26, NULL);
INSERT INTO `q4u_service_rooms` VALUES (9, 1, 'ห้องตรวจพิเศษ', 27, NULL);
INSERT INTO `q4u_service_rooms` VALUES (1, 3, 'ทันตกรรมเตียง 3', 28, NULL);
INSERT INTO `q4u_service_rooms` VALUES (11, 5, 'ห้องเทคนิคการแพทย์', 29, NULL);
INSERT INTO `q4u_service_rooms` VALUES (13, 1, 'ห้องตรวจ 1', 30, NULL);
INSERT INTO `q4u_service_rooms` VALUES (12, 1, 'ห้องถ่ายภาพรังสี', 31, NULL);
INSERT INTO `q4u_service_rooms` VALUES (14, 1, 'ห้องตรวจพิเศษ ', 32, NULL);
INSERT INTO `q4u_service_rooms` VALUES (15, 1, 'ห้องตรวจพิเศษ', 33, NULL);
INSERT INTO `q4u_service_rooms` VALUES (18, 1, 'ช่องบริการ 1', 34, NULL);
INSERT INTO `q4u_service_rooms` VALUES (18, 2, 'ช่องบริการ 2', 35, NULL);
INSERT INTO `q4u_service_rooms` VALUES (17, 1, 'ห้องตรวจพิเศษ', 36, NULL);
INSERT INTO `q4u_service_rooms` VALUES (16, 1, 'ห้องตรวจพิเศษ', 37, NULL);
COMMIT;

-- ----------------------------
-- Table structure for q4u_sounds
-- ----------------------------
DROP TABLE IF EXISTS `q4u_sounds`;
CREATE TABLE `q4u_sounds` (
  `sound_id` int(11) NOT NULL AUTO_INCREMENT,
  `sound_name` varchar(255) DEFAULT NULL,
  `sound_file` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sound_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of q4u_sounds
-- ----------------------------
BEGIN;
INSERT INTO `q4u_sounds` VALUES (1, ' ที่ช่องบริการ', 'channel.mp3');
INSERT INTO `q4u_sounds` VALUES (2, 'ที่โต๊ะคัดกรอง', 'screen-table.mp3');
INSERT INTO `q4u_sounds` VALUES (3, 'ที่จุดคัดกรอง', 'screen-point.mp3');
INSERT INTO `q4u_sounds` VALUES (4, 'ที่จุดซักประวัติ', 'interview-point.mp3');
INSERT INTO `q4u_sounds` VALUES (5, 'ที่โต๊ะซักประวัติ', 'interview-table.mp3');
INSERT INTO `q4u_sounds` VALUES (6, 'ที่ช่องการเงิน', 'cashier.mp3');
INSERT INTO `q4u_sounds` VALUES (7, 'ที่ช่องจ่ายเงิน', 'pay-cashier.mp3');
INSERT INTO `q4u_sounds` VALUES (8, 'ที่ห้องจ่ายยา', 'pay-drug.mp3');
INSERT INTO `q4u_sounds` VALUES (9, 'ที่ห้องรับยา', 'receive-drug.mp3');
INSERT INTO `q4u_sounds` VALUES (10, 'ที่โต๊ะ', 'table.mp3');
INSERT INTO `q4u_sounds` VALUES (11, 'ที่เคาเตอร์', 'couter.mp3');
INSERT INTO `q4u_sounds` VALUES (12, 'ที่ห้องตรวจ', 'doctor_room.mp3');
COMMIT;

-- ----------------------------
-- Table structure for q4u_system
-- ----------------------------
DROP TABLE IF EXISTS `q4u_system`;
CREATE TABLE `q4u_system` (
  `hoscode` varchar(50) NOT NULL,
  `hosname` varchar(200) DEFAULT NULL,
  `topic` varchar(200) DEFAULT NULL,
  `h4u_notify_token` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`hoscode`) USING BTREE,
  UNIQUE KEY `idx_hoscode` (`hoscode`) USING BTREE,
  UNIQUE KEY `idx_topic` (`topic`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of q4u_system
-- ----------------------------
BEGIN;
INSERT INTO `q4u_system` VALUES ('10957', 'โรงพยาบาลตาลสุม', '4555654443', NULL);
COMMIT;

-- ----------------------------
-- Table structure for q4u_tokens
-- ----------------------------
DROP TABLE IF EXISTS `q4u_tokens`;
CREATE TABLE `q4u_tokens` (
  `token` text DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `expired_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of q4u_tokens
-- ----------------------------
BEGIN;
INSERT INTO `q4u_tokens` VALUES ('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3N1ZSI6Img0dSIsImRlc2NyaXB0aW9uIjoiZm9yIGFjY2VzcyBRNFUgYXBpIiwiUVVFVUVfQ0VOVEVSX1RPUElDIjoicXVldWUvY2VudGVyIiwiU0VSVklDRV9QT0lOVF9UT1BJQyI6InF1ZXVlL3NlcnZpY2UtcG9pbnQiLCJERVBBUlRNRU5UX1RPUElDIjoicXVldWUvZGVwYXJ0bWVudCIsIkdST1VQX1RPUElDIjoicXVldWUvZ3JvdXAiLCJOT1RJRllfVVNFUiI6InE0dSIsIk5PVElGWV9QQVNTV09SRCI6IiMjcTR1IyMiLCJOT1RJRllfU0VSVkVSIjoiMTAuMC4wLjE3IiwiTk9USUZZX1BPUlQiOiI4MDgwIiwiU1BFQUtfU0VSVklDRV9QT0lOVCI6IlkiLCJVU0VfSElTX1dBSVRJTkciOiJZIiwiVVNFX0hJU19ETUgiOiJOIiwiU1BFQUtfU0lOR0xFIjoiWSIsImlhdCI6MTU3NzM0NDEzNCwiZXhwIjoxNjA4OTAxNzM0fQ.OXCyq6BBvy8T-nFtARpcrA14lYs1UDdxjKicMkHN-e4', '2019-12-26 14:08:54', '2020-12-26 14:08:54');
INSERT INTO `q4u_tokens` VALUES ('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3N1ZSI6Img0dSIsImRlc2NyaXB0aW9uIjoiZm9yIGFjY2VzcyBRNFUgYXBpIiwiUVVFVUVfQ0VOVEVSX1RPUElDIjoicXVldWUvY2VudGVyIiwiU0VSVklDRV9QT0lOVF9UT1BJQyI6InF1ZXVlL3NlcnZpY2UtcG9pbnQiLCJERVBBUlRNRU5UX1RPUElDIjoicXVldWUvZGVwYXJ0bWVudCIsIkdST1VQX1RPUElDIjoicXVldWUvZ3JvdXAiLCJOT1RJRllfVVNFUiI6InE0dSIsIk5PVElGWV9QQVNTV09SRCI6IiMjcTR1IyMiLCJOT1RJRllfU0VSVkVSIjoiMTAuMC4wLjE3IiwiTk9USUZZX1BPUlQiOiI4MDgwIiwiU1BFQUtfU0VSVklDRV9QT0lOVCI6IlkiLCJVU0VfSElTX1dBSVRJTkciOiJZIiwiVVNFX0hJU19ETUgiOiJOIiwiU1BFQUtfU0lOR0xFIjoiWSIsImlhdCI6MTU3NzM0NTExMSwiZXhwIjoxNjA4OTAyNzExfQ.ZMkFlUAQI9qwBVjV846MUCcsSyexE1JGDw13I9MRHc0', '2019-12-26 14:25:11', '2020-12-26 14:25:11');
INSERT INTO `q4u_tokens` VALUES ('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3N1ZSI6Img0dSIsImRlc2NyaXB0aW9uIjoiZm9yIGFjY2VzcyBRNFUgYXBpIiwiUVVFVUVfQ0VOVEVSX1RPUElDIjoicXVldWUvY2VudGVyIiwiU0VSVklDRV9QT0lOVF9UT1BJQyI6InF1ZXVlL3NlcnZpY2UtcG9pbnQiLCJERVBBUlRNRU5UX1RPUElDIjoicXVldWUvZGVwYXJ0bWVudCIsIkdST1VQX1RPUElDIjoicXVldWUvZ3JvdXAiLCJOT1RJRllfVVNFUiI6InE0dSIsIk5PVElGWV9QQVNTV09SRCI6IiMjcTR1IyMiLCJOT1RJRllfU0VSVkVSIjoiMTAuMC4wLjE3IiwiTk9USUZZX1BPUlQiOiI4MDgwIiwiU1BFQUtfU0VSVklDRV9QT0lOVCI6IlkiLCJVU0VfSElTX1dBSVRJTkciOiJZIiwiVVNFX0hJU19ETUgiOiJOIiwiU1BFQUtfU0lOR0xFIjoiWSIsImlhdCI6MTU3ODQ4NzM2NywiZXhwIjoxNjEwMDQ0OTY3fQ.2PG_amZEGoDjjn_rwaz72LRzsL9XcYGqI6mOY53gC-E', '2020-01-08 19:42:47', '2021-01-08 19:42:47');
INSERT INTO `q4u_tokens` VALUES ('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3N1ZSI6Img0dSIsImRlc2NyaXB0aW9uIjoiZm9yIGFjY2VzcyBRNFUgYXBpIiwiUVVFVUVfQ0VOVEVSX1RPUElDIjoicXVldWUvY2VudGVyIiwiU0VSVklDRV9QT0lOVF9UT1BJQyI6InF1ZXVlL3NlcnZpY2UtcG9pbnQiLCJERVBBUlRNRU5UX1RPUElDIjoicXVldWUvZGVwYXJ0bWVudCIsIkdST1VQX1RPUElDIjoicXVldWUvZ3JvdXAiLCJOT1RJRllfVVNFUiI6InE0dSIsIk5PVElGWV9QQVNTV09SRCI6IiMjcTR1IyMiLCJOT1RJRllfU0VSVkVSIjoiMTAuMC4wLjE3IiwiTk9USUZZX1BPUlQiOiI4MDgwIiwiU1BFQUtfU0VSVklDRV9QT0lOVCI6IlkiLCJVU0VfSElTX1dBSVRJTkciOiJZIiwiVVNFX0hJU19ETUgiOiJOIiwiU1BFQUtfU0lOR0xFIjoiWSIsImlhdCI6MTU3OTY4MDAxNCwiZXhwIjoxNjExMjM3NjE0fQ.T8vUrxg-hSiEdn7xgZrf1VhYmqrBkBoS9F6Uh9vW8WI', '2020-01-22 15:00:14', '2021-01-22 15:00:14');
COMMIT;

-- ----------------------------
-- Table structure for q4u_user_roles
-- ----------------------------
DROP TABLE IF EXISTS `q4u_user_roles`;
CREATE TABLE `q4u_user_roles` (
  `user_id` int(11) NOT NULL,
  `service_point_id` int(4) NOT NULL,
  `is_active` int(1) DEFAULT 1 COMMENT '0=ยกเลิก 1=ใช้งาน',
  PRIMARY KEY (`user_id`,`service_point_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of q4u_user_roles
-- ----------------------------
BEGIN;
INSERT INTO `q4u_user_roles` VALUES (1, 99, 1);
INSERT INTO `q4u_user_roles` VALUES (2, 0, 1);
INSERT INTO `q4u_user_roles` VALUES (3, 2, 1);
COMMIT;

-- ----------------------------
-- Table structure for q4u_user_service_points
-- ----------------------------
DROP TABLE IF EXISTS `q4u_user_service_points`;
CREATE TABLE `q4u_user_service_points` (
  `user_service_point_id` int(6) NOT NULL AUTO_INCREMENT,
  `user_id` int(3) NOT NULL,
  `service_point_id` int(3) NOT NULL,
  PRIMARY KEY (`user_id`,`service_point_id`) USING BTREE,
  UNIQUE KEY `use_service_point_id` (`user_service_point_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of q4u_user_service_points
-- ----------------------------
BEGIN;
INSERT INTO `q4u_user_service_points` VALUES (30, 4, 2);
INSERT INTO `q4u_user_service_points` VALUES (31, 5, 11);
INSERT INTO `q4u_user_service_points` VALUES (32, 6, 12);
INSERT INTO `q4u_user_service_points` VALUES (33, 7, 5);
INSERT INTO `q4u_user_service_points` VALUES (34, 8, 1);
INSERT INTO `q4u_user_service_points` VALUES (35, 9, 3);
INSERT INTO `q4u_user_service_points` VALUES (36, 10, 8);
INSERT INTO `q4u_user_service_points` VALUES (37, 11, 18);
INSERT INTO `q4u_user_service_points` VALUES (38, 12, 6);
INSERT INTO `q4u_user_service_points` VALUES (39, 13, 17);
INSERT INTO `q4u_user_service_points` VALUES (40, 13, 13);
INSERT INTO `q4u_user_service_points` VALUES (41, 13, 16);
INSERT INTO `q4u_user_service_points` VALUES (42, 13, 10);
INSERT INTO `q4u_user_service_points` VALUES (43, 13, 15);
INSERT INTO `q4u_user_service_points` VALUES (44, 13, 14);
INSERT INTO `q4u_user_service_points` VALUES (45, 13, 9);
INSERT INTO `q4u_user_service_points` VALUES (46, 1, 13);
INSERT INTO `q4u_user_service_points` VALUES (47, 1, 17);
INSERT INTO `q4u_user_service_points` VALUES (48, 1, 16);
INSERT INTO `q4u_user_service_points` VALUES (49, 1, 3);
INSERT INTO `q4u_user_service_points` VALUES (50, 1, 10);
INSERT INTO `q4u_user_service_points` VALUES (51, 1, 15);
INSERT INTO `q4u_user_service_points` VALUES (52, 1, 14);
INSERT INTO `q4u_user_service_points` VALUES (53, 1, 9);
INSERT INTO `q4u_user_service_points` VALUES (54, 1, 11);
INSERT INTO `q4u_user_service_points` VALUES (55, 1, 12);
INSERT INTO `q4u_user_service_points` VALUES (56, 1, 7);
INSERT INTO `q4u_user_service_points` VALUES (57, 1, 6);
INSERT INTO `q4u_user_service_points` VALUES (58, 1, 5);
INSERT INTO `q4u_user_service_points` VALUES (59, 1, 18);
INSERT INTO `q4u_user_service_points` VALUES (60, 1, 8);
INSERT INTO `q4u_user_service_points` VALUES (61, 1, 2);
INSERT INTO `q4u_user_service_points` VALUES (62, 1, 1);
INSERT INTO `q4u_user_service_points` VALUES (63, 1, 4);
INSERT INTO `q4u_user_service_points` VALUES (64, 3, 11);
INSERT INTO `q4u_user_service_points` VALUES (65, 3, 12);
INSERT INTO `q4u_user_service_points` VALUES (66, 3, 7);
INSERT INTO `q4u_user_service_points` VALUES (67, 3, 6);
INSERT INTO `q4u_user_service_points` VALUES (68, 3, 5);
INSERT INTO `q4u_user_service_points` VALUES (69, 3, 18);
INSERT INTO `q4u_user_service_points` VALUES (70, 3, 8);
INSERT INTO `q4u_user_service_points` VALUES (71, 3, 2);
INSERT INTO `q4u_user_service_points` VALUES (72, 3, 1);
INSERT INTO `q4u_user_service_points` VALUES (73, 3, 4);
INSERT INTO `q4u_user_service_points` VALUES (74, 3, 13);
INSERT INTO `q4u_user_service_points` VALUES (75, 3, 17);
INSERT INTO `q4u_user_service_points` VALUES (76, 3, 16);
INSERT INTO `q4u_user_service_points` VALUES (77, 3, 3);
INSERT INTO `q4u_user_service_points` VALUES (78, 3, 10);
INSERT INTO `q4u_user_service_points` VALUES (79, 3, 15);
INSERT INTO `q4u_user_service_points` VALUES (80, 3, 14);
INSERT INTO `q4u_user_service_points` VALUES (81, 3, 9);
INSERT INTO `q4u_user_service_points` VALUES (82, 2, 3);
INSERT INTO `q4u_user_service_points` VALUES (83, 2, 10);
INSERT INTO `q4u_user_service_points` VALUES (84, 2, 9);
INSERT INTO `q4u_user_service_points` VALUES (85, 2, 12);
INSERT INTO `q4u_user_service_points` VALUES (86, 2, 7);
INSERT INTO `q4u_user_service_points` VALUES (87, 2, 6);
INSERT INTO `q4u_user_service_points` VALUES (88, 2, 5);
INSERT INTO `q4u_user_service_points` VALUES (89, 2, 11);
INSERT INTO `q4u_user_service_points` VALUES (90, 2, 18);
INSERT INTO `q4u_user_service_points` VALUES (91, 2, 8);
INSERT INTO `q4u_user_service_points` VALUES (92, 2, 2);
INSERT INTO `q4u_user_service_points` VALUES (93, 2, 1);
INSERT INTO `q4u_user_service_points` VALUES (94, 2, 4);
INSERT INTO `q4u_user_service_points` VALUES (96, 15, 2);
COMMIT;

-- ----------------------------
-- Table structure for q4u_users
-- ----------------------------
DROP TABLE IF EXISTS `q4u_users`;
CREATE TABLE `q4u_users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(100) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(256) DEFAULT NULL,
  `user_type` enum('ADMIN','MEMBER','KIOSK') DEFAULT NULL,
  `is_active` char(1) DEFAULT 'Y',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE KEY `idx_username` (`username`) USING BTREE,
  KEY `idx_password` (`password`(255)) USING BTREE,
  KEY `idx_is_active` (`is_active`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of q4u_users
-- ----------------------------
BEGIN;
INSERT INTO `q4u_users` VALUES (1, 'ธวัชชัย แสงเดือน', 'admin', '383bdcdb33047bf9a8a2bd11f0055d36', 'ADMIN', 'Y');
INSERT INTO `q4u_users` VALUES (2, 'genQ', 'U10957', 'e10adc3949ba59abbe56e057f20f883e', 'MEMBER', 'Y');
INSERT INTO `q4u_users` VALUES (3, 'kiosk', 'kiosk', 'e10adc3949ba59abbe56e057f20f883e', 'KIOSK', 'Y');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
