/*
Navicat MySQL Data Transfer

Source Server         : MYSQL
Source Server Version : 80013
Source Host           : localhost:3306
Source Database       : mytakeaway

Target Server Type    : MYSQL
Target Server Version : 80013
File Encoding         : 65001

Date: 2019-01-11 12:25:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `business`
-- ----------------------------
DROP TABLE IF EXISTS `business`;
CREATE TABLE `business` (
  `shopId` int(11) NOT NULL AUTO_INCREMENT,
  `goToUserNum` int(11) DEFAULT NULL,
  `shopDiscount` double DEFAULT '10',
  `shopName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `shopAddress` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `role` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `shopTel` varchar(11) DEFAULT NULL,
  `operatingStatus` int(1) DEFAULT '1',
  PRIMARY KEY (`shopId`),
  UNIQUE KEY `fk0_shopName` (`shopName`),
  UNIQUE KEY `fk0_num` (`goToUserNum`) USING BTREE,
  KEY `fk0_role` (`role`),
  CONSTRAINT `fk0_num` FOREIGN KEY (`goToUserNum`) REFERENCES `login` (`gotousernum`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk0_role` FOREIGN KEY (`role`) REFERENCES `role` (`role`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of business
-- ----------------------------
INSERT INTO `business` VALUES ('3', '29', null, '北苑饭堂', '天河区北苑', 'businessman', '866777', '1');
INSERT INTO `business` VALUES ('4', '10', null, '南苑饭堂', '白云区南苑', 'businessman', '877666', '1');
INSERT INTO `business` VALUES ('5', '11', null, '东苑饭堂', '天河区东苑', 'businessman', '867676', '0');
INSERT INTO `business` VALUES ('6', '12', null, '西苑', '天河区西苑', 'businessman', '876767', '1');

-- ----------------------------
-- Table structure for `dish`
-- ----------------------------
DROP TABLE IF EXISTS `dish`;
CREATE TABLE `dish` (
  `dishId` int(11) NOT NULL AUTO_INCREMENT,
  `shopId` int(11) DEFAULT NULL,
  `dishName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `dishPrice` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `dishDetails` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`dishId`),
  KEY `fk4_shopId` (`shopId`),
  CONSTRAINT `fk4_shopId` FOREIGN KEY (`shopId`) REFERENCES `business` (`shopid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dish
-- ----------------------------

-- ----------------------------
-- Table structure for `login`
-- ----------------------------
DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `goToUserNum` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`goToUserNum`),
  UNIQUE KEY `ind1_account` (`account`),
  KEY `fk1_role` (`role`),
  CONSTRAINT `fk3_role` FOREIGN KEY (`role`) REFERENCES `role` (`role`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of login
-- ----------------------------
INSERT INTO `login` VALUES ('1', 'sys', 'admin', '502');
INSERT INTO `login` VALUES ('10', 'businessman', 'bus2', '502');
INSERT INTO `login` VALUES ('11', 'businessman', 'bus3', '502');
INSERT INTO `login` VALUES ('12', 'businessman', 'bus4', '502');
INSERT INTO `login` VALUES ('25', 'user', 'cqy', '502');
INSERT INTO `login` VALUES ('26', 'user', 'cpu', '589');
INSERT INTO `login` VALUES ('27', 'user', 'hasee', '521');
INSERT INTO `login` VALUES ('28', 'user', 'caq', '214');
INSERT INTO `login` VALUES ('29', 'businessman', 'bus1', '502');
INSERT INTO `login` VALUES ('32', 'user', 'cll', '502');
INSERT INTO `login` VALUES ('34', 'user', 'kll', '1');

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `orderNumber` int(11) NOT NULL AUTO_INCREMENT,
  `goToUsernum` int(11) DEFAULT NULL,
  `shopName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `dishName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `dishPrice` double DEFAULT NULL,
  `orderTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `handToAddr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`orderNumber`),
  KEY `fk3_goToUserNum` (`goToUsernum`),
  CONSTRAINT `fk3_goToUserNum` FOREIGN KEY (`goToUsernum`) REFERENCES `login` (`gotousernum`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', '25', '北苑饭堂', '肉', '8', '2019-01-10 14:19:02', '连南');
INSERT INTO `orders` VALUES ('2', '25', '南苑饭堂', '菜', '3', '2019-01-16 14:20:12', '连南');
INSERT INTO `orders` VALUES ('3', '25', '西苑', '面', '4', '2019-01-02 14:20:29', '连南');
INSERT INTO `orders` VALUES ('4', '1', '东苑', '饭', '1', '2019-01-10 14:31:03', '清远');

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `roleId` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`roleId`),
  KEY `role` (`role`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('3', 'businessman');
INSERT INTO `role` VALUES ('1', 'sys');
INSERT INTO `role` VALUES ('2', 'user');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goToUserNum` int(11) DEFAULT NULL,
  `role` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `userName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `userTel` bigint(11) DEFAULT NULL,
  `userRegTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `userAddress` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fk5_goToUserNum` (`goToUserNum`) USING BTREE,
  CONSTRAINT `fk5_goToUserNum` FOREIGN KEY (`goToUserNum`) REFERENCES `login` (`gotousernum`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '1', 'sys', '管理员', '13229492681', '2019-01-01 09:10:21', '清远');
INSERT INTO `user` VALUES ('2', '25', 'user', '陈麒涌', '13229492681', '2019-01-10 14:31:15', '连南');
INSERT INTO `user` VALUES ('12', '28', 'user', '北苑', '13229492681', '2019-01-10 14:31:17', '北苑');
INSERT INTO `user` VALUES ('13', '32', 'user', 'lzk', '1234680', '2019-01-11 01:51:33', '广州');
INSERT INTO `user` VALUES ('14', '34', 'user', '北苑', '123', '2019-01-11 03:01:25', '广州');
