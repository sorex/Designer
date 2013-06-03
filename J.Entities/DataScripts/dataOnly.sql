/*
Navicat MySQL Data Transfer

Source Server         : MySQL(local)
Source Server Version : 50161
Source Host           : localhost:3306
Source Database       : designerdb

Target Server Type    : MYSQL
Target Server Version : 50199
File Encoding         : 65001

Date: 2013-06-03 23:51:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Records of addresses
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Records of designworks
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Records of materialcolors
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Records of materialpictures
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Records of materialpricelogs
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Records of materials
-- ----------------------------
BEGIN;
INSERT INTO `materials` VALUES ('LongRNeck', 'TShirt', '长袖圆领', '40.00000000', '详细', '2', '1'), ('LongVNeck', 'TShirt', '长袖V领', '40.00000000', '详细', '2', '1'), ('ShortRNeck', 'TShirt', '短袖圆领', '40.00000000', '详细', '2', '1'), ('ShortVNeck', 'TShirt', '短袖V领', '40.00000000', '详细', '2', '1');
COMMIT;

-- ----------------------------
-- Records of materialsizes
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Records of materialtypes
-- ----------------------------
BEGIN;
INSERT INTO `materialtypes` VALUES ('Clothes', null, '1', '上衣', '', '1'), ('TShirt', 'Clothes', '2', 'T恤', '', '1');
COMMIT;

-- ----------------------------
-- Records of orderdetails
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Records of orders
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Records of singlelogin
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES ('2d003b68-e1be-4bd0-8dd1-ec937acba83d', 'sorex@163.com', 'sorex@163.com', '8XGy06XKv+5g75/xEbvpwQ==', 'sorex', '2013-06-01 21:35:12', '0');
COMMIT;
