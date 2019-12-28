/*
 Navicat Premium Data Transfer

 Source Server         : LSS
 Source Server Type    : MySQL
 Source Server Version : 50728
 Source Host           : 121.36.49.183:3306
 Source Schema         : LSSData

 Target Server Type    : MySQL
 Target Server Version : 50728
 File Encoding         : 65001

 Date: 28/12/2019 16:21:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for administor
-- ----------------------------
DROP TABLE IF EXISTS `administor`;
CREATE TABLE `administor`  (
  `Aid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Aname` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Apassword` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Aid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of administor
-- ----------------------------
INSERT INTO `administor` VALUES ('16001', '张三', '16001');
INSERT INTO `administor` VALUES ('16002', '李四', '16002');
INSERT INTO `administor` VALUES ('16003', '王五', '16003');
INSERT INTO `administor` VALUES ('16004', '刘柳', '16004');
INSERT INTO `administor` VALUES ('16005', '田七', '16005');
INSERT INTO `administor` VALUES ('16006', '李江敏', '16006');
INSERT INTO `administor` VALUES ('16007', '王伟', '16007');
INSERT INTO `administor` VALUES ('16008', '王强斌', '16008');

-- ----------------------------
-- Table structure for library
-- ----------------------------
DROP TABLE IF EXISTS `library`;
CREATE TABLE `library`  (
  `Lid` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Llongitude` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Llatitute` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Lerror` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Lname` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Lsfloor` int(11) NULL DEFAULT NULL,
  `Lefloor` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`Lid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of library
-- ----------------------------
INSERT INTO `library` VALUES ('L1', '34.1530', '108.12', '0.1', '学府城', 1, 6);
INSERT INTO `library` VALUES ('L2', '34.1530', '108.12', '0.1', '南山', 1, 6);
INSERT INTO `library` VALUES ('L3', '34.8', '108.92', '0.1', '雁塔', 1, 5);

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `Oid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Ostime` datetime(0) NULL DEFAULT NULL,
  `Octime` datetime(0) NULL DEFAULT NULL,
  `Oetime` datetime(0) NULL DEFAULT NULL,
  `Ostate` varbinary(2) NULL DEFAULT NULL,
  `Sid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Tid` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Oid`) USING BTREE,
  INDEX `Sid`(`Sid`) USING BTREE,
  INDEX `Tid`(`Tid`) USING BTREE,
  CONSTRAINT `Sid` FOREIGN KEY (`Sid`) REFERENCES `student` (`Sid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `Tid` FOREIGN KEY (`Tid`) REFERENCES `seat` (`Tid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('O10001', '2019-12-28 14:07:15', '2019-12-28 14:07:20', '2019-12-28 18:07:24', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for seat
-- ----------------------------
DROP TABLE IF EXISTS `seat`;
CREATE TABLE `seat`  (
  `Tid` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Tfloor` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Tstate` varbinary(24) NULL DEFAULT '',
  `Lid` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Tid`) USING BTREE,
  INDEX `Lid`(`Lid`) USING BTREE,
  CONSTRAINT `Lid` FOREIGN KEY (`Lid`) REFERENCES `library` (`Lid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of seat
-- ----------------------------
INSERT INTO `seat` VALUES ('T001', '2', NULL, 'L1');
INSERT INTO `seat` VALUES ('T002', '3', NULL, 'L1');
INSERT INTO `seat` VALUES ('T003', '4', NULL, 'L1');
INSERT INTO `seat` VALUES ('T004', '1', NULL, 'L2');
INSERT INTO `seat` VALUES ('T005', '2', NULL, 'L2');
INSERT INTO `seat` VALUES ('T006', '3', NULL, 'L2');
INSERT INTO `seat` VALUES ('T007', '4', NULL, 'L2');
INSERT INTO `seat` VALUES ('T008', '2', NULL, 'L3');
INSERT INTO `seat` VALUES ('T009', '3', NULL, 'L3');
INSERT INTO `seat` VALUES ('T010', '5', NULL, 'L3');
INSERT INTO `seat` VALUES ('T011', '1', NULL, 'L1');
INSERT INTO `seat` VALUES ('T012', '2', NULL, 'L1');
INSERT INTO `seat` VALUES ('T013', '5', NULL, 'L1');
INSERT INTO `seat` VALUES ('T014', '1', NULL, 'L2');
INSERT INTO `seat` VALUES ('T015', '3', NULL, 'L2');
INSERT INTO `seat` VALUES ('T016', '4', NULL, 'L2');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `Sid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Sname` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Spassword` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Semail` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Ssex` varbinary(1) NOT NULL DEFAULT 0 COMMENT '0代表男，1代表女',
  `Svalue` int(11) NULL DEFAULT NULL,
  `Slock` varbinary(2) NOT NULL DEFAULT 0,
  PRIMARY KEY (`Sid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1606020002', '惠娇', '1606020002', NULL, 0x30, NULL, 0x30);
INSERT INTO `student` VALUES ('1606020003', '龙莓', '1606020003', NULL, 0x30, NULL, 0x30);
INSERT INTO `student` VALUES ('1606020004', '于倰', '1606020004', NULL, 0x30, NULL, 0x30);
INSERT INTO `student` VALUES ('1606020005', '广贤', '1606020005', NULL, 0x30, NULL, 0x30);
INSERT INTO `student` VALUES ('1606020092', '国甘泽', '1606020092', NULL, 0x30, NULL, 0x30);
INSERT INTO `student` VALUES ('1606020093', '利野雪', '1606020093', NULL, 0x30, NULL, 0x30);
INSERT INTO `student` VALUES ('1606020094', '寇尔风', '1606020094', NULL, 0x30, NULL, 0x30);
INSERT INTO `student` VALUES ('1606020095', '晏紫琼', '1606020095', NULL, 0x30, NULL, 0x30);
INSERT INTO `student` VALUES ('1606020096', '祖之云', '1606020096', NULL, 0x30, NULL, 0x30);
INSERT INTO `student` VALUES ('1606020097', '宦晓星', '1606020097', NULL, 0x30, NULL, 0x30);
INSERT INTO `student` VALUES ('1606020098', '厉安安', '1606020098', NULL, 0x30, NULL, 0x30);

SET FOREIGN_KEY_CHECKS = 1;
