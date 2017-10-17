/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50547
Source Host           : localhost:3306
Source Database       : minidingcan

Target Server Type    : MYSQL
Target Server Version : 50547
File Encoding         : 65001

Date: 2017-09-09 14:25:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `lr_activity`
-- ----------------------------
DROP TABLE IF EXISTS `lr_activity`;
CREATE TABLE `lr_activity` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '商家活动表',
  `cid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '分类ID',
  `name` varchar(50) NOT NULL COMMENT '活动标题',
  `digest` varchar(255) DEFAULT NULL COMMENT '活动摘要',
  `content` text COMMENT '活动内容',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '发表时间',
  `click` int(11) NOT NULL DEFAULT '0' COMMENT '点击量',
  `pinglun` int(11) NOT NULL DEFAULT '0' COMMENT '评论数量',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `photo` varchar(100) DEFAULT NULL COMMENT '简介图片',
  `source` varchar(20) DEFAULT NULL COMMENT '来源',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of lr_activity
-- ----------------------------
INSERT INTO `lr_activity` VALUES ('1', '0', '庆国庆 迎中秋 优惠活动多多', '庆国庆 迎中秋 优惠活动多多 本店消费送礼物', '庆国庆 迎中秋 优惠活动多多 本店消费送礼物庆国庆 迎中秋 优惠活动多多 本店消费送礼物庆国庆 迎中秋 优惠活动多多 本店消费送礼物庆国庆 迎中秋 优惠活动多多 本店消费送礼物庆国庆 迎中秋 优惠活动多多 本店消费送礼物庆国庆 迎中秋 优惠活动多多 本店消费送礼物庆国庆 迎中秋 优惠活动多多 本店消费送礼物庆国庆 迎中秋 优惠活动多多 本店消费送礼物庆国庆 迎中秋 优惠活动多多 本店消费送礼物庆国庆 迎中秋 优惠活动多多 本店消费送礼物庆国庆 迎中秋 优惠活动多多 本店消费送礼物庆国庆 迎中秋 优惠活动多多 本店消费送礼物庆国庆 迎中秋 优惠活动多多 本店消费送礼物庆国庆 迎中秋 优惠活动多多 本店消费送礼物庆国庆 迎中秋 优惠活动多多 本店消费送礼物庆国庆 迎中秋 优惠活动多多 本店消费送礼物', '1504168431', '10', '0', '1', 'UploadFiles/activity/20170831/1504168431235847.jpg', '本网');

-- ----------------------------
-- Table structure for `lr_address`
-- ----------------------------
DROP TABLE IF EXISTS `lr_address`;
CREATE TABLE `lr_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '地址id',
  `name` varchar(10) NOT NULL COMMENT '收货人',
  `tel` char(15) NOT NULL COMMENT '联系方式',
  `sheng` int(11) NOT NULL DEFAULT '0' COMMENT '省id',
  `city` int(11) NOT NULL DEFAULT '0' COMMENT '市id',
  `quyu` int(11) NOT NULL DEFAULT '0' COMMENT '区域id',
  `address` varchar(255) NOT NULL COMMENT '收货地址（不加省市区）',
  `address_xq` varchar(255) NOT NULL COMMENT '省市区+详细地址',
  `code` int(11) NOT NULL DEFAULT '0' COMMENT '邮政编号',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `is_default` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否默认地址 1默认',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户收货地址表';

-- ----------------------------
-- Records of lr_address
-- ----------------------------
INSERT INTO `lr_address` VALUES ('10', '传承', '13699887744', '632', '670', '673', '阿虎地方可能卡萨丁你', '吉林省 通化市 二道江区 阿虎地方可能卡萨丁你', '220503', '1', '1');
INSERT INTO `lr_address` VALUES ('2', '小花妹妹', '15324466594', '2151', '2152', '2158', '白云大道北的楷模符合你', '广东省 广州市 白云区 白云大道北的楷模符合你', '440111', '1', '0');
INSERT INTO `lr_address` VALUES ('6', '小小花', '13555889966', '632', '656', '663', '啥时开发开始的烦恼是看得见看电视', '吉林省 四平市 双辽市 啥时开发开始的烦恼是看得见看电视', '220382', '1', '0');
INSERT INTO `lr_address` VALUES ('5', '小小', '13455882266', '1023', '1125', '1127', '什么街道什么路什么号什么附近', '浙江省 丽水市 莲都区 什么街道什么路什么号什么附近', '331102', '1', '0');
INSERT INTO `lr_address` VALUES ('11', '测试', '13588774411', '43', '115', '121', '似懂非懂V型从vzdv十多个DGVI', '河北省 邢台市 内丘县 似懂非懂V型从vzdv十多个DGVI', '130523', '3', '0');
INSERT INTO `lr_address` VALUES ('12', '旺旺', '13500002222', '632', '679', '683', '似懂非懂北国风光那个发给你发给你都发给你', '吉林省 白山市 抚松县 似懂非懂北国风光那个发给你发给你都发给你', '220621', '3', '1');

-- ----------------------------
-- Table structure for `lr_adminuser`
-- ----------------------------
DROP TABLE IF EXISTS `lr_adminuser`;
CREATE TABLE `lr_adminuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户表：包括后台管理员、商家会员和普通会员',
  `name` varchar(20) NOT NULL COMMENT '登陆账号',
  `uname` varchar(10) DEFAULT NULL COMMENT '昵称',
  `pwd` varchar(50) NOT NULL COMMENT 'MD5密码',
  `qx` tinyint(4) NOT NULL DEFAULT '5' COMMENT '权限 4超级管理员 5普通管理员',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '创建日期',
  `del` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of lr_adminuser
-- ----------------------------
INSERT INTO `lr_adminuser` VALUES ('1', 'admin', '超级管理员', '0b77520f93de693bdab0060746e38165', '4', '1375086480', '0');
INSERT INTO `lr_adminuser` VALUES ('2', 'ceshi', '普通管理员', '14e1b600b1fd579f47433b88e8d85291', '5', '1493262002', '1');
INSERT INTO `lr_adminuser` VALUES ('3', 'ceshi2', '普通管理员', '550e1bafe077ff0b0b67f4e32f29d751', '5', '1493262042', '0');

-- ----------------------------
-- Table structure for `lr_book`
-- ----------------------------
DROP TABLE IF EXISTS `lr_book`;
CREATE TABLE `lr_book` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '预订表',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '会员ID',
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `tel` char(15) NOT NULL COMMENT '电话号码',
  `thetime` int(11) NOT NULL DEFAULT '0' COMMENT '用餐日期',
  `mealtime` int(11) DEFAULT NULL COMMENT '用餐时段ID',
  `arrive` char(20) DEFAULT NULL COMMENT '预计到店',
  `people` int(5) NOT NULL DEFAULT '0' COMMENT '用餐人数',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `tablenum` int(11) DEFAULT '0' COMMENT '桌号',
  `state` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态 1正常 2',
  `addtime` int(11) DEFAULT '0' COMMENT '预订时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lr_book
-- ----------------------------
INSERT INTO `lr_book` VALUES ('1', '3', '测试', '13566441122', '1504627200', '3', '18:30', '6', '数据测试！', '0', '1', '0');
INSERT INTO `lr_book` VALUES ('2', '3', '王伟伟', '13522888888', '1504713600', '3', '18:12', '4', '四个人', '0', '1', '0');

-- ----------------------------
-- Table structure for `lr_china_city`
-- ----------------------------
DROP TABLE IF EXISTS `lr_china_city`;
CREATE TABLE `lr_china_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `tid` int(11) DEFAULT '0' COMMENT '父级id',
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `head` varchar(1) DEFAULT NULL,
  `type` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3537 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='中国省市区地址联动表';

-- ----------------------------
-- Records of lr_china_city
-- ----------------------------
INSERT INTO `lr_china_city` VALUES ('1', '0', '北京', '110000', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('2', '1', '北京', '110100', 'B', '1');
INSERT INTO `lr_china_city` VALUES ('3', '2', '东城区', '110101', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('4', '2', '西城区', '110102', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('5', '2', '崇文区', '110103', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('6', '2', '宣武区', '110104', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('7', '2', '朝阳区', '110105', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('8', '2', '丰台区', '110106', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('9', '2', '石景山区', '110107', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('10', '2', '海淀区', '110108', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('11', '2', '门头沟区', '110109', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('12', '2', '房山区', '110111', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('13', '2', '通州区', '110112', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('14', '2', '顺义区', '110113', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('15', '2', '昌平区', '110114', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('16', '2', '大兴区', '110115', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('17', '2', '怀柔区', '110116', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('18', '2', '平谷区', '110117', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('19', '1', '县', '110200', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('20', '19', '密云县', '110228', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('21', '19', '延庆县', '110229', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('22', '0', '天津', '120000', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('23', '22', '天津', '120100', 'T', '1');
INSERT INTO `lr_china_city` VALUES ('24', '23', '和平区', '120101', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('25', '23', '河东区', '120102', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('26', '23', '河西区', '120103', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('27', '23', '南开区', '120104', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('28', '23', '河北区', '120105', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('29', '23', '红桥区', '120106', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('30', '23', '塘沽区', '120107', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('31', '23', '汉沽区', '120108', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('32', '23', '大港区', '120109', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('33', '23', '东丽区', '120110', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('34', '23', '西青区', '120111', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('35', '23', '津南区', '120112', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('36', '23', '北辰区', '120113', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('37', '23', '武清区', '120114', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('38', '23', '宝坻区', '120115', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('39', '22', '县', '120200', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('40', '39', '宁河县', '120221', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('41', '39', '静海县', '120223', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('42', '39', '蓟县', '120225', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('43', '0', '河北省', '130000', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('44', '43', '石家庄市', '130100', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('46', '44', '长安区', '130102', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('47', '44', '桥东区', '130103', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('48', '44', '桥西区', '130104', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('49', '44', '新华区', '130105', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('50', '44', '井陉矿区', '130107', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('51', '44', '裕华区', '130108', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('52', '44', '井陉县', '130121', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('53', '44', '正定县', '130123', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('54', '44', '栾城县', '130124', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('55', '44', '行唐县', '130125', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('56', '44', '灵寿县', '130126', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('57', '44', '高邑县', '130127', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('58', '44', '深泽县', '130128', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('59', '44', '赞皇县', '130129', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('60', '44', '无极县', '130130', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('61', '44', '平山县', '130131', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('62', '44', '元氏县', '130132', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('63', '44', '赵县', '130133', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('64', '44', '辛集市', '130181', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('65', '44', '藁城市', '130182', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('66', '44', '晋州市', '130183', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('67', '44', '新乐市', '130184', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('68', '44', '鹿泉市', '130185', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('69', '43', '唐山市', '130200', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('71', '69', '路南区', '130202', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('72', '69', '路北区', '130203', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('73', '69', '古冶区', '130204', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('74', '69', '开平区', '130205', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('75', '69', '丰南区', '130207', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('76', '69', '丰润区', '130208', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('77', '69', '滦县', '130223', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('78', '69', '滦南县', '130224', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('79', '69', '乐亭县', '130225', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('80', '69', '迁西县', '130227', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('81', '69', '玉田县', '130229', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('82', '69', '唐海县', '130230', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('83', '69', '遵化市', '130281', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('84', '69', '迁安市', '130283', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('85', '43', '秦皇岛市', '130300', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('87', '85', '海港区', '130302', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('88', '85', '山海关区', '130303', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('89', '85', '北戴河区', '130304', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('90', '85', '青龙满族自治县', '130321', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('91', '85', '昌黎县', '130322', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('92', '85', '抚宁县', '130323', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('93', '85', '卢龙县', '130324', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('94', '43', '邯郸市', '130400', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('96', '94', '邯山区', '130402', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('97', '94', '丛台区', '130403', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('98', '94', '复兴区', '130404', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('99', '94', '峰峰矿区', '130406', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('100', '94', '邯郸县', '130421', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('101', '94', '临漳县', '130423', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('102', '94', '成安县', '130424', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('103', '94', '大名县', '130425', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('104', '94', '涉县', '130426', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('105', '94', '磁县', '130427', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('106', '94', '肥乡县', '130428', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('107', '94', '永年县', '130429', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('108', '94', '邱县', '130430', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('109', '94', '鸡泽县', '130431', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('110', '94', '广平县', '130432', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('111', '94', '馆陶县', '130433', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('112', '94', '魏县', '130434', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('113', '94', '曲周县', '130435', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('114', '94', '武安市', '130481', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('115', '43', '邢台市', '130500', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('117', '115', '桥东区', '130502', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('118', '115', '桥西区', '130503', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('119', '115', '邢台县', '130521', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('120', '115', '临城县', '130522', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('121', '115', '内丘县', '130523', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('122', '115', '柏乡县', '130524', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('123', '115', '隆尧县', '130525', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('124', '115', '任县', '130526', 'R', '0');
INSERT INTO `lr_china_city` VALUES ('125', '115', '南和县', '130527', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('126', '115', '宁晋县', '130528', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('127', '115', '巨鹿县', '130529', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('128', '115', '新河县', '130530', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('129', '115', '广宗县', '130531', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('130', '115', '平乡县', '130532', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('131', '115', '威县', '130533', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('132', '115', '清河县', '130534', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('133', '115', '临西县', '130535', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('134', '115', '南宫市', '130581', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('135', '115', '沙河市', '130582', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('136', '43', '保定市', '130600', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('138', '136', '新市区', '130602', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('139', '136', '北市区', '130603', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('140', '136', '南市区', '130604', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('141', '136', '满城县', '130621', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('142', '136', '清苑县', '130622', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('143', '136', '涞水县', '130623', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('144', '136', '阜平县', '130624', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('145', '136', '徐水县', '130625', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('146', '136', '定兴县', '130626', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('147', '136', '唐县', '130627', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('148', '136', '高阳县', '130628', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('149', '136', '容城县', '130629', 'R', '0');
INSERT INTO `lr_china_city` VALUES ('150', '136', '涞源县', '130630', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('151', '136', '望都县', '130631', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('152', '136', '安新县', '130632', 'A', '0');
INSERT INTO `lr_china_city` VALUES ('153', '136', '易县', '130633', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('154', '136', '曲阳县', '130634', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('155', '136', '蠡县', '130635', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('156', '136', '顺平县', '130636', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('157', '136', '博野县', '130637', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('158', '136', '雄县', '130638', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('159', '136', '涿州市', '130681', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('160', '136', '定州市', '130682', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('161', '136', '安国市', '130683', 'A', '0');
INSERT INTO `lr_china_city` VALUES ('162', '136', '高碑店市', '130684', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('163', '43', '张家口市', '130700', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('165', '163', '桥东区', '130702', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('166', '163', '桥西区', '130703', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('167', '163', '宣化区', '130705', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('168', '163', '下花园区', '130706', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('169', '163', '宣化县', '130721', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('170', '163', '张北县', '130722', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('171', '163', '康保县', '130723', 'K', '0');
INSERT INTO `lr_china_city` VALUES ('172', '163', '沽源县', '130724', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('173', '163', '尚义县', '130725', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('174', '163', '蔚县', '130726', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('175', '163', '阳原县', '130727', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('176', '163', '怀安县', '130728', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('177', '163', '万全县', '130729', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('178', '163', '怀来县', '130730', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('179', '163', '涿鹿县', '130731', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('180', '163', '赤城县', '130732', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('181', '163', '崇礼县', '130733', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('182', '43', '承德市', '130800', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('184', '182', '双桥区', '130802', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('185', '182', '双滦区', '130803', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('186', '182', '鹰手营子矿区', '130804', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('187', '182', '承德县', '130821', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('188', '182', '兴隆县', '130822', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('189', '182', '平泉县', '130823', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('190', '182', '滦平县', '130824', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('191', '182', '隆化县', '130825', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('192', '182', '丰宁满族自治县', '130826', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('193', '182', '宽城满族自治县', '130827', 'K', '0');
INSERT INTO `lr_china_city` VALUES ('194', '182', '围场满族蒙古族自治县', '130828', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('195', '43', '沧州市', '130900', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('197', '195', '新华区', '130902', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('198', '195', '运河区', '130903', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('199', '195', '沧县', '130921', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('200', '195', '青县', '130922', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('201', '195', '东光县', '130923', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('202', '195', '海兴县', '130924', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('203', '195', '盐山县', '130925', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('204', '195', '肃宁县', '130926', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('205', '195', '南皮县', '130927', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('206', '195', '吴桥县', '130928', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('207', '195', '献县', '130929', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('208', '195', '孟村回族自治县', '130930', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('209', '195', '泊头市', '130981', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('210', '195', '任丘市', '130982', 'R', '0');
INSERT INTO `lr_china_city` VALUES ('211', '195', '黄骅市', '130983', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('212', '195', '河间市', '130984', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('213', '43', '廊坊市', '131000', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('215', '213', '安次区', '131002', 'A', '0');
INSERT INTO `lr_china_city` VALUES ('216', '213', '广阳区', '131003', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('217', '213', '固安县', '131022', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('218', '213', '永清县', '131023', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('219', '213', '香河县', '131024', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('220', '213', '大城县', '131025', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('221', '213', '文安县', '131026', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('222', '213', '大厂回族自治县', '131028', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('223', '213', '霸州市', '131081', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('224', '213', '三河市', '131082', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('225', '43', '衡水市', '131100', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('227', '225', '桃城区', '131102', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('228', '225', '枣强县', '131121', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('229', '225', '武邑县', '131122', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('230', '225', '武强县', '131123', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('231', '225', '饶阳县', '131124', 'R', '0');
INSERT INTO `lr_china_city` VALUES ('232', '225', '安平县', '131125', 'A', '0');
INSERT INTO `lr_china_city` VALUES ('233', '225', '故城县', '131126', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('234', '225', '景县', '131127', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('235', '225', '阜城县', '131128', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('236', '225', '冀州市', '131181', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('237', '225', '深州市', '131182', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('238', '0', '山西省', '140000', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('239', '238', '太原市', '140100', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('241', '239', '小店区', '140105', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('242', '239', '迎泽区', '140106', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('243', '239', '杏花岭区', '140107', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('244', '239', '尖草坪区', '140108', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('245', '239', '万柏林区', '140109', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('246', '239', '晋源区', '140110', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('247', '239', '清徐县', '140121', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('248', '239', '阳曲县', '140122', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('249', '239', '娄烦县', '140123', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('250', '239', '古交市', '140181', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('251', '238', '大同市', '140200', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('253', '251', '城区', '140202', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('254', '251', '矿区', '140203', 'K', '0');
INSERT INTO `lr_china_city` VALUES ('255', '251', '南郊区', '140211', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('256', '251', '新荣区', '140212', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('257', '251', '阳高县', '140221', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('258', '251', '天镇县', '140222', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('259', '251', '广灵县', '140223', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('260', '251', '灵丘县', '140224', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('261', '251', '浑源县', '140225', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('262', '251', '左云县', '140226', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('263', '251', '大同县', '140227', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('264', '238', '阳泉市', '140300', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('266', '264', '城区', '140302', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('267', '264', '矿区', '140303', 'K', '0');
INSERT INTO `lr_china_city` VALUES ('268', '264', '郊区', '140311', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('269', '264', '平定县', '140321', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('270', '264', '盂县', '140322', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('271', '238', '长治市', '140400', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('273', '271', '城区', '140402', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('274', '271', '郊区', '140411', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('275', '271', '长治县', '140421', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('276', '271', '襄垣县', '140423', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('277', '271', '屯留县', '140424', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('278', '271', '平顺县', '140425', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('279', '271', '黎城县', '140426', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('280', '271', '壶关县', '140427', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('281', '271', '长子县', '140428', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('282', '271', '武乡县', '140429', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('283', '271', '沁县', '140430', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('284', '271', '沁源县', '140431', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('285', '271', '潞城市', '140481', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('286', '238', '晋城市', '140500', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('288', '286', '城区', '140502', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('289', '286', '沁水县', '140521', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('290', '286', '阳城县', '140522', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('291', '286', '陵川县', '140524', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('292', '286', '泽州县', '140525', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('293', '286', '高平市', '140581', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('294', '238', '朔州市', '140600', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('296', '294', '朔城区', '140602', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('297', '294', '平鲁区', '140603', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('298', '294', '山阴县', '140621', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('299', '294', '应县', '140622', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('300', '294', '右玉县', '140623', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('301', '294', '怀仁县', '140624', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('302', '238', '晋中市', '140700', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('304', '302', '榆次区', '140702', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('305', '302', '榆社县', '140721', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('306', '302', '左权县', '140722', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('307', '302', '和顺县', '140723', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('308', '302', '昔阳县', '140724', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('309', '302', '寿阳县', '140725', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('310', '302', '太谷县', '140726', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('311', '302', '祁县', '140727', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('312', '302', '平遥县', '140728', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('313', '302', '灵石县', '140729', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('314', '302', '介休市', '140781', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('315', '238', '运城市', '140800', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('317', '315', '盐湖区', '140802', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('318', '315', '临猗县', '140821', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('319', '315', '万荣县', '140822', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('320', '315', '闻喜县', '140823', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('321', '315', '稷山县', '140824', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('322', '315', '新绛县', '140825', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('323', '315', '绛县', '140826', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('324', '315', '垣曲县', '140827', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('325', '315', '夏县', '140828', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('326', '315', '平陆县', '140829', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('327', '315', '芮城县', '140830', 'R', '0');
INSERT INTO `lr_china_city` VALUES ('328', '315', '永济市', '140881', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('329', '315', '河津市', '140882', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('330', '238', '忻州市', '140900', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('332', '330', '忻府区', '140902', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('333', '330', '定襄县', '140921', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('334', '330', '五台县', '140922', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('335', '330', '代县', '140923', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('336', '330', '繁峙县', '140924', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('337', '330', '宁武县', '140925', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('338', '330', '静乐县', '140926', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('339', '330', '神池县', '140927', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('340', '330', '五寨县', '140928', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('341', '330', '岢岚县', '140929', 'K', '0');
INSERT INTO `lr_china_city` VALUES ('342', '330', '河曲县', '140930', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('343', '330', '保德县', '140931', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('344', '330', '偏关县', '140932', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('345', '330', '原平市', '140981', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('346', '238', '临汾市', '141000', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('348', '346', '尧都区', '141002', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('349', '346', '曲沃县', '141021', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('350', '346', '翼城县', '141022', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('351', '346', '襄汾县', '141023', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('352', '346', '洪洞县', '141024', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('353', '346', '古县', '141025', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('354', '346', '安泽县', '141026', 'A', '0');
INSERT INTO `lr_china_city` VALUES ('355', '346', '浮山县', '141027', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('356', '346', '吉县', '141028', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('357', '346', '乡宁县', '141029', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('358', '346', '大宁县', '141030', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('359', '346', '隰县', '141031', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('360', '346', '永和县', '141032', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('361', '346', '蒲县', '141033', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('362', '346', '汾西县', '141034', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('363', '346', '侯马市', '141081', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('364', '346', '霍州市', '141082', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('365', '238', '吕梁市', '141100', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('367', '365', '离石区', '141102', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('368', '365', '文水县', '141121', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('369', '365', '交城县', '141122', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('370', '365', '兴县', '141123', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('371', '365', '临县', '141124', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('372', '365', '柳林县', '141125', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('373', '365', '石楼县', '141126', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('374', '365', '岚县', '141127', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('375', '365', '方山县', '141128', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('376', '365', '中阳县', '141129', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('377', '365', '交口县', '141130', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('378', '365', '孝义市', '141181', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('379', '365', '汾阳市', '141182', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('380', '0', '内蒙古自治区', '150000', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('381', '380', '呼和浩特市', '150100', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('383', '381', '新城区', '150102', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('384', '381', '回民区', '150103', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('385', '381', '玉泉区', '150104', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('386', '381', '赛罕区', '150105', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('387', '381', '土默特左旗', '150121', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('388', '381', '托克托县', '150122', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('389', '381', '和林格尔县', '150123', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('390', '381', '清水河县', '150124', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('391', '381', '武川县', '150125', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('392', '380', '包头市', '150200', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('394', '392', '东河区', '150202', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('395', '392', '昆都仑区', '150203', 'K', '0');
INSERT INTO `lr_china_city` VALUES ('396', '392', '青山区', '150204', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('397', '392', '石拐区', '150205', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('398', '392', '白云鄂博矿区', '150206', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('399', '392', '九原区', '150207', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('400', '392', '土默特右旗', '150221', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('401', '392', '固阳县', '150222', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('402', '392', '达尔罕茂明安联合旗', '150223', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('403', '380', '乌海市', '150300', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('405', '403', '海勃湾区', '150302', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('406', '403', '海南区', '150303', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('407', '403', '乌达区', '150304', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('408', '380', '赤峰市', '150400', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('410', '408', '红山区', '150402', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('411', '408', '元宝山区', '150403', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('412', '408', '松山区', '150404', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('413', '408', '阿鲁科尔沁旗', '150421', 'A', '0');
INSERT INTO `lr_china_city` VALUES ('414', '408', '巴林左旗', '150422', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('415', '408', '巴林右旗', '150423', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('416', '408', '林西县', '150424', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('417', '408', '克什克腾旗', '150425', 'K', '0');
INSERT INTO `lr_china_city` VALUES ('418', '408', '翁牛特旗', '150426', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('419', '408', '喀喇沁旗', '150428', 'K', '0');
INSERT INTO `lr_china_city` VALUES ('420', '408', '宁城县', '150429', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('421', '408', '敖汉旗', '150430', 'A', '0');
INSERT INTO `lr_china_city` VALUES ('422', '380', '通辽市', '150500', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('424', '422', '科尔沁区', '150502', 'K', '0');
INSERT INTO `lr_china_city` VALUES ('425', '422', '科尔沁左翼中旗', '150521', 'K', '0');
INSERT INTO `lr_china_city` VALUES ('426', '422', '科尔沁左翼后旗', '150522', 'K', '0');
INSERT INTO `lr_china_city` VALUES ('427', '422', '开鲁县', '150523', 'K', '0');
INSERT INTO `lr_china_city` VALUES ('428', '422', '库伦旗', '150524', 'K', '0');
INSERT INTO `lr_china_city` VALUES ('429', '422', '奈曼旗', '150525', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('430', '422', '扎鲁特旗', '150526', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('431', '422', '霍林郭勒市', '150581', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('432', '380', '鄂尔多斯市', '150600', 'E', '0');
INSERT INTO `lr_china_city` VALUES ('434', '432', '东胜区', '150602', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('435', '432', '达拉特旗', '150621', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('436', '432', '准格尔旗', '150622', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('437', '432', '鄂托克前旗', '150623', 'E', '0');
INSERT INTO `lr_china_city` VALUES ('438', '432', '鄂托克旗', '150624', 'E', '0');
INSERT INTO `lr_china_city` VALUES ('439', '432', '杭锦旗', '150625', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('440', '432', '乌审旗', '150626', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('441', '432', '伊金霍洛旗', '150627', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('442', '380', '呼伦贝尔市', '150700', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('444', '442', '海拉尔区', '150702', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('445', '442', '阿荣旗', '150721', 'A', '0');
INSERT INTO `lr_china_city` VALUES ('446', '442', '莫力达瓦达斡尔族自治旗', '150722', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('447', '442', '鄂伦春自治旗', '150723', 'E', '0');
INSERT INTO `lr_china_city` VALUES ('448', '442', '鄂温克族自治旗', '150724', 'E', '0');
INSERT INTO `lr_china_city` VALUES ('449', '442', '陈巴尔虎旗', '150725', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('450', '442', '新巴尔虎左旗', '150726', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('451', '442', '新巴尔虎右旗', '150727', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('452', '442', '满洲里市', '150781', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('453', '442', '牙克石市', '150782', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('454', '442', '扎兰屯市', '150783', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('455', '442', '额尔古纳市', '150784', 'E', '0');
INSERT INTO `lr_china_city` VALUES ('456', '442', '根河市', '150785', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('457', '380', '巴彦淖尔市', '150800', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('459', '457', '临河区', '150802', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('460', '457', '五原县', '150821', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('461', '457', '磴口县', '150822', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('462', '457', '乌拉特前旗', '150823', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('463', '457', '乌拉特中旗', '150824', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('464', '457', '乌拉特后旗', '150825', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('465', '457', '杭锦后旗', '150826', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('466', '380', '乌兰察布市', '150900', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('468', '466', '集宁区', '150902', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('469', '466', '卓资县', '150921', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('470', '466', '化德县', '150922', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('471', '466', '商都县', '150923', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('472', '466', '兴和县', '150924', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('473', '466', '凉城县', '150925', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('474', '466', '察哈尔右翼前旗', '150926', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('475', '466', '察哈尔右翼中旗', '150927', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('476', '466', '察哈尔右翼后旗', '150928', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('477', '466', '四子王旗', '150929', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('478', '466', '丰镇市', '150981', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('479', '380', '兴安盟', '152200', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('480', '479', '乌兰浩特市', '152201', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('481', '479', '阿尔山市', '152202', 'A', '0');
INSERT INTO `lr_china_city` VALUES ('482', '479', '科尔沁右翼前旗', '152221', 'K', '0');
INSERT INTO `lr_china_city` VALUES ('483', '479', '科尔沁右翼中旗', '152222', 'K', '0');
INSERT INTO `lr_china_city` VALUES ('484', '479', '扎赉特旗', '152223', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('485', '479', '突泉县', '152224', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('486', '380', '锡林郭勒盟', '152500', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('487', '486', '二连浩特市', '152501', 'E', '0');
INSERT INTO `lr_china_city` VALUES ('488', '486', '锡林浩特市', '152502', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('489', '486', '阿巴嘎旗', '152522', 'A', '0');
INSERT INTO `lr_china_city` VALUES ('490', '486', '苏尼特左旗', '152523', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('491', '486', '苏尼特右旗', '152524', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('492', '486', '东乌珠穆沁旗', '152525', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('493', '486', '西乌珠穆沁旗', '152526', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('494', '486', '太仆寺旗', '152527', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('495', '486', '镶黄旗', '152528', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('496', '486', '正镶白旗', '152529', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('497', '486', '正蓝旗', '152530', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('498', '486', '多伦县', '152531', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('499', '380', '阿拉善盟', '152900', 'A', '0');
INSERT INTO `lr_china_city` VALUES ('500', '499', '阿拉善左旗', '152921', 'A', '0');
INSERT INTO `lr_china_city` VALUES ('501', '499', '阿拉善右旗', '152922', 'A', '0');
INSERT INTO `lr_china_city` VALUES ('502', '499', '额济纳旗', '152923', 'E', '0');
INSERT INTO `lr_china_city` VALUES ('503', '0', '辽宁省', '210000', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('504', '503', '沈阳市', '210100', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('506', '504', '和平区', '210102', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('507', '504', '沈河区', '210103', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('508', '504', '大东区', '210104', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('509', '504', '皇姑区', '210105', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('510', '504', '铁西区', '210106', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('511', '504', '苏家屯区', '210111', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('512', '504', '东陵区', '210112', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('513', '504', '沈北新区', '210113', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('514', '504', '于洪区', '210114', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('515', '504', '辽中县', '210122', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('516', '504', '康平县', '210123', 'K', '0');
INSERT INTO `lr_china_city` VALUES ('517', '504', '法库县', '210124', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('518', '504', '新民市', '210181', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('519', '503', '大连市', '210200', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('521', '519', '中山区', '210202', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('522', '519', '西岗区', '210203', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('523', '519', '沙河口区', '210204', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('524', '519', '甘井子区', '210211', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('525', '519', '旅顺口区', '210212', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('526', '519', '金州区', '210213', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('527', '519', '长海县', '210224', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('528', '519', '瓦房店市', '210281', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('529', '519', '普兰店市', '210282', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('530', '519', '庄河市', '210283', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('531', '503', '鞍山市', '210300', 'A', '0');
INSERT INTO `lr_china_city` VALUES ('533', '531', '铁东区', '210302', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('534', '531', '铁西区', '210303', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('535', '531', '立山区', '210304', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('536', '531', '千山区', '210311', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('537', '531', '台安县', '210321', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('538', '531', '岫岩满族自治县', '210323', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('539', '531', '海城市', '210381', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('540', '503', '抚顺市', '210400', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('542', '540', '新抚区', '210402', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('543', '540', '东洲区', '210403', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('544', '540', '望花区', '210404', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('545', '540', '顺城区', '210411', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('546', '540', '抚顺县', '210421', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('547', '540', '新宾满族自治县', '210422', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('548', '540', '清原满族自治县', '210423', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('549', '503', '本溪市', '210500', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('551', '549', '平山区', '210502', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('552', '549', '溪湖区', '210503', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('553', '549', '明山区', '210504', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('554', '549', '南芬区', '210505', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('555', '549', '本溪满族自治县', '210521', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('556', '549', '桓仁满族自治县', '210522', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('557', '503', '丹东市', '210600', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('559', '557', '元宝区', '210602', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('560', '557', '振兴区', '210603', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('561', '557', '振安区', '210604', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('562', '557', '宽甸满族自治县', '210624', 'K', '0');
INSERT INTO `lr_china_city` VALUES ('563', '557', '东港市', '210681', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('564', '557', '凤城市', '210682', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('565', '503', '锦州市', '210700', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('567', '565', '古塔区', '210702', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('568', '565', '凌河区', '210703', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('569', '565', '太和区', '210711', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('570', '565', '黑山县', '210726', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('571', '565', '义县', '210727', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('572', '565', '凌海市', '210781', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('573', '565', '北镇市', '210782', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('574', '503', '营口市', '210800', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('576', '574', '站前区', '210802', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('577', '574', '西市区', '210803', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('578', '574', '鲅鱼圈区', '210804', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('579', '574', '老边区', '210811', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('580', '574', '盖州市', '210881', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('581', '574', '大石桥市', '210882', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('582', '503', '阜新市', '210900', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('584', '582', '海州区', '210902', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('585', '582', '新邱区', '210903', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('586', '582', '太平区', '210904', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('587', '582', '清河门区', '210905', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('588', '582', '细河区', '210911', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('589', '582', '阜新蒙古族自治县', '210921', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('590', '582', '彰武县', '210922', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('591', '503', '辽阳市', '211000', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('593', '591', '白塔区', '211002', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('594', '591', '文圣区', '211003', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('595', '591', '宏伟区', '211004', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('596', '591', '弓长岭区', '211005', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('597', '591', '太子河区', '211011', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('598', '591', '辽阳县', '211021', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('599', '591', '灯塔市', '211081', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('600', '503', '盘锦市', '211100', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('602', '600', '双台子区', '211102', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('603', '600', '兴隆台区', '211103', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('604', '600', '大洼县', '211121', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('605', '600', '盘山县', '211122', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('606', '503', '铁岭市', '211200', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('608', '606', '银州区', '211202', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('609', '606', '清河区', '211204', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('610', '606', '铁岭县', '211221', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('611', '606', '西丰县', '211223', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('612', '606', '昌图县', '211224', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('613', '606', '调兵山市', '211281', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('614', '606', '开原市', '211282', 'K', '0');
INSERT INTO `lr_china_city` VALUES ('615', '503', '朝阳市', '211300', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('617', '615', '双塔区', '211302', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('618', '615', '龙城区', '211303', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('619', '615', '朝阳县', '211321', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('620', '615', '建平县', '211322', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('621', '615', '喀喇沁左翼蒙古族自治县', '211324', 'K', '0');
INSERT INTO `lr_china_city` VALUES ('622', '615', '北票市', '211381', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('623', '615', '凌源市', '211382', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('624', '503', '葫芦岛市', '211400', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('626', '624', '连山区', '211402', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('627', '624', '龙港区', '211403', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('628', '624', '南票区', '211404', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('629', '624', '绥中县', '211421', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('630', '624', '建昌县', '211422', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('631', '624', '兴城市', '211481', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('632', '0', '吉林省', '220000', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('633', '632', '长春市', '220100', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('635', '633', '南关区', '220102', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('636', '633', '宽城区', '220103', 'K', '0');
INSERT INTO `lr_china_city` VALUES ('637', '633', '朝阳区', '220104', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('638', '633', '二道区', '220105', 'E', '0');
INSERT INTO `lr_china_city` VALUES ('639', '633', '绿园区', '220106', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('640', '633', '双阳区', '220112', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('641', '633', '农安县', '220122', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('642', '633', '九台市', '220181', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('643', '633', '榆树市', '220182', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('644', '633', '德惠市', '220183', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('645', '632', '吉林市', '220200', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('647', '645', '昌邑区', '220202', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('648', '645', '龙潭区', '220203', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('649', '645', '船营区', '220204', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('650', '645', '丰满区', '220211', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('651', '645', '永吉县', '220221', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('652', '645', '蛟河市', '220281', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('653', '645', '桦甸市', '220282', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('654', '645', '舒兰市', '220283', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('655', '645', '磐石市', '220284', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('656', '632', '四平市', '220300', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('658', '656', '铁西区', '220302', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('659', '656', '铁东区', '220303', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('660', '656', '梨树县', '220322', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('661', '656', '伊通满族自治县', '220323', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('662', '656', '公主岭市', '220381', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('663', '656', '双辽市', '220382', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('664', '632', '辽源市', '220400', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('666', '664', '龙山区', '220402', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('667', '664', '西安区', '220403', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('668', '664', '东丰县', '220421', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('669', '664', '东辽县', '220422', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('670', '632', '通化市', '220500', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('672', '670', '东昌区', '220502', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('673', '670', '二道江区', '220503', 'E', '0');
INSERT INTO `lr_china_city` VALUES ('674', '670', '通化县', '220521', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('675', '670', '辉南县', '220523', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('676', '670', '柳河县', '220524', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('677', '670', '梅河口市', '220581', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('678', '670', '集安市', '220582', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('679', '632', '白山市', '220600', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('681', '679', '八道江区', '220602', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('682', '679', '江源区', '220605', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('683', '679', '抚松县', '220621', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('684', '679', '靖宇县', '220622', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('685', '679', '长白朝鲜族自治县', '220623', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('686', '679', '临江市', '220681', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('687', '632', '松原市', '220700', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('689', '687', '宁江区', '220702', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('690', '687', '前郭尔罗斯蒙古族自治县', '220721', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('691', '687', '长岭县', '220722', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('692', '687', '乾安县', '220723', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('693', '687', '扶余县', '220724', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('694', '632', '白城市', '220800', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('696', '694', '洮北区', '220802', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('697', '694', '镇赉县', '220821', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('698', '694', '通榆县', '220822', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('699', '694', '洮南市', '220881', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('700', '694', '大安市', '220882', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('701', '632', '延边朝鲜族自治州', '222400', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('702', '701', '延吉市', '222401', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('703', '701', '图们市', '222402', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('704', '701', '敦化市', '222403', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('705', '701', '珲春市', '222404', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('706', '701', '龙井市', '222405', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('707', '701', '和龙市', '222406', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('708', '701', '汪清县', '222424', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('709', '701', '安图县', '222426', 'A', '0');
INSERT INTO `lr_china_city` VALUES ('710', '0', '黑龙江省', '230000', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('711', '710', '哈尔滨市', '230100', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('713', '711', '道里区', '230102', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('714', '711', '南岗区', '230103', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('715', '711', '道外区', '230104', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('716', '711', '平房区', '230108', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('717', '711', '松北区', '230109', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('718', '711', '香坊区', '230110', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('719', '711', '呼兰区', '230111', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('720', '711', '阿城区 ', '230112', 'A', '0');
INSERT INTO `lr_china_city` VALUES ('721', '711', '依兰县', '230123', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('722', '711', '方正县', '230124', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('723', '711', '宾县', '230125', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('724', '711', '巴彦县', '230126', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('725', '711', '木兰县', '230127', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('726', '711', '通河县', '230128', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('727', '711', '延寿县', '230129', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('728', '711', '双城市', '230182', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('729', '711', '尚志市', '230183', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('730', '711', '五常市', '230184', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('731', '710', '齐齐哈尔市', '230200', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('733', '731', '龙沙区', '230202', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('734', '731', '建华区', '230203', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('735', '731', '铁锋区', '230204', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('736', '731', '昂昂溪区', '230205', 'A', '0');
INSERT INTO `lr_china_city` VALUES ('737', '731', '富拉尔基区', '230206', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('738', '731', '碾子山区', '230207', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('739', '731', '梅里斯达斡尔族区', '230208', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('740', '731', '龙江县', '230221', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('741', '731', '依安县', '230223', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('742', '731', '泰来县', '230224', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('743', '731', '甘南县', '230225', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('744', '731', '富裕县', '230227', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('745', '731', '克山县', '230229', 'K', '0');
INSERT INTO `lr_china_city` VALUES ('746', '731', '克东县', '230230', 'K', '0');
INSERT INTO `lr_china_city` VALUES ('747', '731', '拜泉县', '230231', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('748', '731', '讷河市', '230281', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('749', '710', '鸡西市', '230300', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('751', '749', '鸡冠区', '230302', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('752', '749', '恒山区', '230303', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('753', '749', '滴道区', '230304', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('754', '749', '梨树区', '230305', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('755', '749', '城子河区', '230306', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('756', '749', '麻山区', '230307', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('757', '749', '鸡东县', '230321', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('758', '749', '虎林市', '230381', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('759', '749', '密山市', '230382', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('760', '710', '鹤岗市', '230400', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('762', '760', '向阳区', '230402', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('763', '760', '工农区', '230403', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('764', '760', '南山区', '230404', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('765', '760', '兴安区', '230405', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('766', '760', '东山区', '230406', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('767', '760', '兴山区', '230407', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('768', '760', '萝北县', '230421', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('769', '760', '绥滨县', '230422', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('770', '710', '双鸭山市', '230500', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('772', '770', '尖山区', '230502', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('773', '770', '岭东区', '230503', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('774', '770', '四方台区', '230505', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('775', '770', '宝山区', '230506', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('776', '770', '集贤县', '230521', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('777', '770', '友谊县', '230522', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('778', '770', '宝清县', '230523', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('779', '770', '饶河县', '230524', 'R', '0');
INSERT INTO `lr_china_city` VALUES ('780', '710', '大庆市', '230600', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('782', '780', '萨尔图区', '230602', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('783', '780', '龙凤区', '230603', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('784', '780', '让胡路区', '230604', 'R', '0');
INSERT INTO `lr_china_city` VALUES ('785', '780', '红岗区', '230605', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('786', '780', '大同区', '230606', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('787', '780', '肇州县', '230621', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('788', '780', '肇源县', '230622', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('789', '780', '林甸县', '230623', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('790', '780', '杜尔伯特蒙古族自治县', '230624', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('791', '710', '伊春市', '230700', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('793', '791', '伊春区', '230702', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('794', '791', '南岔区', '230703', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('795', '791', '友好区', '230704', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('796', '791', '西林区', '230705', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('797', '791', '翠峦区', '230706', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('798', '791', '新青区', '230707', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('799', '791', '美溪区', '230708', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('800', '791', '金山屯区', '230709', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('801', '791', '五营区', '230710', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('802', '791', '乌马河区', '230711', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('803', '791', '汤旺河区', '230712', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('804', '791', '带岭区', '230713', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('805', '791', '乌伊岭区', '230714', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('806', '791', '红星区', '230715', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('807', '791', '上甘岭区', '230716', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('808', '791', '嘉荫县', '230722', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('809', '791', '铁力市', '230781', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('810', '710', '佳木斯市', '230800', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('812', '810', '向阳区', '230803', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('813', '810', '前进区', '230804', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('814', '810', '东风区', '230805', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('815', '810', '郊区', '230811', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('816', '810', '桦南县', '230822', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('817', '810', '桦川县', '230826', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('818', '810', '汤原县', '230828', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('819', '810', '抚远县', '230833', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('820', '810', '同江市', '230881', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('821', '810', '富锦市', '230882', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('822', '710', '七台河市', '230900', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('824', '822', '新兴区', '230902', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('825', '822', '桃山区', '230903', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('826', '822', '茄子河区', '230904', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('827', '822', '勃利县', '230921', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('828', '710', '牡丹江市', '231000', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('830', '828', '东安区', '231002', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('831', '828', '阳明区', '231003', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('832', '828', '爱民区', '231004', 'A', '0');
INSERT INTO `lr_china_city` VALUES ('833', '828', '西安区', '231005', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('834', '828', '东宁县', '231024', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('835', '828', '林口县', '231025', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('836', '828', '绥芬河市', '231081', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('837', '828', '海林市', '231083', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('838', '828', '宁安市', '231084', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('839', '828', '穆棱市', '231085', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('840', '710', '黑河市', '231100', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('842', '840', '爱辉区', '231102', 'A', '0');
INSERT INTO `lr_china_city` VALUES ('843', '840', '嫩江县', '231121', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('844', '840', '逊克县', '231123', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('845', '840', '孙吴县', '231124', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('846', '840', '北安市', '231181', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('847', '840', '五大连池市', '231182', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('848', '710', '绥化市', '231200', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('850', '848', '北林区', '231202', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('851', '848', '望奎县', '231221', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('852', '848', '兰西县', '231222', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('853', '848', '青冈县', '231223', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('854', '848', '庆安县', '231224', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('855', '848', '明水县', '231225', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('856', '848', '绥棱县', '231226', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('857', '848', '安达市', '231281', 'A', '0');
INSERT INTO `lr_china_city` VALUES ('858', '848', '肇东市', '231282', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('859', '848', '海伦市', '231283', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('860', '710', '大兴安岭地区', '232700', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('861', '860', '加格达奇区', '232701', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('862', '860', '松岭区', '232702', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('863', '860', '新林区', '232703', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('864', '860', '呼中区', '232704', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('865', '860', '呼玛县', '232721', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('866', '860', '塔河县', '232722', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('867', '860', '漠河县', '232723', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('868', '0', '上海市', '310000', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('869', '868', '上海市', '310000', 'S', '1');
INSERT INTO `lr_china_city` VALUES ('870', '869', '黄浦区', '310101', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('871', '869', '卢湾区', '310103', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('872', '869', '徐汇区', '310104', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('873', '869', '长宁区', '310105', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('874', '869', '静安区', '310106', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('875', '869', '普陀区', '310107', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('876', '869', '闸北区', '310108', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('877', '869', '虹口区', '310109', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('878', '869', '杨浦区', '310110', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('879', '869', '闵行区', '310112', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('880', '869', '宝山区', '310113', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('881', '869', '嘉定区', '310114', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('882', '869', '浦东新区', '310115', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('883', '869', '金山区', '310116', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('884', '869', '松江区', '310117', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('885', '869', '青浦区', '310118', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('886', '869', '南汇区', '310119', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('887', '869', '奉贤区', '310120', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('888', '868', '县', '310200', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('889', '888', '崇明县', '310230', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('890', '0', '江苏省', '320000', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('891', '890', '南京市', '320100', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('893', '891', '玄武区', '320102', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('894', '891', '白下区', '320103', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('895', '891', '秦淮区', '320104', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('896', '891', '建邺区', '320105', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('897', '891', '鼓楼区', '320106', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('898', '891', '下关区', '320107', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('899', '891', '浦口区', '320111', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('900', '891', '栖霞区', '320113', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('901', '891', '雨花台区', '320114', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('902', '891', '江宁区', '320115', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('903', '891', '六合区', '320116', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('904', '891', '溧水县', '320124', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('905', '891', '高淳县', '320125', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('906', '890', '无锡市', '320200', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('908', '906', '崇安区', '320202', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('909', '906', '南长区', '320203', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('910', '906', '北塘区', '320204', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('911', '906', '锡山区', '320205', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('912', '906', '惠山区', '320206', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('913', '906', '滨湖区', '320211', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('914', '906', '江阴市', '320281', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('915', '906', '宜兴市', '320282', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('916', '890', '徐州市', '320300', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('918', '916', '鼓楼区', '320302', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('919', '916', '云龙区', '320303', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('920', '916', '九里区', '320304', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('921', '916', '贾汪区', '320305', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('922', '916', '泉山区', '320311', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('923', '916', '丰县', '320321', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('924', '916', '沛县', '320322', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('925', '916', '铜山县', '320323', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('926', '916', '睢宁县', '320324', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('927', '916', '新沂市', '320381', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('928', '916', '邳州市', '320382', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('929', '890', '常州市', '320400', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('931', '929', '天宁区', '320402', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('932', '929', '钟楼区', '320404', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('933', '929', '戚墅堰区', '320405', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('934', '929', '新北区', '320411', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('935', '929', '武进区', '320412', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('936', '929', '溧阳市', '320481', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('937', '929', '金坛市', '320482', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('938', '890', '苏州市', '320500', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('940', '938', '沧浪区', '320502', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('941', '938', '平江区', '320503', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('942', '938', '金阊区', '320504', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('943', '938', '虎丘区', '320505', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('944', '938', '吴中区', '320506', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('945', '938', '相城区', '320507', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('946', '938', '常熟市', '320581', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('947', '938', '张家港市', '320582', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('948', '938', '昆山市', '320583', 'K', '0');
INSERT INTO `lr_china_city` VALUES ('949', '938', '吴江市', '320584', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('950', '938', '太仓市', '320585', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('951', '890', '南通市', '320600', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('953', '951', '崇川区', '320602', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('954', '951', '港闸区', '320611', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('955', '951', '海安县', '320621', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('956', '951', '如东县', '320623', 'R', '0');
INSERT INTO `lr_china_city` VALUES ('957', '951', '启东市', '320681', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('958', '951', '如皋市', '320682', 'R', '0');
INSERT INTO `lr_china_city` VALUES ('959', '951', '通州市', '320683', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('960', '951', '海门市', '320684', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('961', '890', '连云港市', '320700', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('963', '961', '连云区', '320703', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('964', '961', '新浦区', '320705', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('965', '961', '海州区', '320706', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('966', '961', '赣榆县', '320721', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('967', '961', '东海县', '320722', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('968', '961', '灌云县', '320723', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('969', '961', '灌南县', '320724', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('970', '890', '淮安市', '320800', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('972', '970', '清河区', '320802', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('973', '970', '楚州区', '320803', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('974', '970', '淮阴区', '320804', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('975', '970', '清浦区', '320811', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('976', '970', '涟水县', '320826', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('977', '970', '洪泽县', '320829', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('978', '970', '盱眙县', '320830', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('979', '970', '金湖县', '320831', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('980', '890', '盐城市', '320900', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('982', '980', '亭湖区', '320902', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('983', '980', '盐都区', '320903', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('984', '980', '响水县', '320921', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('985', '980', '滨海县', '320922', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('986', '980', '阜宁县', '320923', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('987', '980', '射阳县', '320924', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('988', '980', '建湖县', '320925', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('989', '980', '东台市', '320981', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('990', '980', '大丰市', '320982', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('991', '890', '扬州市', '321000', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('993', '991', '广陵区', '321002', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('994', '991', '邗江区', '321003', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('995', '991', '维扬区', '321011', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('996', '991', '宝应县', '321023', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('997', '991', '仪征市', '321081', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('998', '991', '高邮市', '321084', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('999', '991', '江都市', '321088', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1000', '890', '镇江市', '321100', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('1002', '1000', '京口区', '321102', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1003', '1000', '润州区', '321111', 'R', '0');
INSERT INTO `lr_china_city` VALUES ('1004', '1000', '丹徒区', '321112', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('1005', '1000', '丹阳市', '321181', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('1006', '1000', '扬中市', '321182', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1007', '1000', '句容市', '321183', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1008', '890', '泰州市', '321200', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('1010', '1008', '海陵区', '321202', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('1011', '1008', '高港区', '321203', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('1012', '1008', '兴化市', '321281', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1013', '1008', '靖江市', '321282', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1014', '1008', '泰兴市', '321283', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('1015', '1008', '姜堰市', '321284', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1016', '890', '宿迁市', '321300', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1018', '1016', '宿城区', '321302', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1019', '1016', '宿豫区', '321311', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1020', '1016', '沭阳县', '321322', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1021', '1016', '泗阳县', '321323', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1022', '1016', '泗洪县', '321324', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1023', '0', '浙江省', '330000', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('1024', '1023', '杭州市', '330100', 'H', '1');
INSERT INTO `lr_china_city` VALUES ('1026', '1024', '上城区', '330102', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1027', '1024', '下城区', '330103', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1028', '1024', '江干区', '330104', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1029', '1024', '拱墅区', '330105', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('1030', '1024', '西湖区', '330106', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1031', '1024', '滨江区', '330108', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('1032', '1024', '萧山区', '330109', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1033', '1024', '余杭区', '330110', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1034', '1024', '桐庐县', '330122', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('1035', '1024', '淳安县', '330127', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('1036', '1024', '建德市', '330182', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1037', '1024', '富阳市', '330183', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('1038', '1024', '临安市', '330185', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1039', '1023', '宁波市', '330200', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('1041', '1039', '海曙区', '330203', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('1042', '1039', '江东区', '330204', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1043', '1039', '江北区', '330205', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1044', '1039', '北仑区', '330206', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('1045', '1039', '镇海区', '330211', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('1046', '1039', '鄞州区', '330212', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1047', '1039', '象山县', '330225', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1048', '1039', '宁海县', '330226', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('1049', '1039', '余姚市', '330281', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1050', '1039', '慈溪市', '330282', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('1051', '1039', '奉化市', '330283', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('1052', '1023', '温州市', '330300', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('1054', '1052', '鹿城区', '330302', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1055', '1052', '龙湾区', '330303', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1056', '1052', '瓯海区', '330304', 'O', '0');
INSERT INTO `lr_china_city` VALUES ('1057', '1052', '洞头县', '330322', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('1058', '1052', '永嘉县', '330324', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1059', '1052', '平阳县', '330326', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('1060', '1052', '苍南县', '330327', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('1061', '1052', '文成县', '330328', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('1062', '1052', '泰顺县', '330329', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('1063', '1052', '瑞安市', '330381', 'R', '0');
INSERT INTO `lr_china_city` VALUES ('1064', '1052', '乐清市', '330382', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1065', '1023', '嘉兴市', '330400', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1067', '1065', '南湖区', '330402', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('1068', '1065', '秀洲区', '330411', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1069', '1065', '嘉善县', '330421', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1070', '1065', '海盐县', '330424', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('1071', '1065', '海宁市', '330481', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('1072', '1065', '平湖市', '330482', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('1073', '1065', '桐乡市', '330483', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('1074', '1023', '湖州市', '330500', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('1076', '1074', '吴兴区', '330502', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('1077', '1074', '南浔区', '330503', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('1078', '1074', '德清县', '330521', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('1079', '1074', '长兴县', '330522', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('1080', '1074', '安吉县', '330523', 'A', '0');
INSERT INTO `lr_china_city` VALUES ('1081', '1023', '绍兴市', '330600', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1083', '1081', '越城区', '330602', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1084', '1081', '绍兴县', '330621', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1085', '1081', '新昌县', '330624', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1086', '1081', '诸暨市', '330681', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('1087', '1081', '上虞市', '330682', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1088', '1081', '嵊州市', '330683', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1089', '1023', '金华市', '330700', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1091', '1089', '婺城区', '330702', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('1092', '1089', '金东区', '330703', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1093', '1089', '武义县', '330723', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('1094', '1089', '浦江县', '330726', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('1095', '1089', '磐安县', '330727', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('1096', '1089', '兰溪市', '330781', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1097', '1089', '义乌市', '330782', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1098', '1089', '东阳市', '330783', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('1099', '1089', '永康市', '330784', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1100', '1023', '衢州市', '330800', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('1102', '1100', '柯城区', '330802', 'K', '0');
INSERT INTO `lr_china_city` VALUES ('1103', '1100', '衢江区', '330803', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('1104', '1100', '常山县', '330822', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('1105', '1100', '开化县', '330824', 'K', '0');
INSERT INTO `lr_china_city` VALUES ('1106', '1100', '龙游县', '330825', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1107', '1100', '江山市', '330881', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1108', '1023', '舟山市', '330900', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('1110', '1108', '定海区', '330902', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('1111', '1108', '普陀区', '330903', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('1112', '1108', '岱山县', '330921', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('1113', '1108', '嵊泗县', '330922', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1114', '1023', '台州市', '331000', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('1116', '1114', '椒江区', '331002', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1117', '1114', '黄岩区', '331003', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('1118', '1114', '路桥区', '331004', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1119', '1114', '玉环县', '331021', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1120', '1114', '三门县', '331022', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1121', '1114', '天台县', '331023', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('1122', '1114', '仙居县', '331024', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1123', '1114', '温岭市', '331081', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('1124', '1114', '临海市', '331082', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1125', '1023', '丽水市', '331100', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1127', '1125', '莲都区', '331102', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1128', '1125', '青田县', '331121', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('1129', '1125', '缙云县', '331122', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1130', '1125', '遂昌县', '331123', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1131', '1125', '松阳县', '331124', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1132', '1125', '云和县', '331125', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1133', '1125', '庆元县', '331126', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('1134', '1125', '景宁畲族自治县', '331127', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1135', '1125', '龙泉市', '331181', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1136', '0', '安徽省', '340000', 'A', '0');
INSERT INTO `lr_china_city` VALUES ('1137', '1136', '合肥市', '340100', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('1139', '1137', '瑶海区', '340102', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1140', '1137', '庐阳区', '340103', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1141', '1137', '蜀山区', '340104', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1142', '1137', '包河区', '340111', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('1143', '1137', '长丰县', '340121', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('1144', '1137', '肥东县', '340122', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('1145', '1137', '肥西县', '340123', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('1146', '1136', '芜湖市', '340200', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('1148', '1146', '镜湖区', '340202', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1149', '1146', '弋江区', '340203', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1150', '1146', '鸠江区', '340207', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1151', '1146', '三山区', '340208', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1152', '1146', '芜湖县', '340221', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('1153', '1146', '繁昌县', '340222', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('1154', '1146', '南陵县', '340223', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('1155', '1136', '蚌埠市', '340300', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('1157', '1155', '龙子湖区', '340302', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1158', '1155', '蚌山区', '340303', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('1159', '1155', '禹会区', '340304', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1160', '1155', '淮上区', '340311', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('1161', '1155', '怀远县', '340321', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('1162', '1155', '五河县', '340322', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('1163', '1155', '固镇县', '340323', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('1164', '1136', '淮南市', '340400', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('1166', '1164', '大通区', '340402', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('1167', '1164', '田家庵区', '340403', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('1168', '1164', '谢家集区', '340404', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1169', '1164', '八公山区', '340405', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('1170', '1164', '潘集区', '340406', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('1171', '1164', '凤台县', '340421', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('1172', '1136', '马鞍山市', '340500', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('1174', '1172', '金家庄区', '340502', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1175', '1172', '花山区', '340503', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('1176', '1172', '雨山区', '340504', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1177', '1172', '当涂县', '340521', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('1178', '1136', '淮北市', '340600', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('1180', '1178', '杜集区', '340602', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('1181', '1178', '相山区', '340603', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1182', '1178', '烈山区', '340604', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1183', '1178', '濉溪县', '340621', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1184', '1136', '铜陵市', '340700', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('1186', '1184', '铜官山区', '340702', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('1187', '1184', '狮子山区', '340703', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1188', '1184', '郊区', '340711', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1189', '1184', '铜陵县', '340721', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('1190', '1136', '安庆市', '340800', 'A', '0');
INSERT INTO `lr_china_city` VALUES ('1192', '1190', '迎江区', '340802', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1193', '1190', '大观区', '340803', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('1194', '1190', '宜秀区', '340811', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1195', '1190', '怀宁县', '340822', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('1196', '1190', '枞阳县', '340823', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('1197', '1190', '潜山县', '340824', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('1198', '1190', '太湖县', '340825', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('1199', '1190', '宿松县', '340826', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1200', '1190', '望江县', '340827', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('1201', '1190', '岳西县', '340828', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1202', '1190', '桐城市', '340881', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('1203', '1136', '黄山市', '341000', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('1205', '1203', '屯溪区', '341002', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('1206', '1203', '黄山区', '341003', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('1207', '1203', '徽州区', '341004', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('1208', '1203', '歙县', '341021', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1209', '1203', '休宁县', '341022', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1210', '1203', '黟县', '341023', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1211', '1203', '祁门县', '341024', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('1212', '1136', '滁州市', '341100', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('1214', '1212', '琅琊区', '341102', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1215', '1212', '南谯区', '341103', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('1216', '1212', '来安县', '341122', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1217', '1212', '全椒县', '341124', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('1218', '1212', '定远县', '341125', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('1219', '1212', '凤阳县', '341126', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('1220', '1212', '天长市', '341181', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('1221', '1212', '明光市', '341182', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('1222', '1136', '阜阳市', '341200', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('1224', '1222', '颍州区', '341202', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1225', '1222', '颍东区', '341203', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1226', '1222', '颍泉区', '341204', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1227', '1222', '临泉县', '341221', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1228', '1222', '太和县', '341222', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('1229', '1222', '阜南县', '341225', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('1230', '1222', '颍上县', '341226', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1231', '1222', '界首市', '341282', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1232', '1136', '宿州市', '341300', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1234', '1232', '埇桥区', '341302', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1235', '1232', '砀山县', '341321', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('1236', '1232', '萧县', '341322', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1237', '1232', '灵璧县', '341323', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1238', '1232', '泗县', '341324', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1239', '1136', '巢湖市', '341400', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('1241', '1239', '居巢区', '341402', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1242', '1239', '庐江县', '341421', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1243', '1239', '无为县', '341422', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('1244', '1239', '含山县', '341423', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('1245', '1239', '和县', '341424', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('1246', '1136', '六安市', '341500', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1248', '1246', '金安区', '341502', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1249', '1246', '裕安区', '341503', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1250', '1246', '寿县', '341521', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1251', '1246', '霍邱县', '341522', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('1252', '1246', '舒城县', '341523', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1253', '1246', '金寨县', '341524', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1254', '1246', '霍山县', '341525', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('1255', '1136', '亳州市', '341600', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('1257', '1255', '谯城区', '341602', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('1258', '1255', '涡阳县', '341621', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('1259', '1255', '蒙城县', '341622', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('1260', '1255', '利辛县', '341623', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1261', '1136', '池州市', '341700', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('1263', '1261', '贵池区', '341702', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('1264', '1261', '东至县', '341721', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('1265', '1261', '石台县', '341722', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1266', '1261', '青阳县', '341723', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('1267', '1136', '宣城市', '341800', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1269', '1267', '宣州区', '341802', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1270', '1267', '郎溪县', '341821', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1271', '1267', '广德县', '341822', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('1272', '1267', '泾县', '341823', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1273', '1267', '绩溪县', '341824', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1274', '1267', '旌德县', '341825', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1275', '1267', '宁国市', '341881', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('1276', '0', '福建省', '350000', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('1277', '1276', '福州市', '350100', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('1279', '1277', '鼓楼区', '350102', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('1280', '1277', '台江区', '350103', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('1281', '1277', '仓山区', '350104', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('1282', '1277', '马尾区', '350105', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('1283', '1277', '晋安区', '350111', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1284', '1277', '闽侯县', '350121', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('1285', '1277', '连江县', '350122', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1286', '1277', '罗源县', '350123', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1287', '1277', '闽清县', '350124', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('1288', '1277', '永泰县', '350125', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1289', '1277', '平潭县', '350128', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('1290', '1277', '福清市', '350181', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('1291', '1277', '长乐市', '350182', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('1292', '1276', '厦门市', '350200', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1294', '1292', '思明区', '350203', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1295', '1292', '海沧区', '350205', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('1296', '1292', '湖里区', '350206', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('1297', '1292', '集美区', '350211', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1298', '1292', '同安区', '350212', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('1299', '1292', '翔安区', '350213', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1300', '1276', '莆田市', '350300', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('1302', '1300', '城厢区', '350302', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('1303', '1300', '涵江区', '350303', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('1304', '1300', '荔城区', '350304', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1305', '1300', '秀屿区', '350305', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1306', '1300', '仙游县', '350322', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1307', '1276', '三明市', '350400', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1309', '1307', '梅列区', '350402', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('1310', '1307', '三元区', '350403', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1311', '1307', '明溪县', '350421', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('1312', '1307', '清流县', '350423', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('1313', '1307', '宁化县', '350424', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('1314', '1307', '大田县', '350425', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('1315', '1307', '尤溪县', '350426', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1316', '1307', '沙县', '350427', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('1317', '1307', '将乐县', '350428', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1318', '1307', '泰宁县', '350429', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('1319', '1307', '建宁县', '350430', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1320', '1307', '永安市', '350481', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1321', '1276', '泉州市', '350500', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('1323', '1321', '鲤城区', '350502', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1324', '1321', '丰泽区', '350503', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('1325', '1321', '洛江区', '350504', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1326', '1321', '泉港区', '350505', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('1327', '1321', '惠安县', '350521', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('1328', '1321', '安溪县', '350524', 'A', '0');
INSERT INTO `lr_china_city` VALUES ('1329', '1321', '永春县', '350525', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1330', '1321', '德化县', '350526', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('1331', '1321', '金门县', '350527', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1332', '1321', '石狮市', '350581', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('1333', '1321', '晋江市', '350582', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1334', '1321', '南安市', '350583', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('1335', '1276', '漳州市', '350600', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('1337', '1335', '芗城区', '350602', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1338', '1335', '龙文区', '350603', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1339', '1335', '云霄县', '350622', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1340', '1335', '漳浦县', '350623', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('1341', '1335', '诏安县', '350624', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('1342', '1335', '长泰县', '350625', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('1343', '1335', '东山县', '350626', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('1344', '1335', '南靖县', '350627', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('1345', '1335', '平和县', '350628', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('1346', '1335', '华安县', '350629', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('1347', '1335', '龙海市', '350681', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1348', '1276', '南平市', '350700', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('1350', '1348', '延平区', '350702', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1351', '1348', '顺昌县', '350721', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1352', '1348', '浦城县', '350722', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('1353', '1348', '光泽县', '350723', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('1354', '1348', '松溪县', '350724', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1355', '1348', '政和县', '350725', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('1356', '1348', '邵武市', '350781', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1357', '1348', '武夷山市', '350782', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('1358', '1348', '建瓯市', '350783', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1359', '1348', '建阳市', '350784', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1360', '1276', '龙岩市', '350800', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1362', '1360', '新罗区', '350802', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1363', '1360', '长汀县', '350821', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('1364', '1360', '永定县', '350822', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1365', '1360', '上杭县', '350823', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1366', '1360', '武平县', '350824', 'E', '0');
INSERT INTO `lr_china_city` VALUES ('1367', '1360', '连城县', '350825', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1368', '1360', '漳平市', '350881', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('1369', '1276', '宁德市', '350900', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('1371', '1369', '蕉城区', '350902', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1372', '1369', '霞浦县', '350921', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1373', '1369', '古田县', '350922', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('1374', '1369', '屏南县', '350923', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('1375', '1369', '寿宁县', '350924', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1376', '1369', '周宁县', '350925', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('1377', '1369', '柘荣县', '350926', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('1378', '1369', '福安市', '350981', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('1379', '1369', '福鼎市', '350982', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('1380', '0', '江西省', '360000', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1381', '1380', '南昌市', '360100', 'N', '1');
INSERT INTO `lr_china_city` VALUES ('1383', '1381', '东湖区', '360102', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('1384', '1381', '西湖区', '360103', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1385', '1381', '青云谱区', '360104', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('1386', '1381', '湾里区', '360105', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('1387', '1381', '青山湖区', '360111', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('1388', '1381', '南昌县', '360121', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('1389', '1381', '新建县', '360122', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1390', '1381', '安义县', '360123', 'A', '0');
INSERT INTO `lr_china_city` VALUES ('1391', '1381', '进贤县', '360124', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1392', '1380', '景德镇市', '360200', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1394', '1392', '昌江区', '360202', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('1395', '1392', '珠山区', '360203', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('1396', '1392', '浮梁县', '360222', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('1397', '1392', '乐平市', '360281', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1398', '1380', '萍乡市', '360300', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('1400', '1398', '安源区', '360302', 'A', '0');
INSERT INTO `lr_china_city` VALUES ('1401', '1398', '湘东区', '360313', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1402', '1398', '莲花县', '360321', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1403', '1398', '上栗县', '360322', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1404', '1398', '芦溪县', '360323', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1405', '1380', '九江市', '360400', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1407', '1405', '庐山区', '360402', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1408', '1405', '浔阳区', '360403', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1409', '1405', '九江县', '360421', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1410', '1405', '武宁县', '360423', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('1411', '1405', '修水县', '360424', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1412', '1405', '永修县', '360425', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1413', '1405', '德安县', '360426', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('1414', '1405', '星子县', '360427', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1415', '1405', '都昌县', '360428', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('1416', '1405', '湖口县', '360429', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('1417', '1405', '彭泽县', '360430', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('1418', '1405', '瑞昌市', '360481', 'R', '0');
INSERT INTO `lr_china_city` VALUES ('1419', '1380', '新余市', '360500', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1421', '1419', '渝水区', '360502', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1422', '1419', '分宜县', '360521', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('1423', '1380', '鹰潭市', '360600', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1425', '1423', '月湖区', '360602', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1426', '1423', '余江县', '360622', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1427', '1423', '贵溪市', '360681', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('1428', '1380', '赣州市', '360700', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('1430', '1428', '章贡区', '360702', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('1431', '1428', '赣县', '360721', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('1432', '1428', '信丰县', '360722', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1433', '1428', '大余县', '360723', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('1434', '1428', '上犹县', '360724', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1435', '1428', '崇义县', '360725', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('1436', '1428', '安远县', '360726', 'A', '0');
INSERT INTO `lr_china_city` VALUES ('1437', '1428', '龙南县', '360727', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1438', '1428', '定南县', '360728', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('1439', '1428', '全南县', '360729', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('1440', '1428', '宁都县', '360730', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('1441', '1428', '于都县', '360731', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1442', '1428', '兴国县', '360732', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1443', '1428', '会昌县', '360733', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('1444', '1428', '寻乌县', '360734', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1445', '1428', '石城县', '360735', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1446', '1428', '瑞金市', '360781', 'R', '0');
INSERT INTO `lr_china_city` VALUES ('1447', '1428', '南康市', '360782', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('1448', '1380', '吉安市', '360800', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1450', '1448', '吉州区', '360802', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1451', '1448', '青原区', '360803', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('1452', '1448', '吉安县', '360821', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1453', '1448', '吉水县', '360822', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1454', '1448', '峡江县', '360823', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1455', '1448', '新干县', '360824', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1456', '1448', '永丰县', '360825', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1457', '1448', '泰和县', '360826', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('1458', '1448', '遂川县', '360827', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1459', '1448', '万安县', '360828', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('1460', '1448', '安福县', '360829', 'A', '0');
INSERT INTO `lr_china_city` VALUES ('1461', '1448', '永新县', '360830', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1462', '1448', '井冈山市', '360881', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1463', '1380', '宜春市', '360900', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1465', '1463', '袁州区', '360902', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1466', '1463', '奉新县', '360921', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('1467', '1463', '万载县', '360922', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('1468', '1463', '上高县', '360923', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1469', '1463', '宜丰县', '360924', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1470', '1463', '靖安县', '360925', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1471', '1463', '铜鼓县', '360926', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('1472', '1463', '丰城市', '360981', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('1473', '1463', '樟树市', '360982', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('1474', '1463', '高安市', '360983', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('1475', '1380', '抚州市', '361000', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('1477', '1475', '临川区', '361002', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1478', '1475', '南城县', '361021', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('1479', '1475', '黎川县', '361022', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1480', '1475', '南丰县', '361023', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('1481', '1475', '崇仁县', '361024', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('1482', '1475', '乐安县', '361025', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1483', '1475', '宜黄县', '361026', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1484', '1475', '金溪县', '361027', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1485', '1475', '资溪县', '361028', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('1486', '1475', '东乡县', '361029', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('1487', '1475', '广昌县', '361030', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('1488', '1380', '上饶市', '361100', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1490', '1488', '信州区', '361102', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1491', '1488', '上饶县', '361121', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1492', '1488', '广丰县', '361122', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('1493', '1488', '玉山县', '361123', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1494', '1488', '铅山县', '361124', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('1495', '1488', '横峰县', '361125', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('1496', '1488', '弋阳县', '361126', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1497', '1488', '余干县', '361127', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1498', '1488', '鄱阳县', '361128', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('1499', '1488', '万年县', '361129', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('1500', '1488', '婺源县', '361130', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('1501', '1488', '德兴市', '361181', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('1502', '0', '山东省', '370000', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1503', '1502', '济南市', '370100', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1505', '1503', '历下区', '370102', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1506', '1503', '市中区', '370103', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1507', '1503', '槐荫区', '370104', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('1508', '1503', '天桥区', '370105', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('1509', '1503', '历城区', '370112', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1510', '1503', '长清区', '370113', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('1511', '1503', '平阴县', '370124', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('1512', '1503', '济阳县', '370125', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1513', '1503', '商河县', '370126', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1514', '1503', '章丘市', '370181', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('1515', '1502', '青岛市', '370200', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('1517', '1515', '市南区', '370202', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1518', '1515', '市北区', '370203', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1519', '1515', '四方区', '370205', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1520', '1515', '黄岛区', '370211', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('1521', '1515', '崂山区', '370212', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1522', '1515', '李沧区', '370213', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1523', '1515', '城阳区', '370214', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('1524', '1515', '胶州市', '370281', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1525', '1515', '即墨市', '370282', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1526', '1515', '平度市', '370283', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('1527', '1515', '胶南市', '370284', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1528', '1515', '莱西市', '370285', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1529', '1502', '淄博市', '370300', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('1531', '1529', '淄川区', '370302', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('1532', '1529', '张店区', '370303', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('1533', '1529', '博山区', '370304', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('1534', '1529', '临淄区', '370305', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1535', '1529', '周村区', '370306', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('1536', '1529', '桓台县', '370321', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('1537', '1529', '高青县', '370322', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('1538', '1529', '沂源县', '370323', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1539', '1502', '枣庄市', '370400', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('1541', '1539', '市中区', '370402', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1542', '1539', '薛城区', '370403', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1543', '1539', '峄城区', '370404', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('1544', '1539', '台儿庄区', '370405', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('1545', '1539', '山亭区', '370406', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1546', '1539', '滕州市', '370481', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('1547', '1502', '东营市', '370500', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('1549', '1547', '东营区', '370502', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('1550', '1547', '河口区', '370503', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('1551', '1547', '垦利县', '370521', 'K', '0');
INSERT INTO `lr_china_city` VALUES ('1552', '1547', '利津县', '370522', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1553', '1547', '广饶县', '370523', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('1554', '1502', '烟台市', '370600', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1556', '1554', '芝罘区', '370602', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('1557', '1554', '福山区', '370611', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('1558', '1554', '牟平区', '370612', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('1559', '1554', '莱山区', '370613', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1560', '1554', '长岛县', '370634', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('1561', '1554', '龙口市', '370681', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1562', '1554', '莱阳市', '370682', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1563', '1554', '莱州市', '370683', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1564', '1554', '蓬莱市', '370684', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('1565', '1554', '招远市', '370685', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('1566', '1554', '栖霞市', '370686', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('1567', '1554', '海阳市', '370687', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('1568', '1502', '潍坊市', '370700', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('1570', '1568', '潍城区', '370702', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('1571', '1568', '寒亭区', '370703', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('1572', '1568', '坊子区', '370704', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('1573', '1568', '奎文区', '370705', 'K', '0');
INSERT INTO `lr_china_city` VALUES ('1574', '1568', '临朐县', '370724', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1575', '1568', '昌乐县', '370725', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('1576', '1568', '青州市', '370781', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('1577', '1568', '诸城市', '370782', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('1578', '1568', '寿光市', '370783', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1579', '1568', '安丘市', '370784', 'A', '0');
INSERT INTO `lr_china_city` VALUES ('1580', '1568', '高密市', '370785', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('1581', '1568', '昌邑市', '370786', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('1582', '1502', '济宁市', '370800', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1584', '1582', '市中区', '370802', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1585', '1582', '任城区', '370811', 'R', '0');
INSERT INTO `lr_china_city` VALUES ('1586', '1582', '微山县', '370826', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('1587', '1582', '鱼台县', '370827', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1588', '1582', '金乡县', '370828', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1589', '1582', '嘉祥县', '370829', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1590', '1582', '汶上县', '370830', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('1591', '1582', '泗水县', '370831', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1592', '1582', '梁山县', '370832', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1593', '1582', '曲阜市', '370881', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('1594', '1582', '兖州市', '370882', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1595', '1582', '邹城市', '370883', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('1596', '1502', '泰安市', '370900', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('1598', '1596', '泰山区', '370902', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('1599', '1596', '岱岳区', '370911', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('1600', '1596', '宁阳县', '370921', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('1601', '1596', '东平县', '370923', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('1602', '1596', '新泰市', '370982', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1603', '1596', '肥城市', '370983', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('1604', '1502', '威海市', '371000', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('1606', '1604', '环翠区', '371002', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('1607', '1604', '文登市', '371081', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('1608', '1604', '荣成市', '371082', 'R', '0');
INSERT INTO `lr_china_city` VALUES ('1609', '1604', '乳山市', '371083', 'R', '0');
INSERT INTO `lr_china_city` VALUES ('1610', '1502', '日照市', '371100', 'R', '0');
INSERT INTO `lr_china_city` VALUES ('1612', '1610', '东港区', '371102', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('1613', '1610', '岚山区', '371103', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1614', '1610', '五莲县', '371121', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('1615', '1610', '莒县', '371122', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1616', '1502', '莱芜市', '371200', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1618', '1616', '莱城区', '371202', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1619', '1616', '钢城区', '371203', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('1620', '1502', '临沂市', '371300', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1622', '1620', '兰山区', '371302', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1623', '1620', '罗庄区', '371311', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1624', '1620', '河东区', '371312', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('1625', '1620', '沂南县', '371321', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1626', '1620', '郯城县', '371322', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1627', '1620', '沂水县', '371323', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1628', '1620', '苍山县', '371324', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('1629', '1620', '费县', '371325', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('1630', '1620', '平邑县', '371326', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('1631', '1620', '莒南县', '371327', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1632', '1620', '蒙阴县', '371328', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('1633', '1620', '临沭县', '371329', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1634', '1502', '德州市', '371400', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('1636', '1634', '德城区', '371402', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('1637', '1634', '陵县', '371421', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1638', '1634', '宁津县', '371422', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('1639', '1634', '庆云县', '371423', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('1640', '1634', '临邑县', '371424', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1641', '1634', '齐河县', '371425', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('1642', '1634', '平原县', '371426', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('1643', '1634', '夏津县', '371427', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1644', '1634', '武城县', '371428', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('1645', '1634', '乐陵市', '371481', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1646', '1634', '禹城市', '371482', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1647', '1502', '聊城市', '371500', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1649', '1647', '东昌府区', '371502', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('1650', '1647', '阳谷县', '371521', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1651', '1647', '莘县', '371522', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1652', '1647', '茌平县', '371523', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('1653', '1647', '东阿县', '371524', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('1654', '1647', '冠县', '371525', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('1655', '1647', '高唐县', '371526', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('1656', '1647', '临清市', '371581', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1657', '1502', '滨州市', '371600', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('1659', '1657', '滨城区', '371602', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('1660', '1657', '惠民县', '371621', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('1661', '1657', '阳信县', '371622', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1662', '1657', '无棣县', '371623', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('1663', '1657', '沾化县', '371624', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('1664', '1657', '博兴县', '371625', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('1665', '1657', '邹平县', '371626', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('1666', '1502', '菏泽市', '371700', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('1668', '1666', '牡丹区', '371702', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('1669', '1666', '曹县', '371721', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('1670', '1666', '单县', '371722', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1671', '1666', '成武县', '371723', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('1672', '1666', '巨野县', '371724', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1673', '1666', '郓城县', '371725', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1674', '1666', '鄄城县', '371726', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1675', '1666', '定陶县', '371727', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('1676', '1666', '东明县', '371728', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('1677', '0', '河南省', '410000', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('1678', '1677', '郑州市', '410100', 'Z', '1');
INSERT INTO `lr_china_city` VALUES ('1680', '1678', '中原区', '410102', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('1681', '1678', '二七区', '410103', 'E', '0');
INSERT INTO `lr_china_city` VALUES ('1682', '1678', '管城回族区', '410104', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('1683', '1678', '金水区', '410105', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1684', '1678', '上街区', '410106', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1685', '1678', '惠济区', '410108', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('1686', '1678', '中牟县', '410122', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('1687', '1678', '巩义市', '410181', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('1688', '1678', '荥阳市', '410182', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1689', '1678', '新密市', '410183', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1690', '1678', '新郑市', '410184', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1691', '1678', '登封市', '410185', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('1692', '1677', '开封市', '410200', 'K', '0');
INSERT INTO `lr_china_city` VALUES ('1694', '1692', '龙亭区', '410202', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1695', '1692', '顺河回族区', '410203', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1696', '1692', '鼓楼区', '410204', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('1697', '1692', '禹王台区', '410205', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1698', '1692', '金明区', '410211', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1699', '1692', '杞县', '410221', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('1700', '1692', '通许县', '410222', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('1701', '1692', '尉氏县', '410223', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('1702', '1692', '开封县', '410224', 'K', '0');
INSERT INTO `lr_china_city` VALUES ('1703', '1692', '兰考县', '410225', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1704', '1677', '洛阳市', '410300', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1706', '1704', '老城区', '410302', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1707', '1704', '西工区', '410303', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1708', '1704', '瀍河回族区', '410304', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('1709', '1704', '涧西区', '410305', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1710', '1704', '吉利区', '410306', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1711', '1704', '洛龙区', '410311', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1712', '1704', '孟津县', '410322', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('1713', '1704', '新安县', '410323', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1714', '1704', '栾川县', '410324', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1715', '1704', '嵩县', '410325', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1716', '1704', '汝阳县', '410326', 'R', '0');
INSERT INTO `lr_china_city` VALUES ('1717', '1704', '宜阳县', '410327', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1718', '1704', '洛宁县', '410328', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1719', '1704', '伊川县', '410329', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1720', '1704', '偃师市', '410381', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1721', '1677', '平顶山市', '410400', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('1723', '1721', '新华区', '410402', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1724', '1721', '卫东区', '410403', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('1725', '1721', '石龙区', '410404', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1726', '1721', '湛河区', '410411', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('1727', '1721', '宝丰县', '410421', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('1728', '1721', '叶县', '410422', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1729', '1721', '鲁山县', '410423', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1730', '1721', '郏县', '410425', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1731', '1721', '舞钢市', '410481', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('1732', '1721', '汝州市', '410482', 'R', '0');
INSERT INTO `lr_china_city` VALUES ('1733', '1677', '安阳市', '410500', 'A', '0');
INSERT INTO `lr_china_city` VALUES ('1735', '1733', '文峰区', '410502', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('1736', '1733', '北关区', '410503', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('1737', '1733', '殷都区', '410505', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1738', '1733', '龙安区', '410506', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1739', '1733', '安阳县', '410522', 'A', '0');
INSERT INTO `lr_china_city` VALUES ('1740', '1733', '汤阴县', '410523', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('1741', '1733', '滑县', '410526', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('1742', '1733', '内黄县', '410527', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('1743', '1733', '林州市', '410581', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1744', '1677', '鹤壁市', '410600', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('1746', '1744', '鹤山区', '410602', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('1747', '1744', '山城区', '410603', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1748', '1744', '淇滨区', '410611', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('1749', '1744', '浚县', '410621', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1750', '1744', '淇县', '410622', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('1751', '1677', '新乡市', '410700', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1753', '1751', '红旗区', '410702', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('1754', '1751', '卫滨区', '410703', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('1755', '1751', '凤泉区', '410704', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('1756', '1751', '牧野区', '410711', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('1757', '1751', '新乡县', '410721', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1758', '1751', '获嘉县', '410724', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('1759', '1751', '原阳县', '410725', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1760', '1751', '延津县', '410726', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1761', '1751', '封丘县', '410727', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('1762', '1751', '长垣县', '410728', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('1763', '1751', '卫辉市', '410781', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('1764', '1751', '辉县市', '410782', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('1765', '1677', '焦作市', '410800', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1767', '1765', '解放区', '410802', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1768', '1765', '中站区', '410803', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('1769', '1765', '马村区', '410804', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('1770', '1765', '山阳区', '410811', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1771', '1765', '修武县', '410821', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1772', '1765', '博爱县', '410822', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('1773', '1765', '武陟县', '410823', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('1774', '1765', '温县', '410825', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('1775', '1765', '沁阳市', '410882', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('1776', '1765', '孟州市', '410883', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('1777', '1677', '濮阳市', '410900', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('1779', '1777', '华龙区', '410902', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('1780', '1777', '清丰县', '410922', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('1781', '1777', '南乐县', '410923', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('1782', '1777', '范县', '410926', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('1783', '1777', '台前县', '410927', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('1784', '1777', '濮阳县', '410928', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('1785', '1677', '许昌市', '411000', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1787', '1785', '魏都区', '411002', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('1788', '1785', '许昌县', '411023', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1789', '1785', '鄢陵县', '411024', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1790', '1785', '襄城县', '411025', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1791', '1785', '禹州市', '411081', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1792', '1785', '长葛市', '411082', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('1793', '1677', '漯河市', '411100', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1795', '1793', '源汇区', '411102', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1796', '1793', '郾城区', '411103', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1797', '1793', '召陵区', '411104', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('1798', '1793', '舞阳县', '411121', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('1799', '1793', '临颍县', '411122', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1800', '1677', '三门峡市', '411200', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1802', '1800', '湖滨区', '411202', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('1803', '1800', '渑池县', '411221', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('1804', '1800', '陕县', '411222', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1805', '1800', '卢氏县', '411224', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1806', '1800', '义马市', '411281', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1807', '1800', '灵宝市', '411282', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1808', '1677', '南阳市', '411300', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('1810', '1808', '宛城区', '411302', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('1811', '1808', '卧龙区', '411303', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('1812', '1808', '南召县', '411321', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('1813', '1808', '方城县', '411322', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('1814', '1808', '西峡县', '411323', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1815', '1808', '镇平县', '411324', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('1816', '1808', '内乡县', '411325', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('1817', '1808', '淅川县', '411326', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1818', '1808', '社旗县', '411327', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1819', '1808', '唐河县', '411328', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('1820', '1808', '新野县', '411329', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1821', '1808', '桐柏县', '411330', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('1822', '1808', '邓州市', '411381', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('1823', '1677', '商丘市', '411400', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('1825', '1823', '梁园区', '411402', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1826', '1823', '睢阳区', '411403', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1827', '1823', '民权县', '411421', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('1828', '1823', '睢县', '411422', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1829', '1823', '宁陵县', '411423', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('1830', '1823', '柘城县', '411424', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('1831', '1823', '虞城县', '411425', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1832', '1823', '夏邑县', '411426', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1833', '1823', '永城市', '411481', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1834', '1677', '信阳市', '411500', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1836', '1834', '浉河区', '411502', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1837', '1834', '平桥区', '411503', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('1838', '1834', '罗山县', '411521', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1839', '1834', '光山县', '411522', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('1840', '1834', '新县', '411523', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1841', '1834', '商城县', '411524', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1842', '1834', '固始县', '411525', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('1843', '1834', '潢川县', '411526', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('1844', '1834', '淮滨县', '411527', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('1845', '1834', '息县', '411528', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1846', '1677', '周口市', '411600', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('1848', '1846', '川汇区', '411602', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('1849', '1846', '扶沟县', '411621', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('1850', '1846', '西华县', '411622', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1851', '1846', '商水县', '411623', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1852', '1846', '沈丘县', '411624', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1853', '1846', '郸城县', '411625', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('1854', '1846', '淮阳县', '411626', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('1855', '1846', '太康县', '411627', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('1856', '1846', '鹿邑县', '411628', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1857', '1846', '项城市', '411681', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1858', '1677', '驻马店市', '411700', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('1860', '1858', '驿城区', '411702', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1861', '1858', '西平县', '411721', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1862', '1858', '上蔡县', '411722', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1863', '1858', '平舆县', '411723', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('1864', '1858', '正阳县', '411724', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('1865', '1858', '确山县', '411725', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('1866', '1858', '泌阳县', '411726', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('1867', '1858', '汝南县', '411727', 'R', '0');
INSERT INTO `lr_china_city` VALUES ('1868', '1858', '遂平县', '411728', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1869', '1858', '新蔡县', '411729', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1870', '1677', '省直辖县级行政区划', '419000', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1871', '1870', '济源市', '419001', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1872', '0', '湖北省', '420000', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('1873', '1872', '武汉市', '420100', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('1875', '1873', '江岸区', '420102', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1876', '1873', '江汉区', '420103', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1877', '1873', '硚口区', '420104', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('1878', '1873', '汉阳区', '420105', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('1879', '1873', '武昌区', '420106', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('1880', '1873', '青山区', '420107', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('1881', '1873', '洪山区', '420111', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('1882', '1873', '东西湖区', '420112', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('1883', '1873', '汉南区', '420113', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('1884', '1873', '蔡甸区', '420114', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('1885', '1873', '江夏区', '420115', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1886', '1873', '黄陂区', '420116', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('1887', '1873', '新洲区', '420117', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1888', '1872', '黄石市', '420200', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('1890', '1888', '黄石港区', '420202', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('1891', '1888', '西塞山区', '420203', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1892', '1888', '下陆区', '420204', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1893', '1888', '铁山区', '420205', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('1894', '1888', '阳新县', '420222', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1895', '1888', '大冶市', '420281', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('1896', '1872', '十堰市', '420300', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1898', '1896', '茅箭区', '420302', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('1899', '1896', '张湾区', '420303', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('1900', '1896', '郧县', '420321', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1901', '1896', '郧西县', '420322', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1902', '1896', '竹山县', '420323', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('1903', '1896', '竹溪县', '420324', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('1904', '1896', '房县', '420325', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('1905', '1896', '丹江口市', '420381', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('1906', '1872', '宜昌市', '420500', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1908', '1906', '西陵区', '420502', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1909', '1906', '伍家岗区', '420503', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('1910', '1906', '点军区', '420504', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('1911', '1906', '猇亭区', '420505', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1912', '1906', '夷陵区', '420506', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1913', '1906', '远安县', '420525', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1914', '1906', '兴山县', '420526', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1915', '1906', '秭归县', '420527', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('1916', '1906', '长阳土家族自治县', '420528', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('1917', '1906', '五峰土家族自治县', '420529', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('1918', '1906', '宜都市', '420581', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1919', '1906', '当阳市', '420582', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('1920', '1906', '枝江市', '420583', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('1921', '1872', '襄樊市', '420600', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1923', '1921', '襄城区', '420602', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1924', '1921', '樊城区', '420606', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('1925', '1921', '襄阳区', '420607', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1926', '1921', '南漳县', '420624', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('1927', '1921', '谷城县', '420625', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('1928', '1921', '保康县', '420626', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('1929', '1921', '老河口市', '420682', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1930', '1921', '枣阳市', '420683', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('1931', '1921', '宜城市', '420684', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1932', '1872', '鄂州市', '420700', 'E', '0');
INSERT INTO `lr_china_city` VALUES ('1934', '1932', '梁子湖区', '420702', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1935', '1932', '华容区', '420703', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('1936', '1932', '鄂城区', '420704', 'E', '0');
INSERT INTO `lr_china_city` VALUES ('1937', '1872', '荆门市', '420800', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1939', '1937', '东宝区', '420802', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('1940', '1937', '掇刀区', '420804', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('1941', '1937', '京山县', '420821', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1942', '1937', '沙洋县', '420822', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1943', '1937', '钟祥市', '420881', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('1944', '1872', '孝感市', '420900', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1946', '1944', '孝南区', '420902', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1947', '1944', '孝昌县', '420921', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1948', '1944', '大悟县', '420922', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('1949', '1944', '云梦县', '420923', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1950', '1944', '应城市', '420981', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1951', '1944', '安陆市', '420982', 'A', '0');
INSERT INTO `lr_china_city` VALUES ('1952', '1944', '汉川市', '420984', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('1953', '1872', '荆州市', '421000', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1955', '1953', '沙市区', '421002', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1956', '1953', '荆州区', '421003', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1957', '1953', '公安县', '421022', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('1958', '1953', '监利县', '421023', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1959', '1953', '江陵县', '421024', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1960', '1953', '石首市', '421081', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1961', '1953', '洪湖市', '421083', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('1962', '1953', '松滋市', '421087', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1963', '1872', '黄冈市', '421100', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('1965', '1963', '黄州区', '421102', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('1966', '1963', '团风县', '421121', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('1967', '1963', '红安县', '421122', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('1968', '1963', '罗田县', '421123', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1969', '1963', '英山县', '421124', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('1970', '1963', '浠水县', '421125', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1971', '1963', '蕲春县', '421126', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('1972', '1963', '黄梅县', '421127', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('1973', '1963', '麻城市', '421181', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('1974', '1963', '武穴市', '421182', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('1975', '1872', '咸宁市', '421200', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1977', '1975', '咸安区', '421202', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1978', '1975', '嘉鱼县', '421221', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1979', '1975', '通城县', '421222', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('1980', '1975', '崇阳县', '421223', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('1981', '1975', '通山县', '421224', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('1982', '1975', '赤壁市', '421281', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('1983', '1872', '随州市', '421300', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1985', '1983', '曾都区', '421302', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('1986', '1983', '广水市', '421381', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('1987', '1872', '恩施土家族苗族自治州', '422800', 'E', '0');
INSERT INTO `lr_china_city` VALUES ('1988', '1987', '恩施市', '422801', 'E', '0');
INSERT INTO `lr_china_city` VALUES ('1989', '1987', '利川市', '422802', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1990', '1987', '建始县', '422822', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('1991', '1987', '巴东县', '422823', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('1992', '1987', '宣恩县', '422825', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1993', '1987', '咸丰县', '422826', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1994', '1987', '来凤县', '422827', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('1995', '1987', '鹤峰县', '422828', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('1996', '1872', '省直辖县级行政区划', '429000', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('1997', '1996', '仙桃市', '429004', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('1998', '1996', '潜江市', '429005', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('1999', '1996', '天门市', '429006', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('2000', '1996', '神农架林区', '429021', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('2001', '0', '湖南省', '430000', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('2002', '2001', '长沙市', '430100', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('2004', '2002', '芙蓉区', '430102', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('2005', '2002', '天心区', '430103', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('2006', '2002', '岳麓区', '430104', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2007', '2002', '开福区', '430105', 'K', '0');
INSERT INTO `lr_china_city` VALUES ('2008', '2002', '雨花区', '430111', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2009', '2002', '长沙县', '430121', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('2010', '2002', '望城县', '430122', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('2011', '2002', '宁乡县', '430124', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('2012', '2002', '浏阳市', '430181', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2013', '2001', '株洲市', '430200', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('2015', '2013', '荷塘区', '430202', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('2016', '2013', '芦淞区', '430203', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2017', '2013', '石峰区', '430204', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('2018', '2013', '天元区', '430211', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('2019', '2013', '株洲县', '430221', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('2020', '2013', '攸县', '430223', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2021', '2013', '茶陵县', '430224', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('2022', '2013', '炎陵县', '430225', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2023', '2013', '醴陵市', '430281', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2024', '2001', '湘潭市', '430300', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('2026', '2024', '雨湖区', '430302', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2027', '2024', '岳塘区', '430304', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2028', '2024', '湘潭县', '430321', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('2029', '2024', '湘乡市', '430381', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('2030', '2024', '韶山市', '430382', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('2031', '2001', '衡阳市', '430400', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('2033', '2031', '珠晖区', '430405', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('2034', '2031', '雁峰区', '430406', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2035', '2031', '石鼓区', '430407', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('2036', '2031', '蒸湘区', '430408', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('2037', '2031', '南岳区', '430412', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('2038', '2031', '衡阳县', '430421', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('2039', '2031', '衡南县', '430422', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('2040', '2031', '衡山县', '430423', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('2041', '2031', '衡东县', '430424', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('2042', '2031', '祁东县', '430426', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('2043', '2031', '耒阳市', '430481', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2044', '2031', '常宁市', '430482', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('2045', '2001', '邵阳市', '430500', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('2047', '2045', '双清区', '430502', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('2048', '2045', '大祥区', '430503', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('2049', '2045', '北塔区', '430511', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('2050', '2045', '邵东县', '430521', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('2051', '2045', '新邵县', '430522', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('2052', '2045', '邵阳县', '430523', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('2053', '2045', '隆回县', '430524', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2054', '2045', '洞口县', '430525', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('2055', '2045', '绥宁县', '430527', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('2056', '2045', '新宁县', '430528', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('2057', '2045', '城步苗族自治县', '430529', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('2058', '2045', '武冈市', '430581', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('2059', '2001', '岳阳市', '430600', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2061', '2059', '岳阳楼区', '430602', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2062', '2059', '云溪区', '430603', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2063', '2059', '君山区', '430611', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('2064', '2059', '岳阳县', '430621', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2065', '2059', '华容县', '430623', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('2066', '2059', '湘阴县', '430624', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('2067', '2059', '平江县', '430626', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('2068', '2059', '汨罗市', '430681', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('2069', '2059', '临湘市', '430682', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2070', '2001', '常德市', '430700', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('2072', '2070', '武陵区', '430702', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('2073', '2070', '鼎城区', '430703', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('2074', '2070', '安乡县', '430721', 'A', '0');
INSERT INTO `lr_china_city` VALUES ('2075', '2070', '汉寿县', '430722', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('2076', '2070', '澧县', '430723', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2077', '2070', '临澧县', '430724', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2078', '2070', '桃源县', '430725', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('2079', '2070', '石门县', '430726', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('2080', '2070', '津市市', '430781', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('2081', '2001', '张家界市', '430800', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('2083', '2081', '永定区', '430802', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2084', '2081', '武陵源区', '430811', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('2085', '2081', '慈利县', '430821', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('2086', '2081', '桑植县', '430822', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('2087', '2001', '益阳市', '430900', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2089', '2087', '资阳区', '430902', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('2090', '2087', '赫山区', '430903', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('2091', '2087', '南县', '430921', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('2092', '2087', '桃江县', '430922', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('2093', '2087', '安化县', '430923', 'A', '0');
INSERT INTO `lr_china_city` VALUES ('2094', '2087', '沅江市', '430981', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2095', '2001', '郴州市', '431000', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('2097', '2095', '北湖区', '431002', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('2098', '2095', '苏仙区', '431003', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('2099', '2095', '桂阳县', '431021', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('2100', '2095', '宜章县', '431022', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2101', '2095', '永兴县', '431023', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2102', '2095', '嘉禾县', '431024', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('2103', '2095', '临武县', '431025', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2104', '2095', '汝城县', '431026', 'R', '0');
INSERT INTO `lr_china_city` VALUES ('2105', '2095', '桂东县', '431027', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('2106', '2095', '安仁县', '431028', 'A', '0');
INSERT INTO `lr_china_city` VALUES ('2107', '2095', '资兴市', '431081', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('2108', '2001', '永州市', '431100', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2110', '2108', '零陵区', '431102', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2111', '2108', '冷水滩区', '431103', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2112', '2108', '祁阳县', '431121', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('2113', '2108', '东安县', '431122', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('2114', '2108', '双牌县', '431123', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('2115', '2108', '道县', '431124', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('2116', '2108', '江永县', '431125', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('2117', '2108', '宁远县', '431126', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('2118', '2108', '蓝山县', '431127', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2119', '2108', '新田县', '431128', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('2120', '2108', '江华瑶族自治县', '431129', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('2121', '2001', '怀化市', '431200', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('2123', '2121', '鹤城区', '431202', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('2124', '2121', '中方县', '431221', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('2125', '2121', '沅陵县', '431222', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2126', '2121', '辰溪县', '431223', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('2127', '2121', '溆浦县', '431224', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('2128', '2121', '会同县', '431225', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('2129', '2121', '麻阳苗族自治县', '431226', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('2130', '2121', '新晃侗族自治县', '431227', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('2131', '2121', '芷江侗族自治县', '431228', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('2132', '2121', '靖州苗族侗族自治县', '431229', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('2133', '2121', '通道侗族自治县', '431230', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('2134', '2121', '洪江市', '431281', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('2135', '2001', '娄底市', '431300', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2137', '2135', '娄星区', '431302', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2138', '2135', '双峰县', '431321', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('2139', '2135', '新化县', '431322', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('2140', '2135', '冷水江市', '431381', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2141', '2135', '涟源市', '431382', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2142', '2001', '湘西土家族苗族自治州', '433100', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('2143', '2142', '吉首市', '433101', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('2144', '2142', '泸溪县', '433122', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('2145', '2142', '凤凰县', '433123', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('2146', '2142', '花垣县', '433124', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('2147', '2142', '保靖县', '433125', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('2148', '2142', '古丈县', '433126', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('2149', '2142', '永顺县', '433127', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2150', '2142', '龙山县', '433130', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2151', '0', '广东省', '440000', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('2152', '2151', '广州市', '440100', 'G', '1');
INSERT INTO `lr_china_city` VALUES ('2154', '2152', '荔湾区', '440103', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2155', '2152', '越秀区', '440104', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2156', '2152', '海珠区', '440105', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('2157', '2152', '天河区', '440106', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('2158', '2152', '白云区', '440111', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('2159', '2152', '黄埔区', '440112', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('2160', '2152', '番禺区', '440113', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('2161', '2152', '花都区', '440114', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('2162', '2152', '南沙区', '440115', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('2163', '2152', '萝岗区', '440116', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2164', '2152', '增城市', '440183', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('2165', '2152', '从化市', '440184', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('2166', '2151', '韶关市', '440200', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('2168', '2166', '武江区', '440203', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('2169', '2166', '浈江区', '440204', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('2170', '2166', '曲江区', '440205', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('2171', '2166', '始兴县', '440222', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('2172', '2166', '仁化县', '440224', 'R', '0');
INSERT INTO `lr_china_city` VALUES ('2173', '2166', '翁源县', '440229', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('2174', '2166', '乳源瑶族自治县', '440232', 'R', '0');
INSERT INTO `lr_china_city` VALUES ('2175', '2166', '新丰县', '440233', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('2176', '2166', '乐昌市', '440281', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2177', '2166', '南雄市', '440282', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('2178', '2151', '深圳市', '440300', 'S', '1');
INSERT INTO `lr_china_city` VALUES ('2180', '2178', '罗湖区', '440303', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2181', '2178', '福田区', '440304', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('2182', '2178', '南山区', '440305', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('2183', '2178', '宝安区', '440306', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('2184', '2178', '龙岗区', '440307', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2185', '2178', '盐田区', '440308', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2186', '2151', '珠海市', '440400', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('2188', '2186', '香洲区', '440402', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('2189', '2186', '斗门区', '440403', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('2190', '2186', '金湾区', '440404', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('2191', '2151', '汕头市', '440500', 'S', '1');
INSERT INTO `lr_china_city` VALUES ('2193', '2191', '龙湖区', '440507', 'l', '0');
INSERT INTO `lr_china_city` VALUES ('2194', '2191', '金平区', '440511', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('2195', '2191', '濠江区', '440512', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('2196', '2191', '潮阳区', '440513', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('2197', '2191', '潮南区', '440514', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('2198', '2191', '澄海区', '440515', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('2199', '2191', '南澳县', '440523', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('2200', '2151', '佛山市', '440600', 'F', '1');
INSERT INTO `lr_china_city` VALUES ('2202', '2200', '禅城区', '440604', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('2203', '2200', '南海区', '440605', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('2204', '2200', '顺德区', '440606', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('2205', '2200', '三水区', '440607', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('2206', '2200', '高明区', '440608', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('2207', '2151', '江门市', '440700', 'J', '1');
INSERT INTO `lr_china_city` VALUES ('2209', '2207', '蓬江区', '440703', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('2210', '2207', '江海区', '440704', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('2211', '2207', '新会区', '440705', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('2212', '2207', '台山市', '440781', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('2213', '2207', '开平市', '440783', 'K', '0');
INSERT INTO `lr_china_city` VALUES ('2214', '2207', '鹤山市', '440784', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('2215', '2207', '恩平市', '440785', 'E', '0');
INSERT INTO `lr_china_city` VALUES ('2216', '2151', '湛江市', '440800', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('2218', '2216', '赤坎区', '440802', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('2219', '2216', '霞山区', '440803', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('2220', '2216', '坡头区', '440804', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('2221', '2216', '麻章区', '440811', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('2222', '2216', '遂溪县', '440823', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('2223', '2216', '徐闻县', '440825', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('2224', '2216', '廉江市', '440881', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2225', '2216', '雷州市', '440882', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2226', '2216', '吴川市', '440883', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('2227', '2151', '茂名市', '440900', 'M', '1');
INSERT INTO `lr_china_city` VALUES ('2229', '2227', '茂南区', '440902', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('2230', '2227', '茂港区', '440903', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('2231', '2227', '电白县', '440923', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('2232', '2227', '高州市', '440981', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('2233', '2227', '化州市', '440982', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('2234', '2227', '信宜市', '440983', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('2235', '2151', '肇庆市', '441200', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('2237', '2235', '端州区', '441202', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('2238', '2235', '鼎湖区', '441203', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('2239', '2235', '广宁县', '441223', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('2240', '2235', '怀集县', '441224', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('2241', '2235', '封开县', '441225', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('2242', '2235', '德庆县', '441226', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('2243', '2235', '高要市', '441283', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('2244', '2235', '四会市', '441284', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('2245', '2151', '惠州市', '441300', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('2247', '2245', '惠城区', '441302', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('2248', '2245', '惠阳区', '441303', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('2249', '2245', '博罗县', '441322', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('2250', '2245', '惠东县', '441323', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('2251', '2245', '龙门县', '441324', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2252', '2151', '梅州市', '441400', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('2254', '2252', '梅江区', '441402', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('2255', '2252', '梅县', '441421', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('2256', '2252', '大埔县', '441422', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('2257', '2252', '丰顺县', '441423', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('2258', '2252', '五华县', '441424', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('2259', '2252', '平远县', '441426', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('2260', '2252', '蕉岭县', '441427', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('2261', '2252', '兴宁市', '441481', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('2262', '2151', '汕尾市', '441500', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('2264', '2262', '城区', '441502', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('2265', '2262', '海丰县', '441521', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('2266', '2262', '陆河县', '441523', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2267', '2262', '陆丰市', '441581', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2268', '2151', '河源市', '441600', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('2270', '2268', '源城区', '441602', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2271', '2268', '紫金县', '441621', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('2272', '2268', '龙川县', '441622', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2273', '2268', '连平县', '441623', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2274', '2268', '和平县', '441624', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('2275', '2268', '东源县', '441625', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('2276', '2151', '阳江市', '441700', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2278', '2276', '江城区', '441702', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('2279', '2276', '阳西县', '441721', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2280', '2276', '阳东县', '441723', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2281', '2276', '阳春市', '441781', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2282', '2151', '清远市', '441800', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('2284', '2282', '清城区', '441802', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('2285', '2282', '佛冈县', '441821', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('2286', '2282', '阳山县', '441823', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2287', '2282', '连山壮族瑶族自治县', '441825', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2288', '2282', '连南瑶族自治县', '441826', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2289', '2282', '清新县', '441827', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('2290', '2282', '英德市', '441881', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2291', '2282', '连州市', '441882', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2292', '2151', '东莞市', '441900', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('2293', '2151', '中山市', '442000', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('2294', '2151', '潮州市', '445100', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('2296', '2294', '湘桥区', '445102', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('2297', '2294', '潮安县', '445121', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('2298', '2294', '饶平县', '445122', 'R', '0');
INSERT INTO `lr_china_city` VALUES ('2299', '2151', '揭阳市', '445200', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('2301', '2299', '榕城区', '445202', 'R', '0');
INSERT INTO `lr_china_city` VALUES ('2302', '2299', '揭东县', '445221', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('2303', '2299', '揭西县', '445222', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('2304', '2299', '惠来县', '445224', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('2305', '2299', '普宁市', '445281', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('2306', '2151', '云浮市', '445300', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2308', '2306', '云城区', '445302', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2309', '2306', '新兴县', '445321', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('2310', '2306', '郁南县', '445322', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2311', '2306', '云安县', '445323', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2312', '2306', '罗定市', '445381', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2313', '0', '广西壮族自治区', '450000', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('2314', '2313', '南宁市', '450100', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('2316', '2314', '兴宁区', '450102', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('2317', '2314', '青秀区', '450103', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('2318', '2314', '江南区', '450105', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('2319', '2314', '西乡塘区', '450107', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('2320', '2314', '良庆区', '450108', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2321', '2314', '邕宁区', '450109', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2322', '2314', '武鸣县', '450122', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('2323', '2314', '隆安县', '450123', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2324', '2314', '马山县', '450124', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('2325', '2314', '上林县', '450125', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('2326', '2314', '宾阳县', '450126', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('2327', '2314', '横县', '450127', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('2328', '2313', '柳州市', '450200', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2330', '2328', '城中区', '450202', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('2331', '2328', '鱼峰区', '450203', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2332', '2328', '柳南区', '450204', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2333', '2328', '柳北区', '450205', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2334', '2328', '柳江县', '450221', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2335', '2328', '柳城县', '450222', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2336', '2328', '鹿寨县', '450223', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2337', '2328', '融安县', '450224', 'R', '0');
INSERT INTO `lr_china_city` VALUES ('2338', '2328', '融水苗族自治县', '450225', 'R', '0');
INSERT INTO `lr_china_city` VALUES ('2339', '2328', '三江侗族自治县', '450226', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('2340', '2313', '桂林市', '450300', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('2342', '2340', '秀峰区', '450302', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('2343', '2340', '叠彩区', '450303', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('2344', '2340', '象山区', '450304', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('2345', '2340', '七星区', '450305', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('2346', '2340', '雁山区', '450311', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2347', '2340', '阳朔县', '450321', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2348', '2340', '临桂县', '450322', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2349', '2340', '灵川县', '450323', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2350', '2340', '全州县', '450324', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('2351', '2340', '兴安县', '450325', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('2352', '2340', '永福县', '450326', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2353', '2340', '灌阳县', '450327', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('2354', '2340', '龙胜各族自治县', '450328', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2355', '2340', '资源县', '450329', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('2356', '2340', '平乐县', '450330', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('2357', '2340', '荔蒲县', '450331', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2358', '2340', '恭城瑶族自治县', '450332', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('2359', '2313', '梧州市', '450400', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('2361', '2359', '万秀区', '450403', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('2362', '2359', '蝶山区', '450404', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('2363', '2359', '长洲区', '450405', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('2364', '2359', '苍梧县', '450421', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('2365', '2359', '藤县', '450422', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('2366', '2359', '蒙山县', '450423', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('2367', '2359', '岑溪市', '450481', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('2368', '2313', '北海市', '450500', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('2370', '2368', '海城区', '450502', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('2371', '2368', '银海区', '450503', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2372', '2368', '铁山港区', '450512', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('2373', '2368', '合浦县', '450521', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('2374', '2313', '防城港市', '450600', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('2376', '2374', '港口区', '450602', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('2377', '2374', '防城区', '450603', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('2378', '2374', '上思县', '450621', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('2379', '2374', '东兴市', '450681', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('2380', '2313', '钦州市', '450700', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('2382', '2380', '钦南区', '450702', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('2383', '2380', '钦北区', '450703', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('2384', '2380', '灵山县', '450721', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2385', '2380', '浦北县', '450722', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('2386', '2313', '贵港市', '450800', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('2388', '2386', '港北区', '450802', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('2389', '2386', '港南区', '450803', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('2390', '2386', '覃塘区', '450804', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('2391', '2386', '平南县', '450821', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('2392', '2386', '桂平市', '450881', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('2393', '2313', '玉林市', '450900', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2395', '2393', '玉州区', '450902', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2396', '2393', '容县', '450921', 'R', '0');
INSERT INTO `lr_china_city` VALUES ('2397', '2393', '陆川县', '450922', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2398', '2393', '博白县', '450923', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('2399', '2393', '兴业县', '450924', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('2400', '2393', '北流市', '450981', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('2401', '2313', '百色市', '451000', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('2403', '2401', '右江区', '451002', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2404', '2401', '田阳县', '451021', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('2405', '2401', '田东县', '451022', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('2406', '2401', '平果县', '451023', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('2407', '2401', '德保县', '451024', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('2408', '2401', '靖西县', '451025', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('2409', '2401', '那坡县', '451026', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('2410', '2401', '凌云县', '451027', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2411', '2401', '乐业县', '451028', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2412', '2401', '田林县', '451029', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('2413', '2401', '西林县', '451030', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('2414', '2401', '隆林各族自治县', '451031', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2415', '2313', '贺州市', '451100', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('2417', '2415', '八步区', '451102', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('2418', '2415', '昭平县', '451121', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('2419', '2415', '钟山县', '451122', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('2420', '2415', '富川瑶族自治县', '451123', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('2421', '2313', '河池市', '451200', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('2423', '2421', '金城江区', '451202', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('2424', '2421', '南丹县', '451221', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('2425', '2421', '天峨县', '451222', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('2426', '2421', '凤山县', '451223', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('2427', '2421', '东兰县', '451224', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('2428', '2421', '罗城仫佬族自治县', '451225', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2429', '2421', '环江毛南族自治县', '451226', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('2430', '2421', '巴马瑶族自治县', '451227', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('2431', '2421', '都安瑶族自治县', '451228', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('2432', '2421', '大化瑶族自治县', '451229', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('2433', '2421', '宜州市', '451281', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2434', '2313', '来宾市', '451300', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2436', '2434', '兴宾区', '451302', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('2437', '2434', '忻城县', '451321', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('2438', '2434', '象州县', '451322', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('2439', '2434', '武宣县', '451323', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('2440', '2434', '金秀瑶族自治县', '451324', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('2441', '2434', '合山市', '451381', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('2442', '2313', '崇左市', '451400', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('2444', '2442', '江洲区', '451402', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('2445', '2442', '扶绥县', '451421', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('2446', '2442', '宁明县', '451422', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('2447', '2442', '龙州县', '451423', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2448', '2442', '大新县', '451424', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('2449', '2442', '天等县', '451425', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('2450', '2442', '凭祥市', '451481', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('2451', '0', '海南省', '460000', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('2452', '2451', '海口市', '460100', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('2454', '2452', '秀英区', '460105', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('2455', '2452', '龙华区', '460106', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2456', '2452', '琼山区', '460107', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('2457', '2452', '美兰区', '460108', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('2458', '2451', '三亚市', '460200', 'S', '1');
INSERT INTO `lr_china_city` VALUES ('2460', '2451', '省直辖县级行政区划', '469000', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('2461', '2460', '五指山市', '469001', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('2462', '2460', '琼海市', '469002', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('2463', '2460', '儋州市', '469003', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('2464', '2460', '文昌市', '469005', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('2465', '2460', '万宁市', '469006', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('2466', '2460', '东方市', '469007', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('2467', '2460', '定安县', '469021', 'A', '0');
INSERT INTO `lr_china_city` VALUES ('2468', '2460', '屯昌县', '469022', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('2469', '2460', '澄迈县', '469023', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('2470', '2460', '临高县', '469024', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2471', '2460', '白沙黎族自治县', '469025', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('2472', '2460', '昌江黎族自治县', '469026', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('2473', '2460', '乐东黎族自治县', '469027', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2474', '2460', '陵水黎族自治县', '469028', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2475', '2460', '保亭黎族苗族自治县', '469029', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('2476', '2460', '琼中黎族苗族自治县', '469030', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('2477', '2460', '西沙群岛', '469031', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('2478', '2460', '南沙群岛', '469032', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('2479', '2460', '中沙群岛的岛礁及其海域', '469033', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('2480', '0', '重庆市', '500000', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('2481', '2480', '重庆市', '500000', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('2482', '2481', '万州区', '500101', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('2483', '2481', '涪陵区', '500102', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('2484', '2481', '渝中区', '500103', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2485', '2481', '大渡口区', '500104', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('2486', '2481', '江北区', '500105', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('2487', '2481', '沙坪坝区', '500106', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('2488', '2481', '九龙坡区', '500107', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('2489', '2481', '南岸区', '500108', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('2490', '2481', '北碚区', '500109', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('2491', '2481', '万盛区', '500110', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('2492', '2481', '双桥区', '500111', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('2493', '2481', '渝北区', '500112', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2494', '2481', '巴南区', '500113', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('2495', '2481', '黔江区', '500114', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('2496', '2481', '长寿区', '500115', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('2497', '2481', '江津区', '500116', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('2498', '2481', '合川区', '500117', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('2499', '2481', '永川区', '500118', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2500', '2481', '南川区', '500119', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('2501', '2480', '县', '500200', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('2502', '2501', '綦江县', '500222', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('2503', '2501', '潼南县', '500223', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('2504', '2501', '铜梁县', '500224', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('2505', '2501', '大足县', '500225', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('2506', '2501', '荣昌县', '500226', 'R', '0');
INSERT INTO `lr_china_city` VALUES ('2507', '2501', '璧山县', '500227', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('2508', '2501', '梁平县', '500228', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2509', '2501', '城口县', '500229', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('2510', '2501', '丰都县', '500230', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('2511', '2501', '垫江县', '500231', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('2512', '2501', '武隆县', '500232', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('2513', '2501', '忠县', '500233', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('2514', '2501', '开县', '500234', 'K', '0');
INSERT INTO `lr_china_city` VALUES ('2515', '2501', '云阳县', '500235', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2516', '2501', '奉节县', '500236', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('2517', '2501', '巫山县', '500237', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('2518', '2501', '巫溪县', '500238', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('2519', '2501', '石柱土家族自治县', '500240', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('2520', '2501', '秀山土家族苗族自治县', '500241', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('2521', '2501', '酉阳土家族苗族自治县', '500242', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2522', '2501', '彭水苗族土家族自治县', '500243', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('2523', '0', '四川省', '510000', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('2524', '2523', '成都市', '510100', 'C', '1');
INSERT INTO `lr_china_city` VALUES ('2526', '2524', '锦江区', '510104', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('2527', '2524', '青羊区', '510105', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('2528', '2524', '金牛区', '510106', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('2529', '2524', '武侯区', '510107', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('2530', '2524', '成华区', '510108', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('2531', '2524', '龙泉驿区', '510112', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2532', '2524', '青白江区', '510113', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('2533', '2524', '新都区', '510114', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('2534', '2524', '温江区', '510115', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('2535', '2524', '金堂县', '510121', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('2536', '2524', '双流县', '510122', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('2537', '2524', '郫县', '510124', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('2538', '2524', '大邑县', '510129', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('2539', '2524', '蒲江县', '510131', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('2540', '2524', '新津县', '510132', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('2541', '2524', '都江堰市', '510181', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('2542', '2524', '彭州市', '510182', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('2543', '2524', '邛崃市', '510183', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('2544', '2524', '崇州市', '510184', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('2545', '2523', '自贡市', '510300', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('2547', '2545', '自流井区', '510302', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('2548', '2545', '贡井区', '510303', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('2549', '2545', '大安区', '510304', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('2550', '2545', '沿滩区', '510311', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2551', '2545', '荣县', '510321', 'R', '0');
INSERT INTO `lr_china_city` VALUES ('2552', '2545', '富顺县', '510322', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('2553', '2523', '攀枝花市', '510400', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('2555', '2553', '东区', '510402', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('2556', '2553', '西区', '510403', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('2557', '2553', '仁和区', '510411', 'R', '0');
INSERT INTO `lr_china_city` VALUES ('2558', '2553', '米易县', '510421', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('2559', '2553', '盐边县', '510422', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2560', '2523', '泸州市', '510500', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2562', '2560', '江阳区', '510502', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('2563', '2560', '纳溪区', '510503', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('2564', '2560', '龙马潭区', '510504', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2565', '2560', '泸县', '510521', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2566', '2560', '合江县', '510522', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('2567', '2560', '叙永县', '510524', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('2568', '2560', '古蔺县', '510525', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('2569', '2523', '德阳市', '510600', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('2571', '2569', '旌阳区', '510603', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('2572', '2569', '中江县', '510623', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('2573', '2569', '罗江县', '510626', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2574', '2569', '广汉市', '510681', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('2575', '2569', '什邡市', '510682', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('2576', '2569', '绵竹市', '510683', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('2577', '2523', '绵阳市', '510700', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('2579', '2577', '涪城区', '510703', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('2580', '2577', '游仙区', '510704', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2581', '2577', '三台县', '510722', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('2582', '2577', '盐亭县', '510723', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2583', '2577', '安县', '510724', 'A', '0');
INSERT INTO `lr_china_city` VALUES ('2584', '2577', '梓潼县', '510725', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('2585', '2577', '北川羌族自治县', '510726', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('2586', '2577', '平武县', '510727', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('2587', '2577', '江油市', '510781', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('2588', '2523', '广元市', '510800', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('2590', '2588', '市中区', '510802', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('2591', '2588', '元坝区', '510811', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2592', '2588', '朝天区', '510812', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('2593', '2588', '旺苍县', '510821', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('2594', '2588', '青川县', '510822', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('2595', '2588', '剑阁县', '510823', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('2596', '2588', '苍溪县', '510824', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('2597', '2523', '遂宁市', '510900', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('2599', '2597', '船山区', '510903', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('2600', '2597', '安居区', '510904', 'A', '0');
INSERT INTO `lr_china_city` VALUES ('2601', '2597', '蓬溪县', '510921', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('2602', '2597', '射洪县', '510922', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('2603', '2597', '大英县', '510923', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('2604', '2523', '内江市', '511000', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('2606', '2604', '市中区', '511002', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('2607', '2604', '东兴区', '511011', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('2608', '2604', '威远县', '511024', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('2609', '2604', '资中县', '511025', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('2610', '2604', '隆昌县', '511028', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2611', '2523', '乐山市', '511100', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2613', '2611', '市中区', '511102', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('2614', '2611', '沙湾区', '511111', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('2615', '2611', '五通桥区', '511112', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('2616', '2611', '金口河区', '511113', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('2617', '2611', '犍为县', '511123', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('2618', '2611', '井研县', '511124', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('2619', '2611', '夹江县', '511126', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('2620', '2611', '沐川县', '511129', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('2621', '2611', '峨边彝族自治县', '511132', 'E', '0');
INSERT INTO `lr_china_city` VALUES ('2622', '2611', '马边彝族自治县', '511133', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('2623', '2611', '峨眉山市', '511181', 'E', '0');
INSERT INTO `lr_china_city` VALUES ('2624', '2523', '南充市', '511300', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('2626', '2624', '顺庆区', '511302', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('2627', '2624', '高坪区', '511303', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('2628', '2624', '嘉陵区', '511304', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('2629', '2624', '南部县', '511321', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('2630', '2624', '营山县', '511322', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2631', '2624', '蓬安县', '511323', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('2632', '2624', '仪陇县', '511324', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2633', '2624', '西充县', '511325', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('2634', '2624', '阆中市', '511381', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2635', '2523', '眉山市', '511400', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('2637', '2635', '东坡区', '511402', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('2638', '2635', '仁寿县', '511421', 'R', '0');
INSERT INTO `lr_china_city` VALUES ('2639', '2635', '彭山县', '511422', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('2640', '2635', '洪雅县', '511423', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('2641', '2635', '丹棱县', '511424', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('2642', '2635', '青神县', '511425', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('2643', '2523', '宜宾市', '511500', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2645', '2643', '翠屏区', '511502', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('2646', '2643', '宜宾县', '511521', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2647', '2643', '南溪县', '511522', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('2648', '2643', '江安县', '511523', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('2649', '2643', '长宁县', '511524', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('2650', '2643', '高县', '511525', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('2651', '2643', '珙县', '511526', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('2652', '2643', '筠连县', '511527', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('2653', '2643', '兴文县', '511528', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('2654', '2643', '屏山县', '511529', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('2655', '2523', '广安市', '511600', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('2657', '2655', '广安区', '511602', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('2658', '2655', '岳池县', '511621', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2659', '2655', '武胜县', '511622', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('2660', '2655', '邻水县', '511623', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2661', '2655', '华蓥市', '511681', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('2662', '2523', '达州市', '511700', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('2664', '2662', '通川区', '511702', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('2665', '2662', '达县', '511721', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('2666', '2662', '宣汉县', '511722', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('2667', '2662', '开江县', '511723', 'K', '0');
INSERT INTO `lr_china_city` VALUES ('2668', '2662', '大竹县', '511724', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('2669', '2662', '渠县', '511725', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('2670', '2662', '万源市', '511781', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('2671', '2523', '雅安市', '511800', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2673', '2671', '雨城区', '511802', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2674', '2671', '名山县', '511821', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('2675', '2671', '荥经县', '511822', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('2676', '2671', '汉源县', '511823', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('2677', '2671', '石棉县', '511824', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('2678', '2671', '天全县', '511825', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('2679', '2671', '芦山县', '511826', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2680', '2671', '宝兴县', '511827', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('2681', '2523', '巴中市', '511900', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('2683', '2681', '巴州区', '511902', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('2684', '2681', '通江县', '511921', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('2685', '2681', '南江县', '511922', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('2686', '2681', '平昌县', '511923', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('2687', '2523', '资阳市', '512000', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('2689', '2687', '雁江区', '512002', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2690', '2687', '安岳县', '512021', 'A', '0');
INSERT INTO `lr_china_city` VALUES ('2691', '2687', '乐至县', '512022', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2692', '2687', '简阳市', '512081', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('2693', '2523', '阿坝藏族羌族自治州', '513200', 'A', '0');
INSERT INTO `lr_china_city` VALUES ('2694', '2693', '汶川县', '513221', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('2695', '2693', '理县', '513222', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2696', '2693', '茂县', '513223', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('2697', '2693', '松潘县', '513224', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('2698', '2693', '九寨沟县', '513225', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('2699', '2693', '金川县', '513226', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('2700', '2693', '小金县', '513227', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('2701', '2693', '黑水县', '513228', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('2702', '2693', '马尔康县', '513229', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('2703', '2693', '壤塘县', '513230', 'R', '0');
INSERT INTO `lr_china_city` VALUES ('2704', '2693', '阿坝县', '513231', 'A', '0');
INSERT INTO `lr_china_city` VALUES ('2705', '2693', '若尔盖县', '513232', 'R', '0');
INSERT INTO `lr_china_city` VALUES ('2706', '2693', '红原县', '513233', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('2707', '2523', '甘孜藏族自治州', '513300', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('2708', '2707', '康定县', '513321', 'K', '0');
INSERT INTO `lr_china_city` VALUES ('2709', '2707', '泸定县', '513322', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2710', '2707', '丹巴县', '513323', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('2711', '2707', '九龙县', '513324', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('2712', '2707', '雅江县', '513325', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2713', '2707', '道孚县', '513326', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('2714', '2707', '炉霍县', '513327', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2715', '2707', '甘孜县', '513328', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('2716', '2707', '新龙县', '513329', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('2717', '2707', '德格县', '513330', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('2718', '2707', '白玉县', '513331', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('2719', '2707', '石渠县', '513332', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('2720', '2707', '色达县', '513333', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('2721', '2707', '理塘县', '513334', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2722', '2707', '巴塘县', '513335', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('2723', '2707', '乡城县', '513336', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('2724', '2707', '稻城县', '513337', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('2725', '2707', '得荣县', '513338', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('2726', '2523', '凉山彝族自治州', '513400', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2727', '2726', '西昌市', '513401', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('2728', '2726', '木里藏族自治县', '513422', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('2729', '2726', '盐源县', '513423', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2730', '2726', '德昌县', '513424', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('2731', '2726', '会理县', '513425', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('2732', '2726', '会东县', '513426', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('2733', '2726', '宁南县', '513427', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('2734', '2726', '普格县', '513428', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('2735', '2726', '布拖县', '513429', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('2736', '2726', '金阳县', '513430', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('2737', '2726', '昭觉县', '513431', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('2738', '2726', '喜德县', '513432', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('2739', '2726', '冕宁县', '513433', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('2740', '2726', '越西县', '513434', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2741', '2726', '甘洛县', '513435', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('2742', '2726', '美姑县', '513436', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('2743', '2726', '雷波县', '513437', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2744', '0', '贵州省', '520000', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('2745', '2744', '贵阳市', '520100', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('2747', '2745', '南明区', '520102', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('2748', '2745', '云岩区', '520103', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2749', '2745', '花溪区', '520111', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('2750', '2745', '乌当区', '520112', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('2751', '2745', '白云区', '520113', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('2752', '2745', '小河区', '520114', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('2753', '2745', '开阳县', '520121', 'K', '0');
INSERT INTO `lr_china_city` VALUES ('2754', '2745', '息烽县', '520122', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('2755', '2745', '修文县', '520123', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('2756', '2745', '清镇市', '520181', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('2757', '2744', '六盘水市', '520200', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2758', '2757', '钟山区', '520201', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('2759', '2757', '六枝特区', '520203', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2760', '2757', '水城县', '520221', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('2761', '2757', '盘县', '520222', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('2762', '2744', '遵义市', '520300', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('2764', '2762', '红花岗区', '520302', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('2765', '2762', '汇川区', '520303', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('2766', '2762', '遵义县', '520321', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('2767', '2762', '桐梓县', '520322', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('2768', '2762', '绥阳县', '520323', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('2769', '2762', '正安县', '520324', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('2770', '2762', '道真仡佬族苗族自治县', '520325', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('2771', '2762', '务川仡佬族苗族自治县', '520326', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('2772', '2762', '凤冈县', '520327', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('2773', '2762', '湄潭县', '520328', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('2774', '2762', '余庆县', '520329', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2775', '2762', '习水县', '520330', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('2776', '2762', '赤水市', '520381', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('2777', '2762', '仁怀市', '520382', 'R', '0');
INSERT INTO `lr_china_city` VALUES ('2778', '2744', '安顺市', '520400', 'A', '0');
INSERT INTO `lr_china_city` VALUES ('2780', '2778', '西秀区', '520402', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('2781', '2778', '平坝县', '520421', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('2782', '2778', '普定县', '520422', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('2783', '2778', '镇宁布依族苗族自治县', '520423', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('2784', '2778', '关岭布依族苗族自治县', '520424', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('2785', '2778', '紫云苗族布依族自治县', '520425', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('2786', '2744', '铜仁地区', '522200', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('2787', '2786', '铜仁市', '522201', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('2788', '2786', '江口县', '522222', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('2789', '2786', '玉屏侗族自治县', '522223', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2790', '2786', '石阡县', '522224', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('2791', '2786', '思南县', '522225', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('2792', '2786', '印江土家族苗族自治县', '522226', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2793', '2786', '德江县', '522227', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('2794', '2786', '沿河土家族自治县', '522228', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2795', '2786', '松桃苗族自治县', '522229', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('2796', '2786', '万山特区', '522230', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('2797', '2744', '黔西南布依族苗族自治州', '522300', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('2798', '2797', '兴义市', '522301', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('2799', '2797', '兴仁县', '522322', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('2800', '2797', '普安县', '522323', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('2801', '2797', '晴隆县', '522324', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('2802', '2797', '贞丰县', '522325', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('2803', '2797', '望谟县', '522326', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('2804', '2797', '册亨县', '522327', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('2805', '2797', '安龙县', '522328', 'A', '0');
INSERT INTO `lr_china_city` VALUES ('2806', '2744', '毕节地区', '522400', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('2807', '2806', '毕节市', '522401', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('2808', '2806', '大方县', '522422', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('2809', '2806', '黔西县', '522423', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('2810', '2806', '金沙县', '522424', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('2811', '2806', '织金县', '522425', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('2812', '2806', '纳雍县', '522426', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('2813', '2806', '威宁彝族回族苗族自治县', '522427', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('2814', '2806', '赫章县', '522428', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('2815', '2744', '黔东南苗族侗族自治州', '522600', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('2816', '2815', '凯里市', '522601', 'K', '0');
INSERT INTO `lr_china_city` VALUES ('2817', '2815', '黄平县', '522622', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('2818', '2815', '施秉县', '522623', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('2819', '2815', '三穗县', '522624', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('2820', '2815', '镇远县', '522625', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('2821', '2815', '岑巩县', '522626', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('2822', '2815', '天柱县', '522627', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('2823', '2815', '锦屏县', '522628', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('2824', '2815', '剑河县', '522629', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('2825', '2815', '台江县', '522630', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('2826', '2815', '黎平县', '522631', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2827', '2815', '榕江县', '522632', 'R', '0');
INSERT INTO `lr_china_city` VALUES ('2828', '2815', '从江县', '522633', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('2829', '2815', '雷山县', '522634', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2830', '2815', '麻江县', '522635', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('2831', '2815', '丹寨县', '522636', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('2832', '2744', '黔南布依族苗族自治州', '522700', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('2833', '2832', '都匀市', '522701', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('2834', '2832', '福泉市', '522702', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('2835', '2832', '荔波县', '522722', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2836', '2832', '贵定县', '522723', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('2837', '2832', '瓮安县', '522725', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('2838', '2832', '独山县', '522726', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('2839', '2832', '平塘县', '522727', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('2840', '2832', '罗甸县', '522728', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2841', '2832', '长顺县', '522729', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('2842', '2832', '龙里县', '522730', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2843', '2832', '惠水县', '522731', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('2844', '2832', '三都水族自治县', '522732', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('2845', '0', '云南省', '530000', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2846', '2845', '昆明市', '530100', 'K', '0');
INSERT INTO `lr_china_city` VALUES ('2848', '2846', '五华区', '530102', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('2849', '2846', '盘龙区', '530103', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('2850', '2846', '官渡区', '530111', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('2851', '2846', '西山区', '530112', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('2852', '2846', '东川区', '530113', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('2853', '2846', '呈贡县', '530121', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('2854', '2846', '晋宁县', '530122', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('2855', '2846', '富民县', '530124', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('2856', '2846', '宜良县', '530125', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2857', '2846', '石林彝族自治县', '530126', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('2858', '2846', '嵩明县', '530127', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('2859', '2846', '禄劝彝族苗族自治县', '530128', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2860', '2846', '寻甸回族彝族自治县', '530129', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('2861', '2846', '安宁市', '530181', 'A', '0');
INSERT INTO `lr_china_city` VALUES ('2862', '2845', '曲靖市', '530300', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('2864', '2862', '麒麟区', '530302', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('2865', '2862', '马龙县', '530321', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('2866', '2862', '陆良县', '530322', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2867', '2862', '师宗县', '530323', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('2868', '2862', '罗平县', '530324', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2869', '2862', '富源县', '530325', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('2870', '2862', '会泽县', '530326', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('2871', '2862', '沾益县', '530328', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('2872', '2862', '宣威市', '530381', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('2873', '2845', '玉溪市', '530400', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2875', '2873', '红塔区', '530402', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('2876', '2873', '江川县', '530421', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('2877', '2873', '澄江县', '530422', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('2878', '2873', '通海县', '530423', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('2879', '2873', '华宁县', '530424', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('2880', '2873', '易门县', '530425', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2881', '2873', '峨山彝族自治县', '530426', 'E', '0');
INSERT INTO `lr_china_city` VALUES ('2882', '2873', '新平彝族傣族自治县', '530427', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('2883', '2873', '元江哈尼族彝族傣族自治县', '530428', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2884', '2845', '保山市', '530500', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('2886', '2884', '隆阳区', '530502', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2887', '2884', '施甸县', '530521', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('2888', '2884', '腾冲县', '530522', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('2889', '2884', '龙陵县', '530523', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2890', '2884', '昌宁县', '530524', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('2891', '2845', '昭通市', '530600', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('2893', '2891', '昭阳区', '530602', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('2894', '2891', '鲁甸县', '530621', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2895', '2891', '巧家县', '530622', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('2896', '2891', '盐津县', '530623', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2897', '2891', '大关县', '530624', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('2898', '2891', '永善县', '530625', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2899', '2891', '绥江县', '530626', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('2900', '2891', '镇雄县', '530627', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('2901', '2891', '彝良县', '530628', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2902', '2891', '威信县', '530629', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('2903', '2891', '水富县', '530630', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('2904', '2845', '丽江市', '530700', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2906', '2904', '古城区', '530702', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('2907', '2904', '玉龙纳西族自治县', '530721', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2908', '2904', '永胜县', '530722', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2909', '2904', '华坪县', '530723', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('2910', '2904', '宁蒗彝族自治县', '530724', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('2911', '2845', '普洱市', '530800', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('2913', '2911', '思茅区', '530802', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('2914', '2911', '宁洱哈尼族彝族自治县', '530821', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('2915', '2911', '墨江哈尼族自治县', '530822', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('2916', '2911', '景东彝族自治县', '530823', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('2917', '2911', '景谷傣族彝族自治县', '530824', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('2918', '2911', '镇沅彝族哈尼族拉祜族自治县', '530825', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('2919', '2911', '江城哈尼族彝族自治县', '530826', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('2920', '2911', '孟连傣族拉祜族佤族自治县', '530827', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('2921', '2911', '澜沧拉祜族自治县', '530828', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2922', '2911', '西盟佤族自治县', '530829', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('2923', '2845', '临沧市', '530900', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2925', '2923', '临翔区', '530902', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2926', '2923', '凤庆县', '530921', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('2927', '2923', '云县', '530922', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2928', '2923', '永德县', '530923', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2929', '2923', '镇康县', '530924', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('2930', '2923', '双江拉祜族佤族布朗族傣族自治县', '530925', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('2931', '2923', '耿马傣族佤族自治县', '530926', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('2932', '2923', '沧源佤族自治县', '530927', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('2933', '2845', '楚雄彝族自治州', '532300', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('2934', '2933', '楚雄市', '532301', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('2935', '2933', '双柏县', '532322', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('2936', '2933', '牟定县', '532323', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('2937', '2933', '南华县', '532324', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('2938', '2933', '姚安县', '532325', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2939', '2933', '大姚县', '532326', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('2940', '2933', '永仁县', '532327', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2941', '2933', '元谋县', '532328', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2942', '2933', '武定县', '532329', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('2943', '2933', '禄丰县', '532331', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2944', '2845', '红河哈尼族彝族自治州', '532500', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('2945', '2944', '个旧市', '532501', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('2946', '2944', '开远市', '532502', 'K', '0');
INSERT INTO `lr_china_city` VALUES ('2947', '2944', '蒙自县', '532522', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('2948', '2944', '屏边苗族自治县', '532523', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('2949', '2944', '建水县', '532524', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('2950', '2944', '石屏县', '532525', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('2951', '2944', '弥勒县', '532526', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('2952', '2944', '泸西县', '532527', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2953', '2944', '元阳县', '532528', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2954', '2944', '红河县', '532529', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('2955', '2944', '金平苗族瑶族傣族自治县', '532530', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('2956', '2944', '绿春县', '532531', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2957', '2944', '河口瑶族自治县', '532532', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('2958', '2845', '文山壮族苗族自治州', '532600', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('2959', '2958', '文山县', '532621', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('2960', '2958', '砚山县', '532622', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2961', '2958', '西畴县', '532623', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('2962', '2958', '麻栗坡县', '532624', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('2963', '2958', '马关县', '532625', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('2964', '2958', '丘北县', '532626', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('2965', '2958', '广南县', '532627', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('2966', '2958', '富宁县', '532628', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('2967', '2845', '西双版纳傣族自治州', '532800', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('2968', '2967', '景洪市', '532801', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('2969', '2967', '勐海县', '532822', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('2970', '2967', '勐腊县', '532823', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('2971', '2845', '大理白族自治州', '532900', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('2972', '2971', '大理市', '532901', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('2973', '2971', '漾濞彝族自治县', '532922', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2974', '2971', '祥云县', '532923', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('2975', '2971', '宾川县', '532924', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('2976', '2971', '弥渡县', '532925', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('2977', '2971', '南涧彝族自治县', '532926', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('2978', '2971', '巍山彝族回族自治县', '532927', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('2979', '2971', '永平县', '532928', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2980', '2971', '云龙县', '532929', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2981', '2971', '洱源县', '532930', 'E', '0');
INSERT INTO `lr_china_city` VALUES ('2982', '2971', '剑川县', '532931', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('2983', '2971', '鹤庆县', '532932', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('2984', '2845', '德宏傣族景颇族自治州', '533100', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('2985', '2984', '瑞丽市', '533102', 'R', '0');
INSERT INTO `lr_china_city` VALUES ('2986', '2984', '潞西市', '533103', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2987', '2984', '梁河县', '533122', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2988', '2984', '盈江县', '533123', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('2989', '2984', '陇川县', '533124', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2990', '2845', '怒江傈僳族自治州', '533300', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('2991', '2990', '泸水县', '533321', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2992', '2990', '福贡县', '533323', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('2993', '2990', '贡山独龙族怒族自治县', '533324', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('2994', '2990', '兰坪白族普米族自治县', '533325', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('2995', '2845', '迪庆藏族自治州', '533400', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('2996', '2995', '香格里拉县', '533421', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('2997', '2995', '德钦县', '533422', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('2998', '2995', '维西傈僳族自治县', '533423', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('2999', '0', '西藏自治区', '540000', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('3000', '2999', '拉萨市', '540100', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('3002', '3000', '城关区', '540102', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('3003', '3000', '林周县', '540121', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('3004', '3000', '当雄县', '540122', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('3005', '3000', '尼木县', '540123', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('3006', '3000', '曲水县', '540124', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('3007', '3000', '堆龙德庆县', '540125', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('3008', '3000', '达孜县', '540126', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('3009', '3000', '墨竹工卡县', '540127', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('3010', '2999', '昌都地区', '542100', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('3011', '3010', '昌都县', '542121', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('3012', '3010', '江达县', '542122', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('3013', '3010', '贡觉县', '542123', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('3014', '3010', '类乌齐县', '542124', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('3015', '3010', '丁青县', '542125', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('3016', '3010', '察雅县', '542126', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('3017', '3010', '八宿县', '542127', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('3018', '3010', '左贡县', '542128', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('3019', '3010', '芒康县', '542129', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('3020', '3010', '洛隆县', '542132', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('3021', '3010', '边坝县', '542133', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('3022', '2999', '山南地区', '542200', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('3023', '3022', '乃东县', '542221', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('3024', '3022', '扎囊县', '542222', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('3025', '3022', '贡嘎县', '542223', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('3026', '3022', '桑日县', '542224', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('3027', '3022', '琼结县', '542225', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('3028', '3022', '曲松县', '542226', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('3029', '3022', '措美县', '542227', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('3030', '3022', '洛扎县', '542228', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('3031', '3022', '加查县', '542229', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('3032', '3022', '隆子县', '542231', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('3033', '3022', '错那县', '542232', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('3034', '3022', '浪卡子县', '542233', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('3035', '2999', '日喀则地区', '542300', 'R', '0');
INSERT INTO `lr_china_city` VALUES ('3036', '3035', '日喀则市', '542301', 'R', '0');
INSERT INTO `lr_china_city` VALUES ('3037', '3035', '南木林县', '542322', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('3038', '3035', '江孜县', '542323', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('3039', '3035', '定日县', '542324', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('3040', '3035', '萨迦县', '542325', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('3041', '3035', '拉孜县', '542326', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('3042', '3035', '昂仁县', '542327', 'A', '0');
INSERT INTO `lr_china_city` VALUES ('3043', '3035', '谢通门县', '542328', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('3044', '3035', '白朗县', '542329', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('3045', '3035', '仁布县', '542330', 'R', '0');
INSERT INTO `lr_china_city` VALUES ('3046', '3035', '康马县', '542331', 'K', '0');
INSERT INTO `lr_china_city` VALUES ('3047', '3035', '定结县', '542332', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('3048', '3035', '仲巴县', '542333', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('3049', '3035', '亚东县', '542334', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('3050', '3035', '吉隆县', '542335', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('3051', '3035', '聂拉木县', '542336', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('3052', '3035', '萨嘎县', '542337', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('3053', '3035', '岗巴县', '542338', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('3054', '2999', '那曲地区', '542400', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('3055', '3054', '那曲县', '542421', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('3056', '3054', '嘉黎县', '542422', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('3057', '3054', '比如县', '542423', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('3058', '3054', '聂荣县', '542424', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('3059', '3054', '安多县', '542425', 'A', '0');
INSERT INTO `lr_china_city` VALUES ('3060', '3054', '申扎县', '542426', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('3061', '3054', '索县', '542427', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('3062', '3054', '班戈县', '542428', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('3063', '3054', '巴青县', '542429', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('3064', '3054', '尼玛县', '542430', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('3065', '2999', '阿里地区', '542500', 'A', '0');
INSERT INTO `lr_china_city` VALUES ('3066', '3065', '普兰县', '542521', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('3067', '3065', '札达县', '542522', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('3068', '3065', '噶尔县', '542523', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('3069', '3065', '日土县', '542524', 'R', '0');
INSERT INTO `lr_china_city` VALUES ('3070', '3065', '革吉县', '542525', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('3071', '3065', '改则县', '542526', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('3072', '3065', '措勤县', '542527', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('3073', '2999', '林芝地区', '542600', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('3074', '3073', '林芝县', '542621', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('3075', '3073', '工布江达县', '542622', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('3076', '3073', '米林县', '542623', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('3077', '3073', '墨脱县', '542624', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('3078', '3073', '波密县', '542625', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('3079', '3073', '察隅县', '542626', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('3080', '3073', '朗县', '542627', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('3081', '0', '陕西省', '610000', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('3082', '3081', '西安市', '610100', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('3084', '3082', '新城区', '610102', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('3085', '3082', '碑林区', '610103', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('3086', '3082', '莲湖区', '610104', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('3087', '3082', '灞桥区', '610111', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('3088', '3082', '未央区', '610112', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('3089', '3082', '雁塔区', '610113', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('3090', '3082', '阎良区', '610114', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('3091', '3082', '临潼区', '610115', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('3092', '3082', '长安区', '610116', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('3093', '3082', '蓝田县', '610122', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('3094', '3082', '周至县', '610124', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('3095', '3082', '户县', '610125', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('3096', '3082', '高陵县', '610126', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('3097', '3081', '铜川市', '610200', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('3099', '3097', '王益区', '610202', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('3100', '3097', '印台区', '610203', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('3101', '3097', '耀州区', '610204', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('3102', '3097', '宜君县', '610222', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('3103', '3081', '宝鸡市', '610300', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('3105', '3103', '渭滨区', '610302', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('3106', '3103', '金台区', '610303', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('3107', '3103', '陈仓区', '610304', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('3108', '3103', '凤翔县', '610322', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('3109', '3103', '岐山县', '610323', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('3110', '3103', '扶风县', '610324', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('3111', '3103', '眉县', '610326', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('3112', '3103', '陇县', '610327', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('3113', '3103', '千阳县', '610328', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('3114', '3103', '麟游县', '610329', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('3115', '3103', '凤县', '610330', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('3116', '3103', '太白县', '610331', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('3117', '3081', '咸阳市', '610400', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('3119', '3117', '秦都区', '610402', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('3120', '3117', '杨凌区', '610403', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('3121', '3117', '渭城区', '610404', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('3122', '3117', '三原县', '610422', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('3123', '3117', '泾阳县', '610423', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('3124', '3117', '乾县', '610424', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('3125', '3117', '礼泉县', '610425', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('3126', '3117', '永寿县', '610426', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('3127', '3117', '彬县', '610427', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('3128', '3117', '长武县', '610428', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('3129', '3117', '旬邑县', '610429', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('3130', '3117', '淳化县', '610430', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('3131', '3117', '武功县', '610431', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('3132', '3117', '兴平市', '610481', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('3133', '3081', '渭南市', '610500', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('3135', '3133', '临渭区', '610502', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('3136', '3133', '华县', '610521', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('3137', '3133', '潼关县', '610522', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('3138', '3133', '大荔县', '610523', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('3139', '3133', '合阳县', '610524', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('3140', '3133', '澄城县', '610525', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('3141', '3133', '蒲城县', '610526', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('3142', '3133', '白水县', '610527', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('3143', '3133', '富平县', '610528', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('3144', '3133', '韩城市', '610581', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('3145', '3133', '华阴市', '610582', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('3146', '3081', '延安市', '610600', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('3148', '3146', '宝塔区', '610602', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('3149', '3146', '延长县', '610621', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('3150', '3146', '延川县', '610622', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('3151', '3146', '子长县', '610623', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('3152', '3146', '安塞县', '610624', 'A', '0');
INSERT INTO `lr_china_city` VALUES ('3153', '3146', '志丹县', '610625', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('3154', '3146', '吴起县', '610626', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('3155', '3146', '甘泉县', '610627', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('3156', '3146', '富县', '610628', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('3157', '3146', '洛川县', '610629', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('3158', '3146', '宜川县', '610630', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('3159', '3146', '黄龙县', '610631', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('3160', '3146', '黄陵县', '610632', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('3161', '3081', '汉中市', '610700', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('3163', '3161', '汉台区', '610702', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('3164', '3161', '南郑县', '610721', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('3165', '3161', '城固县', '610722', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('3166', '3161', '洋县', '610723', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('3167', '3161', '西乡县', '610724', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('3168', '3161', '勉县', '610725', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('3169', '3161', '宁强县', '610726', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('3170', '3161', '略阳县', '610727', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('3171', '3161', '镇巴县', '610728', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('3172', '3161', '留坝县', '610729', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('3173', '3161', '佛坪县', '610730', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('3174', '3081', '榆林市', '610800', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('3176', '3174', '榆阳区', '610802', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('3177', '3174', '神木县', '610821', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('3178', '3174', '府谷县', '610822', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('3179', '3174', '横山县', '610823', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('3180', '3174', '靖边县', '610824', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('3181', '3174', '定边县', '610825', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('3182', '3174', '绥德县', '610826', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('3183', '3174', '米脂县', '610827', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('3184', '3174', '佳县', '610828', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('3185', '3174', '吴堡县', '610829', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('3186', '3174', '清涧县', '610830', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('3187', '3174', '子洲县', '610831', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('3188', '3081', '安康市', '610900', 'A', '0');
INSERT INTO `lr_china_city` VALUES ('3190', '3188', '汉滨区', '610902', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('3191', '3188', '汉阴县', '610921', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('3192', '3188', '石泉县', '610922', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('3193', '3188', '宁陕县', '610923', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('3194', '3188', '紫阳县', '610924', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('3195', '3188', '岚皋县', '610925', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('3196', '3188', '平利县', '610926', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('3197', '3188', '镇坪县', '610927', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('3198', '3188', '旬阳县', '610928', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('3199', '3188', '白河县', '610929', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('3200', '3081', '商洛市', '611000', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('3202', '3200', '商州区', '611002', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('3203', '3200', '洛南县', '611021', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('3204', '3200', '丹凤县', '611022', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('3205', '3200', '商南县', '611023', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('3206', '3200', '山阳县', '611024', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('3207', '3200', '镇安县', '611025', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('3208', '3200', '柞水县', '611026', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('3209', '0', '甘肃省', '620000', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('3210', '3209', '兰州市', '620100', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('3212', '3210', '城关区', '620102', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('3213', '3210', '七里河区', '620103', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('3214', '3210', '西固区', '620104', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('3215', '3210', '安宁区', '620105', 'A', '0');
INSERT INTO `lr_china_city` VALUES ('3216', '3210', '红古区', '620111', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('3217', '3210', '永登县', '620121', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('3218', '3210', '皋兰县', '620122', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('3219', '3210', '榆中县', '620123', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('3220', '3209', '嘉峪关市', '620200', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('3222', '3209', '金昌市', '620300', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('3224', '3222', '金川区', '620302', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('3225', '3222', '永昌县', '620321', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('3226', '3209', '白银市', '620400', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('3228', '3226', '白银区', '620402', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('3229', '3226', '平川区', '620403', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('3230', '3226', '靖远县', '620421', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('3231', '3226', '会宁县', '620422', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('3232', '3226', '景泰县', '620423', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('3233', '3209', '天水市', '620500', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('3235', '3233', '秦州区', '620502', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('3236', '3233', '麦积区', '620503', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('3237', '3233', '清水县', '620521', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('3238', '3233', '秦安县', '620522', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('3239', '3233', '甘谷县', '620523', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('3240', '3233', '武山县', '620524', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('3241', '3233', '张家川回族自治县', '620525', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('3242', '3209', '武威市', '620600', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('3244', '3242', '凉州区', '620602', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('3245', '3242', '民勤县', '620621', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('3246', '3242', '古浪县', '620622', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('3247', '3242', '天祝藏族自治县', '620623', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('3248', '3209', '张掖市', '620700', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('3250', '3248', '甘州区', '620702', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('3251', '3248', '肃南裕固族自治县', '620721', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('3252', '3248', '民乐县', '620722', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('3253', '3248', '临泽县', '620723', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('3254', '3248', '高台县', '620724', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('3255', '3248', '山丹县', '620725', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('3256', '3209', '平凉市', '620800', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('3258', '3256', '崆峒区', '620802', 'K', '0');
INSERT INTO `lr_china_city` VALUES ('3259', '3256', '泾川县', '620821', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('3260', '3256', '灵台县', '620822', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('3261', '3256', '崇信县', '620823', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('3262', '3256', '华亭县', '620824', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('3263', '3256', '庄浪县', '620825', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('3264', '3256', '静宁县', '620826', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('3265', '3209', '酒泉市', '620900', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('3267', '3265', '肃州区', '620902', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('3268', '3265', '金塔县', '620921', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('3269', '3265', '瓜州县', '620922', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('3270', '3265', '肃北蒙古族自治县', '620923', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('3271', '3265', '阿克塞哈萨克族自治县', '620924', 'A', '0');
INSERT INTO `lr_china_city` VALUES ('3272', '3265', '玉门市', '620981', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('3273', '3265', '敦煌市', '620982', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('3274', '3209', '庆阳市', '621000', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('3276', '3274', '西峰区', '621002', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('3277', '3274', '庆城县', '621021', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('3278', '3274', '环县', '621022', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('3279', '3274', '华池县', '621023', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('3280', '3274', '合水县', '621024', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('3281', '3274', '正宁县', '621025', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('3282', '3274', '宁县', '621026', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('3283', '3274', '镇原县', '621027', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('3284', '3209', '定西市', '621100', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('3286', '3284', '安定区', '621102', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('3287', '3284', '通渭县', '621121', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('3288', '3284', '陇西县', '621122', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('3289', '3284', '渭源县', '621123', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('3290', '3284', '临洮县', '621124', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('3291', '3284', '漳县', '621125', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('3292', '3284', '岷县', '621126', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('3293', '3209', '陇南市', '621200', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('3295', '3293', '武都区', '621202', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('3296', '3293', '成县', '621221', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('3297', '3293', '文县', '621222', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('3298', '3293', '宕昌县', '621223', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('3299', '3293', '康县', '621224', 'K', '0');
INSERT INTO `lr_china_city` VALUES ('3300', '3293', '西和县', '621225', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('3301', '3293', '礼县', '621226', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('3302', '3293', '徽县', '621227', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('3303', '3293', '两当县', '621228', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('3304', '3209', '临夏回族自治州', '622900', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('3305', '3304', '临夏市', '622901', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('3306', '3304', '临夏县', '622921', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('3307', '3304', '康乐县', '622922', 'K', '0');
INSERT INTO `lr_china_city` VALUES ('3308', '3304', '永靖县', '622923', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('3309', '3304', '广河县', '622924', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('3310', '3304', '和政县', '622925', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('3311', '3304', '东乡族自治县', '622926', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('3312', '3304', '积石山保安族东乡族撒拉族自治县', '622927', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('3313', '3209', '甘南藏族自治州', '623000', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('3314', '3313', '合作市', '623001', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('3315', '3313', '临潭县', '623021', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('3316', '3313', '卓尼县', '623022', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('3317', '3313', '舟曲县', '623023', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('3318', '3313', '迭部县', '623024', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('3319', '3313', '玛曲县', '623025', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('3320', '3313', '碌曲县', '623026', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('3321', '3313', '夏河县', '623027', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('3322', '0', '青海省', '630000', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('3323', '3322', '西宁市', '630100', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('3325', '3323', '城东区', '630102', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('3326', '3323', '城中区', '630103', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('3327', '3323', '城西区', '630104', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('3328', '3323', '城北区', '630105', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('3329', '3323', '大通回族土族自治县', '630121', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('3330', '3323', '湟中县', '630122', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('3331', '3323', '湟源县', '630123', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('3332', '3322', '海东地区', '632100', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('3333', '3332', '平安县', '632121', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('3334', '3332', '民和回族土族自治县', '632122', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('3335', '3332', '乐都县', '632123', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('3336', '3332', '互助土族自治县', '632126', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('3337', '3332', '化隆回族自治县', '632127', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('3338', '3332', '循化撒拉族自治县', '632128', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('3339', '3322', '海北藏族自治州', '632200', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('3340', '3339', '门源回族自治县', '632221', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('3341', '3339', '祁连县', '632222', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('3342', '3339', '海晏县', '632223', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('3343', '3339', '刚察县', '632224', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('3344', '3322', '黄南藏族自治州', '632300', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('3345', '3344', '同仁县', '632321', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('3346', '3344', '尖扎县', '632322', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('3347', '3344', '泽库县', '632323', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('3348', '3344', '河南蒙古族自治县', '632324', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('3349', '3322', '海南藏族自治州', '632500', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('3350', '3349', '共和县', '632521', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('3351', '3349', '同德县', '632522', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('3352', '3349', '贵德县', '632523', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('3353', '3349', '兴海县', '632524', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('3354', '3349', '贵南县', '632525', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('3355', '3322', '果洛藏族自治州', '632600', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('3356', '3355', '玛沁县', '632621', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('3357', '3355', '班玛县', '632622', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('3358', '3355', '甘德县', '632623', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('3359', '3355', '达日县', '632624', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('3360', '3355', '久治县', '632625', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('3361', '3355', '玛多县', '632626', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('3362', '3322', '玉树藏族自治州', '632700', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('3363', '3362', '玉树县', '632721', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('3364', '3362', '杂多县', '632722', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('3365', '3362', '称多县', '632723', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('3366', '3362', '治多县', '632724', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('3367', '3362', '囊谦县', '632725', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('3368', '3362', '曲麻莱县', '632726', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('3369', '3322', '海西蒙古族藏族自治州', '632800', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('3370', '3369', '格尔木市', '632801', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('3371', '3369', '德令哈市', '632802', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('3372', '3369', '乌兰县', '632821', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('3373', '3369', '都兰县', '632822', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('3374', '3369', '天峻县', '632823', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('3375', '0', '宁夏回族自治区', '640000', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('3376', '3375', '银川市', '640100', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('3378', '3376', '兴庆区', '640104', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('3379', '3376', '西夏区', '640105', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('3380', '3376', '金凤区', '640106', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('3381', '3376', '永宁县', '640121', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('3382', '3376', '贺兰县', '640122', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('3383', '3376', '灵武市', '640181', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('3384', '3375', '石嘴山市', '640200', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('3386', '3384', '大武口区', '640202', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('3387', '3384', '惠农区', '640205', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('3388', '3384', '平罗县', '640221', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('3389', '3375', '吴忠市', '640300', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('3391', '3389', '利通区', '640302', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('3392', '3389', '盐池县', '640323', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('3393', '3389', '同心县', '640324', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('3394', '3389', '青铜峡市', '640381', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('3395', '3375', '固原市', '640400', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('3397', '3395', '原州区', '640402', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('3398', '3395', '西吉县', '640422', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('3399', '3395', '隆德县', '640423', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('3400', '3395', '泾源县', '640424', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('3401', '3395', '彭阳县', '640425', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('3402', '3375', '中卫市', '640500', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('3404', '3402', '沙坡头区', '640502', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('3405', '3402', '中宁县', '640521', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('3406', '3402', '海原县', '640522', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('3407', '0', '新疆维吾尔自治区', '650000', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('3408', '3407', '乌鲁木齐市', '650100', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('3410', '3408', '天山区', '650102', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('3411', '3408', '沙依巴克区', '650103', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('3412', '3408', '新市区', '650104', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('3413', '3408', '水磨沟区', '650105', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('3414', '3408', '头屯河区', '650106', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('3415', '3408', '达坂城区', '650107', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('3416', '3408', '米东区', '650109', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('3417', '3408', '乌鲁木齐县', '650121', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('3418', '3407', '克拉玛依市', '650200', 'K', '0');
INSERT INTO `lr_china_city` VALUES ('3420', '3418', '独山子区', '650202', 'D', '0');
INSERT INTO `lr_china_city` VALUES ('3421', '3418', '克拉玛依区', '650203', 'K', '0');
INSERT INTO `lr_china_city` VALUES ('3422', '3418', '白碱滩区', '650204', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('3423', '3418', '乌尔禾区', '650205', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('3424', '3407', '吐鲁番地区', '652100', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('3425', '3424', '吐鲁番市', '652101', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('3426', '3424', '鄯善县', '652122', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('3427', '3424', '托克逊县', '652123', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('3428', '3407', '哈密地区', '652200', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('3429', '3428', '哈密市', '652201', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('3430', '3428', '巴里坤哈萨克自治县', '652222', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('3431', '3428', '伊吾县', '652223', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('3432', '3407', '昌吉回族自治州', '652300', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('3433', '3432', '昌吉市', '652301', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('3434', '3432', '阜康市', '652302', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('3435', '3432', '呼图壁县', '652323', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('3436', '3432', '玛纳斯县', '652324', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('3437', '3432', '奇台县', '652325', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('3438', '3432', '吉木萨尔县', '652327', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('3439', '3432', '木垒哈萨克自治县', '652328', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('3440', '3407', '博尔塔拉蒙古自治州', '652700', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('3441', '3440', '博乐市', '652701', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('3442', '3440', '精河县', '652722', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('3443', '3440', '温泉县', '652723', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('3444', '3407', '巴音郭楞蒙古自治州', '652800', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('3445', '3444', '库尔勒市', '652801', 'K', '0');
INSERT INTO `lr_china_city` VALUES ('3446', '3444', '轮台县', '652822', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('3447', '3444', '尉犁县', '652823', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('3448', '3444', '若羌县', '652824', 'R', '0');
INSERT INTO `lr_china_city` VALUES ('3449', '3444', '且末县', '652825', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('3450', '3444', '焉耆回族自治县', '652826', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('3451', '3444', '和静县', '652827', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('3452', '3444', '和硕县', '652828', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('3453', '3444', '博湖县', '652829', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('3454', '3407', '阿克苏地区', '652900', 'A', '0');
INSERT INTO `lr_china_city` VALUES ('3455', '3454', '阿克苏市', '652901', 'A', '0');
INSERT INTO `lr_china_city` VALUES ('3456', '3454', '温宿县', '652922', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('3457', '3454', '库车县', '652923', 'K', '0');
INSERT INTO `lr_china_city` VALUES ('3458', '3454', '沙雅县', '652924', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('3459', '3454', '新和县', '652925', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('3460', '3454', '拜城县', '652926', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('3461', '3454', '乌什县', '652927', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('3462', '3454', '阿瓦提县', '652928', 'A', '0');
INSERT INTO `lr_china_city` VALUES ('3463', '3454', '柯坪县', '652929', 'K', '0');
INSERT INTO `lr_china_city` VALUES ('3464', '3407', '克孜勒苏柯尔克孜自治州', '653000', 'K', '0');
INSERT INTO `lr_china_city` VALUES ('3465', '3464', '阿图什市', '653001', 'A', '0');
INSERT INTO `lr_china_city` VALUES ('3466', '3464', '阿克陶县', '653022', 'A', '0');
INSERT INTO `lr_china_city` VALUES ('3467', '3464', '阿合奇县', '653023', 'A', '0');
INSERT INTO `lr_china_city` VALUES ('3468', '3464', '乌恰县', '653024', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('3469', '3407', '喀什地区', '653100', 'K', '0');
INSERT INTO `lr_china_city` VALUES ('3470', '3469', '喀什市', '653101', 'K', '0');
INSERT INTO `lr_china_city` VALUES ('3471', '3469', '疏附县', '653121', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('3472', '3469', '疏勒县', '653122', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('3473', '3469', '英吉沙县', '653123', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('3474', '3469', '泽普县', '653124', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('3475', '3469', '莎车县', '653125', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('3476', '3469', '叶城县', '653126', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('3477', '3469', '麦盖提县', '653127', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('3478', '3469', '岳普湖县', '653128', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('3479', '3469', '伽师县', '653129', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('3480', '3469', '巴楚县', '653130', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('3481', '3469', '塔什库尔干塔吉克自治县', '653131', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('3482', '3407', '和田地区', '653200', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('3483', '3482', '和田市', '653201', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('3484', '3482', '和田县', '653221', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('3485', '3482', '墨玉县', '653222', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('3486', '3482', '皮山县', '653223', 'P', '0');
INSERT INTO `lr_china_city` VALUES ('3487', '3482', '洛浦县', '653224', 'L', '0');
INSERT INTO `lr_china_city` VALUES ('3488', '3482', '策勒县', '653225', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('3489', '3482', '于田县', '653226', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('3490', '3482', '民丰县', '653227', 'M', '0');
INSERT INTO `lr_china_city` VALUES ('3491', '3407', '伊犁哈萨克自治州', '654000', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('3492', '3491', '伊宁市', '654002', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('3493', '3491', '奎屯市', '654003', 'K', '0');
INSERT INTO `lr_china_city` VALUES ('3494', '3491', '伊宁县', '654021', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('3495', '3491', '察布查尔锡伯自治县', '654022', 'C', '0');
INSERT INTO `lr_china_city` VALUES ('3496', '3491', '霍城县', '654023', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('3497', '3491', '巩留县', '654024', 'G', '0');
INSERT INTO `lr_china_city` VALUES ('3498', '3491', '新源县', '654025', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('3499', '3491', '昭苏县', '654026', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('3500', '3491', '特克斯县', '654027', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('3501', '3491', '尼勒克县', '654028', 'N', '0');
INSERT INTO `lr_china_city` VALUES ('3502', '3407', '塔城地区', '654200', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('3503', '3502', '塔城市', '654201', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('3504', '3502', '乌苏市', '654202', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('3505', '3502', '额敏县', '654221', 'E', '0');
INSERT INTO `lr_china_city` VALUES ('3506', '3502', '沙湾县', '654223', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('3507', '3502', '托里县', '654224', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('3508', '3502', '裕民县', '654225', 'Y', '0');
INSERT INTO `lr_china_city` VALUES ('3509', '3502', '和布克赛尔蒙古自治县', '654226', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('3510', '3407', '阿勒泰地区', '654300', 'A', '0');
INSERT INTO `lr_china_city` VALUES ('3511', '3510', '阿勒泰市', '654301', 'A', '0');
INSERT INTO `lr_china_city` VALUES ('3512', '3510', '布尔津县', '654321', 'B', '0');
INSERT INTO `lr_china_city` VALUES ('3513', '3510', '富蕴县', '654322', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('3514', '3510', '福海县', '654323', 'F', '0');
INSERT INTO `lr_china_city` VALUES ('3515', '3510', '哈巴河县', '654324', 'H', '0');
INSERT INTO `lr_china_city` VALUES ('3516', '3510', '青河县', '654325', 'Q', '0');
INSERT INTO `lr_china_city` VALUES ('3517', '3510', '吉木乃县', '654326', 'J', '0');
INSERT INTO `lr_china_city` VALUES ('3518', '3407', '自治区直辖县级行政区划', '659000', 'Z', '0');
INSERT INTO `lr_china_city` VALUES ('3519', '3518', '石河子市', '659001', 'S', '0');
INSERT INTO `lr_china_city` VALUES ('3520', '3518', '阿拉尔市', '659002', 'A', '0');
INSERT INTO `lr_china_city` VALUES ('3521', '3518', '图木舒克市', '659003', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('3522', '3518', '五家渠市', '659004', 'W', '0');
INSERT INTO `lr_china_city` VALUES ('3523', '0', '台湾省', '710000', 'T', '0');
INSERT INTO `lr_china_city` VALUES ('3524', '0', '香港特别行政区', '810000', 'X', '0');
INSERT INTO `lr_china_city` VALUES ('3525', '0', '澳门特别行政区', '820000', 'A', '0');
INSERT INTO `lr_china_city` VALUES ('3526', '2292', '莞城区', null, 'G', '0');
INSERT INTO `lr_china_city` VALUES ('3527', '2292', '常平镇', null, 'C', '0');
INSERT INTO `lr_china_city` VALUES ('3528', '2292', '塘厦镇', null, 'T', '0');
INSERT INTO `lr_china_city` VALUES ('3529', '2292', '万江区', null, 'W', '0');
INSERT INTO `lr_china_city` VALUES ('3530', '2292', '虎门镇', null, 'F', '0');
INSERT INTO `lr_china_city` VALUES ('3531', '2293', '石岐街道', null, 'S', '0');
INSERT INTO `lr_china_city` VALUES ('3532', '2293', '东区街道', null, 'D', '0');
INSERT INTO `lr_china_city` VALUES ('3533', '2293', '西区街道', null, 'X', '0');
INSERT INTO `lr_china_city` VALUES ('3534', '2293', '南区街道', null, 'N', '0');
INSERT INTO `lr_china_city` VALUES ('3535', '2293', '五桂山街道', null, 'W', '0');
INSERT INTO `lr_china_city` VALUES ('3536', '2293', '中山港街道', null, 'Z', '0');

-- ----------------------------
-- Table structure for `lr_fankui`
-- ----------------------------
DROP TABLE IF EXISTS `lr_fankui`;
CREATE TABLE `lr_fankui` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `message` varchar(255) NOT NULL COMMENT '反馈内容',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '反馈时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of lr_fankui
-- ----------------------------
INSERT INTO `lr_fankui` VALUES ('1', '5', '反馈测试', '1483924572');

-- ----------------------------
-- Table structure for `lr_guanggao`
-- ----------------------------
DROP TABLE IF EXISTS `lr_guanggao`;
CREATE TABLE `lr_guanggao` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '子页广告管理表',
  `name` varchar(20) DEFAULT NULL COMMENT '广告名称',
  `photo` varchar(100) DEFAULT NULL COMMENT '图片',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `sort` int(11) NOT NULL DEFAULT '0',
  `type` char(10) DEFAULT 'index' COMMENT '广告类型',
  `action` varchar(255) NOT NULL COMMENT '链接值',
  `position` tinyint(2) unsigned DEFAULT '1' COMMENT '广告位置 1首页轮播 2座位预订页',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of lr_guanggao
-- ----------------------------
INSERT INTO `lr_guanggao` VALUES ('1', '首页轮播', 'UploadFiles/adv/20170831/1504164701427026.jpg', '1504164702', '1', '', '', '1');
INSERT INTO `lr_guanggao` VALUES ('2', '首页轮播', 'UploadFiles/adv/20170902/1504316017342823.jpg', '1504316017', '2', '', '', '1');
INSERT INTO `lr_guanggao` VALUES ('3', '首页轮播', 'UploadFiles/adv/20170902/1504316160416652.jpg', '1504316160', '3', '', '', '1');
INSERT INTO `lr_guanggao` VALUES ('4', '广告图', 'UploadFiles/adv/20170904/1504516512833339.jpg', '1504516512', '1', '', '', '2');

-- ----------------------------
-- Table structure for `lr_guige`
-- ----------------------------
DROP TABLE IF EXISTS `lr_guige`;
CREATE TABLE `lr_guige` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '规格id',
  `pid` int(11) NOT NULL COMMENT '产品id',
  `attr_id` int(11) DEFAULT '0' COMMENT '产品属性id',
  `name` varchar(50) NOT NULL COMMENT '规格名称',
  `price` decimal(9,2) DEFAULT '0.00' COMMENT '规格价格',
  `stock` int(11) unsigned NOT NULL COMMENT '库存',
  `img` varchar(100) DEFAULT NULL COMMENT '属性图片',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of lr_guige
-- ----------------------------

-- ----------------------------
-- Table structure for `lr_indeximg`
-- ----------------------------
DROP TABLE IF EXISTS `lr_indeximg`;
CREATE TABLE `lr_indeximg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT '0' COMMENT '分类ID',
  `name` varchar(50) DEFAULT NULL COMMENT '分类产品',
  `photo` varchar(100) NOT NULL COMMENT '图片',
  `ptype` char(10) DEFAULT NULL COMMENT '跳转值',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of lr_indeximg
-- ----------------------------
INSERT INTO `lr_indeximg` VALUES ('1', '0', '预订座位', 'UploadFiles/category/indeximg/1504246746800769.jpg', 'ydzw', '1');
INSERT INTO `lr_indeximg` VALUES ('2', '0', '商家活动', 'UploadFiles/category/indeximg/1504246796817220.jpg', 'dphd', '2');
INSERT INTO `lr_indeximg` VALUES ('3', '0', '商家菜单', 'UploadFiles/category/indeximg/1504246855494602.jpg', 'ksdc', '3');
INSERT INTO `lr_indeximg` VALUES ('4', '0', '优惠券', 'UploadFiles/category/indeximg/1504246880595677.jpg', 'vou', '4');

-- ----------------------------
-- Table structure for `lr_order`
-- ----------------------------
DROP TABLE IF EXISTS `lr_order`;
CREATE TABLE `lr_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `order_sn` varchar(20) NOT NULL COMMENT '订单编号',
  `pay_sn` varchar(20) DEFAULT NULL COMMENT '支付单号',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家ID',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `price` decimal(9,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `amount` decimal(9,2) DEFAULT '0.00' COMMENT '优惠后价格',
  `addtime` int(10) NOT NULL DEFAULT '0' COMMENT '购买时间',
  `del` tinyint(2) NOT NULL DEFAULT '0' COMMENT '删除状态',
  `type` enum('weixin','alipay','cash') DEFAULT 'weixin' COMMENT '支付方式',
  `price_h` decimal(9,2) NOT NULL DEFAULT '0.00' COMMENT '真实支付金额',
  `status` tinyint(2) NOT NULL DEFAULT '10' COMMENT '订单状态{0,已取消10未付款20代发货30待收货40待评价50交易完成51交易关闭',
  `vid` int(11) DEFAULT '0' COMMENT '优惠券ID',
  `receiver` varchar(15) NOT NULL COMMENT '收货人',
  `tel` char(15) NOT NULL COMMENT '联系方式',
  `address_xq` varchar(50) NOT NULL COMMENT '地址详情',
  `code` int(11) NOT NULL COMMENT '邮编',
  `yunfei` decimal(9,2) DEFAULT NULL,
  `post` int(11) DEFAULT NULL COMMENT '快递ID',
  `remark` varchar(255) DEFAULT NULL COMMENT '买家留言',
  `post_remark` varchar(255) NOT NULL COMMENT '邮费信息',
  `product_num` int(11) NOT NULL DEFAULT '1' COMMENT '商品数量',
  `trade_no` varchar(50) DEFAULT NULL COMMENT '微信交易单号',
  `kuaidi_name` varchar(10) DEFAULT NULL COMMENT '快递名称',
  `kuaidi_num` varchar(20) DEFAULT NULL COMMENT '运单号',
  `back` enum('1','2','0') DEFAULT '0' COMMENT '标识客户是否有发起退款1申请退款 2已退款',
  `back_remark` varchar(255) DEFAULT NULL COMMENT '退款原因',
  `back_addtime` int(11) DEFAULT '0' COMMENT '申请退款时间',
  `order_type` tinyint(2) DEFAULT '1' COMMENT '订单类型 1外卖订单 2预订订单 ',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of lr_order
-- ----------------------------
INSERT INTO `lr_order` VALUES ('1', '2017090448544853', null, '0', '3', '4.04', '4.04', '1504497776', '0', 'weixin', '0.00', '10', '0', '旺旺', '13522006666', '送达发v是的v的发布电饭煲发给你f', '0', '4.00', null, '多加点辣椒', '', '4', null, null, null, '0', null, '0', '1');

-- ----------------------------
-- Table structure for `lr_order_product`
-- ----------------------------
DROP TABLE IF EXISTS `lr_order_product`;
CREATE TABLE `lr_order_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单商品信息表',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '商品id',
  `pay_sn` varchar(20) DEFAULT NULL COMMENT '支付单号',
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT '订单id',
  `name` varchar(50) NOT NULL COMMENT '产品名称',
  `price` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `photo_x` varchar(100) DEFAULT NULL COMMENT '商品图',
  `pro_buff` varchar(255) DEFAULT NULL COMMENT '产品属性',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  `num` int(11) NOT NULL DEFAULT '1' COMMENT '购买数量',
  `pro_guige` varchar(50) DEFAULT NULL COMMENT '规格id和规格名称',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of lr_order_product
-- ----------------------------
INSERT INTO `lr_order_product` VALUES ('1', '1', null, '1', '特色套餐组合', '0.01', 'UploadFiles/product/20170831/1504165271673718.jpg', '', '1504497776', '1', '');
INSERT INTO `lr_order_product` VALUES ('2', '2', null, '1', '风味紫薯干', '0.01', 'UploadFiles/product/20170831/1504165486116454.jpg', '', '1504497776', '1', '');
INSERT INTO `lr_order_product` VALUES ('3', '3', null, '1', '豪华西式风味套餐', '0.01', 'UploadFiles/product/20170901/1504247406829122.jpg', '', '1504497776', '2', '');

-- ----------------------------
-- Table structure for `lr_pro_cat`
-- ----------------------------
DROP TABLE IF EXISTS `lr_pro_cat`;
CREATE TABLE `lr_pro_cat` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '产品分类表',
  `tid` int(11) DEFAULT '0' COMMENT '父级分类id',
  `name` varchar(50) NOT NULL COMMENT '分类名称',
  `img` varchar(100) DEFAULT NULL COMMENT '分类图片',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `type` tinyint(1) DEFAULT '0' COMMENT '是否推荐 1推荐  0不推荐',
  `del` tinyint(1) DEFAULT '0' COMMENT '删除状态',
  `addtime` int(11) DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lr_pro_cat
-- ----------------------------
INSERT INTO `lr_pro_cat` VALUES ('3', '0', '地方特产', null, '1', '0', '0', '1504150465');
INSERT INTO `lr_pro_cat` VALUES ('4', '0', '风味小吃', null, '2', '0', '0', '1504150645');
INSERT INTO `lr_pro_cat` VALUES ('5', '0', '地方菜', null, '3', '0', '0', '1504316467');
INSERT INTO `lr_pro_cat` VALUES ('6', '0', '西餐', null, '4', '0', '0', '1504316485');
INSERT INTO `lr_pro_cat` VALUES ('7', '0', '快餐', null, '5', '0', '0', '1504316501');
INSERT INTO `lr_pro_cat` VALUES ('8', '0', '火锅', null, '6', '0', '0', '1504316516');
INSERT INTO `lr_pro_cat` VALUES ('9', '0', '料理', null, '7', '0', '0', '1504316576');
INSERT INTO `lr_pro_cat` VALUES ('10', '0', '甜点', null, '8', '0', '0', '1504316589');
INSERT INTO `lr_pro_cat` VALUES ('11', '0', '饮料', null, '9', '0', '0', '1504316602');

-- ----------------------------
-- Table structure for `lr_product`
-- ----------------------------
DROP TABLE IF EXISTS `lr_product`;
CREATE TABLE `lr_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '产品表',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '商铺id',
  `name` varchar(50) NOT NULL COMMENT '产品名称',
  `intro` varchar(200) DEFAULT NULL COMMENT '广告语',
  `price` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `price_yh` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '优惠价格',
  `photo_x` varchar(100) DEFAULT NULL COMMENT '小图',
  `photo_d` varchar(100) DEFAULT NULL COMMENT '大图',
  `photo_string` text COMMENT '图片组',
  `content` text COMMENT '简介',
  `addtime` int(11) DEFAULT NULL COMMENT '添加时间',
  `updatetime` int(11) NOT NULL COMMENT '修改时间',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `renqi` int(11) NOT NULL DEFAULT '0' COMMENT '人气',
  `shiyong` int(11) NOT NULL DEFAULT '0' COMMENT '购买数',
  `salenum` int(11) NOT NULL DEFAULT '0' COMMENT '月销',
  `num` int(11) NOT NULL DEFAULT '0' COMMENT '数量',
  `type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否推荐 1推荐  0不推荐',
  `del` tinyint(2) NOT NULL DEFAULT '0' COMMENT '删除状态',
  `del_time` int(10) DEFAULT '0' COMMENT '删除时间',
  `is_buff` tinyint(2) DEFAULT '0' COMMENT '是否启动产品属性',
  `cid` int(11) NOT NULL COMMENT '分类id',
  `is_wm` tinyint(1) DEFAULT '1' COMMENT '是否支持外卖',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否新品',
  `is_down` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '下架状态',
  `is_hot` tinyint(1) unsigned DEFAULT '0' COMMENT '是否热卖',
  `pro_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '产品类型 1普通商品',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of lr_product
-- ----------------------------
INSERT INTO `lr_product` VALUES ('1', '0', '特色套餐组合', '特色套餐组合', '0.01', '0.01', 'UploadFiles/product/20170831/1504165271673718.jpg', 'UploadFiles/product/20170831/1504165271316970.jpg', ',UploadFiles/product/20170831/1504165271206579.jpg', '特色套餐组合特色套餐组合特色套餐组合特色套餐组合特色套餐组合特色套餐组合特色套餐组合特色套餐组合特色套餐组合特色套餐组合特色套餐组合特色套餐组合特色套餐组合特色套餐组合特色套餐组合特色套餐组合特色套餐组合。', '1504165271', '1504251299', '1', '44', '1', '23', '99998', '1', '0', '0', '0', '3', '0', '1', '0', '0', '1');
INSERT INTO `lr_product` VALUES ('2', '0', '风味紫薯干', '风味紫薯干', '0.01', '0.01', 'UploadFiles/product/20170831/1504165486116454.jpg', 'UploadFiles/product/20170831/1504165486263339.jpg', ',UploadFiles/product/20170831/1504165486817092.jpg', '风味紫薯干风味紫薯干风味紫薯干风味紫薯干风味紫薯干风味紫薯干风味紫薯干风味紫薯干风味紫薯干风味紫薯干风味紫薯干风味紫薯干风味紫薯干。', '1504165486', '1504251288', '2', '333', '1', '30', '99998', '1', '0', '0', '0', '4', '0', '1', '0', '0', '1');
INSERT INTO `lr_product` VALUES ('3', '0', '豪华西式风味套餐', '豪华西式风味套餐', '0.01', '0.01', 'UploadFiles/product/20170901/1504247406829122.jpg', 'UploadFiles/product/20170901/1504247406855978.jpg', ',UploadFiles/product/20170901/1504247406235244.jpg', '豪华西式风味套餐豪华西式风味套餐豪华西式风味套餐豪华西式风味套餐豪华西式风味套餐豪华西式风味套餐豪华西式风味套餐豪华西式风味套餐豪华西式风味套餐豪华西式风味套餐豪华西式风味套餐豪华西式风味套餐。', '1504247406', '1504251277', '3', '66', '2', '2', '99997', '1', '0', '0', '0', '4', '0', '1', '0', '0', '1');
INSERT INTO `lr_product` VALUES ('4', '0', '特色花样烧烤', '特色花样烧烤', '0.00', '0.01', 'UploadFiles/product/20170901/1504247719625749.jpg', 'UploadFiles/product/20170901/1504247719501026.jpg', ',UploadFiles/product/20170901/1504247719985246.jpg', '地方特色花样烧烤地方特色花样烧烤地方特色花样烧烤地方特色花样烧烤地方特色花样烧烤地方特色花样烧烤地方特色花样烧烤地方特色花样烧烤地方特色花样烧烤地方特色花样烧烤。', '1504247719', '1504341104', '4', '1234', '0', '333', '99999', '1', '0', '0', '0', '9', '0', '1', '0', '0', '1');
INSERT INTO `lr_product` VALUES ('5', '0', '剁椒鱼头', '剁椒鱼头，以鱼头的“味鲜”和剁椒的“辣”为一体', '0.00', '0.01', 'UploadFiles/product/20170902/1504317265125717.jpg', 'UploadFiles/product/20170902/1504317265177154.jpg', ',UploadFiles/product/20170902/1504317265458851.jpg', '剁椒鱼头，以鱼头的“味鲜”和剁椒的“辣”为一体。通常以鳙鱼鱼头、剁椒为主料，配以豉油、姜、葱、蒜等辅料蒸制而成。菜品色泽红亮、味浓、肉质细嫩。肥而不腻、口感软糯、鲜辣适口。', '1504317265', '1504331041', '0', '100', '0', '99', '999', '0', '0', '0', '0', '5', '0', '1', '0', '0', '1');
INSERT INTO `lr_product` VALUES ('6', '0', '永州血鸭', '永州血鸭是湖南永州的一款地方传统名菜', '0.00', '0.01', 'UploadFiles/product/20170902/1504331009691298.jpg', 'UploadFiles/product/20170902/1504331009650926.jpg', ',UploadFiles/product/20170902/1504331009240023.jpg', '永州血鸭是湖南永州的一款地方传统名菜。永州血鸭分为多种，有道县，新田、宁远、蓝山等多个说法。在当地，几乎家家户户都会制作此菜。具有美味、开胃凉血的特点。', '1504331009', '1504331009', '7', '51', '0', '1322', '9999', '0', '0', '0', '0', '5', '0', '1', '0', '0', '1');
INSERT INTO `lr_product` VALUES ('7', '0', '青椒炒肉', '具备烹饪简单，味道可口，营养丰富，补充人体需要维生素的特色', '0.00', '0.01', 'UploadFiles/product/20170902/1504331732118704.jpg', 'UploadFiles/product/20170902/1504331732325967.jpg', ',UploadFiles/product/20170902/1504331732950967.jpg', '青椒：维生素综合含量居蔬菜之首。含丰富的维生素C以及椒类碱等，性味辛热，具有温中、散热、消食等作用，有利于增强人体免疫功能，提高人体的防病能力。其中的椒类碱能够促进脂肪的新陈代谢，防止体内脂肪积存，从而减肥防病。', '1504331732', '1504331732', '6', '88', '0', '66', '9999', '0', '0', '0', '0', '7', '1', '1', '0', '0', '1');
INSERT INTO `lr_product` VALUES ('8', '0', '酸梅汤', '酸梅汤不仅可以去油解腻，还可以健脾开胃，提神醒脑', '0.00', '0.01', 'UploadFiles/product/20170902/1504332097940760.jpg', 'UploadFiles/product/20170902/1504332097693279.jpg', ',UploadFiles/product/20170902/1504332097994515.jpg', '酸梅汤是老北京传统的消暑饮料，制作原料主要有乌梅、山楂、桂花、甘草、冰糖等材料。常饮确可祛病除疾，保健强身，是炎热夏季不可多得的保健饮品。需要特别提出的是，正宗酸梅汤一定是用冰糖熬制的。', '1504332097', '1504332097', '8', '555', '0', '1354', '9999', '0', '0', '0', '0', '11', '1', '1', '0', '0', '1');
INSERT INTO `lr_product` VALUES ('9', '0', '特色进口牛扒', '牛排，或称牛扒，是块状的牛肉，是西餐中最常见的食物之一。牛排的烹调方法以煎和烧烤为主。', '0.00', '0.01', 'UploadFiles/product/20170902/1504340074945784.jpg', 'UploadFiles/product/20170902/1504340074230674.jpg', ',UploadFiles/product/20170902/1504340074877631.jpg', '牛排，或称牛扒，是块状的牛肉，是西餐中最常见的食物之一。牛排的烹调方法以煎和烧烤为主。欧洲中世纪时，猪肉及羊肉是平民百姓的食用肉，牛肉则是王公贵族们的高级肉品，尊贵的牛肉被他们搭配上了当时也是享有尊贵身份的胡椒及香辛料一起烹调，并在特殊场合中供应，以彰显主人的尊贵身份。', '1504340074', '1504340074', '11', '333', '0', '103', '9999', '0', '0', '0', '0', '6', '0', '1', '0', '0', '1');
INSERT INTO `lr_product` VALUES ('10', '0', '特色火锅', '中国独创的美食，历史悠久，是一种老少皆宜的食物', '0.00', '0.01', 'UploadFiles/product/20170902/1504341060766107.jpg', 'UploadFiles/product/20170902/1504341060865456.jpg', ',UploadFiles/product/20170902/1504341060342631.jpg', '烫食时汤汁一定要滚开，要全部浸入汤汁中烫食；其次是喜欢麻辣味的，调节麻辣味，方法是：喜麻辣者，可从火锅边上油处烫食；反之则从中间沸腾处烫食；再次就是吃火锅时，必须配一杯茶，以开胃消食，解油去腻，换换口味，减轻麻辣之感。', '1504341060', '1504341060', '12', '142', '0', '20', '9999', '0', '0', '0', '0', '8', '0', '1', '0', '0', '1');
INSERT INTO `lr_product` VALUES ('11', '0', '水果布丁', '简单又美味的水果布丁，轻轻松松做下午茶，口感超级好', '0.00', '0.01', 'UploadFiles/product/20170902/1504342629498020.jpg', 'UploadFiles/product/20170902/1504342629449738.jpg', ',UploadFiles/product/20170902/1504342629134254.jpg', '简单又美味的水果布丁，轻轻松松做下午茶，口感超级好简单又美味的水果布丁，轻轻松松做下午茶，口感超级好简单又美味的水果布丁，轻轻松松做下午茶，口感超级好简单又美味的水果布丁，轻轻松松做下午茶，口感超级好简单又美味的水果布丁，轻轻松松做下午茶，口感超级好', '1504342630', '1504342629', '13', '1545', '0', '323', '9999', '0', '0', '0', '0', '10', '0', '1', '0', '0', '1');
INSERT INTO `lr_product` VALUES ('12', '0', '苹果汁', '新鲜苹果汁', '0.00', '0.01', 'UploadFiles/product/20170902/1504343071964892.jpg', 'UploadFiles/product/20170902/1504343071773784.jpg', ',UploadFiles/product/20170902/1504343071763126.jpg', '新鲜苹果汁，现买现榨，原汁原味！主要营养成分有：果糖、葡萄糖、维生素A、C等。一种廉价的改善身体健康的饮品，也是可容和不可溶纤维素的来源。', '1504343071', '1504343071', '14', '711', '0', '140', '9999', '0', '0', '0', '0', '11', '1', '1', '0', '0', '1');

-- ----------------------------
-- Table structure for `lr_product_dp`
-- ----------------------------
DROP TABLE IF EXISTS `lr_product_dp`;
CREATE TABLE `lr_product_dp` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '产品评论表',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '会员id',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '商品id',
  `order_id` int(11) DEFAULT '0' COMMENT '评论订单id',
  `num` int(11) NOT NULL DEFAULT '1' COMMENT '评分数',
  `concent` varchar(255) DEFAULT NULL,
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '评论时间',
  `audit` tinyint(2) NOT NULL DEFAULT '0' COMMENT '审核状态',
  `reply_status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '回复状态',
  `reply_content` text COMMENT '回复内容',
  `reply_time` int(11) NOT NULL DEFAULT '0' COMMENT '回复时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of lr_product_dp
-- ----------------------------

-- ----------------------------
-- Table structure for `lr_program`
-- ----------------------------
DROP TABLE IF EXISTS `lr_program`;
CREATE TABLE `lr_program` (
  `id` int(11) unsigned NOT NULL COMMENT '小程序配置表',
  `title` varchar(20) NOT NULL COMMENT '小程序名称',
  `name` varchar(20) NOT NULL COMMENT '负责人',
  `describe` varchar(200) DEFAULT NULL COMMENT '简单描述',
  `logo` varchar(100) DEFAULT NULL COMMENT 'logo',
  `copyright` varchar(100) DEFAULT NULL COMMENT '版权信息',
  `service_wx` varchar(50) DEFAULT NULL COMMENT '平台客服微信号',
  `tel` varchar(20) DEFAULT NULL COMMENT '平台客服电话',
  `uptime` int(11) DEFAULT '0' COMMENT '修改时间',
  `yunfei` decimal(9,2) DEFAULT '0.00' COMMENT '配送费',
  `ptime` int(2) DEFAULT '0' COMMENT '预计配送时间',
  `classname` varchar(10) DEFAULT NULL COMMENT '首页栏目名称',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lr_program
-- ----------------------------
INSERT INTO `lr_program` VALUES ('1', '餐饮版', '', '餐饮版', '', 'Copyright © 2017', '', '22222222', '1504572001', '4.00', '30', '菜式推荐');

-- ----------------------------
-- Table structure for `lr_sccat`
-- ----------------------------
DROP TABLE IF EXISTS `lr_sccat`;
CREATE TABLE `lr_sccat` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '产品品牌表',
  `name` varchar(100) NOT NULL COMMENT '品牌名称',
  `addtime` int(11) DEFAULT NULL COMMENT '添加时间',
  `shop_id` int(11) unsigned DEFAULT '0' COMMENT '店铺id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lr_sccat
-- ----------------------------
INSERT INTO `lr_sccat` VALUES ('1', '儿童服装', '1494241343', '0');

-- ----------------------------
-- Table structure for `lr_shangchang`
-- ----------------------------
DROP TABLE IF EXISTS `lr_shangchang`;
CREATE TABLE `lr_shangchang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT '0' COMMENT '店铺类别id',
  `name` varchar(20) NOT NULL COMMENT '店铺名称',
  `uname` varchar(10) NOT NULL COMMENT '负责人名称',
  `logo` varchar(100) DEFAULT NULL COMMENT '店铺LOGO',
  `vip_char` varchar(100) DEFAULT NULL COMMENT '店铺公告、广告图',
  `sheng` int(11) NOT NULL DEFAULT '0' COMMENT '省id',
  `city` int(11) DEFAULT '0' COMMENT '市id',
  `quyu` int(11) DEFAULT '0' COMMENT '区域id',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `address_xq` varchar(255) DEFAULT NULL COMMENT '省市区+地址',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `location_x` varchar(20) NOT NULL DEFAULT '0' COMMENT '纬度',
  `location_y` varchar(20) NOT NULL DEFAULT '0' COMMENT '经度',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '创建日期',
  `updatetime` int(11) NOT NULL DEFAULT '0' COMMENT '更新日期',
  `content` text COMMENT '店铺介绍',
  `intro` varchar(200) DEFAULT NULL COMMENT '店铺广告语',
  `grade` int(2) NOT NULL DEFAULT '10' COMMENT '评分等级1~10',
  `tel` char(15) DEFAULT NULL COMMENT '联系电话',
  `utel` char(15) DEFAULT NULL COMMENT '负责人手机',
  `status` tinyint(2) DEFAULT '1' COMMENT '显示/隐藏',
  `type` tinyint(2) NOT NULL DEFAULT '0',
  `qq` varchar(255) DEFAULT NULL COMMENT 'qq',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of lr_shangchang
-- ----------------------------

-- ----------------------------
-- Table structure for `lr_shangchang_dp`
-- ----------------------------
DROP TABLE IF EXISTS `lr_shangchang_dp`;
CREATE TABLE `lr_shangchang_dp` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '店铺收藏表',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '商铺id',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '会员id',
  `grade` int(11) NOT NULL DEFAULT '0' COMMENT '评分数',
  `concent` varchar(255) DEFAULT NULL COMMENT '评论内容',
  `addtime` int(11) DEFAULT NULL,
  `audit` tinyint(2) NOT NULL DEFAULT '0' COMMENT '审核状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of lr_shangchang_dp
-- ----------------------------

-- ----------------------------
-- Table structure for `lr_shangchang_sc`
-- ----------------------------
DROP TABLE IF EXISTS `lr_shangchang_sc`;
CREATE TABLE `lr_shangchang_sc` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '会员店铺收藏记录表',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `status` tinyint(2) DEFAULT '1' COMMENT '收藏状态 1收藏 0删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of lr_shangchang_sc
-- ----------------------------
INSERT INTO `lr_shangchang_sc` VALUES ('1', '47', '5', '1');

-- ----------------------------
-- Table structure for `lr_shopping_char`
-- ----------------------------
DROP TABLE IF EXISTS `lr_shopping_char`;
CREATE TABLE `lr_shopping_char` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '购物车表',
  `pid` int(11) NOT NULL COMMENT '商品ID',
  `price` decimal(9,2) NOT NULL DEFAULT '0.00' COMMENT '商品单价',
  `num` int(11) NOT NULL DEFAULT '1' COMMENT '数量',
  `buff` varchar(255) NOT NULL COMMENT '属性（序列化格式）',
  `addtime` int(10) NOT NULL COMMENT '添加时间',
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家ID',
  `gid` int(11) DEFAULT '0' COMMENT '规格id',
  `type` tinyint(2) DEFAULT '1' COMMENT '1 普通产品 2其他',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of lr_shopping_char
-- ----------------------------
INSERT INTO `lr_shopping_char` VALUES ('1', '1', '0.01', '2', '', '1504573131', '3', '0', '0', '1');
INSERT INTO `lr_shopping_char` VALUES ('2', '3', '0.01', '1', '', '1504573133', '3', '0', '0', '1');
INSERT INTO `lr_shopping_char` VALUES ('3', '12', '0.01', '1', '', '1504573542', '3', '0', '0', '1');
INSERT INTO `lr_shopping_char` VALUES ('4', '2', '0.01', '1', '', '1504574901', '3', '0', '0', '1');

-- ----------------------------
-- Table structure for `lr_table_boot`
-- ----------------------------
DROP TABLE IF EXISTS `lr_table_boot`;
CREATE TABLE `lr_table_boot` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '预订座位表',
  `thestarttime` int(11) NOT NULL DEFAULT '0' COMMENT '开始日期',
  `theendtime` int(11) DEFAULT '0' COMMENT '结束日期',
  `timeid` int(11) NOT NULL DEFAULT '0' COMMENT '时间段ID',
  `starttime` int(11) NOT NULL DEFAULT '0' COMMENT '开始时间',
  `endtime` int(11) NOT NULL DEFAULT '0' COMMENT '结束时间',
  `longtime` int(11) DEFAULT '0' COMMENT '预留时长',
  `tablenum` varchar(20) DEFAULT NULL COMMENT '桌号',
  `tabletype` varchar(50) DEFAULT NULL COMMENT '桌类型',
  `people` int(11) DEFAULT '1' COMMENT '可座人数',
  `addtime` int(11) DEFAULT '0' COMMENT '添加时间',
  `price` decimal(9,2) DEFAULT '0.00' COMMENT '预订金额',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lr_table_boot
-- ----------------------------
INSERT INTO `lr_table_boot` VALUES ('1', '1504605600', '1505484000', '3', '0', '0', '1', 'A1', '大厅四人桌', '4', '1504522799', '0.00');
INSERT INTO `lr_table_boot` VALUES ('2', '1504605600', '1505484000', '3', '0', '0', '1', 'A2', '大厅六人桌', '6', '1504522799', '0.00');
INSERT INTO `lr_table_boot` VALUES ('3', '1504605600', '1505484000', '3', '0', '0', '1', '1', '包间', '10', '1504522799', '0.01');

-- ----------------------------
-- Table structure for `lr_timeslot`
-- ----------------------------
DROP TABLE IF EXISTS `lr_timeslot`;
CREATE TABLE `lr_timeslot` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '预订时间段表',
  `name` varchar(20) NOT NULL COMMENT '时间段',
  `start` int(11) NOT NULL DEFAULT '0' COMMENT '开始时段',
  `end` int(11) NOT NULL DEFAULT '0' COMMENT '结束时段',
  `is_del` tinyint(2) DEFAULT '0' COMMENT '删除状态',
  `addtime` int(11) DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lr_timeslot
-- ----------------------------
INSERT INTO `lr_timeslot` VALUES ('1', '早上（8:00~10:00）', '0', '0', '0', '1504485028');
INSERT INTO `lr_timeslot` VALUES ('2', '中午（11:30~14:00）', '0', '0', '0', '1504485055');
INSERT INTO `lr_timeslot` VALUES ('3', '晚上（18:00~22:00）', '0', '0', '0', '1504485076');
INSERT INTO `lr_timeslot` VALUES ('5', '夜宵（23:00~次日2:00）', '0', '0', '0', '1504522750');

-- ----------------------------
-- Table structure for `lr_user`
-- ----------------------------
DROP TABLE IF EXISTS `lr_user`;
CREATE TABLE `lr_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户表：包括后台管理员、商家会员和普通会员',
  `name` varchar(20) NOT NULL COMMENT '登陆账号',
  `uname` varchar(10) DEFAULT NULL COMMENT '昵称',
  `pwd` varchar(50) NOT NULL COMMENT 'MD5密码',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '创建日期',
  `jifen` int(11) DEFAULT '0' COMMENT '积分',
  `photo` varchar(255) DEFAULT NULL COMMENT '头像',
  `tel` char(15) DEFAULT NULL COMMENT '手机',
  `qq_id` varchar(20) NOT NULL DEFAULT '0' COMMENT 'qq',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `sex` tinyint(2) NOT NULL DEFAULT '0' COMMENT '性别',
  `del` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `openid` varchar(50) NOT NULL COMMENT '授权ID',
  `source` varchar(10) NOT NULL COMMENT '第三方平台(微信，QQ)',
  `authtype` tinyint(2) DEFAULT '0' COMMENT '手机验证状态 0未验证 1已验证',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of lr_user
-- ----------------------------
INSERT INTO `lr_user` VALUES ('1', 'aa', 'aa', 'aa', '0', '0', null, null, '0', null, '0', '0', '', '', '0');
INSERT INTO `lr_user` VALUES ('2', '小伙伴', '小伙伴', '', '1494210088', '0', 'http://wx.qlogo.cn/mmopen/vi_32/6Dq9DIIcGyQiaEA4JicN48rEQ1bwm33s2cGkzHlSLkUOPwktluYXmf84fiaILKMUCb5SSvOHmxxenE4MlelQhibBqg/0', null, '0', null, '1', '0', 'oQukL0fa013osRbWSdIPaUt88JZE', 'wx', '0');
INSERT INTO `lr_user` VALUES ('3', '小伙伴', '小伙伴', '', '1496195940', '0', 'http://wx.qlogo.cn/mmhead/icXtjp9jsR5RylwDhXjxFtIL70hvKaibowUZYFsD9shibBiaQyqvD1zRng/132', '', '0', null, '1', '0', 'undefined', 'wx', '0');

-- ----------------------------
-- Table structure for `lr_user_voucher`
-- ----------------------------
DROP TABLE IF EXISTS `lr_user_voucher`;
CREATE TABLE `lr_user_voucher` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '会员优惠券领取记录',
  `uid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `vid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '优惠券id',
  `shop_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商铺ID',
  `full_money` decimal(9,2) NOT NULL DEFAULT '0.00' COMMENT '满多少钱',
  `amount` decimal(9,2) NOT NULL DEFAULT '0.00' COMMENT '减多少钱',
  `start_time` int(11) DEFAULT '0' COMMENT '开始时间',
  `end_time` int(11) DEFAULT '0' COMMENT '结束时间',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '领取时间',
  `status` tinyint(2) unsigned DEFAULT '1' COMMENT '使用状态 1未使用 2已使用 3已失效',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lr_user_voucher
-- ----------------------------
INSERT INTO `lr_user_voucher` VALUES ('4', '3', '1', '0', '100.00', '20.00', '1499702400', '1514735999', '1504314068', '1');

-- ----------------------------
-- Table structure for `lr_voucher`
-- ----------------------------
DROP TABLE IF EXISTS `lr_voucher`;
CREATE TABLE `lr_voucher` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '店铺优惠券表',
  `shop_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `title` varchar(100) DEFAULT NULL COMMENT '优惠券名称',
  `full_money` decimal(9,2) NOT NULL DEFAULT '0.00' COMMENT '满多少钱',
  `amount` decimal(9,2) NOT NULL DEFAULT '0.00' COMMENT '减多少钱',
  `start_time` int(11) NOT NULL DEFAULT '0' COMMENT '开始时间',
  `end_time` int(11) NOT NULL DEFAULT '0' COMMENT '结束时间',
  `point` int(11) DEFAULT '0' COMMENT '所需积分',
  `count` int(11) unsigned NOT NULL DEFAULT '1' COMMENT '发行数量',
  `receive_num` int(11) unsigned DEFAULT '0' COMMENT '领取数量',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '优惠券类型',
  `del` tinyint(1) unsigned DEFAULT '0' COMMENT '删除状态',
  `proid` text COMMENT '产品ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lr_voucher
-- ----------------------------
INSERT INTO `lr_voucher` VALUES ('1', '0', '新人首次购买优惠', '100.00', '20.00', '1499702400', '1514735999', '0', '99999', '5', '1499736291', '1', '0', 'all');

-- ----------------------------
-- Table structure for `lr_web`
-- ----------------------------
DROP TABLE IF EXISTS `lr_web`;
CREATE TABLE `lr_web` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '单网页信息表：关于我们、客服中心等',
  `pid` int(11) DEFAULT '0',
  `uname` varchar(255) DEFAULT NULL COMMENT '名称1',
  `ename` varchar(255) DEFAULT NULL COMMENT '名称2',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `concent` mediumtext COMMENT '内容介绍',
  `addtime` int(11) DEFAULT '0' COMMENT '发表时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of lr_web
-- ----------------------------
INSERT INTO `lr_web` VALUES ('1', '0', '关于我们', '', '0', '<p><img src=\"/minidingcanapi/Data/UploadFiles/Uploads/day_170904/201709041531339264.jpg\" alt=\"\" width=\"480\" height=\"240\" /></p><p></p><p><span style=\"font-family:宋体;font-size:10.5000pt;\">手机号码：</span></p><p><span style=\"font-family:宋体;font-size:10.5000pt;\">电话号码：</span></p><p><span style=\"font-family:宋体;font-size:10.5000pt;\"><span style=\"font-family:宋体;\">店铺地址：</span></span></p><br />', '1504510308');
