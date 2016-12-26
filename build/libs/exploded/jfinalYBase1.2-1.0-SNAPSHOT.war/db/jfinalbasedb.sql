/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50713
 Source Host           : localhost
 Source Database       : jfinalbasedb

 Target Server Type    : MySQL
 Target Server Version : 50713
 File Encoding         : utf-8

 Date: 10/17/2016 09:25:06 AM
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `sys_area`
-- ----------------------------
DROP TABLE IF EXISTS `sys_area`;
CREATE TABLE `sys_area` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` double NOT NULL COMMENT '排序',
  `code` varchar(100) DEFAULT NULL COMMENT '区域编码',
  `type` char(1) DEFAULT NULL COMMENT '区域类型（1：国家；2：省份、直辖市；3：地市；4：区县）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='区域表';

-- ----------------------------
--  Records of `sys_area`
-- ----------------------------
BEGIN;
INSERT INTO `sys_area` VALUES ('0be5d9c7-8032-4578-b364-aa809caf7594', 'a326f968-1277-41b8-9c6d-0a4e89723bda', 'a326f968-1277-41b8-9c6d-0a4e89723bda|0be5d9c7-8032-4578-b364-aa809caf7594', '赛罕区', '1.15', '15200', '4', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-07-30 15:00:48', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-07-30 15:00:48', null, '1'), ('181ac006-d15a-4b75-a1c2-ecb1f72718a9', 'b6088cbc-f620-4cc8-8695-8c82a2cbab84', 'b6088cbc-f620-4cc8-8695-8c82a2cbab84|181ac006-d15a-4b75-a1c2-ecb1f72718a9', '海拉尔', '1.2', '0133122', '3', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-07-30 14:52:54', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-07-30 14:52:54', '测试', '1'), ('1c924364-fd13-4d1b-9693-c5982ff9eb47', 'a326f968-1277-41b8-9c6d-0a4e89723bda', 'a326f968-1277-41b8-9c6d-0a4e89723bda|1c924364-fd13-4d1b-9693-c5982ff9eb47', '赛罕区', '1.16', '35132132', '4', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-08-09 08:47:42', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-08-09 08:47:42', null, '0'), ('223073c8-57da-40e6-be27-8463bc3a950b', 'a326f968-1277-41b8-9c6d-0a4e89723bda', 'a326f968-1277-41b8-9c6d-0a4e89723bda|223073c8-57da-40e6-be27-8463bc3a950b', '赛罕区', '1.14', '15200', '4', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-07-30 15:03:54', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-07-30 15:03:54', null, '1'), ('4bbd9579-c60a-481f-81e5-8186e4f06056', '', '', '大学城', '2', '15631', '4', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-08-09 08:49:19', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-08-09 08:49:19', null, '1'), ('76673596-c3bc-4b9d-b9e1-45d056a3926f', 'a326f968-1277-41b8-9c6d-0a4e89723bda', 'a326f968-1277-41b8-9c6d-0a4e89723bda|76673596-c3bc-4b9d-b9e1-45d056a3926f', '玉泉区', '1.12', '123100', '4', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-06-30 17:26:08', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-06-30 17:26:08', null, '0'), ('8586f081-146c-4cc2-8e08-e9002a52f807', 'a326f968-1277-41b8-9c6d-0a4e89723bda', 'b6088cbc-f620-4cc8-8695-8c82a2cbab84|a326f968-1277-41b8-9c6d-0a4e89723bda', '市辖区', '1.11', '150000', '4', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-07-06 16:13:56', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-07-06 16:13:56', null, '1'), ('a326f968-1277-41b8-9c6d-0a4e89723bda', 'b6088cbc-f620-4cc8-8695-8c82a2cbab84', 'b6088cbc-f620-4cc8-8695-8c82a2cbab84|', '呼和浩特', '1.1', '150000', '3', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-06-30 17:33:36', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-06-30 17:33:36', null, '0'), ('b6088cbc-f620-4cc8-8695-8c82a2cbab84', '', '', '内蒙古自治区', '1', '150000', '2', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-06-30 17:24:22', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-06-30 17:24:22', null, '0'), ('bc0bb1dd-9209-485c-9861-252bb51d555c', 'b6088cbc-f620-4cc8-8695-8c82a2cbab84', 'b6088cbc-f620-4cc8-8695-8c82a2cbab84|bc0bb1dd-9209-485c-9861-252bb51d555c', '巴彦淖尔市', '1.3', '3541516165', '3', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-08-09 08:48:23', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-08-09 08:48:23', null, '0'), ('d04cad96-216f-4592-990c-eef64725a939', 'a326f968-1277-41b8-9c6d-0a4e89723bda', 'a326f968-1277-41b8-9c6d-0a4e89723bda|d04cad96-216f-4592-990c-eef64725a939', '回民区', '1.13', '102314', '4', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-07-06 15:11:27', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-07-06 17:25:04', '斤斤计较123122312313111', '0'), ('d6982d40-65a9-4e77-869f-66fe5a73ef90', 'a326f968-1277-41b8-9c6d-0a4e89723bda', 'a326f968-1277-41b8-9c6d-0a4e89723bda|d6982d40-65a9-4e77-869f-66fe5a73ef90', '新城区', '1.17', '23132131', '4', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-08-09 08:48:48', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-08-09 08:48:48', null, '0');
COMMIT;

-- ----------------------------
--  Table structure for `sys_dict`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `dictkey` varchar(64) DEFAULT NULL COMMENT '字典key',
  `dictvalue` varchar(100) DEFAULT NULL COMMENT '数据字典值',
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `type` varchar(64) DEFAULT NULL COMMENT '数据字典类型',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  `typeinfo` varchar(255) DEFAULT NULL COMMENT '数据字典类型描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='多级字典表';

-- ----------------------------
--  Records of `sys_dict`
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict` VALUES ('0ed39298-604e-469a-9d65-d66703d05941', '3', '一般权限', null, '1001', '', '2016-06-30 18:00:29', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-06-30 18:00:29', '1', '0', '角色'), ('16a66fc3-9d26-4db9-bef2-bc846b6df248', '3', '地级市', null, '1010', '', '2016-07-01 17:10:09', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-07-01 17:10:09', null, '0', '区域类型'), ('1e69b048-2b2d-4b43-b53d-e85cd42e9050', '1', '已审核', null, '1017', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-07-11 10:56:00', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-07-11 10:56:00', '发帖通过审核', '0', '操作'), ('243f5a40-c058-474d-9ec2-67362dfdc887', null, null, null, null, '', '2016-08-24 10:53:00', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-08-24 10:53:00', null, '1', null), ('28061c78-e5c8-40c9-86a8-c2044c1be910', null, null, null, null, '', '2016-08-24 10:58:06', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-08-24 10:58:06', null, '1', null), ('29b8d6c9-b312-48b6-8cea-b7ef4edd644b', '1', '校园动态', null, '1013', '', '2016-07-11 10:54:50', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-07-11 10:54:50', null, '0', '微信信息分类'), ('2fea8089-e6c1-4c07-99d9-70f1a4553ad5', '4', '举报', null, '1016', '', '2016-07-15 17:33:15', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-07-15 17:33:27', '论坛操作类型', '0', '操作'), ('3922150a-db50-4083-a134-61ab5e7227f0', '2', '招生就业', null, '1013', '', '2016-07-11 10:55:37', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-07-12 08:44:20', null, '0', '微信信息分类'), ('41b4d0fd-26d2-404b-9fb7-ea93938e611c', '4', '区县', null, '1010', '', '2016-07-01 17:10:23', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-07-01 17:10:23', null, '0', '区域类型'), ('44b58b74-0dec-445a-8c00-1ae52aeb6c3b', '1', '点赞', null, '1016', '', '2016-07-15 17:27:59', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-07-15 17:28:21', '论坛操作类型', '0', '操作'), ('491387a3-5bd9-4549-8341-fbeb5e230f0e', '2', '管理员', null, '1003', '', '2016-08-09 09:18:32', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-08-09 09:18:32', null, '0', '人员类型'), ('4aef2cd1-12a7-4580-8a31-4f8f2c41ca86', '1', '置顶', null, '1014', '', '2016-07-11 10:57:03', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-07-11 10:57:03', null, '0', '置顶状态'), ('4d45b231-ee7b-44be-99d9-64642b2a5e28', '11', '管理员', null, '1001', '', '2016-06-29 17:32:33', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-06-29 17:32:33', '11', '0', '角色'), ('5724a3bd-e3ed-44c1-8ed1-cbd9c9a3179d', '0', '未置顶', null, '1014', '', '2016-07-11 10:56:37', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-07-11 10:56:37', null, '0', '置顶状态'), ('593fa3ba-210b-4847-b34f-05ff87439b57', '1', '一般用户', null, '1003', '', '2016-06-30 11:22:39', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-06-30 11:45:27', null, '0', '人员类型'), ('5ace504a-6c2f-4d52-91ee-b7f5c8d9081e', '2', '虚拟组', null, '1000', '', '2016-06-24 15:01:59', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-06-24 15:01:59', '虚拟组', '0', '机构'), ('5f0df8a7-d629-4194-94f0-2e34f0a2de96', '2', '省市/自治区', null, '1010', '', '2016-07-01 17:08:46', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-07-01 17:09:43', null, '0', '区域类型'), ('79438dc5-6cc0-44ab-9ce6-ffbd4ac443f5', '1', '日志', null, '1008', '', '2016-07-30 17:10:14', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-07-30 17:10:14', '222', '1', '学位'), ('83cae312-8b42-4d90-8350-1c44a881ff0d', null, null, null, null, '', '2016-08-30 11:31:12', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-08-30 11:31:12', null, '1', null), ('874743c2-8234-4fad-9458-b0a18382bffb', '0', '未发布', null, '1015', '', '2016-07-11 10:57:40', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-07-11 10:57:40', null, '0', '发布状态'), ('923bdaa8-afb5-49c4-93f7-4a3214299970\n', '3', '评论', null, '1016', '', '2016-07-15 17:31:27', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-07-15 17:31:44', '论坛操作类型', '0', '操作'), ('a7410bb4-009c-4fa7-a2bc-627458e226a6', '4', '校园讲座', null, '1013', '', '2016-07-12 08:44:50', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-07-12 08:44:50', null, '0', '微信信息分类'), ('ad91383b-ed5a-4eb3-8e43-aedf0f2af63d', '3', '岗位', null, '1000', '', '2016-06-24 15:02:20', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-06-24 15:02:20', '岗位', '0', '机构'), ('af463a95-ad57-499e-9565-afb17164ad14', '0', '未审核', null, '1017', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-07-11 10:56:00', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-07-11 10:56:00', '评论没通过审核', '0', '操作'), ('b9809775-027d-4cfe-816c-e4603d6fdf80', '1', '已发布', null, '1015', '', '2016-07-11 10:58:04', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-07-11 16:30:18', null, '0', '发布状态'), ('c8f0ee06-55a1-4b18-8630-4ca2db244b0e', null, null, null, null, '', '2016-08-24 10:58:08', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-08-24 10:58:08', null, '1', null), ('d16a60a5-2856-458e-91b0-71e60efdf772', '1', '机构', null, '1000', '', '2016-06-24 15:00:30', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-06-24 15:00:30', '机构', '0', '机构'), ('e01ef285-5161-4bf5-b34b-15adcfedc4e1', '1', '国家', null, '1010', '', '2016-07-01 17:08:27', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-07-01 17:08:27', null, '0', '区域类型'), ('e6f09dd1-87f2-415e-aad7-7a13d9a96a16', '2', '收藏', null, '1016', '', '2016-07-15 17:30:24', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-07-15 17:30:41', '论坛操作类型', '0', '操作'), ('f92a9819-37fc-4e6b-8ee7-516534f74a1e', '3', '校园概况', null, '1013', '', '2016-07-11 10:56:00', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-07-11 10:56:00', null, '0', '微信信息分类');
COMMIT;

-- ----------------------------
--  Table structure for `sys_folder`
-- ----------------------------
DROP TABLE IF EXISTS `sys_folder`;
CREATE TABLE `sys_folder` (
  `id` varchar(64) NOT NULL,
  `name` varchar(256) DEFAULT NULL,
  `filepath` varchar(256) DEFAULT NULL,
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `sys_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `type` char(64) DEFAULT '1' COMMENT '日志类型（1:登录、2:登出...）数据字典存取',
  `title` varchar(500) DEFAULT NULL,
  `content` varchar(2000) NOT NULL,
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `operatorname` varchar(20) NOT NULL,
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日志表';

-- ----------------------------
--  Records of `sys_log`
-- ----------------------------
BEGIN;
INSERT INTO `sys_log` VALUES ('0554c02e-5348-44bb-9bac-b298b4a2e9ee', '7', '用户删除', '陈钢在2016-08-30 11:24:19操作了用户删除功能', '9b70e448-58e7-4a46-ac83-c408d835643d', '陈钢', '2016-08-30 11:24:19'), ('13fe65f7-2c0a-47c7-946f-64ce6664084b', '7', '用户删除', '陈钢在2016-08-30 11:24:12操作了用户删除功能', '9b70e448-58e7-4a46-ac83-c408d835643d', '陈钢', '2016-08-30 11:24:12'), ('25381bee-c2c2-466f-ba5f-fd0861ebdc63', '1', '用户登录', '陈钢在2016-08-24 11:41:54操作了用户登录功能', '9b70e448-58e7-4a46-ac83-c408d835643d', '陈钢', '2016-08-24 11:41:54'), ('480312e8-6a70-44b7-83c6-35fbb3aa46c8', '1', '用户登录', '陈钢在2016-08-24 11:37:26操作了用户登录功能', '9b70e448-58e7-4a46-ac83-c408d835643d', '陈钢', '2016-08-24 11:37:26'), ('53c7ce1b-69ea-4d12-905b-b05b8e7541c3', '7', '用户删除', '陈钢在2016-08-30 11:24:28操作了用户删除功能', '9b70e448-58e7-4a46-ac83-c408d835643d', '陈钢', '2016-08-30 11:24:28'), ('548fc777-de5c-4f51-b67a-c90a29f6ab98', '7', '用户删除', '陈钢在2016-08-30 11:24:37操作了用户删除功能', '9b70e448-58e7-4a46-ac83-c408d835643d', '陈钢', '2016-08-30 11:24:37'), ('6db8cc8d-f567-4273-bdd6-1ef7c87a9d22', '7', '用户删除', '陈钢在2016-08-30 11:24:25操作了用户删除功能', '9b70e448-58e7-4a46-ac83-c408d835643d', '陈钢', '2016-08-30 11:24:25'), ('7487d4e9-a26f-4c74-87c8-0fff6c296bc4', '2', '用户注销', '陈钢在2016-08-24 11:17:58操作了用户注销功能', '9b70e448-58e7-4a46-ac83-c408d835643d', '陈钢', '2016-08-24 11:17:58'), ('81de3064-2faa-4c61-8888-a1f54a3b2d31', '7', '角色删除', '陈钢在2016-08-30 11:23:40操作了角色删除功能', '9b70e448-58e7-4a46-ac83-c408d835643d', '陈钢', '2016-08-30 11:23:40'), ('8668ae30-8043-4888-bf36-645f039239e8', '1', '用户登录', '陈钢在2016-08-24 11:48:49操作了用户登录功能', '9b70e448-58e7-4a46-ac83-c408d835643d', '陈钢', '2016-08-24 11:48:49'), ('8718a772-5d91-4e3d-b527-7acc10d11f24', '7', '用户删除', '陈钢在2016-08-30 11:24:23操作了用户删除功能', '9b70e448-58e7-4a46-ac83-c408d835643d', '陈钢', '2016-08-30 11:24:23'), ('94d411d5-141c-4a62-9057-3deac40e9cc0', '1', '用户登录', '陈钢在2016-08-24 11:08:58操作了用户登录功能', '9b70e448-58e7-4a46-ac83-c408d835643d', '陈钢', '2016-08-24 11:08:58'), ('9dca05f3-793d-4424-988a-86d0bb234aea', '2', '用户注销', '陈钢在2016-08-24 11:08:52操作了用户注销功能', '9b70e448-58e7-4a46-ac83-c408d835643d', '陈钢', '2016-08-24 11:08:52'), ('a22d6820-be4c-4335-aff3-aa52c91661c4', '5', '机构添加', '陈钢在2016-08-24 11:17:43操作了机构添加功能', '9b70e448-58e7-4a46-ac83-c408d835643d', '陈钢', '2016-08-24 11:17:43'), ('ada1b792-0f3c-4799-a104-58e2903475a8', '7', '角色删除', '陈钢在2016-08-30 11:23:42操作了角色删除功能', '9b70e448-58e7-4a46-ac83-c408d835643d', '陈钢', '2016-08-30 11:23:42'), ('b0a62b4f-a536-436b-b22e-7f66bd3b263e', '7', '用户删除', '陈钢在2016-08-30 11:24:35操作了用户删除功能', '9b70e448-58e7-4a46-ac83-c408d835643d', '陈钢', '2016-08-30 11:24:35'), ('bd182e13-c321-4b24-8282-1693c34a4307', '1', '用户登录', '陈钢在2016-08-24 11:40:22操作了用户登录功能', '9b70e448-58e7-4a46-ac83-c408d835643d', '陈钢', '2016-08-24 11:40:22'), ('c1c5e4a4-2e53-4cb0-b46a-ce671ed58bd5', '7', '用户删除', '陈钢在2016-08-30 11:24:31操作了用户删除功能', '9b70e448-58e7-4a46-ac83-c408d835643d', '陈钢', '2016-08-30 11:24:31'), ('c3b358e0-fcd6-467b-8290-7aec48be4249', '1', '用户登录', '陈钢在2016-08-24 11:18:05操作了用户登录功能', '9b70e448-58e7-4a46-ac83-c408d835643d', '陈钢', '2016-08-24 11:18:05'), ('ca3ec0b5-9e5c-4d01-b4a8-e43305a2ee03', '7', '用户删除', '陈钢在2016-08-30 11:24:33操作了用户删除功能', '9b70e448-58e7-4a46-ac83-c408d835643d', '陈钢', '2016-08-30 11:24:33'), ('d9baf2d0-f999-4913-8a9d-98401e8a8da9', '7', '用户删除', '陈钢在2016-08-30 11:24:15操作了用户删除功能', '9b70e448-58e7-4a46-ac83-c408d835643d', '陈钢', '2016-08-30 11:24:15'), ('e1f6e309-7aeb-4221-9424-b938c87f4289', '1', '用户登录', '陈钢在2016-08-24 11:29:30操作了用户登录功能', '9b70e448-58e7-4a46-ac83-c408d835643d', '陈钢', '2016-08-24 11:29:30'), ('e89b5875-3b58-4df0-9598-ed1ce7fdf168', '7', '数据字典删除', '陈钢在2016-08-30 11:31:12操作了数据字典删除功能', '9b70e448-58e7-4a46-ac83-c408d835643d', '陈钢', '2016-08-30 11:31:12');
COMMIT;

-- ----------------------------
--  Table structure for `sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` double NOT NULL COMMENT '排序',
  `href` varchar(2000) DEFAULT NULL COMMENT '链接',
  `target` varchar(20) DEFAULT NULL COMMENT '目标（mainFrame、 _blank、_self、_parent、_top）',
  `icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `is_show` char(1) NOT NULL COMMENT '是否在菜单中显示（1：显示；0：不显示）',
  `permission` varchar(200) DEFAULT NULL COMMENT '权限标识',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
--  Records of `sys_menu`
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES ('2ce26f7d-2813-4ee0-8c6f-46ab66fcd34e', 'be58f3a0-6065-4086-8b5e-abf41a7151cd', 'be58f3a0-6065-4086-8b5e-abf41a7151cd', '密码修改', '1.2', '/user/addpass', null, null, '1', 'user:addpass', '9b70e448-58e7-4a46-ac83-c408d835643d', '0000-00-00 00:00:00', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-08-30 11:18:36', null, '0'), ('32fb3800-8354-4473-baf2-257747715db1', '', '', '系统管理', '2', '＃', null, null, '1', 'sys', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-07-07 08:45:40', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-08-30 11:19:09', null, '0'), ('32fb3800-8354-4473-baf2-25774771qwb1', '32fb3800-8354-4473-baf2-257747715db1', '32fb3800-8354-4473-baf2-257747715db1|', '数据字典管理', '2.5', '/dict/add', null, null, '1', 'dict:add', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-06-07 11:28:36', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-08-30 11:20:32', null, '0'), ('4ac0c3cd-62e7-4a3e-a0e0-78b1f2e0bde3', '32fb3800-8354-4473-baf2-257747715db1', '', '用户管理', '2.4', '/user/add', null, null, '1', 'user:add', '9b70e448-58e7-4a46-ac83-c408d835643d', '0000-00-00 00:00:00', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-08-30 11:20:23', null, '0'), ('6d6ce90b-1030-4e19-9a3e-85dddc63ce80', '32fb3800-8354-4473-baf2-257747715db1', '32fb3800-8354-4473-baf2-257747715db1|', '角色管理', '2.1', '/role/add', null, null, '1', 'role:add', '9b70e448-58e7-4a46-ac83-c408d835643d', '0000-00-00 00:00:00', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-08-30 11:19:29', null, '0'), ('a1f56cee-bb70-49d5-a0d6-285e3a43d0f9', 'be58f3a0-6065-4086-8b5e-abf41a7151cd', 'f766bb48-1396-41e5-b137-fe24a2bf8d6b|a1f56cee-bb70-49d5-a0d6-285e3a43d0f9', '邮件发送', '1.31', '/file/addmailinfo', null, null, '1', 'file:addmailinfo', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-07-06 18:11:38', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-08-30 11:19:00', '邮件发送', '0'), ('badcdb66-9d0d-49c4-93bd-98d133db4513', '32fb3800-8354-4473-baf2-257747715db1', '32fb3800-8354-4473-baf2-257747715db1|', '菜单管理', '2.3', '/menu/add', null, null, '1', 'menu:add', '9b70e448-58e7-4a46-ac83-c408d835643d', '0000-00-00 00:00:00', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-08-30 11:20:04', null, '0'), ('be58f3a0-6065-4086-8b5e-abf41a7151cd', '', '', '我的面板', '1', '＃', null, null, '1', 'myface', '9b70e448-58e7-4a46-ac83-c408d835643d', '0000-00-00 00:00:00', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-08-30 11:19:15', null, '0'), ('c2ed7881-76e3-44d4-ab1d-c3a942dc306a', '32fb3800-8354-4473-baf2-257747715db1', '32fb3800-8354-4473-baf2-257747715db1|', '组织机构管理', '2.6', '/office/add', null, null, '1', 'office:add', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-06-07 11:28:36', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-08-30 11:20:40', null, '0'), ('caa32364-c4fd-4b5a-9d46-4ee6dd28a66e', '6d6ce90b-1030-4e19-9a3e-85dddc63ce80', '32fb3800-8354-4473-baf2-257747715db1|6d6ce90b-1030-4e19-9a3e-85dddc63ce80|', '角色添加', '2.11', '/role/addroleinfo', null, null, '1', 'role:addroleinfo', '9b70e448-58e7-4a46-ac83-c408d835643d', '0000-00-00 00:00:00', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-08-30 11:19:47', null, '0'), ('dbc26b0f-f865-410a-9f31-181eb481dc21', '32fb3800-8354-4473-baf2-257747715db1', '32fb3800-8354-4473-baf2-257747715db1|', '日志管理', '2.6', '/log/add', null, null, '1', 'log:add', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-06-30 17:58:27', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-08-30 11:28:55', null, '0'), ('e9ed4a79-0291-4ff9-8594-52bed769ac39', '32fb3800-8354-4473-baf2-257747715db1', '32fb3800-8354-4473-baf2-257747715db1|', '地区管理', '2.2', '/area/add', null, null, '1', 'area:add', '9b70e448-58e7-4a46-ac83-c408d835643d', '0000-00-00 00:00:00', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-08-30 11:19:56', null, '0'), ('f766bb48-1396-41e5-b137-fe24a2bf8d6b', 'be58f3a0-6065-4086-8b5e-abf41a7151cd', 'be58f3a0-6065-4086-8b5e-abf41a7151cd|f766bb48-1396-41e5-b137-fe24a2bf8d6b', '文件管理', '1.3', '/file/add', null, null, '1', 'file:add', '9b70e448-58e7-4a46-ac83-c408d835643d', '0000-00-00 00:00:00', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-08-30 11:18:45', null, '0'), ('fe2aa5d7-8563-4b28-8422-7b48050b558f', 'be58f3a0-6065-4086-8b5e-abf41a7151cd', 'be58f3a0-6065-4086-8b5e-abf41a7151cd|', '我的信息', '1.1', '/user/addInfo', null, null, '1', 'user:adding', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-07-11 09:28:39', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-08-30 11:18:14', null, '0');
COMMIT;

-- ----------------------------
--  Table structure for `sys_office`
-- ----------------------------
DROP TABLE IF EXISTS `sys_office`;
CREATE TABLE `sys_office` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` double NOT NULL COMMENT '排序',
  `area_id` varchar(64) NOT NULL COMMENT '归属区域',
  `code` varchar(100) DEFAULT NULL COMMENT '区域编码',
  `type` char(1) NOT NULL DEFAULT '' COMMENT '机构类型（1：机构；2：岗位；3：虚拟组）',
  `grade` char(1) NOT NULL COMMENT '机构等级（1：一级；2：二级；3：三级；4：四级）',
  `address` varchar(255) DEFAULT NULL COMMENT '联系地址',
  `zip_code` varchar(100) DEFAULT NULL COMMENT '邮政编码',
  `master` varchar(100) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(200) DEFAULT NULL COMMENT '电话',
  `fax` varchar(200) DEFAULT NULL COMMENT '传真',
  `email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `USEABLE` varchar(64) DEFAULT NULL,
  `PRIMARY_PERSON` varchar(64) DEFAULT NULL,
  `DEPUTY_PERSON` varchar(64) DEFAULT NULL,
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `area_id` (`area_id`),
  CONSTRAINT `sys_office_ibfk_1` FOREIGN KEY (`area_id`) REFERENCES `sys_area` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
--  Records of `sys_office`
-- ----------------------------
BEGIN;
INSERT INTO `sys_office` VALUES ('03ea5abf-3a1e-45db-af00-216a07e6404c', '9324dac8-a51b-4f35-8d7c-4b7787db3d89', '9324dac8-a51b-4f35-8d7c-4b7787db3d89', '回民区', '1.1', 'a326f968-1277-41b8-9c6d-0a4e89723bda', '11000', '1', '2', '回民区', null, '123', null, null, null, '1', null, null, '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-06-01 23:00:00', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-08-01 16:01:43', null, '0'), ('07a54bac-a9d6-412b-a029-ca2f223efc3d', '', '|07a54bac-a9d6-412b-a029-ca2f223efc3d', '日志', '3', 'b6088cbc-f620-4cc8-8695-8c82a2cbab84', '111112rrr', '1', '0', null, null, '测试', '111', null, null, null, null, null, '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-07-25 10:14:04', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-07-25 10:14:23', null, '1'), ('13b64a68-3a9d-4949-9f98-e5240bef83a4', '03ea5abf-3a1e-45db-af00-216a07e6404c', '03ea5abf-3a1e-45db-af00-216a07e6404c|13b64a68-3a9d-4949-9f98-e5240bef83a4', '调查组', '1.14', 'a326f968-1277-41b8-9c6d-0a4e89723bda', '19099992', '1', '0', null, null, '1111', null, null, null, null, null, null, '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-06-28 09:43:29', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-08-01 16:03:31', null, '1'), ('195ec520-8cdb-4ffe-ad65-d404ce594296', '', '|195ec520-8cdb-4ffe-ad65-d404ce594296', '包头', '2', 'a326f968-1277-41b8-9c6d-0a4e89723bda', '10000', '1', '0', null, null, '王三平', '15034942952', null, '15034942952@139.com', null, null, null, '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-06-27 15:44:40', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-08-03 09:01:53', '15034942952@139.com', '0'), ('22ab6d38-7fde-42a1-943a-13a820de3062', '', '9324dac8-a51b-4f35-8d7c-4b7787db3d89', '回中', '1.11', 'a326f968-1277-41b8-9c6d-0a4e89723bda', '11100', '1', '3', '回中', null, 'zxc', null, null, null, null, null, null, '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-06-01 23:00:00', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-08-01 15:53:52', null, '0'), ('256b1c80-348f-4eb3-95aa-7133bf0433ef', 'd8f671d2-ec1e-41b6-9af4-8687b3d09279', 'd8f671d2-ec1e-41b6-9af4-8687b3d09279|256b1c80-348f-4eb3-95aa-7133bf0433ef', '测试', '20.01', 'd04cad96-216f-4592-990c-eef64725a939', '111111', '1', '0', null, null, '得到', null, null, null, null, null, null, '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-07-30 15:23:49', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-07-30 15:23:49', null, '1'), ('2867b872-5cb6-49f7-9873-72f029674152', '', '03ea5abf-3a1e-45db-af00-216a07e6404c|2867b872-5cb6-49f7-9873-72f029674152', '32中', '1.13', 'a326f968-1277-41b8-9c6d-0a4e89723bda', '32333', '1', '0', null, null, '1234', null, null, null, null, null, null, '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-06-28 09:40:12', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-08-01 16:02:38', null, '1'), ('2ded19c3-6bc1-4dc1-9f5d-5950d73a252b', '9324dac8-a51b-4f35-8d7c-4b7787db3d89', '9324dac8-a51b-4f35-8d7c-4b7787db3d89|2ded19c3-6bc1-4dc1-9f5d-5950d73a252b', '赛罕区', '1.4', 'a326f968-1277-41b8-9c6d-0a4e89723bda', '13400', '1', '0', null, null, '李逵', '1890990909', null, '1890990909@189.com', null, null, null, '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-06-27 16:18:37', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-06-27 16:18:37', '1890990909@189.com', '1'), ('2e8075a4-6441-41f4-9383-8d7826a1dc64', '9324dac8-a51b-4f35-8d7c-4b7787db3d89', '9324dac8-a51b-4f35-8d7c-4b7787db3d89', '新城区', '1.3', 'a326f968-1277-41b8-9c6d-0a4e89723bda', '13000', '1', '2', '新城区', null, null, null, null, null, null, null, null, '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-06-01 23:00:00', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-06-01 23:00:00', null, '1'), ('33b4c27a-0110-4d5d-a1a9-ad8857548014', '', '9324dac8-a51b-4f35-8d7c-4b7787db3d89|33b4c27a-0110-4d5d-a1a9-ad8857548014', '调查组', '1.5', 'a326f968-1277-41b8-9c6d-0a4e89723bda', '1909999', '1', '0', '调查组', null, '调查组', '调查组', null, '调查组', null, null, null, '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-06-28 09:31:55', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-07-30 15:24:36', '调查组', '0'), ('623c486d-589d-4686-a5e6-9dfc0b22d644', '13b64a68-3a9d-4949-9f98-e5240bef83a4', '13b64a68-3a9d-4949-9f98-e5240bef83a4|623c486d-589d-4686-a5e6-9dfc0b22d644', '科长', '1.141', 'a326f968-1277-41b8-9c6d-0a4e89723bda', '32333', '3', '0', null, null, '科长', null, null, null, null, null, null, '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-06-28 09:49:00', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-06-28 09:48:34', null, '1'), ('9324dac8-a51b-4f35-8d7c-4b7787db3d89', '', '', '呼和浩特市', '1', 'a326f968-1277-41b8-9c6d-0a4e89723bda', '10000', '1', '1', '呼和浩特市', null, null, null, null, null, '1', null, null, '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-06-01 23:00:00', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-06-27 17:32:17', null, '0'), ('d3a925b5-14bb-4c4d-add9-5dbbf2c2ba71', '', '|d3a925b5-14bb-4c4d-add9-5dbbf2c2ba71', '1', '4', '', '11', '1', '0', null, null, '11', null, null, null, null, null, null, '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-08-24 11:17:43', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-08-24 11:17:43', null, '0'), ('dc71dd6e-1d51-40ff-8f49-cf12dec92304', '2867b872-5cb6-49f7-9873-72f029674152', '2867b872-5cb6-49f7-9873-72f029674152|dc71dd6e-1d51-40ff-8f49-cf12dec92304', '产品部门', '1.131', 'a326f968-1277-41b8-9c6d-0a4e89723bda', '9088', '1', '0', null, null, '产品部门', null, null, null, null, null, null, '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-07-06 11:14:04', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-07-06 11:14:04', null, '1'), ('f43ae468-a3a5-4850-ab9c-f0d024a23996', '9324dac8-a51b-4f35-8d7c-4b7787db3d89', '9324dac8-a51b-4f35-8d7c-4b7787db3d89', '玉泉区', '1.2', 'a326f968-1277-41b8-9c6d-0a4e89723bda', '12000', '1', '2', '玉泉区', null, null, null, null, null, '1', null, null, '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-06-01 23:00:00', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-06-01 23:00:00', null, '1');
COMMIT;

-- ----------------------------
--  Table structure for `sys_office_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_office_user`;
CREATE TABLE `sys_office_user` (
  `user_id` varchar(64) NOT NULL COMMENT '编号',
  `office_id` varchar(64) NOT NULL COMMENT '编号',
  PRIMARY KEY (`user_id`,`office_id`),
  KEY `office_id` (`office_id`),
  CONSTRAINT `sys_office_user_ibfk_1` FOREIGN KEY (`office_id`) REFERENCES `sys_office` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sys_office_user_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `sys_right`
-- ----------------------------
DROP TABLE IF EXISTS `sys_right`;
CREATE TABLE `sys_right` (
  `id` varchar(64) NOT NULL,
  `resourcesid` varchar(64) DEFAULT NULL,
  `resourcestype` int(11) DEFAULT '0' COMMENT '1.菜单 2表视图功能 3 文件夹',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  `resourcesname` varchar(100) NOT NULL DEFAULT '',
  `permission` varchar(64) DEFAULT NULL COMMENT '权限标识',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色-菜单 sys_role_menu_file';

-- ----------------------------
--  Records of `sys_right`
-- ----------------------------
BEGIN;
INSERT INTO `sys_right` VALUES ('0175a43c-9e91-4cd8-83cc-d1d0200f317b', 'caa32364-c4fd-4b5a-9d46-4ee6dd28a66e', '1', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-01-01 00:00:00', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-08-30 11:29:06', '', '0', '角色添加', 'role:addroleinfo'), ('1d7eeac1-78cb-428b-8d7a-1f8f4f16837a', '6d6ce90b-1030-4e19-9a3e-85dddc63ce80', '1', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-01-01 00:00:00', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-08-30 11:29:05', '', '0', '角色管理', 'role:add'), ('20e2f1f9-6635-4701-a7fb-228c97e40832', 'a1f56cee-bb70-49d5-a0d6-285e3a43d0f9', '1', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-07-06 18:11:43', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-08-30 11:29:05', null, '0', '邮件发送', 'file:addmailinfo'), ('56d2cdfc-63fe-411b-aedd-c92c08348dc2', 'c2ed7881-76e3-44d4-ab1d-c3a942dc306a', '1', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-01-01 00:00:00', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-08-30 11:29:06', '', '0', '组织机构管理', 'office:add'), ('69b8f436-ac77-414f-8210-1e4a9277cb85', 'e9ed4a79-0291-4ff9-8594-52bed769ac39', '1', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-01-01 00:00:00', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-08-30 11:29:06', '', '0', '地区管理', 'area:add'), ('6e0e9028-4e38-40d1-8c5b-1e7a76fd3945', '4ac0c3cd-62e7-4a3e-a0e0-78b1f2e0bde3', '1', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-01-01 00:00:00', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-08-30 11:29:06', '', '0', '用户管理', 'user:add'), ('80be0a73-b56e-47b4-90da-1fe11dffe58f', 'fe2aa5d7-8563-4b28-8422-7b48050b558f', '1', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-01-01 00:00:00', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-08-30 11:29:05', '', '0', '我的信息', 'user:adding'), ('80ca1ae9-b020-4314-a5bd-631ad5ef683e', '32fb3800-8354-4473-baf2-25774771qwb1', '1', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-01-01 00:00:00', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-08-30 11:29:06', '', '0', '数据字典管理', ''), ('ad7c3833-f900-4751-ac2b-38df9119e465', 'be58f3a0-6065-4086-8b5e-abf41a7151cd', '1', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-01-01 00:00:00', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-08-30 11:29:05', '', '0', '我的面板', 'myface'), ('bae5dab5-153a-4dfb-93a2-80c830e088c8', '2ce26f7d-2813-4ee0-8c6f-46ab66fcd34e', '1', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-01-01 00:00:00', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-08-30 11:29:05', '', '0', '密码修改', 'user:addpass'), ('be22d3b6-ecb9-4ad4-bdab-a419206d020a', 'f766bb48-1396-41e5-b137-fe24a2bf8d6b', '1', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-01-01 00:00:00', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-08-30 11:29:05', null, '0', '文件管理', 'file:add'), ('c20145e5-39cb-469f-bb9f-0d1c499fcf1f', '32fb3800-8354-4473-baf2-257747715db1', '1', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-01-01 00:00:00', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-08-30 11:29:05', '', '0', '系统管理', 'sys'), ('d79b1179-265d-4f24-b50a-854b5f67902c', 'badcdb66-9d0d-49c4-93bd-98d133db4513', '1', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-01-01 00:00:00', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-08-30 11:29:06', '', '0', '菜单管理', 'menu:add'), ('ebfa1e07-4cb9-4e92-9ce7-1453f4223163', 'dbc26b0f-f865-410a-9f31-181eb481dc21', '1', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-06-30 18:00:26', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-08-30 11:29:06', null, '0', '日志管理', 'log:add');
COMMIT;

-- ----------------------------
--  Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `office_id` varchar(64) DEFAULT NULL COMMENT '归属机构',
  `name` varchar(100) NOT NULL COMMENT '角色名称',
  `enname` varchar(255) DEFAULT NULL COMMENT '英文名称',
  `role_type` varchar(255) DEFAULT NULL COMMENT '角色类型',
  `data_scope` char(1) DEFAULT NULL COMMENT '数据范围（0：所有数据；1：所在公司及以下数据；2：所在公司数据；3：所在部门及以下数据；4：所在部门数据；8：仅本人数据；9：按明细设置）',
  `is_sys` varchar(64) DEFAULT NULL,
  `useable` varchar(64) DEFAULT NULL,
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
--  Records of `sys_role`
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES ('017fe8f5-97ec-40e3-ad75-6829336ad71a', null, '管理员', '', '11', '1', '0', '1', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-06-20 18:14:04', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-08-24 11:07:21', '管理员', '0');
COMMIT;

-- ----------------------------
--  Table structure for `sys_role_office`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_office`;
CREATE TABLE `sys_role_office` (
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  `office_id` varchar(64) NOT NULL COMMENT '机构编号',
  PRIMARY KEY (`role_id`,`office_id`),
  KEY `office_id` (`office_id`),
  CONSTRAINT `sys_role_office_ibfk_1` FOREIGN KEY (`office_id`) REFERENCES `sys_office` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sys_role_office_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色-机构';

-- ----------------------------
--  Table structure for `sys_role_right`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_right`;
CREATE TABLE `sys_role_right` (
  `role_id` varchar(64) NOT NULL COMMENT '编号',
  `right_id` varchar(64) NOT NULL,
  PRIMARY KEY (`role_id`,`right_id`),
  KEY `right_id` (`right_id`),
  CONSTRAINT `sys_role_right_ibfk_1` FOREIGN KEY (`right_id`) REFERENCES `sys_right` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sys_role_right_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `sys_role_right`
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_right` VALUES ('017fe8f5-97ec-40e3-ad75-6829336ad71a', '0175a43c-9e91-4cd8-83cc-d1d0200f317b'), ('017fe8f5-97ec-40e3-ad75-6829336ad71a', '1d7eeac1-78cb-428b-8d7a-1f8f4f16837a'), ('017fe8f5-97ec-40e3-ad75-6829336ad71a', '20e2f1f9-6635-4701-a7fb-228c97e40832'), ('017fe8f5-97ec-40e3-ad75-6829336ad71a', '56d2cdfc-63fe-411b-aedd-c92c08348dc2'), ('017fe8f5-97ec-40e3-ad75-6829336ad71a', '69b8f436-ac77-414f-8210-1e4a9277cb85'), ('017fe8f5-97ec-40e3-ad75-6829336ad71a', '6e0e9028-4e38-40d1-8c5b-1e7a76fd3945'), ('017fe8f5-97ec-40e3-ad75-6829336ad71a', '80be0a73-b56e-47b4-90da-1fe11dffe58f'), ('017fe8f5-97ec-40e3-ad75-6829336ad71a', '80ca1ae9-b020-4314-a5bd-631ad5ef683e'), ('017fe8f5-97ec-40e3-ad75-6829336ad71a', 'ad7c3833-f900-4751-ac2b-38df9119e465'), ('017fe8f5-97ec-40e3-ad75-6829336ad71a', 'bae5dab5-153a-4dfb-93a2-80c830e088c8'), ('017fe8f5-97ec-40e3-ad75-6829336ad71a', 'be22d3b6-ecb9-4ad4-bdab-a419206d020a'), ('017fe8f5-97ec-40e3-ad75-6829336ad71a', 'c20145e5-39cb-469f-bb9f-0d1c499fcf1f'), ('017fe8f5-97ec-40e3-ad75-6829336ad71a', 'd79b1179-265d-4f24-b50a-854b5f67902c'), ('017fe8f5-97ec-40e3-ad75-6829336ad71a', 'ebfa1e07-4cb9-4e92-9ce7-1453f4223163');
COMMIT;

-- ----------------------------
--  Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `login_name` varchar(100) NOT NULL COMMENT '登录名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `no` varchar(100) DEFAULT NULL COMMENT '工号',
  `name` varchar(100) NOT NULL COMMENT '姓名',
  `email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(200) DEFAULT NULL COMMENT '电话',
  `mobile` varchar(200) DEFAULT NULL COMMENT '手机',
  `user_type` char(1) DEFAULT NULL COMMENT '用户类型',
  `photo` varchar(1000) DEFAULT NULL,
  `login_ip` varchar(100) DEFAULT NULL COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `login_flag` varchar(64) DEFAULT NULL,
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Records of `sys_user`
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES ('9b70e448-58e7-4a46-ac83-c408d835643d', 'admin', '4yl9RZ6rTkywSVtu2b2jkPl5XuCY8xUScfYzDSTaplc=', '01', '陈钢', 'chengang1986_2006@126.com', '15034942952', '15034942952', '1', null, null, '2016-01-01 00:00:00', '1', '', '2016-01-01 00:00:00', '9b70e448-58e7-4a46-ac83-c408d835643d', '2016-06-30 17:54:44', '备注123222', '0');
COMMIT;

-- ----------------------------
--  Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` varchar(64) NOT NULL COMMENT '用户编号',
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `sys_user_role_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sys_user_role_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户-角色';

-- ----------------------------
--  Records of `sys_user_role`
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` VALUES ('9b70e448-58e7-4a46-ac83-c408d835643d', '017fe8f5-97ec-40e3-ad75-6829336ad71a');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
