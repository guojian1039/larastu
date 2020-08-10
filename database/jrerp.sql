/*
Navicat MySQL Data Transfer

Source Server         : www
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : jrerp

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2020-08-10 16:17:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `active_products`
-- ----------------------------
DROP TABLE IF EXISTS `active_products`;
CREATE TABLE `active_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `end_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `active_products_product_id_foreign` (`product_id`),
  CONSTRAINT `active_products_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of active_products
-- ----------------------------
INSERT INTO `active_products` VALUES ('1', '74', '2020-12-01 15:00:00');
INSERT INTO `active_products` VALUES ('2', '75', '2020-12-01 15:00:00');
INSERT INTO `active_products` VALUES ('3', '76', '2020-12-01 15:00:00');
INSERT INTO `active_products` VALUES ('4', '77', '2020-12-01 15:00:00');
INSERT INTO `active_products` VALUES ('5', '78', '2020-12-01 15:00:00');
INSERT INTO `active_products` VALUES ('7', '121', '2020-08-31 09:45:59');
INSERT INTO `active_products` VALUES ('8', '121', '2020-08-17 13:51:37');

-- ----------------------------
-- Table structure for `admin_menu`
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uri` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_menu
-- ----------------------------
INSERT INTO `admin_menu` VALUES ('1', '0', '1', 'Index', 'feather icon-bar-chart-2', '/', '2020-07-29 02:27:24', null);
INSERT INTO `admin_menu` VALUES ('2', '0', '14', 'Admin', 'feather icon-settings', '', '2020-07-29 02:27:24', '2020-08-10 15:05:33');
INSERT INTO `admin_menu` VALUES ('3', '2', '15', 'Users', '', 'auth/users', '2020-07-29 02:27:24', '2020-08-10 15:05:33');
INSERT INTO `admin_menu` VALUES ('4', '2', '16', 'Roles', '', 'auth/roles', '2020-07-29 02:27:24', '2020-08-10 15:05:33');
INSERT INTO `admin_menu` VALUES ('5', '2', '17', 'Permission', '', 'auth/permissions', '2020-07-29 02:27:24', '2020-08-10 15:05:33');
INSERT INTO `admin_menu` VALUES ('6', '2', '18', 'Menu', '', 'auth/menu', '2020-07-29 02:27:24', '2020-08-10 15:05:33');
INSERT INTO `admin_menu` VALUES ('7', '2', '19', 'Operation log', '', 'auth/logs', '2020-07-29 02:27:24', '2020-08-10 15:05:33');
INSERT INTO `admin_menu` VALUES ('8', '0', '2', '用户管理', 'fa-user', '/users', '2020-08-03 10:05:08', '2020-08-03 10:05:23');
INSERT INTO `admin_menu` VALUES ('9', '0', '3', '分类管理', 'fa-bars', '/categories', '2020-08-04 10:18:43', '2020-08-04 10:18:52');
INSERT INTO `admin_menu` VALUES ('10', '0', '11', '广告管理', 'fa-archive', '/ads', '2020-08-04 16:00:05', '2020-08-10 15:05:33');
INSERT INTO `admin_menu` VALUES ('11', '0', '12', '品牌管理', 'fa-500px', '/brands', '2020-08-04 16:56:09', '2020-08-10 15:05:33');
INSERT INTO `admin_menu` VALUES ('12', '0', '4', '商品管理', 'fa-cubes', null, '2020-08-04 17:10:56', '2020-08-10 15:05:33');
INSERT INTO `admin_menu` VALUES ('13', '12', '5', '普通商品', 'fa-cubes', '/products', '2020-08-04 17:11:17', '2020-08-10 15:05:33');
INSERT INTO `admin_menu` VALUES ('14', '12', '6', '众筹商品', 'fa-flag-checkered', '/crowdfunding_products', '2020-08-05 17:18:07', '2020-08-10 15:05:33');
INSERT INTO `admin_menu` VALUES ('15', '12', '7', '秒杀商品', 'fa-bolt', '/seckill_products', '2020-08-05 17:32:09', '2020-08-10 15:05:33');
INSERT INTO `admin_menu` VALUES ('16', '12', '8', '活动商品', 'fa-camera-retro', '/active_products', '2020-08-06 12:53:42', '2020-08-10 15:05:33');
INSERT INTO `admin_menu` VALUES ('17', '12', '9', '折扣商品', 'fa-shield', '/discount_products', '2020-08-06 13:14:07', '2020-08-10 15:05:33');
INSERT INTO `admin_menu` VALUES ('18', '0', '13', '优惠券', 'fa-tags', '/coupon_codes', '2020-08-10 14:36:25', '2020-08-10 15:05:33');
INSERT INTO `admin_menu` VALUES ('19', '0', '10', '订单管理', 'fa-rmb', '/orders', '2020-08-10 15:04:59', '2020-08-10 15:05:33');

-- ----------------------------
-- Table structure for `admin_operation_log`
-- ----------------------------
DROP TABLE IF EXISTS `admin_operation_log`;
CREATE TABLE `admin_operation_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_operation_log_user_id_index` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1557 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_operation_log
-- ----------------------------
INSERT INTO `admin_operation_log` VALUES ('1', '0', 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2020-07-29 02:28:05', '2020-07-29 02:28:05');
INSERT INTO `admin_operation_log` VALUES ('2', '0', 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"FxiYp1ngG3NvYxnbeKbs1HAgviXRdshCL7m3wWjk\",\"username\":\"admin\",\"password\":\"adm******\"}', '2020-07-29 02:28:12', '2020-07-29 02:28:12');
INSERT INTO `admin_operation_log` VALUES ('3', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-07-29 02:28:13', '2020-07-29 02:28:13');
INSERT INTO `admin_operation_log` VALUES ('4', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-07-29 02:30:45', '2020-07-29 02:30:45');
INSERT INTO `admin_operation_log` VALUES ('5', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-07-29 02:31:07', '2020-07-29 02:31:07');
INSERT INTO `admin_operation_log` VALUES ('6', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-07-29 10:52:25', '2020-07-29 10:52:25');
INSERT INTO `admin_operation_log` VALUES ('7', '1', 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-29 10:52:35', '2020-07-29 10:52:35');
INSERT INTO `admin_operation_log` VALUES ('8', '1', 'admin/auth/users/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2020-07-29 10:52:56', '2020-07-29 10:52:56');
INSERT INTO `admin_operation_log` VALUES ('9', '1', 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-29 10:53:26', '2020-07-29 10:53:26');
INSERT INTO `admin_operation_log` VALUES ('10', '1', 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-29 10:53:27', '2020-07-29 10:53:27');
INSERT INTO `admin_operation_log` VALUES ('11', '1', 'admin/auth/roles/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2020-07-29 10:53:29', '2020-07-29 10:53:29');
INSERT INTO `admin_operation_log` VALUES ('12', '1', 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-29 10:53:48', '2020-07-29 10:53:48');
INSERT INTO `admin_operation_log` VALUES ('13', '1', 'admin/auth/permissions/1/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2020-07-29 10:53:52', '2020-07-29 10:53:52');
INSERT INTO `admin_operation_log` VALUES ('14', '1', 'admin/auth/permissions/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2020-07-29 10:53:57', '2020-07-29 10:53:57');
INSERT INTO `admin_operation_log` VALUES ('15', '1', 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-29 10:54:00', '2020-07-29 10:54:00');
INSERT INTO `admin_operation_log` VALUES ('16', '1', 'admin/auth/users/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2020-07-29 10:54:01', '2020-07-29 10:54:01');
INSERT INTO `admin_operation_log` VALUES ('17', '1', 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-29 10:54:10', '2020-07-29 10:54:10');
INSERT INTO `admin_operation_log` VALUES ('18', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-29 10:54:11', '2020-07-29 10:54:11');
INSERT INTO `admin_operation_log` VALUES ('19', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-29 10:54:21', '2020-07-29 10:54:21');
INSERT INTO `admin_operation_log` VALUES ('20', '1', 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-29 10:54:36', '2020-07-29 10:54:36');
INSERT INTO `admin_operation_log` VALUES ('21', '1', 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-29 10:54:38', '2020-07-29 10:54:38');
INSERT INTO `admin_operation_log` VALUES ('22', '1', 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-29 10:54:39', '2020-07-29 10:54:39');
INSERT INTO `admin_operation_log` VALUES ('23', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-29 10:54:40', '2020-07-29 10:54:40');
INSERT INTO `admin_operation_log` VALUES ('24', '1', 'admin/auth/menu/3/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2020-07-29 10:54:46', '2020-07-29 10:54:46');
INSERT INTO `admin_operation_log` VALUES ('25', '1', 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-29 10:55:04', '2020-07-29 10:55:04');
INSERT INTO `admin_operation_log` VALUES ('26', '1', 'admin/auth/permissions/1/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2020-07-29 10:55:07', '2020-07-29 10:55:07');
INSERT INTO `admin_operation_log` VALUES ('27', '0', 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2020-07-29 14:47:55', '2020-07-29 14:47:55');
INSERT INTO `admin_operation_log` VALUES ('28', '0', 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"EnJMmY9CiycUeolYakA69FVVzq2hRB3mi8ifW9hE\",\"username\":\"admin\",\"password\":\"adm******\"}', '2020-07-29 14:48:05', '2020-07-29 14:48:05');
INSERT INTO `admin_operation_log` VALUES ('29', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-07-29 14:48:06', '2020-07-29 14:48:06');
INSERT INTO `admin_operation_log` VALUES ('30', '1', 'admin/helpers/extensions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-29 14:48:17', '2020-07-29 14:48:17');
INSERT INTO `admin_operation_log` VALUES ('31', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-29 14:48:24', '2020-07-29 14:48:24');
INSERT INTO `admin_operation_log` VALUES ('32', '1', 'admin/helpers/icons', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-29 14:48:25', '2020-07-29 14:48:25');
INSERT INTO `admin_operation_log` VALUES ('33', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-29 14:48:31', '2020-07-29 14:48:31');
INSERT INTO `admin_operation_log` VALUES ('34', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"singular\":\"user\"}', '2020-07-29 14:49:19', '2020-07-29 14:49:19');
INSERT INTO `admin_operation_log` VALUES ('35', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"singular\":\"user_\"}', '2020-07-29 14:49:21', '2020-07-29 14:49:21');
INSERT INTO `admin_operation_log` VALUES ('36', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"singular\":\"user_address\"}', '2020-07-29 14:49:23', '2020-07-29 14:49:23');
INSERT INTO `admin_operation_log` VALUES ('37', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"singular\":\"user_addresses\"}', '2020-07-29 14:49:24', '2020-07-29 14:49:24');
INSERT INTO `admin_operation_log` VALUES ('38', '1', 'admin/helpers/scaffold', 'POST', '127.0.0.1', '{\"table_name\":\"user_addresses\",\"exist-table\":\"0\",\"model_name\":\"App\\\\Models\\\\UserAddress\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\UserAddressController\",\"repository_name\":\"App\\\\Admin\\\\Repositories\\\\UserAddress\",\"create\":[\"migration\",\"model\",\"repository\",\"controller\",\"migrate\"],\"fields\":[{\"name\":\"user_id\",\"translation\":null,\"type\":\"bigInteger\",\"key\":null,\"default\":null,\"comment\":\"\\u5173\\u8054\\u7528\\u6237\\u8868\"},{\"name\":\"province\",\"translation\":null,\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"\\u7701\\u4efd\"},{\"name\":\"city\",\"translation\":null,\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"\\u57ce\\u5e02\"},{\"name\":\"district\",\"translation\":null,\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"\\u533a\\u57df\"},{\"name\":\"address\",\"translation\":null,\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"\\u5730\\u5740\"},{\"name\":\"zip\",\"translation\":null,\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"\\u90ae\\u7f16\"},{\"name\":\"contact_name\",\"translation\":null,\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"\\u8054\\u7cfb\\u4eba\"},{\"name\":\"contact_phone\",\"translation\":null,\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"\\u8054\\u7cfb\\u7535\\u8bdd\"},{\"name\":\"last_used_at\",\"translation\":null,\"type\":\"dateTime\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":\"\\u6700\\u8fd1\\u4f7f\\u7528\"}],\"primary_key\":\"id\",\"timestamps\":\"1\",\"_token\":\"X24XxAaVkTpYfTib4FyKEtP4InSmjNYbJHmsDT5a\"}', '2020-07-29 14:53:50', '2020-07-29 14:53:50');
INSERT INTO `admin_operation_log` VALUES ('39', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2020-07-29 14:53:53', '2020-07-29 14:53:53');
INSERT INTO `admin_operation_log` VALUES ('40', '0', 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2020-07-30 11:09:19', '2020-07-30 11:09:19');
INSERT INTO `admin_operation_log` VALUES ('41', '0', 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"siTtdxMbPiSCxQBjhkasgRTvsTDTbd0tFh6pd3SV\",\"username\":\"admin\",\"password\":\"adm******\"}', '2020-07-30 11:09:27', '2020-07-30 11:09:27');
INSERT INTO `admin_operation_log` VALUES ('42', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-07-30 11:09:28', '2020-07-30 11:09:28');
INSERT INTO `admin_operation_log` VALUES ('43', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-07-30 11:09:34', '2020-07-30 11:09:34');
INSERT INTO `admin_operation_log` VALUES ('44', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-07-30 11:09:55', '2020-07-30 11:09:55');
INSERT INTO `admin_operation_log` VALUES ('45', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-07-30 11:10:54', '2020-07-30 11:10:54');
INSERT INTO `admin_operation_log` VALUES ('46', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-07-30 11:11:01', '2020-07-30 11:11:01');
INSERT INTO `admin_operation_log` VALUES ('47', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-07-30 11:11:47', '2020-07-30 11:11:47');
INSERT INTO `admin_operation_log` VALUES ('48', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-07-30 11:12:04', '2020-07-30 11:12:04');
INSERT INTO `admin_operation_log` VALUES ('49', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-07-30 11:12:10', '2020-07-30 11:12:10');
INSERT INTO `admin_operation_log` VALUES ('50', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-07-30 11:14:08', '2020-07-30 11:14:08');
INSERT INTO `admin_operation_log` VALUES ('51', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-07-30 11:14:43', '2020-07-30 11:14:43');
INSERT INTO `admin_operation_log` VALUES ('52', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-07-30 11:14:48', '2020-07-30 11:14:48');
INSERT INTO `admin_operation_log` VALUES ('53', '1', 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-30 11:15:12', '2020-07-30 11:15:12');
INSERT INTO `admin_operation_log` VALUES ('54', '1', 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-30 11:15:16', '2020-07-30 11:15:16');
INSERT INTO `admin_operation_log` VALUES ('55', '1', 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-30 11:25:49', '2020-07-30 11:25:49');
INSERT INTO `admin_operation_log` VALUES ('56', '1', 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-30 11:25:50', '2020-07-30 11:25:50');
INSERT INTO `admin_operation_log` VALUES ('57', '1', 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-30 11:25:51', '2020-07-30 11:25:51');
INSERT INTO `admin_operation_log` VALUES ('58', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-30 11:25:52', '2020-07-30 11:25:52');
INSERT INTO `admin_operation_log` VALUES ('59', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-07-30 11:26:02', '2020-07-30 11:26:02');
INSERT INTO `admin_operation_log` VALUES ('60', '0', 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2020-07-30 17:17:18', '2020-07-30 17:17:18');
INSERT INTO `admin_operation_log` VALUES ('61', '0', 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"o6ospusTPR3GFCLIC1TU0O6ZZ2jqdyySb3hwiNxY\",\"username\":\"admin\",\"password\":\"adm******\"}', '2020-07-30 17:17:32', '2020-07-30 17:17:32');
INSERT INTO `admin_operation_log` VALUES ('62', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-07-30 17:17:33', '2020-07-30 17:17:33');
INSERT INTO `admin_operation_log` VALUES ('63', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-07-30 17:18:28', '2020-07-30 17:18:28');
INSERT INTO `admin_operation_log` VALUES ('64', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-07-30 17:19:49', '2020-07-30 17:19:49');
INSERT INTO `admin_operation_log` VALUES ('65', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-30 17:19:59', '2020-07-30 17:19:59');
INSERT INTO `admin_operation_log` VALUES ('66', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-07-30 17:20:13', '2020-07-30 17:20:13');
INSERT INTO `admin_operation_log` VALUES ('67', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-07-30 17:20:39', '2020-07-30 17:20:39');
INSERT INTO `admin_operation_log` VALUES ('68', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-07-30 17:21:40', '2020-07-30 17:21:40');
INSERT INTO `admin_operation_log` VALUES ('69', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-07-30 17:22:06', '2020-07-30 17:22:06');
INSERT INTO `admin_operation_log` VALUES ('70', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-07-30 17:31:46', '2020-07-30 17:31:46');
INSERT INTO `admin_operation_log` VALUES ('71', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-07-30 17:32:31', '2020-07-30 17:32:31');
INSERT INTO `admin_operation_log` VALUES ('72', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-07-30 17:35:33', '2020-07-30 17:35:33');
INSERT INTO `admin_operation_log` VALUES ('73', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-07-30 17:35:35', '2020-07-30 17:35:35');
INSERT INTO `admin_operation_log` VALUES ('74', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-07-30 17:35:36', '2020-07-30 17:35:36');
INSERT INTO `admin_operation_log` VALUES ('75', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-07-30 17:36:53', '2020-07-30 17:36:53');
INSERT INTO `admin_operation_log` VALUES ('76', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-07-30 17:38:12', '2020-07-30 17:38:12');
INSERT INTO `admin_operation_log` VALUES ('77', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-07-30 17:40:44', '2020-07-30 17:40:44');
INSERT INTO `admin_operation_log` VALUES ('78', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-07-30 17:40:45', '2020-07-30 17:40:45');
INSERT INTO `admin_operation_log` VALUES ('79', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-30 17:40:47', '2020-07-30 17:40:47');
INSERT INTO `admin_operation_log` VALUES ('80', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-07-30 17:40:54', '2020-07-30 17:40:54');
INSERT INTO `admin_operation_log` VALUES ('81', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-07-30 17:41:07', '2020-07-30 17:41:07');
INSERT INTO `admin_operation_log` VALUES ('82', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-07-30 17:41:26', '2020-07-30 17:41:26');
INSERT INTO `admin_operation_log` VALUES ('83', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-07-30 17:41:30', '2020-07-30 17:41:30');
INSERT INTO `admin_operation_log` VALUES ('84', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-07-30 17:41:45', '2020-07-30 17:41:45');
INSERT INTO `admin_operation_log` VALUES ('85', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-07-30 17:43:44', '2020-07-30 17:43:44');
INSERT INTO `admin_operation_log` VALUES ('86', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-07-30 17:43:53', '2020-07-30 17:43:53');
INSERT INTO `admin_operation_log` VALUES ('87', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-07-30 17:44:02', '2020-07-30 17:44:02');
INSERT INTO `admin_operation_log` VALUES ('88', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-07-30 17:44:12', '2020-07-30 17:44:12');
INSERT INTO `admin_operation_log` VALUES ('89', '0', 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2020-07-31 15:45:27', '2020-07-31 15:45:27');
INSERT INTO `admin_operation_log` VALUES ('90', '0', 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"w6rcatrYLg8bNT4rl51FQ7ekBoSKm1tMNiCQkobW\",\"username\":\"admin\",\"password\":\"adm******\"}', '2020-07-31 15:45:31', '2020-07-31 15:45:31');
INSERT INTO `admin_operation_log` VALUES ('91', '0', 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"w6rcatrYLg8bNT4rl51FQ7ekBoSKm1tMNiCQkobW\",\"username\":\"admin\",\"password\":\"adm******\"}', '2020-07-31 15:45:38', '2020-07-31 15:45:38');
INSERT INTO `admin_operation_log` VALUES ('92', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-07-31 15:45:38', '2020-07-31 15:45:38');
INSERT INTO `admin_operation_log` VALUES ('93', '0', 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2020-08-03 09:51:31', '2020-08-03 09:51:31');
INSERT INTO `admin_operation_log` VALUES ('94', '0', 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"SzJcEOSkqjcHgroEdSp3TXy3OGfQJ4mN7gDxjSTF\",\"username\":\"admin\",\"password\":\"adm******\"}', '2020-08-03 09:51:39', '2020-08-03 09:51:39');
INSERT INTO `admin_operation_log` VALUES ('95', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-08-03 09:51:39', '2020-08-03 09:51:39');
INSERT INTO `admin_operation_log` VALUES ('96', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-03 09:51:57', '2020-08-03 09:51:57');
INSERT INTO `admin_operation_log` VALUES ('97', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-08-03 09:52:10', '2020-08-03 09:52:10');
INSERT INTO `admin_operation_log` VALUES ('98', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-08-03 09:52:16', '2020-08-03 09:52:16');
INSERT INTO `admin_operation_log` VALUES ('99', '1', 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":null,\"title\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"icon\":\"fa-user\",\"uri\":\"\\/users\",\"roles\":[null],\"permissions\":null,\"_token\":\"TKXJZkKmjLsDIeLV5PNIeSMNaMWu8cDEhBYDsjR5\"}', '2020-08-03 10:05:08', '2020-08-03 10:05:08');
INSERT INTO `admin_operation_log` VALUES ('100', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-08-03 10:05:10', '2020-08-03 10:05:10');
INSERT INTO `admin_operation_log` VALUES ('101', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-08-03 10:05:13', '2020-08-03 10:05:13');
INSERT INTO `admin_operation_log` VALUES ('102', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-03 10:05:15', '2020-08-03 10:05:15');
INSERT INTO `admin_operation_log` VALUES ('103', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-03 10:05:18', '2020-08-03 10:05:18');
INSERT INTO `admin_operation_log` VALUES ('104', '1', 'admin/auth/menu', 'POST', '127.0.0.1', '{\"_token\":\"TKXJZkKmjLsDIeLV5PNIeSMNaMWu8cDEhBYDsjR5\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":8},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}', '2020-08-03 10:05:23', '2020-08-03 10:05:23');
INSERT INTO `admin_operation_log` VALUES ('105', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-08-03 10:05:25', '2020-08-03 10:05:25');
INSERT INTO `admin_operation_log` VALUES ('106', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-03 10:05:32', '2020-08-03 10:05:32');
INSERT INTO `admin_operation_log` VALUES ('107', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-08-03 10:09:20', '2020-08-03 10:09:20');
INSERT INTO `admin_operation_log` VALUES ('108', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-08-03 10:10:27', '2020-08-03 10:10:27');
INSERT INTO `admin_operation_log` VALUES ('109', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-08-03 10:10:32', '2020-08-03 10:10:32');
INSERT INTO `admin_operation_log` VALUES ('110', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-08-03 10:10:48', '2020-08-03 10:10:48');
INSERT INTO `admin_operation_log` VALUES ('111', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-08-03 10:11:01', '2020-08-03 10:11:01');
INSERT INTO `admin_operation_log` VALUES ('112', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-03 10:11:04', '2020-08-03 10:11:04');
INSERT INTO `admin_operation_log` VALUES ('113', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-08-03 10:11:46', '2020-08-03 10:11:46');
INSERT INTO `admin_operation_log` VALUES ('114', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-08-03 10:12:55', '2020-08-03 10:12:55');
INSERT INTO `admin_operation_log` VALUES ('115', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-08-03 10:13:09', '2020-08-03 10:13:09');
INSERT INTO `admin_operation_log` VALUES ('116', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-08-03 10:13:24', '2020-08-03 10:13:24');
INSERT INTO `admin_operation_log` VALUES ('117', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-08-03 10:16:06', '2020-08-03 10:16:06');
INSERT INTO `admin_operation_log` VALUES ('118', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-08-03 10:17:48', '2020-08-03 10:17:48');
INSERT INTO `admin_operation_log` VALUES ('119', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-08-03 10:17:50', '2020-08-03 10:17:50');
INSERT INTO `admin_operation_log` VALUES ('120', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-08-03 10:17:59', '2020-08-03 10:17:59');
INSERT INTO `admin_operation_log` VALUES ('121', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-08-03 10:18:01', '2020-08-03 10:18:01');
INSERT INTO `admin_operation_log` VALUES ('122', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-08-03 10:18:10', '2020-08-03 10:18:10');
INSERT INTO `admin_operation_log` VALUES ('123', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-08-03 10:18:12', '2020-08-03 10:18:12');
INSERT INTO `admin_operation_log` VALUES ('124', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-08-03 10:18:33', '2020-08-03 10:18:33');
INSERT INTO `admin_operation_log` VALUES ('125', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-08-03 10:18:48', '2020-08-03 10:18:48');
INSERT INTO `admin_operation_log` VALUES ('126', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-03 10:18:49', '2020-08-03 10:18:49');
INSERT INTO `admin_operation_log` VALUES ('127', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-08-03 10:20:14', '2020-08-03 10:20:14');
INSERT INTO `admin_operation_log` VALUES ('128', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-08-03 10:20:27', '2020-08-03 10:20:27');
INSERT INTO `admin_operation_log` VALUES ('129', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-08-03 10:20:55', '2020-08-03 10:20:55');
INSERT INTO `admin_operation_log` VALUES ('130', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-08-03 10:21:19', '2020-08-03 10:21:19');
INSERT INTO `admin_operation_log` VALUES ('131', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-08-03 10:21:48', '2020-08-03 10:21:48');
INSERT INTO `admin_operation_log` VALUES ('132', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-08-03 10:22:36', '2020-08-03 10:22:36');
INSERT INTO `admin_operation_log` VALUES ('133', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-08-03 10:22:37', '2020-08-03 10:22:37');
INSERT INTO `admin_operation_log` VALUES ('134', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-03 10:22:49', '2020-08-03 10:22:49');
INSERT INTO `admin_operation_log` VALUES ('135', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-08-03 10:23:02', '2020-08-03 10:23:02');
INSERT INTO `admin_operation_log` VALUES ('136', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-08-03 10:23:14', '2020-08-03 10:23:14');
INSERT INTO `admin_operation_log` VALUES ('137', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-08-03 10:24:44', '2020-08-03 10:24:44');
INSERT INTO `admin_operation_log` VALUES ('138', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-08-03 10:29:53', '2020-08-03 10:29:53');
INSERT INTO `admin_operation_log` VALUES ('139', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-03 10:29:58', '2020-08-03 10:29:58');
INSERT INTO `admin_operation_log` VALUES ('140', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-08-03 10:30:10', '2020-08-03 10:30:10');
INSERT INTO `admin_operation_log` VALUES ('141', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-08-03 10:36:43', '2020-08-03 10:36:43');
INSERT INTO `admin_operation_log` VALUES ('142', '0', 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2020-08-03 13:28:28', '2020-08-03 13:28:28');
INSERT INTO `admin_operation_log` VALUES ('143', '0', 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"jNs6DretwA0ip2uVM1sHGOY4818jhnMEhs4JUAfa\",\"username\":\"admin\",\"password\":\"adm******\"}', '2020-08-03 13:28:37', '2020-08-03 13:28:37');
INSERT INTO `admin_operation_log` VALUES ('144', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-08-03 13:28:37', '2020-08-03 13:28:37');
INSERT INTO `admin_operation_log` VALUES ('145', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-08-03 13:28:55', '2020-08-03 13:28:55');
INSERT INTO `admin_operation_log` VALUES ('146', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-08-03 13:32:23', '2020-08-03 13:32:23');
INSERT INTO `admin_operation_log` VALUES ('147', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-08-03 13:32:24', '2020-08-03 13:32:24');
INSERT INTO `admin_operation_log` VALUES ('148', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-08-03 13:32:45', '2020-08-03 13:32:45');
INSERT INTO `admin_operation_log` VALUES ('149', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-08-03 13:32:46', '2020-08-03 13:32:46');
INSERT INTO `admin_operation_log` VALUES ('150', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-08-03 13:34:59', '2020-08-03 13:34:59');
INSERT INTO `admin_operation_log` VALUES ('151', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-08-03 13:35:32', '2020-08-03 13:35:32');
INSERT INTO `admin_operation_log` VALUES ('152', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-08-03 13:36:28', '2020-08-03 13:36:28');
INSERT INTO `admin_operation_log` VALUES ('153', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-08-03 13:36:56', '2020-08-03 13:36:56');
INSERT INTO `admin_operation_log` VALUES ('154', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-08-03 13:37:16', '2020-08-03 13:37:16');
INSERT INTO `admin_operation_log` VALUES ('155', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-03 13:37:22', '2020-08-03 13:37:22');
INSERT INTO `admin_operation_log` VALUES ('156', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-03 13:37:25', '2020-08-03 13:37:25');
INSERT INTO `admin_operation_log` VALUES ('157', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-08-03 13:37:43', '2020-08-03 13:37:43');
INSERT INTO `admin_operation_log` VALUES ('158', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-08-03 13:37:53', '2020-08-03 13:37:53');
INSERT INTO `admin_operation_log` VALUES ('159', '1', 'admin/helpers/icons', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-03 14:22:01', '2020-08-03 14:22:01');
INSERT INTO `admin_operation_log` VALUES ('160', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-08-03 14:24:26', '2020-08-03 14:24:26');
INSERT INTO `admin_operation_log` VALUES ('161', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-03 14:24:32', '2020-08-03 14:24:32');
INSERT INTO `admin_operation_log` VALUES ('162', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-08-03 15:33:11', '2020-08-03 15:33:11');
INSERT INTO `admin_operation_log` VALUES ('163', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-08-03 15:43:00', '2020-08-03 15:43:00');
INSERT INTO `admin_operation_log` VALUES ('164', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-08-03 16:43:52', '2020-08-03 16:43:52');
INSERT INTO `admin_operation_log` VALUES ('165', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-03 16:43:54', '2020-08-03 16:43:54');
INSERT INTO `admin_operation_log` VALUES ('166', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-08-03 16:44:36', '2020-08-03 16:44:36');
INSERT INTO `admin_operation_log` VALUES ('167', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-08-03 16:44:47', '2020-08-03 16:44:47');
INSERT INTO `admin_operation_log` VALUES ('168', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-08-03 16:45:53', '2020-08-03 16:45:53');
INSERT INTO `admin_operation_log` VALUES ('169', '1', 'admin/addresses', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-03 16:45:55', '2020-08-03 16:45:55');
INSERT INTO `admin_operation_log` VALUES ('170', '1', 'admin/addresses', 'GET', '127.0.0.1', '[]', '2020-08-03 16:45:55', '2020-08-03 16:45:55');
INSERT INTO `admin_operation_log` VALUES ('171', '1', 'admin/addresses', 'GET', '127.0.0.1', '[]', '2020-08-03 16:46:40', '2020-08-03 16:46:40');
INSERT INTO `admin_operation_log` VALUES ('172', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-03 16:52:09', '2020-08-03 16:52:09');
INSERT INTO `admin_operation_log` VALUES ('173', '1', 'admin/addresses', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-03 16:52:20', '2020-08-03 16:52:20');
INSERT INTO `admin_operation_log` VALUES ('174', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-03 16:52:23', '2020-08-03 16:52:23');
INSERT INTO `admin_operation_log` VALUES ('175', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-08-03 16:52:27', '2020-08-03 16:52:27');
INSERT INTO `admin_operation_log` VALUES ('176', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-08-03 17:07:29', '2020-08-03 17:07:29');
INSERT INTO `admin_operation_log` VALUES ('177', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-08-03 17:08:21', '2020-08-03 17:08:21');
INSERT INTO `admin_operation_log` VALUES ('178', '1', 'admin/dcat-api/action', 'POST', '127.0.0.1', '{\"target\":\"#show-user-address\",\"_token\":\"D5nkBdqvEVitK9FTWyVCCmhH9Ccbox61gvXgv7yb\",\"_action\":\"App_Admin_Actions_Grid_ShowUserAddress\",\"_key\":\"1\"}', '2020-08-03 17:08:24', '2020-08-03 17:08:24');
INSERT INTO `admin_operation_log` VALUES ('179', '1', 'admin/dcat-api/action', 'POST', '127.0.0.1', '{\"target\":\"#show-user-address\",\"_token\":\"D5nkBdqvEVitK9FTWyVCCmhH9Ccbox61gvXgv7yb\",\"_action\":\"App_Admin_Actions_Grid_ShowUserAddress\",\"_key\":\"2\"}', '2020-08-03 17:08:33', '2020-08-03 17:08:33');
INSERT INTO `admin_operation_log` VALUES ('180', '1', 'admin/dcat-api/action', 'POST', '127.0.0.1', '{\"target\":\"#show-user-address\",\"_token\":\"D5nkBdqvEVitK9FTWyVCCmhH9Ccbox61gvXgv7yb\",\"_action\":\"App_Admin_Actions_Grid_ShowUserAddress\",\"_key\":\"1\"}', '2020-08-03 17:08:46', '2020-08-03 17:08:46');
INSERT INTO `admin_operation_log` VALUES ('181', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-08-03 17:08:49', '2020-08-03 17:08:49');
INSERT INTO `admin_operation_log` VALUES ('182', '1', 'admin/dcat-api/action', 'POST', '127.0.0.1', '{\"target\":\"#show-user-address\",\"_token\":\"D5nkBdqvEVitK9FTWyVCCmhH9Ccbox61gvXgv7yb\",\"_action\":\"App_Admin_Actions_Grid_ShowUserAddress\",\"_key\":\"2\"}', '2020-08-03 17:08:50', '2020-08-03 17:08:50');
INSERT INTO `admin_operation_log` VALUES ('183', '1', 'admin/dcat-api/action', 'POST', '127.0.0.1', '{\"target\":\"#show-user-address\",\"_token\":\"D5nkBdqvEVitK9FTWyVCCmhH9Ccbox61gvXgv7yb\",\"_action\":\"App_Admin_Actions_Grid_ShowUserAddress\",\"_key\":\"1\"}', '2020-08-03 17:08:53', '2020-08-03 17:08:53');
INSERT INTO `admin_operation_log` VALUES ('184', '1', 'admin/dcat-api/action', 'POST', '127.0.0.1', '{\"target\":\"#show-user-address\",\"_token\":\"D5nkBdqvEVitK9FTWyVCCmhH9Ccbox61gvXgv7yb\",\"_action\":\"App_Admin_Actions_Grid_ShowUserAddress\",\"_key\":\"2\"}', '2020-08-03 17:08:56', '2020-08-03 17:08:56');
INSERT INTO `admin_operation_log` VALUES ('185', '1', 'admin/dcat-api/action', 'POST', '127.0.0.1', '{\"target\":\"#show-user-address\",\"_token\":\"D5nkBdqvEVitK9FTWyVCCmhH9Ccbox61gvXgv7yb\",\"_action\":\"App_Admin_Actions_Grid_ShowUserAddress\",\"_key\":\"1\"}', '2020-08-03 17:08:59', '2020-08-03 17:08:59');
INSERT INTO `admin_operation_log` VALUES ('186', '1', 'admin/dcat-api/action', 'POST', '127.0.0.1', '{\"target\":\"#show-user-address\",\"_token\":\"D5nkBdqvEVitK9FTWyVCCmhH9Ccbox61gvXgv7yb\",\"_action\":\"App_Admin_Actions_Grid_ShowUserAddress\",\"_key\":\"1\"}', '2020-08-03 17:09:20', '2020-08-03 17:09:20');
INSERT INTO `admin_operation_log` VALUES ('187', '1', 'admin/dcat-api/action', 'POST', '127.0.0.1', '{\"target\":\"#show-user-address\",\"_token\":\"D5nkBdqvEVitK9FTWyVCCmhH9Ccbox61gvXgv7yb\",\"_action\":\"App_Admin_Actions_Grid_ShowUserAddress\",\"_key\":\"1\"}', '2020-08-03 17:09:25', '2020-08-03 17:09:25');
INSERT INTO `admin_operation_log` VALUES ('188', '1', 'admin/dcat-api/action', 'POST', '127.0.0.1', '{\"target\":\"#show-user-address\",\"_token\":\"D5nkBdqvEVitK9FTWyVCCmhH9Ccbox61gvXgv7yb\",\"_action\":\"App_Admin_Actions_Grid_ShowUserAddress\",\"_key\":\"2\"}', '2020-08-03 17:09:28', '2020-08-03 17:09:28');
INSERT INTO `admin_operation_log` VALUES ('189', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-08-03 17:11:12', '2020-08-03 17:11:12');
INSERT INTO `admin_operation_log` VALUES ('190', '1', 'admin/dcat-api/action', 'POST', '127.0.0.1', '{\"target\":\"#show-user-address\",\"_token\":\"D5nkBdqvEVitK9FTWyVCCmhH9Ccbox61gvXgv7yb\",\"_action\":\"App_Admin_Actions_Grid_ShowUserAddress\",\"_key\":\"1\"}', '2020-08-03 17:11:13', '2020-08-03 17:11:13');
INSERT INTO `admin_operation_log` VALUES ('191', '1', 'admin/dcat-api/action', 'POST', '127.0.0.1', '{\"target\":\"#show-user-address\",\"_token\":\"D5nkBdqvEVitK9FTWyVCCmhH9Ccbox61gvXgv7yb\",\"_action\":\"App_Admin_Actions_Grid_ShowUserAddress\",\"_key\":\"1\"}', '2020-08-03 17:12:04', '2020-08-03 17:12:04');
INSERT INTO `admin_operation_log` VALUES ('192', '1', 'admin/dcat-api/action', 'POST', '127.0.0.1', '{\"target\":\"#show-user-address\",\"_token\":\"D5nkBdqvEVitK9FTWyVCCmhH9Ccbox61gvXgv7yb\",\"_action\":\"App_Admin_Actions_Grid_ShowUserAddress\",\"_key\":\"1\"}', '2020-08-03 17:12:33', '2020-08-03 17:12:33');
INSERT INTO `admin_operation_log` VALUES ('193', '1', 'admin/dcat-api/action', 'POST', '127.0.0.1', '{\"target\":\"#show-user-address\",\"_token\":\"D5nkBdqvEVitK9FTWyVCCmhH9Ccbox61gvXgv7yb\",\"_action\":\"App_Admin_Actions_Grid_ShowUserAddress\",\"_key\":\"1\"}', '2020-08-03 17:13:31', '2020-08-03 17:13:31');
INSERT INTO `admin_operation_log` VALUES ('194', '1', 'admin/dcat-api/action', 'POST', '127.0.0.1', '{\"target\":\"#show-user-address\",\"_token\":\"D5nkBdqvEVitK9FTWyVCCmhH9Ccbox61gvXgv7yb\",\"_action\":\"App_Admin_Actions_Grid_ShowUserAddress\",\"_key\":\"1\"}', '2020-08-03 17:13:55', '2020-08-03 17:13:55');
INSERT INTO `admin_operation_log` VALUES ('195', '1', 'admin/dcat-api/action', 'POST', '127.0.0.1', '{\"target\":\"#show-user-address\",\"_token\":\"D5nkBdqvEVitK9FTWyVCCmhH9Ccbox61gvXgv7yb\",\"_action\":\"App_Admin_Actions_Grid_ShowUserAddress\",\"_key\":\"1\"}', '2020-08-03 17:14:47', '2020-08-03 17:14:47');
INSERT INTO `admin_operation_log` VALUES ('196', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-08-03 17:16:18', '2020-08-03 17:16:18');
INSERT INTO `admin_operation_log` VALUES ('197', '1', 'admin/dcat-api/action', 'POST', '127.0.0.1', '{\"target\":\"#show-user-address\",\"_token\":\"D5nkBdqvEVitK9FTWyVCCmhH9Ccbox61gvXgv7yb\",\"_action\":\"App_Admin_Actions_Grid_ShowUserAddress\",\"_key\":\"1\"}', '2020-08-03 17:16:19', '2020-08-03 17:16:19');
INSERT INTO `admin_operation_log` VALUES ('198', '1', 'admin/dcat-api/action', 'POST', '127.0.0.1', '{\"target\":\"#show-user-address\",\"_token\":\"D5nkBdqvEVitK9FTWyVCCmhH9Ccbox61gvXgv7yb\",\"_action\":\"App_Admin_Actions_Grid_ShowUserAddress\",\"_key\":\"2\"}', '2020-08-03 17:16:22', '2020-08-03 17:16:22');
INSERT INTO `admin_operation_log` VALUES ('199', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-08-03 17:22:00', '2020-08-03 17:22:00');
INSERT INTO `admin_operation_log` VALUES ('200', '1', 'admin/dcat-api/action', 'POST', '127.0.0.1', '{\"target\":\"#show-user-address\",\"_token\":\"D5nkBdqvEVitK9FTWyVCCmhH9Ccbox61gvXgv7yb\",\"_action\":\"App_Admin_Actions_Grid_ShowUserAddress\",\"_key\":\"1\"}', '2020-08-03 17:22:01', '2020-08-03 17:22:01');
INSERT INTO `admin_operation_log` VALUES ('201', '1', 'admin/dcat-api/action', 'POST', '127.0.0.1', '{\"target\":\"#show-user-address\",\"_token\":\"D5nkBdqvEVitK9FTWyVCCmhH9Ccbox61gvXgv7yb\",\"_action\":\"App_Admin_Actions_Grid_ShowUserAddress\",\"_key\":\"1\"}', '2020-08-03 17:24:09', '2020-08-03 17:24:09');
INSERT INTO `admin_operation_log` VALUES ('202', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-08-03 17:24:11', '2020-08-03 17:24:11');
INSERT INTO `admin_operation_log` VALUES ('203', '1', 'admin/dcat-api/action', 'POST', '127.0.0.1', '{\"target\":\"#show-user-address\",\"_token\":\"D5nkBdqvEVitK9FTWyVCCmhH9Ccbox61gvXgv7yb\",\"_action\":\"App_Admin_Actions_Grid_ShowUserAddress\",\"_key\":\"1\"}', '2020-08-03 17:24:12', '2020-08-03 17:24:12');
INSERT INTO `admin_operation_log` VALUES ('204', '1', 'admin/dcat-api/action', 'POST', '127.0.0.1', '{\"target\":\"#show-user-address\",\"_token\":\"D5nkBdqvEVitK9FTWyVCCmhH9Ccbox61gvXgv7yb\",\"_action\":\"App_Admin_Actions_Grid_ShowUserAddress\",\"_key\":\"1\"}', '2020-08-03 17:24:35', '2020-08-03 17:24:35');
INSERT INTO `admin_operation_log` VALUES ('205', '1', 'admin/dcat-api/action', 'POST', '127.0.0.1', '{\"target\":\"#show-user-address\",\"_token\":\"D5nkBdqvEVitK9FTWyVCCmhH9Ccbox61gvXgv7yb\",\"_action\":\"App_Admin_Actions_Grid_ShowUserAddress\",\"_key\":\"1\"}', '2020-08-03 17:24:55', '2020-08-03 17:24:55');
INSERT INTO `admin_operation_log` VALUES ('206', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-08-03 17:28:21', '2020-08-03 17:28:21');
INSERT INTO `admin_operation_log` VALUES ('207', '1', 'admin/dcat-api/action', 'POST', '127.0.0.1', '{\"target\":\"#show-user-address\",\"_token\":\"D5nkBdqvEVitK9FTWyVCCmhH9Ccbox61gvXgv7yb\",\"_action\":\"App_Admin_Actions_Grid_ShowUserAddress\",\"_key\":\"1\"}', '2020-08-03 17:28:22', '2020-08-03 17:28:22');
INSERT INTO `admin_operation_log` VALUES ('208', '1', 'admin/dcat-api/action', 'POST', '127.0.0.1', '{\"target\":\"#show-user-address\",\"_token\":\"D5nkBdqvEVitK9FTWyVCCmhH9Ccbox61gvXgv7yb\",\"_action\":\"App_Admin_Actions_Grid_ShowUserAddress\",\"_key\":\"1\"}', '2020-08-03 17:28:37', '2020-08-03 17:28:37');
INSERT INTO `admin_operation_log` VALUES ('209', '1', 'admin/dcat-api/action', 'POST', '127.0.0.1', '{\"target\":\"#show-user-address\",\"_token\":\"D5nkBdqvEVitK9FTWyVCCmhH9Ccbox61gvXgv7yb\",\"_action\":\"App_Admin_Actions_Grid_ShowUserAddress\",\"_key\":\"2\"}', '2020-08-03 17:28:49', '2020-08-03 17:28:49');
INSERT INTO `admin_operation_log` VALUES ('210', '1', 'admin/dcat-api/action', 'POST', '127.0.0.1', '{\"target\":\"#show-user-address\",\"_token\":\"D5nkBdqvEVitK9FTWyVCCmhH9Ccbox61gvXgv7yb\",\"_action\":\"App_Admin_Actions_Grid_ShowUserAddress\",\"_key\":\"1\"}', '2020-08-03 17:28:51', '2020-08-03 17:28:51');
INSERT INTO `admin_operation_log` VALUES ('211', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-08-03 17:28:53', '2020-08-03 17:28:53');
INSERT INTO `admin_operation_log` VALUES ('212', '1', 'admin/dcat-api/action', 'POST', '127.0.0.1', '{\"target\":\"#show-user-address\",\"_token\":\"D5nkBdqvEVitK9FTWyVCCmhH9Ccbox61gvXgv7yb\",\"_action\":\"App_Admin_Actions_Grid_ShowUserAddress\",\"_key\":\"2\"}', '2020-08-03 17:28:54', '2020-08-03 17:28:54');
INSERT INTO `admin_operation_log` VALUES ('213', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-08-03 17:29:16', '2020-08-03 17:29:16');
INSERT INTO `admin_operation_log` VALUES ('214', '1', 'admin/dcat-api/action', 'POST', '127.0.0.1', '{\"target\":\"#show-user-address\",\"_token\":\"D5nkBdqvEVitK9FTWyVCCmhH9Ccbox61gvXgv7yb\",\"_action\":\"App_Admin_Actions_Grid_ShowUserAddress\",\"_key\":\"2\"}', '2020-08-03 17:29:17', '2020-08-03 17:29:17');
INSERT INTO `admin_operation_log` VALUES ('215', '1', 'admin/dcat-api/action', 'POST', '127.0.0.1', '{\"target\":\"#show-user-address\",\"_token\":\"D5nkBdqvEVitK9FTWyVCCmhH9Ccbox61gvXgv7yb\",\"_action\":\"App_Admin_Actions_Grid_ShowUserAddress\",\"_key\":\"2\"}', '2020-08-03 17:29:46', '2020-08-03 17:29:46');
INSERT INTO `admin_operation_log` VALUES ('216', '1', 'admin/dcat-api/action', 'POST', '127.0.0.1', '{\"target\":\"#show-user-address\",\"_token\":\"D5nkBdqvEVitK9FTWyVCCmhH9Ccbox61gvXgv7yb\",\"_action\":\"App_Admin_Actions_Grid_ShowUserAddress\",\"_key\":\"1\"}', '2020-08-03 17:29:47', '2020-08-03 17:29:47');
INSERT INTO `admin_operation_log` VALUES ('217', '1', 'admin/dcat-api/action', 'POST', '127.0.0.1', '{\"target\":\"#show-user-address\",\"_token\":\"D5nkBdqvEVitK9FTWyVCCmhH9Ccbox61gvXgv7yb\",\"_action\":\"App_Admin_Actions_Grid_ShowUserAddress\",\"_key\":\"2\"}', '2020-08-03 17:31:28', '2020-08-03 17:31:28');
INSERT INTO `admin_operation_log` VALUES ('218', '1', 'admin/dcat-api/action', 'POST', '127.0.0.1', '{\"target\":\"#show-user-address\",\"_token\":\"D5nkBdqvEVitK9FTWyVCCmhH9Ccbox61gvXgv7yb\",\"_action\":\"App_Admin_Actions_Grid_ShowUserAddress\",\"_key\":\"1\"}', '2020-08-03 17:31:29', '2020-08-03 17:31:29');
INSERT INTO `admin_operation_log` VALUES ('219', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-08-03 17:33:05', '2020-08-03 17:33:05');
INSERT INTO `admin_operation_log` VALUES ('220', '1', 'admin/dcat-api/action', 'POST', '127.0.0.1', '{\"target\":\"#show-user-address\",\"_token\":\"D5nkBdqvEVitK9FTWyVCCmhH9Ccbox61gvXgv7yb\",\"_action\":\"App_Admin_Actions_Grid_ShowUserAddress\",\"_key\":\"2\"}', '2020-08-03 17:33:06', '2020-08-03 17:33:06');
INSERT INTO `admin_operation_log` VALUES ('221', '1', 'admin/dcat-api/action', 'POST', '127.0.0.1', '{\"target\":\"#show-user-address\",\"_token\":\"D5nkBdqvEVitK9FTWyVCCmhH9Ccbox61gvXgv7yb\",\"_action\":\"App_Admin_Actions_Grid_ShowUserAddress\",\"_key\":\"1\"}', '2020-08-03 17:33:12', '2020-08-03 17:33:12');
INSERT INTO `admin_operation_log` VALUES ('222', '1', 'admin/dcat-api/action', 'POST', '127.0.0.1', '{\"target\":\"#show-user-address\",\"_token\":\"D5nkBdqvEVitK9FTWyVCCmhH9Ccbox61gvXgv7yb\",\"_action\":\"App_Admin_Actions_Grid_ShowUserAddress\",\"_key\":\"2\"}', '2020-08-03 17:33:15', '2020-08-03 17:33:15');
INSERT INTO `admin_operation_log` VALUES ('223', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-08-03 17:34:14', '2020-08-03 17:34:14');
INSERT INTO `admin_operation_log` VALUES ('224', '1', 'admin/dcat-api/action', 'POST', '127.0.0.1', '{\"target\":\"#show-user-address\",\"_token\":\"D5nkBdqvEVitK9FTWyVCCmhH9Ccbox61gvXgv7yb\",\"_action\":\"App_Admin_Actions_Grid_ShowUserAddress\",\"_key\":\"1\"}', '2020-08-03 17:34:15', '2020-08-03 17:34:15');
INSERT INTO `admin_operation_log` VALUES ('225', '1', 'admin/dcat-api/action', 'POST', '127.0.0.1', '{\"target\":\"#show-user-address\",\"_token\":\"D5nkBdqvEVitK9FTWyVCCmhH9Ccbox61gvXgv7yb\",\"_action\":\"App_Admin_Actions_Grid_ShowUserAddress\",\"_key\":\"1\"}', '2020-08-03 17:34:39', '2020-08-03 17:34:39');
INSERT INTO `admin_operation_log` VALUES ('226', '1', 'admin/dcat-api/action', 'POST', '127.0.0.1', '{\"target\":\"#show-user-address\",\"_token\":\"D5nkBdqvEVitK9FTWyVCCmhH9Ccbox61gvXgv7yb\",\"_action\":\"App_Admin_Actions_Grid_ShowUserAddress\",\"_key\":\"1\"}', '2020-08-03 17:35:26', '2020-08-03 17:35:26');
INSERT INTO `admin_operation_log` VALUES ('227', '1', 'admin/dcat-api/action', 'POST', '127.0.0.1', '{\"target\":\"#show-user-address\",\"_token\":\"D5nkBdqvEVitK9FTWyVCCmhH9Ccbox61gvXgv7yb\",\"_action\":\"App_Admin_Actions_Grid_ShowUserAddress\",\"_key\":\"1\"}', '2020-08-03 17:35:55', '2020-08-03 17:35:55');
INSERT INTO `admin_operation_log` VALUES ('228', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-08-03 17:35:57', '2020-08-03 17:35:57');
INSERT INTO `admin_operation_log` VALUES ('229', '1', 'admin/dcat-api/action', 'POST', '127.0.0.1', '{\"target\":\"#show-user-address\",\"_token\":\"D5nkBdqvEVitK9FTWyVCCmhH9Ccbox61gvXgv7yb\",\"_action\":\"App_Admin_Actions_Grid_ShowUserAddress\",\"_key\":\"1\"}', '2020-08-03 17:35:58', '2020-08-03 17:35:58');
INSERT INTO `admin_operation_log` VALUES ('230', '1', 'admin/dcat-api/action', 'POST', '127.0.0.1', '{\"target\":\"#show-user-address\",\"_token\":\"D5nkBdqvEVitK9FTWyVCCmhH9Ccbox61gvXgv7yb\",\"_action\":\"App_Admin_Actions_Grid_ShowUserAddress\",\"_key\":\"2\"}', '2020-08-03 17:36:00', '2020-08-03 17:36:00');
INSERT INTO `admin_operation_log` VALUES ('231', '1', 'admin/dcat-api/action', 'POST', '127.0.0.1', '{\"target\":\"#show-user-address\",\"_token\":\"D5nkBdqvEVitK9FTWyVCCmhH9Ccbox61gvXgv7yb\",\"_action\":\"App_Admin_Actions_Grid_ShowUserAddress\",\"_key\":\"1\"}', '2020-08-03 17:36:47', '2020-08-03 17:36:47');
INSERT INTO `admin_operation_log` VALUES ('232', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-08-03 17:43:11', '2020-08-03 17:43:11');
INSERT INTO `admin_operation_log` VALUES ('233', '1', 'admin/dcat-api/action', 'POST', '127.0.0.1', '{\"target\":\"#show-user-address\",\"_token\":\"D5nkBdqvEVitK9FTWyVCCmhH9Ccbox61gvXgv7yb\",\"_action\":\"App_Admin_Actions_Grid_ShowUserAddress\",\"_key\":\"1\"}', '2020-08-03 17:43:12', '2020-08-03 17:43:12');
INSERT INTO `admin_operation_log` VALUES ('234', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-08-03 17:50:47', '2020-08-03 17:50:47');
INSERT INTO `admin_operation_log` VALUES ('235', '1', 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"post_type\":\"1\",\"renderable\":\"App_Admin_Repositories_UserAddress\",\"key\":\"1\"}', '2020-08-03 17:50:52', '2020-08-03 17:50:52');
INSERT INTO `admin_operation_log` VALUES ('236', '1', 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"post_type\":\"1\",\"renderable\":\"App_Admin_Repositories_UserAddress\",\"key\":\"2\"}', '2020-08-03 17:50:56', '2020-08-03 17:50:56');
INSERT INTO `admin_operation_log` VALUES ('237', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-08-03 17:52:28', '2020-08-03 17:52:28');
INSERT INTO `admin_operation_log` VALUES ('238', '1', 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"post_type\":\"1\",\"renderable\":\"App_Admin_Repositories_UserAddress\",\"key\":\"1\"}', '2020-08-03 17:52:30', '2020-08-03 17:52:30');
INSERT INTO `admin_operation_log` VALUES ('239', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-08-03 17:52:53', '2020-08-03 17:52:53');
INSERT INTO `admin_operation_log` VALUES ('240', '1', 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"post_type\":\"1\",\"renderable\":\"App_Admin_Repositories_UserAddress\",\"key\":\"1\"}', '2020-08-03 17:52:54', '2020-08-03 17:52:54');
INSERT INTO `admin_operation_log` VALUES ('241', '1', 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"post_type\":\"1\",\"renderable\":\"App_Admin_Repositories_UserAddress\",\"key\":\"2\"}', '2020-08-03 17:53:08', '2020-08-03 17:53:08');
INSERT INTO `admin_operation_log` VALUES ('242', '0', 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2020-08-04 09:12:19', '2020-08-04 09:12:19');
INSERT INTO `admin_operation_log` VALUES ('243', '0', 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"hjQGtfSK4DuZmBcrljbYLb9frY905Vb5jqOMyMFJ\",\"username\":\"admin\",\"password\":\"adm******\"}', '2020-08-04 09:13:04', '2020-08-04 09:13:04');
INSERT INTO `admin_operation_log` VALUES ('244', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-08-04 09:13:06', '2020-08-04 09:13:06');
INSERT INTO `admin_operation_log` VALUES ('245', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 09:13:12', '2020-08-04 09:13:12');
INSERT INTO `admin_operation_log` VALUES ('246', '1', 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"post_type\":\"1\",\"renderable\":\"App_Admin_Repositories_UserAddress\",\"key\":\"1\"}', '2020-08-04 09:13:17', '2020-08-04 09:13:17');
INSERT INTO `admin_operation_log` VALUES ('247', '1', 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"post_type\":\"1\",\"renderable\":\"App_Admin_Repositories_UserAddress\",\"key\":\"2\"}', '2020-08-04 09:13:36', '2020-08-04 09:13:36');
INSERT INTO `admin_operation_log` VALUES ('248', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 09:50:55', '2020-08-04 09:50:55');
INSERT INTO `admin_operation_log` VALUES ('249', '1', 'admin/helpers/scaffold/table', 'POST', '127.0.0.1', '{\"db\":\"jrerp\",\"tb\":\"users\",\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\"}', '2020-08-04 09:51:29', '2020-08-04 09:51:29');
INSERT INTO `admin_operation_log` VALUES ('250', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"singular\":\"users\"}', '2020-08-04 09:51:30', '2020-08-04 09:51:30');
INSERT INTO `admin_operation_log` VALUES ('251', '1', 'admin/helpers/scaffold/table', 'POST', '127.0.0.1', '{\"db\":\"jrerp\",\"tb\":\"categories\",\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\"}', '2020-08-04 09:51:36', '2020-08-04 09:51:36');
INSERT INTO `admin_operation_log` VALUES ('252', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"singular\":\"categories\"}', '2020-08-04 09:51:37', '2020-08-04 09:51:37');
INSERT INTO `admin_operation_log` VALUES ('253', '1', 'admin/helpers/scaffold', 'POST', '127.0.0.1', '{\"table_name\":\"categories\",\"exist-table\":\"jrerp|categories\",\"model_name\":\"App\\\\Models\\\\Category\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\CategoryController\",\"repository_name\":\"App\\\\Admin\\\\Repositories\\\\Category\",\"create\":[\"repository\",\"controller\",\"lang\"],\"fields\":[{\"name\":\"name\",\"translation\":\"\\u5206\\u7c7b\\u540d\\u79f0\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":null},{\"name\":\"parent_id\",\"translation\":\"\\u4e0a\\u7ea7\",\"type\":\"unsignedBigInteger\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":null},{\"name\":\"is_directory\",\"translation\":\"\\u662f\\u5426\\u76ee\\u5f55\",\"type\":\"tinyInteger\",\"key\":null,\"default\":null,\"comment\":null},{\"name\":\"level\",\"translation\":\"\\u5c42\\u7ea7\",\"type\":\"unsignedInteger\",\"key\":null,\"default\":null,\"comment\":null},{\"name\":\"path\",\"translation\":\"\\u8def\\u5f84\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":null}],\"primary_key\":\"id\",\"timestamps\":\"1\",\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\"}', '2020-08-04 09:52:54', '2020-08-04 09:52:54');
INSERT INTO `admin_operation_log` VALUES ('254', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2020-08-04 09:52:54', '2020-08-04 09:52:54');
INSERT INTO `admin_operation_log` VALUES ('255', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 09:53:08', '2020-08-04 09:53:08');
INSERT INTO `admin_operation_log` VALUES ('256', '1', 'admin/categories', 'GET', '127.0.0.1', '[]', '2020-08-04 09:58:11', '2020-08-04 09:58:11');
INSERT INTO `admin_operation_log` VALUES ('257', '1', 'admin/categories', 'GET', '127.0.0.1', '[]', '2020-08-04 09:58:17', '2020-08-04 09:58:17');
INSERT INTO `admin_operation_log` VALUES ('258', '1', 'admin/categories', 'GET', '127.0.0.1', '[]', '2020-08-04 10:02:42', '2020-08-04 10:02:42');
INSERT INTO `admin_operation_log` VALUES ('259', '1', 'admin/categories', 'GET', '127.0.0.1', '[]', '2020-08-04 10:05:05', '2020-08-04 10:05:05');
INSERT INTO `admin_operation_log` VALUES ('260', '1', 'admin/categories', 'GET', '127.0.0.1', '[]', '2020-08-04 10:05:11', '2020-08-04 10:05:11');
INSERT INTO `admin_operation_log` VALUES ('261', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2020-08-04 10:05:41', '2020-08-04 10:05:41');
INSERT INTO `admin_operation_log` VALUES ('262', '1', 'admin/categories', 'GET', '127.0.0.1', '[]', '2020-08-04 10:05:48', '2020-08-04 10:05:48');
INSERT INTO `admin_operation_log` VALUES ('263', '1', 'admin/categories', 'GET', '127.0.0.1', '[]', '2020-08-04 10:05:52', '2020-08-04 10:05:52');
INSERT INTO `admin_operation_log` VALUES ('264', '1', 'admin/categories', 'GET', '127.0.0.1', '[]', '2020-08-04 10:06:25', '2020-08-04 10:06:25');
INSERT INTO `admin_operation_log` VALUES ('265', '1', 'admin/categories', 'GET', '127.0.0.1', '{\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\",\"_parent_id_\":\"17\",\"_tier_\":\"1\",\"_children_page_17\":\"1\"}', '2020-08-04 10:06:34', '2020-08-04 10:06:34');
INSERT INTO `admin_operation_log` VALUES ('266', '1', 'admin/categories', 'GET', '127.0.0.1', '{\"_parent_id_\":\"18\",\"_tier_\":\"2\",\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\",\"_children_page_18\":\"1\"}', '2020-08-04 10:06:40', '2020-08-04 10:06:40');
INSERT INTO `admin_operation_log` VALUES ('267', '1', 'admin/categories', 'GET', '127.0.0.1', '{\"_parent_id_\":\"19\",\"_tier_\":\"2\",\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\",\"_children_page_19\":\"1\"}', '2020-08-04 10:06:42', '2020-08-04 10:06:42');
INSERT INTO `admin_operation_log` VALUES ('268', '1', 'admin/categories', 'GET', '127.0.0.1', '{\"_parent_id_\":\"20\",\"_tier_\":\"2\",\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\",\"_children_page_20\":\"1\"}', '2020-08-04 10:06:44', '2020-08-04 10:06:44');
INSERT INTO `admin_operation_log` VALUES ('269', '1', 'admin/categories', 'GET', '127.0.0.1', '{\"_parent_id_\":\"21\",\"_tier_\":\"2\",\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\",\"_children_page_21\":\"1\"}', '2020-08-04 10:06:46', '2020-08-04 10:06:46');
INSERT INTO `admin_operation_log` VALUES ('270', '1', 'admin/categories', 'GET', '127.0.0.1', '{\"_parent_id_\":\"1\",\"_tier_\":\"1\",\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\",\"_children_page_1\":\"1\"}', '2020-08-04 10:06:56', '2020-08-04 10:06:56');
INSERT INTO `admin_operation_log` VALUES ('271', '1', 'admin/categories', 'GET', '127.0.0.1', '[]', '2020-08-04 10:10:23', '2020-08-04 10:10:23');
INSERT INTO `admin_operation_log` VALUES ('272', '1', 'admin/categories', 'GET', '127.0.0.1', '{\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\",\"_parent_id_\":\"1\",\"_tier_\":\"1\",\"_children_page_1\":\"1\"}', '2020-08-04 10:10:27', '2020-08-04 10:10:27');
INSERT INTO `admin_operation_log` VALUES ('273', '1', 'admin/categories', 'GET', '127.0.0.1', '{\"_parent_id_\":\"7\",\"_tier_\":\"2\",\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\",\"_children_page_7\":\"1\"}', '2020-08-04 10:10:33', '2020-08-04 10:10:33');
INSERT INTO `admin_operation_log` VALUES ('274', '1', 'admin/categories', 'GET', '127.0.0.1', '[]', '2020-08-04 10:12:02', '2020-08-04 10:12:02');
INSERT INTO `admin_operation_log` VALUES ('275', '1', 'admin/categories', 'GET', '127.0.0.1', '[]', '2020-08-04 10:12:23', '2020-08-04 10:12:23');
INSERT INTO `admin_operation_log` VALUES ('276', '1', 'admin/categories', 'GET', '127.0.0.1', '{\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\",\"_parent_id_\":\"1\",\"_tier_\":\"1\",\"_children_page_1\":\"1\"}', '2020-08-04 10:12:26', '2020-08-04 10:12:26');
INSERT INTO `admin_operation_log` VALUES ('277', '1', 'admin/categories', 'GET', '127.0.0.1', '{\"_parent_id_\":\"7\",\"_tier_\":\"2\",\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\",\"_children_page_7\":\"1\"}', '2020-08-04 10:12:29', '2020-08-04 10:12:29');
INSERT INTO `admin_operation_log` VALUES ('278', '1', 'admin/categories', 'GET', '127.0.0.1', '[]', '2020-08-04 10:15:07', '2020-08-04 10:15:07');
INSERT INTO `admin_operation_log` VALUES ('279', '1', 'admin/categories', 'GET', '127.0.0.1', '[]', '2020-08-04 10:15:58', '2020-08-04 10:15:58');
INSERT INTO `admin_operation_log` VALUES ('280', '1', 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 10:17:01', '2020-08-04 10:17:01');
INSERT INTO `admin_operation_log` VALUES ('281', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 10:17:03', '2020-08-04 10:17:03');
INSERT INTO `admin_operation_log` VALUES ('282', '1', 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":null,\"title\":\"\\u5206\\u7c7b\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"\\/categories\",\"roles\":[null],\"permissions\":null,\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\"}', '2020-08-04 10:18:43', '2020-08-04 10:18:43');
INSERT INTO `admin_operation_log` VALUES ('283', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-08-04 10:18:45', '2020-08-04 10:18:45');
INSERT INTO `admin_operation_log` VALUES ('284', '1', 'admin/auth/menu', 'POST', '127.0.0.1', '{\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":8},{\\\"id\\\":9},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}', '2020-08-04 10:18:52', '2020-08-04 10:18:52');
INSERT INTO `admin_operation_log` VALUES ('285', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-08-04 10:18:54', '2020-08-04 10:18:54');
INSERT INTO `admin_operation_log` VALUES ('286', '1', 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 10:18:57', '2020-08-04 10:18:57');
INSERT INTO `admin_operation_log` VALUES ('287', '1', 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\",\"_parent_id_\":\"31\",\"_tier_\":\"1\",\"_children_page_31\":\"1\"}', '2020-08-04 10:19:11', '2020-08-04 10:19:11');
INSERT INTO `admin_operation_log` VALUES ('288', '1', 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 10:45:08', '2020-08-04 10:45:08');
INSERT INTO `admin_operation_log` VALUES ('289', '1', 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 10:45:12', '2020-08-04 10:45:12');
INSERT INTO `admin_operation_log` VALUES ('290', '1', 'admin/auth/users/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2020-08-04 10:45:13', '2020-08-04 10:45:13');
INSERT INTO `admin_operation_log` VALUES ('291', '1', 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 10:45:25', '2020-08-04 10:45:25');
INSERT INTO `admin_operation_log` VALUES ('292', '1', 'admin/auth/roles/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2020-08-04 10:45:26', '2020-08-04 10:45:26');
INSERT INTO `admin_operation_log` VALUES ('293', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 10:46:03', '2020-08-04 10:46:03');
INSERT INTO `admin_operation_log` VALUES ('294', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-08-04 10:51:56', '2020-08-04 10:51:56');
INSERT INTO `admin_operation_log` VALUES ('295', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 10:51:58', '2020-08-04 10:51:58');
INSERT INTO `admin_operation_log` VALUES ('296', '1', 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 10:52:00', '2020-08-04 10:52:00');
INSERT INTO `admin_operation_log` VALUES ('297', '1', 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 11:03:33', '2020-08-04 11:03:33');
INSERT INTO `admin_operation_log` VALUES ('298', '1', 'admin/categories/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 11:03:35', '2020-08-04 11:03:35');
INSERT INTO `admin_operation_log` VALUES ('299', '1', 'admin/categories/create', 'GET', '127.0.0.1', '[]', '2020-08-04 11:13:02', '2020-08-04 11:13:02');
INSERT INTO `admin_operation_log` VALUES ('300', '1', 'admin/helpers/extensions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 11:18:46', '2020-08-04 11:18:46');
INSERT INTO `admin_operation_log` VALUES ('301', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 11:18:48', '2020-08-04 11:18:48');
INSERT INTO `admin_operation_log` VALUES ('302', '1', 'admin/helpers/icons', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 11:18:56', '2020-08-04 11:18:56');
INSERT INTO `admin_operation_log` VALUES ('303', '1', 'admin/helpers/extensions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 11:18:57', '2020-08-04 11:18:57');
INSERT INTO `admin_operation_log` VALUES ('304', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 11:19:02', '2020-08-04 11:19:02');
INSERT INTO `admin_operation_log` VALUES ('305', '1', 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 12:51:24', '2020-08-04 12:51:24');
INSERT INTO `admin_operation_log` VALUES ('306', '1', 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\",\"_parent_id_\":\"1\",\"_tier_\":\"1\",\"_children_page_1\":\"1\"}', '2020-08-04 12:51:43', '2020-08-04 12:51:43');
INSERT INTO `admin_operation_log` VALUES ('307', '1', 'admin/categories', 'GET', '127.0.0.1', '{\"_parent_id_\":\"7\",\"_pjax\":\"#pjax-container\",\"_tier_\":\"2\",\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\",\"_children_page_7\":\"1\"}', '2020-08-04 12:51:48', '2020-08-04 12:51:48');
INSERT INTO `admin_operation_log` VALUES ('308', '1', 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 13:09:59', '2020-08-04 13:09:59');
INSERT INTO `admin_operation_log` VALUES ('309', '1', 'admin/categories/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 13:10:01', '2020-08-04 13:10:01');
INSERT INTO `admin_operation_log` VALUES ('310', '1', 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 13:10:10', '2020-08-04 13:10:10');
INSERT INTO `admin_operation_log` VALUES ('311', '1', 'admin/categories/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 13:10:33', '2020-08-04 13:10:33');
INSERT INTO `admin_operation_log` VALUES ('312', '1', 'admin/categories', 'POST', '127.0.0.1', '{\"name\":\"\\u6c7d\\u8f66\",\"is_directory\":\"1\",\"parent_id\":null,\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\",\"_previous_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/categories\"}', '2020-08-04 13:12:24', '2020-08-04 13:12:24');
INSERT INTO `admin_operation_log` VALUES ('313', '1', 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 13:12:24', '2020-08-04 13:12:24');
INSERT INTO `admin_operation_log` VALUES ('314', '1', 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 13:12:32', '2020-08-04 13:12:32');
INSERT INTO `admin_operation_log` VALUES ('315', '1', 'admin/categories', 'GET', '127.0.0.1', '[]', '2020-08-04 13:14:11', '2020-08-04 13:14:11');
INSERT INTO `admin_operation_log` VALUES ('316', '1', 'admin/categories/51/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 13:14:18', '2020-08-04 13:14:18');
INSERT INTO `admin_operation_log` VALUES ('317', '1', 'admin/categories/51', 'PUT', '127.0.0.1', '{\"name\":\"\\u5361\\u8f66\",\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/categories\"}', '2020-08-04 13:16:06', '2020-08-04 13:16:06');
INSERT INTO `admin_operation_log` VALUES ('318', '1', 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 13:16:07', '2020-08-04 13:16:07');
INSERT INTO `admin_operation_log` VALUES ('319', '1', 'admin/categories/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 13:16:24', '2020-08-04 13:16:24');
INSERT INTO `admin_operation_log` VALUES ('320', '1', 'admin/api/categories', 'GET', '127.0.0.1', '{\"q\":\"\\u8f66\"}', '2020-08-04 13:18:28', '2020-08-04 13:18:28');
INSERT INTO `admin_operation_log` VALUES ('321', '1', 'admin/api/categories', 'GET', '127.0.0.1', '{\"q\":\"\\u8f66\"}', '2020-08-04 13:18:51', '2020-08-04 13:18:51');
INSERT INTO `admin_operation_log` VALUES ('322', '1', 'admin/api/categories', 'GET', '127.0.0.1', '{\"q\":\"\\u8f66\"}', '2020-08-04 13:19:12', '2020-08-04 13:19:12');
INSERT INTO `admin_operation_log` VALUES ('323', '1', 'admin/categories/create', 'GET', '127.0.0.1', '[]', '2020-08-04 13:19:26', '2020-08-04 13:19:26');
INSERT INTO `admin_operation_log` VALUES ('324', '1', 'admin/categories/create', 'GET', '127.0.0.1', '[]', '2020-08-04 13:20:40', '2020-08-04 13:20:40');
INSERT INTO `admin_operation_log` VALUES ('325', '1', 'admin/api/categories', 'GET', '127.0.0.1', '{\"q\":\"che\"}', '2020-08-04 13:20:49', '2020-08-04 13:20:49');
INSERT INTO `admin_operation_log` VALUES ('326', '1', 'admin/api/categories', 'GET', '127.0.0.1', '{\"q\":\"\\u8f66\"}', '2020-08-04 13:20:49', '2020-08-04 13:20:49');
INSERT INTO `admin_operation_log` VALUES ('327', '1', 'admin/api/categories', 'GET', '127.0.0.1', '{\"q\":\"che\"}', '2020-08-04 13:21:01', '2020-08-04 13:21:01');
INSERT INTO `admin_operation_log` VALUES ('328', '1', 'admin/categories/create', 'GET', '127.0.0.1', '[]', '2020-08-04 13:21:16', '2020-08-04 13:21:16');
INSERT INTO `admin_operation_log` VALUES ('329', '1', 'admin/api/categories', 'GET', '127.0.0.1', '{\"q\":\"c\"}', '2020-08-04 13:21:18', '2020-08-04 13:21:18');
INSERT INTO `admin_operation_log` VALUES ('330', '1', 'admin/api/categories', 'GET', '127.0.0.1', '{\"q\":\"che\"}', '2020-08-04 13:21:19', '2020-08-04 13:21:19');
INSERT INTO `admin_operation_log` VALUES ('331', '1', 'admin/api/categories', 'GET', '127.0.0.1', '{\"q\":\"\\u8f66\"}', '2020-08-04 13:21:19', '2020-08-04 13:21:19');
INSERT INTO `admin_operation_log` VALUES ('332', '1', 'admin/api/categories', 'GET', '127.0.0.1', '{\"q\":\"c\"}', '2020-08-04 13:21:46', '2020-08-04 13:21:46');
INSERT INTO `admin_operation_log` VALUES ('333', '1', 'admin/api/categories', 'GET', '127.0.0.1', '{\"q\":\"che\"}', '2020-08-04 13:21:46', '2020-08-04 13:21:46');
INSERT INTO `admin_operation_log` VALUES ('334', '1', 'admin/api/categories', 'GET', '127.0.0.1', '{\"q\":\"\\u8f66\"}', '2020-08-04 13:21:47', '2020-08-04 13:21:47');
INSERT INTO `admin_operation_log` VALUES ('335', '1', 'admin/categories', 'POST', '127.0.0.1', '{\"name\":\"\\u91cd\\u6c7d\",\"is_directory\":\"0\",\"parent_id\":\"51\",\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\"}', '2020-08-04 13:22:10', '2020-08-04 13:22:10');
INSERT INTO `admin_operation_log` VALUES ('336', '1', 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 13:22:10', '2020-08-04 13:22:10');
INSERT INTO `admin_operation_log` VALUES ('337', '1', 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\",\"_parent_id_\":\"51\",\"_tier_\":\"1\",\"_children_page_51\":\"1\"}', '2020-08-04 13:22:15', '2020-08-04 13:22:15');
INSERT INTO `admin_operation_log` VALUES ('338', '1', 'admin/categories', 'GET', '127.0.0.1', '[]', '2020-08-04 13:23:52', '2020-08-04 13:23:52');
INSERT INTO `admin_operation_log` VALUES ('339', '1', 'admin/categories/51', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\"}', '2020-08-04 13:24:27', '2020-08-04 13:24:27');
INSERT INTO `admin_operation_log` VALUES ('340', '1', 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 13:24:27', '2020-08-04 13:24:27');
INSERT INTO `admin_operation_log` VALUES ('341', '1', 'admin/categories/31', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\"}', '2020-08-04 13:24:55', '2020-08-04 13:24:55');
INSERT INTO `admin_operation_log` VALUES ('342', '1', 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 13:24:55', '2020-08-04 13:24:55');
INSERT INTO `admin_operation_log` VALUES ('343', '1', 'admin/categories/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 13:25:07', '2020-08-04 13:25:07');
INSERT INTO `admin_operation_log` VALUES ('344', '1', 'admin/categories/1/edit', 'GET', '127.0.0.1', '[]', '2020-08-04 13:25:32', '2020-08-04 13:25:32');
INSERT INTO `admin_operation_log` VALUES ('345', '1', 'admin/categories/1/edit', 'GET', '127.0.0.1', '[]', '2020-08-04 13:25:54', '2020-08-04 13:25:54');
INSERT INTO `admin_operation_log` VALUES ('346', '1', 'admin/categories/1/edit', 'GET', '127.0.0.1', '[]', '2020-08-04 13:26:18', '2020-08-04 13:26:18');
INSERT INTO `admin_operation_log` VALUES ('347', '1', 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 13:26:25', '2020-08-04 13:26:25');
INSERT INTO `admin_operation_log` VALUES ('348', '1', 'admin/helpers/icons', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 13:26:42', '2020-08-04 13:26:42');
INSERT INTO `admin_operation_log` VALUES ('349', '1', 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 14:20:16', '2020-08-04 14:20:16');
INSERT INTO `admin_operation_log` VALUES ('350', '1', 'admin/categories', 'GET', '127.0.0.1', '[]', '2020-08-04 14:20:19', '2020-08-04 14:20:19');
INSERT INTO `admin_operation_log` VALUES ('351', '1', 'admin/categories', 'GET', '127.0.0.1', '[]', '2020-08-04 14:21:13', '2020-08-04 14:21:13');
INSERT INTO `admin_operation_log` VALUES ('352', '1', 'admin/categories', 'GET', '127.0.0.1', '[]', '2020-08-04 14:22:57', '2020-08-04 14:22:57');
INSERT INTO `admin_operation_log` VALUES ('353', '1', 'admin/categories', 'GET', '127.0.0.1', '[]', '2020-08-04 14:23:01', '2020-08-04 14:23:01');
INSERT INTO `admin_operation_log` VALUES ('354', '1', 'admin/categories', 'GET', '127.0.0.1', '[]', '2020-08-04 14:24:29', '2020-08-04 14:24:29');
INSERT INTO `admin_operation_log` VALUES ('355', '1', 'admin/categories', 'GET', '127.0.0.1', '[]', '2020-08-04 14:25:11', '2020-08-04 14:25:11');
INSERT INTO `admin_operation_log` VALUES ('356', '1', 'admin/categories', 'GET', '127.0.0.1', '[]', '2020-08-04 14:25:48', '2020-08-04 14:25:48');
INSERT INTO `admin_operation_log` VALUES ('357', '1', 'admin/categories', 'GET', '127.0.0.1', '[]', '2020-08-04 14:27:10', '2020-08-04 14:27:10');
INSERT INTO `admin_operation_log` VALUES ('358', '1', 'admin/categories', 'GET', '127.0.0.1', '[]', '2020-08-04 14:28:42', '2020-08-04 14:28:42');
INSERT INTO `admin_operation_log` VALUES ('359', '1', 'admin/categories', 'GET', '127.0.0.1', '{\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\",\"_parent_id_\":\"42\",\"_tier_\":\"1\",\"_children_page_42\":\"1\"}', '2020-08-04 14:30:19', '2020-08-04 14:30:19');
INSERT INTO `admin_operation_log` VALUES ('360', '1', 'admin/dcat-api/form', 'POST', '127.0.0.1', '{\"name\":\"\\u6d77\\u5c14\\u7a7a\\u8c03\",\"is_directory\":\"0\",\"parent_id\":\"0\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\category_create\",\"_current_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/categories?\",\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\"}', '2020-08-04 14:30:38', '2020-08-04 14:30:38');
INSERT INTO `admin_operation_log` VALUES ('361', '1', 'admin/dcat-api/form', 'POST', '127.0.0.1', '{\"name\":\"\\u6d77\\u5c14\\u7a7a\\u8c03\",\"is_directory\":\"0\",\"parent_id\":\"0\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\category_create\",\"_current_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/categories?\",\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\"}', '2020-08-04 14:31:00', '2020-08-04 14:31:00');
INSERT INTO `admin_operation_log` VALUES ('362', '1', 'admin/categories', 'GET', '127.0.0.1', '[]', '2020-08-04 14:35:00', '2020-08-04 14:35:00');
INSERT INTO `admin_operation_log` VALUES ('363', '1', 'admin/dcat-api/form', 'POST', '127.0.0.1', '{\"name\":\"\\u6d77\\u5c14\",\"is_directory\":\"0\",\"parent_id\":\"42\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\category_create\",\"_current_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/categories?\",\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\"}', '2020-08-04 14:36:16', '2020-08-04 14:36:16');
INSERT INTO `admin_operation_log` VALUES ('364', '1', 'admin/dcat-api/form', 'POST', '127.0.0.1', '{\"name\":\"\\u6d77\\u5c14\",\"is_directory\":\"0\",\"parent_id\":\"42\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\category_create\",\"_current_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/categories?\",\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\"}', '2020-08-04 14:37:27', '2020-08-04 14:37:27');
INSERT INTO `admin_operation_log` VALUES ('365', '1', 'admin/dcat-api/form', 'POST', '127.0.0.1', '{\"name\":\"\\u6d77\\u5c14\",\"is_directory\":\"0\",\"parent_id\":\"42\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\category_create\",\"_current_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/categories?\",\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\"}', '2020-08-04 14:38:16', '2020-08-04 14:38:16');
INSERT INTO `admin_operation_log` VALUES ('366', '1', 'admin/dcat-api/form', 'POST', '127.0.0.1', '{\"name\":\"\\u6d77\\u5c14\",\"is_directory\":\"0\",\"parent_id\":\"42\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\category_create\",\"_current_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/categories?\",\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\"}', '2020-08-04 14:38:18', '2020-08-04 14:38:18');
INSERT INTO `admin_operation_log` VALUES ('367', '1', 'admin/categories', 'GET', '127.0.0.1', '[]', '2020-08-04 14:38:20', '2020-08-04 14:38:20');
INSERT INTO `admin_operation_log` VALUES ('368', '1', 'admin/dcat-api/form', 'POST', '127.0.0.1', '{\"name\":\"11\",\"is_directory\":\"0\",\"parent_id\":\"42\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\category_create\",\"_current_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/categories?\",\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\"}', '2020-08-04 14:38:27', '2020-08-04 14:38:27');
INSERT INTO `admin_operation_log` VALUES ('369', '1', 'admin/dcat-api/form', 'POST', '127.0.0.1', '{\"name\":\"11\",\"is_directory\":\"0\",\"parent_id\":\"42\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\category_create\",\"_current_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/categories?\",\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\"}', '2020-08-04 14:39:40', '2020-08-04 14:39:40');
INSERT INTO `admin_operation_log` VALUES ('370', '1', 'admin/dcat-api/form', 'POST', '127.0.0.1', '{\"name\":\"11\",\"is_directory\":\"0\",\"parent_id\":\"42\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\category_create\",\"_current_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/categories?\",\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\"}', '2020-08-04 14:43:20', '2020-08-04 14:43:20');
INSERT INTO `admin_operation_log` VALUES ('371', '1', 'admin/dcat-api/form', 'POST', '127.0.0.1', '{\"name\":\"11\",\"is_directory\":\"0\",\"parent_id\":\"42\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\category_create\",\"_current_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/categories?\",\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\"}', '2020-08-04 14:43:24', '2020-08-04 14:43:24');
INSERT INTO `admin_operation_log` VALUES ('372', '1', 'admin/dcat-api/form', 'POST', '127.0.0.1', '{\"name\":\"11\",\"is_directory\":\"0\",\"parent_id\":\"42\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\category_create\",\"_current_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/categories?\",\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\"}', '2020-08-04 14:43:41', '2020-08-04 14:43:41');
INSERT INTO `admin_operation_log` VALUES ('373', '1', 'admin/dcat-api/form', 'POST', '127.0.0.1', '{\"name\":\"\\u6d77\\u5c14\",\"is_directory\":\"0\",\"parent_id\":\"42\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\category_create\",\"_current_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/categories?\",\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\"}', '2020-08-04 14:46:53', '2020-08-04 14:46:53');
INSERT INTO `admin_operation_log` VALUES ('374', '1', 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 14:46:54', '2020-08-04 14:46:54');
INSERT INTO `admin_operation_log` VALUES ('375', '1', 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\",\"_parent_id_\":\"53\",\"_tier_\":\"1\",\"_children_page_53\":\"1\"}', '2020-08-04 14:47:03', '2020-08-04 14:47:03');
INSERT INTO `admin_operation_log` VALUES ('376', '1', 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 14:47:07', '2020-08-04 14:47:07');
INSERT INTO `admin_operation_log` VALUES ('377', '1', 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\",\"_parent_id_\":\"42\",\"_tier_\":\"1\",\"_children_page_42\":\"1\"}', '2020-08-04 14:47:13', '2020-08-04 14:47:13');
INSERT INTO `admin_operation_log` VALUES ('378', '1', 'admin/dcat-api/form', 'POST', '127.0.0.1', '{\"name\":\"111\",\"is_directory\":\"0\",\"parent_id\":\"53\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\category_create\",\"_current_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/categories?_pjax=%23pjax-container\",\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\"}', '2020-08-04 14:47:50', '2020-08-04 14:47:50');
INSERT INTO `admin_operation_log` VALUES ('379', '1', 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 14:47:50', '2020-08-04 14:47:50');
INSERT INTO `admin_operation_log` VALUES ('380', '1', 'admin/categories/54', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\"}', '2020-08-04 14:47:56', '2020-08-04 14:47:56');
INSERT INTO `admin_operation_log` VALUES ('381', '1', 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 14:47:56', '2020-08-04 14:47:56');
INSERT INTO `admin_operation_log` VALUES ('382', '1', 'admin/categories/53', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\"}', '2020-08-04 14:48:01', '2020-08-04 14:48:01');
INSERT INTO `admin_operation_log` VALUES ('383', '1', 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 14:48:01', '2020-08-04 14:48:01');
INSERT INTO `admin_operation_log` VALUES ('384', '1', 'admin/dcat-api/form', 'POST', '127.0.0.1', '{\"name\":\"\\u6d77\\u5c14\",\"is_directory\":\"0\",\"parent_id\":\"42\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\category_create\",\"_current_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/categories?_pjax=%23pjax-container\",\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\"}', '2020-08-04 14:49:25', '2020-08-04 14:49:25');
INSERT INTO `admin_operation_log` VALUES ('385', '1', 'admin/dcat-api/form', 'POST', '127.0.0.1', '{\"name\":\"\\u6d77\\u5c14\",\"is_directory\":\"0\",\"parent_id\":\"42\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\category_create\",\"_current_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/categories?_pjax=%23pjax-container\",\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\"}', '2020-08-04 15:03:25', '2020-08-04 15:03:25');
INSERT INTO `admin_operation_log` VALUES ('386', '1', 'admin/dcat-api/form', 'POST', '127.0.0.1', '{\"name\":\"\\u6d77\\u5c14\",\"is_directory\":\"0\",\"parent_id\":\"42\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\category_create\",\"_current_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/categories?_pjax=%23pjax-container\",\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\"}', '2020-08-04 15:03:38', '2020-08-04 15:03:38');
INSERT INTO `admin_operation_log` VALUES ('387', '1', 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 15:03:39', '2020-08-04 15:03:39');
INSERT INTO `admin_operation_log` VALUES ('388', '1', 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\",\"_parent_id_\":\"42\",\"_tier_\":\"1\",\"_children_page_42\":\"1\"}', '2020-08-04 15:03:43', '2020-08-04 15:03:43');
INSERT INTO `admin_operation_log` VALUES ('389', '1', 'admin/categories/55/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 15:03:49', '2020-08-04 15:03:49');
INSERT INTO `admin_operation_log` VALUES ('390', '1', 'admin/categories/55', 'PUT', '127.0.0.1', '{\"name\":\"\\u6d77\\u5c14\\u7a7a\\u8c03\",\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/categories\"}', '2020-08-04 15:03:58', '2020-08-04 15:03:58');
INSERT INTO `admin_operation_log` VALUES ('391', '1', 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 15:03:58', '2020-08-04 15:03:58');
INSERT INTO `admin_operation_log` VALUES ('392', '1', 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\",\"_parent_id_\":\"42\",\"_tier_\":\"1\",\"_children_page_42\":\"1\"}', '2020-08-04 15:04:05', '2020-08-04 15:04:05');
INSERT INTO `admin_operation_log` VALUES ('393', '1', 'admin/categories', 'GET', '127.0.0.1', '[]', '2020-08-04 15:18:33', '2020-08-04 15:18:33');
INSERT INTO `admin_operation_log` VALUES ('394', '1', 'admin/categories', 'GET', '127.0.0.1', '[]', '2020-08-04 15:18:51', '2020-08-04 15:18:51');
INSERT INTO `admin_operation_log` VALUES ('395', '1', 'admin/categories/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 15:21:02', '2020-08-04 15:21:02');
INSERT INTO `admin_operation_log` VALUES ('396', '1', 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 15:21:09', '2020-08-04 15:21:09');
INSERT INTO `admin_operation_log` VALUES ('397', '1', 'admin/categories/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 15:21:11', '2020-08-04 15:21:11');
INSERT INTO `admin_operation_log` VALUES ('398', '1', 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 15:21:12', '2020-08-04 15:21:12');
INSERT INTO `admin_operation_log` VALUES ('399', '1', 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 15:21:24', '2020-08-04 15:21:24');
INSERT INTO `admin_operation_log` VALUES ('400', '1', 'admin/auth/users/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2020-08-04 15:21:26', '2020-08-04 15:21:26');
INSERT INTO `admin_operation_log` VALUES ('401', '1', 'admin/auth/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 15:21:35', '2020-08-04 15:21:35');
INSERT INTO `admin_operation_log` VALUES ('402', '1', 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 15:21:39', '2020-08-04 15:21:39');
INSERT INTO `admin_operation_log` VALUES ('403', '1', 'admin/auth/users/1/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2020-08-04 15:21:45', '2020-08-04 15:21:45');
INSERT INTO `admin_operation_log` VALUES ('404', '1', 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 15:21:59', '2020-08-04 15:21:59');
INSERT INTO `admin_operation_log` VALUES ('405', '1', 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 15:22:22', '2020-08-04 15:22:22');
INSERT INTO `admin_operation_log` VALUES ('406', '1', 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 15:22:27', '2020-08-04 15:22:27');
INSERT INTO `admin_operation_log` VALUES ('407', '1', 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 15:46:59', '2020-08-04 15:46:59');
INSERT INTO `admin_operation_log` VALUES ('408', '1', 'admin/categories', 'GET', '127.0.0.1', '[]', '2020-08-04 15:49:35', '2020-08-04 15:49:35');
INSERT INTO `admin_operation_log` VALUES ('409', '1', 'admin/categories', 'GET', '127.0.0.1', '[]', '2020-08-04 15:51:41', '2020-08-04 15:51:41');
INSERT INTO `admin_operation_log` VALUES ('410', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 15:58:43', '2020-08-04 15:58:43');
INSERT INTO `admin_operation_log` VALUES ('411', '1', 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":null,\"title\":\"\\u5e7f\\u544a\\u7ba1\\u7406\",\"icon\":\"fa-archive\",\"uri\":\"\\/ads\",\"roles\":[null],\"permissions\":null,\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\"}', '2020-08-04 16:00:05', '2020-08-04 16:00:05');
INSERT INTO `admin_operation_log` VALUES ('412', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-08-04 16:00:07', '2020-08-04 16:00:07');
INSERT INTO `admin_operation_log` VALUES ('413', '1', 'admin/ads', 'GET', '127.0.0.1', '[]', '2020-08-04 16:01:24', '2020-08-04 16:01:24');
INSERT INTO `admin_operation_log` VALUES ('414', '1', 'admin/ads', 'GET', '127.0.0.1', '[]', '2020-08-04 16:01:41', '2020-08-04 16:01:41');
INSERT INTO `admin_operation_log` VALUES ('415', '1', 'admin/ads', 'GET', '127.0.0.1', '[]', '2020-08-04 16:03:18', '2020-08-04 16:03:18');
INSERT INTO `admin_operation_log` VALUES ('416', '1', 'admin/ads', 'GET', '127.0.0.1', '[]', '2020-08-04 16:04:51', '2020-08-04 16:04:51');
INSERT INTO `admin_operation_log` VALUES ('417', '1', 'admin/ads', 'GET', '127.0.0.1', '[]', '2020-08-04 16:06:45', '2020-08-04 16:06:45');
INSERT INTO `admin_operation_log` VALUES ('418', '1', 'admin/ads/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 16:06:56', '2020-08-04 16:06:56');
INSERT INTO `admin_operation_log` VALUES ('419', '1', 'admin/ads', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 16:07:12', '2020-08-04 16:07:12');
INSERT INTO `admin_operation_log` VALUES ('420', '1', 'admin/ads/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 16:07:17', '2020-08-04 16:07:17');
INSERT INTO `admin_operation_log` VALUES ('421', '1', 'admin/ads', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 16:07:36', '2020-08-04 16:07:36');
INSERT INTO `admin_operation_log` VALUES ('422', '1', 'admin/ads/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 16:07:38', '2020-08-04 16:07:38');
INSERT INTO `admin_operation_log` VALUES ('423', '1', 'admin/ads/1/edit', 'GET', '127.0.0.1', '[]', '2020-08-04 16:09:54', '2020-08-04 16:09:54');
INSERT INTO `admin_operation_log` VALUES ('424', '1', 'admin/ads/1/edit', 'GET', '127.0.0.1', '[]', '2020-08-04 16:11:35', '2020-08-04 16:11:35');
INSERT INTO `admin_operation_log` VALUES ('425', '1', 'admin/ads/1/edit', 'GET', '127.0.0.1', '[]', '2020-08-04 16:12:04', '2020-08-04 16:12:04');
INSERT INTO `admin_operation_log` VALUES ('426', '1', 'admin/ads/1/edit', 'GET', '127.0.0.1', '[]', '2020-08-04 16:12:24', '2020-08-04 16:12:24');
INSERT INTO `admin_operation_log` VALUES ('427', '1', 'admin/ads/1/edit', 'GET', '127.0.0.1', '[]', '2020-08-04 16:13:13', '2020-08-04 16:13:13');
INSERT INTO `admin_operation_log` VALUES ('428', '1', 'admin/ads', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 16:13:31', '2020-08-04 16:13:31');
INSERT INTO `admin_operation_log` VALUES ('429', '1', 'admin/ads/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 16:13:38', '2020-08-04 16:13:38');
INSERT INTO `admin_operation_log` VALUES ('430', '1', 'admin/ads', 'POST', '127.0.0.1', '{\"name\":\"guoguo\",\"image\":null,\"file-image\":null,\"_file_\":null,\"url\":\"\\/\",\"width\":\"270\",\"height\":\"430\",\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\",\"_previous_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/ads\"}', '2020-08-04 16:13:58', '2020-08-04 16:13:58');
INSERT INTO `admin_operation_log` VALUES ('431', '1', 'admin/ads', 'POST', '127.0.0.1', '{\"name\":\"guoguo\",\"image\":null,\"file-image\":null,\"_file_\":null,\"url\":\"\\/\",\"width\":\"270\",\"height\":\"430\",\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\",\"_previous_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/ads\"}', '2020-08-04 16:14:16', '2020-08-04 16:14:16');
INSERT INTO `admin_operation_log` VALUES ('432', '1', 'admin/ads', 'POST', '127.0.0.1', '{\"name\":\"guoguo\",\"image\":null,\"file-image\":null,\"_file_\":null,\"url\":\"\\/\",\"width\":\"270\",\"height\":\"430\",\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\",\"_previous_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/ads\"}', '2020-08-04 16:15:36', '2020-08-04 16:15:36');
INSERT INTO `admin_operation_log` VALUES ('433', '1', 'admin/ads', 'GET', '127.0.0.1', '[]', '2020-08-04 16:15:53', '2020-08-04 16:15:53');
INSERT INTO `admin_operation_log` VALUES ('434', '1', 'admin/ads/create', 'GET', '127.0.0.1', '[]', '2020-08-04 16:16:53', '2020-08-04 16:16:53');
INSERT INTO `admin_operation_log` VALUES ('435', '1', 'admin/ads', 'POST', '127.0.0.1', '{\"name\":\"guoguo\",\"image\":null,\"file-image\":null,\"_file_\":null,\"url\":\"\\/\",\"width\":\"825\",\"height\":\"430\",\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\",\"_previous_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/ads\"}', '2020-08-04 16:17:19', '2020-08-04 16:17:19');
INSERT INTO `admin_operation_log` VALUES ('436', '1', 'admin/ads/create', 'GET', '127.0.0.1', '[]', '2020-08-04 16:23:35', '2020-08-04 16:23:35');
INSERT INTO `admin_operation_log` VALUES ('437', '1', 'admin/ads', 'POST', '127.0.0.1', '{\"name\":\"guoguo\",\"image\":null,\"file-image\":null,\"_file_\":null,\"url\":\"\\/\",\"width\":\"825\",\"height\":\"160\",\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\"}', '2020-08-04 16:24:26', '2020-08-04 16:24:26');
INSERT INTO `admin_operation_log` VALUES ('438', '1', 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 16:28:12', '2020-08-04 16:28:12');
INSERT INTO `admin_operation_log` VALUES ('439', '1', 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\",\"_parent_id_\":\"40\",\"_tier_\":\"1\",\"_children_page_40\":\"1\"}', '2020-08-04 16:28:17', '2020-08-04 16:28:17');
INSERT INTO `admin_operation_log` VALUES ('440', '1', 'admin/categories', 'GET', '127.0.0.1', '{\"_parent_id_\":\"41\",\"_pjax\":\"#pjax-container\",\"_tier_\":\"2\",\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\",\"_children_page_41\":\"1\"}', '2020-08-04 16:28:20', '2020-08-04 16:28:20');
INSERT INTO `admin_operation_log` VALUES ('441', '1', 'admin/categories', 'GET', '127.0.0.1', '[]', '2020-08-04 16:29:26', '2020-08-04 16:29:26');
INSERT INTO `admin_operation_log` VALUES ('442', '1', 'admin/categories', 'GET', '127.0.0.1', '[]', '2020-08-04 16:30:32', '2020-08-04 16:30:32');
INSERT INTO `admin_operation_log` VALUES ('443', '1', 'admin/categories', 'GET', '127.0.0.1', '{\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\",\"_parent_id_\":\"42\",\"_tier_\":\"1\",\"_children_page_42\":\"1\"}', '2020-08-04 16:30:43', '2020-08-04 16:30:43');
INSERT INTO `admin_operation_log` VALUES ('444', '1', 'admin/categories', 'GET', '127.0.0.1', '[]', '2020-08-04 16:35:55', '2020-08-04 16:35:55');
INSERT INTO `admin_operation_log` VALUES ('445', '1', 'admin/categories', 'GET', '127.0.0.1', '{\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\",\"_parent_id_\":\"42\",\"_tier_\":\"1\",\"_children_page_42\":\"1\"}', '2020-08-04 16:35:59', '2020-08-04 16:35:59');
INSERT INTO `admin_operation_log` VALUES ('446', '1', 'admin/categories', 'GET', '127.0.0.1', '{\"_parent_id_\":\"40\",\"_tier_\":\"1\",\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\",\"_children_page_40\":\"1\"}', '2020-08-04 16:36:16', '2020-08-04 16:36:16');
INSERT INTO `admin_operation_log` VALUES ('447', '1', 'admin/categories', 'GET', '127.0.0.1', '{\"_parent_id_\":\"41\",\"_tier_\":\"2\",\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\",\"_children_page_41\":\"1\"}', '2020-08-04 16:36:20', '2020-08-04 16:36:20');
INSERT INTO `admin_operation_log` VALUES ('448', '1', 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 16:39:43', '2020-08-04 16:39:43');
INSERT INTO `admin_operation_log` VALUES ('449', '1', 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 16:39:45', '2020-08-04 16:39:45');
INSERT INTO `admin_operation_log` VALUES ('450', '1', 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 16:39:46', '2020-08-04 16:39:46');
INSERT INTO `admin_operation_log` VALUES ('451', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 16:39:48', '2020-08-04 16:39:48');
INSERT INTO `admin_operation_log` VALUES ('452', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 16:39:53', '2020-08-04 16:39:53');
INSERT INTO `admin_operation_log` VALUES ('453', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 16:40:02', '2020-08-04 16:40:02');
INSERT INTO `admin_operation_log` VALUES ('454', '1', 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 16:40:04', '2020-08-04 16:40:04');
INSERT INTO `admin_operation_log` VALUES ('455', '1', 'admin/ads', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 16:40:11', '2020-08-04 16:40:11');
INSERT INTO `admin_operation_log` VALUES ('456', '1', 'admin/ads/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 16:40:16', '2020-08-04 16:40:16');
INSERT INTO `admin_operation_log` VALUES ('457', '1', 'admin/ads/create', 'GET', '127.0.0.1', '[]', '2020-08-04 16:41:01', '2020-08-04 16:41:01');
INSERT INTO `admin_operation_log` VALUES ('458', '1', 'admin/ads', 'POST', '127.0.0.1', '{\"_id\":\"VEwEZVVMwUmwifoL\",\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\",\"upload_column\":\"image\",\"id\":\"WU_FILE_1\",\"name\":\"201547984175138385.png\",\"type\":\"image\\/png\",\"lastModifiedDate\":\"Mon Jul 08 2019 12:55:58 GMT+0800 (\\u4e2d\\u56fd\\u6807\\u51c6\\u65f6\\u95f4)\",\"size\":\"3126\"}', '2020-08-04 16:41:27', '2020-08-04 16:41:27');
INSERT INTO `admin_operation_log` VALUES ('459', '1', 'admin/ads', 'POST', '127.0.0.1', '{\"name\":\"guoguo\",\"image\":\"ads\\/929134a4f4da09c8a3e65b0f57cbdae5.png\",\"file-image\":null,\"_file_\":null,\"url\":\"\\/\",\"width\":\"270\",\"height\":\"530\",\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\"}', '2020-08-04 16:41:38', '2020-08-04 16:41:38');
INSERT INTO `admin_operation_log` VALUES ('460', '1', 'admin/ads', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 16:41:39', '2020-08-04 16:41:39');
INSERT INTO `admin_operation_log` VALUES ('461', '1', 'admin/ads/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 16:41:47', '2020-08-04 16:41:47');
INSERT INTO `admin_operation_log` VALUES ('462', '1', 'admin/ads', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 16:41:58', '2020-08-04 16:41:58');
INSERT INTO `admin_operation_log` VALUES ('463', '1', 'admin/ads/14/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 16:42:01', '2020-08-04 16:42:01');
INSERT INTO `admin_operation_log` VALUES ('464', '1', 'admin/ads/14', 'PUT', '127.0.0.1', '{\"_file_del_\":null,\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\",\"_method\":\"PUT\",\"key\":\"ads\\/929134a4f4da09c8a3e65b0f57cbdae5.png\",\"_column\":\"image\"}', '2020-08-04 16:42:12', '2020-08-04 16:42:12');
INSERT INTO `admin_operation_log` VALUES ('465', '1', 'admin/ads/14/edit', 'GET', '127.0.0.1', '[]', '2020-08-04 16:42:22', '2020-08-04 16:42:22');
INSERT INTO `admin_operation_log` VALUES ('466', '1', 'admin/ads/14/edit', 'GET', '127.0.0.1', '[]', '2020-08-04 16:43:00', '2020-08-04 16:43:00');
INSERT INTO `admin_operation_log` VALUES ('467', '1', 'admin/ads/14', 'PUT', '127.0.0.1', '{\"_id\":\"XYkV7ZPiiqqcEOew\",\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\",\"upload_column\":\"image\",\"_method\":\"PUT\",\"id\":\"WU_FILE_0\",\"name\":\"201547983839832880.png\",\"type\":\"image\\/png\",\"lastModifiedDate\":\"Mon Jul 08 2019 12:55:58 GMT+0800 (\\u4e2d\\u56fd\\u6807\\u51c6\\u65f6\\u95f4)\",\"size\":\"21737\"}', '2020-08-04 16:43:07', '2020-08-04 16:43:07');
INSERT INTO `admin_operation_log` VALUES ('468', '1', 'admin/ads/14', 'PUT', '127.0.0.1', '{\"_id\":\"XYkV7ZPiiqqcEOew\",\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\",\"_method\":\"PUT\",\"image\":\"ads\\/a144e1d3804dfce4d2f3ee1d3ecd2196.png\"}', '2020-08-04 16:43:07', '2020-08-04 16:43:07');
INSERT INTO `admin_operation_log` VALUES ('469', '1', 'admin/ads/14', 'PUT', '127.0.0.1', '{\"name\":\"guoguo\",\"image\":\"ads\\/a144e1d3804dfce4d2f3ee1d3ecd2196.png\",\"file-image\":null,\"_file_\":null,\"url\":\"\\/\",\"width\":\"270\",\"height\":\"530\",\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\",\"_method\":\"PUT\"}', '2020-08-04 16:43:10', '2020-08-04 16:43:10');
INSERT INTO `admin_operation_log` VALUES ('470', '1', 'admin/ads', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 16:43:10', '2020-08-04 16:43:10');
INSERT INTO `admin_operation_log` VALUES ('471', '1', 'admin/ads/14/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 16:43:37', '2020-08-04 16:43:37');
INSERT INTO `admin_operation_log` VALUES ('472', '1', 'admin/ads/14', 'PUT', '127.0.0.1', '{\"_file_del_\":null,\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\",\"_method\":\"PUT\",\"key\":\"ads\\/a144e1d3804dfce4d2f3ee1d3ecd2196.png\",\"_column\":\"image\"}', '2020-08-04 16:43:52', '2020-08-04 16:43:52');
INSERT INTO `admin_operation_log` VALUES ('473', '1', 'admin/ads/14', 'PUT', '127.0.0.1', '{\"_file_del_\":null,\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\",\"_method\":\"PUT\",\"key\":\"ads\\/a144e1d3804dfce4d2f3ee1d3ecd2196.png\",\"_column\":\"image\"}', '2020-08-04 16:44:36', '2020-08-04 16:44:36');
INSERT INTO `admin_operation_log` VALUES ('474', '1', 'admin/ads/14', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\"}', '2020-08-04 16:44:45', '2020-08-04 16:44:45');
INSERT INTO `admin_operation_log` VALUES ('475', '1', 'admin/ads', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 16:44:46', '2020-08-04 16:44:46');
INSERT INTO `admin_operation_log` VALUES ('476', '1', 'admin/ads/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 16:46:12', '2020-08-04 16:46:12');
INSERT INTO `admin_operation_log` VALUES ('477', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 16:54:46', '2020-08-04 16:54:46');
INSERT INTO `admin_operation_log` VALUES ('478', '1', 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":null,\"title\":\"\\u54c1\\u724c\\u7ba1\\u7406\",\"icon\":\"fa-500px\",\"uri\":\"\\/brands\",\"roles\":[null],\"permissions\":null,\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\"}', '2020-08-04 16:56:09', '2020-08-04 16:56:09');
INSERT INTO `admin_operation_log` VALUES ('479', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-08-04 16:56:11', '2020-08-04 16:56:11');
INSERT INTO `admin_operation_log` VALUES ('480', '1', 'admin/brands', 'GET', '127.0.0.1', '[]', '2020-08-04 16:57:04', '2020-08-04 16:57:04');
INSERT INTO `admin_operation_log` VALUES ('481', '1', 'admin/brands/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 16:57:10', '2020-08-04 16:57:10');
INSERT INTO `admin_operation_log` VALUES ('482', '1', 'admin/brands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 16:58:15', '2020-08-04 16:58:15');
INSERT INTO `admin_operation_log` VALUES ('483', '1', 'admin/brands/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 16:58:22', '2020-08-04 16:58:22');
INSERT INTO `admin_operation_log` VALUES ('484', '1', 'admin/brands', 'POST', '127.0.0.1', '{\"_id\":\"yW7GpDk2OhqdL9vd\",\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\",\"upload_column\":\"image\",\"id\":\"WU_FILE_0\",\"name\":\"201547985349125450.png\",\"type\":\"image\\/png\",\"lastModifiedDate\":\"Mon Jul 08 2019 12:55:58 GMT+0800 (\\u4e2d\\u56fd\\u6807\\u51c6\\u65f6\\u95f4)\",\"size\":\"11827\"}', '2020-08-04 16:58:31', '2020-08-04 16:58:31');
INSERT INTO `admin_operation_log` VALUES ('485', '1', 'admin/brands', 'POST', '127.0.0.1', '{\"name\":\"guoguo\",\"image\":\"brands\\/02c2b224d747c1e06782c11df7a3fb71.png\",\"file-image\":null,\"_file_\":null,\"url\":\"\\/\",\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\",\"_previous_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/brands\"}', '2020-08-04 16:58:34', '2020-08-04 16:58:34');
INSERT INTO `admin_operation_log` VALUES ('486', '1', 'admin/brands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 16:58:34', '2020-08-04 16:58:34');
INSERT INTO `admin_operation_log` VALUES ('487', '1', 'admin/brands/8/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 16:58:37', '2020-08-04 16:58:37');
INSERT INTO `admin_operation_log` VALUES ('488', '1', 'admin/brands/8', 'PUT', '127.0.0.1', '{\"_file_del_\":null,\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\",\"_method\":\"PUT\",\"key\":\"brands\\/02c2b224d747c1e06782c11df7a3fb71.png\",\"_column\":\"image\"}', '2020-08-04 16:58:53', '2020-08-04 16:58:53');
INSERT INTO `admin_operation_log` VALUES ('489', '1', 'admin/brands/8', 'PUT', '127.0.0.1', '{\"_id\":\"des2KIZSnD6qjNBx\",\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\",\"upload_column\":\"image\",\"_method\":\"PUT\",\"id\":\"WU_FILE_1\",\"name\":\"201547983839832880.png\",\"type\":\"image\\/png\",\"lastModifiedDate\":\"Mon Jul 08 2019 12:55:58 GMT+0800 (\\u4e2d\\u56fd\\u6807\\u51c6\\u65f6\\u95f4)\",\"size\":\"21737\"}', '2020-08-04 16:59:00', '2020-08-04 16:59:00');
INSERT INTO `admin_operation_log` VALUES ('490', '1', 'admin/brands/8', 'PUT', '127.0.0.1', '{\"_id\":\"des2KIZSnD6qjNBx\",\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\",\"_method\":\"PUT\",\"image\":\"brands\\/19d04b7c8d52970ed1047f8b9c178a63.png\"}', '2020-08-04 16:59:00', '2020-08-04 16:59:00');
INSERT INTO `admin_operation_log` VALUES ('491', '1', 'admin/brands/8', 'PUT', '127.0.0.1', '{\"name\":\"guoguo\",\"image\":\"brands\\/19d04b7c8d52970ed1047f8b9c178a63.png\",\"file-image\":null,\"_file_\":null,\"url\":\"\\/\",\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/brands\"}', '2020-08-04 16:59:01', '2020-08-04 16:59:01');
INSERT INTO `admin_operation_log` VALUES ('492', '1', 'admin/brands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 16:59:01', '2020-08-04 16:59:01');
INSERT INTO `admin_operation_log` VALUES ('493', '1', 'admin/brands/8', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\"}', '2020-08-04 16:59:04', '2020-08-04 16:59:04');
INSERT INTO `admin_operation_log` VALUES ('494', '1', 'admin/brands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 16:59:05', '2020-08-04 16:59:05');
INSERT INTO `admin_operation_log` VALUES ('495', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 17:10:24', '2020-08-04 17:10:24');
INSERT INTO `admin_operation_log` VALUES ('496', '1', 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":null,\"title\":\"\\u5546\\u54c1\\u7ba1\\u7406\",\"icon\":\"fa-cubes\",\"uri\":null,\"roles\":[null],\"permissions\":null,\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\"}', '2020-08-04 17:10:56', '2020-08-04 17:10:56');
INSERT INTO `admin_operation_log` VALUES ('497', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-08-04 17:10:58', '2020-08-04 17:10:58');
INSERT INTO `admin_operation_log` VALUES ('498', '1', 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"12\",\"title\":\"\\u666e\\u901a\\u5546\\u54c1\",\"icon\":\"fa-cubes\",\"uri\":\"\\/products\",\"roles\":[null],\"permissions\":null,\"_token\":\"dkFBVl9tPqdaPIt7CPm5ghihd9wzi4ov0ekEo4uw\"}', '2020-08-04 17:11:17', '2020-08-04 17:11:17');
INSERT INTO `admin_operation_log` VALUES ('499', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-08-04 17:11:19', '2020-08-04 17:11:19');
INSERT INTO `admin_operation_log` VALUES ('500', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-04 17:12:12', '2020-08-04 17:12:12');
INSERT INTO `admin_operation_log` VALUES ('501', '1', 'admin/brands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 17:12:31', '2020-08-04 17:12:31');
INSERT INTO `admin_operation_log` VALUES ('502', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 17:12:33', '2020-08-04 17:12:33');
INSERT INTO `admin_operation_log` VALUES ('503', '1', 'admin/brands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 17:12:35', '2020-08-04 17:12:35');
INSERT INTO `admin_operation_log` VALUES ('504', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 17:12:41', '2020-08-04 17:12:41');
INSERT INTO `admin_operation_log` VALUES ('505', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-04 17:13:33', '2020-08-04 17:13:33');
INSERT INTO `admin_operation_log` VALUES ('506', '1', 'admin/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 17:13:42', '2020-08-04 17:13:42');
INSERT INTO `admin_operation_log` VALUES ('507', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 17:15:38', '2020-08-04 17:15:38');
INSERT INTO `admin_operation_log` VALUES ('508', '1', 'admin/products/98/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 17:15:41', '2020-08-04 17:15:41');
INSERT INTO `admin_operation_log` VALUES ('509', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 17:15:48', '2020-08-04 17:15:48');
INSERT INTO `admin_operation_log` VALUES ('510', '1', 'admin/products/82/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 17:15:53', '2020-08-04 17:15:53');
INSERT INTO `admin_operation_log` VALUES ('511', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 17:16:02', '2020-08-04 17:16:02');
INSERT INTO `admin_operation_log` VALUES ('512', '1', 'admin/products/79/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 17:16:07', '2020-08-04 17:16:07');
INSERT INTO `admin_operation_log` VALUES ('513', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 17:16:21', '2020-08-04 17:16:21');
INSERT INTO `admin_operation_log` VALUES ('514', '1', 'admin/products/79/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 17:16:25', '2020-08-04 17:16:25');
INSERT INTO `admin_operation_log` VALUES ('515', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 17:16:31', '2020-08-04 17:16:31');
INSERT INTO `admin_operation_log` VALUES ('516', '1', 'admin/products/79/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 17:16:37', '2020-08-04 17:16:37');
INSERT INTO `admin_operation_log` VALUES ('517', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 17:16:58', '2020-08-04 17:16:58');
INSERT INTO `admin_operation_log` VALUES ('518', '1', 'admin/products/98/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 17:17:44', '2020-08-04 17:17:44');
INSERT INTO `admin_operation_log` VALUES ('519', '1', 'admin/products/98/edit', 'GET', '127.0.0.1', '[]', '2020-08-04 17:18:53', '2020-08-04 17:18:53');
INSERT INTO `admin_operation_log` VALUES ('520', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-04 17:18:59', '2020-08-04 17:18:59');
INSERT INTO `admin_operation_log` VALUES ('521', '0', 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2020-08-05 09:05:03', '2020-08-05 09:05:03');
INSERT INTO `admin_operation_log` VALUES ('522', '0', 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"3rpDbM2RCkKTjaX8bwVWtPrXnCYVcyZ9wPaNJLrg\",\"username\":\"admin\",\"password\":\"adm******\"}', '2020-08-05 09:05:16', '2020-08-05 09:05:16');
INSERT INTO `admin_operation_log` VALUES ('523', '0', 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"3rpDbM2RCkKTjaX8bwVWtPrXnCYVcyZ9wPaNJLrg\",\"username\":\"admin\",\"password\":\"adm******\"}', '2020-08-05 09:05:16', '2020-08-05 09:05:16');
INSERT INTO `admin_operation_log` VALUES ('524', '0', 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"3rpDbM2RCkKTjaX8bwVWtPrXnCYVcyZ9wPaNJLrg\",\"username\":\"admin\",\"password\":\"adm******\"}', '2020-08-05 09:05:16', '2020-08-05 09:05:16');
INSERT INTO `admin_operation_log` VALUES ('525', '0', 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"3rpDbM2RCkKTjaX8bwVWtPrXnCYVcyZ9wPaNJLrg\",\"username\":\"admin\",\"password\":\"adm******\"}', '2020-08-05 09:05:16', '2020-08-05 09:05:16');
INSERT INTO `admin_operation_log` VALUES ('526', '0', 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"3rpDbM2RCkKTjaX8bwVWtPrXnCYVcyZ9wPaNJLrg\",\"username\":\"admin\",\"password\":\"adm******\"}', '2020-08-05 09:05:16', '2020-08-05 09:05:16');
INSERT INTO `admin_operation_log` VALUES ('527', '0', 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"3rpDbM2RCkKTjaX8bwVWtPrXnCYVcyZ9wPaNJLrg\",\"username\":\"admin\",\"password\":\"adm******\"}', '2020-08-05 09:05:17', '2020-08-05 09:05:17');
INSERT INTO `admin_operation_log` VALUES ('528', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-08-05 09:05:19', '2020-08-05 09:05:19');
INSERT INTO `admin_operation_log` VALUES ('529', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-08-05 09:05:19', '2020-08-05 09:05:19');
INSERT INTO `admin_operation_log` VALUES ('530', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-08-05 09:05:19', '2020-08-05 09:05:19');
INSERT INTO `admin_operation_log` VALUES ('531', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-08-05 09:05:19', '2020-08-05 09:05:19');
INSERT INTO `admin_operation_log` VALUES ('532', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-08-05 09:05:19', '2020-08-05 09:05:19');
INSERT INTO `admin_operation_log` VALUES ('533', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-08-05 09:05:19', '2020-08-05 09:05:19');
INSERT INTO `admin_operation_log` VALUES ('534', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 09:05:30', '2020-08-05 09:05:30');
INSERT INTO `admin_operation_log` VALUES ('535', '1', 'admin/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 09:10:58', '2020-08-05 09:10:58');
INSERT INTO `admin_operation_log` VALUES ('536', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 09:40:21', '2020-08-05 09:40:21');
INSERT INTO `admin_operation_log` VALUES ('537', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-05 09:40:22', '2020-08-05 09:40:22');
INSERT INTO `admin_operation_log` VALUES ('538', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-05 09:40:57', '2020-08-05 09:40:57');
INSERT INTO `admin_operation_log` VALUES ('539', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-05 09:41:18', '2020-08-05 09:41:18');
INSERT INTO `admin_operation_log` VALUES ('540', '1', 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 09:44:54', '2020-08-05 09:44:54');
INSERT INTO `admin_operation_log` VALUES ('541', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 09:45:51', '2020-08-05 09:45:51');
INSERT INTO `admin_operation_log` VALUES ('542', '1', 'admin/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 09:45:53', '2020-08-05 09:45:53');
INSERT INTO `admin_operation_log` VALUES ('543', '1', 'admin/products/create', 'GET', '127.0.0.1', '[]', '2020-08-05 09:47:28', '2020-08-05 09:47:28');
INSERT INTO `admin_operation_log` VALUES ('544', '1', 'admin/api/categories', 'GET', '127.0.0.1', '{\"is_directory\":\"0\",\"q\":\"z\"}', '2020-08-05 09:47:32', '2020-08-05 09:47:32');
INSERT INTO `admin_operation_log` VALUES ('545', '1', 'admin/api/categories', 'GET', '127.0.0.1', '{\"is_directory\":\"0\",\"q\":\"zhi\"}', '2020-08-05 09:47:32', '2020-08-05 09:47:32');
INSERT INTO `admin_operation_log` VALUES ('546', '1', 'admin/api/categories', 'GET', '127.0.0.1', '{\"is_directory\":\"0\",\"q\":\"zhineng\"}', '2020-08-05 09:47:33', '2020-08-05 09:47:33');
INSERT INTO `admin_operation_log` VALUES ('547', '1', 'admin/api/categories', 'GET', '127.0.0.1', '{\"is_directory\":\"0\",\"q\":\"zhinengj\"}', '2020-08-05 09:47:33', '2020-08-05 09:47:33');
INSERT INTO `admin_operation_log` VALUES ('548', '1', 'admin/api/categories', 'GET', '127.0.0.1', '{\"is_directory\":\"0\",\"q\":\"\\u667a\\u80fd\\u673a\"}', '2020-08-05 09:47:34', '2020-08-05 09:47:34');
INSERT INTO `admin_operation_log` VALUES ('549', '1', 'admin/products', 'POST', '127.0.0.1', '{\"_id\":\"UL8OIWwKRhfKqQfR\",\"_token\":\"uW6w35Mzc84dEx8kDDLPaqwQhp3llpPzEAev6X3S\",\"upload_column\":\"image\",\"id\":\"WU_FILE_0\",\"name\":\"ceMtdsu2CWHAA.jpg\",\"type\":\"image\\/jpeg\",\"lastModifiedDate\":\"Wed Aug 05 2020 09:46:37 GMT+0800 (\\u4e2d\\u56fd\\u6807\\u51c6\\u65f6\\u95f4)\",\"size\":\"55579\"}', '2020-08-05 09:48:48', '2020-08-05 09:48:48');
INSERT INTO `admin_operation_log` VALUES ('550', '1', 'admin/products', 'POST', '127.0.0.1', '{\"type\":\"normal\",\"id\":null,\"title\":\"\\u82f9\\u679ciPhone 11\",\"category_id\":\"25\",\"image\":\"product\\/ed92701791f2c6bcbf570b3632329d34.jpg\",\"file-image\":null,\"_file_\":null,\"description\":\"121212\",\"on_sale\":\"1\",\"recommend\":\"1\",\"skus\":{\"new_1\":{\"title\":\"4GB\\/64GB\",\"description\":\"4GB\\/64GB\",\"price\":\"6000\",\"original_price\":\"0\",\"stock\":\"11\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"uW6w35Mzc84dEx8kDDLPaqwQhp3llpPzEAev6X3S\"}', '2020-08-05 09:49:29', '2020-08-05 09:49:29');
INSERT INTO `admin_operation_log` VALUES ('551', '1', 'admin/products', 'POST', '127.0.0.1', '{\"type\":\"normal\",\"id\":null,\"title\":\"\\u82f9\\u679ciPhone 11\",\"category_id\":\"25\",\"image\":\"product\\/ed92701791f2c6bcbf570b3632329d34.jpg\",\"file-image\":null,\"_file_\":null,\"description\":\"121212\",\"on_sale\":\"1\",\"recommend\":\"1\",\"skus\":{\"new_1\":{\"title\":\"4GB\\/64GB\",\"description\":\"4GB\\/64GB\",\"price\":\"6000\",\"original_price\":\"0\",\"stock\":\"11\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"uW6w35Mzc84dEx8kDDLPaqwQhp3llpPzEAev6X3S\"}', '2020-08-05 09:52:15', '2020-08-05 09:52:15');
INSERT INTO `admin_operation_log` VALUES ('552', '1', 'admin/products', 'POST', '127.0.0.1', '{\"type\":\"normal\",\"id\":null,\"title\":\"\\u82f9\\u679ciPhone 11\",\"category_id\":\"25\",\"image\":\"product\\/ed92701791f2c6bcbf570b3632329d34.jpg\",\"file-image\":null,\"_file_\":null,\"description\":\"121212\",\"on_sale\":\"1\",\"recommend\":\"1\",\"skus\":{\"new_1\":{\"title\":\"4GB\\/64GB\",\"description\":\"4GB\\/64GB\",\"price\":\"6000\",\"original_price\":\"0\",\"stock\":\"11\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"uW6w35Mzc84dEx8kDDLPaqwQhp3llpPzEAev6X3S\"}', '2020-08-05 09:53:47', '2020-08-05 09:53:47');
INSERT INTO `admin_operation_log` VALUES ('553', '1', 'admin/products', 'POST', '127.0.0.1', '{\"type\":\"normal\",\"id\":null,\"title\":\"\\u82f9\\u679ciPhone 11\",\"category_id\":\"25\",\"image\":\"product\\/ed92701791f2c6bcbf570b3632329d34.jpg\",\"file-image\":null,\"_file_\":null,\"description\":\"121212\",\"on_sale\":\"1\",\"recommend\":\"1\",\"skus\":{\"new_1\":{\"title\":\"4GB\\/64GB\",\"description\":\"4GB\\/64GB\",\"price\":\"6000\",\"original_price\":\"0\",\"stock\":\"11\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"uW6w35Mzc84dEx8kDDLPaqwQhp3llpPzEAev6X3S\"}', '2020-08-05 09:54:45', '2020-08-05 09:54:45');
INSERT INTO `admin_operation_log` VALUES ('554', '1', 'admin/products', 'POST', '127.0.0.1', '{\"type\":\"normal\",\"id\":null,\"title\":\"\\u82f9\\u679ciPhone 11\",\"category_id\":\"25\",\"image\":\"product\\/ed92701791f2c6bcbf570b3632329d34.jpg\",\"file-image\":null,\"_file_\":null,\"description\":\"121212\",\"on_sale\":\"1\",\"recommend\":\"1\",\"skus\":{\"new_1\":{\"title\":\"4GB\\/64GB\",\"description\":\"4GB\\/64GB\",\"price\":\"6000\",\"original_price\":\"0\",\"stock\":\"11\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"uW6w35Mzc84dEx8kDDLPaqwQhp3llpPzEAev6X3S\"}', '2020-08-05 09:56:54', '2020-08-05 09:56:54');
INSERT INTO `admin_operation_log` VALUES ('555', '1', 'admin/products', 'POST', '127.0.0.1', '{\"type\":\"normal\",\"id\":null,\"title\":\"\\u82f9\\u679ciPhone 11\",\"category_id\":\"25\",\"image\":\"product\\/ed92701791f2c6bcbf570b3632329d34.jpg\",\"file-image\":null,\"_file_\":null,\"description\":\"121212\",\"on_sale\":\"1\",\"recommend\":\"1\",\"skus\":{\"new_1\":{\"title\":\"4GB\\/64GB\",\"description\":\"4GB\\/64GB\",\"price\":\"6000\",\"original_price\":\"0\",\"stock\":\"11\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"uW6w35Mzc84dEx8kDDLPaqwQhp3llpPzEAev6X3S\"}', '2020-08-05 09:57:15', '2020-08-05 09:57:15');
INSERT INTO `admin_operation_log` VALUES ('556', '1', 'admin/products', 'POST', '127.0.0.1', '{\"type\":\"normal\",\"id\":null,\"title\":\"\\u82f9\\u679ciPhone 11\",\"category_id\":\"25\",\"image\":\"product\\/ed92701791f2c6bcbf570b3632329d34.jpg\",\"file-image\":null,\"_file_\":null,\"description\":\"121212\",\"on_sale\":\"1\",\"recommend\":\"1\",\"skus\":{\"new_1\":{\"title\":\"4GB\\/64GB\",\"description\":\"4GB\\/64GB\",\"price\":\"6000\",\"original_price\":\"0\",\"stock\":\"11\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"uW6w35Mzc84dEx8kDDLPaqwQhp3llpPzEAev6X3S\"}', '2020-08-05 09:57:33', '2020-08-05 09:57:33');
INSERT INTO `admin_operation_log` VALUES ('557', '1', 'admin/products', 'POST', '127.0.0.1', '{\"type\":\"normal\",\"id\":null,\"title\":\"\\u82f9\\u679ciPhone 11\",\"category_id\":\"25\",\"image\":\"product\\/ed92701791f2c6bcbf570b3632329d34.jpg\",\"file-image\":null,\"_file_\":null,\"description\":\"121212\",\"on_sale\":\"1\",\"recommend\":\"1\",\"skus\":{\"new_1\":{\"title\":\"4GB\\/64GB\",\"description\":\"4GB\\/64GB\",\"price\":\"6000\",\"original_price\":\"0\",\"stock\":\"11\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"uW6w35Mzc84dEx8kDDLPaqwQhp3llpPzEAev6X3S\"}', '2020-08-05 09:57:47', '2020-08-05 09:57:47');
INSERT INTO `admin_operation_log` VALUES ('558', '1', 'admin/products', 'POST', '127.0.0.1', '{\"type\":\"normal\",\"id\":null,\"title\":\"\\u82f9\\u679ciPhone 11\",\"category_id\":\"25\",\"image\":\"product\\/ed92701791f2c6bcbf570b3632329d34.jpg\",\"file-image\":null,\"_file_\":null,\"description\":\"121212\",\"on_sale\":\"1\",\"recommend\":\"1\",\"skus\":{\"new_1\":{\"title\":\"4GB\\/64GB\",\"description\":\"4GB\\/64GB\",\"price\":\"6000\",\"original_price\":\"0\",\"stock\":\"11\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"uW6w35Mzc84dEx8kDDLPaqwQhp3llpPzEAev6X3S\"}', '2020-08-05 09:58:17', '2020-08-05 09:58:17');
INSERT INTO `admin_operation_log` VALUES ('559', '1', 'admin/products', 'POST', '127.0.0.1', '{\"type\":\"normal\",\"id\":null,\"title\":\"\\u82f9\\u679ciPhone 11\",\"category_id\":\"25\",\"image\":\"product\\/ed92701791f2c6bcbf570b3632329d34.jpg\",\"file-image\":null,\"_file_\":null,\"description\":\"121212\",\"on_sale\":\"1\",\"recommend\":\"1\",\"skus\":{\"new_1\":{\"title\":\"4GB\\/64GB\",\"description\":\"4GB\\/64GB\",\"price\":\"6000\",\"original_price\":\"0\",\"stock\":\"11\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"uW6w35Mzc84dEx8kDDLPaqwQhp3llpPzEAev6X3S\"}', '2020-08-05 09:58:42', '2020-08-05 09:58:42');
INSERT INTO `admin_operation_log` VALUES ('560', '1', 'admin/products', 'POST', '127.0.0.1', '{\"type\":\"normal\",\"id\":null,\"title\":\"\\u82f9\\u679ciPhone 11\",\"category_id\":\"25\",\"image\":\"product\\/ed92701791f2c6bcbf570b3632329d34.jpg\",\"file-image\":null,\"_file_\":null,\"description\":\"121212\",\"on_sale\":\"1\",\"recommend\":\"1\",\"skus\":{\"new_1\":{\"title\":\"4GB\\/64GB\",\"description\":\"4GB\\/64GB\",\"price\":\"6000\",\"original_price\":\"0\",\"stock\":\"11\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"uW6w35Mzc84dEx8kDDLPaqwQhp3llpPzEAev6X3S\"}', '2020-08-05 09:59:03', '2020-08-05 09:59:03');
INSERT INTO `admin_operation_log` VALUES ('561', '1', 'admin/products', 'POST', '127.0.0.1', '{\"type\":\"normal\",\"id\":null,\"title\":\"\\u82f9\\u679ciPhone 11\",\"category_id\":\"25\",\"image\":\"product\\/ed92701791f2c6bcbf570b3632329d34.jpg\",\"file-image\":null,\"_file_\":null,\"description\":\"121212\",\"on_sale\":\"1\",\"recommend\":\"1\",\"skus\":{\"new_1\":{\"title\":\"4GB\\/64GB\",\"description\":\"4GB\\/64GB\",\"price\":\"6000\",\"original_price\":\"0\",\"stock\":\"11\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"uW6w35Mzc84dEx8kDDLPaqwQhp3llpPzEAev6X3S\"}', '2020-08-05 09:59:53', '2020-08-05 09:59:53');
INSERT INTO `admin_operation_log` VALUES ('562', '1', 'admin/products', 'POST', '127.0.0.1', '{\"type\":\"normal\",\"id\":null,\"title\":\"\\u82f9\\u679ciPhone 11\",\"category_id\":\"25\",\"image\":\"product\\/ed92701791f2c6bcbf570b3632329d34.jpg\",\"file-image\":null,\"_file_\":null,\"description\":\"121212\",\"on_sale\":\"1\",\"recommend\":\"1\",\"skus\":{\"new_1\":{\"title\":\"4GB\\/64GB\",\"description\":\"4GB\\/64GB\",\"price\":\"6000\",\"original_price\":\"0\",\"stock\":\"11\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"uW6w35Mzc84dEx8kDDLPaqwQhp3llpPzEAev6X3S\"}', '2020-08-05 10:00:13', '2020-08-05 10:00:13');
INSERT INTO `admin_operation_log` VALUES ('563', '1', 'admin/products/create', 'GET', '127.0.0.1', '[]', '2020-08-05 10:01:41', '2020-08-05 10:01:41');
INSERT INTO `admin_operation_log` VALUES ('564', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-08-05 10:05:51', '2020-08-05 10:05:51');
INSERT INTO `admin_operation_log` VALUES ('565', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 10:05:58', '2020-08-05 10:05:58');
INSERT INTO `admin_operation_log` VALUES ('566', '1', 'admin/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 10:06:00', '2020-08-05 10:06:00');
INSERT INTO `admin_operation_log` VALUES ('567', '1', 'admin/api/categories', 'GET', '127.0.0.1', '{\"is_directory\":\"0\",\"q\":\"zhineng\"}', '2020-08-05 10:06:16', '2020-08-05 10:06:16');
INSERT INTO `admin_operation_log` VALUES ('568', '1', 'admin/api/categories', 'GET', '127.0.0.1', '{\"is_directory\":\"0\",\"q\":\"\\u667a\\u80fd\\u673a\"}', '2020-08-05 10:06:17', '2020-08-05 10:06:17');
INSERT INTO `admin_operation_log` VALUES ('569', '1', 'admin/products', 'POST', '127.0.0.1', '{\"type\":\"normal\",\"id\":null,\"title\":\"\\u82f9\\u679ciPhone 11\",\"category_id\":\"25\",\"image\":null,\"file-image\":null,\"_file_\":null,\"description\":\"\\u8bd5\\u8bd5\",\"on_sale\":\"1\",\"recommend\":\"1\",\"skus\":{\"new_1\":{\"title\":\"4GB\\/64GB\",\"description\":\"4GB\\/64GB\",\"price\":\"6000\",\"original_price\":\"0\",\"stock\":\"10\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"uW6w35Mzc84dEx8kDDLPaqwQhp3llpPzEAev6X3S\",\"_previous_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/products\"}', '2020-08-05 10:06:53', '2020-08-05 10:06:53');
INSERT INTO `admin_operation_log` VALUES ('570', '1', 'admin/products/create', 'GET', '127.0.0.1', '[]', '2020-08-05 10:07:44', '2020-08-05 10:07:44');
INSERT INTO `admin_operation_log` VALUES ('571', '1', 'admin/api/categories', 'GET', '127.0.0.1', '{\"is_directory\":\"0\",\"q\":\"z\"}', '2020-08-05 10:08:05', '2020-08-05 10:08:05');
INSERT INTO `admin_operation_log` VALUES ('572', '1', 'admin/api/categories', 'GET', '127.0.0.1', '{\"is_directory\":\"0\",\"q\":\"zhi\"}', '2020-08-05 10:08:06', '2020-08-05 10:08:06');
INSERT INTO `admin_operation_log` VALUES ('573', '1', 'admin/api/categories', 'GET', '127.0.0.1', '{\"is_directory\":\"0\",\"q\":\"\\u667a\\u80fd\\u673a\"}', '2020-08-05 10:08:07', '2020-08-05 10:08:07');
INSERT INTO `admin_operation_log` VALUES ('574', '1', 'admin/products', 'POST', '127.0.0.1', '{\"_id\":\"7H5trx8QwbrDKohb\",\"_token\":\"uW6w35Mzc84dEx8kDDLPaqwQhp3llpPzEAev6X3S\",\"upload_column\":\"image\",\"id\":\"WU_FILE_0\",\"name\":\"ceMtdsu2CWHAA.jpg\",\"type\":\"image\\/jpeg\",\"lastModifiedDate\":\"Wed Aug 05 2020 09:46:37 GMT+0800 (\\u4e2d\\u56fd\\u6807\\u51c6\\u65f6\\u95f4)\",\"size\":\"55579\"}', '2020-08-05 10:08:15', '2020-08-05 10:08:15');
INSERT INTO `admin_operation_log` VALUES ('575', '1', 'admin/products', 'POST', '127.0.0.1', '{\"type\":\"normal\",\"id\":null,\"title\":\"\\u82f9\\u679ciPhone 11\",\"category_id\":\"25\",\"image\":null,\"file-image\":null,\"_file_\":null,\"description\":\"\\u7684\",\"on_sale\":\"1\",\"recommend\":\"1\",\"skus\":{\"new_1\":{\"title\":\"4GB\\/64GB\",\"description\":\"4GB\\/64GB\",\"price\":\"6000\",\"original_price\":\"0\",\"stock\":\"11\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"uW6w35Mzc84dEx8kDDLPaqwQhp3llpPzEAev6X3S\"}', '2020-08-05 10:08:40', '2020-08-05 10:08:40');
INSERT INTO `admin_operation_log` VALUES ('576', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-08-05 10:09:58', '2020-08-05 10:09:58');
INSERT INTO `admin_operation_log` VALUES ('577', '1', 'admin/brands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 10:10:01', '2020-08-05 10:10:01');
INSERT INTO `admin_operation_log` VALUES ('578', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 10:10:04', '2020-08-05 10:10:04');
INSERT INTO `admin_operation_log` VALUES ('579', '1', 'admin/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 10:10:05', '2020-08-05 10:10:05');
INSERT INTO `admin_operation_log` VALUES ('580', '1', 'admin/api/categories', 'GET', '127.0.0.1', '{\"is_directory\":\"0\",\"q\":\"z\"}', '2020-08-05 10:10:20', '2020-08-05 10:10:20');
INSERT INTO `admin_operation_log` VALUES ('581', '1', 'admin/api/categories', 'GET', '127.0.0.1', '{\"is_directory\":\"0\",\"q\":\"\\u667a\\u80fd\\u673a\"}', '2020-08-05 10:10:21', '2020-08-05 10:10:21');
INSERT INTO `admin_operation_log` VALUES ('582', '1', 'admin/products', 'POST', '127.0.0.1', '{\"_id\":\"2RNv50oyU41wBcNw\",\"_token\":\"uW6w35Mzc84dEx8kDDLPaqwQhp3llpPzEAev6X3S\",\"upload_column\":\"image\",\"id\":\"WU_FILE_0\",\"name\":\"ceMtdsu2CWHAA.jpg\",\"type\":\"image\\/jpeg\",\"lastModifiedDate\":\"Wed Aug 05 2020 09:46:37 GMT+0800 (\\u4e2d\\u56fd\\u6807\\u51c6\\u65f6\\u95f4)\",\"size\":\"55579\"}', '2020-08-05 10:10:27', '2020-08-05 10:10:27');
INSERT INTO `admin_operation_log` VALUES ('583', '1', 'admin/products', 'POST', '127.0.0.1', '{\"type\":\"normal\",\"id\":null,\"title\":\"\\u82f9\\u679ciPhone 11\",\"category_id\":\"25\",\"image\":\"product\\/416d73fca2ba3dc628676fea5c76b22a.jpg\",\"file-image\":null,\"_file_\":null,\"description\":\"\\u8bd5\\u8bd5\",\"on_sale\":\"1\",\"recommend\":\"1\",\"skus\":{\"new_1\":{\"title\":\"4GB\\/64GB\",\"description\":\"4GB\\/64GB\",\"price\":\"6000\",\"original_price\":\"0\",\"stock\":\"11\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"uW6w35Mzc84dEx8kDDLPaqwQhp3llpPzEAev6X3S\",\"_previous_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/products\"}', '2020-08-05 10:10:43', '2020-08-05 10:10:43');
INSERT INTO `admin_operation_log` VALUES ('584', '1', 'admin/products', 'POST', '127.0.0.1', '{\"type\":\"normal\",\"id\":null,\"title\":\"\\u82f9\\u679ciPhone 11\",\"category_id\":\"25\",\"image\":\"product\\/416d73fca2ba3dc628676fea5c76b22a.jpg\",\"file-image\":null,\"_file_\":null,\"description\":\"\\u8bd5\\u8bd5\",\"on_sale\":\"1\",\"recommend\":\"1\",\"skus\":{\"new_1\":{\"title\":\"4GB\\/64GB\",\"description\":\"4GB\\/64GB\",\"price\":\"6000\",\"original_price\":\"0\",\"stock\":\"11\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"uW6w35Mzc84dEx8kDDLPaqwQhp3llpPzEAev6X3S\",\"_previous_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/products\"}', '2020-08-05 10:13:13', '2020-08-05 10:13:13');
INSERT INTO `admin_operation_log` VALUES ('585', '1', 'admin/products', 'POST', '127.0.0.1', '{\"type\":\"normal\",\"id\":null,\"title\":\"\\u82f9\\u679ciPhone 11\",\"category_id\":\"25\",\"image\":\"product\\/416d73fca2ba3dc628676fea5c76b22a.jpg\",\"file-image\":null,\"_file_\":null,\"description\":\"\\u8bd5\\u8bd5\",\"on_sale\":\"1\",\"recommend\":\"1\",\"skus\":{\"new_1\":{\"title\":\"4GB\\/64GB\",\"description\":\"4GB\\/64GB\",\"price\":\"6000\",\"original_price\":\"0\",\"stock\":\"11\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"uW6w35Mzc84dEx8kDDLPaqwQhp3llpPzEAev6X3S\",\"_previous_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/products\"}', '2020-08-05 10:14:47', '2020-08-05 10:14:47');
INSERT INTO `admin_operation_log` VALUES ('586', '1', 'admin/products', 'POST', '127.0.0.1', '{\"type\":\"normal\",\"id\":null,\"title\":\"\\u82f9\\u679ciPhone 11\",\"category_id\":\"25\",\"image\":\"product\\/416d73fca2ba3dc628676fea5c76b22a.jpg\",\"file-image\":null,\"_file_\":null,\"description\":\"\\u8bd5\\u8bd5\",\"on_sale\":\"1\",\"recommend\":\"1\",\"skus\":{\"new_1\":{\"title\":\"4GB\\/64GB\",\"description\":\"4GB\\/64GB\",\"price\":\"6000\",\"original_price\":\"0\",\"stock\":\"11\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"uW6w35Mzc84dEx8kDDLPaqwQhp3llpPzEAev6X3S\",\"_previous_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/products\"}', '2020-08-05 10:16:53', '2020-08-05 10:16:53');
INSERT INTO `admin_operation_log` VALUES ('587', '1', 'admin/products', 'POST', '127.0.0.1', '{\"type\":\"normal\",\"id\":null,\"title\":\"\\u82f9\\u679ciPhone 11\",\"category_id\":\"25\",\"image\":\"product\\/416d73fca2ba3dc628676fea5c76b22a.jpg\",\"file-image\":null,\"_file_\":null,\"description\":\"\\u8bd5\\u8bd5\",\"on_sale\":\"1\",\"recommend\":\"1\",\"skus\":{\"new_1\":{\"title\":\"4GB\\/64GB\",\"description\":\"4GB\\/64GB\",\"price\":\"6000\",\"original_price\":\"0\",\"stock\":\"11\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"uW6w35Mzc84dEx8kDDLPaqwQhp3llpPzEAev6X3S\",\"_previous_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/products\"}', '2020-08-05 10:17:15', '2020-08-05 10:17:15');
INSERT INTO `admin_operation_log` VALUES ('588', '1', 'admin/products', 'POST', '127.0.0.1', '{\"type\":\"normal\",\"id\":null,\"title\":\"\\u82f9\\u679ciPhone 11\",\"category_id\":\"25\",\"image\":\"product\\/416d73fca2ba3dc628676fea5c76b22a.jpg\",\"file-image\":null,\"_file_\":null,\"description\":\"\\u8bd5\\u8bd5\",\"on_sale\":\"1\",\"recommend\":\"1\",\"skus\":{\"new_1\":{\"title\":\"4GB\\/64GB\",\"description\":\"4GB\\/64GB\",\"price\":\"6000\",\"original_price\":\"0\",\"stock\":\"11\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"uW6w35Mzc84dEx8kDDLPaqwQhp3llpPzEAev6X3S\",\"_previous_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/products\"}', '2020-08-05 10:17:32', '2020-08-05 10:17:32');
INSERT INTO `admin_operation_log` VALUES ('589', '1', 'admin/products', 'POST', '127.0.0.1', '{\"type\":\"normal\",\"id\":null,\"title\":\"\\u82f9\\u679ciPhone 11\",\"category_id\":\"25\",\"image\":\"product\\/416d73fca2ba3dc628676fea5c76b22a.jpg\",\"file-image\":null,\"_file_\":null,\"description\":\"\\u8bd5\\u8bd5\",\"on_sale\":\"1\",\"recommend\":\"1\",\"skus\":{\"new_1\":{\"title\":\"4GB\\/64GB\",\"description\":\"4GB\\/64GB\",\"price\":\"6000\",\"original_price\":\"0\",\"stock\":\"11\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"uW6w35Mzc84dEx8kDDLPaqwQhp3llpPzEAev6X3S\",\"_previous_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/products\"}', '2020-08-05 10:20:41', '2020-08-05 10:20:41');
INSERT INTO `admin_operation_log` VALUES ('590', '1', 'admin/products', 'POST', '127.0.0.1', '{\"type\":\"normal\",\"id\":null,\"title\":\"\\u82f9\\u679ciPhone 11\",\"category_id\":\"25\",\"image\":\"product\\/416d73fca2ba3dc628676fea5c76b22a.jpg\",\"file-image\":null,\"_file_\":null,\"description\":\"\\u8bd5\\u8bd5\",\"on_sale\":\"1\",\"recommend\":\"1\",\"skus\":{\"new_1\":{\"title\":\"4GB\\/64GB\",\"description\":\"4GB\\/64GB\",\"price\":\"6000\",\"original_price\":\"0\",\"stock\":\"11\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"uW6w35Mzc84dEx8kDDLPaqwQhp3llpPzEAev6X3S\",\"_previous_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/products\"}', '2020-08-05 10:22:09', '2020-08-05 10:22:09');
INSERT INTO `admin_operation_log` VALUES ('591', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 10:22:10', '2020-08-05 10:22:10');
INSERT INTO `admin_operation_log` VALUES ('592', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 10:22:26', '2020-08-05 10:22:26');
INSERT INTO `admin_operation_log` VALUES ('593', '1', 'admin/products/113/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 10:22:37', '2020-08-05 10:22:37');
INSERT INTO `admin_operation_log` VALUES ('594', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 10:25:35', '2020-08-05 10:25:35');
INSERT INTO `admin_operation_log` VALUES ('595', '1', 'admin/products/113/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 10:25:37', '2020-08-05 10:25:37');
INSERT INTO `admin_operation_log` VALUES ('596', '1', 'admin/products/113/edit', 'GET', '127.0.0.1', '[]', '2020-08-05 10:27:37', '2020-08-05 10:27:37');
INSERT INTO `admin_operation_log` VALUES ('597', '1', 'admin/products/113/edit', 'GET', '127.0.0.1', '[]', '2020-08-05 10:31:35', '2020-08-05 10:31:35');
INSERT INTO `admin_operation_log` VALUES ('598', '1', 'admin/products/113', 'PUT', '127.0.0.1', '{\"type\":\"normal\",\"id\":\"113\",\"title\":\"\\u82f9\\u679ciPhone 11\",\"category_id\":\"25\",\"image\":\"product\\/416d73fca2ba3dc628676fea5c76b22a.jpg\",\"file-image\":null,\"_file_\":null,\"description\":\"\\u8bd5\\u8bd511\",\"on_sale\":\"1\",\"recommend\":\"1\",\"skus\":{\"216\":{\"title\":\"4GB\\/64GB\",\"description\":\"4GB\\/64GB\",\"price\":\"6000.00\",\"original_price\":\"6000.00\",\"stock\":\"11\",\"id\":\"216\",\"_remove_\":null}},\"_token\":\"uW6w35Mzc84dEx8kDDLPaqwQhp3llpPzEAev6X3S\",\"_method\":\"PUT\"}', '2020-08-05 10:32:17', '2020-08-05 10:32:17');
INSERT INTO `admin_operation_log` VALUES ('599', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 10:32:18', '2020-08-05 10:32:18');
INSERT INTO `admin_operation_log` VALUES ('600', '1', 'admin/products/113/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 10:32:22', '2020-08-05 10:32:22');
INSERT INTO `admin_operation_log` VALUES ('601', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 10:32:30', '2020-08-05 10:32:30');
INSERT INTO `admin_operation_log` VALUES ('602', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-05 10:32:58', '2020-08-05 10:32:58');
INSERT INTO `admin_operation_log` VALUES ('603', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-05 10:34:17', '2020-08-05 10:34:17');
INSERT INTO `admin_operation_log` VALUES ('604', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-05 10:34:29', '2020-08-05 10:34:29');
INSERT INTO `admin_operation_log` VALUES ('605', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-05 10:34:40', '2020-08-05 10:34:40');
INSERT INTO `admin_operation_log` VALUES ('606', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-05 10:36:06', '2020-08-05 10:36:06');
INSERT INTO `admin_operation_log` VALUES ('607', '1', 'admin/products/113/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 10:38:39', '2020-08-05 10:38:39');
INSERT INTO `admin_operation_log` VALUES ('608', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 10:38:45', '2020-08-05 10:38:45');
INSERT INTO `admin_operation_log` VALUES ('609', '1', 'admin/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 10:38:57', '2020-08-05 10:38:57');
INSERT INTO `admin_operation_log` VALUES ('610', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 10:39:06', '2020-08-05 10:39:06');
INSERT INTO `admin_operation_log` VALUES ('611', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-05 10:45:27', '2020-08-05 10:45:27');
INSERT INTO `admin_operation_log` VALUES ('612', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-05 10:46:01', '2020-08-05 10:46:01');
INSERT INTO `admin_operation_log` VALUES ('613', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-05 10:46:12', '2020-08-05 10:46:12');
INSERT INTO `admin_operation_log` VALUES ('614', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-05 10:46:55', '2020-08-05 10:46:55');
INSERT INTO `admin_operation_log` VALUES ('615', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-05 10:51:17', '2020-08-05 10:51:17');
INSERT INTO `admin_operation_log` VALUES ('616', '1', 'admin/products/113', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 10:51:19', '2020-08-05 10:51:19');
INSERT INTO `admin_operation_log` VALUES ('617', '1', 'admin/products/113', 'GET', '127.0.0.1', '[]', '2020-08-05 10:51:19', '2020-08-05 10:51:19');
INSERT INTO `admin_operation_log` VALUES ('618', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 10:58:43', '2020-08-05 10:58:43');
INSERT INTO `admin_operation_log` VALUES ('619', '1', 'admin/helpers/scaffold/table', 'POST', '127.0.0.1', '{\"db\":\"jrerp\",\"tb\":\"products\",\"_token\":\"uW6w35Mzc84dEx8kDDLPaqwQhp3llpPzEAev6X3S\"}', '2020-08-05 10:58:51', '2020-08-05 10:58:51');
INSERT INTO `admin_operation_log` VALUES ('620', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"singular\":\"products\"}', '2020-08-05 10:58:52', '2020-08-05 10:58:52');
INSERT INTO `admin_operation_log` VALUES ('621', '1', 'admin/helpers/scaffold', 'POST', '127.0.0.1', '{\"table_name\":\"products\",\"exist-table\":\"jrerp|products\",\"model_name\":\"App\\\\Models\\\\Product\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\Product1Controller\",\"repository_name\":\"App\\\\Admin\\\\Repositories\\\\Product\",\"create\":[\"controller\"],\"fields\":[{\"name\":\"type\",\"translation\":null,\"type\":\"string\",\"key\":null,\"default\":\"normal\",\"comment\":null},{\"name\":\"category_id\",\"translation\":null,\"type\":\"unsignedBigInteger\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":null},{\"name\":\"title\",\"translation\":null,\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":null},{\"name\":\"image\",\"translation\":null,\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":null},{\"name\":\"description\",\"translation\":null,\"type\":\"text\",\"key\":null,\"default\":null,\"comment\":null},{\"name\":\"on_sale\",\"translation\":null,\"type\":\"tinyInteger\",\"key\":null,\"default\":\"1\",\"comment\":null},{\"name\":\"recommend\",\"translation\":null,\"type\":\"tinyInteger\",\"key\":null,\"default\":\"0\",\"comment\":null},{\"name\":\"rating\",\"translation\":null,\"type\":\"double\",\"key\":null,\"default\":\"5.00\",\"comment\":null},{\"name\":\"sold_count\",\"translation\":null,\"type\":\"unsignedInteger\",\"key\":null,\"default\":\"0\",\"comment\":null},{\"name\":\"review_count\",\"translation\":null,\"type\":\"unsignedInteger\",\"key\":null,\"default\":\"0\",\"comment\":null},{\"name\":\"price\",\"translation\":null,\"type\":\"decimal\",\"key\":null,\"default\":null,\"comment\":null},{\"name\":\"discount_num\",\"translation\":null,\"type\":\"tinyInteger\",\"key\":null,\"default\":\"0\",\"comment\":null},{\"name\":\"original_price\",\"translation\":null,\"type\":\"decimal\",\"key\":null,\"default\":\"0.00\",\"comment\":null}],\"primary_key\":\"id\",\"timestamps\":\"1\",\"_token\":\"uW6w35Mzc84dEx8kDDLPaqwQhp3llpPzEAev6X3S\"}', '2020-08-05 10:59:18', '2020-08-05 10:59:18');
INSERT INTO `admin_operation_log` VALUES ('622', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2020-08-05 10:59:19', '2020-08-05 10:59:19');
INSERT INTO `admin_operation_log` VALUES ('623', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 11:03:01', '2020-08-05 11:03:01');
INSERT INTO `admin_operation_log` VALUES ('624', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-05 11:09:25', '2020-08-05 11:09:25');
INSERT INTO `admin_operation_log` VALUES ('625', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-05 11:10:17', '2020-08-05 11:10:17');
INSERT INTO `admin_operation_log` VALUES ('626', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-05 11:10:34', '2020-08-05 11:10:34');
INSERT INTO `admin_operation_log` VALUES ('627', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-05 11:11:43', '2020-08-05 11:11:43');
INSERT INTO `admin_operation_log` VALUES ('628', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-05 11:13:18', '2020-08-05 11:13:18');
INSERT INTO `admin_operation_log` VALUES ('629', '1', 'admin/products/113', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 11:13:22', '2020-08-05 11:13:22');
INSERT INTO `admin_operation_log` VALUES ('630', '1', 'admin/products/113/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 11:14:00', '2020-08-05 11:14:00');
INSERT INTO `admin_operation_log` VALUES ('631', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 11:14:05', '2020-08-05 11:14:05');
INSERT INTO `admin_operation_log` VALUES ('632', '1', 'admin/products/113', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 11:14:07', '2020-08-05 11:14:07');
INSERT INTO `admin_operation_log` VALUES ('633', '1', 'admin/products/113', 'GET', '127.0.0.1', '[]', '2020-08-05 11:30:48', '2020-08-05 11:30:48');
INSERT INTO `admin_operation_log` VALUES ('634', '1', 'admin/products/113', 'GET', '127.0.0.1', '[]', '2020-08-05 11:32:24', '2020-08-05 11:32:24');
INSERT INTO `admin_operation_log` VALUES ('635', '1', 'admin/products/113', 'GET', '127.0.0.1', '[]', '2020-08-05 11:33:53', '2020-08-05 11:33:53');
INSERT INTO `admin_operation_log` VALUES ('636', '1', 'admin/products/113', 'GET', '127.0.0.1', '[]', '2020-08-05 11:34:56', '2020-08-05 11:34:56');
INSERT INTO `admin_operation_log` VALUES ('637', '1', 'admin/products/113', 'GET', '127.0.0.1', '[]', '2020-08-05 11:36:56', '2020-08-05 11:36:56');
INSERT INTO `admin_operation_log` VALUES ('638', '1', 'admin/products/113', 'GET', '127.0.0.1', '[]', '2020-08-05 11:39:16', '2020-08-05 11:39:16');
INSERT INTO `admin_operation_log` VALUES ('639', '1', 'admin/products/113', 'GET', '127.0.0.1', '[]', '2020-08-05 13:19:50', '2020-08-05 13:19:50');
INSERT INTO `admin_operation_log` VALUES ('640', '1', 'admin/products/113', 'GET', '127.0.0.1', '[]', '2020-08-05 13:26:27', '2020-08-05 13:26:27');
INSERT INTO `admin_operation_log` VALUES ('641', '1', 'admin/products/113', 'GET', '127.0.0.1', '[]', '2020-08-05 13:30:20', '2020-08-05 13:30:20');
INSERT INTO `admin_operation_log` VALUES ('642', '1', 'admin/products/113', 'GET', '127.0.0.1', '[]', '2020-08-05 13:31:59', '2020-08-05 13:31:59');
INSERT INTO `admin_operation_log` VALUES ('643', '1', 'admin/products/113', 'GET', '127.0.0.1', '[]', '2020-08-05 13:32:12', '2020-08-05 13:32:12');
INSERT INTO `admin_operation_log` VALUES ('644', '1', 'admin/products/113', 'GET', '127.0.0.1', '[]', '2020-08-05 13:32:55', '2020-08-05 13:32:55');
INSERT INTO `admin_operation_log` VALUES ('645', '1', 'admin/products/113', 'GET', '127.0.0.1', '[]', '2020-08-05 13:33:14', '2020-08-05 13:33:14');
INSERT INTO `admin_operation_log` VALUES ('646', '1', 'admin/products/113', 'GET', '127.0.0.1', '[]', '2020-08-05 13:33:26', '2020-08-05 13:33:26');
INSERT INTO `admin_operation_log` VALUES ('647', '1', 'admin/products/113', 'GET', '127.0.0.1', '[]', '2020-08-05 13:34:05', '2020-08-05 13:34:05');
INSERT INTO `admin_operation_log` VALUES ('648', '1', 'admin/products/113', 'GET', '127.0.0.1', '[]', '2020-08-05 13:34:29', '2020-08-05 13:34:29');
INSERT INTO `admin_operation_log` VALUES ('649', '1', 'admin/products/113', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 13:34:35', '2020-08-05 13:34:35');
INSERT INTO `admin_operation_log` VALUES ('650', '1', 'admin/products/113', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 13:34:37', '2020-08-05 13:34:37');
INSERT INTO `admin_operation_log` VALUES ('651', '1', 'admin/products/113', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 13:34:38', '2020-08-05 13:34:38');
INSERT INTO `admin_operation_log` VALUES ('652', '1', 'admin/products/113', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 13:34:45', '2020-08-05 13:34:45');
INSERT INTO `admin_operation_log` VALUES ('653', '1', 'admin/products/113', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 13:34:53', '2020-08-05 13:34:53');
INSERT INTO `admin_operation_log` VALUES ('654', '1', 'admin/products/113', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"skus_title\":\"1111\"}', '2020-08-05 13:35:02', '2020-08-05 13:35:02');
INSERT INTO `admin_operation_log` VALUES ('655', '1', 'admin/products/113', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"skus_title\":\"4\"}', '2020-08-05 13:35:09', '2020-08-05 13:35:09');
INSERT INTO `admin_operation_log` VALUES ('656', '1', 'admin/products/113', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 13:35:13', '2020-08-05 13:35:13');
INSERT INTO `admin_operation_log` VALUES ('657', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 13:36:08', '2020-08-05 13:36:08');
INSERT INTO `admin_operation_log` VALUES ('658', '1', 'admin/helpers/scaffold/table', 'POST', '127.0.0.1', '{\"db\":\"jrerp\",\"tb\":\"product_skus\",\"_token\":\"uW6w35Mzc84dEx8kDDLPaqwQhp3llpPzEAev6X3S\"}', '2020-08-05 13:36:14', '2020-08-05 13:36:14');
INSERT INTO `admin_operation_log` VALUES ('659', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"singular\":\"product_skus\"}', '2020-08-05 13:36:15', '2020-08-05 13:36:15');
INSERT INTO `admin_operation_log` VALUES ('660', '1', 'admin/helpers/scaffold', 'POST', '127.0.0.1', '{\"table_name\":\"product_skus\",\"exist-table\":\"jrerp|product_skus\",\"model_name\":\"App\\\\Models\\\\ProductSku\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\ProductSkuController\",\"repository_name\":\"App\\\\Admin\\\\Repositories\\\\ProductSku\",\"create\":[\"controller\",\"lang\"],\"fields\":[{\"name\":\"product_id\",\"translation\":\"\\u5546\\u54c1\",\"type\":\"unsignedBigInteger\",\"key\":null,\"default\":null,\"comment\":null},{\"name\":\"title\",\"translation\":\"\\u540d\\u79f0\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":null},{\"name\":\"description\",\"translation\":\"\\u63cf\\u8ff0\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":null},{\"name\":\"price\",\"translation\":\"\\u4ef7\\u683c\",\"type\":\"decimal\",\"key\":null,\"default\":null,\"comment\":null},{\"name\":\"original_price\",\"translation\":\"\\u539f\\u4ef7\",\"type\":\"decimal\",\"key\":null,\"default\":\"0.00\",\"comment\":null},{\"name\":\"stock\",\"translation\":\"\\u5e93\\u5b58\",\"type\":\"unsignedInteger\",\"key\":null,\"default\":null,\"comment\":null}],\"primary_key\":\"id\",\"timestamps\":\"1\",\"_token\":\"uW6w35Mzc84dEx8kDDLPaqwQhp3llpPzEAev6X3S\"}', '2020-08-05 13:37:21', '2020-08-05 13:37:21');
INSERT INTO `admin_operation_log` VALUES ('661', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2020-08-05 13:37:21', '2020-08-05 13:37:21');
INSERT INTO `admin_operation_log` VALUES ('662', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 13:38:37', '2020-08-05 13:38:37');
INSERT INTO `admin_operation_log` VALUES ('663', '1', 'admin/products/113', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 13:38:41', '2020-08-05 13:38:41');
INSERT INTO `admin_operation_log` VALUES ('664', '1', 'admin/skus/216/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 13:38:47', '2020-08-05 13:38:47');
INSERT INTO `admin_operation_log` VALUES ('665', '1', 'admin/skus/216/edit', 'GET', '127.0.0.1', '[]', '2020-08-05 13:39:51', '2020-08-05 13:39:51');
INSERT INTO `admin_operation_log` VALUES ('666', '1', 'admin/skus/216/edit', 'GET', '127.0.0.1', '[]', '2020-08-05 13:41:44', '2020-08-05 13:41:44');
INSERT INTO `admin_operation_log` VALUES ('667', '1', 'admin/products/113', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 13:42:21', '2020-08-05 13:42:21');
INSERT INTO `admin_operation_log` VALUES ('668', '1', 'admin/skus/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 13:42:33', '2020-08-05 13:42:33');
INSERT INTO `admin_operation_log` VALUES ('669', '1', 'admin/products/113', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 13:42:44', '2020-08-05 13:42:44');
INSERT INTO `admin_operation_log` VALUES ('670', '1', 'admin/skus/216/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 13:42:46', '2020-08-05 13:42:46');
INSERT INTO `admin_operation_log` VALUES ('671', '1', 'admin/skus/216/edit', 'GET', '127.0.0.1', '[]', '2020-08-05 13:44:44', '2020-08-05 13:44:44');
INSERT INTO `admin_operation_log` VALUES ('672', '1', 'admin/skus/216/edit', 'GET', '127.0.0.1', '[]', '2020-08-05 13:53:24', '2020-08-05 13:53:24');
INSERT INTO `admin_operation_log` VALUES ('673', '1', 'admin/skus/216/edit', 'GET', '127.0.0.1', '[]', '2020-08-05 13:54:14', '2020-08-05 13:54:14');
INSERT INTO `admin_operation_log` VALUES ('674', '1', 'admin/skus/216/edit', 'GET', '127.0.0.1', '[]', '2020-08-05 13:56:37', '2020-08-05 13:56:37');
INSERT INTO `admin_operation_log` VALUES ('675', '1', 'admin/skus/216/edit', 'GET', '127.0.0.1', '[]', '2020-08-05 13:57:06', '2020-08-05 13:57:06');
INSERT INTO `admin_operation_log` VALUES ('676', '1', 'admin/skus/216/edit', 'GET', '127.0.0.1', '[]', '2020-08-05 13:57:21', '2020-08-05 13:57:21');
INSERT INTO `admin_operation_log` VALUES ('677', '1', 'admin/skus/216/edit', 'GET', '127.0.0.1', '[]', '2020-08-05 13:59:16', '2020-08-05 13:59:16');
INSERT INTO `admin_operation_log` VALUES ('678', '1', 'admin/skus/216/edit', 'GET', '127.0.0.1', '[]', '2020-08-05 14:00:20', '2020-08-05 14:00:20');
INSERT INTO `admin_operation_log` VALUES ('679', '1', 'admin/skus/216/edit', 'GET', '127.0.0.1', '[]', '2020-08-05 14:00:30', '2020-08-05 14:00:30');
INSERT INTO `admin_operation_log` VALUES ('680', '1', 'admin/skus/216/edit', 'GET', '127.0.0.1', '[]', '2020-08-05 14:01:20', '2020-08-05 14:01:20');
INSERT INTO `admin_operation_log` VALUES ('681', '1', 'admin/skus/216/edit', 'GET', '127.0.0.1', '[]', '2020-08-05 14:01:53', '2020-08-05 14:01:53');
INSERT INTO `admin_operation_log` VALUES ('682', '1', 'admin/skus/216/edit', 'GET', '127.0.0.1', '[]', '2020-08-05 14:02:30', '2020-08-05 14:02:30');
INSERT INTO `admin_operation_log` VALUES ('683', '1', 'admin/skus/216/edit', 'GET', '127.0.0.1', '[]', '2020-08-05 14:03:09', '2020-08-05 14:03:09');
INSERT INTO `admin_operation_log` VALUES ('684', '1', 'admin/skus/216/edit', 'GET', '127.0.0.1', '[]', '2020-08-05 14:03:13', '2020-08-05 14:03:13');
INSERT INTO `admin_operation_log` VALUES ('685', '1', 'admin/skus/216/edit', 'GET', '127.0.0.1', '[]', '2020-08-05 14:03:51', '2020-08-05 14:03:51');
INSERT INTO `admin_operation_log` VALUES ('686', '1', 'admin/skus/216/edit', 'GET', '127.0.0.1', '[]', '2020-08-05 14:04:04', '2020-08-05 14:04:04');
INSERT INTO `admin_operation_log` VALUES ('687', '1', 'admin/skus/216/edit', 'GET', '127.0.0.1', '[]', '2020-08-05 14:04:19', '2020-08-05 14:04:19');
INSERT INTO `admin_operation_log` VALUES ('688', '1', 'admin/products/113', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 14:04:20', '2020-08-05 14:04:20');
INSERT INTO `admin_operation_log` VALUES ('689', '1', 'admin/skus/216/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 14:04:30', '2020-08-05 14:04:30');
INSERT INTO `admin_operation_log` VALUES ('690', '1', 'admin/products/113', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 14:04:31', '2020-08-05 14:04:31');
INSERT INTO `admin_operation_log` VALUES ('691', '1', 'admin/skus/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 14:04:37', '2020-08-05 14:04:37');
INSERT INTO `admin_operation_log` VALUES ('692', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 14:04:40', '2020-08-05 14:04:40');
INSERT INTO `admin_operation_log` VALUES ('693', '1', 'admin/products/95', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 14:04:46', '2020-08-05 14:04:46');
INSERT INTO `admin_operation_log` VALUES ('694', '1', 'admin/skus/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 14:04:50', '2020-08-05 14:04:50');
INSERT INTO `admin_operation_log` VALUES ('695', '1', 'admin/products/95', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 14:06:37', '2020-08-05 14:06:37');
INSERT INTO `admin_operation_log` VALUES ('696', '1', 'admin/skus/198/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 14:06:42', '2020-08-05 14:06:42');
INSERT INTO `admin_operation_log` VALUES ('697', '1', 'admin/products/95', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 14:06:49', '2020-08-05 14:06:49');
INSERT INTO `admin_operation_log` VALUES ('698', '1', 'admin/products/95', 'GET', '127.0.0.1', '[]', '2020-08-05 14:09:47', '2020-08-05 14:09:47');
INSERT INTO `admin_operation_log` VALUES ('699', '1', 'admin/skus/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 14:09:48', '2020-08-05 14:09:48');
INSERT INTO `admin_operation_log` VALUES ('700', '1', 'admin/skus/create', 'GET', '127.0.0.1', '[]', '2020-08-05 14:10:26', '2020-08-05 14:10:26');
INSERT INTO `admin_operation_log` VALUES ('701', '1', 'admin/products/95', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 14:10:29', '2020-08-05 14:10:29');
INSERT INTO `admin_operation_log` VALUES ('702', '1', 'admin/skus/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 14:10:32', '2020-08-05 14:10:32');
INSERT INTO `admin_operation_log` VALUES ('703', '1', 'admin/products/95', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 14:10:34', '2020-08-05 14:10:34');
INSERT INTO `admin_operation_log` VALUES ('704', '1', 'admin/skus/198/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 14:10:37', '2020-08-05 14:10:37');
INSERT INTO `admin_operation_log` VALUES ('705', '1', 'admin/products/95', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 14:10:38', '2020-08-05 14:10:38');
INSERT INTO `admin_operation_log` VALUES ('706', '1', 'admin/skus/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 14:10:41', '2020-08-05 14:10:41');
INSERT INTO `admin_operation_log` VALUES ('707', '1', 'admin/products/95', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 14:10:57', '2020-08-05 14:10:57');
INSERT INTO `admin_operation_log` VALUES ('708', '1', 'admin/products/95', 'GET', '127.0.0.1', '[]', '2020-08-05 14:27:14', '2020-08-05 14:27:14');
INSERT INTO `admin_operation_log` VALUES ('709', '1', 'admin/products/95', 'GET', '127.0.0.1', '[]', '2020-08-05 14:27:22', '2020-08-05 14:27:22');
INSERT INTO `admin_operation_log` VALUES ('710', '1', 'admin/products/95', 'GET', '127.0.0.1', '[]', '2020-08-05 14:28:31', '2020-08-05 14:28:31');
INSERT INTO `admin_operation_log` VALUES ('711', '1', 'admin/products/95', 'GET', '127.0.0.1', '[]', '2020-08-05 14:28:51', '2020-08-05 14:28:51');
INSERT INTO `admin_operation_log` VALUES ('712', '1', 'admin/skus/create/95', 'GET', '127.0.0.1', '[]', '2020-08-05 14:29:28', '2020-08-05 14:29:28');
INSERT INTO `admin_operation_log` VALUES ('713', '1', 'admin/products/95', 'GET', '127.0.0.1', '[]', '2020-08-05 14:30:09', '2020-08-05 14:30:09');
INSERT INTO `admin_operation_log` VALUES ('714', '1', 'admin/products/95', 'GET', '127.0.0.1', '[]', '2020-08-05 14:30:30', '2020-08-05 14:30:30');
INSERT INTO `admin_operation_log` VALUES ('715', '1', 'admin/skus/create/95', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 14:30:33', '2020-08-05 14:30:33');
INSERT INTO `admin_operation_log` VALUES ('716', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 14:30:55', '2020-08-05 14:30:55');
INSERT INTO `admin_operation_log` VALUES ('717', '1', 'admin/products/113', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 14:31:02', '2020-08-05 14:31:02');
INSERT INTO `admin_operation_log` VALUES ('718', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 14:31:08', '2020-08-05 14:31:08');
INSERT INTO `admin_operation_log` VALUES ('719', '1', 'admin/products/113', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 14:31:09', '2020-08-05 14:31:09');
INSERT INTO `admin_operation_log` VALUES ('720', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 14:31:13', '2020-08-05 14:31:13');
INSERT INTO `admin_operation_log` VALUES ('721', '1', 'admin/products/113/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 14:31:17', '2020-08-05 14:31:17');
INSERT INTO `admin_operation_log` VALUES ('722', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 14:31:19', '2020-08-05 14:31:19');
INSERT INTO `admin_operation_log` VALUES ('723', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-05 14:31:47', '2020-08-05 14:31:47');
INSERT INTO `admin_operation_log` VALUES ('724', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-05 14:32:46', '2020-08-05 14:32:46');
INSERT INTO `admin_operation_log` VALUES ('725', '1', 'admin/products/113', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 14:32:49', '2020-08-05 14:32:49');
INSERT INTO `admin_operation_log` VALUES ('726', '1', 'admin/skus/create/113', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 14:33:01', '2020-08-05 14:33:01');
INSERT INTO `admin_operation_log` VALUES ('727', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 14:33:14', '2020-08-05 14:33:14');
INSERT INTO `admin_operation_log` VALUES ('728', '1', 'admin/products/113', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 14:33:16', '2020-08-05 14:33:16');
INSERT INTO `admin_operation_log` VALUES ('729', '1', 'admin/skus/216/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 14:33:25', '2020-08-05 14:33:25');
INSERT INTO `admin_operation_log` VALUES ('730', '1', 'admin/products/113', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 14:34:07', '2020-08-05 14:34:07');
INSERT INTO `admin_operation_log` VALUES ('731', '1', 'admin/skus/216/edit', 'GET', '127.0.0.1', '[]', '2020-08-05 14:40:21', '2020-08-05 14:40:21');
INSERT INTO `admin_operation_log` VALUES ('732', '1', 'admin/skus/216/edit', 'GET', '127.0.0.1', '[]', '2020-08-05 14:43:29', '2020-08-05 14:43:29');
INSERT INTO `admin_operation_log` VALUES ('733', '1', 'admin/skus/216/edit', 'GET', '127.0.0.1', '[]', '2020-08-05 14:43:57', '2020-08-05 14:43:57');
INSERT INTO `admin_operation_log` VALUES ('734', '1', 'admin/skus/216/edit', 'GET', '127.0.0.1', '[]', '2020-08-05 14:44:26', '2020-08-05 14:44:26');
INSERT INTO `admin_operation_log` VALUES ('735', '1', 'admin/skus/216/edit', 'GET', '127.0.0.1', '[]', '2020-08-05 14:44:43', '2020-08-05 14:44:43');
INSERT INTO `admin_operation_log` VALUES ('736', '1', 'admin/skus/216/edit', 'GET', '127.0.0.1', '[]', '2020-08-05 14:46:58', '2020-08-05 14:46:58');
INSERT INTO `admin_operation_log` VALUES ('737', '1', 'admin/skus/216/edit', 'GET', '127.0.0.1', '[]', '2020-08-05 14:47:35', '2020-08-05 14:47:35');
INSERT INTO `admin_operation_log` VALUES ('738', '1', 'admin/skus/216/edit', 'GET', '127.0.0.1', '[]', '2020-08-05 14:48:37', '2020-08-05 14:48:37');
INSERT INTO `admin_operation_log` VALUES ('739', '1', 'admin/skus/216/edit', 'GET', '127.0.0.1', '[]', '2020-08-05 14:48:49', '2020-08-05 14:48:49');
INSERT INTO `admin_operation_log` VALUES ('740', '1', 'admin/skus/216/edit', 'GET', '127.0.0.1', '[]', '2020-08-05 14:48:50', '2020-08-05 14:48:50');
INSERT INTO `admin_operation_log` VALUES ('741', '1', 'admin/skus/216/edit', 'GET', '127.0.0.1', '[]', '2020-08-05 14:49:00', '2020-08-05 14:49:00');
INSERT INTO `admin_operation_log` VALUES ('742', '1', 'admin/skus/216/edit', 'GET', '127.0.0.1', '[]', '2020-08-05 14:49:48', '2020-08-05 14:49:48');
INSERT INTO `admin_operation_log` VALUES ('743', '1', 'admin/skus/216/edit', 'GET', '127.0.0.1', '[]', '2020-08-05 14:50:05', '2020-08-05 14:50:05');
INSERT INTO `admin_operation_log` VALUES ('744', '1', 'admin/skus/216/edit', 'GET', '127.0.0.1', '[]', '2020-08-05 14:50:20', '2020-08-05 14:50:20');
INSERT INTO `admin_operation_log` VALUES ('745', '1', 'admin/skus/216/edit', 'GET', '127.0.0.1', '[]', '2020-08-05 14:50:38', '2020-08-05 14:50:38');
INSERT INTO `admin_operation_log` VALUES ('746', '1', 'admin/skus/216', 'PUT', '127.0.0.1', '{\"product_id\":\"113\",\"title\":\"4GB\\/64GB\",\"description\":\"4GB\\/64GB\",\"price\":\"6000.00\",\"original_price\":\"6000.00\",\"stock\":\"12\",\"_token\":\"uW6w35Mzc84dEx8kDDLPaqwQhp3llpPzEAev6X3S\",\"_method\":\"PUT\"}', '2020-08-05 14:51:03', '2020-08-05 14:51:03');
INSERT INTO `admin_operation_log` VALUES ('747', '1', 'admin/products/113', 'GET', '127.0.0.1', '[]', '2020-08-05 14:51:22', '2020-08-05 14:51:22');
INSERT INTO `admin_operation_log` VALUES ('748', '1', 'admin/skus/216/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 14:51:28', '2020-08-05 14:51:28');
INSERT INTO `admin_operation_log` VALUES ('749', '1', 'admin/products/113', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 14:54:17', '2020-08-05 14:54:17');
INSERT INTO `admin_operation_log` VALUES ('750', '1', 'admin/skus/216/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 14:58:29', '2020-08-05 14:58:29');
INSERT INTO `admin_operation_log` VALUES ('751', '1', 'admin/skus/216', 'PUT', '127.0.0.1', '{\"product_id\":\"113\",\"title\":\"4GB\\/64GB\",\"description\":\"4GB\\/64GB\",\"price\":\"6000.00\",\"original_price\":\"6000.00\",\"stock\":\"12\",\"_token\":\"uW6w35Mzc84dEx8kDDLPaqwQhp3llpPzEAev6X3S\",\"_method\":\"PUT\"}', '2020-08-05 14:58:32', '2020-08-05 14:58:32');
INSERT INTO `admin_operation_log` VALUES ('752', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 14:58:32', '2020-08-05 14:58:32');
INSERT INTO `admin_operation_log` VALUES ('753', '1', 'admin/products/113', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 14:58:58', '2020-08-05 14:58:58');
INSERT INTO `admin_operation_log` VALUES ('754', '1', 'admin/skus/216/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 14:59:02', '2020-08-05 14:59:02');
INSERT INTO `admin_operation_log` VALUES ('755', '1', 'admin/skus/216', 'PUT', '127.0.0.1', '{\"product_id\":\"113\",\"title\":\"4GB\\/64GB\",\"description\":\"4GB\\/64GB\",\"price\":\"6000.00\",\"original_price\":\"6000.00\",\"stock\":\"20\",\"_token\":\"uW6w35Mzc84dEx8kDDLPaqwQhp3llpPzEAev6X3S\",\"_method\":\"PUT\"}', '2020-08-05 14:59:08', '2020-08-05 14:59:08');
INSERT INTO `admin_operation_log` VALUES ('756', '1', 'admin/products/113', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 14:59:08', '2020-08-05 14:59:08');
INSERT INTO `admin_operation_log` VALUES ('757', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 14:59:31', '2020-08-05 14:59:31');
INSERT INTO `admin_operation_log` VALUES ('758', '1', 'admin/products/113/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 14:59:33', '2020-08-05 14:59:33');
INSERT INTO `admin_operation_log` VALUES ('759', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 14:59:44', '2020-08-05 14:59:44');
INSERT INTO `admin_operation_log` VALUES ('760', '1', 'admin/products/113', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 14:59:46', '2020-08-05 14:59:46');
INSERT INTO `admin_operation_log` VALUES ('761', '1', 'admin/skus/create/113', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 15:00:05', '2020-08-05 15:00:05');
INSERT INTO `admin_operation_log` VALUES ('762', '1', 'admin/skus/create/113', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 15:01:14', '2020-08-05 15:01:14');
INSERT INTO `admin_operation_log` VALUES ('763', '1', 'admin/skus/create/113', 'GET', '127.0.0.1', '[]', '2020-08-05 15:01:15', '2020-08-05 15:01:15');
INSERT INTO `admin_operation_log` VALUES ('764', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-05 15:01:28', '2020-08-05 15:01:28');
INSERT INTO `admin_operation_log` VALUES ('765', '1', 'admin/products/113', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 15:01:30', '2020-08-05 15:01:30');
INSERT INTO `admin_operation_log` VALUES ('766', '1', 'admin/skus/create/113', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 15:01:34', '2020-08-05 15:01:34');
INSERT INTO `admin_operation_log` VALUES ('767', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-05 15:03:06', '2020-08-05 15:03:06');
INSERT INTO `admin_operation_log` VALUES ('768', '1', 'admin/products/113', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 15:03:08', '2020-08-05 15:03:08');
INSERT INTO `admin_operation_log` VALUES ('769', '1', 'admin/skus/create', 'GET', '127.0.0.1', '{\"product_id\":\"113\",\"_pjax\":\"#pjax-container\"}', '2020-08-05 15:03:11', '2020-08-05 15:03:11');
INSERT INTO `admin_operation_log` VALUES ('770', '1', 'admin/skus/create', 'GET', '127.0.0.1', '{\"product_id\":\"113\"}', '2020-08-05 15:04:12', '2020-08-05 15:04:12');
INSERT INTO `admin_operation_log` VALUES ('771', '1', 'admin/skus/create', 'GET', '127.0.0.1', '{\"product_id\":\"113\"}', '2020-08-05 15:07:25', '2020-08-05 15:07:25');
INSERT INTO `admin_operation_log` VALUES ('772', '1', 'admin/skus', 'POST', '127.0.0.1', '{\"product_id\":\"113\",\"title\":\"4GB\\/32GB\",\"description\":\"4GB\\/32GB\",\"price\":\"5000\",\"original_price\":\"5000\",\"stock\":\"10\",\"_token\":\"uW6w35Mzc84dEx8kDDLPaqwQhp3llpPzEAev6X3S\",\"_previous_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/skus\\/create?product_id=113\"}', '2020-08-05 15:15:14', '2020-08-05 15:15:14');
INSERT INTO `admin_operation_log` VALUES ('773', '1', 'admin/products/113', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 15:15:14', '2020-08-05 15:15:14');
INSERT INTO `admin_operation_log` VALUES ('774', '1', 'admin/skus/217/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 15:15:53', '2020-08-05 15:15:53');
INSERT INTO `admin_operation_log` VALUES ('775', '1', 'admin/skus/217', 'PUT', '127.0.0.1', '{\"product_id\":\"113\",\"title\":\"4GB\\/32GB\",\"description\":\"4GB\\/32GB\",\"price\":\"5000.00\",\"original_price\":\"5000.00\",\"stock\":\"20\",\"_token\":\"uW6w35Mzc84dEx8kDDLPaqwQhp3llpPzEAev6X3S\",\"_method\":\"PUT\"}', '2020-08-05 15:15:58', '2020-08-05 15:15:58');
INSERT INTO `admin_operation_log` VALUES ('776', '1', 'admin/products/113', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 15:15:58', '2020-08-05 15:15:58');
INSERT INTO `admin_operation_log` VALUES ('777', '1', 'admin/skus/create', 'GET', '127.0.0.1', '{\"product_id\":\"113\",\"_pjax\":\"#pjax-container\"}', '2020-08-05 15:32:26', '2020-08-05 15:32:26');
INSERT INTO `admin_operation_log` VALUES ('778', '1', 'admin/skus', 'POST', '127.0.0.1', '{\"product_id\":\"113\",\"title\":\"3GB\\/32GB\",\"description\":\"3GB\\/32GB\",\"price\":\"4000\",\"original_price\":\"5000\",\"stock\":\"20\",\"_token\":\"uW6w35Mzc84dEx8kDDLPaqwQhp3llpPzEAev6X3S\"}', '2020-08-05 15:32:51', '2020-08-05 15:32:51');
INSERT INTO `admin_operation_log` VALUES ('779', '1', 'admin/skus', 'POST', '127.0.0.1', '{\"product_id\":\"113\",\"title\":\"3GB\\/32GB\",\"description\":\"3GB\\/32GB\",\"price\":\"4000\",\"original_price\":\"5000\",\"stock\":\"20\",\"_token\":\"uW6w35Mzc84dEx8kDDLPaqwQhp3llpPzEAev6X3S\"}', '2020-08-05 15:35:03', '2020-08-05 15:35:03');
INSERT INTO `admin_operation_log` VALUES ('780', '1', 'admin/skus', 'POST', '127.0.0.1', '{\"product_id\":\"113\",\"title\":\"3GB\\/32GB\",\"description\":\"3GB\\/32GB\",\"price\":\"4000\",\"original_price\":\"5000\",\"stock\":\"20\",\"_token\":\"uW6w35Mzc84dEx8kDDLPaqwQhp3llpPzEAev6X3S\"}', '2020-08-05 15:35:48', '2020-08-05 15:35:48');
INSERT INTO `admin_operation_log` VALUES ('781', '1', 'admin/skus/create', 'GET', '127.0.0.1', '{\"product_id\":\"113\"}', '2020-08-05 15:36:15', '2020-08-05 15:36:15');
INSERT INTO `admin_operation_log` VALUES ('782', '1', 'admin/skus', 'POST', '127.0.0.1', '{\"product_id\":\"113\",\"title\":\"12\",\"description\":\"12\",\"price\":\"4000\",\"original_price\":\"5000\",\"stock\":\"2\",\"_token\":\"uW6w35Mzc84dEx8kDDLPaqwQhp3llpPzEAev6X3S\",\"_previous_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/skus\\/create?product_id=113\"}', '2020-08-05 15:36:45', '2020-08-05 15:36:45');
INSERT INTO `admin_operation_log` VALUES ('783', '1', 'admin/skus/create', 'GET', '127.0.0.1', '{\"product_id\":\"113\"}', '2020-08-05 15:37:56', '2020-08-05 15:37:56');
INSERT INTO `admin_operation_log` VALUES ('784', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-08-05 16:01:46', '2020-08-05 16:01:46');
INSERT INTO `admin_operation_log` VALUES ('785', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 16:01:56', '2020-08-05 16:01:56');
INSERT INTO `admin_operation_log` VALUES ('786', '1', 'admin/products/113', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 16:01:59', '2020-08-05 16:01:59');
INSERT INTO `admin_operation_log` VALUES ('787', '1', 'admin/skus/216/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 16:02:20', '2020-08-05 16:02:20');
INSERT INTO `admin_operation_log` VALUES ('788', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-08-05 16:09:39', '2020-08-05 16:09:39');
INSERT INTO `admin_operation_log` VALUES ('789', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 16:09:43', '2020-08-05 16:09:43');
INSERT INTO `admin_operation_log` VALUES ('790', '1', 'admin/products/113', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 16:09:46', '2020-08-05 16:09:46');
INSERT INTO `admin_operation_log` VALUES ('791', '1', 'admin/skus/221', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"uW6w35Mzc84dEx8kDDLPaqwQhp3llpPzEAev6X3S\"}', '2020-08-05 16:09:55', '2020-08-05 16:09:55');
INSERT INTO `admin_operation_log` VALUES ('792', '1', 'admin/skus/221', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"uW6w35Mzc84dEx8kDDLPaqwQhp3llpPzEAev6X3S\"}', '2020-08-05 16:11:24', '2020-08-05 16:11:24');
INSERT INTO `admin_operation_log` VALUES ('793', '1', 'admin/products/113', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 16:11:24', '2020-08-05 16:11:24');
INSERT INTO `admin_operation_log` VALUES ('794', '1', 'admin/skus/220', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"uW6w35Mzc84dEx8kDDLPaqwQhp3llpPzEAev6X3S\"}', '2020-08-05 16:11:30', '2020-08-05 16:11:30');
INSERT INTO `admin_operation_log` VALUES ('795', '1', 'admin/products/113', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 16:11:31', '2020-08-05 16:11:31');
INSERT INTO `admin_operation_log` VALUES ('796', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-08-05 16:40:21', '2020-08-05 16:40:21');
INSERT INTO `admin_operation_log` VALUES ('797', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 16:42:02', '2020-08-05 16:42:02');
INSERT INTO `admin_operation_log` VALUES ('798', '1', 'admin/products/113', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 16:42:05', '2020-08-05 16:42:05');
INSERT INTO `admin_operation_log` VALUES ('799', '1', 'admin/skus/219', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"uW6w35Mzc84dEx8kDDLPaqwQhp3llpPzEAev6X3S\"}', '2020-08-05 16:42:13', '2020-08-05 16:42:13');
INSERT INTO `admin_operation_log` VALUES ('800', '1', 'admin/products/113', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 16:42:13', '2020-08-05 16:42:13');
INSERT INTO `admin_operation_log` VALUES ('801', '1', 'admin/skus/218/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 16:44:09', '2020-08-05 16:44:09');
INSERT INTO `admin_operation_log` VALUES ('802', '1', 'admin/skus/218', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"uW6w35Mzc84dEx8kDDLPaqwQhp3llpPzEAev6X3S\"}', '2020-08-05 16:45:24', '2020-08-05 16:45:24');
INSERT INTO `admin_operation_log` VALUES ('803', '1', 'admin/products/113', 'GET', '127.0.0.1', '[]', '2020-08-05 16:47:10', '2020-08-05 16:47:10');
INSERT INTO `admin_operation_log` VALUES ('804', '1', 'admin/skus/create', 'GET', '127.0.0.1', '{\"product_id\":\"113\",\"_pjax\":\"#pjax-container\"}', '2020-08-05 16:47:13', '2020-08-05 16:47:13');
INSERT INTO `admin_operation_log` VALUES ('805', '1', 'admin/skus', 'POST', '127.0.0.1', '{\"product_id\":\"113\",\"title\":\"4GB\\/32GB\",\"description\":\"4GB\\/32GB\",\"price\":\"5000\",\"original_price\":\"5000\",\"stock\":\"30\",\"_token\":\"uW6w35Mzc84dEx8kDDLPaqwQhp3llpPzEAev6X3S\"}', '2020-08-05 16:47:51', '2020-08-05 16:47:51');
INSERT INTO `admin_operation_log` VALUES ('806', '1', 'admin/products/113', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 16:47:52', '2020-08-05 16:47:52');
INSERT INTO `admin_operation_log` VALUES ('807', '1', 'admin/skus/220/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 16:49:14', '2020-08-05 16:49:14');
INSERT INTO `admin_operation_log` VALUES ('808', '1', 'admin/skus/220', 'PUT', '127.0.0.1', '{\"product_id\":\"113\",\"title\":\"3GB\\/32GB\",\"description\":\"3GB\\/32GB\",\"price\":\"5000.00\",\"original_price\":\"4000.00\",\"stock\":\"30\",\"_token\":\"uW6w35Mzc84dEx8kDDLPaqwQhp3llpPzEAev6X3S\",\"_method\":\"PUT\"}', '2020-08-05 16:49:24', '2020-08-05 16:49:24');
INSERT INTO `admin_operation_log` VALUES ('809', '1', 'admin/products/113', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 16:49:24', '2020-08-05 16:49:24');
INSERT INTO `admin_operation_log` VALUES ('810', '1', 'admin/skus/220/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 16:50:11', '2020-08-05 16:50:11');
INSERT INTO `admin_operation_log` VALUES ('811', '1', 'admin/skus/220', 'PUT', '127.0.0.1', '{\"product_id\":\"113\",\"title\":\"3GB\\/32GB\",\"description\":\"3GB\\/32GB\",\"price\":\"4000.00\",\"original_price\":\"5000.00\",\"stock\":\"30\",\"_token\":\"uW6w35Mzc84dEx8kDDLPaqwQhp3llpPzEAev6X3S\",\"_method\":\"PUT\"}', '2020-08-05 16:50:19', '2020-08-05 16:50:19');
INSERT INTO `admin_operation_log` VALUES ('812', '1', 'admin/products/113', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 16:50:20', '2020-08-05 16:50:20');
INSERT INTO `admin_operation_log` VALUES ('813', '1', 'admin/skus/create', 'GET', '127.0.0.1', '{\"product_id\":\"113\",\"_pjax\":\"#pjax-container\"}', '2020-08-05 16:50:57', '2020-08-05 16:50:57');
INSERT INTO `admin_operation_log` VALUES ('814', '1', 'admin/skus', 'POST', '127.0.0.1', '{\"product_id\":\"113\",\"title\":\"12\",\"description\":\"12\",\"price\":\"3000\",\"original_price\":\"3000\",\"stock\":\"11\",\"_token\":\"uW6w35Mzc84dEx8kDDLPaqwQhp3llpPzEAev6X3S\"}', '2020-08-05 16:51:11', '2020-08-05 16:51:11');
INSERT INTO `admin_operation_log` VALUES ('815', '1', 'admin/products/113', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 16:51:11', '2020-08-05 16:51:11');
INSERT INTO `admin_operation_log` VALUES ('816', '1', 'admin/skus/221/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 16:51:41', '2020-08-05 16:51:41');
INSERT INTO `admin_operation_log` VALUES ('817', '1', 'admin/skus/221', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"uW6w35Mzc84dEx8kDDLPaqwQhp3llpPzEAev6X3S\"}', '2020-08-05 16:52:11', '2020-08-05 16:52:11');
INSERT INTO `admin_operation_log` VALUES ('818', '1', 'admin/skus/create', 'GET', '127.0.0.1', '{\"product_id\":\"113\",\"_pjax\":\"#pjax-container\"}', '2020-08-05 16:52:32', '2020-08-05 16:52:32');
INSERT INTO `admin_operation_log` VALUES ('819', '1', 'admin/products/113', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 16:52:37', '2020-08-05 16:52:37');
INSERT INTO `admin_operation_log` VALUES ('820', '1', 'admin/products/113', 'GET', '127.0.0.1', '[]', '2020-08-05 16:52:38', '2020-08-05 16:52:38');
INSERT INTO `admin_operation_log` VALUES ('821', '1', 'admin/skus/create', 'GET', '127.0.0.1', '{\"product_id\":\"113\",\"_pjax\":\"#pjax-container\"}', '2020-08-05 16:52:44', '2020-08-05 16:52:44');
INSERT INTO `admin_operation_log` VALUES ('822', '1', 'admin/skus', 'POST', '127.0.0.1', '{\"product_id\":\"113\",\"title\":\"1212\",\"description\":\"12\",\"price\":\"2000\",\"original_price\":\"2000\",\"stock\":\"11\",\"_token\":\"uW6w35Mzc84dEx8kDDLPaqwQhp3llpPzEAev6X3S\"}', '2020-08-05 16:52:57', '2020-08-05 16:52:57');
INSERT INTO `admin_operation_log` VALUES ('823', '1', 'admin/products/113', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 16:52:57', '2020-08-05 16:52:57');
INSERT INTO `admin_operation_log` VALUES ('824', '1', 'admin/skus/222/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 16:53:05', '2020-08-05 16:53:05');
INSERT INTO `admin_operation_log` VALUES ('825', '1', 'admin/skus/222/edit', 'GET', '127.0.0.1', '[]', '2020-08-05 16:57:22', '2020-08-05 16:57:22');
INSERT INTO `admin_operation_log` VALUES ('826', '1', 'admin/skus/222/edit', 'GET', '127.0.0.1', '[]', '2020-08-05 16:57:48', '2020-08-05 16:57:48');
INSERT INTO `admin_operation_log` VALUES ('827', '1', 'admin/skus/222/edit', 'GET', '127.0.0.1', '[]', '2020-08-05 17:01:12', '2020-08-05 17:01:12');
INSERT INTO `admin_operation_log` VALUES ('828', '1', 'admin/skus/222/edit', 'GET', '127.0.0.1', '[]', '2020-08-05 17:03:31', '2020-08-05 17:03:31');
INSERT INTO `admin_operation_log` VALUES ('829', '1', 'admin/skus/222/edit', 'GET', '127.0.0.1', '[]', '2020-08-05 17:04:02', '2020-08-05 17:04:02');
INSERT INTO `admin_operation_log` VALUES ('830', '1', 'admin/skus/222', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"uW6w35Mzc84dEx8kDDLPaqwQhp3llpPzEAev6X3S\"}', '2020-08-05 17:04:21', '2020-08-05 17:04:21');
INSERT INTO `admin_operation_log` VALUES ('831', '1', 'admin/products/113', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 17:04:21', '2020-08-05 17:04:21');
INSERT INTO `admin_operation_log` VALUES ('832', '1', 'admin/products/113', 'GET', '127.0.0.1', '[]', '2020-08-05 17:04:32', '2020-08-05 17:04:32');
INSERT INTO `admin_operation_log` VALUES ('833', '1', 'admin/skus/create', 'GET', '127.0.0.1', '{\"product_id\":\"113\",\"_pjax\":\"#pjax-container\"}', '2020-08-05 17:04:49', '2020-08-05 17:04:49');
INSERT INTO `admin_operation_log` VALUES ('834', '1', 'admin/skus', 'POST', '127.0.0.1', '{\"product_id\":\"113\",\"title\":\"12\",\"description\":\"12\",\"price\":\"2000\",\"original_price\":\"2000\",\"stock\":\"11\",\"_token\":\"uW6w35Mzc84dEx8kDDLPaqwQhp3llpPzEAev6X3S\"}', '2020-08-05 17:05:04', '2020-08-05 17:05:04');
INSERT INTO `admin_operation_log` VALUES ('835', '1', 'admin/products/113', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 17:05:05', '2020-08-05 17:05:05');
INSERT INTO `admin_operation_log` VALUES ('836', '1', 'admin/skus/223/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 17:05:11', '2020-08-05 17:05:11');
INSERT INTO `admin_operation_log` VALUES ('837', '1', 'admin/skus/223', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"uW6w35Mzc84dEx8kDDLPaqwQhp3llpPzEAev6X3S\"}', '2020-08-05 17:05:22', '2020-08-05 17:05:22');
INSERT INTO `admin_operation_log` VALUES ('838', '1', 'admin/products/113', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 17:05:22', '2020-08-05 17:05:22');
INSERT INTO `admin_operation_log` VALUES ('839', '1', 'admin/skus/220', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"uW6w35Mzc84dEx8kDDLPaqwQhp3llpPzEAev6X3S\"}', '2020-08-05 17:14:02', '2020-08-05 17:14:02');
INSERT INTO `admin_operation_log` VALUES ('840', '1', 'admin/products/113', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 17:14:02', '2020-08-05 17:14:02');
INSERT INTO `admin_operation_log` VALUES ('841', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 17:14:30', '2020-08-05 17:14:30');
INSERT INTO `admin_operation_log` VALUES ('842', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 17:17:14', '2020-08-05 17:17:14');
INSERT INTO `admin_operation_log` VALUES ('843', '1', 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"12\",\"title\":\"\\u4f17\\u7b79\\u5546\\u54c1\",\"icon\":\"fa-flag-checkered\",\"uri\":\"\\/crowdfunding_products\",\"roles\":[null],\"permissions\":null,\"_token\":\"uW6w35Mzc84dEx8kDDLPaqwQhp3llpPzEAev6X3S\"}', '2020-08-05 17:18:07', '2020-08-05 17:18:07');
INSERT INTO `admin_operation_log` VALUES ('844', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-08-05 17:18:09', '2020-08-05 17:18:09');
INSERT INTO `admin_operation_log` VALUES ('845', '1', 'admin/crowdfunding_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 17:18:30', '2020-08-05 17:18:30');
INSERT INTO `admin_operation_log` VALUES ('846', '1', 'admin/crowdfunding_products', 'GET', '127.0.0.1', '[]', '2020-08-05 17:18:31', '2020-08-05 17:18:31');
INSERT INTO `admin_operation_log` VALUES ('847', '1', 'admin/crowdfunding_products', 'GET', '127.0.0.1', '[]', '2020-08-05 17:19:39', '2020-08-05 17:19:39');
INSERT INTO `admin_operation_log` VALUES ('848', '1', 'admin/crowdfunding_products', 'GET', '127.0.0.1', '[]', '2020-08-05 17:20:04', '2020-08-05 17:20:04');
INSERT INTO `admin_operation_log` VALUES ('849', '1', 'admin/crowdfunding_products', 'GET', '127.0.0.1', '[]', '2020-08-05 17:20:27', '2020-08-05 17:20:27');
INSERT INTO `admin_operation_log` VALUES ('850', '1', 'admin/crowdfunding_products', 'GET', '127.0.0.1', '[]', '2020-08-05 17:21:18', '2020-08-05 17:21:18');
INSERT INTO `admin_operation_log` VALUES ('851', '1', 'admin/crowdfunding_products', 'GET', '127.0.0.1', '[]', '2020-08-05 17:21:28', '2020-08-05 17:21:28');
INSERT INTO `admin_operation_log` VALUES ('852', '1', 'admin/crowdfunding_products/108/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 17:21:57', '2020-08-05 17:21:57');
INSERT INTO `admin_operation_log` VALUES ('853', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 17:25:21', '2020-08-05 17:25:21');
INSERT INTO `admin_operation_log` VALUES ('854', '1', 'admin/products/113/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 17:25:23', '2020-08-05 17:25:23');
INSERT INTO `admin_operation_log` VALUES ('855', '1', 'admin/crowdfunding_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 17:26:11', '2020-08-05 17:26:11');
INSERT INTO `admin_operation_log` VALUES ('856', '1', 'admin/crowdfunding_products/108/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 17:26:14', '2020-08-05 17:26:14');
INSERT INTO `admin_operation_log` VALUES ('857', '1', 'admin/crowdfunding_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 17:26:34', '2020-08-05 17:26:34');
INSERT INTO `admin_operation_log` VALUES ('858', '1', 'admin/crowdfunding_products/108/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 17:26:37', '2020-08-05 17:26:37');
INSERT INTO `admin_operation_log` VALUES ('859', '1', 'admin/crowdfunding_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 17:26:43', '2020-08-05 17:26:43');
INSERT INTO `admin_operation_log` VALUES ('860', '1', 'admin/crowdfunding_products/108/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 17:28:42', '2020-08-05 17:28:42');
INSERT INTO `admin_operation_log` VALUES ('861', '1', 'admin/crowdfunding_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 17:28:45', '2020-08-05 17:28:45');
INSERT INTO `admin_operation_log` VALUES ('862', '1', 'admin/crowdfunding_products', 'GET', '127.0.0.1', '[]', '2020-08-05 17:29:29', '2020-08-05 17:29:29');
INSERT INTO `admin_operation_log` VALUES ('863', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 17:31:17', '2020-08-05 17:31:17');
INSERT INTO `admin_operation_log` VALUES ('864', '1', 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"12\",\"title\":\"\\u79d2\\u6740\\u5546\\u54c1\",\"icon\":\"fa-bolt\",\"uri\":\"\\/seckill_products\",\"roles\":[null],\"permissions\":null,\"_token\":\"uW6w35Mzc84dEx8kDDLPaqwQhp3llpPzEAev6X3S\"}', '2020-08-05 17:32:09', '2020-08-05 17:32:09');
INSERT INTO `admin_operation_log` VALUES ('865', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-08-05 17:32:11', '2020-08-05 17:32:11');
INSERT INTO `admin_operation_log` VALUES ('866', '1', 'admin/seckill_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 17:33:52', '2020-08-05 17:33:52');
INSERT INTO `admin_operation_log` VALUES ('867', '1', 'admin/seckill_products', 'GET', '127.0.0.1', '[]', '2020-08-05 17:34:12', '2020-08-05 17:34:12');
INSERT INTO `admin_operation_log` VALUES ('868', '1', 'admin/seckill_products', 'GET', '127.0.0.1', '[]', '2020-08-05 17:34:50', '2020-08-05 17:34:50');
INSERT INTO `admin_operation_log` VALUES ('869', '1', 'admin/crowdfunding_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 17:35:05', '2020-08-05 17:35:05');
INSERT INTO `admin_operation_log` VALUES ('870', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 17:35:05', '2020-08-05 17:35:05');
INSERT INTO `admin_operation_log` VALUES ('871', '1', 'admin/crowdfunding_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 17:35:07', '2020-08-05 17:35:07');
INSERT INTO `admin_operation_log` VALUES ('872', '1', 'admin/seckill_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-05 17:35:07', '2020-08-05 17:35:07');
INSERT INTO `admin_operation_log` VALUES ('873', '0', 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2020-08-06 08:55:53', '2020-08-06 08:55:53');
INSERT INTO `admin_operation_log` VALUES ('874', '0', 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"tPr5vgsLPFZB3fSfKQVbDdY47KnSqbk1vbcr2q34\",\"username\":\"admin\",\"password\":\"adm******\"}', '2020-08-06 08:56:33', '2020-08-06 08:56:33');
INSERT INTO `admin_operation_log` VALUES ('875', '0', 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"tPr5vgsLPFZB3fSfKQVbDdY47KnSqbk1vbcr2q34\",\"username\":\"admin\",\"password\":\"adm******\"}', '2020-08-06 08:56:33', '2020-08-06 08:56:33');
INSERT INTO `admin_operation_log` VALUES ('876', '0', 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"tPr5vgsLPFZB3fSfKQVbDdY47KnSqbk1vbcr2q34\",\"username\":\"admin\",\"password\":\"adm******\"}', '2020-08-06 08:56:33', '2020-08-06 08:56:33');
INSERT INTO `admin_operation_log` VALUES ('877', '0', 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"tPr5vgsLPFZB3fSfKQVbDdY47KnSqbk1vbcr2q34\",\"username\":\"admin\",\"password\":\"adm******\"}', '2020-08-06 08:56:33', '2020-08-06 08:56:33');
INSERT INTO `admin_operation_log` VALUES ('878', '0', 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"tPr5vgsLPFZB3fSfKQVbDdY47KnSqbk1vbcr2q34\",\"username\":\"admin\",\"password\":\"adm******\"}', '2020-08-06 08:56:33', '2020-08-06 08:56:33');
INSERT INTO `admin_operation_log` VALUES ('879', '0', 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"tPr5vgsLPFZB3fSfKQVbDdY47KnSqbk1vbcr2q34\",\"username\":\"admin\",\"password\":\"adm******\"}', '2020-08-06 08:56:33', '2020-08-06 08:56:33');
INSERT INTO `admin_operation_log` VALUES ('880', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-08-06 08:56:34', '2020-08-06 08:56:34');
INSERT INTO `admin_operation_log` VALUES ('881', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-08-06 08:56:34', '2020-08-06 08:56:34');
INSERT INTO `admin_operation_log` VALUES ('882', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-08-06 08:56:34', '2020-08-06 08:56:34');
INSERT INTO `admin_operation_log` VALUES ('883', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-08-06 08:56:34', '2020-08-06 08:56:34');
INSERT INTO `admin_operation_log` VALUES ('884', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-08-06 08:56:34', '2020-08-06 08:56:34');
INSERT INTO `admin_operation_log` VALUES ('885', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-08-06 08:56:35', '2020-08-06 08:56:35');
INSERT INTO `admin_operation_log` VALUES ('886', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 08:56:58', '2020-08-06 08:56:58');
INSERT INTO `admin_operation_log` VALUES ('887', '1', 'admin/products/113', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 08:57:36', '2020-08-06 08:57:36');
INSERT INTO `admin_operation_log` VALUES ('888', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 08:57:57', '2020-08-06 08:57:57');
INSERT INTO `admin_operation_log` VALUES ('889', '1', 'admin/crowdfunding_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 08:58:39', '2020-08-06 08:58:39');
INSERT INTO `admin_operation_log` VALUES ('890', '1', 'admin/crowdfunding_products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 08:58:45', '2020-08-06 08:58:45');
INSERT INTO `admin_operation_log` VALUES ('891', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 08:59:02', '2020-08-06 08:59:02');
INSERT INTO `admin_operation_log` VALUES ('892', '1', 'admin/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 08:59:04', '2020-08-06 08:59:04');
INSERT INTO `admin_operation_log` VALUES ('893', '1', 'admin/crowdfunding_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 08:59:08', '2020-08-06 08:59:08');
INSERT INTO `admin_operation_log` VALUES ('894', '1', 'admin/categories', 'GET', '127.0.0.1', '[]', '2020-08-06 09:00:08', '2020-08-06 09:00:08');
INSERT INTO `admin_operation_log` VALUES ('895', '1', 'admin/categories', 'GET', '127.0.0.1', '{\"_token\":\"b76FcpNycGFWcOT2cWz9bQ9YdTPbAJpmtswfnSEd\",\"_parent_id_\":\"40\",\"_tier_\":\"1\",\"_children_page_40\":\"1\"}', '2020-08-06 09:00:15', '2020-08-06 09:00:15');
INSERT INTO `admin_operation_log` VALUES ('896', '1', 'admin/categories', 'GET', '127.0.0.1', '{\"_parent_id_\":\"41\",\"_tier_\":\"2\",\"_token\":\"b76FcpNycGFWcOT2cWz9bQ9YdTPbAJpmtswfnSEd\",\"_children_page_41\":\"1\"}', '2020-08-06 09:00:17', '2020-08-06 09:00:17');
INSERT INTO `admin_operation_log` VALUES ('897', '1', 'admin/crowdfunding_products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 09:04:47', '2020-08-06 09:04:47');
INSERT INTO `admin_operation_log` VALUES ('898', '1', 'admin/api/categories', 'GET', '127.0.0.1', '{\"is_directory\":\"0\",\"q\":\"d\"}', '2020-08-06 09:04:53', '2020-08-06 09:04:53');
INSERT INTO `admin_operation_log` VALUES ('899', '1', 'admin/api/categories', 'GET', '127.0.0.1', '{\"is_directory\":\"0\",\"q\":\"dia\"}', '2020-08-06 09:04:54', '2020-08-06 09:04:54');
INSERT INTO `admin_operation_log` VALUES ('900', '1', 'admin/api/categories', 'GET', '127.0.0.1', '{\"is_directory\":\"0\",\"q\":\"dians\"}', '2020-08-06 09:04:54', '2020-08-06 09:04:54');
INSERT INTO `admin_operation_log` VALUES ('901', '1', 'admin/api/categories', 'GET', '127.0.0.1', '{\"is_directory\":\"0\",\"q\":\"\\u7535\\u5546\"}', '2020-08-06 09:04:55', '2020-08-06 09:04:55');
INSERT INTO `admin_operation_log` VALUES ('902', '1', 'admin/api/categories', 'GET', '127.0.0.1', '{\"is_directory\":\"0\",\"q\":\"\\u7535\"}', '2020-08-06 09:04:55', '2020-08-06 09:04:55');
INSERT INTO `admin_operation_log` VALUES ('903', '1', 'admin/crowdfunding_products', 'POST', '127.0.0.1', '{\"_id\":\"lzgQ05L9RMxarZSk\",\"_token\":\"b76FcpNycGFWcOT2cWz9bQ9YdTPbAJpmtswfnSEd\",\"upload_column\":\"image\",\"id\":\"WU_FILE_0\",\"name\":\"ceMtdsu2CWHAA.jpg\",\"type\":\"image\\/jpeg\",\"lastModifiedDate\":\"Thu Aug 06 2020 09:05:11 GMT+0800 (\\u4e2d\\u56fd\\u6807\\u51c6\\u65f6\\u95f4)\",\"size\":\"92649\"}', '2020-08-06 09:06:51', '2020-08-06 09:06:51');
INSERT INTO `admin_operation_log` VALUES ('904', '1', 'admin/crowdfunding_products', 'POST', '127.0.0.1', '{\"type\":\"crowdfunding\",\"id\":null,\"title\":\"\\u5c0f\\u7c73\\u7535\\u89c6\\u5927\\u5e08 65\\u82f1\\u5bf8\",\"category_id\":\"41\",\"image\":\"product\\/0bee5c723b6cbcf91f1d180aff718e8b.jpg\",\"file-image\":null,\"_file_\":null,\"description\":\"10.7\\u4ebf\\u539f\\u8272\\u663e\\u793a\\uff0c98.5%DCI-P3\\u5e7f\\u8272\\u57df\\uff0c120Hz\\u6d41\\u901f\\u5c4f\\uff0cAI\\u5927\\u5e08\\u5f15\\u64ce\\uff0c3D\\u5168\\u666f\\u58f0\\uff0c\\u97f3\\u54cd\\u7cfb\\u7edf\",\"on_sale\":\"1\",\"recommend\":\"1\",\"crowdfunding\":{\"target_amount\":\"100000\",\"end_at\":\"2020-08-31 09:05:46\"},\"skus\":{\"new_1\":{\"title\":\"\\u5c0f\\u7c73L65M5-OD\",\"description\":\"\\u5c0f\\u7c73L65M5-OD\",\"price\":\"13000\",\"original_price\":\"0\",\"stock\":\"100\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"b76FcpNycGFWcOT2cWz9bQ9YdTPbAJpmtswfnSEd\"}', '2020-08-06 09:06:54', '2020-08-06 09:06:54');
INSERT INTO `admin_operation_log` VALUES ('905', '1', 'admin/crowdfunding_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 09:06:55', '2020-08-06 09:06:55');
INSERT INTO `admin_operation_log` VALUES ('906', '1', 'admin/crowdfunding_products/114/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 09:07:03', '2020-08-06 09:07:03');
INSERT INTO `admin_operation_log` VALUES ('907', '1', 'admin/crowdfunding_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 09:07:11', '2020-08-06 09:07:11');
INSERT INTO `admin_operation_log` VALUES ('908', '1', 'admin/crowdfunding_products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 09:07:17', '2020-08-06 09:07:17');
INSERT INTO `admin_operation_log` VALUES ('909', '1', 'admin/api/categories', 'GET', '127.0.0.1', '{\"is_directory\":\"0\",\"q\":\"dians\"}', '2020-08-06 09:07:30', '2020-08-06 09:07:30');
INSERT INTO `admin_operation_log` VALUES ('910', '1', 'admin/api/categories', 'GET', '127.0.0.1', '{\"is_directory\":\"0\",\"q\":\"\\u7535\\u5546\"}', '2020-08-06 09:07:31', '2020-08-06 09:07:31');
INSERT INTO `admin_operation_log` VALUES ('911', '1', 'admin/api/categories', 'GET', '127.0.0.1', '{\"is_directory\":\"0\",\"q\":\"\\u7535\"}', '2020-08-06 09:07:31', '2020-08-06 09:07:31');
INSERT INTO `admin_operation_log` VALUES ('912', '1', 'admin/crowdfunding_products', 'POST', '127.0.0.1', '{\"_id\":\"27LKSDJk53aQ5fqj\",\"_token\":\"b76FcpNycGFWcOT2cWz9bQ9YdTPbAJpmtswfnSEd\",\"upload_column\":\"image\",\"id\":\"WU_FILE_2\",\"name\":\"p4GdZkvbHg.png\",\"type\":\"image\\/png\",\"lastModifiedDate\":\"Tue Jul 28 2020 17:40:29 GMT+0800 (\\u4e2d\\u56fd\\u6807\\u51c6\\u65f6\\u95f4)\",\"size\":\"14846\"}', '2020-08-06 09:07:49', '2020-08-06 09:07:49');
INSERT INTO `admin_operation_log` VALUES ('913', '1', 'admin/crowdfunding_products', 'POST', '127.0.0.1', '{\"type\":\"crowdfunding\",\"id\":null,\"title\":\"\\u5b9d\\u6765\\u91d1\\u878d2019\\u5e74\\u4e2d\\u79cb\\u8282\\u653e\\u5047\\u901a\\u77e5\",\"category_id\":\"6\",\"image\":\"product\\/6b6936cc951083bca6897aa73f3ec290.png\",\"file-image\":null,\"_file_\":null,\"description\":\"12\",\"on_sale\":\"1\",\"recommend\":\"1\",\"crowdfunding\":{\"target_amount\":\"100\",\"end_at\":\"2020-08-31 09:07:56\"},\"skus\":{\"new_1\":{\"title\":\"1\",\"description\":\"1\",\"price\":\"1\",\"original_price\":\"0\",\"stock\":\"1\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"b76FcpNycGFWcOT2cWz9bQ9YdTPbAJpmtswfnSEd\",\"_previous_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/crowdfunding_products\"}', '2020-08-06 09:08:12', '2020-08-06 09:08:12');
INSERT INTO `admin_operation_log` VALUES ('914', '1', 'admin/crowdfunding_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 09:08:13', '2020-08-06 09:08:13');
INSERT INTO `admin_operation_log` VALUES ('915', '1', 'admin/crowdfunding_products/115/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 09:08:18', '2020-08-06 09:08:18');
INSERT INTO `admin_operation_log` VALUES ('916', '1', 'admin/crowdfunding_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 09:08:22', '2020-08-06 09:08:22');
INSERT INTO `admin_operation_log` VALUES ('917', '1', 'admin/crowdfunding_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 09:10:54', '2020-08-06 09:10:54');
INSERT INTO `admin_operation_log` VALUES ('918', '1', 'admin/crowdfunding_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 09:13:46', '2020-08-06 09:13:46');
INSERT INTO `admin_operation_log` VALUES ('919', '1', 'admin/crowdfunding_products/115', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"b76FcpNycGFWcOT2cWz9bQ9YdTPbAJpmtswfnSEd\"}', '2020-08-06 09:13:50', '2020-08-06 09:13:50');
INSERT INTO `admin_operation_log` VALUES ('920', '1', 'admin/crowdfunding_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 09:13:51', '2020-08-06 09:13:51');
INSERT INTO `admin_operation_log` VALUES ('921', '1', 'admin/crowdfunding_products/114/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 09:27:05', '2020-08-06 09:27:05');
INSERT INTO `admin_operation_log` VALUES ('922', '1', 'admin/crowdfunding_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 09:27:11', '2020-08-06 09:27:11');
INSERT INTO `admin_operation_log` VALUES ('923', '1', 'admin/crowdfunding_products', 'GET', '127.0.0.1', '[]', '2020-08-06 09:36:07', '2020-08-06 09:36:07');
INSERT INTO `admin_operation_log` VALUES ('924', '1', 'admin/products/114', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 09:36:11', '2020-08-06 09:36:11');
INSERT INTO `admin_operation_log` VALUES ('925', '1', 'admin/products/114', 'GET', '127.0.0.1', '[]', '2020-08-06 09:36:20', '2020-08-06 09:36:20');
INSERT INTO `admin_operation_log` VALUES ('926', '1', 'admin/crowdfunding_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 09:36:41', '2020-08-06 09:36:41');
INSERT INTO `admin_operation_log` VALUES ('927', '1', 'admin/crowdfunding_products', 'GET', '127.0.0.1', '[]', '2020-08-06 09:36:42', '2020-08-06 09:36:42');
INSERT INTO `admin_operation_log` VALUES ('928', '1', 'admin/crowdfunding_products/114', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 09:36:46', '2020-08-06 09:36:46');
INSERT INTO `admin_operation_log` VALUES ('929', '1', 'admin/crowdfunding_products/114', 'GET', '127.0.0.1', '[]', '2020-08-06 09:40:17', '2020-08-06 09:40:17');
INSERT INTO `admin_operation_log` VALUES ('930', '1', 'admin/crowdfunding_products/114', 'GET', '127.0.0.1', '[]', '2020-08-06 09:41:08', '2020-08-06 09:41:08');
INSERT INTO `admin_operation_log` VALUES ('931', '1', 'admin/crowdfunding_products/114', 'GET', '127.0.0.1', '[]', '2020-08-06 09:56:28', '2020-08-06 09:56:28');
INSERT INTO `admin_operation_log` VALUES ('932', '1', 'admin/crowdfunding_products/114', 'GET', '127.0.0.1', '[]', '2020-08-06 09:58:50', '2020-08-06 09:58:50');
INSERT INTO `admin_operation_log` VALUES ('933', '1', 'admin/crowdfunding_products/114', 'GET', '127.0.0.1', '[]', '2020-08-06 10:03:46', '2020-08-06 10:03:46');
INSERT INTO `admin_operation_log` VALUES ('934', '1', 'admin/crowdfunding_products/114', 'GET', '127.0.0.1', '[]', '2020-08-06 10:07:25', '2020-08-06 10:07:25');
INSERT INTO `admin_operation_log` VALUES ('935', '1', 'admin/crowdfunding_products/114', 'GET', '127.0.0.1', '[]', '2020-08-06 10:08:26', '2020-08-06 10:08:26');
INSERT INTO `admin_operation_log` VALUES ('936', '1', 'admin/crowdfunding_products/114', 'GET', '127.0.0.1', '[]', '2020-08-06 10:08:56', '2020-08-06 10:08:56');
INSERT INTO `admin_operation_log` VALUES ('937', '1', 'admin/crowdfunding_products/114', 'GET', '127.0.0.1', '[]', '2020-08-06 10:15:36', '2020-08-06 10:15:36');
INSERT INTO `admin_operation_log` VALUES ('938', '1', 'admin/crowdfunding_products/114', 'GET', '127.0.0.1', '[]', '2020-08-06 10:15:59', '2020-08-06 10:15:59');
INSERT INTO `admin_operation_log` VALUES ('939', '1', 'admin/crowdfunding_products/114', 'GET', '127.0.0.1', '[]', '2020-08-06 10:16:40', '2020-08-06 10:16:40');
INSERT INTO `admin_operation_log` VALUES ('940', '1', 'admin/crowdfunding_products/114', 'GET', '127.0.0.1', '[]', '2020-08-06 10:16:54', '2020-08-06 10:16:54');
INSERT INTO `admin_operation_log` VALUES ('941', '1', 'admin/crowdfunding_products/114', 'GET', '127.0.0.1', '[]', '2020-08-06 10:17:34', '2020-08-06 10:17:34');
INSERT INTO `admin_operation_log` VALUES ('942', '1', 'admin/crowdfunding_products/114', 'GET', '127.0.0.1', '[]', '2020-08-06 10:18:19', '2020-08-06 10:18:19');
INSERT INTO `admin_operation_log` VALUES ('943', '1', 'admin/crowdfunding_products/114', 'GET', '127.0.0.1', '[]', '2020-08-06 10:18:49', '2020-08-06 10:18:49');
INSERT INTO `admin_operation_log` VALUES ('944', '1', 'admin/crowdfunding_products/114', 'GET', '127.0.0.1', '[]', '2020-08-06 10:19:16', '2020-08-06 10:19:16');
INSERT INTO `admin_operation_log` VALUES ('945', '1', 'admin/crowdfunding_products/114', 'GET', '127.0.0.1', '[]', '2020-08-06 10:19:29', '2020-08-06 10:19:29');
INSERT INTO `admin_operation_log` VALUES ('946', '1', 'admin/crowdfunding_products/114', 'GET', '127.0.0.1', '[]', '2020-08-06 10:20:33', '2020-08-06 10:20:33');
INSERT INTO `admin_operation_log` VALUES ('947', '1', 'admin/crowdfunding_products/114', 'GET', '127.0.0.1', '[]', '2020-08-06 10:21:02', '2020-08-06 10:21:02');
INSERT INTO `admin_operation_log` VALUES ('948', '1', 'admin/crowdfunding_products/114', 'GET', '127.0.0.1', '[]', '2020-08-06 10:22:12', '2020-08-06 10:22:12');
INSERT INTO `admin_operation_log` VALUES ('949', '1', 'admin/crowdfunding_products/114', 'GET', '127.0.0.1', '[]', '2020-08-06 10:22:35', '2020-08-06 10:22:35');
INSERT INTO `admin_operation_log` VALUES ('950', '1', 'admin/crowdfunding_products/114', 'GET', '127.0.0.1', '[]', '2020-08-06 10:36:30', '2020-08-06 10:36:30');
INSERT INTO `admin_operation_log` VALUES ('951', '1', 'admin/crowdfunding_products/114', 'GET', '127.0.0.1', '[]', '2020-08-06 10:36:41', '2020-08-06 10:36:41');
INSERT INTO `admin_operation_log` VALUES ('952', '1', 'admin/crowdfunding_products/114', 'GET', '127.0.0.1', '[]', '2020-08-06 10:37:32', '2020-08-06 10:37:32');
INSERT INTO `admin_operation_log` VALUES ('953', '1', 'admin/crowdfunding_products/114', 'GET', '127.0.0.1', '[]', '2020-08-06 10:39:52', '2020-08-06 10:39:52');
INSERT INTO `admin_operation_log` VALUES ('954', '1', 'admin/crowdfunding_products/114/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 10:40:04', '2020-08-06 10:40:04');
INSERT INTO `admin_operation_log` VALUES ('955', '1', 'admin/crowdfunding_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 10:40:11', '2020-08-06 10:40:11');
INSERT INTO `admin_operation_log` VALUES ('956', '1', 'admin/crowdfunding_products/114', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 10:40:13', '2020-08-06 10:40:13');
INSERT INTO `admin_operation_log` VALUES ('957', '1', 'admin/crowdfunding_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 10:40:25', '2020-08-06 10:40:25');
INSERT INTO `admin_operation_log` VALUES ('958', '1', 'admin/seckill_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 10:41:27', '2020-08-06 10:41:27');
INSERT INTO `admin_operation_log` VALUES ('959', '1', 'admin/seckill_products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 10:41:33', '2020-08-06 10:41:33');
INSERT INTO `admin_operation_log` VALUES ('960', '1', 'admin/seckill_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 10:41:39', '2020-08-06 10:41:39');
INSERT INTO `admin_operation_log` VALUES ('961', '1', 'admin/seckill_products', 'GET', '127.0.0.1', '[]', '2020-08-06 10:48:41', '2020-08-06 10:48:41');
INSERT INTO `admin_operation_log` VALUES ('962', '1', 'admin/seckill_products/107', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 10:48:45', '2020-08-06 10:48:45');
INSERT INTO `admin_operation_log` VALUES ('963', '1', 'admin/seckill_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 10:48:59', '2020-08-06 10:48:59');
INSERT INTO `admin_operation_log` VALUES ('964', '1', 'admin/seckill_products/107/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 10:49:02', '2020-08-06 10:49:02');
INSERT INTO `admin_operation_log` VALUES ('965', '1', 'admin/seckill_products/107/edit', 'GET', '127.0.0.1', '[]', '2020-08-06 10:49:03', '2020-08-06 10:49:03');
INSERT INTO `admin_operation_log` VALUES ('966', '1', 'admin/seckill_products/107/edit', 'GET', '127.0.0.1', '[]', '2020-08-06 10:50:10', '2020-08-06 10:50:10');
INSERT INTO `admin_operation_log` VALUES ('967', '1', 'admin/seckill_products/107/edit', 'GET', '127.0.0.1', '[]', '2020-08-06 10:50:53', '2020-08-06 10:50:53');
INSERT INTO `admin_operation_log` VALUES ('968', '1', 'admin/seckill_products/107/edit', 'GET', '127.0.0.1', '[]', '2020-08-06 10:51:11', '2020-08-06 10:51:11');
INSERT INTO `admin_operation_log` VALUES ('969', '1', 'admin/seckill_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 10:51:29', '2020-08-06 10:51:29');
INSERT INTO `admin_operation_log` VALUES ('970', '1', 'admin/seckill_products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 11:00:58', '2020-08-06 11:00:58');
INSERT INTO `admin_operation_log` VALUES ('971', '1', 'admin/seckill_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 11:01:02', '2020-08-06 11:01:02');
INSERT INTO `admin_operation_log` VALUES ('972', '1', 'admin/seckill_products/107', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 11:01:04', '2020-08-06 11:01:04');
INSERT INTO `admin_operation_log` VALUES ('973', '1', 'admin/seckill_products/107', 'GET', '127.0.0.1', '[]', '2020-08-06 11:01:49', '2020-08-06 11:01:49');
INSERT INTO `admin_operation_log` VALUES ('974', '1', 'admin/seckill_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 11:01:56', '2020-08-06 11:01:56');
INSERT INTO `admin_operation_log` VALUES ('975', '1', 'admin/seckill_products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 11:03:41', '2020-08-06 11:03:41');
INSERT INTO `admin_operation_log` VALUES ('976', '1', 'admin/api/categories', 'GET', '127.0.0.1', '{\"is_directory\":\"0\",\"q\":\"\\u7b14\\u8bb0\\u672c\"}', '2020-08-06 11:03:47', '2020-08-06 11:03:47');
INSERT INTO `admin_operation_log` VALUES ('977', '1', 'admin/seckill_products', 'POST', '127.0.0.1', '{\"_id\":\"THK8atvbwl7MyrkH\",\"_token\":\"b76FcpNycGFWcOT2cWz9bQ9YdTPbAJpmtswfnSEd\",\"upload_column\":\"image\",\"id\":\"WU_FILE_0\",\"name\":\"ceMtdsu2CWHAA.jpg\",\"type\":\"image\\/jpeg\",\"lastModifiedDate\":\"Thu Aug 06 2020 11:04:17 GMT+0800 (\\u4e2d\\u56fd\\u6807\\u51c6\\u65f6\\u95f4)\",\"size\":\"43831\"}', '2020-08-06 11:06:03', '2020-08-06 11:06:03');
INSERT INTO `admin_operation_log` VALUES ('978', '1', 'admin/seckill_products', 'POST', '127.0.0.1', '{\"type\":\"seckill\",\"id\":null,\"title\":\"\\u82f9\\u679c\\u65b0\\u6b3eMacBook Pro 13\\u82f1\\u5bf8\",\"category_id\":\"18\",\"image\":\"product\\/a8606bb98bffff024f93081a5d0efa57.jpg\",\"file-image\":null,\"_file_\":null,\"description\":\"\\u7b2c\\u516b\\u4ee3\\u82f1\\u7279\\u5c14\\u9177\\u777fi5\\uff0c\\u89e6\\u63a7ID\\uff0c\\u89e6\\u63a7\\u680f\\uff0c\\u89c6\\u7f51\\u819c\\u663e\\u793a\\u5c4f\",\"on_sale\":\"1\",\"recommend\":\"1\",\"seckill\":{\"start_at\":\"2020-08-10 11:04:34\",\"end_at\":\"2020-08-31 11:04:39\"},\"skus\":{\"new_1\":{\"title\":\"MR9U2CH\\/A\",\"description\":\"Intel \\u9177\\u777fi5 8259U\",\"price\":\"10000\",\"original_price\":\"12000\",\"stock\":\"20\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"b76FcpNycGFWcOT2cWz9bQ9YdTPbAJpmtswfnSEd\",\"_previous_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/seckill_products\"}', '2020-08-06 11:06:06', '2020-08-06 11:06:06');
INSERT INTO `admin_operation_log` VALUES ('979', '1', 'admin/seckill_products', 'POST', '127.0.0.1', '{\"type\":\"seckill\",\"id\":null,\"title\":\"\\u82f9\\u679c\\u65b0\\u6b3eMacBook Pro 13\\u82f1\\u5bf8\",\"category_id\":\"18\",\"image\":\"product\\/a8606bb98bffff024f93081a5d0efa57.jpg\",\"file-image\":null,\"_file_\":null,\"description\":\"\\u7b2c\\u516b\\u4ee3\\u82f1\\u7279\\u5c14\\u9177\\u777fi5\\uff0c\\u89e6\\u63a7ID\\uff0c\\u89e6\\u63a7\\u680f\\uff0c\\u89c6\\u7f51\\u819c\\u663e\\u793a\\u5c4f\",\"on_sale\":\"1\",\"recommend\":\"1\",\"seckill\":{\"start_at\":\"2020-08-10 11:04:34\",\"end_at\":\"2020-08-31 11:04:39\"},\"skus\":{\"new_1\":{\"title\":\"MR9U2CH\\/A\",\"description\":\"Intel \\u9177\\u777fi5 8259U\",\"price\":\"10000\",\"original_price\":\"12000\",\"stock\":\"20\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"b76FcpNycGFWcOT2cWz9bQ9YdTPbAJpmtswfnSEd\",\"_previous_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/seckill_products\"}', '2020-08-06 11:07:59', '2020-08-06 11:07:59');
INSERT INTO `admin_operation_log` VALUES ('980', '1', 'admin/seckill_products', 'POST', '127.0.0.1', '{\"type\":\"seckill\",\"id\":null,\"title\":\"\\u82f9\\u679c\\u65b0\\u6b3eMacBook Pro 13\\u82f1\\u5bf8\",\"category_id\":\"18\",\"image\":\"product\\/a8606bb98bffff024f93081a5d0efa57.jpg\",\"file-image\":null,\"_file_\":null,\"description\":\"\\u7b2c\\u516b\\u4ee3\\u82f1\\u7279\\u5c14\\u9177\\u777fi5\\uff0c\\u89e6\\u63a7ID\\uff0c\\u89e6\\u63a7\\u680f\\uff0c\\u89c6\\u7f51\\u819c\\u663e\\u793a\\u5c4f\",\"on_sale\":\"1\",\"recommend\":\"1\",\"seckill\":{\"start_at\":\"2020-08-10 11:04:34\",\"end_at\":\"2020-08-31 11:04:39\"},\"skus\":{\"new_1\":{\"title\":\"MR9U2CH\\/A\",\"description\":\"Intel \\u9177\\u777fi5 8259U\",\"price\":\"10000\",\"original_price\":\"12000\",\"stock\":\"20\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"b76FcpNycGFWcOT2cWz9bQ9YdTPbAJpmtswfnSEd\",\"_previous_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/seckill_products\"}', '2020-08-06 11:12:59', '2020-08-06 11:12:59');
INSERT INTO `admin_operation_log` VALUES ('981', '1', 'admin/seckill_products', 'POST', '127.0.0.1', '{\"type\":\"seckill\",\"id\":null,\"title\":\"\\u82f9\\u679c\\u65b0\\u6b3eMacBook Pro 13\\u82f1\\u5bf8\",\"category_id\":\"18\",\"image\":\"product\\/a8606bb98bffff024f93081a5d0efa57.jpg\",\"file-image\":null,\"_file_\":null,\"description\":\"\\u7b2c\\u516b\\u4ee3\\u82f1\\u7279\\u5c14\\u9177\\u777fi5\\uff0c\\u89e6\\u63a7ID\\uff0c\\u89e6\\u63a7\\u680f\\uff0c\\u89c6\\u7f51\\u819c\\u663e\\u793a\\u5c4f\",\"on_sale\":\"1\",\"recommend\":\"1\",\"seckill\":{\"start_at\":\"2020-08-10 11:04:34\",\"end_at\":\"2020-08-31 11:04:39\"},\"skus\":{\"new_1\":{\"title\":\"MR9U2CH\\/A\",\"description\":\"Intel \\u9177\\u777fi5 8259U\",\"price\":\"10000\",\"original_price\":\"12000\",\"stock\":\"20\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"b76FcpNycGFWcOT2cWz9bQ9YdTPbAJpmtswfnSEd\",\"_previous_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/seckill_products\"}', '2020-08-06 11:16:39', '2020-08-06 11:16:39');
INSERT INTO `admin_operation_log` VALUES ('982', '1', 'admin/seckill_products', 'POST', '127.0.0.1', '{\"type\":\"seckill\",\"id\":null,\"title\":\"\\u82f9\\u679c\\u65b0\\u6b3eMacBook Pro 13\\u82f1\\u5bf8\",\"category_id\":\"18\",\"image\":\"product\\/a8606bb98bffff024f93081a5d0efa57.jpg\",\"file-image\":null,\"_file_\":null,\"description\":\"\\u7b2c\\u516b\\u4ee3\\u82f1\\u7279\\u5c14\\u9177\\u777fi5\\uff0c\\u89e6\\u63a7ID\\uff0c\\u89e6\\u63a7\\u680f\\uff0c\\u89c6\\u7f51\\u819c\\u663e\\u793a\\u5c4f\",\"on_sale\":\"1\",\"recommend\":\"1\",\"seckill\":{\"start_at\":\"2020-08-10 11:04:34\",\"end_at\":\"2020-08-31 11:04:39\"},\"skus\":{\"new_1\":{\"title\":\"MR9U2CH\\/A\",\"description\":\"Intel \\u9177\\u777fi5 8259U\",\"price\":\"10000\",\"original_price\":\"12000\",\"stock\":\"20\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"b76FcpNycGFWcOT2cWz9bQ9YdTPbAJpmtswfnSEd\",\"_previous_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/seckill_products\"}', '2020-08-06 11:19:04', '2020-08-06 11:19:04');
INSERT INTO `admin_operation_log` VALUES ('983', '1', 'admin/seckill_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 11:19:05', '2020-08-06 11:19:05');
INSERT INTO `admin_operation_log` VALUES ('984', '1', 'admin/seckill_products/117', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"b76FcpNycGFWcOT2cWz9bQ9YdTPbAJpmtswfnSEd\"}', '2020-08-06 11:22:57', '2020-08-06 11:22:57');
INSERT INTO `admin_operation_log` VALUES ('985', '1', 'admin/seckill_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 11:22:57', '2020-08-06 11:22:57');
INSERT INTO `admin_operation_log` VALUES ('986', '1', 'admin/seckill_products/116', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"b76FcpNycGFWcOT2cWz9bQ9YdTPbAJpmtswfnSEd\"}', '2020-08-06 11:23:03', '2020-08-06 11:23:03');
INSERT INTO `admin_operation_log` VALUES ('987', '1', 'admin/seckill_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 11:23:03', '2020-08-06 11:23:03');
INSERT INTO `admin_operation_log` VALUES ('988', '1', 'admin/seckill_products/119', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"b76FcpNycGFWcOT2cWz9bQ9YdTPbAJpmtswfnSEd\"}', '2020-08-06 11:23:07', '2020-08-06 11:23:07');
INSERT INTO `admin_operation_log` VALUES ('989', '1', 'admin/seckill_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 11:23:07', '2020-08-06 11:23:07');
INSERT INTO `admin_operation_log` VALUES ('990', '1', 'admin/seckill_products/120', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"b76FcpNycGFWcOT2cWz9bQ9YdTPbAJpmtswfnSEd\"}', '2020-08-06 11:23:12', '2020-08-06 11:23:12');
INSERT INTO `admin_operation_log` VALUES ('991', '1', 'admin/seckill_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 11:23:12', '2020-08-06 11:23:12');
INSERT INTO `admin_operation_log` VALUES ('992', '1', 'admin/seckill_products/118', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 11:23:17', '2020-08-06 11:23:17');
INSERT INTO `admin_operation_log` VALUES ('993', '1', 'admin/seckill_products/118/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 11:23:34', '2020-08-06 11:23:34');
INSERT INTO `admin_operation_log` VALUES ('994', '1', 'admin/seckill_products/118', 'PUT', '127.0.0.1', '{\"_file_del_\":null,\"_token\":\"b76FcpNycGFWcOT2cWz9bQ9YdTPbAJpmtswfnSEd\",\"_method\":\"PUT\",\"key\":\"product\\/a8606bb98bffff024f93081a5d0efa57.jpg\",\"_column\":\"image\"}', '2020-08-06 11:23:39', '2020-08-06 11:23:39');
INSERT INTO `admin_operation_log` VALUES ('995', '1', 'admin/seckill_products/118', 'PUT', '127.0.0.1', '{\"_file_del_\":null,\"_token\":\"b76FcpNycGFWcOT2cWz9bQ9YdTPbAJpmtswfnSEd\",\"_method\":\"PUT\",\"key\":\"product\\/a8606bb98bffff024f93081a5d0efa57.jpg\",\"_column\":\"image\"}', '2020-08-06 11:23:48', '2020-08-06 11:23:48');
INSERT INTO `admin_operation_log` VALUES ('996', '1', 'admin/seckill_products/118', 'PUT', '127.0.0.1', '{\"_file_del_\":null,\"_token\":\"b76FcpNycGFWcOT2cWz9bQ9YdTPbAJpmtswfnSEd\",\"_method\":\"PUT\",\"key\":\"product\\/a8606bb98bffff024f93081a5d0efa57.jpg\",\"_column\":\"image\"}', '2020-08-06 11:24:08', '2020-08-06 11:24:08');
INSERT INTO `admin_operation_log` VALUES ('997', '1', 'admin/seckill_products/118', 'PUT', '127.0.0.1', '{\"_id\":\"oPU5MgMnadrsyFnb\",\"_token\":\"b76FcpNycGFWcOT2cWz9bQ9YdTPbAJpmtswfnSEd\",\"upload_column\":\"image\",\"_method\":\"PUT\",\"id\":\"WU_FILE_1\",\"name\":\"ceMtdsu2CWHAA.jpg\",\"type\":\"image\\/jpeg\",\"lastModifiedDate\":\"Thu Aug 06 2020 11:04:17 GMT+0800 (\\u4e2d\\u56fd\\u6807\\u51c6\\u65f6\\u95f4)\",\"size\":\"43831\"}', '2020-08-06 11:24:14', '2020-08-06 11:24:14');
INSERT INTO `admin_operation_log` VALUES ('998', '1', 'admin/seckill_products/118', 'PUT', '127.0.0.1', '{\"_id\":\"oPU5MgMnadrsyFnb\",\"_token\":\"b76FcpNycGFWcOT2cWz9bQ9YdTPbAJpmtswfnSEd\",\"_method\":\"PUT\",\"image\":\"product\\/144d7840df85c40eefc1067877a7f090.jpg\"}', '2020-08-06 11:24:14', '2020-08-06 11:24:14');
INSERT INTO `admin_operation_log` VALUES ('999', '1', 'admin/seckill_products/118', 'PUT', '127.0.0.1', '{\"type\":\"seckill\",\"id\":\"118\",\"title\":\"\\u82f9\\u679c\\u65b0\\u6b3eMacBook Pro 13\\u82f1\\u5bf8\",\"category_id\":\"18\",\"image\":\"product\\/144d7840df85c40eefc1067877a7f090.jpg\",\"file-image\":null,\"_file_\":null,\"description\":\"\\u7b2c\\u516b\\u4ee3\\u82f1\\u7279\\u5c14\\u9177\\u777fi5\\uff0c\\u89e6\\u63a7ID\\uff0c\\u89e6\\u63a7\\u680f\\uff0c\\u89c6\\u7f51\\u819c\\u663e\\u793a\\u5c4f\",\"on_sale\":\"1\",\"recommend\":\"1\",\"seckill\":{\"start_at\":\"2020-08-10 11:04:34\",\"end_at\":\"2020-08-31 11:04:39\"},\"skus\":{\"228\":{\"title\":\"MR9U2CH\\/A\",\"description\":\"Intel \\u9177\\u777fi5 8259U\",\"price\":\"10000.00\",\"original_price\":\"12000.00\",\"stock\":\"20\",\"id\":\"228\",\"_remove_\":null}},\"_token\":\"b76FcpNycGFWcOT2cWz9bQ9YdTPbAJpmtswfnSEd\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/seckill_products\\/118\"}', '2020-08-06 11:24:16', '2020-08-06 11:24:16');
INSERT INTO `admin_operation_log` VALUES ('1000', '1', 'admin/seckill_products/118', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 11:24:17', '2020-08-06 11:24:17');
INSERT INTO `admin_operation_log` VALUES ('1001', '1', 'admin/seckill_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 11:24:22', '2020-08-06 11:24:22');
INSERT INTO `admin_operation_log` VALUES ('1002', '1', 'admin/seckill_products/118', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 11:24:23', '2020-08-06 11:24:23');
INSERT INTO `admin_operation_log` VALUES ('1003', '1', 'admin/seckill_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 11:24:29', '2020-08-06 11:24:29');
INSERT INTO `admin_operation_log` VALUES ('1004', '1', 'admin/seckill_products/118', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 11:24:31', '2020-08-06 11:24:31');
INSERT INTO `admin_operation_log` VALUES ('1005', '1', 'admin/seckill_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 11:24:42', '2020-08-06 11:24:42');
INSERT INTO `admin_operation_log` VALUES ('1006', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 12:53:14', '2020-08-06 12:53:14');
INSERT INTO `admin_operation_log` VALUES ('1007', '1', 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"12\",\"title\":\"\\u6d3b\\u52a8\\u5546\\u54c1\",\"icon\":\"fa-camera-retro\",\"uri\":\"\\/active_products\",\"roles\":[null],\"permissions\":null,\"_token\":\"b76FcpNycGFWcOT2cWz9bQ9YdTPbAJpmtswfnSEd\"}', '2020-08-06 12:53:42', '2020-08-06 12:53:42');
INSERT INTO `admin_operation_log` VALUES ('1008', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-08-06 12:53:43', '2020-08-06 12:53:43');
INSERT INTO `admin_operation_log` VALUES ('1009', '1', 'admin/active_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 12:54:30', '2020-08-06 12:54:30');
INSERT INTO `admin_operation_log` VALUES ('1010', '1', 'admin/active_products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 12:54:34', '2020-08-06 12:54:34');
INSERT INTO `admin_operation_log` VALUES ('1011', '1', 'admin/active_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 12:54:41', '2020-08-06 12:54:41');
INSERT INTO `admin_operation_log` VALUES ('1012', '1', 'admin/active_products', 'GET', '127.0.0.1', '[]', '2020-08-06 12:55:10', '2020-08-06 12:55:10');
INSERT INTO `admin_operation_log` VALUES ('1013', '1', 'admin/active_products', 'GET', '127.0.0.1', '[]', '2020-08-06 12:55:19', '2020-08-06 12:55:19');
INSERT INTO `admin_operation_log` VALUES ('1014', '1', 'admin/active_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 12:59:25', '2020-08-06 12:59:25');
INSERT INTO `admin_operation_log` VALUES ('1015', '1', 'admin/seckill_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 12:59:27', '2020-08-06 12:59:27');
INSERT INTO `admin_operation_log` VALUES ('1016', '1', 'admin/active_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 12:59:28', '2020-08-06 12:59:28');
INSERT INTO `admin_operation_log` VALUES ('1017', '1', 'admin/active_products', 'GET', '127.0.0.1', '[]', '2020-08-06 12:59:56', '2020-08-06 12:59:56');
INSERT INTO `admin_operation_log` VALUES ('1018', '1', 'admin/active_products', 'GET', '127.0.0.1', '[]', '2020-08-06 13:02:01', '2020-08-06 13:02:01');
INSERT INTO `admin_operation_log` VALUES ('1019', '1', 'admin/active_products', 'GET', '127.0.0.1', '[]', '2020-08-06 13:02:27', '2020-08-06 13:02:27');
INSERT INTO `admin_operation_log` VALUES ('1020', '1', 'admin/seckill_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 13:02:33', '2020-08-06 13:02:33');
INSERT INTO `admin_operation_log` VALUES ('1021', '1', 'admin/seckill_products', 'GET', '127.0.0.1', '[]', '2020-08-06 13:03:25', '2020-08-06 13:03:25');
INSERT INTO `admin_operation_log` VALUES ('1022', '1', 'admin/active_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 13:03:27', '2020-08-06 13:03:27');
INSERT INTO `admin_operation_log` VALUES ('1023', '1', 'admin/seckill_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 13:03:38', '2020-08-06 13:03:38');
INSERT INTO `admin_operation_log` VALUES ('1024', '1', 'admin/active_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 13:03:41', '2020-08-06 13:03:41');
INSERT INTO `admin_operation_log` VALUES ('1025', '1', 'admin/crowdfunding_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 13:03:59', '2020-08-06 13:03:59');
INSERT INTO `admin_operation_log` VALUES ('1026', '1', 'admin/active_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 13:04:02', '2020-08-06 13:04:02');
INSERT INTO `admin_operation_log` VALUES ('1027', '1', 'admin/crowdfunding_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 13:04:08', '2020-08-06 13:04:08');
INSERT INTO `admin_operation_log` VALUES ('1028', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 13:04:10', '2020-08-06 13:04:10');
INSERT INTO `admin_operation_log` VALUES ('1029', '1', 'admin/crowdfunding_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 13:04:16', '2020-08-06 13:04:16');
INSERT INTO `admin_operation_log` VALUES ('1030', '1', 'admin/seckill_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 13:04:17', '2020-08-06 13:04:17');
INSERT INTO `admin_operation_log` VALUES ('1031', '1', 'admin/active_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 13:04:19', '2020-08-06 13:04:19');
INSERT INTO `admin_operation_log` VALUES ('1032', '1', 'admin/active_products', 'GET', '127.0.0.1', '[]', '2020-08-06 13:05:03', '2020-08-06 13:05:03');
INSERT INTO `admin_operation_log` VALUES ('1033', '1', 'admin/active_products', 'GET', '127.0.0.1', '[]', '2020-08-06 13:05:30', '2020-08-06 13:05:30');
INSERT INTO `admin_operation_log` VALUES ('1034', '1', 'admin/active_products', 'GET', '127.0.0.1', '[]', '2020-08-06 13:06:03', '2020-08-06 13:06:03');
INSERT INTO `admin_operation_log` VALUES ('1035', '1', 'admin/active_products/78', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 13:06:06', '2020-08-06 13:06:06');
INSERT INTO `admin_operation_log` VALUES ('1036', '1', 'admin/active_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 13:06:37', '2020-08-06 13:06:37');
INSERT INTO `admin_operation_log` VALUES ('1037', '1', 'admin/active_products/78/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 13:06:40', '2020-08-06 13:06:40');
INSERT INTO `admin_operation_log` VALUES ('1038', '1', 'admin/active_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 13:06:45', '2020-08-06 13:06:45');
INSERT INTO `admin_operation_log` VALUES ('1039', '1', 'admin/active_products/78', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 13:06:48', '2020-08-06 13:06:48');
INSERT INTO `admin_operation_log` VALUES ('1040', '1', 'admin/active_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 13:08:23', '2020-08-06 13:08:23');
INSERT INTO `admin_operation_log` VALUES ('1041', '1', 'admin/active_products/78', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 13:08:27', '2020-08-06 13:08:27');
INSERT INTO `admin_operation_log` VALUES ('1042', '1', 'admin/skus/181/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 13:08:34', '2020-08-06 13:08:34');
INSERT INTO `admin_operation_log` VALUES ('1043', '1', 'admin/active_products/78', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 13:08:39', '2020-08-06 13:08:39');
INSERT INTO `admin_operation_log` VALUES ('1044', '1', 'admin/seckill_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 13:08:41', '2020-08-06 13:08:41');
INSERT INTO `admin_operation_log` VALUES ('1045', '1', 'admin/seckill_products/118', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 13:08:43', '2020-08-06 13:08:43');
INSERT INTO `admin_operation_log` VALUES ('1046', '1', 'admin/crowdfunding_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 13:08:46', '2020-08-06 13:08:46');
INSERT INTO `admin_operation_log` VALUES ('1047', '1', 'admin/crowdfunding_products/114', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 13:08:48', '2020-08-06 13:08:48');
INSERT INTO `admin_operation_log` VALUES ('1048', '1', 'admin/skus/224/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 13:08:51', '2020-08-06 13:08:51');
INSERT INTO `admin_operation_log` VALUES ('1049', '1', 'admin/active_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 13:08:55', '2020-08-06 13:08:55');
INSERT INTO `admin_operation_log` VALUES ('1050', '1', 'admin/active_products/78', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 13:08:57', '2020-08-06 13:08:57');
INSERT INTO `admin_operation_log` VALUES ('1051', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 13:13:29', '2020-08-06 13:13:29');
INSERT INTO `admin_operation_log` VALUES ('1052', '1', 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"12\",\"title\":\"\\u6298\\u6263\\u5546\\u54c1\",\"icon\":\"fa-shield\",\"uri\":\"\\/discount_products\",\"roles\":[null],\"permissions\":null,\"_token\":\"b76FcpNycGFWcOT2cWz9bQ9YdTPbAJpmtswfnSEd\"}', '2020-08-06 13:14:07', '2020-08-06 13:14:07');
INSERT INTO `admin_operation_log` VALUES ('1053', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-08-06 13:14:09', '2020-08-06 13:14:09');
INSERT INTO `admin_operation_log` VALUES ('1054', '1', 'admin/discount_products', 'GET', '127.0.0.1', '[]', '2020-08-06 13:14:49', '2020-08-06 13:14:49');
INSERT INTO `admin_operation_log` VALUES ('1055', '1', 'admin/discount_products', 'GET', '127.0.0.1', '[]', '2020-08-06 13:15:42', '2020-08-06 13:15:42');
INSERT INTO `admin_operation_log` VALUES ('1056', '1', 'admin/discount_products', 'GET', '127.0.0.1', '[]', '2020-08-06 13:16:51', '2020-08-06 13:16:51');
INSERT INTO `admin_operation_log` VALUES ('1057', '1', 'admin/discount_products', 'GET', '127.0.0.1', '[]', '2020-08-06 13:17:02', '2020-08-06 13:17:02');
INSERT INTO `admin_operation_log` VALUES ('1058', '1', 'admin/discount_products/112', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 13:17:05', '2020-08-06 13:17:05');
INSERT INTO `admin_operation_log` VALUES ('1059', '1', 'admin/discount_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 13:17:12', '2020-08-06 13:17:12');
INSERT INTO `admin_operation_log` VALUES ('1060', '1', 'admin/discount_products/112/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 13:17:14', '2020-08-06 13:17:14');
INSERT INTO `admin_operation_log` VALUES ('1061', '1', 'admin/discount_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 13:17:21', '2020-08-06 13:17:21');
INSERT INTO `admin_operation_log` VALUES ('1062', '1', 'admin/discount_products', 'GET', '127.0.0.1', '[]', '2020-08-06 13:17:54', '2020-08-06 13:17:54');
INSERT INTO `admin_operation_log` VALUES ('1063', '1', 'admin/discount_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 13:18:12', '2020-08-06 13:18:12');
INSERT INTO `admin_operation_log` VALUES ('1064', '1', 'admin/active_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 13:18:14', '2020-08-06 13:18:14');
INSERT INTO `admin_operation_log` VALUES ('1065', '1', 'admin/seckill_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 13:18:15', '2020-08-06 13:18:15');
INSERT INTO `admin_operation_log` VALUES ('1066', '1', 'admin/crowdfunding_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 13:18:16', '2020-08-06 13:18:16');
INSERT INTO `admin_operation_log` VALUES ('1067', '1', 'admin/seckill_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 13:18:18', '2020-08-06 13:18:18');
INSERT INTO `admin_operation_log` VALUES ('1068', '1', 'admin/active_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 13:18:19', '2020-08-06 13:18:19');
INSERT INTO `admin_operation_log` VALUES ('1069', '1', 'admin/discount_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 13:18:20', '2020-08-06 13:18:20');
INSERT INTO `admin_operation_log` VALUES ('1070', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 13:52:43', '2020-08-06 13:52:43');
INSERT INTO `admin_operation_log` VALUES ('1071', '1', 'admin/crowdfunding_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 13:52:46', '2020-08-06 13:52:46');
INSERT INTO `admin_operation_log` VALUES ('1072', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 14:04:08', '2020-08-06 14:04:08');
INSERT INTO `admin_operation_log` VALUES ('1073', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 14:05:11', '2020-08-06 14:05:11');
INSERT INTO `admin_operation_log` VALUES ('1074', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 14:05:13', '2020-08-06 14:05:13');
INSERT INTO `admin_operation_log` VALUES ('1075', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-06 14:05:15', '2020-08-06 14:05:15');
INSERT INTO `admin_operation_log` VALUES ('1076', '1', 'admin/discount_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 14:41:29', '2020-08-06 14:41:29');
INSERT INTO `admin_operation_log` VALUES ('1077', '1', 'admin/active_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 14:41:33', '2020-08-06 14:41:33');
INSERT INTO `admin_operation_log` VALUES ('1078', '1', 'admin/seckill_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 14:41:34', '2020-08-06 14:41:34');
INSERT INTO `admin_operation_log` VALUES ('1079', '1', 'admin/crowdfunding_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 14:41:36', '2020-08-06 14:41:36');
INSERT INTO `admin_operation_log` VALUES ('1080', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 14:41:37', '2020-08-06 14:41:37');
INSERT INTO `admin_operation_log` VALUES ('1081', '1', 'admin/discount_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 14:41:42', '2020-08-06 14:41:42');
INSERT INTO `admin_operation_log` VALUES ('1082', '1', 'admin/discount_products/112/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 14:41:43', '2020-08-06 14:41:43');
INSERT INTO `admin_operation_log` VALUES ('1083', '1', 'admin/discount_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 14:41:51', '2020-08-06 14:41:51');
INSERT INTO `admin_operation_log` VALUES ('1084', '1', 'admin/discount_products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 14:41:56', '2020-08-06 14:41:56');
INSERT INTO `admin_operation_log` VALUES ('1085', '1', 'admin/discount_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 14:42:00', '2020-08-06 14:42:00');
INSERT INTO `admin_operation_log` VALUES ('1086', '1', 'admin/active_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 14:42:11', '2020-08-06 14:42:11');
INSERT INTO `admin_operation_log` VALUES ('1087', '1', 'admin/seckill_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 14:42:12', '2020-08-06 14:42:12');
INSERT INTO `admin_operation_log` VALUES ('1088', '1', 'admin/crowdfunding_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 14:42:14', '2020-08-06 14:42:14');
INSERT INTO `admin_operation_log` VALUES ('1089', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 14:46:22', '2020-08-06 14:46:22');
INSERT INTO `admin_operation_log` VALUES ('1090', '1', 'admin/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 14:46:42', '2020-08-06 14:46:42');
INSERT INTO `admin_operation_log` VALUES ('1091', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 14:47:24', '2020-08-06 14:47:24');
INSERT INTO `admin_operation_log` VALUES ('1092', '1', 'admin/products/113', 'PUT', '127.0.0.1', '{\"_token\":\"b76FcpNycGFWcOT2cWz9bQ9YdTPbAJpmtswfnSEd\",\"_method\":\"PUT\",\"on_sale\":\"0\"}', '2020-08-06 14:47:31', '2020-08-06 14:47:31');
INSERT INTO `admin_operation_log` VALUES ('1093', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 14:47:36', '2020-08-06 14:47:36');
INSERT INTO `admin_operation_log` VALUES ('1094', '1', 'admin/products/113', 'PUT', '127.0.0.1', '{\"_token\":\"b76FcpNycGFWcOT2cWz9bQ9YdTPbAJpmtswfnSEd\",\"_method\":\"PUT\",\"on_sale\":\"1\"}', '2020-08-06 14:47:39', '2020-08-06 14:47:39');
INSERT INTO `admin_operation_log` VALUES ('1095', '1', 'admin/products/96', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 14:48:27', '2020-08-06 14:48:27');
INSERT INTO `admin_operation_log` VALUES ('1096', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 14:48:38', '2020-08-06 14:48:38');
INSERT INTO `admin_operation_log` VALUES ('1097', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 14:59:14', '2020-08-06 14:59:14');
INSERT INTO `admin_operation_log` VALUES ('1098', '1', 'admin/products/98', 'PUT', '127.0.0.1', '{\"_token\":\"b76FcpNycGFWcOT2cWz9bQ9YdTPbAJpmtswfnSEd\",\"_method\":\"PUT\",\"recommend\":\"1\"}', '2020-08-06 14:59:23', '2020-08-06 14:59:23');
INSERT INTO `admin_operation_log` VALUES ('1099', '1', 'admin/crowdfunding_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 15:30:02', '2020-08-06 15:30:02');
INSERT INTO `admin_operation_log` VALUES ('1100', '1', 'admin/active_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 15:36:13', '2020-08-06 15:36:13');
INSERT INTO `admin_operation_log` VALUES ('1101', '1', 'admin/active_products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 15:45:13', '2020-08-06 15:45:13');
INSERT INTO `admin_operation_log` VALUES ('1102', '1', 'admin/api/categories', 'GET', '127.0.0.1', '{\"is_directory\":\"0\",\"q\":\"shou\"}', '2020-08-06 15:45:19', '2020-08-06 15:45:19');
INSERT INTO `admin_operation_log` VALUES ('1103', '1', 'admin/api/categories', 'GET', '127.0.0.1', '{\"is_directory\":\"0\",\"q\":\"s\"}', '2020-08-06 15:45:20', '2020-08-06 15:45:20');
INSERT INTO `admin_operation_log` VALUES ('1104', '1', 'admin/api/categories', 'GET', '127.0.0.1', '{\"is_directory\":\"0\",\"q\":\"zhi\"}', '2020-08-06 15:45:22', '2020-08-06 15:45:22');
INSERT INTO `admin_operation_log` VALUES ('1105', '1', 'admin/api/categories', 'GET', '127.0.0.1', '{\"is_directory\":\"0\",\"q\":\"zhinen\"}', '2020-08-06 15:45:22', '2020-08-06 15:45:22');
INSERT INTO `admin_operation_log` VALUES ('1106', '1', 'admin/api/categories', 'GET', '127.0.0.1', '{\"is_directory\":\"0\",\"q\":\"zhineng\"}', '2020-08-06 15:45:23', '2020-08-06 15:45:23');
INSERT INTO `admin_operation_log` VALUES ('1107', '1', 'admin/api/categories', 'GET', '127.0.0.1', '{\"is_directory\":\"0\",\"q\":\"\\u667a\\u80fd\"}', '2020-08-06 15:45:23', '2020-08-06 15:45:23');
INSERT INTO `admin_operation_log` VALUES ('1108', '1', 'admin/active_products', 'POST', '127.0.0.1', '{\"_id\":\"qpWxQatW77RJWm9e\",\"_token\":\"b76FcpNycGFWcOT2cWz9bQ9YdTPbAJpmtswfnSEd\",\"upload_column\":\"image\",\"id\":\"WU_FILE_0\",\"name\":\"ceMtdsu2CWHAA.jpg\",\"type\":\"image\\/jpeg\",\"lastModifiedDate\":\"Thu Aug 06 2020 15:45:04 GMT+0800 (\\u4e2d\\u56fd\\u6807\\u51c6\\u65f6\\u95f4)\",\"size\":\"51989\"}', '2020-08-06 15:46:28', '2020-08-06 15:46:28');
INSERT INTO `admin_operation_log` VALUES ('1109', '1', 'admin/active_products', 'POST', '127.0.0.1', '{\"type\":\"active\",\"id\":null,\"title\":\"\\u5c0f\\u7c7310\",\"category_id\":\"25\",\"image\":\"product\\/00aa60d90281624184e097b72521f37d.jpg\",\"file-image\":null,\"_file_\":null,\"description\":\"\\u9a81\\u9f99865\\uff0c\\u4e00\\u4ebf\\u50cf\\u7d20\\uff0c8K\\u7535\\u5f71\\u76f8\\u673a\",\"on_sale\":\"1\",\"recommend\":\"1\",\"active\":{\"end_at\":\"2020-08-31 15:45:46\"},\"skus\":{\"new_1\":{\"title\":\"8GB\\/128GB\",\"description\":\"8GB\\/128GB\",\"price\":\"3600\",\"original_price\":\"4000\",\"stock\":\"20\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"b76FcpNycGFWcOT2cWz9bQ9YdTPbAJpmtswfnSEd\",\"_previous_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/active_products\"}', '2020-08-06 15:46:31', '2020-08-06 15:46:31');
INSERT INTO `admin_operation_log` VALUES ('1110', '1', 'admin/active_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 15:46:31', '2020-08-06 15:46:31');
INSERT INTO `admin_operation_log` VALUES ('1111', '1', 'admin/active_products', 'GET', '127.0.0.1', '[]', '2020-08-06 15:52:15', '2020-08-06 15:52:15');
INSERT INTO `admin_operation_log` VALUES ('1112', '1', 'admin/active_products', 'GET', '127.0.0.1', '[]', '2020-08-06 15:52:27', '2020-08-06 15:52:27');
INSERT INTO `admin_operation_log` VALUES ('1113', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-08-06 16:19:06', '2020-08-06 16:19:06');
INSERT INTO `admin_operation_log` VALUES ('1114', '1', 'admin/active_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 16:19:31', '2020-08-06 16:19:31');
INSERT INTO `admin_operation_log` VALUES ('1115', '1', 'admin/active_products', 'GET', '127.0.0.1', '[]', '2020-08-06 16:20:12', '2020-08-06 16:20:12');
INSERT INTO `admin_operation_log` VALUES ('1116', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-08-06 16:37:33', '2020-08-06 16:37:33');
INSERT INTO `admin_operation_log` VALUES ('1117', '1', 'admin/active_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 16:38:01', '2020-08-06 16:38:01');
INSERT INTO `admin_operation_log` VALUES ('1118', '1', 'admin/active_products', 'GET', '127.0.0.1', '[]', '2020-08-06 16:39:03', '2020-08-06 16:39:03');
INSERT INTO `admin_operation_log` VALUES ('1119', '1', 'admin/dcat-api/action', 'POST', '127.0.0.1', '{\"model\":\"App\\\\Models\\\\ActiveProduct\",\"_token\":\"b76FcpNycGFWcOT2cWz9bQ9YdTPbAJpmtswfnSEd\",\"_action\":\"App_Admin_Actions_Grid_BackProduct\",\"_key\":\"121\"}', '2020-08-06 16:40:12', '2020-08-06 16:40:12');
INSERT INTO `admin_operation_log` VALUES ('1120', '1', 'admin/active_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 16:40:12', '2020-08-06 16:40:12');
INSERT INTO `admin_operation_log` VALUES ('1121', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 16:40:19', '2020-08-06 16:40:19');
INSERT INTO `admin_operation_log` VALUES ('1122', '1', 'admin/products/121/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 16:40:22', '2020-08-06 16:40:22');
INSERT INTO `admin_operation_log` VALUES ('1123', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 16:44:41', '2020-08-06 16:44:41');
INSERT INTO `admin_operation_log` VALUES ('1124', '1', 'admin/products/121', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 16:45:12', '2020-08-06 16:45:12');
INSERT INTO `admin_operation_log` VALUES ('1125', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 16:45:19', '2020-08-06 16:45:19');
INSERT INTO `admin_operation_log` VALUES ('1126', '1', 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 16:45:25', '2020-08-06 16:45:25');
INSERT INTO `admin_operation_log` VALUES ('1127', '1', 'admin/active_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 16:57:30', '2020-08-06 16:57:30');
INSERT INTO `admin_operation_log` VALUES ('1128', '1', 'admin/active_products', 'GET', '127.0.0.1', '[]', '2020-08-06 16:58:27', '2020-08-06 16:58:27');
INSERT INTO `admin_operation_log` VALUES ('1129', '1', 'admin/active_products', 'GET', '127.0.0.1', '[]', '2020-08-06 17:14:52', '2020-08-06 17:14:52');
INSERT INTO `admin_operation_log` VALUES ('1130', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 17:14:54', '2020-08-06 17:14:54');
INSERT INTO `admin_operation_log` VALUES ('1131', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-06 17:36:41', '2020-08-06 17:36:41');
INSERT INTO `admin_operation_log` VALUES ('1132', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-06 17:39:11', '2020-08-06 17:39:11');
INSERT INTO `admin_operation_log` VALUES ('1133', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-06 17:40:21', '2020-08-06 17:40:21');
INSERT INTO `admin_operation_log` VALUES ('1134', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-06 17:45:02', '2020-08-06 17:45:02');
INSERT INTO `admin_operation_log` VALUES ('1135', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-06 17:47:21', '2020-08-06 17:47:21');
INSERT INTO `admin_operation_log` VALUES ('1136', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-06 17:47:51', '2020-08-06 17:47:51');
INSERT INTO `admin_operation_log` VALUES ('1137', '1', 'admin/dcat-api/form', 'POST', '127.0.0.1', '{\"end_at\":\"2020-08-31 17:47:51\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\ProductActive\",\"_current_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/products?\",\"_token\":\"b76FcpNycGFWcOT2cWz9bQ9YdTPbAJpmtswfnSEd\"}', '2020-08-06 17:48:09', '2020-08-06 17:48:09');
INSERT INTO `admin_operation_log` VALUES ('1138', '1', 'admin/dcat-api/form', 'POST', '127.0.0.1', '{\"end_at\":\"2020-08-31 17:47:51\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\ProductActive\",\"_current_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/products?\",\"_token\":\"b76FcpNycGFWcOT2cWz9bQ9YdTPbAJpmtswfnSEd\"}', '2020-08-06 17:49:48', '2020-08-06 17:49:48');
INSERT INTO `admin_operation_log` VALUES ('1139', '1', 'admin/dcat-api/form', 'POST', '127.0.0.1', '{\"end_at\":\"2020-08-31 17:47:51\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\ProductActive\",\"_current_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/products?\",\"_token\":\"b76FcpNycGFWcOT2cWz9bQ9YdTPbAJpmtswfnSEd\"}', '2020-08-06 17:50:05', '2020-08-06 17:50:05');
INSERT INTO `admin_operation_log` VALUES ('1140', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-06 17:50:09', '2020-08-06 17:50:09');
INSERT INTO `admin_operation_log` VALUES ('1141', '1', 'admin/dcat-api/form', 'POST', '127.0.0.1', '{\"end_at\":\"2020-08-31 17:50:09\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\ProductActive\",\"_current_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/products?\",\"_token\":\"b76FcpNycGFWcOT2cWz9bQ9YdTPbAJpmtswfnSEd\"}', '2020-08-06 17:50:16', '2020-08-06 17:50:16');
INSERT INTO `admin_operation_log` VALUES ('1142', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-06 17:51:13', '2020-08-06 17:51:13');
INSERT INTO `admin_operation_log` VALUES ('1143', '1', 'admin/dcat-api/form', 'POST', '127.0.0.1', '{\"end_at\":\"2020-08-31 17:51:14\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\ProductActive\",\"_current_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/products?\",\"_token\":\"b76FcpNycGFWcOT2cWz9bQ9YdTPbAJpmtswfnSEd\"}', '2020-08-06 17:51:19', '2020-08-06 17:51:19');
INSERT INTO `admin_operation_log` VALUES ('1144', '1', 'admin/dcat-api/form', 'POST', '127.0.0.1', '{\"end_at\":\"2020-08-31 17:51:14\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\ProductActive\",\"_current_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/products?\",\"_token\":\"b76FcpNycGFWcOT2cWz9bQ9YdTPbAJpmtswfnSEd\"}', '2020-08-06 17:52:10', '2020-08-06 17:52:10');
INSERT INTO `admin_operation_log` VALUES ('1145', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-06 17:52:20', '2020-08-06 17:52:20');
INSERT INTO `admin_operation_log` VALUES ('1146', '1', 'admin/dcat-api/form', 'POST', '127.0.0.1', '{\"end_at\":\"2020-08-31 17:52:20\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\ProductActive\",\"_current_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/products?\",\"_token\":\"b76FcpNycGFWcOT2cWz9bQ9YdTPbAJpmtswfnSEd\"}', '2020-08-06 17:52:27', '2020-08-06 17:52:27');
INSERT INTO `admin_operation_log` VALUES ('1147', '1', 'admin/dcat-api/form', 'POST', '127.0.0.1', '{\"end_at\":\"2020-08-31 17:52:20\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\ProductActive\",\"_current_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/products?\",\"_token\":\"b76FcpNycGFWcOT2cWz9bQ9YdTPbAJpmtswfnSEd\"}', '2020-08-06 17:53:50', '2020-08-06 17:53:50');
INSERT INTO `admin_operation_log` VALUES ('1148', '1', 'admin/dcat-api/form', 'POST', '127.0.0.1', '{\"end_at\":\"2020-08-31 17:52:20\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\ProductActive\",\"_current_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/products?\",\"_token\":\"b76FcpNycGFWcOT2cWz9bQ9YdTPbAJpmtswfnSEd\"}', '2020-08-06 17:54:42', '2020-08-06 17:54:42');
INSERT INTO `admin_operation_log` VALUES ('1149', '1', 'admin/dcat-api/form', 'POST', '127.0.0.1', '{\"end_at\":\"2020-08-31 17:52:20\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\ProductActive\",\"_current_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/products?\",\"_token\":\"b76FcpNycGFWcOT2cWz9bQ9YdTPbAJpmtswfnSEd\"}', '2020-08-06 17:55:15', '2020-08-06 17:55:15');
INSERT INTO `admin_operation_log` VALUES ('1150', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-06 17:55:18', '2020-08-06 17:55:18');
INSERT INTO `admin_operation_log` VALUES ('1151', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-06 17:55:36', '2020-08-06 17:55:36');
INSERT INTO `admin_operation_log` VALUES ('1152', '1', 'admin/active_products', 'GET', '127.0.0.1', '[]', '2020-08-06 17:55:49', '2020-08-06 17:55:49');
INSERT INTO `admin_operation_log` VALUES ('1153', '1', 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 17:56:00', '2020-08-06 17:56:00');
INSERT INTO `admin_operation_log` VALUES ('1154', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 17:56:06', '2020-08-06 17:56:06');
INSERT INTO `admin_operation_log` VALUES ('1155', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 17:56:18', '2020-08-06 17:56:18');
INSERT INTO `admin_operation_log` VALUES ('1156', '1', 'admin/dcat-api/form', 'POST', '127.0.0.1', '{\"end_at\":\"2020-08-06 17:56:19\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\ProductActive\",\"_current_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/products?_pjax=%23pjax-container\",\"_token\":\"b76FcpNycGFWcOT2cWz9bQ9YdTPbAJpmtswfnSEd\"}', '2020-08-06 17:57:05', '2020-08-06 17:57:05');
INSERT INTO `admin_operation_log` VALUES ('1157', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-06 18:00:01', '2020-08-06 18:00:01');
INSERT INTO `admin_operation_log` VALUES ('1158', '1', 'admin/dcat-api/form', 'POST', '127.0.0.1', '{\"end_at\":\"2020-08-31 18:00:01\",\"product_id\":\"121\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\ProductActive\",\"_current_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/products?\",\"_token\":\"b76FcpNycGFWcOT2cWz9bQ9YdTPbAJpmtswfnSEd\"}', '2020-08-06 18:00:09', '2020-08-06 18:00:09');
INSERT INTO `admin_operation_log` VALUES ('1159', '1', 'admin/dcat-api/form', 'POST', '127.0.0.1', '{\"end_at\":\"2020-08-31 18:00:01\",\"product_id\":\"121\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\ProductActive\",\"_current_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/products?\",\"_token\":\"b76FcpNycGFWcOT2cWz9bQ9YdTPbAJpmtswfnSEd\"}', '2020-08-06 18:00:24', '2020-08-06 18:00:24');
INSERT INTO `admin_operation_log` VALUES ('1160', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-06 18:00:27', '2020-08-06 18:00:27');
INSERT INTO `admin_operation_log` VALUES ('1161', '1', 'admin/dcat-api/form', 'POST', '127.0.0.1', '{\"end_at\":\"2020-08-31 18:00:27\",\"product_id\":\"121\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\ProductActive\",\"_current_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/products?\",\"_token\":\"b76FcpNycGFWcOT2cWz9bQ9YdTPbAJpmtswfnSEd\"}', '2020-08-06 18:00:32', '2020-08-06 18:00:32');
INSERT INTO `admin_operation_log` VALUES ('1162', '1', 'admin/dcat-api/form', 'POST', '127.0.0.1', '{\"end_at\":\"2020-08-31 18:00:27\",\"product_id\":\"121\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\ProductActive\",\"_current_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/products?\",\"_token\":\"b76FcpNycGFWcOT2cWz9bQ9YdTPbAJpmtswfnSEd\"}', '2020-08-06 18:02:46', '2020-08-06 18:02:46');
INSERT INTO `admin_operation_log` VALUES ('1163', '0', 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2020-08-07 09:07:15', '2020-08-07 09:07:15');
INSERT INTO `admin_operation_log` VALUES ('1164', '0', 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"mlIBOP1WF3soJLiKwuwjMojhWalsUQBHMJpLYqCx\",\"username\":\"admin\",\"password\":\"adm******\"}', '2020-08-07 09:07:39', '2020-08-07 09:07:39');
INSERT INTO `admin_operation_log` VALUES ('1165', '0', 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"mlIBOP1WF3soJLiKwuwjMojhWalsUQBHMJpLYqCx\",\"username\":\"admin\",\"password\":\"adm******\"}', '2020-08-07 09:07:39', '2020-08-07 09:07:39');
INSERT INTO `admin_operation_log` VALUES ('1166', '0', 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"mlIBOP1WF3soJLiKwuwjMojhWalsUQBHMJpLYqCx\",\"username\":\"admin\",\"password\":\"adm******\"}', '2020-08-07 09:07:39', '2020-08-07 09:07:39');
INSERT INTO `admin_operation_log` VALUES ('1167', '0', 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"mlIBOP1WF3soJLiKwuwjMojhWalsUQBHMJpLYqCx\",\"username\":\"admin\",\"password\":\"adm******\"}', '2020-08-07 09:07:39', '2020-08-07 09:07:39');
INSERT INTO `admin_operation_log` VALUES ('1168', '0', 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"mlIBOP1WF3soJLiKwuwjMojhWalsUQBHMJpLYqCx\",\"username\":\"admin\",\"password\":\"adm******\"}', '2020-08-07 09:07:39', '2020-08-07 09:07:39');
INSERT INTO `admin_operation_log` VALUES ('1169', '0', 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"mlIBOP1WF3soJLiKwuwjMojhWalsUQBHMJpLYqCx\",\"username\":\"admin\",\"password\":\"adm******\"}', '2020-08-07 09:07:39', '2020-08-07 09:07:39');
INSERT INTO `admin_operation_log` VALUES ('1170', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-08-07 09:07:41', '2020-08-07 09:07:41');
INSERT INTO `admin_operation_log` VALUES ('1171', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-08-07 09:07:41', '2020-08-07 09:07:41');
INSERT INTO `admin_operation_log` VALUES ('1172', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-08-07 09:07:41', '2020-08-07 09:07:41');
INSERT INTO `admin_operation_log` VALUES ('1173', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-08-07 09:07:41', '2020-08-07 09:07:41');
INSERT INTO `admin_operation_log` VALUES ('1174', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-08-07 09:07:41', '2020-08-07 09:07:41');
INSERT INTO `admin_operation_log` VALUES ('1175', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-08-07 09:07:41', '2020-08-07 09:07:41');
INSERT INTO `admin_operation_log` VALUES ('1176', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 09:07:46', '2020-08-07 09:07:46');
INSERT INTO `admin_operation_log` VALUES ('1177', '1', 'admin/dcat-api/form', 'POST', '127.0.0.1', '{\"end_at\":\"2020-08-07 09:07:47\",\"product_id\":\"121\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\ProductActive\",\"_current_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/products?_pjax=%23pjax-container\",\"_token\":\"s1rBWLQL7GONqIXGnrKI2gGQNsw4lzYIE7p2vptK\"}', '2020-08-07 09:07:56', '2020-08-07 09:07:56');
INSERT INTO `admin_operation_log` VALUES ('1178', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-07 09:08:44', '2020-08-07 09:08:44');
INSERT INTO `admin_operation_log` VALUES ('1179', '1', 'admin/dcat-api/form', 'POST', '127.0.0.1', '{\"end_at\":\"2020-08-07 09:08:45\",\"product_id\":\"121\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\ProductActive\",\"_current_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/products?\",\"_token\":\"s1rBWLQL7GONqIXGnrKI2gGQNsw4lzYIE7p2vptK\"}', '2020-08-07 09:08:52', '2020-08-07 09:08:52');
INSERT INTO `admin_operation_log` VALUES ('1180', '1', 'admin/dcat-api/form', 'POST', '127.0.0.1', '{\"end_at\":\"2020-08-07 09:08:45\",\"product_id\":\"121\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\ProductActive\",\"_current_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/products?\",\"_token\":\"s1rBWLQL7GONqIXGnrKI2gGQNsw4lzYIE7p2vptK\"}', '2020-08-07 09:10:22', '2020-08-07 09:10:22');
INSERT INTO `admin_operation_log` VALUES ('1181', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-07 09:10:28', '2020-08-07 09:10:28');
INSERT INTO `admin_operation_log` VALUES ('1182', '1', 'admin/dcat-api/form', 'POST', '127.0.0.1', '{\"end_at\":\"2020-08-07 09:10:28\",\"product_id\":\"121\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\ProductActive\",\"_current_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/products?\",\"_token\":\"s1rBWLQL7GONqIXGnrKI2gGQNsw4lzYIE7p2vptK\"}', '2020-08-07 09:10:31', '2020-08-07 09:10:31');
INSERT INTO `admin_operation_log` VALUES ('1183', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-07 09:29:36', '2020-08-07 09:29:36');
INSERT INTO `admin_operation_log` VALUES ('1184', '1', 'admin/dcat-api/form', 'POST', '127.0.0.1', '{\"end_at\":\"2020-08-31 09:29:37\",\"product_id\":\"121\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\ProductActive\",\"_current_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/products?\",\"_token\":\"s1rBWLQL7GONqIXGnrKI2gGQNsw4lzYIE7p2vptK\"}', '2020-08-07 09:29:48', '2020-08-07 09:29:48');
INSERT INTO `admin_operation_log` VALUES ('1185', '1', 'admin/dcat-api/form', 'POST', '127.0.0.1', '{\"end_at\":\"2020-08-31 09:29:37\",\"product_id\":\"121\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\ProductActive\",\"_current_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/products?\",\"_token\":\"s1rBWLQL7GONqIXGnrKI2gGQNsw4lzYIE7p2vptK\"}', '2020-08-07 09:38:19', '2020-08-07 09:38:19');
INSERT INTO `admin_operation_log` VALUES ('1186', '1', 'admin/dcat-api/form', 'POST', '127.0.0.1', '{\"end_at\":\"2020-08-31 09:29:37\",\"product_id\":\"121\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\ProductActive\",\"_current_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/products?\",\"_token\":\"s1rBWLQL7GONqIXGnrKI2gGQNsw4lzYIE7p2vptK\"}', '2020-08-07 09:40:41', '2020-08-07 09:40:41');
INSERT INTO `admin_operation_log` VALUES ('1187', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-07 09:40:43', '2020-08-07 09:40:43');
INSERT INTO `admin_operation_log` VALUES ('1188', '1', 'admin/dcat-api/form', 'POST', '127.0.0.1', '{\"end_at\":\"2020-08-07 09:40:43\",\"product_id\":\"121\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\ProductActive\",\"_current_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/products?\",\"_token\":\"s1rBWLQL7GONqIXGnrKI2gGQNsw4lzYIE7p2vptK\"}', '2020-08-07 09:40:54', '2020-08-07 09:40:54');
INSERT INTO `admin_operation_log` VALUES ('1189', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-07 09:42:36', '2020-08-07 09:42:36');
INSERT INTO `admin_operation_log` VALUES ('1190', '1', 'admin/dcat-api/form', 'POST', '127.0.0.1', '{\"end_at\":\"2020-08-31 09:42:36\",\"product_id\":\"121\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\ProductActive\",\"_current_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/products?\",\"_token\":\"s1rBWLQL7GONqIXGnrKI2gGQNsw4lzYIE7p2vptK\"}', '2020-08-07 09:42:44', '2020-08-07 09:42:44');
INSERT INTO `admin_operation_log` VALUES ('1191', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-07 09:43:56', '2020-08-07 09:43:56');
INSERT INTO `admin_operation_log` VALUES ('1192', '1', 'admin/dcat-api/form', 'POST', '127.0.0.1', '{\"end_at\":\"2020-08-31 09:43:56\",\"product_id\":\"121\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\ProductActive\",\"_current_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/products?\",\"_token\":\"s1rBWLQL7GONqIXGnrKI2gGQNsw4lzYIE7p2vptK\"}', '2020-08-07 09:44:03', '2020-08-07 09:44:03');
INSERT INTO `admin_operation_log` VALUES ('1193', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-07 09:45:59', '2020-08-07 09:45:59');
INSERT INTO `admin_operation_log` VALUES ('1194', '1', 'admin/dcat-api/form', 'POST', '127.0.0.1', '{\"end_at\":\"2020-08-31 09:45:59\",\"product_id\":\"121\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\ProductActive\",\"_current_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/products?\",\"_token\":\"s1rBWLQL7GONqIXGnrKI2gGQNsw4lzYIE7p2vptK\"}', '2020-08-07 09:46:10', '2020-08-07 09:46:10');
INSERT INTO `admin_operation_log` VALUES ('1195', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 09:46:10', '2020-08-07 09:46:10');
INSERT INTO `admin_operation_log` VALUES ('1196', '1', 'admin/active_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 09:46:19', '2020-08-07 09:46:19');
INSERT INTO `admin_operation_log` VALUES ('1197', '1', 'admin/dcat-api/action', 'POST', '127.0.0.1', '{\"model\":\"App\\\\Models\\\\ActiveProduct\",\"_token\":\"s1rBWLQL7GONqIXGnrKI2gGQNsw4lzYIE7p2vptK\",\"_action\":\"App_Admin_Actions_Grid_BackProduct\",\"_key\":\"121\"}', '2020-08-07 10:04:02', '2020-08-07 10:04:02');
INSERT INTO `admin_operation_log` VALUES ('1198', '1', 'admin/active_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 10:04:03', '2020-08-07 10:04:03');
INSERT INTO `admin_operation_log` VALUES ('1199', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 10:04:09', '2020-08-07 10:04:09');
INSERT INTO `admin_operation_log` VALUES ('1200', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-07 10:12:34', '2020-08-07 10:12:34');
INSERT INTO `admin_operation_log` VALUES ('1201', '1', 'admin/crowdfunding_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 10:12:45', '2020-08-07 10:12:45');
INSERT INTO `admin_operation_log` VALUES ('1202', '1', 'admin/crowdfunding_products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 10:12:47', '2020-08-07 10:12:47');
INSERT INTO `admin_operation_log` VALUES ('1203', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 10:23:03', '2020-08-07 10:23:03');
INSERT INTO `admin_operation_log` VALUES ('1204', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 10:26:23', '2020-08-07 10:26:23');
INSERT INTO `admin_operation_log` VALUES ('1205', '1', 'admin/crowdfunding_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 10:26:25', '2020-08-07 10:26:25');
INSERT INTO `admin_operation_log` VALUES ('1206', '1', 'admin/seckill_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 10:26:28', '2020-08-07 10:26:28');
INSERT INTO `admin_operation_log` VALUES ('1207', '1', 'admin/active_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 10:26:31', '2020-08-07 10:26:31');
INSERT INTO `admin_operation_log` VALUES ('1208', '1', 'admin/discount_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 10:26:34', '2020-08-07 10:26:34');
INSERT INTO `admin_operation_log` VALUES ('1209', '1', 'admin/active_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 10:26:35', '2020-08-07 10:26:35');
INSERT INTO `admin_operation_log` VALUES ('1210', '1', 'admin/active_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 10:26:49', '2020-08-07 10:26:49');
INSERT INTO `admin_operation_log` VALUES ('1211', '1', 'admin/discount_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 10:26:51', '2020-08-07 10:26:51');
INSERT INTO `admin_operation_log` VALUES ('1212', '1', 'admin/seckill_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 10:26:53', '2020-08-07 10:26:53');
INSERT INTO `admin_operation_log` VALUES ('1213', '1', 'admin/crowdfunding_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 10:27:09', '2020-08-07 10:27:09');
INSERT INTO `admin_operation_log` VALUES ('1214', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 10:27:11', '2020-08-07 10:27:11');
INSERT INTO `admin_operation_log` VALUES ('1215', '1', 'admin/seckill_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 10:27:13', '2020-08-07 10:27:13');
INSERT INTO `admin_operation_log` VALUES ('1216', '1', 'admin/seckill_products', 'GET', '127.0.0.1', '[]', '2020-08-07 10:28:27', '2020-08-07 10:28:27');
INSERT INTO `admin_operation_log` VALUES ('1217', '1', 'admin/seckill_products', 'GET', '127.0.0.1', '[]', '2020-08-07 10:30:12', '2020-08-07 10:30:12');
INSERT INTO `admin_operation_log` VALUES ('1218', '1', 'admin/seckill_products', 'GET', '127.0.0.1', '[]', '2020-08-07 10:30:49', '2020-08-07 10:30:49');
INSERT INTO `admin_operation_log` VALUES ('1219', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-08-07 11:22:17', '2020-08-07 11:22:17');
INSERT INTO `admin_operation_log` VALUES ('1220', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 11:22:47', '2020-08-07 11:22:47');
INSERT INTO `admin_operation_log` VALUES ('1221', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-07 11:24:28', '2020-08-07 11:24:28');
INSERT INTO `admin_operation_log` VALUES ('1222', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-07 11:27:50', '2020-08-07 11:27:50');
INSERT INTO `admin_operation_log` VALUES ('1223', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-07 11:28:31', '2020-08-07 11:28:31');
INSERT INTO `admin_operation_log` VALUES ('1224', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-07 11:30:13', '2020-08-07 11:30:13');
INSERT INTO `admin_operation_log` VALUES ('1225', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-07 11:30:53', '2020-08-07 11:30:53');
INSERT INTO `admin_operation_log` VALUES ('1226', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-07 11:31:08', '2020-08-07 11:31:08');
INSERT INTO `admin_operation_log` VALUES ('1227', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-07 11:32:54', '2020-08-07 11:32:54');
INSERT INTO `admin_operation_log` VALUES ('1228', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-07 11:33:46', '2020-08-07 11:33:46');
INSERT INTO `admin_operation_log` VALUES ('1229', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-07 11:34:56', '2020-08-07 11:34:56');
INSERT INTO `admin_operation_log` VALUES ('1230', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-07 11:35:25', '2020-08-07 11:35:25');
INSERT INTO `admin_operation_log` VALUES ('1231', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-07 11:35:52', '2020-08-07 11:35:52');
INSERT INTO `admin_operation_log` VALUES ('1232', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-07 11:37:13', '2020-08-07 11:37:13');
INSERT INTO `admin_operation_log` VALUES ('1233', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-07 11:38:13', '2020-08-07 11:38:13');
INSERT INTO `admin_operation_log` VALUES ('1234', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-07 11:38:59', '2020-08-07 11:38:59');
INSERT INTO `admin_operation_log` VALUES ('1235', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-07 11:40:22', '2020-08-07 11:40:22');
INSERT INTO `admin_operation_log` VALUES ('1236', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-07 11:40:27', '2020-08-07 11:40:27');
INSERT INTO `admin_operation_log` VALUES ('1237', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-07 13:28:35', '2020-08-07 13:28:35');
INSERT INTO `admin_operation_log` VALUES ('1238', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-07 13:29:01', '2020-08-07 13:29:01');
INSERT INTO `admin_operation_log` VALUES ('1239', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-07 13:29:51', '2020-08-07 13:29:51');
INSERT INTO `admin_operation_log` VALUES ('1240', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-07 13:39:12', '2020-08-07 13:39:12');
INSERT INTO `admin_operation_log` VALUES ('1241', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-07 13:40:44', '2020-08-07 13:40:44');
INSERT INTO `admin_operation_log` VALUES ('1242', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-07 13:50:53', '2020-08-07 13:50:53');
INSERT INTO `admin_operation_log` VALUES ('1243', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-07 13:51:37', '2020-08-07 13:51:37');
INSERT INTO `admin_operation_log` VALUES ('1244', '1', 'admin/dcat-api/form', 'POST', '127.0.0.1', '{\"product_id\":\"121\",\"type\":\"active\",\"end_at\":\"2020-08-17 13:51:37\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\ProductActive\",\"_current_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/products?\",\"_token\":\"s1rBWLQL7GONqIXGnrKI2gGQNsw4lzYIE7p2vptK\"}', '2020-08-07 13:51:49', '2020-08-07 13:51:49');
INSERT INTO `admin_operation_log` VALUES ('1245', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 13:51:50', '2020-08-07 13:51:50');
INSERT INTO `admin_operation_log` VALUES ('1246', '1', 'admin/active_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 13:51:54', '2020-08-07 13:51:54');
INSERT INTO `admin_operation_log` VALUES ('1247', '1', 'admin/dcat-api/action', 'POST', '127.0.0.1', '{\"model\":\"App\\\\Models\\\\ActiveProduct\",\"_token\":\"s1rBWLQL7GONqIXGnrKI2gGQNsw4lzYIE7p2vptK\",\"_action\":\"App_Admin_Actions_Grid_BackProduct\",\"_key\":\"121\"}', '2020-08-07 13:52:04', '2020-08-07 13:52:04');
INSERT INTO `admin_operation_log` VALUES ('1248', '1', 'admin/active_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 13:52:04', '2020-08-07 13:52:04');
INSERT INTO `admin_operation_log` VALUES ('1249', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 13:52:07', '2020-08-07 13:52:07');
INSERT INTO `admin_operation_log` VALUES ('1250', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-07 13:53:03', '2020-08-07 13:53:03');
INSERT INTO `admin_operation_log` VALUES ('1251', '1', 'admin/dcat-api/form', 'POST', '127.0.0.1', '{\"product_id\":\"121\",\"type\":\"crowdfunding\",\"target_amount\":\"100000\",\"end_at\":\"2020-08-18 00:00:00\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\ProductActive\",\"_current_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/products?\",\"_token\":\"s1rBWLQL7GONqIXGnrKI2gGQNsw4lzYIE7p2vptK\"}', '2020-08-07 13:53:50', '2020-08-07 13:53:50');
INSERT INTO `admin_operation_log` VALUES ('1252', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 13:53:51', '2020-08-07 13:53:51');
INSERT INTO `admin_operation_log` VALUES ('1253', '1', 'admin/crowdfunding_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 13:53:53', '2020-08-07 13:53:53');
INSERT INTO `admin_operation_log` VALUES ('1254', '1', 'admin/crowdfunding_products/121', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 13:54:00', '2020-08-07 13:54:00');
INSERT INTO `admin_operation_log` VALUES ('1255', '1', 'admin/crowdfunding_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 13:54:09', '2020-08-07 13:54:09');
INSERT INTO `admin_operation_log` VALUES ('1256', '1', 'admin/dcat-api/action', 'POST', '127.0.0.1', '{\"model\":\"App\\\\Models\\\\CrowdfundingProduct\",\"_token\":\"s1rBWLQL7GONqIXGnrKI2gGQNsw4lzYIE7p2vptK\",\"_action\":\"App_Admin_Actions_Grid_BackProduct\",\"_key\":\"121\"}', '2020-08-07 13:54:13', '2020-08-07 13:54:13');
INSERT INTO `admin_operation_log` VALUES ('1257', '1', 'admin/crowdfunding_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 13:54:13', '2020-08-07 13:54:13');
INSERT INTO `admin_operation_log` VALUES ('1258', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 13:54:18', '2020-08-07 13:54:18');
INSERT INTO `admin_operation_log` VALUES ('1259', '1', 'admin/dcat-api/form', 'POST', '127.0.0.1', '{\"product_id\":\"121\",\"type\":\"seckill\",\"start_at\":\"2020-08-08 13:54:18\",\"end_at\":\"2020-08-18 00:00:00\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\ProductActive\",\"_current_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/products?_pjax=%23pjax-container\",\"_token\":\"s1rBWLQL7GONqIXGnrKI2gGQNsw4lzYIE7p2vptK\"}', '2020-08-07 13:54:40', '2020-08-07 13:54:40');
INSERT INTO `admin_operation_log` VALUES ('1260', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 13:54:40', '2020-08-07 13:54:40');
INSERT INTO `admin_operation_log` VALUES ('1261', '1', 'admin/seckill_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 13:54:43', '2020-08-07 13:54:43');
INSERT INTO `admin_operation_log` VALUES ('1262', '1', 'admin/dcat-api/action', 'POST', '127.0.0.1', '{\"model\":\"App\\\\Models\\\\SeckillProduct\",\"_token\":\"s1rBWLQL7GONqIXGnrKI2gGQNsw4lzYIE7p2vptK\",\"_action\":\"App_Admin_Actions_Grid_BackProduct\",\"_key\":\"121\"}', '2020-08-07 13:54:54', '2020-08-07 13:54:54');
INSERT INTO `admin_operation_log` VALUES ('1263', '1', 'admin/seckill_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 13:54:54', '2020-08-07 13:54:54');
INSERT INTO `admin_operation_log` VALUES ('1264', '1', 'admin/discount_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 13:55:11', '2020-08-07 13:55:11');
INSERT INTO `admin_operation_log` VALUES ('1265', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 13:55:58', '2020-08-07 13:55:58');
INSERT INTO `admin_operation_log` VALUES ('1266', '1', 'admin/discount_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 13:58:18', '2020-08-07 13:58:18');
INSERT INTO `admin_operation_log` VALUES ('1267', '1', 'admin/discount_products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 13:58:20', '2020-08-07 13:58:20');
INSERT INTO `admin_operation_log` VALUES ('1268', '1', 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 14:40:55', '2020-08-07 14:40:55');
INSERT INTO `admin_operation_log` VALUES ('1269', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 14:41:11', '2020-08-07 14:41:11');
INSERT INTO `admin_operation_log` VALUES ('1270', '1', 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"post_type\":\"1\",\"renderable\":\"App_Admin_Repositories_UserAddress\",\"key\":\"1\"}', '2020-08-07 14:41:13', '2020-08-07 14:41:13');
INSERT INTO `admin_operation_log` VALUES ('1271', '1', 'admin/discount_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 14:43:09', '2020-08-07 14:43:09');
INSERT INTO `admin_operation_log` VALUES ('1272', '1', 'admin/discount_products/112/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 14:43:11', '2020-08-07 14:43:11');
INSERT INTO `admin_operation_log` VALUES ('1273', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 14:44:29', '2020-08-07 14:44:29');
INSERT INTO `admin_operation_log` VALUES ('1274', '1', 'admin/discount_products/121/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 14:44:36', '2020-08-07 14:44:36');
INSERT INTO `admin_operation_log` VALUES ('1275', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 14:44:49', '2020-08-07 14:44:49');
INSERT INTO `admin_operation_log` VALUES ('1276', '1', 'admin/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 14:44:50', '2020-08-07 14:44:50');
INSERT INTO `admin_operation_log` VALUES ('1277', '1', 'admin/active_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 14:45:02', '2020-08-07 14:45:02');
INSERT INTO `admin_operation_log` VALUES ('1278', '1', 'admin/active_products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 14:45:03', '2020-08-07 14:45:03');
INSERT INTO `admin_operation_log` VALUES ('1279', '1', 'admin/discount_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 14:45:09', '2020-08-07 14:45:09');
INSERT INTO `admin_operation_log` VALUES ('1280', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 14:45:13', '2020-08-07 14:45:13');
INSERT INTO `admin_operation_log` VALUES ('1281', '1', 'admin/discount_products/121/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 14:45:17', '2020-08-07 14:45:17');
INSERT INTO `admin_operation_log` VALUES ('1282', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 14:45:32', '2020-08-07 14:45:32');
INSERT INTO `admin_operation_log` VALUES ('1283', '1', 'admin/discount_products/121/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 14:45:36', '2020-08-07 14:45:36');
INSERT INTO `admin_operation_log` VALUES ('1284', '1', 'admin/discount_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 14:45:42', '2020-08-07 14:45:42');
INSERT INTO `admin_operation_log` VALUES ('1285', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 14:45:46', '2020-08-07 14:45:46');
INSERT INTO `admin_operation_log` VALUES ('1286', '1', 'admin/discount_products/121/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 14:45:49', '2020-08-07 14:45:49');
INSERT INTO `admin_operation_log` VALUES ('1287', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 14:45:57', '2020-08-07 14:45:57');
INSERT INTO `admin_operation_log` VALUES ('1288', '1', 'admin/discount_products/121/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 14:46:04', '2020-08-07 14:46:04');
INSERT INTO `admin_operation_log` VALUES ('1289', '1', 'admin/discount_products/121', 'PUT', '127.0.0.1', '{\"type\":\"normal\",\"id\":\"121\",\"title\":\"\\u5c0f\\u7c7310\",\"category_id\":\"25\",\"image\":\"product\\/00aa60d90281624184e097b72521f37d.jpg\",\"file-image\":null,\"_file_\":null,\"description\":\"\\u9a81\\u9f99865\\uff0c\\u4e00\\u4ebf\\u50cf\\u7d20\\uff0c8K\\u7535\\u5f71\\u76f8\\u673a\",\"on_sale\":\"1\",\"recommend\":\"1\",\"skus\":{\"231\":{\"title\":\"8GB\\/128GB\",\"description\":\"8GB\\/128GB\",\"price\":\"3600.00\",\"original_price\":\"4000.00\",\"stock\":\"20\",\"id\":\"231\",\"_remove_\":null}},\"_token\":\"s1rBWLQL7GONqIXGnrKI2gGQNsw4lzYIE7p2vptK\",\"_method\":\"PUT\"}', '2020-08-07 14:46:07', '2020-08-07 14:46:07');
INSERT INTO `admin_operation_log` VALUES ('1290', '1', 'admin/discount_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 14:46:08', '2020-08-07 14:46:08');
INSERT INTO `admin_operation_log` VALUES ('1291', '1', 'admin/discount_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 14:46:17', '2020-08-07 14:46:17');
INSERT INTO `admin_operation_log` VALUES ('1292', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 14:46:22', '2020-08-07 14:46:22');
INSERT INTO `admin_operation_log` VALUES ('1293', '1', 'admin/discount_products/121/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 14:46:25', '2020-08-07 14:46:25');
INSERT INTO `admin_operation_log` VALUES ('1294', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 14:48:24', '2020-08-07 14:48:24');
INSERT INTO `admin_operation_log` VALUES ('1295', '1', 'admin/discount_products/121/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 14:48:28', '2020-08-07 14:48:28');
INSERT INTO `admin_operation_log` VALUES ('1296', '1', 'admin/discount_products/121/edit', 'GET', '127.0.0.1', '[]', '2020-08-07 14:50:24', '2020-08-07 14:50:24');
INSERT INTO `admin_operation_log` VALUES ('1297', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-08-07 14:50:56', '2020-08-07 14:50:56');
INSERT INTO `admin_operation_log` VALUES ('1298', '1', 'admin/discount_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 14:51:09', '2020-08-07 14:51:09');
INSERT INTO `admin_operation_log` VALUES ('1299', '1', 'admin/discount_products/112/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 14:51:13', '2020-08-07 14:51:13');
INSERT INTO `admin_operation_log` VALUES ('1300', '1', 'admin/discount_products/112/edit', 'GET', '127.0.0.1', '[]', '2020-08-07 14:51:19', '2020-08-07 14:51:19');
INSERT INTO `admin_operation_log` VALUES ('1301', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 14:51:39', '2020-08-07 14:51:39');
INSERT INTO `admin_operation_log` VALUES ('1302', '1', 'admin/discount_products/121/edit', 'GET', '127.0.0.1', '[]', '2020-08-07 14:51:56', '2020-08-07 14:51:56');
INSERT INTO `admin_operation_log` VALUES ('1303', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 15:27:02', '2020-08-07 15:27:02');
INSERT INTO `admin_operation_log` VALUES ('1304', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 15:27:36', '2020-08-07 15:27:36');
INSERT INTO `admin_operation_log` VALUES ('1305', '1', 'admin/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 15:38:38', '2020-08-07 15:38:38');
INSERT INTO `admin_operation_log` VALUES ('1306', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 15:40:47', '2020-08-07 15:40:47');
INSERT INTO `admin_operation_log` VALUES ('1307', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-07 15:40:48', '2020-08-07 15:40:48');
INSERT INTO `admin_operation_log` VALUES ('1308', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-07 15:41:49', '2020-08-07 15:41:49');
INSERT INTO `admin_operation_log` VALUES ('1309', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-07 15:46:18', '2020-08-07 15:46:18');
INSERT INTO `admin_operation_log` VALUES ('1310', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-07 15:47:15', '2020-08-07 15:47:15');
INSERT INTO `admin_operation_log` VALUES ('1311', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-07 15:47:52', '2020-08-07 15:47:52');
INSERT INTO `admin_operation_log` VALUES ('1312', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-07 15:49:16', '2020-08-07 15:49:16');
INSERT INTO `admin_operation_log` VALUES ('1313', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-07 15:50:40', '2020-08-07 15:50:40');
INSERT INTO `admin_operation_log` VALUES ('1314', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-07 15:52:27', '2020-08-07 15:52:27');
INSERT INTO `admin_operation_log` VALUES ('1315', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 15:53:36', '2020-08-07 15:53:36');
INSERT INTO `admin_operation_log` VALUES ('1316', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-07 15:54:46', '2020-08-07 15:54:46');
INSERT INTO `admin_operation_log` VALUES ('1317', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-07 16:01:20', '2020-08-07 16:01:20');
INSERT INTO `admin_operation_log` VALUES ('1318', '1', 'admin/dcat-api/form', 'POST', '127.0.0.1', '{\"id\":\"121\",\"skus\":{\"231\":{\"title\":\"8GB\\/128GB\",\"description\":\"8GB\\/128GB\",\"price\":\"3600.00\",\"original_price\":\"4000.00\",\"stock\":\"20\",\"id\":\"231\",\"_remove_\":\"0\"},\"new_1\":{\"title\":null,\"description\":null,\"price\":null,\"original_price\":null,\"stock\":null,\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"title\":null,\"description\":null,\"price\":null,\"original_price\":null,\"stock\":null,\"id\":null,\"_remove_\":\"1\"}},\"_form_\":\"App\\\\Admin\\\\Forms\\\\ProductDiscount\",\"_current_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/products?\",\"_token\":\"s1rBWLQL7GONqIXGnrKI2gGQNsw4lzYIE7p2vptK\"}', '2020-08-07 16:01:50', '2020-08-07 16:01:50');
INSERT INTO `admin_operation_log` VALUES ('1319', '1', 'admin/dcat-api/form', 'POST', '127.0.0.1', '{\"id\":\"121\",\"skus\":{\"231\":{\"title\":\"8GB\\/128GB\",\"description\":\"8GB\\/128GB\",\"price\":\"3600.00\",\"original_price\":\"4000.00\",\"stock\":\"20\",\"id\":\"231\",\"_remove_\":\"0\"},\"new_1\":{\"title\":null,\"description\":null,\"price\":null,\"original_price\":null,\"stock\":null,\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"title\":null,\"description\":null,\"price\":null,\"original_price\":null,\"stock\":null,\"id\":null,\"_remove_\":\"1\"}},\"_form_\":\"App\\\\Admin\\\\Forms\\\\ProductDiscount\",\"_current_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/products?\",\"_token\":\"s1rBWLQL7GONqIXGnrKI2gGQNsw4lzYIE7p2vptK\"}', '2020-08-07 16:05:40', '2020-08-07 16:05:40');
INSERT INTO `admin_operation_log` VALUES ('1320', '1', 'admin/dcat-api/form', 'POST', '127.0.0.1', '{\"id\":\"121\",\"skus\":{\"231\":{\"title\":\"8GB\\/128GB\",\"description\":\"8GB\\/128GB\",\"price\":\"3600.00\",\"original_price\":\"4000.00\",\"stock\":\"20\",\"id\":\"231\",\"_remove_\":\"0\"},\"new_1\":{\"title\":null,\"description\":null,\"price\":null,\"original_price\":null,\"stock\":null,\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"title\":null,\"description\":null,\"price\":null,\"original_price\":null,\"stock\":null,\"id\":null,\"_remove_\":\"1\"}},\"_form_\":\"App\\\\Admin\\\\Forms\\\\ProductDiscount\",\"_current_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/products?\",\"_token\":\"s1rBWLQL7GONqIXGnrKI2gGQNsw4lzYIE7p2vptK\"}', '2020-08-07 16:06:52', '2020-08-07 16:06:52');
INSERT INTO `admin_operation_log` VALUES ('1321', '1', 'admin/dcat-api/form', 'POST', '127.0.0.1', '{\"id\":\"121\",\"skus\":{\"231\":{\"title\":\"8GB\\/128GB\",\"description\":\"8GB\\/128GB\",\"price\":\"3600.00\",\"original_price\":\"4000.00\",\"stock\":\"20\",\"id\":\"231\",\"_remove_\":\"0\"},\"new_1\":{\"title\":null,\"description\":null,\"price\":null,\"original_price\":null,\"stock\":null,\"id\":null,\"_remove_\":\"1\"},\"new_2\":{\"title\":null,\"description\":null,\"price\":null,\"original_price\":null,\"stock\":null,\"id\":null,\"_remove_\":\"1\"}},\"_form_\":\"App\\\\Admin\\\\Forms\\\\ProductDiscount\",\"_current_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/products?\",\"_token\":\"s1rBWLQL7GONqIXGnrKI2gGQNsw4lzYIE7p2vptK\"}', '2020-08-07 16:07:21', '2020-08-07 16:07:21');
INSERT INTO `admin_operation_log` VALUES ('1322', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-07 16:38:06', '2020-08-07 16:38:06');
INSERT INTO `admin_operation_log` VALUES ('1323', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-07 16:38:12', '2020-08-07 16:38:12');
INSERT INTO `admin_operation_log` VALUES ('1324', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-07 16:38:21', '2020-08-07 16:38:21');
INSERT INTO `admin_operation_log` VALUES ('1325', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-07 16:39:40', '2020-08-07 16:39:40');
INSERT INTO `admin_operation_log` VALUES ('1326', '1', 'admin/dcat-api/form', 'POST', '127.0.0.1', '{\"id\":\"121\",\"skus\":{\"231\":{\"title\":\"8GB\\/128GB\",\"description\":\"8GB\\/128GB\",\"price\":\"3600.00\",\"original_price\":\"4000.00\",\"stock\":\"20\",\"id\":\"231\",\"_remove_\":\"0\"}},\"_form_\":\"App\\\\Admin\\\\Forms\\\\ProductDiscount\",\"_current_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/products?\",\"_token\":\"s1rBWLQL7GONqIXGnrKI2gGQNsw4lzYIE7p2vptK\"}', '2020-08-07 16:39:54', '2020-08-07 16:39:54');
INSERT INTO `admin_operation_log` VALUES ('1327', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 16:39:54', '2020-08-07 16:39:54');
INSERT INTO `admin_operation_log` VALUES ('1328', '1', 'admin/discount_products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 16:39:59', '2020-08-07 16:39:59');
INSERT INTO `admin_operation_log` VALUES ('1329', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 16:43:23', '2020-08-07 16:43:23');
INSERT INTO `admin_operation_log` VALUES ('1330', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 17:17:39', '2020-08-07 17:17:39');
INSERT INTO `admin_operation_log` VALUES ('1331', '1', 'admin/helpers/scaffold/table', 'POST', '127.0.0.1', '{\"db\":\"jrerp\",\"tb\":\"product_pics\",\"_token\":\"s1rBWLQL7GONqIXGnrKI2gGQNsw4lzYIE7p2vptK\"}', '2020-08-07 17:17:48', '2020-08-07 17:17:48');
INSERT INTO `admin_operation_log` VALUES ('1332', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '{\"singular\":\"product_pics\"}', '2020-08-07 17:17:49', '2020-08-07 17:17:49');
INSERT INTO `admin_operation_log` VALUES ('1333', '1', 'admin/helpers/scaffold', 'POST', '127.0.0.1', '{\"table_name\":\"product_pics\",\"exist-table\":\"jrerp|product_pics\",\"model_name\":\"App\\\\Models\\\\ProductPic\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\ProductPicController\",\"repository_name\":\"App\\\\Admin\\\\Repositories\\\\ProductPic\",\"create\":[\"model\"],\"fields\":[{\"name\":\"product_id\",\"translation\":null,\"type\":\"unsignedBigInteger\",\"key\":null,\"default\":null,\"comment\":null},{\"name\":\"image\",\"translation\":null,\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":null},{\"name\":\"description\",\"translation\":null,\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":null}],\"primary_key\":\"id\",\"_token\":\"s1rBWLQL7GONqIXGnrKI2gGQNsw4lzYIE7p2vptK\"}', '2020-08-07 17:18:11', '2020-08-07 17:18:11');
INSERT INTO `admin_operation_log` VALUES ('1334', '1', 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2020-08-07 17:18:11', '2020-08-07 17:18:11');
INSERT INTO `admin_operation_log` VALUES ('1335', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 17:22:50', '2020-08-07 17:22:50');
INSERT INTO `admin_operation_log` VALUES ('1336', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-07 17:22:57', '2020-08-07 17:22:57');
INSERT INTO `admin_operation_log` VALUES ('1337', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-07 17:33:44', '2020-08-07 17:33:44');
INSERT INTO `admin_operation_log` VALUES ('1338', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 17:33:50', '2020-08-07 17:33:50');
INSERT INTO `admin_operation_log` VALUES ('1339', '1', 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"post_type\":\"1\",\"renderable\":\"App_Admin_Repositories_UserAddress\",\"key\":\"1\"}', '2020-08-07 17:33:52', '2020-08-07 17:33:52');
INSERT INTO `admin_operation_log` VALUES ('1340', '1', 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 17:33:56', '2020-08-07 17:33:56');
INSERT INTO `admin_operation_log` VALUES ('1341', '1', 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"_token\":\"s1rBWLQL7GONqIXGnrKI2gGQNsw4lzYIE7p2vptK\",\"_parent_id_\":\"1\",\"_tier_\":\"1\",\"_children_page_1\":\"1\"}', '2020-08-07 17:34:02', '2020-08-07 17:34:02');
INSERT INTO `admin_operation_log` VALUES ('1342', '1', 'admin/brands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 17:46:32', '2020-08-07 17:46:32');
INSERT INTO `admin_operation_log` VALUES ('1343', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 17:46:35', '2020-08-07 17:46:35');
INSERT INTO `admin_operation_log` VALUES ('1344', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-07 17:46:38', '2020-08-07 17:46:38');
INSERT INTO `admin_operation_log` VALUES ('1345', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-07 17:47:50', '2020-08-07 17:47:50');
INSERT INTO `admin_operation_log` VALUES ('1346', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-07 17:48:34', '2020-08-07 17:48:34');
INSERT INTO `admin_operation_log` VALUES ('1347', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-07 17:49:42', '2020-08-07 17:49:42');
INSERT INTO `admin_operation_log` VALUES ('1348', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-07 17:51:07', '2020-08-07 17:51:07');
INSERT INTO `admin_operation_log` VALUES ('1349', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-07 17:54:28', '2020-08-07 17:54:28');
INSERT INTO `admin_operation_log` VALUES ('1350', '1', 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"key\":\"113\",\"renderable\":\"App_Renders_ProductPic\"}', '2020-08-07 17:54:36', '2020-08-07 17:54:36');
INSERT INTO `admin_operation_log` VALUES ('1351', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-07 17:55:04', '2020-08-07 17:55:04');
INSERT INTO `admin_operation_log` VALUES ('1352', '1', 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"key\":\"113\",\"renderable\":\"App_Renders_ProductPic\"}', '2020-08-07 17:55:11', '2020-08-07 17:55:11');
INSERT INTO `admin_operation_log` VALUES ('1353', '1', 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"key\":\"113\",\"renderable\":\"App_Renders_ProductPic\"}', '2020-08-07 17:55:37', '2020-08-07 17:55:37');
INSERT INTO `admin_operation_log` VALUES ('1354', '1', 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"key\":\"113\",\"renderable\":\"App_Renders_ProductPic\"}', '2020-08-07 17:56:40', '2020-08-07 17:56:40');
INSERT INTO `admin_operation_log` VALUES ('1355', '1', 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"key\":\"113\",\"renderable\":\"App_Renders_ProductPic\"}', '2020-08-07 17:56:59', '2020-08-07 17:56:59');
INSERT INTO `admin_operation_log` VALUES ('1356', '1', 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"key\":\"113\",\"renderable\":\"App_Renders_ProductPic\"}', '2020-08-07 17:57:14', '2020-08-07 17:57:14');
INSERT INTO `admin_operation_log` VALUES ('1357', '1', 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"key\":\"113\",\"renderable\":\"App_Renders_ProductPic\"}', '2020-08-07 17:57:36', '2020-08-07 17:57:36');
INSERT INTO `admin_operation_log` VALUES ('1358', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-07 17:59:53', '2020-08-07 17:59:53');
INSERT INTO `admin_operation_log` VALUES ('1359', '1', 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"key\":\"113\",\"renderable\":\"App_Renders_ProductPic\"}', '2020-08-07 18:00:00', '2020-08-07 18:00:00');
INSERT INTO `admin_operation_log` VALUES ('1360', '1', 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"key\":\"113\",\"renderable\":\"App_Renders_ProductPic\"}', '2020-08-07 18:00:12', '2020-08-07 18:00:12');
INSERT INTO `admin_operation_log` VALUES ('1361', '1', 'admin/products/113', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 18:00:21', '2020-08-07 18:00:21');
INSERT INTO `admin_operation_log` VALUES ('1362', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 18:00:23', '2020-08-07 18:00:23');
INSERT INTO `admin_operation_log` VALUES ('1363', '1', 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"key\":\"113\",\"renderable\":\"App_Renders_ProductPic\"}', '2020-08-07 18:00:26', '2020-08-07 18:00:26');
INSERT INTO `admin_operation_log` VALUES ('1364', '1', 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"key\":\"113\",\"renderable\":\"App_Renders_ProductPic\"}', '2020-08-07 18:00:26', '2020-08-07 18:00:26');
INSERT INTO `admin_operation_log` VALUES ('1365', '1', 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"key\":\"113\",\"renderable\":\"App_Renders_ProductPic\"}', '2020-08-07 18:00:26', '2020-08-07 18:00:26');
INSERT INTO `admin_operation_log` VALUES ('1366', '1', 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"key\":\"113\",\"renderable\":\"App_Renders_ProductPic\"}', '2020-08-07 18:00:39', '2020-08-07 18:00:39');
INSERT INTO `admin_operation_log` VALUES ('1367', '1', 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"key\":\"113\",\"renderable\":\"App_Renders_ProductPic\"}', '2020-08-07 18:00:39', '2020-08-07 18:00:39');
INSERT INTO `admin_operation_log` VALUES ('1368', '1', 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"key\":\"113\",\"renderable\":\"App_Renders_ProductPic\"}', '2020-08-07 18:00:39', '2020-08-07 18:00:39');
INSERT INTO `admin_operation_log` VALUES ('1369', '1', 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"key\":\"113\",\"renderable\":\"App_Renders_ProductPic\",\"skus_per_page\":\"50\"}', '2020-08-07 18:01:09', '2020-08-07 18:01:09');
INSERT INTO `admin_operation_log` VALUES ('1370', '1', 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"key\":\"113\",\"renderable\":\"App_Renders_ProductPic\",\"skus_per_page\":\"50\"}', '2020-08-07 18:01:28', '2020-08-07 18:01:28');
INSERT INTO `admin_operation_log` VALUES ('1371', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-07 18:01:37', '2020-08-07 18:01:37');
INSERT INTO `admin_operation_log` VALUES ('1372', '1', 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"key\":\"113\",\"renderable\":\"App_Renders_ProductPic\"}', '2020-08-07 18:01:40', '2020-08-07 18:01:40');
INSERT INTO `admin_operation_log` VALUES ('1373', '1', 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"key\":\"113\",\"renderable\":\"App_Renders_ProductPic\"}', '2020-08-07 18:02:06', '2020-08-07 18:02:06');
INSERT INTO `admin_operation_log` VALUES ('1374', '1', 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"key\":\"113\",\"renderable\":\"App_Renders_ProductPic\"}', '2020-08-07 18:02:29', '2020-08-07 18:02:29');
INSERT INTO `admin_operation_log` VALUES ('1375', '1', 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"key\":\"113\",\"renderable\":\"App_Renders_ProductPic\"}', '2020-08-07 18:05:40', '2020-08-07 18:05:40');
INSERT INTO `admin_operation_log` VALUES ('1376', '1', 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"key\":\"113\",\"renderable\":\"App_Renders_ProductPic\"}', '2020-08-07 18:07:21', '2020-08-07 18:07:21');
INSERT INTO `admin_operation_log` VALUES ('1377', '1', 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"key\":\"113\",\"renderable\":\"App_Renders_ProductPic\"}', '2020-08-07 18:09:05', '2020-08-07 18:09:05');
INSERT INTO `admin_operation_log` VALUES ('1378', '0', 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2020-08-10 10:03:14', '2020-08-10 10:03:14');
INSERT INTO `admin_operation_log` VALUES ('1379', '0', 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"ycs3cvAN1SS19pFJrh4Vqxo9rp6H6TllZ1NDIYaC\",\"username\":\"admin\",\"password\":\"adm******\"}', '2020-08-10 10:03:39', '2020-08-10 10:03:39');
INSERT INTO `admin_operation_log` VALUES ('1380', '0', 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"ycs3cvAN1SS19pFJrh4Vqxo9rp6H6TllZ1NDIYaC\",\"username\":\"admin\",\"password\":\"adm******\"}', '2020-08-10 10:03:39', '2020-08-10 10:03:39');
INSERT INTO `admin_operation_log` VALUES ('1381', '0', 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"ycs3cvAN1SS19pFJrh4Vqxo9rp6H6TllZ1NDIYaC\",\"username\":\"admin\",\"password\":\"adm******\"}', '2020-08-10 10:03:39', '2020-08-10 10:03:39');
INSERT INTO `admin_operation_log` VALUES ('1382', '0', 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"ycs3cvAN1SS19pFJrh4Vqxo9rp6H6TllZ1NDIYaC\",\"username\":\"admin\",\"password\":\"adm******\"}', '2020-08-10 10:03:39', '2020-08-10 10:03:39');
INSERT INTO `admin_operation_log` VALUES ('1383', '0', 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"ycs3cvAN1SS19pFJrh4Vqxo9rp6H6TllZ1NDIYaC\",\"username\":\"admin\",\"password\":\"adm******\"}', '2020-08-10 10:03:39', '2020-08-10 10:03:39');
INSERT INTO `admin_operation_log` VALUES ('1384', '0', 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"ycs3cvAN1SS19pFJrh4Vqxo9rp6H6TllZ1NDIYaC\",\"username\":\"admin\",\"password\":\"adm******\"}', '2020-08-10 10:03:39', '2020-08-10 10:03:39');
INSERT INTO `admin_operation_log` VALUES ('1385', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-08-10 10:03:40', '2020-08-10 10:03:40');
INSERT INTO `admin_operation_log` VALUES ('1386', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-08-10 10:03:40', '2020-08-10 10:03:40');
INSERT INTO `admin_operation_log` VALUES ('1387', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-08-10 10:03:40', '2020-08-10 10:03:40');
INSERT INTO `admin_operation_log` VALUES ('1388', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-08-10 10:03:40', '2020-08-10 10:03:40');
INSERT INTO `admin_operation_log` VALUES ('1389', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-08-10 10:03:40', '2020-08-10 10:03:40');
INSERT INTO `admin_operation_log` VALUES ('1390', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-08-10 10:03:40', '2020-08-10 10:03:40');
INSERT INTO `admin_operation_log` VALUES ('1391', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-10 10:03:48', '2020-08-10 10:03:48');
INSERT INTO `admin_operation_log` VALUES ('1392', '1', 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"key\":\"113\",\"renderable\":\"App_Renders_ProductPic\"}', '2020-08-10 10:04:05', '2020-08-10 10:04:05');
INSERT INTO `admin_operation_log` VALUES ('1393', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-10 10:06:34', '2020-08-10 10:06:34');
INSERT INTO `admin_operation_log` VALUES ('1394', '1', 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"key\":\"98\",\"renderable\":\"App_Renders_ProductPic\"}', '2020-08-10 10:06:44', '2020-08-10 10:06:44');
INSERT INTO `admin_operation_log` VALUES ('1395', '1', 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"key\":\"97\",\"renderable\":\"App_Renders_ProductPic\"}', '2020-08-10 10:06:50', '2020-08-10 10:06:50');
INSERT INTO `admin_operation_log` VALUES ('1396', '1', 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"key\":\"95\",\"renderable\":\"App_Renders_ProductPic\"}', '2020-08-10 10:06:53', '2020-08-10 10:06:53');
INSERT INTO `admin_operation_log` VALUES ('1397', '1', 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"key\":\"113\",\"renderable\":\"App_Renders_ProductPic\"}', '2020-08-10 10:08:10', '2020-08-10 10:08:10');
INSERT INTO `admin_operation_log` VALUES ('1398', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-08-10 10:12:25', '2020-08-10 10:12:25');
INSERT INTO `admin_operation_log` VALUES ('1399', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-10 10:12:28', '2020-08-10 10:12:28');
INSERT INTO `admin_operation_log` VALUES ('1400', '1', 'admin/pics/create', 'GET', '127.0.0.1', '[]', '2020-08-10 10:14:49', '2020-08-10 10:14:49');
INSERT INTO `admin_operation_log` VALUES ('1401', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-10 10:14:57', '2020-08-10 10:14:57');
INSERT INTO `admin_operation_log` VALUES ('1402', '1', 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"key\":\"113\",\"renderable\":\"App_Renders_ProductPic\"}', '2020-08-10 10:14:59', '2020-08-10 10:14:59');
INSERT INTO `admin_operation_log` VALUES ('1403', '1', 'admin/pics/create', 'GET', '127.0.0.1', '[]', '2020-08-10 10:15:00', '2020-08-10 10:15:00');
INSERT INTO `admin_operation_log` VALUES ('1404', '1', 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"key\":\"113\",\"renderable\":\"App_Renders_ProductPic\"}', '2020-08-10 10:18:12', '2020-08-10 10:18:12');
INSERT INTO `admin_operation_log` VALUES ('1405', '1', 'admin/pics/create', 'GET', '127.0.0.1', '[]', '2020-08-10 10:18:26', '2020-08-10 10:18:26');
INSERT INTO `admin_operation_log` VALUES ('1406', '1', 'admin/pics', 'POST', '127.0.0.1', '{\"_id\":\"musxCGa1qTZvaMyF\",\"_token\":\"78x1e0looL6bYuXIGSjzqkdLMDAUCaeNIQqxNhSF\",\"upload_column\":\"image\",\"id\":\"WU_FILE_0\",\"name\":\"20190811192502499.png\",\"type\":\"image\\/png\",\"lastModifiedDate\":\"Fri Jul 31 2020 11:27:02 GMT+0800 (\\u4e2d\\u56fd\\u6807\\u51c6\\u65f6\\u95f4)\",\"size\":\"3077310\"}', '2020-08-10 10:18:33', '2020-08-10 10:18:33');
INSERT INTO `admin_operation_log` VALUES ('1407', '1', 'admin/pics', 'POST', '127.0.0.1', '{\"_id\":\"musxCGa1qTZvaMyF\",\"_token\":\"78x1e0looL6bYuXIGSjzqkdLMDAUCaeNIQqxNhSF\",\"upload_column\":\"image\",\"id\":\"WU_FILE_0\",\"name\":\"20190811192502499.png\",\"type\":\"image\\/png\",\"lastModifiedDate\":\"Fri Jul 31 2020 11:27:02 GMT+0800 (\\u4e2d\\u56fd\\u6807\\u51c6\\u65f6\\u95f4)\",\"size\":\"3077310\"}', '2020-08-10 10:18:56', '2020-08-10 10:18:56');
INSERT INTO `admin_operation_log` VALUES ('1408', '1', 'admin/pics/create', 'GET', '127.0.0.1', '[]', '2020-08-10 10:19:02', '2020-08-10 10:19:02');
INSERT INTO `admin_operation_log` VALUES ('1409', '1', 'admin/pics', 'POST', '127.0.0.1', '{\"_id\":\"GUCmLig8KPgvikH6\",\"_token\":\"78x1e0looL6bYuXIGSjzqkdLMDAUCaeNIQqxNhSF\",\"upload_column\":\"image\",\"id\":\"WU_FILE_0\",\"name\":\"20190811192502499.png\",\"type\":\"image\\/png\",\"lastModifiedDate\":\"Fri Jul 31 2020 11:27:02 GMT+0800 (\\u4e2d\\u56fd\\u6807\\u51c6\\u65f6\\u95f4)\",\"size\":\"3077310\"}', '2020-08-10 10:19:08', '2020-08-10 10:19:08');
INSERT INTO `admin_operation_log` VALUES ('1410', '1', 'admin/pics/create', 'GET', '127.0.0.1', '[]', '2020-08-10 10:19:55', '2020-08-10 10:19:55');
INSERT INTO `admin_operation_log` VALUES ('1411', '1', 'admin/pics', 'POST', '127.0.0.1', '{\"_id\":\"uvhXtEmzhJmGPsLM\",\"_token\":\"78x1e0looL6bYuXIGSjzqkdLMDAUCaeNIQqxNhSF\",\"upload_column\":\"image\",\"id\":\"WU_FILE_0\",\"name\":\"20190811192502499.png\",\"type\":\"image\\/png\",\"lastModifiedDate\":\"Fri Jul 31 2020 11:27:02 GMT+0800 (\\u4e2d\\u56fd\\u6807\\u51c6\\u65f6\\u95f4)\",\"size\":\"3077310\"}', '2020-08-10 10:20:03', '2020-08-10 10:20:03');
INSERT INTO `admin_operation_log` VALUES ('1412', '1', 'admin/pics/create', 'GET', '127.0.0.1', '[]', '2020-08-10 10:20:35', '2020-08-10 10:20:35');
INSERT INTO `admin_operation_log` VALUES ('1413', '1', 'admin/pics', 'POST', '127.0.0.1', '{\"_id\":\"bZKWPqIVDAvev3cH\",\"_token\":\"78x1e0looL6bYuXIGSjzqkdLMDAUCaeNIQqxNhSF\",\"upload_column\":\"image\",\"id\":\"WU_FILE_0\",\"name\":\"p4GdZkvbHg.png\",\"type\":\"image\\/png\",\"lastModifiedDate\":\"Tue Jul 28 2020 17:40:29 GMT+0800 (\\u4e2d\\u56fd\\u6807\\u51c6\\u65f6\\u95f4)\",\"size\":\"14846\"}', '2020-08-10 10:20:42', '2020-08-10 10:20:42');
INSERT INTO `admin_operation_log` VALUES ('1414', '1', 'admin/pics', 'POST', '127.0.0.1', '{\"image\":\"images\\/f7ce607bbba6bb3c43c032554adc89b5.png\",\"file-image\":null,\"_file_\":null,\"description\":\"111\",\"_token\":\"78x1e0looL6bYuXIGSjzqkdLMDAUCaeNIQqxNhSF\"}', '2020-08-10 10:20:51', '2020-08-10 10:20:51');
INSERT INTO `admin_operation_log` VALUES ('1415', '1', 'admin/pics', 'POST', '127.0.0.1', '{\"image\":\"images\\/f7ce607bbba6bb3c43c032554adc89b5.png\",\"file-image\":null,\"_file_\":null,\"description\":\"111\",\"_token\":\"78x1e0looL6bYuXIGSjzqkdLMDAUCaeNIQqxNhSF\"}', '2020-08-10 10:20:58', '2020-08-10 10:20:58');
INSERT INTO `admin_operation_log` VALUES ('1416', '1', 'admin/pics/create', 'GET', '127.0.0.1', '[]', '2020-08-10 10:22:15', '2020-08-10 10:22:15');
INSERT INTO `admin_operation_log` VALUES ('1417', '1', 'admin/pics', 'POST', '127.0.0.1', '{\"_id\":\"HQ7gyAl4TM63ZAgh\",\"_token\":\"78x1e0looL6bYuXIGSjzqkdLMDAUCaeNIQqxNhSF\",\"upload_column\":\"image\",\"id\":\"WU_FILE_0\",\"name\":\"p4GdZkvbHg.png\",\"type\":\"image\\/png\",\"lastModifiedDate\":\"Tue Jul 28 2020 17:40:29 GMT+0800 (\\u4e2d\\u56fd\\u6807\\u51c6\\u65f6\\u95f4)\",\"size\":\"14846\"}', '2020-08-10 10:22:19', '2020-08-10 10:22:19');
INSERT INTO `admin_operation_log` VALUES ('1418', '1', 'admin/pics', 'POST', '127.0.0.1', '{\"product_id\":\"113\",\"image\":\"images\\/5d173c61757321218ee1662bc8206a78.png\",\"file-image\":null,\"_file_\":null,\"description\":\"1212\",\"_token\":\"78x1e0looL6bYuXIGSjzqkdLMDAUCaeNIQqxNhSF\"}', '2020-08-10 10:22:24', '2020-08-10 10:22:24');
INSERT INTO `admin_operation_log` VALUES ('1419', '1', 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"key\":\"113\",\"renderable\":\"App_Renders_ProductPic\"}', '2020-08-10 10:23:58', '2020-08-10 10:23:58');
INSERT INTO `admin_operation_log` VALUES ('1420', '1', 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-10 10:44:08', '2020-08-10 10:44:08');
INSERT INTO `admin_operation_log` VALUES ('1421', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-10 10:44:12', '2020-08-10 10:44:12');
INSERT INTO `admin_operation_log` VALUES ('1422', '1', 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"post_type\":\"1\",\"renderable\":\"App_Admin_Repositories_UserAddress\",\"key\":\"1\"}', '2020-08-10 10:44:14', '2020-08-10 10:44:14');
INSERT INTO `admin_operation_log` VALUES ('1423', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-10 10:44:23', '2020-08-10 10:44:23');
INSERT INTO `admin_operation_log` VALUES ('1424', '1', 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"key\":\"113\",\"renderable\":\"App_Renders_ProductPic\"}', '2020-08-10 10:45:44', '2020-08-10 10:45:44');
INSERT INTO `admin_operation_log` VALUES ('1425', '1', 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"key\":\"113\",\"renderable\":\"App_Renders_ProductPic\"}', '2020-08-10 10:46:31', '2020-08-10 10:46:31');
INSERT INTO `admin_operation_log` VALUES ('1426', '1', 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"key\":\"113\",\"renderable\":\"App_Renders_ProductPic\"}', '2020-08-10 10:49:18', '2020-08-10 10:49:18');
INSERT INTO `admin_operation_log` VALUES ('1427', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-10 10:52:07', '2020-08-10 10:52:07');
INSERT INTO `admin_operation_log` VALUES ('1428', '1', 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"key\":\"113\",\"renderable\":\"App_Renders_ProductPic\"}', '2020-08-10 10:52:15', '2020-08-10 10:52:15');
INSERT INTO `admin_operation_log` VALUES ('1429', '1', 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"key\":\"113\",\"renderable\":\"App_Renders_ProductPic\"}', '2020-08-10 11:04:04', '2020-08-10 11:04:04');
INSERT INTO `admin_operation_log` VALUES ('1430', '1', 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"key\":\"113\",\"renderable\":\"App_Renders_ProductPic\"}', '2020-08-10 11:04:13', '2020-08-10 11:04:13');
INSERT INTO `admin_operation_log` VALUES ('1431', '1', 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"key\":\"113\",\"renderable\":\"App_Renders_ProductPic\"}', '2020-08-10 11:05:08', '2020-08-10 11:05:08');
INSERT INTO `admin_operation_log` VALUES ('1432', '1', 'admin/products/113', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-10 11:05:21', '2020-08-10 11:05:21');
INSERT INTO `admin_operation_log` VALUES ('1433', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-10 11:06:18', '2020-08-10 11:06:18');
INSERT INTO `admin_operation_log` VALUES ('1434', '1', 'admin/products', 'GET', '127.0.0.1', '[]', '2020-08-10 11:06:30', '2020-08-10 11:06:30');
INSERT INTO `admin_operation_log` VALUES ('1435', '1', 'admin/products/113/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-10 11:06:59', '2020-08-10 11:06:59');
INSERT INTO `admin_operation_log` VALUES ('1436', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-10 11:07:05', '2020-08-10 11:07:05');
INSERT INTO `admin_operation_log` VALUES ('1437', '1', 'admin/products/113', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-10 11:07:24', '2020-08-10 11:07:24');
INSERT INTO `admin_operation_log` VALUES ('1438', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-10 11:11:43', '2020-08-10 11:11:43');
INSERT INTO `admin_operation_log` VALUES ('1439', '1', 'admin/products/113', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-10 11:11:46', '2020-08-10 11:11:46');
INSERT INTO `admin_operation_log` VALUES ('1440', '1', 'admin/products/113', 'GET', '127.0.0.1', '[]', '2020-08-10 11:13:24', '2020-08-10 11:13:24');
INSERT INTO `admin_operation_log` VALUES ('1441', '1', 'admin/products/113', 'GET', '127.0.0.1', '[]', '2020-08-10 11:13:46', '2020-08-10 11:13:46');
INSERT INTO `admin_operation_log` VALUES ('1442', '1', 'admin/products/113', 'GET', '127.0.0.1', '[]', '2020-08-10 11:14:04', '2020-08-10 11:14:04');
INSERT INTO `admin_operation_log` VALUES ('1443', '1', 'admin/products/113', 'GET', '127.0.0.1', '[]', '2020-08-10 11:14:58', '2020-08-10 11:14:58');
INSERT INTO `admin_operation_log` VALUES ('1444', '1', 'admin/pics/270', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"78x1e0looL6bYuXIGSjzqkdLMDAUCaeNIQqxNhSF\"}', '2020-08-10 11:15:02', '2020-08-10 11:15:02');
INSERT INTO `admin_operation_log` VALUES ('1445', '1', 'admin/products/113', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-10 11:15:02', '2020-08-10 11:15:02');
INSERT INTO `admin_operation_log` VALUES ('1446', '1', 'admin/skus/216/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-10 11:15:09', '2020-08-10 11:15:09');
INSERT INTO `admin_operation_log` VALUES ('1447', '1', 'admin/products/113', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-10 11:15:16', '2020-08-10 11:15:16');
INSERT INTO `admin_operation_log` VALUES ('1448', '1', 'admin/skus/create', 'GET', '127.0.0.1', '{\"product_id\":\"113\",\"_pjax\":\"#pjax-container\"}', '2020-08-10 11:15:23', '2020-08-10 11:15:23');
INSERT INTO `admin_operation_log` VALUES ('1449', '1', 'admin/products/113', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-10 11:15:28', '2020-08-10 11:15:28');
INSERT INTO `admin_operation_log` VALUES ('1450', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-10 11:17:03', '2020-08-10 11:17:03');
INSERT INTO `admin_operation_log` VALUES ('1451', '1', 'admin/products/113', 'GET', '127.0.0.1', '[]', '2020-08-10 11:17:54', '2020-08-10 11:17:54');
INSERT INTO `admin_operation_log` VALUES ('1452', '1', 'admin/products/113', 'GET', '127.0.0.1', '[]', '2020-08-10 11:18:34', '2020-08-10 11:18:34');
INSERT INTO `admin_operation_log` VALUES ('1453', '1', 'admin/products/113', 'GET', '127.0.0.1', '[]', '2020-08-10 11:19:38', '2020-08-10 11:19:38');
INSERT INTO `admin_operation_log` VALUES ('1454', '1', 'admin/auth/roles/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2020-08-10 11:19:40', '2020-08-10 11:19:40');
INSERT INTO `admin_operation_log` VALUES ('1455', '1', 'admin/products/113', 'GET', '127.0.0.1', '[]', '2020-08-10 11:28:13', '2020-08-10 11:28:13');
INSERT INTO `admin_operation_log` VALUES ('1456', '1', 'admin/pics/create', 'GET', '127.0.0.1', '{\"product_id113\":null,\"_dialog_form_\":\"1\"}', '2020-08-10 11:28:16', '2020-08-10 11:28:16');
INSERT INTO `admin_operation_log` VALUES ('1457', '1', 'admin/products/113', 'GET', '127.0.0.1', '[]', '2020-08-10 11:28:50', '2020-08-10 11:28:50');
INSERT INTO `admin_operation_log` VALUES ('1458', '1', 'admin/pics/create', 'GET', '127.0.0.1', '{\"product_id\":\"113\",\"_dialog_form_\":\"1\"}', '2020-08-10 11:28:52', '2020-08-10 11:28:52');
INSERT INTO `admin_operation_log` VALUES ('1459', '1', 'admin/products/113', 'GET', '127.0.0.1', '[]', '2020-08-10 11:29:13', '2020-08-10 11:29:13');
INSERT INTO `admin_operation_log` VALUES ('1460', '1', 'admin/pics/create', 'GET', '127.0.0.1', '{\"product_id\":\"113\",\"_dialog_form_\":\"1\"}', '2020-08-10 11:29:15', '2020-08-10 11:29:15');
INSERT INTO `admin_operation_log` VALUES ('1461', '1', 'admin/products/113', 'GET', '127.0.0.1', '[]', '2020-08-10 11:29:34', '2020-08-10 11:29:34');
INSERT INTO `admin_operation_log` VALUES ('1462', '1', 'admin/pics/create', 'GET', '127.0.0.1', '{\"product_id\":\"113\",\"_dialog_form_\":\"1\"}', '2020-08-10 11:29:36', '2020-08-10 11:29:36');
INSERT INTO `admin_operation_log` VALUES ('1463', '1', 'admin/products/113', 'GET', '127.0.0.1', '[]', '2020-08-10 11:29:58', '2020-08-10 11:29:58');
INSERT INTO `admin_operation_log` VALUES ('1464', '1', 'admin/pics/create', 'GET', '127.0.0.1', '{\"product_id\":\"113\",\"_dialog_form_\":\"1\"}', '2020-08-10 11:30:01', '2020-08-10 11:30:01');
INSERT INTO `admin_operation_log` VALUES ('1465', '1', 'admin/pics', 'POST', '127.0.0.1', '{\"_token\":\"78x1e0looL6bYuXIGSjzqkdLMDAUCaeNIQqxNhSF\",\"product_id\":\"113\",\"image\":null,\"file-image\":null,\"_file_\":null,\"description\":null}', '2020-08-10 11:30:41', '2020-08-10 11:30:41');
INSERT INTO `admin_operation_log` VALUES ('1466', '1', 'admin/products/create', 'GET', '127.0.0.1', '{\"product_id\":\"113\"}', '2020-08-10 11:31:37', '2020-08-10 11:31:37');
INSERT INTO `admin_operation_log` VALUES ('1467', '1', 'admin/pics/create', 'GET', '127.0.0.1', '{\"product_id\":\"113\"}', '2020-08-10 11:31:48', '2020-08-10 11:31:48');
INSERT INTO `admin_operation_log` VALUES ('1468', '1', 'admin/pics/create', 'GET', '127.0.0.1', '{\"product_id\":\"113\",\"_dialog_form_\":\"1\"}', '2020-08-10 11:32:17', '2020-08-10 11:32:17');
INSERT INTO `admin_operation_log` VALUES ('1469', '1', 'admin/products/113', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-10 11:32:42', '2020-08-10 11:32:42');
INSERT INTO `admin_operation_log` VALUES ('1470', '1', 'admin/pics/create', 'GET', '127.0.0.1', '{\"product_id\":\"113\",\"_dialog_form_\":\"1\"}', '2020-08-10 11:32:52', '2020-08-10 11:32:52');
INSERT INTO `admin_operation_log` VALUES ('1471', '1', 'admin/skus/create', 'GET', '127.0.0.1', '{\"product_id\":\"113\",\"_pjax\":\"#pjax-container\"}', '2020-08-10 11:33:49', '2020-08-10 11:33:49');
INSERT INTO `admin_operation_log` VALUES ('1472', '1', 'admin/products/113', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-10 11:33:55', '2020-08-10 11:33:55');
INSERT INTO `admin_operation_log` VALUES ('1473', '1', 'admin/pics/create', 'GET', '127.0.0.1', '{\"product_id\":\"113\",\"_dialog_form_\":\"1\"}', '2020-08-10 11:34:44', '2020-08-10 11:34:44');
INSERT INTO `admin_operation_log` VALUES ('1474', '1', 'admin/skus/create', 'GET', '127.0.0.1', '{\"product_id\":\"113\",\"_pjax\":\"#pjax-container\"}', '2020-08-10 12:59:57', '2020-08-10 12:59:57');
INSERT INTO `admin_operation_log` VALUES ('1475', '1', 'admin/products/113', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-10 13:00:02', '2020-08-10 13:00:02');
INSERT INTO `admin_operation_log` VALUES ('1476', '1', 'admin/pics/create', 'GET', '127.0.0.1', '{\"product_id\":\"113\",\"_dialog_form_\":\"1\"}', '2020-08-10 13:00:05', '2020-08-10 13:00:05');
INSERT INTO `admin_operation_log` VALUES ('1477', '1', 'admin/pics/create', 'GET', '127.0.0.1', '{\"product_id\":\"113\",\"_dialog_form_\":\"1\"}', '2020-08-10 13:00:43', '2020-08-10 13:00:43');
INSERT INTO `admin_operation_log` VALUES ('1478', '1', 'admin/products/113', 'GET', '127.0.0.1', '[]', '2020-08-10 13:15:23', '2020-08-10 13:15:23');
INSERT INTO `admin_operation_log` VALUES ('1479', '1', 'admin/products/113', 'GET', '127.0.0.1', '[]', '2020-08-10 13:16:57', '2020-08-10 13:16:57');
INSERT INTO `admin_operation_log` VALUES ('1480', '1', 'admin/product_pics/create', 'GET', '127.0.0.1', '{\"product_id\":\"113\"}', '2020-08-10 13:17:15', '2020-08-10 13:17:15');
INSERT INTO `admin_operation_log` VALUES ('1481', '1', 'admin/product_pics', 'POST', '127.0.0.1', '{\"_id\":\"fcy70D1Jf3Nv5XMc\",\"_token\":\"78x1e0looL6bYuXIGSjzqkdLMDAUCaeNIQqxNhSF\",\"upload_column\":\"image\",\"id\":\"WU_FILE_0\",\"name\":\"59c31e4400013bc911720340.jpg\",\"type\":\"image\\/jpeg\",\"lastModifiedDate\":\"Fri Jul 31 2020 15:08:22 GMT+0800 (\\u4e2d\\u56fd\\u6807\\u51c6\\u65f6\\u95f4)\",\"size\":\"21818\"}', '2020-08-10 13:17:24', '2020-08-10 13:17:24');
INSERT INTO `admin_operation_log` VALUES ('1482', '1', 'admin/product_pics', 'POST', '127.0.0.1', '{\"_id\":\"fcy70D1Jf3Nv5XMc\",\"_token\":\"78x1e0looL6bYuXIGSjzqkdLMDAUCaeNIQqxNhSF\",\"upload_column\":\"image\",\"id\":\"WU_FILE_0\",\"name\":\"59c31e4400013bc911720340.jpg\",\"type\":\"image\\/jpeg\",\"lastModifiedDate\":\"Fri Jul 31 2020 15:08:22 GMT+0800 (\\u4e2d\\u56fd\\u6807\\u51c6\\u65f6\\u95f4)\",\"size\":\"21818\"}', '2020-08-10 13:17:29', '2020-08-10 13:17:29');
INSERT INTO `admin_operation_log` VALUES ('1483', '1', 'admin/product_pics', 'POST', '127.0.0.1', '{\"_id\":\"fcy70D1Jf3Nv5XMc\",\"_token\":\"78x1e0looL6bYuXIGSjzqkdLMDAUCaeNIQqxNhSF\",\"upload_column\":\"image\",\"id\":\"WU_FILE_1\",\"name\":\"p4GdZkvbHg.png\",\"type\":\"image\\/png\",\"lastModifiedDate\":\"Tue Jul 28 2020 17:40:29 GMT+0800 (\\u4e2d\\u56fd\\u6807\\u51c6\\u65f6\\u95f4)\",\"size\":\"14846\"}', '2020-08-10 13:17:38', '2020-08-10 13:17:38');
INSERT INTO `admin_operation_log` VALUES ('1484', '1', 'admin/product_pics', 'POST', '127.0.0.1', '{\"_id\":\"fcy70D1Jf3Nv5XMc\",\"_token\":\"78x1e0looL6bYuXIGSjzqkdLMDAUCaeNIQqxNhSF\",\"upload_column\":\"image\",\"id\":\"WU_FILE_2\",\"name\":\"p4GdZkvbHg.png\",\"type\":\"image\\/png\",\"lastModifiedDate\":\"Tue Jul 28 2020 17:40:29 GMT+0800 (\\u4e2d\\u56fd\\u6807\\u51c6\\u65f6\\u95f4)\",\"size\":\"14846\"}', '2020-08-10 13:18:21', '2020-08-10 13:18:21');
INSERT INTO `admin_operation_log` VALUES ('1485', '1', 'admin/product_pics', 'POST', '127.0.0.1', '{\"_id\":\"fcy70D1Jf3Nv5XMc\",\"_token\":\"78x1e0looL6bYuXIGSjzqkdLMDAUCaeNIQqxNhSF\",\"upload_column\":\"image\",\"id\":\"WU_FILE_2\",\"name\":\"p4GdZkvbHg.png\",\"type\":\"image\\/png\",\"lastModifiedDate\":\"Tue Jul 28 2020 17:40:29 GMT+0800 (\\u4e2d\\u56fd\\u6807\\u51c6\\u65f6\\u95f4)\",\"size\":\"14846\"}', '2020-08-10 13:20:24', '2020-08-10 13:20:24');
INSERT INTO `admin_operation_log` VALUES ('1486', '1', 'admin/product_pics/create', 'GET', '127.0.0.1', '{\"product_id\":\"113\"}', '2020-08-10 13:22:37', '2020-08-10 13:22:37');
INSERT INTO `admin_operation_log` VALUES ('1487', '1', 'admin/product_pics/create', 'GET', '127.0.0.1', '{\"product_id\":\"113\"}', '2020-08-10 13:24:20', '2020-08-10 13:24:20');
INSERT INTO `admin_operation_log` VALUES ('1488', '1', 'admin/product_pics/create', 'GET', '127.0.0.1', '{\"product_id\":\"113\"}', '2020-08-10 13:27:29', '2020-08-10 13:27:29');
INSERT INTO `admin_operation_log` VALUES ('1489', '1', 'admin/product_pics/create', 'GET', '127.0.0.1', '{\"product_id\":\"113\"}', '2020-08-10 13:28:21', '2020-08-10 13:28:21');
INSERT INTO `admin_operation_log` VALUES ('1490', '1', 'admin/product_pics/create', 'GET', '127.0.0.1', '{\"product_id\":\"113\"}', '2020-08-10 13:28:38', '2020-08-10 13:28:38');
INSERT INTO `admin_operation_log` VALUES ('1491', '1', 'admin/product_pics', 'POST', '127.0.0.1', '{\"_id\":\"r92sV4LFILX4NyIE\",\"_token\":\"78x1e0looL6bYuXIGSjzqkdLMDAUCaeNIQqxNhSF\",\"upload_column\":\"image\",\"id\":\"WU_FILE_0\",\"name\":\"59c31e4400013bc911720340.jpg\",\"type\":\"image\\/jpeg\",\"lastModifiedDate\":\"Fri Jul 31 2020 15:08:22 GMT+0800 (\\u4e2d\\u56fd\\u6807\\u51c6\\u65f6\\u95f4)\",\"size\":\"21818\"}', '2020-08-10 13:28:49', '2020-08-10 13:28:49');
INSERT INTO `admin_operation_log` VALUES ('1492', '1', 'admin/product_pics', 'POST', '127.0.0.1', '{\"_id\":\"r92sV4LFILX4NyIE\",\"_token\":\"78x1e0looL6bYuXIGSjzqkdLMDAUCaeNIQqxNhSF\",\"upload_column\":\"image\",\"id\":\"WU_FILE_0\",\"name\":\"59c31e4400013bc911720340.jpg\",\"type\":\"image\\/jpeg\",\"lastModifiedDate\":\"Fri Jul 31 2020 15:08:22 GMT+0800 (\\u4e2d\\u56fd\\u6807\\u51c6\\u65f6\\u95f4)\",\"size\":\"21818\"}', '2020-08-10 13:29:09', '2020-08-10 13:29:09');
INSERT INTO `admin_operation_log` VALUES ('1493', '1', 'admin/product_pics/create', 'GET', '127.0.0.1', '{\"product_id\":\"113\"}', '2020-08-10 13:31:01', '2020-08-10 13:31:01');
INSERT INTO `admin_operation_log` VALUES ('1494', '1', 'admin/product_pics', 'POST', '127.0.0.1', '{\"_id\":\"aWQkxwAlmWDRm7vT\",\"_token\":\"78x1e0looL6bYuXIGSjzqkdLMDAUCaeNIQqxNhSF\",\"upload_column\":\"image\",\"id\":\"WU_FILE_0\",\"name\":\"p4GdZkvbHg.png\",\"type\":\"image\\/png\",\"lastModifiedDate\":\"Tue Jul 28 2020 17:40:29 GMT+0800 (\\u4e2d\\u56fd\\u6807\\u51c6\\u65f6\\u95f4)\",\"size\":\"14846\"}', '2020-08-10 13:31:07', '2020-08-10 13:31:07');
INSERT INTO `admin_operation_log` VALUES ('1495', '1', 'admin/product_pics', 'POST', '127.0.0.1', '{\"_id\":\"aWQkxwAlmWDRm7vT\",\"_token\":\"78x1e0looL6bYuXIGSjzqkdLMDAUCaeNIQqxNhSF\",\"upload_column\":\"image\",\"id\":\"WU_FILE_0\",\"name\":\"p4GdZkvbHg.png\",\"type\":\"image\\/png\",\"lastModifiedDate\":\"Tue Jul 28 2020 17:40:29 GMT+0800 (\\u4e2d\\u56fd\\u6807\\u51c6\\u65f6\\u95f4)\",\"size\":\"14846\"}', '2020-08-10 13:31:24', '2020-08-10 13:31:24');
INSERT INTO `admin_operation_log` VALUES ('1496', '1', 'admin/product_pics/create', 'GET', '127.0.0.1', '{\"product_id\":\"113\"}', '2020-08-10 13:33:58', '2020-08-10 13:33:58');
INSERT INTO `admin_operation_log` VALUES ('1497', '1', 'admin/product_pics', 'POST', '127.0.0.1', '{\"_id\":\"I9GBFV06Vf9ZltGq\",\"_token\":\"78x1e0looL6bYuXIGSjzqkdLMDAUCaeNIQqxNhSF\",\"upload_column\":\"image\",\"id\":\"WU_FILE_0\",\"name\":\"p4GdZkvbHg.png\",\"type\":\"image\\/png\",\"lastModifiedDate\":\"Tue Jul 28 2020 17:40:29 GMT+0800 (\\u4e2d\\u56fd\\u6807\\u51c6\\u65f6\\u95f4)\",\"size\":\"14846\"}', '2020-08-10 13:34:07', '2020-08-10 13:34:07');
INSERT INTO `admin_operation_log` VALUES ('1498', '1', 'admin/product_pics', 'POST', '127.0.0.1', '{\"_id\":\"I9GBFV06Vf9ZltGq\",\"_token\":\"78x1e0looL6bYuXIGSjzqkdLMDAUCaeNIQqxNhSF\",\"upload_column\":\"image\",\"id\":\"WU_FILE_0\",\"name\":\"p4GdZkvbHg.png\",\"type\":\"image\\/png\",\"lastModifiedDate\":\"Tue Jul 28 2020 17:40:29 GMT+0800 (\\u4e2d\\u56fd\\u6807\\u51c6\\u65f6\\u95f4)\",\"size\":\"14846\"}', '2020-08-10 13:34:24', '2020-08-10 13:34:24');
INSERT INTO `admin_operation_log` VALUES ('1499', '1', 'admin/product_pics/create', 'GET', '127.0.0.1', '{\"product_id\":\"113\"}', '2020-08-10 13:36:06', '2020-08-10 13:36:06');
INSERT INTO `admin_operation_log` VALUES ('1500', '1', 'admin/product_pics', 'POST', '127.0.0.1', '{\"_id\":\"LUeZamEPCMn1YGHc\",\"_token\":\"78x1e0looL6bYuXIGSjzqkdLMDAUCaeNIQqxNhSF\",\"upload_column\":\"image\",\"id\":\"WU_FILE_1\",\"name\":\"p4GdZkvbHg.png\",\"type\":\"image\\/png\",\"lastModifiedDate\":\"Tue Jul 28 2020 17:40:29 GMT+0800 (\\u4e2d\\u56fd\\u6807\\u51c6\\u65f6\\u95f4)\",\"size\":\"14846\"}', '2020-08-10 13:36:43', '2020-08-10 13:36:43');
INSERT INTO `admin_operation_log` VALUES ('1501', '1', 'admin/product_pics/create', 'GET', '127.0.0.1', '{\"product_id\":\"113\"}', '2020-08-10 13:38:15', '2020-08-10 13:38:15');
INSERT INTO `admin_operation_log` VALUES ('1502', '1', 'admin/product_pics', 'POST', '127.0.0.1', '{\"_id\":\"TsfPCkz1qCkx6EnT\",\"_token\":\"78x1e0looL6bYuXIGSjzqkdLMDAUCaeNIQqxNhSF\",\"upload_column\":\"image\",\"id\":\"WU_FILE_0\",\"name\":\"p4GdZkvbHg.png\",\"type\":\"image\\/png\",\"lastModifiedDate\":\"Tue Jul 28 2020 17:40:29 GMT+0800 (\\u4e2d\\u56fd\\u6807\\u51c6\\u65f6\\u95f4)\",\"size\":\"14846\"}', '2020-08-10 13:38:20', '2020-08-10 13:38:20');
INSERT INTO `admin_operation_log` VALUES ('1503', '1', 'admin/product_pics/create', 'GET', '127.0.0.1', '{\"product_id\":\"113\"}', '2020-08-10 13:45:35', '2020-08-10 13:45:35');
INSERT INTO `admin_operation_log` VALUES ('1504', '1', 'admin/products/113', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-10 13:45:42', '2020-08-10 13:45:42');
INSERT INTO `admin_operation_log` VALUES ('1505', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-10 14:00:45', '2020-08-10 14:00:45');
INSERT INTO `admin_operation_log` VALUES ('1506', '1', 'admin/dcat-api/form/upload', 'POST', '127.0.0.1', '{\"_id\":\"fOrezNSKfUEuPbX0\",\"_token\":\"78x1e0looL6bYuXIGSjzqkdLMDAUCaeNIQqxNhSF\",\"upload_column\":\"image\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\ProdPic\",\"id\":\"WU_FILE_0\",\"name\":\"p4GdZkvbHg.png\",\"type\":\"image\\/png\",\"lastModifiedDate\":\"Tue Jul 28 2020 17:40:29 GMT+0800 (\\u4e2d\\u56fd\\u6807\\u51c6\\u65f6\\u95f4)\",\"size\":\"14846\"}', '2020-08-10 14:00:57', '2020-08-10 14:00:57');
INSERT INTO `admin_operation_log` VALUES ('1507', '1', 'admin/dcat-api/form', 'POST', '127.0.0.1', '{\"id\":\"113\",\"description\":\"\\u770b\\u770b\",\"image\":\"images\\/5c5ac9f6f7de1da92f59262b6429913a.png\",\"file-image\":null,\"_file_\":null,\"_form_\":\"App\\\\Admin\\\\Forms\\\\ProdPic\",\"_current_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/products?_pjax=%23pjax-container\",\"_token\":\"78x1e0looL6bYuXIGSjzqkdLMDAUCaeNIQqxNhSF\"}', '2020-08-10 14:01:19', '2020-08-10 14:01:19');
INSERT INTO `admin_operation_log` VALUES ('1508', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-10 14:01:20', '2020-08-10 14:01:20');
INSERT INTO `admin_operation_log` VALUES ('1509', '1', 'admin/products/113', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-10 14:01:26', '2020-08-10 14:01:26');
INSERT INTO `admin_operation_log` VALUES ('1510', '1', 'admin/products/113', 'GET', '127.0.0.1', '[]', '2020-08-10 14:03:06', '2020-08-10 14:03:06');
INSERT INTO `admin_operation_log` VALUES ('1511', '1', 'admin/products/113', 'GET', '127.0.0.1', '[]', '2020-08-10 14:10:14', '2020-08-10 14:10:14');
INSERT INTO `admin_operation_log` VALUES ('1512', '1', 'admin/dcat-api/form/upload', 'POST', '127.0.0.1', '{\"_id\":\"OpyBLE6BJoHBAFj1\",\"_token\":\"78x1e0looL6bYuXIGSjzqkdLMDAUCaeNIQqxNhSF\",\"upload_column\":\"image\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\ProdPic\",\"id\":\"WU_FILE_0\",\"name\":\"59c31e4400013bc911720340.jpg\",\"type\":\"image\\/jpeg\",\"lastModifiedDate\":\"Fri Jul 31 2020 15:08:22 GMT+0800 (\\u4e2d\\u56fd\\u6807\\u51c6\\u65f6\\u95f4)\",\"size\":\"21818\"}', '2020-08-10 14:10:28', '2020-08-10 14:10:28');
INSERT INTO `admin_operation_log` VALUES ('1513', '1', 'admin/dcat-api/form', 'POST', '127.0.0.1', '{\"id\":\"113\",\"description\":\"\\u5475\\u5475\",\"image\":\"images\\/51d73b7cf82ae3d29349379864e26ec0.jpg\",\"file-image\":null,\"_file_\":null,\"_form_\":\"App\\\\Admin\\\\Forms\\\\ProdPic\",\"_current_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/products\\/113?\",\"_token\":\"78x1e0looL6bYuXIGSjzqkdLMDAUCaeNIQqxNhSF\"}', '2020-08-10 14:10:29', '2020-08-10 14:10:29');
INSERT INTO `admin_operation_log` VALUES ('1514', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-10 14:10:30', '2020-08-10 14:10:30');
INSERT INTO `admin_operation_log` VALUES ('1515', '1', 'admin/products/113', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-10 14:10:35', '2020-08-10 14:10:35');
INSERT INTO `admin_operation_log` VALUES ('1516', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-10 14:14:01', '2020-08-10 14:14:01');
INSERT INTO `admin_operation_log` VALUES ('1517', '1', 'admin/products/113', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-10 14:14:32', '2020-08-10 14:14:32');
INSERT INTO `admin_operation_log` VALUES ('1518', '1', 'admin/products/113', 'GET', '127.0.0.1', '[]', '2020-08-10 14:15:30', '2020-08-10 14:15:30');
INSERT INTO `admin_operation_log` VALUES ('1519', '1', 'admin/product_pics/271', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"78x1e0looL6bYuXIGSjzqkdLMDAUCaeNIQqxNhSF\"}', '2020-08-10 14:15:39', '2020-08-10 14:15:39');
INSERT INTO `admin_operation_log` VALUES ('1520', '1', 'admin/products/113', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-10 14:15:39', '2020-08-10 14:15:39');
INSERT INTO `admin_operation_log` VALUES ('1521', '1', 'admin/product_pics/272', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"78x1e0looL6bYuXIGSjzqkdLMDAUCaeNIQqxNhSF\"}', '2020-08-10 14:15:46', '2020-08-10 14:15:46');
INSERT INTO `admin_operation_log` VALUES ('1522', '1', 'admin/products/113', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-10 14:15:46', '2020-08-10 14:15:46');
INSERT INTO `admin_operation_log` VALUES ('1523', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-10 14:20:10', '2020-08-10 14:20:10');
INSERT INTO `admin_operation_log` VALUES ('1524', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-10 14:27:58', '2020-08-10 14:27:58');
INSERT INTO `admin_operation_log` VALUES ('1525', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-10 14:35:47', '2020-08-10 14:35:47');
INSERT INTO `admin_operation_log` VALUES ('1526', '1', 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":null,\"title\":\"\\u4f18\\u60e0\\u5238\",\"icon\":\"fa-tags\",\"uri\":\"\\/coupon_codes\",\"roles\":[null],\"permissions\":null,\"_token\":\"78x1e0looL6bYuXIGSjzqkdLMDAUCaeNIQqxNhSF\"}', '2020-08-10 14:36:25', '2020-08-10 14:36:25');
INSERT INTO `admin_operation_log` VALUES ('1527', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-08-10 14:36:27', '2020-08-10 14:36:27');
INSERT INTO `admin_operation_log` VALUES ('1528', '1', 'admin/coupon_codes', 'GET', '127.0.0.1', '[]', '2020-08-10 14:37:54', '2020-08-10 14:37:54');
INSERT INTO `admin_operation_log` VALUES ('1529', '1', 'admin/coupon_codes', 'GET', '127.0.0.1', '[]', '2020-08-10 14:38:32', '2020-08-10 14:38:32');
INSERT INTO `admin_operation_log` VALUES ('1530', '1', 'admin/coupon_codes/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-10 14:38:39', '2020-08-10 14:38:39');
INSERT INTO `admin_operation_log` VALUES ('1531', '1', 'admin/coupon_codes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-10 14:38:44', '2020-08-10 14:38:44');
INSERT INTO `admin_operation_log` VALUES ('1532', '1', 'admin/coupon_codes', 'GET', '127.0.0.1', '[]', '2020-08-10 14:44:14', '2020-08-10 14:44:14');
INSERT INTO `admin_operation_log` VALUES ('1533', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-10 15:04:13', '2020-08-10 15:04:13');
INSERT INTO `admin_operation_log` VALUES ('1534', '1', 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":null,\"title\":\"\\u8ba2\\u5355\\u7ba1\\u7406\",\"icon\":\"fa-rmb\",\"uri\":\"\\/orders\",\"roles\":[null],\"permissions\":null,\"_token\":\"78x1e0looL6bYuXIGSjzqkdLMDAUCaeNIQqxNhSF\"}', '2020-08-10 15:04:59', '2020-08-10 15:04:59');
INSERT INTO `admin_operation_log` VALUES ('1535', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-08-10 15:05:01', '2020-08-10 15:05:01');
INSERT INTO `admin_operation_log` VALUES ('1536', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-10 15:05:05', '2020-08-10 15:05:05');
INSERT INTO `admin_operation_log` VALUES ('1537', '1', 'admin/auth/menu', 'POST', '127.0.0.1', '{\"_token\":\"78x1e0looL6bYuXIGSjzqkdLMDAUCaeNIQqxNhSF\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":8},{\\\"id\\\":9},{\\\"id\\\":12,\\\"children\\\":[{\\\"id\\\":13},{\\\"id\\\":14},{\\\"id\\\":15},{\\\"id\\\":16},{\\\"id\\\":17}]},{\\\"id\\\":19},{\\\"id\\\":10},{\\\"id\\\":11},{\\\"id\\\":18},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}', '2020-08-10 15:05:33', '2020-08-10 15:05:33');
INSERT INTO `admin_operation_log` VALUES ('1538', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-08-10 15:05:35', '2020-08-10 15:05:35');
INSERT INTO `admin_operation_log` VALUES ('1539', '1', 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-08-10 15:06:13', '2020-08-10 15:06:13');
INSERT INTO `admin_operation_log` VALUES ('1540', '1', 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-08-10 15:07:15', '2020-08-10 15:07:15');
INSERT INTO `admin_operation_log` VALUES ('1541', '1', 'admin/orders/20', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-10 15:07:44', '2020-08-10 15:07:44');
INSERT INTO `admin_operation_log` VALUES ('1542', '1', 'admin/orders/20', 'GET', '127.0.0.1', '[]', '2020-08-10 15:07:44', '2020-08-10 15:07:44');
INSERT INTO `admin_operation_log` VALUES ('1543', '1', 'admin/orders/20', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-10 15:08:22', '2020-08-10 15:08:22');
INSERT INTO `admin_operation_log` VALUES ('1544', '1', 'admin/orders/20', 'GET', '127.0.0.1', '[]', '2020-08-10 15:08:22', '2020-08-10 15:08:22');
INSERT INTO `admin_operation_log` VALUES ('1545', '1', 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-08-10 15:11:49', '2020-08-10 15:11:49');
INSERT INTO `admin_operation_log` VALUES ('1546', '1', 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-08-10 15:13:30', '2020-08-10 15:13:30');
INSERT INTO `admin_operation_log` VALUES ('1547', '1', 'admin/orders/14', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-10 15:13:33', '2020-08-10 15:13:33');
INSERT INTO `admin_operation_log` VALUES ('1548', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-10 15:13:57', '2020-08-10 15:13:57');
INSERT INTO `admin_operation_log` VALUES ('1549', '1', 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-08-10 15:19:06', '2020-08-10 15:19:06');
INSERT INTO `admin_operation_log` VALUES ('1550', '1', 'admin/orders/10', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-10 15:19:24', '2020-08-10 15:19:24');
INSERT INTO `admin_operation_log` VALUES ('1551', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-10 15:19:58', '2020-08-10 15:19:58');
INSERT INTO `admin_operation_log` VALUES ('1552', '1', 'admin/orders/13', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-10 15:20:10', '2020-08-10 15:20:10');
INSERT INTO `admin_operation_log` VALUES ('1553', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-10 15:20:24', '2020-08-10 15:20:24');
INSERT INTO `admin_operation_log` VALUES ('1554', '1', 'admin/orders/14', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-10 15:20:28', '2020-08-10 15:20:28');
INSERT INTO `admin_operation_log` VALUES ('1555', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-10 15:20:32', '2020-08-10 15:20:32');
INSERT INTO `admin_operation_log` VALUES ('1556', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-10 15:21:06', '2020-08-10 15:21:06');

-- ----------------------------
-- Table structure for `admin_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `admin_permissions`;
CREATE TABLE `admin_permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '0',
  `parent_id` bigint(20) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_permissions_slug_unique` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_permissions
-- ----------------------------
INSERT INTO `admin_permissions` VALUES ('1', 'Auth management', 'auth-management', '', '', '1', '0', '2020-07-29 02:27:24', null);
INSERT INTO `admin_permissions` VALUES ('2', 'Users', 'users', '', '/auth/users*', '2', '1', '2020-07-29 02:27:24', null);
INSERT INTO `admin_permissions` VALUES ('3', 'Roles', 'roles', '', '/auth/roles*', '3', '1', '2020-07-29 02:27:24', null);
INSERT INTO `admin_permissions` VALUES ('4', 'Permissions', 'permissions', '', '/auth/permissions*', '4', '1', '2020-07-29 02:27:24', null);
INSERT INTO `admin_permissions` VALUES ('5', 'Menu', 'menu', '', '/auth/menu*', '5', '1', '2020-07-29 02:27:24', null);
INSERT INTO `admin_permissions` VALUES ('6', 'Operation log', 'operation-log', '', '/auth/logs*', '6', '1', '2020-07-29 02:27:24', null);

-- ----------------------------
-- Table structure for `admin_permission_menu`
-- ----------------------------
DROP TABLE IF EXISTS `admin_permission_menu`;
CREATE TABLE `admin_permission_menu` (
  `permission_id` bigint(20) NOT NULL,
  `menu_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `admin_permission_menu_permission_id_menu_id_unique` (`permission_id`,`menu_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_permission_menu
-- ----------------------------

-- ----------------------------
-- Table structure for `admin_roles`
-- ----------------------------
DROP TABLE IF EXISTS `admin_roles`;
CREATE TABLE `admin_roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_roles_slug_unique` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_roles
-- ----------------------------
INSERT INTO `admin_roles` VALUES ('1', 'Administrator', 'administrator', '2020-07-29 02:27:24', '2020-07-29 02:27:24');

-- ----------------------------
-- Table structure for `admin_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_menu`;
CREATE TABLE `admin_role_menu` (
  `role_id` bigint(20) NOT NULL,
  `menu_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `admin_role_menu_role_id_menu_id_unique` (`role_id`,`menu_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for `admin_role_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_permissions`;
CREATE TABLE `admin_role_permissions` (
  `role_id` bigint(20) NOT NULL,
  `permission_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `admin_role_permissions_role_id_permission_id_unique` (`role_id`,`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_role_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `admin_role_users`
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_users`;
CREATE TABLE `admin_role_users` (
  `role_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `admin_role_users_role_id_user_id_unique` (`role_id`,`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_role_users
-- ----------------------------
INSERT INTO `admin_role_users` VALUES ('1', '1', null, null);

-- ----------------------------
-- Table structure for `admin_users`
-- ----------------------------
DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE `admin_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_username_unique` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_users
-- ----------------------------
INSERT INTO `admin_users` VALUES ('1', 'admin', '$2y$10$RfKdMZtm5uyIF9cZY.Ko6OGXSi.98N6e8EGLmNR84OAyGxL3jvDxC', 'Administrator', null, null, '2020-07-29 02:27:24', '2020-07-29 02:27:24');

-- ----------------------------
-- Table structure for `ads`
-- ----------------------------
DROP TABLE IF EXISTS `ads`;
CREATE TABLE `ads` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `width` int(10) unsigned NOT NULL,
  `height` int(10) unsigned NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ads
-- ----------------------------
INSERT INTO `ads` VALUES ('1', 'top', 'ads/0d52c2a339eab54dd464d56b49c0baf0.jpg', '/', '825', '530', '<div class=\"herobanner-box\">\r\n                                <h4>WE ARE THE BEST</h4>\r\n                            </div>\r\n                            <div class=\"herobanner-box\">\r\n                                <h1>Headphones On <span>World Off</span></h1>\r\n                            </div>\r\n                            <div class=\"herobanner-box\">\r\n                                <p>Bose Qc25 black quiet comfort25 acoustic noise cancelling Headphones. Lorem ipsum dollor.</p>\r\n                            </div>\r\n                            <div class=\"herobanner-box\">\r\n                                <a href=\"shop-rightsidebar.html\" class=\"ho-button\">\r\n                                    <i class=\"lnr lnr-cart\"></i>\r\n                                    <span>Shop Now</span>\r\n                                </a>\r\n                            </div>', '2020-06-23 16:50:07', '2020-06-23 16:50:07');
INSERT INTO `ads` VALUES ('2', 'top2', 'ads/7cf660df5d4a89c9aeaabfea0dcb9eac.jpg', '/', '825', '530', '<div class=\"herobanner-box\">\r\n                                <h4>ONE - DAY SEMINAR</h4>\r\n                            </div>\r\n                            <div class=\"herobanner-box\">\r\n                                <h1>Writing & Product <span>For VR</span></h1>\r\n                            </div>\r\n                            <div class=\"herobanner-box\">\r\n                                <p>Learn how to write and produce cinematic Virtual Reality content by revered industry leaders.</p>\r\n                            </div>\r\n                            <div class=\"herobanner-box\">\r\n                                <a href=\"shop-rightsidebar.html\" class=\"ho-button\">\r\n                                    <i class=\"lnr lnr-cart\"></i>\r\n                                    <span>Shop Now</span>\r\n                                </a>\r\n                            </div>', '2020-06-23 17:11:21', '2020-06-23 17:11:21');
INSERT INTO `ads` VALUES ('3', 'left1', 'ads/04058e563d2239c12d87e8597933dae4.jpg', '/', '255', '310', null, '2020-06-23 17:13:56', '2020-06-23 17:13:56');
INSERT INTO `ads` VALUES ('4', 'left2', 'ads/33ea9bb466e5c56a4733278f6c1ef992.jpg', '/', '255', '310', null, '2020-06-23 17:14:31', '2020-06-23 17:14:31');
INSERT INTO `ads` VALUES ('5', 'middle1', 'ads/88c55960b02b371d12913198346285f4.jpg', '/', '350', '160', null, '2020-06-23 17:15:38', '2020-06-23 17:15:38');
INSERT INTO `ads` VALUES ('6', 'middle2', 'ads/69ca6f52b4d002154532861c21c28db0.jpg', '/', '350', '160', null, '2020-06-23 17:15:58', '2020-06-23 17:15:58');
INSERT INTO `ads` VALUES ('7', 'middle3', 'ads/c53d73169db15d1ac0301ee6eb74cbd8.jpg', '/', '350', '160', null, '2020-06-23 17:16:15', '2020-06-23 17:16:15');
INSERT INTO `ads` VALUES ('8', 'banner1', 'ads/08525b6fdd40a70bb342453432cfb8b8.jpg', '/', '1110', '170', null, '2020-06-23 17:17:17', '2020-06-23 17:17:17');
INSERT INTO `ads` VALUES ('9', 'bannerl', 'ads/09aadfae69c36a7379b24fe6f6ff5a1e.jpg', '/', '840', '170', null, '2020-06-23 17:18:25', '2020-06-23 17:18:25');
INSERT INTO `ads` VALUES ('10', 'bannerl2', 'ads/3aebc9fd377388fbef9d36cfd623d472.jpg', '/', '840', '170', null, '2020-06-23 17:18:54', '2020-06-23 17:18:54');
INSERT INTO `ads` VALUES ('11', 'left3', 'ads/500f1a173dd95c1ecf72b994784ca696.jpg', '/', '270', '345', null, '2020-06-23 17:19:59', '2020-06-23 17:19:59');
INSERT INTO `ads` VALUES ('12', 'bottomb', 'ads/620c55051c0aa16b014620eb700e6de9.jpg', '/', '1110', '430', null, '2020-06-23 17:21:01', '2020-06-23 17:21:01');
INSERT INTO `ads` VALUES ('13', 'bottomb1', 'ads/42d7dd673836ff692d249f3e3ff044eb.jpg', '/', '555', '150', null, '2020-06-23 17:22:00', '2020-06-23 17:22:00');

-- ----------------------------
-- Table structure for `brands`
-- ----------------------------
DROP TABLE IF EXISTS `brands`;
CREATE TABLE `brands` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of brands
-- ----------------------------
INSERT INTO `brands` VALUES ('1', '联想', 'brands/7069267b9222be5b5db888696c60049a.png', '/', '2020-06-24 09:07:12', '2020-06-24 09:13:13');
INSERT INTO `brands` VALUES ('2', '小米', 'brands/750b31f89236c8986d92644a51fa63c1.jpg', '/', '2020-06-24 09:15:30', '2020-06-24 09:15:30');
INSERT INTO `brands` VALUES ('3', '大华', 'brands/e336c8de43a1d0b3aa89afe30e7cdcdd.jpg', '/', '2020-06-24 09:17:03', '2020-06-24 09:17:03');
INSERT INTO `brands` VALUES ('4', '海康威视', 'brands/155ea125965cbfe914bb5d468509cc16.jpg', '/', '2020-06-24 09:18:50', '2020-06-24 09:18:50');
INSERT INTO `brands` VALUES ('5', '华为', 'brands/6b8beca83b8cd53ddc82d7fe32e41cf0.jpg', '/', '2020-06-24 09:20:17', '2020-06-24 09:20:17');
INSERT INTO `brands` VALUES ('6', '苹果', 'brands/d6d6b08a2e7211e21cf5f918cf9cd6b2.jpg', '/', '2020-06-24 09:20:59', '2020-06-24 09:20:59');
INSERT INTO `brands` VALUES ('7', '微软', 'brands/161bdae75fee425e1d36878c963dd1c1.jpg', '/', '2020-06-24 09:21:34', '2020-06-24 09:21:34');

-- ----------------------------
-- Table structure for `cart_items`
-- ----------------------------
DROP TABLE IF EXISTS `cart_items`;
CREATE TABLE `cart_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `product_sku_id` bigint(20) unsigned NOT NULL,
  `amount` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_items_user_id_foreign` (`user_id`),
  KEY `cart_items_product_sku_id_foreign` (`product_sku_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cart_items
-- ----------------------------

-- ----------------------------
-- Table structure for `categories`
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint(20) unsigned DEFAULT '0',
  `is_directory` tinyint(1) NOT NULL,
  `level` int(10) unsigned NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_parent_id_foreign` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES ('1', '手机配件', '0', '1', '0', '-', '2020-06-22 15:03:34', '2020-06-22 15:03:34');
INSERT INTO `categories` VALUES ('2', '手机壳', '1', '0', '1', '-1-', '2020-06-22 15:03:34', '2020-06-22 15:03:34');
INSERT INTO `categories` VALUES ('3', '贴膜', '1', '0', '1', '-1-', '2020-06-22 15:03:34', '2020-06-22 15:03:34');
INSERT INTO `categories` VALUES ('4', '存储卡', '1', '0', '1', '-1-', '2020-06-22 15:03:34', '2020-06-22 15:03:34');
INSERT INTO `categories` VALUES ('5', '数据线', '1', '0', '1', '-1-', '2020-06-22 15:03:34', '2020-06-22 15:03:34');
INSERT INTO `categories` VALUES ('6', '充电器', '1', '0', '1', '-1-', '2020-06-22 15:03:34', '2020-06-22 15:03:34');
INSERT INTO `categories` VALUES ('7', '耳机', '1', '1', '1', '-1-', '2020-06-22 15:03:34', '2020-06-22 15:03:34');
INSERT INTO `categories` VALUES ('8', '有线耳机', '7', '0', '2', '-1-7-', '2020-06-22 15:03:34', '2020-06-22 15:03:34');
INSERT INTO `categories` VALUES ('9', '蓝牙耳机', '7', '0', '2', '-1-7-', '2020-06-22 15:03:34', '2020-06-22 15:03:34');
INSERT INTO `categories` VALUES ('10', '电脑配件', '0', '1', '0', '-', '2020-06-22 15:03:34', '2020-06-22 15:03:34');
INSERT INTO `categories` VALUES ('11', '显示器', '10', '0', '1', '-10-', '2020-06-22 15:03:34', '2020-06-22 15:03:34');
INSERT INTO `categories` VALUES ('12', '显卡', '10', '0', '1', '-10-', '2020-06-22 15:03:35', '2020-06-22 15:03:35');
INSERT INTO `categories` VALUES ('13', '内存', '10', '0', '1', '-10-', '2020-06-22 15:03:35', '2020-06-22 15:03:35');
INSERT INTO `categories` VALUES ('14', 'CPU', '10', '0', '1', '-10-', '2020-06-22 15:03:35', '2020-06-22 15:03:35');
INSERT INTO `categories` VALUES ('15', '主板', '10', '0', '1', '-10-', '2020-06-22 15:03:35', '2020-06-22 15:03:35');
INSERT INTO `categories` VALUES ('16', '硬盘', '10', '0', '1', '-10-', '2020-06-22 15:03:35', '2020-06-22 15:03:35');
INSERT INTO `categories` VALUES ('17', '电脑整机', '0', '1', '0', '-', '2020-06-22 15:03:35', '2020-06-22 15:03:35');
INSERT INTO `categories` VALUES ('18', '笔记本', '17', '0', '1', '-17-', '2020-06-22 15:03:35', '2020-06-22 15:03:35');
INSERT INTO `categories` VALUES ('19', '台式机', '17', '0', '1', '-17-', '2020-06-22 15:03:35', '2020-06-22 15:03:35');
INSERT INTO `categories` VALUES ('20', '平板电脑', '17', '0', '1', '-17-', '2020-06-22 15:03:35', '2020-06-22 15:03:35');
INSERT INTO `categories` VALUES ('21', '一体机', '17', '0', '1', '-17-', '2020-06-22 15:03:35', '2020-06-22 15:03:35');
INSERT INTO `categories` VALUES ('22', '服务器', '17', '0', '1', '-17-', '2020-06-22 15:03:35', '2020-06-22 15:03:35');
INSERT INTO `categories` VALUES ('23', '工作站', '17', '0', '1', '-17-', '2020-06-22 15:03:35', '2020-06-22 15:03:35');
INSERT INTO `categories` VALUES ('24', '手机通讯', '0', '1', '0', '-', '2020-06-22 15:03:35', '2020-06-22 15:03:35');
INSERT INTO `categories` VALUES ('25', '智能机', '24', '0', '1', '-24-', '2020-06-22 15:03:35', '2020-06-22 15:03:35');
INSERT INTO `categories` VALUES ('26', '老人机', '24', '0', '1', '-24-', '2020-06-22 15:03:35', '2020-06-22 15:03:35');
INSERT INTO `categories` VALUES ('27', '对讲机', '24', '0', '1', '-24-', '2020-06-22 15:03:35', '2020-06-22 15:03:35');
INSERT INTO `categories` VALUES ('28', '安防设备', '0', '1', '0', '-', '2020-06-22 16:03:25', '2020-06-22 16:03:25');
INSERT INTO `categories` VALUES ('29', '摄像头', '28', '0', '1', '-28-', '2020-06-22 16:04:10', '2020-06-22 16:04:10');
INSERT INTO `categories` VALUES ('30', '监控器', '28', '0', '1', '-28-', '2020-06-22 16:05:03', '2020-06-22 16:05:14');
INSERT INTO `categories` VALUES ('32', '电子教育', '0', '1', '0', '-', '2020-06-24 15:28:57', '2020-06-24 17:14:05');
INSERT INTO `categories` VALUES ('33', '复读机', '32', '0', '1', '-32-', '2020-06-24 15:29:33', '2020-06-24 17:14:25');
INSERT INTO `categories` VALUES ('34', '手表', '0', '1', '0', '-', '2020-06-24 15:30:20', '2020-06-24 15:30:20');
INSERT INTO `categories` VALUES ('35', '苹果手表', '34', '0', '1', '-34-', '2020-06-24 15:30:37', '2020-06-24 15:30:37');
INSERT INTO `categories` VALUES ('36', '相机', '0', '1', '0', '-', '2020-06-24 15:32:07', '2020-06-24 15:32:07');
INSERT INTO `categories` VALUES ('37', '佳能', '36', '0', '1', '-36-', '2020-06-24 15:32:21', '2020-06-24 15:32:21');
INSERT INTO `categories` VALUES ('38', '游戏机', '0', '1', '0', '-', '2020-06-24 16:06:15', '2020-06-24 16:06:15');
INSERT INTO `categories` VALUES ('39', '索尼', '38', '0', '1', '-38-', '2020-06-24 16:06:30', '2020-06-24 16:06:30');
INSERT INTO `categories` VALUES ('40', '电视', '0', '1', '0', '-', '2020-06-25 11:01:34', '2020-06-25 11:01:34');
INSERT INTO `categories` VALUES ('41', '液晶电视', '40', '0', '1', '-40-', '2020-06-25 11:02:05', '2020-06-25 11:02:05');
INSERT INTO `categories` VALUES ('42', '空调', '0', '1', '0', '-', '2020-06-25 11:07:45', '2020-06-25 11:07:45');
INSERT INTO `categories` VALUES ('43', '格力空调', '42', '0', '1', '-42-', '2020-06-25 11:08:02', '2020-06-25 11:08:02');
INSERT INTO `categories` VALUES ('44', '三星Watch', '34', '0', '1', '-34-', '2020-06-25 11:14:29', '2020-06-25 11:14:29');
INSERT INTO `categories` VALUES ('45', '机器人', '0', '1', '0', '-', '2020-06-25 11:17:05', '2020-06-25 11:17:05');
INSERT INTO `categories` VALUES ('46', '扫地机器人', '45', '0', '1', '-45-', '2020-06-25 11:17:21', '2020-06-25 11:17:21');
INSERT INTO `categories` VALUES ('47', '小米手表', '34', '0', '1', '-34-', '2020-06-25 12:30:10', '2020-06-25 12:30:10');
INSERT INTO `categories` VALUES ('48', '华为手表', '34', '0', '1', '-34-', '2020-06-25 12:34:56', '2020-06-25 12:34:56');
INSERT INTO `categories` VALUES ('49', '佳明手表', '34', '0', '1', '-34-', '2020-06-25 12:43:38', '2020-06-25 12:43:38');
INSERT INTO `categories` VALUES ('50', '鼠标', '10', '0', '1', '-10-', '2020-06-25 17:55:11', '2020-06-25 17:55:11');
INSERT INTO `categories` VALUES ('55', '海尔空调', '42', '0', '1', '-42-', '2020-08-04 15:03:38', '2020-08-04 15:03:58');

-- ----------------------------
-- Table structure for `coupon_codes`
-- ----------------------------
DROP TABLE IF EXISTS `coupon_codes`;
CREATE TABLE `coupon_codes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(8,2) NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_amount` decimal(10,2) NOT NULL,
  `total` int(10) unsigned NOT NULL,
  `used` int(10) unsigned NOT NULL DEFAULT '0',
  `not_before` datetime DEFAULT NULL,
  `not_after` datetime DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `coupon_codes_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of coupon_codes
-- ----------------------------
INSERT INTO `coupon_codes` VALUES ('1', 'qui enim incidunt', 'QJS331WEO5EG5QCP', '77.00', 'fixed', '77.01', '100', '0', null, null, '1', '2019-12-09 02:34:24', '2019-12-09 02:34:24');
INSERT INTO `coupon_codes` VALUES ('2', 'eaque corporis delectus', '5CONO1LAROMY6ZYD', '18.00', 'percent', '364.00', '100', '0', null, null, '1', '2019-12-09 02:34:24', '2019-12-09 02:34:24');
INSERT INTO `coupon_codes` VALUES ('3', 'nemo consequatur magnam', 'PSEXMTSBWGHRY7ZB', '37.00', 'percent', '851.00', '100', '0', null, null, '1', '2019-12-09 02:34:24', '2019-12-09 02:34:24');
INSERT INTO `coupon_codes` VALUES ('4', 'quo quo necessitatibus', 'VZROME6KLSL6G2FG', '49.00', 'percent', '0.00', '100', '0', null, null, '1', '2019-12-09 02:34:24', '2019-12-09 02:34:24');
INSERT INTO `coupon_codes` VALUES ('5', 'quis ut ut', 'J7BPV8AIURDWAO8Q', '15.00', 'percent', '0.00', '100', '0', null, null, '1', '2019-12-09 02:34:24', '2019-12-09 02:34:24');
INSERT INTO `coupon_codes` VALUES ('6', 'at quia enim', 'OESBNL3IHPDSNS8F', '26.00', 'percent', '0.00', '100', '0', null, null, '1', '2019-12-09 02:34:24', '2019-12-09 02:34:24');
INSERT INTO `coupon_codes` VALUES ('7', 'ut molestiae in', 'R6ITREMSUNM7CVRQ', '50.00', 'fixed', '50.01', '100', '0', null, null, '1', '2019-12-09 02:34:24', '2019-12-09 02:34:24');
INSERT INTO `coupon_codes` VALUES ('8', 'aut quos dignissimos', 'HFQDLOLSMGUE495C', '15.00', 'percent', '515.00', '100', '0', null, null, '1', '2019-12-09 02:34:24', '2019-12-09 02:34:24');
INSERT INTO `coupon_codes` VALUES ('9', 'magnam illum voluptatum', '0L0IEB6PVQD0QKQU', '20.00', 'percent', '891.00', '100', '0', null, null, '1', '2019-12-09 02:34:24', '2019-12-09 02:34:24');
INSERT INTO `coupon_codes` VALUES ('10', 'numquam illum odit', 'WFPYCYZRUGDICOZO', '90.00', 'fixed', '90.01', '100', '0', null, null, '1', '2019-12-09 02:34:24', '2019-12-09 02:34:24');
INSERT INTO `coupon_codes` VALUES ('11', 'guoguo', 'LSBXY7RZCRMCFFJ6', '20.00', 'fixed', '500.00', '1000', '0', '2019-12-09 05:47:26', '2019-12-09 05:47:26', '1', '2019-12-09 05:47:47', '2019-12-09 05:47:47');
INSERT INTO `coupon_codes` VALUES ('14', 'guo', 'JNKID6S0EAIOKIRA', '20.00', 'fixed', '500.00', '1000', '0', '2019-12-09 06:06:49', '2019-12-20 06:06:49', '1', '2019-12-09 06:07:10', '2019-12-09 06:07:10');

-- ----------------------------
-- Table structure for `crowdfunding_products`
-- ----------------------------
DROP TABLE IF EXISTS `crowdfunding_products`;
CREATE TABLE `crowdfunding_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `target_amount` decimal(10,2) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `user_count` int(10) unsigned NOT NULL DEFAULT '0',
  `end_at` datetime NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'funding',
  PRIMARY KEY (`id`),
  KEY `crowdfunding_products_product_id_foreign` (`product_id`),
  CONSTRAINT `crowdfunding_products_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of crowdfunding_products
-- ----------------------------
INSERT INTO `crowdfunding_products` VALUES ('1', '60', '100000.00', '0.00', '0', '2020-07-31 15:00:00', 'funding');
INSERT INTO `crowdfunding_products` VALUES ('2', '63', '100000.00', '0.00', '0', '2020-07-31 16:00:00', 'funding');
INSERT INTO `crowdfunding_products` VALUES ('3', '71', '100000.00', '0.00', '0', '2020-07-31 15:00:00', 'funding');
INSERT INTO `crowdfunding_products` VALUES ('4', '108', '100000.00', '900.00', '1', '2020-07-31 00:00:00', 'funding');
INSERT INTO `crowdfunding_products` VALUES ('5', '114', '100000.00', '0.00', '0', '2020-08-31 09:05:46', 'funding');
INSERT INTO `crowdfunding_products` VALUES ('6', '121', '100000.00', '0.00', '0', '2020-08-18 00:00:00', 'funding');

-- ----------------------------
-- Table structure for `failed_jobs`
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for `images`
-- ----------------------------
DROP TABLE IF EXISTS `images`;
CREATE TABLE `images` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `images_user_id_index` (`user_id`),
  KEY `images_type_index` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of images
-- ----------------------------
INSERT INTO `images` VALUES ('1', '1', 'avatar', 'http://myshop.xslp.cn:8080/uploads/images/avatars/202007/21/1_1595312234_7VyXeT2Knc.jpg', '2020-07-21 14:17:15', '2020-07-21 14:17:15');
INSERT INTO `images` VALUES ('2', '1', 'avatar', 'http://myshop.xslp.cn:8080/uploads/images/avatars/202007/21/1_1595312234_7VyXeT2Knc.jpg', '2020-07-21 14:25:53', '2020-07-21 14:25:53');
INSERT INTO `images` VALUES ('3', '1', 'avatar', 'http://myshop.xslp.cn:8080/uploads/images/avatars/202007/21/1_1595312234_7VyXeT2Knc.jpg', '2020-07-21 14:27:47', '2020-07-21 14:27:47');
INSERT INTO `images` VALUES ('4', '1', 'avatar', 'http://myshop.xslp.cn:8080/uploads/images/avatars/202007/21/1_1595312234_7VyXeT2Knc.jpg', '2020-07-21 14:32:11', '2020-07-21 14:32:11');

-- ----------------------------
-- Table structure for `migrations`
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('1', '2014_10_12_000000_create_users_table', '1');
INSERT INTO `migrations` VALUES ('2', '2016_01_04_173148_create_admin_tables', '1');
INSERT INTO `migrations` VALUES ('3', '2019_08_19_000000_create_failed_jobs_table', '1');
INSERT INTO `migrations` VALUES ('4', '2020_07_29_145350_create_user_addresses_table', '2');
INSERT INTO `migrations` VALUES ('5', '2014_10_12_100000_create_password_resets_table', '3');
INSERT INTO `migrations` VALUES ('6', '2020_08_03_162119_create_shops_table', '3');
INSERT INTO `migrations` VALUES ('7', '2020_08_04_092219_create_categories_table', '3');
INSERT INTO `migrations` VALUES ('8', '2020_06_23_162336_create_ads_table', '4');
INSERT INTO `migrations` VALUES ('9', '2020_06_23_172332_create_brands_table', '5');
INSERT INTO `migrations` VALUES ('10', '2020_06_18_105921_create_products_table', '6');
INSERT INTO `migrations` VALUES ('11', '2020_06_18_110631_create_product_skus_table', '6');
INSERT INTO `migrations` VALUES ('12', '2020_06_18_172611_products_add_originalprice', '6');
INSERT INTO `migrations` VALUES ('13', '2020_06_18_172658_product_skus_add_originalprice', '6');
INSERT INTO `migrations` VALUES ('14', '2020_06_19_162053_products_add_discountnum', '6');
INSERT INTO `migrations` VALUES ('15', '2020_06_19_162506_create_product_pics_table', '6');
INSERT INTO `migrations` VALUES ('16', '2020_06_22_133106_products_add_category_id', '6');
INSERT INTO `migrations` VALUES ('17', '2020_07_08_094913_create_user_favorite_products_table', '7');
INSERT INTO `migrations` VALUES ('18', '2020_06_22_165057_create_crowdfunding_products_table', '8');
INSERT INTO `migrations` VALUES ('19', '2020_06_22_170357_products_add_type', '9');
INSERT INTO `migrations` VALUES ('20', '2020_06_23_101110_create_seckill_products_table', '10');
INSERT INTO `migrations` VALUES ('21', '2020_06_24_144620_create_active_products_table', '11');
INSERT INTO `migrations` VALUES ('22', '2020_06_24_170505_products_add_recommend', '12');
INSERT INTO `migrations` VALUES ('23', '2020_07_09_180221_create_coupon_codes_table', '13');
INSERT INTO `migrations` VALUES ('24', '2020_07_08_105446_create_cart_items_table', '14');
INSERT INTO `migrations` VALUES ('25', '2020_07_08_172904_create_orders_table', '15');
INSERT INTO `migrations` VALUES ('26', '2020_07_08_172932_create_order_items_table', '15');
INSERT INTO `migrations` VALUES ('27', '2020_07_09_180550_orders_add_coupon_code_id', '15');
INSERT INTO `migrations` VALUES ('28', '2020_07_14_161613_orders_add_type', '15');
INSERT INTO `migrations` VALUES ('29', '2020_07_16_163838_add_username_phone_to_users', '15');
INSERT INTO `migrations` VALUES ('30', '2020_07_20_110859_add_weixin_openid_to_users_table', '15');
INSERT INTO `migrations` VALUES ('31', '2020_07_20_132346_add_avatar_to_users_table', '15');
INSERT INTO `migrations` VALUES ('32', '2020_07_20_170904_create_images_table', '15');

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'normal',
  `no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_amount` decimal(12,2) NOT NULL,
  `remark` text COLLATE utf8mb4_unicode_ci,
  `paid_at` datetime DEFAULT NULL,
  `coupon_code_id` bigint(20) unsigned DEFAULT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `refund_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `refund_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `reviewed` tinyint(1) NOT NULL DEFAULT '0',
  `ship_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `ship_data` text COLLATE utf8mb4_unicode_ci,
  `extra` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_no_unique` (`no`),
  UNIQUE KEY `orders_refund_no_unique` (`refund_no`),
  KEY `orders_user_id_foreign` (`user_id`),
  KEY `orders_coupon_code_id_foreign` (`coupon_code_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`coupon_code_id`) REFERENCES `coupon_codes` (`id`) ON DELETE SET NULL,
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('5', 'normal', '20200709111332694919', '1', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c68\\u8857\\u9053\\u7b2c847\\u53f7\",\"zip\":384200,\"contact_name\":\"\\u6c6a\\u6d9b\",\"contact_phone\":\"18485197712\"}', '7500.00', '55555', null, null, null, null, 'pending', null, '1', '0', 'pending', null, null, '2020-07-09 11:13:32', '2020-07-09 11:14:03');
INSERT INTO `orders` VALUES ('6', 'normal', '20200709132141966461', '1', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c68\\u8857\\u9053\\u7b2c847\\u53f7\",\"zip\":384200,\"contact_name\":\"\\u6c6a\\u6d9b\",\"contact_phone\":\"18485197712\"}', '6000.00', '哈哈', null, null, null, null, 'pending', null, '1', '0', 'pending', null, null, '2020-07-09 13:21:41', '2020-07-09 14:15:22');
INSERT INTO `orders` VALUES ('9', 'normal', '20200709135641221812', '1', '{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c14\\u8857\\u9053\\u7b2c110\\u53f7\",\"zip\":837000,\"contact_name\":\"\\u55bb\\u52c7\",\"contact_phone\":\"18765645898\"}', '350.00', 'asd', null, null, null, null, 'pending', null, '1', '0', 'pending', null, null, '2020-07-09 13:56:41', '2020-07-09 15:40:43');
INSERT INTO `orders` VALUES ('10', 'normal', '20200709165543852656', '1', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c26\\u8857\\u9053\\u7b2c204\\u53f7\",\"zip\":151300,\"contact_name\":\"\\u6885\\u5efa\\u534e\",\"contact_phone\":\"13278354425\"}', '100.00', '支付', '2020-07-09 17:36:46', null, 'alipay', '2020070922001499730501213780', 'applied', null, '0', '1', 'received', '{\"express_company\":\"\\u83dc\\u9e1f\\u7269\\u6d41\",\"express_no\":\"cn0001\"}', '{\"refund_reason\":\"haode\",\"refund_disagree_reason\":\"hello\"}', '2020-07-09 16:55:43', '2020-07-10 15:54:42');
INSERT INTO `orders` VALUES ('11', 'normal', '20200709174407050573', '1', '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u660c\\u5e73\\u533a\\u738b\\u5e9c\\u5927\\u8857101\\u53f7\",\"zip\":600006,\"contact_name\":\"\\u7c73\\u5c0f\\u5708\",\"contact_phone\":\"15165108626\"}', '350.00', '米小圈收', '2020-07-10 16:25:18', null, 'alipay', '2020071022001499730501213785', 'pending', null, '0', '1', 'delivered', '{\"express_company\":\"\\u83dc\\u9e1f\\u7269\\u6d41\",\"express_no\":\"cn0002\"}', null, '2020-07-09 17:44:07', '2020-07-10 16:32:51');
INSERT INTO `orders` VALUES ('12', 'normal', '20200710171536422175', '1', '{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c14\\u8857\\u9053\\u7b2c110\\u53f7\",\"zip\":837000,\"contact_name\":\"\\u55bb\\u52c7\",\"contact_phone\":\"18765645898\"}', '2990.00', 'xia dan le', null, '11', null, null, 'pending', null, '1', '0', 'pending', null, null, '2020-07-10 17:15:36', '2020-07-14 16:05:59');
INSERT INTO `orders` VALUES ('13', 'crowdfunding', '20200714154731047930', '1', '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u660c\\u5e73\\u533a\\u738b\\u5e9c\\u5927\\u8857101\\u53f7\",\"zip\":600006,\"contact_name\":\"\\u7c73\\u5c0f\\u5708\",\"contact_phone\":\"15165108626\"}', '600.00', '', '2020-07-14 16:05:46', null, 'alipay', '2020071422001499730501216530', 'pending', null, '0', '0', 'pending', null, null, '2020-07-14 15:47:31', '2020-07-14 16:05:46');
INSERT INTO `orders` VALUES ('14', 'crowdfunding', '20200714165242770509', '1', '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u660c\\u5e73\\u533a\\u738b\\u5e9c\\u5927\\u8857101\\u53f7\",\"zip\":600006,\"contact_name\":\"\\u7c73\\u5c0f\\u5708\",\"contact_phone\":\"15165108626\"}', '300.00', '', '2020-07-14 17:09:20', null, 'alipay', '2020071422001499730501216839', 'pending', null, '0', '0', 'pending', null, null, '2020-07-14 16:52:42', '2020-07-14 17:09:20');
INSERT INTO `orders` VALUES ('15', 'seckill', '20200715152251335094', '1', '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u660c\\u5e73\\u533a\\u738b\\u5e9c\\u5927\\u8857101\\u53f7\",\"zip\":600006,\"contact_name\":\"\\u7c73\\u5c0f\\u5708\",\"contact_phone\":\"15165108626\"}', '349.00', '', null, null, null, null, 'pending', null, '1', '0', 'pending', null, null, '2020-07-15 15:22:51', '2020-07-15 15:33:28');
INSERT INTO `orders` VALUES ('16', 'seckill', '20200715155324430072', '1', '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u660c\\u5e73\\u533a\\u738b\\u5e9c\\u5927\\u8857101\\u53f7\",\"zip\":600006,\"contact_name\":\"\\u7c73\\u5c0f\\u5708\",\"contact_phone\":\"15165108626\"}', '349.00', '', null, null, null, null, 'pending', null, '1', '0', 'pending', null, null, '2020-07-15 15:53:24', '2020-07-15 15:58:26');

-- ----------------------------
-- Table structure for `order_items`
-- ----------------------------
DROP TABLE IF EXISTS `order_items`;
CREATE TABLE `order_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `product_sku_id` bigint(20) unsigned NOT NULL,
  `price` decimal(12,2) NOT NULL,
  `amount` int(10) unsigned NOT NULL,
  `rating` int(10) unsigned DEFAULT NULL,
  `review` text COLLATE utf8mb4_unicode_ci,
  `reviewed_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_order_id_foreign` (`order_id`),
  KEY `order_items_product_id_foreign` (`product_id`),
  KEY `order_items_product_sku_id_foreign` (`product_sku_id`),
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_ibfk_3` FOREIGN KEY (`product_sku_id`) REFERENCES `product_skus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of order_items
-- ----------------------------
INSERT INTO `order_items` VALUES ('1', '5', '75', '178', '7500.00', '1', null, null, null);
INSERT INTO `order_items` VALUES ('2', '6', '76', '179', '3000.00', '2', null, null, null);
INSERT INTO `order_items` VALUES ('5', '9', '79', '182', '350.00', '1', null, null, null);
INSERT INTO `order_items` VALUES ('6', '10', '56', '8', '100.00', '1', '5', 'haha', '2020-07-10 11:24:00');
INSERT INTO `order_items` VALUES ('7', '11', '79', '182', '350.00', '1', '4', 'hehe b', '2020-07-10 16:32:51');
INSERT INTO `order_items` VALUES ('8', '12', '96', '199', '3000.00', '1', null, null, null);
INSERT INTO `order_items` VALUES ('9', '13', '108', '211', '300.00', '2', null, null, null);
INSERT INTO `order_items` VALUES ('10', '14', '108', '211', '300.00', '1', null, null, null);
INSERT INTO `order_items` VALUES ('11', '15', '99', '202', '349.00', '1', null, null, null);
INSERT INTO `order_items` VALUES ('12', '16', '99', '202', '349.00', '1', null, null, null);

-- ----------------------------
-- Table structure for `password_resets`
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for `products`
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'normal',
  `category_id` bigint(20) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `on_sale` tinyint(1) NOT NULL DEFAULT '1',
  `recommend` tinyint(1) NOT NULL DEFAULT '0',
  `rating` double(8,2) NOT NULL DEFAULT '5.00',
  `sold_count` int(10) unsigned NOT NULL DEFAULT '0',
  `review_count` int(10) unsigned NOT NULL DEFAULT '0',
  `price` decimal(10,2) NOT NULL,
  `discount_num` tinyint(4) NOT NULL DEFAULT '0',
  `original_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_category_id_foreign` (`category_id`),
  KEY `products_type_index` (`type`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES ('1', 'normal', '3', '小米手机', 'product/30.jpg', '小米手机', '1', '0', '5.00', '0', '0', '1500.00', '0', '1500.00', '2020-06-18 14:43:34', '2020-06-22 16:45:38');
INSERT INTO `products` VALUES ('4', 'normal', '20', 'iphone', 'product/201506221850588_16428.jpg', '1111', '1', '0', '5.00', '0', '0', '8000.00', '0', '8000.00', '2020-06-19 17:19:23', '2020-06-22 16:45:38');
INSERT INTO `products` VALUES ('5', 'normal', '14', '联想T系列', 'product/1.jpg', '事实上', '1', '0', '5.00', '0', '0', '6000.00', '0', '6000.00', '2020-06-19 17:23:43', '2020-06-22 16:45:38');
INSERT INTO `products` VALUES ('6', 'normal', '26', 'natus', 'product/product-image-1.jpg', 'Neque nisi voluptatibus necessitatibus ut veniam.', '1', '0', '3.00', '0', '0', '638.00', '0', '638.00', '2020-06-22 09:16:24', '2020-06-22 16:45:38');
INSERT INTO `products` VALUES ('7', 'normal', '2', 'quo', 'product/product-image-2.jpg', 'Rerum est consequuntur omnis totam tenetur in ipsa.', '1', '0', '1.00', '0', '0', '2672.00', '0', '2672.00', '2020-06-22 09:16:25', '2020-06-22 16:45:38');
INSERT INTO `products` VALUES ('8', 'normal', '4', 'qui', 'product/product-image-3.jpg', 'Quia qui repellat excepturi unde temporibus.', '1', '0', '4.00', '0', '0', '3489.00', '0', '3489.00', '2020-06-22 09:16:25', '2020-06-22 16:45:38');
INSERT INTO `products` VALUES ('9', 'normal', '13', 'accusantium', 'product/product-image-4.jpg', 'Odio asperiores repellendus veritatis cumque.', '1', '0', '2.00', '0', '0', '5479.00', '0', '5479.00', '2020-06-22 09:16:25', '2020-06-22 16:45:38');
INSERT INTO `products` VALUES ('10', 'normal', '6', 'nihil', 'product/product-image-5.jpg', 'Deleniti deserunt explicabo occaecati dignissimos cumque.', '1', '0', '3.00', '0', '0', '2771.00', '0', '2771.00', '2020-06-22 09:16:25', '2020-06-22 16:45:38');
INSERT INTO `products` VALUES ('11', 'normal', '8', 'quis', 'product/product-image-6.jpg', 'Voluptatem qui neque aut voluptatibus.', '1', '0', '0.00', '0', '0', '3016.00', '0', '3016.00', '2020-06-22 09:16:25', '2020-06-22 16:45:38');
INSERT INTO `products` VALUES ('12', 'normal', '29', 'consequatur', 'product/product-image-7.jpg', 'Similique dicta natus id architecto et eum nostrum.', '1', '0', '0.00', '0', '0', '1700.00', '0', '1700.00', '2020-06-22 09:16:25', '2020-06-22 16:45:38');
INSERT INTO `products` VALUES ('13', 'normal', '5', 'quis', 'product/product-image-8.jpg', 'Alias minus et et ea molestiae quis.', '1', '0', '0.00', '0', '0', '1382.00', '0', '1382.00', '2020-06-22 09:16:25', '2020-06-22 16:45:38');
INSERT INTO `products` VALUES ('14', 'normal', '23', 'distinctio', 'product/product-image-9.jpg', 'Earum alias quo quisquam est.', '1', '0', '0.00', '0', '0', '551.00', '0', '551.00', '2020-06-22 09:16:25', '2020-06-22 16:45:38');
INSERT INTO `products` VALUES ('15', 'normal', '21', 'quibusdam', 'product/product-image-10.jpg', 'Atque nulla sit aut dolores.', '1', '0', '5.00', '0', '0', '4485.00', '0', '4485.00', '2020-06-22 09:16:25', '2020-06-22 16:45:38');
INSERT INTO `products` VALUES ('16', 'normal', '14', 'optio', 'product/product-image-11.jpg', 'Inventore minus labore possimus nostrum qui cumque.', '1', '0', '2.00', '0', '0', '626.00', '0', '626.00', '2020-06-22 09:16:25', '2020-06-22 16:45:38');
INSERT INTO `products` VALUES ('17', 'normal', '11', 'ipsum', 'product/product-image-12.jpg', 'Aliquid libero modi odit eius modi.', '1', '0', '2.00', '0', '0', '3027.00', '0', '3027.00', '2020-06-22 09:16:25', '2020-06-22 16:45:38');
INSERT INTO `products` VALUES ('18', 'normal', '13', 'aut', 'product/product-image-13.jpg', 'Et nemo et aut soluta qui.', '1', '0', '5.00', '0', '0', '2346.00', '0', '2346.00', '2020-06-22 09:16:25', '2020-06-22 16:45:38');
INSERT INTO `products` VALUES ('19', 'normal', '15', 'et', 'product/product-image-14.jpg', 'Dignissimos dolores voluptatem repellat et.', '1', '0', '0.00', '0', '0', '3779.00', '0', '3779.00', '2020-06-22 09:16:25', '2020-06-22 16:45:38');
INSERT INTO `products` VALUES ('20', 'normal', '23', 'sequi', 'product/product-image-15.jpg', 'Labore quia reprehenderit et beatae eligendi eum.', '1', '0', '4.00', '0', '0', '4191.00', '0', '4191.00', '2020-06-22 09:16:25', '2020-06-22 16:45:38');
INSERT INTO `products` VALUES ('21', 'normal', '20', 'et', 'product/product-image-16.jpg', 'Earum vero hic fuga natus.', '1', '0', '4.00', '0', '1000', '845.00', '0', '845.00', '2020-06-22 09:16:25', '2020-06-22 16:45:38');
INSERT INTO `products` VALUES ('22', 'normal', '9', 'sit', 'product/product-image-17.jpg', 'Officia voluptas quasi adipisci nihil repudiandae sunt suscipit.', '1', '0', '2.00', '100', '0', '1449.00', '0', '1449.00', '2020-06-22 09:16:25', '2020-06-22 16:45:38');
INSERT INTO `products` VALUES ('23', 'normal', '26', 'dolorem', 'product/product-image-18.jpg', 'Ut nihil quae et.', '1', '0', '2.00', '0', '0', '322.00', '0', '322.00', '2020-06-22 09:16:25', '2020-06-22 16:45:38');
INSERT INTO `products` VALUES ('24', 'normal', '30', 'ut', 'product/product-image-19.jpg', 'Possimus dolore repellendus eum dolores facere ea.', '1', '0', '3.00', '0', '0', '244.00', '0', '244.00', '2020-06-22 09:16:25', '2020-06-22 16:45:38');
INSERT INTO `products` VALUES ('25', 'normal', '30', 'et', 'product/product-image-20.jpg', 'Sit numquam quos qui est.', '1', '0', '2.00', '0', '0', '861.00', '0', '861.00', '2020-06-22 09:16:25', '2020-06-22 16:45:38');
INSERT INTO `products` VALUES ('26', 'normal', '5', 'incidunt', 'product/product-image-21.jpg', 'Modi vel dolor possimus corrupti.', '1', '0', '1.00', '0', '0', '1586.00', '0', '1586.00', '2020-06-22 09:16:25', '2020-06-22 16:45:39');
INSERT INTO `products` VALUES ('27', 'normal', '5', 'mollitia', 'product/product-image-22.jpg', 'Eveniet mollitia aliquam in odit atque assumenda.', '1', '0', '0.00', '0', '0', '6372.00', '0', '6372.00', '2020-06-22 09:16:25', '2020-06-22 16:45:39');
INSERT INTO `products` VALUES ('28', 'normal', '19', 'temporibus', 'https://cdn.learnku.com/uploads/images/201806/01/5320/2JMRaFwRpo.jpg', 'Non maxime non ipsa ut qui explicabo non.', '1', '0', '1.00', '0', '0', '541.00', '0', '541.00', '2020-06-22 09:16:25', '2020-06-22 16:45:39');
INSERT INTO `products` VALUES ('29', 'normal', '15', 'aut', 'https://cdn.learnku.com/uploads/images/201806/01/5320/1B3n0ATKrn.jpg', 'Illum beatae reiciendis ea et non repellat id nam.', '1', '0', '1.00', '0', '0', '3381.00', '0', '3381.00', '2020-06-22 09:16:25', '2020-06-22 16:45:39');
INSERT INTO `products` VALUES ('30', 'normal', '8', 'quisquam', 'https://cdn.learnku.com/uploads/images/201806/01/5320/2JMRaFwRpo.jpg', 'Architecto quo quis et praesentium voluptatum inventore.', '1', '0', '0.00', '0', '0', '3939.00', '0', '3939.00', '2020-06-22 09:16:25', '2020-06-22 16:45:39');
INSERT INTO `products` VALUES ('31', 'normal', '2', 'magnam', 'https://cdn.learnku.com/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg', 'Aliquam mollitia cumque est officiis minus.', '1', '0', '5.00', '0', '0', '5540.00', '0', '5540.00', '2020-06-22 09:16:25', '2020-06-22 16:45:39');
INSERT INTO `products` VALUES ('32', 'normal', '19', 'et', 'https://cdn.learnku.com/uploads/images/201806/01/5320/7kG1HekGK6.jpg', 'Non aliquid et nobis sed.', '1', '0', '1.00', '0', '0', '3225.00', '0', '3225.00', '2020-06-22 09:16:25', '2020-06-22 16:45:39');
INSERT INTO `products` VALUES ('33', 'normal', '16', 'a', 'https://cdn.learnku.com/uploads/images/201806/01/5320/pa7DrV43Mw.jpg', 'Earum eveniet dolore maxime quisquam soluta.', '1', '0', '2.00', '0', '0', '2218.00', '0', '2218.00', '2020-06-22 09:16:25', '2020-06-22 16:45:39');
INSERT INTO `products` VALUES ('34', 'normal', '15', 'et', 'https://cdn.learnku.com/uploads/images/201806/01/5320/82Wf2sg8gM.jpg', 'Consequatur esse consectetur quos dolorum sit debitis ut.', '1', '0', '1.00', '0', '0', '3459.00', '0', '3459.00', '2020-06-22 09:16:25', '2020-06-22 16:45:39');
INSERT INTO `products` VALUES ('35', 'normal', '21', 'vitae', 'https://cdn.learnku.com/uploads/images/201806/01/5320/82Wf2sg8gM.jpg', 'Eum commodi nobis ad et rem.', '1', '0', '2.00', '0', '0', '4497.00', '0', '4497.00', '2020-06-22 09:16:25', '2020-06-22 16:45:39');
INSERT INTO `products` VALUES ('36', 'normal', '2', 'qui', 'https://cdn.learnku.com/uploads/images/201806/01/5320/7kG1HekGK6.jpg', 'Architecto quo voluptas vel aperiam quia.', '1', '0', '2.00', '0', '0', '2935.00', '0', '2935.00', '2020-06-22 09:16:25', '2020-06-22 16:45:39');
INSERT INTO `products` VALUES ('37', 'normal', '13', 'velit', 'https://cdn.learnku.com/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg', 'Dolorem et error dolorum repudiandae maxime debitis.', '1', '0', '2.00', '0', '0', '1060.00', '0', '1060.00', '2020-06-22 09:16:25', '2020-06-22 16:45:39');
INSERT INTO `products` VALUES ('38', 'normal', '9', 'dicta', 'https://cdn.learnku.com/uploads/images/201806/01/5320/1B3n0ATKrn.jpg', 'Nihil corporis omnis necessitatibus provident porro.', '1', '0', '2.00', '0', '0', '4227.00', '0', '4227.00', '2020-06-22 09:16:25', '2020-06-22 16:45:39');
INSERT INTO `products` VALUES ('39', 'normal', '18', 'similique', 'https://cdn.learnku.com/uploads/images/201806/01/5320/2JMRaFwRpo.jpg', 'Ea hic autem autem laborum et.', '1', '0', '1.00', '0', '0', '708.00', '0', '708.00', '2020-06-22 09:16:26', '2020-06-22 16:45:39');
INSERT INTO `products` VALUES ('40', 'normal', '6', 'eum', 'https://cdn.learnku.com/uploads/images/201806/01/5320/r3BNRe4zXG.jpg', 'Necessitatibus alias natus ut vel pariatur ea.', '1', '0', '4.00', '0', '0', '308.00', '0', '308.00', '2020-06-22 09:16:26', '2020-06-22 16:45:39');
INSERT INTO `products` VALUES ('41', 'normal', '20', 'delectus', 'product/C0bVuKB2nt.jpg', 'Saepe architecto non quia debitis.', '1', '0', '5.00', '260', '0', '2650.00', '0', '2650.00', '2020-06-22 09:16:26', '2020-06-22 16:45:39');
INSERT INTO `products` VALUES ('42', 'normal', '18', 'asperiores', 'product/82Wf2sg8gM.jpg', 'Quis autem consectetur harum quo.', '1', '0', '5.00', '190', '0', '321.00', '0', '321.00', '2020-06-22 09:16:26', '2020-06-22 16:45:39');
INSERT INTO `products` VALUES ('43', 'normal', '12', 'veniam', 'https://cdn.learnku.com/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg', 'Ipsam et sint quisquam laborum sunt.', '1', '0', '4.00', '0', '0', '1392.00', '0', '1392.00', '2020-06-22 09:16:26', '2020-06-22 16:45:39');
INSERT INTO `products` VALUES ('44', 'normal', '27', 'doloribus', 'product/r3BNRe4zXG.jpg', 'Beatae aut cum incidunt adipisci tempore consequatur.', '1', '0', '4.00', '200', '0', '1381.00', '0', '1381.00', '2020-06-22 09:16:26', '2020-06-22 16:45:39');
INSERT INTO `products` VALUES ('45', 'normal', '3', 'aut', 'https://cdn.learnku.com/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg', 'Qui modi hic illo molestiae.', '1', '0', '4.00', '0', '0', '5135.00', '0', '5135.00', '2020-06-22 09:16:26', '2020-06-22 16:45:39');
INSERT INTO `products` VALUES ('46', 'normal', '22', 'necessitatibus', 'https://cdn.learnku.com/uploads/images/201806/01/5320/XrtIwzrxj7.jpg', 'Facilis sed dignissimos fugiat dolorem qui.', '1', '0', '0.00', '0', '0', '4848.00', '0', '4848.00', '2020-06-22 09:16:26', '2020-06-22 16:45:39');
INSERT INTO `products` VALUES ('47', 'normal', '5', 'qui', 'https://cdn.learnku.com/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg', 'Dicta consequatur tempore assumenda velit.', '1', '0', '4.00', '0', '0', '972.00', '0', '972.00', '2020-06-22 09:16:26', '2020-06-22 16:45:39');
INSERT INTO `products` VALUES ('48', 'normal', '19', 'ut', 'product/pa7DrV43Mw.jpg', 'Sunt libero et qui perferendis maxime odit eaque.', '1', '0', '1.00', '330', '0', '284.00', '0', '284.00', '2020-06-22 09:16:26', '2020-06-22 16:45:39');
INSERT INTO `products` VALUES ('49', 'normal', '6', 'rerum', 'https://cdn.learnku.com/uploads/images/201806/01/5320/pa7DrV43Mw.jpg', 'Libero debitis aliquid repellat aut asperiores et.', '1', '0', '5.00', '0', '0', '2744.00', '0', '2744.00', '2020-06-22 09:16:26', '2020-06-22 16:45:39');
INSERT INTO `products` VALUES ('50', 'normal', '11', 'iste', 'https://cdn.learnku.com/uploads/images/201806/01/5320/1B3n0ATKrn.jpg', 'Aliquam ut aut aut cupiditate tempora architecto sed.', '1', '0', '3.00', '0', '0', '2487.00', '0', '2487.00', '2020-06-22 09:16:26', '2020-06-22 16:45:39');
INSERT INTO `products` VALUES ('51', 'normal', '12', 'ab', 'https://cdn.learnku.com/uploads/images/201806/01/5320/7kG1HekGK6.jpg', 'Quibusdam ipsum et qui tenetur.', '1', '0', '4.00', '0', '0', '1415.00', '0', '1415.00', '2020-06-22 09:16:26', '2020-06-22 16:45:39');
INSERT INTO `products` VALUES ('52', 'normal', '5', 'sit', 'https://cdn.learnku.com/uploads/images/201806/01/5320/7kG1HekGK6.jpg', 'Excepturi aliquid officiis totam dolorem cupiditate placeat nobis.', '1', '0', '4.00', '0', '0', '1859.00', '0', '1859.00', '2020-06-22 09:16:26', '2020-06-22 16:45:39');
INSERT INTO `products` VALUES ('53', 'normal', '25', 'dolore', 'product/2JMRaFwRpo.jpg', 'Similique quam quas magnam animi soluta mollitia.', '1', '0', '4.00', '0', '0', '948.00', '0', '948.00', '2020-06-22 09:16:26', '2020-06-22 16:45:39');
INSERT INTO `products` VALUES ('54', 'normal', '18', 'sint', 'product/7kG1HekGK6.jpg', 'Incidunt quas excepturi dolores.', '1', '0', '1.00', '0', '0', '2394.00', '0', '2394.00', '2020-06-22 09:16:26', '2020-06-22 16:45:40');
INSERT INTO `products` VALUES ('55', 'normal', '14', 'ipsam', 'product/uYEHCJ1oRp.jpg', 'Est vel enim tenetur eligendi neque sunt aut.', '1', '0', '4.00', '300', '0', '891.00', '0', '891.00', '2020-06-22 09:16:26', '2020-06-22 16:45:40');
INSERT INTO `products` VALUES ('56', 'normal', '20', '无线耳机', 'product/17.jpg', '无线耳机', '1', '0', '5.00', '1', '0', '55.00', '0', '55.00', '2020-06-22 09:39:57', '2020-07-09 17:43:27');
INSERT INTO `products` VALUES ('57', 'normal', '29', '摄像头', 'product/3f214f6e91b11554d84e5233d6568b39.jpg', '111', '1', '0', '5.00', '0', '0', '120.00', '0', '120.00', '2020-06-22 10:24:38', '2020-06-22 16:36:50');
INSERT INTO `products` VALUES ('58', 'normal', '29', '111', 'product/c47b74971475897c51fc086571f92b00.jpg', '1111', '1', '0', '5.00', '0', '0', '6000.00', '0', '6000.00', '2020-06-22 16:25:31', '2020-06-22 16:36:05');
INSERT INTO `products` VALUES ('59', 'normal', '2', '1111', 'product/67fa71f36cb665136462a6bbe1b589dc.jpg', '是是是', '1', '0', '5.00', '0', '0', '100.00', '0', '100.00', '2020-06-23 10:03:45', '2020-06-23 10:04:22');
INSERT INTO `products` VALUES ('60', 'crowdfunding', '2', '划船器', 'product/638dfb7de2d6ef40b83f72ca84686a49.jpg', '11111', '1', '0', '5.00', '0', '0', '10000.00', '0', '10000.00', '2020-06-23 10:06:19', '2020-06-23 10:06:19');
INSERT INTO `products` VALUES ('61', 'normal', '2', '12222', 'product/8.jpg', '是是是', '1', '0', '5.00', '0', '0', '5000.00', '0', '5000.00', '2020-06-23 10:45:22', '2020-06-23 10:45:22');
INSERT INTO `products` VALUES ('62', 'normal', '2', '普通商品', 'product/27.jpg', '普通商品', '1', '0', '5.00', '0', '0', '100.00', '0', '100.00', '2020-06-23 10:53:36', '2020-06-23 10:53:36');
INSERT INTO `products` VALUES ('63', 'crowdfunding', '29', '摄像头', 'product/3.jpg', '摄像头', '1', '0', '5.00', '0', '0', '500.00', '0', '500.00', '2020-06-23 10:55:54', '2020-06-23 10:55:54');
INSERT INTO `products` VALUES ('64', 'seckill', '2', '秒杀商品', 'product/15.jpg', '秒杀商品', '1', '0', '5.00', '0', '0', '90.00', '10', '100.00', '2020-06-23 11:12:58', '2020-06-23 11:12:58');
INSERT INTO `products` VALUES ('65', 'discount', '2', '折扣商品', 'product/16.jpg', '试试', '1', '0', '5.00', '0', '0', '100.00', '50', '200.00', '2020-06-23 15:10:35', '2020-06-23 15:10:35');
INSERT INTO `products` VALUES ('66', 'discount', '2', '测试', 'product/3eabf870ac6a4396dcf677871589c1e5.jpg', '1111', '1', '0', '5.00', '0', '0', '80.00', '80', '100.00', '2020-06-23 15:22:48', '2020-06-23 15:59:03');
INSERT INTO `products` VALUES ('67', 'discount', '2', '折扣袜子', 'product/5.jpg', '折扣', '1', '0', '5.00', '0', '0', '50.00', '50', '100.00', '2020-06-23 16:00:38', '2020-06-23 16:02:25');
INSERT INTO `products` VALUES ('68', 'discount', '2', '折扣手套', 'product/7.jpg', '1111', '1', '0', '5.00', '0', '0', '30.00', '37', '80.00', '2020-06-23 16:03:26', '2020-06-23 16:04:30');
INSERT INTO `products` VALUES ('69', 'discount', '2', '折扣帽子', 'product/22.jpg', '11111', '1', '0', '5.00', '0', '0', '80.00', '80', '100.00', '2020-06-23 16:05:26', '2020-06-23 16:05:26');
INSERT INTO `products` VALUES ('70', 'normal', '2', '普通物品', 'product/75b9fe4d934ecb3e6f7bfa5a5a7ebbf9.jpg', '12212', '1', '0', '5.00', '0', '0', '100.00', '0', '100.00', '2020-06-23 16:06:34', '2020-06-23 16:06:34');
INSERT INTO `products` VALUES ('71', 'crowdfunding', '2', 'lv包', 'product/28.jpg', '11111', '1', '0', '5.00', '0', '0', '6000.00', '0', '6000.00', '2020-06-23 16:08:22', '2020-06-23 16:08:22');
INSERT INTO `products` VALUES ('72', 'seckill', '2', '短裤', 'product/4.jpg', '11111', '1', '0', '5.00', '0', '0', '90.00', '10', '100.00', '2020-06-23 16:09:55', '2020-06-23 16:09:55');
INSERT INTO `products` VALUES ('74', 'active', '25', '小米10', 'product/da0b7efc88fca4e78340f44926a0e07e.jpg', '骁龙865处理器 / 1亿像素8K电影相机 / 双模5G / 新一代LPDDR5内存 / 对称式立体声 / 90Hz刷新率+180Hz采样率 / UFS 3.0高速存储 / 全面适配Wi-Fi 6 / 超强VC液冷散热 / 30W极速闪充+30W无线闪充+10W无线反充 / 4780mAh大电量 / 多功能NFC', '1', '0', '5.00', '0', '0', '3900.00', '92', '4200.00', '2020-06-24 15:51:51', '2020-06-24 15:51:51');
INSERT INTO `products` VALUES ('75', 'active', '37', 'EOS 90D', 'product/3357ae8d4a39bebaaa7b350cbcd53715.jpg', 'EOS 90D 机身\r\n全像素双核CMOS AF 10张/秒的高速连拍定格精彩瞬间', '1', '0', '5.00', '0', '0', '7500.00', '93', '8000.00', '2020-06-24 15:57:54', '2020-06-24 15:57:54');
INSERT INTO `products` VALUES ('76', 'active', '35', 'Apple Watch', 'product/f32973bc65f9b8f5c1a2fc24c3705d1a.jpg', '111', '1', '0', '4.00', '0', '0', '3000.00', '93', '3200.00', '2020-06-24 16:05:05', '2020-06-24 16:05:05');
INSERT INTO `products` VALUES ('77', 'active', '39', '索尼游戏机', 'product/60af9f7a0cf440c467f9201aeb1f1dbd.png', '新款PS4较以往型号更加小型轻量，同时大幅降低电力消耗。设计利落简约，带有圆弧感的边角让整体印象更加柔和。', '1', '0', '5.00', '0', '0', '5000.00', '83', '6000.00', '2020-06-24 16:10:37', '2020-06-24 16:10:37');
INSERT INTO `products` VALUES ('78', 'active', '18', '微软 Surface Book 3', 'product/1d39ce0de547636f83debd61f2685fd4.png', '微软 Surface Book 3', '1', '0', '5.00', '0', '0', '12000.00', '85', '14000.00', '2020-06-24 16:20:04', '2020-06-24 16:20:04');
INSERT INTO `products` VALUES ('79', 'normal', '33', '纽曼DL-88', 'product/b85f14df06e0bfe00696875287a3d865.jpg', '电源类型：AC 5V 3.7V锂电池', '1', '1', '4.00', '1', '1', '350.00', '0', '350.00', '2020-06-24 17:22:41', '2020-07-10 16:32:54');
INSERT INTO `products` VALUES ('80', 'normal', '20', '华为MatePad Pro 5G', 'product/2caa3a28216de08d72feb669afcbd3a1.jpg', '华为MatePad Pro 5G', '1', '1', '5.00', '0', '0', '5000.00', '0', '5000.00', '2020-06-24 17:27:18', '2020-06-24 17:27:18');
INSERT INTO `products` VALUES ('81', 'normal', '9', '耳机FreeBuds 3', 'product/b02a3558a934da941c8ec3a05659d453.gif', '11', '1', '1', '5.00', '0', '0', '1000.00', '0', '1000.00', '2020-06-25 08:06:22', '2020-06-25 08:06:22');
INSERT INTO `products` VALUES ('82', 'normal', '11', '三星U32J590UQC', 'product/9e7b4c8a8dd0670d602b788c57f5fb3d.jpg', '1111', '1', '1', '5.00', '0', '0', '2800.00', '0', '2800.00', '2020-06-25 08:12:40', '2020-06-25 08:12:40');
INSERT INTO `products` VALUES ('83', 'normal', '19', '联想 GeekPro', 'product/d50d9a242a3ce624fa5962eefca74bc4.jpg', '111', '1', '1', '5.00', '0', '0', '12500.00', '0', '12500.00', '2020-06-25 08:16:56', '2020-06-25 08:16:56');
INSERT INTO `products` VALUES ('84', 'normal', '22', '浪潮英信NF5280M5', 'product/f4d2d8045c828bff81a00b083ea7f74f.jpg', '111', '1', '1', '5.00', '0', '0', '22000.00', '0', '22000.00', '2020-06-25 08:22:14', '2020-06-25 08:22:14');
INSERT INTO `products` VALUES ('85', 'normal', '41', '索尼A8F', 'product/ec54afba17c856077713820afdf4211e.jpg', '111', '1', '0', '5.00', '0', '900', '5000.00', '0', '5000.00', '2020-06-25 11:05:34', '2020-06-25 11:05:34');
INSERT INTO `products` VALUES ('86', 'normal', '43', '格力GMV-H200WL/A', 'product/a65f2610519beb01025f275cfbc9a106.jpg', '1111111111', '1', '0', '5.00', '0', '850', '50000.00', '0', '50000.00', '2020-06-25 11:09:27', '2020-06-25 11:09:27');
INSERT INTO `products` VALUES ('87', 'normal', '29', '海康威视DS-2DC4223IW-D', 'product/9be58bde07e42c997e17e43e7368cbd1.jpg', '是是是', '1', '0', '5.00', '0', '600', '1400.00', '0', '1400.00', '2020-06-25 11:12:33', '2020-06-25 11:12:33');
INSERT INTO `products` VALUES ('88', 'normal', '44', '三星Galaxy Watch（蓝牙通话/46mm）', 'product/b23ca3a86950e70a0feec1e88dda53f1.jpg', '111', '1', '0', '5.00', '0', '700', '3000.00', '0', '3000.00', '2020-06-25 11:16:24', '2020-06-25 11:16:24');
INSERT INTO `products` VALUES ('89', 'normal', '46', '扫地狗S007s', 'product/2ff5f65d576888411ae46dee19591642.jpg', '遥控', '1', '0', '5.00', '0', '380', '3000.00', '0', '3000.00', '2020-06-25 11:21:01', '2020-06-25 11:21:01');
INSERT INTO `products` VALUES ('90', 'normal', '25', '华为Mate30', 'product/7a4ae65fa90eb3734f1e1e8da23f8160.jpg', '111', '1', '0', '5.00', '0', '0', '3000.00', '0', '3000.00', '2020-06-25 12:21:00', '2020-06-25 12:21:00');
INSERT INTO `products` VALUES ('91', 'normal', '25', '三星Galaxy S20', 'product/569528ab4848b43b20957bf747c78288.jpg', '试试', '1', '0', '5.00', '0', '0', '3000.00', '0', '3000.00', '2020-06-25 12:25:06', '2020-06-25 12:25:06');
INSERT INTO `products` VALUES ('92', 'normal', '25', 'OPPO Reno4', 'product/f8ae0054317b97d19d81255e52a90d48.jpg', '是', '1', '0', '5.00', '0', '0', '3000.00', '0', '3000.00', '2020-06-25 12:27:35', '2020-06-25 12:27:35');
INSERT INTO `products` VALUES ('93', 'normal', '47', '小米手表Color', 'product/f24036a651f8fca471410071bd1b067a.jpg', '111111', '1', '0', '5.00', '0', '0', '800.00', '0', '800.00', '2020-06-25 12:32:56', '2020-06-25 12:32:56');
INSERT INTO `products` VALUES ('94', 'normal', '48', 'HUAWEI WATCH 2 Pro', 'product/0961a42f2d3d25bd33f16866a2ab4652.jpg', '1111', '1', '0', '5.00', '0', '0', '3000.00', '0', '3000.00', '2020-06-25 12:37:44', '2020-06-25 12:37:44');
INSERT INTO `products` VALUES ('95', 'normal', '48', 'HUAWEI 儿童手表3 Pro', 'product/2ef01ae17191410b036b95751e19db00.jpg', '1111', '1', '0', '5.00', '0', '0', '800.00', '0', '800.00', '2020-06-25 12:41:32', '2020-06-25 12:41:32');
INSERT INTO `products` VALUES ('96', 'normal', '44', '三星Gear S3', 'product/02fcec6cc7f5f86fc96cb0804a0d8bca.jpg', '扫地', '1', '0', '5.00', '0', '0', '3000.00', '0', '3000.00', '2020-06-25 12:48:25', '2020-06-25 12:48:25');
INSERT INTO `products` VALUES ('97', 'normal', '25', '苹果iphone-x', 'product/183bf648f1733a66019569c6f410ccb8.jpg', '是', '1', '0', '5.00', '0', '0', '8000.00', '0', '8000.00', '2020-06-25 12:53:50', '2020-06-25 12:53:50');
INSERT INTO `products` VALUES ('98', 'normal', '49', '佳明Fenix6X Pro', 'product/a30c293f7deddaffa69f38688927b429.jpg', '啊', '1', '1', '5.00', '0', '0', '8000.00', '0', '8000.00', '2020-06-25 14:13:51', '2020-08-06 14:59:23');
INSERT INTO `products` VALUES ('99', 'seckill', '8', '联想拯救者游戏电竞耳机耳麦Pro Y660', 'product/ba64e830102d0c8b0d034e3882f546c3.jpg', '111', '1', '0', '5.00', '0', '0', '349.00', '49', '699.00', '2020-06-25 17:53:40', '2020-06-25 17:53:40');
INSERT INTO `products` VALUES ('100', 'seckill', '50', '联想马卡龙无线蓝牙双模一键服务鼠标M23', 'product/99058f72bef7630b30ad06f1eaa236be.jpg', '111', '1', '0', '5.00', '0', '0', '89.00', '49', '179.00', '2020-06-25 17:59:16', '2020-06-25 17:59:16');
INSERT INTO `products` VALUES ('101', 'seckill', '18', '小新Air14 2020锐龙版14.0英寸', 'product/7448be50eaf5444e2a3451d19b020a1f.jpg', '小新Air14 2020锐龙版14.0英寸全面屏高性能金属轻薄笔记本深空灰', '1', '0', '5.00', '0', '0', '4000.00', '80', '5000.00', '2020-06-25 18:03:08', '2020-06-25 18:03:08');
INSERT INTO `products` VALUES ('102', 'seckill', '18', 'ThinkPad S2 2020英特尔酷睿', 'product/515a51f6a59c47cda14a970c78a1d476.jpg', 'ThinkPad S2 2020英特尔酷睿i5笔记本电脑 银色 20R7A00FCD', '1', '0', '5.00', '0', '0', '3000.00', '50', '6000.00', '2020-06-25 18:06:43', '2020-06-25 18:06:43');
INSERT INTO `products` VALUES ('103', 'seckill', '20', '联想平板M8 8英寸 4G+64G WiFi版 杜比全景声 网课平板', 'product/d7add33344af45c24f4bdfdf275a74d2.jpg', '山东', '1', '0', '5.00', '0', '0', '2000.00', '125', '1600.00', '2020-06-25 18:09:56', '2020-06-25 18:09:56');
INSERT INTO `products` VALUES ('104', 'seckill', '16', '联想个人云存储T1 8TB 双盘版', 'product/d16a89254f148aa6123086969815761b.jpg', '试试', '1', '0', '5.00', '0', '0', '600.00', '75', '800.00', '2020-06-25 18:15:06', '2020-06-25 18:15:06');
INSERT INTO `products` VALUES ('105', 'seckill', '46', '联想智能扫地机器人A1', 'product/0da607a57c37dfc83914bff6935f2c58.jpg', '11212', '1', '0', '5.00', '0', '0', '1500.00', '50', '3000.00', '2020-06-25 18:19:14', '2020-06-25 18:19:14');
INSERT INTO `products` VALUES ('106', 'seckill', '6', 'Lenovo 170W 方口便携式电源适配器', 'product/1d239b16a87c0e6a2ef96ea7a40cd562.jpg', 'Lenovo 170W 方口便携式电源适配器', '1', '0', '5.00', '0', '0', '300.00', '50', '600.00', '2020-06-25 18:54:30', '2020-06-25 18:54:30');
INSERT INTO `products` VALUES ('107', 'seckill', '18', 'MIIX 520 二合一笔记本', 'product/853423249cb62192944a79f5168af2d0.jpg', '12121', '1', '0', '5.00', '0', '0', '7000.00', '70', '10000.00', '2020-06-25 18:58:02', '2020-06-25 18:58:02');
INSERT INTO `products` VALUES ('108', 'crowdfunding', '46', '乐迪早教机器人', 'product/eb090a179c33c40091dfddebbcf903db.jpg', '11111', '1', '0', '5.00', '3', '0', '300.00', '0', '300.00', '2020-06-25 19:17:42', '2020-07-14 17:09:33');
INSERT INTO `products` VALUES ('109', 'discount', '25', 'OPPO Reno4 Pro', 'product/eae6381875d257c93d3241ba39e0a00e.jpg', '11111', '1', '1', '5.00', '0', '0', '1500.00', '75', '2000.00', '2020-07-13 11:01:01', '2020-07-13 11:01:01');
INSERT INTO `products` VALUES ('110', 'discount', '25', 'vivo X50 Pro', 'product/189bdaf80e08d40a19578bd0edc69864.jpg', '事实上', '1', '0', '5.00', '0', '0', '3000.00', '60', '5000.00', '2020-07-13 11:02:34', '2020-07-13 11:02:34');
INSERT INTO `products` VALUES ('111', 'discount', '25', '三星Galaxy S20+', 'product/cdd3104f45faedef3a89cc086cfc4b5c.jpg', '三星Galaxy S20+（12GB/128GB/全网通/BTS限量版）', '1', '0', '5.00', '0', '0', '5000.00', '83', '6000.00', '2020-07-13 11:04:09', '2020-07-13 11:04:09');
INSERT INTO `products` VALUES ('112', 'discount', '25', '荣耀X10 Max', 'product/66e76d5742d692856ed9da54883da893.jpg', '荣耀X10 Max（6GB/128GB/全网通/5G版', '1', '0', '5.00', '0', '0', '3000.00', '75', '4000.00', '2020-07-13 11:05:42', '2020-07-13 11:05:42');
INSERT INTO `products` VALUES ('113', 'normal', '25', '苹果iPhone 11', 'product/416d73fca2ba3dc628676fea5c76b22a.jpg', '试试11', '1', '1', '5.00', '0', '0', '5000.00', '0', '5000.00', '2020-08-05 10:22:09', '2020-08-06 14:47:39');
INSERT INTO `products` VALUES ('114', 'crowdfunding', '41', '小米电视大师 65英寸', 'product/0bee5c723b6cbcf91f1d180aff718e8b.jpg', '10.7亿原色显示，98.5%DCI-P3广色域，120Hz流速屏，AI大师引擎，3D全景声，音响系统', '1', '1', '5.00', '0', '0', '13000.00', '0', '13000.00', '2020-08-06 09:06:55', '2020-08-06 09:06:55');
INSERT INTO `products` VALUES ('118', 'seckill', '18', '苹果新款MacBook Pro 13英寸', 'product/144d7840df85c40eefc1067877a7f090.jpg', '第八代英特尔酷睿i5，触控ID，触控栏，视网膜显示屏', '1', '1', '5.00', '0', '0', '10000.00', '0', '12000.00', '2020-08-06 11:12:59', '2020-08-06 11:24:14');
INSERT INTO `products` VALUES ('121', 'discount', '25', '小米10', 'product/00aa60d90281624184e097b72521f37d.jpg', '骁龙865，一亿像素，8K电影相机', '1', '1', '5.00', '0', '0', '3600.00', '90', '4000.00', '2020-08-06 15:46:31', '2020-08-07 16:39:54');

-- ----------------------------
-- Table structure for `product_pics`
-- ----------------------------
DROP TABLE IF EXISTS `product_pics`;
CREATE TABLE `product_pics` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `product_pics_product_id_foreign` (`product_id`),
  CONSTRAINT `product_pics_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=273 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of product_pics
-- ----------------------------
INSERT INTO `product_pics` VALUES ('1', '1', 'product/mm.jpg', '111');
INSERT INTO `product_pics` VALUES ('2', '1', 'product/ff4d147fda13809ff6fa6113a1ffc5c0.jpg', '3333');
INSERT INTO `product_pics` VALUES ('4', '4', 'product/腰枕.jpg', '22');
INSERT INTO `product_pics` VALUES ('5', '5', 'product/29.jpg', '111');
INSERT INTO `product_pics` VALUES ('6', '5', 'product/5b8c6416ad5f3aa8e9fefc5334008b5d.jpg', '22222');
INSERT INTO `product_pics` VALUES ('7', '56', 'product/8.jpg', '9999');
INSERT INTO `product_pics` VALUES ('8', '57', 'product/e9e71c9009af0fd6f94b36748cf8338b.jpg', '111');
INSERT INTO `product_pics` VALUES ('9', '6', 'product/product-image-1-big.jpg', '1');
INSERT INTO `product_pics` VALUES ('10', '7', 'product/product-image-2-big.jpg', '3');
INSERT INTO `product_pics` VALUES ('11', '8', 'product/product-image-3-big.jpg', '2');
INSERT INTO `product_pics` VALUES ('12', '9', 'product/product-image-4-big.jpg', '4');
INSERT INTO `product_pics` VALUES ('13', '7', 'https://cdn.learnku.com/uploads/images/201806/01/5320/r3BNRe4zXG.jpg', 'Vel perspiciatis id voluptatem est.');
INSERT INTO `product_pics` VALUES ('14', '7', 'https://cdn.learnku.com/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg', 'Neque veniam quia laudantium voluptate aut.');
INSERT INTO `product_pics` VALUES ('15', '7', 'https://cdn.learnku.com/uploads/images/201806/01/5320/r3BNRe4zXG.jpg', 'Non iste sequi a ut est quasi eos.');
INSERT INTO `product_pics` VALUES ('16', '8', 'https://cdn.learnku.com/uploads/images/201806/01/5320/82Wf2sg8gM.jpg', 'Natus corporis atque magnam rerum.');
INSERT INTO `product_pics` VALUES ('17', '8', 'https://cdn.learnku.com/uploads/images/201806/01/5320/C0bVuKB2nt.jpg', 'Et deserunt nesciunt tenetur quam.');
INSERT INTO `product_pics` VALUES ('18', '8', 'https://cdn.learnku.com/uploads/images/201806/01/5320/r3BNRe4zXG.jpg', 'Suscipit quae et odit est sed distinctio hic.');
INSERT INTO `product_pics` VALUES ('19', '9', 'https://cdn.learnku.com/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg', 'Necessitatibus architecto quod vel omnis laudantium.');
INSERT INTO `product_pics` VALUES ('20', '9', 'https://cdn.learnku.com/uploads/images/201806/01/5320/C0bVuKB2nt.jpg', 'Quia quidem labore est unde vel reprehenderit.');
INSERT INTO `product_pics` VALUES ('21', '9', 'https://cdn.learnku.com/uploads/images/201806/01/5320/r3BNRe4zXG.jpg', 'Libero non quidem quod laborum.');
INSERT INTO `product_pics` VALUES ('22', '10', 'https://cdn.learnku.com/uploads/images/201806/01/5320/7kG1HekGK6.jpg', 'Explicabo ratione ea provident ipsum modi incidunt et.');
INSERT INTO `product_pics` VALUES ('23', '10', 'https://cdn.learnku.com/uploads/images/201806/01/5320/r3BNRe4zXG.jpg', 'Veritatis reprehenderit facere rerum quidem.');
INSERT INTO `product_pics` VALUES ('24', '10', 'https://cdn.learnku.com/uploads/images/201806/01/5320/82Wf2sg8gM.jpg', 'Eius rerum ratione dolores at suscipit quos possimus sed.');
INSERT INTO `product_pics` VALUES ('25', '11', 'https://cdn.learnku.com/uploads/images/201806/01/5320/1B3n0ATKrn.jpg', 'Pariatur quo qui inventore id.');
INSERT INTO `product_pics` VALUES ('26', '11', 'https://cdn.learnku.com/uploads/images/201806/01/5320/82Wf2sg8gM.jpg', 'Ut atque et enim necessitatibus et ut sunt molestias.');
INSERT INTO `product_pics` VALUES ('27', '11', 'https://cdn.learnku.com/uploads/images/201806/01/5320/C0bVuKB2nt.jpg', 'Ab laudantium esse impedit.');
INSERT INTO `product_pics` VALUES ('28', '12', 'https://cdn.learnku.com/uploads/images/201806/01/5320/7kG1HekGK6.jpg', 'Voluptatem expedita autem similique ipsam expedita doloribus.');
INSERT INTO `product_pics` VALUES ('29', '12', 'https://cdn.learnku.com/uploads/images/201806/01/5320/1B3n0ATKrn.jpg', 'Eos commodi occaecati sapiente et inventore.');
INSERT INTO `product_pics` VALUES ('30', '12', 'https://cdn.learnku.com/uploads/images/201806/01/5320/7kG1HekGK6.jpg', 'Natus perferendis sequi quidem qui.');
INSERT INTO `product_pics` VALUES ('31', '13', 'https://cdn.learnku.com/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg', 'Cum impedit similique eligendi sed tenetur fugiat repellat est.');
INSERT INTO `product_pics` VALUES ('32', '13', 'https://cdn.learnku.com/uploads/images/201806/01/5320/C0bVuKB2nt.jpg', 'Et provident amet praesentium quo sed.');
INSERT INTO `product_pics` VALUES ('33', '13', 'https://cdn.learnku.com/uploads/images/201806/01/5320/1B3n0ATKrn.jpg', 'Et iste itaque accusamus.');
INSERT INTO `product_pics` VALUES ('34', '14', 'https://cdn.learnku.com/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg', 'Culpa ut aut blanditiis quasi iusto animi.');
INSERT INTO `product_pics` VALUES ('35', '14', 'https://cdn.learnku.com/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg', 'Dolores excepturi harum est est commodi porro.');
INSERT INTO `product_pics` VALUES ('36', '14', 'https://cdn.learnku.com/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg', 'Culpa placeat ipsam rerum molestias explicabo.');
INSERT INTO `product_pics` VALUES ('37', '15', 'https://cdn.learnku.com/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg', 'Reprehenderit commodi provident qui occaecati praesentium qui perferendis.');
INSERT INTO `product_pics` VALUES ('38', '15', 'https://cdn.learnku.com/uploads/images/201806/01/5320/82Wf2sg8gM.jpg', 'Error eligendi quia velit culpa.');
INSERT INTO `product_pics` VALUES ('39', '15', 'https://cdn.learnku.com/uploads/images/201806/01/5320/82Wf2sg8gM.jpg', 'In vel consequuntur dignissimos in enim libero eveniet.');
INSERT INTO `product_pics` VALUES ('40', '16', 'https://cdn.learnku.com/uploads/images/201806/01/5320/C0bVuKB2nt.jpg', 'Tempore dolorem impedit quasi corrupti eos.');
INSERT INTO `product_pics` VALUES ('41', '16', 'https://cdn.learnku.com/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg', 'A inventore provident cumque et beatae aut.');
INSERT INTO `product_pics` VALUES ('42', '16', 'https://cdn.learnku.com/uploads/images/201806/01/5320/r3BNRe4zXG.jpg', 'In deserunt quam consequatur et ad hic quidem.');
INSERT INTO `product_pics` VALUES ('43', '17', 'https://cdn.learnku.com/uploads/images/201806/01/5320/7kG1HekGK6.jpg', 'Velit magnam officiis veritatis voluptatem ducimus sed.');
INSERT INTO `product_pics` VALUES ('44', '17', 'https://cdn.learnku.com/uploads/images/201806/01/5320/C0bVuKB2nt.jpg', 'Quibusdam aut consequatur sequi necessitatibus ipsa nulla tempore.');
INSERT INTO `product_pics` VALUES ('45', '17', 'https://cdn.learnku.com/uploads/images/201806/01/5320/7kG1HekGK6.jpg', 'Fuga dolore est perferendis itaque.');
INSERT INTO `product_pics` VALUES ('46', '18', 'https://cdn.learnku.com/uploads/images/201806/01/5320/1B3n0ATKrn.jpg', 'At labore in quia.');
INSERT INTO `product_pics` VALUES ('47', '18', 'https://cdn.learnku.com/uploads/images/201806/01/5320/r3BNRe4zXG.jpg', 'A aperiam tempore accusamus molestiae est.');
INSERT INTO `product_pics` VALUES ('48', '18', 'https://cdn.learnku.com/uploads/images/201806/01/5320/C0bVuKB2nt.jpg', 'Temporibus natus veritatis dicta voluptatem aut nemo officia.');
INSERT INTO `product_pics` VALUES ('49', '19', 'https://cdn.learnku.com/uploads/images/201806/01/5320/1B3n0ATKrn.jpg', 'Beatae illo ullam nemo.');
INSERT INTO `product_pics` VALUES ('50', '19', 'https://cdn.learnku.com/uploads/images/201806/01/5320/C0bVuKB2nt.jpg', 'Esse doloremque aperiam tempora iure.');
INSERT INTO `product_pics` VALUES ('51', '19', 'https://cdn.learnku.com/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg', 'Et numquam qui reprehenderit quaerat et quo sed.');
INSERT INTO `product_pics` VALUES ('52', '20', 'https://cdn.learnku.com/uploads/images/201806/01/5320/1B3n0ATKrn.jpg', 'Est amet ut vel minus.');
INSERT INTO `product_pics` VALUES ('53', '20', 'https://cdn.learnku.com/uploads/images/201806/01/5320/82Wf2sg8gM.jpg', 'Sunt unde quod laboriosam a.');
INSERT INTO `product_pics` VALUES ('54', '20', 'https://cdn.learnku.com/uploads/images/201806/01/5320/1B3n0ATKrn.jpg', 'Eaque non dolorem minima eum qui voluptatem.');
INSERT INTO `product_pics` VALUES ('55', '21', 'https://cdn.learnku.com/uploads/images/201806/01/5320/7kG1HekGK6.jpg', 'Dolores molestiae odit quas rem.');
INSERT INTO `product_pics` VALUES ('56', '21', 'https://cdn.learnku.com/uploads/images/201806/01/5320/r3BNRe4zXG.jpg', 'Cumque iusto eum sit.');
INSERT INTO `product_pics` VALUES ('57', '21', 'https://cdn.learnku.com/uploads/images/201806/01/5320/7kG1HekGK6.jpg', 'Ducimus minima rerum nihil natus praesentium.');
INSERT INTO `product_pics` VALUES ('58', '22', 'https://cdn.learnku.com/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg', 'Sequi enim harum nulla eum veniam.');
INSERT INTO `product_pics` VALUES ('59', '22', 'https://cdn.learnku.com/uploads/images/201806/01/5320/82Wf2sg8gM.jpg', 'Voluptatum eius aspernatur magni sed pariatur quis.');
INSERT INTO `product_pics` VALUES ('60', '22', 'https://cdn.learnku.com/uploads/images/201806/01/5320/82Wf2sg8gM.jpg', 'Eligendi dolores nihil dolorem itaque sunt non.');
INSERT INTO `product_pics` VALUES ('61', '23', 'https://cdn.learnku.com/uploads/images/201806/01/5320/r3BNRe4zXG.jpg', 'Quia omnis enim minus ratione fugiat.');
INSERT INTO `product_pics` VALUES ('62', '23', 'https://cdn.learnku.com/uploads/images/201806/01/5320/7kG1HekGK6.jpg', 'Quae officiis et porro recusandae.');
INSERT INTO `product_pics` VALUES ('63', '23', 'https://cdn.learnku.com/uploads/images/201806/01/5320/1B3n0ATKrn.jpg', 'Consequuntur ut illum provident eos.');
INSERT INTO `product_pics` VALUES ('64', '24', 'https://cdn.learnku.com/uploads/images/201806/01/5320/r3BNRe4zXG.jpg', 'Nostrum culpa est eligendi omnis recusandae.');
INSERT INTO `product_pics` VALUES ('65', '24', 'https://cdn.learnku.com/uploads/images/201806/01/5320/C0bVuKB2nt.jpg', 'Ducimus corporis aut aliquam et enim voluptatum et.');
INSERT INTO `product_pics` VALUES ('66', '24', 'https://cdn.learnku.com/uploads/images/201806/01/5320/C0bVuKB2nt.jpg', 'Vel voluptatem et aliquid aut.');
INSERT INTO `product_pics` VALUES ('67', '25', 'https://cdn.learnku.com/uploads/images/201806/01/5320/82Wf2sg8gM.jpg', 'Unde minus aut eaque deleniti corrupti culpa repellendus.');
INSERT INTO `product_pics` VALUES ('68', '25', 'https://cdn.learnku.com/uploads/images/201806/01/5320/r3BNRe4zXG.jpg', 'Quis iusto ratione voluptates facere nisi.');
INSERT INTO `product_pics` VALUES ('69', '25', 'https://cdn.learnku.com/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg', 'Ut repellat qui commodi non quas dolor.');
INSERT INTO `product_pics` VALUES ('70', '26', 'https://cdn.learnku.com/uploads/images/201806/01/5320/C0bVuKB2nt.jpg', 'Quaerat autem reprehenderit itaque sequi.');
INSERT INTO `product_pics` VALUES ('71', '26', 'https://cdn.learnku.com/uploads/images/201806/01/5320/1B3n0ATKrn.jpg', 'Blanditiis rem saepe est sit.');
INSERT INTO `product_pics` VALUES ('72', '26', 'https://cdn.learnku.com/uploads/images/201806/01/5320/1B3n0ATKrn.jpg', 'Vero eos fugit voluptas suscipit sed quisquam.');
INSERT INTO `product_pics` VALUES ('73', '27', 'https://cdn.learnku.com/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg', 'Suscipit dolor dolor itaque voluptatem ipsa dignissimos incidunt.');
INSERT INTO `product_pics` VALUES ('74', '27', 'https://cdn.learnku.com/uploads/images/201806/01/5320/r3BNRe4zXG.jpg', 'Tempora voluptatum est esse sit minus.');
INSERT INTO `product_pics` VALUES ('75', '27', 'https://cdn.learnku.com/uploads/images/201806/01/5320/r3BNRe4zXG.jpg', 'Enim similique corporis delectus in soluta.');
INSERT INTO `product_pics` VALUES ('76', '28', 'https://cdn.learnku.com/uploads/images/201806/01/5320/82Wf2sg8gM.jpg', 'Enim earum sint minus nobis quam vel et libero.');
INSERT INTO `product_pics` VALUES ('77', '28', 'https://cdn.learnku.com/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg', 'Tempora sit nihil sed eum.');
INSERT INTO `product_pics` VALUES ('78', '28', 'https://cdn.learnku.com/uploads/images/201806/01/5320/82Wf2sg8gM.jpg', 'Excepturi atque voluptas et neque sed odit qui.');
INSERT INTO `product_pics` VALUES ('79', '29', 'https://cdn.learnku.com/uploads/images/201806/01/5320/r3BNRe4zXG.jpg', 'Consequatur consequuntur in repellat enim.');
INSERT INTO `product_pics` VALUES ('80', '29', 'https://cdn.learnku.com/uploads/images/201806/01/5320/82Wf2sg8gM.jpg', 'Sint repellat aut ea optio voluptatem totam.');
INSERT INTO `product_pics` VALUES ('81', '29', 'https://cdn.learnku.com/uploads/images/201806/01/5320/1B3n0ATKrn.jpg', 'Quas dolor ut ea fugiat et autem.');
INSERT INTO `product_pics` VALUES ('82', '30', 'https://cdn.learnku.com/uploads/images/201806/01/5320/C0bVuKB2nt.jpg', 'Officiis expedita et error eum.');
INSERT INTO `product_pics` VALUES ('83', '30', 'https://cdn.learnku.com/uploads/images/201806/01/5320/C0bVuKB2nt.jpg', 'Ea quis illum nostrum.');
INSERT INTO `product_pics` VALUES ('84', '30', 'https://cdn.learnku.com/uploads/images/201806/01/5320/1B3n0ATKrn.jpg', 'Error amet aut labore quis.');
INSERT INTO `product_pics` VALUES ('85', '31', 'https://cdn.learnku.com/uploads/images/201806/01/5320/1B3n0ATKrn.jpg', 'Voluptatum sint deserunt iste.');
INSERT INTO `product_pics` VALUES ('86', '31', 'https://cdn.learnku.com/uploads/images/201806/01/5320/r3BNRe4zXG.jpg', 'Et aut mollitia qui impedit.');
INSERT INTO `product_pics` VALUES ('87', '31', 'https://cdn.learnku.com/uploads/images/201806/01/5320/7kG1HekGK6.jpg', 'Rerum harum veniam ad labore.');
INSERT INTO `product_pics` VALUES ('88', '32', 'https://cdn.learnku.com/uploads/images/201806/01/5320/82Wf2sg8gM.jpg', 'Consequatur dolorem deleniti nostrum doloremque beatae.');
INSERT INTO `product_pics` VALUES ('89', '32', 'https://cdn.learnku.com/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg', 'Fugiat est voluptas saepe in sequi.');
INSERT INTO `product_pics` VALUES ('90', '32', 'https://cdn.learnku.com/uploads/images/201806/01/5320/C0bVuKB2nt.jpg', 'Et magni facere laudantium enim.');
INSERT INTO `product_pics` VALUES ('91', '33', 'https://cdn.learnku.com/uploads/images/201806/01/5320/7kG1HekGK6.jpg', 'Est magni sapiente accusamus harum.');
INSERT INTO `product_pics` VALUES ('92', '33', 'https://cdn.learnku.com/uploads/images/201806/01/5320/1B3n0ATKrn.jpg', 'Recusandae asperiores id nostrum dolor delectus voluptatibus.');
INSERT INTO `product_pics` VALUES ('93', '33', 'https://cdn.learnku.com/uploads/images/201806/01/5320/C0bVuKB2nt.jpg', 'Hic dolorum dolore vel ut.');
INSERT INTO `product_pics` VALUES ('94', '34', 'https://cdn.learnku.com/uploads/images/201806/01/5320/7kG1HekGK6.jpg', 'Et omnis iste nisi ut nulla.');
INSERT INTO `product_pics` VALUES ('95', '34', 'https://cdn.learnku.com/uploads/images/201806/01/5320/1B3n0ATKrn.jpg', 'Sint esse aut adipisci fuga vel reiciendis dolores.');
INSERT INTO `product_pics` VALUES ('96', '34', 'https://cdn.learnku.com/uploads/images/201806/01/5320/1B3n0ATKrn.jpg', 'Nobis officia minus ut eligendi recusandae voluptatem autem.');
INSERT INTO `product_pics` VALUES ('97', '35', 'https://cdn.learnku.com/uploads/images/201806/01/5320/7kG1HekGK6.jpg', 'Quo aut aut ea hic impedit.');
INSERT INTO `product_pics` VALUES ('98', '35', 'https://cdn.learnku.com/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg', 'Aut soluta odio cum molestiae.');
INSERT INTO `product_pics` VALUES ('99', '35', 'https://cdn.learnku.com/uploads/images/201806/01/5320/C0bVuKB2nt.jpg', 'Repellendus suscipit voluptatem aut.');
INSERT INTO `product_pics` VALUES ('100', '36', 'https://cdn.learnku.com/uploads/images/201806/01/5320/1B3n0ATKrn.jpg', 'Et perspiciatis atque illo.');
INSERT INTO `product_pics` VALUES ('101', '36', 'https://cdn.learnku.com/uploads/images/201806/01/5320/1B3n0ATKrn.jpg', 'Tenetur et voluptate quis et similique.');
INSERT INTO `product_pics` VALUES ('102', '36', 'https://cdn.learnku.com/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg', 'Omnis ex architecto voluptas eum incidunt porro.');
INSERT INTO `product_pics` VALUES ('103', '37', 'https://cdn.learnku.com/uploads/images/201806/01/5320/1B3n0ATKrn.jpg', 'Quas quae nisi quia esse consequuntur ut.');
INSERT INTO `product_pics` VALUES ('104', '37', 'https://cdn.learnku.com/uploads/images/201806/01/5320/82Wf2sg8gM.jpg', 'Tempore adipisci ab suscipit.');
INSERT INTO `product_pics` VALUES ('105', '37', 'https://cdn.learnku.com/uploads/images/201806/01/5320/82Wf2sg8gM.jpg', 'Nihil recusandae molestiae laboriosam ad ut vitae dignissimos.');
INSERT INTO `product_pics` VALUES ('106', '38', 'https://cdn.learnku.com/uploads/images/201806/01/5320/7kG1HekGK6.jpg', 'Occaecati quibusdam dolores voluptatibus praesentium nisi.');
INSERT INTO `product_pics` VALUES ('107', '38', 'https://cdn.learnku.com/uploads/images/201806/01/5320/1B3n0ATKrn.jpg', 'A aspernatur amet laudantium optio ipsam est.');
INSERT INTO `product_pics` VALUES ('108', '38', 'https://cdn.learnku.com/uploads/images/201806/01/5320/7kG1HekGK6.jpg', 'Facilis laudantium labore voluptatem aut harum iure.');
INSERT INTO `product_pics` VALUES ('109', '39', 'https://cdn.learnku.com/uploads/images/201806/01/5320/82Wf2sg8gM.jpg', 'Sit corporis ducimus voluptas praesentium iste repellendus assumenda.');
INSERT INTO `product_pics` VALUES ('110', '39', 'https://cdn.learnku.com/uploads/images/201806/01/5320/r3BNRe4zXG.jpg', 'Eos corporis reiciendis earum delectus occaecati.');
INSERT INTO `product_pics` VALUES ('111', '39', 'https://cdn.learnku.com/uploads/images/201806/01/5320/7kG1HekGK6.jpg', 'Placeat ipsa delectus asperiores consequuntur temporibus sunt eos ratione.');
INSERT INTO `product_pics` VALUES ('112', '40', 'https://cdn.learnku.com/uploads/images/201806/01/5320/C0bVuKB2nt.jpg', 'Illo sint ut omnis at nisi quod est.');
INSERT INTO `product_pics` VALUES ('113', '40', 'https://cdn.learnku.com/uploads/images/201806/01/5320/7kG1HekGK6.jpg', 'Labore amet aspernatur quo neque.');
INSERT INTO `product_pics` VALUES ('114', '40', 'https://cdn.learnku.com/uploads/images/201806/01/5320/r3BNRe4zXG.jpg', 'Deleniti similique iste voluptatem iste sed illo ut.');
INSERT INTO `product_pics` VALUES ('115', '41', 'https://cdn.learnku.com/uploads/images/201806/01/5320/82Wf2sg8gM.jpg', 'Reiciendis sit et ut possimus.');
INSERT INTO `product_pics` VALUES ('116', '41', 'https://cdn.learnku.com/uploads/images/201806/01/5320/82Wf2sg8gM.jpg', 'Voluptas mollitia aperiam exercitationem placeat ducimus velit.');
INSERT INTO `product_pics` VALUES ('117', '41', 'https://cdn.learnku.com/uploads/images/201806/01/5320/7kG1HekGK6.jpg', 'Enim voluptatum quis minima voluptatibus necessitatibus neque ea.');
INSERT INTO `product_pics` VALUES ('118', '42', 'https://cdn.learnku.com/uploads/images/201806/01/5320/1B3n0ATKrn.jpg', 'Vel animi et quo at placeat.');
INSERT INTO `product_pics` VALUES ('119', '42', 'https://cdn.learnku.com/uploads/images/201806/01/5320/7kG1HekGK6.jpg', 'Temporibus officiis harum consequatur repellat rem.');
INSERT INTO `product_pics` VALUES ('120', '42', 'https://cdn.learnku.com/uploads/images/201806/01/5320/1B3n0ATKrn.jpg', 'Rem et quos ex nostrum aspernatur.');
INSERT INTO `product_pics` VALUES ('121', '43', 'https://cdn.learnku.com/uploads/images/201806/01/5320/82Wf2sg8gM.jpg', 'At et repellendus beatae.');
INSERT INTO `product_pics` VALUES ('122', '43', 'https://cdn.learnku.com/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg', 'Perspiciatis odio velit in iusto esse.');
INSERT INTO `product_pics` VALUES ('123', '43', 'https://cdn.learnku.com/uploads/images/201806/01/5320/1B3n0ATKrn.jpg', 'Ut vel aut cupiditate qui consequuntur.');
INSERT INTO `product_pics` VALUES ('124', '44', 'https://cdn.learnku.com/uploads/images/201806/01/5320/r3BNRe4zXG.jpg', 'Odit sapiente est voluptas atque dolores velit alias excepturi.');
INSERT INTO `product_pics` VALUES ('125', '44', 'https://cdn.learnku.com/uploads/images/201806/01/5320/7kG1HekGK6.jpg', 'Expedita doloremque cumque repellendus veniam culpa voluptatum.');
INSERT INTO `product_pics` VALUES ('126', '44', 'https://cdn.learnku.com/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg', 'Nostrum et id omnis et.');
INSERT INTO `product_pics` VALUES ('127', '45', 'https://cdn.learnku.com/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg', 'Quas voluptatem perspiciatis aliquam vel nam ut tenetur.');
INSERT INTO `product_pics` VALUES ('128', '45', 'https://cdn.learnku.com/uploads/images/201806/01/5320/r3BNRe4zXG.jpg', 'Sit aliquam sunt vel et architecto praesentium.');
INSERT INTO `product_pics` VALUES ('129', '45', 'https://cdn.learnku.com/uploads/images/201806/01/5320/82Wf2sg8gM.jpg', 'Incidunt earum culpa expedita sed voluptatibus velit ut.');
INSERT INTO `product_pics` VALUES ('130', '46', 'https://cdn.learnku.com/uploads/images/201806/01/5320/7kG1HekGK6.jpg', 'Illo numquam nisi qui odio.');
INSERT INTO `product_pics` VALUES ('131', '46', 'https://cdn.learnku.com/uploads/images/201806/01/5320/1B3n0ATKrn.jpg', 'Omnis perferendis nihil eaque quidem voluptatem aut voluptas.');
INSERT INTO `product_pics` VALUES ('132', '46', 'https://cdn.learnku.com/uploads/images/201806/01/5320/7kG1HekGK6.jpg', 'Atque reprehenderit explicabo sapiente minus est placeat alias.');
INSERT INTO `product_pics` VALUES ('133', '47', 'https://cdn.learnku.com/uploads/images/201806/01/5320/r3BNRe4zXG.jpg', 'Dicta dolorum accusantium at molestias.');
INSERT INTO `product_pics` VALUES ('134', '47', 'https://cdn.learnku.com/uploads/images/201806/01/5320/1B3n0ATKrn.jpg', 'Nulla perspiciatis eligendi voluptatem officia quisquam.');
INSERT INTO `product_pics` VALUES ('135', '47', 'https://cdn.learnku.com/uploads/images/201806/01/5320/C0bVuKB2nt.jpg', 'Quo fugiat et provident eum.');
INSERT INTO `product_pics` VALUES ('136', '48', 'https://cdn.learnku.com/uploads/images/201806/01/5320/7kG1HekGK6.jpg', 'Dolorem molestias dolorem neque fugit excepturi aspernatur facilis.');
INSERT INTO `product_pics` VALUES ('137', '48', 'https://cdn.learnku.com/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg', 'Quaerat ut deserunt sed quae explicabo eligendi.');
INSERT INTO `product_pics` VALUES ('138', '48', 'https://cdn.learnku.com/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg', 'Sequi enim voluptates iure voluptatem et porro hic consectetur.');
INSERT INTO `product_pics` VALUES ('139', '49', 'https://cdn.learnku.com/uploads/images/201806/01/5320/r3BNRe4zXG.jpg', 'Ea ut facilis aliquid amet.');
INSERT INTO `product_pics` VALUES ('140', '49', 'https://cdn.learnku.com/uploads/images/201806/01/5320/r3BNRe4zXG.jpg', 'Nobis vitae eum incidunt autem debitis impedit natus eaque.');
INSERT INTO `product_pics` VALUES ('141', '49', 'https://cdn.learnku.com/uploads/images/201806/01/5320/7kG1HekGK6.jpg', 'Magni sunt quo saepe totam reiciendis sed quo.');
INSERT INTO `product_pics` VALUES ('142', '50', 'https://cdn.learnku.com/uploads/images/201806/01/5320/C0bVuKB2nt.jpg', 'Et saepe ullam quia esse corrupti.');
INSERT INTO `product_pics` VALUES ('143', '50', 'https://cdn.learnku.com/uploads/images/201806/01/5320/C0bVuKB2nt.jpg', 'Sunt ipsa cumque ipsum qui consectetur fuga et.');
INSERT INTO `product_pics` VALUES ('144', '50', 'https://cdn.learnku.com/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg', 'Alias dignissimos optio mollitia minus distinctio labore.');
INSERT INTO `product_pics` VALUES ('145', '51', 'https://cdn.learnku.com/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg', 'Nam consequatur totam accusantium eos iusto ut omnis.');
INSERT INTO `product_pics` VALUES ('146', '51', 'https://cdn.learnku.com/uploads/images/201806/01/5320/C0bVuKB2nt.jpg', 'Sit voluptatum maxime illum alias tempora.');
INSERT INTO `product_pics` VALUES ('147', '51', 'https://cdn.learnku.com/uploads/images/201806/01/5320/1B3n0ATKrn.jpg', 'Porro amet nulla consequatur inventore repellat ipsum minima.');
INSERT INTO `product_pics` VALUES ('148', '52', 'https://cdn.learnku.com/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg', 'Sed eius hic voluptas.');
INSERT INTO `product_pics` VALUES ('149', '52', 'https://cdn.learnku.com/uploads/images/201806/01/5320/82Wf2sg8gM.jpg', 'Optio et nihil et ratione.');
INSERT INTO `product_pics` VALUES ('150', '52', 'https://cdn.learnku.com/uploads/images/201806/01/5320/7kG1HekGK6.jpg', 'Qui rem hic qui.');
INSERT INTO `product_pics` VALUES ('151', '53', 'https://cdn.learnku.com/uploads/images/201806/01/5320/1B3n0ATKrn.jpg', 'Eos modi quasi sit quos atque ut.');
INSERT INTO `product_pics` VALUES ('152', '53', 'https://cdn.learnku.com/uploads/images/201806/01/5320/82Wf2sg8gM.jpg', 'Repellat error sit aperiam.');
INSERT INTO `product_pics` VALUES ('153', '53', 'https://cdn.learnku.com/uploads/images/201806/01/5320/1B3n0ATKrn.jpg', 'Cupiditate esse blanditiis dolorem ratione impedit voluptas et omnis.');
INSERT INTO `product_pics` VALUES ('154', '54', 'https://cdn.learnku.com/uploads/images/201806/01/5320/7kG1HekGK6.jpg', 'Sed nisi dolorem aut dicta.');
INSERT INTO `product_pics` VALUES ('155', '54', 'https://cdn.learnku.com/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg', 'Quibusdam quis repellendus odio rerum voluptatem.');
INSERT INTO `product_pics` VALUES ('156', '54', 'https://cdn.learnku.com/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg', 'Ducimus voluptate quo velit incidunt maxime.');
INSERT INTO `product_pics` VALUES ('157', '55', 'https://cdn.learnku.com/uploads/images/201806/01/5320/1B3n0ATKrn.jpg', 'Et facere eum eligendi ex.');
INSERT INTO `product_pics` VALUES ('158', '55', 'https://cdn.learnku.com/uploads/images/201806/01/5320/1B3n0ATKrn.jpg', 'Sit consequatur iure molestiae nesciunt sed delectus.');
INSERT INTO `product_pics` VALUES ('159', '55', 'https://cdn.learnku.com/uploads/images/201806/01/5320/1B3n0ATKrn.jpg', 'Voluptas laboriosam et placeat dolore.');
INSERT INTO `product_pics` VALUES ('160', '74', 'product/61d2c48310a5b30db2918d0065b73311.jpg', '1');
INSERT INTO `product_pics` VALUES ('161', '74', 'product/0f0a5d1fa06f728898ad929cddbf24be.jpg', '2');
INSERT INTO `product_pics` VALUES ('162', '74', 'product/a1c570b71d8ad0473bbae0effd590dfd.jpg', '3');
INSERT INTO `product_pics` VALUES ('163', '74', 'product/78537292040fcbc84d26e700242c6d7e.jpg', '12');
INSERT INTO `product_pics` VALUES ('164', '75', 'product/7cd2b9d08faa505eee2adc82d45de1a0.jpg', '1');
INSERT INTO `product_pics` VALUES ('165', '75', 'product/9efa681cdcc4b7fb4ff54d09fe9ae46b.jpg', '2');
INSERT INTO `product_pics` VALUES ('166', '75', 'product/5aea0cad33dbedee49c78090f67e0656.jpg', '3');
INSERT INTO `product_pics` VALUES ('167', '75', 'product/606d96430b39130cbf4adf60a90b342d.jpg', '12');
INSERT INTO `product_pics` VALUES ('168', '76', 'product/ab62bf85ce1ed4558ca8a9aaae42c287.jpg', '1');
INSERT INTO `product_pics` VALUES ('169', '76', 'product/441758492c3db29286863900368f4251.jpg', '2');
INSERT INTO `product_pics` VALUES ('170', '76', 'product/55d1a7490aad9cb82239f6fe0d3e2e7f.jpg', '111');
INSERT INTO `product_pics` VALUES ('171', '76', 'product/24f3995d68c8a0c3c0962847d2df7f4d.jpg', '121212');
INSERT INTO `product_pics` VALUES ('172', '77', 'product/af1cce51af0d93374451c552a1334b4e.png', '111');
INSERT INTO `product_pics` VALUES ('173', '77', 'product/988f6f3ef85a93fea59facf5d2ffc3ae.png', '22');
INSERT INTO `product_pics` VALUES ('174', '78', 'product/96f9a8e67da7219cbdf10f91ca77d488.png', '111');
INSERT INTO `product_pics` VALUES ('175', '78', 'product/385ba705ead2efce317faf5da0c0db93.png', '22');
INSERT INTO `product_pics` VALUES ('176', '78', 'product/b64c7f01822fd4a6d1ce7ede350afae6.png', '21');
INSERT INTO `product_pics` VALUES ('177', '78', 'product/6029ef2482eff8ead811ea18953a6a4b.png', '2121');
INSERT INTO `product_pics` VALUES ('178', '78', 'product/4582ee7769879f544823628f1e282281.png', '122112');
INSERT INTO `product_pics` VALUES ('179', '79', 'product/e72dea80401506bb9c52221906be2261.jpg', '11');
INSERT INTO `product_pics` VALUES ('180', '79', 'product/c70a65c78a1711aa404430cc9f1178bd.jpg', '22');
INSERT INTO `product_pics` VALUES ('181', '79', 'product/e396b1b89a3d804ff10020f3e44a4d4b.jpg', '21');
INSERT INTO `product_pics` VALUES ('182', '79', 'product/3a5190451bbc5b2025cc824549ce295a.jpg', '211221');
INSERT INTO `product_pics` VALUES ('183', '80', 'product/aa9de805bde032c45eade7deab9b2708.jpg', '111');
INSERT INTO `product_pics` VALUES ('184', '80', 'product/d153a4fa6504c01177f1ab8521e596d1.jpg', '9999');
INSERT INTO `product_pics` VALUES ('185', '80', 'product/762860fa339e7000a18ca611657798a3.jpg', '1111');
INSERT INTO `product_pics` VALUES ('186', '80', 'product/c4c85c54f9eacb9c8b3f0559271b911c.jpg', '1');
INSERT INTO `product_pics` VALUES ('187', '81', 'product/b3c2e88058199175dc4e6261b92b8983.gif', '1');
INSERT INTO `product_pics` VALUES ('188', '82', 'product/a99add7f4c0031671030064f002768d6.jpg', '11');
INSERT INTO `product_pics` VALUES ('189', '82', 'product/42db014230f2996f72901a2019e87daf.jpg', '22');
INSERT INTO `product_pics` VALUES ('190', '82', 'product/84ca5011a26174ec09f0666bd04a73db.jpg', '111');
INSERT INTO `product_pics` VALUES ('191', '83', 'product/f64e060e78813a0faa269cdd91a03db1.jpg', '11');
INSERT INTO `product_pics` VALUES ('192', '83', 'product/78a913488423c68dd773d901deac6baf.jpg', '555');
INSERT INTO `product_pics` VALUES ('193', '84', 'product/060aed2ff3878260480517773defeb2d.jpg', '111');
INSERT INTO `product_pics` VALUES ('194', '84', 'product/a07514aa5a55abd026bf45e2fca4db31.jpg', '22');
INSERT INTO `product_pics` VALUES ('195', '84', 'product/1490b8be7a9979d59bfef89a53d957bd.jpg', '1');
INSERT INTO `product_pics` VALUES ('196', '84', 'product/fb87180dc004967031b7c7aec3b599e4.jpg', '111');
INSERT INTO `product_pics` VALUES ('197', '85', 'product/668fc89b4ae8d627a86adcf2ea9fcbb4.jpg', '11');
INSERT INTO `product_pics` VALUES ('198', '86', 'product/f8cd17d8ab1971e82bc522ba4bede94e.jpg', '11');
INSERT INTO `product_pics` VALUES ('199', '87', 'product/62f351a545b9e23ae71103a89035d77c.jpg', '111');
INSERT INTO `product_pics` VALUES ('200', '88', 'product/a9dd536a1de7740f6d4eec628830b110.jpg', '11');
INSERT INTO `product_pics` VALUES ('201', '89', 'product/9d6a768cdb00036df93ca74c291ab522.jpg', '去');
INSERT INTO `product_pics` VALUES ('202', '89', 'product/1e1256285ba4ad7cdb0f2ff56d283ab7.jpg', '2');
INSERT INTO `product_pics` VALUES ('203', '89', 'product/0f89f42e9a6afe1af60eed10ff6e6742.jpg', '111');
INSERT INTO `product_pics` VALUES ('204', '90', 'product/196d50ecb9226048f817f5133cc73a99.jpg', '111');
INSERT INTO `product_pics` VALUES ('205', '91', 'product/d288fd89d84c9f2e6334931cee480a9c.jpg', '111');
INSERT INTO `product_pics` VALUES ('206', '92', 'product/e5cf1af9851e9d28bca3e73ffbb637da.jpg', '11');
INSERT INTO `product_pics` VALUES ('207', '93', 'product/de026bb5cba42dfa3188469c1aa837d6.jpg', '1221');
INSERT INTO `product_pics` VALUES ('208', '94', 'product/7f93965fd1ef279d3372cf1ca2f3ab14.jpg', '1');
INSERT INTO `product_pics` VALUES ('209', '94', 'product/a5ba392d9adcaa795e2d595a5a41f594.jpg', '2');
INSERT INTO `product_pics` VALUES ('210', '94', 'product/8c620b77e71e0aeaf5454e37ff368003.jpg', '33');
INSERT INTO `product_pics` VALUES ('211', '94', 'product/8b468c2f732004715edede2da476ed1e.jpg', '12');
INSERT INTO `product_pics` VALUES ('212', '95', 'product/7175923d3426a32f187325d9c32afad6.jpg', '11');
INSERT INTO `product_pics` VALUES ('213', '95', 'product/3fa3448d5f9ed7b7b60129e07cac58f5.jpg', '22');
INSERT INTO `product_pics` VALUES ('214', '95', 'product/405f65b03e14e630c26e1ad15e1b9158.jpg', '33');
INSERT INTO `product_pics` VALUES ('215', '95', 'product/176e7bd507eddd2f75b1416feccb6a69.jpg', '12');
INSERT INTO `product_pics` VALUES ('216', '96', 'product/af541bd5d474704c3be729af9932b1b5.jpg', '1');
INSERT INTO `product_pics` VALUES ('217', '96', 'product/62262565a2a7f4229c08490255174b16.jpg', '2');
INSERT INTO `product_pics` VALUES ('218', '96', 'product/973bd78eb5ad0da0bf339b5afb64df87.jpg', '11');
INSERT INTO `product_pics` VALUES ('219', '96', 'product/bef00be75c091879d971a6a25abf58b5.jpg', '12');
INSERT INTO `product_pics` VALUES ('220', '97', 'product/1f600cc2e1e6af0cc96accd110f9b42e.jpg', '111');
INSERT INTO `product_pics` VALUES ('221', '98', 'product/7c3d5068cf4c1957550afb3dd96aa55c.jpg', '11');
INSERT INTO `product_pics` VALUES ('222', '98', 'product/ff2f004ac5d706889169ae746707cfa1.jpg', '22');
INSERT INTO `product_pics` VALUES ('223', '98', 'product/23203375cc1b93f4c87d59a84f7d7b3b.jpg', '11');
INSERT INTO `product_pics` VALUES ('224', '99', 'product/1a29f6ef9e7ff73f7d2b6770fcff0919.jpg', '1');
INSERT INTO `product_pics` VALUES ('225', '99', 'product/e0cfcddc8131c0985067dd8a66fab990.jpg', '2');
INSERT INTO `product_pics` VALUES ('226', '99', 'product/198023366a49197e4a14f8851c4797d1.jpg', '111');
INSERT INTO `product_pics` VALUES ('227', '99', 'product/9f7fdcb3045d315f5cf7f0306b46ab45.jpg', '12');
INSERT INTO `product_pics` VALUES ('228', '99', 'product/70ca0ad46f943cfa48e6b27fac47029c.jpg', '12');
INSERT INTO `product_pics` VALUES ('229', '100', 'product/898de62a155f0ce139870696d1d21a66.jpg', '1');
INSERT INTO `product_pics` VALUES ('230', '100', 'product/0d9af0656d60f08fb92d1a6e8e5f6ac6.jpg', '22');
INSERT INTO `product_pics` VALUES ('231', '100', 'product/7b6ce708bcb6cc19a8cf747487670adc.jpg', '12');
INSERT INTO `product_pics` VALUES ('232', '100', 'product/9b27ce80d90b8bd323c5e11793945a1c.jpg', '21');
INSERT INTO `product_pics` VALUES ('233', '101', 'product/3a7bc84f8702d0fc18118b2884a57a92.jpg', '1');
INSERT INTO `product_pics` VALUES ('234', '101', 'product/d6c738f75112feb44c9335c9469aaa7d.jpg', '2');
INSERT INTO `product_pics` VALUES ('235', '101', 'product/50333c420f249824cb2052081f11099f.jpg', '1');
INSERT INTO `product_pics` VALUES ('236', '101', 'product/029389d57f4ce98201f1872b28b877b6.jpg', '12');
INSERT INTO `product_pics` VALUES ('237', '102', 'product/6e4c0c5ab5406e3bd73f1dd4a67228b1.jpg', '11');
INSERT INTO `product_pics` VALUES ('238', '102', 'product/0dc820c635a3b57b7b82de17de6c780c.jpg', '22');
INSERT INTO `product_pics` VALUES ('239', '102', 'product/43f45850bdfe18bf6a107f7ce902982d.jpg', '12');
INSERT INTO `product_pics` VALUES ('240', '103', 'product/6a7f3f65f4aea4c7a2dc515034b5d8fd.jpg', '1');
INSERT INTO `product_pics` VALUES ('241', '103', 'product/19b69202e24faca6bc63bb3d4aea0347.jpg', '12');
INSERT INTO `product_pics` VALUES ('242', '103', 'product/65108a636f7f76689716f5e4eef607f9.jpg', '21');
INSERT INTO `product_pics` VALUES ('243', '103', 'product/1f1c82b7a48ed060508c5d3811a28caf.jpg', '111');
INSERT INTO `product_pics` VALUES ('244', '103', 'product/0783f4e8ca580956b719d81c0054fb80.jpg', '22222');
INSERT INTO `product_pics` VALUES ('245', '104', 'product/6f348d7c801678229ee904a76b97659f.jpg', '111');
INSERT INTO `product_pics` VALUES ('246', '104', 'product/5915550d9a2cdb46551d04d1e9de8d2d.jpg', '1212');
INSERT INTO `product_pics` VALUES ('247', '105', 'product/cb71167f03b603df05d10cfbe5044edc.jpg', '122121');
INSERT INTO `product_pics` VALUES ('248', '105', 'product/adda9172a87eecf89d61ed40c6739572.jpg', '');
INSERT INTO `product_pics` VALUES ('249', '105', 'product/ebd3a652b5a49f2f8aae353120fc1a0f.jpg', '');
INSERT INTO `product_pics` VALUES ('250', '105', 'product/969dbc2d7fa9d6999bccd426e5732cc4.jpg', '');
INSERT INTO `product_pics` VALUES ('251', '105', 'product/545aacf66141fa228e4dd7b14184b827.jpg', '');
INSERT INTO `product_pics` VALUES ('252', '106', 'product/636686cf1f2443852c43a48870303502.jpg', '11');
INSERT INTO `product_pics` VALUES ('253', '106', 'product/a9432f4929c2b3d5f4e3de08e1beaac3.jpg', '12');
INSERT INTO `product_pics` VALUES ('254', '106', 'product/ce1e604694c50685a2a3f77b7c9a0f0c.jpg', '12');
INSERT INTO `product_pics` VALUES ('255', '106', 'product/646d03b8131e47e934c03bbbacb8fbf8.jpg', '121221');
INSERT INTO `product_pics` VALUES ('256', '107', 'product/6a1b77a63111a50de84318a2e65e0e4d.jpg', '');
INSERT INTO `product_pics` VALUES ('257', '108', 'product/9db1f4e95fe92defd948718e02085fad.jpg', '');
INSERT INTO `product_pics` VALUES ('258', '108', 'product/e617fb3abde5cf8a3e0bb7fd8151ecff.jpg', '');
INSERT INTO `product_pics` VALUES ('259', '108', 'product/3b95759796d0d585b97248cb7014ae64.jpg', '');
INSERT INTO `product_pics` VALUES ('260', '108', 'product/c3b7749625430706b0148d9f51c40754.jpg', '');
INSERT INTO `product_pics` VALUES ('261', '113', 'product/416d73fca2ba3dc628676fea5c76b22a.jpg', '封面');
INSERT INTO `product_pics` VALUES ('262', '114', 'product/0bee5c723b6cbcf91f1d180aff718e8b.jpg', '封面');
INSERT INTO `product_pics` VALUES ('266', '118', 'product/a8606bb98bffff024f93081a5d0efa57.jpg', '封面');
INSERT INTO `product_pics` VALUES ('269', '121', 'product/00aa60d90281624184e097b72521f37d.jpg', '封面');

-- ----------------------------
-- Table structure for `product_skus`
-- ----------------------------
DROP TABLE IF EXISTS `product_skus`;
CREATE TABLE `product_skus` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `original_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `stock` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_skus_product_id_foreign` (`product_id`),
  CONSTRAINT `product_skus_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=232 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of product_skus
-- ----------------------------
INSERT INTO `product_skus` VALUES ('1', '1', '米6', '全自动', '1500.00', '1500.00', '105', '2020-06-18 14:43:34', '2020-06-18 14:53:09');
INSERT INTO `product_skus` VALUES ('2', '1', '米8', '防水', '2500.00', '2500.00', '205', '2020-06-18 14:43:34', '2020-06-18 14:53:09');
INSERT INTO `product_skus` VALUES ('5', '4', 'iphone11', 'iphone11', '8000.00', '8000.00', '100', '2020-06-19 17:19:23', '2020-06-19 17:19:23');
INSERT INTO `product_skus` VALUES ('6', '5', 't420', 't420', '6000.00', '6000.00', '100', '2020-06-19 17:23:43', '2020-06-19 17:23:43');
INSERT INTO `product_skus` VALUES ('7', '5', 't430', 't430', '8000.00', '8000.00', '100', '2020-06-19 17:23:43', '2020-06-19 17:23:43');
INSERT INTO `product_skus` VALUES ('8', '56', 'iphone', '适用于iphone各系列', '100.00', '100.00', '99', '2020-06-22 09:39:57', '2020-07-09 16:55:43');
INSERT INTO `product_skus` VALUES ('9', '56', 'mi', '适用于mi各系列', '55.00', '55.00', '100', '2020-06-22 09:39:57', '2020-06-22 09:39:57');
INSERT INTO `product_skus` VALUES ('10', '57', '苹果', '苹果', '120.00', '120.00', '200', '2020-06-22 10:24:38', '2020-06-22 10:24:38');
INSERT INTO `product_skus` VALUES ('11', '6', 'dicta', 'Soluta ut velit necessitatibus ea voluptatem eos vel.', '9084.00', '9084.00', '972', '2020-06-22 14:47:21', '2020-06-22 14:47:21');
INSERT INTO `product_skus` VALUES ('12', '6', 'ea', 'Quasi aut est eum quasi odio enim est quam.', '638.00', '638.00', '885', '2020-06-22 14:47:21', '2020-06-22 14:47:21');
INSERT INTO `product_skus` VALUES ('13', '6', 'molestias', 'Ut temporibus distinctio voluptas facere.', '7150.00', '7150.00', '656', '2020-06-22 14:47:21', '2020-06-22 14:47:21');
INSERT INTO `product_skus` VALUES ('14', '7', 'ut', 'Natus et voluptate porro consequuntur sapiente rerum.', '4889.00', '4889.00', '105', '2020-06-22 14:48:57', '2020-06-22 14:48:57');
INSERT INTO `product_skus` VALUES ('15', '7', 'repudiandae', 'Sunt quis quasi quae nam quia aliquid est.', '2672.00', '2672.00', '33', '2020-06-22 14:48:58', '2020-06-22 14:48:58');
INSERT INTO `product_skus` VALUES ('16', '7', 'et', 'Voluptatem tenetur culpa itaque cum minima aperiam ipsam.', '4533.00', '4533.00', '516', '2020-06-22 14:48:58', '2020-06-22 14:48:58');
INSERT INTO `product_skus` VALUES ('17', '8', 'necessitatibus', 'Ut iusto culpa expedita molestiae.', '5547.00', '5547.00', '395', '2020-06-22 14:48:58', '2020-06-22 14:48:58');
INSERT INTO `product_skus` VALUES ('18', '8', 'inventore', 'Facere hic enim qui qui cupiditate et est.', '8407.00', '8407.00', '288', '2020-06-22 14:48:58', '2020-06-22 14:48:58');
INSERT INTO `product_skus` VALUES ('19', '8', 'ipsum', 'Omnis sint optio quam laudantium.', '3489.00', '3489.00', '370', '2020-06-22 14:48:58', '2020-06-22 14:48:58');
INSERT INTO `product_skus` VALUES ('20', '9', 'et', 'Illo voluptatem saepe illum iure assumenda.', '6624.00', '6624.00', '924', '2020-06-22 14:48:58', '2020-06-22 14:48:58');
INSERT INTO `product_skus` VALUES ('21', '9', 'esse', 'Autem vitae maiores nostrum nihil.', '7563.00', '7563.00', '586', '2020-06-22 14:48:58', '2020-06-22 14:48:58');
INSERT INTO `product_skus` VALUES ('22', '9', 'vitae', 'Totam blanditiis fuga vitae consequatur tempora a.', '5479.00', '5479.00', '778', '2020-06-22 14:48:58', '2020-06-22 14:48:58');
INSERT INTO `product_skus` VALUES ('23', '10', 'occaecati', 'Adipisci quod qui esse nisi non.', '6363.00', '6363.00', '666', '2020-06-22 14:48:58', '2020-06-22 14:48:58');
INSERT INTO `product_skus` VALUES ('24', '10', 'quisquam', 'Nisi est ipsum sunt error vel et excepturi est.', '3261.00', '3261.00', '735', '2020-06-22 14:48:59', '2020-06-22 14:48:59');
INSERT INTO `product_skus` VALUES ('25', '10', 'sapiente', 'Minus ratione est adipisci vel et.', '2771.00', '2771.00', '678', '2020-06-22 14:48:59', '2020-06-22 14:48:59');
INSERT INTO `product_skus` VALUES ('26', '11', 'tenetur', 'Id error similique et necessitatibus et.', '6768.00', '6768.00', '972', '2020-06-22 14:48:59', '2020-06-22 14:48:59');
INSERT INTO `product_skus` VALUES ('27', '11', 'ut', 'Quis quo quibusdam id ratione corporis laborum.', '4161.00', '4161.00', '582', '2020-06-22 14:48:59', '2020-06-22 14:48:59');
INSERT INTO `product_skus` VALUES ('28', '11', 'facilis', 'Et quia delectus ut fugiat.', '3016.00', '3016.00', '549', '2020-06-22 14:48:59', '2020-06-22 14:48:59');
INSERT INTO `product_skus` VALUES ('29', '12', 'nulla', 'Cumque nobis quod sint nihil.', '4216.00', '4216.00', '142', '2020-06-22 14:48:59', '2020-06-22 14:48:59');
INSERT INTO `product_skus` VALUES ('30', '12', 'libero', 'Nam possimus illo quod et sunt qui.', '8224.00', '8224.00', '50', '2020-06-22 14:48:59', '2020-06-22 14:48:59');
INSERT INTO `product_skus` VALUES ('31', '12', 'laboriosam', 'Qui fuga dolor qui corporis ab velit.', '1700.00', '1700.00', '195', '2020-06-22 14:48:59', '2020-06-22 14:48:59');
INSERT INTO `product_skus` VALUES ('32', '13', 'dolore', 'Optio labore occaecati et inventore doloremque.', '1382.00', '1382.00', '51', '2020-06-22 14:49:00', '2020-06-22 14:49:00');
INSERT INTO `product_skus` VALUES ('33', '13', 'unde', 'Dolor quos repellat consequatur non nobis suscipit.', '2056.00', '2056.00', '72', '2020-06-22 14:49:00', '2020-06-22 14:49:00');
INSERT INTO `product_skus` VALUES ('34', '13', 'debitis', 'Molestias in voluptatem rerum sapiente dicta.', '3660.00', '3660.00', '450', '2020-06-22 14:49:00', '2020-06-22 14:49:00');
INSERT INTO `product_skus` VALUES ('35', '14', 'sequi', 'Voluptatem dolor aliquam temporibus rerum fugit in possimus.', '551.00', '551.00', '215', '2020-06-22 14:49:00', '2020-06-22 14:49:00');
INSERT INTO `product_skus` VALUES ('36', '14', 'in', 'Minus est fugit quam culpa cumque.', '7345.00', '7345.00', '770', '2020-06-22 14:49:00', '2020-06-22 14:49:00');
INSERT INTO `product_skus` VALUES ('37', '14', 'in', 'Ut quia modi est omnis.', '2964.00', '2964.00', '503', '2020-06-22 14:49:00', '2020-06-22 14:49:00');
INSERT INTO `product_skus` VALUES ('38', '15', 'quia', 'Cum enim quo quis velit fuga nesciunt numquam.', '7069.00', '7069.00', '957', '2020-06-22 14:49:00', '2020-06-22 14:49:00');
INSERT INTO `product_skus` VALUES ('39', '15', 'nulla', 'Enim sint aut reiciendis provident voluptatum fugit iste.', '8992.00', '8992.00', '645', '2020-06-22 14:49:00', '2020-06-22 14:49:00');
INSERT INTO `product_skus` VALUES ('40', '15', 'dolorem', 'Maxime id perspiciatis iure et incidunt.', '4485.00', '4485.00', '985', '2020-06-22 14:49:00', '2020-06-22 14:49:00');
INSERT INTO `product_skus` VALUES ('41', '16', 'fuga', 'Exercitationem sunt nulla pariatur praesentium dolores ipsum autem perferendis.', '813.00', '813.00', '109', '2020-06-22 14:49:00', '2020-06-22 14:49:00');
INSERT INTO `product_skus` VALUES ('42', '16', 'quibusdam', 'Et hic quo nam aliquid.', '626.00', '626.00', '470', '2020-06-22 14:49:00', '2020-06-22 14:49:00');
INSERT INTO `product_skus` VALUES ('43', '16', 'vel', 'Et at ipsum similique qui aspernatur consequatur sed.', '8076.00', '8076.00', '516', '2020-06-22 14:49:00', '2020-06-22 14:49:00');
INSERT INTO `product_skus` VALUES ('44', '17', 'minima', 'Dolore et ut officia ab sunt quidem qui.', '4479.00', '4479.00', '960', '2020-06-22 14:49:00', '2020-06-22 14:49:00');
INSERT INTO `product_skus` VALUES ('45', '17', 'libero', 'Porro maxime saepe odio laboriosam sequi sunt.', '3027.00', '3027.00', '361', '2020-06-22 14:49:00', '2020-06-22 14:49:00');
INSERT INTO `product_skus` VALUES ('46', '17', 'quia', 'Rerum molestias odit consequatur molestias aut incidunt aspernatur nemo.', '8990.00', '8990.00', '633', '2020-06-22 14:49:01', '2020-06-22 14:49:01');
INSERT INTO `product_skus` VALUES ('47', '18', 'consequatur', 'Et unde quo quia omnis ullam blanditiis accusamus.', '2346.00', '2346.00', '392', '2020-06-22 14:49:01', '2020-06-22 14:49:01');
INSERT INTO `product_skus` VALUES ('48', '18', 'corporis', 'Deserunt rerum beatae suscipit quos porro voluptatem voluptatibus est.', '5475.00', '5475.00', '351', '2020-06-22 14:49:01', '2020-06-22 14:49:01');
INSERT INTO `product_skus` VALUES ('49', '18', 'quia', 'Quia nisi omnis animi mollitia consectetur quidem.', '6345.00', '6345.00', '209', '2020-06-22 14:49:01', '2020-06-22 14:49:01');
INSERT INTO `product_skus` VALUES ('50', '19', 'sint', 'Voluptas quia nihil officia quaerat rerum fugit natus alias.', '8912.00', '8912.00', '212', '2020-06-22 14:49:01', '2020-06-22 14:49:01');
INSERT INTO `product_skus` VALUES ('51', '19', 'minus', 'Et deserunt et aut eveniet.', '7999.00', '7999.00', '159', '2020-06-22 14:49:01', '2020-06-22 14:49:01');
INSERT INTO `product_skus` VALUES ('52', '19', 'aut', 'Deserunt maiores rerum omnis amet sed ipsa.', '3779.00', '3779.00', '338', '2020-06-22 14:49:01', '2020-06-22 14:49:01');
INSERT INTO `product_skus` VALUES ('53', '20', 'animi', 'Tenetur qui non quod molestiae.', '9009.00', '9009.00', '311', '2020-06-22 14:49:01', '2020-06-22 14:49:01');
INSERT INTO `product_skus` VALUES ('54', '20', 'quasi', 'Aliquam repudiandae ut necessitatibus id eum placeat.', '6346.00', '6346.00', '46', '2020-06-22 14:49:01', '2020-06-22 14:49:01');
INSERT INTO `product_skus` VALUES ('55', '20', 'soluta', 'Delectus quia commodi nisi soluta error modi.', '4191.00', '4191.00', '332', '2020-06-22 14:49:01', '2020-06-22 14:49:01');
INSERT INTO `product_skus` VALUES ('56', '21', 'minima', 'Fugit ipsum ut eius sapiente minima non omnis.', '9545.00', '9545.00', '787', '2020-06-22 14:49:01', '2020-06-22 14:49:01');
INSERT INTO `product_skus` VALUES ('57', '21', 'saepe', 'Rerum veritatis qui necessitatibus ad voluptatibus dolore repellat magnam.', '4198.00', '4198.00', '303', '2020-06-22 14:49:01', '2020-06-22 14:49:01');
INSERT INTO `product_skus` VALUES ('58', '21', 'omnis', 'Sit quia est sint magnam.', '845.00', '845.00', '936', '2020-06-22 14:49:01', '2020-06-22 14:49:01');
INSERT INTO `product_skus` VALUES ('59', '22', 'neque', 'Rerum tenetur blanditiis cum soluta laudantium.', '9098.00', '9098.00', '784', '2020-06-22 14:49:02', '2020-06-22 14:49:02');
INSERT INTO `product_skus` VALUES ('60', '22', 'quam', 'Nisi perspiciatis distinctio facilis.', '1449.00', '1449.00', '6', '2020-06-22 14:49:02', '2020-06-22 14:49:02');
INSERT INTO `product_skus` VALUES ('61', '22', 'consequatur', 'Expedita dolorem et asperiores vero laborum sed ad.', '2313.00', '2313.00', '82', '2020-06-22 14:49:02', '2020-06-22 14:49:02');
INSERT INTO `product_skus` VALUES ('62', '23', 'et', 'At eum dolore aliquid eum nam aliquid qui.', '6987.00', '6987.00', '579', '2020-06-22 14:49:02', '2020-06-22 14:49:02');
INSERT INTO `product_skus` VALUES ('63', '23', 'quisquam', 'Eum cum consectetur provident voluptatem.', '5905.00', '5905.00', '536', '2020-06-22 14:49:02', '2020-06-22 14:49:02');
INSERT INTO `product_skus` VALUES ('64', '23', 'eveniet', 'Saepe neque atque blanditiis et.', '322.00', '322.00', '266', '2020-06-22 14:49:02', '2020-06-22 14:49:02');
INSERT INTO `product_skus` VALUES ('65', '24', 'nobis', 'Totam ut sit eum sit rerum non et.', '6671.00', '6671.00', '996', '2020-06-22 14:49:02', '2020-06-22 14:49:02');
INSERT INTO `product_skus` VALUES ('66', '24', 'et', 'In dolor dolorem voluptatum voluptatem.', '607.00', '607.00', '723', '2020-06-22 14:49:02', '2020-06-22 14:49:02');
INSERT INTO `product_skus` VALUES ('67', '24', 'aut', 'Temporibus fuga quo quia numquam iusto sequi sint.', '244.00', '244.00', '340', '2020-06-22 14:49:02', '2020-06-22 14:49:02');
INSERT INTO `product_skus` VALUES ('68', '25', 'et', 'Consequatur eos quasi qui animi est veritatis.', '9073.00', '9073.00', '857', '2020-06-22 14:49:02', '2020-06-22 14:49:02');
INSERT INTO `product_skus` VALUES ('69', '25', 'similique', 'Et voluptates autem optio omnis delectus dolores vel.', '861.00', '861.00', '512', '2020-06-22 14:49:02', '2020-06-22 14:49:02');
INSERT INTO `product_skus` VALUES ('70', '25', 'eligendi', 'Doloribus accusamus dolorem molestiae.', '6434.00', '6434.00', '240', '2020-06-22 14:49:02', '2020-06-22 14:49:02');
INSERT INTO `product_skus` VALUES ('71', '26', 'ducimus', 'Exercitationem error porro et quis consequatur laudantium.', '1586.00', '1586.00', '588', '2020-06-22 14:49:03', '2020-06-22 14:49:03');
INSERT INTO `product_skus` VALUES ('72', '26', 'eum', 'Est sunt neque amet placeat.', '5699.00', '5699.00', '852', '2020-06-22 14:49:03', '2020-06-22 14:49:03');
INSERT INTO `product_skus` VALUES ('73', '26', 'vero', 'Eligendi quis sint quasi quas.', '7429.00', '7429.00', '719', '2020-06-22 14:49:03', '2020-06-22 14:49:03');
INSERT INTO `product_skus` VALUES ('74', '27', 'non', 'Unde vel commodi saepe tempore.', '7276.00', '7276.00', '852', '2020-06-22 14:49:03', '2020-06-22 14:49:03');
INSERT INTO `product_skus` VALUES ('75', '27', 'eos', 'Et libero quae consequatur.', '6911.00', '6911.00', '74', '2020-06-22 14:49:03', '2020-06-22 14:49:03');
INSERT INTO `product_skus` VALUES ('76', '27', 'praesentium', 'Sit et quae non fugiat ratione quae non quisquam.', '6372.00', '6372.00', '701', '2020-06-22 14:49:03', '2020-06-22 14:49:03');
INSERT INTO `product_skus` VALUES ('77', '28', 'quis', 'Deleniti minima praesentium corrupti.', '856.00', '856.00', '579', '2020-06-22 14:49:03', '2020-06-22 14:49:03');
INSERT INTO `product_skus` VALUES ('78', '28', 'laudantium', 'Illo saepe aliquid molestiae explicabo temporibus et.', '541.00', '541.00', '397', '2020-06-22 14:49:03', '2020-06-22 14:49:03');
INSERT INTO `product_skus` VALUES ('79', '28', 'iusto', 'Ut illum non officiis at laboriosam dolorem.', '1602.00', '1602.00', '736', '2020-06-22 14:49:03', '2020-06-22 14:49:03');
INSERT INTO `product_skus` VALUES ('80', '29', 'aspernatur', 'Id reiciendis et consequuntur cumque rerum dolor.', '8739.00', '8739.00', '18', '2020-06-22 14:49:03', '2020-06-22 14:49:03');
INSERT INTO `product_skus` VALUES ('81', '29', 'quisquam', 'Quod doloremque ad consequuntur delectus enim.', '7489.00', '7489.00', '523', '2020-06-22 14:49:03', '2020-06-22 14:49:03');
INSERT INTO `product_skus` VALUES ('82', '29', 'ea', 'Et ut provident sed accusamus enim aliquid quis.', '3381.00', '3381.00', '346', '2020-06-22 14:49:03', '2020-06-22 14:49:03');
INSERT INTO `product_skus` VALUES ('83', '30', 'magni', 'Dolorem iure soluta quae expedita non quibusdam.', '8364.00', '8364.00', '738', '2020-06-22 14:49:03', '2020-06-22 14:49:03');
INSERT INTO `product_skus` VALUES ('84', '30', 'voluptatibus', 'In quia sint ut ullam est voluptas.', '6904.00', '6904.00', '900', '2020-06-22 14:49:03', '2020-06-22 14:49:03');
INSERT INTO `product_skus` VALUES ('85', '30', 'est', 'Et mollitia temporibus qui accusantium.', '3939.00', '3939.00', '636', '2020-06-22 14:49:03', '2020-06-22 14:49:03');
INSERT INTO `product_skus` VALUES ('86', '31', 'occaecati', 'Eveniet facere autem numquam nisi temporibus.', '8682.00', '8682.00', '275', '2020-06-22 14:49:04', '2020-06-22 14:49:04');
INSERT INTO `product_skus` VALUES ('87', '31', 'tempora', 'Architecto tempore blanditiis sequi possimus adipisci sunt ut blanditiis.', '7090.00', '7090.00', '50', '2020-06-22 14:49:04', '2020-06-22 14:49:04');
INSERT INTO `product_skus` VALUES ('88', '31', 'maiores', 'Delectus repellendus odio voluptates cupiditate sit voluptates.', '5540.00', '5540.00', '184', '2020-06-22 14:49:04', '2020-06-22 14:49:04');
INSERT INTO `product_skus` VALUES ('89', '32', 'ut', 'Voluptates incidunt officiis at.', '6325.00', '6325.00', '768', '2020-06-22 14:49:04', '2020-06-22 14:49:04');
INSERT INTO `product_skus` VALUES ('90', '32', 'ullam', 'Eligendi voluptatum optio minima id dolores.', '6002.00', '6002.00', '310', '2020-06-22 14:49:04', '2020-06-22 14:49:04');
INSERT INTO `product_skus` VALUES ('91', '32', 'est', 'Et eligendi qui velit reprehenderit magni est qui.', '3225.00', '3225.00', '954', '2020-06-22 14:49:04', '2020-06-22 14:49:04');
INSERT INTO `product_skus` VALUES ('92', '33', 'laborum', 'Omnis aut quo sint molestiae necessitatibus quo.', '6748.00', '6748.00', '909', '2020-06-22 14:49:04', '2020-06-22 14:49:04');
INSERT INTO `product_skus` VALUES ('93', '33', 'et', 'Dolor vitae doloremque mollitia est laborum tenetur.', '5136.00', '5136.00', '788', '2020-06-22 14:49:04', '2020-06-22 14:49:04');
INSERT INTO `product_skus` VALUES ('94', '33', 'ad', 'Rerum dolorem est totam quasi.', '2218.00', '2218.00', '197', '2020-06-22 14:49:04', '2020-06-22 14:49:04');
INSERT INTO `product_skus` VALUES ('95', '34', 'minus', 'Illo impedit eum tempore.', '3459.00', '3459.00', '486', '2020-06-22 14:49:04', '2020-06-22 14:49:04');
INSERT INTO `product_skus` VALUES ('96', '34', 'doloribus', 'Labore et vel officiis possimus velit odio.', '7866.00', '7866.00', '940', '2020-06-22 14:49:04', '2020-06-22 14:49:04');
INSERT INTO `product_skus` VALUES ('97', '34', 'qui', 'Hic labore quia cupiditate natus in dolores.', '4512.00', '4512.00', '188', '2020-06-22 14:49:04', '2020-06-22 14:49:04');
INSERT INTO `product_skus` VALUES ('98', '35', 'eum', 'Ut doloremque at quis et voluptatibus eum.', '7338.00', '7338.00', '256', '2020-06-22 14:49:04', '2020-06-22 14:49:04');
INSERT INTO `product_skus` VALUES ('99', '35', 'libero', 'Nostrum tenetur iure voluptatem numquam atque hic ratione porro.', '4497.00', '4497.00', '779', '2020-06-22 14:49:04', '2020-06-22 14:49:04');
INSERT INTO `product_skus` VALUES ('100', '35', 'rerum', 'Praesentium inventore vel aut odit quo.', '7817.00', '7817.00', '984', '2020-06-22 14:49:04', '2020-06-22 14:49:04');
INSERT INTO `product_skus` VALUES ('101', '36', 'fugiat', 'Ipsum aut dolores dolores consequuntur.', '2935.00', '2935.00', '811', '2020-06-22 14:49:05', '2020-06-22 14:49:05');
INSERT INTO `product_skus` VALUES ('102', '36', 'dignissimos', 'Pariatur accusamus sit quae rem.', '6593.00', '6593.00', '26', '2020-06-22 14:49:05', '2020-06-22 14:49:05');
INSERT INTO `product_skus` VALUES ('103', '36', 'molestias', 'Quisquam cumque quia quis eligendi non.', '4581.00', '4581.00', '328', '2020-06-22 14:49:05', '2020-06-22 14:49:05');
INSERT INTO `product_skus` VALUES ('104', '37', 'distinctio', 'Cumque temporibus quas occaecati ut reiciendis.', '1107.00', '1107.00', '616', '2020-06-22 14:49:05', '2020-06-22 14:49:05');
INSERT INTO `product_skus` VALUES ('105', '37', 'maiores', 'Est molestias et et aut eum.', '1060.00', '1060.00', '760', '2020-06-22 14:49:05', '2020-06-22 14:49:05');
INSERT INTO `product_skus` VALUES ('106', '37', 'impedit', 'A necessitatibus harum labore rerum fugit.', '2801.00', '2801.00', '738', '2020-06-22 14:49:05', '2020-06-22 14:49:05');
INSERT INTO `product_skus` VALUES ('107', '38', 'placeat', 'Odit ratione ut porro consequuntur dolores reiciendis ab.', '4227.00', '4227.00', '661', '2020-06-22 14:49:05', '2020-06-22 14:49:05');
INSERT INTO `product_skus` VALUES ('108', '38', 'quisquam', 'Consequatur voluptatem rerum non doloremque expedita odio.', '9752.00', '9752.00', '813', '2020-06-22 14:49:05', '2020-06-22 14:49:05');
INSERT INTO `product_skus` VALUES ('109', '38', 'non', 'Veniam optio sint ratione quos ea.', '7553.00', '7553.00', '167', '2020-06-22 14:49:05', '2020-06-22 14:49:05');
INSERT INTO `product_skus` VALUES ('110', '39', 'optio', 'Dolorem nulla accusamus tempora voluptatem tenetur.', '1346.00', '1346.00', '5', '2020-06-22 14:49:05', '2020-06-22 14:49:05');
INSERT INTO `product_skus` VALUES ('111', '39', 'quia', 'Omnis alias architecto nesciunt eligendi qui aut.', '897.00', '897.00', '23', '2020-06-22 14:49:05', '2020-06-22 14:49:05');
INSERT INTO `product_skus` VALUES ('112', '39', 'minima', 'Nostrum recusandae voluptatem eveniet sed consequatur dicta dolores.', '708.00', '708.00', '664', '2020-06-22 14:49:05', '2020-06-22 14:49:05');
INSERT INTO `product_skus` VALUES ('113', '40', 'nihil', 'Beatae soluta sed minima.', '7471.00', '7471.00', '999', '2020-06-22 14:49:05', '2020-06-22 14:49:05');
INSERT INTO `product_skus` VALUES ('114', '40', 'ut', 'Voluptate aut sint consequuntur autem dolores.', '1449.00', '1449.00', '296', '2020-06-22 14:49:05', '2020-06-22 14:49:05');
INSERT INTO `product_skus` VALUES ('115', '40', 'harum', 'Facilis nisi natus voluptatem ut modi voluptatem.', '308.00', '308.00', '189', '2020-06-22 14:49:05', '2020-06-22 14:49:05');
INSERT INTO `product_skus` VALUES ('116', '41', 'possimus', 'Quia qui omnis ab sint nesciunt vitae.', '2937.00', '2937.00', '512', '2020-06-22 14:49:06', '2020-06-22 14:49:06');
INSERT INTO `product_skus` VALUES ('117', '41', 'reiciendis', 'Saepe provident quia harum dolor.', '2911.00', '2911.00', '25', '2020-06-22 14:49:06', '2020-06-22 14:49:06');
INSERT INTO `product_skus` VALUES ('118', '41', 'illum', 'In ut maiores adipisci aut.', '2650.00', '2650.00', '30', '2020-06-22 14:49:06', '2020-06-22 14:49:06');
INSERT INTO `product_skus` VALUES ('119', '42', 'distinctio', 'Ratione tenetur veritatis aut.', '6404.00', '6404.00', '65', '2020-06-22 14:49:06', '2020-06-22 14:49:06');
INSERT INTO `product_skus` VALUES ('120', '42', 'magnam', 'Quae enim hic iste est amet molestiae accusantium.', '321.00', '321.00', '246', '2020-06-22 14:49:06', '2020-06-22 14:49:06');
INSERT INTO `product_skus` VALUES ('121', '42', 'ducimus', 'Eos sint voluptates vel commodi et iure.', '5921.00', '5921.00', '729', '2020-06-22 14:49:06', '2020-06-22 14:49:06');
INSERT INTO `product_skus` VALUES ('122', '43', 'officia', 'Velit inventore voluptas tempore accusantium iusto.', '3534.00', '3534.00', '451', '2020-06-22 14:49:06', '2020-06-22 14:49:06');
INSERT INTO `product_skus` VALUES ('123', '43', 'sit', 'Ad doloribus sed iure et a.', '1392.00', '1392.00', '777', '2020-06-22 14:49:06', '2020-06-22 14:49:06');
INSERT INTO `product_skus` VALUES ('124', '43', 'placeat', 'Consequatur cum quia voluptas.', '8226.00', '8226.00', '49', '2020-06-22 14:49:06', '2020-06-22 14:49:06');
INSERT INTO `product_skus` VALUES ('125', '44', 'aut', 'Quasi sint aut et quod.', '1381.00', '1381.00', '741', '2020-06-22 14:49:06', '2020-06-22 14:49:06');
INSERT INTO `product_skus` VALUES ('126', '44', 'amet', 'Deserunt quis veniam numquam fugiat rerum.', '6340.00', '6340.00', '151', '2020-06-22 14:49:06', '2020-06-22 14:49:06');
INSERT INTO `product_skus` VALUES ('127', '44', 'corporis', 'Laudantium quia saepe exercitationem ipsa qui est eveniet.', '3130.00', '3130.00', '604', '2020-06-22 14:49:06', '2020-06-22 14:49:06');
INSERT INTO `product_skus` VALUES ('128', '45', 'eligendi', 'Et quia cupiditate officiis sint tempore distinctio.', '5135.00', '5135.00', '25', '2020-06-22 14:49:06', '2020-06-22 14:49:06');
INSERT INTO `product_skus` VALUES ('129', '45', 'architecto', 'Veritatis vitae accusantium temporibus sunt.', '8662.00', '8662.00', '991', '2020-06-22 14:49:06', '2020-06-22 14:49:06');
INSERT INTO `product_skus` VALUES ('130', '45', 'asperiores', 'Non accusantium qui autem praesentium est.', '6725.00', '6725.00', '445', '2020-06-22 14:49:06', '2020-06-22 14:49:06');
INSERT INTO `product_skus` VALUES ('131', '46', 'quia', 'Repellendus unde architecto qui aut et sunt.', '6485.00', '6485.00', '491', '2020-06-22 14:49:06', '2020-06-22 14:49:06');
INSERT INTO `product_skus` VALUES ('132', '46', 'natus', 'Dignissimos consectetur magnam ut qui sit consequatur sint.', '4848.00', '4848.00', '868', '2020-06-22 14:49:06', '2020-06-22 14:49:06');
INSERT INTO `product_skus` VALUES ('133', '46', 'consequatur', 'Tempore saepe nostrum tempore eius sint possimus illo.', '9787.00', '9787.00', '718', '2020-06-22 14:49:06', '2020-06-22 14:49:06');
INSERT INTO `product_skus` VALUES ('134', '47', 'minus', 'Officiis qui sequi sit quis.', '4111.00', '4111.00', '347', '2020-06-22 14:49:07', '2020-06-22 14:49:07');
INSERT INTO `product_skus` VALUES ('135', '47', 'eos', 'Ut reprehenderit totam est qui maiores non.', '7594.00', '7594.00', '790', '2020-06-22 14:49:07', '2020-06-22 14:49:07');
INSERT INTO `product_skus` VALUES ('136', '47', 'et', 'Rerum omnis dignissimos aliquid voluptatum.', '972.00', '972.00', '680', '2020-06-22 14:49:07', '2020-06-22 14:49:07');
INSERT INTO `product_skus` VALUES ('137', '48', 'laudantium', 'Nisi atque qui dolore qui quo sequi est.', '5739.00', '5739.00', '199', '2020-06-22 14:49:07', '2020-06-22 14:49:07');
INSERT INTO `product_skus` VALUES ('138', '48', 'quae', 'Impedit praesentium rem sequi repellat minus cupiditate et.', '1819.00', '1819.00', '221', '2020-06-22 14:49:07', '2020-06-22 14:49:07');
INSERT INTO `product_skus` VALUES ('139', '48', 'nihil', 'Est cupiditate eius accusantium dolores rerum.', '284.00', '284.00', '923', '2020-06-22 14:49:07', '2020-06-22 14:49:07');
INSERT INTO `product_skus` VALUES ('140', '49', 'rerum', 'Modi aliquam distinctio sint et sed.', '8251.00', '8251.00', '242', '2020-06-22 14:49:07', '2020-06-22 14:49:07');
INSERT INTO `product_skus` VALUES ('141', '49', 'accusamus', 'Et eaque vel totam dolores atque libero.', '2744.00', '2744.00', '391', '2020-06-22 14:49:07', '2020-06-22 14:49:07');
INSERT INTO `product_skus` VALUES ('142', '49', 'dolore', 'Corrupti ut non dolorem nemo nobis illum repudiandae.', '6265.00', '6265.00', '594', '2020-06-22 14:49:07', '2020-06-22 14:49:07');
INSERT INTO `product_skus` VALUES ('143', '50', 'natus', 'Ea ut rerum minima ea qui.', '6294.00', '6294.00', '30', '2020-06-22 14:49:07', '2020-06-22 14:49:07');
INSERT INTO `product_skus` VALUES ('144', '50', 'consequuntur', 'Veritatis nam et fugiat est non earum.', '2487.00', '2487.00', '867', '2020-06-22 14:49:07', '2020-06-22 14:49:07');
INSERT INTO `product_skus` VALUES ('145', '50', 'nam', 'Non quae ipsum labore quia quos temporibus numquam.', '8820.00', '8820.00', '165', '2020-06-22 14:49:07', '2020-06-22 14:49:07');
INSERT INTO `product_skus` VALUES ('146', '51', 'quasi', 'Perspiciatis unde nam dolor mollitia consequatur modi qui dicta.', '1415.00', '1415.00', '113', '2020-06-22 14:49:07', '2020-06-22 14:49:07');
INSERT INTO `product_skus` VALUES ('147', '51', 'asperiores', 'Velit voluptatem quae officia saepe quia tempora.', '2011.00', '2011.00', '14', '2020-06-22 14:49:07', '2020-06-22 14:49:07');
INSERT INTO `product_skus` VALUES ('148', '51', 'quia', 'Voluptas repellat eos rerum eveniet.', '6176.00', '6176.00', '362', '2020-06-22 14:49:07', '2020-06-22 14:49:07');
INSERT INTO `product_skus` VALUES ('149', '52', 'cumque', 'Fugit aut aut eos fugit dolor.', '6983.00', '6983.00', '765', '2020-06-22 14:49:08', '2020-06-22 14:49:08');
INSERT INTO `product_skus` VALUES ('150', '52', 'mollitia', 'Praesentium aperiam a nisi est illo sapiente.', '1859.00', '1859.00', '654', '2020-06-22 14:49:08', '2020-06-22 14:49:08');
INSERT INTO `product_skus` VALUES ('151', '52', 'ea', 'Voluptas consequatur esse eveniet possimus.', '7121.00', '7121.00', '709', '2020-06-22 14:49:08', '2020-06-22 14:49:08');
INSERT INTO `product_skus` VALUES ('152', '53', 'error', 'Assumenda repellendus non facilis officiis.', '8138.00', '8138.00', '124', '2020-06-22 14:49:08', '2020-06-22 14:49:08');
INSERT INTO `product_skus` VALUES ('153', '53', 'modi', 'Occaecati et totam et qui non.', '8542.00', '8542.00', '806', '2020-06-22 14:49:08', '2020-06-22 14:49:08');
INSERT INTO `product_skus` VALUES ('154', '53', 'ea', 'Ab quas quasi fugiat.', '948.00', '948.00', '156', '2020-06-22 14:49:08', '2020-06-22 14:49:08');
INSERT INTO `product_skus` VALUES ('155', '54', 'voluptas', 'Temporibus perspiciatis amet et et corrupti sint qui.', '4186.00', '4186.00', '633', '2020-06-22 14:49:08', '2020-06-22 14:49:08');
INSERT INTO `product_skus` VALUES ('156', '54', 'quae', 'Molestiae et ut voluptas quo qui et.', '2394.00', '2394.00', '256', '2020-06-22 14:49:08', '2020-06-22 14:49:08');
INSERT INTO `product_skus` VALUES ('157', '54', 'ea', 'Ut animi eos nihil eligendi sit explicabo maxime.', '5367.00', '5367.00', '487', '2020-06-22 14:49:08', '2020-06-22 14:49:08');
INSERT INTO `product_skus` VALUES ('158', '55', 'itaque', 'Et aut totam commodi labore sit eos.', '2281.00', '2281.00', '999', '2020-06-22 14:49:08', '2020-06-22 14:49:08');
INSERT INTO `product_skus` VALUES ('159', '55', 'eaque', 'Fugiat voluptatem quod non beatae dolorem.', '891.00', '891.00', '401', '2020-06-22 14:49:08', '2020-06-22 14:49:08');
INSERT INTO `product_skus` VALUES ('160', '55', 'quaerat', 'Ipsa expedita ut assumenda sed sed fugiat maxime.', '7532.00', '7532.00', '706', '2020-06-22 14:49:08', '2020-06-22 14:49:08');
INSERT INTO `product_skus` VALUES ('161', '58', 'iphone7', '11', '6000.00', '6000.00', '100', '2020-06-22 16:25:52', '2020-06-22 16:25:52');
INSERT INTO `product_skus` VALUES ('162', '59', '全自动', '全自动', '100.00', '100.00', '100', '2020-06-23 10:04:22', '2020-06-23 10:04:22');
INSERT INTO `product_skus` VALUES ('163', '60', '全自动', '全自动', '10000.00', '10000.00', '100', '2020-06-23 10:06:19', '2020-06-23 10:06:19');
INSERT INTO `product_skus` VALUES ('164', '61', 't470', 't470', '5000.00', '5000.00', '100', '2020-06-23 10:45:22', '2020-06-23 10:45:22');
INSERT INTO `product_skus` VALUES ('165', '62', '全自动', '全自动', '100.00', '100.00', '100', '2020-06-23 10:53:36', '2020-06-23 10:53:36');
INSERT INTO `product_skus` VALUES ('166', '63', '全自动', '全自动', '500.00', '500.00', '200', '2020-06-23 10:55:55', '2020-06-23 10:55:55');
INSERT INTO `product_skus` VALUES ('167', '64', '全自动', '全自动', '100.00', '100.00', '100', '2020-06-23 11:12:58', '2020-06-23 11:12:58');
INSERT INTO `product_skus` VALUES ('168', '65', '全自动', '全自动', '100.00', '200.00', '100', '2020-06-23 15:10:35', '2020-06-23 15:10:35');
INSERT INTO `product_skus` VALUES ('169', '66', '充电', '充电', '80.00', '100.00', '100', '2020-06-23 15:22:48', '2020-06-23 15:22:48');
INSERT INTO `product_skus` VALUES ('170', '67', '舒服', '舒服', '50.00', '100.00', '100', '2020-06-23 16:00:38', '2020-06-23 16:02:25');
INSERT INTO `product_skus` VALUES ('171', '68', '豪华', '豪华', '30.00', '80.00', '100', '2020-06-23 16:03:26', '2020-06-23 16:04:30');
INSERT INTO `product_skus` VALUES ('172', '69', '舒服', '舒服', '80.00', '100.00', '100', '2020-06-23 16:05:26', '2020-06-23 16:05:26');
INSERT INTO `product_skus` VALUES ('173', '70', '全自动', '全自动', '100.00', '100.00', '100', '2020-06-23 16:06:34', '2020-06-23 16:06:34');
INSERT INTO `product_skus` VALUES ('174', '70', '防水', '防水', '120.00', '120.00', '100', '2020-06-23 16:06:34', '2020-06-23 16:06:34');
INSERT INTO `product_skus` VALUES ('175', '71', '全自动', '全自动', '6000.00', '6000.00', '200', '2020-06-23 16:08:22', '2020-06-23 16:08:22');
INSERT INTO `product_skus` VALUES ('176', '72', '舒服', '舒服', '100.00', '100.00', '100', '2020-06-23 16:09:55', '2020-06-23 16:09:55');
INSERT INTO `product_skus` VALUES ('177', '74', '8GB+128GB', '8GB+128GB', '3900.00', '4200.00', '100', '2020-06-24 15:51:51', '2020-06-24 15:51:51');
INSERT INTO `product_skus` VALUES ('178', '75', 'EOS 90D 机身', 'EOS 90D 机身', '7500.00', '8000.00', '100', '2020-06-24 15:57:54', '2020-07-09 11:14:03');
INSERT INTO `product_skus` VALUES ('179', '76', '金色铝金属表壳', '运动型表带', '3000.00', '3200.00', '100', '2020-06-24 16:05:05', '2020-07-09 14:15:22');
INSERT INTO `product_skus` VALUES ('180', '77', 'ps4', 'ps4', '5000.00', '6000.00', '100', '2020-06-24 16:10:37', '2020-06-24 16:10:37');
INSERT INTO `product_skus` VALUES ('181', '78', 'i5-8-256', '酷睿 i5/8GB/256GB/13.5英寸', '12000.00', '14000.00', '11', '2020-06-24 16:20:04', '2020-06-24 16:20:04');
INSERT INTO `product_skus` VALUES ('182', '79', '纽曼DL-88', '纽曼DL-88', '350.00', '350.00', '99', '2020-06-24 17:22:41', '2020-07-09 17:44:07');
INSERT INTO `product_skus` VALUES ('183', '80', 'Pro 5G', 'Pro 5G', '5000.00', '5000.00', '100', '2020-06-24 17:27:18', '2020-06-24 17:27:18');
INSERT INTO `product_skus` VALUES ('184', '81', '无线蓝牙', '无线蓝牙', '1000.00', '1000.00', '100', '2020-06-25 08:06:22', '2020-06-25 08:06:22');
INSERT INTO `product_skus` VALUES ('185', '82', '三星', '三星', '2800.00', '2800.00', '100', '2020-06-25 08:12:40', '2020-06-25 08:12:40');
INSERT INTO `product_skus` VALUES ('186', '83', 'i79700', '16G', '12500.00', '12500.00', '5', '2020-06-25 08:16:56', '2020-06-25 08:16:56');
INSERT INTO `product_skus` VALUES ('187', '84', 'Xeon Silver 4110', 'Xeon Silver 4110', '22000.00', '22000.00', '100', '2020-06-25 08:22:14', '2020-06-25 08:22:14');
INSERT INTO `product_skus` VALUES ('188', '85', '55英寸4K', '55英寸4K', '5000.00', '5000.00', '100', '2020-06-25 11:05:34', '2020-06-25 11:05:34');
INSERT INTO `product_skus` VALUES ('189', '86', '多联机一拖七', '多联机一拖七', '50000.00', '50000.00', '5', '2020-06-25 11:09:27', '2020-06-25 11:09:27');
INSERT INTO `product_skus` VALUES ('190', '87', '彩色200万', '彩色200万', '1400.00', '1400.00', '100', '2020-06-25 11:12:33', '2020-06-25 11:12:33');
INSERT INTO `product_skus` VALUES ('191', '88', 'RAM768MB ROM4GB', 'RAM：768MB ROM：4GB', '3000.00', '3000.00', '11', '2020-06-25 11:16:24', '2020-06-25 11:16:24');
INSERT INTO `product_skus` VALUES ('192', '89', '遥控', '遥控干湿两用', '3000.00', '3000.00', '100', '2020-06-25 11:21:01', '2020-06-25 11:21:01');
INSERT INTO `product_skus` VALUES ('193', '90', '8GB/128GB', '8GB/128GB', '3000.00', '3000.00', '100', '2020-06-25 12:21:00', '2020-06-25 12:21:00');
INSERT INTO `product_skus` VALUES ('194', '91', '12G128G', '12G128G', '3000.00', '3000.00', '100', '2020-06-25 12:25:06', '2020-06-25 12:25:06');
INSERT INTO `product_skus` VALUES ('195', '92', '8-128', '8-128', '3000.00', '3000.00', '100', '2020-06-25 12:27:35', '2020-06-25 12:27:35');
INSERT INTO `product_skus` VALUES ('196', '93', '454*454像素', '454*454像素', '800.00', '800.00', '100', '2020-06-25 12:32:56', '2020-06-25 12:32:56');
INSERT INTO `product_skus` VALUES ('197', '94', '4G', '4G', '3000.00', '3000.00', '100', '2020-06-25 12:37:44', '2020-06-25 12:37:44');
INSERT INTO `product_skus` VALUES ('198', '95', '高通骁龙 Wear 2500', '高通骁龙 Wear 2500', '800.00', '800.00', '100', '2020-06-25 12:41:32', '2020-06-25 12:41:32');
INSERT INTO `product_skus` VALUES ('199', '96', '先锋版', '先锋版', '3000.00', '3000.00', '11', '2020-06-25 12:48:25', '2020-07-14 16:05:59');
INSERT INTO `product_skus` VALUES ('200', '97', 'iphone-x', 'iphone-x', '8000.00', '8000.00', '100', '2020-06-25 12:53:50', '2020-06-25 12:53:50');
INSERT INTO `product_skus` VALUES ('201', '98', '32GB', '32GB', '8000.00', '8000.00', '5', '2020-06-25 14:13:51', '2020-06-25 14:13:51');
INSERT INTO `product_skus` VALUES ('202', '99', '银黑色', '银黑色', '349.00', '699.00', '100', '2020-06-25 17:53:40', '2020-07-15 15:58:26');
INSERT INTO `product_skus` VALUES ('203', '100', '官方标配', '官方标配', '89.00', '179.00', '100', '2020-06-25 17:59:16', '2020-06-25 17:59:16');
INSERT INTO `product_skus` VALUES ('204', '101', 'R5/16GB/512G SSD/集成显卡', 'Air 14 2020', '5000.00', '4000.00', '11', '2020-06-25 18:03:08', '2020-06-25 18:03:08');
INSERT INTO `product_skus` VALUES ('205', '102', '十代i5/8GB板载+8GB', '十代i5/8GB板载+8GB', '3000.00', '6000.00', '100', '2020-06-25 18:06:43', '2020-06-25 18:06:43');
INSERT INTO `product_skus` VALUES ('206', '103', '4G+64G', '4G+64G', '2000.00', '1600.00', '100', '2020-06-25 18:09:56', '2020-06-25 18:09:56');
INSERT INTO `product_skus` VALUES ('207', '104', '4TB*2', '4TB*2', '600.00', '800.00', '100', '2020-06-25 18:15:06', '2020-06-25 18:15:06');
INSERT INTO `product_skus` VALUES ('208', '105', 'A1', 'A1', '1500.00', '3000.00', '5', '2020-06-25 18:19:14', '2020-06-25 18:19:14');
INSERT INTO `product_skus` VALUES ('209', '106', '适配器', '适配器', '300.00', '600.00', '100', '2020-06-25 18:54:30', '2020-06-25 18:54:30');
INSERT INTO `product_skus` VALUES ('210', '107', 'i7含背光键盘', 'i7含背光键盘', '7000.00', '10000.00', '11', '2020-06-25 18:58:02', '2020-06-25 18:58:02');
INSERT INTO `product_skus` VALUES ('211', '108', '乐迪早教机器人', '乐迪早教机器人', '300.00', '300.00', '997', '2020-06-25 19:17:42', '2020-07-14 16:52:42');
INSERT INTO `product_skus` VALUES ('212', '109', '8GB/128GB', '8GB/128GB', '1500.00', '2000.00', '100', '2020-07-13 11:01:01', '2020-07-13 11:01:01');
INSERT INTO `product_skus` VALUES ('213', '110', '8GB/128GB', '8GB/128GB', '3000.00', '5000.00', '100', '2020-07-13 11:02:34', '2020-07-13 11:02:34');
INSERT INTO `product_skus` VALUES ('214', '111', '12GB/128GB', '12GB/128GB', '5000.00', '6000.00', '11', '2020-07-13 11:04:09', '2020-07-13 11:04:09');
INSERT INTO `product_skus` VALUES ('215', '112', '6GB/128GB', '6GB/128GB', '3000.00', '4000.00', '22', '2020-07-13 11:05:42', '2020-07-13 11:05:42');
INSERT INTO `product_skus` VALUES ('216', '113', '4GB/64GB', '4GB/64GB', '6000.00', '6000.00', '20', '2020-08-05 10:22:09', '2020-08-05 14:59:08');
INSERT INTO `product_skus` VALUES ('217', '113', '4GB/32GB', '4GB/32GB', '5000.00', '5000.00', '20', '2020-08-05 15:15:14', '2020-08-05 15:15:58');
INSERT INTO `product_skus` VALUES ('224', '114', '小米L65M5-OD', '小米L65M5-OD', '13000.00', '13000.00', '100', '2020-08-06 09:06:55', '2020-08-06 09:06:55');
INSERT INTO `product_skus` VALUES ('228', '118', 'MR9U2CH/A', 'Intel 酷睿i5 8259U', '10000.00', '12000.00', '20', '2020-08-06 11:12:59', '2020-08-06 11:12:59');
INSERT INTO `product_skus` VALUES ('231', '121', '8GB/128GB', '8GB/128GB', '3600.00', '4000.00', '20', '2020-08-06 15:46:31', '2020-08-07 16:39:54');

-- ----------------------------
-- Table structure for `seckill_products`
-- ----------------------------
DROP TABLE IF EXISTS `seckill_products`;
CREATE TABLE `seckill_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `start_at` datetime NOT NULL,
  `end_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `seckill_products_product_id_foreign` (`product_id`),
  CONSTRAINT `seckill_products_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of seckill_products
-- ----------------------------
INSERT INTO `seckill_products` VALUES ('1', '64', '2020-07-12 12:00:00', '2020-07-28 12:00:00');
INSERT INTO `seckill_products` VALUES ('2', '72', '2020-07-12 12:00:00', '2020-07-28 12:00:00');
INSERT INTO `seckill_products` VALUES ('3', '99', '2020-07-16 14:15:13', '2020-07-28 12:00:00');
INSERT INTO `seckill_products` VALUES ('4', '100', '2020-07-12 12:00:00', '2020-07-28 12:00:00');
INSERT INTO `seckill_products` VALUES ('5', '101', '2020-07-12 12:00:00', '2020-07-28 12:00:00');
INSERT INTO `seckill_products` VALUES ('6', '102', '2020-07-12 12:00:00', '2020-07-28 12:00:00');
INSERT INTO `seckill_products` VALUES ('7', '103', '2020-07-12 12:00:00', '2020-07-28 12:00:00');
INSERT INTO `seckill_products` VALUES ('8', '104', '2020-07-12 12:00:00', '2020-07-28 12:00:00');
INSERT INTO `seckill_products` VALUES ('9', '105', '2020-07-12 12:00:00', '2020-07-28 12:00:00');
INSERT INTO `seckill_products` VALUES ('10', '106', '2020-07-12 12:00:00', '2020-07-28 12:00:00');
INSERT INTO `seckill_products` VALUES ('11', '107', '2020-07-12 12:00:00', '2020-07-28 12:00:00');
INSERT INTO `seckill_products` VALUES ('14', '118', '2020-08-10 11:04:34', '2020-08-31 11:04:39');
INSERT INTO `seckill_products` VALUES ('15', '121', '2020-08-08 13:54:18', '2020-08-18 00:00:00');

-- ----------------------------
-- Table structure for `shops`
-- ----------------------------
DROP TABLE IF EXISTS `shops`;
CREATE TABLE `shops` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cert` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of shops
-- ----------------------------

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weixin_openid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weixin_unionid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `introduction` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_phone_unique` (`phone`),
  UNIQUE KEY `users_weixin_openid_unique` (`weixin_openid`),
  UNIQUE KEY `users_weixin_unionid_unique` (`weixin_unionid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'guoguo', null, '250411626@qq.com', null, '2020-07-30 16:39:18', '$2y$10$77WmnfuBqZgnpVDtF3zee.MU6hPBWTOJ/Vkrzixx9oxUUEBHfSH7G', null, null, null, '2020-07-30 16:39:18', '2020-07-30 16:39:18', null, null);
INSERT INTO `users` VALUES ('2', 'guo', null, 'jn1039@163.com', null, null, '$2y$10$SnoWBhIihG/sPH5qvg8NxOYn0vsO0exF.1ARy9avCiWeBxOBPBETe', null, null, null, '2020-08-03 10:14:56', '2020-08-03 10:14:56', null, null);

-- ----------------------------
-- Table structure for `user_addresses`
-- ----------------------------
DROP TABLE IF EXISTS `user_addresses`;
CREATE TABLE `user_addresses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `province` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `district` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip` int(10) unsigned NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_used_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_addresses_user_id_foreign` (`user_id`),
  CONSTRAINT `user_addresses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user_addresses
-- ----------------------------
INSERT INTO `user_addresses` VALUES ('1', '1', '江苏省', '南京市', '浦口区', '384200', '第68街道第847号', '汪涛', '18485197712', null, '2020-06-17 15:32:22', '2020-06-17 15:32:22');
INSERT INTO `user_addresses` VALUES ('2', '1', '广东省', '深圳市', '福田区', '837000', '第14街道第110号', '喻勇', '18765645898', null, '2020-06-17 15:32:22', '2020-06-17 15:32:22');
INSERT INTO `user_addresses` VALUES ('3', '1', '山东省', '济南市', '历下区', '442700', '第36街道第514号', '卞浩', '15318175060', null, '2020-06-17 15:32:23', '2020-06-17 15:32:23');
INSERT INTO `user_addresses` VALUES ('4', '1', '江苏省', '南京市', '浦口区', '151300', '第26街道第204号', '梅建华', '13278354425', null, '2020-06-17 15:32:23', '2020-06-17 15:32:23');
INSERT INTO `user_addresses` VALUES ('5', '1', '北京市', '市辖区', '昌平区', '856800', '第92街道第318号', '沙婷', '18854894726', null, '2020-06-17 15:32:23', '2020-06-17 15:32:23');
INSERT INTO `user_addresses` VALUES ('6', '1', '山东省', '济南市', '历下区', '321100', '第3街道第218号', '蔺春梅', '18918683997', null, '2020-06-17 15:32:23', '2020-06-17 15:32:23');
INSERT INTO `user_addresses` VALUES ('7', '1', '北京市', '市辖区', '昌平区', '600006', '王府大街101号', '米小圈', '15165108626', null, '2020-06-18 10:12:37', '2020-06-18 10:13:00');
INSERT INTO `user_addresses` VALUES ('9', '1', '广东省', '珠海市', '金湾区', '114006', '泉城广场11号', '李军', '15165108623', null, '2020-06-18 10:15:55', '2020-06-18 10:15:55');

-- ----------------------------
-- Table structure for `user_favorite_products`
-- ----------------------------
DROP TABLE IF EXISTS `user_favorite_products`;
CREATE TABLE `user_favorite_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_favorite_products_user_id_foreign` (`user_id`),
  KEY `user_favorite_products_product_id_foreign` (`product_id`),
  CONSTRAINT `user_favorite_products_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_favorite_products_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user_favorite_products
-- ----------------------------
INSERT INTO `user_favorite_products` VALUES ('1', '1', '75', '2020-07-08 10:52:52', '2020-07-08 10:52:52');
INSERT INTO `user_favorite_products` VALUES ('4', '1', '76', '2020-07-08 10:54:12', '2020-07-08 10:54:12');
INSERT INTO `user_favorite_products` VALUES ('6', '1', '96', '2020-07-13 13:22:28', '2020-07-13 13:22:28');
INSERT INTO `user_favorite_products` VALUES ('8', '1', '98', '2020-07-13 14:02:16', '2020-07-13 14:02:16');
INSERT INTO `user_favorite_products` VALUES ('9', '1', '97', '2020-07-13 16:06:42', '2020-07-13 16:06:42');
INSERT INTO `user_favorite_products` VALUES ('10', '1', '93', '2020-07-13 16:06:55', '2020-07-13 16:06:55');
INSERT INTO `user_favorite_products` VALUES ('11', '1', '74', '2020-07-13 16:14:13', '2020-07-13 16:14:13');
INSERT INTO `user_favorite_products` VALUES ('12', '1', '88', '2020-07-13 16:41:56', '2020-07-13 16:41:56');
INSERT INTO `user_favorite_products` VALUES ('13', '1', '95', '2020-07-13 16:43:35', '2020-07-13 16:43:35');
INSERT INTO `user_favorite_products` VALUES ('16', '1', '79', '2020-07-22 14:07:46', '2020-07-22 14:07:46');
