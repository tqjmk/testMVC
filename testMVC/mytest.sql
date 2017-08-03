/*
Navicat MySQL Data Transfer

Source Server         : mydatebase
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : mytest

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-07-28 12:17:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for city
-- ----------------------------
DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `provinceId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of city
-- ----------------------------
INSERT INTO `city` VALUES ('1', '市区1', '1');
INSERT INTO `city` VALUES ('2', '市区2', '1');
INSERT INTO `city` VALUES ('3', '市区3', '2');
INSERT INTO `city` VALUES ('4', '市区4', '2');
INSERT INTO `city` VALUES ('5', '市区5', '3');
INSERT INTO `city` VALUES ('6', '市区6', '3');

-- ----------------------------
-- Table structure for nav_tree
-- ----------------------------
DROP TABLE IF EXISTS `nav_tree`;
CREATE TABLE `nav_tree` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `text` varchar(20) DEFAULT NULL,
  `state` varchar(10) DEFAULT NULL,
  `iconCls` varchar(20) DEFAULT '',
  `url` varchar(50) DEFAULT '',
  `nid` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nav_tree
-- ----------------------------
INSERT INTO `nav_tree` VALUES ('1', '系统模块', 'closed', '', '', '0');
INSERT INTO `nav_tree` VALUES ('2', '管理员管理', 'open', '', 'manager', '1');
INSERT INTO `nav_tree` VALUES ('3', '会员模块', 'closed', '', '', '0');
INSERT INTO `nav_tree` VALUES ('4', '会员管理', 'open', '', 'bbb', '3');

-- ----------------------------
-- Table structure for province
-- ----------------------------
DROP TABLE IF EXISTS `province`;
CREATE TABLE `province` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of province
-- ----------------------------
INSERT INTO `province` VALUES ('1', '省1');
INSERT INTO `province` VALUES ('2', '省2');
INSERT INTO `province` VALUES ('3', '省3');

-- ----------------------------
-- Table structure for street
-- ----------------------------
DROP TABLE IF EXISTS `street`;
CREATE TABLE `street` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `cityId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of street
-- ----------------------------
INSERT INTO `street` VALUES ('1', '街道1', '1');
INSERT INTO `street` VALUES ('2', '街道2', '1');
INSERT INTO `street` VALUES ('3', '街道3', '2');
INSERT INTO `street` VALUES ('4', '街道4', '2');
INSERT INTO `street` VALUES ('5', '街道5', '3');
INSERT INTO `street` VALUES ('6', '街道6', '3');
INSERT INTO `street` VALUES ('7', '街道7', '4');
INSERT INTO `street` VALUES ('8', '街道8', '4');
INSERT INTO `street` VALUES ('9', '街道9', '5');
INSERT INTO `street` VALUES ('10', '街道10', '5');
INSERT INTO `street` VALUES ('11', '街道11', '6');
INSERT INTO `street` VALUES ('12', '街道12', '6');

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `provinceId` bigint(20) DEFAULT NULL,
  `cityId` bigint(20) DEFAULT NULL,
  `streetId` bigint(20) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('1', 'tttttttt', 'qqqqqq', '2', '3', '6', '2017-06-08');
INSERT INTO `userinfo` VALUES ('2', 'ttttttttt', 'ggggggg', '1', '1', '1', '2017-07-01');
INSERT INTO `userinfo` VALUES ('3', 'ttttttttt', 'fffffff', '3', '5', '10', '2017-07-13');
INSERT INTO `userinfo` VALUES ('6', 'qweqweq', 'qweqweq', '1', '2', '3', '2017-07-13');
INSERT INTO `userinfo` VALUES ('7', 'werwerw', 'werwerwer', '2', '4', '8', '2017-07-07');
INSERT INTO `userinfo` VALUES ('10', 'werwerwerwe', 'werwer', '1', '1', '1', '2017-07-21');
INSERT INTO `userinfo` VALUES ('11', 'wer', 'sdfsdfdsf', '1', '1', '1', '2017-07-05');
INSERT INTO `userinfo` VALUES ('12', 'werrrw', 'sdfsdfsdf', '1', '1', '1', '2017-07-05');
INSERT INTO `userinfo` VALUES ('19', 'rwerwer', 'sdfsfs', '1', '1', '1', '2017-07-05');
INSERT INTO `userinfo` VALUES ('20', 'erwerw', 'sdfsfs', '1', '1', '1', '2017-07-05');
INSERT INTO `userinfo` VALUES ('21', 'rwerwe', 'sdfsfs', '1', '1', '1', '2017-07-05');
INSERT INTO `userinfo` VALUES ('22', 'werwer', 'sdfsfs', '1', '1', '1', '2017-07-05');
INSERT INTO `userinfo` VALUES ('23', 'werwer', 'sdfsfs', '1', '1', '1', '2017-07-05');
INSERT INTO `userinfo` VALUES ('24', 'werwer', 'sdfsfs', '1', '1', '1', '2017-07-05');
INSERT INTO `userinfo` VALUES ('25', 'werwer', 'sdfsfs', '1', '1', '1', '2017-07-05');
INSERT INTO `userinfo` VALUES ('26', 'werwer', 'sdfsfs', '1', '1', '1', '2017-07-05');
INSERT INTO `userinfo` VALUES ('27', 'werwer', 'sdfsfs', '1', '1', '1', '2017-07-05');
INSERT INTO `userinfo` VALUES ('28', 'werwer', 'sdfsfs', '1', '1', '1', '2017-07-05');
INSERT INTO `userinfo` VALUES ('30', 'sdfsdfsdf', 'sdfsfs', '1', '1', '1', '2017-07-05');
INSERT INTO `userinfo` VALUES ('31', 'sdfsfd', 'sdfsfs', '1', '1', '1', '2017-07-05');
INSERT INTO `userinfo` VALUES ('32', 'sdf', 'sdfsfs', '1', '1', '1', '2017-07-05');
INSERT INTO `userinfo` VALUES ('33', 'qweqweqwe', 'qweqweqw', '1', '2', '3', '2017-07-05');
INSERT INTO `userinfo` VALUES ('34', 'ttttttttttttt', 'tttttttttt', '2', '3', '5', '2017-07-21');
INSERT INTO `userinfo` VALUES ('35', 'ttttttttttttt', 'tttttttttt', '2', '3', '5', '2017-07-21');
INSERT INTO `userinfo` VALUES ('36', 'aaaaaaaaa', 'aaaaaaaaaa', '1', '2', '4', '2017-07-06');
INSERT INTO `userinfo` VALUES ('37', 'admin', 'adminadmin', '1', '1', '1', '2017-07-06');
INSERT INTO `userinfo` VALUES ('38', 'gggdfgdfgdfg', 'fghfgfg', '2', '4', '8', '2017-07-07');
