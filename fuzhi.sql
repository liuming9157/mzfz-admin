/*
Navicat MySQL Data Transfer

Source Server         : lotus_page
Source Server Version : 50558
Source Host           : 182.61.54.187:3306
Source Database       : lotus_two

Target Server Type    : MYSQL
Target Server Version : 50558
File Encoding         : 65001

Date: 2018-01-02 22:38:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for lotus_admin_user
-- ----------------------------
DROP TABLE IF EXISTS `lotus_admin_user`;
CREATE TABLE `lotus_admin_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `sid` int(10) NOT NULL DEFAULT'-1' COMMENT '商家ID,-1是超级管理员，0是自营方',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '用户状态  1 正常  2 禁止',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of lotus_admin_user
-- ----------------------------
INSERT INTO `lotus_admin_user` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e','-1', '1', '2017-12-22 10:47:49','2017-12-22 10:47:49');
INSERT INTO `lotus_admin_user` VALUES ('2', 'pan1', 'e10adc3949ba59abbe56e057f20f883e', '0', '1', '2017-12-22 10:47:49','2017-12-22 10:47:49');
INSERT INTO `lotus_admin_user` VALUES ('3','store1', 'e10adc3949ba59abbe56e057f20f883e', '1', '1', '2017-12-22 10:47:49','2017-12-22 10:47:49' );




-- ----------------------------
-- Table structure for lotus_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `lotus_auth_group`;
CREATE TABLE `lotus_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` varchar(255) NOT NULL COMMENT '权限规则ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='权限组表';

-- ----------------------------
-- Records of lotus_auth_group
-- ----------------------------
INSERT INTO `lotus_auth_group` VALUES ('1', '技术维护', '1', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39');
INSERT INTO `lotus_auth_group` VALUES ('2', '自营', '1', '1,5,6,7,8,9,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39');
INSERT INTO `lotus_auth_group` VALUES ('3', '商家', '1', '1,5,9,24,28,29,30,31,32,33,34,35');


-- ----------------------------
-- Table structure for lotus_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `lotus_auth_group_access`;
CREATE TABLE `lotus_auth_group_access` (
  `uid` mediumint(8) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='权限组规则表';

-- ----------------------------
-- Records of lotus_auth_group_access
-- ----------------------------
INSERT INTO `lotus_auth_group_access` VALUES ('1', '1');
INSERT INTO `lotus_auth_group_access` VALUES ('2', '2');
INSERT INTO `lotus_auth_group_access` VALUES ('3', '3');


-- ----------------------------
-- Table structure for lotus_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `lotus_auth_rule`;
CREATE TABLE `lotus_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL DEFAULT '' COMMENT '控制器名称',
  `title` varchar(20) NOT NULL COMMENT'规则名称',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `pid` smallint(5) unsigned NOT NULL COMMENT '父级ID',
  `icon` varchar(50) DEFAULT '' COMMENT '图标',
  `sort` tinyint(4) unsigned NOT NULL COMMENT '排序',
  `condition` char(100) DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='规则表';

-- ----------------------------
-- Records of lotus_auth_rule
-- ----------------------------
-- -----
-- 一级菜单（仪表盘，后台权限，系统设置，日志，商品管理，商家管理，用户管理，APP设置）
-- -----
INSERT INTO `lotus_auth_rule` VALUES ('1', 'admin/index/default', '仪表盘', '1', '1', '0', 'fa fa-dashboard', '2', '');
INSERT INTO `lotus_auth_rule` VALUES ('2', 'admin/adminUser/default', '后台权限', '1', '1', '0', 'fa fa-user-circle-o', '0', '');
INSERT INTO `lotus_auth_rule` VALUES ('5', 'admin/product/default', '商品管理', '1', '1', '0', 'fa fa-table', '0', '');
INSERT INTO `lotus_auth_rule` VALUES ('6', 'admin/store/default', '商家管理', '1', '1', '0', 'fa fa-table', '0', '');
INSERT INTO `lotus_auth_rule` VALUES ('7', 'admin/user/default', '用户管理', '1', '1', '0', 'fa fa-table', '0', '');
INSERT INTO `lotus_auth_rule` VALUES ('8', 'admin/setting/default', 'APP设置', '1', '1', '0', 'fa fa-table', '0', '');
-- -----
-- 仪表盘（技术维护，自营，商家，index）
-- -----
INSERT INTO `lotus_auth_rule` VALUES ('9', 'admin/index/index', '控制面板', '1', '1', '1', 'fa fa-circle-o', '255', '');
-- --------------
-- 后台权限，系统设置，日志（技术维护，adminUser,system）
-- --------------
INSERT INTO `lotus_auth_rule` VALUES ('10','admin/adminUser/index', '管理员列表', '1', '1', '2', 'fa fa-dashboard', '0', '');
INSERT INTO `lotus_auth_rule` VALUES ('11', 'admin/adminUser/authList', '权限列表', '1', '1', '2', 'fa fa-users', '0', '');
INSERT INTO `lotus_auth_rule` VALUES ('12', 'admin/adminUser/roleList', '角色列表', '1', '1', '2', 'fa fa-dashboard', '0', '');

INSERT INTO `lotus_auth_rule` VALUES ('13', 'admin/adminUser/edit_user', '管理员编辑', '1', '1', '10', 'fa fa-circle-o', '0', '');
INSERT INTO `lotus_auth_rule` VALUES ('14', 'admin/adminUser/delete_user', '管理员删除', '1', '1', '10', 'fa fa-circle-o', '0', '');
INSERT INTO `lotus_auth_rule` VALUES ('15', 'admin/adminUser/add_user', '管理员新增', '1', '1', '10', 'fa fa-circle-o', '0', '');

INSERT INTO `lotus_auth_rule` VALUES ('16', 'admin/adminUser/add_menu', '增加权限', '1', '1', '11', 'fa fa-circle-o', '0', '');
INSERT INTO `lotus_auth_rule` VALUES ('17', 'admin/adminUser/edit_menu', '编辑权限', '1', '0', '11', 'fa fa-circle-o', '0', '');
INSERT INTO `lotus_auth_rule` VALUES ('18', 'admin/adminUser/deleteauthrule', '删除权限', '1', '0', '11', 'fa fa-circle-o', '0', '');
INSERT INTO `lotus_auth_rule` VALUES ('19', 'admin/adminUser/add_role', '新增角色', '1', '0', '12', 'fa fa-circle-o', '0', '');
INSERT INTO `lotus_auth_rule` VALUES ('20', 'admin/adminUser/delete_role', '删除角色', '1', '1', '12', 'fa fa-circle-o', '0', '');
INSERT INTO `lotus_auth_rule` VALUES ('21', 'admin/adminUser/auth', '角色授权', '1', '0', '12', 'fa fa-circle-o', '0', '');



-- -----
-- 商品管理（技术维护，自营，商家，product）
-- -----
INSERT INTO `lotus_auth_rule` VALUES ('24', 'admin/product/index', '商品列表', '1', '1', '5', 'fa fa-circle-o', '0', '');
INSERT INTO `lotus_auth_rule` VALUES ('28', 'admin/product/order', '订单列表', '1', '1', '5', 'fa fa-circle-o', '0', '');
INSERT INTO `lotus_auth_rule` VALUES ('29', 'admin/product/add_show', '增加商品', '1', '0', '24', 'fa fa-circle-o', '0', '');
INSERT INTO `lotus_auth_rule` VALUES ('30', 'admin/product/edit_show', '编辑商品', '1', '0', '24', 'fa fa-circle-o', '0', '');
INSERT INTO `lotus_auth_rule` VALUES ('31', 'admin/product/add', '增加商品', '1', '0', '24', 'fa fa-circle-o', '0', '');
INSERT INTO `lotus_auth_rule` VALUES ('32', 'admin/product/edit', '编辑商品', '1', '0', '24', 'fa fa-circle-o', '0', '');
INSERT INTO `lotus_auth_rule` VALUES ('33', 'admin/product/show1', '获取商品列表', '1', '0', '24', 'fa fa-circle-o', '0', '');
INSERT INTO `lotus_auth_rule` VALUES ('34', 'admin/product/show2', '获取订单列表', '1', '0', '24', 'fa fa-circle-o', '0', '');
INSERT INTO `lotus_auth_rule` VALUES ('35', 'admin/product/show3', '获取商品信息', '1', '0', '24', 'fa fa-circle-o', '0', '');




-- -----
-- 商家管理（技术维护，自营,store）
-- -----
INSERT INTO `lotus_auth_rule` VALUES ('25', 'admin/store/index', '商家列表', '1', '1', '6', 'fa fa-circle-o', '0', '');
-- -----
-- 用户管理（技术维护，自营,user）
-- -----
INSERT INTO `lotus_auth_rule` VALUES ('26', 'admin/user/index', '用户列表', '1', '1', '7', 'fa fa-circle-o', '0', '');
INSERT INTO `lotus_auth_rule` VALUES ('36', 'admin/user/fenxiao', '分销用户', '1', '1', '7', 'fa fa-circle-o', '0', '');
INSERT INTO `lotus_auth_rule` VALUES ('37', 'admin/user/able', '启用禁用', '1', '1', '26', 'fa fa-circle-o', '0', '');
INSERT INTO `lotus_auth_rule` VALUES ('38', 'admin/user/show', '获取用户列表', '1', '1', '36', 'fa fa-circle-o', '0', '');
INSERT INTO `lotus_auth_rule` VALUES ('39', 'admin/user/fenxiao_show', '获取分销用户', '1', '1', '36', 'fa fa-circle-o', '0', '');
-- -----
-- APP设置（技术维护，自营,setting）
-- -----
INSERT INTO `lotus_auth_rule` VALUES ('27', 'admin/setting/index', 'APP设置', '1', '1', '8', 'fa fa-circle-o', '0', '');









-- ----------------------------
-- 新增添表
-- ----------------------------

-- ----------------------------
-- Table structure for lotus_user
-- ----------------------------
DROP TABLE IF EXISTS `lotus_user`;
CREATE TABLE `lotus_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `open_id` varchar(50) NOT NULL COMMENT 'open_id',
  `union_id` varchar(50) NOT NULL COMMENT 'union_id',
  `nick_name` varchar(11) DEFAULT '' COMMENT '微信昵称',
  `avatar_url` varchar(50) DEFAULT '' COMMENT '微信头像',
  `phone` varchar(50) DEFAULT '' COMMENT '手机',
  `is_fx` varchar(50) DEFAULT '' COMMENT '是否分销1是2不是',
  `coupon_id` varchar(50) DEFAULT '' COMMENT '优惠券',
  `qb` varchar(50) DEFAULT '' COMMENT '抢购',
  `sid` int(10) DEFAULT '0' COMMENT '商家ID',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '用户状态  1 正常  2 禁止',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
 
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='用户表';
-- ----------------------------
-- Table structure for lotus_address
-- ----------------------------
DROP TABLE IF EXISTS `lotus_address`;
CREATE TABLE `lotus_address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) NOT NULL COMMENT '用户名',
  `address` varchar(50) DEFAULT '' COMMENT '邮箱',
  `phone` varchar(50) DEFAULT '' COMMENT '邮箱',
  `name` varchar(50) DEFAULT '' COMMENT '收货人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
 
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='收货地址表';
-- ----------------------------
-- Table structure for lotus_order
-- ----------------------------
DROP TABLE IF EXISTS `lotus_order`;
CREATE TABLE `lotus_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL COMMENT '用户ID',
  `sid` int(10) NOT NULL COMMENT '商家ID',
   `plist` varchar(50) NOT NULL COMMENT '商品清单（名称x数量）',
    `address` varchar(10) NOT NULL COMMENT '地址ID',
	`cash` varchar(50) NOT NULL COMMENT '付款金额',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
 
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='收货地址表';
-- ----------------------------
-- Table structure for lotus_cart
-- ----------------------------
DROP TABLE IF EXISTS `lotus_cart`;
CREATE TABLE `lotus_cart` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) NOT NULL COMMENT '用户ID',
   `pid` varchar(50) NOT NULL COMMENT '商品ID',
   `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
 
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='购物车';
-- ----------------------------
-- Table structure for lotus_collection
-- ----------------------------
DROP TABLE IF EXISTS `lotus_collection`;
CREATE TABLE `lotus_collection` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) NOT NULL COMMENT '用户ID',
   `pid` varchar(50) NOT NULL COMMENT '商品ID',
   `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
 
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='收藏列表';
-- ----------------------------
-- Table structure for lotus_budget
-- ----------------------------
DROP TABLE IF EXISTS `lotus_budget`;
CREATE TABLE `lotus_budget` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) NOT NULL COMMENT '用户ID',
   `total` varchar(50) NOT NULL COMMENT '商品ID',
   `price1` varchar(50) NOT NULL COMMENT '商品ID',
   `price2` varchar(50) NOT NULL COMMENT '商品ID', 
   `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
 
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='我的预算';
-- ----------------------------
-- Table structure for lotus_store
-- ----------------------------
DROP TABLE IF EXISTS `lotus_store`;
CREATE TABLE `lotus_store` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '商家名称',
   `logo` varchar(50) NOT NULL COMMENT '商家Logo',
   `phone` varchar(50) NOT NULL COMMENT '商家电话',
   `address` varchar(50) NOT NULL COMMENT '商家地址', 
   `status`  tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '商家状态，1审核通过，2待审核', 
   `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='商家';

-- ----------------------------
-- Records of lotus_store
-- ----------------------------
INSERT INTO `lotus_store` VALUES ('1', '测试商家1','logo','13366093620','北京', '1', '2017-12-22 10:47:49','2017-12-22 10:47:49');
-- ----------------------------
-- Table structure for lotus_product
-- ----------------------------
DROP TABLE IF EXISTS `lotus_product`;
CREATE TABLE `lotus_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sid` int(10) NOT NULL DEFAULT'0' COMMENT '所属商家,0表示自营',
   `type` varchar(50) NOT NULL COMMENT '商品种类',
   `name` varchar(50) NOT NULL COMMENT '商品名称',
   `price` varchar(50) NOT NULL COMMENT '商品价格', 
    `price1` varchar(50) NOT NULL COMMENT '商品原价', 
	`img` arry(50) NOT NULL COMMENT '商品图片', 
	`detail` varchar(50) NOT NULL COMMENT '商品描述', 
   `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '商品状态，1上架，2下架', 
    `pt` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否拼团，1是，2否', 
	`jz` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否集赞，1是，2否', 
	`ms` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否秒杀，1是，2否', 
	`fx` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否分销，1是，2否', 
	`update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='商品列表';
-- ----------------------------
-- Table structure for lotus_setting
-- ----------------------------
DROP TABLE IF EXISTS `lotus_setting`;
CREATE TABLE `lotus_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pop_img` varchar(50) COMMENT '弹出图片地址',
   `kp_img` varchar(50)  COMMENT '开屏图片地址',
   `kf_tel` varchar(50)  COMMENT '客服电话',
   `about_us` varchar(50)  COMMENT '关于我们', 
    `info` varchar(50)  COMMENT '信息介绍', 
	
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='APP设置';
-- ----------------------------
-- Table structure for lotus_swiper
-- ----------------------------
DROP TABLE IF EXISTS `lotus_swiper`;
CREATE TABLE `lotus_swiper` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `src` varchar(50) NOT NULL COMMENT '图片地址',
   `target` varchar(50)  COMMENT '跳转目标',
   `update_time` datetime DEFAULT NULL COMMENT '更新时间',
   `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='轮播图设置';
-- ----------------------------
DROP TABLE IF EXISTS `lotus_fx`;
CREATE TABLE `lotus_fx` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) NOT NULL COMMENT '分销商品ID',
   `uid1` int(10) NOT NULL COMMENT '分销者ID',
   `uid2` int(10) NOT NULL COMMENT '购买者ID',
   `price` varchar(50) NOT NULL COMMENT '商品价格', 
   `status`  tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '商家状态，1审核通过，2待审核', 
   `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='分销列表';

-- ----------------------------
-- Records of lotus_fx
-- ----------------------------
-- ----------------------------
