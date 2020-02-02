/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50635
 Source Host           : 127.0.0.1:3306
 Source Schema         : laraveladmin

 Target Server Type    : MySQL
 Target Server Version : 50635
 File Encoding         : 65001

 Date: 02/02/2020 14:54:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_menu
-- ----------------------------
BEGIN;
INSERT INTO `admin_menu` VALUES (1, 0, 1, 'Dashboard', 'fa-bar-chart', '/', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (2, 0, 2, 'Admin', 'fa-tasks', '', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (3, 2, 3, 'Users', 'fa-users', 'auth/users', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (4, 2, 4, 'Roles', 'fa-user', 'auth/roles', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (5, 2, 5, 'Permission', 'fa-ban', 'auth/permissions', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (6, 2, 6, 'Menu', 'fa-bars', 'auth/menu', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (7, 2, 7, 'Operation log', 'fa-history', 'auth/logs', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (8, 0, 0, '测试', 'fa-align-center', 'user/users', '*', '2019-12-10 08:45:29', '2019-12-10 09:06:58');
COMMIT;

-- ----------------------------
-- Table structure for admin_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `admin_operation_log`;
CREATE TABLE `admin_operation_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_operation_log_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=351 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_operation_log
-- ----------------------------
BEGIN;
INSERT INTO `admin_operation_log` VALUES (1, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-12-10 08:22:37', '2019-12-10 08:22:37');
INSERT INTO `admin_operation_log` VALUES (2, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-12-10 08:22:48', '2019-12-10 08:22:48');
INSERT INTO `admin_operation_log` VALUES (3, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-12-10 08:27:51', '2019-12-10 08:27:51');
INSERT INTO `admin_operation_log` VALUES (4, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-12-10 08:39:23', '2019-12-10 08:39:23');
INSERT INTO `admin_operation_log` VALUES (5, 1, 'admin/auth/permissions/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-12-10 08:39:27', '2019-12-10 08:39:27');
INSERT INTO `admin_operation_log` VALUES (6, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-12-10 08:39:35', '2019-12-10 08:39:35');
INSERT INTO `admin_operation_log` VALUES (7, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2019-12-10 08:42:27', '2019-12-10 08:42:27');
INSERT INTO `admin_operation_log` VALUES (8, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-12-10 08:42:41', '2019-12-10 08:42:41');
INSERT INTO `admin_operation_log` VALUES (9, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-12-10 08:42:52', '2019-12-10 08:42:52');
INSERT INTO `admin_operation_log` VALUES (10, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-12-10 08:44:05', '2019-12-10 08:44:05');
INSERT INTO `admin_operation_log` VALUES (11, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-12-10 08:44:30', '2019-12-10 08:44:30');
INSERT INTO `admin_operation_log` VALUES (12, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u6d4b\\u8bd5\",\"icon\":\"fa-align-center\",\"uri\":null,\"roles\":[null],\"permission\":\"*\",\"_token\":\"whNK8WWENILA7Gt1XtZcWJlkTK44Urw1JZKNpfC3\"}', '2019-12-10 08:45:29', '2019-12-10 08:45:29');
INSERT INTO `admin_operation_log` VALUES (13, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2019-12-10 08:45:29', '2019-12-10 08:45:29');
INSERT INTO `admin_operation_log` VALUES (14, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2019-12-10 08:45:37', '2019-12-10 08:45:37');
INSERT INTO `admin_operation_log` VALUES (15, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-12-10 08:45:42', '2019-12-10 08:45:42');
INSERT INTO `admin_operation_log` VALUES (16, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-12-10 08:45:46', '2019-12-10 08:45:46');
INSERT INTO `admin_operation_log` VALUES (17, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-12-10 08:45:48', '2019-12-10 08:45:48');
INSERT INTO `admin_operation_log` VALUES (18, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-12-10 08:46:06', '2019-12-10 08:46:06');
INSERT INTO `admin_operation_log` VALUES (19, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-12-10 08:48:10', '2019-12-10 08:48:10');
INSERT INTO `admin_operation_log` VALUES (20, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-12-10 09:01:59', '2019-12-10 09:01:59');
INSERT INTO `admin_operation_log` VALUES (21, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-12-10 09:04:04', '2019-12-10 09:04:04');
INSERT INTO `admin_operation_log` VALUES (22, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-12-10 09:04:54', '2019-12-10 09:04:54');
INSERT INTO `admin_operation_log` VALUES (23, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-12-10 09:05:27', '2019-12-10 09:05:27');
INSERT INTO `admin_operation_log` VALUES (24, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-12-10 09:05:31', '2019-12-10 09:05:31');
INSERT INTO `admin_operation_log` VALUES (25, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-12-10 09:05:42', '2019-12-10 09:05:42');
INSERT INTO `admin_operation_log` VALUES (26, 1, 'admin/auth/menu/8/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-12-10 09:05:54', '2019-12-10 09:05:54');
INSERT INTO `admin_operation_log` VALUES (27, 1, 'admin/auth/menu/8', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u6d4b\\u8bd5\",\"icon\":\"fa-align-center\",\"uri\":\"admin\\/user\\/users\",\"roles\":[null],\"permission\":\"*\",\"_token\":\"whNK8WWENILA7Gt1XtZcWJlkTK44Urw1JZKNpfC3\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com:81\\/admin\\/auth\\/menu\"}', '2019-12-10 09:06:35', '2019-12-10 09:06:35');
INSERT INTO `admin_operation_log` VALUES (28, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2019-12-10 09:06:35', '2019-12-10 09:06:35');
INSERT INTO `admin_operation_log` VALUES (29, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-12-10 09:06:39', '2019-12-10 09:06:39');
INSERT INTO `admin_operation_log` VALUES (30, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-12-10 09:06:43', '2019-12-10 09:06:43');
INSERT INTO `admin_operation_log` VALUES (31, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-12-10 09:06:47', '2019-12-10 09:06:47');
INSERT INTO `admin_operation_log` VALUES (32, 1, 'admin/auth/menu/8/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-12-10 09:06:52', '2019-12-10 09:06:52');
INSERT INTO `admin_operation_log` VALUES (33, 1, 'admin/auth/menu/8', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u6d4b\\u8bd5\",\"icon\":\"fa-align-center\",\"uri\":\"user\\/users\",\"roles\":[null],\"permission\":\"*\",\"_token\":\"whNK8WWENILA7Gt1XtZcWJlkTK44Urw1JZKNpfC3\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com:81\\/admin\\/auth\\/menu\"}', '2019-12-10 09:06:58', '2019-12-10 09:06:58');
INSERT INTO `admin_operation_log` VALUES (34, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2019-12-10 09:06:58', '2019-12-10 09:06:58');
INSERT INTO `admin_operation_log` VALUES (35, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-12-10 09:07:03', '2019-12-10 09:07:03');
INSERT INTO `admin_operation_log` VALUES (36, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-12-10 09:07:06', '2019-12-10 09:07:06');
INSERT INTO `admin_operation_log` VALUES (37, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2019-12-10 09:07:07', '2019-12-10 09:07:07');
INSERT INTO `admin_operation_log` VALUES (38, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2019-12-10 09:07:45', '2019-12-10 09:07:45');
INSERT INTO `admin_operation_log` VALUES (39, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2019-12-10 09:08:17', '2019-12-10 09:08:17');
INSERT INTO `admin_operation_log` VALUES (40, 1, 'admin/users/grid', 'GET', '127.0.0.1', '[]', '2019-12-10 09:08:43', '2019-12-10 09:08:43');
INSERT INTO `admin_operation_log` VALUES (41, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2019-12-10 09:08:45', '2019-12-10 09:08:45');
INSERT INTO `admin_operation_log` VALUES (42, 1, 'admin/users/detail', 'GET', '127.0.0.1', '[]', '2019-12-10 09:08:59', '2019-12-10 09:08:59');
INSERT INTO `admin_operation_log` VALUES (43, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2019-12-10 09:09:01', '2019-12-10 09:09:01');
INSERT INTO `admin_operation_log` VALUES (44, 1, 'admin/users/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-12-10 09:09:04', '2019-12-10 09:09:04');
INSERT INTO `admin_operation_log` VALUES (45, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-12-10 09:09:12', '2019-12-10 09:09:12');
INSERT INTO `admin_operation_log` VALUES (46, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2019-12-10 09:09:40', '2019-12-10 09:09:40');
INSERT INTO `admin_operation_log` VALUES (47, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2019-12-10 09:09:52', '2019-12-10 09:09:52');
INSERT INTO `admin_operation_log` VALUES (48, 1, 'admin/users/grid', 'GET', '127.0.0.1', '[]', '2019-12-10 09:10:01', '2019-12-10 09:10:01');
INSERT INTO `admin_operation_log` VALUES (49, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2019-12-10 09:10:13', '2019-12-10 09:10:13');
INSERT INTO `admin_operation_log` VALUES (50, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2019-12-10 09:12:10', '2019-12-10 09:12:10');
INSERT INTO `admin_operation_log` VALUES (51, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2019-12-10 09:12:18', '2019-12-10 09:12:18');
INSERT INTO `admin_operation_log` VALUES (52, 1, 'admin/users/index', 'GET', '127.0.0.1', '[]', '2019-12-10 09:12:21', '2019-12-10 09:12:21');
INSERT INTO `admin_operation_log` VALUES (53, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2019-12-10 09:12:25', '2019-12-10 09:12:25');
INSERT INTO `admin_operation_log` VALUES (54, 1, 'admin/users/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-12-10 11:53:04', '2019-12-10 11:53:04');
INSERT INTO `admin_operation_log` VALUES (55, 1, 'admin/users', 'POST', '127.0.0.1', '{\"name\":\"yaohua\",\"email\":\"936315305@qq.com\",\"password\":\"123456\",\"remember_token\":\"123456\",\"_token\":\"ktBxZXEKlnhVJJz8JxFBqT7uHfyXmuhOqOFDr6Ig\",\"_previous_\":\"http:\\/\\/laraveladmin.com:81\\/admin\\/users\"}', '2019-12-10 11:53:24', '2019-12-10 11:53:24');
INSERT INTO `admin_operation_log` VALUES (56, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2019-12-10 11:53:24', '2019-12-10 11:53:24');
INSERT INTO `admin_operation_log` VALUES (57, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2019-12-10 11:54:39', '2019-12-10 11:54:39');
INSERT INTO `admin_operation_log` VALUES (58, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2019-12-10 11:55:44', '2019-12-10 11:55:44');
INSERT INTO `admin_operation_log` VALUES (59, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2019-12-10 12:00:30', '2019-12-10 12:00:30');
INSERT INTO `admin_operation_log` VALUES (60, 1, 'admin/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-12-10 12:00:53', '2019-12-10 12:00:53');
INSERT INTO `admin_operation_log` VALUES (61, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-12-10 12:00:57', '2019-12-10 12:00:57');
INSERT INTO `admin_operation_log` VALUES (62, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2019-12-10 12:07:51', '2019-12-10 12:07:51');
INSERT INTO `admin_operation_log` VALUES (63, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-12-10 12:20:02', '2019-12-10 12:20:02');
INSERT INTO `admin_operation_log` VALUES (64, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-12-10 15:50:49', '2019-12-10 15:50:49');
INSERT INTO `admin_operation_log` VALUES (65, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-12-11 01:34:46', '2019-12-11 01:34:46');
INSERT INTO `admin_operation_log` VALUES (66, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-12-11 02:15:28', '2019-12-11 02:15:28');
INSERT INTO `admin_operation_log` VALUES (67, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-12-11 13:11:58', '2019-12-11 13:11:58');
INSERT INTO `admin_operation_log` VALUES (68, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-12-11 13:12:20', '2019-12-11 13:12:20');
INSERT INTO `admin_operation_log` VALUES (69, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-12-11 13:12:46', '2019-12-11 13:12:46');
INSERT INTO `admin_operation_log` VALUES (70, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-12-11 13:12:49', '2019-12-11 13:12:49');
INSERT INTO `admin_operation_log` VALUES (71, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-12-11 13:12:59', '2019-12-11 13:12:59');
INSERT INTO `admin_operation_log` VALUES (72, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-12-11 14:15:49', '2019-12-11 14:15:49');
INSERT INTO `admin_operation_log` VALUES (73, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-12-19 12:11:57', '2019-12-19 12:11:57');
INSERT INTO `admin_operation_log` VALUES (74, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-12-24 15:35:51', '2019-12-24 15:35:51');
INSERT INTO `admin_operation_log` VALUES (75, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-12-24 15:36:02', '2019-12-24 15:36:02');
INSERT INTO `admin_operation_log` VALUES (76, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-12-24 15:36:05', '2019-12-24 15:36:05');
INSERT INTO `admin_operation_log` VALUES (77, 1, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-12-24 15:53:26', '2019-12-24 15:53:26');
INSERT INTO `admin_operation_log` VALUES (78, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-12-24 16:38:51', '2019-12-24 16:38:51');
INSERT INTO `admin_operation_log` VALUES (79, 1, 'logs', 'GET', '127.0.0.1', '[]', '2019-12-24 16:39:00', '2019-12-24 16:39:00');
INSERT INTO `admin_operation_log` VALUES (80, 1, 'logs', 'GET', '127.0.0.1', '[]', '2019-12-24 16:39:11', '2019-12-24 16:39:11');
INSERT INTO `admin_operation_log` VALUES (81, 1, 'logs', 'GET', '127.0.0.1', '[]', '2019-12-24 16:42:13', '2019-12-24 16:42:13');
INSERT INTO `admin_operation_log` VALUES (82, 1, 'logs', 'GET', '127.0.0.1', '[]', '2019-12-24 16:46:26', '2019-12-24 16:46:26');
INSERT INTO `admin_operation_log` VALUES (83, 1, 'logs', 'GET', '127.0.0.1', '[]', '2019-12-24 16:46:54', '2019-12-24 16:46:54');
INSERT INTO `admin_operation_log` VALUES (84, 1, 'logs', 'GET', '127.0.0.1', '[]', '2019-12-24 16:47:01', '2019-12-24 16:47:01');
INSERT INTO `admin_operation_log` VALUES (85, 1, 'logs', 'GET', '127.0.0.1', '[]', '2019-12-24 16:49:21', '2019-12-24 16:49:21');
INSERT INTO `admin_operation_log` VALUES (86, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-12-24 17:12:41', '2019-12-24 17:12:41');
INSERT INTO `admin_operation_log` VALUES (87, 1, 'admin/auth/permissions/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-12-24 17:39:06', '2019-12-24 17:39:06');
INSERT INTO `admin_operation_log` VALUES (88, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-12-24 17:39:18', '2019-12-24 17:39:18');
INSERT INTO `admin_operation_log` VALUES (89, 1, 'admin/auth/permissions/4/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-12-24 17:39:32', '2019-12-24 17:39:32');
INSERT INTO `admin_operation_log` VALUES (90, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-12-24 17:39:42', '2019-12-24 17:39:42');
INSERT INTO `admin_operation_log` VALUES (91, 1, 'admin/auth/permissions/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-12-24 17:40:45', '2019-12-24 17:40:45');
INSERT INTO `admin_operation_log` VALUES (92, 1, 'admin/auth/permissions', 'POST', '127.0.0.1', '{\"slug\":\"logs\",\"name\":\"logs\",\"http_method\":[null],\"http_path\":\"Rap2hpoutre\\\\LaravelLogViewer\\\\LogViewerController\\\\index\",\"_token\":\"WNbXoCn2z0rYFKMWA1ba6PE3qWqDmXbuXNif4SaA\",\"_previous_\":\"http:\\/\\/laraveladmin.com:81\\/admin\\/auth\\/permissions\"}', '2019-12-24 17:41:16', '2019-12-24 17:41:16');
INSERT INTO `admin_operation_log` VALUES (93, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2019-12-24 17:41:16', '2019-12-24 17:41:16');
INSERT INTO `admin_operation_log` VALUES (94, 1, 'logs', 'GET', '127.0.0.1', '[]', '2019-12-24 17:41:30', '2019-12-24 17:41:30');
INSERT INTO `admin_operation_log` VALUES (95, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2019-12-24 17:41:42', '2019-12-24 17:41:42');
INSERT INTO `admin_operation_log` VALUES (96, 1, 'admin/auth/permissions/6/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-12-24 17:42:03', '2019-12-24 17:42:03');
INSERT INTO `admin_operation_log` VALUES (97, 1, 'admin/auth/permissions/6', 'PUT', '127.0.0.1', '{\"slug\":\"logs\",\"name\":\"logs\",\"http_method\":[\"GET\",null],\"http_path\":\"logs\",\"_token\":\"WNbXoCn2z0rYFKMWA1ba6PE3qWqDmXbuXNif4SaA\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com:81\\/admin\\/auth\\/permissions\"}', '2019-12-24 17:42:37', '2019-12-24 17:42:37');
INSERT INTO `admin_operation_log` VALUES (98, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2019-12-24 17:42:38', '2019-12-24 17:42:38');
INSERT INTO `admin_operation_log` VALUES (99, 1, 'admin/auth/permissions/6/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-12-24 17:42:59', '2019-12-24 17:42:59');
INSERT INTO `admin_operation_log` VALUES (100, 1, 'admin/auth/permissions/6', 'PUT', '127.0.0.1', '{\"slug\":\"logs\",\"name\":\"logs\",\"http_method\":[\"GET\",null],\"http_path\":\"\\/logs\",\"_token\":\"WNbXoCn2z0rYFKMWA1ba6PE3qWqDmXbuXNif4SaA\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com:81\\/admin\\/auth\\/permissions\"}', '2019-12-24 17:43:06', '2019-12-24 17:43:06');
INSERT INTO `admin_operation_log` VALUES (101, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2019-12-24 17:43:07', '2019-12-24 17:43:07');
INSERT INTO `admin_operation_log` VALUES (102, 1, 'logs', 'GET', '127.0.0.1', '[]', '2019-12-24 17:43:11', '2019-12-24 17:43:11');
INSERT INTO `admin_operation_log` VALUES (103, 1, 'logs', 'GET', '127.0.0.1', '[]', '2019-12-24 17:43:31', '2019-12-24 17:43:31');
INSERT INTO `admin_operation_log` VALUES (104, 1, 'admin/logs', 'GET', '127.0.0.1', '[]', '2019-12-24 17:43:55', '2019-12-24 17:43:55');
INSERT INTO `admin_operation_log` VALUES (105, 1, 'admin/auth/permissions/6/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-12-24 17:44:16', '2019-12-24 17:44:16');
INSERT INTO `admin_operation_log` VALUES (106, 1, 'admin/auth/permissions/6', 'PUT', '127.0.0.1', '{\"slug\":\"logs\",\"name\":\"logs\",\"http_method\":[\"GET\",null],\"http_path\":\"\\/logsa\",\"_token\":\"WNbXoCn2z0rYFKMWA1ba6PE3qWqDmXbuXNif4SaA\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com:81\\/admin\\/auth\\/permissions\"}', '2019-12-24 17:44:21', '2019-12-24 17:44:21');
INSERT INTO `admin_operation_log` VALUES (107, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2019-12-24 17:44:21', '2019-12-24 17:44:21');
INSERT INTO `admin_operation_log` VALUES (108, 1, 'admin/logs', 'GET', '127.0.0.1', '[]', '2019-12-24 17:44:24', '2019-12-24 17:44:24');
INSERT INTO `admin_operation_log` VALUES (109, 1, 'admin/logs', 'GET', '127.0.0.1', '[]', '2019-12-24 17:44:27', '2019-12-24 17:44:27');
INSERT INTO `admin_operation_log` VALUES (110, 1, 'admin/auth/permissions/6/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-12-24 17:44:32', '2019-12-24 17:44:32');
INSERT INTO `admin_operation_log` VALUES (111, 1, 'admin/auth/permissions/6', 'PUT', '127.0.0.1', '{\"slug\":\"logs\",\"name\":\"logs\",\"http_method\":[\"GET\",null],\"http_path\":\"\\/logs\",\"_token\":\"WNbXoCn2z0rYFKMWA1ba6PE3qWqDmXbuXNif4SaA\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laraveladmin.com:81\\/admin\\/auth\\/permissions\"}', '2019-12-24 17:44:36', '2019-12-24 17:44:36');
INSERT INTO `admin_operation_log` VALUES (112, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2019-12-24 17:44:37', '2019-12-24 17:44:37');
INSERT INTO `admin_operation_log` VALUES (113, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-12-24 17:44:45', '2019-12-24 17:44:45');
INSERT INTO `admin_operation_log` VALUES (114, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-12-24 17:44:56', '2019-12-24 17:44:56');
INSERT INTO `admin_operation_log` VALUES (115, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-12-24 17:45:02', '2019-12-24 17:45:02');
INSERT INTO `admin_operation_log` VALUES (116, 1, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-12-24 17:45:06', '2019-12-24 17:45:06');
INSERT INTO `admin_operation_log` VALUES (117, 1, 'admin/logs', 'GET', '127.0.0.1', '[]', '2019-12-24 17:45:19', '2019-12-24 17:45:19');
INSERT INTO `admin_operation_log` VALUES (118, 1, 'admin/logs', 'GET', '127.0.0.1', '{\"l\":\"eyJpdiI6Ik5yOVFXOWo1XC9UQW9VR21Sa25SU1lBPT0iLCJ2YWx1ZSI6IlEwV0doU051YW9NRmU2MW5ZM3lCb293SVdnYk5HdnNiT2t2bHJFMEJ2UDJOV09iTVIyRGlySW45RWxtSnE3Mm4iLCJtYWMiOiI0MTJiMjQ1MWM4NDQ5ZGQ3MzBiZDhkZDBjYTVlNWRiYjVlOTkxMDNmYjljODBiNGZlYzU1YzU5YzJiY2MwY2YzIn0=\"}', '2019-12-24 17:45:22', '2019-12-24 17:45:22');
INSERT INTO `admin_operation_log` VALUES (119, 1, 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2019-12-24 17:45:44', '2019-12-24 17:45:44');
INSERT INTO `admin_operation_log` VALUES (120, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-12-24 17:45:44', '2019-12-24 17:45:44');
INSERT INTO `admin_operation_log` VALUES (121, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-12-24 17:45:47', '2019-12-24 17:45:47');
INSERT INTO `admin_operation_log` VALUES (122, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"6\",\"_model\":\"Encore_Admin_Auth_Database_Permission\",\"_token\":\"Fl4pVLDPgFB9ulco5VwOszcRoLvGAypOTyYM1KPC\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2019-12-24 17:45:52', '2019-12-24 17:45:52');
INSERT INTO `admin_operation_log` VALUES (123, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-12-24 17:45:52', '2019-12-24 17:45:52');
INSERT INTO `admin_operation_log` VALUES (124, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2019-12-24 17:45:55', '2019-12-24 17:45:55');
INSERT INTO `admin_operation_log` VALUES (125, 1, 'admin/logs', 'GET', '127.0.0.1', '{\"l\":\"eyJpdiI6Ik5yOVFXOWo1XC9UQW9VR21Sa25SU1lBPT0iLCJ2YWx1ZSI6IlEwV0doU051YW9NRmU2MW5ZM3lCb293SVdnYk5HdnNiT2t2bHJFMEJ2UDJOV09iTVIyRGlySW45RWxtSnE3Mm4iLCJtYWMiOiI0MTJiMjQ1MWM4NDQ5ZGQ3MzBiZDhkZDBjYTVlNWRiYjVlOTkxMDNmYjljODBiNGZlYzU1YzU5YzJiY2MwY2YzIn0=\"}', '2019-12-24 17:45:58', '2019-12-24 17:45:58');
INSERT INTO `admin_operation_log` VALUES (126, 1, 'admin/logs', 'GET', '127.0.0.1', '{\"l\":\"eyJpdiI6ImxraWJUUUNid3ZxRmdNN3k4NzlkXC9RPT0iLCJ2YWx1ZSI6Ik5NcmVXWkVSZzZrZ1pnWDFHejVkSTE3RTJGT082RGw5QzdUOHBRdm5CV2s9IiwibWFjIjoiNTA0ZDVjYzUxM2QwNzI3M2ZlYzFmMzFhZDY4OGUyOTI0ZDcwZDQ0NjljMmUzMGJiYjJhZThiYWQ0OTEwMWY1OCJ9\"}', '2019-12-24 17:46:02', '2019-12-24 17:46:02');
INSERT INTO `admin_operation_log` VALUES (127, 1, 'admin/logs', 'GET', '127.0.0.1', '{\"l\":\"eyJpdiI6IitYaGs3bXpEaHdnVFZaZ0V2bDZWVXc9PSIsInZhbHVlIjoiMXBqMlVobTV2TGJzYVFzaVFuYTZYK2ticm9iQUdIVnVicU1XdzBCeHg0aEV6ZXhjdEFRMHZTcWhIVUxIa0RreCIsIm1hYyI6IjVjNjc5NzQ0YTJlYzZkNTI5NzVlZDUzNjA0YTQ2YjIxYmJiNjdlMWUwNDYxNTIyZTJlYTAwYzZiNTA4NDc2ZmMifQ==\"}', '2019-12-24 17:46:04', '2019-12-24 17:46:04');
INSERT INTO `admin_operation_log` VALUES (128, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-12-24 20:09:30', '2019-12-24 20:09:30');
INSERT INTO `admin_operation_log` VALUES (129, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-12-24 20:10:57', '2019-12-24 20:10:57');
INSERT INTO `admin_operation_log` VALUES (130, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-12-24 20:14:13', '2019-12-24 20:14:13');
INSERT INTO `admin_operation_log` VALUES (131, 1, 'doc', 'GET', '127.0.0.1', '[]', '2019-12-24 20:45:06', '2019-12-24 20:45:06');
INSERT INTO `admin_operation_log` VALUES (132, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-12-25 16:16:22', '2019-12-25 16:16:22');
INSERT INTO `admin_operation_log` VALUES (133, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-12-25 16:16:25', '2019-12-25 16:16:25');
INSERT INTO `admin_operation_log` VALUES (134, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-12-25 16:16:27', '2019-12-25 16:16:27');
INSERT INTO `admin_operation_log` VALUES (135, 1, 'admin/auth/roles/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-12-25 16:16:32', '2019-12-25 16:16:32');
INSERT INTO `admin_operation_log` VALUES (136, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-12-25 16:16:35', '2019-12-25 16:16:35');
INSERT INTO `admin_operation_log` VALUES (137, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-12-25 17:06:54', '2019-12-25 17:06:54');
INSERT INTO `admin_operation_log` VALUES (138, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-12-26 21:19:48', '2019-12-26 21:19:48');
INSERT INTO `admin_operation_log` VALUES (139, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-12-26 21:20:14', '2019-12-26 21:20:14');
INSERT INTO `admin_operation_log` VALUES (140, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-12-26 21:21:00', '2019-12-26 21:21:00');
INSERT INTO `admin_operation_log` VALUES (141, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-12-26 22:14:12', '2019-12-26 22:14:12');
INSERT INTO `admin_operation_log` VALUES (142, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-01-07 00:04:55', '2020-01-07 00:04:55');
INSERT INTO `admin_operation_log` VALUES (143, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-01-07 00:13:17', '2020-01-07 00:13:17');
INSERT INTO `admin_operation_log` VALUES (144, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-01-11 23:01:17', '2020-01-11 23:01:17');
INSERT INTO `admin_operation_log` VALUES (145, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-11 23:01:23', '2020-01-11 23:01:23');
INSERT INTO `admin_operation_log` VALUES (146, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-11 23:01:25', '2020-01-11 23:01:25');
INSERT INTO `admin_operation_log` VALUES (147, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-01-11 23:45:29', '2020-01-11 23:45:29');
INSERT INTO `admin_operation_log` VALUES (148, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-01-11 23:48:24', '2020-01-11 23:48:24');
INSERT INTO `admin_operation_log` VALUES (149, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-12 09:39:57', '2020-01-12 09:39:57');
INSERT INTO `admin_operation_log` VALUES (150, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-12 09:40:00', '2020-01-12 09:40:00');
INSERT INTO `admin_operation_log` VALUES (151, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-12 09:40:03', '2020-01-12 09:40:03');
INSERT INTO `admin_operation_log` VALUES (152, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-01-12 10:21:00', '2020-01-12 10:21:00');
INSERT INTO `admin_operation_log` VALUES (153, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-01-12 13:05:43', '2020-01-12 13:05:43');
INSERT INTO `admin_operation_log` VALUES (154, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2020-01-12 14:39:25', '2020-01-12 14:39:25');
INSERT INTO `admin_operation_log` VALUES (155, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-12 14:39:29', '2020-01-12 14:39:29');
INSERT INTO `admin_operation_log` VALUES (156, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-12 14:39:33', '2020-01-12 14:39:33');
INSERT INTO `admin_operation_log` VALUES (157, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-12 14:41:50', '2020-01-12 14:41:50');
INSERT INTO `admin_operation_log` VALUES (158, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-12 14:41:53', '2020-01-12 14:41:53');
INSERT INTO `admin_operation_log` VALUES (159, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-12 14:42:00', '2020-01-12 14:42:00');
INSERT INTO `admin_operation_log` VALUES (160, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-01-12 14:42:05', '2020-01-12 14:42:05');
INSERT INTO `admin_operation_log` VALUES (161, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-01-12 14:42:08', '2020-01-12 14:42:08');
INSERT INTO `admin_operation_log` VALUES (162, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-12 14:42:11', '2020-01-12 14:42:11');
INSERT INTO `admin_operation_log` VALUES (163, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-12 14:42:13', '2020-01-12 14:42:13');
INSERT INTO `admin_operation_log` VALUES (164, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-12 14:42:50', '2020-01-12 14:42:50');
INSERT INTO `admin_operation_log` VALUES (165, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-12 14:42:54', '2020-01-12 14:42:54');
INSERT INTO `admin_operation_log` VALUES (166, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-01-12 14:42:57', '2020-01-12 14:42:57');
INSERT INTO `admin_operation_log` VALUES (167, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-12 14:42:59', '2020-01-12 14:42:59');
INSERT INTO `admin_operation_log` VALUES (168, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-12 14:45:32', '2020-01-12 14:45:32');
INSERT INTO `admin_operation_log` VALUES (169, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-01-12 14:45:34', '2020-01-12 14:45:34');
INSERT INTO `admin_operation_log` VALUES (170, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-12 14:45:37', '2020-01-12 14:45:37');
INSERT INTO `admin_operation_log` VALUES (171, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-12 14:46:07', '2020-01-12 14:46:07');
INSERT INTO `admin_operation_log` VALUES (172, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-01-12 14:46:10', '2020-01-12 14:46:10');
INSERT INTO `admin_operation_log` VALUES (173, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-12 14:46:11', '2020-01-12 14:46:11');
INSERT INTO `admin_operation_log` VALUES (174, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-12 14:46:14', '2020-01-12 14:46:14');
INSERT INTO `admin_operation_log` VALUES (175, 1, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-12 14:57:22', '2020-01-12 14:57:22');
INSERT INTO `admin_operation_log` VALUES (176, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2020-01-12 16:03:16', '2020-01-12 16:03:16');
INSERT INTO `admin_operation_log` VALUES (177, 1, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-12 16:03:35', '2020-01-12 16:03:35');
INSERT INTO `admin_operation_log` VALUES (178, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-01-12 16:16:29', '2020-01-12 16:16:29');
INSERT INTO `admin_operation_log` VALUES (179, 1, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-12 16:17:00', '2020-01-12 16:17:00');
INSERT INTO `admin_operation_log` VALUES (180, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-01-12 16:53:47', '2020-01-12 16:53:47');
INSERT INTO `admin_operation_log` VALUES (181, 1, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-12 16:54:36', '2020-01-12 16:54:36');
INSERT INTO `admin_operation_log` VALUES (182, 1, 'admin', 'GET', '127.0.0.1', '{\"XDEBUG_SESSION_START\":\"19790\"}', '2020-01-12 17:40:11', '2020-01-12 17:40:11');
INSERT INTO `admin_operation_log` VALUES (183, 1, 'admin', 'GET', '127.0.0.1', '{\"XDEBUG_SESSION_START\":\"12702\"}', '2020-01-12 17:40:25', '2020-01-12 17:40:25');
INSERT INTO `admin_operation_log` VALUES (184, 1, 'admin', 'GET', '127.0.0.1', '{\"XDEBUG_SESSION_START\":\"16205\"}', '2020-01-12 17:40:44', '2020-01-12 17:40:44');
INSERT INTO `admin_operation_log` VALUES (185, 1, 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2020-01-12 17:56:06', '2020-01-12 17:56:06');
INSERT INTO `admin_operation_log` VALUES (186, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-01-12 17:56:06', '2020-01-12 17:56:06');
INSERT INTO `admin_operation_log` VALUES (187, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-12 17:56:17', '2020-01-12 17:56:17');
INSERT INTO `admin_operation_log` VALUES (188, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-12 17:56:36', '2020-01-12 17:56:36');
INSERT INTO `admin_operation_log` VALUES (189, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-12 17:56:46', '2020-01-12 17:56:46');
INSERT INTO `admin_operation_log` VALUES (190, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-12 17:56:47', '2020-01-12 17:56:47');
INSERT INTO `admin_operation_log` VALUES (191, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-12 17:56:52', '2020-01-12 17:56:52');
INSERT INTO `admin_operation_log` VALUES (192, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-12 17:56:55', '2020-01-12 17:56:55');
INSERT INTO `admin_operation_log` VALUES (193, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-12 17:56:58', '2020-01-12 17:56:58');
INSERT INTO `admin_operation_log` VALUES (194, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-12 17:57:05', '2020-01-12 17:57:05');
INSERT INTO `admin_operation_log` VALUES (195, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-12 17:57:18', '2020-01-12 17:57:18');
INSERT INTO `admin_operation_log` VALUES (196, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-01-12 17:58:01', '2020-01-12 17:58:01');
INSERT INTO `admin_operation_log` VALUES (197, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-12 17:58:04', '2020-01-12 17:58:04');
INSERT INTO `admin_operation_log` VALUES (198, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-12 19:46:11', '2020-01-12 19:46:11');
INSERT INTO `admin_operation_log` VALUES (199, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-12 19:46:13', '2020-01-12 19:46:13');
INSERT INTO `admin_operation_log` VALUES (200, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-12 19:46:13', '2020-01-12 19:46:13');
INSERT INTO `admin_operation_log` VALUES (201, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-12 19:47:04', '2020-01-12 19:47:04');
INSERT INTO `admin_operation_log` VALUES (202, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-12 19:47:17', '2020-01-12 19:47:17');
INSERT INTO `admin_operation_log` VALUES (203, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-12 19:56:46', '2020-01-12 19:56:46');
INSERT INTO `admin_operation_log` VALUES (204, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-12 19:56:57', '2020-01-12 19:56:57');
INSERT INTO `admin_operation_log` VALUES (205, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-12 19:57:02', '2020-01-12 19:57:02');
INSERT INTO `admin_operation_log` VALUES (206, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-12 19:57:56', '2020-01-12 19:57:56');
INSERT INTO `admin_operation_log` VALUES (207, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-12 19:58:19', '2020-01-12 19:58:19');
INSERT INTO `admin_operation_log` VALUES (208, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-12 19:58:23', '2020-01-12 19:58:23');
INSERT INTO `admin_operation_log` VALUES (209, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-12 19:59:13', '2020-01-12 19:59:13');
INSERT INTO `admin_operation_log` VALUES (210, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-12 19:59:47', '2020-01-12 19:59:47');
INSERT INTO `admin_operation_log` VALUES (211, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-12 20:00:08', '2020-01-12 20:00:08');
INSERT INTO `admin_operation_log` VALUES (212, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-12 20:00:23', '2020-01-12 20:00:23');
INSERT INTO `admin_operation_log` VALUES (213, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-12 20:00:40', '2020-01-12 20:00:40');
INSERT INTO `admin_operation_log` VALUES (214, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-12 20:00:48', '2020-01-12 20:00:48');
INSERT INTO `admin_operation_log` VALUES (215, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-12 20:02:24', '2020-01-12 20:02:24');
INSERT INTO `admin_operation_log` VALUES (216, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-12 20:02:33', '2020-01-12 20:02:33');
INSERT INTO `admin_operation_log` VALUES (217, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-12 20:03:34', '2020-01-12 20:03:34');
INSERT INTO `admin_operation_log` VALUES (218, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-12 20:03:37', '2020-01-12 20:03:37');
INSERT INTO `admin_operation_log` VALUES (219, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-12 20:05:58', '2020-01-12 20:05:58');
INSERT INTO `admin_operation_log` VALUES (220, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-12 20:08:24', '2020-01-12 20:08:24');
INSERT INTO `admin_operation_log` VALUES (221, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-12 20:08:27', '2020-01-12 20:08:27');
INSERT INTO `admin_operation_log` VALUES (222, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-12 20:11:57', '2020-01-12 20:11:57');
INSERT INTO `admin_operation_log` VALUES (223, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-12 20:11:59', '2020-01-12 20:11:59');
INSERT INTO `admin_operation_log` VALUES (224, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-12 20:12:09', '2020-01-12 20:12:09');
INSERT INTO `admin_operation_log` VALUES (225, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-12 20:12:12', '2020-01-12 20:12:12');
INSERT INTO `admin_operation_log` VALUES (226, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-12 20:15:29', '2020-01-12 20:15:29');
INSERT INTO `admin_operation_log` VALUES (227, 1, 'admin/auth/users', 'POST', '127.0.0.1', '{\"username\":null,\"name\":null,\"password\":null,\"password_confirmation\":null,\"roles\":[null],\"permissions\":[null],\"_token\":\"1A2hWebz2fqIyeELw2LSEM4cgBLVSUMiTVOPPvZf\"}', '2020-01-12 20:15:37', '2020-01-12 20:15:37');
INSERT INTO `admin_operation_log` VALUES (228, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-12 20:15:38', '2020-01-12 20:15:38');
INSERT INTO `admin_operation_log` VALUES (229, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-12 20:15:47', '2020-01-12 20:15:47');
INSERT INTO `admin_operation_log` VALUES (230, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-12 20:18:37', '2020-01-12 20:18:37');
INSERT INTO `admin_operation_log` VALUES (231, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-12 20:20:36', '2020-01-12 20:20:36');
INSERT INTO `admin_operation_log` VALUES (232, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-12 20:21:14', '2020-01-12 20:21:14');
INSERT INTO `admin_operation_log` VALUES (233, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-12 20:21:17', '2020-01-12 20:21:17');
INSERT INTO `admin_operation_log` VALUES (234, 1, 'admin', 'GET', '127.0.0.1', '{\"XDEBUG_SESSION_START\":\"15581\"}', '2020-01-12 20:23:19', '2020-01-12 20:23:19');
INSERT INTO `admin_operation_log` VALUES (235, 1, 'admin', 'GET', '127.0.0.1', '{\"XDEBUG_SESSION_START\":\"17547\"}', '2020-01-12 20:38:23', '2020-01-12 20:38:23');
INSERT INTO `admin_operation_log` VALUES (236, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-12 20:39:17', '2020-01-12 20:39:17');
INSERT INTO `admin_operation_log` VALUES (237, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-12 20:39:19', '2020-01-12 20:39:19');
INSERT INTO `admin_operation_log` VALUES (238, 1, 'admin', 'GET', '127.0.0.1', '{\"XDEBUG_SESSION_START\":\"19528\"}', '2020-01-12 20:39:32', '2020-01-12 20:39:32');
INSERT INTO `admin_operation_log` VALUES (239, 1, 'admin', 'GET', '127.0.0.1', '{\"XDEBUG_SESSION_START\":\"16394\"}', '2020-01-12 20:44:36', '2020-01-12 20:44:36');
INSERT INTO `admin_operation_log` VALUES (240, 1, 'admin', 'GET', '127.0.0.1', '{\"XDEBUG_SESSION_START\":\"14133\"}', '2020-01-12 20:51:17', '2020-01-12 20:51:17');
INSERT INTO `admin_operation_log` VALUES (241, 1, 'admin', 'GET', '127.0.0.1', '{\"XDEBUG_SESSION_START\":\"17551\"}', '2020-01-12 20:51:55', '2020-01-12 20:51:55');
INSERT INTO `admin_operation_log` VALUES (242, 1, 'admin', 'GET', '127.0.0.1', '{\"XDEBUG_SESSION_START\":\"11068\"}', '2020-01-12 20:52:52', '2020-01-12 20:52:52');
INSERT INTO `admin_operation_log` VALUES (243, 1, 'admin', 'GET', '127.0.0.1', '{\"XDEBUG_SESSION_START\":\"19934\"}', '2020-01-12 20:53:00', '2020-01-12 20:53:00');
INSERT INTO `admin_operation_log` VALUES (244, 1, 'admin', 'GET', '127.0.0.1', '{\"XDEBUG_SESSION_START\":\"15339\"}', '2020-01-12 20:53:44', '2020-01-12 20:53:44');
INSERT INTO `admin_operation_log` VALUES (245, 1, 'admin', 'GET', '127.0.0.1', '{\"XDEBUG_SESSION_START\":\"15765\"}', '2020-01-12 20:55:12', '2020-01-12 20:55:12');
INSERT INTO `admin_operation_log` VALUES (246, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-01-12 22:31:16', '2020-01-12 22:31:16');
INSERT INTO `admin_operation_log` VALUES (247, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-12 22:31:20', '2020-01-12 22:31:20');
INSERT INTO `admin_operation_log` VALUES (248, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-12 22:31:22', '2020-01-12 22:31:22');
INSERT INTO `admin_operation_log` VALUES (249, 1, 'admin', 'GET', '127.0.0.1', '{\"XDEBUG_SESSION_START\":\"14042\"}', '2020-01-12 22:32:14', '2020-01-12 22:32:14');
INSERT INTO `admin_operation_log` VALUES (250, 1, 'admin', 'GET', '127.0.0.1', '{\"XDEBUG_SESSION_START\":\"13701\"}', '2020-01-12 22:33:42', '2020-01-12 22:33:42');
INSERT INTO `admin_operation_log` VALUES (251, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-12 23:07:03', '2020-01-12 23:07:03');
INSERT INTO `admin_operation_log` VALUES (252, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-12 23:08:03', '2020-01-12 23:08:03');
INSERT INTO `admin_operation_log` VALUES (253, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-12 23:08:30', '2020-01-12 23:08:30');
INSERT INTO `admin_operation_log` VALUES (254, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-12 23:08:49', '2020-01-12 23:08:49');
INSERT INTO `admin_operation_log` VALUES (255, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-12 23:09:42', '2020-01-12 23:09:42');
INSERT INTO `admin_operation_log` VALUES (256, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-12 23:10:21', '2020-01-12 23:10:21');
INSERT INTO `admin_operation_log` VALUES (257, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-12 23:25:24', '2020-01-12 23:25:24');
INSERT INTO `admin_operation_log` VALUES (258, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-12 23:25:41', '2020-01-12 23:25:41');
INSERT INTO `admin_operation_log` VALUES (259, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-12 23:25:46', '2020-01-12 23:25:46');
INSERT INTO `admin_operation_log` VALUES (260, 1, 'admin/auth/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-12 23:25:49', '2020-01-12 23:25:49');
INSERT INTO `admin_operation_log` VALUES (261, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-12 23:25:56', '2020-01-12 23:25:56');
INSERT INTO `admin_operation_log` VALUES (262, 1, 'admin/auth/users/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-12 23:26:00', '2020-01-12 23:26:00');
INSERT INTO `admin_operation_log` VALUES (263, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-12 23:26:03', '2020-01-12 23:26:03');
INSERT INTO `admin_operation_log` VALUES (264, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-12 23:26:08', '2020-01-12 23:26:08');
INSERT INTO `admin_operation_log` VALUES (265, 1, 'admin/auth/roles/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-12 23:26:11', '2020-01-12 23:26:11');
INSERT INTO `admin_operation_log` VALUES (266, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-12 23:26:22', '2020-01-12 23:26:22');
INSERT INTO `admin_operation_log` VALUES (267, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-12 23:27:41', '2020-01-12 23:27:41');
INSERT INTO `admin_operation_log` VALUES (268, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-12 23:27:43', '2020-01-12 23:27:43');
INSERT INTO `admin_operation_log` VALUES (269, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-12 23:27:43', '2020-01-12 23:27:43');
INSERT INTO `admin_operation_log` VALUES (270, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-12 23:31:45', '2020-01-12 23:31:45');
INSERT INTO `admin_operation_log` VALUES (271, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-12 23:35:44', '2020-01-12 23:35:44');
INSERT INTO `admin_operation_log` VALUES (272, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-12 23:35:57', '2020-01-12 23:35:57');
INSERT INTO `admin_operation_log` VALUES (273, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-01-12 23:36:40', '2020-01-12 23:36:40');
INSERT INTO `admin_operation_log` VALUES (274, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-01-12 23:38:21', '2020-01-12 23:38:21');
INSERT INTO `admin_operation_log` VALUES (275, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-12 23:38:24', '2020-01-12 23:38:24');
INSERT INTO `admin_operation_log` VALUES (276, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-12 23:38:26', '2020-01-12 23:38:26');
INSERT INTO `admin_operation_log` VALUES (277, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-12 23:38:26', '2020-01-12 23:38:26');
INSERT INTO `admin_operation_log` VALUES (278, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-12 23:42:05', '2020-01-12 23:42:05');
INSERT INTO `admin_operation_log` VALUES (279, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-12 23:42:27', '2020-01-12 23:42:27');
INSERT INTO `admin_operation_log` VALUES (280, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-12 23:42:59', '2020-01-12 23:42:59');
INSERT INTO `admin_operation_log` VALUES (281, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-12 23:43:47', '2020-01-12 23:43:47');
INSERT INTO `admin_operation_log` VALUES (282, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-12 23:44:05', '2020-01-12 23:44:05');
INSERT INTO `admin_operation_log` VALUES (283, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-12 23:44:13', '2020-01-12 23:44:13');
INSERT INTO `admin_operation_log` VALUES (284, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-12 23:44:21', '2020-01-12 23:44:21');
INSERT INTO `admin_operation_log` VALUES (285, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-12 23:44:28', '2020-01-12 23:44:28');
INSERT INTO `admin_operation_log` VALUES (286, 1, 'admin', 'GET', '127.0.0.1', '{\"XDEBUG_SESSION_START\":\"11979\"}', '2020-01-12 23:45:10', '2020-01-12 23:45:10');
INSERT INTO `admin_operation_log` VALUES (287, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-12 23:47:36', '2020-01-12 23:47:36');
INSERT INTO `admin_operation_log` VALUES (288, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-12 23:47:38', '2020-01-12 23:47:38');
INSERT INTO `admin_operation_log` VALUES (289, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-01-12 23:47:39', '2020-01-12 23:47:39');
INSERT INTO `admin_operation_log` VALUES (290, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-01-12 23:52:07', '2020-01-12 23:52:07');
INSERT INTO `admin_operation_log` VALUES (291, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-12 23:52:11', '2020-01-12 23:52:11');
INSERT INTO `admin_operation_log` VALUES (292, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-12 23:52:11', '2020-01-12 23:52:11');
INSERT INTO `admin_operation_log` VALUES (293, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-13 00:00:08', '2020-01-13 00:00:08');
INSERT INTO `admin_operation_log` VALUES (294, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-13 00:00:15', '2020-01-13 00:00:15');
INSERT INTO `admin_operation_log` VALUES (295, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-13 00:00:48', '2020-01-13 00:00:48');
INSERT INTO `admin_operation_log` VALUES (296, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-13 00:06:08', '2020-01-13 00:06:08');
INSERT INTO `admin_operation_log` VALUES (297, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-13 00:06:18', '2020-01-13 00:06:18');
INSERT INTO `admin_operation_log` VALUES (298, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-13 00:11:21', '2020-01-13 00:11:21');
INSERT INTO `admin_operation_log` VALUES (299, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-13 00:11:55', '2020-01-13 00:11:55');
INSERT INTO `admin_operation_log` VALUES (300, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-13 00:16:30', '2020-01-13 00:16:30');
INSERT INTO `admin_operation_log` VALUES (301, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-13 00:26:27', '2020-01-13 00:26:27');
INSERT INTO `admin_operation_log` VALUES (302, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-13 00:27:02', '2020-01-13 00:27:02');
INSERT INTO `admin_operation_log` VALUES (303, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-13 00:27:08', '2020-01-13 00:27:08');
INSERT INTO `admin_operation_log` VALUES (304, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-13 00:27:10', '2020-01-13 00:27:10');
INSERT INTO `admin_operation_log` VALUES (305, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-13 00:27:15', '2020-01-13 00:27:15');
INSERT INTO `admin_operation_log` VALUES (306, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-13 00:27:26', '2020-01-13 00:27:26');
INSERT INTO `admin_operation_log` VALUES (307, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-13 00:27:28', '2020-01-13 00:27:28');
INSERT INTO `admin_operation_log` VALUES (308, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-13 00:27:30', '2020-01-13 00:27:30');
INSERT INTO `admin_operation_log` VALUES (309, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-13 00:27:33', '2020-01-13 00:27:33');
INSERT INTO `admin_operation_log` VALUES (310, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-13 00:27:37', '2020-01-13 00:27:37');
INSERT INTO `admin_operation_log` VALUES (311, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-13 00:27:44', '2020-01-13 00:27:44');
INSERT INTO `admin_operation_log` VALUES (312, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-13 00:35:31', '2020-01-13 00:35:31');
INSERT INTO `admin_operation_log` VALUES (313, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-13 00:35:37', '2020-01-13 00:35:37');
INSERT INTO `admin_operation_log` VALUES (314, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-13 00:35:43', '2020-01-13 00:35:43');
INSERT INTO `admin_operation_log` VALUES (315, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-13 00:35:49', '2020-01-13 00:35:49');
INSERT INTO `admin_operation_log` VALUES (316, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-13 00:36:53', '2020-01-13 00:36:53');
INSERT INTO `admin_operation_log` VALUES (317, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-13 00:36:56', '2020-01-13 00:36:56');
INSERT INTO `admin_operation_log` VALUES (318, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-13 00:38:53', '2020-01-13 00:38:53');
INSERT INTO `admin_operation_log` VALUES (319, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-13 00:39:39', '2020-01-13 00:39:39');
INSERT INTO `admin_operation_log` VALUES (320, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-13 00:40:33', '2020-01-13 00:40:33');
INSERT INTO `admin_operation_log` VALUES (321, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-13 00:40:36', '2020-01-13 00:40:36');
INSERT INTO `admin_operation_log` VALUES (322, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-01-13 00:40:36', '2020-01-13 00:40:36');
INSERT INTO `admin_operation_log` VALUES (323, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-01-13 00:41:04', '2020-01-13 00:41:04');
INSERT INTO `admin_operation_log` VALUES (324, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-01-13 10:24:25', '2020-01-13 10:24:25');
INSERT INTO `admin_operation_log` VALUES (325, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-13 10:24:29', '2020-01-13 10:24:29');
INSERT INTO `admin_operation_log` VALUES (326, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-13 10:24:35', '2020-01-13 10:24:35');
INSERT INTO `admin_operation_log` VALUES (327, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-13 10:24:41', '2020-01-13 10:24:41');
INSERT INTO `admin_operation_log` VALUES (328, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-13 10:24:44', '2020-01-13 10:24:44');
INSERT INTO `admin_operation_log` VALUES (329, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-13 10:25:09', '2020-01-13 10:25:09');
INSERT INTO `admin_operation_log` VALUES (330, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-13 11:02:49', '2020-01-13 11:02:49');
INSERT INTO `admin_operation_log` VALUES (331, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-13 11:02:51', '2020-01-13 11:02:51');
INSERT INTO `admin_operation_log` VALUES (332, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-13 11:02:53', '2020-01-13 11:02:53');
INSERT INTO `admin_operation_log` VALUES (333, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-13 11:02:57', '2020-01-13 11:02:57');
INSERT INTO `admin_operation_log` VALUES (334, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-01-13 11:05:08', '2020-01-13 11:05:08');
INSERT INTO `admin_operation_log` VALUES (335, 1, 'chat', 'GET', '127.0.0.1', '[]', '2020-01-13 15:31:45', '2020-01-13 15:31:45');
INSERT INTO `admin_operation_log` VALUES (336, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-01-13 16:15:15', '2020-01-13 16:15:15');
INSERT INTO `admin_operation_log` VALUES (337, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-01-13 22:55:56', '2020-01-13 22:55:56');
INSERT INTO `admin_operation_log` VALUES (338, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-01-13 22:56:53', '2020-01-13 22:56:53');
INSERT INTO `admin_operation_log` VALUES (339, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-01-13 22:56:58', '2020-01-13 22:56:58');
INSERT INTO `admin_operation_log` VALUES (340, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-01-13 22:57:09', '2020-01-13 22:57:09');
INSERT INTO `admin_operation_log` VALUES (341, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-01-13 22:59:14', '2020-01-13 22:59:14');
INSERT INTO `admin_operation_log` VALUES (342, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-01-13 22:59:22', '2020-01-13 22:59:22');
INSERT INTO `admin_operation_log` VALUES (343, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-13 23:00:29', '2020-01-13 23:00:29');
INSERT INTO `admin_operation_log` VALUES (344, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-01-14 21:13:38', '2020-01-14 21:13:38');
INSERT INTO `admin_operation_log` VALUES (345, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-01-17 02:08:41', '2020-01-17 02:08:41');
INSERT INTO `admin_operation_log` VALUES (346, 1, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-17 02:08:46', '2020-01-17 02:08:46');
INSERT INTO `admin_operation_log` VALUES (347, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-02-02 00:16:02', '2020-02-02 00:16:02');
INSERT INTO `admin_operation_log` VALUES (348, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-02 00:16:09', '2020-02-02 00:16:09');
INSERT INTO `admin_operation_log` VALUES (349, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-02-02 00:16:11', '2020-02-02 00:16:11');
INSERT INTO `admin_operation_log` VALUES (350, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-02-02 00:29:54', '2020-02-02 00:29:54');
COMMIT;

-- ----------------------------
-- Table structure for admin_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_permissions`;
CREATE TABLE `admin_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_permissions_name_unique` (`name`),
  UNIQUE KEY `admin_permissions_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_permissions
-- ----------------------------
BEGIN;
INSERT INTO `admin_permissions` VALUES (1, 'All permission', '*', '', '*', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (2, 'Dashboard', 'dashboard', 'GET', '/', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (3, 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (4, 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (5, 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for admin_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_menu`;
CREATE TABLE `admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `admin_role_menu` VALUES (1, 2, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for admin_role_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_permissions`;
CREATE TABLE `admin_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_role_permissions
-- ----------------------------
BEGIN;
INSERT INTO `admin_role_permissions` VALUES (1, 1, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for admin_role_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_users`;
CREATE TABLE `admin_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_role_users
-- ----------------------------
BEGIN;
INSERT INTO `admin_role_users` VALUES (1, 1, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for admin_roles
-- ----------------------------
DROP TABLE IF EXISTS `admin_roles`;
CREATE TABLE `admin_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_roles_name_unique` (`name`),
  UNIQUE KEY `admin_roles_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_roles
-- ----------------------------
BEGIN;
INSERT INTO `admin_roles` VALUES (1, 'Administrator', 'administrator', '2019-12-10 08:19:32', '2019-12-10 08:19:32');
COMMIT;

-- ----------------------------
-- Table structure for admin_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_user_permissions`;
CREATE TABLE `admin_user_permissions` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for admin_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE `admin_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_users
-- ----------------------------
BEGIN;
INSERT INTO `admin_users` VALUES (1, 'admin', '$2y$10$2yCQPcHhTspAZ.MBdHJRme1gXyOBXW3iiYJIhLRf/z0qGIye3bjOy', 'Administrator', NULL, 'VF2OhrlbyWUURxIosxaM1ef8dOCmgpQwrsp9eit1zjcnCqwTgUAL2b3pdFHy', '2019-12-10 08:19:32', '2019-12-10 08:19:32');
COMMIT;

-- ----------------------------
-- Table structure for chat_record
-- ----------------------------
DROP TABLE IF EXISTS `chat_record`;
CREATE TABLE `chat_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `friend_id` int(11) NOT NULL DEFAULT '0' COMMENT '是群聊消息记录的话 此id为0',
  `group_id` int(11) NOT NULL DEFAULT '0' COMMENT '如果不为0说明是群聊',
  `content` varchar(1000) NOT NULL DEFAULT '',
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COMMENT='聊天记录';

-- ----------------------------
-- Records of chat_record
-- ----------------------------
BEGIN;
INSERT INTO `chat_record` VALUES (1, 10001, 0, 10008, 'asd', 1547087350);
INSERT INTO `chat_record` VALUES (2, 10001, 0, 10008, 'face[ok] ', 1547087352);
INSERT INTO `chat_record` VALUES (3, 10006, 0, 10008, '23', 1547087461);
INSERT INTO `chat_record` VALUES (4, 10001, 10006, 0, '2', 1547087939);
INSERT INTO `chat_record` VALUES (5, 10001, 10006, 0, '2', 1547089271);
INSERT INTO `chat_record` VALUES (6, 10001, 10006, 0, '3', 1547089271);
INSERT INTO `chat_record` VALUES (7, 10001, 10006, 0, '4', 1547089271);
INSERT INTO `chat_record` VALUES (8, 10001, 10006, 0, '5', 1547089272);
INSERT INTO `chat_record` VALUES (9, 10001, 10006, 0, '6', 1547089272);
INSERT INTO `chat_record` VALUES (10, 10001, 10006, 0, '7', 1547089272);
INSERT INTO `chat_record` VALUES (11, 10001, 10006, 0, '8', 1547089272);
INSERT INTO `chat_record` VALUES (12, 10001, 10006, 0, '8', 1547089273);
INSERT INTO `chat_record` VALUES (13, 10001, 10006, 0, '6', 1547089273);
INSERT INTO `chat_record` VALUES (14, 10001, 10006, 0, 'e5', 1547089273);
INSERT INTO `chat_record` VALUES (15, 10001, 10006, 0, '54', 1547089274);
INSERT INTO `chat_record` VALUES (16, 10001, 10006, 0, '54df', 1547089274);
INSERT INTO `chat_record` VALUES (17, 10001, 10006, 0, 'g', 1547089274);
INSERT INTO `chat_record` VALUES (18, 10001, 10006, 0, 'df', 1547089274);
INSERT INTO `chat_record` VALUES (19, 10001, 10006, 0, 'gdf', 1547089275);
INSERT INTO `chat_record` VALUES (20, 10001, 10006, 0, 'dfg', 1547089275);
INSERT INTO `chat_record` VALUES (21, 10001, 10006, 0, 'f', 1547089275);
INSERT INTO `chat_record` VALUES (22, 10001, 10006, 0, 'g', 1547089276);
INSERT INTO `chat_record` VALUES (23, 10006, 10001, 0, 'hahah ', 1547089530);
INSERT INTO `chat_record` VALUES (24, 10006, 10001, 0, '在啊', 1547089599);
INSERT INTO `chat_record` VALUES (25, 10006, 10001, 0, '你好啊', 1547089600);
INSERT INTO `chat_record` VALUES (26, 10006, 10001, 0, '你是大佬吗', 1547089604);
INSERT INTO `chat_record` VALUES (27, 10001, 10006, 0, '在啊', 1547089610);
INSERT INTO `chat_record` VALUES (28, 10001, 10006, 0, '我不是大佬', 1547089613);
INSERT INTO `chat_record` VALUES (29, 10001, 10006, 0, '我是菜鸡', 1547089616);
INSERT INTO `chat_record` VALUES (30, 10001, 10006, 0, 'face[怒] ', 1547089620);
INSERT INTO `chat_record` VALUES (31, 10006, 10001, 0, 'img[uploads/im/20190110/5c36b6da18bea.jpeg]', 1547089626);
INSERT INTO `chat_record` VALUES (32, 10001, 10008, 0, '333', 1547090986);
INSERT INTO `chat_record` VALUES (33, 10001, 10008, 0, '1', 1547091312);
INSERT INTO `chat_record` VALUES (34, 10008, 10005, 0, '4', 1547092511);
INSERT INTO `chat_record` VALUES (35, 10008, 10001, 0, 'img[uploads/im/20190110/5c36c27bca2cb.jpeg]', 1547092603);
COMMIT;

-- ----------------------------
-- Table structure for friend
-- ----------------------------
DROP TABLE IF EXISTS `friend`;
CREATE TABLE `friend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `friend_id` int(11) NOT NULL,
  `friend_group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COMMENT='好友表';

-- ----------------------------
-- Records of friend
-- ----------------------------
BEGIN;
INSERT INTO `friend` VALUES (46, 10001, 10008, 3);
INSERT INTO `friend` VALUES (47, 10008, 10001, 7);
INSERT INTO `friend` VALUES (52, 10001, 10005, 3);
INSERT INTO `friend` VALUES (53, 10005, 10001, 4);
INSERT INTO `friend` VALUES (54, 10001, 10006, 3);
INSERT INTO `friend` VALUES (55, 10006, 10001, 5);
INSERT INTO `friend` VALUES (66, 10001, 10007, 3);
INSERT INTO `friend` VALUES (67, 10007, 10001, 6);
INSERT INTO `friend` VALUES (68, 10005, 10008, 4);
INSERT INTO `friend` VALUES (69, 10008, 10005, 7);
COMMIT;

-- ----------------------------
-- Table structure for friend_group
-- ----------------------------
DROP TABLE IF EXISTS `friend_group`;
CREATE TABLE `friend_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `groupname` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of friend_group
-- ----------------------------
BEGIN;
INSERT INTO `friend_group` VALUES (3, 10001, '默认分组');
INSERT INTO `friend_group` VALUES (4, 10005, '默认分组');
INSERT INTO `friend_group` VALUES (5, 10006, '默认分组');
INSERT INTO `friend_group` VALUES (6, 10007, '默认分组');
INSERT INTO `friend_group` VALUES (7, 10008, '默认分组');
COMMIT;

-- ----------------------------
-- Table structure for group
-- ----------------------------
DROP TABLE IF EXISTS `group`;
CREATE TABLE `group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '群组所属用户id,群主',
  `groupname` varchar(255) NOT NULL COMMENT '群名',
  `avatar` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10011 DEFAULT CHARSET=utf8mb4 COMMENT='群组';

-- ----------------------------
-- Records of group
-- ----------------------------
BEGIN;
INSERT INTO `group` VALUES (10008, 10001, 'PHP交流群', 'uploads/avatar/20190109/5c358bcaa77e3.jpeg');
INSERT INTO `group` VALUES (10009, 10006, '屌丝集中营', 'uploads/avatar/20190109/5c358c05aa1cc.jpg');
INSERT INTO `group` VALUES (10010, 10007, '萌宠', 'uploads/avatar/20190109/5c358c35a8043.jpg');
COMMIT;

-- ----------------------------
-- Table structure for group_member
-- ----------------------------
DROP TABLE IF EXISTS `group_member`;
CREATE TABLE `group_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of group_member
-- ----------------------------
BEGIN;
INSERT INTO `group_member` VALUES (17, 10008, 10001);
INSERT INTO `group_member` VALUES (18, 10009, 10006);
INSERT INTO `group_member` VALUES (19, 10010, 10007);
INSERT INTO `group_member` VALUES (20, 10009, 10007);
INSERT INTO `group_member` VALUES (21, 10008, 10007);
INSERT INTO `group_member` VALUES (22, 10008, 10005);
INSERT INTO `group_member` VALUES (23, 10009, 10005);
INSERT INTO `group_member` VALUES (24, 10010, 10005);
INSERT INTO `group_member` VALUES (25, 10009, 10001);
INSERT INTO `group_member` VALUES (26, 10010, 10001);
INSERT INTO `group_member` VALUES (27, 10008, 10008);
INSERT INTO `group_member` VALUES (28, 10009, 10008);
INSERT INTO `group_member` VALUES (29, 10010, 10008);
INSERT INTO `group_member` VALUES (30, 10008, 10006);
COMMIT;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
BEGIN;
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2016_01_04_173148_create_admin_tables', 1);
COMMIT;

-- ----------------------------
-- Table structure for offline_message
-- ----------------------------
DROP TABLE IF EXISTS `offline_message`;
CREATE TABLE `offline_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `data` varchar(1000) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未发送 1已发送',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='离线消息表';

-- ----------------------------
-- Records of offline_message
-- ----------------------------
BEGIN;
INSERT INTO `offline_message` VALUES (1, 10008, '{\"username\":\"woann(10001)\",\"avatar\":\"uploads\\/avatar\\/20190109\\/5c3587fb5da9e.jpeg\",\"id\":10001,\"type\":\"friend\",\"content\":\"333\",\"cid\":0,\"mine\":false,\"fromid\":10001,\"timestamp\":1547090986000}', 1);
INSERT INTO `offline_message` VALUES (2, 10005, '{\"type\":\"msgBox\",\"count\":1}', 1);
COMMIT;

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for system_message
-- ----------------------------
DROP TABLE IF EXISTS `system_message`;
CREATE TABLE `system_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '接收用户id',
  `from_id` int(11) NOT NULL COMMENT '来源相关用户id',
  `group_id` int(11) NOT NULL DEFAULT '0',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '添加好友附言',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0好友请求 1请求结果通知',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未处理 1同意 2拒绝',
  `read` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未读 1已读，用来显示消息盒子数量',
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COMMENT='系统消息表';

-- ----------------------------
-- Records of system_message
-- ----------------------------
BEGIN;
INSERT INTO `system_message` VALUES (33, 10001, 10008, 7, '', 0, 1, 1, 1547013257);
INSERT INTO `system_message` VALUES (34, 10008, 10001, 0, '', 1, 1, 1, 1547013357);
INSERT INTO `system_message` VALUES (37, 10001, 10005, 4, '', 0, 1, 1, 1547013795);
INSERT INTO `system_message` VALUES (38, 10005, 10001, 0, '', 1, 1, 1, 1547013800);
INSERT INTO `system_message` VALUES (39, 10001, 10006, 5, '', 0, 1, 1, 1547013821);
INSERT INTO `system_message` VALUES (40, 10006, 10001, 0, '', 1, 1, 1, 1547013826);
INSERT INTO `system_message` VALUES (51, 10001, 10007, 6, '', 0, 1, 1, 1547016259);
INSERT INTO `system_message` VALUES (52, 10007, 10001, 0, '', 1, 1, 1, 1547016263);
INSERT INTO `system_message` VALUES (53, 10005, 10008, 7, '加我', 0, 1, 1, 1547092067);
INSERT INTO `system_message` VALUES (54, 10008, 10005, 0, '', 1, 1, 1, 1547092167);
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `avatar` varchar(255) NOT NULL COMMENT '头像',
  `nickname` varchar(255) NOT NULL COMMENT '昵称',
  `username` varchar(255) NOT NULL COMMENT '用户名',
  `password` varchar(255) NOT NULL,
  `sign` varchar(255) NOT NULL COMMENT '签名',
  `status` varchar(255) NOT NULL DEFAULT 'online' COMMENT 'online在线 hide隐身 offline离线',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10009 DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES (10001, 'uploads/avatar/20190109/5c3587fb5da9e.jpeg', 'woann', 'woann', '$2y$10$uQJ.ShZMJ2MHsVVVmauzluFsImWuszMS963XUEE/u7C8xRPZMfm1S', 'php是世界上最好的语言', 'offline');
INSERT INTO `user` VALUES (10005, 'uploads/avatar/20190109/5c358aa30d122.jpg', '苦逼程序员', 'test01', '$2y$10$DGjWpUFuBU/SnBFG3w6IHOHyV94OP2bgjTNJmgrvka2ieR9lOAi72', '我是旋涡鸣人', 'offline');
INSERT INTO `user` VALUES (10006, 'uploads/avatar/20190109/5c358ae10c4d0.jpeg', '狗der产品', 'test02', '$2y$10$uQJ.ShZMJ2MHsVVVmauzluFsImWuszMS963XUEE/u7C8xRPZMfm1S', '有钱真的可以为所欲为', 'offline');
INSERT INTO `user` VALUES (10007, 'uploads/avatar/20190109/5c358b05874c2.jpg', '服务架构师', 'test03', '$2y$10$RYwAgHBdfXqaE8nLo3scq.HB9vnxHhYI2P8f3aaNh0CSdykdmFuVq', '技术流就是我', 'offline');
INSERT INTO `user` VALUES (10008, 'uploads/avatar/20190109/5c358b4b578e1.jpg', '前端攻城狮', 'test04', '$2y$10$5QgXxaoDVkERj5pJA8B81e4ByORwSZQ8ABZRqGue0sHOatzUFtLN6', '前端好苦逼', 'offline');
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES (1, 'yaohua', '936315305@qq.com', '123456', '123456', '2019-12-10 11:53:24', '2019-12-10 11:53:24');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
