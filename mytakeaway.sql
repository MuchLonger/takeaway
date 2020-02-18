/*
Navicat MySQL Data Transfer

Source Server         : MYSQL
Source Server Version : 80015
Source Host           : localhost:3306
Source Database       : mytakeaway

Target Server Type    : MYSQL
Target Server Version : 80015
File Encoding         : 65001

Date: 2019-06-18 21:28:22
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
  `localImg` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'static/images/hp.jpg',
  PRIMARY KEY (`shopId`),
  UNIQUE KEY `fk0_shopName` (`shopName`),
  UNIQUE KEY `fk0_num` (`goToUserNum`) USING BTREE,
  KEY `fk0_role` (`role`),
  CONSTRAINT `fk0_num` FOREIGN KEY (`goToUserNum`) REFERENCES `login` (`goToUserNum`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk0_role` FOREIGN KEY (`role`) REFERENCES `role` (`role`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of business
-- ----------------------------
INSERT INTO `business` VALUES ('3', '29', '10', '北苑饭堂', '天河区北苑', 'businessman', '866888', '1', 'images/hp1560499845597.jpg');
INSERT INTO `business` VALUES ('4', '10', '10', '南苑饭堂', '白云区南苑', 'businessman', '877666', '1', 'static/images/hp.jpg');
INSERT INTO `business` VALUES ('5', '11', '10', '东苑饭堂', '天河区东苑', 'businessman', '867676', '1', 'static/images/hp.jpg');
INSERT INTO `business` VALUES ('6', '12', '10', '西苑', '天河区西苑', 'businessman', '876767', '0', 'static/images/hp.jpg');
INSERT INTO `business` VALUES ('7', '36', '7', '潮味', '校门口', 'businessman', '866666', '1', 'images/fjuu1552475992897.jpg');

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
  CONSTRAINT `fk4_shopId` FOREIGN KEY (`shopId`) REFERENCES `business` (`shopId`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dish
-- ----------------------------
INSERT INTO `dish` VALUES ('6', '5', '味精汤', '2', '随便点');
INSERT INTO `dish` VALUES ('7', '5', '早餐', '20', '吃好');
INSERT INTO `dish` VALUES ('8', '5', '午餐', '50', '吃饱');
INSERT INTO `dish` VALUES ('19', '7', '尖椒瘦肉', '102', '潮粥');
INSERT INTO `dish` VALUES ('20', '7', '猪脚饭', '10', '正宗');
INSERT INTO `dish` VALUES ('22', '3', '猪脚饭', '10', '正宗');
INSERT INTO `dish` VALUES ('23', '3', '猪脚饭', '15', '正宗s');

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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of login
-- ----------------------------
INSERT INTO `login` VALUES ('1', 'sys', 'admin', '502');
INSERT INTO `login` VALUES ('10', 'businessman', 'bus2', '502');
INSERT INTO `login` VALUES ('11', 'businessman', 'bus3', '502');
INSERT INTO `login` VALUES ('12', 'businessman', 'bus4', '502');
INSERT INTO `login` VALUES ('25', 'user', 'cqy', '123');
INSERT INTO `login` VALUES ('26', 'user', 'cpu', '589');
INSERT INTO `login` VALUES ('27', 'user', 'hasee', '521');
INSERT INTO `login` VALUES ('28', 'user', 'caq', '214');
INSERT INTO `login` VALUES ('29', 'businessman', 'bus1', '123');
INSERT INTO `login` VALUES ('32', 'user', 'cll', '502');
INSERT INTO `login` VALUES ('34', 'user', 'kll', '1');
INSERT INTO `login` VALUES ('35', 'user', 'cds', '123');
INSERT INTO `login` VALUES ('36', 'businessman', 'bs1', '1');

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
  CONSTRAINT `fk3_goToUserNum` FOREIGN KEY (`goToUsernum`) REFERENCES `login` (`goToUserNum`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', '25', '北苑饭堂', '肉', '8', '2019-01-10 14:19:02', '连南');
INSERT INTO `orders` VALUES ('2', '25', '南苑饭堂', '菜', '3', '2019-01-16 14:20:12', '连南');
INSERT INTO `orders` VALUES ('3', '25', '西苑', '面', '4', '2019-01-02 14:20:29', '连南');
INSERT INTO `orders` VALUES ('4', '1', '东苑', '饭', '1', '2019-01-10 14:31:03', '清远');
INSERT INTO `orders` VALUES ('5', '35', '北苑饭堂', '藤条焖猪肉+炒鱿鱼+白粥', '62', '2019-02-20 07:49:06', '广东广州');
INSERT INTO `orders` VALUES ('6', '25', '北苑饭堂', '炒鱿鱼+白粥', '52', '2019-02-20 09:02:46', '连南');
INSERT INTO `orders` VALUES ('10', '35', '北苑饭堂', '藤条焖猪肉+炒鱿鱼+白粥', '62', '2019-02-20 09:05:37', '连班');
INSERT INTO `orders` VALUES ('11', '35', '北苑饭堂', '炒鱿鱼+白粥', '52', '2019-02-20 09:07:59', '连班');
INSERT INTO `orders` VALUES ('12', '35', '东苑饭堂', '面+饭', '7', '2019-02-20 09:19:21', '连班');
INSERT INTO `orders` VALUES ('13', '35', '东苑饭堂', '粉+面+饭', '12', '2019-02-20 09:21:29', '连班');
INSERT INTO `orders` VALUES ('14', '35', '东苑饭堂', '粉+面+饭', '12', '2019-02-20 09:21:41', '连班');
INSERT INTO `orders` VALUES ('15', '35', '北苑饭堂', '炒鱿鱼+白粥', '52', '2019-02-20 09:25:43', '连班');
INSERT INTO `orders` VALUES ('16', '25', '东苑饭堂', '粉+面', '10', '2019-02-20 09:45:22', '连南');
INSERT INTO `orders` VALUES ('17', '25', '东苑饭堂', '面+饭', '7', '2019-02-26 10:28:38', '连南');
INSERT INTO `orders` VALUES ('18', '25', '东苑饭堂', '粉+面+饭', '12', '2019-03-03 15:29:04', '连南2');
INSERT INTO `orders` VALUES ('19', '25', '北苑饭堂', '炒鱿鱼+白粥', '52', '2019-03-09 07:05:07', '连南2');
INSERT INTO `orders` VALUES ('20', '35', '北苑饭堂', '藤条焖猪肉+炒鱿鱼+白粥', '62', '2019-03-09 07:40:58', '连班');
INSERT INTO `orders` VALUES ('21', '35', '北苑饭堂', '藤条焖猪肉+炒鱿鱼+白粥', '62', '2019-03-09 07:42:02', '连班');
INSERT INTO `orders` VALUES ('22', '35', '北苑饭堂', '炒鱿鱼', '50', '2019-03-09 07:51:17', '连班s');
INSERT INTO `orders` VALUES ('23', '29', '南苑饭堂', '菜', '3', '2019-03-10 11:31:45', '天河区北苑');
INSERT INTO `orders` VALUES ('24', '29', '北苑饭堂', '藤条焖猪肉+炒鱿鱼+白粥', '62', '2019-03-10 06:58:29', '天河区北苑');
INSERT INTO `orders` VALUES ('25', '29', '东苑饭堂', '粉+面+饭', '12', '2019-03-10 06:59:06', '天河区北苑');
INSERT INTO `orders` VALUES ('26', '29', '东苑饭堂', '面+饭', '7', '2019-03-10 07:24:57', '天河区北苑');
INSERT INTO `orders` VALUES ('27', '36', '潮味', '猪脚饭s', '11', '2019-03-11 06:40:08', '校门口');
INSERT INTO `orders` VALUES ('28', '36', '东苑饭堂', '味精汤+早餐+午餐', '72', '2019-03-12 02:59:57', '校门口');
INSERT INTO `orders` VALUES ('29', '36', '东苑饭堂', '味精汤+早餐+午餐', '72', '2019-03-13 11:15:55', '校门口');
INSERT INTO `orders` VALUES ('30', '36', '潮味', '尖椒瘦肉+猪脚饭', '112', '2019-03-13 11:20:11', '校门口');
INSERT INTO `orders` VALUES ('31', '25', '北苑饭堂', '猪脚饭+猪脚饭', '25', '2019-06-14 08:09:39', '连南2');
INSERT INTO `orders` VALUES ('32', '25', '东苑饭堂', '味精汤+早餐', '22', '2019-06-18 12:42:22', '连南2');

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
  CONSTRAINT `fk5_goToUserNum` FOREIGN KEY (`goToUserNum`) REFERENCES `login` (`goToUserNum`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '1', 'sys', '共产主义接班人', '13229492681', '2019-03-09 14:41:20', '清远');
INSERT INTO `user` VALUES ('2', '25', 'user', '陈麒涌l', '13229492681', '2019-06-14 15:55:57', '连南2');
INSERT INTO `user` VALUES ('12', '28', 'user', '北苑', '13229492681', '2019-01-10 14:31:17', '北苑');
INSERT INTO `user` VALUES ('13', '32', 'user', 'lzk', '1234680', '2019-01-11 01:51:33', '广州');
INSERT INTO `user` VALUES ('14', '34', 'user', '北苑', '123', '2019-01-11 03:01:25', '广州');
INSERT INTO `user` VALUES ('15', '35', 'user', '拟好a', '13229492682', '2019-03-09 15:42:17', '连班s');
