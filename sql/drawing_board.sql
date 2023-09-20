/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80033 (8.0.33)
 Source Host           : localhost:3306
 Source Schema         : websocket-demo

 Target Server Type    : MySQL
 Target Server Version : 80033 (8.0.33)
 File Encoding         : 65001

 Date: 19/09/2023 23:30:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '组件路径',
  `full_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '完整路径',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '图标',
  `keep_alive` tinyint NOT NULL DEFAULT 1 COMMENT '缓存',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '路由名',
  `parent` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '父级菜单',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '路径',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '页面标题',
  `redirect` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '重定向地址',
  `order_index` int NOT NULL COMMENT '排序',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('2645da9c-5233-ccab-4e34-4cdb7bbed781', 'views/system/menu/MenuIndex.vue', '/system/menu', 'folder-cog-outline', 0, 'MenuIndex', '57428832-5836-d63b-a83a-e755bc2eebca', 'menu', '菜单管理', '', 3, '2022-10-09 14:49:31');
INSERT INTO `sys_menu` VALUES ('57428832-5836-d63b-a83a-e755bc2eebca', 'views/system/SystemView.vue', '/system', 'cog', 0, 'SystemView', NULL, 'system', '系统管理', '', 1, '2022-09-15 00:15:43');
INSERT INTO `sys_menu` VALUES ('5fe8ecc7-1d67-6b3a-d796-d6e33e9838d0', 'views/system/user/UserIndex.vue', '/system/user', 'folder-account-outline', 0, 'UserIndex', '57428832-5836-d63b-a83a-e755bc2eebca', 'user', '用户管理', '', 1, '2022-09-15 00:19:02');
INSERT INTO `sys_menu` VALUES ('741126f9-a2c8-5d4e-ee5a-1019dce7178f', 'views/system/role/RoleIndex.vue', '/system/role', 'folder-arrow-left-right-outline', 0, 'RoleIndex', '57428832-5836-d63b-a83a-e755bc2eebca', 'role', '角色管理', '', 2, '2022-09-15 20:37:01');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('542e15f7-3af7-ecd3-c05b-29ecec100144', 'ceshi', '2023-04-21 18:18:16');
INSERT INTO `sys_role` VALUES ('5eb3d5bc-8101-0359-7602-9d988cc74ec3', 'yuzu', '2022-10-23 19:42:38');
INSERT INTO `sys_role` VALUES ('7f5ba94a-9988-2f78-e466-d1af81d937e1', 'admin', '2022-09-14 23:44:42');

-- ----------------------------
-- Table structure for sys_role_menus_sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menus_sys_menu`;
CREATE TABLE `sys_role_menus_sys_menu`  (
  `sysRoleId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sysMenuId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`sysRoleId`, `sysMenuId`) USING BTREE,
  INDEX `IDX_e7c90b5f1eae0da649c74cfbcb`(`sysRoleId` ASC) USING BTREE,
  INDEX `IDX_c6e4b76cb3f4ab1028f2461963`(`sysMenuId` ASC) USING BTREE,
  CONSTRAINT `FK_c6e4b76cb3f4ab1028f24619635` FOREIGN KEY (`sysMenuId`) REFERENCES `sys_menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_e7c90b5f1eae0da649c74cfbcb4` FOREIGN KEY (`sysRoleId`) REFERENCES `sys_role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menus_sys_menu
-- ----------------------------
INSERT INTO `sys_role_menus_sys_menu` VALUES ('5eb3d5bc-8101-0359-7602-9d988cc74ec3', '2645da9c-5233-ccab-4e34-4cdb7bbed781');
INSERT INTO `sys_role_menus_sys_menu` VALUES ('5eb3d5bc-8101-0359-7602-9d988cc74ec3', '57428832-5836-d63b-a83a-e755bc2eebca');
INSERT INTO `sys_role_menus_sys_menu` VALUES ('5eb3d5bc-8101-0359-7602-9d988cc74ec3', '5fe8ecc7-1d67-6b3a-d796-d6e33e9838d0');
INSERT INTO `sys_role_menus_sys_menu` VALUES ('5eb3d5bc-8101-0359-7602-9d988cc74ec3', '741126f9-a2c8-5d4e-ee5a-1019dce7178f');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '用户' COMMENT '用户名',
  `account` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '账号',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `sex` enum('未知','男','女') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '未知' COMMENT '性别',
  `age` int NULL DEFAULT NULL COMMENT '年龄',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'http://www.yuzuchan.top:9100/test/face.png' COMMENT '头像',
  `role` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '角色',
  `user_status` enum('1','2') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '1' COMMENT '状态：1-有效|2-禁用',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `is_delete` tinyint NOT NULL DEFAULT 0 COMMENT '逻辑删除：false-有效|true-删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `IDX_38bc8e47cfcaa86adc8669ff72`(`account` ASC) USING BTREE,
  UNIQUE INDEX `IDX_a78066266d5da92bbaf1f70cf8`(`email` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('17fe5392-51da-4d85-a0b4-83d0a5532576', '用户', 'ceshi2', '$2b$10$K1GNusv3inOTzbR5Sdw2ouHclObmIrc.pjTLE4U8Gca05WiZtU8L.', '未知', NULL, NULL, NULL, 'http://www.yuzuchan.top:9100/test/face.png', '7f5ba94a-9988-2f78-e466-d1af81d937e1', '1', '2023-05-10 12:58:12', '2023-05-10 12:58:12', 0);
INSERT INTO `sys_user` VALUES ('2093ac94-360f-4f96-b927-339bd77796d5', '用户', 'tuanzi', '$2b$10$ER6JmEsJYT8am6LIvO5RfO/2FxwmRn1.fje7Efgf1lFa.1Ps51UbO', '未知', NULL, NULL, NULL, 'http://www.yuzuchan.top:9100/test/face.png', '7f5ba94a-9988-2f78-e466-d1af81d937e1', '1', '2023-05-08 13:11:21', '2023-05-08 13:11:21', 0);
INSERT INTO `sys_user` VALUES ('414f2747-e126-4725-a57a-18750c21746f', 'yuzu21', 'yuzu21', '$2b$10$s2y9x4iZDj23wF3JdlJoWuDzO6rZkYHKf/ebdqu/k.o0vs16rnmni', '未知', NULL, NULL, NULL, 'http://www.yuzuchan.top:9100/test/face.png', '542e15f7-3af7-ecd3-c05b-29ecec100144', '1', '2023-04-21 18:11:10', '2023-04-21 18:11:10', 0);
INSERT INTO `sys_user` VALUES ('8f170363-7f11-4da0-b59c-99bafd4491ce', 'yuzu', 'yuzu', '$2b$10$VuyJZSCyBdiizWl4nF7i5eNzOkEHdMER7JALxLHF5Ie5Sn6nZKYES', '未知', NULL, NULL, NULL, 'http://www.yuzuchan.top:9100/test/face.png', '5eb3d5bc-8101-0359-7602-9d988cc74ec3', '1', '2023-04-21 18:11:01', '2023-04-21 18:11:01', 0);
INSERT INTO `sys_user` VALUES ('960d4221-48e2-4ec3-911a-78055c6fbdf6', 'yuzu1', 'yuzu1', '$2b$10$dkwJbrmi4iFaHP3mTQa03eZGlAioXd/V.XcZTuFf6LDh5BRtWXLcu', '未知', NULL, NULL, NULL, 'http://www.yuzuchan.top:9100/test/face.png', NULL, '1', '2023-04-21 18:11:07', '2023-04-21 18:11:07', 1);
INSERT INTO `sys_user` VALUES ('b313ffdc-bf36-44b9-8559-ca8d1531d68d', '用户', 'yuzusama', '$2b$10$c.jME4W5SXLhzjuZH4hm5O/.s./KG3XKva8kAnliJBxT8PvnHD.aG', '未知', NULL, NULL, NULL, 'http://www.yuzuchan.top:9100/test/face.png', '5eb3d5bc-8101-0359-7602-9d988cc74ec3', '1', '2023-05-08 11:59:36', '2023-05-08 11:59:36', 0);
INSERT INTO `sys_user` VALUES ('c20f30ff-a823-49e7-b847-43f4b83bcef9', 'admin', 'admin', '$2b$10$FQGkbdevFWwRU3qxzug02uuZegEr0EONBNK0xSFCLiMqQS.ZaIR9e', '男', 20, '123123@qq.com', '17767777677', 'http://www.yuzuchan.top:9100/test/face.png', '7f5ba94a-9988-2f78-e466-d1af81d937e1', '1', '2023-04-22 00:00:14', '2023-04-22 00:00:14', 0);
INSERT INTO `sys_user` VALUES ('e525a168-7e0f-44b8-b778-77d68085c39d', '用户', 'ceshi', '$2b$10$U5t6KeySB0dajM9fgJUtqeg7xcAfNC6tCYf/uY3Yz.AjFl800A32S', '未知', NULL, NULL, NULL, 'http://www.yuzuchan.top:9100/test/face.png', '542e15f7-3af7-ecd3-c05b-29ecec100144', '1', '2023-05-10 12:55:25', '2023-05-10 12:55:25', 1);
INSERT INTO `sys_user` VALUES ('f87d2e77-46e0-4ad6-9f66-b4c5c497b526', '用户', 'yuzusama1', '$2b$10$kvh1G6eJBdavx7aJzyD7mOBQ.GmEYYG63e9XvL3023S3iNRtZD.bG', '未知', NULL, NULL, NULL, 'http://www.yuzuchan.top:9100/test/face.png', '5eb3d5bc-8101-0359-7602-9d988cc74ec3', '1', '2023-05-08 13:06:43', '2023-05-08 13:06:43', 1);
INSERT INTO `sys_user` VALUES ('fc4f3eb1-f23c-4a6b-bcae-bc5ed59df5d9', 'yuzu', 'yuzu333', '$2b$10$roMmQfCM4LHFN0h7pFdt/OE.umu4T9gvlUCLuRz5LtyrkBmuPGdUG', '未知', NULL, NULL, NULL, 'http://www.yuzuchan.top:9100/test/face.png', '5eb3d5bc-8101-0359-7602-9d988cc74ec3', '1', '2023-05-10 13:16:10', '2023-05-10 13:16:10', 0);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '用户' COMMENT '用户名',
  `account` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '账号',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `sex` enum('未知','男','女') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '未知' COMMENT '性别',
  `age` int NULL DEFAULT NULL COMMENT '年龄',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像',
  `role` int NULL DEFAULT NULL COMMENT '角色',
  `user_status` enum('1','2') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '1' COMMENT '状态：1-有效|2-禁用',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `IDX_dd44b05034165835d6dcc18d68`(`account` ASC) USING BTREE,
  UNIQUE INDEX `IDX_97672ac88f789774dd47f7c8be`(`email` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
