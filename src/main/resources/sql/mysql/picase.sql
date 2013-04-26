/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50610
 Source Host           : localhost
 Source Database       : picase

 Target Server Type    : MySQL
 Target Server Version : 50610
 File Encoding         : utf-8

 Date: 04/26/2013 12:47:52 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `tbl_album`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_album`;
CREATE TABLE `tbl_album` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `parent_menu` varchar(50) NOT NULL,
  `child_menu` varchar(50) DEFAULT NULL,
  `image_path` varchar(500) DEFAULT NULL,
  `origin_image` varchar(100) DEFAULT NULL,
  `thumb_image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `tbl_album`
-- ----------------------------
BEGIN;
INSERT INTO `tbl_album` VALUES ('1', '123123', 'undefined', 'undefined', null, null, null), ('2', '222', 'Wedding', 'Preparation', null, null, null), ('7', 'dd1', 'Corporate ', '', null, null, null), ('8', '123123', 'Corporate & Business', '', null, null, null), ('9', 'qq', 'Wedding', 'Reception', null, null, null), ('10', 'ww', 'Wedding', 'Ceremony', null, null, null), ('11', 'ee', 'Wedding', 'Preparation', null, null, null), ('12', 'rr', 'Wedding', 'Session', null, null, null), ('13', '2312', 'Corporate & Business', '', null, null, null), ('14', 'cc', 'Corporate & Business', 'conference', null, null, null), ('15', '444', 'Corporate & Business', 'Interiors & buildings', null, null, null), ('16', '555', 'Corporate & Business', 'Interiors & buildings', null, null, null), ('17', 'fs111', 'Fashion', 'Sessions', null, null, null), ('18', 'fe111', 'Fashion', 'Events', null, null, null), ('19', 'rrtt', 'Corporate & Business', 'Events', '/upload/files2013/04/17/', '1304172147124229.jpg', 't_1304172147124229.jpg'), ('20', 'ccc', 'Corporate & Business', 'Events', '/upload/files2013/04/17/', '1304172150156591.jpg', 't_1304172150156591.jpg'), ('21', 'fff', 'Corporate & Business', 'conference', '/upload/files2013/04/17/', '1304172150451179.jpg', 't_1304172150451179.jpg'), ('22', 'eee', 'Corporate & Business', 'Other', '/upload/files2013/04/17/', '130417215147108.jpeg', 't_130417215147108.jpeg'), ('23', 'ggg', 'Corporate & Business', 'Events', '/upload/files2013/04/17/', '1304172153234121.jpeg', 't_1304172153234121.jpeg'), ('24', 'hhh', 'Wedding', 'Session', '/upload/files2013/04/17/', '1304172154331501.jpeg', 't_1304172154331501.jpeg'), ('25', 'ddd', 'Corporate & Business', 'Events', '/upload/files2013/04/17/', '1304172212192565.jpg', 't_1304172212192565.jpg'), ('26', 'fff', 'Corporate & Business', 'Events', '/upload/files2013/04/17/', '1304172212283724.jpg', 't_1304172212283724.jpg'), ('27', 'ggg', 'Corporate & Business', 'Events', '/upload/files2013/04/17/', '1304172212407417.jpg', 't_1304172212407417.jpg'), ('28', 'qwe', 'Portrait', '', '/upload/files2013/04/18/', '1304180910389176.jpg', 't_1304180910389176.jpg');
COMMIT;

-- ----------------------------
--  Table structure for `tbl_menu`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_menu`;
CREATE TABLE `tbl_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(50) NOT NULL,
  `parent_menu` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `tbl_menu`
-- ----------------------------
BEGIN;
INSERT INTO `tbl_menu` VALUES ('1', 'Corporate & Business', '0'), ('2', 'conference', 'Corporate & Business'), ('3', 'Interiors & buildings', 'Corporate & Business'), ('4', 'Events', 'Corporate & Business'), ('5', 'Other', 'Corporate & Business'), ('6', 'Wedding', '0'), ('7', 'Session', 'Wedding'), ('8', 'Reception', 'Wedding'), ('9', 'Ceremony', 'Wedding'), ('10', 'Preparation', 'Wedding'), ('11', 'Sessions', 'Fashion'), ('12', 'Events', 'Fashion'), ('13', 'Portrait', '0'), ('14', 'Fashion', '0');
COMMIT;

-- ----------------------------
--  Table structure for `tbl_picture`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_picture`;
CREATE TABLE `tbl_picture` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `album_id` bigint(20) NOT NULL,
  `intro` varchar(5000) DEFAULT NULL,
  `image_path` varchar(500) DEFAULT NULL,
  `origin_name` varchar(200) DEFAULT NULL,
  `thumb_name` varchar(200) DEFAULT NULL,
  `slider_name` varchar(200) DEFAULT NULL,
  `show_index` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `tbl_picture`
-- ----------------------------
BEGIN;
INSERT INTO `tbl_picture` VALUES ('1', '2', '2312', null, '1304141639552719.jpg', 't_1304141639552719.jpg', 's_1304141639552719.jpg', null), ('3', '8', '123123222', '/upload/files2013/04/14/', '1304142021339571.jpg', 't_1304142021339571.jpg', 's_1304142021339571.jpg', null), ('5', '8', '33', '/upload/files2013/04/14/', '1304142029026777.jpg', 't_1304142029026777.jpg', 's_1304142029026777.jpg', null), ('6', '8', '33', '/upload/files2013/04/14/', '1304142029022546.jpg', 't_1304142029022546.jpg', 's_1304142029022546.jpg', null), ('7', '14', 'cc123', '/upload/files2013/04/15/', '130415161836254.png', 't_130415161836254.png', 's_130415161836254.png', null), ('8', '14', 'cc123', '/upload/files2013/04/15/', '1304151618368895.png', 't_1304151618368895.png', 's_1304151618368895.png', null), ('9', '14', 'cc123', '/upload/files2013/04/15/', '1304151618371531.png', 't_1304151618371531.png', 's_1304151618371531.png', null), ('10', '14', 'cc123', '/upload/files2013/04/15/', '1304151618375028.png', 't_1304151618375028.png', 's_1304151618375028.png', null), ('11', '15', '123123', '/upload/files2013/04/15/', '1304152130505871.png', 't_1304152130505871.png', 's_1304152130505871.png', null), ('12', '15', '123123', '/upload/files2013/04/15/', '1304152130509045.png', 't_1304152130509045.png', 's_1304152130509045.png', null), ('13', '13', '44', '/upload/files2013/04/15/', '1304152318122410.jpg', 't_1304152318122410.jpg', 's_1304152318122410.jpg', null), ('14', '13', '44', '/upload/files2013/04/15/', '1304152318122661.jpg', 't_1304152318122661.jpg', 's_1304152318122661.jpg', null), ('15', '8', 'eee', '/upload/files2013/04/15/', '1304152331104681.jpg', 't_1304152331104681.jpg', 's_1304152331104681.jpg', null), ('22', '8', 'rrr', '/upload/files2013/04/16/', '1304161010426650.jpg', 't_1304161010426650.jpg', 's_1304161010426650.jpg', null), ('23', '8', 'rrr', '/upload/files2013/04/16/', '1304161010421809.jpg', 't_1304161010421809.jpg', 's_1304161010421809.jpg', null), ('24', '8', 'rrr', '/upload/files2013/04/16/', '1304161010422879.jpg', 't_1304161010422879.jpg', 's_1304161010422879.jpg', null), ('25', '19', 'ttyyuu', '/upload/files2013/04/18/', '1304181657057089.jpg', 't_1304181657057089.jpg', 's_1304181657057089.jpg', '1'), ('26', '19', 'ttyyuu', '/upload/files2013/04/18/', '1304181657054454.jpg', 't_1304181657054454.jpg', 's_1304181657054454.jpg', '1'), ('27', '19', 'ttyyuu', '/upload/files2013/04/18/', '1304181657054848.jpg', 't_1304181657054848.jpg', 's_1304181657054848.jpg', '1'), ('28', '19', 'ttyyuu', '/upload/files2013/04/18/', '1304181657052671.jpg', 't_1304181657052671.jpg', 's_1304181657052671.jpg', null), ('29', '19', 'ttyyuuii', '/upload/files2013/04/18/', '1304181657582169.jpg', 't_1304181657582169.jpg', 's_1304181657582169.jpg', '1'), ('30', '19', 'ttyyuuii', '/upload/files2013/04/18/', '1304181657587520.jpg', 't_1304181657587520.jpg', 's_1304181657587520.jpg', '1'), ('31', '19', 'ttyyuuii', '/upload/files2013/04/18/', '1304181657587116.jpg', 't_1304181657587116.jpg', 's_1304181657587116.jpg', '1'), ('32', '19', 'ttyyuuii', '/upload/files2013/04/18/', '1304181657584115.jpg', 't_1304181657584115.jpg', 's_1304181657584115.jpg', '1'), ('33', '20', '444', '/upload/files2013/04/21/', '1304212107172534.jpg', 't_1304212107172534.jpg', 's_1304212107172534.jpg', '0'), ('34', '20', '444', '/upload/files2013/04/21/', '1304212107177268.jpg', 't_1304212107177268.jpg', 's_1304212107177268.jpg', '0'), ('35', '20', '444', '/upload/files2013/04/21/', '1304212107178055.jpg', 't_1304212107178055.jpg', 's_1304212107178055.jpg', '0'), ('36', '20', '444', '/upload/files2013/04/21/', '1304212107179774.jpg', 't_1304212107179774.jpg', 's_1304212107179774.jpg', '0');
COMMIT;

-- ----------------------------
--  Table structure for `tbl_task`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_task`;
CREATE TABLE `tbl_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=gbk ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Records of `tbl_task`
-- ----------------------------
BEGIN;
INSERT INTO `tbl_task` VALUES ('1', '132', 'dfsdfsdfsd', '1');
COMMIT;

-- ----------------------------
--  Table structure for `tbl_user`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `salt` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `roles` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `register_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_name` (`login_name`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=gbk ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Records of `tbl_user`
-- ----------------------------
BEGIN;
INSERT INTO `tbl_user` VALUES ('1', 'admin', 'admin', 'fdcbb421d39d235fa748dd88de55740a90a30658', '6a4e36bdf3c1c05c', 'admin', '2012-12-14 22:07:51'), ('2', 'user', 'user', 'cd3d7947ad540e53d24643d899ae0e9e93d09849', '76bccf1b1cd9b022', 'user', '2012-12-14 22:09:56');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
