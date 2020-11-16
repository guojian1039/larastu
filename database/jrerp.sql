/*
Navicat MySQL Data Transfer

Source Server         : www
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : jrerp

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2020-11-16 14:05:39
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
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_menu
-- ----------------------------
INSERT INTO `admin_menu` VALUES ('1', '0', '1', 'Index', 'feather icon-bar-chart-2', '/', '2020-07-29 02:27:24', null);
INSERT INTO `admin_menu` VALUES ('2', '0', '16', '系统管理', 'feather icon-settings', null, '2020-07-29 02:27:24', '2020-10-14 11:06:18');
INSERT INTO `admin_menu` VALUES ('3', '2', '17', '管理员', null, 'auth/users', '2020-07-29 02:27:24', '2020-10-14 11:06:18');
INSERT INTO `admin_menu` VALUES ('4', '2', '18', '角色', null, 'auth/roles', '2020-07-29 02:27:24', '2020-10-14 11:06:18');
INSERT INTO `admin_menu` VALUES ('5', '2', '19', '权限', null, 'auth/permissions', '2020-07-29 02:27:24', '2020-10-14 11:06:18');
INSERT INTO `admin_menu` VALUES ('6', '2', '20', '菜单管理', null, 'auth/menu', '2020-07-29 02:27:24', '2020-10-14 11:06:18');
INSERT INTO `admin_menu` VALUES ('7', '2', '21', '操作日志', null, 'auth/logs', '2020-07-29 02:27:24', '2020-10-14 11:06:18');
INSERT INTO `admin_menu` VALUES ('8', '0', '2', '用户管理', 'fa-user', '/users', '2020-08-03 10:05:08', '2020-08-03 10:05:23');
INSERT INTO `admin_menu` VALUES ('9', '21', '10', '分类管理', 'fa-bars', '/categories', '2020-08-04 10:18:43', '2020-09-16 09:48:55');
INSERT INTO `admin_menu` VALUES ('10', '26', '26', 'PC端广告管理', 'fa-archive', '/ads', '2020-08-04 16:00:05', '2020-10-14 11:06:18');
INSERT INTO `admin_menu` VALUES ('11', '21', '12', '品牌管理', 'fa-500px', '/brands', '2020-08-04 16:56:09', '2020-09-16 13:18:12');
INSERT INTO `admin_menu` VALUES ('12', '0', '3', '商品管理', 'fa-cubes', null, '2020-08-04 17:10:56', '2020-09-16 09:48:55');
INSERT INTO `admin_menu` VALUES ('13', '12', '4', '普通商品', 'fa-cubes', '/products', '2020-08-04 17:11:17', '2020-09-16 09:48:55');
INSERT INTO `admin_menu` VALUES ('14', '12', '5', '众筹商品', 'fa-flag-checkered', '/crowdfunding_products', '2020-08-05 17:18:07', '2020-09-16 09:48:55');
INSERT INTO `admin_menu` VALUES ('15', '12', '6', '秒杀商品', 'fa-bolt', '/seckill_products', '2020-08-05 17:32:09', '2020-09-16 09:48:55');
INSERT INTO `admin_menu` VALUES ('16', '12', '7', '活动商品', 'fa-camera-retro', '/active_products', '2020-08-06 12:53:42', '2020-09-16 09:48:55');
INSERT INTO `admin_menu` VALUES ('17', '12', '8', '折扣商品', 'fa-shield', '/discount_products', '2020-08-06 13:14:07', '2020-09-16 09:48:55');
INSERT INTO `admin_menu` VALUES ('18', '0', '15', '优惠券', 'fa-tags', '/coupon_codes', '2020-08-10 14:36:25', '2020-10-14 11:06:18');
INSERT INTO `admin_menu` VALUES ('19', '0', '14', '订单管理', 'fa-rmb', '/orders', '2020-08-10 15:04:59', '2020-09-16 13:18:12');
INSERT INTO `admin_menu` VALUES ('20', '26', '27', 'PHONE端广告管理', 'fa-area-chart', '/advs', '2020-08-19 15:35:04', '2020-10-14 11:06:18');
INSERT INTO `admin_menu` VALUES ('21', '0', '9', '商品配置', 'fa-film', null, '2020-09-16 09:47:39', '2020-09-16 09:48:55');
INSERT INTO `admin_menu` VALUES ('22', '0', '22', '营销管理', 'fa-money', null, '2020-09-16 09:50:06', '2020-10-14 11:06:18');
INSERT INTO `admin_menu` VALUES ('23', '21', '11', '分类属性', 'fa-cc', '/base_properties', '2020-09-16 10:14:25', '2020-09-16 13:18:12');
INSERT INTO `admin_menu` VALUES ('24', '21', '13', '供应商', 'fa-cube', '/suppliers', '2020-09-16 11:17:33', '2020-09-16 13:18:12');
INSERT INTO `admin_menu` VALUES ('25', '22', '23', '优惠券', 'fa-wpforms', '/coupon_types', '2020-09-18 16:56:48', '2020-10-14 11:06:18');
INSERT INTO `admin_menu` VALUES ('26', '0', '25', '网站管理', 'fa-bullseye', null, '2020-09-18 16:58:00', '2020-09-18 16:58:19');
INSERT INTO `admin_menu` VALUES ('27', '26', '28', '帮助分类', 'fa-align-justify', '/sitehelp_types', '2020-09-22 09:46:47', '2020-10-14 11:06:18');
INSERT INTO `admin_menu` VALUES ('28', '26', '29', '帮助信息', 'fa-align-justify', '/sitehelps', '2020-09-22 09:51:12', '2020-10-14 11:06:18');
INSERT INTO `admin_menu` VALUES ('29', '26', '30', '意见反馈', 'fa-align-justify', '/site_opinions', '2020-09-22 11:17:49', '2020-10-14 11:06:18');
INSERT INTO `admin_menu` VALUES ('30', '22', '24', '通知公告', 'fa-align-justify', '/announces', '2020-09-23 11:00:18', '2020-10-14 11:06:18');
INSERT INTO `admin_menu` VALUES ('31', '0', '31', '新闻管理', 'fa-align-justify', null, '2020-10-10 16:30:46', '2020-10-10 16:30:46');
INSERT INTO `admin_menu` VALUES ('32', '31', '32', '新闻分类', 'fa-align-justify', '/news_category', '2020-10-10 16:31:15', '2020-10-10 16:31:15');
INSERT INTO `admin_menu` VALUES ('33', '31', '33', '新闻列表', 'fa-adjust', '/news', '2020-10-10 17:12:24', '2020-10-10 17:12:24');
INSERT INTO `admin_menu` VALUES ('34', '0', '34', '金融管理', 'fa-align-justify', '/borrows', '2020-10-14 11:05:19', '2020-10-14 11:05:19');
INSERT INTO `admin_menu` VALUES ('35', '34', '35', '融资主体', 'fa-align-justify', '/companies', '2020-10-14 11:05:58', '2020-10-14 11:06:18');
INSERT INTO `admin_menu` VALUES ('36', '34', '36', '融资列表', 'fa-align-justify', '/borrows', '2020-10-14 11:19:30', '2020-10-14 11:19:48');

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
) ENGINE=MyISAM AUTO_INCREMENT=4497 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_operation_log
-- ----------------------------
INSERT INTO `admin_operation_log` VALUES ('4369', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-10-23 10:58:44', '2020-10-23 10:58:44');
INSERT INTO `admin_operation_log` VALUES ('4370', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-10-27 10:37:43', '2020-10-27 10:37:43');
INSERT INTO `admin_operation_log` VALUES ('4371', '1', 'admin/coupon_types', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-27 10:38:08', '2020-10-27 10:38:08');
INSERT INTO `admin_operation_log` VALUES ('4372', '1', 'admin/coupon_types/6/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-27 10:38:43', '2020-10-27 10:38:43');
INSERT INTO `admin_operation_log` VALUES ('4373', '1', 'admin/coupon_types', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-27 10:47:27', '2020-10-27 10:47:27');
INSERT INTO `admin_operation_log` VALUES ('4374', '1', 'admin/coupon_types/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-27 10:47:32', '2020-10-27 10:47:32');
INSERT INTO `admin_operation_log` VALUES ('4375', '1', 'admin/coupon_types', 'POST', '127.0.0.1', '{\"title\":\"\\u6ee15000\\u51cf50\",\"count\":\"6\",\"type\":\"1\",\"value\":\"10\",\"at_least\":\"5000\",\"need_user_level\":\"1\",\"get_start_time\":\"2020-10-28 10:48:12\",\"get_end_time\":\"2020-11-09 10:48:18\",\"range_type\":\"1\",\"product\":null,\"term_of_validity_type\":\"0\",\"start_time\":\"2020-11-16 10:48:33\",\"end_time\":\"2020-11-30 10:48:42\",\"fixed_term\":\"1\",\"status\":\"1\",\"_token\":\"uuSo2G7MiKW8IxEuRZsSymdD6ZKfYMI0T0TK5JWY\",\"_previous_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/coupon_types\"}', '2020-10-27 10:48:55', '2020-10-27 10:48:55');
INSERT INTO `admin_operation_log` VALUES ('4376', '1', 'admin/coupon_types', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-27 10:48:59', '2020-10-27 10:48:59');
INSERT INTO `admin_operation_log` VALUES ('4377', '1', 'admin/coupon_types/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-27 14:31:18', '2020-10-27 14:31:18');
INSERT INTO `admin_operation_log` VALUES ('4378', '1', 'admin/coupon_types/create', 'GET', '127.0.0.1', '[]', '2020-10-27 14:46:02', '2020-10-27 14:46:02');
INSERT INTO `admin_operation_log` VALUES ('4379', '1', 'admin/coupon_types/create', 'GET', '127.0.0.1', '[]', '2020-10-27 14:49:17', '2020-10-27 14:49:17');
INSERT INTO `admin_operation_log` VALUES ('4380', '1', 'admin/coupon_types/create', 'GET', '127.0.0.1', '[]', '2020-10-27 14:49:39', '2020-10-27 14:49:39');
INSERT INTO `admin_operation_log` VALUES ('4381', '1', 'admin/coupon_types/create', 'GET', '127.0.0.1', '[]', '2020-10-27 14:51:45', '2020-10-27 14:51:45');
INSERT INTO `admin_operation_log` VALUES ('4382', '1', 'admin/coupon_types/create', 'GET', '127.0.0.1', '[]', '2020-10-27 14:52:36', '2020-10-27 14:52:36');
INSERT INTO `admin_operation_log` VALUES ('4383', '1', 'admin/coupon_types/create', 'GET', '127.0.0.1', '[]', '2020-10-27 15:05:44', '2020-10-27 15:05:44');
INSERT INTO `admin_operation_log` VALUES ('4384', '1', 'admin/coupon_types/create', 'GET', '127.0.0.1', '[]', '2020-10-27 15:08:36', '2020-10-27 15:08:36');
INSERT INTO `admin_operation_log` VALUES ('4385', '1', 'admin/coupon_types/create', 'GET', '127.0.0.1', '[]', '2020-10-27 15:10:23', '2020-10-27 15:10:23');
INSERT INTO `admin_operation_log` VALUES ('4386', '1', 'admin/coupon_types/create', 'GET', '127.0.0.1', '[]', '2020-10-27 15:10:56', '2020-10-27 15:10:56');
INSERT INTO `admin_operation_log` VALUES ('4387', '1', 'admin/coupon_types/create', 'GET', '127.0.0.1', '[]', '2020-10-27 15:11:08', '2020-10-27 15:11:08');
INSERT INTO `admin_operation_log` VALUES ('4388', '1', 'admin/coupon_types/create', 'GET', '127.0.0.1', '[]', '2020-10-27 15:11:42', '2020-10-27 15:11:42');
INSERT INTO `admin_operation_log` VALUES ('4389', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-27 15:46:31', '2020-10-27 15:46:31');
INSERT INTO `admin_operation_log` VALUES ('4390', '1', 'admin/orders/29', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-27 15:46:35', '2020-10-27 15:46:35');
INSERT INTO `admin_operation_log` VALUES ('4391', '1', 'admin/orders/29/ship', 'POST', '127.0.0.1', '{\"_token\":\"yULgoZct0fBi7yfv1suoA81veo7PmcQ4lVDdhu1f\",\"express_company\":\"\\u83dc\\u9e1f\\u7269\\u6d41\",\"express_no\":\"cn0002\"}', '2020-10-27 15:46:45', '2020-10-27 15:46:45');
INSERT INTO `admin_operation_log` VALUES ('4392', '1', 'admin/coupon_types/create', 'GET', '127.0.0.1', '[]', '2020-10-27 15:46:46', '2020-10-27 15:46:46');
INSERT INTO `admin_operation_log` VALUES ('4393', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-27 15:46:52', '2020-10-27 15:46:52');
INSERT INTO `admin_operation_log` VALUES ('4394', '1', 'admin/orders/29', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-27 15:46:54', '2020-10-27 15:46:54');
INSERT INTO `admin_operation_log` VALUES ('4395', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-27 15:48:38', '2020-10-27 15:48:38');
INSERT INTO `admin_operation_log` VALUES ('4396', '1', 'admin/orders/29', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-27 15:48:42', '2020-10-27 15:48:42');
INSERT INTO `admin_operation_log` VALUES ('4397', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-10-29 10:32:36', '2020-10-29 10:32:36');
INSERT INTO `admin_operation_log` VALUES ('4398', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-29 10:32:43', '2020-10-29 10:32:43');
INSERT INTO `admin_operation_log` VALUES ('4399', '1', 'admin/orders/34', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-29 10:32:48', '2020-10-29 10:32:48');
INSERT INTO `admin_operation_log` VALUES ('4400', '1', 'admin/orders/34/ship', 'POST', '127.0.0.1', '{\"_token\":\"tRLRNtXXijBhm7b8t3XupHnmcb1d9lnBIf9ARWLo\",\"express_company\":\"\\u83dc\\u9e1f\\u7269\\u6d41\",\"express_no\":\"cn0005\"}', '2020-10-29 10:32:56', '2020-10-29 10:32:56');
INSERT INTO `admin_operation_log` VALUES ('4401', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-10-29 10:32:57', '2020-10-29 10:32:57');
INSERT INTO `admin_operation_log` VALUES ('4402', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-29 10:35:50', '2020-10-29 10:35:50');
INSERT INTO `admin_operation_log` VALUES ('4403', '1', 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-10-29 10:35:52', '2020-10-29 10:35:52');
INSERT INTO `admin_operation_log` VALUES ('4404', '1', 'admin/orders/33', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-29 10:35:54', '2020-10-29 10:35:54');
INSERT INTO `admin_operation_log` VALUES ('4405', '1', 'admin/orders/33/ship', 'POST', '127.0.0.1', '{\"_token\":\"tRLRNtXXijBhm7b8t3XupHnmcb1d9lnBIf9ARWLo\",\"express_company\":\"\\u83dc\\u9e1f\\u7269\\u6d41\",\"express_no\":\"cn0006\"}', '2020-10-29 10:36:02', '2020-10-29 10:36:02');
INSERT INTO `admin_operation_log` VALUES ('4406', '1', 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-10-29 10:36:02', '2020-10-29 10:36:02');
INSERT INTO `admin_operation_log` VALUES ('4407', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-29 10:39:04', '2020-10-29 10:39:04');
INSERT INTO `admin_operation_log` VALUES ('4408', '1', 'admin/orders/34', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-29 10:39:06', '2020-10-29 10:39:06');
INSERT INTO `admin_operation_log` VALUES ('4409', '1', 'admin/orders/34', 'GET', '127.0.0.1', '[]', '2020-10-29 10:43:06', '2020-10-29 10:43:06');
INSERT INTO `admin_operation_log` VALUES ('4410', '1', 'admin/orders/34', 'GET', '127.0.0.1', '[]', '2020-10-29 10:43:11', '2020-10-29 10:43:11');
INSERT INTO `admin_operation_log` VALUES ('4411', '1', 'admin/orders/34', 'GET', '127.0.0.1', '[]', '2020-10-29 10:54:24', '2020-10-29 10:54:24');
INSERT INTO `admin_operation_log` VALUES ('4412', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-29 10:55:13', '2020-10-29 10:55:13');
INSERT INTO `admin_operation_log` VALUES ('4413', '1', 'admin/orders/33', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-29 10:55:35', '2020-10-29 10:55:35');
INSERT INTO `admin_operation_log` VALUES ('4414', '1', 'admin/orders/33', 'GET', '127.0.0.1', '[]', '2020-10-29 10:59:30', '2020-10-29 10:59:30');
INSERT INTO `admin_operation_log` VALUES ('4415', '1', 'admin/orders/33', 'GET', '127.0.0.1', '[]', '2020-10-29 10:59:45', '2020-10-29 10:59:45');
INSERT INTO `admin_operation_log` VALUES ('4416', '1', 'admin/orders/33', 'GET', '127.0.0.1', '[]', '2020-10-29 11:00:14', '2020-10-29 11:00:14');
INSERT INTO `admin_operation_log` VALUES ('4417', '1', 'admin/orders/33', 'GET', '127.0.0.1', '[]', '2020-10-29 11:03:28', '2020-10-29 11:03:28');
INSERT INTO `admin_operation_log` VALUES ('4418', '1', 'admin/orders/33', 'GET', '127.0.0.1', '[]', '2020-10-29 11:07:21', '2020-10-29 11:07:21');
INSERT INTO `admin_operation_log` VALUES ('4419', '1', 'admin/orders/33', 'GET', '127.0.0.1', '[]', '2020-10-29 11:08:11', '2020-10-29 11:08:11');
INSERT INTO `admin_operation_log` VALUES ('4420', '1', 'admin/orders/33', 'GET', '127.0.0.1', '[]', '2020-10-29 11:08:19', '2020-10-29 11:08:19');
INSERT INTO `admin_operation_log` VALUES ('4421', '1', 'admin/orders/33', 'GET', '127.0.0.1', '[]', '2020-10-29 11:09:44', '2020-10-29 11:09:44');
INSERT INTO `admin_operation_log` VALUES ('4422', '1', 'admin/orders/33', 'GET', '127.0.0.1', '[]', '2020-10-29 11:11:01', '2020-10-29 11:11:01');
INSERT INTO `admin_operation_log` VALUES ('4423', '1', 'admin/orders/33', 'GET', '127.0.0.1', '[]', '2020-10-29 11:11:35', '2020-10-29 11:11:35');
INSERT INTO `admin_operation_log` VALUES ('4424', '1', 'admin/orders/33', 'GET', '127.0.0.1', '[]', '2020-10-29 11:13:30', '2020-10-29 11:13:30');
INSERT INTO `admin_operation_log` VALUES ('4425', '1', 'admin/orders/33', 'GET', '127.0.0.1', '[]', '2020-10-29 11:16:15', '2020-10-29 11:16:15');
INSERT INTO `admin_operation_log` VALUES ('4426', '1', 'admin/orders/33', 'GET', '127.0.0.1', '[]', '2020-10-29 11:22:09', '2020-10-29 11:22:09');
INSERT INTO `admin_operation_log` VALUES ('4427', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-29 11:23:30', '2020-10-29 11:23:30');
INSERT INTO `admin_operation_log` VALUES ('4428', '1', 'admin/orders/34', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-29 11:23:38', '2020-10-29 11:23:38');
INSERT INTO `admin_operation_log` VALUES ('4429', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-29 11:23:41', '2020-10-29 11:23:41');
INSERT INTO `admin_operation_log` VALUES ('4430', '1', 'admin/orders/32', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-29 11:24:03', '2020-10-29 11:24:03');
INSERT INTO `admin_operation_log` VALUES ('4431', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-29 11:24:39', '2020-10-29 11:24:39');
INSERT INTO `admin_operation_log` VALUES ('4432', '1', 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-10-29 13:29:28', '2020-10-29 13:29:28');
INSERT INTO `admin_operation_log` VALUES ('4433', '1', 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-10-29 13:33:47', '2020-10-29 13:33:47');
INSERT INTO `admin_operation_log` VALUES ('4434', '1', 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-10-29 13:35:04', '2020-10-29 13:35:04');
INSERT INTO `admin_operation_log` VALUES ('4435', '1', 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"_current_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/orders?\",\"id\":\"33\",\"renderable\":\"App_Admin_Forms_RefundForm\"}', '2020-10-29 13:35:25', '2020-10-29 13:35:25');
INSERT INTO `admin_operation_log` VALUES ('4436', '1', 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"_current_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/orders?\",\"id\":\"34\",\"renderable\":\"App_Admin_Forms_RefundForm\"}', '2020-10-29 13:35:33', '2020-10-29 13:35:33');
INSERT INTO `admin_operation_log` VALUES ('4437', '1', 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-10-29 13:36:01', '2020-10-29 13:36:01');
INSERT INTO `admin_operation_log` VALUES ('4438', '1', 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"_current_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/orders?\",\"id\":\"33\",\"renderable\":\"App_Admin_Forms_RefundForm\"}', '2020-10-29 13:36:43', '2020-10-29 13:36:43');
INSERT INTO `admin_operation_log` VALUES ('4439', '1', 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"_current_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/orders?\",\"id\":\"33\",\"renderable\":\"App_Admin_Forms_RefundForm\"}', '2020-10-29 13:37:19', '2020-10-29 13:37:19');
INSERT INTO `admin_operation_log` VALUES ('4440', '1', 'admin/dcat-api/form', 'POST', '127.0.0.1', '{\"agree\":\"2\",\"reason\":\"\\u975e\\u6cd5\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\RefundForm\",\"_current_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/orders?\",\"_payload_\":\"{\\\"_current_\\\":\\\"http:\\\\\\/\\\\\\/test.xslp.cn:8080\\\\\\/admin\\\\\\/orders?\\\",\\\"id\\\":\\\"33\\\",\\\"renderable\\\":\\\"App_Admin_Forms_RefundForm\\\"}\",\"_token\":\"EwEBw0cSXhX1cRymQ161KRPGaKiN6WJBwwGysgRB\"}', '2020-10-29 13:37:35', '2020-10-29 13:37:35');
INSERT INTO `admin_operation_log` VALUES ('4441', '1', 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-29 13:37:36', '2020-10-29 13:37:36');
INSERT INTO `admin_operation_log` VALUES ('4442', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-29 13:37:44', '2020-10-29 13:37:44');
INSERT INTO `admin_operation_log` VALUES ('4443', '1', 'admin/orders/33', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-29 13:37:49', '2020-10-29 13:37:49');
INSERT INTO `admin_operation_log` VALUES ('4444', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-29 13:39:55', '2020-10-29 13:39:55');
INSERT INTO `admin_operation_log` VALUES ('4445', '1', 'admin/orders/33', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-29 13:39:58', '2020-10-29 13:39:58');
INSERT INTO `admin_operation_log` VALUES ('4446', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-29 13:40:00', '2020-10-29 13:40:00');
INSERT INTO `admin_operation_log` VALUES ('4447', '1', 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"_current_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/orders?\",\"id\":\"34\",\"renderable\":\"App_Admin_Forms_RefundForm\"}', '2020-10-29 13:40:31', '2020-10-29 13:40:31');
INSERT INTO `admin_operation_log` VALUES ('4448', '1', 'admin/dcat-api/form', 'POST', '127.0.0.1', '{\"agree\":\"1\",\"reason\":\"\\u540c\\u610f\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\RefundForm\",\"_current_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/orders?\",\"_payload_\":\"{\\\"_current_\\\":\\\"http:\\\\\\/\\\\\\/test.xslp.cn:8080\\\\\\/admin\\\\\\/orders?\\\",\\\"id\\\":\\\"34\\\",\\\"renderable\\\":\\\"App_Admin_Forms_RefundForm\\\"}\",\"_token\":\"EwEBw0cSXhX1cRymQ161KRPGaKiN6WJBwwGysgRB\"}', '2020-10-29 13:41:17', '2020-10-29 13:41:17');
INSERT INTO `admin_operation_log` VALUES ('4449', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-29 13:42:44', '2020-10-29 13:42:44');
INSERT INTO `admin_operation_log` VALUES ('4450', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-10-29 13:57:25', '2020-10-29 13:57:25');
INSERT INTO `admin_operation_log` VALUES ('4451', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-29 13:57:28', '2020-10-29 13:57:28');
INSERT INTO `admin_operation_log` VALUES ('4452', '1', 'admin/orders/32', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-29 13:57:32', '2020-10-29 13:57:32');
INSERT INTO `admin_operation_log` VALUES ('4453', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-29 14:06:20', '2020-10-29 14:06:20');
INSERT INTO `admin_operation_log` VALUES ('4454', '1', 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-10-29 14:06:23', '2020-10-29 14:06:23');
INSERT INTO `admin_operation_log` VALUES ('4455', '1', 'admin/orders/32', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-29 14:06:41', '2020-10-29 14:06:41');
INSERT INTO `admin_operation_log` VALUES ('4456', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-29 14:07:39', '2020-10-29 14:07:39');
INSERT INTO `admin_operation_log` VALUES ('4457', '1', 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-10-29 14:07:41', '2020-10-29 14:07:41');
INSERT INTO `admin_operation_log` VALUES ('4458', '1', 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-10-29 14:08:03', '2020-10-29 14:08:03');
INSERT INTO `admin_operation_log` VALUES ('4459', '1', 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-10-29 14:08:50', '2020-10-29 14:08:50');
INSERT INTO `admin_operation_log` VALUES ('4460', '1', 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-10-29 14:09:13', '2020-10-29 14:09:13');
INSERT INTO `admin_operation_log` VALUES ('4461', '1', 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-10-29 14:10:13', '2020-10-29 14:10:13');
INSERT INTO `admin_operation_log` VALUES ('4462', '1', 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-10-29 14:12:00', '2020-10-29 14:12:00');
INSERT INTO `admin_operation_log` VALUES ('4463', '1', 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-10-29 14:12:19', '2020-10-29 14:12:19');
INSERT INTO `admin_operation_log` VALUES ('4464', '1', 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"_current_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/orders?\",\"id\":\"32\",\"renderable\":\"App_Admin_Forms_ShipForm\"}', '2020-10-29 14:12:22', '2020-10-29 14:12:22');
INSERT INTO `admin_operation_log` VALUES ('4465', '1', 'admin/dcat-api/form', 'POST', '127.0.0.1', '{\"express_company\":\"\\u83dc\\u9e1f\\u7269\\u6d41\",\"express_no\":\"cn0008\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\ShipForm\",\"_current_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/orders?\",\"_payload_\":\"{\\\"_current_\\\":\\\"http:\\\\\\/\\\\\\/test.xslp.cn:8080\\\\\\/admin\\\\\\/orders?\\\",\\\"id\\\":\\\"32\\\",\\\"renderable\\\":\\\"App_Admin_Forms_ShipForm\\\"}\",\"_token\":\"EwEBw0cSXhX1cRymQ161KRPGaKiN6WJBwwGysgRB\"}', '2020-10-29 14:12:48', '2020-10-29 14:12:48');
INSERT INTO `admin_operation_log` VALUES ('4466', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-29 14:12:48', '2020-10-29 14:12:48');
INSERT INTO `admin_operation_log` VALUES ('4467', '1', 'admin/orders/32', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-29 14:12:59', '2020-10-29 14:12:59');
INSERT INTO `admin_operation_log` VALUES ('4468', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-29 14:13:04', '2020-10-29 14:13:04');
INSERT INTO `admin_operation_log` VALUES ('4469', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-29 14:43:45', '2020-10-29 14:43:45');
INSERT INTO `admin_operation_log` VALUES ('4470', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-29 14:56:42', '2020-10-29 14:56:42');
INSERT INTO `admin_operation_log` VALUES ('4471', '1', 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"_current_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/orders?\",\"id\":\"35\",\"renderable\":\"App_Admin_Forms_ShipForm\"}', '2020-10-29 14:56:45', '2020-10-29 14:56:45');
INSERT INTO `admin_operation_log` VALUES ('4472', '1', 'admin/dcat-api/form', 'POST', '127.0.0.1', '{\"express_company\":\"\\u83dc\\u9e1f\\u7269\\u6d41\",\"express_no\":\"cn00068\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\ShipForm\",\"_current_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/orders?\",\"_payload_\":\"{\\\"_current_\\\":\\\"http:\\\\\\/\\\\\\/test.xslp.cn:8080\\\\\\/admin\\\\\\/orders?\\\",\\\"id\\\":\\\"35\\\",\\\"renderable\\\":\\\"App_Admin_Forms_ShipForm\\\"}\",\"_token\":\"EwEBw0cSXhX1cRymQ161KRPGaKiN6WJBwwGysgRB\"}', '2020-10-29 14:56:52', '2020-10-29 14:56:52');
INSERT INTO `admin_operation_log` VALUES ('4473', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-29 14:56:52', '2020-10-29 14:56:52');
INSERT INTO `admin_operation_log` VALUES ('4474', '1', 'admin/orders/35', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-29 14:56:55', '2020-10-29 14:56:55');
INSERT INTO `admin_operation_log` VALUES ('4475', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-29 14:57:18', '2020-10-29 14:57:18');
INSERT INTO `admin_operation_log` VALUES ('4476', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-29 14:58:21', '2020-10-29 14:58:21');
INSERT INTO `admin_operation_log` VALUES ('4477', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-29 15:25:01', '2020-10-29 15:25:01');
INSERT INTO `admin_operation_log` VALUES ('4478', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-10-30 14:53:20', '2020-10-30 14:53:20');
INSERT INTO `admin_operation_log` VALUES ('4479', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-30 14:53:44', '2020-10-30 14:53:44');
INSERT INTO `admin_operation_log` VALUES ('4480', '1', 'admin/orders/35', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-30 14:53:52', '2020-10-30 14:53:52');
INSERT INTO `admin_operation_log` VALUES ('4481', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-30 14:53:57', '2020-10-30 14:53:57');
INSERT INTO `admin_operation_log` VALUES ('4482', '1', 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"renderable\":\"App_Admin_Renders_UserInvoice\",\"key\":\"1\"}', '2020-10-30 14:54:02', '2020-10-30 14:54:02');
INSERT INTO `admin_operation_log` VALUES ('4483', '1', 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"renderable\":\"App_Admin_Renders_UserInvoice\",\"key\":\"5\"}', '2020-10-30 14:54:09', '2020-10-30 14:54:09');
INSERT INTO `admin_operation_log` VALUES ('4484', '1', 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"renderable\":\"App_Admin_Renders_UserInvoice\",\"key\":\"3\"}', '2020-10-30 14:54:12', '2020-10-30 14:54:12');
INSERT INTO `admin_operation_log` VALUES ('4485', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-11-03 09:10:14', '2020-11-03 09:10:14');
INSERT INTO `admin_operation_log` VALUES ('4486', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-11-03 11:39:47', '2020-11-03 11:39:47');
INSERT INTO `admin_operation_log` VALUES ('4487', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-11-04 11:26:35', '2020-11-04 11:26:35');
INSERT INTO `admin_operation_log` VALUES ('4488', '1', 'admin/coupon_types', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-11-04 11:26:52', '2020-11-04 11:26:52');
INSERT INTO `admin_operation_log` VALUES ('4489', '1', 'admin/coupon_types/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-11-04 11:27:04', '2020-11-04 11:27:04');
INSERT INTO `admin_operation_log` VALUES ('4490', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-11-04 14:48:30', '2020-11-04 14:48:30');
INSERT INTO `admin_operation_log` VALUES ('4491', '1', 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"_current_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/orders?\",\"id\":\"36\",\"renderable\":\"App_Admin_Forms_ShipForm\"}', '2020-11-04 14:48:36', '2020-11-04 14:48:36');
INSERT INTO `admin_operation_log` VALUES ('4492', '1', 'admin/dcat-api/form', 'POST', '127.0.0.1', '{\"express_company\":\"\\u83dc\\u9e1f\\u7269\\u6d41\",\"express_no\":\"cn00068\",\"_form_\":\"App\\\\Admin\\\\Forms\\\\ShipForm\",\"_current_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/orders?\",\"_payload_\":\"{\\\"_current_\\\":\\\"http:\\\\\\/\\\\\\/test.xslp.cn:8080\\\\\\/admin\\\\\\/orders?\\\",\\\"id\\\":\\\"36\\\",\\\"renderable\\\":\\\"App_Admin_Forms_ShipForm\\\"}\",\"_token\":\"dV3CSFKYkjbtvP2lHpHJ9QkbRVNJ1WzkE8fORrEC\"}', '2020-11-04 14:48:45', '2020-11-04 14:48:45');
INSERT INTO `admin_operation_log` VALUES ('4493', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-11-04 14:48:46', '2020-11-04 14:48:46');
INSERT INTO `admin_operation_log` VALUES ('4494', '1', 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"_current_\":\"http:\\/\\/test.xslp.cn:8080\\/admin\\/orders?\",\"id\":\"13\",\"renderable\":\"App_Admin_Forms_ShipForm\"}', '2020-11-04 14:50:15', '2020-11-04 14:50:15');
INSERT INTO `admin_operation_log` VALUES ('4495', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-11-16 11:12:36', '2020-11-16 11:12:36');
INSERT INTO `admin_operation_log` VALUES ('4496', '1', 'admin/coupon_types', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-11-16 11:36:53', '2020-11-16 11:36:53');

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
INSERT INTO `admin_users` VALUES ('1', 'admin', '$2y$10$W5ih5/Yi3MU5MW0wylyBh.xctYdtcEmtBhw/n4Hcp6x0YancoF0jK', 'Administrator', null, 'CMzyc4GhLT1Qu5S4IWirLLh1DVWKEk7nmm8pj6LsBMeln6BdjRIu6F1ILzof', '2020-07-29 02:27:24', '2020-08-25 15:55:30');

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

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
INSERT INTO `ads` VALUES ('9', 'bannerl', 'ads/09aadfae69c36a7379b24fe6f6ff5a1e.jpg', '/', '840', '171', null, '2020-06-23 17:18:25', '2020-08-11 15:23:42');
INSERT INTO `ads` VALUES ('10', 'bannerl2', 'ads/3aebc9fd377388fbef9d36cfd623d472.jpg', '/', '840', '170', null, '2020-06-23 17:18:54', '2020-06-23 17:18:54');
INSERT INTO `ads` VALUES ('11', 'left3', 'ads/500f1a173dd95c1ecf72b994784ca696.jpg', '/', '270', '345', null, '2020-06-23 17:19:59', '2020-06-23 17:19:59');
INSERT INTO `ads` VALUES ('12', 'bottomb', 'ads/620c55051c0aa16b014620eb700e6de9.jpg', '/', '1110', '430', null, '2020-06-23 17:21:01', '2020-06-23 17:21:01');
INSERT INTO `ads` VALUES ('13', 'bottomb1', 'ads/42d7dd673836ff692d249f3e3ff044eb.jpg', '/', '555', '150', null, '2020-06-23 17:22:00', '2020-06-23 17:22:00');
INSERT INTO `ads` VALUES ('14', 'imagebanner', 'ads/ea83fe11b6e433c1cac7f59ef863f71b.jpg', '/', '840', '250', null, '2020-08-13 17:43:41', '2020-08-13 17:43:41');

-- ----------------------------
-- Table structure for `advs`
-- ----------------------------
DROP TABLE IF EXISTS `advs`;
CREATE TABLE `advs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `merchant_id` bigint(20) unsigned DEFAULT NULL COMMENT '商户id',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
  `is_title_show` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否显示标题',
  `cover` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '封面图片',
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '广告位ID 广告类型，广告位置',
  `view` int(11) NOT NULL DEFAULT '0' COMMENT '浏览量',
  `silder_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图片描述',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `jump_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '跳转链接',
  `jump_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '跳转方式',
  `sort` tinyint(4) NOT NULL DEFAULT '0' COMMENT '优先级',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `width` int(11) NOT NULL DEFAULT '0' COMMENT '宽度',
  `height` int(11) NOT NULL DEFAULT '0' COMMENT '高度',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of advs
-- ----------------------------
INSERT INTO `advs` VALUES ('1', null, '新客买送活动', '1', 'ads/edf42052e986d43884caaacbfe10e578.jpg', 'app_index_top', '0', '新客买送活动', '2020-08-19 16:17:28', '2021-06-30 16:17:32', null, 'product_list_for_cate', '0', '1', '2', '2', '2020-08-19 16:19:04', '2020-08-19 16:19:43');
INSERT INTO `advs` VALUES ('2', null, '厨房卫浴博览会', '1', 'ads/76aeb02b4a648dd39188809b22052c84.jpg', 'app_index_top', '0', '厨房卫浴博览会', '2020-08-19 16:21:30', '2021-02-28 16:21:32', null, null, '0', '1', '2', '2', '2020-08-19 16:22:05', '2020-08-19 16:22:05');
INSERT INTO `advs` VALUES ('3', null, '手机新品会场', '1', 'ads/2164c6f790eea313267f6510757765db.jpg', 'app_index_top', '0', '手机新品会场', '2020-08-19 16:23:04', '2021-06-26 16:23:10', null, null, '0', '1', '350', '3', '2020-08-19 16:23:34', '2020-08-19 16:23:34');
INSERT INTO `advs` VALUES ('4', null, '夏季新款', '1', 'ads/b285cfd492c048852e38597ddc45f95a.png', 'app_index_new', '0', '夏季新款', '2020-08-19 16:27:59', '2021-03-31 16:28:01', null, null, '0', '1', '1', '1', '2020-08-19 16:28:18', '2020-08-19 16:28:18');
INSERT INTO `advs` VALUES ('5', null, '推荐百货现时抢购', '1', 'ads/ebb2ed2f9e615efe27150716afd5e2ae.png', 'app_index_recommend', '0', '11', '2020-08-19 16:29:00', '2021-06-26 16:29:02', null, null, '0', '1', '1', '1', '2020-08-19 16:29:21', '2020-08-19 16:29:21');
INSERT INTO `advs` VALUES ('6', null, '热门时尚', '1', 'ads/f66bc708c8610e83a9b0ed8aba8c5472.jpg', 'app_index_hot', '0', '热门时尚', '2020-08-19 16:32:33', '2021-07-30 16:32:36', null, null, '0', '1', '1', '1', '2020-08-19 16:32:55', '2020-08-19 16:32:55');

-- ----------------------------
-- Table structure for `announces`
-- ----------------------------
DROP TABLE IF EXISTS `announces`;
CREATE TABLE `announces` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '消息内容',
  `cover` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '封面',
  `synopsis` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '概要',
  `view` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览量',
  `sender_id` int(10) unsigned NOT NULL COMMENT '发送者id',
  `sender_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '发送者name',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of announces
-- ----------------------------
INSERT INTO `announces` VALUES ('1', '商城开业', '商城开业，欢迎大家来购物', 'http://test.xslp.cn:8080/storage/http://test.xslp.cn:8080/storage/images/js.png', '商城开业', '5', '1', 'Administrator', '1', '2020-09-08 14:14:07', '2020-10-14 10:32:17');
INSERT INTO `announces` VALUES ('2', '本商城优惠即将开始欢迎大家选购', '本商城优惠即将开始欢迎大家选购', 'http://test.xslp.cn:8080//storage/images/bg.jpg', '本商城优惠即将开始欢迎大家选购', '0', '1', 'Administrator', '1', '2020-09-23 10:39:47', '2020-09-23 10:39:47');
INSERT INTO `announces` VALUES ('3', '哈哈', '<p>哈哈</p>', 'http://test.xslp.cn:8080//storage/images/shareImg.jpg', '哈哈', '0', '1', 'Administrator', '1', '2020-09-23 10:53:39', '2020-09-23 10:53:39');
INSERT INTO `announces` VALUES ('9', '商品秒杀了啊', '<p>商品秒杀了啊商品秒杀了啊</p>', 'http://test.xslp.cn:8080//storage/images/7ee742795cbb132d200df56247300587.jpg', '商品秒杀了啊', '0', '1', 'Administrator', '1', '2020-09-23 13:57:37', '2020-09-23 13:57:37');
INSERT INTO `announces` VALUES ('10', '大家可以众筹喜欢的商品了', '<p>大家可以众筹喜欢的商品了大家可以众筹喜欢的商品了</p>', 'http://test.xslp.cn:8080//storage/images/af943746c01675a713b9f9fea8bc73fd.jpg', '大家可以众筹喜欢的商品了', '7', '1', 'Administrator', '1', '2020-09-23 14:01:05', '2020-11-16 11:23:46');
INSERT INTO `announces` VALUES ('8', '促销促销活动开始了', '<p>促销促销活动开始了</p>', 'http://test.xslp.cn:8080//storage/images/cf75bd2214c7070d6ea31d847ec9cf70.jpg', '促销促销活动开始了', '0', '1', 'Administrator', '1', '2020-09-23 13:53:25', '2020-09-23 13:53:25');

-- ----------------------------
-- Table structure for `base_properties`
-- ----------------------------
DROP TABLE IF EXISTS `base_properties`;
CREATE TABLE `base_properties` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) unsigned NOT NULL COMMENT '分类id',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模型名称',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态(-1:已删除,0:禁用,1:正常)',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of base_properties
-- ----------------------------
INSERT INTO `base_properties` VALUES ('1', '17', '处理器', '1');
INSERT INTO `base_properties` VALUES ('2', '17', '内存容量', '1');

-- ----------------------------
-- Table structure for `base_property_items`
-- ----------------------------
DROP TABLE IF EXISTS `base_property_items`;
CREATE TABLE `base_property_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `base_property_id` bigint(20) unsigned NOT NULL COMMENT '属性ID',
  `relvalue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '属性对应相关数据',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态(-1:已删除,0:禁用,1:正常)',
  PRIMARY KEY (`id`),
  KEY `base_property_items_base_property_id_foreign` (`base_property_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of base_property_items
-- ----------------------------
INSERT INTO `base_property_items` VALUES ('1', '1', 'Intel i5', '1');
INSERT INTO `base_property_items` VALUES ('2', '1', 'Intel i7', '1');
INSERT INTO `base_property_items` VALUES ('3', '1', 'Intel i9', '1');
INSERT INTO `base_property_items` VALUES ('4', '2', '8G', '1');
INSERT INTO `base_property_items` VALUES ('5', '2', '12G', '1');
INSERT INTO `base_property_items` VALUES ('6', '2', '16G', '1');
INSERT INTO `base_property_items` VALUES ('7', '2', '32G', '1');

-- ----------------------------
-- Table structure for `borrows`
-- ----------------------------
DROP TABLE IF EXISTS `borrows`;
CREATE TABLE `borrows` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `duration` smallint(6) NOT NULL DEFAULT '0' COMMENT '借款期限 正数单位为月 负数单位为天',
  `money` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rate` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `repayment_times` tinyint(4) NOT NULL COMMENT '还款次数，就是总共需要还几期',
  `repayment_already_times` tinyint(4) NOT NULL DEFAULT '0' COMMENT '已还完第几期',
  `repayment_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '还款方式',
  `collect_day` tinyint(4) NOT NULL DEFAULT '3' COMMENT '募集时间(天) 标保持状态2几天',
  `deal_time` datetime DEFAULT NULL COMMENT '初审时间',
  `publish_time` datetime DEFAULT NULL COMMENT '初审过后的发布时间-投标生效时间,立即生效就是初审时间',
  `full_time` datetime DEFAULT NULL COMMENT '满标时间',
  `redeal_time` datetime DEFAULT NULL COMMENT '复审时间',
  `next_repaytime` datetime DEFAULT NULL COMMENT '下次还款时间',
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分类',
  `area` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '专区',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending' COMMENT '状态',
  `use` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用途',
  `use_other` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '其他用途说明',
  `deal_id` int(11) NOT NULL DEFAULT '0' COMMENT '初审人',
  `deal_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '初审人',
  `deal_info` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '初审',
  `redeal_id` int(11) NOT NULL DEFAULT '0' COMMENT '复审人',
  `redeal_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '复审人',
  `redeal_info` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '复审',
  `repayment_capital` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '归还本金',
  `repayment_interest` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '归还利息',
  `repayment_managefee` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '逾期管理费',
  `repayment_overdue` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '逾期罚息费',
  `borrow_des` text COLLATE utf8mb4_unicode_ci,
  `overtimes` tinyint(4) DEFAULT '0' COMMENT '逾期数',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of borrows
-- ----------------------------
INSERT INTO `borrows` VALUES ('1', '孟子大学100万资金周转', '2', '1', '12', '1200000.00', '9.00', '50000.00', '4', '1', '6', '3', '2020-10-15 16:04:41', '2020-10-19 16:04:41', '2020-10-20 13:34:50', '2020-10-20 15:14:25', '2021-04-20 23:59:59', '1', '1', 'success', '1', '学校建设资金周转', '0', 'Administrator', '资料挺全，very good.', '0', 'Administrator', '同意', '0.00', '27000.00', '0.00', '0.00', '1111', '0', '2020-10-14 10:15:38', '2020-10-22 13:32:43');
INSERT INTO `borrows` VALUES ('2', '经济大学50万资金周转', '2', '2', '12', '500000.00', '9.00', '20000.00', '4', '0', '6', '100', '2020-10-20 15:32:18', '2020-10-20 12:32:18', null, null, null, '1', '1', 'bidding', '1', '7777', '0', 'Administrator', '同意', '0', null, null, '0.00', '0.00', '0.00', '0.00', '融资详情', '0', '2020-10-14 10:58:23', '2020-10-20 15:32:35');

-- ----------------------------
-- Table structure for `borrow_infos`
-- ----------------------------
DROP TABLE IF EXISTS `borrow_infos`;
CREATE TABLE `borrow_infos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `borrow_id` bigint(20) unsigned NOT NULL,
  `risk` text COLLATE utf8mb4_unicode_ci,
  `img` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of borrow_infos
-- ----------------------------
INSERT INTO `borrow_infos` VALUES ('1', '1', '[{\"name\":\"\\u8d37\\u524d\\u8c03\\u67e5\",\"value\":\"\\u516c\\u53f8\\u98ce\\u63a7\\u56e2\\u961f\\u5bf9\\u501f\\u6b3e\\u65b9\\u8fdb\\u884c\\u5b9e\\u5730\\u5c3d\\u804c\\u8c03\\u67e5\\uff0c\\u501f\\u6b3e\\u65b9\\u7ecf\\u6d4e\\u5b9e\\u529b\\u4e00\\u822c\\uff0c\\u4fe1\\u8a89\\u5ea6\\u8f83\\u597d\\uff1b\\u501f\\u6b3e\\u65b9\\u7684\\u672c\\u6b21\\u501f\\u6b3e\\u516c\\u53f8\\u6d41\\u52a8\\u8d44\\u91d1\\u5468\\u8f6c\\u3002\"},{\"name\":\"\\u98ce\\u9669\\u8bc4\\u7ea7\",\"value\":\"B\\uff08\\u8bc4\\u7ea7\\u8d8a\\u9ad8\\uff0c\\u98ce\\u9669\\u8d8a\\u5c0f\\uff1b\\u4ec5\\u4f9b\\u53c2\\u8003\\u3002\\uff09\"},{\"name\":\"\\u9002\\u5408\\u6295\\u8d44\\u4eba\\u7fa4\",\"value\":\"\\u672c\\u4ea7\\u54c1\\u5c5e\\u4e8e\\u4f4e\\u98ce\\u9669\\u4ea7\\u54c1\\uff0c\\u9002\\u5408\\u7a33\\u5065\\u578b\\u3001\\u8fdb\\u53d6\\u578b\\u3001\\u6210\\u957f\\u578b\\u6295\\u8d44\\u8005\\uff0c\\u4fdd\\u5b88\\u578b\\u6295\\u8d44\\u8005\\u9700\\u6ce8\\u610f\\u76f8\\u5173\\u98ce\\u9669\\u5e76\\u7ed3\\u5408\\u81ea\\u5df1\\u7684\\u98ce\\u9669\\u627f\\u53d7\\u80fd\\u529b\\u53ef\\u8fdb\\u884c\\u9002\\u5f53\\u53c2\\u4e0e\\u3002\"},{\"name\":\"\\u9879\\u76ee\\u98ce\\u9669\\u63d0\\u793a\",\"value\":\"\\u516c\\u53f8\\u65d7\\u4e0b\\u9879\\u76ee\\u8fdb\\u5ea6\\u6b63\\u5e38\\uff0c\\u8fd0\\u8425\\u60c5\\u51b5\\u826f\\u597d\\uff0c\\u4f46\\u7ed3\\u5408\\u5e02\\u573a\\u53ca\\u884c\\u4e1a\\u7279\\u5f81\\uff0c\\u53ef\\u80fd\\u4f1a\\u6709\\u5ef6\\u8bef\\uff0c\\u6295\\u8d44\\u8005\\u9700\\u8c28\\u614e\\u53c2\\u4e0e\\u3002\"}]', '{\"zjsyjh\":\"http:\\/\\/test.xslp.cn:8080\\/storage\\/borrow\\/zjsyjh-1602743658.jpg\",\"gdhjy\":\"http:\\/\\/test.xslp.cn:8080\\/storage\\/borrow\\/gdhjy-1602743663.png\"}');
INSERT INTO `borrow_infos` VALUES ('2', '2', '[{\"name\":\"\\u8fd8\\u6b3e\\u6765\\u6e90\",\"value\":\"\\u516c\\u53f8\\u98ce\\u63a7\\u56e2\\u961f\\u5bf9\\u501f\\u6b3e\\u65b9\\u8fdb\\u884c\\u5b9e\\u5730\\u5c3d\\u804c\\u8c03\\u67e5\\uff0c\\u501f\\u6b3e\\u65b9\\u7ecf\\u6d4e\\u5b9e\\u529b\\u4e00\\u822c\\uff0c\\u4fe1\\u8a89\\u5ea6\\u8f83\\u597d\\uff1b\\u501f\\u6b3e\\u65b9\\u7684\\u672c\\u6b21\\u501f\\u6b3e\\u516c\\u53f8\\u6d41\\u52a8\\u8d44\\u91d1\\u5468\\u8f6c\\u3002\"},{\"name\":\"\\u8d37\\u524d\\u8c03\\u67e5\",\"value\":\"B\\uff08\\u8bc4\\u7ea7\\u8d8a\\u9ad8\\uff0c\\u98ce\\u9669\\u8d8a\\u5c0f\\uff1b\\u4ec5\\u4f9b\\u53c2\\u8003\\u3002\\uff09\"},{\"name\":\"\\u98ce\\u9669\\u8bc4\\u7ea7\",\"value\":\"\\u672c\\u4ea7\\u54c1\\u5c5e\\u4e8e\\u4f4e\\u98ce\\u9669\\u4ea7\\u54c1\\uff0c\\u9002\\u5408\\u7a33\\u5065\\u578b\\u3001\\u8fdb\\u53d6\\u578b\\u3001\\u6210\\u957f\\u578b\\u6295\\u8d44\\u8005\\uff0c\\u4fdd\\u5b88\\u578b\\u6295\\u8d44\\u8005\\u9700\\u6ce8\\u610f\\u76f8\\u5173\\u98ce\\u9669\\u5e76\\u7ed3\\u5408\\u81ea\\u5df1\\u7684\\u98ce\\u9669\\u627f\\u53d7\\u80fd\\u529b\\u53ef\\u8fdb\\u884c\\u9002\\u5f53\\u53c2\\u4e0e\\u3002\"},{\"name\":\"\\u9002\\u5408\\u6295\\u8d44\\u4eba\\u7fa4\",\"value\":\"\\u516c\\u53f8\\u65d7\\u4e0b\\u9879\\u76ee\\u8fdb\\u5ea6\\u6b63\\u5e38\\uff0c\\u8fd0\\u8425\\u60c5\\u51b5\\u826f\\u597d\\uff0c\\u4f46\\u7ed3\\u5408\\u5e02\\u573a\\u53ca\\u884c\\u4e1a\\u7279\\u5f81\\uff0c\\u53ef\\u80fd\\u4f1a\\u6709\\u5ef6\\u8bef\\uff0c\\u6295\\u8d44\\u8005\\u9700\\u8c28\\u614e\\u53c2\\u4e0e\\u3002\"},{\"name\":\"\\u9879\\u76ee\\u98ce\\u9669\\u63d0\\u793a\",\"value\":\"55\"}]', '{\"zjsyjh\":\"http:\\/\\/test.xslp.cn:8080\\/storage\\/borrow\\/zjsyjh-1603179127.jpg\",\"gdhjy\":\"http:\\/\\/test.xslp.cn:8080\\/storage\\/borrow\\/gdhjy-1603179134.jpg\"}');

-- ----------------------------
-- Table structure for `borrow_invests`
-- ----------------------------
DROP TABLE IF EXISTS `borrow_invests`;
CREATE TABLE `borrow_invests` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `borrow_id` bigint(20) unsigned NOT NULL,
  `borrow_user_id` bigint(20) unsigned NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '转让',
  `transfer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '转让标',
  `invest_sum` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '投资额',
  `capital` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '应得本金',
  `interest` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '应得利息',
  `receive_capital` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '已得本金',
  `receive_interest` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '已得利息',
  `receive_overdue` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '已得违约金',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of borrow_invests
-- ----------------------------
INSERT INTO `borrow_invests` VALUES ('1', '3', '1', '2', 'proccessing', '0', '0', '500000.00', '500000.00', '45000.00', '0.00', '11250.00', '0.00', '2020-10-20 11:08:09', '2020-10-22 13:32:42');
INSERT INTO `borrow_invests` VALUES ('2', '4', '1', '2', 'proccessing', '0', '0', '500000.00', '500000.00', '45000.00', '0.00', '11250.00', '0.00', '2020-10-20 13:21:06', '2020-10-22 13:32:43');
INSERT INTO `borrow_invests` VALUES ('3', '5', '1', '2', 'proccessing', '0', '0', '200000.00', '200000.00', '18000.00', '0.00', '4500.00', '0.00', '2020-10-20 13:31:28', '2020-10-22 13:32:43');
INSERT INTO `borrow_invests` VALUES ('4', '5', '2', '2', 'freeze', '0', '0', '10000.00', '10000.00', '0.00', '0.00', '0.00', '0.00', '2020-10-27 16:59:41', '2020-10-27 16:59:41');

-- ----------------------------
-- Table structure for `borrow_invest_transfers`
-- ----------------------------
DROP TABLE IF EXISTS `borrow_invest_transfers`;
CREATE TABLE `borrow_invest_transfers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `borrow_id` bigint(20) unsigned NOT NULL,
  `repayment_already_times` tinyint(4) NOT NULL COMMENT '已还完第几期',
  `borrow_invest_id` bigint(20) unsigned NOT NULL,
  `borrow_invest_user_id` bigint(20) unsigned NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '状态',
  `transfer_money` decimal(15,2) NOT NULL COMMENT '转让金额',
  `transfer_day` tinyint(3) unsigned NOT NULL COMMENT '转让天数',
  `transfer_fee` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '转让管理、手续费',
  `transfer_rate` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '转让率',
  `deal_id` int(11) NOT NULL DEFAULT '0' COMMENT '初审人',
  `deal_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '初审人',
  `deal_info` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '初审',
  `deal_time` datetime DEFAULT NULL COMMENT '初审时间',
  `redeal_id` int(11) NOT NULL DEFAULT '0' COMMENT '复审人',
  `redeal_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '复审人',
  `redeal_info` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '复审',
  `redeal_time` datetime DEFAULT NULL COMMENT '初审时间',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of borrow_invest_transfers
-- ----------------------------

-- ----------------------------
-- Table structure for `borrow_relevances`
-- ----------------------------
DROP TABLE IF EXISTS `borrow_relevances`;
CREATE TABLE `borrow_relevances` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `borrow_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of borrow_relevances
-- ----------------------------

-- ----------------------------
-- Table structure for `borrow_repayments`
-- ----------------------------
DROP TABLE IF EXISTS `borrow_repayments`;
CREATE TABLE `borrow_repayments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `batch` tinyint(4) NOT NULL,
  `borrow_id` bigint(20) unsigned NOT NULL,
  `borrow_user_id` bigint(20) unsigned NOT NULL,
  `borrow_invest_id` bigint(20) unsigned NOT NULL,
  `borrow_invest_user_id` bigint(20) unsigned NOT NULL,
  `help_uid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '担保人替还',
  `capital` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '本期应得本金',
  `interest` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '本期应得利息',
  `receive_capital` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '已得本金',
  `receive_interest` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '已得利息',
  `receive_overdue` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '已得违约金',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deadline` datetime NOT NULL COMMENT '最迟还款时间',
  `repayment_time` datetime DEFAULT NULL COMMENT '还款时间',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of borrow_repayments
-- ----------------------------
INSERT INTO `borrow_repayments` VALUES ('1', '1', '1', '2', '1', '3', '0', '0.00', '11250.00', '0.00', '11250.00', '0.00', 'completed', '2021-01-20 23:59:59', '2020-10-22 13:32:42', '2020-10-20 15:14:57', '2020-10-22 13:32:42');
INSERT INTO `borrow_repayments` VALUES ('2', '2', '1', '2', '1', '3', '0', '0.00', '11250.00', '0.00', '0.00', '0.00', 'proccessing', '2021-04-20 23:59:59', null, '2020-10-20 15:14:57', '2020-10-20 15:14:57');
INSERT INTO `borrow_repayments` VALUES ('3', '3', '1', '2', '1', '3', '0', '0.00', '11250.00', '0.00', '0.00', '0.00', 'proccessing', '2021-07-20 23:59:59', null, '2020-10-20 15:14:57', '2020-10-20 15:14:57');
INSERT INTO `borrow_repayments` VALUES ('4', '4', '1', '2', '1', '3', '0', '500000.00', '11250.00', '0.00', '0.00', '0.00', 'proccessing', '2021-10-20 23:59:59', null, '2020-10-20 15:14:57', '2020-10-20 15:14:57');
INSERT INTO `borrow_repayments` VALUES ('5', '1', '1', '2', '2', '4', '0', '0.00', '11250.00', '0.00', '11250.00', '0.00', 'completed', '2021-01-20 23:59:59', '2020-10-22 13:32:43', '2020-10-20 15:14:57', '2020-10-22 13:32:43');
INSERT INTO `borrow_repayments` VALUES ('6', '2', '1', '2', '2', '4', '0', '0.00', '11250.00', '0.00', '0.00', '0.00', 'proccessing', '2021-04-20 23:59:59', null, '2020-10-20 15:14:57', '2020-10-20 15:14:57');
INSERT INTO `borrow_repayments` VALUES ('7', '3', '1', '2', '2', '4', '0', '0.00', '11250.00', '0.00', '0.00', '0.00', 'proccessing', '2021-07-20 23:59:59', null, '2020-10-20 15:14:57', '2020-10-20 15:14:57');
INSERT INTO `borrow_repayments` VALUES ('8', '4', '1', '2', '2', '4', '0', '500000.00', '11250.00', '0.00', '0.00', '0.00', 'proccessing', '2021-10-20 23:59:59', null, '2020-10-20 15:14:57', '2020-10-20 15:14:57');
INSERT INTO `borrow_repayments` VALUES ('9', '1', '1', '2', '3', '5', '0', '0.00', '4500.00', '0.00', '4500.00', '0.00', 'completed', '2021-01-20 23:59:59', '2020-10-22 13:32:43', '2020-10-20 15:14:57', '2020-10-22 13:32:43');
INSERT INTO `borrow_repayments` VALUES ('10', '2', '1', '2', '3', '5', '0', '0.00', '4500.00', '0.00', '0.00', '0.00', 'proccessing', '2021-04-20 23:59:59', null, '2020-10-20 15:14:57', '2020-10-20 15:14:57');
INSERT INTO `borrow_repayments` VALUES ('11', '3', '1', '2', '3', '5', '0', '0.00', '4500.00', '0.00', '0.00', '0.00', 'proccessing', '2021-07-20 23:59:59', null, '2020-10-20 15:14:57', '2020-10-20 15:14:57');
INSERT INTO `borrow_repayments` VALUES ('12', '4', '1', '2', '3', '5', '0', '200000.00', '4500.00', '0.00', '0.00', '0.00', 'proccessing', '2021-10-20 23:59:59', null, '2020-10-20 15:14:57', '2020-10-20 15:14:57');

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

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
INSERT INTO `brands` VALUES ('8', 'del', 'brands/f9d6e06d77cb4fa48748f2094c9a83b4.jpg', '/', '2020-09-16 13:43:36', '2020-09-16 13:43:36');

-- ----------------------------
-- Table structure for `brand_categories`
-- ----------------------------
DROP TABLE IF EXISTS `brand_categories`;
CREATE TABLE `brand_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `brand_id` bigint(20) unsigned NOT NULL,
  `category_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `brand_categories_brand_id_foreign` (`brand_id`),
  KEY `brand_categories_category_id_foreign` (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of brand_categories
-- ----------------------------
INSERT INTO `brand_categories` VALUES ('1', '1', '18');
INSERT INTO `brand_categories` VALUES ('2', '2', '18');
INSERT INTO `brand_categories` VALUES ('3', '3', '18');
INSERT INTO `brand_categories` VALUES ('4', '4', '18');
INSERT INTO `brand_categories` VALUES ('5', '5', '18');
INSERT INTO `brand_categories` VALUES ('6', '6', '18');
INSERT INTO `brand_categories` VALUES ('7', '7', '18');
INSERT INTO `brand_categories` VALUES ('8', '8', '19');
INSERT INTO `brand_categories` VALUES ('9', '1', '11');
INSERT INTO `brand_categories` VALUES ('10', '1', '19');
INSERT INTO `brand_categories` VALUES ('11', '1', '20');
INSERT INTO `brand_categories` VALUES ('12', '1', '21');
INSERT INTO `brand_categories` VALUES ('13', '1', '22');
INSERT INTO `brand_categories` VALUES ('14', '1', '23');
INSERT INTO `brand_categories` VALUES ('15', '1', '50');

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
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cart_items
-- ----------------------------
INSERT INTO `cart_items` VALUES ('16', '1', '15', '2');
INSERT INTO `cart_items` VALUES ('19', '1', '1', '1');

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
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_parent_id_foreign` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES ('1', '手机配件', '0', '1', '0', '-', 'images/4c29c2ef4b31101e341e8276e33faaf3.jpg', '2020-06-22 15:03:34', '2020-08-12 11:18:13');
INSERT INTO `categories` VALUES ('2', '手机壳', '1', '0', '1', '-1-', 'images/4c29c2ef4b31101e341e8276e33faaf3.jpg', '2020-06-22 15:03:34', '2020-06-22 15:03:34');
INSERT INTO `categories` VALUES ('3', '贴膜', '1', '0', '1', '-1-', 'images/4c29c2ef4b31101e341e8276e33faaf3.jpg', '2020-06-22 15:03:34', '2020-06-22 15:03:34');
INSERT INTO `categories` VALUES ('4', '存储卡', '1', '0', '1', '-1-', 'images/4c29c2ef4b31101e341e8276e33faaf3.jpg', '2020-06-22 15:03:34', '2020-06-22 15:03:34');
INSERT INTO `categories` VALUES ('5', '数据线', '1', '0', '1', '-1-', 'images/4c29c2ef4b31101e341e8276e33faaf3.jpg', '2020-06-22 15:03:34', '2020-06-22 15:03:34');
INSERT INTO `categories` VALUES ('6', '充电器', '1', '0', '1', '-1-', 'images/4c29c2ef4b31101e341e8276e33faaf3.jpg', '2020-06-22 15:03:34', '2020-06-22 15:03:34');
INSERT INTO `categories` VALUES ('7', '耳机', '1', '1', '1', '-1-', 'images/4c29c2ef4b31101e341e8276e33faaf3.jpg', '2020-06-22 15:03:34', '2020-06-22 15:03:34');
INSERT INTO `categories` VALUES ('8', '有线耳机', '7', '0', '2', '-1-7-', 'images/4c29c2ef4b31101e341e8276e33faaf3.jpg', '2020-06-22 15:03:34', '2020-06-22 15:03:34');
INSERT INTO `categories` VALUES ('9', '蓝牙耳机', '7', '0', '2', '-1-7-', 'images/4c29c2ef4b31101e341e8276e33faaf3.jpg', '2020-06-22 15:03:34', '2020-06-22 15:03:34');
INSERT INTO `categories` VALUES ('10', '电脑配件', '0', '1', '0', '-', 'images/51d10a21892b58d152a6ba52dce7c9ef.jpg', '2020-06-22 15:03:34', '2020-08-12 11:18:45');
INSERT INTO `categories` VALUES ('11', '显示器', '10', '0', '1', '-10-', 'images/51d10a21892b58d152a6ba52dce7c9ef.jpg', '2020-06-22 15:03:34', '2020-06-22 15:03:34');
INSERT INTO `categories` VALUES ('12', '显卡', '10', '0', '1', '-10-', 'images/51d10a21892b58d152a6ba52dce7c9ef.jpg', '2020-06-22 15:03:35', '2020-06-22 15:03:35');
INSERT INTO `categories` VALUES ('13', '内存', '10', '0', '1', '-10-', 'images/51d10a21892b58d152a6ba52dce7c9ef.jpg', '2020-06-22 15:03:35', '2020-06-22 15:03:35');
INSERT INTO `categories` VALUES ('14', 'CPU', '10', '0', '1', '-10-', 'images/51d10a21892b58d152a6ba52dce7c9ef.jpg', '2020-06-22 15:03:35', '2020-06-22 15:03:35');
INSERT INTO `categories` VALUES ('15', '主板', '10', '0', '1', '-10-', 'images/51d10a21892b58d152a6ba52dce7c9ef.jpg', '2020-06-22 15:03:35', '2020-06-22 15:03:35');
INSERT INTO `categories` VALUES ('16', '硬盘', '10', '0', '1', '-10-', 'images/51d10a21892b58d152a6ba52dce7c9ef.jpg', '2020-06-22 15:03:35', '2020-06-22 15:03:35');
INSERT INTO `categories` VALUES ('17', '电脑整机', '0', '1', '0', '-', 'images/3fd6ebf8cbb9ea1bc4ba4e826870b1e9.jpg', '2020-06-22 15:03:35', '2020-08-12 11:19:02');
INSERT INTO `categories` VALUES ('18', '笔记本', '17', '0', '1', '-17-', 'images/3fd6ebf8cbb9ea1bc4ba4e826870b1e9.jpg', '2020-06-22 15:03:35', '2020-06-22 15:03:35');
INSERT INTO `categories` VALUES ('19', '台式机', '17', '0', '1', '-17-', 'images/3fd6ebf8cbb9ea1bc4ba4e826870b1e9.jpg', '2020-06-22 15:03:35', '2020-06-22 15:03:35');
INSERT INTO `categories` VALUES ('20', '平板电脑', '17', '0', '1', '-17-', 'images/3fd6ebf8cbb9ea1bc4ba4e826870b1e9.jpg', '2020-06-22 15:03:35', '2020-06-22 15:03:35');
INSERT INTO `categories` VALUES ('21', '一体机', '17', '0', '1', '-17-', 'images/3fd6ebf8cbb9ea1bc4ba4e826870b1e9.jpg', '2020-06-22 15:03:35', '2020-06-22 15:03:35');
INSERT INTO `categories` VALUES ('22', '服务器', '17', '0', '1', '-17-', 'images/3fd6ebf8cbb9ea1bc4ba4e826870b1e9.jpg', '2020-06-22 15:03:35', '2020-06-22 15:03:35');
INSERT INTO `categories` VALUES ('23', '工作站', '17', '0', '1', '-17-', 'images/3fd6ebf8cbb9ea1bc4ba4e826870b1e9.jpg', '2020-06-22 15:03:35', '2020-06-22 15:03:35');
INSERT INTO `categories` VALUES ('24', '手机通讯', '0', '1', '0', '-', 'images/72054d2bf36cee3ee1d080555c999e4d.jpg', '2020-06-22 15:03:35', '2020-08-12 11:19:24');
INSERT INTO `categories` VALUES ('25', '智能机', '24', '0', '1', '-24-', 'images/72054d2bf36cee3ee1d080555c999e4d.jpg', '2020-06-22 15:03:35', '2020-06-22 15:03:35');
INSERT INTO `categories` VALUES ('26', '老人机', '24', '0', '1', '-24-', 'images/72054d2bf36cee3ee1d080555c999e4d.jpg', '2020-06-22 15:03:35', '2020-06-22 15:03:35');
INSERT INTO `categories` VALUES ('27', '对讲机', '24', '0', '1', '-24-', 'images/72054d2bf36cee3ee1d080555c999e4d.jpg', '2020-06-22 15:03:35', '2020-06-22 15:03:35');
INSERT INTO `categories` VALUES ('28', '安防设备', '0', '1', '0', '-', 'images/3c50b5e023e5c09937178ef5ff40b35a.jpg', '2020-06-22 16:03:25', '2020-08-12 11:20:09');
INSERT INTO `categories` VALUES ('29', '摄像头', '28', '0', '1', '-28-', 'images/3c50b5e023e5c09937178ef5ff40b35a.jpg', '2020-06-22 16:04:10', '2020-06-22 16:04:10');
INSERT INTO `categories` VALUES ('30', '监控器', '28', '0', '1', '-28-', 'images/3c50b5e023e5c09937178ef5ff40b35a.jpg', '2020-06-22 16:05:03', '2020-06-22 16:05:14');
INSERT INTO `categories` VALUES ('32', '电子教育', '0', '1', '0', '-', 'images/d91f10bea2efb16d32e8dbe122a35bf8.jpg', '2020-06-24 15:28:57', '2020-08-12 11:20:20');
INSERT INTO `categories` VALUES ('33', '复读机', '32', '0', '1', '-32-', 'images/d91f10bea2efb16d32e8dbe122a35bf8.jpg', '2020-06-24 15:29:33', '2020-06-24 17:14:25');
INSERT INTO `categories` VALUES ('34', '手表', '0', '1', '0', '-', 'images/ec1c1b7bfa32c671d9c1ebaabd864170.jpg', '2020-06-24 15:30:20', '2020-08-12 11:20:36');
INSERT INTO `categories` VALUES ('35', '苹果手表', '34', '0', '1', '-34-', 'images/ec1c1b7bfa32c671d9c1ebaabd864170.jpg', '2020-06-24 15:30:37', '2020-06-24 15:30:37');
INSERT INTO `categories` VALUES ('36', '相机', '0', '1', '0', '-', 'images/af43ab41468dc631c5af35ec039a3238.jpg', '2020-06-24 15:32:07', '2020-08-12 11:20:47');
INSERT INTO `categories` VALUES ('37', '佳能', '36', '0', '1', '-36-', 'images/af43ab41468dc631c5af35ec039a3238.jpg', '2020-06-24 15:32:21', '2020-06-24 15:32:21');
INSERT INTO `categories` VALUES ('38', '游戏机', '0', '1', '0', '-', 'images/c0085370c926039907a0e4f7dfc21057.jpg', '2020-06-24 16:06:15', '2020-08-12 11:21:00');
INSERT INTO `categories` VALUES ('39', '索尼', '38', '0', '1', '-38-', 'images/c0085370c926039907a0e4f7dfc21057.jpg', '2020-06-24 16:06:30', '2020-06-24 16:06:30');
INSERT INTO `categories` VALUES ('40', '电视', '0', '1', '0', '-', 'images/f6e9426c2ced6ccea323ad9eb704602d.jpg', '2020-06-25 11:01:34', '2020-08-12 11:21:13');
INSERT INTO `categories` VALUES ('41', '液晶电视', '40', '0', '1', '-40-', 'images/f6e9426c2ced6ccea323ad9eb704602d.jpg', '2020-06-25 11:02:05', '2020-06-25 11:02:05');
INSERT INTO `categories` VALUES ('42', '空调', '0', '1', '0', '-', 'images/7a1cb7e268d3fa49ed6defb26a296693.gif', '2020-06-25 11:07:45', '2020-08-12 11:21:26');
INSERT INTO `categories` VALUES ('43', '格力空调', '42', '0', '1', '-42-', 'images/7a1cb7e268d3fa49ed6defb26a296693.gif', '2020-06-25 11:08:02', '2020-06-25 11:08:02');
INSERT INTO `categories` VALUES ('44', '三星Watch', '34', '0', '1', '-34-', 'images/7a1cb7e268d3fa49ed6defb26a296693.gif', '2020-06-25 11:14:29', '2020-06-25 11:14:29');
INSERT INTO `categories` VALUES ('45', '机器人', '0', '1', '0', '-', 'images/c3f4348272a8453f14c8048b867ef0e8.jpg', '2020-06-25 11:17:05', '2020-08-12 11:21:39');
INSERT INTO `categories` VALUES ('46', '扫地机器人', '45', '0', '1', '-45-', 'images/c3f4348272a8453f14c8048b867ef0e8.jpg', '2020-06-25 11:17:21', '2020-06-25 11:17:21');
INSERT INTO `categories` VALUES ('47', '小米手表', '34', '0', '1', '-34-', 'images/c3f4348272a8453f14c8048b867ef0e8.jpg', '2020-06-25 12:30:10', '2020-06-25 12:30:10');
INSERT INTO `categories` VALUES ('48', '华为手表', '34', '0', '1', '-34-', 'images/c3f4348272a8453f14c8048b867ef0e8.jpg', '2020-06-25 12:34:56', '2020-06-25 12:34:56');
INSERT INTO `categories` VALUES ('49', '佳明手表', '34', '0', '1', '-34-', 'images/c3f4348272a8453f14c8048b867ef0e8.jpg', '2020-06-25 12:43:38', '2020-06-25 12:43:38');
INSERT INTO `categories` VALUES ('50', '鼠标', '10', '0', '1', '-10-', 'images/51d10a21892b58d152a6ba52dce7c9ef.jpg', '2020-06-25 17:55:11', '2020-06-25 17:55:11');
INSERT INTO `categories` VALUES ('55', '海尔空调', '42', '0', '1', '-42-', 'images/7a1cb7e268d3fa49ed6defb26a296693.gif', '2020-08-04 15:03:38', '2020-08-04 15:03:58');

-- ----------------------------
-- Table structure for `companies`
-- ----------------------------
DROP TABLE IF EXISTS `companies`;
CREATE TABLE `companies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公司名称',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公司封面',
  `idcard` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '统一社会信用代码',
  `corporation` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '法人',
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '电话',
  `yyzz` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '营业执照图片',
  `khxkz` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '开户许可证图片',
  `swdj` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '税务登记图片',
  `frsfz` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '法人身份证图片',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '描述',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of companies
-- ----------------------------
INSERT INTO `companies` VALUES ('1', '2', '孟子大学', 'http://test.xslp.cn:8080/storage/images/20127251705451556.jpg', '371328197910201039', '哈哈', '15165108623', 'http://test.xslp.cn:8080/storage/images/20127251715020800.jpg', 'http://test.xslp.cn:8080/storage/images/20127251731536317.jpg', 'http://test.xslp.cn:8080/storage/images/201281616534720869.jpg', 'http://test.xslp.cn:8080/storage/images/9b7298349bf44b06e42071ec10b9440b.jpg', '哈哈', '2020-10-13 15:57:49', '2020-10-13 15:57:49');
INSERT INTO `companies` VALUES ('2', '2', '经济大学', 'images/5.gif', '371328197910201039', '哦哦', '15165108623', 'images/3.jpg', 'images/4.jpg', 'images/7.jpg', 'images/592212a92d66b380296ca2b91fa2d230.jpg', '批', '2020-10-13 16:04:04', '2020-10-13 16:04:04');
INSERT INTO `companies` VALUES ('3', '2', '中南公司', 'images/blog-item-image-1.jpg', '371328197910201039', '国故', '15165108623', 'images/blog-item-image-1-lg.jpg', 'images/blog-item-image-2.jpg', 'images/blog-item-image-3.jpg', 'images/blog-item-image-4.jpg', '212112', '2020-10-14 11:18:12', '2020-10-14 11:18:12');

-- ----------------------------
-- Table structure for `coupons`
-- ----------------------------
DROP TABLE IF EXISTS `coupons`;
CREATE TABLE `coupons` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `coupon_type_id` int(10) unsigned NOT NULL COMMENT '优惠券类型id',
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '优惠券编码',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '领用人',
  `use_order_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '优惠券使用订单id',
  `create_order_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建订单id(优惠券只有是完成订单发放的优惠券时才有值)',
  `get_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '获取方式1订单2.首页领取',
  `state` tinyint(4) NOT NULL DEFAULT '0',
  `fetch_time` datetime DEFAULT NULL COMMENT '领取时间',
  `use_time` datetime DEFAULT NULL COMMENT '使用时间',
  `start_time` datetime DEFAULT NULL COMMENT '有效期开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '有效期结束时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of coupons
-- ----------------------------
INSERT INTO `coupons` VALUES ('1', '1', '10001', '1', '0', '0', '0', '1', '2020-09-09 16:20:26', null, '2020-09-15 13:54:05', '2020-09-28 13:54:13', '1', '2020-09-09 14:00:27', '2020-09-09 16:20:26');
INSERT INTO `coupons` VALUES ('2', '1', '10002', '0', '0', '0', '0', '0', '2020-09-09 16:16:51', null, '2020-09-15 13:54:05', '2020-09-28 13:54:13', '1', '2020-09-09 14:00:20', '2020-09-09 16:16:51');
INSERT INTO `coupons` VALUES ('3', '2', '10003', '1', '0', '0', '0', '1', '2020-09-09 16:20:42', null, '2020-09-15 13:56:20', '2020-09-28 13:54:13', '1', '2020-09-09 14:12:15', '2020-09-09 16:20:42');
INSERT INTO `coupons` VALUES ('4', '2', '10004', '0', '0', '0', '0', '0', '2020-09-09 16:16:51', null, '2020-09-15 13:56:20', '2020-09-28 13:54:13', '1', '2020-09-09 14:12:22', '2020-09-09 16:16:51');
INSERT INTO `coupons` VALUES ('5', '3', '10005', '1', '0', '0', '0', '1', '2020-09-10 10:59:57', null, '2020-09-10 10:53:16', '2020-09-28 10:53:20', '1', '2020-09-10 10:54:55', '2020-09-10 10:59:57');
INSERT INTO `coupons` VALUES ('6', '3', '10006', '0', '0', '0', '0', '0', null, null, '2020-09-10 10:53:16', '2020-09-28 10:53:20', '1', '2020-09-10 10:54:59', '2020-09-10 10:55:05');
INSERT INTO `coupons` VALUES ('7', '4', 'PDTTWFYXLDGYYOUD', '0', '0', '0', '0', '0', null, null, '2020-10-01 14:42:59', '2020-10-28 14:43:08', '1', '2020-09-18 14:43:58', '2020-09-18 14:43:58');
INSERT INTO `coupons` VALUES ('8', '4', 'MFHUGKOT7MU2C5J9', '0', '0', '0', '0', '0', null, null, '2020-10-01 14:42:59', '2020-10-28 14:43:08', '1', '2020-09-18 14:43:58', '2020-09-18 14:43:58');
INSERT INTO `coupons` VALUES ('9', '5', 'YUCPABY7HXGYKIJU', '0', '0', '0', '0', '0', null, null, '2020-09-18 14:53:55', '2020-09-21 14:53:55', '1', '2020-09-18 14:53:55', '2020-09-18 14:53:55');
INSERT INTO `coupons` VALUES ('10', '5', '1M71QTOIEITMGDAN', '0', '0', '0', '0', '0', null, null, '2020-09-18 14:53:55', '2020-09-21 14:53:55', '1', '2020-09-18 14:53:55', '2020-09-18 14:53:55');
INSERT INTO `coupons` VALUES ('11', '6', 'C8I3BDBKF8OWPYPN', '1', '0', '0', '0', '1', '2020-09-25 10:52:38', null, '2020-10-01 00:00:00', '2022-10-09 00:00:00', '1', '2020-09-22 16:13:15', '2020-09-25 10:52:38');
INSERT INTO `coupons` VALUES ('12', '6', 'TNMNPE19QXASXUSU', '5', '29', '0', '0', '1', '2020-10-27 10:46:02', '2020-10-27 15:33:38', '2020-10-01 00:00:00', '2022-10-09 00:00:00', '2', '2020-09-22 16:13:15', '2020-10-27 15:33:38');
INSERT INTO `coupons` VALUES ('13', '7', 'S4O2WRXECZ08X4M4', '0', '0', '0', '0', '0', null, null, null, null, '1', '2020-09-23 14:42:45', '2020-09-23 14:42:45');
INSERT INTO `coupons` VALUES ('14', '7', 'GXIXP0PJSGIIKV3V', '0', '0', '0', '0', '0', null, null, null, null, '1', '2020-09-23 14:42:45', '2020-09-23 14:42:45');
INSERT INTO `coupons` VALUES ('15', '8', '8NIFQRMXAMRJPLRK', '3', '0', '0', '0', '1', '2020-10-30 16:16:51', null, '2020-11-16 10:48:33', '2020-11-30 10:48:42', '1', '2020-10-27 10:48:58', '2020-10-30 16:16:51');
INSERT INTO `coupons` VALUES ('16', '8', 'LGJ9GR7ZJ4IYXO49', '0', '0', '0', '0', '0', null, null, '2020-11-16 10:48:33', '2020-11-30 10:48:42', '1', '2020-10-27 10:48:58', '2020-10-27 10:48:58');
INSERT INTO `coupons` VALUES ('17', '8', 'KKHHFYHGENYZCOXI', '0', '0', '0', '0', '0', null, null, '2020-11-16 10:48:33', '2020-11-30 10:48:42', '1', '2020-10-27 10:48:58', '2020-10-27 10:48:58');
INSERT INTO `coupons` VALUES ('18', '8', '5WYXZMFKQ0IZVWDR', '0', '0', '0', '0', '0', null, null, '2020-11-16 10:48:33', '2020-11-30 10:48:42', '1', '2020-10-27 10:48:58', '2020-10-27 10:48:58');
INSERT INTO `coupons` VALUES ('19', '8', 'NLPCMUGSQCAEZ0RG', '0', '0', '0', '0', '0', null, null, '2020-11-16 10:48:33', '2020-11-30 10:48:42', '1', '2020-10-27 10:48:58', '2020-10-27 10:48:58');
INSERT INTO `coupons` VALUES ('20', '8', '3RBJYNZRHLYODL84', '0', '0', '0', '0', '0', null, null, '2020-11-16 10:48:33', '2020-11-30 10:48:42', '1', '2020-10-27 10:48:58', '2020-10-27 10:48:58');

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
INSERT INTO `coupon_codes` VALUES ('1', 'qui enim incidunt', 'QJS331WEO5EG5QCP', '77.00', 'fixed', '77.01', '100', '0', '2020-08-10 06:06:49', '2020-11-29 06:06:49', '1', '2019-12-09 02:34:24', '2019-12-09 02:34:24');
INSERT INTO `coupon_codes` VALUES ('2', 'eaque corporis delectus', '5CONO1LAROMY6ZYD', '18.00', 'percent', '364.00', '100', '0', '2020-08-10 06:06:49', '2020-11-29 06:06:49', '1', '2019-12-09 02:34:24', '2019-12-09 02:34:24');
INSERT INTO `coupon_codes` VALUES ('3', 'nemo consequatur magnam', 'PSEXMTSBWGHRY7ZB', '37.00', 'percent', '851.00', '100', '0', '2020-08-10 06:06:49', '2020-11-29 06:06:49', '1', '2019-12-09 02:34:24', '2019-12-09 02:34:24');
INSERT INTO `coupon_codes` VALUES ('4', 'quo quo necessitatibus', 'VZROME6KLSL6G2FG', '49.00', 'percent', '0.00', '100', '0', '2020-08-10 06:06:49', '2020-11-29 06:06:49', '1', '2019-12-09 02:34:24', '2019-12-09 02:34:24');
INSERT INTO `coupon_codes` VALUES ('5', 'quis ut ut', 'J7BPV8AIURDWAO8Q', '15.00', 'percent', '0.00', '100', '0', '2020-08-10 06:06:49', '2020-11-29 06:06:49', '1', '2019-12-09 02:34:24', '2019-12-09 02:34:24');
INSERT INTO `coupon_codes` VALUES ('6', 'at quia enim', 'OESBNL3IHPDSNS8F', '26.00', 'percent', '0.00', '100', '0', '2020-08-10 06:06:49', '2020-11-29 06:06:49', '1', '2019-12-09 02:34:24', '2019-12-09 02:34:24');
INSERT INTO `coupon_codes` VALUES ('7', 'ut molestiae in', 'R6ITREMSUNM7CVRQ', '50.00', 'fixed', '50.01', '100', '0', '2020-08-10 06:06:49', '2020-11-29 06:06:49', '1', '2019-12-09 02:34:24', '2019-12-09 02:34:24');
INSERT INTO `coupon_codes` VALUES ('8', 'aut quos dignissimos', 'HFQDLOLSMGUE495C', '15.00', 'percent', '515.00', '100', '0', '2020-08-10 06:06:49', '2020-11-29 06:06:49', '1', '2019-12-09 02:34:24', '2019-12-09 02:34:24');
INSERT INTO `coupon_codes` VALUES ('9', 'magnam illum voluptatum', '0L0IEB6PVQD0QKQU', '20.00', 'percent', '891.00', '100', '0', '2020-08-10 06:06:49', '2020-11-29 06:06:49', '1', '2019-12-09 02:34:24', '2019-12-09 02:34:24');
INSERT INTO `coupon_codes` VALUES ('10', 'numquam illum odit', 'WFPYCYZRUGDICOZO', '90.00', 'fixed', '90.01', '100', '0', '2020-08-10 06:06:49', '2020-11-29 06:06:49', '1', '2019-12-09 02:34:24', '2019-12-09 02:34:24');
INSERT INTO `coupon_codes` VALUES ('11', 'guoguo', 'LSBXY7RZCRMCFFJ6', '20.00', 'fixed', '500.00', '1000', '0', '2019-12-09 05:47:26', '2020-11-29 06:06:49', '1', '2019-12-09 05:47:47', '2019-12-09 05:47:47');
INSERT INTO `coupon_codes` VALUES ('14', 'guo', 'JNKID6S0EAIOKIRA', '20.00', 'fixed', '500.00', '1000', '0', '2019-12-09 06:06:49', '2020-11-29 06:06:49', '1', '2019-12-09 06:07:10', '2019-12-09 06:07:10');

-- ----------------------------
-- Table structure for `coupon_products`
-- ----------------------------
DROP TABLE IF EXISTS `coupon_products`;
CREATE TABLE `coupon_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `coupon_type_id` bigint(20) unsigned NOT NULL COMMENT '优惠券类型id',
  `product_id` bigint(20) unsigned NOT NULL COMMENT '商品id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of coupon_products
-- ----------------------------
INSERT INTO `coupon_products` VALUES ('1', '3', '97');
INSERT INTO `coupon_products` VALUES ('2', '3', '98');
INSERT INTO `coupon_products` VALUES ('3', '3', '113');
INSERT INTO `coupon_products` VALUES ('4', '4', '1');
INSERT INTO `coupon_products` VALUES ('5', '4', '4');
INSERT INTO `coupon_products` VALUES ('6', '4', '5');
INSERT INTO `coupon_products` VALUES ('12', '3', '7');
INSERT INTO `coupon_products` VALUES ('10', '5', '112');
INSERT INTO `coupon_products` VALUES ('11', '5', '113');

-- ----------------------------
-- Table structure for `coupon_types`
-- ----------------------------
DROP TABLE IF EXISTS `coupon_types`;
CREATE TABLE `coupon_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '优惠券名称',
  `value` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '发放面额',
  `count` int(10) unsigned NOT NULL COMMENT '发放数量',
  `get_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '领取数量',
  `type` tinyint(4) NOT NULL COMMENT '优惠券类型 1:满减;2:折扣',
  `max_fetch` tinyint(4) DEFAULT '1' COMMENT '每人限领',
  `at_least` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '满多少元使用 0代表无限制',
  `need_user_level` tinyint(4) NOT NULL DEFAULT '0' COMMENT '领取人会员等级',
  `range_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '使用范围2部分产品使用 1全场产品使用',
  `get_start_time` datetime NOT NULL COMMENT '领取有效日期开始时间',
  `get_end_time` datetime NOT NULL COMMENT '领取有效日期结束时间',
  `start_time` datetime DEFAULT NULL COMMENT '有效日期开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '有效日期结束时间',
  `term_of_validity_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '有效期类型 0固定时间 1领取之日起',
  `fixed_term` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '领取之日起N天内有效',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态[0:禁用;1启用]',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of coupon_types
-- ----------------------------
INSERT INTO `coupon_types` VALUES ('1', '满2000减20', '20.00', '2', '1', '1', '1', '2000.00', '0', '1', '2020-09-09 13:53:50', '2020-09-11 13:53:56', '2020-09-15 13:54:05', '2020-09-28 13:54:13', '0', '1', '1', '2020-09-09 13:54:28', '2020-09-09 16:20:26');
INSERT INTO `coupon_types` VALUES ('2', '满3000减30', '30.00', '2', '1', '1', '1', '3000.00', '0', '1', '2020-09-09 13:56:00', '2020-09-11 13:56:03', '2020-09-15 13:56:20', '2020-09-28 13:54:13', '1', '2', '1', '2020-09-09 13:56:37', '2020-09-09 16:20:42');
INSERT INTO `coupon_types` VALUES ('3', '满5000减50', '50.00', '2', '1', '1', '1', '5000.00', '0', '2', '2020-09-10 10:53:00', '2020-09-28 10:53:04', '2020-09-10 10:53:16', '2020-09-28 10:53:20', '1', '3', '1', '2020-09-10 10:53:32', '2020-09-10 10:59:57');
INSERT INTO `coupon_types` VALUES ('4', '满10000减100', '100.00', '2', '0', '1', '1', '10000.00', '1', '2', '2020-09-21 14:41:37', '2020-09-27 14:41:42', '2020-10-01 14:42:59', '2020-10-28 14:43:08', '0', '1', '1', '2020-09-18 14:43:58', '2020-09-18 14:43:58');
INSERT INTO `coupon_types` VALUES ('5', '满5000折扣10', '90.00', '2', '0', '2', '1', '5000.00', '1', '2', '2020-09-19 14:53:21', '2020-09-30 14:53:23', null, null, '1', '3', '1', '2020-09-18 14:53:55', '2020-09-18 14:53:55');
INSERT INTO `coupon_types` VALUES ('6', '满3000减200', '200.00', '2', '2', '1', '1', '3000.00', '2', '1', '2020-09-23 00:00:00', '2020-10-29 00:00:00', '2020-10-01 00:00:00', '2022-10-09 00:00:00', '0', '1', '1', '2020-09-22 16:13:15', '2020-10-27 10:46:02');
INSERT INTO `coupon_types` VALUES ('7', '满10000减300', '300.00', '2', '0', '1', '1', '10000.00', '1', '1', '2020-10-08 14:42:02', '2020-10-12 14:42:15', null, null, '1', '3', '1', '2020-09-23 14:42:45', '2020-09-23 14:42:45');
INSERT INTO `coupon_types` VALUES ('8', '满5000减50', '50.00', '6', '1', '1', '1', '5000.00', '1', '1', '2020-10-27 10:48:12', '2020-11-09 10:48:18', '2020-11-16 10:48:33', '2020-11-30 10:48:42', '0', '1', '1', '2020-10-27 10:48:55', '2020-10-30 16:16:52');

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
INSERT INTO `crowdfunding_products` VALUES ('1', '60', '100000.00', '0.00', '0', '2020-11-28 15:00:00', 'funding');
INSERT INTO `crowdfunding_products` VALUES ('2', '63', '100000.00', '0.00', '0', '2020-11-28 15:00:00', 'funding');
INSERT INTO `crowdfunding_products` VALUES ('3', '71', '100000.00', '0.00', '0', '2020-11-28 15:00:00', 'funding');
INSERT INTO `crowdfunding_products` VALUES ('4', '108', '100000.00', '900.00', '1', '2020-11-28 15:00:00', 'funding');
INSERT INTO `crowdfunding_products` VALUES ('5', '114', '100000.00', '0.00', '0', '2020-11-28 15:00:00', 'funding');
INSERT INTO `crowdfunding_products` VALUES ('6', '121', '100000.00', '0.00', '0', '2020-11-28 15:00:00', 'funding');

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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------
INSERT INTO `failed_jobs` VALUES ('1', 'redis', 'default', '{\"uuid\":\"4f29155e-7b17-49c4-aa10-6219c671a8aa\",\"displayName\":\"App\\\\Jobs\\\\TranslateSlug\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\TranslateSlug\",\"command\":\"O:22:\\\"App\\\\Jobs\\\\TranslateSlug\\\":9:{s:7:\\\"\\u0000*\\u0000news\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\News\\\";s:2:\\\"id\\\";i:3;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"},\"id\":\"12\",\"attempts\":0,\"type\":\"job\",\"tags\":[\"App\\\\Models\\\\News:3\"],\"pushedAt\":\"1602468767.2637\"}', 'ReflectionException: Class Overtrue\\Pinyin\\Pinyin does not exist in F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php:809\nStack trace:\n#0 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(809): ReflectionClass->__construct(\'Overtrue\\\\Pinyin...\')\n#1 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(691): Illuminate\\Container\\Container->build(\'Overtrue\\\\Pinyin...\')\n#2 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(796): Illuminate\\Container\\Container->resolve(\'Overtrue\\\\Pinyin...\', Array, true)\n#3 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(637): Illuminate\\Foundation\\Application->resolve(\'Overtrue\\\\Pinyin...\', Array)\n#4 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(781): Illuminate\\Container\\Container->make(\'Overtrue\\\\Pinyin...\', Array)\n#5 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\helpers.php(119): Illuminate\\Foundation\\Application->make(\'Overtrue\\\\Pinyin...\', Array)\n#6 F:\\laravelprj\\jrshop\\app\\Handlers\\SlugTranslateHandler.php(73): app(\'Overtrue\\\\Pinyin...\')\n#7 F:\\laravelprj\\jrshop\\app\\Handlers\\SlugTranslateHandler.php(23): App\\Handlers\\SlugTranslateHandler->pinyin(\'1111111\')\n#8 F:\\laravelprj\\jrshop\\app\\Jobs\\TranslateSlug.php(29): App\\Handlers\\SlugTranslateHandler->translate(\'1111111\')\n#9 [internal function]: App\\Jobs\\TranslateSlug->handle()\n#10 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): call_user_func_array(Array, Array)\n#11 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(37): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#12 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#13 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(39): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#14 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(596): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#15 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(94): Illuminate\\Container\\Container->call(Array)\n#16 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(128): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\TranslateSlug))\n#17 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\TranslateSlug))\n#18 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(98): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#19 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(83): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\TranslateSlug), false)\n#20 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(128): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\TranslateSlug))\n#21 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\TranslateSlug))\n#22 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(85): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#23 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(59): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(App\\Jobs\\TranslateSlug))\n#24 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\RedisJob), Array)\n#25 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(356): Illuminate\\Queue\\Jobs\\Job->fire()\n#26 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(306): Illuminate\\Queue\\Worker->process(\'redis\', Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(Illuminate\\Queue\\WorkerOptions))\n#27 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(132): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\RedisJob), \'redis\', Object(Illuminate\\Queue\\WorkerOptions))\n#28 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(112): Illuminate\\Queue\\Worker->daemon(\'redis\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#29 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(96): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'redis\', \'default\')\n#30 [internal function]: Illuminate\\Queue\\Console\\WorkCommand->handle()\n#31 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): call_user_func_array(Array, Array)\n#32 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(37): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#33 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#34 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(39): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#35 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(596): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#36 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(134): Illuminate\\Container\\Container->call(Array)\n#37 F:\\laravelprj\\jrshop\\vendor\\symfony\\console\\Command\\Command.php(258): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#38 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(121): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#39 F:\\laravelprj\\jrshop\\vendor\\symfony\\console\\Application.php(911): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#40 F:\\laravelprj\\jrshop\\vendor\\symfony\\console\\Application.php(264): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#41 F:\\laravelprj\\jrshop\\vendor\\symfony\\console\\Application.php(140): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#42 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Application.php(93): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#43 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(129): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#44 F:\\laravelprj\\jrshop\\artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#45 {main}\n\nNext Illuminate\\Contracts\\Container\\BindingResolutionException: Target class [Overtrue\\Pinyin\\Pinyin] does not exist. in F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php:811\nStack trace:\n#0 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(691): Illuminate\\Container\\Container->build(\'Overtrue\\\\Pinyin...\')\n#1 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(796): Illuminate\\Container\\Container->resolve(\'Overtrue\\\\Pinyin...\', Array, true)\n#2 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(637): Illuminate\\Foundation\\Application->resolve(\'Overtrue\\\\Pinyin...\', Array)\n#3 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(781): Illuminate\\Container\\Container->make(\'Overtrue\\\\Pinyin...\', Array)\n#4 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\helpers.php(119): Illuminate\\Foundation\\Application->make(\'Overtrue\\\\Pinyin...\', Array)\n#5 F:\\laravelprj\\jrshop\\app\\Handlers\\SlugTranslateHandler.php(73): app(\'Overtrue\\\\Pinyin...\')\n#6 F:\\laravelprj\\jrshop\\app\\Handlers\\SlugTranslateHandler.php(23): App\\Handlers\\SlugTranslateHandler->pinyin(\'1111111\')\n#7 F:\\laravelprj\\jrshop\\app\\Jobs\\TranslateSlug.php(29): App\\Handlers\\SlugTranslateHandler->translate(\'1111111\')\n#8 [internal function]: App\\Jobs\\TranslateSlug->handle()\n#9 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): call_user_func_array(Array, Array)\n#10 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(37): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#11 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#12 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(39): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#13 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(596): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#14 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(94): Illuminate\\Container\\Container->call(Array)\n#15 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(128): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\TranslateSlug))\n#16 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\TranslateSlug))\n#17 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(98): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#18 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(83): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\TranslateSlug), false)\n#19 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(128): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\TranslateSlug))\n#20 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\TranslateSlug))\n#21 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(85): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#22 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(59): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(App\\Jobs\\TranslateSlug))\n#23 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\RedisJob), Array)\n#24 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(356): Illuminate\\Queue\\Jobs\\Job->fire()\n#25 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(306): Illuminate\\Queue\\Worker->process(\'redis\', Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(Illuminate\\Queue\\WorkerOptions))\n#26 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(132): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\RedisJob), \'redis\', Object(Illuminate\\Queue\\WorkerOptions))\n#27 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(112): Illuminate\\Queue\\Worker->daemon(\'redis\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#28 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(96): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'redis\', \'default\')\n#29 [internal function]: Illuminate\\Queue\\Console\\WorkCommand->handle()\n#30 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): call_user_func_array(Array, Array)\n#31 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(37): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#32 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#33 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(39): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#34 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(596): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#35 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(134): Illuminate\\Container\\Container->call(Array)\n#36 F:\\laravelprj\\jrshop\\vendor\\symfony\\console\\Command\\Command.php(258): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#37 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(121): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#38 F:\\laravelprj\\jrshop\\vendor\\symfony\\console\\Application.php(911): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#39 F:\\laravelprj\\jrshop\\vendor\\symfony\\console\\Application.php(264): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#40 F:\\laravelprj\\jrshop\\vendor\\symfony\\console\\Application.php(140): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#41 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Application.php(93): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#42 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(129): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#43 F:\\laravelprj\\jrshop\\artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#44 {main}', '2020-10-12 10:14:00');
INSERT INTO `failed_jobs` VALUES ('2', 'redis', 'default', '{\"uuid\":\"818410df-f8ce-444d-9572-a242e07c8374\",\"displayName\":\"App\\\\Jobs\\\\CloseOrder\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\CloseOrder\",\"command\":\"O:19:\\\"App\\\\Jobs\\\\CloseOrder\\\":9:{s:8:\\\"\\u0000*\\u0000order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:26;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";i:300;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"},\"id\":\"11\",\"attempts\":0,\"type\":\"job\",\"tags\":[\"App\\\\Models\\\\Order:26\"],\"pushedAt\":\"1600913025.4637\"}', 'TypeError: Argument 1 passed to Illuminate\\Database\\Eloquent\\Model::update() must be of the type array, string given, called in F:\\laravelprj\\jrshop\\app\\Services\\OrderService.php on line 308 and defined in F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php:660\nStack trace:\n#0 F:\\laravelprj\\jrshop\\app\\Services\\OrderService.php(308): Illuminate\\Database\\Eloquent\\Model->update(\'order_count\', 0)\n#1 F:\\laravelprj\\jrshop\\app\\Services\\OrderService.php(288): App\\Services\\OrderService->decreaseOrderCount(Object(App\\Models\\Order), \'pending\')\n#2 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Concerns\\ManagesTransactions.php(28): App\\Services\\OrderService->App\\Services\\{closure}(Object(Illuminate\\Database\\MySqlConnection))\n#3 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\DatabaseManager.php(367): Illuminate\\Database\\Connection->transaction(Object(Closure))\n#4 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Facades\\Facade.php(261): Illuminate\\Database\\DatabaseManager->__call(\'transaction\', Array)\n#5 F:\\laravelprj\\jrshop\\app\\Services\\OrderService.php(293): Illuminate\\Support\\Facades\\Facade::__callStatic(\'transaction\', Array)\n#6 F:\\laravelprj\\jrshop\\app\\Jobs\\CloseOrder.php(69): App\\Services\\OrderService->closeOrder(Object(App\\Models\\Order))\n#7 [internal function]: App\\Jobs\\CloseOrder->handle()\n#8 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): call_user_func_array(Array, Array)\n#9 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(37): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#10 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#11 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(39): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#12 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(596): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#13 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(94): Illuminate\\Container\\Container->call(Array)\n#14 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(128): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\CloseOrder))\n#15 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\CloseOrder))\n#16 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(98): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#17 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(83): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\CloseOrder), false)\n#18 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(128): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\CloseOrder))\n#19 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\CloseOrder))\n#20 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(85): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#21 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(59): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(App\\Jobs\\CloseOrder))\n#22 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\RedisJob), Array)\n#23 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(356): Illuminate\\Queue\\Jobs\\Job->fire()\n#24 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(306): Illuminate\\Queue\\Worker->process(\'redis\', Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(Illuminate\\Queue\\WorkerOptions))\n#25 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(132): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\RedisJob), \'redis\', Object(Illuminate\\Queue\\WorkerOptions))\n#26 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(112): Illuminate\\Queue\\Worker->daemon(\'redis\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#27 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(96): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'redis\', \'default\')\n#28 [internal function]: Illuminate\\Queue\\Console\\WorkCommand->handle()\n#29 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): call_user_func_array(Array, Array)\n#30 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(37): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#31 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#32 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(39): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#33 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(596): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#34 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(134): Illuminate\\Container\\Container->call(Array)\n#35 F:\\laravelprj\\jrshop\\vendor\\symfony\\console\\Command\\Command.php(258): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#36 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(121): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#37 F:\\laravelprj\\jrshop\\vendor\\symfony\\console\\Application.php(911): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#38 F:\\laravelprj\\jrshop\\vendor\\symfony\\console\\Application.php(264): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#39 F:\\laravelprj\\jrshop\\vendor\\symfony\\console\\Application.php(140): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#40 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Application.php(93): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#41 F:\\laravelprj\\jrshop\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(129): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#42 F:\\laravelprj\\jrshop\\artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#43 {main}', '2020-10-12 10:14:00');

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of images
-- ----------------------------
INSERT INTO `images` VALUES ('1', '1', 'avatar', 'http://myshop.xslp.cn:8080/uploads/images/avatars/202007/21/1_1595312234_7VyXeT2Knc.jpg', '2020-07-21 14:17:15', '2020-07-21 14:17:15');
INSERT INTO `images` VALUES ('2', '1', 'avatar', 'http://myshop.xslp.cn:8080/uploads/images/avatars/202007/21/1_1595312234_7VyXeT2Knc.jpg', '2020-07-21 14:25:53', '2020-07-21 14:25:53');
INSERT INTO `images` VALUES ('3', '1', 'avatar', 'http://myshop.xslp.cn:8080/uploads/images/avatars/202007/21/1_1595312234_7VyXeT2Knc.jpg', '2020-07-21 14:27:47', '2020-07-21 14:27:47');
INSERT INTO `images` VALUES ('4', '1', 'avatar', 'http://myshop.xslp.cn:8080/uploads/images/avatars/202007/21/1_1595312234_7VyXeT2Knc.jpg', '2020-07-21 14:32:11', '2020-07-21 14:32:11');
INSERT INTO `images` VALUES ('5', '1', 'opinion', 'http://test.xslp.cn:8080//uploads/images/opinions/202009/08/1_1599554089_sh9QE7E7RH.png', '2020-09-08 16:34:49', '2020-09-08 16:34:49');
INSERT INTO `images` VALUES ('6', '1', 'avatar', 'http://test.xslp.cn:8080/uploads/images/avatars/202010/23/1_1603421603_zuLNGszdaT.jpg', '2020-10-23 10:53:24', '2020-10-23 10:53:24');
INSERT INTO `images` VALUES ('7', '1', 'avatar', 'http://test.xslp.cn:8080/uploads/images/avatars/202010/23/1_1603422223_VckUTfCK8E.jpg', '2020-10-23 11:03:43', '2020-10-23 11:03:43');
INSERT INTO `images` VALUES ('8', '1', 'avatar', 'http://test.xslp.cn:8080/uploads/images/avatars/202010/23/1_1603422384_GMMdKNRabC.jpg', '2020-10-23 11:06:24', '2020-10-23 11:06:24');

-- ----------------------------
-- Table structure for `migrations`
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
INSERT INTO `migrations` VALUES ('16', '2020_08_22_133106_products_add_category_id', '6');
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
INSERT INTO `migrations` VALUES ('33', '2020_08_12_100214_add_image_to_category', '16');
INSERT INTO `migrations` VALUES ('34', '2020_06_04_092219_create_categories_table', '17');
INSERT INTO `migrations` VALUES ('35', '2020_08_18_171106_create_news_categories_table', '18');
INSERT INTO `migrations` VALUES ('36', '2020_08_18_171323_create_news_table', '19');
INSERT INTO `migrations` VALUES ('37', '2020_08_18_171352_create_news_comments_table', '19');
INSERT INTO `migrations` VALUES ('38', '2020_08_19_135208_create_ad_categories_table', '20');
INSERT INTO `migrations` VALUES ('39', '2020_08_19_145557_create_advs_table', '21');
INSERT INTO `migrations` VALUES ('40', '2020_08_20_161240_add_sku_id_to_products', '22');
INSERT INTO `migrations` VALUES ('41', '2020_08_21_163758_add_weixin_session_key_to_users_table', '23');
INSERT INTO `migrations` VALUES ('42', '2020_08_25_092052_add_member_level_to_users', '24');
INSERT INTO `migrations` VALUES ('43', '2020_08_25_094209_create_user_footprints_table', '25');
INSERT INTO `migrations` VALUES ('44', '2020_08_25_111914_create_notifications_table', '26');
INSERT INTO `migrations` VALUES ('45', '2020_08_25_112528_add_notification_count_to_users', '27');
INSERT INTO `migrations` VALUES ('46', '2020_08_25_114008_create_user_notifiable_types_table', '28');
INSERT INTO `migrations` VALUES ('47', '2020_08_25_154342_create_order_counts_table', '29');
INSERT INTO `migrations` VALUES ('48', '2020_09_07_150811_add_birthday_qq_to_users', '30');
INSERT INTO `migrations` VALUES ('49', '2020_09_07_171852_create_announces_table', '31');
INSERT INTO `migrations` VALUES ('50', '2020_09_07_173145_create_sitehelp_types_table', '31');
INSERT INTO `migrations` VALUES ('51', '2020_09_07_173158_create_sitehelps_table', '31');
INSERT INTO `migrations` VALUES ('52', '2020_09_07_174727_create_user_invoices_table', '31');
INSERT INTO `migrations` VALUES ('53', '2020_09_07_174755_create_order_invoices_table', '31');
INSERT INTO `migrations` VALUES ('54', '2020_09_07_175218_create_site_opinions_table', '31');
INSERT INTO `migrations` VALUES ('55', '2020_09_09_101947_create_coupon_types_table', '32');
INSERT INTO `migrations` VALUES ('56', '2020_09_09_102041_create_coupons_table', '32');
INSERT INTO `migrations` VALUES ('57', '2020_09_09_102108_create_coupon_products_table', '32');
INSERT INTO `migrations` VALUES ('58', '2020_09_15_150000_create_suppliers_table', '33');
INSERT INTO `migrations` VALUES ('59', '2020_09_15_154016_create_base_properties_table', '33');
INSERT INTO `migrations` VALUES ('60', '2020_09_15_154028_create_base_property_items_table', '33');
INSERT INTO `migrations` VALUES ('61', '2020_09_15_154321_create_product_properties_table', '33');
INSERT INTO `migrations` VALUES ('62', '2020_09_15_162403_create_product_sku_properties_table', '33');
INSERT INTO `migrations` VALUES ('63', '2020_09_15_165134_add_unit_and_brand_id_and_supplier_id_to_products', '33');
INSERT INTO `migrations` VALUES ('64', '2020_09_15_165927_add_costprice_to_product_skus', '33');
INSERT INTO `migrations` VALUES ('78', '2020_09_30_144538_create_brand_categories_table', '38');
INSERT INTO `migrations` VALUES ('66', '2018_11_06_222923_create_transactions_table', '35');
INSERT INTO `migrations` VALUES ('67', '2018_11_07_192923_create_transfers_table', '35');
INSERT INTO `migrations` VALUES ('68', '2018_11_07_202152_update_transfers_table', '36');
INSERT INTO `migrations` VALUES ('69', '2018_11_15_124230_create_wallets_table', '37');
INSERT INTO `migrations` VALUES ('70', '2018_11_19_164609_update_transactions_table', '37');
INSERT INTO `migrations` VALUES ('71', '2018_11_20_133759_add_fee_transfers_table', '37');
INSERT INTO `migrations` VALUES ('72', '2018_11_22_131953_add_status_transfers_table', '37');
INSERT INTO `migrations` VALUES ('73', '2018_11_22_133438_drop_refund_transfers_table', '37');
INSERT INTO `migrations` VALUES ('74', '2019_05_13_111553_update_status_transfers_table', '37');
INSERT INTO `migrations` VALUES ('75', '2019_06_25_103755_add_exchange_status_transfers_table', '37');
INSERT INTO `migrations` VALUES ('76', '2019_07_29_184926_decimal_places_wallets_table', '37');
INSERT INTO `migrations` VALUES ('77', '2019_10_02_193759_add_discount_transfers_table', '37');
INSERT INTO `migrations` VALUES ('79', '2020_10_12_134006_create_borrows_table', '39');
INSERT INTO `migrations` VALUES ('80', '2020_10_12_145941_create_borrow_infos_table', '39');
INSERT INTO `migrations` VALUES ('81', '2020_10_12_151742_create_companies_table', '40');
INSERT INTO `migrations` VALUES ('82', '2020_10_12_170552_create_borrow_invests_table', '40');
INSERT INTO `migrations` VALUES ('83', '2020_10_12_170821_create_borrow_relevances_table', '40');
INSERT INTO `migrations` VALUES ('84', '2020_10_12_170846_create_borrow_repayments_table', '40');
INSERT INTO `migrations` VALUES ('85', '2020_10_13_105757_create_borrow_invest_transfers_table', '40');
INSERT INTO `migrations` VALUES ('86', '2020_10_28_161238_add_shop_id_to_orders', '41');
INSERT INTO `migrations` VALUES ('87', '2020_10_29_163645_add_ship_time_to_orders', '41');
INSERT INTO `migrations` VALUES ('88', '2020_10_30_101557_add_review_images_to_order_items', '42');
INSERT INTO `migrations` VALUES ('89', '2020_11_05_130758_create_product_evaluations_table', '43');

-- ----------------------------
-- Table structure for `news`
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `news_category_id` bigint(20) unsigned NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sender_id` int(11) DEFAULT '0',
  `sender_name` varchar(22) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `news_news_category_id_foreign` (`news_category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('1', '哈哈', null, '哈哈', '1', '1', '1', '0', null, '2020-08-19 10:54:50', '2020-08-19 10:54:52');
INSERT INTO `news` VALUES ('2', '非常好', null, '非常好', '1', '2', '2', '0', null, '2020-08-19 10:55:12', '2020-08-19 10:55:14');
INSERT INTO `news` VALUES ('3', '你好我是小明', 'http://test.xslp.cn:8080/storage/images/xj.jpg', '<p>11111111</p>', '1', '11111111', 'ni-hao-wo-shi-xiao-ming', '1', 'Administrator', '2020-10-12 10:12:45', '2020-10-12 10:31:38');

-- ----------------------------
-- Table structure for `news_categories`
-- ----------------------------
DROP TABLE IF EXISTS `news_categories`;
CREATE TABLE `news_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `description` text COLLATE utf8mb4_unicode_ci COMMENT '描述',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of news_categories
-- ----------------------------
INSERT INTO `news_categories` VALUES ('1', '品牌', '品牌', '2020-08-19 10:54:13', '2020-08-19 10:54:16');
INSERT INTO `news_categories` VALUES ('2', '时尚', '时尚', '2020-10-10 15:52:08', '2020-10-10 15:52:08');
INSERT INTO `news_categories` VALUES ('3', '财富', '财富', '2020-10-10 15:52:08', '2020-10-10 15:52:08');
INSERT INTO `news_categories` VALUES ('4', '生活', '生活', '2020-10-10 15:52:08', '2020-10-10 15:52:08');

-- ----------------------------
-- Table structure for `news_comments`
-- ----------------------------
DROP TABLE IF EXISTS `news_comments`;
CREATE TABLE `news_comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `news_id` bigint(20) unsigned NOT NULL,
  `user_id` int(11) DEFAULT '0',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `news_comments_news_id_foreign` (`news_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of news_comments
-- ----------------------------
INSERT INTO `news_comments` VALUES ('1', '1', '1', '111', '2020-08-19 10:55:33', '2020-08-19 10:55:36');
INSERT INTO `news_comments` VALUES ('2', '2', '1', '12', '2020-08-19 10:55:42', '2020-08-19 10:55:45');
INSERT INTO `news_comments` VALUES ('3', '3', '1', '23332', '2020-10-12 10:56:19', '2020-10-12 10:56:22');

-- ----------------------------
-- Table structure for `notifications`
-- ----------------------------
DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) unsigned NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of notifications
-- ----------------------------
INSERT INTO `notifications` VALUES ('1111', 'App\\Notifications\\ProductOnsale', 'App\\Models\\User', '1', '{\"id\":121,\"image\":\"http://test.xslp.cn:8080/storage/product/00aa60d90281624184e097b72521f37d.jpg\",\"price\":3600,\"title\":\"米10\"}', '2020-09-02 14:02:55', '2020-09-01 14:16:41', '2020-09-02 14:02:55');
INSERT INTO `notifications` VALUES ('2d93fb1e-9971-4b88-b71a-8e683ab46cf4', 'App\\Notifications\\WebAnnounceNotification', 'App\\Models\\User', '1', '{\"id\":8,\"title\":\"\\u4fc3\\u9500\\u4fc3\\u9500\\u6d3b\\u52a8\\u5f00\\u59cb\\u4e86\",\"synopsis\":\"\\u4fc3\\u9500\\u4fc3\\u9500\\u6d3b\\u52a8\\u5f00\\u59cb\\u4e86\",\"cover\":\"http:\\/\\/test.xslp.cn:8080\\/\\/storage\\/images\\/cf75bd2214c7070d6ea31d847ec9cf70.jpg\"}', null, '2020-09-23 13:53:28', '2020-09-23 13:53:28');
INSERT INTO `notifications` VALUES ('83e3fb17-e3c9-4449-97fd-2a61727bf97a', 'App\\Notifications\\WebAnnounceNotification', 'App\\Models\\User', '2', '{\"id\":8,\"title\":\"\\u4fc3\\u9500\\u4fc3\\u9500\\u6d3b\\u52a8\\u5f00\\u59cb\\u4e86\",\"synopsis\":\"\\u4fc3\\u9500\\u4fc3\\u9500\\u6d3b\\u52a8\\u5f00\\u59cb\\u4e86\",\"cover\":\"http:\\/\\/test.xslp.cn:8080\\/\\/storage\\/images\\/cf75bd2214c7070d6ea31d847ec9cf70.jpg\"}', null, '2020-09-23 13:53:28', '2020-09-23 13:53:28');
INSERT INTO `notifications` VALUES ('8b2a063f-8483-4bd3-957c-d689c813732f', 'App\\Notifications\\WebAnnounceNotification', 'App\\Models\\User', '1', '{\"id\":9,\"title\":\"\\u5546\\u54c1\\u79d2\\u6740\\u4e86\\u554a\",\"synopsis\":\"\\u5546\\u54c1\\u79d2\\u6740\\u4e86\\u554a\",\"cover\":\"http:\\/\\/test.xslp.cn:8080\\/\\/storage\\/images\\/7ee742795cbb132d200df56247300587.jpg\"}', null, '2020-09-23 13:57:38', '2020-09-23 13:57:38');
INSERT INTO `notifications` VALUES ('0ab4987d-980b-450f-bb5f-a12900a882ee', 'App\\Notifications\\WebAnnounceNotification', 'App\\Models\\User', '2', '{\"id\":9,\"title\":\"\\u5546\\u54c1\\u79d2\\u6740\\u4e86\\u554a\",\"synopsis\":\"\\u5546\\u54c1\\u79d2\\u6740\\u4e86\\u554a\",\"cover\":\"http:\\/\\/test.xslp.cn:8080\\/\\/storage\\/images\\/7ee742795cbb132d200df56247300587.jpg\"}', null, '2020-09-23 13:57:38', '2020-09-23 13:57:38');
INSERT INTO `notifications` VALUES ('399e4aee-8a35-4985-aa91-c1915ec2da94', 'App\\Notifications\\WebAnnounceNotification', 'App\\Models\\User', '1', '{\"id\":10,\"title\":\"\\u5927\\u5bb6\\u53ef\\u4ee5\\u4f17\\u7b79\\u559c\\u6b22\\u7684\\u5546\\u54c1\\u4e86\",\"synopsis\":\"\\u5927\\u5bb6\\u53ef\\u4ee5\\u4f17\\u7b79\\u559c\\u6b22\\u7684\\u5546\\u54c1\\u4e86\",\"cover\":\"http:\\/\\/test.xslp.cn:8080\\/\\/storage\\/images\\/af943746c01675a713b9f9fea8bc73fd.jpg\"}', null, '2020-09-23 14:01:06', '2020-09-23 14:01:06');
INSERT INTO `notifications` VALUES ('a37cb480-83f1-4c52-865f-ac08f4b8f1e0', 'App\\Notifications\\WebAnnounceNotification', 'App\\Models\\User', '2', '{\"id\":10,\"title\":\"\\u5927\\u5bb6\\u53ef\\u4ee5\\u4f17\\u7b79\\u559c\\u6b22\\u7684\\u5546\\u54c1\\u4e86\",\"synopsis\":\"\\u5927\\u5bb6\\u53ef\\u4ee5\\u4f17\\u7b79\\u559c\\u6b22\\u7684\\u5546\\u54c1\\u4e86\",\"cover\":\"http:\\/\\/test.xslp.cn:8080\\/\\/storage\\/images\\/af943746c01675a713b9f9fea8bc73fd.jpg\"}', null, '2020-09-23 14:01:06', '2020-09-23 14:01:06');
INSERT INTO `notifications` VALUES ('d98df7fc-1a65-40f6-86b9-d0af31e37198', 'App\\Notifications\\CouponNotification', 'App\\Models\\User', '1', '{\"id\":7,\"title\":\"\\u6ee110000\\u51cf300\",\"get_start_time\":\"2020-10-08T06:42:02.000000Z\",\"get_end_time\":\"2020-10-12T06:42:15.000000Z\"}', null, '2020-09-23 14:42:45', '2020-09-23 14:42:45');
INSERT INTO `notifications` VALUES ('b63bef8d-5916-4329-b727-7108f6dcf03a', 'App\\Notifications\\CouponNotification', 'App\\Models\\User', '2', '{\"id\":7,\"title\":\"\\u6ee110000\\u51cf300\",\"get_start_time\":\"2020-10-08T06:42:02.000000Z\",\"get_end_time\":\"2020-10-12T06:42:15.000000Z\"}', null, '2020-09-23 14:42:45', '2020-09-23 14:42:45');
INSERT INTO `notifications` VALUES ('05ac1e5a-9c97-49f9-8833-3f00f035f1ff', 'App\\Notifications\\CouponNotification', 'App\\Models\\User', '1', '{\"id\":8,\"title\":\"\\u6ee15000\\u51cf50\",\"get_start_time\":\"2020-10-27T02:48:12.000000Z\",\"get_end_time\":\"2020-11-09T02:48:18.000000Z\"}', null, '2020-10-27 15:44:28', '2020-10-27 15:44:28');
INSERT INTO `notifications` VALUES ('813f5de6-bb8c-48a9-9a32-d48000b97942', 'App\\Notifications\\CouponNotification', 'App\\Models\\User', '2', '{\"id\":8,\"title\":\"\\u6ee15000\\u51cf50\",\"get_start_time\":\"2020-10-27T02:48:12.000000Z\",\"get_end_time\":\"2020-11-09T02:48:18.000000Z\"}', null, '2020-10-27 15:44:28', '2020-10-27 15:44:28');
INSERT INTO `notifications` VALUES ('decbb4f0-63b7-46da-8716-354460eeb24f', 'App\\Notifications\\CouponNotification', 'App\\Models\\User', '3', '{\"id\":8,\"title\":\"\\u6ee15000\\u51cf50\",\"get_start_time\":\"2020-10-27T02:48:12.000000Z\",\"get_end_time\":\"2020-11-09T02:48:18.000000Z\"}', null, '2020-10-27 15:44:28', '2020-10-27 15:44:28');
INSERT INTO `notifications` VALUES ('34b8c9a8-0c43-4a45-b407-57cb0b09e486', 'App\\Notifications\\CouponNotification', 'App\\Models\\User', '4', '{\"id\":8,\"title\":\"\\u6ee15000\\u51cf50\",\"get_start_time\":\"2020-10-27T02:48:12.000000Z\",\"get_end_time\":\"2020-11-09T02:48:18.000000Z\"}', null, '2020-10-27 15:44:28', '2020-10-27 15:44:28');
INSERT INTO `notifications` VALUES ('875e6c9d-a70c-467e-ac5b-684337eaf004', 'App\\Notifications\\CouponNotification', 'App\\Models\\User', '5', '{\"id\":8,\"title\":\"\\u6ee15000\\u51cf50\",\"get_start_time\":\"2020-10-27T02:48:12.000000Z\",\"get_end_time\":\"2020-11-09T02:48:18.000000Z\"}', null, '2020-10-27 15:44:28', '2020-10-27 15:44:28');

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'normal',
  `no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `shop_id` int(10) unsigned NOT NULL DEFAULT '1',
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
  `ship_time` datetime DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('5', 'normal', '20200709111332694919', '1', '1', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c68\\u8857\\u9053\\u7b2c847\\u53f7\",\"zip\":384200,\"contact_name\":\"\\u6c6a\\u6d9b\",\"contact_phone\":\"18485197712\"}', '7500.00', '55555', null, null, null, null, 'pending', null, '1', '0', 'pending', null, null, null, '2020-07-09 11:13:32', '2020-07-09 11:14:03');
INSERT INTO `orders` VALUES ('6', 'normal', '20200709132141966461', '1', '1', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c68\\u8857\\u9053\\u7b2c847\\u53f7\",\"zip\":384200,\"contact_name\":\"\\u6c6a\\u6d9b\",\"contact_phone\":\"18485197712\"}', '6000.00', '哈哈', null, null, null, null, 'pending', null, '1', '0', 'pending', null, null, null, '2020-07-09 13:21:41', '2020-07-09 14:15:22');
INSERT INTO `orders` VALUES ('9', 'normal', '20200709135641221812', '1', '1', '{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c14\\u8857\\u9053\\u7b2c110\\u53f7\",\"zip\":837000,\"contact_name\":\"\\u55bb\\u52c7\",\"contact_phone\":\"18765645898\"}', '350.00', 'asd', null, null, null, null, 'pending', null, '1', '0', 'pending', null, null, null, '2020-07-09 13:56:41', '2020-07-09 15:40:43');
INSERT INTO `orders` VALUES ('10', 'normal', '20200709165543852656', '1', '1', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c26\\u8857\\u9053\\u7b2c204\\u53f7\",\"zip\":151300,\"contact_name\":\"\\u6885\\u5efa\\u534e\",\"contact_phone\":\"13278354425\"}', '100.00', '支付', '2020-07-09 17:36:46', null, 'alipay', '2020070922001499730501213780', 'applied', null, '0', '1', 'received', '{\"express_company\":\"\\u83dc\\u9e1f\\u7269\\u6d41\",\"express_no\":\"cn0001\"}', '2020-07-10 16:42:50', '{\"refund_reason\":\"haode\",\"refund_disagree_reason\":\"hello\"}', '2020-07-09 16:55:43', '2020-07-10 15:54:42');
INSERT INTO `orders` VALUES ('11', 'normal', '20200709174407050573', '1', '1', '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u660c\\u5e73\\u533a\\u738b\\u5e9c\\u5927\\u8857101\\u53f7\",\"zip\":600006,\"contact_name\":\"\\u7c73\\u5c0f\\u5708\",\"contact_phone\":\"15165108626\"}', '350.00', '米小圈收', '2020-07-10 16:25:18', null, 'alipay', '2020071022001499730501213785', 'pending', null, '0', '1', 'delivered', '{\"express_company\":\"\\u83dc\\u9e1f\\u7269\\u6d41\",\"express_no\":\"cn0002\"}', '2020-07-10 16:43:01', null, '2020-07-09 17:44:07', '2020-08-27 16:29:02');
INSERT INTO `orders` VALUES ('12', 'normal', '20200710171536422175', '1', '1', '{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c14\\u8857\\u9053\\u7b2c110\\u53f7\",\"zip\":837000,\"contact_name\":\"\\u55bb\\u52c7\",\"contact_phone\":\"18765645898\"}', '2990.00', 'xia dan le', null, '11', null, null, 'pending', null, '1', '0', 'pending', null, null, null, '2020-07-10 17:15:36', '2020-07-14 16:05:59');
INSERT INTO `orders` VALUES ('13', 'crowdfunding', '20200714154731047930', '1', '1', '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u660c\\u5e73\\u533a\\u738b\\u5e9c\\u5927\\u8857101\\u53f7\",\"zip\":600006,\"contact_name\":\"\\u7c73\\u5c0f\\u5708\",\"contact_phone\":\"15165108626\"}', '600.00', '', '2020-07-14 16:05:46', null, 'alipay', '2020071422001499730501216530', 'pending', null, '0', '0', 'pending', null, null, null, '2020-07-14 15:47:31', '2020-07-14 16:05:46');
INSERT INTO `orders` VALUES ('14', 'crowdfunding', '20200714165242770509', '1', '1', '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u660c\\u5e73\\u533a\\u738b\\u5e9c\\u5927\\u8857101\\u53f7\",\"zip\":600006,\"contact_name\":\"\\u7c73\\u5c0f\\u5708\",\"contact_phone\":\"15165108626\"}', '300.00', '', '2020-07-14 17:09:20', null, 'alipay', '2020071422001499730501216839', 'pending', null, '0', '1', 'received', null, null, null, '2020-07-14 16:52:42', '2020-08-20 13:23:24');
INSERT INTO `orders` VALUES ('15', 'seckill', '20200715152251335094', '1', '1', '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u660c\\u5e73\\u533a\\u738b\\u5e9c\\u5927\\u8857101\\u53f7\",\"zip\":600006,\"contact_name\":\"\\u7c73\\u5c0f\\u5708\",\"contact_phone\":\"15165108626\"}', '349.00', '', null, null, null, null, 'pending', null, '1', '0', 'pending', null, null, null, '2020-07-15 15:22:51', '2020-07-15 15:33:28');
INSERT INTO `orders` VALUES ('16', 'seckill', '20200715155324430072', '1', '1', '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u660c\\u5e73\\u533a\\u738b\\u5e9c\\u5927\\u8857101\\u53f7\",\"zip\":600006,\"contact_name\":\"\\u7c73\\u5c0f\\u5708\",\"contact_phone\":\"15165108626\"}', '349.00', '', null, null, null, null, 'pending', null, '1', '0', 'pending', null, null, null, '2020-07-15 15:53:24', '2020-07-15 15:58:26');
INSERT INTO `orders` VALUES ('19', 'normal', '20200814093313005147', '1', '1', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c68\\u8857\\u9053\\u7b2c847\\u53f7\",\"zip\":384200,\"contact_name\":\"\\u6c6a\\u6d9b\",\"contact_phone\":\"18485197712\"}', '3600.00', '00', null, null, null, null, 'pending', null, '1', '0', 'pending', null, null, null, '2020-08-14 09:33:13', '2020-08-14 09:33:16');
INSERT INTO `orders` VALUES ('20', 'normal', '20200814094231527806', '1', '1', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c68\\u8857\\u9053\\u7b2c847\\u53f7\",\"zip\":384200,\"contact_name\":\"\\u6c6a\\u6d9b\",\"contact_phone\":\"18485197712\"}', '3600.00', 'haha', null, null, null, null, 'pending', null, '1', '0', 'pending', null, null, null, '2020-08-14 09:42:31', '2020-08-14 09:42:31');
INSERT INTO `orders` VALUES ('21', 'normal', '20200814094614220364', '1', '1', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c68\\u8857\\u9053\\u7b2c847\\u53f7\",\"zip\":384200,\"contact_name\":\"\\u6c6a\\u6d9b\",\"contact_phone\":\"18485197712\"}', '3600.00', '000', null, null, null, null, 'pending', null, '1', '0', 'pending', null, null, null, '2020-08-14 09:46:14', '2020-08-14 09:46:15');
INSERT INTO `orders` VALUES ('22', 'normal', '20200814100101200013', '1', '1', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c68\\u8857\\u9053\\u7b2c847\\u53f7\",\"zip\":384200,\"contact_name\":\"\\u6c6a\\u6d9b\",\"contact_phone\":\"18485197712\"}', '3600.00', '11', null, null, null, null, 'pending', null, '0', '0', 'pending', null, null, null, '2020-08-14 10:01:01', '2020-08-14 10:01:01');
INSERT INTO `orders` VALUES ('23', 'normal', '20200814101954200341', '1', '1', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c68\\u8857\\u9053\\u7b2c847\\u53f7\",\"zip\":384200,\"contact_name\":\"\\u6c6a\\u6d9b\",\"contact_phone\":\"18485197712\"}', '3600.00', '9999', null, null, null, null, 'pending', null, '1', '0', 'pending', null, null, null, '2020-08-14 10:19:54', '2020-08-14 10:19:54');
INSERT INTO `orders` VALUES ('24', 'normal', '20200814103247402216', '1', '1', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c68\\u8857\\u9053\\u7b2c847\\u53f7\",\"zip\":384200,\"contact_name\":\"\\u6c6a\\u6d9b\",\"contact_phone\":\"18485197712\"}', '3600.00', '1221', null, null, null, null, 'pending', null, '1', '0', 'pending', null, null, null, '2020-08-14 10:32:47', '2020-08-14 10:32:47');
INSERT INTO `orders` VALUES ('25', 'normal', '20200904112945854238', '1', '1', '{\"address\":\"\\u5c71\\u4e1c\\u7701\\u6d4e\\u5357\\u5e02\\u5929\\u6865\\u533a\\u5f71\\u5c71\\u82b1\\u56ed2-2-302\",\"zip\":262000,\"contact_name\":\"\\u90ed\\u7ee7\\u5b89\",\"contact_phone\":\"15165108626\"}', '100.00', null, null, null, null, null, 'pending', null, '1', '0', 'pending', null, null, null, '2020-09-04 11:29:45', '2020-09-23 13:44:26');
INSERT INTO `orders` VALUES ('26', 'normal', '20200924100342147202', '1', '1', '{\"address\":\"\\u5c71\\u4e1c\\u7701\\u6d4e\\u5357\\u5e02\\u5929\\u6865\\u533a\\u5f71\\u5c71\\u82b1\\u56ed2-2-302\",\"zip\":262000,\"contact_name\":\"\\u90ed\\u7ee7\\u5b89\",\"contact_phone\":\"15165108626\"}', '3600.00', 'haha', null, null, null, null, 'pending', null, '0', '0', 'pending', null, null, null, '2020-09-24 10:03:42', '2020-09-24 10:03:42');
INSERT INTO `orders` VALUES ('29', 'normal', '20201027153338543750', '5', '1', '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u5bc6\\u4e91\\u533a\\u738b\\u5e9c\\u5927\\u8857200\\u53f7\",\"zip\":600000,\"contact_name\":\"\\u674e\\u519b\",\"contact_phone\":\"15165108623\"}', '2800.00', '6', '2020-10-27 15:41:28', null, 'alipay', '2020102722001499730501373781', 'pending', null, '0', '0', 'received', '{\"express_company\":\"\\u83dc\\u9e1f\\u7269\\u6d41\",\"express_no\":\"cn0002\"}', '2020-10-28 16:43:15', null, '2020-10-27 15:33:38', '2020-10-28 09:28:34');
INSERT INTO `orders` VALUES ('31', 'normal', '20201028105334000001', '5', '1', '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u5bc6\\u4e91\\u533a\\u738b\\u5e9c\\u5927\\u8857200\\u53f7\",\"zip\":600000,\"contact_name\":\"\\u674e\\u519b\",\"contact_phone\":\"15165108623\"}', '3000.00', '下单', null, null, null, null, 'pending', null, '1', '0', 'pending', null, null, null, '2020-10-28 10:53:34', '2020-10-28 10:58:37');
INSERT INTO `orders` VALUES ('32', 'normal', '20201028110042831983', '5', '1', '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u5bc6\\u4e91\\u533a\\u738b\\u5e9c\\u5927\\u8857200\\u53f7\",\"zip\":600000,\"contact_name\":\"\\u674e\\u519b\",\"contact_phone\":\"15165108623\"}', '3000.00', '下单', '2020-10-28 11:03:05', null, 'webself', '32', 'pending', null, '0', '0', 'delivered', '{\"express_company\":\"\\u83dc\\u9e1f\\u7269\\u6d41\",\"express_no\":\"cn0008\"}', '2020-10-29 16:43:22', null, '2020-10-28 11:00:42', '2020-10-29 14:12:48');
INSERT INTO `orders` VALUES ('33', 'normal', '20201028163914040118', '5', '1', '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u5bc6\\u4e91\\u533a\\u738b\\u5e9c\\u5927\\u8857200\\u53f7\",\"zip\":600000,\"contact_name\":\"\\u674e\\u519b\",\"contact_phone\":\"15165108623\"}', '3000.00', '下单', '2020-10-28 16:44:39', null, 'webself', '33', 'pending', null, '0', '0', 'delivered', '{\"express_company\":\"\\u83dc\\u9e1f\\u7269\\u6d41\",\"express_no\":\"cn0006\"}', '2020-10-29 16:43:27', '{\"refund_reason\":\"999\",\"refund_disagree_reason\":\"\\u975e\\u6cd5\"}', '2020-10-28 16:39:14', '2020-10-29 13:37:35');
INSERT INTO `orders` VALUES ('34', 'normal', '20201029091627102156', '5', '1', '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u5bc6\\u4e91\\u533a\\u738b\\u5e9c\\u5927\\u8857200\\u53f7\",\"zip\":600000,\"contact_name\":\"\\u674e\\u519b\",\"contact_phone\":\"15165108623\"}', '3000.00', '李军', '2020-10-29 09:17:06', null, 'webself', '34', 'success', '42c0e7d0a8884acaa933c74d2b9a0f81', '0', '0', 'delivered', '{\"express_company\":\"\\u83dc\\u9e1f\\u7269\\u6d41\",\"express_no\":\"cn0005\"}', '2020-10-29 16:43:31', '{\"refund_reason\":\"\\u9000\\u6b3e\\u6d4b\\u8bd5\"}', '2020-10-29 09:16:27', '2020-10-29 13:41:18');
INSERT INTO `orders` VALUES ('35', 'normal', '20201029145629812925', '3', '1', '{\"address\":\"\\u5c71\\u4e1c\\u7701\\u4e34\\u6c82\\u5e02\\u8499\\u9634\\u53bf\\u738b\\u5e9c\\u5927\\u8857100\\u53f71\",\"zip\":620000,\"contact_name\":\"\\u738b\\u5c0f\\u660e\",\"contact_phone\":\"15165108623\"}', '3000.00', 'haha', '2020-10-29 14:56:36', null, 'webself', '35', 'pending', null, '0', '1', 'received', '{\"express_company\":\"\\u83dc\\u9e1f\\u7269\\u6d41\",\"express_no\":\"cn00068\"}', '2020-10-29 16:43:34', null, '2020-10-29 14:56:29', '2020-10-30 14:47:54');
INSERT INTO `orders` VALUES ('36', 'normal', '20201104130905145966', '3', '1', '{\"address\":\"\\u5c71\\u4e1c\\u7701\\u4e34\\u6c82\\u5e02\\u8499\\u9634\\u53bf\\u738b\\u5e9c\\u5927\\u8857100\\u53f71\",\"zip\":620000,\"contact_name\":\"\\u738b\\u5c0f\\u660e\",\"contact_phone\":\"15165108623\"}', '3000.00', '不错，我就看看', '2020-11-04 13:41:56', null, 'webself', '36', 'pending', null, '0', '1', 'received', '{\"express_company\":\"\\u83dc\\u9e1f\\u7269\\u6d41\",\"express_no\":\"cn00068\"}', '2020-11-04 14:48:46', null, '2020-11-04 13:09:05', '2020-11-05 09:29:42');

-- ----------------------------
-- Table structure for `order_counts`
-- ----------------------------
DROP TABLE IF EXISTS `order_counts`;
CREATE TABLE `order_counts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `order_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_count` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_counts_user_id_foreign` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of order_counts
-- ----------------------------
INSERT INTO `order_counts` VALUES ('1', '1', 'pending', '1', '2020-08-25 16:10:42', '2020-08-25 16:10:52');
INSERT INTO `order_counts` VALUES ('2', '1', 'applied', '2', '2020-08-25 16:10:45', '2020-08-25 16:10:55');
INSERT INTO `order_counts` VALUES ('3', '1', 'delivered', '3', '2020-08-25 16:10:47', '2020-08-25 16:10:57');
INSERT INTO `order_counts` VALUES ('4', '1', 'received', '4', '2020-08-25 16:10:50', '2020-08-25 16:11:00');
INSERT INTO `order_counts` VALUES ('5', '5', 'pending', '1', '2020-10-27 15:33:38', '2020-10-29 09:17:06');
INSERT INTO `order_counts` VALUES ('6', '5', 'delivered', '3', '2020-10-27 15:46:45', '2020-10-29 14:12:48');
INSERT INTO `order_counts` VALUES ('7', '5', 'received', '0', '2020-10-28 09:28:34', '2020-10-29 13:41:18');
INSERT INTO `order_counts` VALUES ('8', '5', 'applied', '0', '2020-10-28 11:03:06', '2020-10-29 14:12:48');
INSERT INTO `order_counts` VALUES ('9', '3', 'pending', '0', '2020-10-29 14:56:29', '2020-11-04 13:41:57');
INSERT INTO `order_counts` VALUES ('10', '3', 'applied', '0', '2020-10-29 14:56:36', '2020-11-04 14:48:46');
INSERT INTO `order_counts` VALUES ('11', '3', 'delivered', '0', '2020-10-29 14:56:52', '2020-11-05 09:28:48');
INSERT INTO `order_counts` VALUES ('12', '3', 'received', '0', '2020-10-30 09:12:56', '2020-11-05 09:29:42');

-- ----------------------------
-- Table structure for `order_invoices`
-- ----------------------------
DROP TABLE IF EXISTS `order_invoices`;
CREATE TABLE `order_invoices` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL COMMENT '订单id',
  `order_sn` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '订单编号',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户id',
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '买家会员名称',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公司抬头',
  `duty_paragraph` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '税号',
  `opening_bank` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '开户行',
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '地址及电话',
  `content` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '内容',
  `tax_money` decimal(8,2) NOT NULL COMMENT '金额',
  `type` tinyint(4) NOT NULL COMMENT '类型 1企业 2个人',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_invoices_order_id_foreign` (`order_id`),
  KEY `order_invoices_user_id_foreign` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of order_invoices
-- ----------------------------
INSERT INTO `order_invoices` VALUES ('1', '11', '20200709174407050573', '1', 'guo', '1', '2', '3', '4', '5', '350.00', '1', '0', '2020-09-08 14:22:16', '2020-09-08 14:22:19');
INSERT INTO `order_invoices` VALUES ('2', '35', '20201029145629812925', '3', '郭继安', '联想科技', '371329001', '', '', '11', '3000.00', '1', '0', '2020-10-30 17:19:23', '2020-10-30 17:19:23');

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
  `review_images` text COLLATE utf8mb4_unicode_ci,
  `review` text COLLATE utf8mb4_unicode_ci,
  `reviewed_at` datetime DEFAULT NULL,
  `is_anonymous` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `order_items_order_id_foreign` (`order_id`),
  KEY `order_items_product_id_foreign` (`product_id`),
  KEY `order_items_product_sku_id_foreign` (`product_sku_id`),
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_ibfk_3` FOREIGN KEY (`product_sku_id`) REFERENCES `product_skus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of order_items
-- ----------------------------
INSERT INTO `order_items` VALUES ('1', '5', '75', '178', '7500.00', '1', null, null, null, null, '0');
INSERT INTO `order_items` VALUES ('2', '6', '76', '179', '3000.00', '2', null, null, null, null, '0');
INSERT INTO `order_items` VALUES ('5', '9', '79', '182', '350.00', '1', null, null, null, null, '0');
INSERT INTO `order_items` VALUES ('6', '10', '56', '8', '100.00', '1', '5', null, 'haha', '2020-07-10 11:24:00', '0');
INSERT INTO `order_items` VALUES ('7', '11', '79', '182', '350.00', '1', '4', null, 'hehe b', '2020-07-10 16:32:51', '0');
INSERT INTO `order_items` VALUES ('8', '12', '96', '199', '3000.00', '1', null, null, null, null, '0');
INSERT INTO `order_items` VALUES ('9', '13', '108', '211', '300.00', '2', null, null, null, null, '0');
INSERT INTO `order_items` VALUES ('10', '14', '108', '211', '300.00', '1', '5', null, '不错，挺好的，还会再来', '2020-08-20 13:23:24', '0');
INSERT INTO `order_items` VALUES ('11', '15', '99', '202', '349.00', '1', null, null, null, null, '0');
INSERT INTO `order_items` VALUES ('12', '16', '99', '202', '349.00', '1', null, null, null, null, '0');
INSERT INTO `order_items` VALUES ('14', '19', '121', '231', '3600.00', '1', null, null, null, null, '0');
INSERT INTO `order_items` VALUES ('15', '20', '121', '231', '3600.00', '1', null, null, null, null, '0');
INSERT INTO `order_items` VALUES ('16', '21', '121', '231', '3600.00', '1', null, null, null, null, '0');
INSERT INTO `order_items` VALUES ('17', '22', '121', '231', '3600.00', '1', null, null, null, null, '0');
INSERT INTO `order_items` VALUES ('18', '23', '121', '231', '3600.00', '1', null, null, null, null, '0');
INSERT INTO `order_items` VALUES ('19', '24', '121', '231', '3600.00', '1', null, null, null, null, '0');
INSERT INTO `order_items` VALUES ('20', '25', '59', '162', '100.00', '1', null, null, null, null, '0');
INSERT INTO `order_items` VALUES ('21', '26', '121', '231', '3600.00', '1', null, null, null, null, '0');
INSERT INTO `order_items` VALUES ('24', '29', '79', '182', '350.00', '4', null, null, null, null, '0');
INSERT INTO `order_items` VALUES ('25', '29', '95', '198', '800.00', '2', null, null, null, null, '0');
INSERT INTO `order_items` VALUES ('27', '31', '92', '195', '3000.00', '1', null, null, null, null, '0');
INSERT INTO `order_items` VALUES ('28', '32', '92', '195', '3000.00', '1', null, null, null, null, '0');
INSERT INTO `order_items` VALUES ('29', '33', '92', '195', '3000.00', '1', null, null, null, null, '0');
INSERT INTO `order_items` VALUES ('30', '34', '92', '195', '3000.00', '1', null, null, null, null, '0');
INSERT INTO `order_items` VALUES ('31', '35', '92', '195', '3000.00', '1', '3', '[\"http:\\/\\/test.xslp.cn:8080\\/uploads\\/images\\/reviews\\/202010\\/30\\/3_1604040286_OYz9xeQ5Pp.jpg\",\"http:\\/\\/test.xslp.cn:8080\\/uploads\\/images\\/reviews\\/202010\\/30\\/3_1604040290_KjnfIu21X1.jpg\"]', '哎，真的很一般啊。', '2020-10-30 14:47:54', '1');
INSERT INTO `order_items` VALUES ('32', '36', '91', '194', '3000.00', '1', '3', '[\"http:\\/\\/test.xslp.cn:8080\\/uploads\\/images\\/reviews\\/202011\\/05\\/3_1604539778_OW0hZ8mCPU.jpg\"]', '好不错哦', '2020-11-05 09:29:42', '1');

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
  `sku_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `discount_num` tinyint(4) NOT NULL DEFAULT '0',
  `original_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `unit` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand_id` int(10) unsigned DEFAULT NULL,
  `supplier_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_category_id_foreign` (`category_id`),
  KEY `products_type_index` (`type`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES ('1', 'normal', '3', '小米手机', 'product/30.jpg', '小米手机', '1', '0', '5.00', '0', '0', '1', '1500.00', '0', '1500.00', '2020-06-18 14:43:34', '2020-08-20 16:41:33', null, null, null);
INSERT INTO `products` VALUES ('4', 'normal', '20', 'iphone', 'product/201506221850588_16428.jpg', '1111', '1', '0', '5.00', '0', '0', '5', '8000.00', '0', '8000.00', '2020-06-19 17:19:23', '2020-08-20 16:41:33', null, null, null);
INSERT INTO `products` VALUES ('5', 'normal', '14', '联想T系列', 'product/1.jpg', '事实上', '1', '0', '5.00', '0', '0', '6', '6000.00', '0', '6000.00', '2020-06-19 17:23:43', '2020-08-20 16:41:33', null, null, null);
INSERT INTO `products` VALUES ('6', 'normal', '26', 'natus', 'product/product-image-1.jpg', 'Neque nisi voluptatibus necessitatibus ut veniam.', '1', '0', '3.00', '0', '0', '12', '638.00', '0', '638.00', '2020-06-22 09:16:24', '2020-08-20 16:41:34', null, null, null);
INSERT INTO `products` VALUES ('7', 'normal', '2', 'quo', 'product/product-image-2.jpg', 'Rerum est consequuntur omnis totam tenetur in ipsa.', '1', '0', '1.00', '0', '0', '15', '2672.00', '0', '2672.00', '2020-06-22 09:16:25', '2020-08-20 16:41:34', null, null, null);
INSERT INTO `products` VALUES ('8', 'normal', '4', 'qui', 'product/product-image-3.jpg', 'Quia qui repellat excepturi unde temporibus.', '1', '0', '4.00', '0', '0', '19', '3489.00', '0', '3489.00', '2020-06-22 09:16:25', '2020-08-20 16:41:34', null, null, null);
INSERT INTO `products` VALUES ('9', 'normal', '13', 'accusantium', 'product/product-image-4.jpg', 'Odio asperiores repellendus veritatis cumque.', '1', '0', '2.00', '0', '0', '22', '5479.00', '0', '5479.00', '2020-06-22 09:16:25', '2020-08-20 16:41:34', null, null, null);
INSERT INTO `products` VALUES ('10', 'normal', '6', 'nihil', 'product/product-image-5.jpg', 'Deleniti deserunt explicabo occaecati dignissimos cumque.', '1', '0', '3.00', '0', '0', '25', '2771.00', '0', '2771.00', '2020-06-22 09:16:25', '2020-08-20 16:41:34', null, null, null);
INSERT INTO `products` VALUES ('11', 'normal', '8', 'quis', 'product/product-image-6.jpg', 'Voluptatem qui neque aut voluptatibus.', '1', '0', '0.00', '0', '0', '28', '3016.00', '0', '3016.00', '2020-06-22 09:16:25', '2020-08-20 16:41:34', null, null, null);
INSERT INTO `products` VALUES ('12', 'normal', '29', 'consequatur', 'product/product-image-7.jpg', 'Similique dicta natus id architecto et eum nostrum.', '1', '0', '0.00', '0', '0', '31', '1700.00', '0', '1700.00', '2020-06-22 09:16:25', '2020-08-20 16:41:34', null, null, null);
INSERT INTO `products` VALUES ('13', 'normal', '5', 'quis', 'product/product-image-8.jpg', 'Alias minus et et ea molestiae quis.', '1', '0', '0.00', '0', '0', '32', '1382.00', '0', '1382.00', '2020-06-22 09:16:25', '2020-08-20 16:41:34', null, null, null);
INSERT INTO `products` VALUES ('14', 'normal', '23', 'distinctio', 'product/product-image-9.jpg', 'Earum alias quo quisquam est.', '1', '0', '0.00', '0', '0', '35', '551.00', '0', '551.00', '2020-06-22 09:16:25', '2020-08-20 16:41:34', null, null, null);
INSERT INTO `products` VALUES ('15', 'normal', '21', 'quibusdam', 'product/product-image-10.jpg', 'Atque nulla sit aut dolores.', '1', '0', '5.00', '0', '0', '40', '4485.00', '0', '4485.00', '2020-06-22 09:16:25', '2020-08-20 16:41:34', null, null, null);
INSERT INTO `products` VALUES ('16', 'normal', '14', 'optio', 'product/product-image-11.jpg', 'Inventore minus labore possimus nostrum qui cumque.', '1', '0', '2.00', '0', '0', '42', '626.00', '0', '626.00', '2020-06-22 09:16:25', '2020-08-20 16:41:34', null, null, null);
INSERT INTO `products` VALUES ('17', 'normal', '11', 'ipsum', 'product/product-image-12.jpg', 'Aliquid libero modi odit eius modi.', '1', '0', '2.00', '0', '0', '45', '3027.00', '0', '3027.00', '2020-06-22 09:16:25', '2020-08-20 16:41:34', null, null, null);
INSERT INTO `products` VALUES ('18', 'normal', '13', 'aut', 'product/product-image-13.jpg', 'Et nemo et aut soluta qui.', '1', '0', '5.00', '0', '0', '47', '2346.00', '0', '2346.00', '2020-06-22 09:16:25', '2020-08-20 16:41:34', null, null, null);
INSERT INTO `products` VALUES ('19', 'normal', '15', 'et', 'product/product-image-14.jpg', 'Dignissimos dolores voluptatem repellat et.', '1', '0', '0.00', '0', '0', '52', '3779.00', '0', '3779.00', '2020-06-22 09:16:25', '2020-08-20 16:41:34', null, null, null);
INSERT INTO `products` VALUES ('20', 'normal', '23', 'sequi', 'product/product-image-15.jpg', 'Labore quia reprehenderit et beatae eligendi eum.', '1', '0', '4.00', '0', '0', '55', '4191.00', '0', '4191.00', '2020-06-22 09:16:25', '2020-10-09 15:56:42', '个', '1', '1');
INSERT INTO `products` VALUES ('21', 'normal', '20', 'et', 'product/product-image-16.jpg', 'Earum vero hic fuga natus.', '1', '0', '4.00', '0', '1000', '58', '845.00', '0', '845.00', '2020-06-22 09:16:25', '2020-08-20 16:41:35', null, null, null);
INSERT INTO `products` VALUES ('22', 'normal', '9', 'sit', 'product/product-image-17.jpg', 'Officia voluptas quasi adipisci nihil repudiandae sunt suscipit.', '1', '0', '2.00', '100', '0', '60', '1449.00', '0', '1449.00', '2020-06-22 09:16:25', '2020-08-20 16:41:35', null, null, null);
INSERT INTO `products` VALUES ('23', 'normal', '26', 'dolorem', 'product/product-image-18.jpg', 'Ut nihil quae et.', '1', '0', '2.00', '0', '0', '64', '322.00', '0', '322.00', '2020-06-22 09:16:25', '2020-08-20 16:41:35', null, null, null);
INSERT INTO `products` VALUES ('24', 'normal', '30', 'ut', 'product/product-image-19.jpg', 'Possimus dolore repellendus eum dolores facere ea.', '1', '0', '3.00', '0', '0', '67', '244.00', '0', '244.00', '2020-06-22 09:16:25', '2020-08-20 16:41:35', null, null, null);
INSERT INTO `products` VALUES ('25', 'normal', '30', 'et', 'product/product-image-20.jpg', 'Sit numquam quos qui est.', '1', '0', '2.00', '0', '0', '69', '861.00', '0', '861.00', '2020-06-22 09:16:25', '2020-08-20 16:41:35', null, null, null);
INSERT INTO `products` VALUES ('26', 'normal', '5', 'incidunt', 'product/product-image-21.jpg', 'Modi vel dolor possimus corrupti.', '1', '0', '1.00', '0', '0', '71', '1586.00', '0', '1586.00', '2020-06-22 09:16:25', '2020-08-20 16:41:35', null, null, null);
INSERT INTO `products` VALUES ('27', 'normal', '5', 'mollitia', 'product/product-image-22.jpg', 'Eveniet mollitia aliquam in odit atque assumenda.', '1', '0', '0.00', '0', '0', '76', '6372.00', '0', '6372.00', '2020-06-22 09:16:25', '2020-08-20 16:41:35', null, null, null);
INSERT INTO `products` VALUES ('28', 'normal', '19', 'temporibus', 'https://cdn.learnku.com/uploads/images/201806/01/5320/2JMRaFwRpo.jpg', 'Non maxime non ipsa ut qui explicabo non.', '1', '0', '1.00', '0', '0', '78', '541.00', '0', '541.00', '2020-06-22 09:16:25', '2020-08-20 16:41:35', null, null, null);
INSERT INTO `products` VALUES ('29', 'normal', '15', 'aut', 'https://cdn.learnku.com/uploads/images/201806/01/5320/1B3n0ATKrn.jpg', 'Illum beatae reiciendis ea et non repellat id nam.', '1', '0', '1.00', '0', '0', '82', '3381.00', '0', '3381.00', '2020-06-22 09:16:25', '2020-08-20 16:41:35', null, null, null);
INSERT INTO `products` VALUES ('30', 'normal', '8', 'quisquam', 'https://cdn.learnku.com/uploads/images/201806/01/5320/2JMRaFwRpo.jpg', 'Architecto quo quis et praesentium voluptatum inventore.', '1', '0', '0.00', '0', '0', '85', '3939.00', '0', '3939.00', '2020-06-22 09:16:25', '2020-08-20 16:41:35', null, null, null);
INSERT INTO `products` VALUES ('31', 'normal', '2', 'magnam', 'https://cdn.learnku.com/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg', 'Aliquam mollitia cumque est officiis minus.', '1', '0', '5.00', '0', '0', '88', '5540.00', '0', '5540.00', '2020-06-22 09:16:25', '2020-08-20 16:41:35', null, null, null);
INSERT INTO `products` VALUES ('32', 'normal', '19', 'et', 'https://cdn.learnku.com/uploads/images/201806/01/5320/7kG1HekGK6.jpg', 'Non aliquid et nobis sed.', '1', '0', '1.00', '0', '0', '91', '3225.00', '0', '3225.00', '2020-06-22 09:16:25', '2020-08-20 16:41:35', null, null, null);
INSERT INTO `products` VALUES ('33', 'normal', '16', 'a', 'https://cdn.learnku.com/uploads/images/201806/01/5320/pa7DrV43Mw.jpg', 'Earum eveniet dolore maxime quisquam soluta.', '1', '0', '2.00', '0', '0', '94', '2218.00', '0', '2218.00', '2020-06-22 09:16:25', '2020-08-20 16:41:35', null, null, null);
INSERT INTO `products` VALUES ('34', 'normal', '15', 'et', 'https://cdn.learnku.com/uploads/images/201806/01/5320/82Wf2sg8gM.jpg', 'Consequatur esse consectetur quos dolorum sit debitis ut.', '1', '0', '1.00', '0', '0', '95', '3459.00', '0', '3459.00', '2020-06-22 09:16:25', '2020-08-20 16:41:35', null, null, null);
INSERT INTO `products` VALUES ('35', 'normal', '21', 'vitae', 'https://cdn.learnku.com/uploads/images/201806/01/5320/82Wf2sg8gM.jpg', 'Eum commodi nobis ad et rem.', '1', '0', '2.00', '0', '0', '99', '4497.00', '0', '4497.00', '2020-06-22 09:16:25', '2020-08-20 16:41:35', null, null, null);
INSERT INTO `products` VALUES ('36', 'normal', '2', 'qui', 'https://cdn.learnku.com/uploads/images/201806/01/5320/7kG1HekGK6.jpg', 'Architecto quo voluptas vel aperiam quia.', '1', '0', '2.00', '0', '0', '101', '2935.00', '0', '2935.00', '2020-06-22 09:16:25', '2020-08-20 16:41:35', null, null, null);
INSERT INTO `products` VALUES ('37', 'normal', '13', 'velit', 'https://cdn.learnku.com/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg', 'Dolorem et error dolorum repudiandae maxime debitis.', '1', '0', '2.00', '0', '0', '105', '1060.00', '0', '1060.00', '2020-06-22 09:16:25', '2020-08-20 16:41:35', null, null, null);
INSERT INTO `products` VALUES ('38', 'normal', '9', 'dicta', 'https://cdn.learnku.com/uploads/images/201806/01/5320/1B3n0ATKrn.jpg', 'Nihil corporis omnis necessitatibus provident porro.', '1', '0', '2.00', '0', '0', '107', '4227.00', '0', '4227.00', '2020-06-22 09:16:25', '2020-08-20 16:41:35', null, null, null);
INSERT INTO `products` VALUES ('39', 'normal', '18', 'similique', 'https://cdn.learnku.com/uploads/images/201806/01/5320/2JMRaFwRpo.jpg', 'Ea hic autem autem laborum et.', '1', '0', '1.00', '0', '0', '112', '708.00', '0', '708.00', '2020-06-22 09:16:26', '2020-08-20 16:41:35', null, null, null);
INSERT INTO `products` VALUES ('40', 'normal', '6', 'eum', 'https://cdn.learnku.com/uploads/images/201806/01/5320/r3BNRe4zXG.jpg', 'Necessitatibus alias natus ut vel pariatur ea.', '1', '0', '4.00', '0', '0', '115', '308.00', '0', '308.00', '2020-06-22 09:16:26', '2020-08-20 16:41:35', null, null, null);
INSERT INTO `products` VALUES ('41', 'normal', '20', 'delectus', 'product/C0bVuKB2nt.jpg', 'Saepe architecto non quia debitis.', '1', '0', '5.00', '260', '0', '118', '2650.00', '0', '2650.00', '2020-06-22 09:16:26', '2020-08-20 16:41:35', null, null, null);
INSERT INTO `products` VALUES ('42', 'normal', '18', 'asperiores', 'product/82Wf2sg8gM.jpg', 'Quis autem consectetur harum quo.', '1', '0', '5.00', '190', '0', '120', '321.00', '0', '321.00', '2020-06-22 09:16:26', '2020-09-16 16:22:47', '台', '5', '1');
INSERT INTO `products` VALUES ('43', 'normal', '12', 'veniam', 'https://cdn.learnku.com/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg', 'Ipsam et sint quisquam laborum sunt.', '1', '0', '4.00', '0', '0', '123', '1392.00', '0', '1392.00', '2020-06-22 09:16:26', '2020-08-20 16:41:35', null, null, null);
INSERT INTO `products` VALUES ('44', 'normal', '27', 'doloribus', 'product/r3BNRe4zXG.jpg', 'Beatae aut cum incidunt adipisci tempore consequatur.', '1', '0', '4.00', '200', '0', '125', '1381.00', '0', '1381.00', '2020-06-22 09:16:26', '2020-08-20 16:41:35', null, null, null);
INSERT INTO `products` VALUES ('45', 'normal', '3', 'aut', 'https://cdn.learnku.com/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg', 'Qui modi hic illo molestiae.', '1', '0', '4.00', '0', '0', '128', '5135.00', '0', '5135.00', '2020-06-22 09:16:26', '2020-08-20 16:41:35', null, null, null);
INSERT INTO `products` VALUES ('46', 'normal', '22', 'necessitatibus', 'https://cdn.learnku.com/uploads/images/201806/01/5320/XrtIwzrxj7.jpg', 'Facilis sed dignissimos fugiat dolorem qui.', '1', '0', '0.00', '0', '0', '132', '4848.00', '0', '4848.00', '2020-06-22 09:16:26', '2020-08-20 16:41:35', null, null, null);
INSERT INTO `products` VALUES ('47', 'normal', '5', 'qui', 'https://cdn.learnku.com/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg', 'Dicta consequatur tempore assumenda velit.', '1', '0', '4.00', '0', '0', '136', '972.00', '0', '972.00', '2020-06-22 09:16:26', '2020-08-20 16:41:35', null, null, null);
INSERT INTO `products` VALUES ('48', 'normal', '19', 'ut', 'product/pa7DrV43Mw.jpg', 'Sunt libero et qui perferendis maxime odit eaque.', '1', '0', '1.00', '330', '0', '139', '284.00', '0', '284.00', '2020-06-22 09:16:26', '2020-08-20 16:41:35', null, null, null);
INSERT INTO `products` VALUES ('49', 'normal', '6', 'rerum', 'https://cdn.learnku.com/uploads/images/201806/01/5320/pa7DrV43Mw.jpg', 'Libero debitis aliquid repellat aut asperiores et.', '1', '0', '5.00', '0', '0', '141', '2744.00', '0', '2744.00', '2020-06-22 09:16:26', '2020-08-20 16:41:35', null, null, null);
INSERT INTO `products` VALUES ('50', 'normal', '11', 'iste', 'https://cdn.learnku.com/uploads/images/201806/01/5320/1B3n0ATKrn.jpg', 'Aliquam ut aut aut cupiditate tempora architecto sed.', '1', '0', '3.00', '0', '0', '144', '2487.00', '0', '2487.00', '2020-06-22 09:16:26', '2020-08-20 16:41:36', null, null, null);
INSERT INTO `products` VALUES ('51', 'normal', '12', 'ab', 'https://cdn.learnku.com/uploads/images/201806/01/5320/7kG1HekGK6.jpg', 'Quibusdam ipsum et qui tenetur.', '1', '0', '4.00', '0', '0', '146', '1415.00', '0', '1415.00', '2020-06-22 09:16:26', '2020-08-20 16:41:36', null, null, null);
INSERT INTO `products` VALUES ('52', 'normal', '5', 'sit', 'https://cdn.learnku.com/uploads/images/201806/01/5320/7kG1HekGK6.jpg', 'Excepturi aliquid officiis totam dolorem cupiditate placeat nobis.', '1', '0', '4.00', '0', '0', '150', '1859.00', '0', '1859.00', '2020-06-22 09:16:26', '2020-08-20 16:41:36', null, null, null);
INSERT INTO `products` VALUES ('53', 'normal', '25', 'dolore', 'product/2JMRaFwRpo.jpg', 'Similique quam quas magnam animi soluta mollitia.', '1', '0', '4.00', '0', '0', '154', '948.00', '0', '948.00', '2020-06-22 09:16:26', '2020-08-20 16:41:36', null, null, null);
INSERT INTO `products` VALUES ('54', 'normal', '18', 'sint', 'product/7kG1HekGK6.jpg', 'Incidunt quas excepturi dolores.', '1', '0', '1.00', '0', '0', '156', '2394.00', '0', '2394.00', '2020-06-22 09:16:26', '2020-08-20 16:41:36', null, null, null);
INSERT INTO `products` VALUES ('55', 'normal', '14', 'ipsam', 'product/uYEHCJ1oRp.jpg', 'Est vel enim tenetur eligendi neque sunt aut.', '1', '0', '4.00', '300', '0', '159', '891.00', '0', '891.00', '2020-06-22 09:16:26', '2020-08-20 16:41:36', null, null, null);
INSERT INTO `products` VALUES ('56', 'normal', '20', '无线耳机', 'product/17.jpg', '无线耳机', '1', '0', '5.00', '1', '0', '9', '55.00', '0', '55.00', '2020-06-22 09:39:57', '2020-08-20 16:41:36', null, null, null);
INSERT INTO `products` VALUES ('57', 'normal', '29', '摄像头', 'product/3f214f6e91b11554d84e5233d6568b39.jpg', '111', '1', '0', '5.00', '0', '0', '10', '120.00', '0', '120.00', '2020-06-22 10:24:38', '2020-08-20 16:41:36', null, null, null);
INSERT INTO `products` VALUES ('58', 'normal', '29', '111', 'product/c47b74971475897c51fc086571f92b00.jpg', '1111', '1', '0', '5.00', '0', '0', '161', '6000.00', '0', '6000.00', '2020-06-22 16:25:31', '2020-08-20 16:41:36', null, null, null);
INSERT INTO `products` VALUES ('59', 'normal', '2', '1111', 'product/67fa71f36cb665136462a6bbe1b589dc.jpg', '是是是', '1', '0', '5.00', '0', '0', '162', '100.00', '0', '100.00', '2020-06-23 10:03:45', '2020-08-20 16:41:36', null, null, null);
INSERT INTO `products` VALUES ('60', 'crowdfunding', '2', '划船器', 'product/638dfb7de2d6ef40b83f72ca84686a49.jpg', '11111', '1', '0', '5.00', '0', '0', '163', '10000.00', '0', '10000.00', '2020-06-23 10:06:19', '2020-08-20 16:41:36', null, null, null);
INSERT INTO `products` VALUES ('61', 'normal', '2', '12222', 'product/8.jpg', '是是是', '1', '0', '5.00', '0', '0', '164', '5000.00', '0', '5000.00', '2020-06-23 10:45:22', '2020-08-20 16:41:36', null, null, null);
INSERT INTO `products` VALUES ('62', 'normal', '2', '普通商品', 'product/27.jpg', '普通商品', '1', '0', '5.00', '0', '0', '165', '100.00', '0', '100.00', '2020-06-23 10:53:36', '2020-08-20 16:41:36', null, null, null);
INSERT INTO `products` VALUES ('63', 'crowdfunding', '29', '摄像头', 'product/3.jpg', '摄像头', '1', '0', '5.00', '0', '0', '166', '500.00', '0', '500.00', '2020-06-23 10:55:54', '2020-08-20 16:41:36', null, null, null);
INSERT INTO `products` VALUES ('64', 'seckill', '2', '秒杀商品', 'product/15.jpg', '秒杀商品', '1', '0', '5.00', '0', '0', '167', '10.00', '10', '100.00', '2020-06-23 11:12:58', '2020-08-20 16:44:06', null, null, null);
INSERT INTO `products` VALUES ('65', 'discount', '2', '折扣商品', 'product/16.jpg', '试试', '1', '0', '5.00', '0', '0', '168', '100.00', '50', '200.00', '2020-06-23 15:10:35', '2020-08-20 16:41:36', null, null, null);
INSERT INTO `products` VALUES ('66', 'discount', '2', '测试', 'product/3eabf870ac6a4396dcf677871589c1e5.jpg', '1111', '1', '0', '5.00', '0', '0', '169', '80.00', '80', '100.00', '2020-06-23 15:22:48', '2020-08-20 16:41:36', null, null, null);
INSERT INTO `products` VALUES ('67', 'discount', '2', '折扣袜子', 'product/5.jpg', '折扣', '1', '0', '5.00', '0', '0', '170', '50.00', '50', '100.00', '2020-06-23 16:00:38', '2020-08-20 16:41:36', null, null, null);
INSERT INTO `products` VALUES ('68', 'discount', '2', '折扣手套', 'product/7.jpg', '1111', '1', '0', '5.00', '0', '0', '171', '30.00', '37', '80.00', '2020-06-23 16:03:26', '2020-08-20 16:41:36', null, null, null);
INSERT INTO `products` VALUES ('69', 'discount', '2', '折扣帽子', 'product/22.jpg', '11111', '1', '0', '5.00', '0', '0', '172', '80.00', '80', '100.00', '2020-06-23 16:05:26', '2020-08-20 16:41:36', null, null, null);
INSERT INTO `products` VALUES ('70', 'normal', '2', '普通物品', 'product/75b9fe4d934ecb3e6f7bfa5a5a7ebbf9.jpg', '12212', '1', '0', '5.00', '0', '0', '173', '100.00', '0', '100.00', '2020-06-23 16:06:34', '2020-08-20 16:41:36', null, null, null);
INSERT INTO `products` VALUES ('71', 'crowdfunding', '2', 'lv包', 'product/28.jpg', '11111', '1', '0', '5.00', '0', '0', '175', '6000.00', '0', '6000.00', '2020-06-23 16:08:22', '2020-08-20 16:41:36', null, null, null);
INSERT INTO `products` VALUES ('72', 'seckill', '2', '短裤', 'product/4.jpg', '11111', '1', '0', '5.00', '0', '0', '176', '1.00', '10', '100.00', '2020-06-23 16:09:55', '2020-08-20 16:44:18', null, null, null);
INSERT INTO `products` VALUES ('74', 'active', '25', '小米10', 'product/da0b7efc88fca4e78340f44926a0e07e.jpg', '骁龙865处理器 / 1亿像素8K电影相机 / 双模5G / 新一代LPDDR5内存 / 对称式立体声 / 90Hz刷新率+180Hz采样率 / UFS 3.0高速存储 / 全面适配Wi-Fi 6 / 超强VC液冷散热 / 30W极速闪充+30W无线闪充+10W无线反充 / 4780mAh大电量 / 多功能NFC', '1', '0', '5.00', '0', '0', '177', '3900.00', '92', '4200.00', '2020-06-24 15:51:51', '2020-08-20 16:41:36', null, null, null);
INSERT INTO `products` VALUES ('75', 'active', '37', 'EOS 90D', 'product/3357ae8d4a39bebaaa7b350cbcd53715.jpg', 'EOS 90D 机身\r\n全像素双核CMOS AF 10张/秒的高速连拍定格精彩瞬间', '1', '0', '5.00', '0', '0', '178', '7500.00', '93', '8000.00', '2020-06-24 15:57:54', '2020-08-20 16:41:36', null, null, null);
INSERT INTO `products` VALUES ('76', 'active', '35', 'Apple Watch', 'product/f32973bc65f9b8f5c1a2fc24c3705d1a.jpg', '111', '1', '0', '4.00', '0', '0', '179', '3000.00', '93', '3200.00', '2020-06-24 16:05:05', '2020-08-20 16:41:36', null, null, null);
INSERT INTO `products` VALUES ('77', 'active', '39', '索尼游戏机', 'product/60af9f7a0cf440c467f9201aeb1f1dbd.png', '新款PS4较以往型号更加小型轻量，同时大幅降低电力消耗。设计利落简约，带有圆弧感的边角让整体印象更加柔和。', '1', '0', '5.00', '0', '0', '180', '5000.00', '83', '6000.00', '2020-06-24 16:10:37', '2020-08-20 16:41:37', null, null, null);
INSERT INTO `products` VALUES ('78', 'active', '18', '微软 Surface Book 3', 'product/1d39ce0de547636f83debd61f2685fd4.png', '微软 Surface Book 3', '1', '0', '5.00', '0', '0', '181', '12000.00', '85', '14000.00', '2020-06-24 16:20:04', '2020-08-20 16:41:37', null, null, null);
INSERT INTO `products` VALUES ('79', 'normal', '33', '纽曼DL-88', 'product/b85f14df06e0bfe00696875287a3d865.jpg', '电源类型：AC 5V 3.7V锂电池', '1', '1', '4.00', '5', '1', '182', '350.00', '0', '350.00', '2020-06-24 17:22:41', '2020-10-27 15:44:28', null, null, null);
INSERT INTO `products` VALUES ('80', 'normal', '20', '华为MatePad Pro 5G', 'product/2caa3a28216de08d72feb669afcbd3a1.jpg', '华为MatePad Pro 5G', '1', '1', '5.00', '0', '0', '183', '5000.00', '0', '5000.00', '2020-06-24 17:27:18', '2020-08-20 16:41:37', null, null, null);
INSERT INTO `products` VALUES ('81', 'normal', '9', '耳机FreeBuds 3', 'product/b02a3558a934da941c8ec3a05659d453.gif', '11', '1', '1', '5.00', '0', '0', '184', '1000.00', '0', '1000.00', '2020-06-25 08:06:22', '2020-08-20 16:41:37', null, null, null);
INSERT INTO `products` VALUES ('82', 'normal', '11', '三星U32J590UQC', 'product/9e7b4c8a8dd0670d602b788c57f5fb3d.jpg', '1111', '1', '1', '5.00', '0', '0', '185', '2800.00', '0', '2800.00', '2020-06-25 08:12:40', '2020-08-20 16:41:37', null, null, null);
INSERT INTO `products` VALUES ('83', 'normal', '19', '联想 GeekPro', 'product/d50d9a242a3ce624fa5962eefca74bc4.jpg', '111', '1', '1', '5.00', '0', '0', '186', '12500.00', '0', '12500.00', '2020-06-25 08:16:56', '2020-08-20 16:41:37', null, null, null);
INSERT INTO `products` VALUES ('84', 'normal', '22', '浪潮英信NF5280M5', 'product/f4d2d8045c828bff81a00b083ea7f74f.jpg', '111', '1', '1', '5.00', '0', '0', '187', '22000.00', '0', '22000.00', '2020-06-25 08:22:14', '2020-08-20 16:41:37', null, null, null);
INSERT INTO `products` VALUES ('85', 'normal', '41', '索尼A8F', 'product/ec54afba17c856077713820afdf4211e.jpg', '111', '1', '0', '5.00', '0', '900', '188', '5000.00', '0', '5000.00', '2020-06-25 11:05:34', '2020-08-20 16:41:37', null, null, null);
INSERT INTO `products` VALUES ('86', 'normal', '43', '格力GMV-H200WL/A', 'product/a65f2610519beb01025f275cfbc9a106.jpg', '1111111111', '1', '0', '5.00', '0', '850', '189', '50000.00', '0', '50000.00', '2020-06-25 11:09:27', '2020-08-20 16:41:37', null, null, null);
INSERT INTO `products` VALUES ('87', 'normal', '29', '海康威视DS-2DC4223IW-D', 'product/9be58bde07e42c997e17e43e7368cbd1.jpg', '是是是', '1', '0', '5.00', '0', '600', '190', '1400.00', '0', '1400.00', '2020-06-25 11:12:33', '2020-08-20 16:41:37', null, null, null);
INSERT INTO `products` VALUES ('88', 'normal', '44', '三星Galaxy Watch（蓝牙通话/46mm）', 'product/b23ca3a86950e70a0feec1e88dda53f1.jpg', '111', '1', '0', '5.00', '0', '700', '191', '3000.00', '0', '3000.00', '2020-06-25 11:16:24', '2020-08-20 16:41:37', null, null, null);
INSERT INTO `products` VALUES ('89', 'normal', '46', '扫地狗S007s', 'product/2ff5f65d576888411ae46dee19591642.jpg', '遥控', '1', '0', '5.00', '0', '380', '192', '3000.00', '0', '3000.00', '2020-06-25 11:21:01', '2020-08-20 16:41:37', null, null, null);
INSERT INTO `products` VALUES ('90', 'normal', '25', '华为Mate30', 'product/7a4ae65fa90eb3734f1e1e8da23f8160.jpg', '111', '1', '0', '5.00', '0', '0', '193', '3000.00', '0', '3000.00', '2020-06-25 12:21:00', '2020-08-20 16:41:37', null, null, null);
INSERT INTO `products` VALUES ('91', 'normal', '25', '三星Galaxy S20', 'product/569528ab4848b43b20957bf747c78288.jpg', '试试', '1', '0', '3.00', '1', '1', '194', '3000.00', '0', '3000.00', '2020-06-25 12:25:06', '2020-11-05 09:45:16', null, null, null);
INSERT INTO `products` VALUES ('92', 'normal', '25', 'OPPO Reno4', 'product/f8ae0054317b97d19d81255e52a90d48.jpg', '是', '1', '0', '3.00', '4', '1', '195', '3000.00', '0', '3000.00', '2020-06-25 12:27:35', '2020-10-30 14:48:41', null, null, null);
INSERT INTO `products` VALUES ('93', 'normal', '47', '小米手表Color', 'product/f24036a651f8fca471410071bd1b067a.jpg', '111111', '1', '0', '5.00', '0', '0', '196', '800.00', '0', '800.00', '2020-06-25 12:32:56', '2020-08-20 16:41:37', null, null, null);
INSERT INTO `products` VALUES ('94', 'normal', '48', 'HUAWEI WATCH 2 Pro', 'product/0961a42f2d3d25bd33f16866a2ab4652.jpg', '1111', '1', '0', '5.00', '0', '0', '197', '3000.00', '0', '3000.00', '2020-06-25 12:37:44', '2020-09-16 16:05:27', '个', null, '1');
INSERT INTO `products` VALUES ('95', 'normal', '48', 'HUAWEI 儿童手表3 Pro', 'product/2ef01ae17191410b036b95751e19db00.jpg', '1111', '1', '0', '5.00', '2', '0', '198', '800.00', '0', '800.00', '2020-06-25 12:41:32', '2020-10-27 15:44:29', null, null, null);
INSERT INTO `products` VALUES ('96', 'normal', '44', '三星Gear S3', 'product/02fcec6cc7f5f86fc96cb0804a0d8bca.jpg', '扫地', '1', '0', '5.00', '0', '0', '199', '3000.00', '0', '3000.00', '2020-06-25 12:48:25', '2020-08-20 16:41:37', null, null, null);
INSERT INTO `products` VALUES ('97', 'normal', '25', '苹果iphone-x', 'product/183bf648f1733a66019569c6f410ccb8.jpg', '是', '1', '0', '5.00', '0', '0', '200', '8000.00', '0', '8000.00', '2020-06-25 12:53:50', '2020-08-20 16:41:37', null, null, null);
INSERT INTO `products` VALUES ('98', 'normal', '49', '佳明Fenix6X Pro', 'product/a30c293f7deddaffa69f38688927b429.jpg', '啊', '1', '1', '5.00', '0', '0', '201', '8000.00', '0', '8000.00', '2020-06-25 14:13:51', '2020-08-20 16:41:37', null, null, null);
INSERT INTO `products` VALUES ('99', 'seckill', '8', '联想拯救者游戏电竞耳机耳麦Pro Y660', 'product/ba64e830102d0c8b0d034e3882f546c3.jpg', '111', '1', '0', '5.00', '0', '0', '202', '349.00', '49', '699.00', '2020-06-25 17:53:40', '2020-08-20 16:41:37', null, null, null);
INSERT INTO `products` VALUES ('100', 'seckill', '50', '联想马卡龙无线蓝牙双模一键服务鼠标M23', 'product/99058f72bef7630b30ad06f1eaa236be.jpg', '111', '1', '0', '5.00', '0', '0', '203', '89.00', '49', '179.00', '2020-06-25 17:59:16', '2020-08-20 16:41:37', null, null, null);
INSERT INTO `products` VALUES ('101', 'seckill', '18', '小新Air14 2020锐龙版14.0英寸', 'product/7448be50eaf5444e2a3451d19b020a1f.jpg', '小新Air14 2020锐龙版14.0英寸全面屏高性能金属轻薄笔记本深空灰', '1', '0', '5.00', '0', '0', '204', '5000.00', '80', '6000.00', '2020-06-25 18:03:08', '2020-08-20 16:43:45', null, null, null);
INSERT INTO `products` VALUES ('102', 'seckill', '18', 'ThinkPad S2 2020英特尔酷睿', 'product/515a51f6a59c47cda14a970c78a1d476.jpg', 'ThinkPad S2 2020英特尔酷睿i5笔记本电脑 银色 20R7A00FCD', '1', '0', '5.00', '0', '0', '205', '3000.00', '50', '6000.00', '2020-06-25 18:06:43', '2020-08-20 16:41:37', null, null, null);
INSERT INTO `products` VALUES ('103', 'seckill', '20', '联想平板M8 8英寸 4G+64G WiFi版 杜比全景声 网课平板', 'product/d7add33344af45c24f4bdfdf275a74d2.jpg', '山东', '1', '0', '5.00', '0', '0', '206', '2000.00', '125', '1600.00', '2020-06-25 18:09:56', '2020-08-20 16:41:38', null, null, null);
INSERT INTO `products` VALUES ('104', 'seckill', '16', '联想个人云存储T1 8TB 双盘版', 'product/d16a89254f148aa6123086969815761b.jpg', '试试', '1', '0', '5.00', '0', '0', '207', '600.00', '75', '800.00', '2020-06-25 18:15:06', '2020-08-20 16:41:38', null, null, null);
INSERT INTO `products` VALUES ('105', 'seckill', '46', '联想智能扫地机器人A1', 'product/0da607a57c37dfc83914bff6935f2c58.jpg', '11212', '1', '0', '5.00', '0', '0', '208', '1500.00', '50', '3000.00', '2020-06-25 18:19:14', '2020-08-20 16:41:38', null, null, null);
INSERT INTO `products` VALUES ('106', 'seckill', '6', 'Lenovo 170W 方口便携式电源适配器', 'product/1d239b16a87c0e6a2ef96ea7a40cd562.jpg', 'Lenovo 170W 方口便携式电源适配器', '1', '0', '5.00', '0', '0', '209', '300.00', '50', '600.00', '2020-06-25 18:54:30', '2020-08-20 16:41:38', null, null, null);
INSERT INTO `products` VALUES ('107', 'seckill', '18', 'MIIX 520 二合一笔记本', 'product/853423249cb62192944a79f5168af2d0.jpg', '12121', '1', '0', '5.00', '0', '0', '210', '7000.00', '70', '10000.00', '2020-06-25 18:58:02', '2020-08-20 16:41:38', null, null, null);
INSERT INTO `products` VALUES ('108', 'crowdfunding', '46', '乐迪早教机器人', 'product/eb090a179c33c40091dfddebbcf903db.jpg', '11111\r\n众筹目标金额\r\n众筹目标金额\r\n众筹目标金额\r\n众筹目标金额', '1', '0', '5.00', '3', '1', '211', '300.00', '0', '300.00', '2020-06-25 19:17:42', '2020-09-23 13:44:25', null, null, null);
INSERT INTO `products` VALUES ('109', 'discount', '25', 'OPPO Reno4 Pro', 'product/eae6381875d257c93d3241ba39e0a00e.jpg', '11111', '1', '1', '5.00', '0', '0', '212', '1500.00', '75', '2000.00', '2020-07-13 11:01:01', '2020-08-20 16:41:38', null, null, null);
INSERT INTO `products` VALUES ('110', 'discount', '25', 'vivo X50 Pro', 'product/189bdaf80e08d40a19578bd0edc69864.jpg', '事实上', '1', '0', '5.00', '0', '0', '213', '3000.00', '60', '5000.00', '2020-07-13 11:02:34', '2020-08-20 16:41:38', null, null, null);
INSERT INTO `products` VALUES ('111', 'discount', '25', '三星Galaxy S20+', 'product/cdd3104f45faedef3a89cc086cfc4b5c.jpg', '三星Galaxy S20+（12GB/128GB/全网通/BTS限量版）', '1', '0', '5.00', '0', '0', '214', '5000.00', '83', '6000.00', '2020-07-13 11:04:09', '2020-08-20 16:41:38', null, null, null);
INSERT INTO `products` VALUES ('112', 'discount', '25', '荣耀X10 Max', 'product/66e76d5742d692856ed9da54883da893.jpg', '荣耀X10 Max（6GB/128GB/全网通/5G版', '1', '0', '5.00', '0', '0', '215', '3000.00', '75', '4000.00', '2020-07-13 11:05:42', '2020-08-20 16:41:38', null, null, null);
INSERT INTO `products` VALUES ('113', 'normal', '25', '苹果iPhone 11', 'product/416d73fca2ba3dc628676fea5c76b22a.jpg', '试试11', '1', '1', '5.00', '0', '0', '217', '5000.00', '0', '5000.00', '2020-08-05 10:22:09', '2020-08-20 16:41:38', null, null, null);
INSERT INTO `products` VALUES ('114', 'crowdfunding', '41', '小米电视大师 65英寸', 'product/0bee5c723b6cbcf91f1d180aff718e8b.jpg', '10.7亿原色显示，98.5%DCI-P3广色域，120Hz流速屏，AI大师引擎，3D全景声，音响系统', '1', '1', '5.00', '0', '0', '224', '13000.00', '0', '13000.00', '2020-08-06 09:06:55', '2020-08-20 16:41:38', null, null, null);
INSERT INTO `products` VALUES ('118', 'seckill', '18', '苹果新款MacBook Pro 13英寸', 'product/144d7840df85c40eefc1067877a7f090.jpg', '第八代英特尔酷睿i5，触控ID，触控栏，视网膜显示屏', '1', '1', '5.00', '0', '0', '228', '10000.00', '0', '12000.00', '2020-08-06 11:12:59', '2020-08-20 16:41:38', null, null, null);
INSERT INTO `products` VALUES ('121', 'discount', '25', '小米10', 'product/00aa60d90281624184e097b72521f37d.jpg', '骁龙865，一亿像素，8K电影相机', '1', '1', '5.00', '0', '0', '231', '3600.00', '90', '4000.00', '2020-08-06 15:46:31', '2020-08-20 16:41:38', null, null, null);

-- ----------------------------
-- Table structure for `product_evaluations`
-- ----------------------------
DROP TABLE IF EXISTS `product_evaluations`;
CREATE TABLE `product_evaluations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `good_num` bigint(20) unsigned NOT NULL DEFAULT '0',
  `ordinary_num` bigint(20) unsigned NOT NULL DEFAULT '0',
  `negative_num` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cover_num` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `product_evaluations_product_id_foreign` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_evaluations
-- ----------------------------
INSERT INTO `product_evaluations` VALUES ('1', '91', '0', '1', '0', '1');
INSERT INTO `product_evaluations` VALUES ('2', '92', '0', '1', '0', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=270 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

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
-- Table structure for `product_properties`
-- ----------------------------
DROP TABLE IF EXISTS `product_properties`;
CREATE TABLE `product_properties` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL COMMENT '商品编码',
  `base_property_id` bigint(20) NOT NULL DEFAULT '0',
  `base_property_item_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '属性编码',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '参数名称',
  `prop_value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '参数值',
  PRIMARY KEY (`id`),
  KEY `product_properties_product_id_foreign` (`product_id`),
  KEY `product_properties_base_property_item_id_foreign` (`base_property_item_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_properties
-- ----------------------------
INSERT INTO `product_properties` VALUES ('1', '14', '1', '1', '处理器', 'Intel i5');
INSERT INTO `product_properties` VALUES ('6', '113', '0', '0', '产地', '山东-济南');
INSERT INTO `product_properties` VALUES ('7', '48', '1', '1', '处理器', 'Intel i5');
INSERT INTO `product_properties` VALUES ('8', '48', '2', '4', '内存容量', '8G');

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
  `cost_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `product_skus_product_id_foreign` (`product_id`),
  CONSTRAINT `product_skus_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=232 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of product_skus
-- ----------------------------
INSERT INTO `product_skus` VALUES ('1', '1', '米6', '全自动', '1500.00', '1500.00', '105', '2020-06-18 14:43:34', '2020-06-18 14:53:09', '1275.00');
INSERT INTO `product_skus` VALUES ('2', '1', '米8', '防水', '2500.00', '2500.00', '205', '2020-06-18 14:43:34', '2020-06-18 14:53:09', '2125.00');
INSERT INTO `product_skus` VALUES ('5', '4', 'iphone11', 'iphone11', '8000.00', '8000.00', '100', '2020-06-19 17:19:23', '2020-06-19 17:19:23', '6800.00');
INSERT INTO `product_skus` VALUES ('6', '5', 't420', 't420', '6000.00', '6000.00', '100', '2020-06-19 17:23:43', '2020-06-19 17:23:43', '5100.00');
INSERT INTO `product_skus` VALUES ('7', '5', 't430', 't430', '8000.00', '8000.00', '100', '2020-06-19 17:23:43', '2020-06-19 17:23:43', '6800.00');
INSERT INTO `product_skus` VALUES ('8', '56', 'iphone', '适用于iphone各系列', '100.00', '100.00', '99', '2020-06-22 09:39:57', '2020-07-09 16:55:43', '85.00');
INSERT INTO `product_skus` VALUES ('9', '56', 'mi', '适用于mi各系列', '55.00', '55.00', '100', '2020-06-22 09:39:57', '2020-06-22 09:39:57', '46.75');
INSERT INTO `product_skus` VALUES ('10', '57', '苹果', '苹果', '120.00', '120.00', '200', '2020-06-22 10:24:38', '2020-06-22 10:24:38', '102.00');
INSERT INTO `product_skus` VALUES ('11', '6', 'dicta', 'Soluta ut velit necessitatibus ea voluptatem eos vel.', '9084.00', '9084.00', '972', '2020-06-22 14:47:21', '2020-06-22 14:47:21', '7721.40');
INSERT INTO `product_skus` VALUES ('12', '6', 'ea', 'Quasi aut est eum quasi odio enim est quam.', '638.00', '638.00', '885', '2020-06-22 14:47:21', '2020-06-22 14:47:21', '542.30');
INSERT INTO `product_skus` VALUES ('13', '6', 'molestias', 'Ut temporibus distinctio voluptas facere.', '7150.00', '7150.00', '656', '2020-06-22 14:47:21', '2020-06-22 14:47:21', '6077.50');
INSERT INTO `product_skus` VALUES ('14', '7', 'ut', 'Natus et voluptate porro consequuntur sapiente rerum.', '4889.00', '4889.00', '105', '2020-06-22 14:48:57', '2020-06-22 14:48:57', '4155.65');
INSERT INTO `product_skus` VALUES ('15', '7', 'repudiandae', 'Sunt quis quasi quae nam quia aliquid est.', '2672.00', '2672.00', '33', '2020-06-22 14:48:58', '2020-06-22 14:48:58', '2271.20');
INSERT INTO `product_skus` VALUES ('16', '7', 'et', 'Voluptatem tenetur culpa itaque cum minima aperiam ipsam.', '4533.00', '4533.00', '516', '2020-06-22 14:48:58', '2020-06-22 14:48:58', '3853.05');
INSERT INTO `product_skus` VALUES ('17', '8', 'necessitatibus', 'Ut iusto culpa expedita molestiae.', '5547.00', '5547.00', '395', '2020-06-22 14:48:58', '2020-06-22 14:48:58', '4714.95');
INSERT INTO `product_skus` VALUES ('18', '8', 'inventore', 'Facere hic enim qui qui cupiditate et est.', '8407.00', '8407.00', '288', '2020-06-22 14:48:58', '2020-06-22 14:48:58', '7145.95');
INSERT INTO `product_skus` VALUES ('19', '8', 'ipsum', 'Omnis sint optio quam laudantium.', '3489.00', '3489.00', '370', '2020-06-22 14:48:58', '2020-06-22 14:48:58', '2965.65');
INSERT INTO `product_skus` VALUES ('20', '9', 'et', 'Illo voluptatem saepe illum iure assumenda.', '6624.00', '6624.00', '924', '2020-06-22 14:48:58', '2020-06-22 14:48:58', '5630.40');
INSERT INTO `product_skus` VALUES ('21', '9', 'esse', 'Autem vitae maiores nostrum nihil.', '7563.00', '7563.00', '586', '2020-06-22 14:48:58', '2020-06-22 14:48:58', '6428.55');
INSERT INTO `product_skus` VALUES ('22', '9', 'vitae', 'Totam blanditiis fuga vitae consequatur tempora a.', '5479.00', '5479.00', '778', '2020-06-22 14:48:58', '2020-06-22 14:48:58', '4657.15');
INSERT INTO `product_skus` VALUES ('23', '10', 'occaecati', 'Adipisci quod qui esse nisi non.', '6363.00', '6363.00', '666', '2020-06-22 14:48:58', '2020-06-22 14:48:58', '5408.55');
INSERT INTO `product_skus` VALUES ('24', '10', 'quisquam', 'Nisi est ipsum sunt error vel et excepturi est.', '3261.00', '3261.00', '735', '2020-06-22 14:48:59', '2020-06-22 14:48:59', '2771.85');
INSERT INTO `product_skus` VALUES ('25', '10', 'sapiente', 'Minus ratione est adipisci vel et.', '2771.00', '2771.00', '678', '2020-06-22 14:48:59', '2020-06-22 14:48:59', '2355.35');
INSERT INTO `product_skus` VALUES ('26', '11', 'tenetur', 'Id error similique et necessitatibus et.', '6768.00', '6768.00', '972', '2020-06-22 14:48:59', '2020-06-22 14:48:59', '5752.80');
INSERT INTO `product_skus` VALUES ('27', '11', 'ut', 'Quis quo quibusdam id ratione corporis laborum.', '4161.00', '4161.00', '582', '2020-06-22 14:48:59', '2020-06-22 14:48:59', '3536.85');
INSERT INTO `product_skus` VALUES ('28', '11', 'facilis', 'Et quia delectus ut fugiat.', '3016.00', '3016.00', '549', '2020-06-22 14:48:59', '2020-06-22 14:48:59', '2563.60');
INSERT INTO `product_skus` VALUES ('29', '12', 'nulla', 'Cumque nobis quod sint nihil.', '4216.00', '4216.00', '142', '2020-06-22 14:48:59', '2020-06-22 14:48:59', '3583.60');
INSERT INTO `product_skus` VALUES ('30', '12', 'libero', 'Nam possimus illo quod et sunt qui.', '8224.00', '8224.00', '50', '2020-06-22 14:48:59', '2020-06-22 14:48:59', '6990.40');
INSERT INTO `product_skus` VALUES ('31', '12', 'laboriosam', 'Qui fuga dolor qui corporis ab velit.', '1700.00', '1700.00', '195', '2020-06-22 14:48:59', '2020-06-22 14:48:59', '1445.00');
INSERT INTO `product_skus` VALUES ('32', '13', 'dolore', 'Optio labore occaecati et inventore doloremque.', '1382.00', '1382.00', '51', '2020-06-22 14:49:00', '2020-06-22 14:49:00', '1174.70');
INSERT INTO `product_skus` VALUES ('33', '13', 'unde', 'Dolor quos repellat consequatur non nobis suscipit.', '2056.00', '2056.00', '72', '2020-06-22 14:49:00', '2020-06-22 14:49:00', '1747.60');
INSERT INTO `product_skus` VALUES ('34', '13', 'debitis', 'Molestias in voluptatem rerum sapiente dicta.', '3660.00', '3660.00', '450', '2020-06-22 14:49:00', '2020-06-22 14:49:00', '3111.00');
INSERT INTO `product_skus` VALUES ('35', '14', 'sequi', 'Voluptatem dolor aliquam temporibus rerum fugit in possimus.', '551.00', '551.00', '215', '2020-06-22 14:49:00', '2020-06-22 14:49:00', '468.35');
INSERT INTO `product_skus` VALUES ('36', '14', 'in', 'Minus est fugit quam culpa cumque.', '7345.00', '7345.00', '770', '2020-06-22 14:49:00', '2020-06-22 14:49:00', '6243.25');
INSERT INTO `product_skus` VALUES ('37', '14', 'in', 'Ut quia modi est omnis.', '2964.00', '2964.00', '503', '2020-06-22 14:49:00', '2020-06-22 14:49:00', '2519.40');
INSERT INTO `product_skus` VALUES ('38', '15', 'quia', 'Cum enim quo quis velit fuga nesciunt numquam.', '7069.00', '7069.00', '957', '2020-06-22 14:49:00', '2020-06-22 14:49:00', '6008.65');
INSERT INTO `product_skus` VALUES ('39', '15', 'nulla', 'Enim sint aut reiciendis provident voluptatum fugit iste.', '8992.00', '8992.00', '645', '2020-06-22 14:49:00', '2020-06-22 14:49:00', '7643.20');
INSERT INTO `product_skus` VALUES ('40', '15', 'dolorem', 'Maxime id perspiciatis iure et incidunt.', '4485.00', '4485.00', '985', '2020-06-22 14:49:00', '2020-06-22 14:49:00', '3812.25');
INSERT INTO `product_skus` VALUES ('41', '16', 'fuga', 'Exercitationem sunt nulla pariatur praesentium dolores ipsum autem perferendis.', '813.00', '813.00', '109', '2020-06-22 14:49:00', '2020-06-22 14:49:00', '691.05');
INSERT INTO `product_skus` VALUES ('42', '16', 'quibusdam', 'Et hic quo nam aliquid.', '626.00', '626.00', '470', '2020-06-22 14:49:00', '2020-06-22 14:49:00', '532.10');
INSERT INTO `product_skus` VALUES ('43', '16', 'vel', 'Et at ipsum similique qui aspernatur consequatur sed.', '8076.00', '8076.00', '516', '2020-06-22 14:49:00', '2020-06-22 14:49:00', '6864.60');
INSERT INTO `product_skus` VALUES ('44', '17', 'minima', 'Dolore et ut officia ab sunt quidem qui.', '4479.00', '4479.00', '960', '2020-06-22 14:49:00', '2020-06-22 14:49:00', '3807.15');
INSERT INTO `product_skus` VALUES ('45', '17', 'libero', 'Porro maxime saepe odio laboriosam sequi sunt.', '3027.00', '3027.00', '361', '2020-06-22 14:49:00', '2020-06-22 14:49:00', '2572.95');
INSERT INTO `product_skus` VALUES ('46', '17', 'quia', 'Rerum molestias odit consequatur molestias aut incidunt aspernatur nemo.', '8990.00', '8990.00', '633', '2020-06-22 14:49:01', '2020-06-22 14:49:01', '7641.50');
INSERT INTO `product_skus` VALUES ('47', '18', 'consequatur', 'Et unde quo quia omnis ullam blanditiis accusamus.', '2346.00', '2346.00', '392', '2020-06-22 14:49:01', '2020-06-22 14:49:01', '1994.10');
INSERT INTO `product_skus` VALUES ('48', '18', 'corporis', 'Deserunt rerum beatae suscipit quos porro voluptatem voluptatibus est.', '5475.00', '5475.00', '351', '2020-06-22 14:49:01', '2020-06-22 14:49:01', '4653.75');
INSERT INTO `product_skus` VALUES ('49', '18', 'quia', 'Quia nisi omnis animi mollitia consectetur quidem.', '6345.00', '6345.00', '209', '2020-06-22 14:49:01', '2020-06-22 14:49:01', '5393.25');
INSERT INTO `product_skus` VALUES ('50', '19', 'sint', 'Voluptas quia nihil officia quaerat rerum fugit natus alias.', '8912.00', '8912.00', '212', '2020-06-22 14:49:01', '2020-06-22 14:49:01', '7575.20');
INSERT INTO `product_skus` VALUES ('51', '19', 'minus', 'Et deserunt et aut eveniet.', '7999.00', '7999.00', '159', '2020-06-22 14:49:01', '2020-06-22 14:49:01', '6799.15');
INSERT INTO `product_skus` VALUES ('52', '19', 'aut', 'Deserunt maiores rerum omnis amet sed ipsa.', '3779.00', '3779.00', '338', '2020-06-22 14:49:01', '2020-06-22 14:49:01', '3212.15');
INSERT INTO `product_skus` VALUES ('53', '20', 'animi', 'Tenetur qui non quod molestiae.', '9009.00', '9009.00', '311', '2020-06-22 14:49:01', '2020-06-22 14:49:01', '7657.65');
INSERT INTO `product_skus` VALUES ('54', '20', 'quasi', 'Aliquam repudiandae ut necessitatibus id eum placeat.', '6346.00', '6346.00', '46', '2020-06-22 14:49:01', '2020-06-22 14:49:01', '5394.10');
INSERT INTO `product_skus` VALUES ('55', '20', 'soluta', 'Delectus quia commodi nisi soluta error modi.', '4191.00', '4191.00', '332', '2020-06-22 14:49:01', '2020-06-22 14:49:01', '3562.35');
INSERT INTO `product_skus` VALUES ('56', '21', 'minima', 'Fugit ipsum ut eius sapiente minima non omnis.', '9545.00', '9545.00', '787', '2020-06-22 14:49:01', '2020-06-22 14:49:01', '8113.25');
INSERT INTO `product_skus` VALUES ('57', '21', 'saepe', 'Rerum veritatis qui necessitatibus ad voluptatibus dolore repellat magnam.', '4198.00', '4198.00', '303', '2020-06-22 14:49:01', '2020-06-22 14:49:01', '3568.30');
INSERT INTO `product_skus` VALUES ('58', '21', 'omnis', 'Sit quia est sint magnam.', '845.00', '845.00', '936', '2020-06-22 14:49:01', '2020-06-22 14:49:01', '718.25');
INSERT INTO `product_skus` VALUES ('59', '22', 'neque', 'Rerum tenetur blanditiis cum soluta laudantium.', '9098.00', '9098.00', '784', '2020-06-22 14:49:02', '2020-06-22 14:49:02', '7733.30');
INSERT INTO `product_skus` VALUES ('60', '22', 'quam', 'Nisi perspiciatis distinctio facilis.', '1449.00', '1449.00', '6', '2020-06-22 14:49:02', '2020-06-22 14:49:02', '1231.65');
INSERT INTO `product_skus` VALUES ('61', '22', 'consequatur', 'Expedita dolorem et asperiores vero laborum sed ad.', '2313.00', '2313.00', '82', '2020-06-22 14:49:02', '2020-06-22 14:49:02', '1966.05');
INSERT INTO `product_skus` VALUES ('62', '23', 'et', 'At eum dolore aliquid eum nam aliquid qui.', '6987.00', '6987.00', '579', '2020-06-22 14:49:02', '2020-06-22 14:49:02', '5938.95');
INSERT INTO `product_skus` VALUES ('63', '23', 'quisquam', 'Eum cum consectetur provident voluptatem.', '5905.00', '5905.00', '536', '2020-06-22 14:49:02', '2020-06-22 14:49:02', '5019.25');
INSERT INTO `product_skus` VALUES ('64', '23', 'eveniet', 'Saepe neque atque blanditiis et.', '322.00', '322.00', '266', '2020-06-22 14:49:02', '2020-06-22 14:49:02', '273.70');
INSERT INTO `product_skus` VALUES ('65', '24', 'nobis', 'Totam ut sit eum sit rerum non et.', '6671.00', '6671.00', '996', '2020-06-22 14:49:02', '2020-06-22 14:49:02', '5670.35');
INSERT INTO `product_skus` VALUES ('66', '24', 'et', 'In dolor dolorem voluptatum voluptatem.', '607.00', '607.00', '723', '2020-06-22 14:49:02', '2020-06-22 14:49:02', '515.95');
INSERT INTO `product_skus` VALUES ('67', '24', 'aut', 'Temporibus fuga quo quia numquam iusto sequi sint.', '244.00', '244.00', '340', '2020-06-22 14:49:02', '2020-06-22 14:49:02', '207.40');
INSERT INTO `product_skus` VALUES ('68', '25', 'et', 'Consequatur eos quasi qui animi est veritatis.', '9073.00', '9073.00', '857', '2020-06-22 14:49:02', '2020-06-22 14:49:02', '7712.05');
INSERT INTO `product_skus` VALUES ('69', '25', 'similique', 'Et voluptates autem optio omnis delectus dolores vel.', '861.00', '861.00', '512', '2020-06-22 14:49:02', '2020-06-22 14:49:02', '731.85');
INSERT INTO `product_skus` VALUES ('70', '25', 'eligendi', 'Doloribus accusamus dolorem molestiae.', '6434.00', '6434.00', '240', '2020-06-22 14:49:02', '2020-06-22 14:49:02', '5468.90');
INSERT INTO `product_skus` VALUES ('71', '26', 'ducimus', 'Exercitationem error porro et quis consequatur laudantium.', '1586.00', '1586.00', '588', '2020-06-22 14:49:03', '2020-06-22 14:49:03', '1348.10');
INSERT INTO `product_skus` VALUES ('72', '26', 'eum', 'Est sunt neque amet placeat.', '5699.00', '5699.00', '852', '2020-06-22 14:49:03', '2020-06-22 14:49:03', '4844.15');
INSERT INTO `product_skus` VALUES ('73', '26', 'vero', 'Eligendi quis sint quasi quas.', '7429.00', '7429.00', '719', '2020-06-22 14:49:03', '2020-06-22 14:49:03', '6314.65');
INSERT INTO `product_skus` VALUES ('74', '27', 'non', 'Unde vel commodi saepe tempore.', '7276.00', '7276.00', '852', '2020-06-22 14:49:03', '2020-06-22 14:49:03', '6184.60');
INSERT INTO `product_skus` VALUES ('75', '27', 'eos', 'Et libero quae consequatur.', '6911.00', '6911.00', '74', '2020-06-22 14:49:03', '2020-06-22 14:49:03', '5874.35');
INSERT INTO `product_skus` VALUES ('76', '27', 'praesentium', 'Sit et quae non fugiat ratione quae non quisquam.', '6372.00', '6372.00', '701', '2020-06-22 14:49:03', '2020-06-22 14:49:03', '5416.20');
INSERT INTO `product_skus` VALUES ('77', '28', 'quis', 'Deleniti minima praesentium corrupti.', '856.00', '856.00', '579', '2020-06-22 14:49:03', '2020-06-22 14:49:03', '727.60');
INSERT INTO `product_skus` VALUES ('78', '28', 'laudantium', 'Illo saepe aliquid molestiae explicabo temporibus et.', '541.00', '541.00', '397', '2020-06-22 14:49:03', '2020-06-22 14:49:03', '459.85');
INSERT INTO `product_skus` VALUES ('79', '28', 'iusto', 'Ut illum non officiis at laboriosam dolorem.', '1602.00', '1602.00', '736', '2020-06-22 14:49:03', '2020-06-22 14:49:03', '1361.70');
INSERT INTO `product_skus` VALUES ('80', '29', 'aspernatur', 'Id reiciendis et consequuntur cumque rerum dolor.', '8739.00', '8739.00', '18', '2020-06-22 14:49:03', '2020-06-22 14:49:03', '7428.15');
INSERT INTO `product_skus` VALUES ('81', '29', 'quisquam', 'Quod doloremque ad consequuntur delectus enim.', '7489.00', '7489.00', '523', '2020-06-22 14:49:03', '2020-06-22 14:49:03', '6365.65');
INSERT INTO `product_skus` VALUES ('82', '29', 'ea', 'Et ut provident sed accusamus enim aliquid quis.', '3381.00', '3381.00', '346', '2020-06-22 14:49:03', '2020-06-22 14:49:03', '2873.85');
INSERT INTO `product_skus` VALUES ('83', '30', 'magni', 'Dolorem iure soluta quae expedita non quibusdam.', '8364.00', '8364.00', '738', '2020-06-22 14:49:03', '2020-06-22 14:49:03', '7109.40');
INSERT INTO `product_skus` VALUES ('84', '30', 'voluptatibus', 'In quia sint ut ullam est voluptas.', '6904.00', '6904.00', '900', '2020-06-22 14:49:03', '2020-06-22 14:49:03', '5868.40');
INSERT INTO `product_skus` VALUES ('85', '30', 'est', 'Et mollitia temporibus qui accusantium.', '3939.00', '3939.00', '636', '2020-06-22 14:49:03', '2020-06-22 14:49:03', '3348.15');
INSERT INTO `product_skus` VALUES ('86', '31', 'occaecati', 'Eveniet facere autem numquam nisi temporibus.', '8682.00', '8682.00', '275', '2020-06-22 14:49:04', '2020-06-22 14:49:04', '7379.70');
INSERT INTO `product_skus` VALUES ('87', '31', 'tempora', 'Architecto tempore blanditiis sequi possimus adipisci sunt ut blanditiis.', '7090.00', '7090.00', '50', '2020-06-22 14:49:04', '2020-06-22 14:49:04', '6026.50');
INSERT INTO `product_skus` VALUES ('88', '31', 'maiores', 'Delectus repellendus odio voluptates cupiditate sit voluptates.', '5540.00', '5540.00', '184', '2020-06-22 14:49:04', '2020-06-22 14:49:04', '4709.00');
INSERT INTO `product_skus` VALUES ('89', '32', 'ut', 'Voluptates incidunt officiis at.', '6325.00', '6325.00', '768', '2020-06-22 14:49:04', '2020-06-22 14:49:04', '5376.25');
INSERT INTO `product_skus` VALUES ('90', '32', 'ullam', 'Eligendi voluptatum optio minima id dolores.', '6002.00', '6002.00', '310', '2020-06-22 14:49:04', '2020-06-22 14:49:04', '5101.70');
INSERT INTO `product_skus` VALUES ('91', '32', 'est', 'Et eligendi qui velit reprehenderit magni est qui.', '3225.00', '3225.00', '954', '2020-06-22 14:49:04', '2020-06-22 14:49:04', '2741.25');
INSERT INTO `product_skus` VALUES ('92', '33', 'laborum', 'Omnis aut quo sint molestiae necessitatibus quo.', '6748.00', '6748.00', '909', '2020-06-22 14:49:04', '2020-06-22 14:49:04', '5735.80');
INSERT INTO `product_skus` VALUES ('93', '33', 'et', 'Dolor vitae doloremque mollitia est laborum tenetur.', '5136.00', '5136.00', '788', '2020-06-22 14:49:04', '2020-06-22 14:49:04', '4365.60');
INSERT INTO `product_skus` VALUES ('94', '33', 'ad', 'Rerum dolorem est totam quasi.', '2218.00', '2218.00', '197', '2020-06-22 14:49:04', '2020-06-22 14:49:04', '1885.30');
INSERT INTO `product_skus` VALUES ('95', '34', 'minus', 'Illo impedit eum tempore.', '3459.00', '3459.00', '486', '2020-06-22 14:49:04', '2020-06-22 14:49:04', '2940.15');
INSERT INTO `product_skus` VALUES ('96', '34', 'doloribus', 'Labore et vel officiis possimus velit odio.', '7866.00', '7866.00', '940', '2020-06-22 14:49:04', '2020-06-22 14:49:04', '6686.10');
INSERT INTO `product_skus` VALUES ('97', '34', 'qui', 'Hic labore quia cupiditate natus in dolores.', '4512.00', '4512.00', '188', '2020-06-22 14:49:04', '2020-06-22 14:49:04', '3835.20');
INSERT INTO `product_skus` VALUES ('98', '35', 'eum', 'Ut doloremque at quis et voluptatibus eum.', '7338.00', '7338.00', '256', '2020-06-22 14:49:04', '2020-06-22 14:49:04', '6237.30');
INSERT INTO `product_skus` VALUES ('99', '35', 'libero', 'Nostrum tenetur iure voluptatem numquam atque hic ratione porro.', '4497.00', '4497.00', '779', '2020-06-22 14:49:04', '2020-06-22 14:49:04', '3822.45');
INSERT INTO `product_skus` VALUES ('100', '35', 'rerum', 'Praesentium inventore vel aut odit quo.', '7817.00', '7817.00', '984', '2020-06-22 14:49:04', '2020-06-22 14:49:04', '6644.45');
INSERT INTO `product_skus` VALUES ('101', '36', 'fugiat', 'Ipsum aut dolores dolores consequuntur.', '2935.00', '2935.00', '811', '2020-06-22 14:49:05', '2020-06-22 14:49:05', '2494.75');
INSERT INTO `product_skus` VALUES ('102', '36', 'dignissimos', 'Pariatur accusamus sit quae rem.', '6593.00', '6593.00', '26', '2020-06-22 14:49:05', '2020-06-22 14:49:05', '5604.05');
INSERT INTO `product_skus` VALUES ('103', '36', 'molestias', 'Quisquam cumque quia quis eligendi non.', '4581.00', '4581.00', '328', '2020-06-22 14:49:05', '2020-06-22 14:49:05', '3893.85');
INSERT INTO `product_skus` VALUES ('104', '37', 'distinctio', 'Cumque temporibus quas occaecati ut reiciendis.', '1107.00', '1107.00', '616', '2020-06-22 14:49:05', '2020-06-22 14:49:05', '940.95');
INSERT INTO `product_skus` VALUES ('105', '37', 'maiores', 'Est molestias et et aut eum.', '1060.00', '1060.00', '760', '2020-06-22 14:49:05', '2020-06-22 14:49:05', '901.00');
INSERT INTO `product_skus` VALUES ('106', '37', 'impedit', 'A necessitatibus harum labore rerum fugit.', '2801.00', '2801.00', '738', '2020-06-22 14:49:05', '2020-06-22 14:49:05', '2380.85');
INSERT INTO `product_skus` VALUES ('107', '38', 'placeat', 'Odit ratione ut porro consequuntur dolores reiciendis ab.', '4227.00', '4227.00', '661', '2020-06-22 14:49:05', '2020-06-22 14:49:05', '3592.95');
INSERT INTO `product_skus` VALUES ('108', '38', 'quisquam', 'Consequatur voluptatem rerum non doloremque expedita odio.', '9752.00', '9752.00', '813', '2020-06-22 14:49:05', '2020-06-22 14:49:05', '8289.20');
INSERT INTO `product_skus` VALUES ('109', '38', 'non', 'Veniam optio sint ratione quos ea.', '7553.00', '7553.00', '167', '2020-06-22 14:49:05', '2020-06-22 14:49:05', '6420.05');
INSERT INTO `product_skus` VALUES ('110', '39', 'optio', 'Dolorem nulla accusamus tempora voluptatem tenetur.', '1346.00', '1346.00', '5', '2020-06-22 14:49:05', '2020-06-22 14:49:05', '1144.10');
INSERT INTO `product_skus` VALUES ('111', '39', 'quia', 'Omnis alias architecto nesciunt eligendi qui aut.', '897.00', '897.00', '23', '2020-06-22 14:49:05', '2020-06-22 14:49:05', '762.45');
INSERT INTO `product_skus` VALUES ('112', '39', 'minima', 'Nostrum recusandae voluptatem eveniet sed consequatur dicta dolores.', '708.00', '708.00', '664', '2020-06-22 14:49:05', '2020-06-22 14:49:05', '601.80');
INSERT INTO `product_skus` VALUES ('113', '40', 'nihil', 'Beatae soluta sed minima.', '7471.00', '7471.00', '999', '2020-06-22 14:49:05', '2020-06-22 14:49:05', '6350.35');
INSERT INTO `product_skus` VALUES ('114', '40', 'ut', 'Voluptate aut sint consequuntur autem dolores.', '1449.00', '1449.00', '296', '2020-06-22 14:49:05', '2020-06-22 14:49:05', '1231.65');
INSERT INTO `product_skus` VALUES ('115', '40', 'harum', 'Facilis nisi natus voluptatem ut modi voluptatem.', '308.00', '308.00', '189', '2020-06-22 14:49:05', '2020-06-22 14:49:05', '261.80');
INSERT INTO `product_skus` VALUES ('116', '41', 'possimus', 'Quia qui omnis ab sint nesciunt vitae.', '2937.00', '2937.00', '512', '2020-06-22 14:49:06', '2020-06-22 14:49:06', '2496.45');
INSERT INTO `product_skus` VALUES ('117', '41', 'reiciendis', 'Saepe provident quia harum dolor.', '2911.00', '2911.00', '25', '2020-06-22 14:49:06', '2020-06-22 14:49:06', '2474.35');
INSERT INTO `product_skus` VALUES ('118', '41', 'illum', 'In ut maiores adipisci aut.', '2650.00', '2650.00', '30', '2020-06-22 14:49:06', '2020-06-22 14:49:06', '2252.50');
INSERT INTO `product_skus` VALUES ('119', '42', 'distinctio', 'Ratione tenetur veritatis aut.', '6404.00', '6404.00', '65', '2020-06-22 14:49:06', '2020-06-22 14:49:06', '5443.40');
INSERT INTO `product_skus` VALUES ('120', '42', 'magnam', 'Quae enim hic iste est amet molestiae accusantium.', '321.00', '321.00', '246', '2020-06-22 14:49:06', '2020-06-22 14:49:06', '272.85');
INSERT INTO `product_skus` VALUES ('121', '42', 'ducimus', 'Eos sint voluptates vel commodi et iure.', '5921.00', '5921.00', '729', '2020-06-22 14:49:06', '2020-06-22 14:49:06', '5032.85');
INSERT INTO `product_skus` VALUES ('122', '43', 'officia', 'Velit inventore voluptas tempore accusantium iusto.', '3534.00', '3534.00', '451', '2020-06-22 14:49:06', '2020-06-22 14:49:06', '3003.90');
INSERT INTO `product_skus` VALUES ('123', '43', 'sit', 'Ad doloribus sed iure et a.', '1392.00', '1392.00', '777', '2020-06-22 14:49:06', '2020-06-22 14:49:06', '1183.20');
INSERT INTO `product_skus` VALUES ('124', '43', 'placeat', 'Consequatur cum quia voluptas.', '8226.00', '8226.00', '49', '2020-06-22 14:49:06', '2020-06-22 14:49:06', '6992.10');
INSERT INTO `product_skus` VALUES ('125', '44', 'aut', 'Quasi sint aut et quod.', '1381.00', '1381.00', '741', '2020-06-22 14:49:06', '2020-06-22 14:49:06', '1173.85');
INSERT INTO `product_skus` VALUES ('126', '44', 'amet', 'Deserunt quis veniam numquam fugiat rerum.', '6340.00', '6340.00', '151', '2020-06-22 14:49:06', '2020-06-22 14:49:06', '5389.00');
INSERT INTO `product_skus` VALUES ('127', '44', 'corporis', 'Laudantium quia saepe exercitationem ipsa qui est eveniet.', '3130.00', '3130.00', '604', '2020-06-22 14:49:06', '2020-06-22 14:49:06', '2660.50');
INSERT INTO `product_skus` VALUES ('128', '45', 'eligendi', 'Et quia cupiditate officiis sint tempore distinctio.', '5135.00', '5135.00', '25', '2020-06-22 14:49:06', '2020-06-22 14:49:06', '4364.75');
INSERT INTO `product_skus` VALUES ('129', '45', 'architecto', 'Veritatis vitae accusantium temporibus sunt.', '8662.00', '8662.00', '991', '2020-06-22 14:49:06', '2020-06-22 14:49:06', '7362.70');
INSERT INTO `product_skus` VALUES ('130', '45', 'asperiores', 'Non accusantium qui autem praesentium est.', '6725.00', '6725.00', '445', '2020-06-22 14:49:06', '2020-06-22 14:49:06', '5716.25');
INSERT INTO `product_skus` VALUES ('131', '46', 'quia', 'Repellendus unde architecto qui aut et sunt.', '6485.00', '6485.00', '491', '2020-06-22 14:49:06', '2020-06-22 14:49:06', '5512.25');
INSERT INTO `product_skus` VALUES ('132', '46', 'natus', 'Dignissimos consectetur magnam ut qui sit consequatur sint.', '4848.00', '4848.00', '868', '2020-06-22 14:49:06', '2020-06-22 14:49:06', '4120.80');
INSERT INTO `product_skus` VALUES ('133', '46', 'consequatur', 'Tempore saepe nostrum tempore eius sint possimus illo.', '9787.00', '9787.00', '718', '2020-06-22 14:49:06', '2020-06-22 14:49:06', '8318.95');
INSERT INTO `product_skus` VALUES ('134', '47', 'minus', 'Officiis qui sequi sit quis.', '4111.00', '4111.00', '347', '2020-06-22 14:49:07', '2020-06-22 14:49:07', '3494.35');
INSERT INTO `product_skus` VALUES ('135', '47', 'eos', 'Ut reprehenderit totam est qui maiores non.', '7594.00', '7594.00', '790', '2020-06-22 14:49:07', '2020-06-22 14:49:07', '6454.90');
INSERT INTO `product_skus` VALUES ('136', '47', 'et', 'Rerum omnis dignissimos aliquid voluptatum.', '972.00', '972.00', '680', '2020-06-22 14:49:07', '2020-06-22 14:49:07', '826.20');
INSERT INTO `product_skus` VALUES ('137', '48', 'laudantium', 'Nisi atque qui dolore qui quo sequi est.', '5739.00', '5739.00', '199', '2020-06-22 14:49:07', '2020-06-22 14:49:07', '4878.15');
INSERT INTO `product_skus` VALUES ('138', '48', 'quae', 'Impedit praesentium rem sequi repellat minus cupiditate et.', '1819.00', '1819.00', '221', '2020-06-22 14:49:07', '2020-06-22 14:49:07', '1546.15');
INSERT INTO `product_skus` VALUES ('139', '48', 'nihil', 'Est cupiditate eius accusantium dolores rerum.', '284.00', '284.00', '923', '2020-06-22 14:49:07', '2020-06-22 14:49:07', '241.40');
INSERT INTO `product_skus` VALUES ('140', '49', 'rerum', 'Modi aliquam distinctio sint et sed.', '8251.00', '8251.00', '242', '2020-06-22 14:49:07', '2020-06-22 14:49:07', '7013.35');
INSERT INTO `product_skus` VALUES ('141', '49', 'accusamus', 'Et eaque vel totam dolores atque libero.', '2744.00', '2744.00', '391', '2020-06-22 14:49:07', '2020-06-22 14:49:07', '2332.40');
INSERT INTO `product_skus` VALUES ('142', '49', 'dolore', 'Corrupti ut non dolorem nemo nobis illum repudiandae.', '6265.00', '6265.00', '594', '2020-06-22 14:49:07', '2020-06-22 14:49:07', '5325.25');
INSERT INTO `product_skus` VALUES ('143', '50', 'natus', 'Ea ut rerum minima ea qui.', '6294.00', '6294.00', '30', '2020-06-22 14:49:07', '2020-06-22 14:49:07', '5349.90');
INSERT INTO `product_skus` VALUES ('144', '50', 'consequuntur', 'Veritatis nam et fugiat est non earum.', '2487.00', '2487.00', '867', '2020-06-22 14:49:07', '2020-06-22 14:49:07', '2113.95');
INSERT INTO `product_skus` VALUES ('145', '50', 'nam', 'Non quae ipsum labore quia quos temporibus numquam.', '8820.00', '8820.00', '165', '2020-06-22 14:49:07', '2020-06-22 14:49:07', '7497.00');
INSERT INTO `product_skus` VALUES ('146', '51', 'quasi', 'Perspiciatis unde nam dolor mollitia consequatur modi qui dicta.', '1415.00', '1415.00', '113', '2020-06-22 14:49:07', '2020-06-22 14:49:07', '1202.75');
INSERT INTO `product_skus` VALUES ('147', '51', 'asperiores', 'Velit voluptatem quae officia saepe quia tempora.', '2011.00', '2011.00', '14', '2020-06-22 14:49:07', '2020-06-22 14:49:07', '1709.35');
INSERT INTO `product_skus` VALUES ('148', '51', 'quia', 'Voluptas repellat eos rerum eveniet.', '6176.00', '6176.00', '362', '2020-06-22 14:49:07', '2020-06-22 14:49:07', '5249.60');
INSERT INTO `product_skus` VALUES ('149', '52', 'cumque', 'Fugit aut aut eos fugit dolor.', '6983.00', '6983.00', '765', '2020-06-22 14:49:08', '2020-06-22 14:49:08', '5935.55');
INSERT INTO `product_skus` VALUES ('150', '52', 'mollitia', 'Praesentium aperiam a nisi est illo sapiente.', '1859.00', '1859.00', '654', '2020-06-22 14:49:08', '2020-06-22 14:49:08', '1580.15');
INSERT INTO `product_skus` VALUES ('151', '52', 'ea', 'Voluptas consequatur esse eveniet possimus.', '7121.00', '7121.00', '709', '2020-06-22 14:49:08', '2020-06-22 14:49:08', '6052.85');
INSERT INTO `product_skus` VALUES ('152', '53', 'error', 'Assumenda repellendus non facilis officiis.', '8138.00', '8138.00', '124', '2020-06-22 14:49:08', '2020-06-22 14:49:08', '6917.30');
INSERT INTO `product_skus` VALUES ('153', '53', 'modi', 'Occaecati et totam et qui non.', '8542.00', '8542.00', '806', '2020-06-22 14:49:08', '2020-06-22 14:49:08', '7260.70');
INSERT INTO `product_skus` VALUES ('154', '53', 'ea', 'Ab quas quasi fugiat.', '948.00', '948.00', '156', '2020-06-22 14:49:08', '2020-06-22 14:49:08', '805.80');
INSERT INTO `product_skus` VALUES ('155', '54', 'voluptas', 'Temporibus perspiciatis amet et et corrupti sint qui.', '4186.00', '4186.00', '633', '2020-06-22 14:49:08', '2020-06-22 14:49:08', '3558.10');
INSERT INTO `product_skus` VALUES ('156', '54', 'quae', 'Molestiae et ut voluptas quo qui et.', '2394.00', '2394.00', '256', '2020-06-22 14:49:08', '2020-06-22 14:49:08', '2034.90');
INSERT INTO `product_skus` VALUES ('157', '54', 'ea', 'Ut animi eos nihil eligendi sit explicabo maxime.', '5367.00', '5367.00', '487', '2020-06-22 14:49:08', '2020-06-22 14:49:08', '4561.95');
INSERT INTO `product_skus` VALUES ('158', '55', 'itaque', 'Et aut totam commodi labore sit eos.', '2281.00', '2281.00', '999', '2020-06-22 14:49:08', '2020-06-22 14:49:08', '1938.85');
INSERT INTO `product_skus` VALUES ('159', '55', 'eaque', 'Fugiat voluptatem quod non beatae dolorem.', '891.00', '891.00', '401', '2020-06-22 14:49:08', '2020-06-22 14:49:08', '757.35');
INSERT INTO `product_skus` VALUES ('160', '55', 'quaerat', 'Ipsa expedita ut assumenda sed sed fugiat maxime.', '7532.00', '7532.00', '706', '2020-06-22 14:49:08', '2020-06-22 14:49:08', '6402.20');
INSERT INTO `product_skus` VALUES ('161', '58', 'iphone7', '11', '6000.00', '6000.00', '100', '2020-06-22 16:25:52', '2020-06-22 16:25:52', '5100.00');
INSERT INTO `product_skus` VALUES ('162', '59', '全自动', '全自动', '100.00', '100.00', '101', '2020-06-23 10:04:22', '2020-09-23 13:44:26', '85.00');
INSERT INTO `product_skus` VALUES ('163', '60', '全自动', '全自动', '10000.00', '10000.00', '100', '2020-06-23 10:06:19', '2020-06-23 10:06:19', '8500.00');
INSERT INTO `product_skus` VALUES ('164', '61', 't470', 't470', '5000.00', '5000.00', '100', '2020-06-23 10:45:22', '2020-06-23 10:45:22', '4250.00');
INSERT INTO `product_skus` VALUES ('165', '62', '全自动', '全自动', '100.00', '100.00', '100', '2020-06-23 10:53:36', '2020-06-23 10:53:36', '85.00');
INSERT INTO `product_skus` VALUES ('166', '63', '全自动', '全自动', '500.00', '500.00', '200', '2020-06-23 10:55:55', '2020-06-23 10:55:55', '425.00');
INSERT INTO `product_skus` VALUES ('167', '64', '全自动', '全自动', '10.00', '100.00', '100', '2020-06-23 11:12:58', '2020-08-20 16:44:06', '8.50');
INSERT INTO `product_skus` VALUES ('168', '65', '全自动', '全自动', '100.00', '200.00', '100', '2020-06-23 15:10:35', '2020-06-23 15:10:35', '85.00');
INSERT INTO `product_skus` VALUES ('169', '66', '充电', '充电', '80.00', '100.00', '100', '2020-06-23 15:22:48', '2020-06-23 15:22:48', '68.00');
INSERT INTO `product_skus` VALUES ('170', '67', '舒服', '舒服', '50.00', '100.00', '100', '2020-06-23 16:00:38', '2020-06-23 16:02:25', '42.50');
INSERT INTO `product_skus` VALUES ('171', '68', '豪华', '豪华', '30.00', '80.00', '100', '2020-06-23 16:03:26', '2020-06-23 16:04:30', '25.50');
INSERT INTO `product_skus` VALUES ('172', '69', '舒服', '舒服', '80.00', '100.00', '100', '2020-06-23 16:05:26', '2020-06-23 16:05:26', '68.00');
INSERT INTO `product_skus` VALUES ('173', '70', '全自动', '全自动', '100.00', '100.00', '100', '2020-06-23 16:06:34', '2020-06-23 16:06:34', '85.00');
INSERT INTO `product_skus` VALUES ('174', '70', '防水', '防水', '120.00', '120.00', '100', '2020-06-23 16:06:34', '2020-06-23 16:06:34', '102.00');
INSERT INTO `product_skus` VALUES ('175', '71', '全自动', '全自动', '6000.00', '6000.00', '200', '2020-06-23 16:08:22', '2020-06-23 16:08:22', '5100.00');
INSERT INTO `product_skus` VALUES ('176', '72', '舒服', '舒服', '1.00', '100.00', '100', '2020-06-23 16:09:55', '2020-08-20 16:44:18', '0.85');
INSERT INTO `product_skus` VALUES ('177', '74', '8GB+128GB', '8GB+128GB', '3900.00', '4200.00', '100', '2020-06-24 15:51:51', '2020-06-24 15:51:51', '3315.00');
INSERT INTO `product_skus` VALUES ('178', '75', 'EOS 90D 机身', 'EOS 90D 机身', '7500.00', '8000.00', '100', '2020-06-24 15:57:54', '2020-07-09 11:14:03', '6375.00');
INSERT INTO `product_skus` VALUES ('179', '76', '金色铝金属表壳', '运动型表带', '3000.00', '3200.00', '100', '2020-06-24 16:05:05', '2020-07-09 14:15:22', '2550.00');
INSERT INTO `product_skus` VALUES ('180', '77', 'ps4', 'ps4', '5000.00', '6000.00', '100', '2020-06-24 16:10:37', '2020-06-24 16:10:37', '4250.00');
INSERT INTO `product_skus` VALUES ('181', '78', 'i5-8-256', '酷睿 i5/8GB/256GB/13.5英寸', '12000.00', '14000.00', '11', '2020-06-24 16:20:04', '2020-06-24 16:20:04', '10200.00');
INSERT INTO `product_skus` VALUES ('182', '79', '纽曼DL-88', '纽曼DL-88', '350.00', '350.00', '95', '2020-06-24 17:22:41', '2020-10-27 15:33:38', '297.50');
INSERT INTO `product_skus` VALUES ('183', '80', 'Pro 5G', 'Pro 5G', '5000.00', '5000.00', '100', '2020-06-24 17:27:18', '2020-06-24 17:27:18', '4250.00');
INSERT INTO `product_skus` VALUES ('184', '81', '无线蓝牙', '无线蓝牙', '1000.00', '1000.00', '100', '2020-06-25 08:06:22', '2020-06-25 08:06:22', '850.00');
INSERT INTO `product_skus` VALUES ('185', '82', '三星', '三星', '2800.00', '2800.00', '100', '2020-06-25 08:12:40', '2020-06-25 08:12:40', '2380.00');
INSERT INTO `product_skus` VALUES ('186', '83', 'i79700', '16G', '12500.00', '12500.00', '5', '2020-06-25 08:16:56', '2020-06-25 08:16:56', '10625.00');
INSERT INTO `product_skus` VALUES ('187', '84', 'Xeon Silver 4110', 'Xeon Silver 4110', '22000.00', '22000.00', '100', '2020-06-25 08:22:14', '2020-06-25 08:22:14', '18700.00');
INSERT INTO `product_skus` VALUES ('188', '85', '55英寸4K', '55英寸4K', '5000.00', '5000.00', '100', '2020-06-25 11:05:34', '2020-06-25 11:05:34', '4250.00');
INSERT INTO `product_skus` VALUES ('189', '86', '多联机一拖七', '多联机一拖七', '50000.00', '50000.00', '5', '2020-06-25 11:09:27', '2020-06-25 11:09:27', '42500.00');
INSERT INTO `product_skus` VALUES ('190', '87', '彩色200万', '彩色200万', '1400.00', '1400.00', '100', '2020-06-25 11:12:33', '2020-06-25 11:12:33', '1190.00');
INSERT INTO `product_skus` VALUES ('191', '88', 'RAM768MB ROM4GB', 'RAM：768MB ROM：4GB', '3000.00', '3000.00', '11', '2020-06-25 11:16:24', '2020-06-25 11:16:24', '2550.00');
INSERT INTO `product_skus` VALUES ('192', '89', '遥控', '遥控干湿两用', '3000.00', '3000.00', '100', '2020-06-25 11:21:01', '2020-06-25 11:21:01', '2550.00');
INSERT INTO `product_skus` VALUES ('193', '90', '8GB/128GB', '8GB/128GB', '3000.00', '3000.00', '100', '2020-06-25 12:21:00', '2020-06-25 12:21:00', '2550.00');
INSERT INTO `product_skus` VALUES ('194', '91', '12G128G', '12G128G', '3000.00', '3000.00', '99', '2020-06-25 12:25:06', '2020-11-04 13:09:06', '2550.00');
INSERT INTO `product_skus` VALUES ('195', '92', '8-128', '8-128', '3000.00', '3000.00', '96', '2020-06-25 12:27:35', '2020-10-29 14:56:29', '2550.00');
INSERT INTO `product_skus` VALUES ('196', '93', '454*454像素', '454*454像素', '800.00', '800.00', '100', '2020-06-25 12:32:56', '2020-06-25 12:32:56', '680.00');
INSERT INTO `product_skus` VALUES ('197', '94', '4G', '4G', '3000.00', '3000.00', '100', '2020-06-25 12:37:44', '2020-06-25 12:37:44', '2550.00');
INSERT INTO `product_skus` VALUES ('198', '95', '高通骁龙 Wear 2500', '高通骁龙 Wear 2500', '800.00', '800.00', '98', '2020-06-25 12:41:32', '2020-10-27 15:33:38', '680.00');
INSERT INTO `product_skus` VALUES ('199', '96', '先锋版', '先锋版', '3000.00', '3000.00', '11', '2020-06-25 12:48:25', '2020-07-14 16:05:59', '2550.00');
INSERT INTO `product_skus` VALUES ('200', '97', 'iphone-x', 'iphone-x', '8000.00', '8000.00', '100', '2020-06-25 12:53:50', '2020-06-25 12:53:50', '6800.00');
INSERT INTO `product_skus` VALUES ('201', '98', '32GB', '32GB', '8000.00', '8000.00', '5', '2020-06-25 14:13:51', '2020-06-25 14:13:51', '6800.00');
INSERT INTO `product_skus` VALUES ('202', '99', '银黑色', '银黑色', '349.00', '699.00', '100', '2020-06-25 17:53:40', '2020-07-15 15:58:26', '296.65');
INSERT INTO `product_skus` VALUES ('203', '100', '官方标配', '官方标配', '89.00', '179.00', '100', '2020-06-25 17:59:16', '2020-06-25 17:59:16', '75.65');
INSERT INTO `product_skus` VALUES ('204', '101', 'R5/16GB/512G SSD/集成显卡', 'Air 14 2020', '5000.00', '6000.00', '11', '2020-06-25 18:03:08', '2020-08-20 16:43:45', '4250.00');
INSERT INTO `product_skus` VALUES ('205', '102', '十代i5/8GB板载+8GB', '十代i5/8GB板载+8GB', '3000.00', '6000.00', '100', '2020-06-25 18:06:43', '2020-06-25 18:06:43', '2550.00');
INSERT INTO `product_skus` VALUES ('206', '103', '4G+64G', '4G+64G', '2000.00', '1600.00', '100', '2020-06-25 18:09:56', '2020-06-25 18:09:56', '1700.00');
INSERT INTO `product_skus` VALUES ('207', '104', '4TB*2', '4TB*2', '600.00', '800.00', '100', '2020-06-25 18:15:06', '2020-06-25 18:15:06', '510.00');
INSERT INTO `product_skus` VALUES ('208', '105', 'A1', 'A1', '1500.00', '3000.00', '5', '2020-06-25 18:19:14', '2020-06-25 18:19:14', '1275.00');
INSERT INTO `product_skus` VALUES ('209', '106', '适配器', '适配器', '300.00', '600.00', '100', '2020-06-25 18:54:30', '2020-06-25 18:54:30', '255.00');
INSERT INTO `product_skus` VALUES ('210', '107', 'i7含背光键盘', 'i7含背光键盘', '7000.00', '10000.00', '11', '2020-06-25 18:58:02', '2020-06-25 18:58:02', '5950.00');
INSERT INTO `product_skus` VALUES ('211', '108', '乐迪早教机器人', '乐迪早教机器人', '300.00', '300.00', '997', '2020-06-25 19:17:42', '2020-07-14 16:52:42', '255.00');
INSERT INTO `product_skus` VALUES ('212', '109', '8GB/128GB', '8GB/128GB', '1500.00', '2000.00', '100', '2020-07-13 11:01:01', '2020-07-13 11:01:01', '1275.00');
INSERT INTO `product_skus` VALUES ('213', '110', '8GB/128GB', '8GB/128GB', '3000.00', '5000.00', '100', '2020-07-13 11:02:34', '2020-07-13 11:02:34', '2550.00');
INSERT INTO `product_skus` VALUES ('214', '111', '12GB/128GB', '12GB/128GB', '5000.00', '6000.00', '11', '2020-07-13 11:04:09', '2020-07-13 11:04:09', '4250.00');
INSERT INTO `product_skus` VALUES ('215', '112', '6GB/128GB', '6GB/128GB', '3000.00', '4000.00', '22', '2020-07-13 11:05:42', '2020-07-13 11:05:42', '2550.00');
INSERT INTO `product_skus` VALUES ('216', '113', '4GB/64GB', '4GB/64GB', '6000.00', '6000.00', '20', '2020-08-05 10:22:09', '2020-08-05 14:59:08', '5100.00');
INSERT INTO `product_skus` VALUES ('217', '113', '4GB/32GB', '4GB/32GB', '5000.00', '5000.00', '20', '2020-08-05 15:15:14', '2020-08-05 15:15:58', '4250.00');
INSERT INTO `product_skus` VALUES ('224', '114', '小米L65M5-OD', '小米L65M5-OD', '13000.00', '13000.00', '100', '2020-08-06 09:06:55', '2020-08-06 09:06:55', '11050.00');
INSERT INTO `product_skus` VALUES ('228', '118', 'MR9U2CH/A', 'Intel 酷睿i5 8259U', '10000.00', '12000.00', '20', '2020-08-06 11:12:59', '2020-08-06 11:12:59', '8500.00');
INSERT INTO `product_skus` VALUES ('231', '121', '8GB/128GB', '8GB/128GB', '3600.00', '4000.00', '19', '2020-08-06 15:46:31', '2020-09-24 10:03:42', '3060.00');

-- ----------------------------
-- Table structure for `product_sku_properties`
-- ----------------------------
DROP TABLE IF EXISTS `product_sku_properties`;
CREATE TABLE `product_sku_properties` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_sku_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '商品编码',
  `base_property_id` bigint(20) NOT NULL DEFAULT '0',
  `base_property_item_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '属性编码',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '参数名称',
  `prop_value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '参数值',
  PRIMARY KEY (`id`),
  KEY `product_sku_properties_product_sku_id_foreign` (`product_sku_id`),
  KEY `product_sku_properties_base_property_item_id_foreign` (`base_property_item_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_sku_properties
-- ----------------------------
INSERT INTO `product_sku_properties` VALUES ('1', '183', '1', '1', '处理器', 'Intel i5');
INSERT INTO `product_sku_properties` VALUES ('2', '183', '0', '0', '产地', '江苏-南京');
INSERT INTO `product_sku_properties` VALUES ('3', '183', '2', '4', '内存容量', '8G');

-- ----------------------------
-- Table structure for `provinces`
-- ----------------------------
DROP TABLE IF EXISTS `provinces`;
CREATE TABLE `provinces` (
  `id` int(10) NOT NULL COMMENT 'ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '栏目名',
  `pid` int(10) NOT NULL DEFAULT '0' COMMENT '父栏目',
  `short_title` varchar(50) DEFAULT '' COMMENT '缩写',
  `areacode` int(6) DEFAULT '0' COMMENT '区域编码',
  `zipcode` int(10) DEFAULT '0' COMMENT '邮政编码',
  `pinyin` varchar(100) DEFAULT '' COMMENT '拼音',
  `lng` varchar(20) DEFAULT '' COMMENT '经度',
  `lat` varchar(20) DEFAULT '' COMMENT '纬度',
  `level` tinyint(4) NOT NULL DEFAULT '1' COMMENT '级别',
  `tree` varchar(200) NOT NULL,
  `sort` tinyint(3) unsigned DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `parentid` (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='公用_省市区记录表';

-- ----------------------------
-- Records of provinces
-- ----------------------------
INSERT INTO `provinces` VALUES ('810000', '香港特别行政区', '0', '', '0', '0', 'X', '114.18612410257', '22.29358599328', '1', 'tr_0 ', '0');
INSERT INTO `provinces` VALUES ('810100', '九龙', '810000', '', '0', '0', 'J', '101.51341566718', '29.006431902925', '2', 'tr_0 tr_810000 ', '0');
INSERT INTO `provinces` VALUES ('810101', '观塘区', '810100', '', '0', '0', 'G', '114.23743100142', '22.316803500017', '3', 'tr_0 tr_810000 tr_810100 ', '0');
INSERT INTO `provinces` VALUES ('810102', '黄大仙区', '810100', '', '0', '0', 'H', '114.2055528338', '22.344516581114', '3', 'tr_0 tr_810000 tr_810100 ', '0');
INSERT INTO `provinces` VALUES ('810103', '九龙城区', '810100', '', '0', '0', 'J', '114.19855413557', '22.325722838593', '3', 'tr_0 tr_810000 tr_810100 ', '0');
INSERT INTO `provinces` VALUES ('810104', '深水埗区', '810100', '', '0', '0', 'S', '114.17556515012', '22.334814518942', '3', 'tr_0 tr_810000 tr_810100 ', '0');
INSERT INTO `provinces` VALUES ('810105', '油尖旺区', '810100', '', '0', '0', 'Y', '114.17854456', '22.306583887776', '3', 'tr_0 tr_810000 tr_810100 ', '0');
INSERT INTO `provinces` VALUES ('810200', '香港岛', '810000', '', '0', '0', 'X', '114.1838696432', '22.272099587606', '2', 'tr_0 tr_810000 ', '0');
INSERT INTO `provinces` VALUES ('810201', '东区', '810200', '', '0', '0', 'D', '114.03675495515', '32.983906128946', '3', 'tr_0 tr_810000 tr_810200 ', '0');
INSERT INTO `provinces` VALUES ('810202', '南区', '810200', '', '0', '0', 'N', '114.18612410257', '22.29358599328', '3', 'tr_0 tr_810000 tr_810200 ', '0');
INSERT INTO `provinces` VALUES ('810203', '湾仔区', '810200', '', '0', '0', 'W', '114.1838696432', '22.272099587606', '3', 'tr_0 tr_810000 tr_810200 ', '0');
INSERT INTO `provinces` VALUES ('810204', '中西区', '810200', '', '0', '0', 'Z', '114.15949141031', '22.291342714292', '3', 'tr_0 tr_810000 tr_810200 ', '0');
INSERT INTO `provinces` VALUES ('810300', '新界', '810000', '', '0', '0', 'X', '114.18612410257', '22.29358599328', '2', 'tr_0 tr_810000 ', '0');
INSERT INTO `provinces` VALUES ('810301', '北区', '810300', '', '0', '0', 'B', '114.56208137457', '38.029818054403', '3', 'tr_0 tr_810000 tr_810300 ', '0');
INSERT INTO `provinces` VALUES ('810302', '大埔区', '810300', '', '0', '0', 'D', '114.14670082713', '22.427434108219', '3', 'tr_0 tr_810000 tr_810300 ', '0');
INSERT INTO `provinces` VALUES ('810303', '葵青区', '810300', '', '0', '0', 'K', '114.14347453324', '22.36661881253', '3', 'tr_0 tr_810000 tr_810300 ', '0');
INSERT INTO `provinces` VALUES ('810304', '离岛区', '810300', '', '0', '0', 'L', '113.95154733906', '22.286066480198', '3', 'tr_0 tr_810000 tr_810300 ', '0');
INSERT INTO `provinces` VALUES ('810305', '荃湾区', '810300', '', '0', '0', 'Q', '114.126440954', '22.378243962528', '3', 'tr_0 tr_810000 tr_810300 ', '0');
INSERT INTO `provinces` VALUES ('810306', '沙田区', '810300', '', '0', '0', 'S', '114.19855144065', '22.388522255034', '3', 'tr_0 tr_810000 tr_810300 ', '0');
INSERT INTO `provinces` VALUES ('810307', '屯门区', '810300', '', '0', '0', 'T', '113.98745602385', '22.393584799271', '3', 'tr_0 tr_810000 tr_810300 ', '0');
INSERT INTO `provinces` VALUES ('810308', '西贡区', '810300', '', '0', '0', 'X', '114.28352485373', '22.385077305939', '3', 'tr_0 tr_810000 tr_810300 ', '0');
INSERT INTO `provinces` VALUES ('810309', '元朗区', '810300', '', '0', '0', 'Y', '114.03850969037', '22.448564780865', '3', 'tr_0 tr_810000 tr_810300 ', '0');
INSERT INTO `provinces` VALUES ('820000', '澳门特别行政区', '0', '', '0', '0', 'A', '113.55751910182', '22.204117988443', '1', 'tr_0 ', '0');
INSERT INTO `provinces` VALUES ('820100', '离岛', '820000', '', '0', '0', 'L', '113.55751910182', '22.204117988443', '2', 'tr_0 tr_820000 ', '0');
INSERT INTO `provinces` VALUES ('820101', '嘉模堂区', '820100', '', '0', '0', 'J', '113.56551473951', '22.163142309955', '3', 'tr_0 tr_820000 tr_820100 ', '0');
INSERT INTO `provinces` VALUES ('820102', '路氹填海区', '820100', '', '0', '0', 'L', '113.95154733906', '22.286066480198', '3', 'tr_0 tr_820000 tr_820100 ', '0');
INSERT INTO `provinces` VALUES ('820103', '圣方济各堂区', '820100', '', '0', '0', 'S', '113.95154733906', '22.286066480198', '3', 'tr_0 tr_820000 tr_820100 ', '0');
INSERT INTO `provinces` VALUES ('820200', '澳门半岛', '820000', '', '0', '0', 'A', '113.56643233517', '22.195004159218', '2', 'tr_0 tr_820000 ', '0');
INSERT INTO `provinces` VALUES ('820201', '大堂区', '820200', '', '0', '0', 'D', '113.55648488269', '22.18919700752', '3', 'tr_0 tr_820000 tr_820200 ', '0');
INSERT INTO `provinces` VALUES ('820202', '风顺堂区', '820200', '', '0', '0', 'F', '113.54545108595', '22.192783044934', '3', 'tr_0 tr_820000 tr_820200 ', '0');
INSERT INTO `provinces` VALUES ('820203', '花地玛堂区', '820200', '', '0', '0', 'H', '113.55751029843', '22.212783524768', '3', 'tr_0 tr_820000 tr_820200 ', '0');
INSERT INTO `provinces` VALUES ('820204', '花王堂区', '820200', '', '0', '0', 'H', '113.5544936987', '22.206635725923', '3', 'tr_0 tr_820000 tr_820200 ', '0');
INSERT INTO `provinces` VALUES ('820205', '望德堂区', '820200', '', '0', '0', 'W', '113.5615137766', '22.202511136588', '3', 'tr_0 tr_820000 tr_820200 ', '0');
INSERT INTO `provinces` VALUES ('830000', '台湾省', '0', '', '0', '0', 'T', '121.97387097872', '24.086956718805', '1', 'tr_0 ', '0');
INSERT INTO `provinces` VALUES ('830100', '台北市', '830000', '', '0', '0', 'T', '121.5201088108', '25.063029935612', '2', 'tr_0 tr_830000 ', '0');
INSERT INTO `provinces` VALUES ('830101', '中正区', '830100', '', '0', '0', 'Z', '121.5201088108', '25.063029935612', '3', 'tr_0 tr_830000 tr_830100 ', '0');
INSERT INTO `provinces` VALUES ('830102', '大同区', '830100', '', '0', '0', 'D', '124.81937675979', '46.045583951311', '3', 'tr_0 tr_830000 tr_830100 ', '0');
INSERT INTO `provinces` VALUES ('830103', '中山区', '830100', '', '0', '0', 'Z', '121.65154739367', '38.924511115496', '3', 'tr_0 tr_830000 tr_830100 ', '0');
INSERT INTO `provinces` VALUES ('830104', '万华区', '830100', '', '0', '0', 'W', '121.5201088108', '25.063029935612', '3', 'tr_0 tr_830000 tr_830100 ', '0');
INSERT INTO `provinces` VALUES ('830105', '信义区', '830100', '', '0', '0', 'X', '121.5201088108', '25.063029935612', '3', 'tr_0 tr_830000 tr_830100 ', '0');
INSERT INTO `provinces` VALUES ('830106', '松山区', '830100', '', '0', '0', 'S', '118.9394138505', '42.292481572694', '3', 'tr_0 tr_830000 tr_830100 ', '0');
INSERT INTO `provinces` VALUES ('830107', '大安区', '830100', '', '0', '0', 'D', '104.78041635328', '29.369928541322', '3', 'tr_0 tr_830000 tr_830100 ', '0');
INSERT INTO `provinces` VALUES ('830108', '南港区', '830100', '', '0', '0', 'N', '121.5201088108', '25.063029935612', '3', 'tr_0 tr_830000 tr_830100 ', '0');
INSERT INTO `provinces` VALUES ('830109', '北投区', '830100', '', '0', '0', 'B', '121.5201088108', '25.063029935612', '3', 'tr_0 tr_830000 tr_830100 ', '0');
INSERT INTO `provinces` VALUES ('830110', '内湖区', '830100', '', '0', '0', 'N', '121.5201088108', '25.063029935612', '3', 'tr_0 tr_830000 tr_830100 ', '0');
INSERT INTO `provinces` VALUES ('830111', '士林区', '830100', '', '0', '0', 'S', '121.5201088108', '25.063029935612', '3', 'tr_0 tr_830000 tr_830100 ', '0');
INSERT INTO `provinces` VALUES ('830112', '文山区', '830100', '', '0', '0', 'W', '121.5201088108', '25.063029935612', '3', 'tr_0 tr_830000 tr_830100 ', '0');
INSERT INTO `provinces` VALUES ('830200', '新北市', '830000', '', '0', '0', 'X', '121.97387097872', '24.086956718805', '2', 'tr_0 tr_830000 ', '0');
INSERT INTO `provinces` VALUES ('830201', '板桥区', '830200', '', '0', '0', 'B', '121.46374631322', '25.009264935203', '3', 'tr_0 tr_830000 tr_830200 ', '0');
INSERT INTO `provinces` VALUES ('830202', '土城区', '830200', '', '0', '0', 'T', '121.45638215646', '24.969575575642', '3', 'tr_0 tr_830000 tr_830200 ', '0');
INSERT INTO `provinces` VALUES ('830203', '新庄区', '830200', '', '0', '0', 'X', '121.44987794847', '25.035900513246', '3', 'tr_0 tr_830000 tr_830200 ', '0');
INSERT INTO `provinces` VALUES ('830204', '新店区', '830200', '', '0', '0', 'X', '121.54851057293', '24.931579077246', '3', 'tr_0 tr_830000 tr_830200 ', '0');
INSERT INTO `provinces` VALUES ('830205', '深坑区', '830200', '', '0', '0', 'S', '121.63248449446', '25.000182732355', '3', 'tr_0 tr_830000 tr_830200 ', '0');
INSERT INTO `provinces` VALUES ('830206', '石碇区', '830200', '', '0', '0', 'S', '121.64666268478', '24.953083429509', '3', 'tr_0 tr_830000 tr_830200 ', '0');
INSERT INTO `provinces` VALUES ('830207', '坪林区', '830200', '', '0', '0', 'P', '121.73478767877', '24.915696554977', '3', 'tr_0 tr_830000 tr_830200 ', '0');
INSERT INTO `provinces` VALUES ('830208', '乌来区', '830200', '', '0', '0', 'W', '121.53050817209', '24.786532168822', '3', 'tr_0 tr_830000 tr_830200 ', '0');
INSERT INTO `provinces` VALUES ('830209', '五股区', '830200', '', '0', '0', 'W', '121.44461965429', '25.100233770435', '3', 'tr_0 tr_830000 tr_830200 ', '0');
INSERT INTO `provinces` VALUES ('830210', '八里区', '830200', '', '0', '0', 'B', '121.40465098523', '25.130119585774', '3', 'tr_0 tr_830000 tr_830200 ', '0');
INSERT INTO `provinces` VALUES ('830211', '林口区', '830200', '', '0', '0', 'L', '121.35894397022', '25.103036147515', '3', 'tr_0 tr_830000 tr_830200 ', '0');
INSERT INTO `provinces` VALUES ('830212', '淡水区', '830200', '', '0', '0', 'D', '121.47260573633', '25.187238161176', '3', 'tr_0 tr_830000 tr_830200 ', '0');
INSERT INTO `provinces` VALUES ('830213', '中和区', '830200', '', '0', '0', 'Z', '119.97751429276', '31.836323947624', '3', 'tr_0 tr_830000 tr_830200 ', '0');
INSERT INTO `provinces` VALUES ('830214', '永和区', '830200', '', '0', '0', 'Y', '121.52736966421', '25.010500528231', '3', 'tr_0 tr_830000 tr_830200 ', '0');
INSERT INTO `provinces` VALUES ('830215', '三重区', '830200', '', '0', '0', 'S', '121.49687574316', '25.069790814298', '3', 'tr_0 tr_830000 tr_830200 ', '0');
INSERT INTO `provinces` VALUES ('830216', '芦洲区', '830200', '', '0', '0', 'L', '121.47982274435', '25.091134839883', '3', 'tr_0 tr_830000 tr_830200 ', '0');
INSERT INTO `provinces` VALUES ('830217', '泰山区', '830200', '', '0', '0', 'T', '117.14141108582', '36.199444601195', '3', 'tr_0 tr_830000 tr_830200 ', '0');
INSERT INTO `provinces` VALUES ('830218', '树林区', '830200', '', '0', '0', 'S', '121.412622083', '24.984757647837', '3', 'tr_0 tr_830000 tr_830200 ', '0');
INSERT INTO `provinces` VALUES ('830219', '莺歌区', '830200', '', '0', '0', 'Y', '121.35899891418', '24.958676651245', '3', 'tr_0 tr_830000 tr_830200 ', '0');
INSERT INTO `provinces` VALUES ('830220', '三峡区', '830200', '', '0', '0', 'S', '121.42609502893', '24.87480469353', '3', 'tr_0 tr_830000 tr_830200 ', '0');
INSERT INTO `provinces` VALUES ('830221', '汐止区', '830200', '', '0', '0', 'X', '121.66100298061', '25.086721897126', '3', 'tr_0 tr_830000 tr_830200 ', '0');
INSERT INTO `provinces` VALUES ('830222', '金山区', '830200', '', '0', '0', 'J', '121.34848004512', '30.74785237657', '3', 'tr_0 tr_830000 tr_830200 ', '0');
INSERT INTO `provinces` VALUES ('830223', '万里区', '830200', '', '0', '0', 'W', '121.66558782234', '25.179420721026', '3', 'tr_0 tr_830000 tr_830200 ', '0');
INSERT INTO `provinces` VALUES ('830224', '三芝区', '830200', '', '0', '0', 'S', '121.53552324466', '25.233947831353', '3', 'tr_0 tr_830000 tr_830200 ', '0');
INSERT INTO `provinces` VALUES ('830225', '石门区', '830200', '', '0', '0', 'S', '121.59364212175', '25.261063301582', '3', 'tr_0 tr_830000 tr_830200 ', '0');
INSERT INTO `provinces` VALUES ('830226', '瑞芳区', '830200', '', '0', '0', 'R', '121.81592241951', '25.092372901641', '3', 'tr_0 tr_830000 tr_830200 ', '0');
INSERT INTO `provinces` VALUES ('830227', '贡寮区', '830200', '', '0', '0', 'G', '121.92278316131', '25.044375645825', '3', 'tr_0 tr_830000 tr_830200 ', '0');
INSERT INTO `provinces` VALUES ('830228', '双溪区', '830200', '', '0', '0', 'S', '121.8310510997', '25.001750367683', '3', 'tr_0 tr_830000 tr_830200 ', '0');
INSERT INTO `provinces` VALUES ('830229', '平溪区', '830200', '', '0', '0', 'P', '121.75897792057', '25.028954662262', '3', 'tr_0 tr_830000 tr_830200 ', '0');
INSERT INTO `provinces` VALUES ('830300', '桃园市', '830000', '', '0', '0', 'T', '121.97387097872', '24.086956718805', '2', 'tr_0 tr_830000 ', '0');
INSERT INTO `provinces` VALUES ('830301', '桃园区', '830300', '', '0', '0', 'T', '115.95771247803', '39.980514890446', '3', 'tr_0 tr_830000 tr_830300 ', '0');
INSERT INTO `provinces` VALUES ('830302', '中坜区', '830300', '', '0', '0', 'Z', '115.95771247803', '39.980514890446', '3', 'tr_0 tr_830000 tr_830300 ', '0');
INSERT INTO `provinces` VALUES ('830303', '平镇区', '830300', '', '0', '0', 'P', '115.95771247803', '39.980514890446', '3', 'tr_0 tr_830000 tr_830300 ', '0');
INSERT INTO `provinces` VALUES ('830304', '八德区', '830300', '', '0', '0', 'B', '115.95771247803', '39.980514890446', '3', 'tr_0 tr_830000 tr_830300 ', '0');
INSERT INTO `provinces` VALUES ('830305', '杨梅区', '830300', '', '0', '0', 'Y', '110.86164512823', '21.447395667888', '3', 'tr_0 tr_830000 tr_830300 ', '0');
INSERT INTO `provinces` VALUES ('830306', '芦竹区', '830300', '', '0', '0', 'L', '115.95771247803', '39.980514890446', '3', 'tr_0 tr_830000 tr_830300 ', '0');
INSERT INTO `provinces` VALUES ('830307', '大溪区', '830300', '', '0', '0', 'D', '115.95771247803', '39.980514890446', '3', 'tr_0 tr_830000 tr_830300 ', '0');
INSERT INTO `provinces` VALUES ('830308', '龙潭区', '830300', '', '0', '0', 'L', '126.56854459242', '43.91634255363', '3', 'tr_0 tr_830000 tr_830300 ', '0');
INSERT INTO `provinces` VALUES ('830309', '龟山区', '830300', '', '0', '0', 'G', '115.95771247803', '39.980514890446', '3', 'tr_0 tr_830000 tr_830300 ', '0');
INSERT INTO `provinces` VALUES ('830310', '大园区', '830300', '', '0', '0', 'D', '115.95771247803', '39.980514890446', '3', 'tr_0 tr_830000 tr_830300 ', '0');
INSERT INTO `provinces` VALUES ('830311', '观音区', '830300', '', '0', '0', 'G', '120.42538525561', '36.169241550407', '3', 'tr_0 tr_830000 tr_830300 ', '0');
INSERT INTO `provinces` VALUES ('830312', '新屋区', '830300', '', '0', '0', 'X', '115.95771247803', '39.980514890446', '3', 'tr_0 tr_830000 tr_830300 ', '0');
INSERT INTO `provinces` VALUES ('830313', '复兴区', '830300', '', '0', '0', 'F', '114.44809470749', '36.610368592227', '3', 'tr_0 tr_830000 tr_830300 ', '0');
INSERT INTO `provinces` VALUES ('830400', '台中市', '830000', '', '0', '0', 'T', '121.97387097872', '24.086956718805', '2', 'tr_0 tr_830000 ', '0');
INSERT INTO `provinces` VALUES ('830401', '中区', '830400', '', '0', '0', 'Z', '119.33696304538', '26.091557030419', '3', 'tr_0 tr_830000 tr_830400 ', '0');
INSERT INTO `provinces` VALUES ('830402', '东区', '830400', '', '0', '0', 'D', '119.33696304538', '26.091557030419', '3', 'tr_0 tr_830000 tr_830400 ', '0');
INSERT INTO `provinces` VALUES ('830403', '西区', '830400', '', '0', '0', 'X', '119.33696304538', '26.091557030419', '3', 'tr_0 tr_830000 tr_830400 ', '0');
INSERT INTO `provinces` VALUES ('830404', '南区', '830400', '', '0', '0', 'N', '119.33696304538', '26.091557030419', '3', 'tr_0 tr_830000 tr_830400 ', '0');
INSERT INTO `provinces` VALUES ('830405', '北区', '830400', '', '0', '0', 'B', '119.33696304538', '26.091557030419', '3', 'tr_0 tr_830000 tr_830400 ', '0');
INSERT INTO `provinces` VALUES ('830406', '西屯区', '830400', '', '0', '0', 'X', '119.33696304538', '26.091557030419', '3', 'tr_0 tr_830000 tr_830400 ', '0');
INSERT INTO `provinces` VALUES ('830407', '南屯区', '830400', '', '0', '0', 'N', '119.33696304538', '26.091557030419', '3', 'tr_0 tr_830000 tr_830400 ', '0');
INSERT INTO `provinces` VALUES ('830408', '北屯区', '830400', '', '0', '0', 'B', '119.33696304538', '26.091557030419', '3', 'tr_0 tr_830000 tr_830400 ', '0');
INSERT INTO `provinces` VALUES ('830409', '丰原区', '830400', '', '0', '0', 'F', '119.33696304538', '26.091557030419', '3', 'tr_0 tr_830000 tr_830400 ', '0');
INSERT INTO `provinces` VALUES ('830410', '大里区', '830400', '', '0', '0', 'D', '119.33696304538', '26.091557030419', '3', 'tr_0 tr_830000 tr_830400 ', '0');
INSERT INTO `provinces` VALUES ('830411', '太平区', '830400', '', '0', '0', 'T', '121.68538413681', '42.016967854141', '3', 'tr_0 tr_830000 tr_830400 ', '0');
INSERT INTO `provinces` VALUES ('830412', '东势区', '830400', '', '0', '0', 'D', '119.33696304538', '26.091557030419', '3', 'tr_0 tr_830000 tr_830400 ', '0');
INSERT INTO `provinces` VALUES ('830413', '大甲区', '830400', '', '0', '0', 'D', '119.33696304538', '26.091557030419', '3', 'tr_0 tr_830000 tr_830400 ', '0');
INSERT INTO `provinces` VALUES ('830414', '清水区', '830400', '', '0', '0', 'Q', '119.33696304538', '26.091557030419', '3', 'tr_0 tr_830000 tr_830400 ', '0');
INSERT INTO `provinces` VALUES ('830415', '沙鹿区', '830400', '', '0', '0', 'S', '119.33696304538', '26.091557030419', '3', 'tr_0 tr_830000 tr_830400 ', '0');
INSERT INTO `provinces` VALUES ('830416', '梧栖区', '830400', '', '0', '0', 'W', '119.33696304538', '26.091557030419', '3', 'tr_0 tr_830000 tr_830400 ', '0');
INSERT INTO `provinces` VALUES ('830417', '后里区', '830400', '', '0', '0', 'H', '119.33696304538', '26.091557030419', '3', 'tr_0 tr_830000 tr_830400 ', '0');
INSERT INTO `provinces` VALUES ('830418', '神冈区', '830400', '', '0', '0', 'S', '119.33696304538', '26.091557030419', '3', 'tr_0 tr_830000 tr_830400 ', '0');
INSERT INTO `provinces` VALUES ('830419', '潭子区', '830400', '', '0', '0', 'T', '119.33696304538', '26.091557030419', '3', 'tr_0 tr_830000 tr_830400 ', '0');
INSERT INTO `provinces` VALUES ('830420', '大雅区', '830400', '', '0', '0', 'D', '119.33696304538', '26.091557030419', '3', 'tr_0 tr_830000 tr_830400 ', '0');
INSERT INTO `provinces` VALUES ('830421', '新小区', '830400', '', '0', '0', 'X', '119.33696304538', '26.091557030419', '3', 'tr_0 tr_830000 tr_830400 ', '0');
INSERT INTO `provinces` VALUES ('830422', '石冈区', '830400', '', '0', '0', 'S', '119.33696304538', '26.091557030419', '3', 'tr_0 tr_830000 tr_830400 ', '0');
INSERT INTO `provinces` VALUES ('830423', '外埔区', '830400', '', '0', '0', 'W', '119.33696304538', '26.091557030419', '3', 'tr_0 tr_830000 tr_830400 ', '0');
INSERT INTO `provinces` VALUES ('830424', '大安区', '830400', '', '0', '0', 'D', '104.78041635328', '29.369928541322', '3', 'tr_0 tr_830000 tr_830400 ', '0');
INSERT INTO `provinces` VALUES ('830425', '乌日区', '830400', '', '0', '0', 'W', '119.33696304538', '26.091557030419', '3', 'tr_0 tr_830000 tr_830400 ', '0');
INSERT INTO `provinces` VALUES ('830426', '大肚区', '830400', '', '0', '0', 'D', '119.33696304538', '26.091557030419', '3', 'tr_0 tr_830000 tr_830400 ', '0');
INSERT INTO `provinces` VALUES ('830427', '龙井区', '830400', '', '0', '0', 'L', '119.33696304538', '26.091557030419', '3', 'tr_0 tr_830000 tr_830400 ', '0');
INSERT INTO `provinces` VALUES ('830428', '雾峰区', '830400', '', '0', '0', 'W', '119.33696304538', '26.091557030419', '3', 'tr_0 tr_830000 tr_830400 ', '0');
INSERT INTO `provinces` VALUES ('830429', '和平区', '830400', '', '0', '0', 'H', '117.2214669949', '39.12339025328', '3', 'tr_0 tr_830000 tr_830400 ', '0');
INSERT INTO `provinces` VALUES ('830500', '台南市', '830000', '', '0', '0', 'T', '121.97387097872', '24.086956718805', '2', 'tr_0 tr_830000 ', '0');
INSERT INTO `provinces` VALUES ('830501', '中西区', '830500', '', '0', '0', 'Z', '114.15949141031', '22.291342714292', '3', 'tr_0 tr_830000 tr_830500 ', '0');
INSERT INTO `provinces` VALUES ('830502', '东区', '830500', '', '0', '0', 'D', '121.36052796411', '38.965848756262', '3', 'tr_0 tr_830000 tr_830500 ', '0');
INSERT INTO `provinces` VALUES ('830503', '南区', '830500', '', '0', '0', 'N', '121.36052796411', '38.965848756262', '3', 'tr_0 tr_830000 tr_830500 ', '0');
INSERT INTO `provinces` VALUES ('830504', '北区', '830500', '', '0', '0', 'B', '121.36052796411', '38.965848756262', '3', 'tr_0 tr_830000 tr_830500 ', '0');
INSERT INTO `provinces` VALUES ('830505', '安平区', '830500', '', '0', '0', 'A', '121.36052796411', '38.965848756262', '3', 'tr_0 tr_830000 tr_830500 ', '0');
INSERT INTO `provinces` VALUES ('830506', '安南区', '830500', '', '0', '0', 'A', '121.36052796411', '38.965848756262', '3', 'tr_0 tr_830000 tr_830500 ', '0');
INSERT INTO `provinces` VALUES ('830507', '永康区', '830500', '', '0', '0', 'Y', '121.36052796411', '38.965848756262', '3', 'tr_0 tr_830000 tr_830500 ', '0');
INSERT INTO `provinces` VALUES ('830508', '归仁区', '830500', '', '0', '0', 'G', '121.36052796411', '38.965848756262', '3', 'tr_0 tr_830000 tr_830500 ', '0');
INSERT INTO `provinces` VALUES ('830509', '新化区', '830500', '', '0', '0', 'X', '121.36052796411', '38.965848756262', '3', 'tr_0 tr_830000 tr_830500 ', '0');
INSERT INTO `provinces` VALUES ('830510', '左镇区', '830500', '', '0', '0', 'Z', '121.36052796411', '38.965848756262', '3', 'tr_0 tr_830000 tr_830500 ', '0');
INSERT INTO `provinces` VALUES ('830511', '玉井区', '830500', '', '0', '0', 'Y', '121.36052796411', '38.965848756262', '3', 'tr_0 tr_830000 tr_830500 ', '0');
INSERT INTO `provinces` VALUES ('830512', '楠西区', '830500', '', '0', '0', 'N', '121.36052796411', '38.965848756262', '3', 'tr_0 tr_830000 tr_830500 ', '0');
INSERT INTO `provinces` VALUES ('830513', '南化区', '830500', '', '0', '0', 'N', '121.36052796411', '38.965848756262', '3', 'tr_0 tr_830000 tr_830500 ', '0');
INSERT INTO `provinces` VALUES ('830514', '仁德区', '830500', '', '0', '0', 'R', '121.36052796411', '38.965848756262', '3', 'tr_0 tr_830000 tr_830500 ', '0');
INSERT INTO `provinces` VALUES ('830515', '关庙区', '830500', '', '0', '0', 'G', '121.36052796411', '38.965848756262', '3', 'tr_0 tr_830000 tr_830500 ', '0');
INSERT INTO `provinces` VALUES ('830516', '龙崎区', '830500', '', '0', '0', 'L', '121.36052796411', '38.965848756262', '3', 'tr_0 tr_830000 tr_830500 ', '0');
INSERT INTO `provinces` VALUES ('830517', '官田区', '830500', '', '0', '0', 'G', '121.36052796411', '38.965848756262', '3', 'tr_0 tr_830000 tr_830500 ', '0');
INSERT INTO `provinces` VALUES ('830518', '麻豆区', '830500', '', '0', '0', 'M', '121.36052796411', '38.965848756262', '3', 'tr_0 tr_830000 tr_830500 ', '0');
INSERT INTO `provinces` VALUES ('830519', '佳里区', '830500', '', '0', '0', 'J', '121.36052796411', '38.965848756262', '3', 'tr_0 tr_830000 tr_830500 ', '0');
INSERT INTO `provinces` VALUES ('830520', '西港区', '830500', '', '0', '0', 'X', '121.36052796411', '38.965848756262', '3', 'tr_0 tr_830000 tr_830500 ', '0');
INSERT INTO `provinces` VALUES ('830521', '七股区', '830500', '', '0', '0', 'Q', '121.36052796411', '38.965848756262', '3', 'tr_0 tr_830000 tr_830500 ', '0');
INSERT INTO `provinces` VALUES ('830522', '将军区', '830500', '', '0', '0', 'J', '121.36052796411', '38.965848756262', '3', 'tr_0 tr_830000 tr_830500 ', '0');
INSERT INTO `provinces` VALUES ('830523', '学甲区', '830500', '', '0', '0', 'X', '121.36052796411', '38.965848756262', '3', 'tr_0 tr_830000 tr_830500 ', '0');
INSERT INTO `provinces` VALUES ('830524', '北门区', '830500', '', '0', '0', 'B', '121.36052796411', '38.965848756262', '3', 'tr_0 tr_830000 tr_830500 ', '0');
INSERT INTO `provinces` VALUES ('830525', '新营区', '830500', '', '0', '0', 'X', '121.36052796411', '38.965848756262', '3', 'tr_0 tr_830000 tr_830500 ', '0');
INSERT INTO `provinces` VALUES ('830526', '后壁区', '830500', '', '0', '0', 'H', '121.36052796411', '38.965848756262', '3', 'tr_0 tr_830000 tr_830500 ', '0');
INSERT INTO `provinces` VALUES ('830527', '白河区', '830500', '', '0', '0', 'B', '121.36052796411', '38.965848756262', '3', 'tr_0 tr_830000 tr_830500 ', '0');
INSERT INTO `provinces` VALUES ('830528', '东山区', '830500', '', '0', '0', 'D', '130.32336109407', '47.344987135573', '3', 'tr_0 tr_830000 tr_830500 ', '0');
INSERT INTO `provinces` VALUES ('830529', '六甲区', '830500', '', '0', '0', 'L', '121.36052796411', '38.965848756262', '3', 'tr_0 tr_830000 tr_830500 ', '0');
INSERT INTO `provinces` VALUES ('830530', '下营区', '830500', '', '0', '0', 'X', '121.36052796411', '38.965848756262', '3', 'tr_0 tr_830000 tr_830500 ', '0');
INSERT INTO `provinces` VALUES ('830531', '柳营区', '830500', '', '0', '0', 'L', '121.36052796411', '38.965848756262', '3', 'tr_0 tr_830000 tr_830500 ', '0');
INSERT INTO `provinces` VALUES ('830532', '盐水区', '830500', '', '0', '0', 'Y', '121.36052796411', '38.965848756262', '3', 'tr_0 tr_830000 tr_830500 ', '0');
INSERT INTO `provinces` VALUES ('830533', '善化区', '830500', '', '0', '0', 'S', '121.36052796411', '38.965848756262', '3', 'tr_0 tr_830000 tr_830500 ', '0');
INSERT INTO `provinces` VALUES ('830534', '大内区', '830500', '', '0', '0', 'D', '121.36052796411', '38.965848756262', '3', 'tr_0 tr_830000 tr_830500 ', '0');
INSERT INTO `provinces` VALUES ('830535', '山上区', '830500', '', '0', '0', 'S', '121.36052796411', '38.965848756262', '3', 'tr_0 tr_830000 tr_830500 ', '0');
INSERT INTO `provinces` VALUES ('830536', '新市区', '830500', '', '0', '0', 'X', '115.41224520287', '38.88118294749', '3', 'tr_0 tr_830000 tr_830500 ', '0');
INSERT INTO `provinces` VALUES ('830537', '安定区', '830500', '', '0', '0', 'A', '104.61650040265', '35.585600016725', '3', 'tr_0 tr_830000 tr_830500 ', '0');
INSERT INTO `provinces` VALUES ('830600', '高雄市', '830000', '', '0', '0', 'G', '121.97387097872', '24.086956718805', '2', 'tr_0 tr_830000 ', '0');
INSERT INTO `provinces` VALUES ('830601', '楠梓区', '830600', '', '0', '0', 'N', '114.29349244944', '30.607022895804', '3', 'tr_0 tr_830000 tr_830600 ', '0');
INSERT INTO `provinces` VALUES ('830602', '左营区', '830600', '', '0', '0', 'Z', '114.29349244944', '30.607022895804', '3', 'tr_0 tr_830000 tr_830600 ', '0');
INSERT INTO `provinces` VALUES ('830603', '鼓山区', '830600', '', '0', '0', 'G', '114.29349244944', '30.607022895804', '3', 'tr_0 tr_830000 tr_830600 ', '0');
INSERT INTO `provinces` VALUES ('830604', '三民区', '830600', '', '0', '0', 'S', '114.29349244944', '30.607022895804', '3', 'tr_0 tr_830000 tr_830600 ', '0');
INSERT INTO `provinces` VALUES ('830605', '盐埕区', '830600', '', '0', '0', 'Y', '114.29349244944', '30.607022895804', '3', 'tr_0 tr_830000 tr_830600 ', '0');
INSERT INTO `provinces` VALUES ('830606', '前金区', '830600', '', '0', '0', 'Q', '114.29349244944', '30.607022895804', '3', 'tr_0 tr_830000 tr_830600 ', '0');
INSERT INTO `provinces` VALUES ('830607', '新兴区', '830600', '', '0', '0', 'X', '130.93837086995', '45.822310328543', '3', 'tr_0 tr_830000 tr_830600 ', '0');
INSERT INTO `provinces` VALUES ('830608', '苓雅区', '830600', '', '0', '0', 'L', '114.29349244944', '30.607022895804', '3', 'tr_0 tr_830000 tr_830600 ', '0');
INSERT INTO `provinces` VALUES ('830609', '前镇区', '830600', '', '0', '0', 'Q', '114.29349244944', '30.607022895804', '3', 'tr_0 tr_830000 tr_830600 ', '0');
INSERT INTO `provinces` VALUES ('830610', '旗津区', '830600', '', '0', '0', 'Q', '114.29349244944', '30.607022895804', '3', 'tr_0 tr_830000 tr_830600 ', '0');
INSERT INTO `provinces` VALUES ('830611', '小港区', '830600', '', '0', '0', 'X', '114.29349244944', '30.607022895804', '3', 'tr_0 tr_830000 tr_830600 ', '0');
INSERT INTO `provinces` VALUES ('830612', '凤山区', '830600', '', '0', '0', 'F', '114.29349244944', '30.607022895804', '3', 'tr_0 tr_830000 tr_830600 ', '0');
INSERT INTO `provinces` VALUES ('830613', '大寮区', '830600', '', '0', '0', 'D', '114.29349244944', '30.607022895804', '3', 'tr_0 tr_830000 tr_830600 ', '0');
INSERT INTO `provinces` VALUES ('830614', '鸟松区', '830600', '', '0', '0', 'N', '114.29349244944', '30.607022895804', '3', 'tr_0 tr_830000 tr_830600 ', '0');
INSERT INTO `provinces` VALUES ('830615', '林园区', '830600', '', '0', '0', 'L', '114.29349244944', '30.607022895804', '3', 'tr_0 tr_830000 tr_830600 ', '0');
INSERT INTO `provinces` VALUES ('830616', '仁武区', '830600', '', '0', '0', 'R', '114.29349244944', '30.607022895804', '3', 'tr_0 tr_830000 tr_830600 ', '0');
INSERT INTO `provinces` VALUES ('830617', '大树区', '830600', '', '0', '0', 'D', '114.29349244944', '30.607022895804', '3', 'tr_0 tr_830000 tr_830600 ', '0');
INSERT INTO `provinces` VALUES ('830618', '大社区', '830600', '', '0', '0', 'D', '114.29349244944', '30.607022895804', '3', 'tr_0 tr_830000 tr_830600 ', '0');
INSERT INTO `provinces` VALUES ('830619', '冈山区', '830600', '', '0', '0', 'G', '114.29349244944', '30.607022895804', '3', 'tr_0 tr_830000 tr_830600 ', '0');
INSERT INTO `provinces` VALUES ('830620', '路竹区', '830600', '', '0', '0', 'L', '114.29349244944', '30.607022895804', '3', 'tr_0 tr_830000 tr_830600 ', '0');
INSERT INTO `provinces` VALUES ('830621', '桥头区', '830600', '', '0', '0', 'Q', '114.29349244944', '30.607022895804', '3', 'tr_0 tr_830000 tr_830600 ', '0');
INSERT INTO `provinces` VALUES ('830622', '梓官区', '830600', '', '0', '0', 'Z', '114.29349244944', '30.607022895804', '3', 'tr_0 tr_830000 tr_830600 ', '0');
INSERT INTO `provinces` VALUES ('830623', '弥陀区', '830600', '', '0', '0', 'M', '114.29349244944', '30.607022895804', '3', 'tr_0 tr_830000 tr_830600 ', '0');
INSERT INTO `provinces` VALUES ('830624', '永安区', '830600', '', '0', '0', 'Y', '114.29349244944', '30.607022895804', '3', 'tr_0 tr_830000 tr_830600 ', '0');
INSERT INTO `provinces` VALUES ('830625', '燕巢区', '830600', '', '0', '0', 'Y', '114.29349244944', '30.607022895804', '3', 'tr_0 tr_830000 tr_830600 ', '0');
INSERT INTO `provinces` VALUES ('830626', '阿莲区', '830600', '', '0', '0', 'A', '114.29349244944', '30.607022895804', '3', 'tr_0 tr_830000 tr_830600 ', '0');
INSERT INTO `provinces` VALUES ('830627', '茄萣区', '830600', '', '0', '0', 'J', '114.29349244944', '30.607022895804', '3', 'tr_0 tr_830000 tr_830600 ', '0');
INSERT INTO `provinces` VALUES ('830628', '湖内区', '830600', '', '0', '0', 'H', '114.29349244944', '30.607022895804', '3', 'tr_0 tr_830000 tr_830600 ', '0');
INSERT INTO `provinces` VALUES ('830629', '旗山区', '830600', '', '0', '0', 'Q', '114.29349244944', '30.607022895804', '3', 'tr_0 tr_830000 tr_830600 ', '0');
INSERT INTO `provinces` VALUES ('830630', '美浓区', '830600', '', '0', '0', 'M', '114.29349244944', '30.607022895804', '3', 'tr_0 tr_830000 tr_830600 ', '0');
INSERT INTO `provinces` VALUES ('830631', '内门区', '830600', '', '0', '0', 'N', '114.29349244944', '30.607022895804', '3', 'tr_0 tr_830000 tr_830600 ', '0');
INSERT INTO `provinces` VALUES ('830632', '杉林区', '830600', '', '0', '0', 'S', '114.29349244944', '30.607022895804', '3', 'tr_0 tr_830000 tr_830600 ', '0');
INSERT INTO `provinces` VALUES ('830633', '甲仙区', '830600', '', '0', '0', 'J', '114.29349244944', '30.607022895804', '3', 'tr_0 tr_830000 tr_830600 ', '0');
INSERT INTO `provinces` VALUES ('830634', '六龟区', '830600', '', '0', '0', 'L', '114.29349244944', '30.607022895804', '3', 'tr_0 tr_830000 tr_830600 ', '0');
INSERT INTO `provinces` VALUES ('830635', '茂林区', '830600', '', '0', '0', 'M', '114.29349244944', '30.607022895804', '3', 'tr_0 tr_830000 tr_830600 ', '0');
INSERT INTO `provinces` VALUES ('830636', '桃源区', '830600', '', '0', '0', 'T', '114.29349244944', '30.607022895804', '3', 'tr_0 tr_830000 tr_830600 ', '0');
INSERT INTO `provinces` VALUES ('830637', '那玛夏区', '830600', '', '0', '0', 'N', '120.71415692906', '23.273513646073', '3', 'tr_0 tr_830000 tr_830600 ', '0');
INSERT INTO `provinces` VALUES ('830700', '基隆市', '830000', '', '0', '0', 'J', '121.97387097872', '24.086956718805', '2', 'tr_0 tr_830000 ', '0');
INSERT INTO `provinces` VALUES ('830701', '中正区', '830700', '', '0', '0', 'Z', '118.53225032938', '24.6210238893', '3', 'tr_0 tr_830000 tr_830700 ', '0');
INSERT INTO `provinces` VALUES ('830702', '七堵区', '830700', '', '0', '0', 'Q', '118.53225032938', '24.6210238893', '3', 'tr_0 tr_830000 tr_830700 ', '0');
INSERT INTO `provinces` VALUES ('830703', '暖暖区', '830700', '', '0', '0', 'N', '118.53225032938', '24.6210238893', '3', 'tr_0 tr_830000 tr_830700 ', '0');
INSERT INTO `provinces` VALUES ('830704', '仁爱区', '830700', '', '0', '0', 'R', '118.53225032938', '24.6210238893', '3', 'tr_0 tr_830000 tr_830700 ', '0');
INSERT INTO `provinces` VALUES ('830705', '中山区', '830700', '', '0', '0', 'Z', '121.65154739367', '38.924511115496', '3', 'tr_0 tr_830000 tr_830700 ', '0');
INSERT INTO `provinces` VALUES ('830706', '安乐区', '830700', '', '0', '0', 'A', '118.53225032938', '24.6210238893', '3', 'tr_0 tr_830000 tr_830700 ', '0');
INSERT INTO `provinces` VALUES ('830707', '信义区', '830700', '', '0', '0', 'X', '118.53225032938', '24.6210238893', '3', 'tr_0 tr_830000 tr_830700 ', '0');
INSERT INTO `provinces` VALUES ('830800', '新竹市', '830000', '', '0', '0', 'X', '121.97387097872', '24.086956718805', '2', 'tr_0 tr_830000 ', '0');
INSERT INTO `provinces` VALUES ('830801', '东区', '830800', '', '0', '0', 'D', '119.76701381388', '49.221741849328', '3', 'tr_0 tr_830000 tr_830800 ', '0');
INSERT INTO `provinces` VALUES ('830802', '北区', '830800', '', '0', '0', 'B', '119.76701381388', '49.221741849328', '3', 'tr_0 tr_830000 tr_830800 ', '0');
INSERT INTO `provinces` VALUES ('830803', '香山区', '830800', '', '0', '0', 'X', '119.76701381388', '49.221741849328', '3', 'tr_0 tr_830000 tr_830800 ', '0');
INSERT INTO `provinces` VALUES ('830900', '嘉义市', '830000', '', '0', '0', 'J', '121.97387097872', '24.086956718805', '2', 'tr_0 tr_830000 ', '0');
INSERT INTO `provinces` VALUES ('830901', '东区', '830900', '', '0', '0', 'D', '114.2466374103', '22.728825804821', '3', 'tr_0 tr_830000 tr_830900 ', '0');
INSERT INTO `provinces` VALUES ('830902', '西区', '830900', '', '0', '0', 'X', '114.2466374103', '22.728825804821', '3', 'tr_0 tr_830000 tr_830900 ', '0');
INSERT INTO `provinces` VALUES ('839001', '宜兰县', '839000', '', '0', '0', 'Y', '121.39369436652', '31.211883015985', '3', 'tr_0 tr_830000 tr_839000 ', '0');
INSERT INTO `provinces` VALUES ('839002', '新竹县', '839000', '', '0', '0', 'X', '119.76701381388', '49.221741849328', '3', 'tr_0 tr_830000 tr_839000 ', '0');
INSERT INTO `provinces` VALUES ('839003', '苗栗县', '839000', '', '0', '0', 'M', '', '', '3', 'tr_0 tr_830000 tr_839000 ', '0');
INSERT INTO `provinces` VALUES ('839004', '彰化县', '839000', '', '0', '0', 'Z', '109.04292985822', '26.632603089128', '3', 'tr_0 tr_830000 tr_839000 ', '0');
INSERT INTO `provinces` VALUES ('839005', '南投县', '839000', '', '0', '0', 'N', '', '', '3', 'tr_0 tr_830000 tr_839000 ', '0');
INSERT INTO `provinces` VALUES ('839006', '嘉义县', '839000', '', '0', '0', 'J', '114.2466374103', '22.728825804821', '3', 'tr_0 tr_830000 tr_839000 ', '0');
INSERT INTO `provinces` VALUES ('839007', '云林县', '839000', '', '0', '0', 'Y', '124.7995182988', '42.918396678776', '3', 'tr_0 tr_830000 tr_839000 ', '0');
INSERT INTO `provinces` VALUES ('839008', '屏东县', '839000', '', '0', '0', 'P', '119.30846756124', '26.107056743573', '3', 'tr_0 tr_830000 tr_839000 ', '0');
INSERT INTO `provinces` VALUES ('839009', '台东县', '839000', '', '0', '0', 'T', '119.33983605008', '26.095631255982', '3', 'tr_0 tr_830000 tr_839000 ', '0');
INSERT INTO `provinces` VALUES ('839010', '花莲县', '839000', '', '0', '0', 'H', '120.16162991211', '33.366606824641', '3', 'tr_0 tr_830000 tr_839000 ', '0');
INSERT INTO `provinces` VALUES ('839011', '澎湖县', '839000', '', '0', '0', 'P', '121.13156576447', '30.875327117717', '3', 'tr_0 tr_830000 tr_839000 ', '0');
INSERT INTO `provinces` VALUES ('839012', '金门县', '839000', '', '0', '0', 'J', '118.3304151596', '24.440444541055', '3', 'tr_0 tr_830000 tr_839000 ', '0');
INSERT INTO `provinces` VALUES ('839013', '连江县', '839000', '', '0', '0', 'L', '119.54647881621', '26.203583291029', '3', 'tr_0 tr_830000 tr_839000 ', '0');
INSERT INTO `provinces` VALUES ('110000', '北京市', '0', '', '0', '0', 'B', '116.41338369712', '39.9109245473', '1', 'tr_0 ', '0');
INSERT INTO `provinces` VALUES ('120000', '天津市', '0', '', '0', '0', 'T', '117.21081309155', '39.14392990331', '1', 'tr_0 ', '0');
INSERT INTO `provinces` VALUES ('130000', '河北省', '0', '', '0', '0', 'H', '114.53659630532', '38.0432016452', '1', 'tr_0 ', '0');
INSERT INTO `provinces` VALUES ('140000', '山西省', '0', '', '0', '0', 'S', '112.56937550968', '37.879829423856', '1', 'tr_0 ', '0');
INSERT INTO `provinces` VALUES ('150000', '内蒙古自治区', '0', '', '0', '0', 'N', '111.77260583082', '40.823156232446', '1', 'tr_0 ', '0');
INSERT INTO `provinces` VALUES ('210000', '辽宁省', '0', '', '0', '0', 'L', '123.43559785683', '41.841465251202', '1', 'tr_0 ', '0');
INSERT INTO `provinces` VALUES ('220000', '吉林省', '0', '', '0', '0', 'J', '125.33257987515', '43.901714435444', '1', 'tr_0 ', '0');
INSERT INTO `provinces` VALUES ('230000', '黑龙江省', '0', '', '0', '0', 'H', '126.66965282042', '45.747929837435', '1', 'tr_0 ', '0');
INSERT INTO `provinces` VALUES ('310000', '上海市', '0', '', '0', '0', 'S', '121.48053886018', '31.235929042252', '1', 'tr_0 ', '0');
INSERT INTO `provinces` VALUES ('320000', '江苏省', '0', '', '0', '0', 'J', '118.76955164467', '32.066776944293', '1', 'tr_0 ', '0');
INSERT INTO `provinces` VALUES ('330000', '浙江省', '0', '', '0', '0', 'Z', '120.15953308739', '30.271548393337', '1', 'tr_0 ', '0');
INSERT INTO `provinces` VALUES ('340000', '安徽省', '0', '', '0', '0', 'A', '117.33054041772', '31.734294156317', '1', 'tr_0 ', '0');
INSERT INTO `provinces` VALUES ('350000', '福建省', '0', '', '0', '0', 'F', '119.30244747704', '26.106339415901', '1', 'tr_0 ', '0');
INSERT INTO `provinces` VALUES ('360000', '江西省', '0', '', '0', '0', 'J', '115.91542320365', '28.681690516761', '1', 'tr_0 ', '0');
INSERT INTO `provinces` VALUES ('370000', '山东省', '0', '', '0', '0', 'S', '117.02744162848', '36.674856650405', '1', 'tr_0 ', '0');
INSERT INTO `provinces` VALUES ('410000', '河南省', '0', '', '0', '0', 'H', '113.75938408486', '34.771712921931', '1', 'tr_0 ', '0');
INSERT INTO `provinces` VALUES ('420000', '湖北省', '0', '', '0', '0', 'H', '114.34844073659', '30.551600064658', '1', 'tr_0 ', '0');
INSERT INTO `provinces` VALUES ('430000', '湖南省', '0', '', '0', '0', 'H', '112.98960254335', '28.118269998009', '1', 'tr_0 ', '0');
INSERT INTO `provinces` VALUES ('440000', '广东省', '0', '', '0', '0', 'G', '113.27242891273', '23.137948556539', '1', 'tr_0 ', '0');
INSERT INTO `provinces` VALUES ('450000', '广西壮族自治区', '0', '', '0', '0', 'G', '108.33452122944', '22.821268997909', '1', 'tr_0 ', '0');
INSERT INTO `provinces` VALUES ('460000', '海南省', '0', '', '0', '0', 'H', '110.35553651088', '20.025801964463', '1', 'tr_0 ', '0');
INSERT INTO `provinces` VALUES ('500000', '重庆市', '0', '', '0', '0', 'Z', '106.55843415538', '29.568996245339', '1', 'tr_0 ', '0');
INSERT INTO `provinces` VALUES ('510000', '四川省', '0', '', '0', '0', 'S', '104.07346654728', '30.577543147015', '1', 'tr_0 ', '0');
INSERT INTO `provinces` VALUES ('520000', '贵州省', '0', '', '0', '0', 'G', '106.71447593089', '26.604029544995', '1', 'tr_0 ', '0');
INSERT INTO `provinces` VALUES ('530000', '云南省', '0', '', '0', '0', 'Y', '102.71641607523', '25.051562267345', '1', 'tr_0 ', '0');
INSERT INTO `provinces` VALUES ('540000', '西藏自治区', '0', '', '0', '0', 'X', '91.124342128993', '29.652893647473', '1', 'tr_0 ', '0');
INSERT INTO `provinces` VALUES ('610000', '陕西省', '0', '', '0', '0', 'S', '108.96039314875', '34.275808006024', '1', 'tr_0 ', '0');
INSERT INTO `provinces` VALUES ('620000', '甘肃省', '0', '', '0', '0', 'G', '103.83247812812', '36.065464887368', '1', 'tr_0 ', '0');
INSERT INTO `provinces` VALUES ('630000', '青海省', '0', '', '0', '0', 'Q', '101.78646183587', '36.627158579235', '1', 'tr_0 ', '0');
INSERT INTO `provinces` VALUES ('640000', '宁夏回族自治区', '0', '', '0', '0', 'N', '106.26560480701', '38.476877967911', '1', 'tr_0 ', '0');
INSERT INTO `provinces` VALUES ('650000', '新疆维吾尔自治区', '0', '', '0', '0', 'X', '87.633473205738', '43.79923810129', '1', 'tr_0 ', '0');
INSERT INTO `provinces` VALUES ('110100', '市辖区', '110000', '', '0', '0', 'S', '116.41338369712', '39.9109245473', '2', 'tr_0 tr_110000 ', '0');
INSERT INTO `provinces` VALUES ('120100', '市辖区', '120000', '', '0', '0', 'S', '117.21081309155', '39.14392990331', '2', 'tr_0 tr_120000 ', '0');
INSERT INTO `provinces` VALUES ('140100', '太原市', '140000', '', '0', '0', 'T', '112.55639149167', '37.876989028848', '2', 'tr_0 tr_140000 ', '0');
INSERT INTO `provinces` VALUES ('140200', '大同市', '140000', '', '0', '0', 'D', '113.30643625859', '40.082468716161', '2', 'tr_0 tr_140000 ', '0');
INSERT INTO `provinces` VALUES ('140300', '阳泉市', '140000', '', '0', '0', 'Y', '113.58761666288', '37.862360847859', '2', 'tr_0 tr_140000 ', '0');
INSERT INTO `provinces` VALUES ('140400', '长治市', '140000', '', '0', '0', 'Z', '113.12255886985', '36.201268372155', '2', 'tr_0 tr_140000 ', '0');
INSERT INTO `provinces` VALUES ('140500', '晋城市', '140000', '', '0', '0', 'J', '112.85857823133', '35.496284586473', '2', 'tr_0 tr_140000 ', '0');
INSERT INTO `provinces` VALUES ('140600', '朔州市', '140000', '', '0', '0', 'S', '112.43937093967', '39.337108370542', '2', 'tr_0 tr_140000 ', '0');
INSERT INTO `provinces` VALUES ('140700', '晋中市', '140000', '', '0', '0', 'J', '112.75959475566', '37.69283940976', '2', 'tr_0 tr_140000 ', '0');
INSERT INTO `provinces` VALUES ('140800', '运城市', '140000', '', '0', '0', 'Y', '111.01338945448', '35.032706912909', '2', 'tr_0 tr_140000 ', '0');
INSERT INTO `provinces` VALUES ('140900', '忻州市', '140000', '', '0', '0', 'X', '112.74062416024', '38.422383385178', '2', 'tr_0 tr_140000 ', '0');
INSERT INTO `provinces` VALUES ('141000', '临汾市', '140000', '', '0', '0', 'L', '111.52553022403', '36.09374189542', '2', 'tr_0 tr_140000 ', '0');
INSERT INTO `provinces` VALUES ('141100', '吕梁市', '140000', '', '0', '0', 'L', '111.15044967529', '37.524497749577', '2', 'tr_0 tr_140000 ', '0');
INSERT INTO `provinces` VALUES ('150100', '呼和浩特市', '150000', '', '0', '0', 'H', '111.75550856171', '40.848422997113', '2', 'tr_0 tr_150000 ', '0');
INSERT INTO `provinces` VALUES ('150200', '包头市', '150000', '', '0', '0', 'B', '109.84654350721', '40.662928788261', '2', 'tr_0 tr_150000 ', '0');
INSERT INTO `provinces` VALUES ('150300', '乌海市', '150000', '', '0', '0', 'W', '106.80039105', '39.662006364891', '2', 'tr_0 tr_150000 ', '0');
INSERT INTO `provinces` VALUES ('150400', '赤峰市', '150000', '', '0', '0', 'C', '118.89552039752', '42.261686103412', '2', 'tr_0 tr_150000 ', '0');
INSERT INTO `provinces` VALUES ('150500', '通辽市', '150000', '', '0', '0', 'T', '122.25052178738', '43.657980083917', '2', 'tr_0 tr_150000 ', '0');
INSERT INTO `provinces` VALUES ('150600', '鄂尔多斯市', '150000', '', '0', '0', 'E', '109.78744317924', '39.614482313949', '2', 'tr_0 tr_150000 ', '0');
INSERT INTO `provinces` VALUES ('150700', '呼伦贝尔市', '150000', '', '0', '0', 'H', '119.77237049947', '49.218446475565', '2', 'tr_0 tr_150000 ', '0');
INSERT INTO `provinces` VALUES ('150800', '巴彦淖尔市', '150000', '', '0', '0', 'B', '107.39439808372', '40.749359489573', '2', 'tr_0 tr_150000 ', '0');
INSERT INTO `provinces` VALUES ('150900', '乌兰察布市', '150000', '', '0', '0', 'W', '113.13946767446', '41.000748327674', '2', 'tr_0 tr_150000 ', '0');
INSERT INTO `provinces` VALUES ('152200', '兴安盟', '150000', '', '0', '0', 'X', '122.04436452583', '46.088463713219', '2', 'tr_0 tr_150000 ', '0');
INSERT INTO `provinces` VALUES ('152500', '锡林郭勒盟', '150000', '', '0', '0', 'X', '116.05439144075', '43.939422665339', '2', 'tr_0 tr_150000 ', '0');
INSERT INTO `provinces` VALUES ('152900', '阿拉善盟', '150000', '', '0', '0', 'A', '105.73537746449', '38.858275883057', '2', 'tr_0 tr_150000 ', '0');
INSERT INTO `provinces` VALUES ('210100', '沈阳市', '210000', '', '0', '0', 'S', '123.45598993089', '41.720915668889', '2', 'tr_0 tr_210000 ', '0');
INSERT INTO `provinces` VALUES ('210200', '大连市', '210000', '', '0', '0', 'D', '121.62163148459', '38.918953666786', '2', 'tr_0 tr_210000 ', '0');
INSERT INTO `provinces` VALUES ('210300', '鞍山市', '210000', '', '0', '0', 'A', '123.00137251399', '41.115053596949', '2', 'tr_0 tr_210000 ', '0');
INSERT INTO `provinces` VALUES ('210400', '抚顺市', '210000', '', '0', '0', 'F', '123.96437461561', '41.885969593057', '2', 'tr_0 tr_210000 ', '0');
INSERT INTO `provinces` VALUES ('210500', '本溪市', '210000', '', '0', '0', 'B', '123.69250712421', '41.492916460553', '2', 'tr_0 tr_210000 ', '0');
INSERT INTO `provinces` VALUES ('210600', '丹东市', '210000', '', '0', '0', 'D', '124.36154728159', '40.006408705594', '2', 'tr_0 tr_210000 ', '0');
INSERT INTO `provinces` VALUES ('210700', '锦州市', '210000', '', '0', '0', 'J', '121.13259630056', '41.100931499462', '2', 'tr_0 tr_210000 ', '0');
INSERT INTO `provinces` VALUES ('210800', '营口市', '210000', '', '0', '0', 'Y', '122.2415746645', '40.673136838267', '2', 'tr_0 tr_210000 ', '0');
INSERT INTO `provinces` VALUES ('210900', '阜新市', '210000', '', '0', '0', 'F', '121.67640799866', '42.028021901318', '2', 'tr_0 tr_210000 ', '0');
INSERT INTO `provinces` VALUES ('211000', '辽阳市', '210000', '', '0', '0', 'L', '123.24336640651', '41.274161290454', '2', 'tr_0 tr_210000 ', '0');
INSERT INTO `provinces` VALUES ('211100', '盘锦市', '210000', '', '0', '0', 'P', '122.07322781023', '41.141248022956', '2', 'tr_0 tr_210000 ', '0');
INSERT INTO `provinces` VALUES ('211200', '铁岭市', '210000', '', '0', '0', 'T', '123.73236520918', '42.229947997184', '2', 'tr_0 tr_210000 ', '0');
INSERT INTO `provinces` VALUES ('211300', '朝阳市', '210000', '', '0', '0', 'C', '120.45749949793', '41.579820864756', '2', 'tr_0 tr_210000 ', '0');
INSERT INTO `provinces` VALUES ('211400', '葫芦岛市', '210000', '', '0', '0', 'H', '120.84339833993', '40.717364436362', '2', 'tr_0 tr_210000 ', '0');
INSERT INTO `provinces` VALUES ('220100', '长春市', '220000', '', '0', '0', 'Z', '125.33060207591', '43.821953501043', '2', 'tr_0 tr_220000 ', '0');
INSERT INTO `provinces` VALUES ('220200', '吉林市', '220000', '', '0', '0', 'J', '126.55563450495', '43.843567834579', '2', 'tr_0 tr_220000 ', '0');
INSERT INTO `provinces` VALUES ('220300', '四平市', '220000', '', '0', '0', 'S', '124.35648155716', '43.171993571561', '2', 'tr_0 tr_220000 ', '0');
INSERT INTO `provinces` VALUES ('220400', '辽源市', '220000', '', '0', '0', 'L', '125.15042516689', '42.894055005746', '2', 'tr_0 tr_220000 ', '0');
INSERT INTO `provinces` VALUES ('220500', '通化市', '220000', '', '0', '0', 'T', '125.94660627598', '41.733815801613', '2', 'tr_0 tr_220000 ', '0');
INSERT INTO `provinces` VALUES ('220600', '白山市', '220000', '', '0', '0', 'B', '126.42963008938', '41.939627205329', '2', 'tr_0 tr_220000 ', '0');
INSERT INTO `provinces` VALUES ('220700', '松原市', '220000', '', '0', '0', 'S', '124.83148187569', '45.147404193414', '2', 'tr_0 tr_220000 ', '0');
INSERT INTO `provinces` VALUES ('220800', '白城市', '220000', '', '0', '0', 'B', '122.8455906085', '45.625504359996', '2', 'tr_0 tr_220000 ', '0');
INSERT INTO `provinces` VALUES ('222400', '延边朝鲜族自治州', '220000', '', '0', '0', 'Y', '129.47737632023', '42.915743033722', '2', 'tr_0 tr_220000 ', '0');
INSERT INTO `provinces` VALUES ('230100', '哈尔滨市', '230000', '', '0', '0', 'H', '126.54161509032', '45.808825827952', '2', 'tr_0 tr_230000 ', '0');
INSERT INTO `provinces` VALUES ('230200', '齐齐哈尔市', '230000', '', '0', '0', 'Q', '123.92457086842', '47.359977186015', '2', 'tr_0 tr_230000 ', '0');
INSERT INTO `provinces` VALUES ('230300', '鸡西市', '230000', '', '0', '0', 'J', '130.97561865877', '45.300872317824', '2', 'tr_0 tr_230000 ', '0');
INSERT INTO `provinces` VALUES ('230400', '鹤岗市', '230000', '', '0', '0', 'H', '130.30443289867', '47.356056157685', '2', 'tr_0 tr_230000 ', '0');
INSERT INTO `provinces` VALUES ('230500', '双鸭山市', '230000', '', '0', '0', 'S', '131.16534168078', '46.653185895886', '2', 'tr_0 tr_230000 ', '0');
INSERT INTO `provinces` VALUES ('230600', '大庆市', '230000', '', '0', '0', 'D', '125.10865763402', '46.593633176722', '2', 'tr_0 tr_230000 ', '0');
INSERT INTO `provinces` VALUES ('230700', '伊春市', '230000', '', '0', '0', 'Y', '128.8475463802', '47.733318457231', '2', 'tr_0 tr_230000 ', '0');
INSERT INTO `provinces` VALUES ('230800', '佳木斯市', '230000', '', '0', '0', 'J', '130.32735909257', '46.805689990858', '2', 'tr_0 tr_230000 ', '0');
INSERT INTO `provinces` VALUES ('230900', '七台河市', '230000', '', '0', '0', 'Q', '131.01154459103', '45.776300321548', '2', 'tr_0 tr_230000 ', '0');
INSERT INTO `provinces` VALUES ('231000', '牡丹江市', '230000', '', '0', '0', 'M', '129.63953977835', '44.556245708986', '2', 'tr_0 tr_230000 ', '0');
INSERT INTO `provinces` VALUES ('231100', '黑河市', '230000', '', '0', '0', 'H', '127.53548988622', '50.25127231175', '2', 'tr_0 tr_230000 ', '0');
INSERT INTO `provinces` VALUES ('231200', '绥化市', '230000', '', '0', '0', 'S', '126.9753568753', '46.660032179824', '2', 'tr_0 tr_230000 ', '0');
INSERT INTO `provinces` VALUES ('232700', '大兴安岭地区', '230000', '', '0', '0', 'D', '124.15292785448', '50.420025955028', '2', 'tr_0 tr_230000 ', '0');
INSERT INTO `provinces` VALUES ('310100', '市辖区', '310000', '', '0', '0', 'S', '121.48053886018', '31.235929042252', '2', 'tr_0 tr_310000 ', '0');
INSERT INTO `provinces` VALUES ('320100', '南京市', '320000', '', '0', '0', 'N', '118.80242172125', '32.064652885618', '2', 'tr_0 tr_320000 ', '0');
INSERT INTO `provinces` VALUES ('320200', '无锡市', '320000', '', '0', '0', 'W', '120.31858328811', '31.498809732686', '2', 'tr_0 tr_320000 ', '0');
INSERT INTO `provinces` VALUES ('320300', '徐州市', '320000', '', '0', '0', 'X', '117.29057543439', '34.212666550113', '2', 'tr_0 tr_320000 ', '0');
INSERT INTO `provinces` VALUES ('320400', '常州市', '320000', '', '0', '0', 'C', '119.98148471328', '31.815795653328', '2', 'tr_0 tr_320000 ', '0');
INSERT INTO `provinces` VALUES ('320500', '苏州市', '320000', '', '0', '0', 'S', '120.59241222959', '31.303564074442', '2', 'tr_0 tr_320000 ', '0');
INSERT INTO `provinces` VALUES ('320600', '南通市', '320000', '', '0', '0', 'N', '120.90159173866', '31.986549431201', '2', 'tr_0 tr_320000 ', '0');
INSERT INTO `provinces` VALUES ('320700', '连云港市', '320000', '', '0', '0', 'L', '119.22862133317', '34.602249525267', '2', 'tr_0 tr_320000 ', '0');
INSERT INTO `provinces` VALUES ('320800', '淮安市', '320000', '', '0', '0', 'H', '119.02148367071', '33.616295301033', '2', 'tr_0 tr_320000 ', '0');
INSERT INTO `provinces` VALUES ('320900', '盐城市', '320000', '', '0', '0', 'Y', '120.16754426576', '33.355100917626', '2', 'tr_0 tr_320000 ', '0');
INSERT INTO `provinces` VALUES ('321000', '扬州市', '320000', '', '0', '0', 'Y', '119.41941890823', '32.40067693609', '2', 'tr_0 tr_320000 ', '0');
INSERT INTO `provinces` VALUES ('321100', '镇江市', '320000', '', '0', '0', 'Z', '119.43048944567', '32.194715920524', '2', 'tr_0 tr_320000 ', '0');
INSERT INTO `provinces` VALUES ('321200', '泰州市', '320000', '', '0', '0', 'T', '119.92956633785', '32.460675049308', '2', 'tr_0 tr_320000 ', '0');
INSERT INTO `provinces` VALUES ('321300', '宿迁市', '320000', '', '0', '0', 'S', '118.28157403571', '33.96774971569', '2', 'tr_0 tr_320000 ', '0');
INSERT INTO `provinces` VALUES ('330100', '杭州市', '330000', '', '0', '0', 'H', '120.21551180372', '30.253082981693', '2', 'tr_0 tr_330000 ', '0');
INSERT INTO `provinces` VALUES ('330200', '宁波市', '330000', '', '0', '0', 'N', '121.62857249434', '29.866033045866', '2', 'tr_0 tr_330000 ', '0');
INSERT INTO `provinces` VALUES ('330300', '温州市', '330000', '', '0', '0', 'W', '120.70647689036', '28.001085404472', '2', 'tr_0 tr_330000 ', '0');
INSERT INTO `provinces` VALUES ('330400', '嘉兴市', '330000', '', '0', '0', 'J', '120.76355182586', '30.75097483092', '2', 'tr_0 tr_330000 ', '0');
INSERT INTO `provinces` VALUES ('330500', '湖州市', '330000', '', '0', '0', 'H', '120.09451660916', '30.898963937294', '2', 'tr_0 tr_330000 ', '0');
INSERT INTO `provinces` VALUES ('330600', '绍兴市', '330000', '', '0', '0', 'S', '120.58547847885', '30.036369311307', '2', 'tr_0 tr_330000 ', '0');
INSERT INTO `provinces` VALUES ('330700', '金华市', '330000', '', '0', '0', 'J', '119.65343619053', '29.084639385514', '2', 'tr_0 tr_330000 ', '0');
INSERT INTO `provinces` VALUES ('330800', '衢州市', '330000', '', '0', '0', 'Q', '118.86659674036', '28.975545802265', '2', 'tr_0 tr_330000 ', '0');
INSERT INTO `provinces` VALUES ('330900', '舟山市', '330000', '', '0', '0', 'Z', '122.21355631852', '29.99091168016', '2', 'tr_0 tr_330000 ', '0');
INSERT INTO `provinces` VALUES ('331000', '台州市', '330000', '', '0', '0', 'T', '121.42743470428', '28.662194055996', '2', 'tr_0 tr_330000 ', '0');
INSERT INTO `provinces` VALUES ('331100', '丽水市', '330000', '', '0', '0', 'L', '119.92957305844', '28.473278180563', '2', 'tr_0 tr_330000 ', '0');
INSERT INTO `provinces` VALUES ('340100', '合肥市', '340000', '', '0', '0', 'H', '117.23344266498', '31.826577833687', '2', 'tr_0 tr_340000 ', '0');
INSERT INTO `provinces` VALUES ('340200', '芜湖市', '340000', '', '0', '0', 'W', '118.43943137654', '31.358536655799', '2', 'tr_0 tr_340000 ', '0');
INSERT INTO `provinces` VALUES ('340300', '蚌埠市', '340000', '', '0', '0', 'B', '117.39551332814', '32.921523704351', '2', 'tr_0 tr_340000 ', '0');
INSERT INTO `provinces` VALUES ('340400', '淮南市', '340000', '', '0', '0', 'H', '117.00638885072', '32.631847399053', '2', 'tr_0 tr_340000 ', '0');
INSERT INTO `provinces` VALUES ('340500', '马鞍山市', '340000', '', '0', '0', 'M', '118.51357957943', '31.676265597609', '2', 'tr_0 tr_340000 ', '0');
INSERT INTO `provinces` VALUES ('340600', '淮北市', '340000', '', '0', '0', 'H', '116.80453726703', '33.961656300276', '2', 'tr_0 tr_340000 ', '0');
INSERT INTO `provinces` VALUES ('340700', '铜陵市', '340000', '', '0', '0', 'T', '117.81847679446', '30.951233239913', '2', 'tr_0 tr_340000 ', '0');
INSERT INTO `provinces` VALUES ('340800', '安庆市', '340000', '', '0', '0', 'A', '117.06360390492', '30.530956568043', '2', 'tr_0 tr_340000 ', '0');
INSERT INTO `provinces` VALUES ('341000', '黄山市', '340000', '', '0', '0', 'H', '118.34543725315', '29.721889786592', '2', 'tr_0 tr_340000 ', '0');
INSERT INTO `provinces` VALUES ('341100', '滁州市', '340000', '', '0', '0', 'C', '118.33940613597', '32.261270872041', '2', 'tr_0 tr_340000 ', '0');
INSERT INTO `provinces` VALUES ('341200', '阜阳市', '340000', '', '0', '0', 'F', '115.82043612491', '32.896060994852', '2', 'tr_0 tr_340000 ', '0');
INSERT INTO `provinces` VALUES ('341300', '宿州市', '340000', '', '0', '0', 'S', '116.97054394561', '33.652095326452', '2', 'tr_0 tr_340000 ', '0');
INSERT INTO `provinces` VALUES ('341500', '六安市', '340000', '', '0', '0', 'L', '116.52640966419', '31.741450815323', '2', 'tr_0 tr_340000 ', '0');
INSERT INTO `provinces` VALUES ('341600', '亳州市', '340000', '', '0', '0', 'B', '115.78446321127', '33.850642695789', '2', 'tr_0 tr_340000 ', '0');
INSERT INTO `provinces` VALUES ('341700', '池州市', '340000', '', '0', '0', 'C', '117.4984209616', '30.670883790765', '2', 'tr_0 tr_340000 ', '0');
INSERT INTO `provinces` VALUES ('341800', '宣城市', '340000', '', '0', '0', 'X', '118.76553424277', '30.946601545293', '2', 'tr_0 tr_340000 ', '0');
INSERT INTO `provinces` VALUES ('350100', '福州市', '350000', '', '0', '0', 'F', '119.30346983854', '26.080429420698', '2', 'tr_0 tr_350000 ', '0');
INSERT INTO `provinces` VALUES ('350200', '厦门市', '350000', '', '0', '0', 'S', '118.09643549977', '24.485406605176', '2', 'tr_0 tr_350000 ', '0');
INSERT INTO `provinces` VALUES ('350300', '莆田市', '350000', '', '0', '0', 'P', '119.01452097813', '25.459865455923', '2', 'tr_0 tr_350000 ', '0');
INSERT INTO `provinces` VALUES ('350400', '三明市', '350000', '', '0', '0', 'S', '117.64552116782', '26.269736515992', '2', 'tr_0 tr_350000 ', '0');
INSERT INTO `provinces` VALUES ('350500', '泉州市', '350000', '', '0', '0', 'Q', '118.6824462668', '24.879952330498', '2', 'tr_0 tr_350000 ', '0');
INSERT INTO `provinces` VALUES ('350600', '漳州市', '350000', '', '0', '0', 'Z', '117.65357645299', '24.518929791171', '2', 'tr_0 tr_350000 ', '0');
INSERT INTO `provinces` VALUES ('350700', '南平市', '350000', '', '0', '0', 'N', '118.18436954814', '26.647772874203', '2', 'tr_0 tr_350000 ', '0');
INSERT INTO `provinces` VALUES ('350800', '龙岩市', '350000', '', '0', '0', 'L', '117.02344756678', '25.081219844872', '2', 'tr_0 tr_350000 ', '0');
INSERT INTO `provinces` VALUES ('350900', '宁德市', '350000', '', '0', '0', 'N', '119.55451074543', '26.672241711409', '2', 'tr_0 tr_350000 ', '0');
INSERT INTO `provinces` VALUES ('360100', '南昌市', '360000', '', '0', '0', 'N', '115.86458944232', '28.689455295061', '2', 'tr_0 tr_360000 ', '0');
INSERT INTO `provinces` VALUES ('360200', '景德镇市', '360000', '', '0', '0', 'J', '117.18457644639', '29.274247711041', '2', 'tr_0 tr_360000 ', '0');
INSERT INTO `provinces` VALUES ('360300', '萍乡市', '360000', '', '0', '0', 'P', '113.86149643375', '27.628392709397', '2', 'tr_0 tr_360000 ', '0');
INSERT INTO `provinces` VALUES ('360400', '九江市', '360000', '', '0', '0', 'J', '116.00753491163', '29.711340559079', '2', 'tr_0 tr_360000 ', '0');
INSERT INTO `provinces` VALUES ('360500', '新余市', '360000', '', '0', '0', 'X', '114.9235346514', '27.823578697789', '2', 'tr_0 tr_360000 ', '0');
INSERT INTO `provinces` VALUES ('360600', '鹰潭市', '360000', '', '0', '0', 'Y', '117.07557542703', '28.265787063191', '2', 'tr_0 tr_360000 ', '0');
INSERT INTO `provinces` VALUES ('360700', '赣州市', '360000', '', '0', '0', 'G', '114.94050337298', '25.835176103498', '2', 'tr_0 tr_360000 ', '0');
INSERT INTO `provinces` VALUES ('360800', '吉安市', '360000', '', '0', '0', 'J', '115.00051072001', '27.11972682607', '2', 'tr_0 tr_360000 ', '0');
INSERT INTO `provinces` VALUES ('360900', '宜春市', '360000', '', '0', '0', 'Y', '114.42356367591', '27.820856421848', '2', 'tr_0 tr_360000 ', '0');
INSERT INTO `provinces` VALUES ('361000', '抚州市', '360000', '', '0', '0', 'F', '116.36453876864', '27.95489225342', '2', 'tr_0 tr_360000 ', '0');
INSERT INTO `provinces` VALUES ('361100', '上饶市', '360000', '', '0', '0', 'S', '117.94945960312', '28.460625921852', '2', 'tr_0 tr_360000 ', '0');
INSERT INTO `provinces` VALUES ('370100', '济南市', '370000', '', '0', '0', 'J', '117.12639941261', '36.656554201787', '2', 'tr_0 tr_370000 ', '0');
INSERT INTO `provinces` VALUES ('370200', '青岛市', '370000', '', '0', '0', 'Q', '120.38945519115', '36.072227496663', '2', 'tr_0 tr_370000 ', '0');
INSERT INTO `provinces` VALUES ('370300', '淄博市', '370000', '', '0', '0', 'Z', '118.0614525349', '36.819085683322', '2', 'tr_0 tr_370000 ', '0');
INSERT INTO `provinces` VALUES ('370400', '枣庄市', '370000', '', '0', '0', 'Z', '117.33054194484', '34.815994048435', '2', 'tr_0 tr_370000 ', '0');
INSERT INTO `provinces` VALUES ('370500', '东营市', '370000', '', '0', '0', 'D', '118.68138493514', '37.439641826323', '2', 'tr_0 tr_370000 ', '0');
INSERT INTO `provinces` VALUES ('370600', '烟台市', '370000', '', '0', '0', 'Y', '121.4544154173', '37.470038383731', '2', 'tr_0 tr_370000 ', '0');
INSERT INTO `provinces` VALUES ('370700', '潍坊市', '370000', '', '0', '0', 'W', '119.16837791143', '36.712651551268', '2', 'tr_0 tr_370000 ', '0');
INSERT INTO `provinces` VALUES ('370800', '济宁市', '370000', '', '0', '0', 'J', '116.59361234854', '35.42017739453', '2', 'tr_0 tr_370000 ', '0');
INSERT INTO `provinces` VALUES ('370900', '泰安市', '370000', '', '0', '0', 'T', '117.0944948348', '36.205858044885', '2', 'tr_0 tr_370000 ', '0');
INSERT INTO `provinces` VALUES ('371000', '威海市', '370000', '', '0', '0', 'W', '122.12754097831', '37.516430548015', '2', 'tr_0 tr_370000 ', '0');
INSERT INTO `provinces` VALUES ('371100', '日照市', '370000', '', '0', '0', 'R', '119.53341540457', '35.422838998438', '2', 'tr_0 tr_370000 ', '0');
INSERT INTO `provinces` VALUES ('371200', '莱芜市', '370000', '', '0', '0', 'L', '117.68466691247', '36.233654133647', '2', 'tr_0 tr_370000 ', '0');
INSERT INTO `provinces` VALUES ('371300', '临沂市', '370000', '', '0', '0', 'L', '118.36353300501', '35.110671242365', '2', 'tr_0 tr_370000 ', '0');
INSERT INTO `provinces` VALUES ('371400', '德州市', '370000', '', '0', '0', 'D', '116.36555674397', '37.441308454576', '2', 'tr_0 tr_370000 ', '0');
INSERT INTO `provinces` VALUES ('371500', '聊城市', '370000', '', '0', '0', 'L', '115.9915878483', '36.462758187694', '2', 'tr_0 tr_370000 ', '0');
INSERT INTO `provinces` VALUES ('371600', '滨州市', '370000', '', '0', '0', 'B', '117.97740401715', '37.388196196077', '2', 'tr_0 tr_370000 ', '0');
INSERT INTO `provinces` VALUES ('371700', '菏泽市', '370000', '', '0', '0', 'H', '115.48754503343', '35.239407424766', '2', 'tr_0 tr_370000 ', '0');
INSERT INTO `provinces` VALUES ('410100', '郑州市', '410000', '', '0', '0', 'Z', '113.63141920734', '34.753438850454', '2', 'tr_0 tr_410000 ', '0');
INSERT INTO `provinces` VALUES ('410200', '开封市', '410000', '', '0', '0', 'K', '114.31459258497', '34.802885811212', '2', 'tr_0 tr_410000 ', '0');
INSERT INTO `provinces` VALUES ('410300', '洛阳市', '410000', '', '0', '0', 'L', '112.45942129831', '34.624262779219', '2', 'tr_0 tr_410000 ', '0');
INSERT INTO `provinces` VALUES ('410400', '平顶山市', '410000', '', '0', '0', 'P', '113.19952856052', '33.772050748691', '2', 'tr_0 tr_410000 ', '0');
INSERT INTO `provinces` VALUES ('410500', '安阳市', '410000', '', '0', '0', 'A', '114.39950042177', '36.105940984015', '2', 'tr_0 tr_410000 ', '0');
INSERT INTO `provinces` VALUES ('410600', '鹤壁市', '410000', '', '0', '0', 'H', '114.30359364248', '35.7523574114', '2', 'tr_0 tr_410000 ', '0');
INSERT INTO `provinces` VALUES ('410700', '新乡市', '410000', '', '0', '0', 'X', '113.93360046733', '35.309639930337', '2', 'tr_0 tr_410000 ', '0');
INSERT INTO `provinces` VALUES ('410800', '焦作市', '410000', '', '0', '0', 'J', '113.24854783457', '35.220963254039', '2', 'tr_0 tr_410000 ', '0');
INSERT INTO `provinces` VALUES ('410900', '濮阳市', '410000', '', '0', '0', 'P', '115.03559747034', '35.767593028906', '2', 'tr_0 tr_410000 ', '0');
INSERT INTO `provinces` VALUES ('411000', '许昌市', '410000', '', '0', '0', 'X', '113.85847553686', '34.041431611619', '2', 'tr_0 tr_410000 ', '0');
INSERT INTO `provinces` VALUES ('411100', '漯河市', '410000', '', '0', '0', 'L', '114.02342077765', '33.587710707102', '2', 'tr_0 tr_410000 ', '0');
INSERT INTO `provinces` VALUES ('411200', '三门峡市', '410000', '', '0', '0', 'S', '111.20653322387', '34.77832724946', '2', 'tr_0 tr_410000 ', '0');
INSERT INTO `provinces` VALUES ('411300', '南阳市', '410000', '', '0', '0', 'N', '112.53450131351', '32.996562204651', '2', 'tr_0 tr_410000 ', '0');
INSERT INTO `provinces` VALUES ('411400', '商丘市', '410000', '', '0', '0', 'S', '115.66244933826', '34.420201665859', '2', 'tr_0 tr_410000 ', '0');
INSERT INTO `provinces` VALUES ('411500', '信阳市', '410000', '', '0', '0', 'X', '114.09748283305', '32.153014547531', '2', 'tr_0 tr_410000 ', '0');
INSERT INTO `provinces` VALUES ('411600', '周口市', '410000', '', '0', '0', 'Z', '114.70348251482', '33.631828875702', '2', 'tr_0 tr_410000 ', '0');
INSERT INTO `provinces` VALUES ('411700', '驻马店市', '410000', '', '0', '0', 'Z', '114.02847078173', '33.017842416744', '2', 'tr_0 tr_410000 ', '0');
INSERT INTO `provinces` VALUES ('419000', '省直辖县级行政区划', '410000', '', '0', '0', 'S', '113.75938408486', '34.771712921931', '2', 'tr_0 tr_410000 ', '0');
INSERT INTO `provinces` VALUES ('420100', '武汉市', '420000', '', '0', '0', 'W', '114.31158155473', '30.598466736401', '2', 'tr_0 tr_420000 ', '0');
INSERT INTO `provinces` VALUES ('420200', '黄石市', '420000', '', '0', '0', 'H', '115.04553290894', '30.205207848942', '2', 'tr_0 tr_420000 ', '0');
INSERT INTO `provinces` VALUES ('420300', '十堰市', '420000', '', '0', '0', 'S', '110.8045295607', '32.635061858401', '2', 'tr_0 tr_420000 ', '0');
INSERT INTO `provinces` VALUES ('420500', '宜昌市', '420000', '', '0', '0', 'Y', '111.29254921035', '30.697446484492', '2', 'tr_0 tr_420000 ', '0');
INSERT INTO `provinces` VALUES ('420600', '襄阳市', '420000', '', '0', '0', 'X', '112.128537201', '32.014796804669', '2', 'tr_0 tr_420000 ', '0');
INSERT INTO `provinces` VALUES ('420700', '鄂州市', '420000', '', '0', '0', 'E', '114.90160738827', '30.396572173317', '2', 'tr_0 tr_420000 ', '0');
INSERT INTO `provinces` VALUES ('420800', '荆门市', '420000', '', '0', '0', 'J', '112.20639298023', '31.04173257557', '2', 'tr_0 tr_420000 ', '0');
INSERT INTO `provinces` VALUES ('420900', '孝感市', '420000', '', '0', '0', 'X', '113.92251007734', '30.930689227018', '2', 'tr_0 tr_420000 ', '0');
INSERT INTO `provinces` VALUES ('421000', '荆州市', '420000', '', '0', '0', 'J', '112.24552262926', '30.340842107743', '2', 'tr_0 tr_420000 ', '0');
INSERT INTO `provinces` VALUES ('421100', '黄冈市', '420000', '', '0', '0', 'H', '114.87849048411', '30.459358857618', '2', 'tr_0 tr_420000 ', '0');
INSERT INTO `provinces` VALUES ('421200', '咸宁市', '420000', '', '0', '0', 'X', '114.32851909027', '29.847055947646', '2', 'tr_0 tr_420000 ', '0');
INSERT INTO `provinces` VALUES ('421300', '随州市', '420000', '', '0', '0', 'S', '113.38945001822', '31.696516772328', '2', 'tr_0 tr_420000 ', '0');
INSERT INTO `provinces` VALUES ('422800', '恩施土家族苗族自治州', '420000', '', '0', '0', 'E', '109.49459261858', '30.277939575301', '2', 'tr_0 tr_420000 ', '0');
INSERT INTO `provinces` VALUES ('429000', '省直辖县级行政区划', '420000', '', '0', '0', 'S', '114.34844073659', '30.551600064658', '2', 'tr_0 tr_420000 ', '0');
INSERT INTO `provinces` VALUES ('430100', '长沙市', '430000', '', '0', '0', 'Z', '112.94547319535', '28.234889399944', '2', 'tr_0 tr_430000 ', '0');
INSERT INTO `provinces` VALUES ('430200', '株洲市', '430000', '', '0', '0', 'Z', '113.14047079776', '27.833567639016', '2', 'tr_0 tr_430000 ', '0');
INSERT INTO `provinces` VALUES ('430300', '湘潭市', '430000', '', '0', '0', 'X', '112.95046418076', '27.835702227136', '2', 'tr_0 tr_430000 ', '0');
INSERT INTO `provinces` VALUES ('430400', '衡阳市', '430000', '', '0', '0', 'H', '112.57844721326', '26.899576139189', '2', 'tr_0 tr_430000 ', '0');
INSERT INTO `provinces` VALUES ('430500', '邵阳市', '430000', '', '0', '0', 'S', '111.47443288593', '27.245270272809', '2', 'tr_0 tr_430000 ', '0');
INSERT INTO `provinces` VALUES ('430600', '岳阳市', '430000', '', '0', '0', 'Y', '113.13548942422', '29.363178293926', '2', 'tr_0 tr_430000 ', '0');
INSERT INTO `provinces` VALUES ('430700', '常德市', '430000', '', '0', '0', 'C', '111.70545217996', '29.037749999407', '2', 'tr_0 tr_430000 ', '0');
INSERT INTO `provinces` VALUES ('430800', '张家界市', '430000', '', '0', '0', 'Z', '110.48553254695', '29.122815562552', '2', 'tr_0 tr_430000 ', '0');
INSERT INTO `provinces` VALUES ('430900', '益阳市', '430000', '', '0', '0', 'Y', '112.36151595471', '28.55971117849', '2', 'tr_0 tr_430000 ', '0');
INSERT INTO `provinces` VALUES ('431000', '郴州市', '430000', '', '0', '0', 'C', '113.02146049909', '25.776683273602', '2', 'tr_0 tr_430000 ', '0');
INSERT INTO `provinces` VALUES ('431100', '永州市', '430000', '', '0', '0', 'Y', '111.61945505792', '26.4258641179', '2', 'tr_0 tr_430000 ', '0');
INSERT INTO `provinces` VALUES ('431200', '怀化市', '430000', '', '0', '0', 'H', '110.00851426537', '27.575160902979', '2', 'tr_0 tr_430000 ', '0');
INSERT INTO `provinces` VALUES ('431300', '娄底市', '430000', '', '0', '0', 'L', '112.00150349288', '27.703208596992', '2', 'tr_0 tr_430000 ', '0');
INSERT INTO `provinces` VALUES ('433100', '湘西土家族苗族自治州', '430000', '', '0', '0', 'X', '109.74557664947', '28.317369104701', '2', 'tr_0 tr_430000 ', '0');
INSERT INTO `provinces` VALUES ('440100', '广州市', '440000', '', '0', '0', 'G', '113.27143134446', '23.135336306695', '2', 'tr_0 tr_440000 ', '0');
INSERT INTO `provinces` VALUES ('440200', '韶关市', '440000', '', '0', '0', 'S', '113.60352734562', '24.815881278583', '2', 'tr_0 tr_440000 ', '0');
INSERT INTO `provinces` VALUES ('440300', '深圳市', '440000', '', '0', '0', 'S', '114.06455183659', '22.548456637984', '2', 'tr_0 tr_440000 ', '0');
INSERT INTO `provinces` VALUES ('440400', '珠海市', '440000', '', '0', '0', 'Z', '113.58255478655', '22.276564654249', '2', 'tr_0 tr_440000 ', '0');
INSERT INTO `provinces` VALUES ('440500', '汕头市', '440000', '', '0', '0', 'S', '116.68852864055', '23.359091717725', '2', 'tr_0 tr_440000 ', '0');
INSERT INTO `provinces` VALUES ('440600', '佛山市', '440000', '', '0', '0', 'F', '113.1285121955', '23.027758750789', '2', 'tr_0 tr_440000 ', '0');
INSERT INTO `provinces` VALUES ('440700', '江门市', '440000', '', '0', '0', 'J', '113.08855619524', '22.584603880965', '2', 'tr_0 tr_440000 ', '0');
INSERT INTO `provinces` VALUES ('440800', '湛江市', '440000', '', '0', '0', 'Z', '110.36555441393', '21.276723439012', '2', 'tr_0 tr_440000 ', '0');
INSERT INTO `provinces` VALUES ('440900', '茂名市', '440000', '', '0', '0', 'M', '110.93154257997', '21.669064031332', '2', 'tr_0 tr_440000 ', '0');
INSERT INTO `provinces` VALUES ('441200', '肇庆市', '440000', '', '0', '0', 'Z', '112.47148894063', '23.052888771126', '2', 'tr_0 tr_440000 ', '0');
INSERT INTO `provinces` VALUES ('441300', '惠州市', '440000', '', '0', '0', 'H', '114.42355801658', '23.116358854726', '2', 'tr_0 tr_440000 ', '0');
INSERT INTO `provinces` VALUES ('441400', '梅州市', '440000', '', '0', '0', 'M', '116.12953737612', '24.294177532206', '2', 'tr_0 tr_440000 ', '0');
INSERT INTO `provinces` VALUES ('441500', '汕尾市', '440000', '', '0', '0', 'S', '115.3729242894', '22.778730500164', '2', 'tr_0 tr_440000 ', '0');
INSERT INTO `provinces` VALUES ('441600', '河源市', '440000', '', '0', '0', 'H', '114.70744627291', '23.74968437096', '2', 'tr_0 tr_440000 ', '0');
INSERT INTO `provinces` VALUES ('441700', '阳江市', '440000', '', '0', '0', 'Y', '111.98848929181', '21.864339726139', '2', 'tr_0 tr_440000 ', '0');
INSERT INTO `provinces` VALUES ('441800', '清远市', '440000', '', '0', '0', 'Q', '113.06246832527', '23.688230292088', '2', 'tr_0 tr_440000 ', '0');
INSERT INTO `provinces` VALUES ('441900', '东莞市', '440000', '', '0', '0', 'D', '113.75842045788', '23.027308411643', '2', 'tr_0 tr_440000 ', '0');
INSERT INTO `provinces` VALUES ('442000', '中山市', '440000', '', '0', '0', 'Z', '113.39942236263', '22.522314670791', '2', 'tr_0 tr_440000 ', '0');
INSERT INTO `provinces` VALUES ('445100', '潮州市', '440000', '', '0', '0', 'C', '116.62947017363', '23.662623192616', '2', 'tr_0 tr_440000 ', '0');
INSERT INTO `provinces` VALUES ('445200', '揭阳市', '440000', '', '0', '0', 'J', '116.37851218034', '23.555740488276', '2', 'tr_0 tr_440000 ', '0');
INSERT INTO `provinces` VALUES ('445300', '云浮市', '440000', '', '0', '0', 'Y', '112.05151269959', '22.920911970343', '2', 'tr_0 tr_440000 ', '0');
INSERT INTO `provinces` VALUES ('450100', '南宁市', '450000', '', '0', '0', 'N', '108.37345082582', '22.822606601187', '2', 'tr_0 tr_450000 ', '0');
INSERT INTO `provinces` VALUES ('450200', '柳州市', '450000', '', '0', '0', 'L', '109.43442194635', '24.331961386852', '2', 'tr_0 tr_450000 ', '0');
INSERT INTO `provinces` VALUES ('450300', '桂林市', '450000', '', '0', '0', 'G', '110.20354537458', '25.242885724873', '2', 'tr_0 tr_450000 ', '0');
INSERT INTO `provinces` VALUES ('450400', '梧州市', '450000', '', '0', '0', 'W', '111.28551681182', '23.482745281135', '2', 'tr_0 tr_450000 ', '0');
INSERT INTO `provinces` VALUES ('450500', '北海市', '450000', '', '0', '0', 'B', '109.12653321257', '21.486836495769', '2', 'tr_0 tr_450000 ', '0');
INSERT INTO `provinces` VALUES ('450600', '防城港市', '450000', '', '0', '0', 'F', '108.3604188383', '21.693005289969', '2', 'tr_0 tr_450000 ', '0');
INSERT INTO `provinces` VALUES ('450700', '钦州市', '450000', '', '0', '0', 'Q', '108.66058016842', '21.986593539484', '2', 'tr_0 tr_450000 ', '0');
INSERT INTO `provinces` VALUES ('450800', '贵港市', '450000', '', '0', '0', 'G', '109.60552031033', '23.117448382038', '2', 'tr_0 tr_450000 ', '0');
INSERT INTO `provinces` VALUES ('450900', '玉林市', '450000', '', '0', '0', 'Y', '110.18845312337', '22.659830509953', '2', 'tr_0 tr_450000 ', '0');
INSERT INTO `provinces` VALUES ('451000', '百色市', '450000', '', '0', '0', 'B', '106.62458932565', '23.908185934296', '2', 'tr_0 tr_450000 ', '0');
INSERT INTO `provinces` VALUES ('451100', '贺州市', '450000', '', '0', '0', 'H', '111.57352631416', '24.409450902865', '2', 'tr_0 tr_450000 ', '0');
INSERT INTO `provinces` VALUES ('451200', '河池市', '450000', '', '0', '0', 'H', '108.09149994499', '24.698911731273', '2', 'tr_0 tr_450000 ', '0');
INSERT INTO `provinces` VALUES ('451300', '来宾市', '450000', '', '0', '0', 'L', '109.2274581959', '23.756546762607', '2', 'tr_0 tr_450000 ', '0');
INSERT INTO `provinces` VALUES ('451400', '崇左市', '450000', '', '0', '0', 'C', '107.3715202061', '22.383117234663', '2', 'tr_0 tr_450000 ', '0');
INSERT INTO `provinces` VALUES ('460100', '海口市', '460000', '', '0', '0', 'H', '110.32552547126', '20.044049439257', '2', 'tr_0 tr_460000 ', '0');
INSERT INTO `provinces` VALUES ('460200', '三亚市', '460000', '', '0', '0', 'S', '109.5185567014', '18.258736291748', '2', 'tr_0 tr_460000 ', '0');
INSERT INTO `provinces` VALUES ('460300', '三沙市', '460000', '', '0', '0', 'S', '112.34048204137', '16.838953334409', '2', 'tr_0 tr_460000 ', '0');
INSERT INTO `provinces` VALUES ('460400', '儋州市', '460000', '', '0', '0', 'D', '109.58745583569', '19.527146110044', '2', 'tr_0 tr_460000 ', '0');
INSERT INTO `provinces` VALUES ('469000', '省直辖县级行政区划', '460000', '', '0', '0', 'S', '110.35553651088', '20.025801964463', '2', 'tr_0 tr_460000 ', '0');
INSERT INTO `provinces` VALUES ('500100', '市辖区', '500000', '', '0', '0', 'S', '106.55843415538', '29.568996245339', '2', 'tr_0 tr_500000 ', '0');
INSERT INTO `provinces` VALUES ('500200', '县', '500000', '', '0', '0', 'X', '106.55843415538', '29.568996245339', '2', 'tr_0 tr_500000 ', '0');
INSERT INTO `provinces` VALUES ('510100', '成都市', '510000', '', '0', '0', 'C', '104.08153351042', '30.655821878416', '2', 'tr_0 tr_510000 ', '0');
INSERT INTO `provinces` VALUES ('510300', '自贡市', '510000', '', '0', '0', 'Z', '104.78444884672', '29.345584921328', '2', 'tr_0 tr_510000 ', '0');
INSERT INTO `provinces` VALUES ('510400', '攀枝花市', '510000', '', '0', '0', 'P', '101.72554117091', '26.588033173333', '2', 'tr_0 tr_510000 ', '0');
INSERT INTO `provinces` VALUES ('510500', '泸州市', '510000', '', '0', '0', 'L', '105.44852406933', '28.877668303607', '2', 'tr_0 tr_510000 ', '0');
INSERT INTO `provinces` VALUES ('510600', '德阳市', '510000', '', '0', '0', 'D', '104.40441936496', '31.133115003657', '2', 'tr_0 tr_510000 ', '0');
INSERT INTO `provinces` VALUES ('510700', '绵阳市', '510000', '', '0', '0', 'M', '104.68556186076', '31.473663048746', '2', 'tr_0 tr_510000 ', '0');
INSERT INTO `provinces` VALUES ('510800', '广元市', '510000', '', '0', '0', 'G', '105.85042318166', '32.441616305315', '2', 'tr_0 tr_510000 ', '0');
INSERT INTO `provinces` VALUES ('510900', '遂宁市', '510000', '', '0', '0', 'S', '105.59942153064', '30.539097671109', '2', 'tr_0 tr_510000 ', '0');
INSERT INTO `provinces` VALUES ('511000', '内江市', '510000', '', '0', '0', 'N', '105.064588025', '29.58588653832', '2', 'tr_0 tr_510000 ', '0');
INSERT INTO `provinces` VALUES ('511100', '乐山市', '510000', '', '0', '0', 'L', '103.77253760363', '29.557940717458', '2', 'tr_0 tr_510000 ', '0');
INSERT INTO `provinces` VALUES ('511300', '南充市', '510000', '', '0', '0', 'N', '106.11750261487', '30.843782508337', '2', 'tr_0 tr_510000 ', '0');
INSERT INTO `provinces` VALUES ('511400', '眉山市', '510000', '', '0', '0', 'M', '103.85656331579', '30.082526119421', '2', 'tr_0 tr_510000 ', '0');
INSERT INTO `provinces` VALUES ('511500', '宜宾市', '510000', '', '0', '0', 'Y', '104.64940370487', '28.758007028552', '2', 'tr_0 tr_510000 ', '0');
INSERT INTO `provinces` VALUES ('511600', '广安市', '510000', '', '0', '0', 'G', '106.63955268233', '30.461746110679', '2', 'tr_0 tr_510000 ', '0');
INSERT INTO `provinces` VALUES ('511700', '达州市', '510000', '', '0', '0', 'D', '107.47459385898', '31.214307723927', '2', 'tr_0 tr_510000 ', '0');
INSERT INTO `provinces` VALUES ('511800', '雅安市', '510000', '', '0', '0', 'Y', '103.0495426236', '30.016792545706', '2', 'tr_0 tr_510000 ', '0');
INSERT INTO `provinces` VALUES ('511900', '巴中市', '510000', '', '0', '0', 'B', '106.75158530316', '31.872888585957', '2', 'tr_0 tr_510000 ', '0');
INSERT INTO `provinces` VALUES ('512000', '资阳市', '510000', '', '0', '0', 'Z', '104.63443534164', '30.134956559253', '2', 'tr_0 tr_510000 ', '0');
INSERT INTO `provinces` VALUES ('513200', '阿坝藏族羌族自治州', '510000', '', '0', '0', 'A', '102.23141546175', '31.905511577267', '2', 'tr_0 tr_510000 ', '0');
INSERT INTO `provinces` VALUES ('513300', '甘孜藏族自治州', '510000', '', '0', '0', 'G', '101.96854674579', '30.055278843518', '2', 'tr_0 tr_510000 ', '0');
INSERT INTO `provinces` VALUES ('513400', '凉山彝族自治州', '510000', '', '0', '0', 'L', '102.27350268097', '27.88775230037', '2', 'tr_0 tr_510000 ', '0');
INSERT INTO `provinces` VALUES ('520100', '贵阳市', '520000', '', '0', '0', 'G', '106.63657676353', '26.65332482231', '2', 'tr_0 tr_520000 ', '0');
INSERT INTO `provinces` VALUES ('520200', '六盘水市', '520000', '', '0', '0', 'L', '104.83755460235', '26.598833108257', '2', 'tr_0 tr_520000 ', '0');
INSERT INTO `provinces` VALUES ('520300', '遵义市', '520000', '', '0', '0', 'Z', '106.93342774802', '27.731700878917', '2', 'tr_0 tr_520000 ', '0');
INSERT INTO `provinces` VALUES ('520400', '安顺市', '520000', '', '0', '0', 'A', '105.95441712389', '26.259252378715', '2', 'tr_0 tr_520000 ', '0');
INSERT INTO `provinces` VALUES ('520500', '毕节市', '520000', '', '0', '0', 'B', '105.33332337117', '27.408562131331', '2', 'tr_0 tr_520000 ', '0');
INSERT INTO `provinces` VALUES ('520600', '铜仁市', '520000', '', '0', '0', 'T', '109.16855802826', '27.674902690624', '2', 'tr_0 tr_520000 ', '0');
INSERT INTO `provinces` VALUES ('522300', '黔西南布依族苗族自治州', '520000', '', '0', '0', 'Q', '104.91249214627', '25.093967349417', '2', 'tr_0 tr_520000 ', '0');
INSERT INTO `provinces` VALUES ('522600', '黔东南苗族侗族自治州', '520000', '', '0', '0', 'Q', '107.98944624078', '26.589702969826', '2', 'tr_0 tr_520000 ', '0');
INSERT INTO `provinces` VALUES ('522700', '黔南布依族苗族自治州', '520000', '', '0', '0', 'Q', '107.52840270574', '26.260616196074', '2', 'tr_0 tr_520000 ', '0');
INSERT INTO `provinces` VALUES ('530100', '昆明市', '530000', '', '0', '0', 'K', '102.852448365', '24.873998150044', '2', 'tr_0 tr_530000 ', '0');
INSERT INTO `provinces` VALUES ('530300', '曲靖市', '530000', '', '0', '0', 'Q', '103.80243482795', '25.496406931544', '2', 'tr_0 tr_530000 ', '0');
INSERT INTO `provinces` VALUES ('530400', '玉溪市', '530000', '', '0', '0', 'Y', '102.55356029311', '24.357710942446', '2', 'tr_0 tr_530000 ', '0');
INSERT INTO `provinces` VALUES ('530500', '保山市', '530000', '', '0', '0', 'B', '99.177273285818', '25.139038793266', '2', 'tr_0 tr_530000 ', '0');
INSERT INTO `provinces` VALUES ('530600', '昭通市', '530000', '', '0', '0', 'Z', '103.72351177197', '27.344083860247', '2', 'tr_0 tr_530000 ', '0');
INSERT INTO `provinces` VALUES ('530700', '丽江市', '530000', '', '0', '0', 'L', '100.23246452903', '26.860657438065', '2', 'tr_0 tr_530000 ', '0');
INSERT INTO `provinces` VALUES ('530800', '普洱市', '530000', '', '0', '0', 'P', '100.97256981473', '22.83097918601', '2', 'tr_0 tr_530000 ', '0');
INSERT INTO `provinces` VALUES ('530900', '临沧市', '530000', '', '0', '0', 'L', '100.09544042015', '23.890468556279', '2', 'tr_0 tr_530000 ', '0');
INSERT INTO `provinces` VALUES ('532300', '楚雄彝族自治州', '530000', '', '0', '0', 'C', '101.5344124805', '25.05177356534', '2', 'tr_0 tr_530000 ', '0');
INSERT INTO `provinces` VALUES ('532500', '红河哈尼族彝族自治州', '530000', '', '0', '0', 'H', '103.38154905258', '23.369996247605', '2', 'tr_0 tr_530000 ', '0');
INSERT INTO `provinces` VALUES ('532600', '文山壮族苗族自治州', '530000', '', '0', '0', 'W', '104.22256899109', '23.405994293612', '2', 'tr_0 tr_530000 ', '0');
INSERT INTO `provinces` VALUES ('532800', '西双版纳傣族自治州', '530000', '', '0', '0', 'X', '100.80344682456', '22.013601254764', '2', 'tr_0 tr_530000 ', '0');
INSERT INTO `provinces` VALUES ('532900', '大理白族自治州', '530000', '', '0', '0', 'D', '100.27458284048', '25.612128418193', '2', 'tr_0 tr_530000 ', '0');
INSERT INTO `provinces` VALUES ('533100', '德宏傣族景颇族自治州', '530000', '', '0', '0', 'D', '98.591359356114', '24.438010702758', '2', 'tr_0 tr_530000 ', '0');
INSERT INTO `provinces` VALUES ('533300', '怒江傈僳族自治州', '530000', '', '0', '0', 'N', '98.863288381358', '25.823707417658', '2', 'tr_0 tr_530000 ', '0');
INSERT INTO `provinces` VALUES ('533400', '迪庆藏族自治州', '530000', '', '0', '0', 'D', '99.70952999014', '27.825184683643', '2', 'tr_0 tr_530000 ', '0');
INSERT INTO `provinces` VALUES ('540100', '拉萨市', '540000', '', '0', '0', 'L', '91.120823915464', '29.650040274768', '2', 'tr_0 tr_540000 ', '0');
INSERT INTO `provinces` VALUES ('540200', '日喀则市', '540000', '', '0', '0', 'R', '88.893703034826', '29.275657822512', '2', 'tr_0 tr_540000 ', '0');
INSERT INTO `provinces` VALUES ('540300', '昌都市', '540000', '', '0', '0', 'C', '97.179583594086', '31.147346549327', '2', 'tr_0 tr_540000 ', '0');
INSERT INTO `provinces` VALUES ('540400', '林芝市', '540000', '', '0', '0', 'L', '94.368058287133', '29.654042176952', '2', 'tr_0 tr_540000 ', '0');
INSERT INTO `provinces` VALUES ('540500', '山南市', '540000', '', '0', '0', 'S', '91.778675138519', '29.243026939249', '2', 'tr_0 tr_540000 ', '0');
INSERT INTO `provinces` VALUES ('540600', '那曲市', '540000', '', '0', '0', 'N', '92.057338498175', '31.482438388455', '2', 'tr_0 tr_540000 ', '0');
INSERT INTO `provinces` VALUES ('542500', '阿里地区', '540000', '', '0', '0', 'A', '80.112776921926', '32.506866017633', '2', 'tr_0 tr_540000 ', '0');
INSERT INTO `provinces` VALUES ('610100', '西安市', '610000', '', '0', '0', 'X', '108.94646555063', '34.347268816624', '2', 'tr_0 tr_610000 ', '0');
INSERT INTO `provinces` VALUES ('610200', '铜川市', '610000', '', '0', '0', 'T', '108.95240424836', '34.902637080503', '2', 'tr_0 tr_610000 ', '0');
INSERT INTO `provinces` VALUES ('610300', '宝鸡市', '610000', '', '0', '0', 'B', '107.24457536704', '34.36891564287', '2', 'tr_0 tr_610000 ', '0');
INSERT INTO `provinces` VALUES ('610400', '咸阳市', '610000', '', '0', '0', 'X', '108.71542245143', '34.335476293369', '2', 'tr_0 tr_610000 ', '0');
INSERT INTO `provinces` VALUES ('610500', '渭南市', '610000', '', '0', '0', 'W', '109.51658960526', '34.505715516753', '2', 'tr_0 tr_610000 ', '0');
INSERT INTO `provinces` VALUES ('610600', '延安市', '610000', '', '0', '0', 'Y', '109.49658191613', '36.591111035218', '2', 'tr_0 tr_610000 ', '0');
INSERT INTO `provinces` VALUES ('610700', '汉中市', '610000', '', '0', '0', 'H', '107.02943020926', '33.073799907834', '2', 'tr_0 tr_610000 ', '0');
INSERT INTO `provinces` VALUES ('610800', '榆林市', '610000', '', '0', '0', 'Y', '109.74161603381', '38.290883835484', '2', 'tr_0 tr_610000 ', '0');
INSERT INTO `provinces` VALUES ('610900', '安康市', '610000', '', '0', '0', 'A', '109.03560108266', '32.690512770574', '2', 'tr_0 tr_610000 ', '0');
INSERT INTO `provinces` VALUES ('611000', '商洛市', '610000', '', '0', '0', 'S', '109.92441788136', '33.878633852208', '2', 'tr_0 tr_610000 ', '0');
INSERT INTO `provinces` VALUES ('620100', '兰州市', '620000', '', '0', '0', 'L', '103.84052119634', '36.067234693546', '2', 'tr_0 tr_620000 ', '0');
INSERT INTO `provinces` VALUES ('620200', '嘉峪关市', '620000', '', '0', '0', 'J', '98.296203843001', '39.777960147391', '2', 'tr_0 tr_620000 ', '0');
INSERT INTO `provinces` VALUES ('620300', '金昌市', '620000', '', '0', '0', 'J', '102.1946056867', '38.525820092093', '2', 'tr_0 tr_620000 ', '0');
INSERT INTO `provinces` VALUES ('620400', '白银市', '620000', '', '0', '0', 'B', '104.14445082834', '36.550825330415', '2', 'tr_0 tr_620000 ', '0');
INSERT INTO `provinces` VALUES ('620500', '天水市', '620000', '', '0', '0', 'T', '105.73141674567', '34.587411881651', '2', 'tr_0 tr_620000 ', '0');
INSERT INTO `provinces` VALUES ('620600', '武威市', '620000', '', '0', '0', 'W', '102.64455434037', '37.934377808158', '2', 'tr_0 tr_620000 ', '0');
INSERT INTO `provinces` VALUES ('620700', '张掖市', '620000', '', '0', '0', 'Z', '100.45641147406', '38.932066007005', '2', 'tr_0 tr_620000 ', '0');
INSERT INTO `provinces` VALUES ('620800', '平凉市', '620000', '', '0', '0', 'P', '106.67144234828', '35.549232050464', '2', 'tr_0 tr_620000 ', '0');
INSERT INTO `provinces` VALUES ('620900', '酒泉市', '620000', '', '0', '0', 'J', '98.500685216068', '39.738469080716', '2', 'tr_0 tr_620000 ', '0');
INSERT INTO `provinces` VALUES ('621000', '庆阳市', '620000', '', '0', '0', 'Q', '107.64938569595', '35.715215983562', '2', 'tr_0 tr_620000 ', '0');
INSERT INTO `provinces` VALUES ('621100', '定西市', '620000', '', '0', '0', 'D', '104.63242008306', '35.586832926562', '2', 'tr_0 tr_620000 ', '0');
INSERT INTO `provinces` VALUES ('621200', '陇南市', '620000', '', '0', '0', 'L', '104.92857497071', '33.406620229951', '2', 'tr_0 tr_620000 ', '0');
INSERT INTO `provinces` VALUES ('622900', '临夏回族自治州', '620000', '', '0', '0', 'L', '103.2163905653', '35.607562183503', '2', 'tr_0 tr_620000 ', '0');
INSERT INTO `provinces` VALUES ('623000', '甘南藏族自治州', '620000', '', '0', '0', 'G', '102.91758468826', '34.989139909968', '2', 'tr_0 tr_620000 ', '0');
INSERT INTO `provinces` VALUES ('630100', '西宁市', '630000', '', '0', '0', 'X', '101.78445017051', '36.623384696517', '2', 'tr_0 tr_630000 ', '0');
INSERT INTO `provinces` VALUES ('630200', '海东市', '630000', '', '0', '0', 'H', '102.11044407228', '36.508511080941', '2', 'tr_0 tr_630000 ', '0');
INSERT INTO `provinces` VALUES ('632200', '海北藏族自治州', '630000', '', '0', '0', 'H', '100.90743432146', '36.96066282413', '2', 'tr_0 tr_630000 ', '0');
INSERT INTO `provinces` VALUES ('632300', '黄南藏族自治州', '630000', '', '0', '0', 'H', '102.02242827808', '35.525804586516', '2', 'tr_0 tr_630000 ', '0');
INSERT INTO `provinces` VALUES ('632500', '海南藏族自治州', '630000', '', '0', '0', 'H', '100.62662114446', '36.292102479899', '2', 'tr_0 tr_630000 ', '0');
INSERT INTO `provinces` VALUES ('632600', '果洛藏族自治州', '630000', '', '0', '0', 'G', '100.2515919788', '34.477193866471', '2', 'tr_0 tr_630000 ', '0');
INSERT INTO `provinces` VALUES ('632700', '玉树藏族自治州', '630000', '', '0', '0', 'Y', '97.013180762773', '33.010979585143', '2', 'tr_0 tr_630000 ', '0');
INSERT INTO `provinces` VALUES ('632800', '海西蒙古族藏族自治州', '630000', '', '0', '0', 'H', '97.376299116019', '37.382750462527', '2', 'tr_0 tr_630000 ', '0');
INSERT INTO `provinces` VALUES ('640100', '银川市', '640000', '', '0', '0', 'Y', '106.2384935874', '38.49246005551', '2', 'tr_0 tr_640000 ', '0');
INSERT INTO `provinces` VALUES ('640200', '石嘴山市', '640000', '', '0', '0', 'S', '106.3906004255', '38.989682839915', '2', 'tr_0 tr_640000 ', '0');
INSERT INTO `provinces` VALUES ('640300', '吴忠市', '640000', '', '0', '0', 'W', '106.20537126664', '38.003712913453', '2', 'tr_0 tr_640000 ', '0');
INSERT INTO `provinces` VALUES ('640400', '固原市', '640000', '', '0', '0', 'G', '106.24857742607', '36.021617258011', '2', 'tr_0 tr_640000 ', '0');
INSERT INTO `provinces` VALUES ('640500', '中卫市', '640000', '', '0', '0', 'Z', '105.20357090089', '37.505701418703', '2', 'tr_0 tr_640000 ', '0');
INSERT INTO `provinces` VALUES ('650100', '乌鲁木齐市', '650000', '', '0', '0', 'W', '87.62443993536', '43.83076320429', '2', 'tr_0 tr_650000 ', '0');
INSERT INTO `provinces` VALUES ('650200', '克拉玛依市', '650000', '', '0', '0', 'K', '84.895900538875', '45.585675237814', '2', 'tr_0 tr_650000 ', '0');
INSERT INTO `provinces` VALUES ('650400', '吐鲁番市', '650000', '', '0', '0', 'T', '89.266025488642', '42.678924820794', '2', 'tr_0 tr_650000 ', '0');
INSERT INTO `provinces` VALUES ('650500', '哈密市', '650000', '', '0', '0', 'H', '93.529373012389', '42.344467104552', '2', 'tr_0 tr_650000 ', '0');
INSERT INTO `provinces` VALUES ('652300', '昌吉回族自治州', '650000', '', '0', '0', 'C', '87.315001624474', '44.01685415992', '2', 'tr_0 tr_650000 ', '0');
INSERT INTO `provinces` VALUES ('652700', '博尔塔拉蒙古自治州', '650000', '', '0', '0', 'B', '82.072914758274', '44.912196413465', '2', 'tr_0 tr_650000 ', '0');
INSERT INTO `provinces` VALUES ('652800', '巴音郭楞蒙古自治州', '650000', '', '0', '0', 'B', '86.151713865333', '41.77028733045', '2', 'tr_0 tr_650000 ', '0');
INSERT INTO `provinces` VALUES ('652900', '阿克苏地区', '650000', '', '0', '0', 'A', '80.266943484735', '41.175029860077', '2', 'tr_0 tr_650000 ', '0');
INSERT INTO `provinces` VALUES ('653000', '克孜勒苏柯尔克孜自治州', '650000', '', '0', '0', 'K', '76.174308676212', '39.720471204871', '2', 'tr_0 tr_650000 ', '0');
INSERT INTO `provinces` VALUES ('653100', '喀什地区', '650000', '', '0', '0', 'K', '75.996390556397', '39.476096748645', '2', 'tr_0 tr_650000 ', '0');
INSERT INTO `provinces` VALUES ('653200', '和田地区', '650000', '', '0', '0', 'H', '79.928507063512', '37.120446463042', '2', 'tr_0 tr_650000 ', '0');
INSERT INTO `provinces` VALUES ('654000', '伊犁哈萨克自治州', '650000', '', '0', '0', 'Y', '81.330537747532', '43.922723137492', '2', 'tr_0 tr_650000 ', '0');
INSERT INTO `provinces` VALUES ('654200', '塔城地区', '650000', '', '0', '0', 'T', '82.987235518406', '46.750948254373', '2', 'tr_0 tr_650000 ', '0');
INSERT INTO `provinces` VALUES ('654300', '阿勒泰地区', '650000', '', '0', '0', 'A', '88.147926203735', '47.850727870102', '2', 'tr_0 tr_650000 ', '0');
INSERT INTO `provinces` VALUES ('659000', '自治区直辖县级行政区划', '650000', '', '0', '0', 'Z', '87.633473205738', '43.79923810129', '2', 'tr_0 tr_650000 ', '0');
INSERT INTO `provinces` VALUES ('110101', '东城区', '110100', '', '0', '0', 'D', '116.42240097766', '39.934827272396', '3', 'tr_0 tr_110000 tr_110100 ', '0');
INSERT INTO `provinces` VALUES ('110102', '西城区', '110100', '', '0', '0', 'X', '116.37251358117', '39.918123605841', '3', 'tr_0 tr_110000 tr_110100 ', '0');
INSERT INTO `provinces` VALUES ('110105', '朝阳区', '110100', '', '0', '0', 'C', '112.85530302042', '35.520558754673', '3', 'tr_0 tr_110000 tr_110100 ', '0');
INSERT INTO `provinces` VALUES ('110106', '丰台区', '110100', '', '0', '0', 'F', '116.29240188731', '39.864937197557', '3', 'tr_0 tr_110000 tr_110100 ', '0');
INSERT INTO `provinces` VALUES ('110107', '石景山区', '110100', '', '0', '0', 'S', '116.22961266776', '39.911353808778', '3', 'tr_0 tr_110000 tr_110100 ', '0');
INSERT INTO `provinces` VALUES ('110108', '海淀区', '110100', '', '0', '0', 'H', '116.3054340545', '39.965489841101', '3', 'tr_0 tr_110000 tr_110100 ', '0');
INSERT INTO `provinces` VALUES ('110109', '门头沟区', '110100', '', '0', '0', 'M', '116.10760355577', '39.946146720034', '3', 'tr_0 tr_110000 tr_110100 ', '0');
INSERT INTO `provinces` VALUES ('110111', '房山区', '110100', '', '0', '0', 'F', '116.14944375184', '39.754325839773', '3', 'tr_0 tr_110000 tr_110100 ', '0');
INSERT INTO `provinces` VALUES ('110112', '通州区', '110100', '', '0', '0', 'T', '112.85530302042', '35.520558754673', '3', 'tr_0 tr_110000 tr_110100 ', '0');
INSERT INTO `provinces` VALUES ('110113', '顺义区', '110100', '', '0', '0', 'S', '116.66142426369', '40.136350762231', '3', 'tr_0 tr_110000 tr_110100 ', '0');
INSERT INTO `provinces` VALUES ('110114', '昌平区', '110100', '', '0', '0', 'C', '116.23761791731', '40.226413371594', '3', 'tr_0 tr_110000 tr_110100 ', '0');
INSERT INTO `provinces` VALUES ('110115', '大兴区', '110100', '', '0', '0', 'D', '116.34862521223', '39.732555236554', '3', 'tr_0 tr_110000 tr_110100 ', '0');
INSERT INTO `provinces` VALUES ('110116', '怀柔区', '110100', '', '0', '0', 'H', '116.63838587143', '40.322618404266', '3', 'tr_0 tr_110000 tr_110100 ', '0');
INSERT INTO `provinces` VALUES ('110117', '平谷区', '110100', '', '0', '0', 'P', '117.1273791046', '40.146950735799', '3', 'tr_0 tr_110000 tr_110100 ', '0');
INSERT INTO `provinces` VALUES ('110118', '密云区', '110100', '', '0', '0', 'M', '116.84954704427', '40.382175658138', '3', 'tr_0 tr_110000 tr_110100 ', '0');
INSERT INTO `provinces` VALUES ('110119', '延庆区', '110100', '', '0', '0', 'Y', '115.98163156902', '40.462168973754', '3', 'tr_0 tr_110000 tr_110100 ', '0');
INSERT INTO `provinces` VALUES ('120101', '和平区', '120100', '', '0', '0', 'H', '112.85530302042', '35.520558754673', '3', 'tr_0 tr_120000 tr_120100 ', '0');
INSERT INTO `provinces` VALUES ('120102', '河东区', '120100', '', '0', '0', 'H', '117.26169316527', '39.126625684666', '3', 'tr_0 tr_120000 tr_120100 ', '0');
INSERT INTO `provinces` VALUES ('120103', '河西区', '120100', '', '0', '0', 'H', '117.22941628002', '39.115718082216', '3', 'tr_0 tr_120000 tr_120100 ', '0');
INSERT INTO `provinces` VALUES ('120104', '南开区', '120100', '', '0', '0', 'N', '117.15651537432', '39.144105279768', '3', 'tr_0 tr_120000 tr_120100 ', '0');
INSERT INTO `provinces` VALUES ('120105', '河北区', '120100', '', '0', '0', 'H', '117.20359278136', '39.153485144705', '3', 'tr_0 tr_120000 tr_120100 ', '0');
INSERT INTO `provinces` VALUES ('120106', '红桥区', '120100', '', '0', '0', 'H', '117.15751788327', '39.173285646564', '3', 'tr_0 tr_120000 tr_120100 ', '0');
INSERT INTO `provinces` VALUES ('120110', '东丽区', '120100', '', '0', '0', 'D', '117.32056850791', '39.092332342815', '3', 'tr_0 tr_120000 tr_120100 ', '0');
INSERT INTO `provinces` VALUES ('120111', '西青区', '120100', '', '0', '0', 'X', '117.01441017994', '39.148726608967', '3', 'tr_0 tr_120000 tr_120100 ', '0');
INSERT INTO `provinces` VALUES ('120112', '津南区', '120100', '', '0', '0', 'J', '117.36338677903', '38.944148568115', '3', 'tr_0 tr_120000 tr_120100 ', '0');
INSERT INTO `provinces` VALUES ('120113', '北辰区', '120100', '', '0', '0', 'B', '117.14140273158', '39.230343909918', '3', 'tr_0 tr_120000 tr_120100 ', '0');
INSERT INTO `provinces` VALUES ('120114', '武清区', '120100', '', '0', '0', 'W', '117.05059715978', '39.389871228788', '3', 'tr_0 tr_120000 tr_120100 ', '0');
INSERT INTO `provinces` VALUES ('120115', '宝坻区', '120100', '', '0', '0', 'B', '117.31660069248', '39.723194482933', '3', 'tr_0 tr_120000 tr_120100 ', '0');
INSERT INTO `provinces` VALUES ('120116', '滨海新区', '120100', '', '0', '0', 'B', '117.71739882966', '39.009415773647', '3', 'tr_0 tr_120000 tr_120100 ', '0');
INSERT INTO `provinces` VALUES ('120117', '宁河区', '120100', '', '0', '0', 'N', '117.83239334342', '39.336956431227', '3', 'tr_0 tr_120000 tr_120100 ', '0');
INSERT INTO `provinces` VALUES ('120118', '静海区', '120100', '', '0', '0', 'J', '116.98046860455', '38.953370689172', '3', 'tr_0 tr_120000 tr_120100 ', '0');
INSERT INTO `provinces` VALUES ('120119', '蓟州区', '120100', '', '0', '0', 'J', '117.41457869479', '40.051508786395', '3', 'tr_0 tr_120000 tr_120100 ', '0');
INSERT INTO `provinces` VALUES ('140105', '小店区', '140100', '', '0', '0', 'X', '112.57239624162', '37.742322528645', '3', 'tr_0 tr_140000 tr_140100 ', '0');
INSERT INTO `provinces` VALUES ('140106', '迎泽区', '140100', '', '0', '0', 'Y', '112.5693846724', '37.869532484225', '3', 'tr_0 tr_140000 tr_140100 ', '0');
INSERT INTO `provinces` VALUES ('140107', '杏花岭区', '140100', '', '0', '0', 'X', '112.5763830113', '37.900186246845', '3', 'tr_0 tr_140000 tr_140100 ', '0');
INSERT INTO `provinces` VALUES ('140108', '尖草坪区', '140100', '', '0', '0', 'J', '112.49360496704', '37.945943354548', '3', 'tr_0 tr_140000 tr_140100 ', '0');
INSERT INTO `provinces` VALUES ('140109', '万柏林区', '140100', '', '0', '0', 'W', '112.52257675702', '37.864974410402', '3', 'tr_0 tr_140000 tr_140100 ', '0');
INSERT INTO `provinces` VALUES ('140110', '晋源区', '140100', '', '0', '0', 'J', '112.48456424072', '37.721168857849', '3', 'tr_0 tr_140000 tr_140100 ', '0');
INSERT INTO `provinces` VALUES ('140121', '清徐县', '140100', '', '0', '0', 'Q', '112.36455763137', '37.613066838238', '3', 'tr_0 tr_140000 tr_140100 ', '0');
INSERT INTO `provinces` VALUES ('140122', '阳曲县', '140100', '', '0', '0', 'Y', '112.6794089516', '38.064620819448', '3', 'tr_0 tr_140000 tr_140100 ', '0');
INSERT INTO `provinces` VALUES ('140123', '娄烦县', '140100', '', '0', '0', 'L', '111.80359063362', '38.073195368896', '3', 'tr_0 tr_140000 tr_140100 ', '0');
INSERT INTO `provinces` VALUES ('140171', '山西转型综合改革示范区', '140100', '', '0', '0', 'S', '112.55639149167', '37.876989028848', '3', 'tr_0 tr_140000 tr_140100 ', '0');
INSERT INTO `provinces` VALUES ('140181', '古交市', '140100', '', '0', '0', 'G', '112.1824528689', '37.912999960962', '3', 'tr_0 tr_140000 tr_140100 ', '0');
INSERT INTO `provinces` VALUES ('140212', '新荣区', '140200', '', '0', '0', 'X', '113.14644373539', '40.261971219328', '3', 'tr_0 tr_140000 tr_140200 ', '0');
INSERT INTO `provinces` VALUES ('140213', '平城区', '140200', '', '0', '0', 'P', '113.30442522204', '40.081998375025', '3', 'tr_0 tr_140000 tr_140200 ', '0');
INSERT INTO `provinces` VALUES ('140214', '云冈区', '140200', '', '0', '0', 'Y', '113.16240150396', '39.996838811279', '3', 'tr_0 tr_140000 tr_140200 ', '0');
INSERT INTO `provinces` VALUES ('140215', '云州区', '140200', '', '0', '0', 'Y', '113.61847103172', '40.046229886508', '3', 'tr_0 tr_140000 tr_140200 ', '0');
INSERT INTO `provinces` VALUES ('140221', '阳高县', '140200', '', '0', '0', 'Y', '113.75541420332', '40.367391842472', '3', 'tr_0 tr_140000 tr_140200 ', '0');
INSERT INTO `provinces` VALUES ('140222', '天镇县', '140200', '', '0', '0', 'T', '114.09747753304', '40.426412198691', '3', 'tr_0 tr_140000 tr_140200 ', '0');
INSERT INTO `provinces` VALUES ('140223', '广灵县', '140200', '', '0', '0', 'G', '114.28858637097', '39.766004217139', '3', 'tr_0 tr_140000 tr_140200 ', '0');
INSERT INTO `provinces` VALUES ('140224', '灵丘县', '140200', '', '0', '0', 'L', '114.24136819946', '39.448825128052', '3', 'tr_0 tr_140000 tr_140200 ', '0');
INSERT INTO `provinces` VALUES ('140225', '浑源县', '140200', '', '0', '0', 'H', '113.70560028822', '39.698952969845', '3', 'tr_0 tr_140000 tr_140200 ', '0');
INSERT INTO `provinces` VALUES ('140226', '左云县', '140200', '', '0', '0', 'Z', '112.70946328956', '40.019623449015', '3', 'tr_0 tr_140000 tr_140200 ', '0');
INSERT INTO `provinces` VALUES ('140271', '山西大同经济开发区', '140200', '', '0', '0', 'S', '113.30643625859', '40.082468716161', '3', 'tr_0 tr_140000 tr_140200 ', '0');
INSERT INTO `provinces` VALUES ('140302', '城区', '140300', '', '0', '0', 'C', '113.61283811719', '37.85786536147', '3', 'tr_0 tr_140000 tr_140300 ', '0');
INSERT INTO `provinces` VALUES ('140303', '矿区', '140300', '', '0', '0', 'K', '113.54077065934', '37.890804244519', '3', 'tr_0 tr_140000 tr_140300 ', '0');
INSERT INTO `provinces` VALUES ('140311', '郊区', '140300', '', '0', '0', 'J', '113.60060283682', '37.950352892943', '3', 'tr_0 tr_140000 tr_140300 ', '0');
INSERT INTO `provinces` VALUES ('140321', '平定县', '140300', '', '0', '0', 'P', '113.66442115516', '37.792796383591', '3', 'tr_0 tr_140000 tr_140300 ', '0');
INSERT INTO `provinces` VALUES ('140322', '盂县', '140300', '', '0', '0', 'Y', '113.41842046075', '38.091979630201', '3', 'tr_0 tr_140000 tr_140300 ', '0');
INSERT INTO `provinces` VALUES ('140403', '潞州区', '140400', '', '0', '0', 'L', '113.12952091721', '36.209472481338', '3', 'tr_0 tr_140000 tr_140400 ', '0');
INSERT INTO `provinces` VALUES ('140404', '上党区', '140400', '', '0', '0', 'S', '113.05741608986', '36.059286479291', '3', 'tr_0 tr_140000 tr_140400 ', '0');
INSERT INTO `provinces` VALUES ('140405', '屯留区', '140400', '', '0', '0', 'T', '112.89847476377', '36.321630843108', '3', 'tr_0 tr_140000 tr_140400 ', '0');
INSERT INTO `provinces` VALUES ('140406', '潞城区', '140400', '', '0', '0', 'L', '113.23557845894', '36.339691267612', '3', 'tr_0 tr_140000 tr_140400 ', '0');
INSERT INTO `provinces` VALUES ('140423', '襄垣县', '140400', '', '0', '0', 'X', '113.05741258647', '36.541685821155', '3', 'tr_0 tr_140000 tr_140400 ', '0');
INSERT INTO `provinces` VALUES ('140425', '平顺县', '140400', '', '0', '0', 'P', '113.44251696707', '36.205989459384', '3', 'tr_0 tr_140000 tr_140400 ', '0');
INSERT INTO `provinces` VALUES ('140426', '黎城县', '140400', '', '0', '0', 'L', '113.39343247604', '36.508669901441', '3', 'tr_0 tr_140000 tr_140400 ', '0');
INSERT INTO `provinces` VALUES ('140427', '壶关县', '140400', '', '0', '0', 'H', '113.21357985531', '36.121334604237', '3', 'tr_0 tr_140000 tr_140400 ', '0');
INSERT INTO `provinces` VALUES ('140428', '长子县', '140400', '', '0', '0', 'Z', '112.88456585041', '36.128001557794', '3', 'tr_0 tr_140000 tr_140400 ', '0');
INSERT INTO `provinces` VALUES ('140429', '武乡县', '140400', '', '0', '0', 'W', '112.8706056438', '36.843167949301', '3', 'tr_0 tr_140000 tr_140400 ', '0');
INSERT INTO `provinces` VALUES ('140430', '沁县', '140400', '', '0', '0', 'Q', '112.70545801478', '36.762189938552', '3', 'tr_0 tr_140000 tr_140400 ', '0');
INSERT INTO `provinces` VALUES ('140431', '沁源县', '140400', '', '0', '0', 'Q', '112.34445202694', '36.506103350913', '3', 'tr_0 tr_140000 tr_140400 ', '0');
INSERT INTO `provinces` VALUES ('140471', '山西长治高新技术产业园区', '140400', '', '0', '0', 'S', '113.12255886985', '36.201268372155', '3', 'tr_0 tr_140000 tr_140400 ', '0');
INSERT INTO `provinces` VALUES ('140502', '城区', '140500', '', '0', '0', 'C', '112.85958379452', '35.507278924584', '3', 'tr_0 tr_140000 tr_140500 ', '0');
INSERT INTO `provinces` VALUES ('140521', '沁水县', '140500', '', '0', '0', 'Q', '112.19342620969', '35.696364462457', '3', 'tr_0 tr_140000 tr_140500 ', '0');
INSERT INTO `provinces` VALUES ('140522', '阳城县', '140500', '', '0', '0', 'Y', '112.42145378712', '35.492181320425', '3', 'tr_0 tr_140000 tr_140500 ', '0');
INSERT INTO `provinces` VALUES ('140524', '陵川县', '140500', '', '0', '0', 'L', '113.28740655466', '35.781743639538', '3', 'tr_0 tr_140000 tr_140500 ', '0');
INSERT INTO `provinces` VALUES ('140525', '泽州县', '140500', '', '0', '0', 'Z', '112.79440121959', '35.599769729488', '3', 'tr_0 tr_140000 tr_140500 ', '0');
INSERT INTO `provinces` VALUES ('140581', '高平市', '140500', '', '0', '0', 'G', '112.93041239923', '35.804336798578', '3', 'tr_0 tr_140000 tr_140500 ', '0');
INSERT INTO `provinces` VALUES ('140602', '朔城区', '140600', '', '0', '0', 'S', '112.43837642564', '39.325302712534', '3', 'tr_0 tr_140000 tr_140600 ', '0');
INSERT INTO `provinces` VALUES ('140603', '平鲁区', '140600', '', '0', '0', 'P', '112.29552500886', '39.517389104237', '3', 'tr_0 tr_140000 tr_140600 ', '0');
INSERT INTO `provinces` VALUES ('140621', '山阴县', '140600', '', '0', '0', 'S', '112.82243194473', '39.534030498011', '3', 'tr_0 tr_140000 tr_140600 ', '0');
INSERT INTO `provinces` VALUES ('140622', '应县', '140600', '', '0', '0', 'Y', '113.19749353922', '39.560077852375', '3', 'tr_0 tr_140000 tr_140600 ', '0');
INSERT INTO `provinces` VALUES ('140623', '右玉县', '140600', '', '0', '0', 'Y', '112.47350008125', '39.994859555431', '3', 'tr_0 tr_140000 tr_140600 ', '0');
INSERT INTO `provinces` VALUES ('140671', '山西朔州经济开发区', '140600', '', '0', '0', 'S', '112.46306042376', '39.354781496121', '3', 'tr_0 tr_140000 tr_140600 ', '0');
INSERT INTO `provinces` VALUES ('140681', '怀仁市', '140600', '', '0', '0', 'H', '113.10660846738', '39.833756889522', '3', 'tr_0 tr_140000 tr_140600 ', '0');
INSERT INTO `provinces` VALUES ('140702', '榆次区', '140700', '', '0', '0', 'Y', '112.71450350211', '37.703940486801', '3', 'tr_0 tr_140000 tr_140700 ', '0');
INSERT INTO `provinces` VALUES ('140721', '榆社县', '140700', '', '0', '0', 'Y', '112.98159856583', '37.0763696687', '3', 'tr_0 tr_140000 tr_140700 ', '0');
INSERT INTO `provinces` VALUES ('140722', '左权县', '140700', '', '0', '0', 'Z', '113.38545184006', '37.088555147171', '3', 'tr_0 tr_140000 tr_140700 ', '0');
INSERT INTO `provinces` VALUES ('140723', '和顺县', '140700', '', '0', '0', 'H', '113.57660568309', '37.334807738688', '3', 'tr_0 tr_140000 tr_140700 ', '0');
INSERT INTO `provinces` VALUES ('140724', '昔阳县', '140700', '', '0', '0', 'X', '113.71361290387', '37.617884042996', '3', 'tr_0 tr_140000 tr_140700 ', '0');
INSERT INTO `provinces` VALUES ('140725', '寿阳县', '140700', '', '0', '0', 'S', '113.18341017493', '37.901307606957', '3', 'tr_0 tr_140000 tr_140700 ', '0');
INSERT INTO `provinces` VALUES ('140726', '太谷县', '140700', '', '0', '0', 'T', '112.55738411926', '37.427395577313', '3', 'tr_0 tr_140000 tr_140700 ', '0');
INSERT INTO `provinces` VALUES ('140727', '祁县', '140700', '', '0', '0', 'Q', '112.34244242768', '37.364131283475', '3', 'tr_0 tr_140000 tr_140700 ', '0');
INSERT INTO `provinces` VALUES ('140728', '平遥县', '140700', '', '0', '0', 'P', '112.18245556381', '37.195600690703', '3', 'tr_0 tr_140000 tr_140700 ', '0');
INSERT INTO `provinces` VALUES ('140729', '灵石县', '140700', '', '0', '0', 'L', '111.78561787596', '36.85336750127', '3', 'tr_0 tr_140000 tr_140700 ', '0');
INSERT INTO `provinces` VALUES ('140781', '介休市', '140700', '', '0', '0', 'J', '111.92356319719', '37.032686403603', '3', 'tr_0 tr_140000 tr_140700 ', '0');
INSERT INTO `provinces` VALUES ('140802', '盐湖区', '140800', '', '0', '0', 'Y', '111.00437711462', '35.021425327829', '3', 'tr_0 tr_140000 tr_140800 ', '0');
INSERT INTO `provinces` VALUES ('140821', '临猗县', '140800', '', '0', '0', 'L', '110.78040700351', '35.149542242622', '3', 'tr_0 tr_140000 tr_140800 ', '0');
INSERT INTO `provinces` VALUES ('140822', '万荣县', '140800', '', '0', '0', 'W', '110.84457611016', '35.421108800536', '3', 'tr_0 tr_140000 tr_140800 ', '0');
INSERT INTO `provinces` VALUES ('140823', '闻喜县', '140800', '', '0', '0', 'W', '111.23141035768', '35.362931196381', '3', 'tr_0 tr_140000 tr_140800 ', '0');
INSERT INTO `provinces` VALUES ('140824', '稷山县', '140800', '', '0', '0', 'J', '110.98941457872', '35.610403569616', '3', 'tr_0 tr_140000 tr_140800 ', '0');
INSERT INTO `provinces` VALUES ('140825', '新绛县', '140800', '', '0', '0', 'X', '111.23140649497', '35.622630103082', '3', 'tr_0 tr_140000 tr_140800 ', '0');
INSERT INTO `provinces` VALUES ('140826', '绛县', '140800', '', '0', '0', 'J', '111.57548652056', '35.497276373896', '3', 'tr_0 tr_140000 tr_140800 ', '0');
INSERT INTO `provinces` VALUES ('140827', '垣曲县', '140800', '', '0', '0', 'Y', '111.67660670572', '35.303014517418', '3', 'tr_0 tr_140000 tr_140800 ', '0');
INSERT INTO `provinces` VALUES ('140828', '夏县', '140800', '', '0', '0', 'X', '111.2264314994', '35.147461779807', '3', 'tr_0 tr_140000 tr_140800 ', '0');
INSERT INTO `provinces` VALUES ('140829', '平陆县', '140800', '', '0', '0', 'P', '111.22348047596', '34.842925154581', '3', 'tr_0 tr_140000 tr_140800 ', '0');
INSERT INTO `provinces` VALUES ('140830', '芮城县', '140800', '', '0', '0', 'R', '110.7006115132', '34.699388110563', '3', 'tr_0 tr_140000 tr_140800 ', '0');
INSERT INTO `provinces` VALUES ('140881', '永济市', '140800', '', '0', '0', 'Y', '110.45457767131', '34.872829714714', '3', 'tr_0 tr_140000 tr_140800 ', '0');
INSERT INTO `provinces` VALUES ('140882', '河津市', '140800', '', '0', '0', 'H', '110.71857214373', '35.601926575322', '3', 'tr_0 tr_140000 tr_140800 ', '0');
INSERT INTO `provinces` VALUES ('140902', '忻府区', '140900', '', '0', '0', 'X', '112.75261366422', '38.40987981762', '3', 'tr_0 tr_140000 tr_140900 ', '0');
INSERT INTO `provinces` VALUES ('140921', '定襄县', '140900', '', '0', '0', 'D', '112.96352861152', '38.479974305847', '3', 'tr_0 tr_140000 tr_140900 ', '0');
INSERT INTO `provinces` VALUES ('140922', '五台县', '140900', '', '0', '0', 'W', '113.26145109492', '38.734181590565', '3', 'tr_0 tr_140000 tr_140900 ', '0');
INSERT INTO `provinces` VALUES ('140923', '代县', '140900', '', '0', '0', 'D', '112.96655194854', '39.072728346381', '3', 'tr_0 tr_140000 tr_140900 ', '0');
INSERT INTO `provinces` VALUES ('140924', '繁峙县', '140900', '', '0', '0', 'F', '113.27140827251', '39.195237430734', '3', 'tr_0 tr_140000 tr_140900 ', '0');
INSERT INTO `provinces` VALUES ('140925', '宁武县', '140900', '', '0', '0', 'N', '112.32639824212', '39.024342381431', '3', 'tr_0 tr_140000 tr_140900 ', '0');
INSERT INTO `provinces` VALUES ('140926', '静乐县', '140900', '', '0', '0', 'J', '111.94543190585', '38.365147088438', '3', 'tr_0 tr_140000 tr_140900 ', '0');
INSERT INTO `provinces` VALUES ('140927', '神池县', '140900', '', '0', '0', 'S', '112.21738276001', '39.096875824863', '3', 'tr_0 tr_140000 tr_140900 ', '0');
INSERT INTO `provinces` VALUES ('140928', '五寨县', '140900', '', '0', '0', 'W', '111.85340993856', '38.917019909692', '3', 'tr_0 tr_140000 tr_140900 ', '0');
INSERT INTO `provinces` VALUES ('140929', '岢岚县', '140900', '', '0', '0', 'K', '111.57947778177', '38.710151038936', '3', 'tr_0 tr_140000 tr_140900 ', '0');
INSERT INTO `provinces` VALUES ('140930', '河曲县', '140900', '', '0', '0', 'H', '111.14444863516', '39.390702488715', '3', 'tr_0 tr_140000 tr_140900 ', '0');
INSERT INTO `provinces` VALUES ('140931', '保德县', '140900', '', '0', '0', 'B', '111.09254175805', '39.028336932396', '3', 'tr_0 tr_140000 tr_140900 ', '0');
INSERT INTO `provinces` VALUES ('140932', '偏关县', '140900', '', '0', '0', 'P', '111.51447352049', '39.442230090387', '3', 'tr_0 tr_140000 tr_140900 ', '0');
INSERT INTO `provinces` VALUES ('140971', '五台山风景名胜区', '140900', '', '0', '0', 'W', '113.602695497', '38.983546253607', '3', 'tr_0 tr_140000 tr_140900 ', '0');
INSERT INTO `provinces` VALUES ('140981', '原平市', '140900', '', '0', '0', 'Y', '112.71748713403', '38.736475897605', '3', 'tr_0 tr_140000 tr_140900 ', '0');
INSERT INTO `provinces` VALUES ('141002', '尧都区', '141000', '', '0', '0', 'Y', '111.58643021727', '36.084562230192', '3', 'tr_0 tr_140000 tr_141000 ', '0');
INSERT INTO `provinces` VALUES ('141021', '曲沃县', '141000', '', '0', '0', 'Q', '111.48239637819', '35.647327335982', '3', 'tr_0 tr_140000 tr_141000 ', '0');
INSERT INTO `provinces` VALUES ('141022', '翼城县', '141000', '', '0', '0', 'Y', '111.72537553219', '35.744429075039', '3', 'tr_0 tr_140000 tr_141000 ', '0');
INSERT INTO `provinces` VALUES ('141023', '襄汾县', '141000', '', '0', '0', 'X', '111.44854005199', '35.882062670676', '3', 'tr_0 tr_140000 tr_141000 ', '0');
INSERT INTO `provinces` VALUES ('141024', '洪洞县', '141000', '', '0', '0', 'H', '111.68158942672', '36.259467079377', '3', 'tr_0 tr_140000 tr_141000 ', '0');
INSERT INTO `provinces` VALUES ('141025', '古县', '141000', '', '0', '0', 'G', '111.92657314947', '36.272338064827', '3', 'tr_0 tr_140000 tr_141000 ', '0');
INSERT INTO `provinces` VALUES ('141026', '安泽县', '141000', '', '0', '0', 'A', '112.2566128396', '36.153514380523', '3', 'tr_0 tr_140000 tr_141000 ', '0');
INSERT INTO `provinces` VALUES ('141027', '浮山县', '141000', '', '0', '0', 'F', '111.85538495306', '35.974392753943', '3', 'tr_0 tr_140000 tr_141000 ', '0');
INSERT INTO `provinces` VALUES ('141028', '吉县', '141000', '', '0', '0', 'J', '110.68854637189', '36.103999062021', '3', 'tr_0 tr_140000 tr_141000 ', '0');
INSERT INTO `provinces` VALUES ('141029', '乡宁县', '141000', '', '0', '0', 'X', '110.85349790083', '35.976441665474', '3', 'tr_0 tr_140000 tr_141000 ', '0');
INSERT INTO `provinces` VALUES ('141030', '大宁县', '141000', '', '0', '0', 'D', '110.75938440882', '36.471305687097', '3', 'tr_0 tr_140000 tr_141000 ', '0');
INSERT INTO `provinces` VALUES ('141031', '隰县', '141000', '', '0', '0', 'X', '110.94759127079', '36.699061383227', '3', 'tr_0 tr_140000 tr_141000 ', '0');
INSERT INTO `provinces` VALUES ('141032', '永和县', '141000', '', '0', '0', 'Y', '110.63841589393', '36.765908673933', '3', 'tr_0 tr_140000 tr_141000 ', '0');
INSERT INTO `provinces` VALUES ('141033', '蒲县', '141000', '', '0', '0', 'P', '111.10247405258', '36.418005429177', '3', 'tr_0 tr_140000 tr_141000 ', '0');
INSERT INTO `provinces` VALUES ('141034', '汾西县', '141000', '', '0', '0', 'F', '111.56954629571', '36.658782264232', '3', 'tr_0 tr_140000 tr_141000 ', '0');
INSERT INTO `provinces` VALUES ('141081', '侯马市', '141000', '', '0', '0', 'H', '111.37839658489', '35.625364816258', '3', 'tr_0 tr_140000 tr_141000 ', '0');
INSERT INTO `provinces` VALUES ('141082', '霍州市', '141000', '', '0', '0', 'H', '111.76150942218', '36.574606950709', '3', 'tr_0 tr_140000 tr_141000 ', '0');
INSERT INTO `provinces` VALUES ('141102', '离石区', '141100', '', '0', '0', 'L', '111.15749077354', '37.523577475907', '3', 'tr_0 tr_140000 tr_141100 ', '0');
INSERT INTO `provinces` VALUES ('141121', '文水县', '141100', '', '0', '0', 'W', '112.0355986926', '37.444300082651', '3', 'tr_0 tr_140000 tr_141100 ', '0');
INSERT INTO `provinces` VALUES ('141122', '交城县', '141100', '', '0', '0', 'J', '112.16256770864', '37.557772236259', '3', 'tr_0 tr_140000 tr_141100 ', '0');
INSERT INTO `provinces` VALUES ('141123', '兴县', '141100', '', '0', '0', 'X', '111.13439210498', '38.468803780991', '3', 'tr_0 tr_140000 tr_141100 ', '0');
INSERT INTO `provinces` VALUES ('141124', '临县', '141100', '', '0', '0', 'L', '110.99841488129', '37.957210672321', '3', 'tr_0 tr_140000 tr_141100 ', '0');
INSERT INTO `provinces` VALUES ('141125', '柳林县', '141100', '', '0', '0', 'L', '110.8953898393', '37.435492964934', '3', 'tr_0 tr_140000 tr_141100 ', '0');
INSERT INTO `provinces` VALUES ('141126', '石楼县', '141100', '', '0', '0', 'S', '110.84159553248', '37.004470503012', '3', 'tr_0 tr_140000 tr_141100 ', '0');
INSERT INTO `provinces` VALUES ('141127', '岚县', '141100', '', '0', '0', 'L', '111.67859223038', '38.28502878885', '3', 'tr_0 tr_140000 tr_141100 ', '0');
INSERT INTO `provinces` VALUES ('141128', '方山县', '141100', '', '0', '0', 'F', '111.25037044293', '37.90102023916', '3', 'tr_0 tr_140000 tr_141100 ', '0');
INSERT INTO `provinces` VALUES ('141129', '中阳县', '141100', '', '0', '0', 'Z', '111.18562956483', '37.36287279238', '3', 'tr_0 tr_140000 tr_141100 ', '0');
INSERT INTO `provinces` VALUES ('141130', '交口县', '141100', '', '0', '0', 'J', '111.18762820476', '36.987872666553', '3', 'tr_0 tr_140000 tr_141100 ', '0');
INSERT INTO `provinces` VALUES ('141181', '孝义市', '141100', '', '0', '0', 'X', '111.78560601833', '37.151063319102', '3', 'tr_0 tr_140000 tr_141100 ', '0');
INSERT INTO `provinces` VALUES ('141182', '汾阳市', '141100', '', '0', '0', 'F', '111.7945966192', '37.271291794518', '3', 'tr_0 tr_140000 tr_141100 ', '0');
INSERT INTO `provinces` VALUES ('150102', '新城区', '150100', '', '0', '0', 'X', '111.671620122', '40.863877021183', '3', 'tr_0 tr_150000 tr_150100 ', '0');
INSERT INTO `provinces` VALUES ('150103', '回民区', '150100', '', '0', '0', 'H', '111.63047018388', '40.814506362944', '3', 'tr_0 tr_150000 tr_150100 ', '0');
INSERT INTO `provinces` VALUES ('150104', '玉泉区', '150100', '', '0', '0', 'Y', '111.68157514366', '40.758058968635', '3', 'tr_0 tr_150000 tr_150100 ', '0');
INSERT INTO `provinces` VALUES ('150105', '赛罕区', '150100', '', '0', '0', 'S', '111.7084206445', '40.798394236975', '3', 'tr_0 tr_150000 tr_150100 ', '0');
INSERT INTO `provinces` VALUES ('150121', '土默特左旗', '150100', '', '0', '0', 'T', '111.16958672672', '40.735293711759', '3', 'tr_0 tr_150000 tr_150100 ', '0');
INSERT INTO `provinces` VALUES ('150122', '托克托县', '150100', '', '0', '0', 'T', '111.20057494309', '40.283146729007', '3', 'tr_0 tr_150000 tr_150100 ', '0');
INSERT INTO `provinces` VALUES ('150123', '和林格尔县', '150100', '', '0', '0', 'H', '111.82843021826', '40.384797744251', '3', 'tr_0 tr_150000 tr_150100 ', '0');
INSERT INTO `provinces` VALUES ('150124', '清水河县', '150100', '', '0', '0', 'Q', '111.65357648803', '39.926333854389', '3', 'tr_0 tr_150000 tr_150100 ', '0');
INSERT INTO `provinces` VALUES ('150125', '武川县', '150100', '', '0', '0', 'W', '111.45749705623', '41.102418723793', '3', 'tr_0 tr_150000 tr_150100 ', '0');
INSERT INTO `provinces` VALUES ('150171', '呼和浩特金海工业园区', '150100', '', '0', '0', 'H', '111.61859862741', '40.813484420815', '3', 'tr_0 tr_150000 tr_150100 ', '0');
INSERT INTO `provinces` VALUES ('150172', '呼和浩特经济技术开发区', '150100', '', '0', '0', 'H', '111.75550856171', '40.848422997113', '3', 'tr_0 tr_150000 tr_150100 ', '0');
INSERT INTO `provinces` VALUES ('150202', '东河区', '150200', '', '0', '0', 'D', '110.05039480879', '40.582228038324', '3', 'tr_0 tr_150000 tr_150200 ', '0');
INSERT INTO `provinces` VALUES ('150203', '昆都仑区', '150200', '', '0', '0', 'K', '109.84553830335', '40.647644106921', '3', 'tr_0 tr_150000 tr_150200 ', '0');
INSERT INTO `provinces` VALUES ('150204', '青山区', '150200', '', '0', '0', 'Q', '109.9074160123', '40.649473068783', '3', 'tr_0 tr_150000 tr_150200 ', '0');
INSERT INTO `provinces` VALUES ('150205', '石拐区', '150200', '', '0', '0', 'S', '110.27838088451', '40.67829939834', '3', 'tr_0 tr_150000 tr_150200 ', '0');
INSERT INTO `provinces` VALUES ('150206', '白云鄂博矿区', '150200', '', '0', '0', 'B', '109.97962576174', '41.774995234182', '3', 'tr_0 tr_150000 tr_150200 ', '0');
INSERT INTO `provinces` VALUES ('150207', '九原区', '150200', '', '0', '0', 'J', '109.96958800614', '40.613396589444', '3', 'tr_0 tr_150000 tr_150200 ', '0');
INSERT INTO `provinces` VALUES ('150221', '土默特右旗', '150200', '', '0', '0', 'T', '110.53038926652', '40.575127429108', '3', 'tr_0 tr_150000 tr_150200 ', '0');
INSERT INTO `provinces` VALUES ('150222', '固阳县', '150200', '', '0', '0', 'G', '110.06643261639', '41.040162852726', '3', 'tr_0 tr_150000 tr_150200 ', '0');
INSERT INTO `provinces` VALUES ('150223', '达尔罕茂明安联合旗', '150200', '', '0', '0', 'D', '110.43952090317', '41.704548551002', '3', 'tr_0 tr_150000 tr_150200 ', '0');
INSERT INTO `provinces` VALUES ('150271', '包头稀土高新技术产业开发区', '150200', '', '0', '0', 'B', '109.84664914794', '40.637085021364', '3', 'tr_0 tr_150000 tr_150200 ', '0');
INSERT INTO `provinces` VALUES ('150302', '海勃湾区', '150300', '', '0', '0', 'H', '106.82943856714', '39.696907993535', '3', 'tr_0 tr_150000 tr_150300 ', '0');
INSERT INTO `provinces` VALUES ('150303', '海南区', '150300', '', '0', '0', 'H', '106.89847100998', '39.446827515087', '3', 'tr_0 tr_150000 tr_150300 ', '0');
INSERT INTO `provinces` VALUES ('150304', '乌达区', '150300', '', '0', '0', 'W', '106.7326063535', '39.511468916129', '3', 'tr_0 tr_150000 tr_150300 ', '0');
INSERT INTO `provinces` VALUES ('150402', '红山区', '150400', '', '0', '0', 'H', '118.96356353651', '42.27047843525', '3', 'tr_0 tr_150000 tr_150400 ', '0');
INSERT INTO `provinces` VALUES ('150403', '元宝山区', '150400', '', '0', '0', 'Y', '119.29540450885', '42.045124715638', '3', 'tr_0 tr_150000 tr_150400 ', '0');
INSERT INTO `provinces` VALUES ('150404', '松山区', '150400', '', '0', '0', 'S', '118.9394138505', '42.292481572694', '3', 'tr_0 tr_150000 tr_150400 ', '0');
INSERT INTO `provinces` VALUES ('150421', '阿鲁科尔沁旗', '150400', '', '0', '0', 'A', '120.07261385472', '43.877953412182', '3', 'tr_0 tr_150000 tr_150400 ', '0');
INSERT INTO `provinces` VALUES ('150422', '巴林左旗', '150400', '', '0', '0', 'B', '119.38644328076', '43.97638259461', '3', 'tr_0 tr_150000 tr_150400 ', '0');
INSERT INTO `provinces` VALUES ('150423', '巴林右旗', '150400', '', '0', '0', 'B', '118.67039425705', '43.540131553108', '3', 'tr_0 tr_150000 tr_150400 ', '0');
INSERT INTO `provinces` VALUES ('150424', '林西县', '150400', '', '0', '0', 'L', '118.06246142182', '43.624210259291', '3', 'tr_0 tr_150000 tr_150400 ', '0');
INSERT INTO `provinces` VALUES ('150425', '克什克腾旗', '150400', '', '0', '0', 'K', '117.55162041051', '43.270757591896', '3', 'tr_0 tr_150000 tr_150400 ', '0');
INSERT INTO `provinces` VALUES ('150426', '翁牛特旗', '150400', '', '0', '0', 'W', '119.01250888002', '42.942019262236', '3', 'tr_0 tr_150000 tr_150400 ', '0');
INSERT INTO `provinces` VALUES ('150428', '喀喇沁旗', '150400', '', '0', '0', 'K', '118.7104736845', '41.932214335643', '3', 'tr_0 tr_150000 tr_150400 ', '0');
INSERT INTO `provinces` VALUES ('150429', '宁城县', '150400', '', '0', '0', 'N', '119.35060897566', '41.600245148269', '3', 'tr_0 tr_150000 tr_150400 ', '0');
INSERT INTO `provinces` VALUES ('150430', '敖汉旗', '150400', '', '0', '0', 'A', '119.92757793861', '42.296507085243', '3', 'tr_0 tr_150000 tr_150400 ', '0');
INSERT INTO `provinces` VALUES ('150502', '科尔沁区', '150500', '', '0', '0', 'K', '122.2624570337', '43.628712488829', '3', 'tr_0 tr_150000 tr_150500 ', '0');
INSERT INTO `provinces` VALUES ('150521', '科尔沁左翼中旗', '150500', '', '0', '0', 'K', '123.31858853365', '44.132294228308', '3', 'tr_0 tr_150000 tr_150500 ', '0');
INSERT INTO `provinces` VALUES ('150522', '科尔沁左翼后旗', '150500', '', '0', '0', 'K', '122.36356257648', '42.93956249402', '3', 'tr_0 tr_150000 tr_150500 ', '0');
INSERT INTO `provinces` VALUES ('150523', '开鲁县', '150500', '', '0', '0', 'K', '121.32538568843', '43.606369431362', '3', 'tr_0 tr_150000 tr_150500 ', '0');
INSERT INTO `provinces` VALUES ('150524', '库伦旗', '150500', '', '0', '0', 'K', '121.81740576201', '42.741211100235', '3', 'tr_0 tr_150000 tr_150500 ', '0');
INSERT INTO `provinces` VALUES ('150525', '奈曼旗', '150500', '', '0', '0', 'N', '120.66464641294', '42.87184654666', '3', 'tr_0 tr_150000 tr_150500 ', '0');
INSERT INTO `provinces` VALUES ('150526', '扎鲁特旗', '150500', '', '0', '0', 'Z', '120.91862585689', '44.562213133099', '3', 'tr_0 tr_150000 tr_150500 ', '0');
INSERT INTO `provinces` VALUES ('150571', '通辽经济技术开发区', '150500', '', '0', '0', 'T', '122.22276854881', '43.676026521565', '3', 'tr_0 tr_150000 tr_150500 ', '0');
INSERT INTO `provinces` VALUES ('150581', '霍林郭勒市', '150500', '', '0', '0', 'H', '119.67046591394', '45.53751332061', '3', 'tr_0 tr_150000 tr_150500 ', '0');
INSERT INTO `provinces` VALUES ('130100', '石家庄市', '130000', '', '0', '0', 'S', '114.52153190157', '38.048311926873', '2', 'tr_0 tr_130000 ', '0');
INSERT INTO `provinces` VALUES ('130200', '唐山市', '130000', '', '0', '0', 'T', '118.18645947204', '39.636583724147', '2', 'tr_0 tr_130000 ', '0');
INSERT INTO `provinces` VALUES ('130300', '秦皇岛市', '130000', '', '0', '0', 'Q', '119.60853063334', '39.941748102378', '2', 'tr_0 tr_130000 ', '0');
INSERT INTO `provinces` VALUES ('130400', '邯郸市', '130000', '', '0', '0', 'H', '114.54562822824', '36.631262731204', '2', 'tr_0 tr_130000 ', '0');
INSERT INTO `provinces` VALUES ('130500', '邢台市', '130000', '', '0', '0', 'X', '114.51146225613', '37.076685950966', '2', 'tr_0 tr_130000 ', '0');
INSERT INTO `provinces` VALUES ('130600', '保定市', '130000', '', '0', '0', 'B', '115.47146383769', '38.879987768455', '2', 'tr_0 tr_130000 ', '0');
INSERT INTO `provinces` VALUES ('130700', '张家口市', '130000', '', '0', '0', 'Z', '114.89257223145', '40.773237202691', '2', 'tr_0 tr_130000 ', '0');
INSERT INTO `provinces` VALUES ('130800', '承德市', '130000', '', '0', '0', 'C', '117.96939750997', '40.957856012338', '2', 'tr_0 tr_130000 ', '0');
INSERT INTO `provinces` VALUES ('130900', '沧州市', '130000', '', '0', '0', 'C', '116.84558075595', '38.310215141107', '2', 'tr_0 tr_130000 ', '0');
INSERT INTO `provinces` VALUES ('131000', '廊坊市', '130000', '', '0', '0', 'L', '116.69058173343', '39.543366662759', '2', 'tr_0 tr_130000 ', '0');
INSERT INTO `provinces` VALUES ('131100', '衡水市', '130000', '', '0', '0', 'H', '115.67540613762', '37.745191408077', '2', 'tr_0 tr_130000 ', '0');
INSERT INTO `provinces` VALUES ('150602', '东胜区', '150600', '', '0', '0', 'D', '109.96956006883', '39.827986984444', '3', 'tr_0 tr_150000 tr_150600 ', '0');
INSERT INTO `provinces` VALUES ('150603', '康巴什区', '150600', '', '0', '0', 'K', '109.86962735373', '39.616378146766', '3', 'tr_0 tr_150000 tr_150600 ', '0');
INSERT INTO `provinces` VALUES ('150621', '达拉特旗', '150600', '', '0', '0', 'D', '110.04036612608', '40.418907154391', '3', 'tr_0 tr_150000 tr_150600 ', '0');
INSERT INTO `provinces` VALUES ('150622', '准格尔旗', '150600', '', '0', '0', 'Z', '111.24639840546', '39.870540265037', '3', 'tr_0 tr_150000 tr_150600 ', '0');
INSERT INTO `provinces` VALUES ('150623', '鄂托克前旗', '150600', '', '0', '0', 'E', '107.48458472303', '38.188216741284', '3', 'tr_0 tr_150000 tr_150600 ', '0');
INSERT INTO `provinces` VALUES ('150624', '鄂托克旗', '150600', '', '0', '0', 'E', '107.98244495023', '39.095293413608', '3', 'tr_0 tr_150000 tr_150600 ', '0');
INSERT INTO `provinces` VALUES ('150625', '杭锦旗', '150600', '', '0', '0', 'H', '108.74241293879', '39.838815768815', '3', 'tr_0 tr_150000 tr_150600 ', '0');
INSERT INTO `provinces` VALUES ('150626', '乌审旗', '150600', '', '0', '0', 'W', '108.82443496914', '38.610026521177', '3', 'tr_0 tr_150000 tr_150600 ', '0');
INSERT INTO `provinces` VALUES ('150627', '伊金霍洛旗', '150600', '', '0', '0', 'Y', '109.78744317924', '39.614482313949', '3', 'tr_0 tr_150000 tr_150600 ', '0');
INSERT INTO `provinces` VALUES ('150702', '海拉尔区', '150700', '', '0', '0', 'H', '119.74246537006', '49.218215799363', '3', 'tr_0 tr_150000 tr_150700 ', '0');
INSERT INTO `provinces` VALUES ('150703', '扎赉诺尔区', '150700', '', '0', '0', 'Z', '117.69453227349', '49.467770183628', '3', 'tr_0 tr_150000 tr_150700 ', '0');
INSERT INTO `provinces` VALUES ('150721', '阿荣旗', '150700', '', '0', '0', 'A', '123.46544000531', '48.131971245042', '3', 'tr_0 tr_150000 tr_150700 ', '0');
INSERT INTO `provinces` VALUES ('150722', '莫力达瓦达斡尔族自治旗', '150700', '', '0', '0', 'M', '124.52557642071', '48.482896292115', '3', 'tr_0 tr_150000 tr_150700 ', '0');
INSERT INTO `provinces` VALUES ('150723', '鄂伦春自治旗', '150700', '', '0', '0', 'E', '123.73234507742', '50.597947928064', '3', 'tr_0 tr_150000 tr_150700 ', '0');
INSERT INTO `provinces` VALUES ('150724', '鄂温克族自治旗', '150700', '', '0', '0', 'E', '119.76135125527', '49.15304476395', '3', 'tr_0 tr_150000 tr_150700 ', '0');
INSERT INTO `provinces` VALUES ('150725', '陈巴尔虎旗', '150700', '', '0', '0', 'C', '119.43046248677', '49.334914288885', '3', 'tr_0 tr_150000 tr_150700 ', '0');
INSERT INTO `provinces` VALUES ('150726', '新巴尔虎左旗', '150700', '', '0', '0', 'X', '118.27660837276', '48.223786760037', '3', 'tr_0 tr_150000 tr_150700 ', '0');
INSERT INTO `provinces` VALUES ('150727', '新巴尔虎右旗', '150700', '', '0', '0', 'X', '116.83063240352', '48.677053599089', '3', 'tr_0 tr_150000 tr_150700 ', '0');
INSERT INTO `provinces` VALUES ('150781', '满洲里市', '150700', '', '0', '0', 'M', '117.38543585768', '49.604098854866', '3', 'tr_0 tr_150000 tr_150700 ', '0');
INSERT INTO `provinces` VALUES ('150782', '牙克石市', '150700', '', '0', '0', 'Y', '120.7183468371', '49.292023693206', '3', 'tr_0 tr_150000 tr_150700 ', '0');
INSERT INTO `provinces` VALUES ('150783', '扎兰屯市', '150700', '', '0', '0', 'Z', '122.74445371486', '48.01995552011', '3', 'tr_0 tr_150000 tr_150700 ', '0');
INSERT INTO `provinces` VALUES ('150784', '额尔古纳市', '150700', '', '0', '0', 'E', '120.18663369726', '50.248131758636', '3', 'tr_0 tr_150000 tr_150700 ', '0');
INSERT INTO `provinces` VALUES ('150785', '根河市', '150700', '', '0', '0', 'G', '121.52758526594', '50.786140434318', '3', 'tr_0 tr_150000 tr_150700 ', '0');
INSERT INTO `provinces` VALUES ('150802', '临河区', '150800', '', '0', '0', 'L', '107.36953379568', '40.75668072584', '3', 'tr_0 tr_150000 tr_150800 ', '0');
INSERT INTO `provinces` VALUES ('150821', '五原县', '150800', '', '0', '0', 'W', '108.2734913541', '41.094454821479', '3', 'tr_0 tr_150000 tr_150800 ', '0');
INSERT INTO `provinces` VALUES ('150822', '磴口县', '150800', '', '0', '0', 'D', '107.01452247', '40.336470177103', '3', 'tr_0 tr_150000 tr_150800 ', '0');
INSERT INTO `provinces` VALUES ('150823', '乌拉特前旗', '150800', '', '0', '0', 'W', '108.6586151381', '40.742103512928', '3', 'tr_0 tr_150000 tr_150800 ', '0');
INSERT INTO `provinces` VALUES ('150824', '乌拉特中旗', '150800', '', '0', '0', 'W', '108.51951244005', '41.593346263746', '3', 'tr_0 tr_150000 tr_150800 ', '0');
INSERT INTO `provinces` VALUES ('150825', '乌拉特后旗', '150800', '', '0', '0', 'W', '107.08154612207', '41.089422269258', '3', 'tr_0 tr_150000 tr_150800 ', '0');
INSERT INTO `provinces` VALUES ('150826', '杭锦后旗', '150800', '', '0', '0', 'H', '107.15737244949', '40.892179419823', '3', 'tr_0 tr_150000 tr_150800 ', '0');
INSERT INTO `provinces` VALUES ('150902', '集宁区', '150900', '', '0', '0', 'J', '113.12058699942', '41.041146171787', '3', 'tr_0 tr_150000 tr_150900 ', '0');
INSERT INTO `provinces` VALUES ('150921', '卓资县', '150900', '', '0', '0', 'Z', '112.5844095507', '40.900291837834', '3', 'tr_0 tr_150000 tr_150900 ', '0');
INSERT INTO `provinces` VALUES ('150922', '化德县', '150900', '', '0', '0', 'H', '114.0164087845', '41.909602587109', '3', 'tr_0 tr_150000 tr_150900 ', '0');
INSERT INTO `provinces` VALUES ('150923', '商都县', '150900', '', '0', '0', 'S', '113.58463922926', '41.567566637224', '3', 'tr_0 tr_150000 tr_150900 ', '0');
INSERT INTO `provinces` VALUES ('150924', '兴和县', '150900', '', '0', '0', 'X', '113.84057886567', '40.879341798933', '3', 'tr_0 tr_150000 tr_150900 ', '0');
INSERT INTO `provinces` VALUES ('150925', '凉城县', '150900', '', '0', '0', 'L', '112.51060018864', '40.5371631252', '3', 'tr_0 tr_150000 tr_150900 ', '0');
INSERT INTO `provinces` VALUES ('150926', '察哈尔右翼前旗', '150900', '', '0', '0', 'C', '113.22160531673', '40.791267302593', '3', 'tr_0 tr_150000 tr_150900 ', '0');
INSERT INTO `provinces` VALUES ('150927', '察哈尔右翼中旗', '150900', '', '0', '0', 'C', '112.64258040196', '41.283272943291', '3', 'tr_0 tr_150000 tr_150900 ', '0');
INSERT INTO `provinces` VALUES ('150928', '察哈尔右翼后旗', '150900', '', '0', '0', 'C', '113.19853090242', '41.441770999655', '3', 'tr_0 tr_150000 tr_150900 ', '0');
INSERT INTO `provinces` VALUES ('150929', '四子王旗', '150900', '', '0', '0', 'S', '111.71241927182', '41.539353349915', '3', 'tr_0 tr_150000 tr_150900 ', '0');
INSERT INTO `provinces` VALUES ('150981', '丰镇市', '150900', '', '0', '0', 'F', '113.11660121788', '40.441804808844', '3', 'tr_0 tr_150000 tr_150900 ', '0');
INSERT INTO `provinces` VALUES ('152201', '乌兰浩特市', '152200', '', '0', '0', 'W', '122.09962235198', '46.078654343582', '3', 'tr_0 tr_150000 tr_152200 ', '0');
INSERT INTO `provinces` VALUES ('152202', '阿尔山市', '152200', '', '0', '0', 'A', '119.95065315166', '47.18305415375', '3', 'tr_0 tr_150000 tr_152200 ', '0');
INSERT INTO `provinces` VALUES ('152221', '科尔沁右翼前旗', '152200', '', '0', '0', 'K', '121.9645531355', '46.082648853819', '3', 'tr_0 tr_150000 tr_152200 ', '0');
INSERT INTO `provinces` VALUES ('152222', '科尔沁右翼中旗', '152200', '', '0', '0', 'K', '121.48354781458', '45.066470993428', '3', 'tr_0 tr_150000 tr_152200 ', '0');
INSERT INTO `provinces` VALUES ('152223', '扎赉特旗', '152200', '', '0', '0', 'Z', '122.90644442883', '46.729189539358', '3', 'tr_0 tr_150000 tr_152200 ', '0');
INSERT INTO `provinces` VALUES ('152224', '突泉县', '152200', '', '0', '0', 'T', '121.60054536997', '45.387830342585', '3', 'tr_0 tr_150000 tr_152200 ', '0');
INSERT INTO `provinces` VALUES ('152501', '二连浩特市', '152500', '', '0', '0', 'E', '111.95836319333', '43.648800184052', '3', 'tr_0 tr_150000 tr_152500 ', '0');
INSERT INTO `provinces` VALUES ('152502', '锡林浩特市', '152500', '', '0', '0', 'X', '116.09361388474', '43.93833380136', '3', 'tr_0 tr_150000 tr_152500 ', '0');
INSERT INTO `provinces` VALUES ('152522', '阿巴嘎旗', '152500', '', '0', '0', 'A', '114.95736709772', '44.028101587023', '3', 'tr_0 tr_150000 tr_152500 ', '0');
INSERT INTO `provinces` VALUES ('152523', '苏尼特左旗', '152500', '', '0', '0', 'S', '113.67347993742', '43.865553657792', '3', 'tr_0 tr_150000 tr_152500 ', '0');
INSERT INTO `provinces` VALUES ('152524', '苏尼特右旗', '152500', '', '0', '0', 'S', '112.64856904548', '42.747368922463', '3', 'tr_0 tr_150000 tr_152500 ', '0');
INSERT INTO `provinces` VALUES ('152525', '东乌珠穆沁旗', '152500', '', '0', '0', 'D', '116.97850435996', '45.515743305312', '3', 'tr_0 tr_150000 tr_152500 ', '0');
INSERT INTO `provinces` VALUES ('152526', '西乌珠穆沁旗', '152500', '', '0', '0', 'X', '117.61637700896', '44.593802912007', '3', 'tr_0 tr_150000 tr_152500 ', '0');
INSERT INTO `provinces` VALUES ('152527', '太仆寺旗', '152500', '', '0', '0', 'T', '115.29053531645', '41.882291746043', '3', 'tr_0 tr_150000 tr_152500 ', '0');
INSERT INTO `provinces` VALUES ('152528', '镶黄旗', '152500', '', '0', '0', 'X', '113.85450538582', '42.237661285279', '3', 'tr_0 tr_150000 tr_152500 ', '0');
INSERT INTO `provinces` VALUES ('152529', '正镶白旗', '152500', '', '0', '0', 'Z', '115.03662171828', '42.292605429249', '3', 'tr_0 tr_150000 tr_152500 ', '0');
INSERT INTO `provinces` VALUES ('152530', '正蓝旗', '152500', '', '0', '0', 'Z', '115.99860388383', '42.247118844188', '3', 'tr_0 tr_150000 tr_152500 ', '0');
INSERT INTO `provinces` VALUES ('152531', '多伦县', '152500', '', '0', '0', 'D', '116.49250878204', '42.208920864211', '3', 'tr_0 tr_150000 tr_152500 ', '0');
INSERT INTO `provinces` VALUES ('152571', '乌拉盖管委会', '152500', '', '0', '0', 'W', '114.09790153324', '42.80523252057', '3', 'tr_0 tr_150000 tr_152500 ', '0');
INSERT INTO `provinces` VALUES ('152921', '阿拉善左旗', '152900', '', '0', '0', 'A', '105.67259866528', '38.839094137436', '3', 'tr_0 tr_150000 tr_152900 ', '0');
INSERT INTO `provinces` VALUES ('152922', '阿拉善右旗', '152900', '', '0', '0', 'A', '101.67346389594', '39.222240969855', '3', 'tr_0 tr_150000 tr_152900 ', '0');
INSERT INTO `provinces` VALUES ('152923', '额济纳旗', '152900', '', '0', '0', 'E', '101.06240334058', '41.960297611813', '3', 'tr_0 tr_150000 tr_152900 ', '0');
INSERT INTO `provinces` VALUES ('152971', '内蒙古阿拉善经济开发区', '152900', '', '0', '0', 'N', '105.77197191571', '40.314622117574', '3', 'tr_0 tr_150000 tr_152900 ', '0');
INSERT INTO `provinces` VALUES ('210102', '和平区', '210100', '', '0', '0', 'H', '123.42664426615', '41.795236052902', '3', 'tr_0 tr_210000 tr_210100 ', '0');
INSERT INTO `provinces` VALUES ('210103', '沈河区', '210100', '', '0', '0', 'S', '123.46546103538', '41.802274138805', '3', 'tr_0 tr_210000 tr_210100 ', '0');
INSERT INTO `provinces` VALUES ('210104', '大东区', '210100', '', '0', '0', 'D', '123.47640473208', '41.811425174494', '3', 'tr_0 tr_210000 tr_210100 ', '0');
INSERT INTO `provinces` VALUES ('210105', '皇姑区', '210100', '', '0', '0', 'H', '123.43162078885', '41.826042120277', '3', 'tr_0 tr_210000 tr_210100 ', '0');
INSERT INTO `provinces` VALUES ('210106', '铁西区', '210100', '', '0', '0', 'T', '123.38343595078', '41.809037832217', '3', 'tr_0 tr_210000 tr_210100 ', '0');
INSERT INTO `provinces` VALUES ('210111', '苏家屯区', '210100', '', '0', '0', 'S', '123.35043463177', '41.671253644959', '3', 'tr_0 tr_210000 tr_210100 ', '0');
INSERT INTO `provinces` VALUES ('210112', '浑南区', '210100', '', '0', '0', 'H', '123.45598993089', '41.720915668889', '3', 'tr_0 tr_210000 tr_210100 ', '0');
INSERT INTO `provinces` VALUES ('210113', '沈北新区', '210100', '', '0', '0', 'S', '123.53360460492', '42.058914115763', '3', 'tr_0 tr_210000 tr_210100 ', '0');
INSERT INTO `provinces` VALUES ('210114', '于洪区', '210100', '', '0', '0', 'Y', '123.31463302499', '41.799668255615', '3', 'tr_0 tr_210000 tr_210100 ', '0');
INSERT INTO `provinces` VALUES ('210115', '辽中区', '210100', '', '0', '0', 'L', '122.77237835983', '41.523149081842', '3', 'tr_0 tr_210000 tr_210100 ', '0');
INSERT INTO `provinces` VALUES ('210123', '康平县', '210100', '', '0', '0', 'K', '123.33751124938', '42.749925495719', '3', 'tr_0 tr_210000 tr_210100 ', '0');
INSERT INTO `provinces` VALUES ('210124', '法库县', '210100', '', '0', '0', 'F', '123.41462107572', '42.509606549903', '3', 'tr_0 tr_210000 tr_210100 ', '0');
INSERT INTO `provinces` VALUES ('210181', '新民市', '210100', '', '0', '0', 'X', '122.87539513741', '42.007109320665', '3', 'tr_0 tr_210000 tr_210100 ', '0');
INSERT INTO `provinces` VALUES ('210202', '中山区', '210200', '', '0', '0', 'Z', '121.65154739367', '38.924511115496', '3', 'tr_0 tr_210000 tr_210200 ', '0');
INSERT INTO `provinces` VALUES ('210203', '西岗区', '210200', '', '0', '0', 'X', '121.61862512554', '38.920472689273', '3', 'tr_0 tr_210000 tr_210200 ', '0');
INSERT INTO `provinces` VALUES ('210204', '沙河口区', '210200', '', '0', '0', 'S', '121.59450670057', '38.913544290956', '3', 'tr_0 tr_210000 tr_210200 ', '0');
INSERT INTO `provinces` VALUES ('210211', '甘井子区', '210200', '', '0', '0', 'G', '121.5315189555', '38.958002162932', '3', 'tr_0 tr_210000 tr_210200 ', '0');
INSERT INTO `provinces` VALUES ('210212', '旅顺口区', '210200', '', '0', '0', 'L', '121.26859688019', '38.856832222859', '3', 'tr_0 tr_210000 tr_210200 ', '0');
INSERT INTO `provinces` VALUES ('210213', '金州区', '210200', '', '0', '0', 'J', '121.78943558267', '39.056432991661', '3', 'tr_0 tr_210000 tr_210200 ', '0');
INSERT INTO `provinces` VALUES ('210214', '普兰店区', '210200', '', '0', '0', 'P', '121.94645983497', '39.398089145183', '3', 'tr_0 tr_210000 tr_210200 ', '0');
INSERT INTO `provinces` VALUES ('210224', '长海县', '210200', '', '0', '0', 'Z', '122.59462651637', '39.278270217167', '3', 'tr_0 tr_210000 tr_210200 ', '0');
INSERT INTO `provinces` VALUES ('210281', '瓦房店市', '210200', '', '0', '0', 'W', '121.98563754334', '39.632740747388', '3', 'tr_0 tr_210000 tr_210200 ', '0');
INSERT INTO `provinces` VALUES ('210283', '庄河市', '210200', '', '0', '0', 'Z', '122.97449548263', '39.686956078878', '3', 'tr_0 tr_210000 tr_210200 ', '0');
INSERT INTO `provinces` VALUES ('210302', '铁东区', '210300', '', '0', '0', 'T', '122.99739966805', '41.096331870506', '3', 'tr_0 tr_210000 tr_210300 ', '0');
INSERT INTO `provinces` VALUES ('210303', '铁西区', '210300', '', '0', '0', 'T', '122.97549026615', '41.125475259583', '3', 'tr_0 tr_210000 tr_210300 ', '0');
INSERT INTO `provinces` VALUES ('210304', '立山区', '210300', '', '0', '0', 'L', '123.03548413862', '41.156116121102', '3', 'tr_0 tr_210000 tr_210300 ', '0');
INSERT INTO `provinces` VALUES ('210311', '千山区', '210300', '', '0', '0', 'Q', '122.96757421833', '41.080938608935', '3', 'tr_0 tr_210000 tr_210300 ', '0');
INSERT INTO `provinces` VALUES ('210321', '台安县', '210300', '', '0', '0', 'T', '122.44255004099', '41.418590371099', '3', 'tr_0 tr_210000 tr_210300 ', '0');
INSERT INTO `provinces` VALUES ('210323', '岫岩满族自治县', '210300', '', '0', '0', 'X', '123.28754677827', '40.295892396362', '3', 'tr_0 tr_210000 tr_210300 ', '0');
INSERT INTO `provinces` VALUES ('210381', '海城市', '210300', '', '0', '0', 'H', '122.69156940124', '40.887633947097', '3', 'tr_0 tr_210000 tr_210300 ', '0');
INSERT INTO `provinces` VALUES ('210402', '新抚区', '210400', '', '0', '0', 'X', '123.91958231814', '41.867805858593', '3', 'tr_0 tr_210000 tr_210400 ', '0');
INSERT INTO `provinces` VALUES ('210403', '东洲区', '210400', '', '0', '0', 'D', '124.04554972353', '41.859190936634', '3', 'tr_0 tr_210000 tr_210400 ', '0');
INSERT INTO `provinces` VALUES ('210404', '望花区', '210400', '', '0', '0', 'W', '123.790604152', '41.859030362749', '3', 'tr_0 tr_210000 tr_210400 ', '0');
INSERT INTO `provinces` VALUES ('210411', '顺城区', '210400', '', '0', '0', 'S', '123.95141404338', '41.889163788467', '3', 'tr_0 tr_210000 tr_210400 ', '0');
INSERT INTO `provinces` VALUES ('210421', '抚顺县', '210400', '', '0', '0', 'F', '123.92159012079', '41.887037475382', '3', 'tr_0 tr_210000 tr_210400 ', '0');
INSERT INTO `provinces` VALUES ('210422', '新宾满族自治县', '210400', '', '0', '0', 'X', '125.04635620406', '41.739968775071', '3', 'tr_0 tr_210000 tr_210400 ', '0');
INSERT INTO `provinces` VALUES ('210423', '清原满族自治县', '210400', '', '0', '0', 'Q', '124.93036025933', '42.106760992634', '3', 'tr_0 tr_210000 tr_210400 ', '0');
INSERT INTO `provinces` VALUES ('210502', '平山区', '210500', '', '0', '0', 'P', '123.77461422409', '41.301604181774', '3', 'tr_0 tr_210000 tr_210500 ', '0');
INSERT INTO `provinces` VALUES ('210503', '溪湖区', '210500', '', '0', '0', 'X', '123.77461054104', '41.334802931364', '3', 'tr_0 tr_210000 tr_210500 ', '0');
INSERT INTO `provinces` VALUES ('210504', '明山区', '210500', '', '0', '0', 'M', '123.82347449807', '41.314939368877', '3', 'tr_0 tr_210000 tr_210500 ', '0');
INSERT INTO `provinces` VALUES ('210505', '南芬区', '210500', '', '0', '0', 'N', '123.75146713686', '41.10709572322', '3', 'tr_0 tr_210000 tr_210500 ', '0');
INSERT INTO `provinces` VALUES ('210521', '本溪满族自治县', '210500', '', '0', '0', 'B', '124.12758486914', '41.307902881353', '3', 'tr_0 tr_210000 tr_210500 ', '0');
INSERT INTO `provinces` VALUES ('210522', '桓仁满族自治县', '210500', '', '0', '0', 'H', '125.36754435102', '41.27292530103', '3', 'tr_0 tr_210000 tr_210500 ', '0');
INSERT INTO `provinces` VALUES ('210602', '元宝区', '210600', '', '0', '0', 'Y', '124.40258403322', '40.142251463139', '3', 'tr_0 tr_210000 tr_210600 ', '0');
INSERT INTO `provinces` VALUES ('210603', '振兴区', '210600', '', '0', '0', 'Z', '124.36657851109', '40.110719472216', '3', 'tr_0 tr_210000 tr_210600 ', '0');
INSERT INTO `provinces` VALUES ('210604', '振安区', '210600', '', '0', '0', 'Z', '124.43438692285', '40.164697025661', '3', 'tr_0 tr_210000 tr_210600 ', '0');
INSERT INTO `provinces` VALUES ('210624', '宽甸满族自治县', '210600', '', '0', '0', 'K', '124.79042662868', '40.73755320049', '3', 'tr_0 tr_210000 tr_210600 ', '0');
INSERT INTO `provinces` VALUES ('210681', '东港市', '210600', '', '0', '0', 'D', '124.15961035888', '39.867716187286', '3', 'tr_0 tr_210000 tr_210600 ', '0');
INSERT INTO `provinces` VALUES ('210682', '凤城市', '210600', '', '0', '0', 'F', '124.07242172439', '40.459180482456', '3', 'tr_0 tr_210000 tr_210600 ', '0');
INSERT INTO `provinces` VALUES ('210702', '古塔区', '210700', '', '0', '0', 'G', '121.13458496929', '41.122900925898', '3', 'tr_0 tr_210000 tr_210700 ', '0');
INSERT INTO `provinces` VALUES ('210703', '凌河区', '210700', '', '0', '0', 'L', '121.15759003442', '41.120690614472', '3', 'tr_0 tr_210000 tr_210700 ', '0');
INSERT INTO `provinces` VALUES ('210711', '太和区', '210700', '', '0', '0', 'T', '121.1104532494', '41.115109307132', '3', 'tr_0 tr_210000 tr_210700 ', '0');
INSERT INTO `provinces` VALUES ('210726', '黑山县', '210700', '', '0', '0', 'H', '122.13055703906', '41.671592983776', '3', 'tr_0 tr_210000 tr_210700 ', '0');
INSERT INTO `provinces` VALUES ('210727', '义县', '210700', '', '0', '0', 'Y', '121.24556854895', '41.538938862271', '3', 'tr_0 tr_210000 tr_210700 ', '0');
INSERT INTO `provinces` VALUES ('210781', '凌海市', '210700', '', '0', '0', 'L', '121.36253879584', '41.166487628588', '3', 'tr_0 tr_210000 tr_210700 ', '0');
INSERT INTO `provinces` VALUES ('210782', '北镇市', '210700', '', '0', '0', 'B', '121.78344729848', '41.594428096803', '3', 'tr_0 tr_210000 tr_210700 ', '0');
INSERT INTO `provinces` VALUES ('210802', '站前区', '210800', '', '0', '0', 'Z', '122.26543743173', '40.678764125936', '3', 'tr_0 tr_210000 tr_210800 ', '0');
INSERT INTO `provinces` VALUES ('210803', '西市区', '210800', '', '0', '0', 'X', '122.21358238684', '40.672110926311', '3', 'tr_0 tr_210000 tr_210800 ', '0');
INSERT INTO `provinces` VALUES ('210804', '鲅鱼圈区', '210800', '', '0', '0', 'B', '122.12757349697', '40.232339850773', '3', 'tr_0 tr_210000 tr_210800 ', '0');
INSERT INTO `provinces` VALUES ('210811', '老边区', '210800', '', '0', '0', 'L', '122.38643918392', '40.686383619803', '3', 'tr_0 tr_210000 tr_210800 ', '0');
INSERT INTO `provinces` VALUES ('210881', '盖州市', '210800', '', '0', '0', 'G', '122.35559128288', '40.406167457268', '3', 'tr_0 tr_210000 tr_210800 ', '0');
INSERT INTO `provinces` VALUES ('210882', '大石桥市', '210800', '', '0', '0', 'D', '122.5153795314', '40.650802164815', '3', 'tr_0 tr_210000 tr_210800 ', '0');
INSERT INTO `provinces` VALUES ('210902', '海州区', '210900', '', '0', '0', 'H', '121.66943571061', '42.023734789385', '3', 'tr_0 tr_210000 tr_210900 ', '0');
INSERT INTO `provinces` VALUES ('210903', '新邱区', '210900', '', '0', '0', 'X', '121.79936338568', '42.093934514765', '3', 'tr_0 tr_210000 tr_210900 ', '0');
INSERT INTO `provinces` VALUES ('210904', '太平区', '210900', '', '0', '0', 'T', '121.68538413681', '42.016967854141', '3', 'tr_0 tr_210000 tr_210900 ', '0');
INSERT INTO `provinces` VALUES ('210905', '清河门区', '210900', '', '0', '0', 'Q', '121.42247894964', '41.789318551009', '3', 'tr_0 tr_210000 tr_210900 ', '0');
INSERT INTO `provinces` VALUES ('210911', '细河区', '210900', '', '0', '0', 'X', '121.68639230508', '42.03187124588', '3', 'tr_0 tr_210000 tr_210900 ', '0');
INSERT INTO `provinces` VALUES ('210921', '阜新蒙古族自治县', '210900', '', '0', '0', 'F', '121.76357399585', '42.071368153837', '3', 'tr_0 tr_210000 tr_210900 ', '0');
INSERT INTO `provinces` VALUES ('210922', '彰武县', '210900', '', '0', '0', 'Z', '122.54544932021', '42.392706534364', '3', 'tr_0 tr_210000 tr_210900 ', '0');
INSERT INTO `provinces` VALUES ('211002', '白塔区', '211000', '', '0', '0', 'B', '123.18060844799', '41.275845361792', '3', 'tr_0 tr_210000 tr_211000 ', '0');
INSERT INTO `provinces` VALUES ('211003', '文圣区', '211000', '', '0', '0', 'W', '123.19160469557', '41.268438007815', '3', 'tr_0 tr_210000 tr_211000 ', '0');
INSERT INTO `provinces` VALUES ('211004', '宏伟区', '211000', '', '0', '0', 'H', '123.20358018598', '41.223368108445', '3', 'tr_0 tr_210000 tr_211000 ', '0');
INSERT INTO `provinces` VALUES ('211005', '弓长岭区', '211000', '', '0', '0', 'G', '123.42661543055', '41.157327042722', '3', 'tr_0 tr_210000 tr_211000 ', '0');
INSERT INTO `provinces` VALUES ('211011', '太子河区', '211000', '', '0', '0', 'T', '123.188604445', '41.259226178044', '3', 'tr_0 tr_210000 tr_211000 ', '0');
INSERT INTO `provinces` VALUES ('211021', '辽阳县', '211000', '', '0', '0', 'L', '123.1124212208', '41.211678771808', '3', 'tr_0 tr_210000 tr_211000 ', '0');
INSERT INTO `provinces` VALUES ('211081', '灯塔市', '211000', '', '0', '0', 'D', '123.34546215145', '41.432474125926', '3', 'tr_0 tr_210000 tr_211000 ', '0');
INSERT INTO `provinces` VALUES ('211102', '双台子区', '211100', '', '0', '0', 'S', '122.04639299922', '41.206071617512', '3', 'tr_0 tr_210000 tr_211100 ', '0');
INSERT INTO `provinces` VALUES ('211103', '兴隆台区', '211100', '', '0', '0', 'X', '121.96962911034', '41.155830887559', '3', 'tr_0 tr_210000 tr_211100 ', '0');
INSERT INTO `provinces` VALUES ('211104', '大洼区', '211100', '', '0', '0', 'D', '122.08855478867', '41.00817878896', '3', 'tr_0 tr_210000 tr_211100 ', '0');
INSERT INTO `provinces` VALUES ('211122', '盘山县', '211100', '', '0', '0', 'P', '122.00356035522', '41.248263682582', '3', 'tr_0 tr_210000 tr_211100 ', '0');
INSERT INTO `provinces` VALUES ('211202', '银州区', '211200', '', '0', '0', 'Y', '123.8483863963', '42.292573681442', '3', 'tr_0 tr_210000 tr_211200 ', '0');
INSERT INTO `provinces` VALUES ('211204', '清河区', '211200', '', '0', '0', 'Q', '124.16556298034', '42.552494793453', '3', 'tr_0 tr_210000 tr_211200 ', '0');
INSERT INTO `provinces` VALUES ('211221', '铁岭县', '211200', '', '0', '0', 'T', '123.7353723767', '42.229225608048', '3', 'tr_0 tr_210000 tr_211200 ', '0');
INSERT INTO `provinces` VALUES ('211223', '西丰县', '211200', '', '0', '0', 'X', '124.73361509331', '42.744014442436', '3', 'tr_0 tr_210000 tr_211200 ', '0');
INSERT INTO `provinces` VALUES ('211224', '昌图县', '211200', '', '0', '0', 'C', '124.11750067115', '42.792178371844', '3', 'tr_0 tr_210000 tr_211200 ', '0');
INSERT INTO `provinces` VALUES ('211281', '调兵山市', '211200', '', '0', '0', 'D', '123.57350868313', '42.473738012058', '3', 'tr_0 tr_210000 tr_211200 ', '0');
INSERT INTO `provinces` VALUES ('211282', '开原市', '211200', '', '0', '0', 'K', '124.04456886375', '42.552079074779', '3', 'tr_0 tr_210000 tr_211200 ', '0');
INSERT INTO `provinces` VALUES ('211302', '双塔区', '211300', '', '0', '0', 'S', '120.46048690274', '41.571779500856', '3', 'tr_0 tr_210000 tr_211300 ', '0');
INSERT INTO `provinces` VALUES ('211303', '龙城区', '211300', '', '0', '0', 'L', '120.4435668693', '41.59846852305', '3', 'tr_0 tr_210000 tr_211300 ', '0');
INSERT INTO `provinces` VALUES ('211321', '朝阳县', '211300', '', '0', '0', 'C', '120.25939061432', '41.241075720873', '3', 'tr_0 tr_210000 tr_211300 ', '0');
INSERT INTO `provinces` VALUES ('211322', '建平县', '211300', '', '0', '0', 'J', '119.64938035777', '41.409455511027', '3', 'tr_0 tr_210000 tr_211300 ', '0');
INSERT INTO `provinces` VALUES ('211324', '喀喇沁左翼蒙古族自治县', '211300', '', '0', '0', 'K', '119.74741405502', '41.133689119828', '3', 'tr_0 tr_210000 tr_211300 ', '0');
INSERT INTO `provinces` VALUES ('211381', '北票市', '211300', '', '0', '0', 'B', '120.77762773422', '41.80648256895', '3', 'tr_0 tr_210000 tr_211300 ', '0');
INSERT INTO `provinces` VALUES ('211382', '凌源市', '211300', '', '0', '0', 'L', '119.40735807879', '41.251651297148', '3', 'tr_0 tr_210000 tr_211300 ', '0');
INSERT INTO `provinces` VALUES ('211402', '连山区', '211400', '', '0', '0', 'L', '120.87648167423', '40.780893808442', '3', 'tr_0 tr_210000 tr_211400 ', '0');
INSERT INTO `provinces` VALUES ('211403', '龙港区', '211400', '', '0', '0', 'L', '120.90062076024', '40.741056601241', '3', 'tr_0 tr_210000 tr_211400 ', '0');
INSERT INTO `provinces` VALUES ('211404', '南票区', '211400', '', '0', '0', 'N', '120.75649312082', '41.113097595823', '3', 'tr_0 tr_210000 tr_211400 ', '0');
INSERT INTO `provinces` VALUES ('211421', '绥中县', '211400', '', '0', '0', 'S', '120.35042453538', '40.331843475397', '3', 'tr_0 tr_210000 tr_211400 ', '0');
INSERT INTO `provinces` VALUES ('211422', '建昌县', '211400', '', '0', '0', 'J', '119.84359526665', '40.830379953809', '3', 'tr_0 tr_210000 tr_211400 ', '0');
INSERT INTO `provinces` VALUES ('211481', '兴城市', '211400', '', '0', '0', 'X', '120.76455846701', '40.616555664044', '3', 'tr_0 tr_210000 tr_211400 ', '0');
INSERT INTO `provinces` VALUES ('220102', '南关区', '220100', '', '0', '0', 'N', '125.35660981703', '43.869873025193', '3', 'tr_0 tr_220000 tr_220100 ', '0');
INSERT INTO `provinces` VALUES ('220103', '宽城区', '220100', '', '0', '0', 'K', '125.33462450832', '43.949502239804', '3', 'tr_0 tr_220000 tr_220100 ', '0');
INSERT INTO `provinces` VALUES ('220104', '朝阳区', '220100', '', '0', '0', 'C', '125.29540125585', '43.840641474962', '3', 'tr_0 tr_220000 tr_220100 ', '0');
INSERT INTO `provinces` VALUES ('220105', '二道区', '220100', '', '0', '0', 'E', '125.38046755375', '43.871276524271', '3', 'tr_0 tr_220000 tr_220100 ', '0');
INSERT INTO `provinces` VALUES ('220106', '绿园区', '220100', '', '0', '0', 'L', '125.26244260635', '43.886810403937', '3', 'tr_0 tr_220000 tr_220100 ', '0');
INSERT INTO `provinces` VALUES ('220112', '双阳区', '220100', '', '0', '0', 'S', '125.67144793217', '43.531091309119', '3', 'tr_0 tr_220000 tr_220100 ', '0');
INSERT INTO `provinces` VALUES ('220113', '九台区', '220100', '', '0', '0', 'J', '125.84556442307', '44.157791853861', '3', 'tr_0 tr_220000 tr_220100 ', '0');
INSERT INTO `provinces` VALUES ('220122', '农安县', '220100', '', '0', '0', 'N', '125.19148410666', '44.438903951261', '3', 'tr_0 tr_220000 tr_220100 ', '0');
INSERT INTO `provinces` VALUES ('220171', '长春经济技术开发区', '220100', '', '0', '0', 'Z', '125.37014719124', '43.866004586928', '3', 'tr_0 tr_220000 tr_220100 ', '0');
INSERT INTO `provinces` VALUES ('220172', '长春净月高新技术产业开发区', '220100', '', '0', '0', 'Z', '125.26127292275', '43.823034492758', '3', 'tr_0 tr_220000 tr_220100 ', '0');
INSERT INTO `provinces` VALUES ('220173', '长春高新技术产业开发区', '220100', '', '0', '0', 'Z', '125.26127292275', '43.823034492758', '3', 'tr_0 tr_220000 tr_220100 ', '0');
INSERT INTO `provinces` VALUES ('220174', '长春汽车经济技术开发区', '220100', '', '0', '0', 'Z', '125.33060207591', '43.821953501043', '3', 'tr_0 tr_220000 tr_220100 ', '0');
INSERT INTO `provinces` VALUES ('220182', '榆树市', '220100', '', '0', '0', 'Y', '126.53960936347', '44.845439727693', '3', 'tr_0 tr_220000 tr_220100 ', '0');
INSERT INTO `provinces` VALUES ('220183', '德惠市', '220100', '', '0', '0', 'D', '125.73451517728', '44.527161066608', '3', 'tr_0 tr_220000 tr_220100 ', '0');
INSERT INTO `provinces` VALUES ('220202', '昌邑区', '220200', '', '0', '0', 'C', '126.58144866124', '43.887992474736', '3', 'tr_0 tr_220000 tr_220200 ', '0');
INSERT INTO `provinces` VALUES ('220203', '龙潭区', '220200', '', '0', '0', 'L', '126.56854459242', '43.91634255363', '3', 'tr_0 tr_220000 tr_220200 ', '0');
INSERT INTO `provinces` VALUES ('220204', '船营区', '220200', '', '0', '0', 'C', '126.54764973677', '43.83992740229', '3', 'tr_0 tr_220000 tr_220200 ', '0');
INSERT INTO `provinces` VALUES ('220211', '丰满区', '220200', '', '0', '0', 'F', '126.56857046362', '43.827151576836', '3', 'tr_0 tr_220000 tr_220200 ', '0');
INSERT INTO `provinces` VALUES ('220221', '永吉县', '220200', '', '0', '0', 'Y', '126.50441572986', '43.678720676989', '3', 'tr_0 tr_220000 tr_220200 ', '0');
INSERT INTO `provinces` VALUES ('220271', '吉林经济开发区', '220200', '', '0', '0', 'J', '126.55563450495', '43.843567834579', '3', 'tr_0 tr_220000 tr_220200 ', '0');
INSERT INTO `provinces` VALUES ('220272', '吉林高新技术产业开发区', '220200', '', '0', '0', 'J', '126.55091570611', '43.822448990547', '3', 'tr_0 tr_220000 tr_220200 ', '0');
INSERT INTO `provinces` VALUES ('220273', '吉林中国新加坡食品区', '220200', '', '0', '0', 'J', '126.55563450495', '43.843567834579', '3', 'tr_0 tr_220000 tr_220200 ', '0');
INSERT INTO `provinces` VALUES ('220281', '蛟河市', '220200', '', '0', '0', 'J', '127.35148018677', '43.730003870507', '3', 'tr_0 tr_220000 tr_220200 ', '0');
INSERT INTO `provinces` VALUES ('220282', '桦甸市', '220200', '', '0', '0', 'H', '126.75248423373', '42.977982779881', '3', 'tr_0 tr_220000 tr_220200 ', '0');
INSERT INTO `provinces` VALUES ('220283', '舒兰市', '220200', '', '0', '0', 'S', '126.97137703226', '44.412270028324', '3', 'tr_0 tr_220000 tr_220200 ', '0');
INSERT INTO `provinces` VALUES ('220284', '磐石市', '220200', '', '0', '0', 'P', '126.06661629889', '42.951817500114', '3', 'tr_0 tr_220000 tr_220200 ', '0');
INSERT INTO `provinces` VALUES ('220302', '铁西区', '220300', '', '0', '0', 'T', '124.35246676034', '43.152575391803', '3', 'tr_0 tr_220000 tr_220300 ', '0');
INSERT INTO `provinces` VALUES ('220303', '铁东区', '220300', '', '0', '0', 'T', '124.4164827059', '43.167993993185', '3', 'tr_0 tr_220000 tr_220300 ', '0');
INSERT INTO `provinces` VALUES ('220322', '梨树县', '220300', '', '0', '0', 'L', '124.3424012471', '43.313345515553', '3', 'tr_0 tr_220000 tr_220300 ', '0');
INSERT INTO `provinces` VALUES ('220323', '伊通满族自治县', '220300', '', '0', '0', 'Y', '125.31148460754', '43.351103666821', '3', 'tr_0 tr_220000 tr_220300 ', '0');
INSERT INTO `provinces` VALUES ('220381', '公主岭市', '220300', '', '0', '0', 'G', '124.82944866071', '43.510832663153', '3', 'tr_0 tr_220000 tr_220300 ', '0');
INSERT INTO `provinces` VALUES ('220382', '双辽市', '220300', '', '0', '0', 'S', '123.50943776128', '43.524527382171', '3', 'tr_0 tr_220000 tr_220300 ', '0');
INSERT INTO `provinces` VALUES ('220402', '龙山区', '220400', '', '0', '0', 'L', '125.14345242969', '42.907634012133', '3', 'tr_0 tr_220000 tr_220400 ', '0');
INSERT INTO `provinces` VALUES ('220403', '西安区', '220400', '', '0', '0', 'X', '125.15537330313', '42.933308420625', '3', 'tr_0 tr_220000 tr_220400 ', '0');
INSERT INTO `provinces` VALUES ('220421', '东丰县', '220400', '', '0', '0', 'D', '125.53737790091', '42.683310778553', '3', 'tr_0 tr_220000 tr_220400 ', '0');
INSERT INTO `provinces` VALUES ('220422', '东辽县', '220400', '', '0', '0', 'D', '124.99758944369', '42.931879101776', '3', 'tr_0 tr_220000 tr_220400 ', '0');
INSERT INTO `provinces` VALUES ('220502', '东昌区', '220500', '', '0', '0', 'D', '125.93359459016', '41.70840538484', '3', 'tr_0 tr_220000 tr_220500 ', '0');
INSERT INTO `provinces` VALUES ('220503', '二道江区', '220500', '', '0', '0', 'E', '126.0495917027', '41.779966174493', '3', 'tr_0 tr_220000 tr_220500 ', '0');
INSERT INTO `provinces` VALUES ('220521', '通化县', '220500', '', '0', '0', 'T', '125.76539191393', '41.685682238068', '3', 'tr_0 tr_220000 tr_220500 ', '0');
INSERT INTO `provinces` VALUES ('220523', '辉南县', '220500', '', '0', '0', 'H', '126.05358125713', '42.690699881882', '3', 'tr_0 tr_220000 tr_220500 ', '0');
INSERT INTO `provinces` VALUES ('220524', '柳河县', '220500', '', '0', '0', 'L', '125.75142398189', '42.290871215056', '3', 'tr_0 tr_220000 tr_220500 ', '0');
INSERT INTO `provinces` VALUES ('220581', '梅河口市', '220500', '', '0', '0', 'M', '125.71760780995', '42.544883890284', '3', 'tr_0 tr_220000 tr_220500 ', '0');
INSERT INTO `provinces` VALUES ('220582', '集安市', '220500', '', '0', '0', 'J', '126.199577372', '41.131299724033', '3', 'tr_0 tr_220000 tr_220500 ', '0');
INSERT INTO `provinces` VALUES ('220602', '浑江区', '220600', '', '0', '0', 'H', '126.42361952721', '41.95042372822', '3', 'tr_0 tr_220000 tr_220600 ', '0');
INSERT INTO `provinces` VALUES ('220605', '江源区', '220600', '', '0', '0', 'J', '126.59739097896', '42.062939372081', '3', 'tr_0 tr_220000 tr_220600 ', '0');
INSERT INTO `provinces` VALUES ('220621', '抚松县', '220600', '', '0', '0', 'F', '127.45537119527', '42.227335272553', '3', 'tr_0 tr_220000 tr_220600 ', '0');
INSERT INTO `provinces` VALUES ('220622', '靖宇县', '220600', '', '0', '0', 'J', '126.81949899257', '42.394765734578', '3', 'tr_0 tr_220000 tr_220600 ', '0');
INSERT INTO `provinces` VALUES ('220623', '长白朝鲜族自治县', '220600', '', '0', '0', 'Z', '128.20758420219', '41.425895812594', '3', 'tr_0 tr_220000 tr_220600 ', '0');
INSERT INTO `provinces` VALUES ('220681', '临江市', '220600', '', '0', '0', 'L', '126.9245815135', '41.817678643992', '3', 'tr_0 tr_220000 tr_220600 ', '0');
INSERT INTO `provinces` VALUES ('220702', '宁江区', '220700', '', '0', '0', 'N', '124.82342254815', '45.178039438667', '3', 'tr_0 tr_220000 tr_220700 ', '0');
INSERT INTO `provinces` VALUES ('220721', '前郭尔罗斯蒙古族自治县', '220700', '', '0', '0', 'Q', '124.83045556165', '45.123416092926', '3', 'tr_0 tr_220000 tr_220700 ', '0');
INSERT INTO `provinces` VALUES ('220722', '长岭县', '220700', '', '0', '0', 'Z', '123.9743741034', '44.281638280052', '3', 'tr_0 tr_220000 tr_220700 ', '0');
INSERT INTO `provinces` VALUES ('220723', '乾安县', '220700', '', '0', '0', 'G', '124.0475638046', '45.008434321605', '3', 'tr_0 tr_220000 tr_220700 ', '0');
INSERT INTO `provinces` VALUES ('220771', '吉林松原经济开发区', '220700', '', '0', '0', 'J', '124.83148187569', '45.147404193414', '3', 'tr_0 tr_220000 tr_220700 ', '0');
INSERT INTO `provinces` VALUES ('220781', '扶余市', '220700', '', '0', '0', 'F', '126.0566062111', '44.994168421151', '3', 'tr_0 tr_220000 tr_220700 ', '0');
INSERT INTO `provinces` VALUES ('220802', '洮北区', '220800', '', '0', '0', 'T', '122.85750977516', '45.627524686514', '3', 'tr_0 tr_220000 tr_220800 ', '0');
INSERT INTO `provinces` VALUES ('220821', '镇赉县', '220800', '', '0', '0', 'Z', '123.20657575565', '45.853116635389', '3', 'tr_0 tr_220000 tr_220800 ', '0');
INSERT INTO `provinces` VALUES ('220822', '通榆县', '220800', '', '0', '0', 'T', '123.09452077673', '44.818963735882', '3', 'tr_0 tr_220000 tr_220800 ', '0');
INSERT INTO `provinces` VALUES ('220871', '吉林白城经济开发区', '220800', '', '0', '0', 'J', '122.81641245977', '45.642168989302', '3', 'tr_0 tr_220000 tr_220800 ', '0');
INSERT INTO `provinces` VALUES ('220881', '洮南市', '220800', '', '0', '0', 'T', '122.7944676826', '45.341131872567', '3', 'tr_0 tr_220000 tr_220800 ', '0');
INSERT INTO `provinces` VALUES ('220882', '大安市', '220800', '', '0', '0', 'D', '124.29850428102', '45.513045149628', '3', 'tr_0 tr_220000 tr_220800 ', '0');
INSERT INTO `provinces` VALUES ('222401', '延吉市', '222400', '', '0', '0', 'Y', '129.52052013726', '42.91271700988', '3', 'tr_0 tr_220000 tr_222400 ', '0');
INSERT INTO `provinces` VALUES ('222402', '图们市', '222400', '', '0', '0', 'T', '129.85038151375', '42.974283499075', '3', 'tr_0 tr_220000 tr_222400 ', '0');
INSERT INTO `provinces` VALUES ('222403', '敦化市', '222400', '', '0', '0', 'D', '128.23861239315', '43.378291274517', '3', 'tr_0 tr_220000 tr_222400 ', '0');
INSERT INTO `provinces` VALUES ('222404', '珲春市', '222400', '', '0', '0', 'H', '130.37261321858', '42.868515115192', '3', 'tr_0 tr_220000 tr_222400 ', '0');
INSERT INTO `provinces` VALUES ('222405', '龙井市', '222400', '', '0', '0', 'L', '129.43263477701', '42.771534868349', '3', 'tr_0 tr_220000 tr_222400 ', '0');
INSERT INTO `provinces` VALUES ('222406', '和龙市', '222400', '', '0', '0', 'H', '129.01738712621', '42.552322568432', '3', 'tr_0 tr_220000 tr_222400 ', '0');
INSERT INTO `provinces` VALUES ('222424', '汪清县', '222400', '', '0', '0', 'W', '129.77760879625', '43.318450833865', '3', 'tr_0 tr_220000 tr_222400 ', '0');
INSERT INTO `provinces` VALUES ('222426', '安图县', '222400', '', '0', '0', 'A', '128.90544846814', '43.117916954912', '3', 'tr_0 tr_220000 tr_222400 ', '0');
INSERT INTO `provinces` VALUES ('230102', '道里区', '230100', '', '0', '0', 'D', '126.62343158837', '45.761844478815', '3', 'tr_0 tr_230000 tr_230100 ', '0');
INSERT INTO `provinces` VALUES ('230103', '南岗区', '230100', '', '0', '0', 'N', '126.67563849952', '45.765866163758', '3', 'tr_0 tr_230000 tr_230100 ', '0');
INSERT INTO `provinces` VALUES ('230104', '道外区', '230100', '', '0', '0', 'D', '126.65560404089', '45.797776220434', '3', 'tr_0 tr_230000 tr_230100 ', '0');
INSERT INTO `provinces` VALUES ('230108', '平房区', '230100', '', '0', '0', 'P', '126.54161509032', '45.808825827952', '3', 'tr_0 tr_230000 tr_230100 ', '0');
INSERT INTO `provinces` VALUES ('230109', '松北区', '230100', '', '0', '0', 'S', '126.51648256825', '45.808592561429', '3', 'tr_0 tr_230000 tr_230100 ', '0');
INSERT INTO `provinces` VALUES ('230110', '香坊区', '230100', '', '0', '0', 'X', '126.66962434413', '45.713619645389', '3', 'tr_0 tr_230000 tr_230100 ', '0');
INSERT INTO `provinces` VALUES ('230111', '呼兰区', '230100', '', '0', '0', 'H', '126.5943989831', '45.895209780863', '3', 'tr_0 tr_230000 tr_230100 ', '0');
INSERT INTO `provinces` VALUES ('230112', '阿城区', '230100', '', '0', '0', 'A', '126.96435649552', '45.554275304352', '3', 'tr_0 tr_230000 tr_230100 ', '0');
INSERT INTO `provinces` VALUES ('230113', '双城区', '230100', '', '0', '0', 'S', '126.31962313777', '45.388111522394', '3', 'tr_0 tr_230000 tr_230100 ', '0');
INSERT INTO `provinces` VALUES ('230123', '依兰县', '230100', '', '0', '0', 'Y', '129.57451969721', '46.331260289052', '3', 'tr_0 tr_230000 tr_230100 ', '0');
INSERT INTO `provinces` VALUES ('230124', '方正县', '230100', '', '0', '0', 'F', '128.83563368134', '45.857758440062', '3', 'tr_0 tr_230000 tr_230100 ', '0');
INSERT INTO `provinces` VALUES ('230125', '宾县', '230100', '', '0', '0', 'B', '127.4734970145', '45.752465386742', '3', 'tr_0 tr_230000 tr_230100 ', '0');
INSERT INTO `provinces` VALUES ('230126', '巴彦县', '230100', '', '0', '0', 'B', '127.4105479864', '46.091282657815', '3', 'tr_0 tr_230000 tr_230100 ', '0');
INSERT INTO `provinces` VALUES ('230127', '木兰县', '230100', '', '0', '0', 'M', '128.05035620452', '45.956871319448', '3', 'tr_0 tr_230000 tr_230100 ', '0');
INSERT INTO `provinces` VALUES ('230128', '通河县', '230100', '', '0', '0', 'T', '128.75241627584', '45.996392590921', '3', 'tr_0 tr_230000 tr_230100 ', '0');
INSERT INTO `provinces` VALUES ('230129', '延寿县', '230100', '', '0', '0', 'Y', '128.33860582402', '45.457641195714', '3', 'tr_0 tr_230000 tr_230100 ', '0');
INSERT INTO `provinces` VALUES ('230183', '尚志市', '230100', '', '0', '0', 'S', '128.01548820666', '45.215473941867', '3', 'tr_0 tr_230000 tr_230100 ', '0');
INSERT INTO `provinces` VALUES ('230184', '五常市', '230100', '', '0', '0', 'W', '127.17352882965', '44.937842855774', '3', 'tr_0 tr_230000 tr_230100 ', '0');
INSERT INTO `provinces` VALUES ('230202', '龙沙区', '230200', '', '0', '0', 'L', '123.96437622285', '47.323576977429', '3', 'tr_0 tr_230000 tr_230200 ', '0');
INSERT INTO `provinces` VALUES ('230203', '建华区', '230200', '', '0', '0', 'J', '123.96135010108', '47.360554871046', '3', 'tr_0 tr_230000 tr_230200 ', '0');
INSERT INTO `provinces` VALUES ('230204', '铁锋区', '230200', '', '0', '0', 'T', '123.984415712', '47.347018863772', '3', 'tr_0 tr_230000 tr_230200 ', '0');
INSERT INTO `provinces` VALUES ('230205', '昂昂溪区', '230200', '', '0', '0', 'A', '123.82940626913', '47.161332243626', '3', 'tr_0 tr_230000 tr_230200 ', '0');
INSERT INTO `provinces` VALUES ('230206', '富拉尔基区', '230200', '', '0', '0', 'F', '123.63650980324', '47.215504082791', '3', 'tr_0 tr_230000 tr_230200 ', '0');
INSERT INTO `provinces` VALUES ('230207', '碾子山区', '230200', '', '0', '0', 'N', '122.89436680108', '47.523236298133', '3', 'tr_0 tr_230000 tr_230200 ', '0');
INSERT INTO `provinces` VALUES ('230208', '梅里斯达斡尔族区', '230200', '', '0', '0', 'M', '123.75954091741', '47.315549574077', '3', 'tr_0 tr_230000 tr_230200 ', '0');
INSERT INTO `provinces` VALUES ('230221', '龙江县', '230200', '', '0', '0', 'L', '123.21153898342', '47.343605740151', '3', 'tr_0 tr_230000 tr_230200 ', '0');
INSERT INTO `provinces` VALUES ('230223', '依安县', '230200', '', '0', '0', 'Y', '125.3124821661', '47.899483651368', '3', 'tr_0 tr_230000 tr_230200 ', '0');
INSERT INTO `provinces` VALUES ('230224', '泰来县', '230200', '', '0', '0', 'T', '123.42362630925', '46.39782928518', '3', 'tr_0 tr_230000 tr_230200 ', '0');
INSERT INTO `provinces` VALUES ('230225', '甘南县', '230200', '', '0', '0', 'G', '123.51248588182', '47.92688406951', '3', 'tr_0 tr_230000 tr_230200 ', '0');
INSERT INTO `provinces` VALUES ('230227', '富裕县', '230200', '', '0', '0', 'F', '124.48054247906', '47.780228063275', '3', 'tr_0 tr_230000 tr_230200 ', '0');
INSERT INTO `provinces` VALUES ('230229', '克山县', '230200', '', '0', '0', 'K', '125.88137832693', '48.043172360737', '3', 'tr_0 tr_230000 tr_230200 ', '0');
INSERT INTO `provinces` VALUES ('230230', '克东县', '230200', '', '0', '0', 'K', '126.25538674804', '48.048244160483', '3', 'tr_0 tr_230000 tr_230200 ', '0');
INSERT INTO `provinces` VALUES ('230231', '拜泉县', '230200', '', '0', '0', 'B', '126.10542147027', '47.601867301959', '3', 'tr_0 tr_230000 tr_230200 ', '0');
INSERT INTO `provinces` VALUES ('230281', '讷河市', '230200', '', '0', '0', 'N', '124.8905490562', '48.490086593264', '3', 'tr_0 tr_230000 tr_230200 ', '0');
INSERT INTO `provinces` VALUES ('230302', '鸡冠区', '230300', '', '0', '0', 'J', '130.98763160852', '45.309806344312', '3', 'tr_0 tr_230000 tr_230300 ', '0');
INSERT INTO `provinces` VALUES ('230303', '恒山区', '230300', '', '0', '0', 'H', '130.91138523344', '45.216971883154', '3', 'tr_0 tr_230000 tr_230300 ', '0');
INSERT INTO `provinces` VALUES ('230304', '滴道区', '230300', '', '0', '0', 'D', '130.85058046059', '45.354433617216', '3', 'tr_0 tr_230000 tr_230300 ', '0');
INSERT INTO `provinces` VALUES ('230305', '梨树区', '230300', '', '0', '0', 'L', '130.70339606719', '45.098241780981', '3', 'tr_0 tr_230000 tr_230300 ', '0');
INSERT INTO `provinces` VALUES ('230306', '城子河区', '230300', '', '0', '0', 'C', '131.02770429868', '45.379689760283', '3', 'tr_0 tr_230000 tr_230300 ', '0');
INSERT INTO `provinces` VALUES ('230307', '麻山区', '230300', '', '0', '0', 'M', '130.48453641613', '45.217934996767', '3', 'tr_0 tr_230000 tr_230300 ', '0');
INSERT INTO `provinces` VALUES ('230321', '鸡东县', '230300', '', '0', '0', 'J', '131.13055848296', '45.266184560826', '3', 'tr_0 tr_230000 tr_230300 ', '0');
INSERT INTO `provinces` VALUES ('230381', '虎林市', '230300', '', '0', '0', 'H', '132.94346566318', '45.768946912884', '3', 'tr_0 tr_230000 tr_230300 ', '0');
INSERT INTO `provinces` VALUES ('230382', '密山市', '230300', '', '0', '0', 'M', '131.85353110655', '45.535640809748', '3', 'tr_0 tr_230000 tr_230300 ', '0');
INSERT INTO `provinces` VALUES ('230402', '向阳区', '230400', '', '0', '0', 'X', '130.30046804764', '47.348580889067', '3', 'tr_0 tr_230000 tr_230400 ', '0');
INSERT INTO `provinces` VALUES ('230403', '工农区', '230400', '', '0', '0', 'G', '130.28161728617', '47.324430299458', '3', 'tr_0 tr_230000 tr_230400 ', '0');
INSERT INTO `provinces` VALUES ('230404', '南山区', '230400', '', '0', '0', 'N', '130.29354031555', '47.321245938809', '3', 'tr_0 tr_230000 tr_230400 ', '0');
INSERT INTO `provinces` VALUES ('230405', '兴安区', '230400', '', '0', '0', 'X', '130.24554573859', '47.258716269483', '3', 'tr_0 tr_230000 tr_230400 ', '0');
INSERT INTO `provinces` VALUES ('230406', '东山区', '230400', '', '0', '0', 'D', '130.32336109407', '47.344987135573', '3', 'tr_0 tr_230000 tr_230400 ', '0');
INSERT INTO `provinces` VALUES ('230407', '兴山区', '230400', '', '0', '0', 'X', '130.31736364716', '47.396045381282', '3', 'tr_0 tr_230000 tr_230400 ', '0');
INSERT INTO `provinces` VALUES ('230421', '萝北县', '230400', '', '0', '0', 'L', '130.8354950365', '47.583422197029', '3', 'tr_0 tr_230000 tr_230400 ', '0');
INSERT INTO `provinces` VALUES ('230422', '绥滨县', '230400', '', '0', '0', 'S', '131.85948651276', '47.295265458073', '3', 'tr_0 tr_230000 tr_230400 ', '0');
INSERT INTO `provinces` VALUES ('230502', '尖山区', '230500', '', '0', '0', 'J', '131.16534177061', '46.652585923812', '3', 'tr_0 tr_230000 tr_230500 ', '0');
INSERT INTO `provinces` VALUES ('230503', '岭东区', '230500', '', '0', '0', 'L', '131.164376721', '46.464596047853', '3', 'tr_0 tr_230000 tr_230500 ', '0');
INSERT INTO `provinces` VALUES ('230505', '四方台区', '230500', '', '0', '0', 'S', '131.345657378', '46.602012285083', '3', 'tr_0 tr_230000 tr_230500 ', '0');
INSERT INTO `provinces` VALUES ('230506', '宝山区', '230500', '', '0', '0', 'B', '131.40737518857', '46.583598340241', '3', 'tr_0 tr_230000 tr_230500 ', '0');
INSERT INTO `provinces` VALUES ('230521', '集贤县', '230500', '', '0', '0', 'J', '131.14743449942', '46.734517788557', '3', 'tr_0 tr_230000 tr_230500 ', '0');
INSERT INTO `provinces` VALUES ('230522', '友谊县', '230500', '', '0', '0', 'Y', '131.8145948627', '46.772973223022', '3', 'tr_0 tr_230000 tr_230500 ', '0');
INSERT INTO `provinces` VALUES ('230523', '宝清县', '230500', '', '0', '0', 'B', '132.20359411633', '46.332651823572', '3', 'tr_0 tr_230000 tr_230500 ', '0');
INSERT INTO `provinces` VALUES ('230524', '饶河县', '230500', '', '0', '0', 'R', '134.02046893233', '46.804182744162', '3', 'tr_0 tr_230000 tr_230500 ', '0');
INSERT INTO `provinces` VALUES ('230602', '萨尔图区', '230600', '', '0', '0', 'S', '125.13351006443', '46.638936435554', '3', 'tr_0 tr_230000 tr_230600 ', '0');
INSERT INTO `provinces` VALUES ('230603', '龙凤区', '230600', '', '0', '0', 'L', '125.14047256095', '46.567678067125', '3', 'tr_0 tr_230000 tr_230600 ', '0');
INSERT INTO `provinces` VALUES ('230604', '让胡路区', '230600', '', '0', '0', 'R', '124.87759881447', '46.658078458609', '3', 'tr_0 tr_230000 tr_230600 ', '0');
INSERT INTO `provinces` VALUES ('230605', '红岗区', '230600', '', '0', '0', 'H', '124.8974774171', '46.404313108628', '3', 'tr_0 tr_230000 tr_230600 ', '0');
INSERT INTO `provinces` VALUES ('230606', '大同区', '230600', '', '0', '0', 'D', '124.81937675979', '46.045583951311', '3', 'tr_0 tr_230000 tr_230600 ', '0');
INSERT INTO `provinces` VALUES ('230621', '肇州县', '230600', '', '0', '0', 'Z', '125.2753682248', '45.705107986871', '3', 'tr_0 tr_230000 tr_230600 ', '0');
INSERT INTO `provinces` VALUES ('230622', '肇源县', '230600', '', '0', '0', 'Z', '125.08457262601', '45.524152914206', '3', 'tr_0 tr_230000 tr_230600 ', '0');
INSERT INTO `provinces` VALUES ('230623', '林甸县', '230600', '', '0', '0', 'L', '124.86965042766', '47.177234395243', '3', 'tr_0 tr_230000 tr_230600 ', '0');
INSERT INTO `provinces` VALUES ('230624', '杜尔伯特蒙古族自治县', '230600', '', '0', '0', 'D', '124.44935879141', '46.868767758452', '3', 'tr_0 tr_230000 tr_230600 ', '0');
INSERT INTO `provinces` VALUES ('230671', '大庆高新技术产业开发区', '230600', '', '0', '0', 'D', '125.15778147083', '46.581298438495', '3', 'tr_0 tr_230000 tr_230600 ', '0');
INSERT INTO `provinces` VALUES ('230702', '伊春区', '230700', '', '0', '0', 'Y', '128.91345891818', '47.733954439001', '3', 'tr_0 tr_230000 tr_230700 ', '0');
INSERT INTO `provinces` VALUES ('230703', '南岔区', '230700', '', '0', '0', 'N', '129.28957179961', '47.143749913595', '3', 'tr_0 tr_230000 tr_230700 ', '0');
INSERT INTO `provinces` VALUES ('230704', '友好区', '230700', '', '0', '0', 'Y', '128.84257946937', '47.846436100332', '3', 'tr_0 tr_230000 tr_230700 ', '0');
INSERT INTO `provinces` VALUES ('230705', '西林区', '230700', '', '0', '0', 'X', '129.31959406806', '47.486393100686', '3', 'tr_0 tr_230000 tr_230700 ', '0');
INSERT INTO `provinces` VALUES ('230706', '翠峦区', '230700', '', '0', '0', 'C', '128.67648152295', '47.732893980201', '3', 'tr_0 tr_230000 tr_230700 ', '0');
INSERT INTO `provinces` VALUES ('230707', '新青区', '230700', '', '0', '0', 'X', '129.54064675236', '48.296134660851', '3', 'tr_0 tr_230000 tr_230700 ', '0');
INSERT INTO `provinces` VALUES ('230708', '美溪区', '230700', '', '0', '0', 'M', '129.13536777746', '47.64134415168', '3', 'tr_0 tr_230000 tr_230700 ', '0');
INSERT INTO `provinces` VALUES ('230709', '金山屯区', '230700', '', '0', '0', 'J', '129.43563861113', '47.418759014597', '3', 'tr_0 tr_230000 tr_230700 ', '0');
INSERT INTO `provinces` VALUES ('230710', '五营区', '230700', '', '0', '0', 'W', '129.25134952898', '48.11427128362', '3', 'tr_0 tr_230000 tr_230700 ', '0');
INSERT INTO `provinces` VALUES ('230711', '乌马河区', '230700', '', '0', '0', 'W', '128.80554637557', '47.73361851021', '3', 'tr_0 tr_230000 tr_230700 ', '0');
INSERT INTO `provinces` VALUES ('230712', '汤旺河区', '230700', '', '0', '0', 'T', '129.57747422403', '48.460614389845', '3', 'tr_0 tr_230000 tr_230700 ', '0');
INSERT INTO `provinces` VALUES ('230713', '带岭区', '230700', '', '0', '0', 'D', '129.02742523145', '47.034571951137', '3', 'tr_0 tr_230000 tr_230700 ', '0');
INSERT INTO `provinces` VALUES ('230714', '乌伊岭区', '230700', '', '0', '0', 'W', '129.44457666112', '48.596169129772', '3', 'tr_0 tr_230000 tr_230700 ', '0');
INSERT INTO `provinces` VALUES ('230715', '红星区', '230700', '', '0', '0', 'H', '129.39750706935', '48.245480405275', '3', 'tr_0 tr_230000 tr_230700 ', '0');
INSERT INTO `provinces` VALUES ('230716', '上甘岭区', '230700', '', '0', '0', 'S', '129.03043733966', '47.980913793769', '3', 'tr_0 tr_230000 tr_230700 ', '0');
INSERT INTO `provinces` VALUES ('230722', '嘉荫县', '230700', '', '0', '0', 'J', '130.41055547772', '48.894983469564', '3', 'tr_0 tr_230000 tr_230700 ', '0');
INSERT INTO `provinces` VALUES ('230781', '铁力市', '230700', '', '0', '0', 'T', '128.03836490393', '46.992948620259', '3', 'tr_0 tr_230000 tr_230700 ', '0');
INSERT INTO `provinces` VALUES ('230803', '向阳区', '230800', '', '0', '0', 'X', '130.37261186145', '46.813511816781', '3', 'tr_0 tr_230000 tr_230800 ', '0');
INSERT INTO `provinces` VALUES ('230804', '前进区', '230800', '', '0', '0', 'Q', '130.3816482759', '46.819626508482', '3', 'tr_0 tr_230000 tr_230800 ', '0');
INSERT INTO `provinces` VALUES ('230805', '东风区', '230800', '', '0', '0', 'D', '130.41056077772', '46.828385151991', '3', 'tr_0 tr_230000 tr_230800 ', '0');
INSERT INTO `provinces` VALUES ('230811', '郊区', '230800', '', '0', '0', 'J', '130.32735909257', '46.805689990858', '3', 'tr_0 tr_230000 tr_230800 ', '0');
INSERT INTO `provinces` VALUES ('230822', '桦南县', '230800', '', '0', '0', 'H', '130.56038502153', '46.24507747688', '3', 'tr_0 tr_230000 tr_230800 ', '0');
INSERT INTO `provinces` VALUES ('230826', '桦川县', '230800', '', '0', '0', 'H', '130.72554944886', '47.028816852926', '3', 'tr_0 tr_230000 tr_230800 ', '0');
INSERT INTO `provinces` VALUES ('230828', '汤原县', '230800', '', '0', '0', 'T', '129.91164504155', '46.735326720461', '3', 'tr_0 tr_230000 tr_230800 ', '0');
INSERT INTO `provinces` VALUES ('230881', '同江市', '230800', '', '0', '0', 'T', '132.51750949205', '47.647980676666', '3', 'tr_0 tr_230000 tr_230800 ', '0');
INSERT INTO `provinces` VALUES ('230882', '富锦市', '230800', '', '0', '0', 'F', '132.04453879528', '47.255932571848', '3', 'tr_0 tr_230000 tr_230800 ', '0');
INSERT INTO `provinces` VALUES ('230883', '抚远市', '230800', '', '0', '0', 'F', '134.31448962575', '48.370944696273', '3', 'tr_0 tr_230000 tr_230800 ', '0');
INSERT INTO `provinces` VALUES ('230902', '新兴区', '230900', '', '0', '0', 'X', '130.93837086995', '45.822310328543', '3', 'tr_0 tr_230000 tr_230900 ', '0');
INSERT INTO `provinces` VALUES ('230903', '桃山区', '230900', '', '0', '0', 'T', '131.02644424554', '45.771799915696', '3', 'tr_0 tr_230000 tr_230900 ', '0');
INSERT INTO `provinces` VALUES ('230904', '茄子河区', '230900', '', '0', '0', 'J', '131.0744805937', '45.791238180152', '3', 'tr_0 tr_230000 tr_230900 ', '0');
INSERT INTO `provinces` VALUES ('230921', '勃利县', '230900', '', '0', '0', 'B', '130.59853255314', '45.760964313167', '3', 'tr_0 tr_230000 tr_230900 ', '0');
INSERT INTO `provinces` VALUES ('231002', '东安区', '231000', '', '0', '0', 'D', '129.63347765344', '44.587460377571', '3', 'tr_0 tr_230000 tr_231000 ', '0');
INSERT INTO `provinces` VALUES ('231003', '阳明区', '231000', '', '0', '0', 'Y', '129.64252736281', '44.601775026515', '3', 'tr_0 tr_230000 tr_231000 ', '0');
INSERT INTO `provinces` VALUES ('231004', '爱民区', '231000', '', '0', '0', 'A', '129.59836369953', '44.602350339442', '3', 'tr_0 tr_230000 tr_231000 ', '0');
INSERT INTO `provinces` VALUES ('231005', '西安区', '231000', '', '0', '0', 'X', '129.62241286515', '44.583861081842', '3', 'tr_0 tr_230000 tr_231000 ', '0');
INSERT INTO `provinces` VALUES ('231025', '林口县', '231000', '', '0', '0', 'L', '130.28757880086', '45.28412885062', '3', 'tr_0 tr_230000 tr_231000 ', '0');
INSERT INTO `provinces` VALUES ('231071', '牡丹江经济技术开发区', '231000', '', '0', '0', 'M', '129.63953977835', '44.556245708986', '3', 'tr_0 tr_230000 tr_231000 ', '0');
INSERT INTO `provinces` VALUES ('231081', '绥芬河市', '231000', '', '0', '0', 'S', '131.15739222567', '44.418154372388', '3', 'tr_0 tr_230000 tr_231000 ', '0');
INSERT INTO `provinces` VALUES ('231083', '海林市', '231000', '', '0', '0', 'H', '129.38742683358', '44.599871973195', '3', 'tr_0 tr_230000 tr_231000 ', '0');
INSERT INTO `provinces` VALUES ('231084', '宁安市', '231000', '', '0', '0', 'N', '129.48936798014', '44.3469835775', '3', 'tr_0 tr_230000 tr_231000 ', '0');
INSERT INTO `provinces` VALUES ('231085', '穆棱市', '231000', '', '0', '0', 'M', '130.53055850352', '44.924784589588', '3', 'tr_0 tr_230000 tr_231000 ', '0');
INSERT INTO `provinces` VALUES ('231086', '东宁市', '231000', '', '0', '0', 'D', '131.13154357445', '44.096101486248', '3', 'tr_0 tr_230000 tr_231000 ', '0');
INSERT INTO `provinces` VALUES ('231102', '爱辉区', '231100', '', '0', '0', 'A', '127.50663227086', '50.257709616452', '3', 'tr_0 tr_230000 tr_231100 ', '0');
INSERT INTO `provinces` VALUES ('231121', '嫩江县', '231100', '', '0', '0', 'N', '125.22763469543', '49.191320184756', '3', 'tr_0 tr_230000 tr_231100 ', '0');
INSERT INTO `provinces` VALUES ('231123', '逊克县', '231100', '', '0', '0', 'X', '128.48558459529', '49.5694914357', '3', 'tr_0 tr_230000 tr_231100 ', '0');
INSERT INTO `provinces` VALUES ('231124', '孙吴县', '231100', '', '0', '0', 'S', '127.34238770837', '49.431450606859', '3', 'tr_0 tr_230000 tr_231100 ', '0');
INSERT INTO `provinces` VALUES ('231181', '北安市', '231100', '', '0', '0', 'B', '126.49737974226', '48.247419532219', '3', 'tr_0 tr_230000 tr_231100 ', '0');
INSERT INTO `provinces` VALUES ('231182', '五大连池市', '231100', '', '0', '0', 'W', '126.21155518831', '48.522609551763', '3', 'tr_0 tr_230000 tr_231100 ', '0');
INSERT INTO `provinces` VALUES ('231202', '北林区', '231200', '', '0', '0', 'B', '126.99144894055', '46.643492672111', '3', 'tr_0 tr_230000 tr_231200 ', '0');
INSERT INTO `provinces` VALUES ('231221', '望奎县', '231200', '', '0', '0', 'W', '126.49238489413', '46.839167601749', '3', 'tr_0 tr_230000 tr_231200 ', '0');
INSERT INTO `provinces` VALUES ('231222', '兰西县', '231200', '', '0', '0', 'L', '126.29461952255', '46.258095172245', '3', 'tr_0 tr_230000 tr_231200 ', '0');
INSERT INTO `provinces` VALUES ('231223', '青冈县', '231200', '', '0', '0', 'Q', '126.10048887472', '46.71068498305', '3', 'tr_0 tr_230000 tr_231200 ', '0');
INSERT INTO `provinces` VALUES ('231224', '庆安县', '231200', '', '0', '0', 'Q', '127.5146121882', '46.885744465245', '3', 'tr_0 tr_230000 tr_231200 ', '0');
INSERT INTO `provinces` VALUES ('231225', '明水县', '231200', '', '0', '0', 'M', '125.91248269419', '47.179483374941', '3', 'tr_0 tr_230000 tr_231200 ', '0');
INSERT INTO `provinces` VALUES ('231226', '绥棱县', '231200', '', '0', '0', 'S', '127.12051514063', '47.242515793854', '3', 'tr_0 tr_230000 tr_231200 ', '0');
INSERT INTO `provinces` VALUES ('231281', '安达市', '231200', '', '0', '0', 'A', '125.34862234422', '46.425719232144', '3', 'tr_0 tr_230000 tr_231200 ', '0');
INSERT INTO `provinces` VALUES ('231282', '肇东市', '231200', '', '0', '0', 'Z', '125.96853740717', '46.056938289303', '3', 'tr_0 tr_230000 tr_231200 ', '0');
INSERT INTO `provinces` VALUES ('231283', '海伦市', '231200', '', '0', '0', 'H', '126.93650857556', '47.456903841096', '3', 'tr_0 tr_230000 tr_231200 ', '0');
INSERT INTO `provinces` VALUES ('232701', '漠河市', '232700', '', '0', '0', 'M', '122.5454208342', '52.978303678377', '3', 'tr_0 tr_230000 tr_232700 ', '0');
INSERT INTO `provinces` VALUES ('232721', '呼玛县', '232700', '', '0', '0', 'H', '126.65964991907', '51.73094674724', '3', 'tr_0 tr_230000 tr_232700 ', '0');
INSERT INTO `provinces` VALUES ('232722', '塔河县', '232700', '', '0', '0', 'T', '124.71651251449', '52.340305081113', '3', 'tr_0 tr_230000 tr_232700 ', '0');
INSERT INTO `provinces` VALUES ('232761', '加格达奇区', '232700', '', '0', '0', 'J', '124.15292785448', '50.420025955028', '3', 'tr_0 tr_230000 tr_232700 ', '0');
INSERT INTO `provinces` VALUES ('232762', '松岭区', '232700', '', '0', '0', 'S', '124.15292785448', '50.420025955028', '3', 'tr_0 tr_230000 tr_232700 ', '0');
INSERT INTO `provinces` VALUES ('232763', '新林区', '232700', '', '0', '0', 'X', '124.53914092375', '51.801225110533', '3', 'tr_0 tr_230000 tr_232700 ', '0');
INSERT INTO `provinces` VALUES ('232764', '呼中区', '232700', '', '0', '0', 'H', '123.58143136869', '52.037468814622', '3', 'tr_0 tr_230000 tr_232700 ', '0');
INSERT INTO `provinces` VALUES ('310101', '黄浦区', '310100', '', '0', '0', 'H', '121.49158559252', '31.237247152064', '3', 'tr_0 tr_310000 tr_310100 ', '0');
INSERT INTO `provinces` VALUES ('310104', '徐汇区', '310100', '', '0', '0', 'X', '121.44339635276', '31.194556772823', '3', 'tr_0 tr_310000 tr_310100 ', '0');
INSERT INTO `provinces` VALUES ('310105', '长宁区', '310100', '', '0', '0', 'Z', '121.43045437545', '31.226847968225', '3', 'tr_0 tr_310000 tr_310100 ', '0');
INSERT INTO `provinces` VALUES ('310106', '静安区', '310100', '', '0', '0', 'J', '121.45343177277', '31.233844930402', '3', 'tr_0 tr_310000 tr_310100 ', '0');
INSERT INTO `provinces` VALUES ('310107', '普陀区', '310100', '', '0', '0', 'P', '112.85530302042', '35.520558754673', '3', 'tr_0 tr_310000 tr_310100 ', '0');
INSERT INTO `provinces` VALUES ('310109', '虹口区', '310100', '', '0', '0', 'H', '121.51158645453', '31.269746698931', '3', 'tr_0 tr_310000 tr_310100 ', '0');
INSERT INTO `provinces` VALUES ('310110', '杨浦区', '310100', '', '0', '0', 'Y', '121.53251993733', '31.265524144657', '3', 'tr_0 tr_310000 tr_310100 ', '0');
INSERT INTO `provinces` VALUES ('310112', '闵行区', '310100', '', '0', '0', 'M', '121.38861193361', '31.118842580087', '3', 'tr_0 tr_310000 tr_310100 ', '0');
INSERT INTO `provinces` VALUES ('310113', '宝山区', '310100', '', '0', '0', 'B', '131.40737518857', '46.583598340241', '3', 'tr_0 tr_310000 tr_310100 ', '0');
INSERT INTO `provinces` VALUES ('310114', '嘉定区', '310100', '', '0', '0', 'J', '121.27259505835', '31.380155339677', '3', 'tr_0 tr_310000 tr_310100 ', '0');
INSERT INTO `provinces` VALUES ('310115', '浦东新区', '310100', '', '0', '0', 'P', '121.55045460683', '31.227348292436', '3', 'tr_0 tr_310000 tr_310100 ', '0');
INSERT INTO `provinces` VALUES ('310116', '金山区', '310100', '', '0', '0', 'J', '121.34848004512', '30.74785237657', '3', 'tr_0 tr_310000 tr_310100 ', '0');
INSERT INTO `provinces` VALUES ('310117', '松江区', '310100', '', '0', '0', 'S', '121.23447959624', '31.037135176464', '3', 'tr_0 tr_310000 tr_310100 ', '0');
INSERT INTO `provinces` VALUES ('310118', '青浦区', '310100', '', '0', '0', 'Q', '121.13055310467', '31.155454317981', '3', 'tr_0 tr_310000 tr_310100 ', '0');
INSERT INTO `provinces` VALUES ('310120', '奉贤区', '310100', '', '0', '0', 'F', '121.48050373643', '30.923720110285', '3', 'tr_0 tr_310000 tr_310100 ', '0');
INSERT INTO `provinces` VALUES ('310151', '崇明区', '310100', '', '0', '0', 'C', '121.40355686272', '31.628569984404', '3', 'tr_0 tr_310000 tr_310100 ', '0');
INSERT INTO `provinces` VALUES ('320102', '玄武区', '320100', '', '0', '0', 'X', '118.80441263575', '32.054756682949', '3', 'tr_0 tr_320000 tr_320100 ', '0');
INSERT INTO `provinces` VALUES ('320104', '秦淮区', '320100', '', '0', '0', 'Q', '118.80040736097', '32.045138606405', '3', 'tr_0 tr_320000 tr_320100 ', '0');
INSERT INTO `provinces` VALUES ('320105', '建邺区', '320100', '', '0', '0', 'J', '118.73856944695', '32.009369695446', '3', 'tr_0 tr_320000 tr_320100 ', '0');
INSERT INTO `provinces` VALUES ('320106', '鼓楼区', '320100', '', '0', '0', 'G', '118.77651899204', '32.072405160557', '3', 'tr_0 tr_320000 tr_320100 ', '0');
INSERT INTO `provinces` VALUES ('320111', '浦口区', '320100', '', '0', '0', 'P', '118.63460405875', '32.064679277923', '3', 'tr_0 tr_320000 tr_320100 ', '0');
INSERT INTO `provinces` VALUES ('320113', '栖霞区', '320100', '', '0', '0', 'Q', '118.91542298491', '32.10260020783', '3', 'tr_0 tr_320000 tr_320100 ', '0');
INSERT INTO `provinces` VALUES ('320114', '雨花台区', '320100', '', '0', '0', 'Y', '118.78544536406', '31.997858805466', '3', 'tr_0 tr_320000 tr_320100 ', '0');
INSERT INTO `provinces` VALUES ('320115', '江宁区', '320100', '', '0', '0', 'J', '118.84656705909', '31.958526869177', '3', 'tr_0 tr_320000 tr_320100 ', '0');
INSERT INTO `provinces` VALUES ('320116', '六合区', '320100', '', '0', '0', 'L', '118.82747132971', '32.32866604102', '3', 'tr_0 tr_320000 tr_320100 ', '0');
INSERT INTO `provinces` VALUES ('320117', '溧水区', '320100', '', '0', '0', 'L', '119.03440390903', '31.657283696314', '3', 'tr_0 tr_320000 tr_320100 ', '0');
INSERT INTO `provinces` VALUES ('320118', '高淳区', '320100', '', '0', '0', 'G', '118.89849765147', '31.333639123905', '3', 'tr_0 tr_320000 tr_320100 ', '0');
INSERT INTO `provinces` VALUES ('320205', '锡山区', '320200', '', '0', '0', 'X', '120.36342571103', '31.594761632814', '3', 'tr_0 tr_320000 tr_320200 ', '0');
INSERT INTO `provinces` VALUES ('320206', '惠山区', '320200', '', '0', '0', 'H', '120.30459559335', '31.686741337275', '3', 'tr_0 tr_320000 tr_320200 ', '0');
INSERT INTO `provinces` VALUES ('320211', '滨湖区', '320200', '', '0', '0', 'B', '120.29154752616', '31.534639699974', '3', 'tr_0 tr_320000 tr_320200 ', '0');
INSERT INTO `provinces` VALUES ('320213', '梁溪区', '320200', '', '0', '0', 'L', '120.30959951436', '31.571645024135', '3', 'tr_0 tr_320000 tr_320200 ', '0');
INSERT INTO `provinces` VALUES ('320214', '新吴区', '320200', '', '0', '0', 'X', '120.37039647195', '31.554850239842', '3', 'tr_0 tr_320000 tr_320200 ', '0');
INSERT INTO `provinces` VALUES ('320281', '江阴市', '320200', '', '0', '0', 'J', '120.29156800752', '31.926044909769', '3', 'tr_0 tr_320000 tr_320200 ', '0');
INSERT INTO `provinces` VALUES ('320282', '宜兴市', '320200', '', '0', '0', 'Y', '119.83160603216', '31.342956624268', '3', 'tr_0 tr_320000 tr_320200 ', '0');
INSERT INTO `provinces` VALUES ('320302', '鼓楼区', '320300', '', '0', '0', 'G', '117.19257874733', '34.293760084221', '3', 'tr_0 tr_320000 tr_320300 ', '0');
INSERT INTO `provinces` VALUES ('320303', '云龙区', '320300', '', '0', '0', 'Y', '117.2584239124', '34.259086691031', '3', 'tr_0 tr_320000 tr_320300 ', '0');
INSERT INTO `provinces` VALUES ('320305', '贾汪区', '320300', '', '0', '0', 'J', '117.46943039703', '34.441620400617', '3', 'tr_0 tr_320000 tr_320300 ', '0');
INSERT INTO `provinces` VALUES ('320311', '泉山区', '320300', '', '0', '0', 'Q', '117.20059046468', '34.249942871606', '3', 'tr_0 tr_320000 tr_320300 ', '0');
INSERT INTO `provinces` VALUES ('320312', '铜山区', '320300', '', '0', '0', 'T', '117.17556960199', '34.186100449885', '3', 'tr_0 tr_320000 tr_320300 ', '0');
INSERT INTO `provinces` VALUES ('320321', '丰县', '320300', '', '0', '0', 'F', '116.60258246804', '34.699769765634', '3', 'tr_0 tr_320000 tr_320300 ', '0');
INSERT INTO `provinces` VALUES ('320322', '沛县', '320300', '', '0', '0', 'P', '116.9425856239', '34.765151955415', '3', 'tr_0 tr_320000 tr_320300 ', '0');
INSERT INTO `provinces` VALUES ('320324', '睢宁县', '320300', '', '0', '0', 'S', '117.94743277245', '33.918789417818', '3', 'tr_0 tr_320000 tr_320300 ', '0');
INSERT INTO `provinces` VALUES ('320371', '徐州经济技术开发区', '320300', '', '0', '0', 'X', '117.28574962221', '34.272904039312', '3', 'tr_0 tr_320000 tr_320300 ', '0');
INSERT INTO `provinces` VALUES ('320381', '新沂市', '320300', '', '0', '0', 'X', '118.36153652102', '34.375610954637', '3', 'tr_0 tr_320000 tr_320300 ', '0');
INSERT INTO `provinces` VALUES ('320382', '邳州市', '320300', '', '0', '0', 'P', '117.96341066307', '34.339753160807', '3', 'tr_0 tr_320000 tr_320300 ', '0');
INSERT INTO `provinces` VALUES ('320402', '天宁区', '320400', '', '0', '0', 'T', '119.98046316025', '31.785570271253', '3', 'tr_0 tr_320000 tr_320400 ', '0');
INSERT INTO `provinces` VALUES ('320404', '钟楼区', '320400', '', '0', '0', 'Z', '119.908462716', '31.807646657754', '3', 'tr_0 tr_320000 tr_320400 ', '0');
INSERT INTO `provinces` VALUES ('320411', '新北区', '320400', '', '0', '0', 'X', '119.97751429276', '31.836323947624', '3', 'tr_0 tr_320000 tr_320400 ', '0');
INSERT INTO `provinces` VALUES ('320412', '武进区', '320400', '', '0', '0', 'W', '119.94861167229', '31.706446611742', '3', 'tr_0 tr_320000 tr_320400 ', '0');
INSERT INTO `provinces` VALUES ('320413', '金坛区', '320400', '', '0', '0', 'J', '119.60457090266', '31.72889303001', '3', 'tr_0 tr_320000 tr_320400 ', '0');
INSERT INTO `provinces` VALUES ('320481', '溧阳市', '320400', '', '0', '0', 'L', '119.49150603896', '31.422102292159', '3', 'tr_0 tr_320000 tr_320400 ', '0');
INSERT INTO `provinces` VALUES ('320505', '虎丘区', '320500', '', '0', '0', 'H', '120.57847178571', '31.301932876554', '3', 'tr_0 tr_320000 tr_320500 ', '0');
INSERT INTO `provinces` VALUES ('320506', '吴中区', '320500', '', '0', '0', 'W', '120.63850751921', '31.268261445846', '3', 'tr_0 tr_320000 tr_320500 ', '0');
INSERT INTO `provinces` VALUES ('320507', '相城区', '320500', '', '0', '0', 'X', '120.64856593584', '31.374689921493', '3', 'tr_0 tr_320000 tr_320500 ', '0');
INSERT INTO `provinces` VALUES ('320508', '姑苏区', '320500', '', '0', '0', 'G', '120.6234549731', '31.341831300993', '3', 'tr_0 tr_320000 tr_320500 ', '0');
INSERT INTO `provinces` VALUES ('320509', '吴江区', '320500', '', '0', '0', 'W', '120.65156717454', '31.144644190473', '3', 'tr_0 tr_320000 tr_320500 ', '0');
INSERT INTO `provinces` VALUES ('320571', '苏州工业园区', '320500', '', '0', '0', 'S', '120.82848521083', '31.309610913062', '3', 'tr_0 tr_320000 tr_320500 ', '0');
INSERT INTO `provinces` VALUES ('320581', '常熟市', '320500', '', '0', '0', 'C', '120.75949588665', '31.659538276741', '3', 'tr_0 tr_320000 tr_320500 ', '0');
INSERT INTO `provinces` VALUES ('320582', '张家港市', '320500', '', '0', '0', 'Z', '120.56155363871', '31.88114053634', '3', 'tr_0 tr_320000 tr_320500 ', '0');
INSERT INTO `provinces` VALUES ('320583', '昆山市', '320500', '', '0', '0', 'K', '120.98745249795', '31.390863425082', '3', 'tr_0 tr_320000 tr_320500 ', '0');
INSERT INTO `provinces` VALUES ('320585', '太仓市', '320500', '', '0', '0', 'T', '121.1355952935', '31.464599352978', '3', 'tr_0 tr_320000 tr_320500 ', '0');
INSERT INTO `provinces` VALUES ('320602', '崇川区', '320600', '', '0', '0', 'C', '120.86342022229', '32.015923029631', '3', 'tr_0 tr_320000 tr_320600 ', '0');
INSERT INTO `provinces` VALUES ('320611', '港闸区', '320600', '', '0', '0', 'G', '120.82445235808', '32.037345124875', '3', 'tr_0 tr_320000 tr_320600 ', '0');
INSERT INTO `provinces` VALUES ('320612', '通州区', '320600', '', '0', '0', 'T', '121.08142549498', '32.070355739676', '3', 'tr_0 tr_320000 tr_320600 ', '0');
INSERT INTO `provinces` VALUES ('320623', '如东县', '320600', '', '0', '0', 'R', '121.19243791024', '32.335872886155', '3', 'tr_0 tr_320000 tr_320600 ', '0');
INSERT INTO `provinces` VALUES ('320671', '南通经济技术开发区', '320600', '', '0', '0', 'N', '120.90159173866', '31.986549431201', '3', 'tr_0 tr_320000 tr_320600 ', '0');
INSERT INTO `provinces` VALUES ('320681', '启东市', '320600', '', '0', '0', 'Q', '121.66347374677', '31.814232849643', '3', 'tr_0 tr_320000 tr_320600 ', '0');
INSERT INTO `provinces` VALUES ('320682', '如皋市', '320600', '', '0', '0', 'R', '120.57946558109', '32.377851486109', '3', 'tr_0 tr_320000 tr_320600 ', '0');
INSERT INTO `provinces` VALUES ('320684', '海门市', '320600', '', '0', '0', 'H', '121.18843649817', '31.87361172603', '3', 'tr_0 tr_320000 tr_320600 ', '0');
INSERT INTO `provinces` VALUES ('320685', '海安市', '320600', '', '0', '0', 'H', '120.47443309578', '32.53919574424', '3', 'tr_0 tr_320000 tr_320600 ', '0');
INSERT INTO `provinces` VALUES ('320703', '连云区', '320700', '', '0', '0', 'L', '119.46701669742', '34.638921829102', '3', 'tr_0 tr_320000 tr_320700 ', '0');
INSERT INTO `provinces` VALUES ('320706', '海州区', '320700', '', '0', '0', 'H', '119.16940808819', '34.577456118597', '3', 'tr_0 tr_320000 tr_320700 ', '0');
INSERT INTO `provinces` VALUES ('320707', '赣榆区', '320700', '', '0', '0', 'G', '119.17943461497', '34.847682460846', '3', 'tr_0 tr_320000 tr_320700 ', '0');
INSERT INTO `provinces` VALUES ('320722', '东海县', '320700', '', '0', '0', 'D', '118.75956509248', '34.547918627364', '3', 'tr_0 tr_320000 tr_320700 ', '0');
INSERT INTO `provinces` VALUES ('320723', '灌云县', '320700', '', '0', '0', 'G', '119.24653354504', '34.288616060258', '3', 'tr_0 tr_320000 tr_320700 ', '0');
INSERT INTO `provinces` VALUES ('320724', '灌南县', '320700', '', '0', '0', 'G', '119.3225381861', '34.09259130777', '3', 'tr_0 tr_320000 tr_320700 ', '0');
INSERT INTO `provinces` VALUES ('320771', '连云港经济技术开发区', '320700', '', '0', '0', 'L', '119.35457059279', '34.70740063931', '3', 'tr_0 tr_320000 tr_320700 ', '0');
INSERT INTO `provinces` VALUES ('320772', '连云港高新技术产业开发区', '320700', '', '0', '0', 'L', '119.22862133317', '34.602249525267', '3', 'tr_0 tr_320000 tr_320700 ', '0');
INSERT INTO `provinces` VALUES ('320803', '淮安区', '320800', '', '0', '0', 'H', '119.14746320322', '33.508999838208', '3', 'tr_0 tr_320000 tr_320800 ', '0');
INSERT INTO `provinces` VALUES ('320804', '淮阴区', '320800', '', '0', '0', 'H', '119.04142174116', '33.638150424768', '3', 'tr_0 tr_320000 tr_320800 ', '0');
INSERT INTO `provinces` VALUES ('320812', '清江浦区', '320800', '', '0', '0', 'Q', '119.03241362334', '33.558562240066', '3', 'tr_0 tr_320000 tr_320800 ', '0');
INSERT INTO `provinces` VALUES ('320813', '洪泽区', '320800', '', '0', '0', 'H', '118.8795836493', '33.29962468147', '3', 'tr_0 tr_320000 tr_320800 ', '0');
INSERT INTO `provinces` VALUES ('320826', '涟水县', '320800', '', '0', '0', 'L', '119.26644843921', '33.7870787079', '3', 'tr_0 tr_320000 tr_320800 ', '0');
INSERT INTO `provinces` VALUES ('320830', '盱眙县', '320800', '', '0', '0', 'X', '118.55144127024', '33.01825474166', '3', 'tr_0 tr_320000 tr_320800 ', '0');
INSERT INTO `provinces` VALUES ('320831', '金湖县', '320800', '', '0', '0', 'J', '119.02646908663', '33.031283826757', '3', 'tr_0 tr_320000 tr_320800 ', '0');
INSERT INTO `provinces` VALUES ('320871', '淮安经济技术开发区', '320800', '', '0', '0', 'H', '119.13289044209', '33.610236869931', '3', 'tr_0 tr_320000 tr_320800 ', '0');
INSERT INTO `provinces` VALUES ('320902', '亭湖区', '320900', '', '0', '0', 'T', '120.20457816804', '33.395893486907', '3', 'tr_0 tr_320000 tr_320900 ', '0');
INSERT INTO `provinces` VALUES ('320903', '盐都区', '320900', '', '0', '0', 'Y', '120.16050325734', '33.344020315599', '3', 'tr_0 tr_320000 tr_320900 ', '0');
INSERT INTO `provinces` VALUES ('320904', '大丰区', '320900', '', '0', '0', 'D', '120.50743881649', '33.20475984971', '3', 'tr_0 tr_320000 tr_320900 ', '0');
INSERT INTO `provinces` VALUES ('320921', '响水县', '320900', '', '0', '0', 'X', '119.58460112202', '34.20474300276', '3', 'tr_0 tr_320000 tr_320900 ', '0');
INSERT INTO `provinces` VALUES ('320922', '滨海县', '320900', '', '0', '0', 'B', '119.82762105909', '33.995646547467', '3', 'tr_0 tr_320000 tr_320900 ', '0');
INSERT INTO `provinces` VALUES ('320923', '阜宁县', '320900', '', '0', '0', 'F', '119.80958074885', '33.765078727087', '3', 'tr_0 tr_320000 tr_320900 ', '0');
INSERT INTO `provinces` VALUES ('320924', '射阳县', '320900', '', '0', '0', 'S', '120.26444564892', '33.78101359213', '3', 'tr_0 tr_320000 tr_320900 ', '0');
INSERT INTO `provinces` VALUES ('320925', '建湖县', '320900', '', '0', '0', 'J', '119.80553127745', '33.469832978385', '3', 'tr_0 tr_320000 tr_320900 ', '0');
INSERT INTO `provinces` VALUES ('320971', '盐城经济技术开发区', '320900', '', '0', '0', 'Y', '120.16754426576', '33.355100917626', '3', 'tr_0 tr_320000 tr_320900 ', '0');
INSERT INTO `provinces` VALUES ('320981', '东台市', '320900', '', '0', '0', 'D', '120.32653706475', '32.872716312488', '3', 'tr_0 tr_320000 tr_320900 ', '0');
INSERT INTO `provinces` VALUES ('321002', '广陵区', '321000', '', '0', '0', 'G', '119.43850484608', '32.40066115972', '3', 'tr_0 tr_320000 tr_321000 ', '0');
INSERT INTO `provinces` VALUES ('321003', '邗江区', '321000', '', '0', '0', 'H', '119.40438513671', '32.38275135526', '3', 'tr_0 tr_320000 tr_321000 ', '0');
INSERT INTO `provinces` VALUES ('321012', '江都区', '321000', '', '0', '0', 'J', '119.57660296908', '32.440294506243', '3', 'tr_0 tr_320000 tr_321000 ', '0');
INSERT INTO `provinces` VALUES ('321023', '宝应县', '321000', '', '0', '0', 'B', '119.36555570138', '33.247205461148', '3', 'tr_0 tr_320000 tr_321000 ', '0');
INSERT INTO `provinces` VALUES ('321071', '扬州经济技术开发区', '321000', '', '0', '0', 'Y', '119.41941890823', '32.40067693609', '3', 'tr_0 tr_320000 tr_321000 ', '0');
INSERT INTO `provinces` VALUES ('321081', '仪征市', '321000', '', '0', '0', 'Y', '119.19146705795', '32.278090483161', '3', 'tr_0 tr_320000 tr_321000 ', '0');
INSERT INTO `provinces` VALUES ('321084', '高邮市', '321000', '', '0', '0', 'G', '119.46561561654', '32.787147020528', '3', 'tr_0 tr_320000 tr_321000 ', '0');
INSERT INTO `provinces` VALUES ('321102', '京口区', '321100', '', '0', '0', 'J', '119.47560369584', '32.203785483528', '3', 'tr_0 tr_320000 tr_321100 ', '0');
INSERT INTO `provinces` VALUES ('321111', '润州区', '321100', '', '0', '0', 'R', '119.41844047387', '32.201494843152', '3', 'tr_0 tr_320000 tr_321100 ', '0');
INSERT INTO `provinces` VALUES ('321112', '丹徒区', '321100', '', '0', '0', 'D', '119.44050079109', '32.13792039565', '3', 'tr_0 tr_320000 tr_321100 ', '0');
INSERT INTO `provinces` VALUES ('321171', '镇江新区', '321100', '', '0', '0', 'Z', '119.67618104484', '32.168646770866', '3', 'tr_0 tr_320000 tr_321100 ', '0');
INSERT INTO `provinces` VALUES ('321181', '丹阳市', '321100', '', '0', '0', 'D', '119.61250060471', '32.01592027417', '3', 'tr_0 tr_320000 tr_321100 ', '0');
INSERT INTO `provinces` VALUES ('321182', '扬中市', '321100', '', '0', '0', 'Y', '119.80351961209', '32.242967194122', '3', 'tr_0 tr_320000 tr_321100 ', '0');
INSERT INTO `provinces` VALUES ('321183', '句容市', '321100', '', '0', '0', 'J', '119.1754332029', '31.950923490521', '3', 'tr_0 tr_320000 tr_321100 ', '0');
INSERT INTO `provinces` VALUES ('321202', '海陵区', '321200', '', '0', '0', 'H', '119.9255249512', '32.496731549227', '3', 'tr_0 tr_320000 tr_321200 ', '0');
INSERT INTO `provinces` VALUES ('321203', '高港区', '321200', '', '0', '0', 'G', '119.88842098109', '32.32486247444', '3', 'tr_0 tr_320000 tr_321200 ', '0');
INSERT INTO `provinces` VALUES ('321204', '姜堰区', '321200', '', '0', '0', 'J', '120.13339832587', '32.515233674759', '3', 'tr_0 tr_320000 tr_321200 ', '0');
INSERT INTO `provinces` VALUES ('321271', '泰州医药高新技术产业开发区', '321200', '', '0', '0', 'T', '119.91593203649', '32.502484457877', '3', 'tr_0 tr_320000 tr_321200 ', '0');
INSERT INTO `provinces` VALUES ('321281', '兴化市', '321200', '', '0', '0', 'X', '119.85751406137', '32.917824213889', '3', 'tr_0 tr_320000 tr_321200 ', '0');
INSERT INTO `provinces` VALUES ('321282', '靖江市', '321200', '', '0', '0', 'J', '120.28353203592', '31.988170075211', '3', 'tr_0 tr_320000 tr_321200 ', '0');
INSERT INTO `provinces` VALUES ('321283', '泰兴市', '321200', '', '0', '0', 'T', '120.05859939046', '32.177474023712', '3', 'tr_0 tr_320000 tr_321200 ', '0');
INSERT INTO `provinces` VALUES ('321302', '宿城区', '321300', '', '0', '0', 'S', '118.24956705107', '33.968677630731', '3', 'tr_0 tr_320000 tr_321300 ', '0');
INSERT INTO `provinces` VALUES ('321311', '宿豫区', '321300', '', '0', '0', 'S', '118.33640094471', '33.954804396327', '3', 'tr_0 tr_320000 tr_321300 ', '0');
INSERT INTO `provinces` VALUES ('321322', '沭阳县', '321300', '', '0', '0', 'S', '118.81041906571', '34.117454209479', '3', 'tr_0 tr_320000 tr_321300 ', '0');
INSERT INTO `provinces` VALUES ('321323', '泗阳县', '321300', '', '0', '0', 'S', '118.70946596538', '33.728328313047', '3', 'tr_0 tr_320000 tr_321300 ', '0');
INSERT INTO `provinces` VALUES ('321324', '泗洪县', '321300', '', '0', '0', 'S', '118.22241594669', '33.465732594595', '3', 'tr_0 tr_320000 tr_321300 ', '0');
INSERT INTO `provinces` VALUES ('321371', '宿迁经济技术开发区', '321300', '', '0', '0', 'S', '118.27387299732', '33.898354594037', '3', 'tr_0 tr_320000 tr_321300 ', '0');
INSERT INTO `provinces` VALUES ('330102', '上城区', '330100', '', '0', '0', 'S', '120.17557880007', '30.248398420426', '3', 'tr_0 tr_330000 tr_330100 ', '0');
INSERT INTO `provinces` VALUES ('330103', '下城区', '330100', '', '0', '0', 'X', '120.18760693119', '30.286744052562', '3', 'tr_0 tr_330000 tr_330100 ', '0');
INSERT INTO `provinces` VALUES ('330104', '江干区', '330100', '', '0', '0', 'J', '120.21153877811', '30.263310567012', '3', 'tr_0 tr_330000 tr_330100 ', '0');
INSERT INTO `provinces` VALUES ('330105', '拱墅区', '330100', '', '0', '0', 'G', '120.14844700926', '30.32464256663', '3', 'tr_0 tr_330000 tr_330100 ', '0');
INSERT INTO `provinces` VALUES ('330106', '西湖区', '330100', '', '0', '0', 'X', '120.13643801205', '30.265916325589', '3', 'tr_0 tr_330000 tr_330100 ', '0');
INSERT INTO `provinces` VALUES ('330108', '滨江区', '330100', '', '0', '0', 'B', '120.21847118139', '30.214332950144', '3', 'tr_0 tr_330000 tr_330100 ', '0');
INSERT INTO `provinces` VALUES ('330109', '萧山区', '330100', '', '0', '0', 'X', '120.27047058397', '30.187511222214', '3', 'tr_0 tr_330000 tr_330100 ', '0');
INSERT INTO `provinces` VALUES ('330110', '余杭区', '330100', '', '0', '0', 'Y', '120.30659216718', '30.424739268745', '3', 'tr_0 tr_330000 tr_330100 ', '0');
INSERT INTO `provinces` VALUES ('330111', '富阳区', '330100', '', '0', '0', 'F', '119.96655568418', '30.054722967304', '3', 'tr_0 tr_330000 tr_330100 ', '0');
INSERT INTO `provinces` VALUES ('330112', '临安区', '330100', '', '0', '0', 'L', '119.73151737122', '30.239805598054', '3', 'tr_0 tr_330000 tr_330100 ', '0');
INSERT INTO `provinces` VALUES ('330122', '桐庐县', '330100', '', '0', '0', 'T', '119.69759877583', '29.798584790143', '3', 'tr_0 tr_330000 tr_330100 ', '0');
INSERT INTO `provinces` VALUES ('330127', '淳安县', '330100', '', '0', '0', 'C', '119.04839230601', '29.614950366034', '3', 'tr_0 tr_330000 tr_330100 ', '0');
INSERT INTO `provinces` VALUES ('330182', '建德市', '330100', '', '0', '0', 'J', '119.28739807501', '29.481154026968', '3', 'tr_0 tr_330000 tr_330100 ', '0');
INSERT INTO `provinces` VALUES ('330203', '海曙区', '330200', '', '0', '0', 'H', '121.55740307254', '29.865720708366', '3', 'tr_0 tr_330000 tr_330200 ', '0');
INSERT INTO `provinces` VALUES ('330205', '江北区', '330200', '', '0', '0', 'J', '121.56042128922', '29.892948379476', '3', 'tr_0 tr_330000 tr_330200 ', '0');
INSERT INTO `provinces` VALUES ('330206', '北仑区', '330200', '', '0', '0', 'B', '121.85057621461', '29.904659359939', '3', 'tr_0 tr_330000 tr_330200 ', '0');
INSERT INTO `provinces` VALUES ('330211', '镇海区', '330200', '', '0', '0', 'Z', '121.72251899132', '29.954884963349', '3', 'tr_0 tr_330000 tr_330200 ', '0');
INSERT INTO `provinces` VALUES ('330212', '鄞州区', '330200', '', '0', '0', 'Y', '121.55542706991', '29.824206349996', '3', 'tr_0 tr_330000 tr_330200 ', '0');
INSERT INTO `provinces` VALUES ('330213', '奉化区', '330200', '', '0', '0', 'F', '121.41352776719', '29.66114641278', '3', 'tr_0 tr_330000 tr_330200 ', '0');
INSERT INTO `provinces` VALUES ('330225', '象山县', '330200', '', '0', '0', 'X', '121.87556392982', '29.482270653805', '3', 'tr_0 tr_330000 tr_330200 ', '0');
INSERT INTO `provinces` VALUES ('330226', '宁海县', '330200', '', '0', '0', 'N', '121.43643177294', '29.294317441106', '3', 'tr_0 tr_330000 tr_330200 ', '0');
INSERT INTO `provinces` VALUES ('330281', '余姚市', '330200', '', '0', '0', 'Y', '121.16058507482', '30.042734639571', '3', 'tr_0 tr_330000 tr_330200 ', '0');
INSERT INTO `provinces` VALUES ('330282', '慈溪市', '330200', '', '0', '0', 'C', '121.27259613632', '30.17525661072', '3', 'tr_0 tr_330000 tr_330200 ', '0');
INSERT INTO `provinces` VALUES ('330302', '鹿城区', '330300', '', '0', '0', 'L', '120.66158649793', '28.020351607763', '3', 'tr_0 tr_330000 tr_330300 ', '0');
INSERT INTO `provinces` VALUES ('330303', '龙湾区', '330300', '', '0', '0', 'L', '120.81946755397', '27.938652244916', '3', 'tr_0 tr_330000 tr_330300 ', '0');
INSERT INTO `provinces` VALUES ('330304', '瓯海区', '330300', '', '0', '0', 'O', '120.62144724335', '27.972857351643', '3', 'tr_0 tr_330000 tr_330300 ', '0');
INSERT INTO `provinces` VALUES ('330305', '洞头区', '330300', '', '0', '0', 'D', '121.16354856759', '27.841870324587', '3', 'tr_0 tr_330000 tr_330300 ', '0');
INSERT INTO `provinces` VALUES ('330324', '永嘉县', '330300', '', '0', '0', 'Y', '120.68852407508', '28.156450332206', '3', 'tr_0 tr_330000 tr_330300 ', '0');
INSERT INTO `provinces` VALUES ('330326', '平阳县', '330300', '', '0', '0', 'P', '120.57251537444', '27.667724401093', '3', 'tr_0 tr_330000 tr_330300 ', '0');
INSERT INTO `provinces` VALUES ('330327', '苍南县', '330300', '', '0', '0', 'C', '120.43359512229', '27.523066788447', '3', 'tr_0 tr_330000 tr_330300 ', '0');
INSERT INTO `provinces` VALUES ('330328', '文成县', '330300', '', '0', '0', 'W', '120.09748845652', '27.79321715229', '3', 'tr_0 tr_330000 tr_330300 ', '0');
INSERT INTO `provinces` VALUES ('330329', '泰顺县', '330300', '', '0', '0', 'T', '119.72353725759', '27.562170559597', '3', 'tr_0 tr_330000 tr_330300 ', '0');
INSERT INTO `provinces` VALUES ('330371', '温州经济技术开发区', '330300', '', '0', '0', 'W', '120.82366240355', '27.878919129203', '3', 'tr_0 tr_330000 tr_330300 ', '0');
INSERT INTO `provinces` VALUES ('330381', '瑞安市', '330300', '', '0', '0', 'R', '120.66158218607', '27.783950736232', '3', 'tr_0 tr_330000 tr_330300 ', '0');
INSERT INTO `provinces` VALUES ('330382', '乐清市', '330300', '', '0', '0', 'L', '120.99250185617', '28.118179995228', '3', 'tr_0 tr_330000 tr_330300 ', '0');
INSERT INTO `provinces` VALUES ('330402', '南湖区', '330400', '', '0', '0', 'N', '120.78961005175', '30.751546813315', '3', 'tr_0 tr_330000 tr_330400 ', '0');
INSERT INTO `provinces` VALUES ('330411', '秀洲区', '330400', '', '0', '0', 'X', '120.71543705563', '30.770207214174', '3', 'tr_0 tr_330000 tr_330400 ', '0');
INSERT INTO `provinces` VALUES ('330421', '嘉善县', '330400', '', '0', '0', 'J', '120.93251060584', '30.83712219382', '3', 'tr_0 tr_330000 tr_330400 ', '0');
INSERT INTO `provinces` VALUES ('330424', '海盐县', '330400', '', '0', '0', 'H', '120.95244526273', '30.531872894538', '3', 'tr_0 tr_330000 tr_330400 ', '0');
INSERT INTO `provinces` VALUES ('330481', '海宁市', '330400', '', '0', '0', 'H', '120.68656506738', '30.517923769776', '3', 'tr_0 tr_330000 tr_330400 ', '0');
INSERT INTO `provinces` VALUES ('330482', '平湖市', '330400', '', '0', '0', 'P', '121.02257525525', '30.682240998058', '3', 'tr_0 tr_330000 tr_330400 ', '0');
INSERT INTO `provinces` VALUES ('330483', '桐乡市', '330400', '', '0', '0', 'T', '120.57154315531', '30.63631118771', '3', 'tr_0 tr_330000 tr_330400 ', '0');
INSERT INTO `provinces` VALUES ('330502', '吴兴区', '330500', '', '0', '0', 'W', '120.1916046602', '30.862955454986', '3', 'tr_0 tr_330000 tr_330500 ', '0');
INSERT INTO `provinces` VALUES ('330503', '南浔区', '330500', '', '0', '0', 'N', '120.42460139422', '30.855242982243', '3', 'tr_0 tr_330000 tr_330500 ', '0');
INSERT INTO `provinces` VALUES ('330521', '德清县', '330500', '', '0', '0', 'D', '119.98346466845', '30.548628239139', '3', 'tr_0 tr_330000 tr_330500 ', '0');
INSERT INTO `provinces` VALUES ('330522', '长兴县', '330500', '', '0', '0', 'Z', '119.91749832197', '31.032579326835', '3', 'tr_0 tr_330000 tr_330500 ', '0');
INSERT INTO `provinces` VALUES ('330523', '安吉县', '330500', '', '0', '0', 'A', '119.68656337876', '30.644424794114', '3', 'tr_0 tr_330000 tr_330500 ', '0');
INSERT INTO `provinces` VALUES ('330602', '越城区', '330600', '', '0', '0', 'Y', '120.58843667181', '29.995309962798', '3', 'tr_0 tr_330000 tr_330600 ', '0');
INSERT INTO `provinces` VALUES ('330603', '柯桥区', '330600', '', '0', '0', 'K', '120.45151103408', '30.07900360495', '3', 'tr_0 tr_330000 tr_330600 ', '0');
INSERT INTO `provinces` VALUES ('330604', '上虞区', '330600', '', '0', '0', 'S', '120.87450989364', '30.038242967062', '3', 'tr_0 tr_330000 tr_330600 ', '0');
INSERT INTO `provinces` VALUES ('330624', '新昌县', '330600', '', '0', '0', 'X', '120.91056965639', '29.50554107531', '3', 'tr_0 tr_330000 tr_330600 ', '0');
INSERT INTO `provinces` VALUES ('330681', '诸暨市', '330600', '', '0', '0', 'Z', '120.25340833197', '29.714934649195', '3', 'tr_0 tr_330000 tr_330600 ', '0');
INSERT INTO `provinces` VALUES ('330683', '嵊州市', '330600', '', '0', '0', 'S', '120.83743725739', '29.567326991294', '3', 'tr_0 tr_330000 tr_330600 ', '0');
INSERT INTO `provinces` VALUES ('330702', '婺城区', '330700', '', '0', '0', 'W', '119.57859260936', '29.091775438186', '3', 'tr_0 tr_330000 tr_330700 ', '0');
INSERT INTO `provinces` VALUES ('330703', '金东区', '330700', '', '0', '0', 'J', '119.69958241405', '29.104765016118', '3', 'tr_0 tr_330000 tr_330700 ', '0');
INSERT INTO `provinces` VALUES ('330723', '武义县', '330700', '', '0', '0', 'W', '119.82256555867', '28.89824378665', '3', 'tr_0 tr_330000 tr_330700 ', '0');
INSERT INTO `provinces` VALUES ('330726', '浦江县', '330700', '', '0', '0', 'P', '119.8984360827', '29.458692851855', '3', 'tr_0 tr_330000 tr_330700 ', '0');
INSERT INTO `provinces` VALUES ('330727', '磐安县', '330700', '', '0', '0', 'P', '120.45651305177', '29.060103175107', '3', 'tr_0 tr_330000 tr_330700 ', '0');
INSERT INTO `provinces` VALUES ('330781', '兰溪市', '330700', '', '0', '0', 'L', '119.46659870554', '29.214044345079', '3', 'tr_0 tr_330000 tr_330700 ', '0');
INSERT INTO `provinces` VALUES ('330782', '义乌市', '330700', '', '0', '0', 'Y', '120.08158099306', '29.31114987541', '3', 'tr_0 tr_330000 tr_330700 ', '0');
INSERT INTO `provinces` VALUES ('330783', '东阳市', '330700', '', '0', '0', 'D', '120.24842192791', '29.295861065151', '3', 'tr_0 tr_330000 tr_330700 ', '0');
INSERT INTO `provinces` VALUES ('330784', '永康市', '330700', '', '0', '0', 'Y', '120.05455071078', '28.894203967255', '3', 'tr_0 tr_330000 tr_330700 ', '0');
INSERT INTO `provinces` VALUES ('330802', '柯城区', '330800', '', '0', '0', 'K', '118.87758391504', '28.974203651128', '3', 'tr_0 tr_330000 tr_330800 ', '0');
INSERT INTO `provinces` VALUES ('330803', '衢江区', '330800', '', '0', '0', 'Q', '118.9655390736', '28.986237907969', '3', 'tr_0 tr_330000 tr_330800 ', '0');
INSERT INTO `provinces` VALUES ('330822', '常山县', '330800', '', '0', '0', 'C', '118.51755663118', '28.906997949113', '3', 'tr_0 tr_330000 tr_330800 ', '0');
INSERT INTO `provinces` VALUES ('330824', '开化县', '330800', '', '0', '0', 'K', '118.42145932131', '29.143187521187', '3', 'tr_0 tr_330000 tr_330800 ', '0');
INSERT INTO `provinces` VALUES ('330825', '龙游县', '330800', '', '0', '0', 'L', '119.17841825566', '29.034486553295', '3', 'tr_0 tr_330000 tr_330800 ', '0');
INSERT INTO `provinces` VALUES ('330881', '江山市', '330800', '', '0', '0', 'J', '118.63358329793', '28.742868480118', '3', 'tr_0 tr_330000 tr_330800 ', '0');
INSERT INTO `provinces` VALUES ('330902', '定海区', '330900', '', '0', '0', 'D', '122.11360080392', '30.025462378363', '3', 'tr_0 tr_330000 tr_330900 ', '0');
INSERT INTO `provinces` VALUES ('330903', '普陀区', '330900', '', '0', '0', 'P', '122.33154416586', '29.976835696536', '3', 'tr_0 tr_330000 tr_330900 ', '0');
INSERT INTO `provinces` VALUES ('330921', '岱山县', '330900', '', '0', '0', 'D', '122.23260481449', '30.269655894035', '3', 'tr_0 tr_330000 tr_330900 ', '0');
INSERT INTO `provinces` VALUES ('330922', '嵊泗县', '330900', '', '0', '0', 'S', '122.45758776506', '30.731273949024', '3', 'tr_0 tr_330000 tr_330900 ', '0');
INSERT INTO `provinces` VALUES ('331002', '椒江区', '331000', '', '0', '0', 'J', '121.44940797569', '28.679258224903', '3', 'tr_0 tr_330000 tr_331000 ', '0');
INSERT INTO `provinces` VALUES ('331003', '黄岩区', '331000', '', '0', '0', 'H', '121.26856605116', '28.655333607551', '3', 'tr_0 tr_330000 tr_331000 ', '0');
INSERT INTO `provinces` VALUES ('331004', '路桥区', '331000', '', '0', '0', 'L', '121.37157806769', '28.586946666726', '3', 'tr_0 tr_330000 tr_331000 ', '0');
INSERT INTO `provinces` VALUES ('331022', '三门县', '331000', '', '0', '0', 'S', '121.40255379759', '29.110355206289', '3', 'tr_0 tr_330000 tr_331000 ', '0');
INSERT INTO `provinces` VALUES ('331023', '天台县', '331000', '', '0', '0', 'T', '121.01355337629', '29.149514378149', '3', 'tr_0 tr_330000 tr_331000 ', '0');
INSERT INTO `provinces` VALUES ('331024', '仙居县', '331000', '', '0', '0', 'X', '120.73543520575', '28.853225693258', '3', 'tr_0 tr_330000 tr_331000 ', '0');
INSERT INTO `provinces` VALUES ('331081', '温岭市', '331000', '', '0', '0', 'W', '121.39258889458', '28.37765548985', '3', 'tr_0 tr_330000 tr_331000 ', '0');
INSERT INTO `provinces` VALUES ('331082', '临海市', '331000', '', '0', '0', 'L', '121.15158529413', '28.864049329083', '3', 'tr_0 tr_330000 tr_331000 ', '0');
INSERT INTO `provinces` VALUES ('331083', '玉环市', '331000', '', '0', '0', 'Y', '121.23851297084', '28.141862986829', '3', 'tr_0 tr_330000 tr_331000 ', '0');
INSERT INTO `provinces` VALUES ('331102', '莲都区', '331100', '', '0', '0', 'L', '119.91951913335', '28.451745135046', '3', 'tr_0 tr_330000 tr_331100 ', '0');
INSERT INTO `provinces` VALUES ('331121', '青田县', '331100', '', '0', '0', 'Q', '120.296573349', '28.14548755633', '3', 'tr_0 tr_330000 tr_331100 ', '0');
INSERT INTO `provinces` VALUES ('331122', '缙云县', '331100', '', '0', '0', 'J', '120.09747830566', '28.665214747164', '3', 'tr_0 tr_330000 tr_331100 ', '0');
INSERT INTO `provinces` VALUES ('331123', '遂昌县', '331100', '', '0', '0', 'S', '119.28243538622', '28.59845467671', '3', 'tr_0 tr_330000 tr_331100 ', '0');
INSERT INTO `provinces` VALUES ('331124', '松阳县', '331100', '', '0', '0', 'S', '119.48854377016', '28.455056404273', '3', 'tr_0 tr_330000 tr_331100 ', '0');
INSERT INTO `provinces` VALUES ('331125', '云和县', '331100', '', '0', '0', 'Y', '119.57959736407', '28.121469507454', '3', 'tr_0 tr_330000 tr_331100 ', '0');
INSERT INTO `provinces` VALUES ('331126', '庆元县', '331100', '', '0', '0', 'Q', '119.06948685498', '27.625431778354', '3', 'tr_0 tr_330000 tr_331100 ', '0');
INSERT INTO `provinces` VALUES ('331127', '景宁畲族自治县', '331100', '', '0', '0', 'J', '119.64243033109', '27.979553966951', '3', 'tr_0 tr_330000 tr_331100 ', '0');
INSERT INTO `provinces` VALUES ('331181', '龙泉市', '331100', '', '0', '0', 'L', '119.14844476521', '28.080508725251', '3', 'tr_0 tr_330000 tr_331100 ', '0');
INSERT INTO `provinces` VALUES ('340102', '瑶海区', '340100', '', '0', '0', 'Y', '117.31558704454', '31.863786941657', '3', 'tr_0 tr_340000 tr_340100 ', '0');
INSERT INTO `provinces` VALUES ('340103', '庐阳区', '340100', '', '0', '0', 'L', '117.27145913382', '31.884886695554', '3', 'tr_0 tr_340000 tr_340100 ', '0');
INSERT INTO `provinces` VALUES ('340104', '蜀山区', '340100', '', '0', '0', 'S', '117.2664607823', '31.857378217104', '3', 'tr_0 tr_340000 tr_340100 ', '0');
INSERT INTO `provinces` VALUES ('340111', '包河区', '340100', '', '0', '0', 'B', '117.31657625857', '31.799293467782', '3', 'tr_0 tr_340000 tr_340100 ', '0');
INSERT INTO `provinces` VALUES ('340121', '长丰县', '340100', '', '0', '0', 'Z', '117.17356009256', '32.483722623763', '3', 'tr_0 tr_340000 tr_340100 ', '0');
INSERT INTO `provinces` VALUES ('340122', '肥东县', '340100', '', '0', '0', 'F', '117.47540062528', '31.893890354487', '3', 'tr_0 tr_340000 tr_340100 ', '0');
INSERT INTO `provinces` VALUES ('340123', '肥西县', '340100', '', '0', '0', 'F', '117.16455781372', '31.712962132717', '3', 'tr_0 tr_340000 tr_340100 ', '0');
INSERT INTO `provinces` VALUES ('340124', '庐江县', '340100', '', '0', '0', 'L', '117.29357730192', '31.261327637478', '3', 'tr_0 tr_340000 tr_340100 ', '0');
INSERT INTO `provinces` VALUES ('340171', '合肥高新技术产业开发区', '340100', '', '0', '0', 'H', '117.1837943471', '31.838528178293', '3', 'tr_0 tr_340000 tr_340100 ', '0');
INSERT INTO `provinces` VALUES ('340172', '合肥经济技术开发区', '340100', '', '0', '0', 'H', '117.21475703093', '31.784661076762', '3', 'tr_0 tr_340000 tr_340100 ', '0');
INSERT INTO `provinces` VALUES ('340173', '合肥新站高新技术产业开发区', '340100', '', '0', '0', 'H', '117.38386824707', '31.946175260915', '3', 'tr_0 tr_340000 tr_340100 ', '0');
INSERT INTO `provinces` VALUES ('340181', '巢湖市', '340100', '', '0', '0', 'C', '117.89557620045', '31.629002428816', '3', 'tr_0 tr_340000 tr_340100 ', '0');
INSERT INTO `provinces` VALUES ('340202', '镜湖区', '340200', '', '0', '0', 'J', '118.39260630352', '31.345866595569', '3', 'tr_0 tr_340000 tr_340200 ', '0');
INSERT INTO `provinces` VALUES ('340203', '弋江区', '340200', '', '0', '0', 'Y', '118.37957970583', '31.317566272497', '3', 'tr_0 tr_340000 tr_340200 ', '0');
INSERT INTO `provinces` VALUES ('340207', '鸠江区', '340200', '', '0', '0', 'J', '118.39758848554', '31.375804519517', '3', 'tr_0 tr_340000 tr_340200 ', '0');
INSERT INTO `provinces` VALUES ('340208', '三山区', '340200', '', '0', '0', 'S', '118.27460210698', '31.225280124269', '3', 'tr_0 tr_340000 tr_340200 ', '0');
INSERT INTO `provinces` VALUES ('340221', '芜湖县', '340200', '', '0', '0', 'W', '118.58244251203', '31.141239223464', '3', 'tr_0 tr_340000 tr_340200 ', '0');
INSERT INTO `provinces` VALUES ('340222', '繁昌县', '340200', '', '0', '0', 'F', '118.20542431831', '31.107958593586', '3', 'tr_0 tr_340000 tr_340200 ', '0');
INSERT INTO `provinces` VALUES ('340223', '南陵县', '340200', '', '0', '0', 'N', '118.34041816695', '30.920260298683', '3', 'tr_0 tr_340000 tr_340200 ', '0');
INSERT INTO `provinces` VALUES ('340225', '无为县', '340200', '', '0', '0', 'W', '117.90857854389', '31.308844155979', '3', 'tr_0 tr_340000 tr_340200 ', '0');
INSERT INTO `provinces` VALUES ('340271', '芜湖经济技术开发区', '340200', '', '0', '0', 'W', '118.39582758127', '31.478017093937', '3', 'tr_0 tr_340000 tr_340200 ', '0');
INSERT INTO `provinces` VALUES ('340272', '安徽芜湖长江大桥经济开发区', '340200', '', '0', '0', 'A', '118.37946121933', '31.391647770998', '3', 'tr_0 tr_340000 tr_340200 ', '0');
INSERT INTO `provinces` VALUES ('340302', '龙子湖区', '340300', '', '0', '0', 'L', '117.39951276393', '32.948644262929', '3', 'tr_0 tr_340000 tr_340300 ', '0');
INSERT INTO `provinces` VALUES ('340303', '蚌山区', '340300', '', '0', '0', 'B', '117.37944120527', '32.923378770395', '3', 'tr_0 tr_340000 tr_340300 ', '0');
INSERT INTO `provinces` VALUES ('340304', '禹会区', '340300', '', '0', '0', 'Y', '117.3484523601', '32.935309988858', '3', 'tr_0 tr_340000 tr_340300 ', '0');
INSERT INTO `provinces` VALUES ('340311', '淮上区', '340300', '', '0', '0', 'H', '117.36638271774', '32.970547011885', '3', 'tr_0 tr_340000 tr_340300 ', '0');
INSERT INTO `provinces` VALUES ('340321', '怀远县', '340300', '', '0', '0', 'H', '117.21150631391', '32.976003726624', '3', 'tr_0 tr_340000 tr_340300 ', '0');
INSERT INTO `provinces` VALUES ('340322', '五河县', '340300', '', '0', '0', 'W', '117.88756088987', '33.132709462866', '3', 'tr_0 tr_340000 tr_340300 ', '0');
INSERT INTO `provinces` VALUES ('340323', '固镇县', '340300', '', '0', '0', 'G', '117.32354764831', '33.323274297744', '3', 'tr_0 tr_340000 tr_340300 ', '0');
INSERT INTO `provinces` VALUES ('340371', '蚌埠市高新技术开发区', '340300', '', '0', '0', 'B', '117.27641494698', '32.834931868561', '3', 'tr_0 tr_340000 tr_340300 ', '0');
INSERT INTO `provinces` VALUES ('340372', '蚌埠市经济开发区', '340300', '', '0', '0', 'B', '117.20923836199', '32.962369404949', '3', 'tr_0 tr_340000 tr_340300 ', '0');
INSERT INTO `provinces` VALUES ('340402', '大通区', '340400', '', '0', '0', 'D', '117.05958317929', '32.637269959538', '3', 'tr_0 tr_340000 tr_340400 ', '0');
INSERT INTO `provinces` VALUES ('340403', '田家庵区', '340400', '', '0', '0', 'T', '117.02344533676', '32.653323007096', '3', 'tr_0 tr_340000 tr_340400 ', '0');
INSERT INTO `provinces` VALUES ('340404', '谢家集区', '340400', '', '0', '0', 'X', '116.86543887721', '32.606254588196', '3', 'tr_0 tr_340000 tr_340400 ', '0');
INSERT INTO `provinces` VALUES ('340405', '八公山区', '340400', '', '0', '0', 'B', '116.84056434849', '32.637137318437', '3', 'tr_0 tr_340000 tr_340400 ', '0');
INSERT INTO `provinces` VALUES ('340406', '潘集区', '340400', '', '0', '0', 'P', '116.84158096084', '32.777955491108', '3', 'tr_0 tr_340000 tr_340400 ', '0');
INSERT INTO `provinces` VALUES ('340421', '凤台县', '340400', '', '0', '0', 'F', '116.71757320891', '32.715103905085', '3', 'tr_0 tr_340000 tr_340400 ', '0');
INSERT INTO `provinces` VALUES ('340422', '寿县', '340400', '', '0', '0', 'S', '116.8055627726', '32.561546151201', '3', 'tr_0 tr_340000 tr_340400 ', '0');
INSERT INTO `provinces` VALUES ('340503', '花山区', '340500', '', '0', '0', 'H', '118.49960562875', '31.725472572001', '3', 'tr_0 tr_340000 tr_340500 ', '0');
INSERT INTO `provinces` VALUES ('340504', '雨山区', '340500', '', '0', '0', 'Y', '118.50559705701', '31.687745482904', '3', 'tr_0 tr_340000 tr_340500 ', '0');
INSERT INTO `provinces` VALUES ('340506', '博望区', '340500', '', '0', '0', 'B', '118.85155804451', '31.556645467065', '3', 'tr_0 tr_340000 tr_340500 ', '0');
INSERT INTO `provinces` VALUES ('340521', '当涂县', '340500', '', '0', '0', 'D', '118.50460469891', '31.576649154711', '3', 'tr_0 tr_340000 tr_340500 ', '0');
INSERT INTO `provinces` VALUES ('340522', '含山县', '340500', '', '0', '0', 'H', '118.10746203634', '31.740862208736', '3', 'tr_0 tr_340000 tr_340500 ', '0');
INSERT INTO `provinces` VALUES ('340523', '和县', '340500', '', '0', '0', 'H', '118.35951254887', '31.748243815854', '3', 'tr_0 tr_340000 tr_340500 ', '0');
INSERT INTO `provinces` VALUES ('340602', '杜集区', '340600', '', '0', '0', 'D', '116.83461226601', '33.997285436391', '3', 'tr_0 tr_340000 tr_340600 ', '0');
INSERT INTO `provinces` VALUES ('340603', '相山区', '340600', '', '0', '0', 'X', '116.80052112276', '33.96582716177', '3', 'tr_0 tr_340000 tr_340600 ', '0');
INSERT INTO `provinces` VALUES ('340604', '烈山区', '340600', '', '0', '0', 'L', '116.9081817805', '33.84405351094', '3', 'tr_0 tr_340000 tr_340600 ', '0');
INSERT INTO `provinces` VALUES ('340621', '濉溪县', '340600', '', '0', '0', 'S', '116.77238942808', '33.921629194823', '3', 'tr_0 tr_340000 tr_340600 ', '0');
INSERT INTO `provinces` VALUES ('340705', '铜官区', '340700', '', '0', '0', 'T', '117.82145710265', '30.940386340633', '3', 'tr_0 tr_340000 tr_340700 ', '0');
INSERT INTO `provinces` VALUES ('340706', '义安区', '340700', '', '0', '0', 'Y', '117.79856800876', '30.958512099098', '3', 'tr_0 tr_340000 tr_340700 ', '0');
INSERT INTO `provinces` VALUES ('340711', '郊区', '340700', '', '0', '0', 'J', '117.80755007573', '30.897741483658', '3', 'tr_0 tr_340000 tr_340700 ', '0');
INSERT INTO `provinces` VALUES ('340722', '枞阳县', '340700', '', '0', '0', 'C', '117.22643695997', '30.705671267725', '3', 'tr_0 tr_340000 tr_340700 ', '0');
INSERT INTO `provinces` VALUES ('340802', '迎江区', '340800', '', '0', '0', 'Y', '117.09751448877', '30.517523291408', '3', 'tr_0 tr_340000 tr_340800 ', '0');
INSERT INTO `provinces` VALUES ('340803', '大观区', '340800', '', '0', '0', 'D', '117.04053820417', '30.518231924651', '3', 'tr_0 tr_340000 tr_340800 ', '0');
INSERT INTO `provinces` VALUES ('340811', '宜秀区', '340800', '', '0', '0', 'Y', '116.99344112425', '30.619675877796', '3', 'tr_0 tr_340000 tr_340800 ', '0');
INSERT INTO `provinces` VALUES ('340822', '怀宁县', '340800', '', '0', '0', 'H', '116.83659258051', '30.739399674607', '3', 'tr_0 tr_340000 tr_340800 ', '0');
INSERT INTO `provinces` VALUES ('340825', '太湖县', '340800', '', '0', '0', 'T', '116.31547630162', '30.460113290448', '3', 'tr_0 tr_340000 tr_340800 ', '0');
INSERT INTO `provinces` VALUES ('340826', '宿松县', '340800', '', '0', '0', 'S', '116.13552369949', '30.159786861375', '3', 'tr_0 tr_340000 tr_340800 ', '0');
INSERT INTO `provinces` VALUES ('340827', '望江县', '340800', '', '0', '0', 'W', '116.7005902941', '30.129968329229', '3', 'tr_0 tr_340000 tr_340800 ', '0');
INSERT INTO `provinces` VALUES ('340828', '岳西县', '340800', '', '0', '0', 'Y', '116.36655539021', '30.855227714002', '3', 'tr_0 tr_340000 tr_340800 ', '0');
INSERT INTO `provinces` VALUES ('340871', '安徽安庆经济开发区', '340800', '', '0', '0', 'A', '117.06360390492', '30.530956568043', '3', 'tr_0 tr_340000 tr_340800 ', '0');
INSERT INTO `provinces` VALUES ('340881', '桐城市', '340800', '', '0', '0', 'T', '116.98046635878', '31.041969037674', '3', 'tr_0 tr_340000 tr_340800 ', '0');
INSERT INTO `provinces` VALUES ('340882', '潜山市', '340800', '', '0', '0', 'Q', '116.58761103892', '30.636755682399', '3', 'tr_0 tr_340000 tr_340800 ', '0');
INSERT INTO `provinces` VALUES ('341002', '屯溪区', '341000', '', '0', '0', 'T', '118.32141818077', '29.702143908546', '3', 'tr_0 tr_340000 tr_341000 ', '0');
INSERT INTO `provinces` VALUES ('341003', '黄山区', '341000', '', '0', '0', 'H', '118.14760982484', '30.278650980188', '3', 'tr_0 tr_340000 tr_341000 ', '0');
INSERT INTO `provinces` VALUES ('341004', '徽州区', '341000', '', '0', '0', 'H', '118.34343582847', '29.834221385317', '3', 'tr_0 tr_340000 tr_341000 ', '0');
INSERT INTO `provinces` VALUES ('341021', '歙县', '341000', '', '0', '0', 'S', '118.42146012979', '29.866287675757', '3', 'tr_0 tr_340000 tr_341000 ', '0');
INSERT INTO `provinces` VALUES ('341022', '休宁县', '341000', '', '0', '0', 'X', '118.20543014116', '29.795459004963', '3', 'tr_0 tr_340000 tr_341000 ', '0');
INSERT INTO `provinces` VALUES ('341023', '黟县', '341000', '', '0', '0', 'Y', '117.94447724144', '29.931047330704', '3', 'tr_0 tr_340000 tr_341000 ', '0');
INSERT INTO `provinces` VALUES ('341024', '祁门县', '341000', '', '0', '0', 'Q', '117.72339257754', '29.86034394808', '3', 'tr_0 tr_340000 tr_341000 ', '0');
INSERT INTO `provinces` VALUES ('341102', '琅琊区', '341100', '', '0', '0', 'L', '118.31244134015', '32.300867492599', '3', 'tr_0 tr_340000 tr_341100 ', '0');
INSERT INTO `provinces` VALUES ('341103', '南谯区', '341100', '', '0', '0', 'N', '118.42348205204', '32.206131899264', '3', 'tr_0 tr_340000 tr_341100 ', '0');
INSERT INTO `provinces` VALUES ('341122', '来安县', '341100', '', '0', '0', 'L', '118.4424124932', '32.458449762427', '3', 'tr_0 tr_340000 tr_341100 ', '0');
INSERT INTO `provinces` VALUES ('341124', '全椒县', '341100', '', '0', '0', 'Q', '118.2805842827', '32.091939797603', '3', 'tr_0 tr_340000 tr_341100 ', '0');
INSERT INTO `provinces` VALUES ('341125', '定远县', '341100', '', '0', '0', 'D', '117.70447068625', '32.537046613487', '3', 'tr_0 tr_340000 tr_341100 ', '0');
INSERT INTO `provinces` VALUES ('341126', '凤阳县', '341100', '', '0', '0', 'F', '117.53858536874', '32.880976725258', '3', 'tr_0 tr_340000 tr_341100 ', '0');
INSERT INTO `provinces` VALUES ('341171', '苏滁现代产业园', '341100', '', '0', '0', 'S', '118.42315086566', '32.314484916002', '3', 'tr_0 tr_340000 tr_341100 ', '0');
INSERT INTO `provinces` VALUES ('341172', '滁州经济技术开发区', '341100', '', '0', '0', 'C', '118.37688910117', '32.299081918592', '3', 'tr_0 tr_340000 tr_341100 ', '0');
INSERT INTO `provinces` VALUES ('341181', '天长市', '341100', '', '0', '0', 'T', '119.01138527949', '32.67341003277', '3', 'tr_0 tr_340000 tr_341100 ', '0');
INSERT INTO `provinces` VALUES ('341182', '明光市', '341100', '', '0', '0', 'M', '117.99550981385', '32.783022823418', '3', 'tr_0 tr_340000 tr_341100 ', '0');
INSERT INTO `provinces` VALUES ('341202', '颍州区', '341200', '', '0', '0', 'Y', '115.81341119616', '32.88962541655', '3', 'tr_0 tr_340000 tr_341200 ', '0');
INSERT INTO `provinces` VALUES ('341203', '颍东区', '341200', '', '0', '0', 'Y', '115.86361668264', '32.917362240172', '3', 'tr_0 tr_340000 tr_341200 ', '0');
INSERT INTO `provinces` VALUES ('341204', '颍泉区', '341200', '', '0', '0', 'Y', '115.81542555644', '32.931313576025', '3', 'tr_0 tr_340000 tr_341200 ', '0');
INSERT INTO `provinces` VALUES ('341221', '临泉县', '341200', '', '0', '0', 'L', '115.26761550051', '33.045959528363', '3', 'tr_0 tr_340000 tr_341200 ', '0');
INSERT INTO `provinces` VALUES ('341222', '太和县', '341200', '', '0', '0', 'T', '115.6286154697', '33.165959850096', '3', 'tr_0 tr_340000 tr_341200 ', '0');
INSERT INTO `provinces` VALUES ('341225', '阜南县', '341200', '', '0', '0', 'F', '115.60254592516', '32.664097385125', '3', 'tr_0 tr_340000 tr_341200 ', '0');
INSERT INTO `provinces` VALUES ('341226', '颍上县', '341200', '', '0', '0', 'Y', '116.26347689904', '32.659028468804', '3', 'tr_0 tr_340000 tr_341200 ', '0');
INSERT INTO `provinces` VALUES ('341271', '阜阳合肥现代产业园区', '341200', '', '0', '0', 'F', '115.88456164757', '32.809466011566', '3', 'tr_0 tr_340000 tr_341200 ', '0');
INSERT INTO `provinces` VALUES ('341272', '阜阳经济技术开发区', '341200', '', '0', '0', 'F', '115.86257063732', '32.867285704339', '3', 'tr_0 tr_340000 tr_341200 ', '0');
INSERT INTO `provinces` VALUES ('341282', '界首市', '341200', '', '0', '0', 'J', '115.38060984722', '33.262775236231', '3', 'tr_0 tr_340000 tr_341200 ', '0');
INSERT INTO `provinces` VALUES ('341302', '埇桥区', '341300', '', '0', '0', 'Y', '116.98348044326', '33.646130650445', '3', 'tr_0 tr_340000 tr_341300 ', '0');
INSERT INTO `provinces` VALUES ('341321', '砀山县', '341300', '', '0', '0', 'D', '116.37252400151', '34.448428171397', '3', 'tr_0 tr_340000 tr_341300 ', '0');
INSERT INTO `provinces` VALUES ('341322', '萧县', '341300', '', '0', '0', 'X', '116.95358492572', '34.194269344319', '3', 'tr_0 tr_340000 tr_341300 ', '0');
INSERT INTO `provinces` VALUES ('341323', '灵璧县', '341300', '', '0', '0', 'L', '117.56455699799', '33.547892231948', '3', 'tr_0 tr_340000 tr_341300 ', '0');
INSERT INTO `provinces` VALUES ('341324', '泗县', '341300', '', '0', '0', 'S', '117.91658999175', '33.488694630134', '3', 'tr_0 tr_340000 tr_341300 ', '0');
INSERT INTO `provinces` VALUES ('341371', '宿州马鞍山现代产业园区', '341300', '', '0', '0', 'S', '116.97054394561', '33.652095326452', '3', 'tr_0 tr_340000 tr_341300 ', '0');
INSERT INTO `provinces` VALUES ('341372', '宿州经济技术开发区', '341300', '', '0', '0', 'S', '116.97054394561', '33.652095326452', '3', 'tr_0 tr_340000 tr_341300 ', '0');
INSERT INTO `provinces` VALUES ('341702', '贵池区', '341700', '', '0', '0', 'G', '117.57449037049', '30.693857943819', '3', 'tr_0 tr_340000 tr_341700 ', '0');
INSERT INTO `provinces` VALUES ('341721', '东至县', '341700', '', '0', '0', 'D', '117.03448128944', '30.116534528265', '3', 'tr_0 tr_340000 tr_341700 ', '0');
INSERT INTO `provinces` VALUES ('341722', '石台县', '341700', '', '0', '0', 'S', '117.49239440959', '30.216530337189', '3', 'tr_0 tr_340000 tr_341700 ', '0');
INSERT INTO `provinces` VALUES ('341723', '青阳县', '341700', '', '0', '0', 'Q', '117.85343129914', '30.645634346235', '3', 'tr_0 tr_340000 tr_341700 ', '0');
INSERT INTO `provinces` VALUES ('341802', '宣州区', '341800', '', '0', '0', 'X', '118.76254944305', '30.952158157984', '3', 'tr_0 tr_340000 tr_341800 ', '0');
INSERT INTO `provinces` VALUES ('341821', '郎溪县', '341800', '', '0', '0', 'L', '119.18646592169', '31.132681870443', '3', 'tr_0 tr_340000 tr_341800 ', '0');
INSERT INTO `provinces` VALUES ('341822', '广德县', '341800', '', '0', '0', 'G', '119.42747581035', '30.883667102643', '3', 'tr_0 tr_340000 tr_341800 ', '0');
INSERT INTO `provinces` VALUES ('341823', '泾县', '341800', '', '0', '0', 'J', '118.42643469242', '30.694672488542', '3', 'tr_0 tr_340000 tr_341800 ', '0');
INSERT INTO `provinces` VALUES ('341824', '绩溪县', '341800', '', '0', '0', 'J', '118.58544384057', '30.073292199533', '3', 'tr_0 tr_340000 tr_341800 ', '0');
INSERT INTO `provinces` VALUES ('341825', '旌德县', '341800', '', '0', '0', 'J', '118.54646735263', '30.292481093722', '3', 'tr_0 tr_340000 tr_341800 ', '0');
INSERT INTO `provinces` VALUES ('341871', '宣城市经济开发区', '341800', '', '0', '0', 'X', '118.76553424277', '30.946601545293', '3', 'tr_0 tr_340000 tr_341800 ', '0');
INSERT INTO `provinces` VALUES ('341881', '宁国市', '341800', '', '0', '0', 'N', '118.98960981494', '30.639352229689', '3', 'tr_0 tr_340000 tr_341800 ', '0');
INSERT INTO `provinces` VALUES ('350102', '鼓楼区', '350100', '', '0', '0', 'G', '119.31049162322', '26.088114037555', '3', 'tr_0 tr_350000 tr_350100 ', '0');
INSERT INTO `provinces` VALUES ('350103', '台江区', '350100', '', '0', '0', 'T', '119.32052821102', '26.058528150645', '3', 'tr_0 tr_350000 tr_350100 ', '0');
INSERT INTO `provinces` VALUES ('350104', '仓山区', '350100', '', '0', '0', 'C', '119.28043216493', '26.052841691927', '3', 'tr_0 tr_350000 tr_350100 ', '0');
INSERT INTO `provinces` VALUES ('350105', '马尾区', '350100', '', '0', '0', 'M', '119.44551915828', '26.004533771063', '3', 'tr_0 tr_350000 tr_350100 ', '0');
INSERT INTO `provinces` VALUES ('350111', '晋安区', '350100', '', '0', '0', 'J', '119.33457941597', '26.087213904434', '3', 'tr_0 tr_350000 tr_350100 ', '0');
INSERT INTO `provinces` VALUES ('350112', '长乐区', '350100', '', '0', '0', 'Z', '119.52943832001', '25.969257448077', '3', 'tr_0 tr_350000 tr_350100 ', '0');
INSERT INTO `provinces` VALUES ('350121', '闽侯县', '350100', '', '0', '0', 'M', '119.13848201812', '26.156035214577', '3', 'tr_0 tr_350000 tr_350100 ', '0');
INSERT INTO `provinces` VALUES ('350122', '连江县', '350100', '', '0', '0', 'L', '119.54647881621', '26.203583291029', '3', 'tr_0 tr_350000 tr_350100 ', '0');
INSERT INTO `provinces` VALUES ('350123', '罗源县', '350100', '', '0', '0', 'L', '119.55648045992', '26.495495660324', '3', 'tr_0 tr_350000 tr_350100 ', '0');
INSERT INTO `provinces` VALUES ('350124', '闽清县', '350100', '', '0', '0', 'M', '118.86957650956', '26.226847540202', '3', 'tr_0 tr_350000 tr_350100 ', '0');
INSERT INTO `provinces` VALUES ('350125', '永泰县', '350100', '', '0', '0', 'Y', '118.93843072857', '25.872787263196', '3', 'tr_0 tr_350000 tr_350100 ', '0');
INSERT INTO `provinces` VALUES ('350128', '平潭县', '350100', '', '0', '0', 'P', '119.79650131414', '25.504700273945', '3', 'tr_0 tr_350000 tr_350100 ', '0');
INSERT INTO `provinces` VALUES ('350181', '福清市', '350100', '', '0', '0', 'F', '119.39046524749', '25.726343299035', '3', 'tr_0 tr_350000 tr_350100 ', '0');
INSERT INTO `provinces` VALUES ('350203', '思明区', '350200', '', '0', '0', 'S', '118.08840797224', '24.451948395671', '3', 'tr_0 tr_350000 tr_350200 ', '0');
INSERT INTO `provinces` VALUES ('350205', '海沧区', '350200', '', '0', '0', 'H', '118.03956171185', '24.490325818598', '3', 'tr_0 tr_350000 tr_350200 ', '0');
INSERT INTO `provinces` VALUES ('350206', '湖里区', '350200', '', '0', '0', 'H', '118.15358812172', '24.517573138112', '3', 'tr_0 tr_350000 tr_350200 ', '0');
INSERT INTO `provinces` VALUES ('350211', '集美区', '350200', '', '0', '0', 'J', '118.10343491664', '24.58201906225', '3', 'tr_0 tr_350000 tr_350200 ', '0');
INSERT INTO `provinces` VALUES ('350212', '同安区', '350200', '', '0', '0', 'T', '118.15856347661', '24.729113975347', '3', 'tr_0 tr_350000 tr_350200 ', '0');
INSERT INTO `provinces` VALUES ('350213', '翔安区', '350200', '', '0', '0', 'X', '118.25457589661', '24.624216383593', '3', 'tr_0 tr_350000 tr_350200 ', '0');
INSERT INTO `provinces` VALUES ('350302', '城厢区', '350300', '', '0', '0', 'C', '119.00153633131', '25.424343792482', '3', 'tr_0 tr_350000 tr_350300 ', '0');
INSERT INTO `provinces` VALUES ('350303', '涵江区', '350300', '', '0', '0', 'H', '119.12256736822', '25.464464388124', '3', 'tr_0 tr_350000 tr_350300 ', '0');
INSERT INTO `provinces` VALUES ('350304', '荔城区', '350300', '', '0', '0', 'L', '119.01948169064', '25.439754478806', '3', 'tr_0 tr_350000 tr_350300 ', '0');
INSERT INTO `provinces` VALUES ('350305', '秀屿区', '350300', '', '0', '0', 'X', '119.11157130031', '25.323654397561', '3', 'tr_0 tr_350000 tr_350300 ', '0');
INSERT INTO `provinces` VALUES ('350322', '仙游县', '350300', '', '0', '0', 'X', '118.69845425065', '25.368291498104', '3', 'tr_0 tr_350000 tr_350300 ', '0');
INSERT INTO `provinces` VALUES ('350402', '梅列区', '350400', '', '0', '0', 'M', '117.65255022877', '26.277335878355', '3', 'tr_0 tr_350000 tr_350400 ', '0');
INSERT INTO `provinces` VALUES ('350403', '三元区', '350400', '', '0', '0', 'S', '117.61441509378', '26.240219374574', '3', 'tr_0 tr_350000 tr_350400 ', '0');
INSERT INTO `provinces` VALUES ('350421', '明溪县', '350400', '', '0', '0', 'M', '117.20851763568', '26.361853685277', '3', 'tr_0 tr_350000 tr_350400 ', '0');
INSERT INTO `provinces` VALUES ('350423', '清流县', '350400', '', '0', '0', 'Q', '116.8235931858', '26.18335735321', '3', 'tr_0 tr_350000 tr_350400 ', '0');
INSERT INTO `provinces` VALUES ('350424', '宁化县', '350400', '', '0', '0', 'N', '116.660425512', '26.26795649054', '3', 'tr_0 tr_350000 tr_350400 ', '0');
INSERT INTO `provinces` VALUES ('350425', '大田县', '350400', '', '0', '0', 'D', '117.85343999668', '25.698932641879', '3', 'tr_0 tr_350000 tr_350400 ', '0');
INSERT INTO `provinces` VALUES ('350426', '尤溪县', '350400', '', '0', '0', 'Y', '118.19743971365', '26.17621803946', '3', 'tr_0 tr_350000 tr_350400 ', '0');
INSERT INTO `provinces` VALUES ('350427', '沙县', '350400', '', '0', '0', 'S', '117.79856107581', '26.402813444346', '3', 'tr_0 tr_350000 tr_350400 ', '0');
INSERT INTO `provinces` VALUES ('350428', '将乐县', '350400', '', '0', '0', 'J', '117.47740904084', '26.735209519833', '3', 'tr_0 tr_350000 tr_350400 ', '0');
INSERT INTO `provinces` VALUES ('350429', '泰宁县', '350400', '', '0', '0', 'T', '117.1825958624', '26.905660032285', '3', 'tr_0 tr_350000 tr_350400 ', '0');
INSERT INTO `provinces` VALUES ('350430', '建宁县', '350400', '', '0', '0', 'J', '116.85250622659', '26.836824655349', '3', 'tr_0 tr_350000 tr_350400 ', '0');
INSERT INTO `provinces` VALUES ('350481', '永安市', '350400', '', '0', '0', 'Y', '117.37144258732', '25.948143989824', '3', 'tr_0 tr_350000 tr_350400 ', '0');
INSERT INTO `provinces` VALUES ('350502', '鲤城区', '350500', '', '0', '0', 'L', '118.59348105353', '24.913354167054', '3', 'tr_0 tr_350000 tr_350500 ', '0');
INSERT INTO `provinces` VALUES ('350503', '丰泽区', '350500', '', '0', '0', 'F', '118.61958015232', '24.894969993262', '3', 'tr_0 tr_350000 tr_350500 ', '0');
INSERT INTO `provinces` VALUES ('350504', '洛江区', '350500', '', '0', '0', 'L', '118.67741629493', '24.94621365376', '3', 'tr_0 tr_350000 tr_350500 ', '0');
INSERT INTO `provinces` VALUES ('350505', '泉港区', '350500', '', '0', '0', 'Q', '118.92243298541', '25.139650393954', '3', 'tr_0 tr_350000 tr_350500 ', '0');
INSERT INTO `provinces` VALUES ('350521', '惠安县', '350500', '', '0', '0', 'H', '118.8034155003', '25.036949815039', '3', 'tr_0 tr_350000 tr_350500 ', '0');
INSERT INTO `provinces` VALUES ('350524', '安溪县', '350500', '', '0', '0', 'A', '118.19242537229', '25.061759553382', '3', 'tr_0 tr_350000 tr_350500 ', '0');
INSERT INTO `provinces` VALUES ('350525', '永春县', '350500', '', '0', '0', 'Y', '118.30048613527', '25.327974202083', '3', 'tr_0 tr_350000 tr_350500 ', '0');
INSERT INTO `provinces` VALUES ('350526', '德化县', '350500', '', '0', '0', 'D', '118.24755006956', '25.497308594179', '3', 'tr_0 tr_350000 tr_350500 ', '0');
INSERT INTO `provinces` VALUES ('350581', '石狮市', '350500', '', '0', '0', 'S', '118.65451902647', '24.737665160883', '3', 'tr_0 tr_350000 tr_350500 ', '0');
INSERT INTO `provinces` VALUES ('350582', '晋江市', '350500', '', '0', '0', 'J', '118.55843052', '24.787824575145', '3', 'tr_0 tr_350000 tr_350500 ', '0');
INSERT INTO `provinces` VALUES ('350583', '南安市', '350500', '', '0', '0', 'N', '118.39257197205', '24.966362350468', '3', 'tr_0 tr_350000 tr_350500 ', '0');
INSERT INTO `provinces` VALUES ('350602', '芗城区', '350600', '', '0', '0', 'X', '117.6605895241', '24.516268416111', '3', 'tr_0 tr_350000 tr_350600 ', '0');
INSERT INTO `provinces` VALUES ('350603', '龙文区', '350600', '', '0', '0', 'L', '117.7164546946', '24.509509680945', '3', 'tr_0 tr_350000 tr_350600 ', '0');
INSERT INTO `provinces` VALUES ('350622', '云霄县', '350600', '', '0', '0', 'Y', '117.34644831448', '23.964072828248', '3', 'tr_0 tr_350000 tr_350600 ', '0');
INSERT INTO `provinces` VALUES ('350623', '漳浦县', '350600', '', '0', '0', 'Z', '117.62044335257', '24.123461614812', '3', 'tr_0 tr_350000 tr_350600 ', '0');
INSERT INTO `provinces` VALUES ('350624', '诏安县', '350600', '', '0', '0', 'Z', '117.18255858272', '23.717053963784', '3', 'tr_0 tr_350000 tr_350600 ', '0');
INSERT INTO `provinces` VALUES ('350625', '长泰县', '350600', '', '0', '0', 'Z', '117.76555257036', '24.631243628383', '3', 'tr_0 tr_350000 tr_350600 ', '0');
INSERT INTO `provinces` VALUES ('350626', '东山县', '350600', '', '0', '0', 'D', '117.43656030457', '23.706894688691', '3', 'tr_0 tr_350000 tr_350600 ', '0');
INSERT INTO `provinces` VALUES ('350627', '南靖县', '350600', '', '0', '0', 'N', '117.36344641066', '24.52085173207', '3', 'tr_0 tr_350000 tr_350600 ', '0');
INSERT INTO `provinces` VALUES ('350628', '平和县', '350600', '', '0', '0', 'P', '117.32255159131', '24.368365040126', '3', 'tr_0 tr_350000 tr_350600 ', '0');
INSERT INTO `provinces` VALUES ('350629', '华安县', '350600', '', '0', '0', 'H', '117.54058560971', '25.010067731399', '3', 'tr_0 tr_350000 tr_350600 ', '0');
INSERT INTO `provinces` VALUES ('350681', '龙海市', '350600', '', '0', '0', 'L', '117.82445086941', '24.452939738547', '3', 'tr_0 tr_350000 tr_350600 ', '0');
INSERT INTO `provinces` VALUES ('350702', '延平区', '350700', '', '0', '0', 'Y', '118.18845055007', '26.643807791057', '3', 'tr_0 tr_350000 tr_350700 ', '0');
INSERT INTO `provinces` VALUES ('350703', '建阳区', '350700', '', '0', '0', 'J', '118.12752522464', '27.337502466188', '3', 'tr_0 tr_350000 tr_350700 ', '0');
INSERT INTO `provinces` VALUES ('350721', '顺昌县', '350700', '', '0', '0', 'S', '117.81651928091', '26.799104367214', '3', 'tr_0 tr_350000 tr_350700 ', '0');
INSERT INTO `provinces` VALUES ('350722', '浦城县', '350700', '', '0', '0', 'P', '118.54743912328', '27.923390046145', '3', 'tr_0 tr_350000 tr_350700 ', '0');
INSERT INTO `provinces` VALUES ('350723', '光泽县', '350700', '', '0', '0', 'G', '117.34048158963', '27.547272859205', '3', 'tr_0 tr_350000 tr_350700 ', '0');
INSERT INTO `provinces` VALUES ('350724', '松溪县', '350700', '', '0', '0', 'S', '118.79145438278', '27.532554907167', '3', 'tr_0 tr_350000 tr_350700 ', '0');
INSERT INTO `provinces` VALUES ('350725', '政和县', '350700', '', '0', '0', 'Z', '118.86358723724', '27.371749198234', '3', 'tr_0 tr_350000 tr_350700 ', '0');
INSERT INTO `provinces` VALUES ('350781', '邵武市', '350700', '', '0', '0', 'S', '117.4994195021', '27.346469966261', '3', 'tr_0 tr_350000 tr_350700 ', '0');
INSERT INTO `provinces` VALUES ('350782', '武夷山市', '350700', '', '0', '0', 'W', '118.04157715009', '27.762553910259', '3', 'tr_0 tr_350000 tr_350700 ', '0');
INSERT INTO `provinces` VALUES ('350783', '建瓯市', '350700', '', '0', '0', 'J', '118.31146073369', '27.028955089429', '3', 'tr_0 tr_350000 tr_350700 ', '0');
INSERT INTO `provinces` VALUES ('350802', '新罗区', '350800', '', '0', '0', 'X', '117.04354293052', '25.104077629635', '3', 'tr_0 tr_350000 tr_350800 ', '0');
INSERT INTO `provinces` VALUES ('350803', '永定区', '350800', '', '0', '0', 'Y', '116.89244722515', '24.869137411287', '3', 'tr_0 tr_350000 tr_350800 ', '0');
INSERT INTO `provinces` VALUES ('350821', '长汀县', '350800', '', '0', '0', 'Z', '116.36356796988', '25.83918461828', '3', 'tr_0 tr_350000 tr_350800 ', '0');
INSERT INTO `provinces` VALUES ('350823', '上杭县', '350800', '', '0', '0', 'S', '116.42644288776', '25.055570401525', '3', 'tr_0 tr_350000 tr_350800 ', '0');
INSERT INTO `provinces` VALUES ('350824', '武平县', '350800', '', '0', '0', 'W', '116.10758916743', '25.100855173343', '3', 'tr_0 tr_350000 tr_350800 ', '0');
INSERT INTO `provinces` VALUES ('350825', '连城县', '350800', '', '0', '0', 'L', '116.76044617118', '25.716337381852', '3', 'tr_0 tr_350000 tr_350800 ', '0');
INSERT INTO `provinces` VALUES ('350881', '漳平市', '350800', '', '0', '0', 'Z', '117.42655632526', '25.295743499252', '3', 'tr_0 tr_350000 tr_350800 ', '0');
INSERT INTO `provinces` VALUES ('341502', '金安区', '341500', '', '0', '0', 'J', '116.54543837997', '31.756287719901', '3', 'tr_0 tr_340000 tr_341500 ', '0');
INSERT INTO `provinces` VALUES ('341503', '裕安区', '341500', '', '0', '0', 'Y', '116.48654978261', '31.74362587083', '3', 'tr_0 tr_340000 tr_341500 ', '0');
INSERT INTO `provinces` VALUES ('341504', '叶集区', '341500', '', '0', '0', 'Y', '115.94747592742', '31.83526314225', '3', 'tr_0 tr_340000 tr_341500 ', '0');
INSERT INTO `provinces` VALUES ('341522', '霍邱县', '341500', '', '0', '0', 'H', '116.28439133776', '32.359343590922', '3', 'tr_0 tr_340000 tr_341500 ', '0');
INSERT INTO `provinces` VALUES ('341523', '舒城县', '341500', '', '0', '0', 'S', '116.95560171142', '31.467692010556', '3', 'tr_0 tr_340000 tr_341500 ', '0');
INSERT INTO `provinces` VALUES ('341524', '金寨县', '341500', '', '0', '0', 'J', '115.94044120714', '31.733461734381', '3', 'tr_0 tr_340000 tr_341500 ', '0');
INSERT INTO `provinces` VALUES ('341525', '霍山县', '341500', '', '0', '0', 'H', '116.33957586218', '31.398570812489', '3', 'tr_0 tr_340000 tr_341500 ', '0');
INSERT INTO `provinces` VALUES ('350902', '蕉城区', '350900', '', '0', '0', 'J', '119.53344242699', '26.666738555955', '3', 'tr_0 tr_350000 tr_350900 ', '0');
INSERT INTO `provinces` VALUES ('350921', '霞浦县', '350900', '', '0', '0', 'X', '120.01142710564', '26.891348873767', '3', 'tr_0 tr_350000 tr_350900 ', '0');
INSERT INTO `provinces` VALUES ('350922', '古田县', '350900', '', '0', '0', 'G', '118.75257823557', '26.583261752073', '3', 'tr_0 tr_350000 tr_350900 ', '0');
INSERT INTO `provinces` VALUES ('350923', '屏南县', '350900', '', '0', '0', 'P', '118.99259621521', '26.914264918059', '3', 'tr_0 tr_350000 tr_350900 ', '0');
INSERT INTO `provinces` VALUES ('350924', '寿宁县', '350900', '', '0', '0', 'S', '119.51142504878', '27.466649659969', '3', 'tr_0 tr_350000 tr_350900 ', '0');
INSERT INTO `provinces` VALUES ('350925', '周宁县', '350900', '', '0', '0', 'Z', '119.34556712964', '27.110239280448', '3', 'tr_0 tr_350000 tr_350900 ', '0');
INSERT INTO `provinces` VALUES ('350926', '柘荣县', '350900', '', '0', '0', 'Z', '119.90745668696', '27.239961876352', '3', 'tr_0 tr_350000 tr_350900 ', '0');
INSERT INTO `provinces` VALUES ('350981', '福安市', '350900', '', '0', '0', 'F', '119.65440636048', '27.09432350806', '3', 'tr_0 tr_350000 tr_350900 ', '0');
INSERT INTO `provinces` VALUES ('350982', '福鼎市', '350900', '', '0', '0', 'F', '120.22345190932', '27.330524972528', '3', 'tr_0 tr_350000 tr_350900 ', '0');
INSERT INTO `provinces` VALUES ('360102', '东湖区', '360100', '', '0', '0', 'D', '115.90546602606', '28.691259179775', '3', 'tr_0 tr_360000 tr_360100 ', '0');
INSERT INTO `provinces` VALUES ('360103', '西湖区', '360100', '', '0', '0', 'X', '115.88353569365', '28.661976709901', '3', 'tr_0 tr_360000 tr_360100 ', '0');
INSERT INTO `provinces` VALUES ('360104', '青云谱区', '360100', '', '0', '0', 'Q', '115.93141618579', '28.627235736484', '3', 'tr_0 tr_360000 tr_360100 ', '0');
INSERT INTO `provinces` VALUES ('360105', '湾里区', '360100', '', '0', '0', 'W', '115.73759563309', '28.720195384308', '3', 'tr_0 tr_360000 tr_360100 ', '0');
INSERT INTO `provinces` VALUES ('360111', '青山湖区', '360100', '', '0', '0', 'Q', '115.96855240505', '28.687596006173', '3', 'tr_0 tr_360000 tr_360100 ', '0');
INSERT INTO `provinces` VALUES ('360112', '新建区', '360100', '', '0', '0', 'X', '115.8214509253', '28.698748625155', '3', 'tr_0 tr_360000 tr_360100 ', '0');
INSERT INTO `provinces` VALUES ('360121', '南昌县', '360100', '', '0', '0', 'N', '115.95046017277', '28.551604186108', '3', 'tr_0 tr_360000 tr_360100 ', '0');
INSERT INTO `provinces` VALUES ('360123', '安义县', '360100', '', '0', '0', 'A', '115.55544146387', '28.850794273751', '3', 'tr_0 tr_360000 tr_360100 ', '0');
INSERT INTO `provinces` VALUES ('360124', '进贤县', '360100', '', '0', '0', 'J', '116.24853779343', '28.382758944474', '3', 'tr_0 tr_360000 tr_360100 ', '0');
INSERT INTO `provinces` VALUES ('360202', '昌江区', '360200', '', '0', '0', 'C', '117.19057910346', '29.27885446447', '3', 'tr_0 tr_360000 tr_360200 ', '0');
INSERT INTO `provinces` VALUES ('360203', '珠山区', '360200', '', '0', '0', 'Z', '117.20954826159', '29.305778220374', '3', 'tr_0 tr_360000 tr_360200 ', '0');
INSERT INTO `provinces` VALUES ('360222', '浮梁县', '360200', '', '0', '0', 'F', '117.22146608079', '29.357788237529', '3', 'tr_0 tr_360000 tr_360200 ', '0');
INSERT INTO `provinces` VALUES ('360281', '乐平市', '360200', '', '0', '0', 'L', '117.15851067473', '28.984363669039', '3', 'tr_0 tr_360000 tr_360200 ', '0');
INSERT INTO `provinces` VALUES ('360302', '安源区', '360300', '', '0', '0', 'A', '113.87743991926', '27.621307703862', '3', 'tr_0 tr_360000 tr_360300 ', '0');
INSERT INTO `provinces` VALUES ('360313', '湘东区', '360300', '', '0', '0', 'X', '113.74049971211', '27.645875074875', '3', 'tr_0 tr_360000 tr_360300 ', '0');
INSERT INTO `provinces` VALUES ('360321', '莲花县', '360300', '', '0', '0', 'L', '113.96854067422', '27.133462711028', '3', 'tr_0 tr_360000 tr_360300 ', '0');
INSERT INTO `provinces` VALUES ('360322', '上栗县', '360300', '', '0', '0', 'S', '113.80153822404', '27.886415692068', '3', 'tr_0 tr_360000 tr_360300 ', '0');
INSERT INTO `provinces` VALUES ('360323', '芦溪县', '360300', '', '0', '0', 'L', '114.03651940468', '27.6366047187', '3', 'tr_0 tr_360000 tr_360300 ', '0');
INSERT INTO `provinces` VALUES ('360402', '濂溪区', '360400', '', '0', '0', 'L', '116.00753491163', '29.711340559079', '3', 'tr_0 tr_360000 tr_360400 ', '0');
INSERT INTO `provinces` VALUES ('360403', '浔阳区', '360400', '', '0', '0', 'X', '115.99655806746', '29.733093751939', '3', 'tr_0 tr_360000 tr_360400 ', '0');
INSERT INTO `provinces` VALUES ('360404', '柴桑区', '360400', '', '0', '0', 'C', '115.91740154188', '29.614804909379', '3', 'tr_0 tr_360000 tr_360400 ', '0');
INSERT INTO `provinces` VALUES ('360423', '武宁县', '360400', '', '0', '0', 'W', '115.10744177399', '29.2623521507', '3', 'tr_0 tr_360000 tr_360400 ', '0');
INSERT INTO `provinces` VALUES ('360424', '修水县', '360400', '', '0', '0', 'X', '114.55356797639', '29.031175867959', '3', 'tr_0 tr_360000 tr_360400 ', '0');
INSERT INTO `provinces` VALUES ('360425', '永修县', '360400', '', '0', '0', 'Y', '115.81540658685', '29.028005616261', '3', 'tr_0 tr_360000 tr_360400 ', '0');
INSERT INTO `provinces` VALUES ('360426', '德安县', '360400', '', '0', '0', 'D', '115.76257795847', '29.319172496312', '3', 'tr_0 tr_360000 tr_360400 ', '0');
INSERT INTO `provinces` VALUES ('360428', '都昌县', '360400', '', '0', '0', 'D', '116.21055204665', '29.278965044767', '3', 'tr_0 tr_360000 tr_360400 ', '0');
INSERT INTO `provinces` VALUES ('360429', '湖口县', '360400', '', '0', '0', 'H', '116.25847134559', '29.737131514562', '3', 'tr_0 tr_360000 tr_360400 ', '0');
INSERT INTO `provinces` VALUES ('360430', '彭泽县', '360400', '', '0', '0', 'P', '116.55550980644', '29.902122004906', '3', 'tr_0 tr_360000 tr_360400 ', '0');
INSERT INTO `provinces` VALUES ('360481', '瑞昌市', '360400', '', '0', '0', 'R', '115.68742967207', '29.681951286531', '3', 'tr_0 tr_360000 tr_360400 ', '0');
INSERT INTO `provinces` VALUES ('360482', '共青城市', '360400', '', '0', '0', 'G', '115.82142002359', '29.248741173716', '3', 'tr_0 tr_360000 tr_360400 ', '0');
INSERT INTO `provinces` VALUES ('360483', '庐山市', '360400', '', '0', '0', 'L', '116.05142593917', '29.454539165717', '3', 'tr_0 tr_360000 tr_360400 ', '0');
INSERT INTO `provinces` VALUES ('360502', '渝水区', '360500', '', '0', '0', 'Y', '114.9514238934', '27.806839650444', '3', 'tr_0 tr_360000 tr_360500 ', '0');
INSERT INTO `provinces` VALUES ('360521', '分宜县', '360500', '', '0', '0', 'F', '114.69847247036', '27.820731344374', '3', 'tr_0 tr_360000 tr_360500 ', '0');
INSERT INTO `provinces` VALUES ('360602', '月湖区', '360600', '', '0', '0', 'Y', '117.04354760171', '28.245078331555', '3', 'tr_0 tr_360000 tr_360600 ', '0');
INSERT INTO `provinces` VALUES ('360603', '余江区', '360600', '', '0', '0', 'Y', '116.82459362864', '28.215353761359', '3', 'tr_0 tr_360000 tr_360600 ', '0');
INSERT INTO `provinces` VALUES ('360681', '贵溪市', '360600', '', '0', '0', 'G', '117.25139869833', '28.298735072105', '3', 'tr_0 tr_360000 tr_360600 ', '0');
INSERT INTO `provinces` VALUES ('360702', '章贡区', '360700', '', '0', '0', 'Z', '114.9275508855', '25.823747013882', '3', 'tr_0 tr_360000 tr_360700 ', '0');
INSERT INTO `provinces` VALUES ('360703', '南康区', '360700', '', '0', '0', 'N', '114.77153821509', '25.66705293056', '3', 'tr_0 tr_360000 tr_360700 ', '0');
INSERT INTO `provinces` VALUES ('360704', '赣县区', '360700', '', '0', '0', 'G', '115.01857016415', '25.866384616621', '3', 'tr_0 tr_360000 tr_360700 ', '0');
INSERT INTO `provinces` VALUES ('360722', '信丰县', '360700', '', '0', '0', 'X', '114.92952113897', '25.391975120014', '3', 'tr_0 tr_360000 tr_360700 ', '0');
INSERT INTO `provinces` VALUES ('360723', '大余县', '360700', '', '0', '0', 'D', '114.36840663965', '25.407637298367', '3', 'tr_0 tr_360000 tr_360700 ', '0');
INSERT INTO `provinces` VALUES ('360724', '上犹县', '360700', '', '0', '0', 'S', '114.55854863129', '25.790518799476', '3', 'tr_0 tr_360000 tr_360700 ', '0');
INSERT INTO `provinces` VALUES ('360725', '崇义县', '360700', '', '0', '0', 'C', '114.31457244808', '25.687687192664', '3', 'tr_0 tr_360000 tr_360700 ', '0');
INSERT INTO `provinces` VALUES ('360726', '安远县', '360700', '', '0', '0', 'A', '115.40055913129', '25.142743431732', '3', 'tr_0 tr_360000 tr_360700 ', '0');
INSERT INTO `provinces` VALUES ('360727', '龙南县', '360700', '', '0', '0', 'L', '114.79655413709', '24.916599461157', '3', 'tr_0 tr_360000 tr_360700 ', '0');
INSERT INTO `provinces` VALUES ('360728', '定南县', '360700', '', '0', '0', 'D', '115.0345637751', '24.789783831846', '3', 'tr_0 tr_360000 tr_360700 ', '0');
INSERT INTO `provinces` VALUES ('360729', '全南县', '360700', '', '0', '0', 'Q', '114.53658236666', '24.748206354967', '3', 'tr_0 tr_360000 tr_360700 ', '0');
INSERT INTO `provinces` VALUES ('360730', '宁都县', '360700', '', '0', '0', 'N', '116.01549443743', '26.47597950334', '3', 'tr_0 tr_360000 tr_360700 ', '0');
INSERT INTO `provinces` VALUES ('360731', '于都县', '360700', '', '0', '0', 'Y', '115.42149926153', '25.957893942751', '3', 'tr_0 tr_360000 tr_360700 ', '0');
INSERT INTO `provinces` VALUES ('360732', '兴国县', '360700', '', '0', '0', 'X', '115.36955169119', '26.343882588243', '3', 'tr_0 tr_360000 tr_360700 ', '0');
INSERT INTO `provinces` VALUES ('360733', '会昌县', '360700', '', '0', '0', 'H', '115.79245964209', '25.606661833811', '3', 'tr_0 tr_360000 tr_360700 ', '0');
INSERT INTO `provinces` VALUES ('360734', '寻乌县', '360700', '', '0', '0', 'X', '115.65351531535', '24.96944654678', '3', 'tr_0 tr_360000 tr_360700 ', '0');
INSERT INTO `provinces` VALUES ('360735', '石城县', '360700', '', '0', '0', 'S', '116.35259426977', '26.318972346784', '3', 'tr_0 tr_360000 tr_360700 ', '0');
INSERT INTO `provinces` VALUES ('360781', '瑞金市', '360700', '', '0', '0', 'R', '116.03342066286', '25.891666273953', '3', 'tr_0 tr_360000 tr_360700 ', '0');
INSERT INTO `provinces` VALUES ('360802', '吉州区', '360800', '', '0', '0', 'J', '115.00153936965', '27.149314993877', '3', 'tr_0 tr_360000 tr_360800 ', '0');
INSERT INTO `provinces` VALUES ('360803', '青原区', '360800', '', '0', '0', 'Q', '115.02156071302', '27.087662535191', '3', 'tr_0 tr_360000 tr_360800 ', '0');
INSERT INTO `provinces` VALUES ('360821', '吉安县', '360800', '', '0', '0', 'J', '114.9145913014', '27.044989078994', '3', 'tr_0 tr_360000 tr_360800 ', '0');
INSERT INTO `provinces` VALUES ('360822', '吉水县', '360800', '', '0', '0', 'J', '115.14256983128', '27.235259745039', '3', 'tr_0 tr_360000 tr_360800 ', '0');
INSERT INTO `provinces` VALUES ('360823', '峡江县', '360800', '', '0', '0', 'X', '115.32240322821', '27.588234617615', '3', 'tr_0 tr_360000 tr_360800 ', '0');
INSERT INTO `provinces` VALUES ('360824', '新干县', '360800', '', '0', '0', 'X', '115.39359474833', '27.746080951713', '3', 'tr_0 tr_360000 tr_360800 ', '0');
INSERT INTO `provinces` VALUES ('360825', '永丰县', '360800', '', '0', '0', 'Y', '115.44740243989', '27.324342103714', '3', 'tr_0 tr_360000 tr_360800 ', '0');
INSERT INTO `provinces` VALUES ('360826', '泰和县', '360800', '', '0', '0', 'T', '114.91559111544', '26.795697341165', '3', 'tr_0 tr_360000 tr_360800 ', '0');
INSERT INTO `provinces` VALUES ('360827', '遂川县', '360800', '', '0', '0', 'S', '114.52756212171', '26.319517284146', '3', 'tr_0 tr_360000 tr_360800 ', '0');
INSERT INTO `provinces` VALUES ('360828', '万安县', '360800', '', '0', '0', 'W', '114.79257715894', '26.464072836341', '3', 'tr_0 tr_360000 tr_360800 ', '0');
INSERT INTO `provinces` VALUES ('360829', '安福县', '360800', '', '0', '0', 'A', '114.62647813461', '27.399076477105', '3', 'tr_0 tr_360000 tr_360800 ', '0');
INSERT INTO `provinces` VALUES ('360830', '永新县', '360800', '', '0', '0', 'Y', '114.2494149359', '26.951537256563', '3', 'tr_0 tr_360000 tr_360800 ', '0');
INSERT INTO `provinces` VALUES ('360881', '井冈山市', '360800', '', '0', '0', 'J', '114.29555585942', '26.753709741566', '3', 'tr_0 tr_360000 tr_360800 ', '0');
INSERT INTO `provinces` VALUES ('360902', '袁州区', '360900', '', '0', '0', 'Y', '114.43456118111', '27.802582705304', '3', 'tr_0 tr_360000 tr_360900 ', '0');
INSERT INTO `provinces` VALUES ('360921', '奉新县', '360900', '', '0', '0', 'F', '115.40655109853', '28.694028951458', '3', 'tr_0 tr_360000 tr_360900 ', '0');
INSERT INTO `provinces` VALUES ('360922', '万载县', '360900', '', '0', '0', 'W', '114.45253654385', '28.112133306116', '3', 'tr_0 tr_360000 tr_360900 ', '0');
INSERT INTO `provinces` VALUES ('360923', '上高县', '360900', '', '0', '0', 'S', '114.93154115857', '28.238815490252', '3', 'tr_0 tr_360000 tr_360900 ', '0');
INSERT INTO `provinces` VALUES ('360924', '宜丰县', '360900', '', '0', '0', 'Y', '114.80951713475', '28.400373307265', '3', 'tr_0 tr_360000 tr_360900 ', '0');
INSERT INTO `provinces` VALUES ('360925', '靖安县', '360900', '', '0', '0', 'J', '115.36955312848', '28.867081916186', '3', 'tr_0 tr_360000 tr_360900 ', '0');
INSERT INTO `provinces` VALUES ('360926', '铜鼓县', '360900', '', '0', '0', 'T', '114.37741107441', '28.52708345654', '3', 'tr_0 tr_360000 tr_360900 ', '0');
INSERT INTO `provinces` VALUES ('360981', '丰城市', '360900', '', '0', '0', 'F', '115.77747842145', '28.166614024369', '3', 'tr_0 tr_360000 tr_360900 ', '0');
INSERT INTO `provinces` VALUES ('360982', '樟树市', '360900', '', '0', '0', 'Z', '115.55241893533', '28.062153117648', '3', 'tr_0 tr_360000 tr_360900 ', '0');
INSERT INTO `provinces` VALUES ('360983', '高安市', '360900', '', '0', '0', 'G', '115.38256535328', '28.422857002119', '3', 'tr_0 tr_360000 tr_360900 ', '0');
INSERT INTO `provinces` VALUES ('361002', '临川区', '361000', '', '0', '0', 'L', '116.31848983161', '27.940458992864', '3', 'tr_0 tr_360000 tr_361000 ', '0');
INSERT INTO `provinces` VALUES ('361003', '东乡区', '361000', '', '0', '0', 'D', '116.60954171505', '28.253977397999', '3', 'tr_0 tr_360000 tr_361000 ', '0');
INSERT INTO `provinces` VALUES ('361021', '南城县', '361000', '', '0', '0', 'N', '116.64339884971', '27.57624096656', '3', 'tr_0 tr_360000 tr_361000 ', '0');
INSERT INTO `provinces` VALUES ('361022', '黎川县', '361000', '', '0', '0', 'L', '116.91450700338', '27.288340234831', '3', 'tr_0 tr_360000 tr_361000 ', '0');
INSERT INTO `provinces` VALUES ('361023', '南丰县', '361000', '', '0', '0', 'N', '116.53140350859', '27.224733524876', '3', 'tr_0 tr_360000 tr_361000 ', '0');
INSERT INTO `provinces` VALUES ('361024', '崇仁县', '361000', '', '0', '0', 'C', '116.08354898488', '27.759079756014', '3', 'tr_0 tr_360000 tr_361000 ', '0');
INSERT INTO `provinces` VALUES ('361025', '乐安县', '361000', '', '0', '0', 'L', '115.83749627865', '27.434079864498', '3', 'tr_0 tr_360000 tr_361000 ', '0');
INSERT INTO `provinces` VALUES ('361026', '宜黄县', '361000', '', '0', '0', 'Y', '116.24254169398', '27.5605634607', '3', 'tr_0 tr_360000 tr_361000 ', '0');
INSERT INTO `provinces` VALUES ('361027', '金溪县', '361000', '', '0', '0', 'J', '116.76040404065', '27.925329188976', '3', 'tr_0 tr_360000 tr_361000 ', '0');
INSERT INTO `provinces` VALUES ('361028', '资溪县', '361000', '', '0', '0', 'Z', '117.06657027361', '27.711845785732', '3', 'tr_0 tr_360000 tr_361000 ', '0');
INSERT INTO `provinces` VALUES ('361030', '广昌县', '361000', '', '0', '0', 'G', '116.34256064638', '26.848454446681', '3', 'tr_0 tr_360000 tr_361000 ', '0');
INSERT INTO `provinces` VALUES ('361102', '信州区', '361100', '', '0', '0', 'X', '117.97341184157', '28.437628311', '3', 'tr_0 tr_360000 tr_361100 ', '0');
INSERT INTO `provinces` VALUES ('361103', '广丰区', '361100', '', '0', '0', 'G', '118.19742022042', '28.442615061205', '3', 'tr_0 tr_360000 tr_361100 ', '0');
INSERT INTO `provinces` VALUES ('361121', '上饶县', '361100', '', '0', '0', 'S', '117.91558441252', '28.45418687477', '3', 'tr_0 tr_360000 tr_361100 ', '0');
INSERT INTO `provinces` VALUES ('361123', '玉山县', '361100', '', '0', '0', 'Y', '118.2515628901', '28.687749687317', '3', 'tr_0 tr_360000 tr_361100 ', '0');
INSERT INTO `provinces` VALUES ('361124', '铅山县', '361100', '', '0', '0', 'Q', '117.71642163695', '28.321504694791', '3', 'tr_0 tr_360000 tr_361100 ', '0');
INSERT INTO `provinces` VALUES ('361125', '横峰县', '361100', '', '0', '0', 'H', '117.60239738302', '28.413440462384', '3', 'tr_0 tr_360000 tr_361100 ', '0');
INSERT INTO `provinces` VALUES ('361126', '弋阳县', '361100', '', '0', '0', 'Y', '117.45550637624', '28.384082001231', '3', 'tr_0 tr_360000 tr_361100 ', '0');
INSERT INTO `provinces` VALUES ('361127', '余干县', '361100', '', '0', '0', 'Y', '116.70160096199', '28.707866244419', '3', 'tr_0 tr_360000 tr_361100 ', '0');
INSERT INTO `provinces` VALUES ('361128', '鄱阳县', '361100', '', '0', '0', 'P', '116.7105661408', '29.011452830922', '3', 'tr_0 tr_360000 tr_361100 ', '0');
INSERT INTO `provinces` VALUES ('361129', '万年县', '361100', '', '0', '0', 'W', '117.06459894217', '28.700054054129', '3', 'tr_0 tr_360000 tr_361100 ', '0');
INSERT INTO `provinces` VALUES ('361130', '婺源县', '361100', '', '0', '0', 'W', '117.86844502243', '29.254039048097', '3', 'tr_0 tr_360000 tr_361100 ', '0');
INSERT INTO `provinces` VALUES ('361181', '德兴市', '361100', '', '0', '0', 'D', '117.58547968518', '28.952564863028', '3', 'tr_0 tr_360000 tr_361100 ', '0');
INSERT INTO `provinces` VALUES ('341602', '谯城区', '341600', '', '0', '0', 'Q', '115.78547191853', '33.882663087443', '3', 'tr_0 tr_340000 tr_341600 ', '0');
INSERT INTO `provinces` VALUES ('341621', '涡阳县', '341600', '', '0', '0', 'W', '116.22160903516', '33.498566835004', '3', 'tr_0 tr_340000 tr_341600 ', '0');
INSERT INTO `provinces` VALUES ('341622', '蒙城县', '341600', '', '0', '0', 'M', '116.57158940083', '33.271658239674', '3', 'tr_0 tr_340000 tr_341600 ', '0');
INSERT INTO `provinces` VALUES ('341623', '利辛县', '341600', '', '0', '0', 'L', '116.1914935226', '33.155595841529', '3', 'tr_0 tr_340000 tr_341600 ', '0');
INSERT INTO `provinces` VALUES ('370102', '历下区', '370100', '', '0', '0', 'L', '117.0825673139', '36.672162950043', '3', 'tr_0 tr_370000 tr_370100 ', '0');
INSERT INTO `provinces` VALUES ('370103', '市中区', '370100', '', '0', '0', 'S', '117.00439910401', '36.657551673642', '3', 'tr_0 tr_370000 tr_370100 ', '0');
INSERT INTO `provinces` VALUES ('370104', '槐荫区', '370100', '', '0', '0', 'H', '116.90745837507', '36.657561734426', '3', 'tr_0 tr_370000 tr_370100 ', '0');
INSERT INTO `provinces` VALUES ('370105', '天桥区', '370100', '', '0', '0', 'T', '116.99339917338', '36.684067874353', '3', 'tr_0 tr_370000 tr_370100 ', '0');
INSERT INTO `provinces` VALUES ('370112', '历城区', '370100', '', '0', '0', 'L', '117.07158975107', '36.685655534711', '3', 'tr_0 tr_370000 tr_370100 ', '0');
INSERT INTO `provinces` VALUES ('370113', '长清区', '370100', '', '0', '0', 'Z', '116.75838709095', '36.56021587991', '3', 'tr_0 tr_370000 tr_370100 ', '0');
INSERT INTO `provinces` VALUES ('370114', '章丘区', '370100', '', '0', '0', 'Z', '117.53256537437', '36.68553275142', '3', 'tr_0 tr_370000 tr_370100 ', '0');
INSERT INTO `provinces` VALUES ('370115', '济阳区', '370100', '', '0', '0', 'J', '117.18062113319', '36.983970518315', '3', 'tr_0 tr_370000 tr_370100 ', '0');
INSERT INTO `provinces` VALUES ('370124', '平阴县', '370100', '', '0', '0', 'P', '116.46261667806', '36.294861321066', '3', 'tr_0 tr_370000 tr_370100 ', '0');
INSERT INTO `provinces` VALUES ('370126', '商河县', '370100', '', '0', '0', 'S', '117.1635297929', '37.314970715556', '3', 'tr_0 tr_370000 tr_370100 ', '0');
INSERT INTO `provinces` VALUES ('370171', '济南高新技术产业开发区', '370100', '', '0', '0', 'J', '117.12639941261', '36.656554201787', '3', 'tr_0 tr_370000 tr_370100 ', '0');
INSERT INTO `provinces` VALUES ('370202', '市南区', '370200', '', '0', '0', 'S', '120.41858472358', '36.081465640234', '3', 'tr_0 tr_370000 tr_370200 ', '0');
INSERT INTO `provinces` VALUES ('370203', '市北区', '370200', '', '0', '0', 'S', '120.38140448734', '36.09344959486', '3', 'tr_0 tr_370000 tr_370200 ', '0');
INSERT INTO `provinces` VALUES ('370211', '黄岛区', '370200', '', '0', '0', 'H', '120.20454654768', '35.966382870945', '3', 'tr_0 tr_370000 tr_370200 ', '0');
INSERT INTO `provinces` VALUES ('370212', '崂山区', '370200', '', '0', '0', 'L', '120.47539724708', '36.113499423971', '3', 'tr_0 tr_370000 tr_370200 ', '0');
INSERT INTO `provinces` VALUES ('370213', '李沧区', '370200', '', '0', '0', 'L', '120.43960282675', '36.151024667784', '3', 'tr_0 tr_370000 tr_370200 ', '0');
INSERT INTO `provinces` VALUES ('370214', '城阳区', '370200', '', '0', '0', 'C', '120.40252679394', '36.31288619735', '3', 'tr_0 tr_370000 tr_370200 ', '0');
INSERT INTO `provinces` VALUES ('370215', '即墨区', '370200', '', '0', '0', 'J', '120.45353617402', '36.394749170322', '3', 'tr_0 tr_370000 tr_370200 ', '0');
INSERT INTO `provinces` VALUES ('370271', '青岛高新技术产业开发区', '370200', '', '0', '0', 'Q', '120.44085344768', '36.124685571214', '3', 'tr_0 tr_370000 tr_370200 ', '0');
INSERT INTO `provinces` VALUES ('370281', '胶州市', '370200', '', '0', '0', 'J', '120.03953537127', '36.270349088049', '3', 'tr_0 tr_370000 tr_370200 ', '0');
INSERT INTO `provinces` VALUES ('370283', '平度市', '370200', '', '0', '0', 'P', '119.99441429398', '36.782692254089', '3', 'tr_0 tr_370000 tr_370200 ', '0');
INSERT INTO `provinces` VALUES ('370285', '莱西市', '370200', '', '0', '0', 'L', '120.52455620764', '36.893956298026', '3', 'tr_0 tr_370000 tr_370200 ', '0');
INSERT INTO `provinces` VALUES ('370302', '淄川区', '370300', '', '0', '0', 'Z', '117.97341185763', '36.649834806022', '3', 'tr_0 tr_370000 tr_370300 ', '0');
INSERT INTO `provinces` VALUES ('370303', '张店区', '370300', '', '0', '0', 'Z', '118.02459110728', '36.811941952144', '3', 'tr_0 tr_370000 tr_370300 ', '0');
INSERT INTO `provinces` VALUES ('370304', '博山区', '370300', '', '0', '0', 'B', '117.86846875372', '36.500847855131', '3', 'tr_0 tr_370000 tr_370300 ', '0');
INSERT INTO `provinces` VALUES ('370305', '临淄区', '370300', '', '0', '0', 'L', '118.31539460935', '36.832293635152', '3', 'tr_0 tr_370000 tr_370300 ', '0');
INSERT INTO `provinces` VALUES ('370306', '周村区', '370300', '', '0', '0', 'Z', '117.87648217785', '36.808994352212', '3', 'tr_0 tr_370000 tr_370300 ', '0');
INSERT INTO `provinces` VALUES ('370321', '桓台县', '370300', '', '0', '0', 'H', '118.10443420779', '36.965607980118', '3', 'tr_0 tr_370000 tr_370300 ', '0');
INSERT INTO `provinces` VALUES ('370322', '高青县', '370300', '', '0', '0', 'G', '117.83339432525', '37.177268654333', '3', 'tr_0 tr_370000 tr_370300 ', '0');
INSERT INTO `provinces` VALUES ('370323', '沂源县', '370300', '', '0', '0', 'Y', '118.17748944237', '36.190916985848', '3', 'tr_0 tr_370000 tr_370300 ', '0');
INSERT INTO `provinces` VALUES ('370402', '市中区', '370400', '', '0', '0', 'S', '117.56256581399', '34.86996272507', '3', 'tr_0 tr_370000 tr_370400 ', '0');
INSERT INTO `provinces` VALUES ('370403', '薛城区', '370400', '', '0', '0', 'X', '117.26945761931', '34.801124568639', '3', 'tr_0 tr_370000 tr_370400 ', '0');
INSERT INTO `provinces` VALUES ('370404', '峄城区', '370400', '', '0', '0', 'Y', '117.59639060967', '34.778599873011', '3', 'tr_0 tr_370000 tr_370400 ', '0');
INSERT INTO `provinces` VALUES ('370405', '台儿庄区', '370400', '', '0', '0', 'T', '117.74042545412', '34.568763215633', '3', 'tr_0 tr_370000 tr_370400 ', '0');
INSERT INTO `provinces` VALUES ('370406', '山亭区', '370400', '', '0', '0', 'S', '117.46744316558', '35.105691980765', '3', 'tr_0 tr_370000 tr_370400 ', '0');
INSERT INTO `provinces` VALUES ('370481', '滕州市', '370400', '', '0', '0', 'T', '117.17256521921', '35.120034809574', '3', 'tr_0 tr_370000 tr_370400 ', '0');
INSERT INTO `provinces` VALUES ('370502', '东营区', '370500', '', '0', '0', 'D', '118.58846268607', '37.454847320166', '3', 'tr_0 tr_370000 tr_370500 ', '0');
INSERT INTO `provinces` VALUES ('370503', '河口区', '370500', '', '0', '0', 'H', '118.53250516975', '37.891120201056', '3', 'tr_0 tr_370000 tr_370500 ', '0');
INSERT INTO `provinces` VALUES ('370505', '垦利区', '370500', '', '0', '0', 'K', '118.58143173867', '37.578555133809', '3', 'tr_0 tr_370000 tr_370500 ', '0');
INSERT INTO `provinces` VALUES ('370522', '利津县', '370500', '', '0', '0', 'L', '118.26161799914', '37.495860299031', '3', 'tr_0 tr_370000 tr_370500 ', '0');
INSERT INTO `provinces` VALUES ('370523', '广饶县', '370500', '', '0', '0', 'G', '118.41349864392', '37.059638498906', '3', 'tr_0 tr_370000 tr_370500 ', '0');
INSERT INTO `provinces` VALUES ('370571', '东营经济技术开发区', '370500', '', '0', '0', 'D', '118.58846268607', '37.454847320166', '3', 'tr_0 tr_370000 tr_370500 ', '0');
INSERT INTO `provinces` VALUES ('370572', '东营港经济开发区', '370500', '', '0', '0', 'D', '118.96520739607', '38.098236253355', '3', 'tr_0 tr_370000 tr_370500 ', '0');
INSERT INTO `provinces` VALUES ('370602', '芝罘区', '370600', '', '0', '0', 'Z', '121.40654004549', '37.546312866891', '3', 'tr_0 tr_370000 tr_370600 ', '0');
INSERT INTO `provinces` VALUES ('370611', '福山区', '370600', '', '0', '0', 'F', '121.27460474744', '37.503668228451', '3', 'tr_0 tr_370000 tr_370600 ', '0');
INSERT INTO `provinces` VALUES ('370612', '牟平区', '370600', '', '0', '0', 'M', '121.60654911474', '37.392915451796', '3', 'tr_0 tr_370000 tr_370600 ', '0');
INSERT INTO `provinces` VALUES ('370613', '莱山区', '370600', '', '0', '0', 'L', '121.4513806718', '37.517648584109', '3', 'tr_0 tr_370000 tr_370600 ', '0');
INSERT INTO `provinces` VALUES ('370634', '长岛县', '370600', '', '0', '0', 'Z', '120.74342978244', '37.927628387579', '3', 'tr_0 tr_370000 tr_370600 ', '0');
INSERT INTO `provinces` VALUES ('370671', '烟台高新技术产业开发区', '370600', '', '0', '0', 'Y', '121.4544154173', '37.470038383731', '3', 'tr_0 tr_370000 tr_370600 ', '0');
INSERT INTO `provinces` VALUES ('370672', '烟台经济技术开发区', '370600', '', '0', '0', 'Y', '121.12513892753', '37.636399945094', '3', 'tr_0 tr_370000 tr_370600 ', '0');
INSERT INTO `provinces` VALUES ('370681', '龙口市', '370600', '', '0', '0', 'L', '120.48536852807', '37.652555125496', '3', 'tr_0 tr_370000 tr_370600 ', '0');
INSERT INTO `provinces` VALUES ('370682', '莱阳市', '370600', '', '0', '0', 'L', '120.71841430958', '36.984635568304', '3', 'tr_0 tr_370000 tr_370600 ', '0');
INSERT INTO `provinces` VALUES ('370683', '莱州市', '370600', '', '0', '0', 'L', '119.94859307737', '37.182636609074', '3', 'tr_0 tr_370000 tr_370600 ', '0');
INSERT INTO `provinces` VALUES ('370684', '蓬莱市', '370600', '', '0', '0', 'P', '120.76556151495', '37.816438725969', '3', 'tr_0 tr_370000 tr_370600 ', '0');
INSERT INTO `provinces` VALUES ('370685', '招远市', '370600', '', '0', '0', 'Z', '120.44060165265', '37.361137142566', '3', 'tr_0 tr_370000 tr_370600 ', '0');
INSERT INTO `provinces` VALUES ('370686', '栖霞市', '370600', '', '0', '0', 'Q', '120.85641658338', '37.3414181648', '3', 'tr_0 tr_370000 tr_370600 ', '0');
INSERT INTO `provinces` VALUES ('370687', '海阳市', '370600', '', '0', '0', 'H', '121.18045819779', '36.693269738228', '3', 'tr_0 tr_370000 tr_370600 ', '0');
INSERT INTO `provinces` VALUES ('370702', '潍城区', '370700', '', '0', '0', 'W', '119.03142854152', '36.73285441557', '3', 'tr_0 tr_370000 tr_370700 ', '0');
INSERT INTO `provinces` VALUES ('370703', '寒亭区', '370700', '', '0', '0', 'H', '119.22661514747', '36.780743786201', '3', 'tr_0 tr_370000 tr_370700 ', '0');
INSERT INTO `provinces` VALUES ('370704', '坊子区', '370700', '', '0', '0', 'F', '119.17240097265', '36.660741599701', '3', 'tr_0 tr_370000 tr_370700 ', '0');
INSERT INTO `provinces` VALUES ('370705', '奎文区', '370700', '', '0', '0', 'K', '119.13947052995', '36.712752014046', '3', 'tr_0 tr_370000 tr_370700 ', '0');
INSERT INTO `provinces` VALUES ('370724', '临朐县', '370700', '', '0', '0', 'L', '118.54944999641', '36.519129501828', '3', 'tr_0 tr_370000 tr_370700 ', '0');
INSERT INTO `provinces` VALUES ('370725', '昌乐县', '370700', '', '0', '0', 'C', '118.83648798144', '36.712996190845', '3', 'tr_0 tr_370000 tr_370700 ', '0');
INSERT INTO `provinces` VALUES ('370772', '潍坊滨海经济技术开发区', '370700', '', '0', '0', 'W', '119.16837791143', '36.712651551268', '3', 'tr_0 tr_370000 tr_370700 ', '0');
INSERT INTO `provinces` VALUES ('370781', '青州市', '370700', '', '0', '0', 'Q', '118.48653672087', '36.690416508705', '3', 'tr_0 tr_370000 tr_370700 ', '0');
INSERT INTO `provinces` VALUES ('370782', '诸城市', '370700', '', '0', '0', 'Z', '119.41640221867', '36.002008858076', '3', 'tr_0 tr_370000 tr_370700 ', '0');
INSERT INTO `provinces` VALUES ('370783', '寿光市', '370700', '', '0', '0', 'S', '118.79741537481', '36.861921746471', '3', 'tr_0 tr_370000 tr_370700 ', '0');
INSERT INTO `provinces` VALUES ('370784', '安丘市', '370700', '', '0', '0', 'A', '119.22560751818', '36.483842195596', '3', 'tr_0 tr_370000 tr_370700 ', '0');
INSERT INTO `provinces` VALUES ('370785', '高密市', '370700', '', '0', '0', 'G', '119.76241099602', '36.388956706465', '3', 'tr_0 tr_370000 tr_370700 ', '0');
INSERT INTO `provinces` VALUES ('370786', '昌邑市', '370700', '', '0', '0', 'C', '119.40440597739', '36.865161072622', '3', 'tr_0 tr_370000 tr_370700 ', '0');
INSERT INTO `provinces` VALUES ('370811', '任城区', '370800', '', '0', '0', 'R', '116.55446985374', '35.49373064026', '3', 'tr_0 tr_370000 tr_370800 ', '0');
INSERT INTO `provinces` VALUES ('370812', '兖州区', '370800', '', '0', '0', 'Y', '116.79011515173', '35.557952373283', '3', 'tr_0 tr_370000 tr_370800 ', '0');
INSERT INTO `provinces` VALUES ('370826', '微山县', '370800', '', '0', '0', 'W', '117.13541381857', '34.813315104239', '3', 'tr_0 tr_370000 tr_370800 ', '0');
INSERT INTO `provinces` VALUES ('370827', '鱼台县', '370800', '', '0', '0', 'Y', '116.65739284822', '35.017887717823', '3', 'tr_0 tr_370000 tr_370800 ', '0');
INSERT INTO `provinces` VALUES ('370828', '金乡县', '370800', '', '0', '0', 'J', '116.31852982171', '35.072569118665', '3', 'tr_0 tr_370000 tr_370800 ', '0');
INSERT INTO `provinces` VALUES ('370829', '嘉祥县', '370800', '', '0', '0', 'J', '116.34861308511', '35.413255044102', '3', 'tr_0 tr_370000 tr_370800 ', '0');
INSERT INTO `provinces` VALUES ('370830', '汶上县', '370800', '', '0', '0', 'W', '116.50544105765', '35.717055392628', '3', 'tr_0 tr_370000 tr_370800 ', '0');
INSERT INTO `provinces` VALUES ('370831', '泗水县', '370800', '', '0', '0', 'S', '117.25742858989', '35.670600481228', '3', 'tr_0 tr_370000 tr_370800 ', '0');
INSERT INTO `provinces` VALUES ('370832', '梁山县', '370800', '', '0', '0', 'L', '116.10262029578', '35.808063886611', '3', 'tr_0 tr_370000 tr_370800 ', '0');
INSERT INTO `provinces` VALUES ('370871', '济宁高新技术产业开发区', '370800', '', '0', '0', 'J', '116.59361234854', '35.42017739453', '3', 'tr_0 tr_370000 tr_370800 ', '0');
INSERT INTO `provinces` VALUES ('370881', '曲阜市', '370800', '', '0', '0', 'Q', '116.99341597169', '35.587372286488', '3', 'tr_0 tr_370000 tr_370800 ', '0');
INSERT INTO `provinces` VALUES ('370883', '邹城市', '370800', '', '0', '0', 'Z', '117.01440416129', '35.40752093245', '3', 'tr_0 tr_370000 tr_370800 ', '0');
INSERT INTO `provinces` VALUES ('370902', '泰山区', '370900', '', '0', '0', 'T', '117.14141108582', '36.199444601195', '3', 'tr_0 tr_370000 tr_370900 ', '0');
INSERT INTO `provinces` VALUES ('370911', '岱岳区', '370900', '', '0', '0', 'D', '117.04855647915', '36.193291242291', '3', 'tr_0 tr_370000 tr_370900 ', '0');
INSERT INTO `provinces` VALUES ('370921', '宁阳县', '370900', '', '0', '0', 'N', '116.81257853863', '35.764539097344', '3', 'tr_0 tr_370000 tr_370900 ', '0');
INSERT INTO `provinces` VALUES ('370923', '东平县', '370900', '', '0', '0', 'D', '116.47759421565', '35.941908015019', '3', 'tr_0 tr_370000 tr_370900 ', '0');
INSERT INTO `provinces` VALUES ('370982', '新泰市', '370900', '', '0', '0', 'X', '117.77460624827', '35.914619866588', '3', 'tr_0 tr_370000 tr_370900 ', '0');
INSERT INTO `provinces` VALUES ('370983', '肥城市', '370900', '', '0', '0', 'F', '116.77540081764', '36.188811224315', '3', 'tr_0 tr_370000 tr_370900 ', '0');
INSERT INTO `provinces` VALUES ('371002', '环翠区', '371000', '', '0', '0', 'H', '122.12953818095', '37.507968071219', '3', 'tr_0 tr_370000 tr_371000 ', '0');
INSERT INTO `provinces` VALUES ('371003', '文登区', '371000', '', '0', '0', 'W', '122.06442836878', '37.200113328316', '3', 'tr_0 tr_370000 tr_371000 ', '0');
INSERT INTO `provinces` VALUES ('371071', '威海火炬高技术产业开发区', '371000', '', '0', '0', 'W', '122.12754097831', '37.516430548015', '3', 'tr_0 tr_370000 tr_371000 ', '0');
INSERT INTO `provinces` VALUES ('371072', '威海经济技术开发区', '371000', '', '0', '0', 'W', '122.18792776961', '37.412757933019', '3', 'tr_0 tr_370000 tr_371000 ', '0');
INSERT INTO `provinces` VALUES ('371073', '威海临港经济技术开发区', '371000', '', '0', '0', 'W', '122.12754097831', '37.516430548015', '3', 'tr_0 tr_370000 tr_371000 ', '0');
INSERT INTO `provinces` VALUES ('371082', '荣成市', '371000', '', '0', '0', 'R', '122.49250463074', '37.171317939253', '3', 'tr_0 tr_370000 tr_371000 ', '0');
INSERT INTO `provinces` VALUES ('371083', '乳山市', '371000', '', '0', '0', 'R', '121.5464285812', '36.925177357878', '3', 'tr_0 tr_370000 tr_371000 ', '0');
INSERT INTO `provinces` VALUES ('371102', '东港区', '371100', '', '0', '0', 'D', '119.46862431118', '35.431049003942', '3', 'tr_0 tr_370000 tr_371100 ', '0');
INSERT INTO `provinces` VALUES ('371103', '岚山区', '371100', '', '0', '0', 'L', '119.32553044175', '35.127432330052', '3', 'tr_0 tr_370000 tr_371100 ', '0');
INSERT INTO `provinces` VALUES ('371121', '五莲县', '371100', '', '0', '0', 'W', '119.21558036259', '35.755697104104', '3', 'tr_0 tr_370000 tr_371100 ', '0');
INSERT INTO `provinces` VALUES ('371122', '莒县', '371100', '', '0', '0', 'J', '118.8435382424', '35.585872122989', '3', 'tr_0 tr_370000 tr_371100 ', '0');
INSERT INTO `provinces` VALUES ('371171', '日照经济技术开发区', '371100', '', '0', '0', 'R', '119.53341540457', '35.422838998438', '3', 'tr_0 tr_370000 tr_371100 ', '0');
INSERT INTO `provinces` VALUES ('371202', '莱城区', '371200', '', '0', '0', 'L', '117.6459130158', '36.313394584932', '3', 'tr_0 tr_370000 tr_371200 ', '0');
INSERT INTO `provinces` VALUES ('371203', '钢城区', '371200', '', '0', '0', 'G', '117.8275371813', '36.092835887233', '3', 'tr_0 tr_370000 tr_371200 ', '0');
INSERT INTO `provinces` VALUES ('371302', '兰山区', '371300', '', '0', '0', 'L', '118.35449973464', '35.057340229806', '3', 'tr_0 tr_370000 tr_371300 ', '0');
INSERT INTO `provinces` VALUES ('371311', '罗庄区', '371300', '', '0', '0', 'L', '118.29151252855', '35.002503733433', '3', 'tr_0 tr_370000 tr_371300 ', '0');
INSERT INTO `provinces` VALUES ('371312', '河东区', '371300', '', '0', '0', 'H', '118.40954744713', '35.095675536824', '3', 'tr_0 tr_370000 tr_371300 ', '0');
INSERT INTO `provinces` VALUES ('371321', '沂南县', '371300', '', '0', '0', 'Y', '118.47149154086', '35.55609766695', '3', 'tr_0 tr_370000 tr_371300 ', '0');
INSERT INTO `provinces` VALUES ('371322', '郯城县', '371300', '', '0', '0', 'T', '118.37358710977', '34.619225932471', '3', 'tr_0 tr_370000 tr_371300 ', '0');
INSERT INTO `provinces` VALUES ('371323', '沂水县', '371300', '', '0', '0', 'Y', '118.63461726385', '35.796180584718', '3', 'tr_0 tr_370000 tr_371300 ', '0');
INSERT INTO `provinces` VALUES ('371324', '兰陵县', '371300', '', '0', '0', 'L', '118.07740949499', '34.86361638544', '3', 'tr_0 tr_370000 tr_371300 ', '0');
INSERT INTO `provinces` VALUES ('371325', '费县', '371300', '', '0', '0', 'F', '117.98442508318', '35.272304128517', '3', 'tr_0 tr_370000 tr_371300 ', '0');
INSERT INTO `provinces` VALUES ('371326', '平邑县', '371300', '', '0', '0', 'P', '117.64654058086', '35.51201963664', '3', 'tr_0 tr_370000 tr_371300 ', '0');
INSERT INTO `provinces` VALUES ('371327', '莒南县', '371300', '', '0', '0', 'J', '118.84154077027', '35.180811631788', '3', 'tr_0 tr_370000 tr_371300 ', '0');
INSERT INTO `provinces` VALUES ('371328', '蒙阴县', '371300', '', '0', '0', 'M', '117.95141460145', '35.716347166232', '3', 'tr_0 tr_370000 tr_371300 ', '0');
INSERT INTO `provinces` VALUES ('371329', '临沭县', '371300', '', '0', '0', 'L', '118.6574945001', '34.926018591491', '3', 'tr_0 tr_370000 tr_371300 ', '0');
INSERT INTO `provinces` VALUES ('371371', '临沂高新技术产业开发区', '371300', '', '0', '0', 'L', '118.27105074598', '34.991223857705', '3', 'tr_0 tr_370000 tr_371300 ', '0');
INSERT INTO `provinces` VALUES ('371372', '临沂经济技术开发区', '371300', '', '0', '0', 'L', '118.41614315832', '35.028440855401', '3', 'tr_0 tr_370000 tr_371300 ', '0');
INSERT INTO `provinces` VALUES ('371373', '临沂临港经济开发区', '371300', '', '0', '0', 'L', '119.09098821173', '35.192676079483', '3', 'tr_0 tr_370000 tr_371300 ', '0');
INSERT INTO `provinces` VALUES ('371402', '德城区', '371400', '', '0', '0', 'D', '116.30544896637', '37.456993283021', '3', 'tr_0 tr_370000 tr_371400 ', '0');
INSERT INTO `provinces` VALUES ('371403', '陵城区', '371400', '', '0', '0', 'L', '116.58940001434', '37.347132434581', '3', 'tr_0 tr_370000 tr_371400 ', '0');
INSERT INTO `provinces` VALUES ('371422', '宁津县', '371400', '', '0', '0', 'N', '116.80653761374', '37.658018745855', '3', 'tr_0 tr_370000 tr_371400 ', '0');
INSERT INTO `provinces` VALUES ('371423', '庆云县', '371400', '', '0', '0', 'Q', '117.39145244825', '37.781585318857', '3', 'tr_0 tr_370000 tr_371400 ', '0');
INSERT INTO `provinces` VALUES ('371424', '临邑县', '371400', '', '0', '0', 'L', '116.87340370302', '37.196169366727', '3', 'tr_0 tr_370000 tr_371400 ', '0');
INSERT INTO `provinces` VALUES ('371425', '齐河县', '371400', '', '0', '0', 'Q', '116.76938747073', '36.78994480667', '3', 'tr_0 tr_370000 tr_371400 ', '0');
INSERT INTO `provinces` VALUES ('371426', '平原县', '371400', '', '0', '0', 'P', '116.44050470827', '37.171221463312', '3', 'tr_0 tr_370000 tr_371400 ', '0');
INSERT INTO `provinces` VALUES ('371427', '夏津县', '371400', '', '0', '0', 'X', '116.00853411226', '36.954154863323', '3', 'tr_0 tr_370000 tr_371400 ', '0');
INSERT INTO `provinces` VALUES ('371428', '武城县', '371400', '', '0', '0', 'W', '116.07550629142', '37.219222080288', '3', 'tr_0 tr_370000 tr_371400 ', '0');
INSERT INTO `provinces` VALUES ('371471', '德州经济技术开发区', '371400', '', '0', '0', 'D', '116.36555674397', '37.441308454576', '3', 'tr_0 tr_370000 tr_371400 ', '0');
INSERT INTO `provinces` VALUES ('371472', '德州运河经济开发区', '371400', '', '0', '0', 'D', '116.36555674397', '37.441308454576', '3', 'tr_0 tr_370000 tr_371400 ', '0');
INSERT INTO `provinces` VALUES ('371481', '乐陵市', '371400', '', '0', '0', 'L', '117.23840643173', '37.73592450081', '3', 'tr_0 tr_370000 tr_371400 ', '0');
INSERT INTO `provinces` VALUES ('371482', '禹城市', '371400', '', '0', '0', 'Y', '116.64437110138', '36.940242008766', '3', 'tr_0 tr_370000 tr_371400 ', '0');
INSERT INTO `provinces` VALUES ('371502', '东昌府区', '371500', '', '0', '0', 'D', '115.99458657176', '36.440377840732', '3', 'tr_0 tr_370000 tr_371500 ', '0');
INSERT INTO `provinces` VALUES ('371521', '阳谷县', '371500', '', '0', '0', 'Y', '115.79839557041', '36.120815514687', '3', 'tr_0 tr_370000 tr_371500 ', '0');
INSERT INTO `provinces` VALUES ('371522', '莘县', '371500', '', '0', '0', 'S', '115.67739687246', '36.239907120546', '3', 'tr_0 tr_370000 tr_371500 ', '0');
INSERT INTO `provinces` VALUES ('371523', '茌平县', '371500', '', '0', '0', 'C', '116.26145544215', '36.586785068842', '3', 'tr_0 tr_370000 tr_371500 ', '0');
INSERT INTO `provinces` VALUES ('371524', '东阿县', '371500', '', '0', '0', 'D', '116.25449294564', '36.340957707761', '3', 'tr_0 tr_370000 tr_371500 ', '0');
INSERT INTO `provinces` VALUES ('371525', '冠县', '371500', '', '0', '0', 'G', '115.44939579504', '36.490243225394', '3', 'tr_0 tr_370000 tr_371500 ', '0');
INSERT INTO `provinces` VALUES ('371526', '高唐县', '371500', '', '0', '0', 'G', '116.23560427568', '36.851591084095', '3', 'tr_0 tr_370000 tr_371500 ', '0');
INSERT INTO `provinces` VALUES ('371581', '临清市', '371500', '', '0', '0', 'L', '115.71146960045', '36.844289186694', '3', 'tr_0 tr_370000 tr_371500 ', '0');
INSERT INTO `provinces` VALUES ('371702', '牡丹区', '371700', '', '0', '0', 'M', '115.42344303021', '35.257018176069', '3', 'tr_0 tr_370000 tr_371700 ', '0');
INSERT INTO `provinces` VALUES ('371703', '定陶区', '371700', '', '0', '0', 'D', '115.57943737524', '35.077275179757', '3', 'tr_0 tr_370000 tr_371700 ', '0');
INSERT INTO `provinces` VALUES ('371721', '曹县', '371700', '', '0', '0', 'C', '115.54845724362', '34.831809348415', '3', 'tr_0 tr_370000 tr_371700 ', '0');
INSERT INTO `provinces` VALUES ('371722', '单县', '371700', '', '0', '0', 'D', '116.11158367799', '34.784658433692', '3', 'tr_0 tr_370000 tr_371700 ', '0');
INSERT INTO `provinces` VALUES ('371723', '成武县', '371700', '', '0', '0', 'C', '115.89651900839', '34.95860565496', '3', 'tr_0 tr_370000 tr_371700 ', '0');
INSERT INTO `provinces` VALUES ('371724', '巨野县', '371700', '', '0', '0', 'J', '116.10159901224', '35.402062380609', '3', 'tr_0 tr_370000 tr_371700 ', '0');
INSERT INTO `provinces` VALUES ('371725', '郓城县', '371700', '', '0', '0', 'Y', '115.95045057629', '35.605902319687', '3', 'tr_0 tr_370000 tr_371700 ', '0');
INSERT INTO `provinces` VALUES ('371726', '鄄城县', '371700', '', '0', '0', 'J', '115.51660692346', '35.569204259881', '3', 'tr_0 tr_370000 tr_371700 ', '0');
INSERT INTO `provinces` VALUES ('371728', '东明县', '371700', '', '0', '0', 'D', '115.09641733473', '35.295701692411', '3', 'tr_0 tr_370000 tr_371700 ', '0');
INSERT INTO `provinces` VALUES ('371771', '菏泽经济技术开发区', '371700', '', '0', '0', 'H', '115.48754503343', '35.239407424766', '3', 'tr_0 tr_370000 tr_371700 ', '0');
INSERT INTO `provinces` VALUES ('371772', '菏泽高新技术开发区', '371700', '', '0', '0', 'H', '115.48754503343', '35.239407424766', '3', 'tr_0 tr_370000 tr_371700 ', '0');
INSERT INTO `provinces` VALUES ('410102', '中原区', '410100', '', '0', '0', 'Z', '113.61947551694', '34.754450781329', '3', 'tr_0 tr_410000 tr_410100 ', '0');
INSERT INTO `provinces` VALUES ('410103', '二七区', '410100', '', '0', '0', 'E', '113.63141920734', '34.753438850454', '3', 'tr_0 tr_410000 tr_410100 ', '0');
INSERT INTO `provinces` VALUES ('410104', '管城回族区', '410100', '', '0', '0', 'G', '113.6835246998', '34.759673874699', '3', 'tr_0 tr_410000 tr_410100 ', '0');
INSERT INTO `provinces` VALUES ('410105', '金水区', '410100', '', '0', '0', 'J', '113.6664477324', '34.806070445662', '3', 'tr_0 tr_410000 tr_410100 ', '0');
INSERT INTO `provinces` VALUES ('410106', '上街区', '410100', '', '0', '0', 'S', '113.29818225705', '34.822088918243', '3', 'tr_0 tr_410000 tr_410100 ', '0');
INSERT INTO `provinces` VALUES ('410108', '惠济区', '410100', '', '0', '0', 'H', '113.62345527984', '34.873519885776', '3', 'tr_0 tr_410000 tr_410100 ', '0');
INSERT INTO `provinces` VALUES ('410122', '中牟县', '410100', '', '0', '0', 'Z', '113.98248490573', '34.725010848924', '3', 'tr_0 tr_410000 tr_410100 ', '0');
INSERT INTO `provinces` VALUES ('410171', '郑州经济技术开发区', '410100', '', '0', '0', 'Z', '113.77162403642', '34.724610916832', '3', 'tr_0 tr_410000 tr_410100 ', '0');
INSERT INTO `provinces` VALUES ('410172', '郑州高新技术产业开发区', '410100', '', '0', '0', 'Z', '113.63793722229', '34.742959870174', '3', 'tr_0 tr_410000 tr_410100 ', '0');
INSERT INTO `provinces` VALUES ('410173', '郑州航空港经济综合实验区', '410100', '', '0', '0', 'Z', '113.97018898974', '34.719717969385', '3', 'tr_0 tr_410000 tr_410100 ', '0');
INSERT INTO `provinces` VALUES ('410181', '巩义市', '410100', '', '0', '0', 'G', '113.02843100495', '34.754096888697', '3', 'tr_0 tr_410000 tr_410100 ', '0');
INSERT INTO `provinces` VALUES ('410182', '荥阳市', '410100', '', '0', '0', 'X', '113.38942279956', '34.793810500346', '3', 'tr_0 tr_410000 tr_410100 ', '0');
INSERT INTO `provinces` VALUES ('410183', '新密市', '410100', '', '0', '0', 'X', '113.3973909491', '34.545897983445', '3', 'tr_0 tr_410000 tr_410100 ', '0');
INSERT INTO `provinces` VALUES ('410184', '新郑市', '410100', '', '0', '0', 'X', '113.74643447195', '34.401766379106', '3', 'tr_0 tr_410000 tr_410100 ', '0');
INSERT INTO `provinces` VALUES ('410185', '登封市', '410100', '', '0', '0', 'D', '113.05642283346', '34.45969746172', '3', 'tr_0 tr_410000 tr_410100 ', '0');
INSERT INTO `provinces` VALUES ('410202', '龙亭区', '410200', '', '0', '0', 'L', '114.36141316646', '34.822035612506', '3', 'tr_0 tr_410000 tr_410200 ', '0');
INSERT INTO `provinces` VALUES ('410203', '顺河回族区', '410200', '', '0', '0', 'S', '114.36739165912', '34.802241355559', '3', 'tr_0 tr_410000 tr_410200 ', '0');
INSERT INTO `provinces` VALUES ('410204', '鼓楼区', '410200', '', '0', '0', 'G', '114.35440485636', '34.794874251914', '3', 'tr_0 tr_410000 tr_410200 ', '0');
INSERT INTO `provinces` VALUES ('410205', '禹王台区', '410200', '', '0', '0', 'Y', '114.35439775975', '34.783472105917', '3', 'tr_0 tr_410000 tr_410200 ', '0');
INSERT INTO `provinces` VALUES ('410212', '祥符区', '410200', '', '0', '0', 'X', '114.4475325479', '34.762739572224', '3', 'tr_0 tr_410000 tr_410200 ', '0');
INSERT INTO `provinces` VALUES ('410221', '杞县', '410200', '', '0', '0', 'Q', '114.78959210474', '34.554856780687', '3', 'tr_0 tr_410000 tr_410200 ', '0');
INSERT INTO `provinces` VALUES ('410222', '通许县', '410200', '', '0', '0', 'T', '114.47343590593', '34.486771802655', '3', 'tr_0 tr_410000 tr_410200 ', '0');
INSERT INTO `provinces` VALUES ('410223', '尉氏县', '410200', '', '0', '0', 'W', '114.19956115086', '34.417228010354', '3', 'tr_0 tr_410000 tr_410200 ', '0');
INSERT INTO `provinces` VALUES ('410225', '兰考县', '410200', '', '0', '0', 'L', '114.82746071249', '34.828492897238', '3', 'tr_0 tr_410000 tr_410200 ', '0');
INSERT INTO `provinces` VALUES ('410302', '老城区', '410300', '', '0', '0', 'L', '112.47650356572', '34.689601063497', '3', 'tr_0 tr_410000 tr_410300 ', '0');
INSERT INTO `provinces` VALUES ('410303', '西工区', '410300', '', '0', '0', 'X', '112.43439953731', '34.666767847513', '3', 'tr_0 tr_410000 tr_410300 ', '0');
INSERT INTO `provinces` VALUES ('410304', '瀍河回族区', '410300', '', '0', '0', 'C', '112.50660380709', '34.685462421335', '3', 'tr_0 tr_410000 tr_410300 ', '0');
INSERT INTO `provinces` VALUES ('410305', '涧西区', '410300', '', '0', '0', 'J', '112.4025520019', '34.663468974309', '3', 'tr_0 tr_410000 tr_410300 ', '0');
INSERT INTO `provinces` VALUES ('410306', '吉利区', '410300', '', '0', '0', 'J', '112.59547847119', '34.907012657115', '3', 'tr_0 tr_410000 tr_410300 ', '0');
INSERT INTO `provinces` VALUES ('410311', '洛龙区', '410300', '', '0', '0', 'L', '112.47046928829', '34.624704713024', '3', 'tr_0 tr_410000 tr_410300 ', '0');
INSERT INTO `provinces` VALUES ('410322', '孟津县', '410300', '', '0', '0', 'M', '112.45141766571', '34.831731570285', '3', 'tr_0 tr_410000 tr_410300 ', '0');
INSERT INTO `provinces` VALUES ('410323', '新安县', '410300', '', '0', '0', 'X', '112.14060970841', '34.734383327344', '3', 'tr_0 tr_410000 tr_410300 ', '0');
INSERT INTO `provinces` VALUES ('410324', '栾川县', '410300', '', '0', '0', 'L', '111.62242666651', '33.791822464323', '3', 'tr_0 tr_410000 tr_410300 ', '0');
INSERT INTO `provinces` VALUES ('410325', '嵩县', '410300', '', '0', '0', 'S', '112.09240816187', '34.140721556406', '3', 'tr_0 tr_410000 tr_410300 ', '0');
INSERT INTO `provinces` VALUES ('410326', '汝阳县', '410300', '', '0', '0', 'R', '112.47950327731', '34.159843364893', '3', 'tr_0 tr_410000 tr_410300 ', '0');
INSERT INTO `provinces` VALUES ('410327', '宜阳县', '410300', '', '0', '0', 'Y', '112.17946537426', '34.541046942554', '3', 'tr_0 tr_410000 tr_410300 ', '0');
INSERT INTO `provinces` VALUES ('410328', '洛宁县', '410300', '', '0', '0', 'L', '111.65958740952', '34.394984560215', '3', 'tr_0 tr_410000 tr_410300 ', '0');
INSERT INTO `provinces` VALUES ('410329', '伊川县', '410300', '', '0', '0', 'Y', '112.43240745502', '34.427645796427', '3', 'tr_0 tr_410000 tr_410300 ', '0');
INSERT INTO `provinces` VALUES ('410371', '洛阳高新技术产业开发区', '410300', '', '0', '0', 'L', '112.45942129831', '34.624262779219', '3', 'tr_0 tr_410000 tr_410300 ', '0');
INSERT INTO `provinces` VALUES ('410381', '偃师市', '410300', '', '0', '0', 'Y', '112.79642141885', '34.733796624013', '3', 'tr_0 tr_410000 tr_410300 ', '0');
INSERT INTO `provinces` VALUES ('410402', '新华区', '410400', '', '0', '0', 'X', '113.30043988965', '33.743657151646', '3', 'tr_0 tr_410000 tr_410400 ', '0');
INSERT INTO `provinces` VALUES ('410403', '卫东区', '410400', '', '0', '0', 'W', '113.34161111761', '33.7403756514', '3', 'tr_0 tr_410000 tr_410400 ', '0');
INSERT INTO `provinces` VALUES ('410404', '石龙区', '410400', '', '0', '0', 'S', '112.9054552264', '33.904754268397', '3', 'tr_0 tr_410000 tr_410400 ', '0');
INSERT INTO `provinces` VALUES ('410411', '湛河区', '410400', '', '0', '0', 'Z', '113.25051467449', '33.685790171047', '3', 'tr_0 tr_410000 tr_410400 ', '0');
INSERT INTO `provinces` VALUES ('410421', '宝丰县', '410400', '', '0', '0', 'B', '113.06144723584', '33.874745598631', '3', 'tr_0 tr_410000 tr_410400 ', '0');
INSERT INTO `provinces` VALUES ('410422', '叶县', '410400', '', '0', '0', 'Y', '113.36358241276', '33.632491674058', '3', 'tr_0 tr_410000 tr_410400 ', '0');
INSERT INTO `provinces` VALUES ('410423', '鲁山县', '410400', '', '0', '0', 'L', '112.91443396963', '33.744878863452', '3', 'tr_0 tr_410000 tr_410400 ', '0');
INSERT INTO `provinces` VALUES ('410425', '郏县', '410400', '', '0', '0', 'J', '113.21960622765', '33.977486289177', '3', 'tr_0 tr_410000 tr_410400 ', '0');
INSERT INTO `provinces` VALUES ('410471', '平顶山高新技术产业开发区', '410400', '', '0', '0', 'P', '113.40808986384', '33.737612151054', '3', 'tr_0 tr_410000 tr_410400 ', '0');
INSERT INTO `provinces` VALUES ('410472', '平顶山市新城区', '410400', '', '0', '0', 'P', '113.19952856052', '33.772050748691', '3', 'tr_0 tr_410000 tr_410400 ', '0');
INSERT INTO `provinces` VALUES ('410481', '舞钢市', '410400', '', '0', '0', 'W', '113.53141031593', '33.299431105301', '3', 'tr_0 tr_410000 tr_410400 ', '0');
INSERT INTO `provinces` VALUES ('410482', '汝州市', '410400', '', '0', '0', 'R', '112.85054971566', '34.172767788551', '3', 'tr_0 tr_410000 tr_410400 ', '0');
INSERT INTO `provinces` VALUES ('410502', '文峰区', '410500', '', '0', '0', 'W', '114.36337398772', '36.096832748136', '3', 'tr_0 tr_410000 tr_410500 ', '0');
INSERT INTO `provinces` VALUES ('410503', '北关区', '410500', '', '0', '0', 'B', '114.36238189912', '36.113131607765', '3', 'tr_0 tr_410000 tr_410500 ', '0');
INSERT INTO `provinces` VALUES ('410505', '殷都区', '410500', '', '0', '0', 'Y', '114.29712997501', '36.135573231517', '3', 'tr_0 tr_410000 tr_410500 ', '0');
INSERT INTO `provinces` VALUES ('410506', '龙安区', '410500', '', '0', '0', 'L', '114.3075931681', '36.08275278362', '3', 'tr_0 tr_410000 tr_410500 ', '0');
INSERT INTO `provinces` VALUES ('410522', '安阳县', '410500', '', '0', '0', 'A', '114.23838187262', '36.218906964196', '3', 'tr_0 tr_410000 tr_410500 ', '0');
INSERT INTO `provinces` VALUES ('410523', '汤阴县', '410500', '', '0', '0', 'T', '114.36340938096', '35.927643740225', '3', 'tr_0 tr_410000 tr_410500 ', '0');
INSERT INTO `provinces` VALUES ('410526', '滑县', '410500', '', '0', '0', 'H', '114.52555316619', '35.581045400558', '3', 'tr_0 tr_410000 tr_410500 ', '0');
INSERT INTO `provinces` VALUES ('410527', '内黄县', '410500', '', '0', '0', 'N', '114.90758875551', '35.976949668061', '3', 'tr_0 tr_410000 tr_410500 ', '0');
INSERT INTO `provinces` VALUES ('410571', '安阳高新技术产业开发区', '410500', '', '0', '0', 'A', '114.39950042177', '36.105940984015', '3', 'tr_0 tr_410000 tr_410500 ', '0');
INSERT INTO `provinces` VALUES ('410581', '林州市', '410500', '', '0', '0', 'L', '113.82559018908', '36.088853208448', '3', 'tr_0 tr_410000 tr_410500 ', '0');
INSERT INTO `provinces` VALUES ('410602', '鹤山区', '410600', '', '0', '0', 'H', '114.16955478242', '35.960280248227', '3', 'tr_0 tr_410000 tr_410600 ', '0');
INSERT INTO `provinces` VALUES ('410603', '山城区', '410600', '', '0', '0', 'S', '114.19062058561', '35.903369613292', '3', 'tr_0 tr_410000 tr_410600 ', '0');
INSERT INTO `provinces` VALUES ('410611', '淇滨区', '410600', '', '0', '0', 'Q', '114.30559120444', '35.746952546289', '3', 'tr_0 tr_410000 tr_410600 ', '0');
INSERT INTO `provinces` VALUES ('410621', '浚县', '410600', '', '0', '0', 'J', '114.55760785086', '35.681917305913', '3', 'tr_0 tr_410000 tr_410600 ', '0');
INSERT INTO `provinces` VALUES ('410622', '淇县', '410600', '', '0', '0', 'Q', '114.2154897245', '35.627277020336', '3', 'tr_0 tr_410000 tr_410600 ', '0');
INSERT INTO `provinces` VALUES ('410671', '鹤壁经济技术开发区', '410600', '', '0', '0', 'H', '114.30359364248', '35.7523574114', '3', 'tr_0 tr_410000 tr_410600 ', '0');
INSERT INTO `provinces` VALUES ('410702', '红旗区', '410700', '', '0', '0', 'H', '113.88141583415', '35.310135512691', '3', 'tr_0 tr_410000 tr_410700 ', '0');
INSERT INTO `provinces` VALUES ('410703', '卫滨区', '410700', '', '0', '0', 'W', '113.8724387977', '35.308459209602', '3', 'tr_0 tr_410000 tr_410700 ', '0');
INSERT INTO `provinces` VALUES ('410704', '凤泉区', '410700', '', '0', '0', 'F', '113.91245884715', '35.375665060578', '3', 'tr_0 tr_410000 tr_410700 ', '0');
INSERT INTO `provinces` VALUES ('410711', '牧野区', '410700', '', '0', '0', 'M', '113.91551290623', '35.321023486499', '3', 'tr_0 tr_410000 tr_410700 ', '0');
INSERT INTO `provinces` VALUES ('410721', '新乡县', '410700', '', '0', '0', 'X', '113.81159378076', '35.196564408993', '3', 'tr_0 tr_410000 tr_410700 ', '0');
INSERT INTO `provinces` VALUES ('410724', '获嘉县', '410700', '', '0', '0', 'H', '113.66341666994', '35.265809284161', '3', 'tr_0 tr_410000 tr_410700 ', '0');
INSERT INTO `provinces` VALUES ('410725', '原阳县', '410700', '', '0', '0', 'Y', '113.94662374129', '35.071163864469', '3', 'tr_0 tr_410000 tr_410700 ', '0');
INSERT INTO `provinces` VALUES ('410726', '延津县', '410700', '', '0', '0', 'Y', '114.21151175821', '35.147806510509', '3', 'tr_0 tr_410000 tr_410700 ', '0');
INSERT INTO `provinces` VALUES ('410727', '封丘县', '410700', '', '0', '0', 'F', '114.42560616803', '35.046857531651', '3', 'tr_0 tr_410000 tr_410700 ', '0');
INSERT INTO `provinces` VALUES ('410728', '长垣县', '410700', '', '0', '0', 'Z', '114.67560989146', '35.207198224565', '3', 'tr_0 tr_410000 tr_410700 ', '0');
INSERT INTO `provinces` VALUES ('410771', '新乡高新技术产业开发区', '410700', '', '0', '0', 'X', '113.89511589149', '35.288196248852', '3', 'tr_0 tr_410000 tr_410700 ', '0');
INSERT INTO `provinces` VALUES ('410772', '新乡经济技术开发区', '410700', '', '0', '0', 'X', '113.93360046733', '35.309639930337', '3', 'tr_0 tr_410000 tr_410700 ', '0');
INSERT INTO `provinces` VALUES ('410773', '新乡市平原城乡一体化示范区', '410700', '', '0', '0', 'X', '113.93360046733', '35.309639930337', '3', 'tr_0 tr_410000 tr_410700 ', '0');
INSERT INTO `provinces` VALUES ('410781', '卫辉市', '410700', '', '0', '0', 'W', '114.07160094452', '35.404068882145', '3', 'tr_0 tr_410000 tr_410700 ', '0');
INSERT INTO `provinces` VALUES ('410782', '辉县市', '410700', '', '0', '0', 'H', '113.81157302991', '35.467957818376', '3', 'tr_0 tr_410000 tr_410700 ', '0');
INSERT INTO `provinces` VALUES ('410802', '解放区', '410800', '', '0', '0', 'J', '113.23757179887', '35.246309807633', '3', 'tr_0 tr_410000 tr_410800 ', '0');
INSERT INTO `provinces` VALUES ('410803', '中站区', '410800', '', '0', '0', 'Z', '113.18944759643', '35.242617103591', '3', 'tr_0 tr_410000 tr_410800 ', '0');
INSERT INTO `provinces` VALUES ('410804', '马村区', '410800', '', '0', '0', 'M', '113.32854400634', '35.261894441723', '3', 'tr_0 tr_410000 tr_410800 ', '0');
INSERT INTO `provinces` VALUES ('410811', '山阳区', '410800', '', '0', '0', 'S', '113.26048370971', '35.220272352977', '3', 'tr_0 tr_410000 tr_410800 ', '0');
INSERT INTO `provinces` VALUES ('410821', '修武县', '410800', '', '0', '0', 'X', '113.45458192871', '35.229323482594', '3', 'tr_0 tr_410000 tr_410800 ', '0');
INSERT INTO `provinces` VALUES ('410822', '博爱县', '410800', '', '0', '0', 'B', '113.07047799096', '35.177308063756', '3', 'tr_0 tr_410000 tr_410800 ', '0');
INSERT INTO `provinces` VALUES ('410823', '武陟县', '410800', '', '0', '0', 'W', '113.40839582041', '35.105838449217', '3', 'tr_0 tr_410000 tr_410800 ', '0');
INSERT INTO `provinces` VALUES ('410825', '温县', '410800', '', '0', '0', 'W', '113.08656906807', '34.946135492247', '3', 'tr_0 tr_410000 tr_410800 ', '0');
INSERT INTO `provinces` VALUES ('410871', '焦作城乡一体化示范区', '410800', '', '0', '0', 'J', '113.24854783457', '35.220963254039', '3', 'tr_0 tr_410000 tr_410800 ', '0');
INSERT INTO `provinces` VALUES ('410882', '沁阳市', '410800', '', '0', '0', 'Q', '112.95751688155', '35.093785732346', '3', 'tr_0 tr_410000 tr_410800 ', '0');
INSERT INTO `provinces` VALUES ('410883', '孟州市', '410800', '', '0', '0', 'M', '112.79739491254', '34.913597817886', '3', 'tr_0 tr_410000 tr_410800 ', '0');
INSERT INTO `provinces` VALUES ('410902', '华龙区', '410900', '', '0', '0', 'H', '115.0804129441', '35.783632884536', '3', 'tr_0 tr_410000 tr_410900 ', '0');
INSERT INTO `provinces` VALUES ('410922', '清丰县', '410900', '', '0', '0', 'Q', '115.11047186341', '35.891308168277', '3', 'tr_0 tr_410000 tr_410900 ', '0');
INSERT INTO `provinces` VALUES ('410923', '南乐县', '410900', '', '0', '0', 'N', '115.21138615695', '36.076030832875', '3', 'tr_0 tr_410000 tr_410900 ', '0');
INSERT INTO `provinces` VALUES ('410926', '范县', '410900', '', '0', '0', 'F', '115.51058621044', '35.857655087719', '3', 'tr_0 tr_410000 tr_410900 ', '0');
INSERT INTO `provinces` VALUES ('410927', '台前县', '410900', '', '0', '0', 'T', '115.87856816938', '35.975012712521', '3', 'tr_0 tr_410000 tr_410900 ', '0');
INSERT INTO `provinces` VALUES ('410928', '濮阳县', '410900', '', '0', '0', 'P', '115.03558408559', '35.717888889375', '3', 'tr_0 tr_410000 tr_410900 ', '0');
INSERT INTO `provinces` VALUES ('410971', '河南濮阳工业园区', '410900', '', '0', '0', 'H', '115.03559747034', '35.767593028906', '3', 'tr_0 tr_410000 tr_410900 ', '0');
INSERT INTO `provinces` VALUES ('410972', '濮阳经济技术开发区', '410900', '', '0', '0', 'P', '115.03559747034', '35.767593028906', '3', 'tr_0 tr_410000 tr_410900 ', '0');
INSERT INTO `provinces` VALUES ('411002', '魏都区', '411000', '', '0', '0', 'W', '113.82959564352', '34.030861228003', '3', 'tr_0 tr_410000 tr_411000 ', '0');
INSERT INTO `provinces` VALUES ('411003', '建安区', '411000', '', '0', '0', 'J', '113.82961513675', '34.129966976383', '3', 'tr_0 tr_410000 tr_411000 ', '0');
INSERT INTO `provinces` VALUES ('411024', '鄢陵县', '411000', '', '0', '0', 'Y', '114.18561980866', '34.107963250311', '3', 'tr_0 tr_410000 tr_411000 ', '0');
INSERT INTO `provinces` VALUES ('411025', '襄城县', '411000', '', '0', '0', 'X', '113.51343127013', '33.856967773678', '3', 'tr_0 tr_410000 tr_411000 ', '0');
INSERT INTO `provinces` VALUES ('411071', '许昌经济技术开发区', '411000', '', '0', '0', 'X', '113.81237629469', '34.009184251036', '3', 'tr_0 tr_410000 tr_411000 ', '0');
INSERT INTO `provinces` VALUES ('411081', '禹州市', '411000', '', '0', '0', 'Y', '113.49550522436', '34.146082195029', '3', 'tr_0 tr_410000 tr_411000 ', '0');
INSERT INTO `provinces` VALUES ('411082', '长葛市', '411000', '', '0', '0', 'Z', '113.77442091063', '34.223016266284', '3', 'tr_0 tr_410000 tr_411000 ', '0');
INSERT INTO `provinces` VALUES ('411102', '源汇区', '411100', '', '0', '0', 'Y', '113.99041352982', '33.578423262447', '3', 'tr_0 tr_410000 tr_411100 ', '0');
INSERT INTO `provinces` VALUES ('411103', '郾城区', '411100', '', '0', '0', 'Y', '114.01339389154', '33.593415880865', '3', 'tr_0 tr_410000 tr_411100 ', '0');
INSERT INTO `provinces` VALUES ('411104', '召陵区', '411100', '', '0', '0', 'Z', '114.1004665548', '33.592467538561', '3', 'tr_0 tr_410000 tr_411100 ', '0');
INSERT INTO `provinces` VALUES ('411121', '舞阳县', '411100', '', '0', '0', 'W', '113.61549000488', '33.443577799934', '3', 'tr_0 tr_410000 tr_411100 ', '0');
INSERT INTO `provinces` VALUES ('411122', '临颍县', '411100', '', '0', '0', 'L', '113.93757834379', '33.83269194793', '3', 'tr_0 tr_410000 tr_411100 ', '0');
INSERT INTO `provinces` VALUES ('411171', '漯河经济技术开发区', '411100', '', '0', '0', 'L', '114.02342077765', '33.587710707102', '3', 'tr_0 tr_410000 tr_411100 ', '0');
INSERT INTO `provinces` VALUES ('411202', '湖滨区', '411200', '', '0', '0', 'H', '111.19557389665', '34.775996792444', '3', 'tr_0 tr_410000 tr_411200 ', '0');
INSERT INTO `provinces` VALUES ('411203', '陕州区', '411200', '', '0', '0', 'S', '111.10945065249', '34.726914801527', '3', 'tr_0 tr_410000 tr_411200 ', '0');
INSERT INTO `provinces` VALUES ('411221', '渑池县', '411200', '', '0', '0', 'M', '111.76854234585', '34.773197042986', '3', 'tr_0 tr_410000 tr_411200 ', '0');
INSERT INTO `provinces` VALUES ('411224', '卢氏县', '411200', '', '0', '0', 'L', '111.05456400617', '34.059924845299', '3', 'tr_0 tr_410000 tr_411200 ', '0');
INSERT INTO `provinces` VALUES ('411271', '河南三门峡经济开发区', '411200', '', '0', '0', 'H', '111.16756986287', '34.791595599754', '3', 'tr_0 tr_410000 tr_411200 ', '0');
INSERT INTO `provinces` VALUES ('411281', '义马市', '411200', '', '0', '0', 'Y', '111.88051478021', '34.753028009473', '3', 'tr_0 tr_410000 tr_411200 ', '0');
INSERT INTO `provinces` VALUES ('411282', '灵宝市', '411200', '', '0', '0', 'L', '110.90040831286', '34.523142624164', '3', 'tr_0 tr_410000 tr_411200 ', '0');
INSERT INTO `provinces` VALUES ('411302', '宛城区', '411300', '', '0', '0', 'W', '112.54645416663', '33.009870040626', '3', 'tr_0 tr_410000 tr_411300 ', '0');
INSERT INTO `provinces` VALUES ('411303', '卧龙区', '411300', '', '0', '0', 'W', '112.54146183376', '32.992483797527', '3', 'tr_0 tr_410000 tr_411300 ', '0');
INSERT INTO `provinces` VALUES ('411321', '南召县', '411300', '', '0', '0', 'N', '112.43542522255', '33.496185804625', '3', 'tr_0 tr_410000 tr_411300 ', '0');
INSERT INTO `provinces` VALUES ('411322', '方城县', '411300', '', '0', '0', 'F', '113.0185027528', '33.260539455832', '3', 'tr_0 tr_410000 tr_411300 ', '0');
INSERT INTO `provinces` VALUES ('411323', '西峡县', '411300', '', '0', '0', 'X', '111.48039809758', '33.313316115292', '3', 'tr_0 tr_410000 tr_411300 ', '0');
INSERT INTO `provinces` VALUES ('411324', '镇平县', '411300', '', '0', '0', 'Z', '112.24154448331', '33.039718529225', '3', 'tr_0 tr_410000 tr_411300 ', '0');
INSERT INTO `provinces` VALUES ('411325', '内乡县', '411300', '', '0', '0', 'N', '111.85542528697', '33.051203105476', '3', 'tr_0 tr_410000 tr_411300 ', '0');
INSERT INTO `provinces` VALUES ('411326', '淅川县', '411300', '', '0', '0', 'X', '111.49743203615', '33.144185260027', '3', 'tr_0 tr_410000 tr_411300 ', '0');
INSERT INTO `provinces` VALUES ('411327', '社旗县', '411300', '', '0', '0', 'S', '112.9544934547', '33.062236685935', '3', 'tr_0 tr_410000 tr_411300 ', '0');
INSERT INTO `provinces` VALUES ('411328', '唐河县', '411300', '', '0', '0', 'T', '112.81342436589', '32.687720660005', '3', 'tr_0 tr_410000 tr_411300 ', '0');
INSERT INTO `provinces` VALUES ('411329', '新野县', '411300', '', '0', '0', 'X', '112.36654962384', '32.526631778818', '3', 'tr_0 tr_410000 tr_411300 ', '0');
INSERT INTO `provinces` VALUES ('411330', '桐柏县', '411300', '', '0', '0', 'T', '113.43447273106', '32.385130754956', '3', 'tr_0 tr_410000 tr_411300 ', '0');
INSERT INTO `provinces` VALUES ('411371', '南阳高新技术产业开发区', '411300', '', '0', '0', 'N', '112.53450131351', '32.996562204651', '3', 'tr_0 tr_410000 tr_411300 ', '0');
INSERT INTO `provinces` VALUES ('411372', '南阳市城乡一体化示范区', '411300', '', '0', '0', 'N', '112.53450131351', '32.996562204651', '3', 'tr_0 tr_410000 tr_411300 ', '0');
INSERT INTO `provinces` VALUES ('411381', '邓州市', '411300', '', '0', '0', 'D', '112.09342010302', '32.69391743997', '3', 'tr_0 tr_410000 tr_411300 ', '0');
INSERT INTO `provinces` VALUES ('411402', '梁园区', '411400', '', '0', '0', 'L', '115.62060204557', '34.449471246294', '3', 'tr_0 tr_410000 tr_411400 ', '0');
INSERT INTO `provinces` VALUES ('411403', '睢阳区', '411400', '', '0', '0', 'S', '115.65947594702', '34.394151920479', '3', 'tr_0 tr_410000 tr_411400 ', '0');
INSERT INTO `provinces` VALUES ('411421', '民权县', '411400', '', '0', '0', 'M', '115.15457605887', '34.652478726537', '3', 'tr_0 tr_410000 tr_411400 ', '0');
INSERT INTO `provinces` VALUES ('411422', '睢县', '411400', '', '0', '0', 'S', '115.07841089061', '34.451616965409', '3', 'tr_0 tr_410000 tr_411400 ', '0');
INSERT INTO `provinces` VALUES ('411423', '宁陵县', '411400', '', '0', '0', 'N', '115.32041843737', '34.46663402766', '3', 'tr_0 tr_410000 tr_411400 ', '0');
INSERT INTO `provinces` VALUES ('411424', '柘城县', '411400', '', '0', '0', 'Z', '115.31243456749', '34.097360212415', '3', 'tr_0 tr_410000 tr_411400 ', '0');
INSERT INTO `provinces` VALUES ('411425', '虞城县', '411400', '', '0', '0', 'Y', '115.83447295698', '34.405331502097', '3', 'tr_0 tr_410000 tr_411400 ', '0');
INSERT INTO `provinces` VALUES ('411426', '夏邑县', '411400', '', '0', '0', 'X', '116.13751236823', '34.243523472378', '3', 'tr_0 tr_410000 tr_411400 ', '0');
INSERT INTO `provinces` VALUES ('411471', '豫东综合物流产业聚集区', '411400', '', '0', '0', 'Y', '115.66244933826', '34.420201665859', '3', 'tr_0 tr_410000 tr_411400 ', '0');
INSERT INTO `provinces` VALUES ('411472', '河南商丘经济开发区', '411400', '', '0', '0', 'H', '115.69827951116', '34.407726159442', '3', 'tr_0 tr_410000 tr_411400 ', '0');
INSERT INTO `provinces` VALUES ('411481', '永城市', '411400', '', '0', '0', 'Y', '116.4555661476', '33.934801475851', '3', 'tr_0 tr_410000 tr_411400 ', '0');
INSERT INTO `provinces` VALUES ('411502', '浉河区', '411500', '', '0', '0', 'S', '114.06558130947', '32.122554156884', '3', 'tr_0 tr_410000 tr_411500 ', '0');
INSERT INTO `provinces` VALUES ('411503', '平桥区', '411500', '', '0', '0', 'P', '114.13240742415', '32.10732538611', '3', 'tr_0 tr_410000 tr_411500 ', '0');
INSERT INTO `provinces` VALUES ('411521', '罗山县', '411500', '', '0', '0', 'L', '114.51952993791', '32.209150451838', '3', 'tr_0 tr_410000 tr_411500 ', '0');
INSERT INTO `provinces` VALUES ('411522', '光山县', '411500', '', '0', '0', 'G', '114.92553303688', '32.015906879568', '3', 'tr_0 tr_410000 tr_411500 ', '0');
INSERT INTO `provinces` VALUES ('411523', '新县', '411500', '', '0', '0', 'X', '114.88552475523', '31.649738468475', '3', 'tr_0 tr_410000 tr_411500 ', '0');
INSERT INTO `provinces` VALUES ('411524', '商城县', '411500', '', '0', '0', 'S', '115.41351334076', '31.804345366903', '3', 'tr_0 tr_410000 tr_411500 ', '0');
INSERT INTO `provinces` VALUES ('411525', '固始县', '411500', '', '0', '0', 'G', '115.66048788818', '32.174174379622', '3', 'tr_0 tr_410000 tr_411500 ', '0');
INSERT INTO `provinces` VALUES ('411526', '潢川县', '411500', '', '0', '0', 'H', '115.05847075405', '32.137530716414', '3', 'tr_0 tr_410000 tr_411500 ', '0');
INSERT INTO `provinces` VALUES ('411527', '淮滨县', '411500', '', '0', '0', 'H', '115.42643896891', '32.479469756663', '3', 'tr_0 tr_410000 tr_411500 ', '0');
INSERT INTO `provinces` VALUES ('411528', '息县', '411500', '', '0', '0', 'X', '114.74745313225', '32.348955511715', '3', 'tr_0 tr_410000 tr_411500 ', '0');
INSERT INTO `provinces` VALUES ('411571', '信阳高新技术产业开发区', '411500', '', '0', '0', 'X', '114.09748283305', '32.153014547531', '3', 'tr_0 tr_410000 tr_411500 ', '0');
INSERT INTO `provinces` VALUES ('411602', '川汇区', '411600', '', '0', '0', 'C', '114.65760174056', '33.652997102814', '3', 'tr_0 tr_410000 tr_411600 ', '0');
INSERT INTO `provinces` VALUES ('411621', '扶沟县', '411600', '', '0', '0', 'F', '114.40150984137', '34.065906253969', '3', 'tr_0 tr_410000 tr_411600 ', '0');
INSERT INTO `provinces` VALUES ('411622', '西华县', '411600', '', '0', '0', 'X', '114.53559667094', '33.773215334922', '3', 'tr_0 tr_410000 tr_411600 ', '0');
INSERT INTO `provinces` VALUES ('411623', '商水县', '411600', '', '0', '0', 'S', '114.61841594744', '33.548877475353', '3', 'tr_0 tr_410000 tr_411600 ', '0');
INSERT INTO `provinces` VALUES ('411624', '沈丘县', '411600', '', '0', '0', 'S', '115.10545545595', '33.415691094059', '3', 'tr_0 tr_410000 tr_411600 ', '0');
INSERT INTO `provinces` VALUES ('411625', '郸城县', '411600', '', '0', '0', 'D', '115.18347760136', '33.650827955049', '3', 'tr_0 tr_410000 tr_411600 ', '0');
INSERT INTO `provinces` VALUES ('411626', '淮阳县', '411600', '', '0', '0', 'H', '114.89258615519', '33.737347183458', '3', 'tr_0 tr_410000 tr_411600 ', '0');
INSERT INTO `provinces` VALUES ('411627', '太康县', '411600', '', '0', '0', 'T', '114.84438389', '34.070038382248', '3', 'tr_0 tr_410000 tr_411600 ', '0');
INSERT INTO `provinces` VALUES ('411628', '鹿邑县', '411600', '', '0', '0', 'L', '115.4905852586', '33.867173290317', '3', 'tr_0 tr_410000 tr_411600 ', '0');
INSERT INTO `provinces` VALUES ('411671', '河南周口经济开发区', '411600', '', '0', '0', 'H', '114.70348251482', '33.631828875702', '3', 'tr_0 tr_410000 tr_411600 ', '0');
INSERT INTO `provinces` VALUES ('411681', '项城市', '411600', '', '0', '0', 'X', '114.88151400079', '33.47300744143', '3', 'tr_0 tr_410000 tr_411600 ', '0');
INSERT INTO `provinces` VALUES ('411702', '驿城区', '411700', '', '0', '0', 'Y', '114.00038696674', '32.979519871982', '3', 'tr_0 tr_410000 tr_411700 ', '0');
INSERT INTO `provinces` VALUES ('411721', '西平县', '411700', '', '0', '0', 'X', '114.02747357279', '33.393860997525', '3', 'tr_0 tr_410000 tr_411700 ', '0');
INSERT INTO `provinces` VALUES ('411722', '上蔡县', '411700', '', '0', '0', 'S', '114.2704868624', '33.268511215884', '3', 'tr_0 tr_410000 tr_411700 ', '0');
INSERT INTO `provinces` VALUES ('411723', '平舆县', '411700', '', '0', '0', 'P', '114.62542865923', '32.967982400438', '3', 'tr_0 tr_410000 tr_411700 ', '0');
INSERT INTO `provinces` VALUES ('411724', '正阳县', '411700', '', '0', '0', 'Z', '114.39949655906', '32.611641077273', '3', 'tr_0 tr_410000 tr_411700 ', '0');
INSERT INTO `provinces` VALUES ('411725', '确山县', '411700', '', '0', '0', 'Q', '114.03249501076', '32.808175692984', '3', 'tr_0 tr_410000 tr_411700 ', '0');
INSERT INTO `provinces` VALUES ('411726', '泌阳县', '411700', '', '0', '0', 'M', '113.33355798837', '32.729730650435', '3', 'tr_0 tr_410000 tr_411700 ', '0');
INSERT INTO `provinces` VALUES ('411727', '汝南县', '411700', '', '0', '0', 'R', '114.36940889397', '33.013140881992', '3', 'tr_0 tr_410000 tr_411700 ', '0');
INSERT INTO `provinces` VALUES ('411728', '遂平县', '411700', '', '0', '0', 'S', '114.0194414639', '33.151971399579', '3', 'tr_0 tr_410000 tr_411700 ', '0');
INSERT INTO `provinces` VALUES ('411729', '新蔡县', '411700', '', '0', '0', 'X', '114.99246928382', '32.755268867306', '3', 'tr_0 tr_410000 tr_411700 ', '0');
INSERT INTO `provinces` VALUES ('411771', '河南驻马店经济开发区', '411700', '', '0', '0', 'H', '114.02847078173', '33.017842416744', '3', 'tr_0 tr_410000 tr_411700 ', '0');
INSERT INTO `provinces` VALUES ('419001', '济源市', '419000', '', '0', '0', 'J', '112.60858070621', '35.072907226847', '3', 'tr_0 tr_410000 tr_419000 ', '0');
INSERT INTO `provinces` VALUES ('420102', '江岸区', '420100', '', '0', '0', 'J', '114.31657918761', '30.605402797562', '3', 'tr_0 tr_420000 tr_420100 ', '0');
INSERT INTO `provinces` VALUES ('420103', '江汉区', '420100', '', '0', '0', 'J', '114.27750613182', '30.607282276827', '3', 'tr_0 tr_420000 tr_420100 ', '0');
INSERT INTO `provinces` VALUES ('420104', '硚口区', '420100', '', '0', '0', 'Q', '114.22146031207', '30.587584340776', '3', 'tr_0 tr_420000 tr_420100 ', '0');
INSERT INTO `provinces` VALUES ('420105', '汉阳区', '420100', '', '0', '0', 'H', '114.22544555464', '30.560052027443', '3', 'tr_0 tr_420000 tr_420100 ', '0');
INSERT INTO `provinces` VALUES ('420106', '武昌区', '420100', '', '0', '0', 'W', '114.35362228468', '30.564860292785', '3', 'tr_0 tr_420000 tr_420100 ', '0');
INSERT INTO `provinces` VALUES ('420107', '青山区', '420100', '', '0', '0', 'Q', '114.39149265697', '30.646593075543', '3', 'tr_0 tr_420000 tr_420100 ', '0');
INSERT INTO `provinces` VALUES ('420111', '洪山区', '420100', '', '0', '0', 'H', '114.35045554602', '30.506333956808', '3', 'tr_0 tr_420000 tr_420100 ', '0');
INSERT INTO `provinces` VALUES ('420112', '东西湖区', '420100', '', '0', '0', 'D', '114.14345873786', '30.625919818109', '3', 'tr_0 tr_420000 tr_420100 ', '0');
INSERT INTO `provinces` VALUES ('420113', '汉南区', '420100', '', '0', '0', 'H', '114.09151485056', '30.314809120145', '3', 'tr_0 tr_420000 tr_420100 ', '0');
INSERT INTO `provinces` VALUES ('420114', '蔡甸区', '420100', '', '0', '0', 'C', '114.03547963081', '30.588113621855', '3', 'tr_0 tr_420000 tr_420100 ', '0');
INSERT INTO `provinces` VALUES ('420115', '江夏区', '420100', '', '0', '0', 'J', '114.32855126446', '30.381564218182', '3', 'tr_0 tr_420000 tr_420100 ', '0');
INSERT INTO `provinces` VALUES ('420116', '黄陂区', '420100', '', '0', '0', 'H', '114.38245399676', '30.887533767835', '3', 'tr_0 tr_420000 tr_420100 ', '0');
INSERT INTO `provinces` VALUES ('420117', '新洲区', '420100', '', '0', '0', 'X', '114.8075433929', '30.847243870523', '3', 'tr_0 tr_420000 tr_420100 ', '0');
INSERT INTO `provinces` VALUES ('420202', '黄石港区', '420200', '', '0', '0', 'H', '115.07241748608', '30.229052639992', '3', 'tr_0 tr_420000 tr_420200 ', '0');
INSERT INTO `provinces` VALUES ('420203', '西塞山区', '420200', '', '0', '0', 'X', '115.11648143744', '30.210695184118', '3', 'tr_0 tr_420000 tr_420200 ', '0');
INSERT INTO `provinces` VALUES ('420204', '下陆区', '420200', '', '0', '0', 'X', '114.96741590247', '30.180046155273', '3', 'tr_0 tr_420000 tr_420200 ', '0');
INSERT INTO `provinces` VALUES ('420205', '铁山区', '420200', '', '0', '0', 'T', '114.90757141821', '30.212250832587', '3', 'tr_0 tr_420000 tr_420200 ', '0');
INSERT INTO `provinces` VALUES ('420222', '阳新县', '420200', '', '0', '0', 'Y', '115.22142677197', '29.836541808086', '3', 'tr_0 tr_420000 tr_420200 ', '0');
INSERT INTO `provinces` VALUES ('420281', '大冶市', '420200', '', '0', '0', 'D', '114.98643626402', '30.101667800103', '3', 'tr_0 tr_420000 tr_420200 ', '0');
INSERT INTO `provinces` VALUES ('420302', '茅箭区', '420300', '', '0', '0', 'M', '110.81958031019', '32.597286519104', '3', 'tr_0 tr_420000 tr_420300 ', '0');
INSERT INTO `provinces` VALUES ('420303', '张湾区', '420300', '', '0', '0', 'Z', '110.77542410285', '32.65839954548', '3', 'tr_0 tr_420000 tr_420300 ', '0');
INSERT INTO `provinces` VALUES ('420304', '郧阳区', '420300', '', '0', '0', 'Y', '110.81857654362', '32.840592413038', '3', 'tr_0 tr_420000 tr_420300 ', '0');
INSERT INTO `provinces` VALUES ('420322', '郧西县', '420300', '', '0', '0', 'Y', '110.43247261847', '32.999167007536', '3', 'tr_0 tr_420000 tr_420300 ', '0');
INSERT INTO `provinces` VALUES ('420323', '竹山县', '420300', '', '0', '0', 'Z', '110.23558156764', '32.230304060376', '3', 'tr_0 tr_420000 tr_420300 ', '0');
INSERT INTO `provinces` VALUES ('420324', '竹溪县', '420300', '', '0', '0', 'Z', '109.72154249889', '32.324120048853', '3', 'tr_0 tr_420000 tr_420300 ', '0');
INSERT INTO `provinces` VALUES ('420325', '房县', '420300', '', '0', '0', 'F', '110.74746155911', '32.061684964544', '3', 'tr_0 tr_420000 tr_420300 ', '0');
INSERT INTO `provinces` VALUES ('420381', '丹江口市', '420300', '', '0', '0', 'D', '111.51953205848', '32.546252688501', '3', 'tr_0 tr_420000 tr_420300 ', '0');
INSERT INTO `provinces` VALUES ('420502', '西陵区', '420500', '', '0', '0', 'X', '111.29255972053', '30.716749346598', '3', 'tr_0 tr_420000 tr_420500 ', '0');
INSERT INTO `provinces` VALUES ('420503', '伍家岗区', '420500', '', '0', '0', 'W', '111.36742225597', '30.65073733526', '3', 'tr_0 tr_420000 tr_420500 ', '0');
INSERT INTO `provinces` VALUES ('420504', '点军区', '420500', '', '0', '0', 'D', '111.27447135095', '30.69932951388', '3', 'tr_0 tr_420000 tr_420500 ', '0');
INSERT INTO `provinces` VALUES ('420505', '猇亭区', '420500', '', '0', '0', 'X', '111.44157378259', '30.536465982707', '3', 'tr_0 tr_420000 tr_420500 ', '0');
INSERT INTO `provinces` VALUES ('420506', '夷陵区', '420500', '', '0', '0', 'Y', '111.33252973436', '30.774833327298', '3', 'tr_0 tr_420000 tr_420500 ', '0');
INSERT INTO `provinces` VALUES ('420525', '远安县', '420500', '', '0', '0', 'Y', '111.64653035927', '31.066627841578', '3', 'tr_0 tr_420000 tr_420500 ', '0');
INSERT INTO `provinces` VALUES ('420526', '兴山县', '420500', '', '0', '0', 'X', '110.75344607041', '31.354463517716', '3', 'tr_0 tr_420000 tr_420500 ', '0');
INSERT INTO `provinces` VALUES ('420527', '秭归县', '420500', '', '0', '0', 'Z', '110.98444937468', '30.831931643216', '3', 'tr_0 tr_420000 tr_420500 ', '0');
INSERT INTO `provinces` VALUES ('420528', '长阳土家族自治县', '420500', '', '0', '0', 'Z', '111.21350712887', '30.478645783056', '3', 'tr_0 tr_420000 tr_420500 ', '0');
INSERT INTO `provinces` VALUES ('420529', '五峰土家族自治县', '420500', '', '0', '0', 'W', '111.05258063744', '30.171156151026', '3', 'tr_0 tr_420000 tr_420500 ', '0');
INSERT INTO `provinces` VALUES ('420581', '宜都市', '420500', '', '0', '0', 'Y', '111.45651583712', '30.384404274314', '3', 'tr_0 tr_420000 tr_420500 ', '0');
INSERT INTO `provinces` VALUES ('420582', '当阳市', '420500', '', '0', '0', 'D', '111.79456850223', '30.826989050281', '3', 'tr_0 tr_420000 tr_420500 ', '0');
INSERT INTO `provinces` VALUES ('420583', '枝江市', '420500', '', '0', '0', 'Z', '111.76653975337', '30.431730676998', '3', 'tr_0 tr_420000 tr_420500 ', '0');
INSERT INTO `provinces` VALUES ('420602', '襄城区', '420600', '', '0', '0', 'X', '112.14057206941', '32.016174618141', '3', 'tr_0 tr_420000 tr_420600 ', '0');
INSERT INTO `provinces` VALUES ('420606', '樊城区', '420600', '', '0', '0', 'F', '112.14259891613', '32.050572374692', '3', 'tr_0 tr_420000 tr_420600 ', '0');
INSERT INTO `provinces` VALUES ('420607', '襄州区', '420600', '', '0', '0', 'X', '112.21843413678', '32.093375783399', '3', 'tr_0 tr_420000 tr_420600 ', '0');
INSERT INTO `provinces` VALUES ('420624', '南漳县', '420600', '', '0', '0', 'N', '111.84538618392', '31.781129706779', '3', 'tr_0 tr_420000 tr_420600 ', '0');
INSERT INTO `provinces` VALUES ('420625', '谷城县', '420600', '', '0', '0', 'G', '111.65957564172', '32.268983068947', '3', 'tr_0 tr_420000 tr_420600 ', '0');
INSERT INTO `provinces` VALUES ('420626', '保康县', '420600', '', '0', '0', 'B', '111.26744121203', '31.883847150262', '3', 'tr_0 tr_420000 tr_420600 ', '0');
INSERT INTO `provinces` VALUES ('420682', '老河口市', '420600', '', '0', '0', 'L', '111.68155636908', '32.392459585271', '3', 'tr_0 tr_420000 tr_420600 ', '0');
INSERT INTO `provinces` VALUES ('420683', '枣阳市', '420600', '', '0', '0', 'Z', '112.77847075951', '32.134729914319', '3', 'tr_0 tr_420000 tr_420600 ', '0');
INSERT INTO `provinces` VALUES ('420684', '宜城市', '420600', '', '0', '0', 'Y', '112.26461144169', '31.725469730972', '3', 'tr_0 tr_420000 tr_420600 ', '0');
INSERT INTO `provinces` VALUES ('420702', '梁子湖区', '420700', '', '0', '0', 'L', '114.69150657526', '30.105906774051', '3', 'tr_0 tr_420000 tr_420700 ', '0');
INSERT INTO `provinces` VALUES ('420703', '华容区', '420700', '', '0', '0', 'H', '114.73642634228', '30.540599527838', '3', 'tr_0 tr_420000 tr_420700 ', '0');
INSERT INTO `provinces` VALUES ('420704', '鄂城区', '420700', '', '0', '0', 'E', '114.89859968176', '30.406389456292', '3', 'tr_0 tr_420000 tr_420700 ', '0');
INSERT INTO `provinces` VALUES ('420802', '东宝区', '420800', '', '0', '0', 'D', '112.2083882066', '31.058429271365', '3', 'tr_0 tr_420000 tr_420800 ', '0');
INSERT INTO `provinces` VALUES ('420804', '掇刀区', '420800', '', '0', '0', 'D', '112.2144276942', '30.979910859804', '3', 'tr_0 tr_420000 tr_420800 ', '0');
INSERT INTO `provinces` VALUES ('420822', '沙洋县', '420800', '', '0', '0', 'S', '112.59548493899', '30.715314748831', '3', 'tr_0 tr_420000 tr_420800 ', '0');
INSERT INTO `provinces` VALUES ('420881', '钟祥市', '420800', '', '0', '0', 'Z', '112.59447102156', '31.174029854963', '3', 'tr_0 tr_420000 tr_420800 ', '0');
INSERT INTO `provinces` VALUES ('420882', '京山市', '420800', '', '0', '0', 'J', '113.12654806496', '31.024330601193', '3', 'tr_0 tr_420000 tr_420800 ', '0');
INSERT INTO `provinces` VALUES ('420902', '孝南区', '420900', '', '0', '0', 'X', '113.91748989699', '30.922977925049', '3', 'tr_0 tr_420000 tr_420900 ', '0');
INSERT INTO `provinces` VALUES ('420921', '孝昌县', '420900', '', '0', '0', 'X', '114.00440859068', '31.264540493062', '3', 'tr_0 tr_420000 tr_420900 ', '0');
INSERT INTO `provinces` VALUES ('420922', '大悟县', '420900', '', '0', '0', 'D', '114.13341253819', '31.567219806641', '3', 'tr_0 tr_420000 tr_420900 ', '0');
INSERT INTO `provinces` VALUES ('420923', '云梦县', '420900', '', '0', '0', 'Y', '113.75941220183', '31.027218220752', '3', 'tr_0 tr_420000 tr_420900 ', '0');
INSERT INTO `provinces` VALUES ('420981', '应城市', '420900', '', '0', '0', 'Y', '113.57956739635', '30.933976509913', '3', 'tr_0 tr_420000 tr_420900 ', '0');
INSERT INTO `provinces` VALUES ('420982', '安陆市', '420900', '', '0', '0', 'A', '113.69558292415', '31.261414994286', '3', 'tr_0 tr_420000 tr_420900 ', '0');
INSERT INTO `provinces` VALUES ('420984', '汉川市', '420900', '', '0', '0', 'H', '113.8455490104', '30.666913578821', '3', 'tr_0 tr_420000 tr_420900 ', '0');
INSERT INTO `provinces` VALUES ('421002', '沙市区', '421000', '', '0', '0', 'S', '112.26157741483', '30.316571904872', '3', 'tr_0 tr_420000 tr_421000 ', '0');
INSERT INTO `provinces` VALUES ('421003', '荆州区', '421000', '', '0', '0', 'J', '112.19641397381', '30.358989490775', '3', 'tr_0 tr_420000 tr_421000 ', '0');
INSERT INTO `provinces` VALUES ('421022', '公安县', '421000', '', '0', '0', 'G', '112.23650157584', '30.064400686806', '3', 'tr_0 tr_420000 tr_421000 ', '0');
INSERT INTO `provinces` VALUES ('421023', '监利县', '421000', '', '0', '0', 'J', '112.91142023009', '29.845735162836', '3', 'tr_0 tr_420000 tr_421000 ', '0');
INSERT INTO `provinces` VALUES ('421024', '江陵县', '421000', '', '0', '0', 'J', '112.43145201728', '30.048042984592', '3', 'tr_0 tr_420000 tr_421000 ', '0');
INSERT INTO `provinces` VALUES ('421071', '荆州经济技术开发区', '421000', '', '0', '0', 'J', '112.19641397381', '30.358989490775', '3', 'tr_0 tr_420000 tr_421000 ', '0');
INSERT INTO `provinces` VALUES ('421081', '石首市', '421000', '', '0', '0', 'S', '112.43141984371', '29.727033977407', '3', 'tr_0 tr_420000 tr_421000 ', '0');
INSERT INTO `provinces` VALUES ('421083', '洪湖市', '421000', '', '0', '0', 'H', '113.48255290196', '29.83277032976', '3', 'tr_0 tr_420000 tr_421000 ', '0');
INSERT INTO `provinces` VALUES ('421087', '松滋市', '421000', '', '0', '0', 'S', '111.77358031264', '30.175342235143', '3', 'tr_0 tr_420000 tr_421000 ', '0');
INSERT INTO `provinces` VALUES ('421102', '黄州区', '421100', '', '0', '0', 'H', '114.88653238452', '30.440224145146', '3', 'tr_0 tr_420000 tr_421100 ', '0');
INSERT INTO `provinces` VALUES ('421121', '团风县', '421100', '', '0', '0', 'T', '114.87852435023', '30.649367767215', '3', 'tr_0 tr_420000 tr_421100 ', '0');
INSERT INTO `provinces` VALUES ('421122', '红安县', '421100', '', '0', '0', 'H', '114.6244256113', '31.294296714037', '3', 'tr_0 tr_420000 tr_421100 ', '0');
INSERT INTO `provinces` VALUES ('421123', '罗田县', '421100', '', '0', '0', 'L', '115.4055471675', '30.788910495685', '3', 'tr_0 tr_420000 tr_421100 ', '0');
INSERT INTO `provinces` VALUES ('421124', '英山县', '421100', '', '0', '0', 'Y', '115.68742160263', '30.741350084085', '3', 'tr_0 tr_420000 tr_421100 ', '0');
INSERT INTO `provinces` VALUES ('421125', '浠水县', '421100', '', '0', '0', 'X', '115.27156903289', '30.457460842265', '3', 'tr_0 tr_420000 tr_421100 ', '0');
INSERT INTO `provinces` VALUES ('421126', '蕲春县', '421100', '', '0', '0', 'Q', '115.4423985341', '30.232535499734', '3', 'tr_0 tr_420000 tr_421100 ', '0');
INSERT INTO `provinces` VALUES ('421127', '黄梅县', '421100', '', '0', '0', 'H', '115.95046198477', '30.076605056821', '3', 'tr_0 tr_420000 tr_421100 ', '0');
INSERT INTO `provinces` VALUES ('421171', '龙感湖管理区', '421100', '', '0', '0', 'L', '116.01030250647', '29.879697031911', '3', 'tr_0 tr_420000 tr_421100 ', '0');
INSERT INTO `provinces` VALUES ('421181', '麻城市', '421100', '', '0', '0', 'M', '115.01656174777', '31.176995837411', '3', 'tr_0 tr_420000 tr_421100 ', '0');
INSERT INTO `provinces` VALUES ('421182', '武穴市', '421100', '', '0', '0', 'W', '115.56739216105', '29.850441430483', '3', 'tr_0 tr_420000 tr_421100 ', '0');
INSERT INTO `provinces` VALUES ('421202', '咸安区', '421200', '', '0', '0', 'X', '114.30456990606', '29.858153915154', '3', 'tr_0 tr_420000 tr_421200 ', '0');
INSERT INTO `provinces` VALUES ('421221', '嘉鱼县', '421200', '', '0', '0', 'J', '113.94557046336', '29.976353520898', '3', 'tr_0 tr_420000 tr_421200 ', '0');
INSERT INTO `provinces` VALUES ('421222', '通城县', '421200', '', '0', '0', 'T', '113.82356790903', '29.250857930222', '3', 'tr_0 tr_420000 tr_421200 ', '0');
INSERT INTO `provinces` VALUES ('421223', '崇阳县', '421200', '', '0', '0', 'C', '114.04656290943', '29.561333782271', '3', 'tr_0 tr_420000 tr_421200 ', '0');
INSERT INTO `provinces` VALUES ('421224', '通山县', '421200', '', '0', '0', 'T', '114.48939330027', '29.612634338058', '3', 'tr_0 tr_420000 tr_421200 ', '0');
INSERT INTO `provinces` VALUES ('421281', '赤壁市', '421200', '', '0', '0', 'C', '113.90643686179', '29.730665997526', '3', 'tr_0 tr_420000 tr_421200 ', '0');
INSERT INTO `provinces` VALUES ('421303', '曾都区', '421300', '', '0', '0', 'C', '113.3775133346', '31.722122861271', '3', 'tr_0 tr_420000 tr_421300 ', '0');
INSERT INTO `provinces` VALUES ('421321', '随县', '421300', '', '0', '0', 'S', '113.3064583569', '31.859971678258', '3', 'tr_0 tr_420000 tr_421300 ', '0');
INSERT INTO `provinces` VALUES ('421381', '广水市', '421300', '', '0', '0', 'G', '113.83259337884', '31.622476038007', '3', 'tr_0 tr_420000 tr_421300 ', '0');
INSERT INTO `provinces` VALUES ('422801', '恩施市', '422800', '', '0', '0', 'E', '109.48655026901', '30.301037143741', '3', 'tr_0 tr_420000 tr_422800 ', '0');
INSERT INTO `provinces` VALUES ('422802', '利川市', '422800', '', '0', '0', 'L', '108.94248057756', '30.29720344368', '3', 'tr_0 tr_420000 tr_422800 ', '0');
INSERT INTO `provinces` VALUES ('422822', '建始县', '422800', '', '0', '0', 'J', '109.72855610899', '30.607907026319', '3', 'tr_0 tr_420000 tr_422800 ', '0');
INSERT INTO `provinces` VALUES ('422823', '巴东县', '422800', '', '0', '0', 'B', '110.34757529184', '31.04806424896', '3', 'tr_0 tr_420000 tr_422800 ', '0');
INSERT INTO `provinces` VALUES ('422825', '宣恩县', '422800', '', '0', '0', 'X', '109.49756797283', '29.99260392208', '3', 'tr_0 tr_420000 tr_422800 ', '0');
INSERT INTO `provinces` VALUES ('422826', '咸丰县', '422800', '', '0', '0', 'X', '109.14660773562', '29.671077652358', '3', 'tr_0 tr_420000 tr_422800 ', '0');
INSERT INTO `provinces` VALUES ('422827', '来凤县', '422800', '', '0', '0', 'L', '109.41349484153', '29.499443572607', '3', 'tr_0 tr_420000 tr_422800 ', '0');
INSERT INTO `provinces` VALUES ('422828', '鹤峰县', '422800', '', '0', '0', 'H', '110.04042423301', '29.896116483403', '3', 'tr_0 tr_420000 tr_422800 ', '0');
INSERT INTO `provinces` VALUES ('429004', '仙桃市', '429000', '', '0', '0', 'X', '113.46159059813', '30.368271921725', '3', 'tr_0 tr_420000 tr_429000 ', '0');
INSERT INTO `provinces` VALUES ('429005', '潜江市', '429000', '', '0', '0', 'Q', '112.90547409082', '30.408357932419', '3', 'tr_0 tr_420000 tr_429000 ', '0');
INSERT INTO `provinces` VALUES ('429006', '天门市', '429000', '', '0', '0', 'T', '113.17240916633', '30.669621830099', '3', 'tr_0 tr_420000 tr_429000 ', '0');
INSERT INTO `provinces` VALUES ('429021', '神农架林区', '429000', '', '0', '0', 'S', '110.6825248504', '31.750496011246', '3', 'tr_0 tr_420000 tr_429000 ', '0');
INSERT INTO `provinces` VALUES ('371602', '滨城区', '371600', '', '0', '0', 'B', '118.02660385061', '37.436843207744', '3', 'tr_0 tr_370000 tr_371600 ', '0');
INSERT INTO `provinces` VALUES ('371603', '沾化区', '371600', '', '0', '0', 'Z', '118.10545441336', '37.705298106724', '3', 'tr_0 tr_370000 tr_371600 ', '0');
INSERT INTO `provinces` VALUES ('371621', '惠民县', '371600', '', '0', '0', 'H', '117.5165096905', '37.49580310894', '3', 'tr_0 tr_370000 tr_371600 ', '0');
INSERT INTO `provinces` VALUES ('371622', '阳信县', '371600', '', '0', '0', 'Y', '117.58443703791', '37.647338034957', '3', 'tr_0 tr_370000 tr_371600 ', '0');
INSERT INTO `provinces` VALUES ('371623', '无棣县', '371600', '', '0', '0', 'W', '117.63245748606', '37.777567312086', '3', 'tr_0 tr_370000 tr_371600 ', '0');
INSERT INTO `provinces` VALUES ('371625', '博兴县', '371600', '', '0', '0', 'B', '118.11749269533', '37.160477277651', '3', 'tr_0 tr_370000 tr_371600 ', '0');
INSERT INTO `provinces` VALUES ('371681', '邹平市', '371600', '', '0', '0', 'Z', '117.74947848722', '36.870032216697', '3', 'tr_0 tr_370000 tr_371600 ', '0');
INSERT INTO `provinces` VALUES ('430202', '荷塘区', '430200', '', '0', '0', 'H', '113.18045222007', '27.862155809141', '3', 'tr_0 tr_430000 tr_430200 ', '0');
INSERT INTO `provinces` VALUES ('430203', '芦淞区', '430200', '', '0', '0', 'L', '113.15841867236', '27.791508825947', '3', 'tr_0 tr_430000 tr_430200 ', '0');
INSERT INTO `provinces` VALUES ('430204', '石峰区', '430200', '', '0', '0', 'S', '113.12456791567', '27.880705165595', '3', 'tr_0 tr_430000 tr_430200 ', '0');
INSERT INTO `provinces` VALUES ('430211', '天元区', '430200', '', '0', '0', 'T', '113.08954055842', '27.833083519485', '3', 'tr_0 tr_430000 tr_430200 ', '0');
INSERT INTO `provinces` VALUES ('430212', '渌口区', '430200', '', '0', '0', 'L', '113.15042671773', '27.704322804857', '3', 'tr_0 tr_430000 tr_430200 ', '0');
INSERT INTO `provinces` VALUES ('430223', '攸县', '430200', '', '0', '0', 'Y', '113.35157834169', '27.005771565213', '3', 'tr_0 tr_430000 tr_430200 ', '0');
INSERT INTO `provinces` VALUES ('430224', '茶陵县', '430200', '', '0', '0', 'C', '113.54547165714', '26.78358911036', '3', 'tr_0 tr_430000 tr_430200 ', '0');
INSERT INTO `provinces` VALUES ('430225', '炎陵县', '430200', '', '0', '0', 'Y', '113.77941879832', '26.496060691599', '3', 'tr_0 tr_430000 tr_430200 ', '0');
INSERT INTO `provinces` VALUES ('430271', '云龙示范区', '430200', '', '0', '0', 'Y', '113.17446420357', '27.934854931886', '3', 'tr_0 tr_430000 tr_430200 ', '0');
INSERT INTO `provinces` VALUES ('430281', '醴陵市', '430200', '', '0', '0', 'L', '113.50348315084', '27.652325149951', '3', 'tr_0 tr_430000 tr_430200 ', '0');
INSERT INTO `provinces` VALUES ('430302', '雨湖区', '430300', '', '0', '0', 'Y', '112.91344959207', '27.862466785111', '3', 'tr_0 tr_430000 tr_430300 ', '0');
INSERT INTO `provinces` VALUES ('430304', '岳塘区', '430300', '', '0', '0', 'Y', '112.97558942655', '27.877720506364', '3', 'tr_0 tr_430000 tr_430300 ', '0');
INSERT INTO `provinces` VALUES ('430321', '湘潭县', '430300', '', '0', '0', 'X', '112.95750536884', '27.784982534656', '3', 'tr_0 tr_430000 tr_430300 ', '0');
INSERT INTO `provinces` VALUES ('430371', '湖南湘潭高新技术产业园区', '430300', '', '0', '0', 'H', '112.95046418076', '27.835702227136', '3', 'tr_0 tr_430000 tr_430300 ', '0');
INSERT INTO `provinces` VALUES ('430372', '湘潭昭山示范区', '430300', '', '0', '0', 'X', '113.01812844052', '27.97161027839', '3', 'tr_0 tr_430000 tr_430300 ', '0');
INSERT INTO `provinces` VALUES ('430373', '湘潭九华示范区', '430300', '', '0', '0', 'X', '112.94707945543', '27.916546191684', '3', 'tr_0 tr_430000 tr_430300 ', '0');
INSERT INTO `provinces` VALUES ('430381', '湘乡市', '430300', '', '0', '0', 'X', '112.54149155341', '27.740190553344', '3', 'tr_0 tr_430000 tr_430300 ', '0');
INSERT INTO `provinces` VALUES ('430382', '韶山市', '430300', '', '0', '0', 'S', '112.53349932929', '27.921043749631', '3', 'tr_0 tr_430000 tr_430300 ', '0');
INSERT INTO `provinces` VALUES ('430405', '珠晖区', '430400', '', '0', '0', 'Z', '112.62659414282', '26.900265361946', '3', 'tr_0 tr_430000 tr_430400 ', '0');
INSERT INTO `provinces` VALUES ('430406', '雁峰区', '430400', '', '0', '0', 'Y', '112.62358823292', '26.89436829036', '3', 'tr_0 tr_430000 tr_430400 ', '0');
INSERT INTO `provinces` VALUES ('430407', '石鼓区', '430400', '', '0', '0', 'S', '112.60452969339', '26.948961867165', '3', 'tr_0 tr_430000 tr_430400 ', '0');
INSERT INTO `provinces` VALUES ('430408', '蒸湘区', '430400', '', '0', '0', 'Z', '112.57344401089', '26.917719877877', '3', 'tr_0 tr_430000 tr_430400 ', '0');
INSERT INTO `provinces` VALUES ('430412', '南岳区', '430400', '', '0', '0', 'N', '112.74557434825', '27.238360474562', '3', 'tr_0 tr_430000 tr_430400 ', '0');
INSERT INTO `provinces` VALUES ('430421', '衡阳县', '430400', '', '0', '0', 'H', '112.37755268433', '26.975294950861', '3', 'tr_0 tr_430000 tr_430400 ', '0');
INSERT INTO `provinces` VALUES ('430422', '衡南县', '430400', '', '0', '0', 'H', '112.68440252779', '26.744531956772', '3', 'tr_0 tr_430000 tr_430400 ', '0');
INSERT INTO `provinces` VALUES ('430423', '衡山县', '430400', '', '0', '0', 'H', '112.87556328771', '27.235996029656', '3', 'tr_0 tr_430000 tr_430400 ', '0');
INSERT INTO `provinces` VALUES ('430424', '衡东县', '430400', '', '0', '0', 'H', '112.95949529521', '27.087042820265', '3', 'tr_0 tr_430000 tr_430400 ', '0');
INSERT INTO `provinces` VALUES ('430426', '祁东县', '430400', '', '0', '0', 'Q', '112.09644737847', '26.805995255191', '3', 'tr_0 tr_430000 tr_430400 ', '0');
INSERT INTO `provinces` VALUES ('430471', '衡阳综合保税区', '430400', '', '0', '0', 'H', '112.57844721326', '26.899576139189', '3', 'tr_0 tr_430000 tr_430400 ', '0');
INSERT INTO `provinces` VALUES ('430472', '湖南衡阳高新技术产业园区', '430400', '', '0', '0', 'H', '112.57844721326', '26.899576139189', '3', 'tr_0 tr_430000 tr_430400 ', '0');
INSERT INTO `provinces` VALUES ('430473', '湖南衡阳松木经济开发区', '430400', '', '0', '0', 'H', '112.57844721326', '26.899576139189', '3', 'tr_0 tr_430000 tr_430400 ', '0');
INSERT INTO `provinces` VALUES ('430481', '耒阳市', '430400', '', '0', '0', 'L', '112.86659721058', '26.428065593928', '3', 'tr_0 tr_430000 tr_430400 ', '0');
INSERT INTO `provinces` VALUES ('430482', '常宁市', '430400', '', '0', '0', 'C', '112.40556050266', '26.426720432257', '3', 'tr_0 tr_430000 tr_430400 ', '0');
INSERT INTO `provinces` VALUES ('430502', '双清区', '430500', '', '0', '0', 'S', '111.50344150643', '27.239108783297', '3', 'tr_0 tr_430000 tr_430500 ', '0');
INSERT INTO `provinces` VALUES ('430503', '大祥区', '430500', '', '0', '0', 'D', '111.44552828921', '27.227013968694', '3', 'tr_0 tr_430000 tr_430500 ', '0');
INSERT INTO `provinces` VALUES ('430511', '北塔区', '430500', '', '0', '0', 'B', '111.45849694619', '27.251536276174', '3', 'tr_0 tr_430000 tr_430500 ', '0');
INSERT INTO `provinces` VALUES ('430521', '邵东县', '430500', '', '0', '0', 'S', '111.75049070296', '27.264507471566', '3', 'tr_0 tr_430000 tr_430500 ', '0');
INSERT INTO `provinces` VALUES ('430522', '新邵县', '430500', '', '0', '0', 'X', '111.46444938799', '27.32713173916', '3', 'tr_0 tr_430000 tr_430500 ', '0');
INSERT INTO `provinces` VALUES ('430523', '邵阳县', '430500', '', '0', '0', 'S', '111.28050768064', '26.996528332196', '3', 'tr_0 tr_430000 tr_430500 ', '0');
INSERT INTO `provinces` VALUES ('430524', '隆回县', '430500', '', '0', '0', 'L', '111.03950668528', '27.119946440019', '3', 'tr_0 tr_430000 tr_430500 ', '0');
INSERT INTO `provinces` VALUES ('430525', '洞口县', '430500', '', '0', '0', 'D', '110.58257909625', '27.065975437799', '3', 'tr_0 tr_430000 tr_430500 ', '0');
INSERT INTO `provinces` VALUES ('430527', '绥宁县', '430500', '', '0', '0', 'S', '110.16241987038', '26.588422719333', '3', 'tr_0 tr_430000 tr_430500 ', '0');
INSERT INTO `provinces` VALUES ('430528', '新宁县', '430500', '', '0', '0', 'X', '110.86349072744', '26.439723697954', '3', 'tr_0 tr_430000 tr_430500 ', '0');
INSERT INTO `provinces` VALUES ('430529', '城步苗族自治县', '430500', '', '0', '0', 'C', '110.32853713032', '26.396203220078', '3', 'tr_0 tr_430000 tr_430500 ', '0');
INSERT INTO `provinces` VALUES ('430581', '武冈市', '430500', '', '0', '0', 'W', '110.63840761588', '26.732898572992', '3', 'tr_0 tr_430000 tr_430500 ', '0');
INSERT INTO `provinces` VALUES ('430602', '岳阳楼区', '430600', '', '0', '0', 'Y', '113.13648070435', '29.377995036881', '3', 'tr_0 tr_430000 tr_430600 ', '0');
INSERT INTO `provinces` VALUES ('430603', '云溪区', '430600', '', '0', '0', 'Y', '113.27840659691', '29.479907141133', '3', 'tr_0 tr_430000 tr_430600 ', '0');
INSERT INTO `provinces` VALUES ('430611', '君山区', '430600', '', '0', '0', 'J', '113.0125171491', '29.467129185832', '3', 'tr_0 tr_430000 tr_430600 ', '0');
INSERT INTO `provinces` VALUES ('430621', '岳阳县', '430600', '', '0', '0', 'Y', '113.1225444825', '29.150269316045', '3', 'tr_0 tr_430000 tr_430600 ', '0');
INSERT INTO `provinces` VALUES ('430623', '华容县', '430600', '', '0', '0', 'H', '112.54746151216', '29.536286434382', '3', 'tr_0 tr_430000 tr_430600 ', '0');
INSERT INTO `provinces` VALUES ('430624', '湘阴县', '430600', '', '0', '0', 'X', '112.88952187736', '28.676676377581', '3', 'tr_0 tr_430000 tr_430600 ', '0');
INSERT INTO `provinces` VALUES ('430626', '平江县', '430600', '', '0', '0', 'P', '113.58760362284', '28.707564248115', '3', 'tr_0 tr_430000 tr_430600 ', '0');
INSERT INTO `provinces` VALUES ('430671', '岳阳市屈原管理区', '430600', '', '0', '0', 'Y', '112.92259003029', '28.866288191728', '3', 'tr_0 tr_430000 tr_430600 ', '0');
INSERT INTO `provinces` VALUES ('430681', '汨罗市', '430600', '', '0', '0', 'M', '113.07349286947', '28.812454694812', '3', 'tr_0 tr_430000 tr_430600 ', '0');
INSERT INTO `provinces` VALUES ('430682', '临湘市', '430600', '', '0', '0', 'L', '113.45656151', '29.482801373395', '3', 'tr_0 tr_430000 tr_430600 ', '0');
INSERT INTO `provinces` VALUES ('430702', '武陵区', '430700', '', '0', '0', 'W', '111.68954489616', '29.060783476578', '3', 'tr_0 tr_430000 tr_430700 ', '0');
INSERT INTO `provinces` VALUES ('430703', '鼎城区', '430700', '', '0', '0', 'D', '111.68752209182', '29.024443397066', '3', 'tr_0 tr_430000 tr_430700 ', '0');
INSERT INTO `provinces` VALUES ('430721', '安乡县', '430700', '', '0', '0', 'A', '112.1775061558', '29.41732043222', '3', 'tr_0 tr_430000 tr_430700 ', '0');
INSERT INTO `provinces` VALUES ('430722', '汉寿县', '430700', '', '0', '0', 'H', '111.97641193356', '28.912287603085', '3', 'tr_0 tr_430000 tr_430700 ', '0');
INSERT INTO `provinces` VALUES ('430723', '澧县', '430700', '', '0', '0', 'L', '111.76553354736', '29.638946004609', '3', 'tr_0 tr_430000 tr_430700 ', '0');
INSERT INTO `provinces` VALUES ('430724', '临澧县', '430700', '', '0', '0', 'L', '111.65358500797', '29.446543990119', '3', 'tr_0 tr_430000 tr_430700 ', '0');
INSERT INTO `provinces` VALUES ('430725', '桃源县', '430700', '', '0', '0', 'T', '111.49540733145', '28.908694006999', '3', 'tr_0 tr_430000 tr_430700 ', '0');
INSERT INTO `provinces` VALUES ('430726', '石门县', '430700', '', '0', '0', 'S', '111.38645140702', '29.59036596665', '3', 'tr_0 tr_430000 tr_430700 ', '0');
INSERT INTO `provinces` VALUES ('430771', '常德市西洞庭管理区', '430700', '', '0', '0', 'C', '112.0093067782', '29.197804478833', '3', 'tr_0 tr_430000 tr_430700 ', '0');
INSERT INTO `provinces` VALUES ('430781', '津市市', '430700', '', '0', '0', 'J', '111.88451734602', '29.611258543007', '3', 'tr_0 tr_430000 tr_430700 ', '0');
INSERT INTO `provinces` VALUES ('430802', '永定区', '430800', '', '0', '0', 'Y', '110.54443192397', '29.126190558381', '3', 'tr_0 tr_430000 tr_430800 ', '0');
INSERT INTO `provinces` VALUES ('430811', '武陵源区', '430800', '', '0', '0', 'W', '110.5574989454', '29.351681136671', '3', 'tr_0 tr_430000 tr_430800 ', '0');
INSERT INTO `provinces` VALUES ('430821', '慈利县', '430800', '', '0', '0', 'C', '111.14547125235', '29.435986725969', '3', 'tr_0 tr_430000 tr_430800 ', '0');
INSERT INTO `provinces` VALUES ('430822', '桑植县', '430800', '', '0', '0', 'S', '110.17041335213', '29.405923219415', '3', 'tr_0 tr_430000 tr_430800 ', '0');
INSERT INTO `provinces` VALUES ('430902', '资阳区', '430900', '', '0', '0', 'Z', '112.33043548238', '28.597234549737', '3', 'tr_0 tr_430000 tr_430900 ', '0');
INSERT INTO `provinces` VALUES ('430903', '赫山区', '430900', '', '0', '0', 'H', '112.38059794001', '28.584983567573', '3', 'tr_0 tr_430000 tr_430900 ', '0');
INSERT INTO `provinces` VALUES ('430921', '南县', '430900', '', '0', '0', 'N', '112.40254156734', '29.367069853363', '3', 'tr_0 tr_430000 tr_430900 ', '0');
INSERT INTO `provinces` VALUES ('430922', '桃江县', '430900', '', '0', '0', 'T', '112.16254146398', '28.523870869898', '3', 'tr_0 tr_430000 tr_430900 ', '0');
INSERT INTO `provinces` VALUES ('430923', '安化县', '430900', '', '0', '0', 'A', '111.21949270432', '28.380053748765', '3', 'tr_0 tr_430000 tr_430900 ', '0');
INSERT INTO `provinces` VALUES ('430971', '益阳市大通湖管理区', '430900', '', '0', '0', 'Y', '112.65023278281', '29.193681230112', '3', 'tr_0 tr_430000 tr_430900 ', '0');
INSERT INTO `provinces` VALUES ('430972', '湖南益阳高新技术产业园区', '430900', '', '0', '0', 'H', '112.3715604476', '28.816150235875', '3', 'tr_0 tr_430000 tr_430900 ', '0');
INSERT INTO `provinces` VALUES ('430981', '沅江市', '430900', '', '0', '0', 'Y', '112.36053222035', '28.850233588583', '3', 'tr_0 tr_430000 tr_430900 ', '0');
INSERT INTO `provinces` VALUES ('431002', '北湖区', '431000', '', '0', '0', 'B', '113.01748199382', '25.79081459434', '3', 'tr_0 tr_430000 tr_431000 ', '0');
INSERT INTO `provinces` VALUES ('431003', '苏仙区', '431000', '', '0', '0', 'S', '113.04842340846', '25.806737374104', '3', 'tr_0 tr_430000 tr_431000 ', '0');
INSERT INTO `provinces` VALUES ('431021', '桂阳县', '431000', '', '0', '0', 'G', '112.74056036622', '25.759775327893', '3', 'tr_0 tr_430000 tr_431000 ', '0');
INSERT INTO `provinces` VALUES ('431022', '宜章县', '431000', '', '0', '0', 'Y', '112.95547924076', '25.405713969356', '3', 'tr_0 tr_430000 tr_431000 ', '0');
INSERT INTO `provinces` VALUES ('431023', '永兴县', '431000', '', '0', '0', 'Y', '113.12253316386', '26.132968478533', '3', 'tr_0 tr_430000 tr_431000 ', '0');
INSERT INTO `provinces` VALUES ('431024', '嘉禾县', '431000', '', '0', '0', 'J', '112.37558377831', '25.593421718268', '3', 'tr_0 tr_430000 tr_431000 ', '0');
INSERT INTO `provinces` VALUES ('431025', '临武县', '431000', '', '0', '0', 'L', '112.57041115183', '25.282527010969', '3', 'tr_0 tr_430000 tr_431000 ', '0');
INSERT INTO `provinces` VALUES ('431026', '汝城县', '431000', '', '0', '0', 'R', '113.69154466692', '25.556056733978', '3', 'tr_0 tr_430000 tr_431000 ', '0');
INSERT INTO `provinces` VALUES ('431027', '桂东县', '431000', '', '0', '0', 'G', '113.9515936018', '26.083173927327', '3', 'tr_0 tr_430000 tr_431000 ', '0');
INSERT INTO `provinces` VALUES ('431028', '安仁县', '431000', '', '0', '0', 'A', '113.27542359381', '26.715682788508', '3', 'tr_0 tr_430000 tr_431000 ', '0');
INSERT INTO `provinces` VALUES ('431081', '资兴市', '431000', '', '0', '0', 'Z', '113.24255612233', '25.981873602722', '3', 'tr_0 tr_430000 tr_431000 ', '0');
INSERT INTO `provinces` VALUES ('431102', '零陵区', '431100', '', '0', '0', 'L', '111.63750237493', '26.227682089779', '3', 'tr_0 tr_430000 tr_431100 ', '0');
INSERT INTO `provinces` VALUES ('431103', '冷水滩区', '431100', '', '0', '0', 'L', '111.59842608526', '26.467705510832', '3', 'tr_0 tr_430000 tr_431100 ', '0');
INSERT INTO `provinces` VALUES ('431121', '祁阳县', '431100', '', '0', '0', 'Q', '111.84742029288', '26.586434994948', '3', 'tr_0 tr_430000 tr_431100 ', '0');
INSERT INTO `provinces` VALUES ('431122', '东安县', '431100', '', '0', '0', 'D', '111.32354235354', '26.398288039365', '3', 'tr_0 tr_430000 tr_431100 ', '0');
INSERT INTO `provinces` VALUES ('431123', '双牌县', '431100', '', '0', '0', 'S', '111.6675938129', '25.967169239803', '3', 'tr_0 tr_430000 tr_431100 ', '0');
INSERT INTO `provinces` VALUES ('431124', '道县', '431100', '', '0', '0', 'D', '111.60740437934', '25.53252996283', '3', 'tr_0 tr_430000 tr_431100 ', '0');
INSERT INTO `provinces` VALUES ('431125', '江永县', '431100', '', '0', '0', 'J', '111.35043663236', '25.279720667918', '3', 'tr_0 tr_430000 tr_431100 ', '0');
INSERT INTO `provinces` VALUES ('431126', '宁远县', '431100', '', '0', '0', 'N', '111.95245340697', '25.57705193746', '3', 'tr_0 tr_430000 tr_431100 ', '0');
INSERT INTO `provinces` VALUES ('431127', '蓝山县', '431100', '', '0', '0', 'L', '112.20343493586', '25.37593472464', '3', 'tr_0 tr_430000 tr_431100 ', '0');
INSERT INTO `provinces` VALUES ('431128', '新田县', '431100', '', '0', '0', 'X', '112.21040920018', '25.909825802754', '3', 'tr_0 tr_430000 tr_431100 ', '0');
INSERT INTO `provinces` VALUES ('431129', '江华瑶族自治县', '431100', '', '0', '0', 'J', '111.58545203845', '25.191348924015', '3', 'tr_0 tr_430000 tr_431100 ', '0');
INSERT INTO `provinces` VALUES ('431171', '永州经济技术开发区', '431100', '', '0', '0', 'Y', '111.61945505792', '26.4258641179', '3', 'tr_0 tr_430000 tr_431100 ', '0');
INSERT INTO `provinces` VALUES ('431172', '永州市金洞管理区', '431100', '', '0', '0', 'Y', '112.09909809837', '26.297256941493', '3', 'tr_0 tr_430000 tr_431100 ', '0');
INSERT INTO `provinces` VALUES ('431173', '永州市回龙圩管理区', '431100', '', '0', '0', 'Y', '111.35307783022', '25.173038319623', '3', 'tr_0 tr_430000 tr_431100 ', '0');
INSERT INTO `provinces` VALUES ('431202', '鹤城区', '431200', '', '0', '0', 'H', '110.04639994092', '27.585225763164', '3', 'tr_0 tr_430000 tr_431200 ', '0');
INSERT INTO `provinces` VALUES ('431221', '中方县', '431200', '', '0', '0', 'Z', '109.95146189432', '27.44608117406', '3', 'tr_0 tr_430000 tr_431200 ', '0');
INSERT INTO `provinces` VALUES ('431222', '沅陵县', '431200', '', '0', '0', 'Y', '110.40043076602', '28.459018102626', '3', 'tr_0 tr_430000 tr_431200 ', '0');
INSERT INTO `provinces` VALUES ('431223', '辰溪县', '431200', '', '0', '0', 'C', '110.19048661755', '28.012605313813', '3', 'tr_0 tr_430000 tr_431200 ', '0');
INSERT INTO `provinces` VALUES ('431224', '溆浦县', '431200', '', '0', '0', 'X', '110.60155112895', '27.913963373886', '3', 'tr_0 tr_430000 tr_431200 ', '0');
INSERT INTO `provinces` VALUES ('431225', '会同县', '431200', '', '0', '0', 'H', '109.74158556792', '26.893383817274', '3', 'tr_0 tr_430000 tr_431200 ', '0');
INSERT INTO `provinces` VALUES ('431226', '麻阳苗族自治县', '431200', '', '0', '0', 'M', '109.80943628984', '27.87193016295', '3', 'tr_0 tr_430000 tr_431200 ', '0');
INSERT INTO `provinces` VALUES ('431227', '新晃侗族自治县', '431200', '', '0', '0', 'X', '109.18147151144', '27.358782968573', '3', 'tr_0 tr_430000 tr_431200 ', '0');
INSERT INTO `provinces` VALUES ('431228', '芷江侗族自治县', '431200', '', '0', '0', 'Z', '109.6914022696', '27.449513277765', '3', 'tr_0 tr_430000 tr_431200 ', '0');
INSERT INTO `provinces` VALUES ('431229', '靖州苗族侗族自治县', '431200', '', '0', '0', 'J', '109.70245160703', '26.581321351066', '3', 'tr_0 tr_430000 tr_431200 ', '0');
INSERT INTO `provinces` VALUES ('431230', '通道侗族自治县', '431200', '', '0', '0', 'T', '109.79044548256', '26.164219864712', '3', 'tr_0 tr_430000 tr_431200 ', '0');
INSERT INTO `provinces` VALUES ('431271', '怀化市洪江管理区', '431200', '', '0', '0', 'H', '109.8435098263', '27.215077093932', '3', 'tr_0 tr_430000 tr_431200 ', '0');
INSERT INTO `provinces` VALUES ('431281', '洪江市', '431200', '', '0', '0', 'H', '109.8435098263', '27.215077093932', '3', 'tr_0 tr_430000 tr_431200 ', '0');
INSERT INTO `provinces` VALUES ('431302', '娄星区', '431300', '', '0', '0', 'L', '112.00855842504', '27.735604842109', '3', 'tr_0 tr_430000 tr_431300 ', '0');
INSERT INTO `provinces` VALUES ('431321', '双峰县', '431300', '', '0', '0', 'S', '112.18146049666', '27.462982658573', '3', 'tr_0 tr_430000 tr_431300 ', '0');
INSERT INTO `provinces` VALUES ('431322', '新化县', '431300', '', '0', '0', 'X', '111.334515335', '27.732666751066', '3', 'tr_0 tr_430000 tr_431300 ', '0');
INSERT INTO `provinces` VALUES ('431381', '冷水江市', '431300', '', '0', '0', 'L', '111.44153972291', '27.692058848958', '3', 'tr_0 tr_430000 tr_431300 ', '0');
INSERT INTO `provinces` VALUES ('431382', '涟源市', '431300', '', '0', '0', 'L', '111.67056199396', '27.698167532255', '3', 'tr_0 tr_430000 tr_431300 ', '0');
INSERT INTO `provinces` VALUES ('433101', '吉首市', '433100', '', '0', '0', 'J', '109.70444880967', '28.267493127593', '3', 'tr_0 tr_430000 tr_433100 ', '0');
INSERT INTO `provinces` VALUES ('433122', '泸溪县', '433100', '', '0', '0', 'L', '110.22659921769', '28.221873097569', '3', 'tr_0 tr_430000 tr_433100 ', '0');
INSERT INTO `provinces` VALUES ('433123', '凤凰县', '433100', '', '0', '0', 'F', '109.6055266883', '27.953847809726', '3', 'tr_0 tr_430000 tr_433100 ', '0');
INSERT INTO `provinces` VALUES ('433124', '花垣县', '433100', '', '0', '0', 'H', '109.48856183128', '28.577909934397', '3', 'tr_0 tr_430000 tr_433100 ', '0');
INSERT INTO `provinces` VALUES ('433125', '保靖县', '433100', '', '0', '0', 'B', '109.66647357306', '28.705968872486', '3', 'tr_0 tr_430000 tr_433100 ', '0');
INSERT INTO `provinces` VALUES ('433126', '古丈县', '433100', '', '0', '0', 'G', '109.95750740057', '28.623083527843', '3', 'tr_0 tr_430000 tr_433100 ', '0');
INSERT INTO `provinces` VALUES ('433127', '永顺县', '433100', '', '0', '0', 'Y', '109.86358578665', '28.985774485682', '3', 'tr_0 tr_430000 tr_433100 ', '0');
INSERT INTO `provinces` VALUES ('433130', '龙山县', '433100', '', '0', '0', 'L', '109.45041573696', '29.464121765857', '3', 'tr_0 tr_430000 tr_433100 ', '0');
INSERT INTO `provinces` VALUES ('433172', '湖南吉首经济开发区', '433100', '', '0', '0', 'H', '109.70444880967', '28.267493127593', '3', 'tr_0 tr_430000 tr_433100 ', '0');
INSERT INTO `provinces` VALUES ('433173', '湖南永顺经济开发区', '433100', '', '0', '0', 'H', '109.86358578665', '28.985774485682', '3', 'tr_0 tr_430000 tr_433100 ', '0');
INSERT INTO `provinces` VALUES ('440103', '荔湾区', '440100', '', '0', '0', 'L', '113.25050226337', '23.131791134975', '3', 'tr_0 tr_440000 tr_440100 ', '0');
INSERT INTO `provinces` VALUES ('440104', '越秀区', '440100', '', '0', '0', 'Y', '113.273426481', '23.135260120148', '3', 'tr_0 tr_440000 tr_440100 ', '0');
INSERT INTO `provinces` VALUES ('440105', '海珠区', '440100', '', '0', '0', 'H', '113.32353998097', '23.088981296648', '3', 'tr_0 tr_440000 tr_440100 ', '0');
INSERT INTO `provinces` VALUES ('440106', '天河区', '440100', '', '0', '0', 'T', '113.36850942428', '23.130357835105', '3', 'tr_0 tr_440000 tr_440100 ', '0');
INSERT INTO `provinces` VALUES ('440111', '白云区', '440100', '', '0', '0', 'B', '113.27943309062', '23.164316834456', '3', 'tr_0 tr_440000 tr_440100 ', '0');
INSERT INTO `provinces` VALUES ('440112', '黄埔区', '440100', '', '0', '0', 'H', '113.48707083969', '23.187491541425', '3', 'tr_0 tr_440000 tr_440100 ', '0');
INSERT INTO `provinces` VALUES ('440113', '番禺区', '440100', '', '0', '0', 'F', '113.39046958043', '22.943830731518', '3', 'tr_0 tr_440000 tr_440100 ', '0');
INSERT INTO `provinces` VALUES ('440114', '花都区', '440100', '', '0', '0', 'H', '113.22657580629', '23.411161504876', '3', 'tr_0 tr_440000 tr_440100 ', '0');
INSERT INTO `provinces` VALUES ('440115', '南沙区', '440100', '', '0', '0', 'N', '113.53143554372', '22.807929296528', '3', 'tr_0 tr_440000 tr_440100 ', '0');
INSERT INTO `provinces` VALUES ('440117', '从化区', '440100', '', '0', '0', 'C', '113.59358543922', '23.553985922578', '3', 'tr_0 tr_440000 tr_440100 ', '0');
INSERT INTO `provinces` VALUES ('440118', '增城区', '440100', '', '0', '0', 'Z', '113.8175456689', '23.266592400631', '3', 'tr_0 tr_440000 tr_440100 ', '0');
INSERT INTO `provinces` VALUES ('440203', '武江区', '440200', '', '0', '0', 'W', '113.59455578884', '24.798486030733', '3', 'tr_0 tr_440000 tr_440200 ', '0');
INSERT INTO `provinces` VALUES ('440204', '浈江区', '440200', '', '0', '0', 'Z', '113.61747740137', '24.810413749784', '3', 'tr_0 tr_440000 tr_440200 ', '0');
INSERT INTO `provinces` VALUES ('440205', '曲江区', '440200', '', '0', '0', 'Q', '113.61150106465', '24.68840784638', '3', 'tr_0 tr_440000 tr_440200 ', '0');
INSERT INTO `provinces` VALUES ('440222', '始兴县', '440200', '', '0', '0', 'S', '114.06856735205', '24.958558154346', '3', 'tr_0 tr_440000 tr_440200 ', '0');
INSERT INTO `provinces` VALUES ('440224', '仁化县', '440200', '', '0', '0', 'R', '113.75544293443', '25.092287524428', '3', 'tr_0 tr_440000 tr_440200 ', '0');
INSERT INTO `provinces` VALUES ('440229', '翁源县', '440200', '', '0', '0', 'W', '114.13642723669', '24.356594490867', '3', 'tr_0 tr_440000 tr_440200 ', '0');
INSERT INTO `provinces` VALUES ('440232', '乳源瑶族自治县', '440200', '', '0', '0', 'R', '113.28243136492', '24.782333322942', '3', 'tr_0 tr_440000 tr_440200 ', '0');
INSERT INTO `provinces` VALUES ('440233', '新丰县', '440200', '', '0', '0', 'X', '114.21351173078', '24.065546505164', '3', 'tr_0 tr_440000 tr_440200 ', '0');
INSERT INTO `provinces` VALUES ('440281', '乐昌市', '440200', '', '0', '0', 'L', '113.3545786821', '25.135591561195', '3', 'tr_0 tr_440000 tr_440200 ', '0');
INSERT INTO `provinces` VALUES ('440282', '南雄市', '440200', '', '0', '0', 'N', '114.31857889065', '25.123526537362', '3', 'tr_0 tr_440000 tr_440200 ', '0');
INSERT INTO `provinces` VALUES ('440303', '罗湖区', '440300', '', '0', '0', 'L', '114.13743190157', '22.554484875856', '3', 'tr_0 tr_440000 tr_440300 ', '0');
INSERT INTO `provinces` VALUES ('440304', '福田区', '440300', '', '0', '0', 'F', '114.06154700466', '22.528465912072', '3', 'tr_0 tr_440000 tr_440300 ', '0');
INSERT INTO `provinces` VALUES ('440305', '南山区', '440300', '', '0', '0', 'N', '113.93653916925', '22.538500195784', '3', 'tr_0 tr_440000 tr_440300 ', '0');
INSERT INTO `provinces` VALUES ('440306', '宝安区', '440300', '', '0', '0', 'B', '113.89042744066', '22.560032908925', '3', 'tr_0 tr_440000 tr_440300 ', '0');
INSERT INTO `provinces` VALUES ('440307', '龙岗区', '440300', '', '0', '0', 'L', '114.25445487896', '22.726016550781', '3', 'tr_0 tr_440000 tr_440300 ', '0');
INSERT INTO `provinces` VALUES ('440308', '盐田区', '440300', '', '0', '0', 'Y', '114.2434301551', '22.563437914836', '3', 'tr_0 tr_440000 tr_440300 ', '0');
INSERT INTO `provinces` VALUES ('440309', '龙华区', '440300', '', '0', '0', 'L', '114.04852876121', '22.757596649222', '3', 'tr_0 tr_440000 tr_440300 ', '0');
INSERT INTO `provinces` VALUES ('440310', '坪山区', '440300', '', '0', '0', 'P', '114.35047403625', '22.716233464749', '3', 'tr_0 tr_440000 tr_440300 ', '0');
INSERT INTO `provinces` VALUES ('440311', '光明区', '440300', '', '0', '0', 'G', '113.94256006193', '22.754465883635', '3', 'tr_0 tr_440000 tr_440300 ', '0');
INSERT INTO `provinces` VALUES ('440402', '香洲区', '440400', '', '0', '0', 'X', '113.55047243408', '22.273003861799', '3', 'tr_0 tr_440000 tr_440400 ', '0');
INSERT INTO `provinces` VALUES ('440403', '斗门区', '440400', '', '0', '0', 'D', '113.30346725453', '22.215515662229', '3', 'tr_0 tr_440000 tr_440400 ', '0');
INSERT INTO `provinces` VALUES ('440404', '金湾区', '440400', '', '0', '0', 'J', '113.36951705357', '22.152576780675', '3', 'tr_0 tr_440000 tr_440400 ', '0');
INSERT INTO `provinces` VALUES ('440507', '龙湖区', '440500', '', '0', '0', 'L', '116.72352464693', '23.377775780628', '3', 'tr_0 tr_440000 tr_440500 ', '0');
INSERT INTO `provinces` VALUES ('440511', '金平区', '440500', '', '0', '0', 'J', '116.70955006744', '23.371750385773', '3', 'tr_0 tr_440000 tr_440500 ', '0');
INSERT INTO `provinces` VALUES ('440512', '濠江区', '440500', '', '0', '0', 'H', '116.73351658895', '23.291546359757', '3', 'tr_0 tr_440000 tr_440500 ', '0');
INSERT INTO `provinces` VALUES ('440513', '潮阳区', '440500', '', '0', '0', 'C', '116.6085145027', '23.270854956943', '3', 'tr_0 tr_440000 tr_440500 ', '0');
INSERT INTO `provinces` VALUES ('440514', '潮南区', '440500', '', '0', '0', 'C', '116.43949131427', '23.256341432673', '3', 'tr_0 tr_440000 tr_440500 ', '0');
INSERT INTO `provinces` VALUES ('440515', '澄海区', '440500', '', '0', '0', 'C', '116.76242504839', '23.472341401523', '3', 'tr_0 tr_440000 tr_440500 ', '0');
INSERT INTO `provinces` VALUES ('440523', '南澳县', '440500', '', '0', '0', 'N', '117.03049603113', '23.427812045946', '3', 'tr_0 tr_440000 tr_440500 ', '0');
INSERT INTO `provinces` VALUES ('440604', '禅城区', '440600', '', '0', '0', 'C', '113.12950518241', '23.015374368816', '3', 'tr_0 tr_440000 tr_440600 ', '0');
INSERT INTO `provinces` VALUES ('440605', '南海区', '440600', '', '0', '0', 'N', '113.14944567828', '23.035011446003', '3', 'tr_0 tr_440000 tr_440600 ', '0');
INSERT INTO `provinces` VALUES ('440606', '顺德区', '440600', '', '0', '0', 'S', '113.30045343954', '22.810453426795', '3', 'tr_0 tr_440000 tr_440600 ', '0');
INSERT INTO `provinces` VALUES ('440607', '三水区', '440600', '', '0', '0', 'S', '112.90347085515', '23.161920493984', '3', 'tr_0 tr_440000 tr_440600 ', '0');
INSERT INTO `provinces` VALUES ('440608', '高明区', '440600', '', '0', '0', 'G', '112.89947240749', '22.90634960163', '3', 'tr_0 tr_440000 tr_440600 ', '0');
INSERT INTO `provinces` VALUES ('440703', '蓬江区', '440700', '', '0', '0', 'P', '113.08454642894', '22.601065786023', '3', 'tr_0 tr_440000 tr_440700 ', '0');
INSERT INTO `provinces` VALUES ('440704', '江海区', '440700', '', '0', '0', 'J', '113.11755718015', '22.566115451824', '3', 'tr_0 tr_440000 tr_440700 ', '0');
INSERT INTO `provinces` VALUES ('440705', '新会区', '440700', '', '0', '0', 'X', '113.03845482239', '22.46511306052', '3', 'tr_0 tr_440000 tr_440700 ', '0');
INSERT INTO `provinces` VALUES ('440781', '台山市', '440700', '', '0', '0', 'T', '112.80044482505', '22.257923470251', '3', 'tr_0 tr_440000 tr_440700 ', '0');
INSERT INTO `provinces` VALUES ('440783', '开平市', '440700', '', '0', '0', 'K', '112.70446429491', '22.382499490201', '3', 'tr_0 tr_440000 tr_440700 ', '0');
INSERT INTO `provinces` VALUES ('440784', '鹤山市', '440700', '', '0', '0', 'H', '112.97052666653', '22.771169431377', '3', 'tr_0 tr_440000 tr_440700 ', '0');
INSERT INTO `provinces` VALUES ('440785', '恩平市', '440700', '', '0', '0', 'E', '112.31143757848', '22.189035201534', '3', 'tr_0 tr_440000 tr_440700 ', '0');
INSERT INTO `provinces` VALUES ('440802', '赤坎区', '440800', '', '0', '0', 'C', '110.37253254096', '21.272134812703', '3', 'tr_0 tr_440000 tr_440800 ', '0');
INSERT INTO `provinces` VALUES ('440803', '霞山区', '440800', '', '0', '0', 'X', '110.40442535096', '21.198227185303', '3', 'tr_0 tr_440000 tr_440800 ', '0');
INSERT INTO `provinces` VALUES ('440804', '坡头区', '440800', '', '0', '0', 'P', '110.46256709711', '21.250376738599', '3', 'tr_0 tr_440000 tr_440800 ', '0');
INSERT INTO `provinces` VALUES ('440811', '麻章区', '440800', '', '0', '0', 'M', '110.34057918516', '21.269188766567', '3', 'tr_0 tr_440000 tr_440800 ', '0');
INSERT INTO `provinces` VALUES ('440823', '遂溪县', '440800', '', '0', '0', 'S', '110.25651530642', '21.383102962029', '3', 'tr_0 tr_440000 tr_440800 ', '0');
INSERT INTO `provinces` VALUES ('440825', '徐闻县', '440800', '', '0', '0', 'X', '110.18247274427', '20.331723686702', '3', 'tr_0 tr_440000 tr_440800 ', '0');
INSERT INTO `provinces` VALUES ('440881', '廉江市', '440800', '', '0', '0', 'L', '110.29244770646', '21.615816495305', '3', 'tr_0 tr_440000 tr_440800 ', '0');
INSERT INTO `provinces` VALUES ('440882', '雷州市', '440800', '', '0', '0', 'L', '110.10258050648', '20.919880592716', '3', 'tr_0 tr_440000 tr_440800 ', '0');
INSERT INTO `provinces` VALUES ('440883', '吴川市', '440800', '', '0', '0', 'W', '110.78645034015', '21.447262768557', '3', 'tr_0 tr_440000 tr_440800 ', '0');
INSERT INTO `provinces` VALUES ('440902', '茂南区', '440900', '', '0', '0', 'M', '110.92554576188', '21.647152082304', '3', 'tr_0 tr_440000 tr_440900 ', '0');
INSERT INTO `provinces` VALUES ('440904', '电白区', '440900', '', '0', '0', 'D', '111.02047123221', '21.520351188198', '3', 'tr_0 tr_440000 tr_440900 ', '0');
INSERT INTO `provinces` VALUES ('440981', '高州市', '440900', '', '0', '0', 'G', '110.85947386452', '21.924048896771', '3', 'tr_0 tr_440000 tr_440900 ', '0');
INSERT INTO `provinces` VALUES ('440982', '化州市', '440900', '', '0', '0', 'H', '110.6464310112', '21.67023109387', '3', 'tr_0 tr_440000 tr_440900 ', '0');
INSERT INTO `provinces` VALUES ('440983', '信宜市', '440900', '', '0', '0', 'X', '110.95358169717', '22.36009314173', '3', 'tr_0 tr_440000 tr_440900 ', '0');
INSERT INTO `provinces` VALUES ('441202', '端州区', '441200', '', '0', '0', 'D', '112.49156022979', '23.057563726176', '3', 'tr_0 tr_440000 tr_441200 ', '0');
INSERT INTO `provinces` VALUES ('441203', '鼎湖区', '441200', '', '0', '0', 'D', '112.57443448255', '23.164308112716', '3', 'tr_0 tr_440000 tr_441200 ', '0');
INSERT INTO `provinces` VALUES ('441204', '高要区', '441200', '', '0', '0', 'G', '112.46444604577', '23.031895546866', '3', 'tr_0 tr_440000 tr_441200 ', '0');
INSERT INTO `provinces` VALUES ('441223', '广宁县', '441200', '', '0', '0', 'G', '112.44742387501', '23.641035726333', '3', 'tr_0 tr_440000 tr_441200 ', '0');
INSERT INTO `provinces` VALUES ('441224', '怀集县', '441200', '', '0', '0', 'H', '112.19146878783', '23.917842129185', '3', 'tr_0 tr_440000 tr_441200 ', '0');
INSERT INTO `provinces` VALUES ('441225', '封开县', '441200', '', '0', '0', 'F', '111.51852585255', '23.429768921261', '3', 'tr_0 tr_440000 tr_441200 ', '0');
INSERT INTO `provinces` VALUES ('441226', '德庆县', '441200', '', '0', '0', 'D', '111.79155377493', '23.15137330611', '3', 'tr_0 tr_440000 tr_441200 ', '0');
INSERT INTO `provinces` VALUES ('441284', '四会市', '441200', '', '0', '0', 'S', '112.7405791408', '23.332381005175', '3', 'tr_0 tr_440000 tr_441200 ', '0');
INSERT INTO `provinces` VALUES ('441302', '惠城区', '441300', '', '0', '0', 'H', '114.38949004962', '23.089725972544', '3', 'tr_0 tr_440000 tr_441300 ', '0');
INSERT INTO `provinces` VALUES ('441303', '惠阳区', '441300', '', '0', '0', 'H', '114.46346443037', '22.794720878571', '3', 'tr_0 tr_440000 tr_441300 ', '0');
INSERT INTO `provinces` VALUES ('441322', '博罗县', '441300', '', '0', '0', 'B', '114.29657265143', '23.178805592433', '3', 'tr_0 tr_440000 tr_441300 ', '0');
INSERT INTO `provinces` VALUES ('441323', '惠东县', '441300', '', '0', '0', 'H', '114.72642585138', '22.991443112002', '3', 'tr_0 tr_440000 tr_441300 ', '0');
INSERT INTO `provinces` VALUES ('441324', '龙门县', '441300', '', '0', '0', 'L', '114.26143022124', '23.733838340062', '3', 'tr_0 tr_440000 tr_441300 ', '0');
INSERT INTO `provinces` VALUES ('441402', '梅江区', '441400', '', '0', '0', 'M', '116.12353597667', '24.315878769038', '3', 'tr_0 tr_440000 tr_441400 ', '0');
INSERT INTO `provinces` VALUES ('441403', '梅县区', '441400', '', '0', '0', 'M', '116.08856170928', '24.270999314695', '3', 'tr_0 tr_440000 tr_441400 ', '0');
INSERT INTO `provinces` VALUES ('441422', '大埔县', '441400', '', '0', '0', 'D', '116.70155892129', '24.353459468582', '3', 'tr_0 tr_440000 tr_441400 ', '0');
INSERT INTO `provinces` VALUES ('441423', '丰顺县', '441400', '', '0', '0', 'F', '116.18845382094', '23.745738303255', '3', 'tr_0 tr_440000 tr_441400 ', '0');
INSERT INTO `provinces` VALUES ('441424', '五华县', '441400', '', '0', '0', 'W', '115.78248548653', '23.938408899571', '3', 'tr_0 tr_440000 tr_441400 ', '0');
INSERT INTO `provinces` VALUES ('441426', '平远县', '441400', '', '0', '0', 'P', '115.89747694601', '24.572414126137', '3', 'tr_0 tr_440000 tr_441400 ', '0');
INSERT INTO `provinces` VALUES ('441427', '蕉岭县', '441400', '', '0', '0', 'J', '116.17743924793', '24.664992548662', '3', 'tr_0 tr_440000 tr_441400 ', '0');
INSERT INTO `provinces` VALUES ('441481', '兴宁市', '441400', '', '0', '0', 'X', '115.73757946359', '24.142293779322', '3', 'tr_0 tr_440000 tr_441400 ', '0');
INSERT INTO `provinces` VALUES ('441502', '城区', '441500', '', '0', '0', 'C', '115.37153074806', '22.784551839489', '3', 'tr_0 tr_440000 tr_441500 ', '0');
INSERT INTO `provinces` VALUES ('441521', '海丰县', '441500', '', '0', '0', 'H', '115.32944477561', '22.972744260966', '3', 'tr_0 tr_440000 tr_441500 ', '0');
INSERT INTO `provinces` VALUES ('441523', '陆河县', '441500', '', '0', '0', 'L', '115.66648271471', '23.30767707649', '3', 'tr_0 tr_440000 tr_441500 ', '0');
INSERT INTO `provinces` VALUES ('441581', '陆丰市', '441500', '', '0', '0', 'L', '115.78802975191', '22.967876723873', '3', 'tr_0 tr_440000 tr_441500 ', '0');
INSERT INTO `provinces` VALUES ('441602', '源城区', '441600', '', '0', '0', 'Y', '114.70843899033', '23.740298338347', '3', 'tr_0 tr_440000 tr_441600 ', '0');
INSERT INTO `provinces` VALUES ('441621', '紫金县', '441600', '', '0', '0', 'Z', '115.19044771834', '23.641430253189', '3', 'tr_0 tr_440000 tr_441600 ', '0');
INSERT INTO `provinces` VALUES ('441622', '龙川县', '441600', '', '0', '0', 'L', '115.26655548485', '24.105850721955', '3', 'tr_0 tr_440000 tr_441600 ', '0');
INSERT INTO `provinces` VALUES ('441623', '连平县', '441600', '', '0', '0', 'L', '114.49544419635', '24.375808067414', '3', 'tr_0 tr_440000 tr_441600 ', '0');
INSERT INTO `provinces` VALUES ('441624', '和平县', '441600', '', '0', '0', 'H', '114.9454488143', '24.448252767689', '3', 'tr_0 tr_440000 tr_441600 ', '0');
INSERT INTO `provinces` VALUES ('441625', '东源县', '441600', '', '0', '0', 'D', '114.7535083252', '23.794257873114', '3', 'tr_0 tr_440000 tr_441600 ', '0');
INSERT INTO `provinces` VALUES ('441702', '江城区', '441700', '', '0', '0', 'J', '111.96145451801', '21.868127886755', '3', 'tr_0 tr_440000 tr_441700 ', '0');
INSERT INTO `provinces` VALUES ('441704', '阳东区', '441700', '', '0', '0', 'Y', '112.01857947215', '21.873996844319', '3', 'tr_0 tr_440000 tr_441700 ', '0');
INSERT INTO `provinces` VALUES ('441721', '阳西县', '441700', '', '0', '0', 'Y', '111.62448107725', '21.758700627505', '3', 'tr_0 tr_440000 tr_441700 ', '0');
INSERT INTO `provinces` VALUES ('441781', '阳春市', '441700', '', '0', '0', 'Y', '111.7975361303', '22.17601480732', '3', 'tr_0 tr_440000 tr_441700 ', '0');
INSERT INTO `provinces` VALUES ('441802', '清城区', '441800', '', '0', '0', 'Q', '113.06947663537', '23.704022037925', '3', 'tr_0 tr_440000 tr_441800 ', '0');
INSERT INTO `provinces` VALUES ('441803', '清新区', '441800', '', '0', '0', 'Q', '112.99155779512', '23.754270337093', '3', 'tr_0 tr_440000 tr_441800 ', '0');
INSERT INTO `provinces` VALUES ('441821', '佛冈县', '441800', '', '0', '0', 'F', '113.53844124873', '23.885475421111', '3', 'tr_0 tr_440000 tr_441800 ', '0');
INSERT INTO `provinces` VALUES ('441823', '阳山县', '441800', '', '0', '0', 'Y', '112.64751954085', '24.47094363588', '3', 'tr_0 tr_440000 tr_441800 ', '0');
INSERT INTO `provinces` VALUES ('441825', '连山壮族瑶族自治县', '441800', '', '0', '0', 'L', '112.10042570409', '24.576845604093', '3', 'tr_0 tr_440000 tr_441800 ', '0');
INSERT INTO `provinces` VALUES ('441826', '连南瑶族自治县', '441800', '', '0', '0', 'L', '112.29351728187', '24.73154858148', '3', 'tr_0 tr_440000 tr_441800 ', '0');
INSERT INTO `provinces` VALUES ('441881', '英德市', '441800', '', '0', '0', 'Y', '113.42144297474', '24.191939355217', '3', 'tr_0 tr_440000 tr_441800 ', '0');
INSERT INTO `provinces` VALUES ('441882', '连州市', '441800', '', '0', '0', 'L', '112.38357258887', '24.786466855047', '3', 'tr_0 tr_440000 tr_441800 ', '0');
INSERT INTO `provinces` VALUES ('441900003', '东城街道办事处', '441900', '', '0', '0', 'D', '113.78961542643', '23.033927867022', '3', 'tr_0 tr_440000 tr_441900 ', '0');
INSERT INTO `provinces` VALUES ('441900004', '南城街道办事处', '441900', '', '0', '0', 'N', '113.74972154669', '23.02491560037', '3', 'tr_0 tr_440000 tr_441900 ', '0');
INSERT INTO `provinces` VALUES ('441900005', '万江街道办事处', '441900', '', '0', '0', 'W', '113.70128466119', '23.044382337638', '3', 'tr_0 tr_440000 tr_441900 ', '0');
INSERT INTO `provinces` VALUES ('441900006', '莞城街道办事处', '441900', '', '0', '0', 'G', '113.7555643548', '23.04532373021', '3', 'tr_0 tr_440000 tr_441900 ', '0');
INSERT INTO `provinces` VALUES ('441900101', '石碣镇', '441900', '', '0', '0', 'S', '113.81395530616', '23.105172244651', '3', 'tr_0 tr_440000 tr_441900 ', '0');
INSERT INTO `provinces` VALUES ('441900102', '石龙镇', '441900', '', '0', '0', 'S', '113.84749077289', '23.115219876975', '3', 'tr_0 tr_440000 tr_441900 ', '0');
INSERT INTO `provinces` VALUES ('441900103', '茶山镇', '441900', '', '0', '0', 'C', '113.89350241139', '23.069002516534', '3', 'tr_0 tr_440000 tr_441900 ', '0');
INSERT INTO `provinces` VALUES ('441900104', '石排镇', '441900', '', '0', '0', 'S', '113.96394649371', '23.088334509001', '3', 'tr_0 tr_440000 tr_441900 ', '0');
INSERT INTO `provinces` VALUES ('441900105', '企石镇', '441900', '', '0', '0', 'Q', '114.04851828338', '23.070690716193', '3', 'tr_0 tr_440000 tr_441900 ', '0');
INSERT INTO `provinces` VALUES ('441900106', '横沥镇', '441900', '', '0', '0', 'H', '113.98801324096', '23.030051448767', '3', 'tr_0 tr_440000 tr_441900 ', '0');
INSERT INTO `provinces` VALUES ('441900107', '桥头镇', '441900', '', '0', '0', 'Q', '114.10677408198', '23.020458678747', '3', 'tr_0 tr_440000 tr_441900 ', '0');
INSERT INTO `provinces` VALUES ('441900108', '谢岗镇', '441900', '', '0', '0', 'X', '114.19511437465', '22.946513843008', '3', 'tr_0 tr_440000 tr_441900 ', '0');
INSERT INTO `provinces` VALUES ('441900109', '东坑镇', '441900', '', '0', '0', 'D', '113.95246820282', '23.002958656049', '3', 'tr_0 tr_440000 tr_441900 ', '0');
INSERT INTO `provinces` VALUES ('441900110', '常平镇', '441900', '', '0', '0', 'C', '114.02458867145', '22.979369177741', '3', 'tr_0 tr_440000 tr_441900 ', '0');
INSERT INTO `provinces` VALUES ('441900111', '寮步镇', '441900', '', '0', '0', 'L', '113.88349112257', '22.996428153649', '3', 'tr_0 tr_440000 tr_441900 ', '0');
INSERT INTO `provinces` VALUES ('441900112', '樟木头镇', '441900', '', '0', '0', 'Z', '114.11559876672', '22.912795269745', '3', 'tr_0 tr_440000 tr_441900 ', '0');
INSERT INTO `provinces` VALUES ('441900113', '大朗镇', '441900', '', '0', '0', 'D', '113.94820653279', '22.912348752542', '3', 'tr_0 tr_440000 tr_441900 ', '0');
INSERT INTO `provinces` VALUES ('441900114', '黄江镇', '441900', '', '0', '0', 'H', '114.00621531625', '22.872431801821', '3', 'tr_0 tr_440000 tr_441900 ', '0');
INSERT INTO `provinces` VALUES ('441900115', '清溪镇', '441900', '', '0', '0', 'Q', '114.18744982903', '22.841601621999', '3', 'tr_0 tr_440000 tr_441900 ', '0');
INSERT INTO `provinces` VALUES ('441900116', '塘厦镇', '441900', '', '0', '0', 'T', '114.08442795001', '22.811576132112', '3', 'tr_0 tr_440000 tr_441900 ', '0');
INSERT INTO `provinces` VALUES ('441900117', '凤岗镇', '441900', '', '0', '0', 'F', '114.17560299034', '22.722315801247', '3', 'tr_0 tr_440000 tr_441900 ', '0');
INSERT INTO `provinces` VALUES ('441900118', '大岭山镇', '441900', '', '0', '0', 'D', '113.83293372133', '22.903546239236', '3', 'tr_0 tr_440000 tr_441900 ', '0');
INSERT INTO `provinces` VALUES ('441900119', '长安镇', '441900', '', '0', '0', 'Z', '113.76998309965', '22.795308241444', '3', 'tr_0 tr_440000 tr_441900 ', '0');
INSERT INTO `provinces` VALUES ('441900121', '虎门镇', '441900', '', '0', '0', 'H', '113.68188667267', '22.818449805406', '3', 'tr_0 tr_440000 tr_441900 ', '0');
INSERT INTO `provinces` VALUES ('441900122', '厚街镇', '441900', '', '0', '0', 'H', '113.7081456375', '22.923357615893', '3', 'tr_0 tr_440000 tr_441900 ', '0');
INSERT INTO `provinces` VALUES ('441900123', '沙田镇', '441900', '', '0', '0', 'S', '113.60821459687', '22.907479676518', '3', 'tr_0 tr_440000 tr_441900 ', '0');
INSERT INTO `provinces` VALUES ('441900124', '道滘镇', '441900', '', '0', '0', 'D', '113.66267069882', '22.982801242639', '3', 'tr_0 tr_440000 tr_441900 ', '0');
INSERT INTO `provinces` VALUES ('441900125', '洪梅镇', '441900', '', '0', '0', 'H', '113.6125183112', '22.978946913376', '3', 'tr_0 tr_440000 tr_441900 ', '0');
INSERT INTO `provinces` VALUES ('441900126', '麻涌镇', '441900', '', '0', '0', 'M', '113.58837988097', '23.057083015858', '3', 'tr_0 tr_440000 tr_441900 ', '0');
INSERT INTO `provinces` VALUES ('441900127', '望牛墩镇', '441900', '', '0', '0', 'W', '113.64023583492', '23.047597838769', '3', 'tr_0 tr_440000 tr_441900 ', '0');
INSERT INTO `provinces` VALUES ('441900128', '中堂镇', '441900', '', '0', '0', 'Z', '113.65890566238', '23.096485679975', '3', 'tr_0 tr_440000 tr_441900 ', '0');
INSERT INTO `provinces` VALUES ('441900129', '高埗镇', '441900', '', '0', '0', 'G', '113.74213386638', '23.100270479205', '3', 'tr_0 tr_440000 tr_441900 ', '0');
INSERT INTO `provinces` VALUES ('441900401', '松山湖管委会', '441900', '', '0', '0', 'S', '113.90386183402', '22.928504587758', '3', 'tr_0 tr_440000 tr_441900 ', '0');
INSERT INTO `provinces` VALUES ('441900402', '东莞港', '441900', '', '0', '0', 'D', '113.75842045788', '23.027308411643', '3', 'tr_0 tr_440000 tr_441900 ', '0');
INSERT INTO `provinces` VALUES ('441900403', '东莞生态园', '441900', '', '0', '0', 'D', '113.93331900631', '23.069150651008', '3', 'tr_0 tr_440000 tr_441900 ', '0');
INSERT INTO `provinces` VALUES ('442000001', '石岐区街道办事处', '442000', '', '0', '0', 'S', '113.39476330111', '22.543405990677', '3', 'tr_0 tr_440000 tr_442000 ', '0');
INSERT INTO `provinces` VALUES ('442000002', '东区街道办事处', '442000', '', '0', '0', 'D', '113.39942236263', '22.522314670791', '3', 'tr_0 tr_440000 tr_442000 ', '0');
INSERT INTO `provinces` VALUES ('442000003', '火炬开发区街道办事处', '442000', '', '0', '0', 'H', '113.47638423802', '22.54191612433', '3', 'tr_0 tr_440000 tr_442000 ', '0');
INSERT INTO `provinces` VALUES ('442000004', '西区街道办事处', '442000', '', '0', '0', 'X', '113.34742851429', '22.557446683319', '3', 'tr_0 tr_440000 tr_442000 ', '0');
INSERT INTO `provinces` VALUES ('442000005', '南区街道办事处', '442000', '', '0', '0', 'N', '113.34166389111', '22.474593624741', '3', 'tr_0 tr_440000 tr_442000 ', '0');
INSERT INTO `provinces` VALUES ('442000006', '五桂山街道办事处', '442000', '', '0', '0', 'W', '113.40930659782', '22.451434375841', '3', 'tr_0 tr_440000 tr_442000 ', '0');
INSERT INTO `provinces` VALUES ('442000100', '小榄镇', '442000', '', '0', '0', 'X', '113.25710033351', '22.668653898989', '3', 'tr_0 tr_440000 tr_442000 ', '0');
INSERT INTO `provinces` VALUES ('442000101', '黄圃镇', '442000', '', '0', '0', 'H', '113.38940119784', '22.732151367196', '3', 'tr_0 tr_440000 tr_442000 ', '0');
INSERT INTO `provinces` VALUES ('442000102', '民众镇', '442000', '', '0', '0', 'M', '113.50030740281', '22.624234006676', '3', 'tr_0 tr_440000 tr_442000 ', '0');
INSERT INTO `provinces` VALUES ('442000103', '东凤镇', '442000', '', '0', '0', 'D', '113.26337563889', '22.696772350456', '3', 'tr_0 tr_440000 tr_442000 ', '0');
INSERT INTO `provinces` VALUES ('442000104', '东升镇', '442000', '', '0', '0', 'D', '113.31347763067', '22.605137527398', '3', 'tr_0 tr_440000 tr_442000 ', '0');
INSERT INTO `provinces` VALUES ('442000105', '古镇镇', '442000', '', '0', '0', 'G', '113.18899941194', '22.636034421686', '3', 'tr_0 tr_440000 tr_442000 ', '0');
INSERT INTO `provinces` VALUES ('442000106', '沙溪镇', '442000', '', '0', '0', 'S', '113.35710852331', '22.513668030794', '3', 'tr_0 tr_440000 tr_442000 ', '0');
INSERT INTO `provinces` VALUES ('442000107', '坦洲镇', '442000', '', '0', '0', 'T', '113.46831862593', '22.283731940242', '3', 'tr_0 tr_440000 tr_442000 ', '0');
INSERT INTO `provinces` VALUES ('442000108', '港口镇', '442000', '', '0', '0', 'G', '113.38354521878', '22.577121999043', '3', 'tr_0 tr_440000 tr_442000 ', '0');
INSERT INTO `provinces` VALUES ('442000109', '三角镇', '442000', '', '0', '0', 'S', '113.42740190231', '22.685663488493', '3', 'tr_0 tr_440000 tr_442000 ', '0');
INSERT INTO `provinces` VALUES ('442000110', '横栏镇', '442000', '', '0', '0', 'H', '113.24834255727', '22.574461443704', '3', 'tr_0 tr_440000 tr_442000 ', '0');
INSERT INTO `provinces` VALUES ('442000111', '南头镇', '442000', '', '0', '0', 'N', '113.29481042537', '22.721261074602', '3', 'tr_0 tr_440000 tr_442000 ', '0');
INSERT INTO `provinces` VALUES ('442000112', '阜沙镇', '442000', '', '0', '0', 'F', '113.34269477842', '22.666128002352', '3', 'tr_0 tr_440000 tr_442000 ', '0');
INSERT INTO `provinces` VALUES ('442000113', '南朗镇', '442000', '', '0', '0', 'N', '113.56057493505', '22.519486447352', '3', 'tr_0 tr_440000 tr_442000 ', '0');
INSERT INTO `provinces` VALUES ('442000114', '三乡镇', '442000', '', '0', '0', 'S', '113.42695556574', '22.371470122528', '3', 'tr_0 tr_440000 tr_442000 ', '0');
INSERT INTO `provinces` VALUES ('442000115', '板芙镇', '442000', '', '0', '0', 'B', '113.33339573359', '22.395149046719', '3', 'tr_0 tr_440000 tr_442000 ', '0');
INSERT INTO `provinces` VALUES ('442000116', '大涌镇', '442000', '', '0', '0', 'D', '113.29404791311', '22.483908949365', '3', 'tr_0 tr_440000 tr_442000 ', '0');
INSERT INTO `provinces` VALUES ('442000117', '神湾镇', '442000', '', '0', '0', 'S', '113.35331518036', '22.32576323421', '3', 'tr_0 tr_440000 tr_442000 ', '0');
INSERT INTO `provinces` VALUES ('445102', '湘桥区', '445100', '', '0', '0', 'X', '116.63446160819', '23.680686981566', '3', 'tr_0 tr_440000 tr_445100 ', '0');
INSERT INTO `provinces` VALUES ('445103', '潮安区', '445100', '', '0', '0', 'C', '116.68452606069', '23.468357129831', '3', 'tr_0 tr_440000 tr_445100 ', '0');
INSERT INTO `provinces` VALUES ('445122', '饶平县', '445100', '', '0', '0', 'R', '117.01044917588', '23.670347111195', '3', 'tr_0 tr_440000 tr_445100 ', '0');
INSERT INTO `provinces` VALUES ('445202', '榕城区', '445200', '', '0', '0', 'R', '116.37351589492', '23.530746417966', '3', 'tr_0 tr_440000 tr_445200 ', '0');
INSERT INTO `provinces` VALUES ('445203', '揭东区', '445200', '', '0', '0', 'J', '116.41845578398', '23.572485187047', '3', 'tr_0 tr_440000 tr_445200 ', '0');
INSERT INTO `provinces` VALUES ('445222', '揭西县', '445200', '', '0', '0', 'J', '115.84856088728', '23.437299708209', '3', 'tr_0 tr_440000 tr_445200 ', '0');
INSERT INTO `provinces` VALUES ('445224', '惠来县', '445200', '', '0', '0', 'H', '116.30144448456', '23.039645374525', '3', 'tr_0 tr_440000 tr_445200 ', '0');
INSERT INTO `provinces` VALUES ('445281', '普宁市', '445200', '', '0', '0', 'P', '116.17244898117', '23.30363452186', '3', 'tr_0 tr_440000 tr_445200 ', '0');
INSERT INTO `provinces` VALUES ('430102', '芙蓉区', '430100', '', '0', '0', 'F', '113.03940774487', '28.191913247305', '3', 'tr_0 tr_430000 tr_430100 ', '0');
INSERT INTO `provinces` VALUES ('430103', '天心区', '430100', '', '0', '0', 'T', '112.99659225852', '28.118211217441', '3', 'tr_0 tr_430000 tr_430100 ', '0');
INSERT INTO `provinces` VALUES ('430104', '岳麓区', '430100', '', '0', '0', 'Y', '112.9374476441', '28.241488836473', '3', 'tr_0 tr_430000 tr_430100 ', '0');
INSERT INTO `provinces` VALUES ('430105', '开福区', '430100', '', '0', '0', 'K', '112.99258491764', '28.261378687684', '3', 'tr_0 tr_430000 tr_430100 ', '0');
INSERT INTO `provinces` VALUES ('430111', '雨花区', '430100', '', '0', '0', 'Y', '113.04242155986', '28.142232711654', '3', 'tr_0 tr_430000 tr_430100 ', '0');
INSERT INTO `provinces` VALUES ('430112', '望城区', '430100', '', '0', '0', 'W', '112.8244661432', '28.367403020376', '3', 'tr_0 tr_430000 tr_430100 ', '0');
INSERT INTO `provinces` VALUES ('430121', '长沙县', '430100', '', '0', '0', 'Z', '113.08755916596', '28.251818487944', '3', 'tr_0 tr_430000 tr_430100 ', '0');
INSERT INTO `provinces` VALUES ('430181', '浏阳市', '430100', '', '0', '0', 'L', '113.64939823851', '28.169832216071', '3', 'tr_0 tr_430000 tr_430100 ', '0');
INSERT INTO `provinces` VALUES ('430182', '宁乡市', '430100', '', '0', '0', 'N', '112.55840691564', '28.284104536209', '3', 'tr_0 tr_430000 tr_430100 ', '0');
INSERT INTO `provinces` VALUES ('445302', '云城区', '445300', '', '0', '0', 'Y', '112.05052923472', '22.933897802971', '3', 'tr_0 tr_440000 tr_445300 ', '0');
INSERT INTO `provinces` VALUES ('445303', '云安区', '445300', '', '0', '0', 'Y', '112.00956308992', '23.076892611911', '3', 'tr_0 tr_440000 tr_445300 ', '0');
INSERT INTO `provinces` VALUES ('445321', '新兴县', '445300', '', '0', '0', 'X', '112.23149683219', '22.701890082606', '3', 'tr_0 tr_440000 tr_445300 ', '0');
INSERT INTO `provinces` VALUES ('445322', '郁南县', '445300', '', '0', '0', 'Y', '111.54155382446', '23.240174042653', '3', 'tr_0 tr_440000 tr_445300 ', '0');
INSERT INTO `provinces` VALUES ('445381', '罗定市', '445300', '', '0', '0', 'L', '111.57648048166', '22.774296060763', '3', 'tr_0 tr_440000 tr_445300 ', '0');
INSERT INTO `provinces` VALUES ('450102', '兴宁区', '450100', '', '0', '0', 'X', '108.37544497422', '22.860290951255', '3', 'tr_0 tr_450000 tr_450100 ', '0');
INSERT INTO `provinces` VALUES ('450103', '青秀区', '450100', '', '0', '0', 'Q', '108.50143861009', '22.792227439631', '3', 'tr_0 tr_450000 tr_450100 ', '0');
INSERT INTO `provinces` VALUES ('450105', '江南区', '450100', '', '0', '0', 'J', '108.27949435764', '22.787045753588', '3', 'tr_0 tr_450000 tr_450100 ', '0');
INSERT INTO `provinces` VALUES ('450107', '西乡塘区', '450100', '', '0', '0', 'X', '108.31957243762', '22.839651509339', '3', 'tr_0 tr_450000 tr_450100 ', '0');
INSERT INTO `provinces` VALUES ('450108', '良庆区', '450100', '', '0', '0', 'L', '108.32751579392', '22.76284928359', '3', 'tr_0 tr_450000 tr_450100 ', '0');
INSERT INTO `provinces` VALUES ('450109', '邕宁区', '450100', '', '0', '0', 'Y', '108.49342024528', '22.76460044955', '3', 'tr_0 tr_450000 tr_450100 ', '0');
INSERT INTO `provinces` VALUES ('450110', '武鸣区', '450100', '', '0', '0', 'W', '108.28151653318', '23.164515606911', '3', 'tr_0 tr_450000 tr_450100 ', '0');
INSERT INTO `provinces` VALUES ('450123', '隆安县', '450100', '', '0', '0', 'L', '107.70257390338', '23.171585249828', '3', 'tr_0 tr_450000 tr_450100 ', '0');
INSERT INTO `provinces` VALUES ('450124', '马山县', '450100', '', '0', '0', 'M', '108.18356215633', '23.71387772536', '3', 'tr_0 tr_450000 tr_450100 ', '0');
INSERT INTO `provinces` VALUES ('450125', '上林县', '450100', '', '0', '0', 'S', '108.61145148078', '23.438518877663', '3', 'tr_0 tr_450000 tr_450100 ', '0');
INSERT INTO `provinces` VALUES ('450126', '宾阳县', '450100', '', '0', '0', 'B', '108.81650237947', '23.223700543767', '3', 'tr_0 tr_450000 tr_450100 ', '0');
INSERT INTO `provinces` VALUES ('450127', '横县', '450100', '', '0', '0', 'H', '109.2675678064', '22.685572608838', '3', 'tr_0 tr_450000 tr_450100 ', '0');
INSERT INTO `provinces` VALUES ('450202', '城中区', '450200', '', '0', '0', 'C', '109.4174821502', '24.321314069891', '3', 'tr_0 tr_450000 tr_450200 ', '0');
INSERT INTO `provinces` VALUES ('450203', '鱼峰区', '450200', '', '0', '0', 'Y', '109.44941628225', '24.318521699515', '3', 'tr_0 tr_450000 tr_450200 ', '0');
INSERT INTO `provinces` VALUES ('450204', '柳南区', '450200', '', '0', '0', 'L', '109.39155193285', '24.341578870912', '3', 'tr_0 tr_450000 tr_450200 ', '0');
INSERT INTO `provinces` VALUES ('450205', '柳北区', '450200', '', '0', '0', 'L', '109.40853179342', '24.367867017648', '3', 'tr_0 tr_450000 tr_450200 ', '0');
INSERT INTO `provinces` VALUES ('450206', '柳江区', '450200', '', '0', '0', 'L', '109.33244423878', '24.26081496535', '3', 'tr_0 tr_450000 tr_450200 ', '0');
INSERT INTO `provinces` VALUES ('450222', '柳城县', '450200', '', '0', '0', 'L', '109.25156152934', '24.656370391486', '3', 'tr_0 tr_450000 tr_450200 ', '0');
INSERT INTO `provinces` VALUES ('450223', '鹿寨县', '450200', '', '0', '0', 'L', '109.75755447547', '24.478622266898', '3', 'tr_0 tr_450000 tr_450200 ', '0');
INSERT INTO `provinces` VALUES ('450224', '融安县', '450200', '', '0', '0', 'R', '109.40456325934', '25.230511447128', '3', 'tr_0 tr_450000 tr_450200 ', '0');
INSERT INTO `provinces` VALUES ('450225', '融水苗族自治县', '450200', '', '0', '0', 'R', '109.26256083115', '25.072076504109', '3', 'tr_0 tr_450000 tr_450200 ', '0');
INSERT INTO `provinces` VALUES ('450226', '三江侗族自治县', '450200', '', '0', '0', 'S', '109.61454747223', '25.788830387788', '3', 'tr_0 tr_450000 tr_450200 ', '0');
INSERT INTO `provinces` VALUES ('450302', '秀峰区', '450300', '', '0', '0', 'X', '110.27043670622', '25.27961848567', '3', 'tr_0 tr_450000 tr_450300 ', '0');
INSERT INTO `provinces` VALUES ('450303', '叠彩区', '450300', '', '0', '0', 'D', '110.30846314624', '25.320233274843', '3', 'tr_0 tr_450000 tr_450300 ', '0');
INSERT INTO `provinces` VALUES ('450304', '象山区', '450300', '', '0', '0', 'X', '110.28742267527', '25.267930010211', '3', 'tr_0 tr_450000 tr_450300 ', '0');
INSERT INTO `provinces` VALUES ('450305', '七星区', '450300', '', '0', '0', 'Q', '110.32453805385', '25.2585670875', '3', 'tr_0 tr_450000 tr_450300 ', '0');
INSERT INTO `provinces` VALUES ('450311', '雁山区', '450300', '', '0', '0', 'Y', '110.3154792716', '25.066213543917', '3', 'tr_0 tr_450000 tr_450300 ', '0');
INSERT INTO `provinces` VALUES ('450312', '临桂区', '450300', '', '0', '0', 'L', '110.21858669186', '25.244301999271', '3', 'tr_0 tr_450000 tr_450300 ', '0');
INSERT INTO `provinces` VALUES ('450321', '阳朔县', '450300', '', '0', '0', 'Y', '110.50347503171', '24.784519191433', '3', 'tr_0 tr_450000 tr_450300 ', '0');
INSERT INTO `provinces` VALUES ('450323', '灵川县', '450300', '', '0', '0', 'L', '110.33253719492', '25.41554953076', '3', 'tr_0 tr_450000 tr_450300 ', '0');
INSERT INTO `provinces` VALUES ('450324', '全州县', '450300', '', '0', '0', 'Q', '111.07956895508', '25.934343027361', '3', 'tr_0 tr_450000 tr_450300 ', '0');
INSERT INTO `provinces` VALUES ('450325', '兴安县', '450300', '', '0', '0', 'X', '110.67851632807', '25.617567220037', '3', 'tr_0 tr_450000 tr_450300 ', '0');
INSERT INTO `provinces` VALUES ('450326', '永福县', '450300', '', '0', '0', 'Y', '109.989590831', '24.985577973084', '3', 'tr_0 tr_450000 tr_450300 ', '0');
INSERT INTO `provinces` VALUES ('450327', '灌阳县', '450300', '', '0', '0', 'G', '111.16755205093', '25.495120752051', '3', 'tr_0 tr_450000 tr_450300 ', '0');
INSERT INTO `provinces` VALUES ('450328', '龙胜各族自治县', '450300', '', '0', '0', 'L', '110.01749399674', '25.804116784254', '3', 'tr_0 tr_450000 tr_450300 ', '0');
INSERT INTO `provinces` VALUES ('450329', '资源县', '450300', '', '0', '0', 'Z', '110.6584391101', '26.048569077338', '3', 'tr_0 tr_450000 tr_450300 ', '0');
INSERT INTO `provinces` VALUES ('450330', '平乐县', '450300', '', '0', '0', 'P', '110.64944626347', '24.63963212806', '3', 'tr_0 tr_450000 tr_450300 ', '0');
INSERT INTO `provinces` VALUES ('450332', '恭城瑶族自治县', '450300', '', '0', '0', 'G', '110.8345596307', '24.837194365911', '3', 'tr_0 tr_450000 tr_450300 ', '0');
INSERT INTO `provinces` VALUES ('450381', '荔浦市', '450300', '', '0', '0', 'L', '110.40143677836', '24.494121641923', '3', 'tr_0 tr_450000 tr_450300 ', '0');
INSERT INTO `provinces` VALUES ('450403', '万秀区', '450400', '', '0', '0', 'W', '111.32751969101', '23.478845767296', '3', 'tr_0 tr_450000 tr_450400 ', '0');
INSERT INTO `provinces` VALUES ('450405', '长洲区', '450400', '', '0', '0', 'Z', '111.28149914043', '23.491509584406', '3', 'tr_0 tr_450000 tr_450400 ', '0');
INSERT INTO `provinces` VALUES ('450406', '龙圩区', '450400', '', '0', '0', 'L', '111.25344829326', '23.421414485718', '3', 'tr_0 tr_450000 tr_450400 ', '0');
INSERT INTO `provinces` VALUES ('450421', '苍梧县', '450400', '', '0', '0', 'C', '111.55554663956', '23.845998205466', '3', 'tr_0 tr_450000 tr_450400 ', '0');
INSERT INTO `provinces` VALUES ('450422', '藤县', '450400', '', '0', '0', 'T', '110.92149925488', '23.38100991555', '3', 'tr_0 tr_450000 tr_450400 ', '0');
INSERT INTO `provinces` VALUES ('450423', '蒙山县', '450400', '', '0', '0', 'M', '110.53141700425', '24.200017445935', '3', 'tr_0 tr_450000 tr_450400 ', '0');
INSERT INTO `provinces` VALUES ('450481', '岑溪市', '450400', '', '0', '0', 'C', '111.00143182659', '22.92462127872', '3', 'tr_0 tr_450000 tr_450400 ', '0');
INSERT INTO `provinces` VALUES ('450502', '海城区', '450500', '', '0', '0', 'H', '109.12452136755', '21.481065838236', '3', 'tr_0 tr_450000 tr_450500 ', '0');
INSERT INTO `provinces` VALUES ('450503', '银海区', '450500', '', '0', '0', 'Y', '109.14654476441', '21.454768668895', '3', 'tr_0 tr_450000 tr_450500 ', '0');
INSERT INTO `provinces` VALUES ('450512', '铁山港区', '450500', '', '0', '0', 'T', '109.42847264862', '21.53529504285', '3', 'tr_0 tr_450000 tr_450500 ', '0');
INSERT INTO `provinces` VALUES ('450521', '合浦县', '450500', '', '0', '0', 'H', '109.2134386113', '21.667005735642', '3', 'tr_0 tr_450000 tr_450500 ', '0');
INSERT INTO `provinces` VALUES ('450602', '港口区', '450600', '', '0', '0', 'G', '108.38648254385', '21.649565586624', '3', 'tr_0 tr_450000 tr_450600 ', '0');
INSERT INTO `provinces` VALUES ('450603', '防城区', '450600', '', '0', '0', 'F', '108.36044848238', '21.775411305197', '3', 'tr_0 tr_450000 tr_450600 ', '0');
INSERT INTO `provinces` VALUES ('450621', '上思县', '450600', '', '0', '0', 'S', '107.99044264125', '22.15991408311', '3', 'tr_0 tr_450000 tr_450600 ', '0');
INSERT INTO `provinces` VALUES ('450681', '东兴市', '450600', '', '0', '0', 'D', '107.97748898597', '21.55361543358', '3', 'tr_0 tr_450000 tr_450600 ', '0');
INSERT INTO `provinces` VALUES ('450802', '港北区', '450800', '', '0', '0', 'G', '109.57843298566', '23.117563632764', '3', 'tr_0 tr_450000 tr_450800 ', '0');
INSERT INTO `provinces` VALUES ('450803', '港南区', '450800', '', '0', '0', 'G', '109.6065534515', '23.08123957836', '3', 'tr_0 tr_450000 tr_450800 ', '0');
INSERT INTO `provinces` VALUES ('450804', '覃塘区', '450800', '', '0', '0', 'T', '109.45942672936', '23.133251089213', '3', 'tr_0 tr_450000 tr_450800 ', '0');
INSERT INTO `provinces` VALUES ('450821', '平南县', '450800', '', '0', '0', 'P', '110.39845197864', '23.545506098828', '3', 'tr_0 tr_450000 tr_450800 ', '0');
INSERT INTO `provinces` VALUES ('450881', '桂平市', '450800', '', '0', '0', 'G', '110.08552599672', '23.400048883699', '3', 'tr_0 tr_450000 tr_450800 ', '0');
INSERT INTO `provinces` VALUES ('450902', '玉州区', '450900', '', '0', '0', 'Y', '110.15743140022', '22.634492736172', '3', 'tr_0 tr_450000 tr_450900 ', '0');
INSERT INTO `provinces` VALUES ('450903', '福绵区', '450900', '', '0', '0', 'F', '110.08853765577', '22.563705412249', '3', 'tr_0 tr_450000 tr_450900 ', '0');
INSERT INTO `provinces` VALUES ('450921', '容县', '450900', '', '0', '0', 'R', '110.56453016229', '22.863665599935', '3', 'tr_0 tr_450000 tr_450900 ', '0');
INSERT INTO `provinces` VALUES ('450922', '陆川县', '450900', '', '0', '0', 'L', '110.27045619945', '22.327221527769', '3', 'tr_0 tr_450000 tr_450900 ', '0');
INSERT INTO `provinces` VALUES ('450923', '博白县', '450900', '', '0', '0', 'B', '109.98255305648', '22.278674815493', '3', 'tr_0 tr_450000 tr_450900 ', '0');
INSERT INTO `provinces` VALUES ('450924', '兴业县', '450900', '', '0', '0', 'X', '109.88155180701', '22.742267653423', '3', 'tr_0 tr_450000 tr_450900 ', '0');
INSERT INTO `provinces` VALUES ('450981', '北流市', '450900', '', '0', '0', 'B', '110.36057016581', '22.713958021611', '3', 'tr_0 tr_450000 tr_450900 ', '0');
INSERT INTO `provinces` VALUES ('451002', '右江区', '451000', '', '0', '0', 'Y', '106.62558913969', '23.907084503109', '3', 'tr_0 tr_450000 tr_451000 ', '0');
INSERT INTO `provinces` VALUES ('451021', '田阳县', '451000', '', '0', '0', 'T', '106.9214125525', '23.742005722478', '3', 'tr_0 tr_450000 tr_451000 ', '0');
INSERT INTO `provinces` VALUES ('451022', '田东县', '451000', '', '0', '0', 'T', '107.13249943541', '23.603129804015', '3', 'tr_0 tr_450000 tr_451000 ', '0');
INSERT INTO `provinces` VALUES ('451023', '平果县', '451000', '', '0', '0', 'P', '107.59657106849', '23.334922742592', '3', 'tr_0 tr_450000 tr_451000 ', '0');
INSERT INTO `provinces` VALUES ('451024', '德保县', '451000', '', '0', '0', 'D', '106.62158260728', '23.328994351286', '3', 'tr_0 tr_450000 tr_451000 ', '0');
INSERT INTO `provinces` VALUES ('451026', '那坡县', '451000', '', '0', '0', 'N', '105.83942261017', '23.393793831292', '3', 'tr_0 tr_450000 tr_451000 ', '0');
INSERT INTO `provinces` VALUES ('451027', '凌云县', '451000', '', '0', '0', 'L', '106.56841567705', '24.354015240604', '3', 'tr_0 tr_450000 tr_451000 ', '0');
INSERT INTO `provinces` VALUES ('451028', '乐业县', '451000', '', '0', '0', 'L', '106.56342972215', '24.783216467053', '3', 'tr_0 tr_450000 tr_451000 ', '0');
INSERT INTO `provinces` VALUES ('451029', '田林县', '451000', '', '0', '0', 'T', '106.23449791231', '24.300534611051', '3', 'tr_0 tr_450000 tr_451000 ', '0');
INSERT INTO `provinces` VALUES ('451030', '西林县', '451000', '', '0', '0', 'X', '105.10049410469', '24.495667790362', '3', 'tr_0 tr_450000 tr_451000 ', '0');
INSERT INTO `provinces` VALUES ('451031', '隆林各族自治县', '451000', '', '0', '0', 'L', '105.3504594704', '24.776813610296', '3', 'tr_0 tr_450000 tr_451000 ', '0');
INSERT INTO `provinces` VALUES ('451081', '靖西市', '451000', '', '0', '0', 'J', '106.42445269708', '23.140125669019', '3', 'tr_0 tr_450000 tr_451000 ', '0');
INSERT INTO `provinces` VALUES ('451102', '八步区', '451100', '', '0', '0', 'B', '111.55856737149', '24.417531040919', '3', 'tr_0 tr_450000 tr_451100 ', '0');
INSERT INTO `provinces` VALUES ('451103', '平桂区', '451100', '', '0', '0', 'P', '111.47841426578', '24.462001422773', '3', 'tr_0 tr_450000 tr_451100 ', '0');
INSERT INTO `provinces` VALUES ('451121', '昭平县', '451100', '', '0', '0', 'Z', '110.81757491928', '24.175106050636', '3', 'tr_0 tr_450000 tr_451100 ', '0');
INSERT INTO `provinces` VALUES ('451122', '钟山县', '451100', '', '0', '0', 'Z', '111.30958574015', '24.531673107939', '3', 'tr_0 tr_450000 tr_451100 ', '0');
INSERT INTO `provinces` VALUES ('451123', '富川瑶族自治县', '451100', '', '0', '0', 'F', '111.28451124863', '24.820159951323', '3', 'tr_0 tr_450000 tr_451100 ', '0');
INSERT INTO `provinces` VALUES ('451202', '金城江区', '451200', '', '0', '0', 'J', '108.04350707483', '24.695679382239', '3', 'tr_0 tr_450000 tr_451200 ', '0');
INSERT INTO `provinces` VALUES ('451203', '宜州区', '451200', '', '0', '0', 'Y', '108.64353158748', '24.491084367739', '3', 'tr_0 tr_450000 tr_451200 ', '0');
INSERT INTO `provinces` VALUES ('451221', '南丹县', '451200', '', '0', '0', 'N', '107.54748028934', '24.981849775485', '3', 'tr_0 tr_450000 tr_451200 ', '0');
INSERT INTO `provinces` VALUES ('451222', '天峨县', '451200', '', '0', '0', 'T', '107.17845647579', '25.005664155232', '3', 'tr_0 tr_450000 tr_451200 ', '0');
INSERT INTO `provinces` VALUES ('451223', '凤山县', '451200', '', '0', '0', 'F', '107.04841983631', '24.553217796777', '3', 'tr_0 tr_450000 tr_451200 ', '0');
INSERT INTO `provinces` VALUES ('451224', '东兰县', '451200', '', '0', '0', 'D', '107.3805041595', '24.516871463381', '3', 'tr_0 tr_450000 tr_451200 ', '0');
INSERT INTO `provinces` VALUES ('451225', '罗城仫佬族自治县', '451200', '', '0', '0', 'L', '108.91157445325', '24.783084996429', '3', 'tr_0 tr_450000 tr_451200 ', '0');
INSERT INTO `provinces` VALUES ('451226', '环江毛南族自治县', '451200', '', '0', '0', 'H', '108.26444306917', '24.832087938551', '3', 'tr_0 tr_450000 tr_451200 ', '0');
INSERT INTO `provinces` VALUES ('451227', '巴马瑶族自治县', '451200', '', '0', '0', 'B', '107.26648125302', '24.14726480427', '3', 'tr_0 tr_450000 tr_451200 ', '0');
INSERT INTO `provinces` VALUES ('451228', '都安瑶族自治县', '451200', '', '0', '0', 'D', '108.11145804765', '23.937331261923', '3', 'tr_0 tr_450000 tr_451200 ', '0');
INSERT INTO `provinces` VALUES ('451229', '大化瑶族自治县', '451200', '', '0', '0', 'D', '108.00441075294', '23.742818222963', '3', 'tr_0 tr_450000 tr_451200 ', '0');
INSERT INTO `provinces` VALUES ('451302', '兴宾区', '451300', '', '0', '0', 'X', '109.24149907034', '23.733211038144', '3', 'tr_0 tr_450000 tr_451300 ', '0');
INSERT INTO `provinces` VALUES ('451321', '忻城县', '451300', '', '0', '0', 'X', '108.67256239612', '24.071888636576', '3', 'tr_0 tr_450000 tr_451300 ', '0');
INSERT INTO `provinces` VALUES ('451322', '象州县', '451300', '', '0', '0', 'X', '109.71146215028', '23.979680993271', '3', 'tr_0 tr_450000 tr_451300 ', '0');
INSERT INTO `provinces` VALUES ('451323', '武宣县', '451300', '', '0', '0', 'W', '109.66944220328', '23.600404197633', '3', 'tr_0 tr_450000 tr_451300 ', '0');
INSERT INTO `provinces` VALUES ('451324', '金秀瑶族自治县', '451300', '', '0', '0', 'J', '110.19550625891', '24.136319486486', '3', 'tr_0 tr_450000 tr_451300 ', '0');
INSERT INTO `provinces` VALUES ('451381', '合山市', '451300', '', '0', '0', 'H', '108.89256576969', '23.81226007105', '3', 'tr_0 tr_450000 tr_451300 ', '0');
INSERT INTO `provinces` VALUES ('451402', '江州区', '451400', '', '0', '0', 'J', '107.35953321738', '22.411245728018', '3', 'tr_0 tr_450000 tr_451400 ', '0');
INSERT INTO `provinces` VALUES ('451421', '扶绥县', '451400', '', '0', '0', 'F', '107.91046515426', '22.641097136345', '3', 'tr_0 tr_450000 tr_451400 ', '0');
INSERT INTO `provinces` VALUES ('451422', '宁明县', '451400', '', '0', '0', 'N', '107.08352381902', '22.145884844184', '3', 'tr_0 tr_450000 tr_451400 ', '0');
INSERT INTO `provinces` VALUES ('451423', '龙州县', '451400', '', '0', '0', 'L', '106.86058190847', '22.348298905766', '3', 'tr_0 tr_450000 tr_451400 ', '0');
INSERT INTO `provinces` VALUES ('451424', '大新县', '451400', '', '0', '0', 'D', '107.20755690312', '22.836229044406', '3', 'tr_0 tr_450000 tr_451400 ', '0');
INSERT INTO `provinces` VALUES ('451425', '天等县', '451400', '', '0', '0', 'T', '107.14947264852', '23.08750581209', '3', 'tr_0 tr_450000 tr_451400 ', '0');
INSERT INTO `provinces` VALUES ('451481', '凭祥市', '451400', '', '0', '0', 'P', '106.77352361814', '22.100152592954', '3', 'tr_0 tr_450000 tr_451400 ', '0');
INSERT INTO `provinces` VALUES ('460105', '秀英区', '460100', '', '0', '0', 'X', '110.30043588821', '20.013642385161', '3', 'tr_0 tr_460000 tr_460100 ', '0');
INSERT INTO `provinces` VALUES ('460106', '龙华区', '460100', '', '0', '0', 'L', '110.33554112854', '20.036320733521', '3', 'tr_0 tr_460000 tr_460100 ', '0');
INSERT INTO `provinces` VALUES ('460107', '琼山区', '460100', '', '0', '0', 'Q', '110.36052605901', '20.009150644491', '3', 'tr_0 tr_460000 tr_460100 ', '0');
INSERT INTO `provinces` VALUES ('460108', '美兰区', '460100', '', '0', '0', 'M', '110.37349839904', '20.034646217625', '3', 'tr_0 tr_460000 tr_460100 ', '0');
INSERT INTO `provinces` VALUES ('460202', '海棠区', '460200', '', '0', '0', 'H', '109.72350007292', '18.33787879371', '3', 'tr_0 tr_460000 tr_460200 ', '0');
INSERT INTO `provinces` VALUES ('460203', '吉阳区', '460200', '', '0', '0', 'J', '109.52055165827', '18.257057667262', '3', 'tr_0 tr_460000 tr_460200 ', '0');
INSERT INTO `provinces` VALUES ('460204', '天涯区', '460200', '', '0', '0', 'T', '109.46246255283', '18.306919633503', '3', 'tr_0 tr_460000 tr_460200 ', '0');
INSERT INTO `provinces` VALUES ('460205', '崖州区', '460200', '', '0', '0', 'Y', '109.22846124383', '18.44463053478', '3', 'tr_0 tr_460000 tr_460200 ', '0');
INSERT INTO `provinces` VALUES ('460321', '西沙群岛', '460300', '', '0', '0', 'X', '111.67308686126', '16.497085431044', '3', 'tr_0 tr_460000 tr_460300 ', '0');
INSERT INTO `provinces` VALUES ('460322', '南沙群岛', '460300', '', '0', '0', 'N', '112.66030170907', '4.9743661921368', '3', 'tr_0 tr_460000 tr_460300 ', '0');
INSERT INTO `provinces` VALUES ('460323', '中沙群岛的岛礁及其海域', '460300', '', '0', '0', 'Z', '112.34048204137', '16.838953334409', '3', 'tr_0 tr_460000 tr_460300 ', '0');
INSERT INTO `provinces` VALUES ('460400100', '那大镇', '460400', '', '0', '0', 'N', '109.552961497', '19.52127763772', '3', 'tr_0 tr_460000 tr_460400 ', '0');
INSERT INTO `provinces` VALUES ('460400101', '和庆镇', '460400', '', '0', '0', 'H', '109.64738779153', '19.531275426074', '3', 'tr_0 tr_460000 tr_460400 ', '0');
INSERT INTO `provinces` VALUES ('460400102', '南丰镇', '460400', '', '0', '0', 'N', '109.6054369934', '19.346095790543', '3', 'tr_0 tr_460000 tr_460400 ', '0');
INSERT INTO `provinces` VALUES ('460400103', '大成镇', '460400', '', '0', '0', 'D', '109.42116531507', '19.548276240672', '3', 'tr_0 tr_460000 tr_460400 ', '0');
INSERT INTO `provinces` VALUES ('460400104', '雅星镇', '460400', '', '0', '0', 'Y', '109.19716320191', '19.517956948407', '3', 'tr_0 tr_460000 tr_460400 ', '0');
INSERT INTO `provinces` VALUES ('460400105', '兰洋镇', '460400', '', '0', '0', 'L', '109.67367138789', '19.466430878427', '3', 'tr_0 tr_460000 tr_460400 ', '0');
INSERT INTO `provinces` VALUES ('460400106', '光村镇', '460400', '', '0', '0', 'G', '109.50795789562', '19.809145677126', '3', 'tr_0 tr_460000 tr_460400 ', '0');
INSERT INTO `provinces` VALUES ('460400107', '木棠镇', '460400', '', '0', '0', 'M', '109.35673473687', '19.809926770596', '3', 'tr_0 tr_460000 tr_460400 ', '0');
INSERT INTO `provinces` VALUES ('460400108', '海头镇', '460400', '', '0', '0', 'H', '108.95966166166', '19.509695855917', '3', 'tr_0 tr_460000 tr_460400 ', '0');
INSERT INTO `provinces` VALUES ('460400109', '峨蔓镇', '460400', '', '0', '0', 'E', '109.30390924357', '19.863144800976', '3', 'tr_0 tr_460000 tr_460400 ', '0');
INSERT INTO `provinces` VALUES ('460400111', '王五镇', '460400', '', '0', '0', 'W', '109.33806829512', '19.645800769747', '3', 'tr_0 tr_460000 tr_460400 ', '0');
INSERT INTO `provinces` VALUES ('460400112', '白马井镇', '460400', '', '0', '0', 'B', '109.58745583569', '19.527146110044', '3', 'tr_0 tr_460000 tr_460400 ', '0');
INSERT INTO `provinces` VALUES ('460400113', '中和镇', '460400', '', '0', '0', 'Z', '109.35613533713', '19.749465537088', '3', 'tr_0 tr_460000 tr_460400 ', '0');
INSERT INTO `provinces` VALUES ('460400114', '排浦镇', '460400', '', '0', '0', 'P', '109.16975400269', '19.644673698003', '3', 'tr_0 tr_460000 tr_460400 ', '0');
INSERT INTO `provinces` VALUES ('460400115', '东成镇', '460400', '', '0', '0', 'D', '109.4680333127', '19.709924104042', '3', 'tr_0 tr_460000 tr_460400 ', '0');
INSERT INTO `provinces` VALUES ('460400116', '新州镇', '460400', '', '0', '0', 'X', '109.32260133284', '19.720234743232', '3', 'tr_0 tr_460000 tr_460400 ', '0');
INSERT INTO `provinces` VALUES ('460400499', '洋浦经济开发区', '460400', '', '0', '0', 'Y', '109.19229656623', '19.775218244804', '3', 'tr_0 tr_460000 tr_460400 ', '0');
INSERT INTO `provinces` VALUES ('460400500', '华南热作学院', '460400', '', '0', '0', 'H', '109.58745583569', '19.527146110044', '3', 'tr_0 tr_460000 tr_460400 ', '0');
INSERT INTO `provinces` VALUES ('469001', '五指山市', '469000', '', '0', '0', 'W', '109.52354032071', '18.780994100706', '3', 'tr_0 tr_460000 tr_469000 ', '0');
INSERT INTO `provinces` VALUES ('469002', '琼海市', '469000', '', '0', '0', 'Q', '110.48054452595', '19.264254019918', '3', 'tr_0 tr_460000 tr_469000 ', '0');
INSERT INTO `provinces` VALUES ('469005', '文昌市', '469000', '', '0', '0', 'W', '110.80450870632', '19.549062083121', '3', 'tr_0 tr_460000 tr_469000 ', '0');
INSERT INTO `provinces` VALUES ('469006', '万宁市', '469000', '', '0', '0', 'W', '110.39943436555', '18.800106988303', '3', 'tr_0 tr_460000 tr_469000 ', '0');
INSERT INTO `provinces` VALUES ('469007', '东方市', '469000', '', '0', '0', 'D', '108.65856652679', '19.101104731289', '3', 'tr_0 tr_460000 tr_469000 ', '0');
INSERT INTO `provinces` VALUES ('469021', '定安县', '469000', '', '0', '0', 'D', '104.36878601078', '31.589181642776', '3', 'tr_0 tr_460000 tr_469000 ', '0');
INSERT INTO `provinces` VALUES ('469022', '屯昌县', '469000', '', '0', '0', 'T', '110.10857732457', '19.357374924278', '3', 'tr_0 tr_460000 tr_469000 ', '0');
INSERT INTO `provinces` VALUES ('469023', '澄迈县', '469000', '', '0', '0', 'C', '110.01351091011', '19.744348671646', '3', 'tr_0 tr_460000 tr_469000 ', '0');
INSERT INTO `provinces` VALUES ('469024', '临高县', '469000', '', '0', '0', 'L', '109.69744301483', '19.919474770278', '3', 'tr_0 tr_460000 tr_469000 ', '0');
INSERT INTO `provinces` VALUES ('469025', '白沙黎族自治县', '469000', '', '0', '0', 'B', '109.45747066911', '19.231378733013', '3', 'tr_0 tr_460000 tr_469000 ', '0');
INSERT INTO `provinces` VALUES ('469026', '昌江黎族自治县', '469000', '', '0', '0', 'C', '109.06246408734', '19.303997876684', '3', 'tr_0 tr_460000 tr_469000 ', '0');
INSERT INTO `provinces` VALUES ('469027', '乐东黎族自治县', '469000', '', '0', '0', 'L', '109.18050798895', '18.755871493855', '3', 'tr_0 tr_460000 tr_469000 ', '0');
INSERT INTO `provinces` VALUES ('469028', '陵水黎族自治县', '469000', '', '0', '0', 'L', '110.04446409255', '18.512331595699', '3', 'tr_0 tr_460000 tr_469000 ', '0');
INSERT INTO `provinces` VALUES ('469029', '保亭黎族苗族自治县', '469000', '', '0', '0', 'B', '109.7034815143', '18.646909955376', '3', 'tr_0 tr_460000 tr_469000 ', '0');
INSERT INTO `provinces` VALUES ('469030', '琼中黎族苗族自治县', '469000', '', '0', '0', 'Q', '109.84451062847', '19.039163789181', '3', 'tr_0 tr_460000 tr_469000 ', '0');
INSERT INTO `provinces` VALUES ('500101', '万州区', '500100', '', '0', '0', 'W', '108.4155583705', '30.813621636708', '3', 'tr_0 tr_500000 tr_500100 ', '0');
INSERT INTO `provinces` VALUES ('500102', '涪陵区', '500100', '', '0', '0', 'F', '107.39641979754', '29.709278197979', '3', 'tr_0 tr_500000 tr_500100 ', '0');
INSERT INTO `provinces` VALUES ('500103', '渝中区', '500100', '', '0', '0', 'Y', '106.57544006681', '29.559090182994', '3', 'tr_0 tr_500000 tr_500100 ', '0');
INSERT INTO `provinces` VALUES ('500104', '大渡口区', '500100', '', '0', '0', 'D', '106.48853359011', '29.490107128556', '3', 'tr_0 tr_500000 tr_500100 ', '0');
INSERT INTO `provinces` VALUES ('500105', '江北区', '500100', '', '0', '0', 'J', '112.85530302042', '35.520558754673', '3', 'tr_0 tr_500000 tr_500100 ', '0');
INSERT INTO `provinces` VALUES ('500106', '沙坪坝区', '500100', '', '0', '0', 'S', '106.46446511093', '29.547192516541', '3', 'tr_0 tr_500000 tr_500100 ', '0');
INSERT INTO `provinces` VALUES ('500107', '九龙坡区', '500100', '', '0', '0', 'J', '106.51755873943', '29.507927715553', '3', 'tr_0 tr_500000 tr_500100 ', '0');
INSERT INTO `provinces` VALUES ('500108', '南岸区', '500100', '', '0', '0', 'N', '106.6684297786', '29.502683098835', '3', 'tr_0 tr_500000 tr_500100 ', '0');
INSERT INTO `provinces` VALUES ('500109', '北碚区', '500100', '', '0', '0', 'B', '106.40356933975', '29.811602753904', '3', 'tr_0 tr_500000 tr_500100 ', '0');
INSERT INTO `provinces` VALUES ('500110', '綦江区', '500100', '', '0', '0', 'Q', '106.65748419545', '29.034113748311', '3', 'tr_0 tr_500000 tr_500100 ', '0');
INSERT INTO `provinces` VALUES ('500111', '大足区', '500100', '', '0', '0', 'D', '105.72840462545', '29.713113506077', '3', 'tr_0 tr_500000 tr_500100 ', '0');
INSERT INTO `provinces` VALUES ('500112', '渝北区', '500100', '', '0', '0', 'Y', '106.6375590606', '29.723927343007', '3', 'tr_0 tr_500000 tr_500100 ', '0');
INSERT INTO `provinces` VALUES ('500113', '巴南区', '500100', '', '0', '0', 'B', '106.54745425696', '29.40847473977', '3', 'tr_0 tr_500000 tr_500100 ', '0');
INSERT INTO `provinces` VALUES ('500114', '黔江区', '500100', '', '0', '0', 'Q', '108.77759119835', '29.53881256766', '3', 'tr_0 tr_500000 tr_500100 ', '0');
INSERT INTO `provinces` VALUES ('500115', '长寿区', '500100', '', '0', '0', 'Z', '107.08753107007', '29.863520067323', '3', 'tr_0 tr_500000 tr_500100 ', '0');
INSERT INTO `provinces` VALUES ('500116', '江津区', '500100', '', '0', '0', 'J', '106.26559760838', '29.295884374465', '3', 'tr_0 tr_500000 tr_500100 ', '0');
INSERT INTO `provinces` VALUES ('500117', '合川区', '500100', '', '0', '0', 'H', '106.28254108758', '29.978181239534', '3', 'tr_0 tr_500000 tr_500100 ', '0');
INSERT INTO `provinces` VALUES ('500118', '永川区', '500100', '', '0', '0', 'Y', '105.93349936145', '29.362046335949', '3', 'tr_0 tr_500000 tr_500100 ', '0');
INSERT INTO `provinces` VALUES ('500119', '南川区', '500100', '', '0', '0', 'N', '107.10558512437', '29.163478599606', '3', 'tr_0 tr_500000 tr_500100 ', '0');
INSERT INTO `provinces` VALUES ('500120', '璧山区', '500100', '', '0', '0', 'B', '106.23347456267', '29.598346607316', '3', 'tr_0 tr_500000 tr_500100 ', '0');
INSERT INTO `provinces` VALUES ('500151', '铜梁区', '500100', '', '0', '0', 'T', '106.06344949411', '29.850508778722', '3', 'tr_0 tr_500000 tr_500100 ', '0');
INSERT INTO `provinces` VALUES ('500152', '潼南区', '500100', '', '0', '0', 'T', '105.84739903617', '30.197314239664', '3', 'tr_0 tr_500000 tr_500100 ', '0');
INSERT INTO `provinces` VALUES ('500153', '荣昌区', '500100', '', '0', '0', 'R', '105.60141979928', '29.41130739669', '3', 'tr_0 tr_500000 tr_500100 ', '0');
INSERT INTO `provinces` VALUES ('500154', '开州区', '500100', '', '0', '0', 'K', '108.39949765612', '31.166644113193', '3', 'tr_0 tr_500000 tr_500100 ', '0');
INSERT INTO `provinces` VALUES ('500155', '梁平区', '500100', '', '0', '0', 'L', '107.77609725763', '30.660553255023', '3', 'tr_0 tr_500000 tr_500100 ', '0');
INSERT INTO `provinces` VALUES ('500156', '武隆区', '500100', '', '0', '0', 'W', '112.85530302042', '35.520558754673', '3', 'tr_0 tr_500000 tr_500100 ', '0');
INSERT INTO `provinces` VALUES ('500229', '城口县', '500200', '', '0', '0', 'C', '108.67161164256', '31.953390746293', '3', 'tr_0 tr_500000 tr_500200 ', '0');
INSERT INTO `provinces` VALUES ('500230', '丰都县', '500200', '', '0', '0', 'F', '107.7374806182', '29.869412789214', '3', 'tr_0 tr_500000 tr_500200 ', '0');
INSERT INTO `provinces` VALUES ('500231', '垫江县', '500200', '', '0', '0', 'D', '107.33956587472', '30.3332939685', '3', 'tr_0 tr_500000 tr_500200 ', '0');
INSERT INTO `provinces` VALUES ('500233', '忠县', '500200', '', '0', '0', 'Z', '', '', '3', 'tr_0 tr_500000 tr_500200 ', '0');
INSERT INTO `provinces` VALUES ('500235', '云阳县', '500200', '', '0', '0', 'Y', '108.7034475', '30.936611271975', '3', 'tr_0 tr_500000 tr_500200 ', '0');
INSERT INTO `provinces` VALUES ('500236', '奉节县', '500200', '', '0', '0', 'F', '109.47047275631', '31.024601766549', '3', 'tr_0 tr_500000 tr_500200 ', '0');
INSERT INTO `provinces` VALUES ('500237', '巫山县', '500200', '', '0', '0', 'W', '109.88554550703', '31.080518811736', '3', 'tr_0 tr_500000 tr_500200 ', '0');
INSERT INTO `provinces` VALUES ('500238', '巫溪县', '500200', '', '0', '0', 'W', '109.576402559', '31.404880009858', '3', 'tr_0 tr_500000 tr_500200 ', '0');
INSERT INTO `provinces` VALUES ('500240', '石柱土家族自治县', '500200', '', '0', '0', 'S', '108.12041416638', '30.006108697869', '3', 'tr_0 tr_500000 tr_500200 ', '0');
INSERT INTO `provinces` VALUES ('500241', '秀山土家族苗族自治县', '500200', '', '0', '0', 'X', '109.01357389981', '28.453447864286', '3', 'tr_0 tr_500000 tr_500200 ', '0');
INSERT INTO `provinces` VALUES ('500242', '酉阳土家族苗族自治县', '500200', '', '0', '0', 'Y', '108.7745860071', '28.847040258674', '3', 'tr_0 tr_500000 tr_500200 ', '0');
INSERT INTO `provinces` VALUES ('500243', '彭水苗族土家族自治县', '500200', '', '0', '0', 'P', '108.17257803588', '29.299462290443', '3', 'tr_0 tr_500000 tr_500200 ', '0');
INSERT INTO `provinces` VALUES ('510104', '锦江区', '510100', '', '0', '0', 'J', '104.0895617566', '30.661904490317', '3', 'tr_0 tr_510000 tr_510100 ', '0');
INSERT INTO `provinces` VALUES ('510105', '青羊区', '510100', '', '0', '0', 'Q', '104.06744547494', '30.680037807007', '3', 'tr_0 tr_510000 tr_510100 ', '0');
INSERT INTO `provinces` VALUES ('510106', '金牛区', '510100', '', '0', '0', 'J', '104.05740358714', '30.697356042874', '3', 'tr_0 tr_510000 tr_510100 ', '0');
INSERT INTO `provinces` VALUES ('510107', '武侯区', '510100', '', '0', '0', 'W', '104.04942447828', '30.648712685321', '3', 'tr_0 tr_510000 tr_510100 ', '0');
INSERT INTO `provinces` VALUES ('510108', '成华区', '510100', '', '0', '0', 'C', '104.10859155035', '30.665589283983', '3', 'tr_0 tr_510000 tr_510100 ', '0');
INSERT INTO `provinces` VALUES ('510112', '龙泉驿区', '510100', '', '0', '0', 'L', '104.28139696436', '30.562697841', '3', 'tr_0 tr_510000 tr_510100 ', '0');
INSERT INTO `provinces` VALUES ('510113', '青白江区', '510100', '', '0', '0', 'Q', '104.25751245813', '30.884421372736', '3', 'tr_0 tr_510000 tr_510100 ', '0');
INSERT INTO `provinces` VALUES ('510114', '新都区', '510100', '', '0', '0', 'X', '104.16539284504', '30.829407468191', '3', 'tr_0 tr_510000 tr_510100 ', '0');
INSERT INTO `provinces` VALUES ('510115', '温江区', '510100', '', '0', '0', 'W', '103.86357306318', '30.688486836627', '3', 'tr_0 tr_510000 tr_510100 ', '0');
INSERT INTO `provinces` VALUES ('510116', '双流区', '510100', '', '0', '0', 'S', '103.93039154227', '30.580399352821', '3', 'tr_0 tr_510000 tr_510100 ', '0');
INSERT INTO `provinces` VALUES ('510117', '郫都区', '510100', '', '0', '0', 'P', '103.90544568809', '30.799537653573', '3', 'tr_0 tr_510000 tr_510100 ', '0');
INSERT INTO `provinces` VALUES ('510121', '金堂县', '510100', '', '0', '0', 'J', '104.41844263262', '30.868358423946', '3', 'tr_0 tr_510000 tr_510100 ', '0');
INSERT INTO `provinces` VALUES ('510129', '大邑县', '510100', '', '0', '0', 'D', '103.52752981767', '30.593155402402', '3', 'tr_0 tr_510000 tr_510100 ', '0');
INSERT INTO `provinces` VALUES ('510131', '蒲江县', '510100', '', '0', '0', 'P', '103.51257132415', '30.202500428139', '3', 'tr_0 tr_510000 tr_510100 ', '0');
INSERT INTO `provinces` VALUES ('510132', '新津县', '510100', '', '0', '0', 'X', '103.81743303795', '30.416363953297', '3', 'tr_0 tr_510000 tr_510100 ', '0');
INSERT INTO `provinces` VALUES ('510181', '都江堰市', '510100', '', '0', '0', 'D', '103.65353360443', '30.994256893542', '3', 'tr_0 tr_510000 tr_510100 ', '0');
INSERT INTO `provinces` VALUES ('510182', '彭州市', '510100', '', '0', '0', 'P', '103.96556137078', '30.995564002629', '3', 'tr_0 tr_510000 tr_510100 ', '0');
INSERT INTO `provinces` VALUES ('510183', '邛崃市', '510100', '', '0', '0', 'Q', '103.47048112964', '30.416398600854', '3', 'tr_0 tr_510000 tr_510100 ', '0');
INSERT INTO `provinces` VALUES ('510184', '崇州市', '510100', '', '0', '0', 'C', '103.67943336923', '30.636595891379', '3', 'tr_0 tr_510000 tr_510100 ', '0');
INSERT INTO `provinces` VALUES ('510185', '简阳市', '510100', '', '0', '0', 'J', '104.55349406265', '30.417451491353', '3', 'tr_0 tr_510000 tr_510100 ', '0');
INSERT INTO `provinces` VALUES ('510302', '自流井区', '510300', '', '0', '0', 'Z', '104.7834473259', '29.343498562348', '3', 'tr_0 tr_510000 tr_510300 ', '0');
INSERT INTO `provinces` VALUES ('510303', '贡井区', '510300', '', '0', '0', 'G', '104.72155659154', '29.351476269522', '3', 'tr_0 tr_510000 tr_510300 ', '0');
INSERT INTO `provinces` VALUES ('510304', '大安区', '510300', '', '0', '0', 'D', '104.78041635328', '29.369928541322', '3', 'tr_0 tr_510000 tr_510300 ', '0');
INSERT INTO `provinces` VALUES ('510311', '沿滩区', '510300', '', '0', '0', 'Y', '104.88040907516', '29.278797205251', '3', 'tr_0 tr_510000 tr_510300 ', '0');
INSERT INTO `provinces` VALUES ('510321', '荣县', '510300', '', '0', '0', 'R', '104.42345759121', '29.45180089858', '3', 'tr_0 tr_510000 tr_510300 ', '0');
INSERT INTO `provinces` VALUES ('510322', '富顺县', '510300', '', '0', '0', 'F', '104.98149440603', '29.186886257831', '3', 'tr_0 tr_510000 tr_510300 ', '0');
INSERT INTO `provinces` VALUES ('510402', '东区', '510400', '', '0', '0', 'D', '101.72554117091', '26.588033173333', '3', 'tr_0 tr_510000 tr_510400 ', '0');
INSERT INTO `provinces` VALUES ('510403', '西区', '510400', '', '0', '0', 'X', '101.72554117091', '26.588033173333', '3', 'tr_0 tr_510000 tr_510400 ', '0');
INSERT INTO `provinces` VALUES ('510411', '仁和区', '510400', '', '0', '0', 'R', '101.74444996291', '26.504019493295', '3', 'tr_0 tr_510000 tr_510400 ', '0');
INSERT INTO `provinces` VALUES ('510421', '米易县', '510400', '', '0', '0', 'M', '102.1164404304', '26.89696797612', '3', 'tr_0 tr_510000 tr_510400 ', '0');
INSERT INTO `provinces` VALUES ('510422', '盐边县', '510400', '', '0', '0', 'Y', '101.86049854831', '26.688767481964', '3', 'tr_0 tr_510000 tr_510400 ', '0');
INSERT INTO `provinces` VALUES ('510502', '江阳区', '510500', '', '0', '0', 'J', '105.44154513382', '28.884671972905', '3', 'tr_0 tr_510000 tr_510500 ', '0');
INSERT INTO `provinces` VALUES ('510503', '纳溪区', '510500', '', '0', '0', 'N', '105.37740854586', '28.779359901658', '3', 'tr_0 tr_510000 tr_510500 ', '0');
INSERT INTO `provinces` VALUES ('510504', '龙马潭区', '510500', '', '0', '0', 'L', '105.4445442166', '28.919012274486', '3', 'tr_0 tr_510000 tr_510500 ', '0');
INSERT INTO `provinces` VALUES ('510521', '泸县', '510500', '', '0', '0', 'L', '105.38845608667', '29.157626295708', '3', 'tr_0 tr_510000 tr_510500 ', '0');
INSERT INTO `provinces` VALUES ('510522', '合江县', '510500', '', '0', '0', 'H', '105.83843195885', '28.81779304284', '3', 'tr_0 tr_510000 tr_510500 ', '0');
INSERT INTO `provinces` VALUES ('510524', '叙永县', '510500', '', '0', '0', 'X', '105.45150761142', '28.161714341911', '3', 'tr_0 tr_510000 tr_510500 ', '0');
INSERT INTO `provinces` VALUES ('510525', '古蔺县', '510500', '', '0', '0', 'G', '105.81947079565', '28.044745368759', '3', 'tr_0 tr_510000 tr_510500 ', '0');
INSERT INTO `provinces` VALUES ('510603', '旌阳区', '510600', '', '0', '0', 'J', '104.42343882821', '31.148596291553', '3', 'tr_0 tr_510000 tr_510600 ', '0');
INSERT INTO `provinces` VALUES ('510604', '罗江区', '510600', '', '0', '0', 'L', '104.51741416083', '31.324178639826', '3', 'tr_0 tr_510000 tr_510600 ', '0');
INSERT INTO `provinces` VALUES ('510623', '中江县', '510600', '', '0', '0', 'Z', '104.68553015058', '31.038953695302', '3', 'tr_0 tr_510000 tr_510600 ', '0');
INSERT INTO `provinces` VALUES ('510681', '广汉市', '510600', '', '0', '0', 'G', '104.28842189311', '30.982415239743', '3', 'tr_0 tr_510000 tr_510600 ', '0');
INSERT INTO `provinces` VALUES ('510682', '什邡市', '510600', '', '0', '0', 'S', '104.17442710355', '31.132889048238', '3', 'tr_0 tr_510000 tr_510600 ', '0');
INSERT INTO `provinces` VALUES ('510683', '绵竹市', '510600', '', '0', '0', 'M', '104.227609305', '31.343592258211', '3', 'tr_0 tr_510000 tr_510600 ', '0');
INSERT INTO `provinces` VALUES ('510703', '涪城区', '510700', '', '0', '0', 'F', '104.76342033491', '31.46131438858', '3', 'tr_0 tr_510000 tr_510700 ', '0');
INSERT INTO `provinces` VALUES ('510704', '游仙区', '510700', '', '0', '0', 'Y', '104.77242899171', '31.479904474058', '3', 'tr_0 tr_510000 tr_510700 ', '0');
INSERT INTO `provinces` VALUES ('510705', '安州区', '510700', '', '0', '0', 'A', '104.5735550213', '31.540750527876', '3', 'tr_0 tr_510000 tr_510700 ', '0');
INSERT INTO `provinces` VALUES ('510722', '三台县', '510700', '', '0', '0', 'S', '105.10148979833', '31.101585571238', '3', 'tr_0 tr_510000 tr_510700 ', '0');
INSERT INTO `provinces` VALUES ('510723', '盐亭县', '510700', '', '0', '0', 'Y', '105.39550321547', '31.214318764837', '3', 'tr_0 tr_510000 tr_510700 ', '0');
INSERT INTO `provinces` VALUES ('510725', '梓潼县', '510700', '', '0', '0', 'Z', '105.17756684281', '31.648313467681', '3', 'tr_0 tr_510000 tr_510700 ', '0');
INSERT INTO `provinces` VALUES ('510726', '北川羌族自治县', '510700', '', '0', '0', 'B', '104.36158555316', '31.963084103415', '3', 'tr_0 tr_510000 tr_510700 ', '0');
INSERT INTO `provinces` VALUES ('510727', '平武县', '510700', '', '0', '0', 'P', '104.53542150325', '32.414681977696', '3', 'tr_0 tr_510000 tr_510700 ', '0');
INSERT INTO `provinces` VALUES ('510781', '江油市', '510700', '', '0', '0', 'J', '104.75241160088', '31.784128193388', '3', 'tr_0 tr_510000 tr_510700 ', '0');
INSERT INTO `provinces` VALUES ('510802', '利州区', '510800', '', '0', '0', 'L', '105.85242622329', '32.440207812726', '3', 'tr_0 tr_510000 tr_510800 ', '0');
INSERT INTO `provinces` VALUES ('510811', '昭化区', '510800', '', '0', '0', 'Z', '105.96941892782', '32.329618490159', '3', 'tr_0 tr_510000 tr_510800 ', '0');
INSERT INTO `provinces` VALUES ('510812', '朝天区', '510800', '', '0', '0', 'C', '105.8965888086', '32.649726240308', '3', 'tr_0 tr_510000 tr_510800 ', '0');
INSERT INTO `provinces` VALUES ('510821', '旺苍县', '510800', '', '0', '0', 'W', '106.29649124536', '32.235097383079', '3', 'tr_0 tr_510000 tr_510800 ', '0');
INSERT INTO `provinces` VALUES ('510822', '青川县', '510800', '', '0', '0', 'Q', '105.24540705459', '32.5816168573', '3', 'tr_0 tr_510000 tr_510800 ', '0');
INSERT INTO `provinces` VALUES ('510823', '剑阁县', '510800', '', '0', '0', 'J', '105.53157601887', '32.293478516773', '3', 'tr_0 tr_510000 tr_510800 ', '0');
INSERT INTO `provinces` VALUES ('510824', '苍溪县', '510800', '', '0', '0', 'C', '105.9414826146', '31.738684400617', '3', 'tr_0 tr_510000 tr_510800 ', '0');
INSERT INTO `provinces` VALUES ('510903', '船山区', '510900', '', '0', '0', 'C', '105.5745228375', '30.531470607829', '3', 'tr_0 tr_510000 tr_510900 ', '0');
INSERT INTO `provinces` VALUES ('510904', '安居区', '510900', '', '0', '0', 'A', '105.46246730988', '30.361496469746', '3', 'tr_0 tr_510000 tr_510900 ', '0');
INSERT INTO `provinces` VALUES ('510921', '蓬溪县', '510900', '', '0', '0', 'P', '105.71344605411', '30.763751441791', '3', 'tr_0 tr_510000 tr_510900 ', '0');
INSERT INTO `provinces` VALUES ('510922', '射洪县', '510900', '', '0', '0', 'S', '105.39450950992', '30.877138522337', '3', 'tr_0 tr_510000 tr_510900 ', '0');
INSERT INTO `provinces` VALUES ('510923', '大英县', '510900', '', '0', '0', 'D', '105.24340392313', '30.600810129921', '3', 'tr_0 tr_510000 tr_510900 ', '0');
INSERT INTO `provinces` VALUES ('511002', '市中区', '511000', '', '0', '0', 'S', '105.07457421786', '29.592710148736', '3', 'tr_0 tr_510000 tr_511000 ', '0');
INSERT INTO `provinces` VALUES ('511011', '东兴区', '511000', '', '0', '0', 'D', '105.08254748773', '29.598485728583', '3', 'tr_0 tr_510000 tr_511000 ', '0');
INSERT INTO `provinces` VALUES ('511024', '威远县', '511000', '', '0', '0', 'W', '104.6744982286', '29.533634931412', '3', 'tr_0 tr_510000 tr_511000 ', '0');
INSERT INTO `provinces` VALUES ('511025', '资中县', '511000', '', '0', '0', 'Z', '104.85849482242', '29.770234032565', '3', 'tr_0 tr_510000 tr_511000 ', '0');
INSERT INTO `provinces` VALUES ('511071', '内江经济开发区', '511000', '', '0', '0', 'N', '105.064588025', '29.58588653832', '3', 'tr_0 tr_510000 tr_511000 ', '0');
INSERT INTO `provinces` VALUES ('511083', '隆昌市', '511000', '', '0', '0', 'L', '105.29457175243', '29.345244662083', '3', 'tr_0 tr_510000 tr_511000 ', '0');
INSERT INTO `provinces` VALUES ('511102', '市中区', '511100', '', '0', '0', 'S', '103.76755865552', '29.561363941633', '3', 'tr_0 tr_510000 tr_511100 ', '0');
INSERT INTO `provinces` VALUES ('511111', '沙湾区', '511100', '', '0', '0', 'S', '103.55643566073', '29.419272499245', '3', 'tr_0 tr_510000 tr_511100 ', '0');
INSERT INTO `provinces` VALUES ('511112', '五通桥区', '511100', '', '0', '0', 'W', '103.82445508074', '29.413185014439', '3', 'tr_0 tr_510000 tr_511100 ', '0');
INSERT INTO `provinces` VALUES ('511113', '金口河区', '511100', '', '0', '0', 'J', '103.08539389554', '29.250803570124', '3', 'tr_0 tr_510000 tr_511100 ', '0');
INSERT INTO `provinces` VALUES ('511123', '犍为县', '511100', '', '0', '0', '', '', '', '3', 'tr_0 tr_510000 tr_511100 ', '0');
INSERT INTO `provinces` VALUES ('511124', '井研县', '511100', '', '0', '0', 'J', '104.07651071353', '29.65730305908', '3', 'tr_0 tr_510000 tr_511100 ', '0');
INSERT INTO `provinces` VALUES ('511126', '夹江县', '511100', '', '0', '0', 'J', '103.57841009994', '29.743846302985', '3', 'tr_0 tr_510000 tr_511100 ', '0');
INSERT INTO `provinces` VALUES ('511129', '沐川县', '511100', '', '0', '0', 'M', '103.90846703743', '28.962888278216', '3', 'tr_0 tr_510000 tr_511100 ', '0');
INSERT INTO `provinces` VALUES ('511132', '峨边彝族自治县', '511100', '', '0', '0', 'E', '103.26857725338', '29.236089109563', '3', 'tr_0 tr_510000 tr_511100 ', '0');
INSERT INTO `provinces` VALUES ('511133', '马边彝族自治县', '511100', '', '0', '0', 'M', '103.55245419105', '28.841736014812', '3', 'tr_0 tr_510000 tr_511100 ', '0');
INSERT INTO `provinces` VALUES ('511181', '峨眉山市', '511100', '', '0', '0', 'E', '103.4915455741', '29.606975527462', '3', 'tr_0 tr_510000 tr_511100 ', '0');
INSERT INTO `provinces` VALUES ('511302', '顺庆区', '511300', '', '0', '0', 'S', '106.09841065838', '30.802753098595', '3', 'tr_0 tr_510000 tr_511300 ', '0');
INSERT INTO `provinces` VALUES ('511303', '高坪区', '511300', '', '0', '0', 'G', '106.12554047291', '30.787254931592', '3', 'tr_0 tr_510000 tr_511300 ', '0');
INSERT INTO `provinces` VALUES ('511304', '嘉陵区', '511300', '', '0', '0', 'J', '106.07843297265', '30.764895560139', '3', 'tr_0 tr_510000 tr_511300 ', '0');
INSERT INTO `provinces` VALUES ('511321', '南部县', '511300', '', '0', '0', 'N', '106.04357826971', '31.353705301526', '3', 'tr_0 tr_510000 tr_511300 ', '0');
INSERT INTO `provinces` VALUES ('511322', '营山县', '511300', '', '0', '0', 'Y', '106.57240802852', '31.083002970199', '3', 'tr_0 tr_510000 tr_511300 ', '0');
INSERT INTO `provinces` VALUES ('511323', '蓬安县', '511300', '', '0', '0', 'P', '106.41848194209', '31.034630778271', '3', 'tr_0 tr_510000 tr_511300 ', '0');
INSERT INTO `provinces` VALUES ('511324', '仪陇县', '511300', '', '0', '0', 'Y', '106.30943016844', '31.277597359981', '3', 'tr_0 tr_510000 tr_511300 ', '0');
INSERT INTO `provinces` VALUES ('511325', '西充县', '511300', '', '0', '0', 'X', '105.90761137653', '31.000688020792', '3', 'tr_0 tr_510000 tr_511300 ', '0');
INSERT INTO `provinces` VALUES ('511381', '阆中市', '511300', '', '0', '0', 'L', '106.01156526642', '31.56407455364', '3', 'tr_0 tr_510000 tr_511300 ', '0');
INSERT INTO `provinces` VALUES ('511402', '东坡区', '511400', '', '0', '0', 'D', '103.83852480217', '30.048272134435', '3', 'tr_0 tr_510000 tr_511400 ', '0');
INSERT INTO `provinces` VALUES ('511403', '彭山区', '511400', '', '0', '0', 'P', '103.87955823007', '30.19885441686', '3', 'tr_0 tr_510000 tr_511400 ', '0');
INSERT INTO `provinces` VALUES ('511421', '仁寿县', '511400', '', '0', '0', 'R', '104.14047690443', '30.001663984301', '3', 'tr_0 tr_510000 tr_511400 ', '0');
INSERT INTO `provinces` VALUES ('511423', '洪雅县', '511400', '', '0', '0', 'H', '103.37960224488', '29.910615837469', '3', 'tr_0 tr_510000 tr_511400 ', '0');
INSERT INTO `provinces` VALUES ('511424', '丹棱县', '511400', '', '0', '0', 'D', '103.51958331729', '30.020362794872', '3', 'tr_0 tr_510000 tr_511400 ', '0');
INSERT INTO `provinces` VALUES ('511425', '青神县', '511400', '', '0', '0', 'Q', '103.85355883179', '29.837054743717', '3', 'tr_0 tr_510000 tr_511400 ', '0');
INSERT INTO `provinces` VALUES ('511502', '翠屏区', '511500', '', '0', '0', 'C', '104.62643798553', '28.772051773027', '3', 'tr_0 tr_510000 tr_511500 ', '0');
INSERT INTO `provinces` VALUES ('511503', '南溪区', '511500', '', '0', '0', 'N', '104.97651330198', '28.851503648027', '3', 'tr_0 tr_510000 tr_511500 ', '0');
INSERT INTO `provinces` VALUES ('511504', '叙州区', '511500', '', '0', '0', 'X', '104.53944275624', '28.696246394752', '3', 'tr_0 tr_510000 tr_511500 ', '0');
INSERT INTO `provinces` VALUES ('511523', '江安县', '511500', '', '0', '0', 'J', '105.07359488519', '28.729609721855', '3', 'tr_0 tr_510000 tr_511500 ', '0');
INSERT INTO `provinces` VALUES ('511524', '长宁县', '511500', '', '0', '0', 'Z', '104.92756445509', '28.588133452699', '3', 'tr_0 tr_510000 tr_511500 ', '0');
INSERT INTO `provinces` VALUES ('511525', '高县', '511500', '', '0', '0', 'G', '104.52441132032', '28.442510804102', '3', 'tr_0 tr_510000 tr_511500 ', '0');
INSERT INTO `provinces` VALUES ('511526', '珙县', '511500', '', '0', '0', 'G', '104.71557459549', '28.444319765248', '3', 'tr_0 tr_510000 tr_511500 ', '0');
INSERT INTO `provinces` VALUES ('511527', '筠连县', '511500', '', '0', '0', 'Y', '104.51740642378', '28.170174457648', '3', 'tr_0 tr_510000 tr_511500 ', '0');
INSERT INTO `provinces` VALUES ('511528', '兴文县', '511500', '', '0', '0', 'X', '105.24240230064', '28.309904884117', '3', 'tr_0 tr_510000 tr_511500 ', '0');
INSERT INTO `provinces` VALUES ('511529', '屏山县', '511500', '', '0', '0', 'P', '104.35267533908', '28.834274966477', '3', 'tr_0 tr_510000 tr_511500 ', '0');
INSERT INTO `provinces` VALUES ('511602', '广安区', '511600', '', '0', '0', 'G', '106.64853115608', '30.479768100142', '3', 'tr_0 tr_510000 tr_511600 ', '0');
INSERT INTO `provinces` VALUES ('511603', '前锋区', '511600', '', '0', '0', 'Q', '106.90447959588', '30.506435157767', '3', 'tr_0 tr_510000 tr_511600 ', '0');
INSERT INTO `provinces` VALUES ('511621', '岳池县', '511600', '', '0', '0', 'Y', '106.44641061972', '30.54411986458', '3', 'tr_0 tr_510000 tr_511600 ', '0');
INSERT INTO `provinces` VALUES ('511622', '武胜县', '511600', '', '0', '0', 'W', '106.3024617431', '30.355495660378', '3', 'tr_0 tr_510000 tr_511600 ', '0');
INSERT INTO `provinces` VALUES ('511623', '邻水县', '511600', '', '0', '0', 'L', '106.93640258896', '30.341072518332', '3', 'tr_0 tr_510000 tr_511600 ', '0');
INSERT INTO `provinces` VALUES ('511681', '华蓥市', '511600', '', '0', '0', 'H', '106.78946181601', '30.396307084289', '3', 'tr_0 tr_510000 tr_511600 ', '0');
INSERT INTO `provinces` VALUES ('511702', '通川区', '511700', '', '0', '0', 'T', '107.51144711201', '31.220931804105', '3', 'tr_0 tr_510000 tr_511700 ', '0');
INSERT INTO `provinces` VALUES ('511703', '达川区', '511700', '', '0', '0', 'D', '107.51841059667', '31.202393360554', '3', 'tr_0 tr_510000 tr_511700 ', '0');
INSERT INTO `provinces` VALUES ('511722', '宣汉县', '511700', '', '0', '0', 'X', '107.7335335663', '31.359754823662', '3', 'tr_0 tr_510000 tr_511700 ', '0');
INSERT INTO `provinces` VALUES ('511723', '开江县', '511700', '', '0', '0', 'K', '107.87542487414', '31.089372149066', '3', 'tr_0 tr_510000 tr_511700 ', '0');
INSERT INTO `provinces` VALUES ('511724', '大竹县', '511700', '', '0', '0', 'D', '107.21157970735', '30.74207661791', '3', 'tr_0 tr_510000 tr_511700 ', '0');
INSERT INTO `provinces` VALUES ('511725', '渠县', '511700', '', '0', '0', 'Q', '106.97958296702', '30.842299283481', '3', 'tr_0 tr_510000 tr_511700 ', '0');
INSERT INTO `provinces` VALUES ('511771', '达州经济开发区', '511700', '', '0', '0', 'D', '107.47459385898', '31.214307723927', '3', 'tr_0 tr_510000 tr_511700 ', '0');
INSERT INTO `provinces` VALUES ('511781', '万源市', '511700', '', '0', '0', 'W', '108.04154069684', '32.087420847789', '3', 'tr_0 tr_510000 tr_511700 ', '0');
INSERT INTO `provinces` VALUES ('511802', '雨城区', '511800', '', '0', '0', 'Y', '103.03957520533', '30.011061644393', '3', 'tr_0 tr_510000 tr_511800 ', '0');
INSERT INTO `provinces` VALUES ('511803', '名山区', '511800', '', '0', '0', 'M', '103.1154857938', '30.075913663382', '3', 'tr_0 tr_510000 tr_511800 ', '0');
INSERT INTO `provinces` VALUES ('511822', '荥经县', '511800', '', '0', '0', 'X', '102.85343551293', '29.799193512656', '3', 'tr_0 tr_510000 tr_511800 ', '0');
INSERT INTO `provinces` VALUES ('511823', '汉源县', '511800', '', '0', '0', 'H', '102.65857589024', '29.350217385987', '3', 'tr_0 tr_510000 tr_511800 ', '0');
INSERT INTO `provinces` VALUES ('511824', '石棉县', '511800', '', '0', '0', 'S', '102.36640453848', '29.23430487759', '3', 'tr_0 tr_510000 tr_511800 ', '0');
INSERT INTO `provinces` VALUES ('511825', '天全县', '511800', '', '0', '0', 'T', '102.76453022767', '30.072472953275', '3', 'tr_0 tr_510000 tr_511800 ', '0');
INSERT INTO `provinces` VALUES ('511826', '芦山县', '511800', '', '0', '0', 'L', '102.93452771831', '30.149873189563', '3', 'tr_0 tr_510000 tr_511800 ', '0');
INSERT INTO `provinces` VALUES ('511827', '宝兴县', '511800', '', '0', '0', 'B', '102.82148423429', '30.374082112445', '3', 'tr_0 tr_510000 tr_511800 ', '0');
INSERT INTO `provinces` VALUES ('511902', '巴州区', '511900', '', '0', '0', 'B', '106.77551310771', '31.857685602645', '3', 'tr_0 tr_510000 tr_511900 ', '0');
INSERT INTO `provinces` VALUES ('511903', '恩阳区', '511900', '', '0', '0', 'E', '106.63558190249', '31.802614044176', '3', 'tr_0 tr_510000 tr_511900 ', '0');
INSERT INTO `provinces` VALUES ('511921', '通江县', '511900', '', '0', '0', 'T', '107.25151684321', '31.917714346881', '3', 'tr_0 tr_510000 tr_511900 ', '0');
INSERT INTO `provinces` VALUES ('511922', '南江县', '511900', '', '0', '0', 'N', '106.83448345088', '32.352531654165', '3', 'tr_0 tr_510000 tr_511900 ', '0');
INSERT INTO `provinces` VALUES ('511923', '平昌县', '511900', '', '0', '0', 'P', '107.11059310023', '31.566185810095', '3', 'tr_0 tr_510000 tr_511900 ', '0');
INSERT INTO `provinces` VALUES ('511971', '巴中经济开发区', '511900', '', '0', '0', 'B', '106.75158530316', '31.872888585957', '3', 'tr_0 tr_510000 tr_511900 ', '0');
INSERT INTO `provinces` VALUES ('512002', '雁江区', '512000', '', '0', '0', 'Y', '104.65842441063', '30.123753456785', '3', 'tr_0 tr_510000 tr_512000 ', '0');
INSERT INTO `provinces` VALUES ('512021', '安岳县', '512000', '', '0', '0', 'A', '105.34245423273', '30.103392734494', '3', 'tr_0 tr_510000 tr_512000 ', '0');
INSERT INTO `provinces` VALUES ('512022', '乐至县', '512000', '', '0', '0', 'L', '105.02747697007', '30.282348346', '3', 'tr_0 tr_510000 tr_512000 ', '0');
INSERT INTO `provinces` VALUES ('513201', '马尔康市', '513200', '', '0', '0', 'M', '102.21350208208', '31.911747955648', '3', 'tr_0 tr_510000 tr_513200 ', '0');
INSERT INTO `provinces` VALUES ('513221', '汶川县', '513200', '', '0', '0', 'W', '103.59651788422', '31.483005320468', '3', 'tr_0 tr_510000 tr_513200 ', '0');
INSERT INTO `provinces` VALUES ('513222', '理县', '513200', '', '0', '0', 'L', '102.23141546175', '31.905511577267', '3', 'tr_0 tr_510000 tr_513200 ', '0');
INSERT INTO `provinces` VALUES ('513223', '茂县', '513200', '', '0', '0', 'M', '102.23141546175', '31.905511577267', '3', 'tr_0 tr_510000 tr_513200 ', '0');
INSERT INTO `provinces` VALUES ('513224', '松潘县', '513200', '', '0', '0', 'S', '103.61057968918', '32.661796559853', '3', 'tr_0 tr_510000 tr_513200 ', '0');
INSERT INTO `provinces` VALUES ('513225', '九寨沟县', '513200', '', '0', '0', 'J', '104.24954673403', '33.257591509496', '3', 'tr_0 tr_510000 tr_513200 ', '0');
INSERT INTO `provinces` VALUES ('513226', '金川县', '513200', '', '0', '0', 'J', '102.07061042122', '31.482005950337', '3', 'tr_0 tr_510000 tr_513200 ', '0');
INSERT INTO `provinces` VALUES ('513227', '小金县', '513200', '', '0', '0', 'X', '102.36942635928', '31.002208697062', '3', 'tr_0 tr_510000 tr_513200 ', '0');
INSERT INTO `provinces` VALUES ('513228', '黑水县', '513200', '', '0', '0', 'H', '102.99651735613', '32.067805449368', '3', 'tr_0 tr_510000 tr_513200 ', '0');
INSERT INTO `provinces` VALUES ('513230', '壤塘县', '513200', '', '0', '0', 'R', '100.98558348726', '32.271093316269', '3', 'tr_0 tr_510000 tr_513200 ', '0');
INSERT INTO `provinces` VALUES ('513231', '阿坝县', '513200', '', '0', '0', 'A', '101.71360970816', '32.908220918625', '3', 'tr_0 tr_510000 tr_513200 ', '0');
INSERT INTO `provinces` VALUES ('513232', '若尔盖县', '513200', '', '0', '0', 'R', '102.97439065413', '33.584376654702', '3', 'tr_0 tr_510000 tr_513200 ', '0');
INSERT INTO `provinces` VALUES ('513233', '红原县', '513200', '', '0', '0', 'H', '102.55061520946', '32.796605278762', '3', 'tr_0 tr_510000 tr_513200 ', '0');
INSERT INTO `provinces` VALUES ('513301', '康定市', '513300', '', '0', '0', 'K', '101.96355522139', '30.004407384262', '3', 'tr_0 tr_510000 tr_513300 ', '0');
INSERT INTO `provinces` VALUES ('513322', '泸定县', '513300', '', '0', '0', 'L', '102.24143209631', '29.920401664951', '3', 'tr_0 tr_510000 tr_513300 ', '0');
INSERT INTO `provinces` VALUES ('513323', '丹巴县', '513300', '', '0', '0', 'D', '101.89643706759', '30.88476979933', '3', 'tr_0 tr_510000 tr_513300 ', '0');
INSERT INTO `provinces` VALUES ('513324', '九龙县', '513300', '', '0', '0', 'J', '101.51341566718', '29.006431902925', '3', 'tr_0 tr_510000 tr_513300 ', '0');
INSERT INTO `provinces` VALUES ('513325', '雅江县', '513300', '', '0', '0', 'Y', '101.02050035294', '30.037568967864', '3', 'tr_0 tr_510000 tr_513300 ', '0');
INSERT INTO `provinces` VALUES ('513326', '道孚县', '513300', '', '0', '0', 'D', '101.13154034619', '30.985326277402', '3', 'tr_0 tr_510000 tr_513300 ', '0');
INSERT INTO `provinces` VALUES ('513327', '炉霍县', '513300', '', '0', '0', 'L', '100.68239693357', '31.397991882882', '3', 'tr_0 tr_510000 tr_513300 ', '0');
INSERT INTO `provinces` VALUES ('513328', '甘孜县', '513300', '', '0', '0', 'G', '99.999210350851', '31.628956694034', '3', 'tr_0 tr_510000 tr_513300 ', '0');
INSERT INTO `provinces` VALUES ('513329', '新龙县', '513300', '', '0', '0', 'X', '100.31839824093', '30.945469525266', '3', 'tr_0 tr_510000 tr_513300 ', '0');
INSERT INTO `provinces` VALUES ('513330', '德格县', '513300', '', '0', '0', 'D', '98.587401611354', '31.812106494713', '3', 'tr_0 tr_510000 tr_513300 ', '0');
INSERT INTO `provinces` VALUES ('513331', '白玉县', '513300', '', '0', '0', 'B', '98.83110021824', '31.215314448788', '3', 'tr_0 tr_510000 tr_513300 ', '0');
INSERT INTO `provinces` VALUES ('513332', '石渠县', '513300', '', '0', '0', 'S', '98.109480622408', '32.984003420478', '3', 'tr_0 tr_510000 tr_513300 ', '0');
INSERT INTO `provinces` VALUES ('513333', '色达县', '513300', '', '0', '0', 'S', '100.33941364918', '32.274330413227', '3', 'tr_0 tr_510000 tr_513300 ', '0');
INSERT INTO `provinces` VALUES ('513334', '理塘县', '513300', '', '0', '0', 'L', '100.27557457998', '30.000030621751', '3', 'tr_0 tr_510000 tr_513300 ', '0');
INSERT INTO `provinces` VALUES ('513335', '巴塘县', '513300', '', '0', '0', 'B', '99.11672669582', '30.011661707376', '3', 'tr_0 tr_510000 tr_513300 ', '0');
INSERT INTO `provinces` VALUES ('513336', '乡城县', '513300', '', '0', '0', 'X', '99.805059570922', '28.936733475224', '3', 'tr_0 tr_510000 tr_513300 ', '0');
INSERT INTO `provinces` VALUES ('513337', '稻城县', '513300', '', '0', '0', 'D', '100.3044615597', '29.043121558126', '3', 'tr_0 tr_510000 tr_513300 ', '0');
INSERT INTO `provinces` VALUES ('513338', '得荣县', '513300', '', '0', '0', 'D', '99.292984198181', '28.718780051461', '3', 'tr_0 tr_510000 tr_513300 ', '0');
INSERT INTO `provinces` VALUES ('513401', '西昌市', '513400', '', '0', '0', 'X', '102.27148382917', '27.900580896264', '3', 'tr_0 tr_510000 tr_513400 ', '0');
INSERT INTO `provinces` VALUES ('513422', '木里藏族自治县', '513400', '', '0', '0', 'M', '101.28639697674', '27.93459855924', '3', 'tr_0 tr_510000 tr_513400 ', '0');
INSERT INTO `provinces` VALUES ('513423', '盐源县', '513400', '', '0', '0', 'Y', '101.51542912915', '27.428154867741', '3', 'tr_0 tr_510000 tr_513400 ', '0');
INSERT INTO `provinces` VALUES ('513424', '德昌县', '513400', '', '0', '0', 'D', '102.18259551085', '27.408504192994', '3', 'tr_0 tr_510000 tr_513400 ', '0');
INSERT INTO `provinces` VALUES ('513425', '会理县', '513400', '', '0', '0', 'H', '102.25143634511', '26.661199778427', '3', 'tr_0 tr_510000 tr_513400 ', '0');
INSERT INTO `provinces` VALUES ('513426', '会东县', '513400', '', '0', '0', 'H', '102.5844621823', '26.640823775829', '3', 'tr_0 tr_510000 tr_513400 ', '0');
INSERT INTO `provinces` VALUES ('513427', '宁南县', '513400', '', '0', '0', 'N', '102.76252636654', '27.064605070116', '3', 'tr_0 tr_510000 tr_513400 ', '0');
INSERT INTO `provinces` VALUES ('513428', '普格县', '513400', '', '0', '0', 'P', '102.54659671863', '27.381996213807', '3', 'tr_0 tr_510000 tr_513400 ', '0');
INSERT INTO `provinces` VALUES ('513429', '布拖县', '513400', '', '0', '0', 'B', '102.818478493', '27.7121287338', '3', 'tr_0 tr_510000 tr_513400 ', '0');
INSERT INTO `provinces` VALUES ('513430', '金阳县', '513400', '', '0', '0', 'J', '103.25454895521', '27.702144511749', '3', 'tr_0 tr_510000 tr_513400 ', '0');
INSERT INTO `provinces` VALUES ('513431', '昭觉县', '513400', '', '0', '0', 'Z', '102.84942278222', '28.020506268006', '3', 'tr_0 tr_510000 tr_513400 ', '0');
INSERT INTO `provinces` VALUES ('513432', '喜德县', '513400', '', '0', '0', 'X', '102.41956715684', '28.312709832521', '3', 'tr_0 tr_510000 tr_513400 ', '0');
INSERT INTO `provinces` VALUES ('513433', '冕宁县', '513400', '', '0', '0', 'M', '102.18357457402', '28.55529444536', '3', 'tr_0 tr_510000 tr_513400 ', '0');
INSERT INTO `provinces` VALUES ('513434', '越西县', '513400', '', '0', '0', 'Y', '102.5144744814', '28.645827564326', '3', 'tr_0 tr_510000 tr_513400 ', '0');
INSERT INTO `provinces` VALUES ('513435', '甘洛县', '513400', '', '0', '0', 'G', '102.77859651312', '28.9648231905', '3', 'tr_0 tr_510000 tr_513400 ', '0');
INSERT INTO `provinces` VALUES ('513436', '美姑县', '513400', '', '0', '0', 'M', '103.13858579866', '28.33401962389', '3', 'tr_0 tr_510000 tr_513400 ', '0');
INSERT INTO `provinces` VALUES ('513437', '雷波县', '513400', '', '0', '0', 'L', '103.57842869486', '28.268950617624', '3', 'tr_0 tr_510000 tr_513400 ', '0');
INSERT INTO `provinces` VALUES ('520102', '南明区', '520100', '', '0', '0', 'N', '106.72052763544', '26.574336181539', '3', 'tr_0 tr_520000 tr_520100 ', '0');
INSERT INTO `provinces` VALUES ('520103', '云岩区', '520100', '', '0', '0', 'Y', '106.73053475882', '26.610381076426', '3', 'tr_0 tr_520000 tr_520100 ', '0');
INSERT INTO `provinces` VALUES ('520111', '花溪区', '520100', '', '0', '0', 'H', '106.6764407773', '26.41587945643', '3', 'tr_0 tr_520000 tr_520100 ', '0');
INSERT INTO `provinces` VALUES ('520112', '乌当区', '520100', '', '0', '0', 'W', '106.75755803432', '26.636529135598', '3', 'tr_0 tr_520000 tr_520100 ', '0');
INSERT INTO `provinces` VALUES ('520113', '白云区', '520100', '', '0', '0', 'B', '106.62959683989', '26.683588499124', '3', 'tr_0 tr_520000 tr_520100 ', '0');
INSERT INTO `provinces` VALUES ('520115', '观山湖区', '520100', '', '0', '0', 'G', '106.60953255751', '26.623894296899', '3', 'tr_0 tr_520000 tr_520100 ', '0');
INSERT INTO `provinces` VALUES ('520121', '开阳县', '520100', '', '0', '0', 'K', '106.97155955928', '27.063673573951', '3', 'tr_0 tr_520000 tr_520100 ', '0');
INSERT INTO `provinces` VALUES ('520122', '息烽县', '520100', '', '0', '0', 'X', '106.74756178044', '27.096475267062', '3', 'tr_0 tr_520000 tr_520100 ', '0');
INSERT INTO `provinces` VALUES ('520123', '修文县', '520100', '', '0', '0', 'X', '106.59849220314', '26.844862447594', '3', 'tr_0 tr_520000 tr_520100 ', '0');
INSERT INTO `provinces` VALUES ('520181', '清镇市', '520100', '', '0', '0', 'Q', '106.47752261032', '26.561987898479', '3', 'tr_0 tr_520000 tr_520100 ', '0');
INSERT INTO `provinces` VALUES ('520201', '钟山区', '520200', '', '0', '0', 'Z', '104.85052981696', '26.580704079622', '3', 'tr_0 tr_520000 tr_520200 ', '0');
INSERT INTO `provinces` VALUES ('520203', '六枝特区', '520200', '', '0', '0', 'L', '105.48342934686', '26.219214290638', '3', 'tr_0 tr_520000 tr_520200 ', '0');
INSERT INTO `provinces` VALUES ('520221', '水城县', '520200', '', '0', '0', 'S', '104.96456610819', '26.553719763692', '3', 'tr_0 tr_520000 tr_520200 ', '0');
INSERT INTO `provinces` VALUES ('520281', '盘州市', '520200', '', '0', '0', 'P', '104.47858183932', '25.715651258076', '3', 'tr_0 tr_520000 tr_520200 ', '0');
INSERT INTO `provinces` VALUES ('520302', '红花岗区', '520300', '', '0', '0', 'H', '106.90049658668', '27.650870260732', '3', 'tr_0 tr_520000 tr_520300 ', '0');
INSERT INTO `provinces` VALUES ('520303', '汇川区', '520300', '', '0', '0', 'H', '106.94045752761', '27.756343380087', '3', 'tr_0 tr_520000 tr_520300 ', '0');
INSERT INTO `provinces` VALUES ('520304', '播州区', '520300', '', '0', '0', 'B', '106.83650354793', '27.542500878', '3', 'tr_0 tr_520000 tr_520300 ', '0');
INSERT INTO `provinces` VALUES ('520322', '桐梓县', '520300', '', '0', '0', 'T', '106.83248902061', '28.139468384162', '3', 'tr_0 tr_520000 tr_520300 ', '0');
INSERT INTO `provinces` VALUES ('520323', '绥阳县', '520300', '', '0', '0', 'S', '107.19749228819', '27.953080005876', '3', 'tr_0 tr_520000 tr_520300 ', '0');
INSERT INTO `provinces` VALUES ('520324', '正安县', '520300', '', '0', '0', 'Z', '107.4605748906', '28.55909172878', '3', 'tr_0 tr_520000 tr_520300 ', '0');
INSERT INTO `provinces` VALUES ('520325', '道真仡佬族苗族自治县', '520300', '', '0', '0', 'D', '107.61948378781', '28.86864981438', '3', 'tr_0 tr_520000 tr_520300 ', '0');
INSERT INTO `provinces` VALUES ('520326', '务川仡佬族苗族自治县', '520300', '', '0', '0', 'W', '107.90545629257', '28.569077110562', '3', 'tr_0 tr_520000 tr_520300 ', '0');
INSERT INTO `provinces` VALUES ('520327', '凤冈县', '520300', '', '0', '0', 'F', '107.72354763025', '27.960695338965', '3', 'tr_0 tr_520000 tr_520300 ', '0');
INSERT INTO `provinces` VALUES ('520328', '湄潭县', '520300', '', '0', '0', 'M', '107.47259853019', '27.75449836496', '3', 'tr_0 tr_520000 tr_520300 ', '0');
INSERT INTO `provinces` VALUES ('520329', '余庆县', '520300', '', '0', '0', 'Y', '107.91146020728', '27.221379027997', '3', 'tr_0 tr_520000 tr_520300 ', '0');
INSERT INTO `provinces` VALUES ('520330', '习水县', '520300', '', '0', '0', 'X', '106.20342803999', '28.339117886481', '3', 'tr_0 tr_520000 tr_520300 ', '0');
INSERT INTO `provinces` VALUES ('520381', '赤水市', '520300', '', '0', '0', 'C', '105.70348859502', '28.596118908733', '3', 'tr_0 tr_520000 tr_520300 ', '0');
INSERT INTO `provinces` VALUES ('520382', '仁怀市', '520300', '', '0', '0', 'R', '106.40752655518', '27.797752158543', '3', 'tr_0 tr_520000 tr_520300 ', '0');
INSERT INTO `provinces` VALUES ('450702', '钦南区', '450700', '', '0', '0', 'Q', '108.66454861267', '21.945972440989', '3', 'tr_0 tr_450000 tr_450700 ', '0');
INSERT INTO `provinces` VALUES ('450703', '钦北区', '450700', '', '0', '0', 'Q', '108.63851257493', '22.020367050196', '3', 'tr_0 tr_450000 tr_450700 ', '0');
INSERT INTO `provinces` VALUES ('450721', '灵山县', '450700', '', '0', '0', 'L', '109.29747796631', '22.422413326701', '3', 'tr_0 tr_450000 tr_450700 ', '0');
INSERT INTO `provinces` VALUES ('450722', '浦北县', '450700', '', '0', '0', 'P', '109.5634229294', '22.277822326937', '3', 'tr_0 tr_450000 tr_450700 ', '0');
INSERT INTO `provinces` VALUES ('520402', '西秀区', '520400', '', '0', '0', 'X', '105.97240632053', '26.251497663244', '3', 'tr_0 tr_520000 tr_520400 ', '0');
INSERT INTO `provinces` VALUES ('520403', '平坝区', '520400', '', '0', '0', 'P', '106.26358378709', '26.411186471257', '3', 'tr_0 tr_520000 tr_520400 ', '0');
INSERT INTO `provinces` VALUES ('520422', '普定县', '520400', '', '0', '0', 'P', '105.74848570614', '26.308233451347', '3', 'tr_0 tr_520000 tr_520400 ', '0');
INSERT INTO `provinces` VALUES ('520423', '镇宁布依族苗族自治县', '520400', '', '0', '0', 'Z', '105.77658344485', '26.063829083032', '3', 'tr_0 tr_520000 tr_520400 ', '0');
INSERT INTO `provinces` VALUES ('520424', '关岭布依族苗族自治县', '520400', '', '0', '0', 'G', '105.62547597168', '25.949877045969', '3', 'tr_0 tr_520000 tr_520400 ', '0');
INSERT INTO `provinces` VALUES ('520425', '紫云苗族布依族自治县', '520400', '', '0', '0', 'Z', '106.09041375093', '25.757408728958', '3', 'tr_0 tr_520000 tr_520400 ', '0');
INSERT INTO `provinces` VALUES ('520502', '七星关区', '520500', '', '0', '0', 'Q', '105.31158071811', '27.304095223427', '3', 'tr_0 tr_520000 tr_520500 ', '0');
INSERT INTO `provinces` VALUES ('520521', '大方县', '520500', '', '0', '0', 'D', '105.61845131242', '27.147060750626', '3', 'tr_0 tr_520000 tr_520500 ', '0');
INSERT INTO `provinces` VALUES ('520522', '黔西县', '520500', '', '0', '0', 'Q', '106.03857397726', '27.014344747084', '3', 'tr_0 tr_520000 tr_520500 ', '0');
INSERT INTO `provinces` VALUES ('520523', '金沙县', '520500', '', '0', '0', 'J', '106.22644163901', '27.465354872614', '3', 'tr_0 tr_520000 tr_520500 ', '0');
INSERT INTO `provinces` VALUES ('520524', '织金县', '520500', '', '0', '0', 'Z', '105.77758954702', '26.669221885659', '3', 'tr_0 tr_520000 tr_520500 ', '0');
INSERT INTO `provinces` VALUES ('520525', '纳雍县', '520500', '', '0', '0', 'N', '105.38948662276', '26.783717229132', '3', 'tr_0 tr_520000 tr_520500 ', '0');
INSERT INTO `provinces` VALUES ('520526', '威宁彝族回族苗族自治县', '520500', '', '0', '0', 'W', '104.25948063398', '26.879247190553', '3', 'tr_0 tr_520000 tr_520500 ', '0');
INSERT INTO `provinces` VALUES ('520527', '赫章县', '520500', '', '0', '0', 'H', '104.73351582262', '27.129051675142', '3', 'tr_0 tr_520000 tr_520500 ', '0');
INSERT INTO `provinces` VALUES ('520602', '碧江区', '520600', '', '0', '0', 'B', '109.18743536171', '27.696773471802', '3', 'tr_0 tr_520000 tr_520600 ', '0');
INSERT INTO `provinces` VALUES ('520603', '万山区', '520600', '', '0', '0', 'W', '109.22045617394', '27.524647851983', '3', 'tr_0 tr_520000 tr_520600 ', '0');
INSERT INTO `provinces` VALUES ('520621', '江口县', '520600', '', '0', '0', 'J', '108.84540005924', '27.705921695043', '3', 'tr_0 tr_520000 tr_520600 ', '0');
INSERT INTO `provinces` VALUES ('520622', '玉屏侗族自治县', '520600', '', '0', '0', 'Y', '108.920563527', '27.248557881456', '3', 'tr_0 tr_520000 tr_520600 ', '0');
INSERT INTO `provinces` VALUES ('520623', '石阡县', '520600', '', '0', '0', 'S', '108.23046385479', '27.519722059758', '3', 'tr_0 tr_520000 tr_520600 ', '0');
INSERT INTO `provinces` VALUES ('520624', '思南县', '520600', '', '0', '0', 'S', '108.25941731933', '27.944547877977', '3', 'tr_0 tr_520000 tr_520600 ', '0');
INSERT INTO `provinces` VALUES ('520625', '印江土家族苗族自治县', '520600', '', '0', '0', 'Y', '108.41659167843', '27.999823251993', '3', 'tr_0 tr_520000 tr_520600 ', '0');
INSERT INTO `provinces` VALUES ('520626', '德江县', '520600', '', '0', '0', 'D', '108.1264110615', '28.270423278494', '3', 'tr_0 tr_520000 tr_520600 ', '0');
INSERT INTO `provinces` VALUES ('520627', '沿河土家族自治县', '520600', '', '0', '0', 'Y', '108.51047753979', '28.570101680095', '3', 'tr_0 tr_520000 tr_520600 ', '0');
INSERT INTO `provinces` VALUES ('520628', '松桃苗族自治县', '520600', '', '0', '0', 'S', '109.20940351278', '28.160420179011', '3', 'tr_0 tr_520000 tr_520600 ', '0');
INSERT INTO `provinces` VALUES ('522301', '兴义市', '522300', '', '0', '0', 'X', '104.9024609483', '25.098113310297', '3', 'tr_0 tr_520000 tr_522300 ', '0');
INSERT INTO `provinces` VALUES ('522302', '兴仁市', '522300', '', '0', '0', 'X', '105.19256772452', '25.440898753576', '3', 'tr_0 tr_520000 tr_522300 ', '0');
INSERT INTO `provinces` VALUES ('522323', '普安县', '522300', '', '0', '0', 'P', '104.95954583802', '25.789951769129', '3', 'tr_0 tr_520000 tr_522300 ', '0');
INSERT INTO `provinces` VALUES ('522324', '晴隆县', '522300', '', '0', '0', 'Q', '105.22548361467', '25.841047900453', '3', 'tr_0 tr_520000 tr_522300 ', '0');
INSERT INTO `provinces` VALUES ('522325', '贞丰县', '522300', '', '0', '0', 'Z', '105.65655958807', '25.392123965341', '3', 'tr_0 tr_520000 tr_522300 ', '0');
INSERT INTO `provinces` VALUES ('522326', '望谟县', '522300', '', '0', '0', 'W', '106.10644455174', '25.18435492392', '3', 'tr_0 tr_520000 tr_522300 ', '0');
INSERT INTO `provinces` VALUES ('522327', '册亨县', '522300', '', '0', '0', 'C', '105.81851050706', '24.989637494252', '3', 'tr_0 tr_520000 tr_522300 ', '0');
INSERT INTO `provinces` VALUES ('522328', '安龙县', '522300', '', '0', '0', 'A', '105.44954274777', '25.103990431232', '3', 'tr_0 tr_520000 tr_522300 ', '0');
INSERT INTO `provinces` VALUES ('522601', '凯里市', '522600', '', '0', '0', 'K', '107.98944624078', '26.589702969826', '3', 'tr_0 tr_520000 tr_522600 ', '0');
INSERT INTO `provinces` VALUES ('522622', '黄平县', '522600', '', '0', '0', 'H', '107.92354780622', '26.911288643101', '3', 'tr_0 tr_520000 tr_522600 ', '0');
INSERT INTO `provinces` VALUES ('522623', '施秉县', '522600', '', '0', '0', 'S', '108.13043978205', '27.039822051733', '3', 'tr_0 tr_520000 tr_522600 ', '0');
INSERT INTO `provinces` VALUES ('522624', '三穗县', '522600', '', '0', '0', 'S', '108.68154500207', '26.958666465246', '3', 'tr_0 tr_520000 tr_522600 ', '0');
INSERT INTO `provinces` VALUES ('522625', '镇远县', '522600', '', '0', '0', 'Z', '108.43658077263', '27.054820913901', '3', 'tr_0 tr_520000 tr_522600 ', '0');
INSERT INTO `provinces` VALUES ('522626', '岑巩县', '522600', '', '0', '0', 'C', '108.82248096196', '27.179902417394', '3', 'tr_0 tr_520000 tr_522600 ', '0');
INSERT INTO `provinces` VALUES ('522627', '天柱县', '522600', '', '0', '0', 'T', '109.21444570161', '26.915804084012', '3', 'tr_0 tr_520000 tr_522600 ', '0');
INSERT INTO `provinces` VALUES ('522628', '锦屏县', '522600', '', '0', '0', 'J', '109.20743846948', '26.682631631865', '3', 'tr_0 tr_520000 tr_522600 ', '0');
INSERT INTO `provinces` VALUES ('522629', '剑河县', '522600', '', '0', '0', 'J', '108.44751710323', '26.734047558881', '3', 'tr_0 tr_520000 tr_522600 ', '0');
INSERT INTO `provinces` VALUES ('522630', '台江县', '522600', '', '0', '0', 'T', '108.32855163', '26.672372539643', '3', 'tr_0 tr_520000 tr_522600 ', '0');
INSERT INTO `provinces` VALUES ('522631', '黎平县', '522600', '', '0', '0', 'L', '109.14356697147', '26.236874050192', '3', 'tr_0 tr_520000 tr_522600 ', '0');
INSERT INTO `provinces` VALUES ('522632', '榕江县', '522600', '', '0', '0', 'R', '108.52755369872', '25.93772537325', '3', 'tr_0 tr_520000 tr_522600 ', '0');
INSERT INTO `provinces` VALUES ('522633', '从江县', '522600', '', '0', '0', 'C', '108.91156142782', '25.759881327892', '3', 'tr_0 tr_520000 tr_522600 ', '0');
INSERT INTO `provinces` VALUES ('522634', '雷山县', '522600', '', '0', '0', 'L', '108.08452891457', '26.384205121689', '3', 'tr_0 tr_520000 tr_522600 ', '0');
INSERT INTO `provinces` VALUES ('522635', '麻江县', '522600', '', '0', '0', 'M', '107.59555140191', '26.496807595584', '3', 'tr_0 tr_520000 tr_522600 ', '0');
INSERT INTO `provinces` VALUES ('522636', '丹寨县', '522600', '', '0', '0', 'D', '107.79551348972', '26.204421169869', '3', 'tr_0 tr_520000 tr_522600 ', '0');
INSERT INTO `provinces` VALUES ('522701', '都匀市', '522700', '', '0', '0', 'D', '107.52540443144', '26.266117957789', '3', 'tr_0 tr_520000 tr_522700 ', '0');
INSERT INTO `provinces` VALUES ('522702', '福泉市', '522700', '', '0', '0', 'F', '107.52643281158', '26.692525700784', '3', 'tr_0 tr_520000 tr_522700 ', '0');
INSERT INTO `provinces` VALUES ('522722', '荔波县', '522700', '', '0', '0', 'L', '107.89340938687', '25.417097566273', '3', 'tr_0 tr_520000 tr_522700 ', '0');
INSERT INTO `provinces` VALUES ('522723', '贵定县', '522700', '', '0', '0', 'G', '107.2405543594', '26.590659655039', '3', 'tr_0 tr_520000 tr_522700 ', '0');
INSERT INTO `provinces` VALUES ('522725', '瓮安县', '522700', '', '0', '0', 'W', '107.47755223592', '27.084125602602', '3', 'tr_0 tr_520000 tr_522700 ', '0');
INSERT INTO `provinces` VALUES ('522726', '独山县', '522700', '', '0', '0', 'D', '107.55149778107', '25.828287807074', '3', 'tr_0 tr_520000 tr_522700 ', '0');
INSERT INTO `provinces` VALUES ('522727', '平塘县', '522700', '', '0', '0', 'P', '107.32956664388', '25.828201706902', '3', 'tr_0 tr_520000 tr_522700 ', '0');
INSERT INTO `provinces` VALUES ('522728', '罗甸县', '522700', '', '0', '0', 'L', '106.75854805682', '25.430837682972', '3', 'tr_0 tr_520000 tr_522700 ', '0');
INSERT INTO `provinces` VALUES ('522729', '长顺县', '522700', '', '0', '0', 'Z', '106.45842122163', '26.028454545714', '3', 'tr_0 tr_520000 tr_522700 ', '0');
INSERT INTO `provinces` VALUES ('522730', '龙里县', '522700', '', '0', '0', 'L', '106.98658596469', '26.459080630642', '3', 'tr_0 tr_520000 tr_522700 ', '0');
INSERT INTO `provinces` VALUES ('522731', '惠水县', '522700', '', '0', '0', 'H', '106.66345262709', '26.138209889396', '3', 'tr_0 tr_520000 tr_522700 ', '0');
INSERT INTO `provinces` VALUES ('522732', '三都水族自治县', '522700', '', '0', '0', 'S', '107.84263500353', '26.096765617985', '3', 'tr_0 tr_520000 tr_522700 ', '0');
INSERT INTO `provinces` VALUES ('530102', '五华区', '530100', '', '0', '0', 'W', '102.7134232806', '25.049834961981', '3', 'tr_0 tr_530000 tr_530100 ', '0');
INSERT INTO `provinces` VALUES ('530103', '盘龙区', '530100', '', '0', '0', 'P', '102.7585262121', '25.12237227983', '3', 'tr_0 tr_530000 tr_530100 ', '0');
INSERT INTO `provinces` VALUES ('530111', '官渡区', '530100', '', '0', '0', 'G', '102.7504817066', '25.021196423859', '3', 'tr_0 tr_530000 tr_530100 ', '0');
INSERT INTO `provinces` VALUES ('530112', '西山区', '530100', '', '0', '0', 'X', '102.6715571235', '25.043198760947', '3', 'tr_0 tr_530000 tr_530100 ', '0');
INSERT INTO `provinces` VALUES ('530113', '东川区', '530100', '', '0', '0', 'D', '103.19445186746', '26.089054237623', '3', 'tr_0 tr_530000 tr_530100 ', '0');
INSERT INTO `provinces` VALUES ('530114', '呈贡区', '530100', '', '0', '0', 'C', '102.82747259726', '24.891871210947', '3', 'tr_0 tr_530000 tr_530100 ', '0');
INSERT INTO `provinces` VALUES ('530115', '晋宁区', '530100', '', '0', '0', 'J', '102.60241805181', '24.676098812517', '3', 'tr_0 tr_530000 tr_530100 ', '0');
INSERT INTO `provinces` VALUES ('530124', '富民县', '530100', '', '0', '0', 'F', '102.50447319701', '25.228085092195', '3', 'tr_0 tr_530000 tr_530100 ', '0');
INSERT INTO `provinces` VALUES ('530125', '宜良县', '530100', '', '0', '0', 'Y', '103.14755798426', '24.925286989652', '3', 'tr_0 tr_530000 tr_530100 ', '0');
INSERT INTO `provinces` VALUES ('530126', '石林彝族自治县', '530100', '', '0', '0', 'S', '103.29650817676', '24.77770196132', '3', 'tr_0 tr_530000 tr_530100 ', '0');
INSERT INTO `provinces` VALUES ('530127', '嵩明县', '530100', '', '0', '0', 'S', '103.04356394016', '25.344409459135', '3', 'tr_0 tr_530000 tr_530100 ', '0');
INSERT INTO `provinces` VALUES ('530128', '禄劝彝族苗族自治县', '530100', '', '0', '0', 'L', '102.47742324184', '25.55767180024', '3', 'tr_0 tr_530000 tr_530100 ', '0');
INSERT INTO `provinces` VALUES ('530129', '寻甸回族彝族自治县', '530100', '', '0', '0', 'X', '103.26357387135', '25.563893580433', '3', 'tr_0 tr_530000 tr_530100 ', '0');
INSERT INTO `provinces` VALUES ('530181', '安宁市', '530100', '', '0', '0', 'A', '102.48440918413', '24.925601726344', '3', 'tr_0 tr_530000 tr_530100 ', '0');
INSERT INTO `provinces` VALUES ('530302', '麒麟区', '530300', '', '0', '0', 'Q', '103.81143036949', '25.502101828437', '3', 'tr_0 tr_530000 tr_530300 ', '0');
INSERT INTO `provinces` VALUES ('530303', '沾益区', '530300', '', '0', '0', 'Z', '103.82848532841', '25.606630798868', '3', 'tr_0 tr_530000 tr_530300 ', '0');
INSERT INTO `provinces` VALUES ('530304', '马龙区', '530300', '', '0', '0', 'M', '103.58544688632', '25.433966374816', '3', 'tr_0 tr_530000 tr_530300 ', '0');
INSERT INTO `provinces` VALUES ('530322', '陆良县', '530300', '', '0', '0', 'L', '103.67343249743', '25.035639470439', '3', 'tr_0 tr_530000 tr_530300 ', '0');
INSERT INTO `provinces` VALUES ('530323', '师宗县', '530300', '', '0', '0', 'S', '103.99155634453', '24.827994969501', '3', 'tr_0 tr_530000 tr_530300 ', '0');
INSERT INTO `provinces` VALUES ('530324', '罗平县', '530300', '', '0', '0', 'L', '104.31551019438', '24.890519724895', '3', 'tr_0 tr_530000 tr_530300 ', '0');
INSERT INTO `provinces` VALUES ('530325', '富源县', '530300', '', '0', '0', 'F', '104.2614742434', '25.680279502133', '3', 'tr_0 tr_530000 tr_530300 ', '0');
INSERT INTO `provinces` VALUES ('530326', '会泽县', '530300', '', '0', '0', 'H', '103.30348729192', '26.424215045561', '3', 'tr_0 tr_530000 tr_530300 ', '0');
INSERT INTO `provinces` VALUES ('530381', '宣威市', '530300', '', '0', '0', 'X', '104.1115760691', '26.225598378324', '3', 'tr_0 tr_530000 tr_530300 ', '0');
INSERT INTO `provinces` VALUES ('530402', '红塔区', '530400', '', '0', '0', 'H', '102.55156461759', '24.359801443673', '3', 'tr_0 tr_530000 tr_530400 ', '0');
INSERT INTO `provinces` VALUES ('530403', '江川区', '530400', '', '0', '0', 'J', '102.76052700796', '24.293438700984', '3', 'tr_0 tr_530000 tr_530400 ', '0');
INSERT INTO `provinces` VALUES ('530422', '澄江县', '530400', '', '0', '0', 'C', '102.91455487235', '24.679414908816', '3', 'tr_0 tr_530000 tr_530400 ', '0');
INSERT INTO `provinces` VALUES ('530423', '通海县', '530400', '', '0', '0', 'T', '102.73242289128', '24.117891201574', '3', 'tr_0 tr_530000 tr_530400 ', '0');
INSERT INTO `provinces` VALUES ('530424', '华宁县', '530400', '', '0', '0', 'H', '102.93549185853', '24.198581027163', '3', 'tr_0 tr_530000 tr_530400 ', '0');
INSERT INTO `provinces` VALUES ('530425', '易门县', '530400', '', '0', '0', 'Y', '102.1695354962', '24.677404477592', '3', 'tr_0 tr_530000 tr_530400 ', '0');
INSERT INTO `provinces` VALUES ('530426', '峨山彝族自治县', '530400', '', '0', '0', 'E', '102.41256450607', '24.174774239093', '3', 'tr_0 tr_530000 tr_530400 ', '0');
INSERT INTO `provinces` VALUES ('530427', '新平彝族傣族自治县', '530400', '', '0', '0', 'X', '101.99642771261', '24.076262705278', '3', 'tr_0 tr_530000 tr_530400 ', '0');
INSERT INTO `provinces` VALUES ('530428', '元江哈尼族彝族傣族自治县', '530400', '', '0', '0', 'Y', '102.00441463673', '23.603000905475', '3', 'tr_0 tr_530000 tr_530400 ', '0');
INSERT INTO `provinces` VALUES ('530502', '隆阳区', '530500', '', '0', '0', 'L', '99.172070839289', '25.12688832219', '3', 'tr_0 tr_530000 tr_530500 ', '0');
INSERT INTO `provinces` VALUES ('530521', '施甸县', '530500', '', '0', '0', 'S', '99.195469362222', '24.728835000146', '3', 'tr_0 tr_530000 tr_530500 ', '0');
INSERT INTO `provinces` VALUES ('530523', '龙陵县', '530500', '', '0', '0', 'L', '98.695749912275', '24.592546947017', '3', 'tr_0 tr_530000 tr_530500 ', '0');
INSERT INTO `provinces` VALUES ('530524', '昌宁县', '530500', '', '0', '0', 'C', '99.611616576026', '24.833984919853', '3', 'tr_0 tr_530000 tr_530500 ', '0');
INSERT INTO `provinces` VALUES ('530581', '腾冲市', '530500', '', '0', '0', 'T', '98.497595035489', '25.026616860346', '3', 'tr_0 tr_530000 tr_530500 ', '0');
INSERT INTO `provinces` VALUES ('530602', '昭阳区', '530600', '', '0', '0', 'Z', '103.71347042315', '27.326144206053', '3', 'tr_0 tr_530000 tr_530600 ', '0');
INSERT INTO `provinces` VALUES ('530621', '鲁甸县', '530600', '', '0', '0', 'L', '103.5644121645', '27.193107219133', '3', 'tr_0 tr_530000 tr_530600 ', '0');
INSERT INTO `provinces` VALUES ('530622', '巧家县', '530600', '', '0', '0', 'Q', '102.93651934037', '26.914705038577', '3', 'tr_0 tr_530000 tr_530600 ', '0');
INSERT INTO `provinces` VALUES ('530623', '盐津县', '530600', '', '0', '0', 'Y', '104.24157884246', '28.114384038516', '3', 'tr_0 tr_530000 tr_530600 ', '0');
INSERT INTO `provinces` VALUES ('530624', '大关县', '530600', '', '0', '0', 'D', '103.89751489665', '27.754021401911', '3', 'tr_0 tr_530000 tr_530600 ', '0');
INSERT INTO `provinces` VALUES ('530625', '永善县', '530600', '', '0', '0', 'Y', '103.6445690431', '28.234722481383', '3', 'tr_0 tr_530000 tr_530600 ', '0');
INSERT INTO `provinces` VALUES ('530626', '绥江县', '530600', '', '0', '0', 'S', '103.9645523826', '28.604277931727', '3', 'tr_0 tr_530000 tr_530600 ', '0');
INSERT INTO `provinces` VALUES ('530627', '镇雄县', '530600', '', '0', '0', 'Z', '104.88040422431', '27.447794634649', '3', 'tr_0 tr_530000 tr_530600 ', '0');
INSERT INTO `provinces` VALUES ('530628', '彝良县', '530600', '', '0', '0', 'Y', '104.05444303021', '27.631690165547', '3', 'tr_0 tr_530000 tr_530600 ', '0');
INSERT INTO `provinces` VALUES ('530629', '威信县', '530600', '', '0', '0', 'W', '105.05557676311', '27.85253746404', '3', 'tr_0 tr_530000 tr_530600 ', '0');
INSERT INTO `provinces` VALUES ('530681', '水富市', '530600', '', '0', '0', 'S', '104.42243298394', '28.636106975262', '3', 'tr_0 tr_530000 tr_530600 ', '0');
INSERT INTO `provinces` VALUES ('530702', '古城区', '530700', '', '0', '0', 'G', '100.23248033921', '26.883161684001', '3', 'tr_0 tr_530000 tr_530700 ', '0');
INSERT INTO `provinces` VALUES ('530721', '玉龙纳西族自治县', '530700', '', '0', '0', 'Y', '100.24352734105', '26.827391803625', '3', 'tr_0 tr_530000 tr_530700 ', '0');
INSERT INTO `provinces` VALUES ('530722', '永胜县', '530700', '', '0', '0', 'Y', '100.75758141133', '26.689950245419', '3', 'tr_0 tr_530000 tr_530700 ', '0');
INSERT INTO `provinces` VALUES ('530723', '华坪县', '530700', '', '0', '0', 'H', '101.27243012268', '26.635223014622', '3', 'tr_0 tr_530000 tr_530700 ', '0');
INSERT INTO `provinces` VALUES ('530724', '宁蒗彝族自治县', '530700', '', '0', '0', 'N', '100.85859038623', '27.287727826052', '3', 'tr_0 tr_530000 tr_530700 ', '0');
INSERT INTO `provinces` VALUES ('530802', '思茅区', '530800', '', '0', '0', 'S', '100.98355510298', '22.79249798436', '3', 'tr_0 tr_530000 tr_530800 ', '0');
INSERT INTO `provinces` VALUES ('530821', '宁洱哈尼族彝族自治县', '530800', '', '0', '0', 'N', '101.05244246946', '23.054590179481', '3', 'tr_0 tr_530000 tr_530800 ', '0');
INSERT INTO `provinces` VALUES ('530822', '墨江哈尼族自治县', '530800', '', '0', '0', 'M', '101.69858356155', '23.437725772256', '3', 'tr_0 tr_530000 tr_530800 ', '0');
INSERT INTO `provinces` VALUES ('530823', '景东彝族自治县', '530800', '', '0', '0', 'J', '100.83848864452', '24.451863775495', '3', 'tr_0 tr_530000 tr_530800 ', '0');
INSERT INTO `provinces` VALUES ('530824', '景谷傣族彝族自治县', '530800', '', '0', '0', 'J', '100.7094565801', '23.503204071241', '3', 'tr_0 tr_530000 tr_530800 ', '0');
INSERT INTO `provinces` VALUES ('530825', '镇沅彝族哈尼族拉祜族自治县', '530800', '', '0', '0', 'Z', '101.11556882305', '24.010330833613', '3', 'tr_0 tr_530000 tr_530800 ', '0');
INSERT INTO `provinces` VALUES ('530826', '江城哈尼族彝族自治县', '530800', '', '0', '0', 'J', '101.86847918429', '22.59168385943', '3', 'tr_0 tr_530000 tr_530800 ', '0');
INSERT INTO `provinces` VALUES ('530827', '孟连傣族拉祜族佤族自治县', '530800', '', '0', '0', 'M', '99.590962825578', '22.335307615556', '3', 'tr_0 tr_530000 tr_530800 ', '0');
INSERT INTO `provinces` VALUES ('530828', '澜沧拉祜族自治县', '530800', '', '0', '0', 'L', '99.938588283239', '22.561831918087', '3', 'tr_0 tr_530000 tr_530800 ', '0');
INSERT INTO `provinces` VALUES ('530829', '西盟佤族自治县', '530800', '', '0', '0', 'X', '99.596622150289', '22.650656010974', '3', 'tr_0 tr_530000 tr_530800 ', '0');
INSERT INTO `provinces` VALUES ('530902', '临翔区', '530900', '', '0', '0', 'L', '100.0884425304', '23.901401938645', '3', 'tr_0 tr_530000 tr_530900 ', '0');
INSERT INTO `provinces` VALUES ('530921', '凤庆县', '530900', '', '0', '0', 'F', '99.934989222215', '24.586472458274', '3', 'tr_0 tr_530000 tr_530900 ', '0');
INSERT INTO `provinces` VALUES ('530922', '云县', '530900', '', '0', '0', 'Y', '100.12953102441', '24.442807275329', '3', 'tr_0 tr_530000 tr_530900 ', '0');
INSERT INTO `provinces` VALUES ('530923', '永德县', '530900', '', '0', '0', 'Y', '99.265075642606', '24.024871282777', '3', 'tr_0 tr_530000 tr_530900 ', '0');
INSERT INTO `provinces` VALUES ('530924', '镇康县', '530900', '', '0', '0', 'Z', '98.831871224123', '23.768315480096', '3', 'tr_0 tr_530000 tr_530900 ', '0');
INSERT INTO `provinces` VALUES ('530925', '双江拉祜族佤族布朗族傣族自治县', '530900', '', '0', '0', 'S', '99.834130982979', '23.479836504614', '3', 'tr_0 tr_530000 tr_530900 ', '0');
INSERT INTO `provinces` VALUES ('530926', '耿马傣族佤族自治县', '530900', '', '0', '0', 'G', '99.403942176092', '23.543490995101', '3', 'tr_0 tr_530000 tr_530900 ', '0');
INSERT INTO `provinces` VALUES ('530927', '沧源佤族自治县', '530900', '', '0', '0', 'C', '99.252721696084', '23.152878733913', '3', 'tr_0 tr_530000 tr_530900 ', '0');
INSERT INTO `provinces` VALUES ('532301', '楚雄市', '532300', '', '0', '0', 'C', '101.55247228396', '25.038860388323', '3', 'tr_0 tr_530000 tr_532300 ', '0');
INSERT INTO `provinces` VALUES ('532322', '双柏县', '532300', '', '0', '0', 'S', '101.64840700053', '24.694898530382', '3', 'tr_0 tr_530000 tr_532300 ', '0');
INSERT INTO `provinces` VALUES ('532323', '牟定县', '532300', '', '0', '0', 'M', '101.55348099122', '25.318845903714', '3', 'tr_0 tr_530000 tr_532300 ', '0');
INSERT INTO `provinces` VALUES ('532324', '南华县', '532300', '', '0', '0', 'N', '101.28042055018', '25.198587071156', '3', 'tr_0 tr_530000 tr_532300 ', '0');
INSERT INTO `provinces` VALUES ('532325', '姚安县', '532300', '', '0', '0', 'Y', '101.2485272012', '25.509775443473', '3', 'tr_0 tr_530000 tr_532300 ', '0');
INSERT INTO `provinces` VALUES ('532326', '大姚县', '532300', '', '0', '0', 'D', '101.33056746713', '25.727600600572', '3', 'tr_0 tr_530000 tr_532300 ', '0');
INSERT INTO `provinces` VALUES ('532327', '永仁县', '532300', '', '0', '0', 'Y', '101.67249299667', '26.055565754521', '3', 'tr_0 tr_530000 tr_532300 ', '0');
INSERT INTO `provinces` VALUES ('532328', '元谋县', '532300', '', '0', '0', 'Y', '101.8804452425', '25.710895319939', '3', 'tr_0 tr_530000 tr_532300 ', '0');
INSERT INTO `provinces` VALUES ('532329', '武定县', '532300', '', '0', '0', 'W', '102.41053182037', '25.536089587807', '3', 'tr_0 tr_530000 tr_532300 ', '0');
INSERT INTO `provinces` VALUES ('532331', '禄丰县', '532300', '', '0', '0', 'L', '102.08553135476', '25.155830804806', '3', 'tr_0 tr_530000 tr_532300 ', '0');
INSERT INTO `provinces` VALUES ('532501', '个旧市', '532500', '', '0', '0', 'G', '103.16651860849', '23.364941534583', '3', 'tr_0 tr_530000 tr_532500 ', '0');
INSERT INTO `provinces` VALUES ('532502', '开远市', '532500', '', '0', '0', 'K', '103.27355323709', '23.719907796912', '3', 'tr_0 tr_530000 tr_532500 ', '0');
INSERT INTO `provinces` VALUES ('532503', '蒙自市', '532500', '', '0', '0', 'M', '103.37154588175', '23.402079885198', '3', 'tr_0 tr_530000 tr_532500 ', '0');
INSERT INTO `provinces` VALUES ('532504', '弥勒市', '532500', '', '0', '0', 'M', '103.421489063', '24.417982225357', '3', 'tr_0 tr_530000 tr_532500 ', '0');
INSERT INTO `provinces` VALUES ('532523', '屏边苗族自治县', '532500', '', '0', '0', 'P', '103.69343183232', '22.989989585513', '3', 'tr_0 tr_530000 tr_532500 ', '0');
INSERT INTO `provinces` VALUES ('532524', '建水县', '532500', '', '0', '0', 'J', '102.83343959161', '23.640938563461', '3', 'tr_0 tr_530000 tr_532500 ', '0');
INSERT INTO `provinces` VALUES ('532525', '石屏县', '532500', '', '0', '0', 'S', '102.50244661978', '23.712004452449', '3', 'tr_0 tr_530000 tr_532500 ', '0');
INSERT INTO `provinces` VALUES ('532527', '泸西县', '532500', '', '0', '0', 'L', '103.77252314092', '24.53803716745', '3', 'tr_0 tr_530000 tr_532500 ', '0');
INSERT INTO `provinces` VALUES ('532528', '元阳县', '532500', '', '0', '0', 'Y', '102.84143280386', '23.226198051926', '3', 'tr_0 tr_530000 tr_532500 ', '0');
INSERT INTO `provinces` VALUES ('532529', '红河县', '532500', '', '0', '0', 'H', '102.42755057757', '23.374488738365', '3', 'tr_0 tr_530000 tr_532500 ', '0');
INSERT INTO `provinces` VALUES ('532530', '金平苗族瑶族傣族自治县', '532500', '', '0', '0', 'J', '103.23246860579', '22.785560606183', '3', 'tr_0 tr_530000 tr_532500 ', '0');
INSERT INTO `provinces` VALUES ('532531', '绿春县', '532500', '', '0', '0', 'L', '102.39849398755', '23.000164936586', '3', 'tr_0 tr_530000 tr_532500 ', '0');
INSERT INTO `provinces` VALUES ('532532', '河口瑶族自治县', '532500', '', '0', '0', 'H', '103.9454436278', '22.535465602947', '3', 'tr_0 tr_530000 tr_532500 ', '0');
INSERT INTO `provinces` VALUES ('532601', '文山市', '532600', '', '0', '0', 'W', '104.23854382746', '23.391944131908', '3', 'tr_0 tr_530000 tr_532600 ', '0');
INSERT INTO `provinces` VALUES ('532622', '砚山县', '532600', '', '0', '0', 'Y', '104.3435508907', '23.6114865767', '3', 'tr_0 tr_530000 tr_532600 ', '0');
INSERT INTO `provinces` VALUES ('532623', '西畴县', '532600', '', '0', '0', 'X', '104.67852542203', '23.443271275283', '3', 'tr_0 tr_530000 tr_532600 ', '0');
INSERT INTO `provinces` VALUES ('532624', '麻栗坡县', '532600', '', '0', '0', 'M', '104.70954948078', '23.13158558356', '3', 'tr_0 tr_530000 tr_532600 ', '0');
INSERT INTO `provinces` VALUES ('532625', '马关县', '532600', '', '0', '0', 'M', '104.40041497692', '23.018993577166', '3', 'tr_0 tr_530000 tr_532600 ', '0');
INSERT INTO `provinces` VALUES ('532626', '丘北县', '532600', '', '0', '0', 'Q', '104.17344174074', '24.056993896218', '3', 'tr_0 tr_530000 tr_532600 ', '0');
INSERT INTO `provinces` VALUES ('532627', '广南县', '532600', '', '0', '0', 'G', '105.06158238459', '24.052198510921', '3', 'tr_0 tr_530000 tr_532600 ', '0');
INSERT INTO `provinces` VALUES ('532628', '富宁县', '532600', '', '0', '0', 'F', '105.63749017905', '23.63138040952', '3', 'tr_0 tr_530000 tr_532600 ', '0');
INSERT INTO `provinces` VALUES ('532801', '景洪市', '532800', '', '0', '0', 'J', '100.80644312258', '22.017004423119', '3', 'tr_0 tr_530000 tr_532800 ', '0');
INSERT INTO `provinces` VALUES ('532822', '勐海县', '532800', '', '0', '0', 'M', '100.4594459398', '21.963433596681', '3', 'tr_0 tr_530000 tr_532800 ', '0');
INSERT INTO `provinces` VALUES ('532823', '勐腊县', '532800', '', '0', '0', 'M', '101.57152830823', '21.465280880862', '3', 'tr_0 tr_530000 tr_532800 ', '0');
INSERT INTO `provinces` VALUES ('532901', '大理市', '532900', '', '0', '0', 'D', '100.23651930044', '25.597604905452', '3', 'tr_0 tr_530000 tr_532900 ', '0');
INSERT INTO `provinces` VALUES ('532922', '漾濞彝族自治县', '532900', '', '0', '0', 'Y', '99.964413758168', '25.676295762972', '3', 'tr_0 tr_530000 tr_532900 ', '0');
INSERT INTO `provinces` VALUES ('532923', '祥云县', '532900', '', '0', '0', 'X', '100.55744657937', '25.489872506242', '3', 'tr_0 tr_530000 tr_532900 ', '0');
INSERT INTO `provinces` VALUES ('532924', '宾川县', '532900', '', '0', '0', 'B', '100.57845668762', '25.835249028198', '3', 'tr_0 tr_530000 tr_532900 ', '0');
INSERT INTO `provinces` VALUES ('532925', '弥渡县', '532900', '', '0', '0', 'M', '100.49758601546', '25.349336028746', '3', 'tr_0 tr_530000 tr_532900 ', '0');
INSERT INTO `provinces` VALUES ('532926', '南涧彝族自治县', '532900', '', '0', '0', 'N', '100.51554862227', '25.049426762094', '3', 'tr_0 tr_530000 tr_532900 ', '0');
INSERT INTO `provinces` VALUES ('532927', '巍山彝族回族自治县', '532900', '', '0', '0', 'W', '100.31346033515', '25.233438729799', '3', 'tr_0 tr_530000 tr_532900 ', '0');
INSERT INTO `provinces` VALUES ('532928', '永平县', '532900', '', '0', '0', 'Y', '99.547494899931', '25.4702064833', '3', 'tr_0 tr_530000 tr_532900 ', '0');
INSERT INTO `provinces` VALUES ('532929', '云龙县', '532900', '', '0', '0', 'Y', '99.377416022867', '25.891945073902', '3', 'tr_0 tr_530000 tr_532900 ', '0');
INSERT INTO `provinces` VALUES ('532930', '洱源县', '532900', '', '0', '0', 'E', '99.969209721453', '26.120093341888', '3', 'tr_0 tr_530000 tr_532900 ', '0');
INSERT INTO `provinces` VALUES ('532931', '剑川县', '532900', '', '0', '0', 'J', '99.912091235112', '26.542516534181', '3', 'tr_0 tr_530000 tr_532900 ', '0');
INSERT INTO `provinces` VALUES ('532932', '鹤庆县', '532900', '', '0', '0', 'H', '100.18249206302', '26.566197313345', '3', 'tr_0 tr_530000 tr_532900 ', '0');
INSERT INTO `provinces` VALUES ('533102', '瑞丽市', '533100', '', '0', '0', 'R', '97.862485584208', '24.022816893105', '3', 'tr_0 tr_530000 tr_533100 ', '0');
INSERT INTO `provinces` VALUES ('533103', '芒市', '533100', '', '0', '0', 'M', '98.591359356114', '24.438010702758', '3', 'tr_0 tr_530000 tr_533100 ', '0');
INSERT INTO `provinces` VALUES ('533122', '梁河县', '533100', '', '0', '0', 'L', '98.303133631636', '24.810784458257', '3', 'tr_0 tr_530000 tr_533100 ', '0');
INSERT INTO `provinces` VALUES ('533123', '盈江县', '533100', '', '0', '0', 'Y', '97.938426535386', '24.711534266143', '3', 'tr_0 tr_530000 tr_533100 ', '0');
INSERT INTO `provinces` VALUES ('533124', '陇川县', '533100', '', '0', '0', 'L', '97.798530364124', '24.189467890549', '3', 'tr_0 tr_530000 tr_533100 ', '0');
INSERT INTO `provinces` VALUES ('533301', '泸水市', '533300', '', '0', '0', 'L', '98.864586163328', '25.829026769972', '3', 'tr_0 tr_530000 tr_533300 ', '0');
INSERT INTO `provinces` VALUES ('533323', '福贡县', '533300', '', '0', '0', 'F', '98.875649424493', '26.908055208498', '3', 'tr_0 tr_530000 tr_533300 ', '0');
INSERT INTO `provinces` VALUES ('533324', '贡山独龙族怒族自治县', '533300', '', '0', '0', 'G', '98.672399448687', '27.747067875272', '3', 'tr_0 tr_530000 tr_533300 ', '0');
INSERT INTO `provinces` VALUES ('533325', '兰坪白族普米族自治县', '533300', '', '0', '0', 'L', '99.423284669988', '26.459207904688', '3', 'tr_0 tr_530000 tr_533300 ', '0');
INSERT INTO `provinces` VALUES ('533401', '香格里拉市', '533400', '', '0', '0', 'X', '99.707444573899', '27.835760125321', '3', 'tr_0 tr_530000 tr_533400 ', '0');
INSERT INTO `provinces` VALUES ('533422', '德钦县', '533400', '', '0', '0', 'D', '98.924452656054', '28.470086006822', '3', 'tr_0 tr_530000 tr_533400 ', '0');
INSERT INTO `provinces` VALUES ('533423', '维西傈僳族自治县', '533400', '', '0', '0', 'W', '99.293465689934', '27.183170204022', '3', 'tr_0 tr_530000 tr_533400 ', '0');
INSERT INTO `provinces` VALUES ('540102', '城关区', '540100', '', '0', '0', 'C', '91.145100352371', '29.658331252915', '3', 'tr_0 tr_540000 tr_540100 ', '0');
INSERT INTO `provinces` VALUES ('540103', '堆龙德庆区', '540100', '', '0', '0', 'D', '91.009963134209', '29.651625675009', '3', 'tr_0 tr_540000 tr_540100 ', '0');
INSERT INTO `provinces` VALUES ('540104', '达孜区', '540100', '', '0', '0', 'D', '91.356318118388', '29.675409063815', '3', 'tr_0 tr_540000 tr_540100 ', '0');
INSERT INTO `provinces` VALUES ('540121', '林周县', '540100', '', '0', '0', 'L', '91.26950057393', '29.898733205887', '3', 'tr_0 tr_540000 tr_540100 ', '0');
INSERT INTO `provinces` VALUES ('540122', '当雄县', '540100', '', '0', '0', 'D', '91.107451746831', '30.479221726942', '3', 'tr_0 tr_540000 tr_540100 ', '0');
INSERT INTO `provinces` VALUES ('540123', '尼木县', '540100', '', '0', '0', 'N', '90.171180066243', '29.437518981255', '3', 'tr_0 tr_540000 tr_540100 ', '0');
INSERT INTO `provinces` VALUES ('540124', '曲水县', '540100', '', '0', '0', 'Q', '90.749958665453', '29.358987058337', '3', 'tr_0 tr_540000 tr_540100 ', '0');
INSERT INTO `provinces` VALUES ('540127', '墨竹工卡县', '540100', '', '0', '0', 'M', '91.737266398592', '29.839752605055', '3', 'tr_0 tr_540000 tr_540100 ', '0');
INSERT INTO `provinces` VALUES ('540171', '格尔木藏青工业园区', '540100', '', '0', '0', 'G', '91.120823915464', '29.650040274768', '3', 'tr_0 tr_540000 tr_540100 ', '0');
INSERT INTO `provinces` VALUES ('540172', '拉萨经济技术开发区', '540100', '', '0', '0', 'L', '91.120823915464', '29.650040274768', '3', 'tr_0 tr_540000 tr_540100 ', '0');
INSERT INTO `provinces` VALUES ('540173', '西藏文化旅游创意园区', '540100', '', '0', '0', 'X', '91.120823915464', '29.650040274768', '3', 'tr_0 tr_540000 tr_540100 ', '0');
INSERT INTO `provinces` VALUES ('540174', '达孜工业园区', '540100', '', '0', '0', 'D', '91.356318118388', '29.675409063815', '3', 'tr_0 tr_540000 tr_540100 ', '0');
INSERT INTO `provinces` VALUES ('540202', '桑珠孜区', '540200', '', '0', '0', 'S', '88.902951718862', '29.255582814198', '3', 'tr_0 tr_540000 tr_540200 ', '0');
INSERT INTO `provinces` VALUES ('540221', '南木林县', '540200', '', '0', '0', 'N', '89.105704213077', '29.687938036552', '3', 'tr_0 tr_540000 tr_540200 ', '0');
INSERT INTO `provinces` VALUES ('540222', '江孜县', '540200', '', '0', '0', 'J', '89.612012194954', '28.917634684239', '3', 'tr_0 tr_540000 tr_540200 ', '0');
INSERT INTO `provinces` VALUES ('540223', '定日县', '540200', '', '0', '0', 'D', '87.129597739314', '28.663951983289', '3', 'tr_0 tr_540000 tr_540200 ', '0');
INSERT INTO `provinces` VALUES ('540224', '萨迦县', '540200', '', '0', '0', 'S', '88.028269488152', '28.90493151262', '3', 'tr_0 tr_540000 tr_540200 ', '0');
INSERT INTO `provinces` VALUES ('540225', '拉孜县', '540200', '', '0', '0', 'L', '87.643647318074', '29.087509679995', '3', 'tr_0 tr_540000 tr_540200 ', '0');
INSERT INTO `provinces` VALUES ('540226', '昂仁县', '540200', '', '0', '0', 'A', '87.242427336755', '29.301060484014', '3', 'tr_0 tr_540000 tr_540200 ', '0');
INSERT INTO `provinces` VALUES ('540227', '谢通门县', '540200', '', '0', '0', 'X', '88.268206799957', '29.438142414132', '3', 'tr_0 tr_540000 tr_540200 ', '0');
INSERT INTO `provinces` VALUES ('540228', '白朗县', '540200', '', '0', '0', 'B', '89.268741991895', '29.111858951918', '3', 'tr_0 tr_540000 tr_540200 ', '0');
INSERT INTO `provinces` VALUES ('540229', '仁布县', '540200', '', '0', '0', 'R', '89.848624967899', '29.236788327037', '3', 'tr_0 tr_540000 tr_540200 ', '0');
INSERT INTO `provinces` VALUES ('540230', '康马县', '540200', '', '0', '0', 'K', '89.688244915761', '28.561443952501', '3', 'tr_0 tr_540000 tr_540200 ', '0');
INSERT INTO `provinces` VALUES ('540231', '定结县', '540200', '', '0', '0', 'D', '87.772376743375', '28.369910769393', '3', 'tr_0 tr_540000 tr_540200 ', '0');
INSERT INTO `provinces` VALUES ('540232', '仲巴县', '540200', '', '0', '0', 'Z', '84.038116876917', '29.775982232026', '3', 'tr_0 tr_540000 tr_540200 ', '0');
INSERT INTO `provinces` VALUES ('540233', '亚东县', '540200', '', '0', '0', 'Y', '88.913440783145', '27.491108780091', '3', 'tr_0 tr_540000 tr_540200 ', '0');
INSERT INTO `provinces` VALUES ('540234', '吉隆县', '540200', '', '0', '0', 'J', '85.304073768987', '28.858501664955', '3', 'tr_0 tr_540000 tr_540200 ', '0');
INSERT INTO `provinces` VALUES ('540235', '聂拉木县', '540200', '', '0', '0', 'N', '85.988770403046', '28.160839360543', '3', 'tr_0 tr_540000 tr_540200 ', '0');
INSERT INTO `provinces` VALUES ('540236', '萨嘎县', '540200', '', '0', '0', 'S', '85.239825701307', '29.334659688784', '3', 'tr_0 tr_540000 tr_540200 ', '0');
INSERT INTO `provinces` VALUES ('540237', '岗巴县', '540200', '', '0', '0', 'G', '88.526529281476', '28.28036304226', '3', 'tr_0 tr_540000 tr_540200 ', '0');
INSERT INTO `provinces` VALUES ('540302', '卡若区', '540300', '', '0', '0', 'K', '97.186654336416', '31.144248893947', '3', 'tr_0 tr_540000 tr_540300 ', '0');
INSERT INTO `provinces` VALUES ('540321', '江达县', '540300', '', '0', '0', 'J', '98.224594520968', '31.50520701798', '3', 'tr_0 tr_540000 tr_540300 ', '0');
INSERT INTO `provinces` VALUES ('540322', '贡觉县', '540300', '', '0', '0', 'G', '98.277334127289', '30.865966958412', '3', 'tr_0 tr_540000 tr_540300 ', '0');
INSERT INTO `provinces` VALUES ('540323', '类乌齐县', '540300', '', '0', '0', 'L', '96.606717192399', '31.217793112281', '3', 'tr_0 tr_540000 tr_540300 ', '0');
INSERT INTO `provinces` VALUES ('540324', '丁青县', '540300', '', '0', '0', 'D', '95.602643844218', '31.418402964614', '3', 'tr_0 tr_540000 tr_540300 ', '0');
INSERT INTO `provinces` VALUES ('540325', '察雅县', '540300', '', '0', '0', 'C', '97.575123679628', '30.659864699371', '3', 'tr_0 tr_540000 tr_540300 ', '0');
INSERT INTO `provinces` VALUES ('540326', '八宿县', '540300', '', '0', '0', 'B', '96.924360446152', '30.059028991399', '3', 'tr_0 tr_540000 tr_540300 ', '0');
INSERT INTO `provinces` VALUES ('540327', '左贡县', '540300', '', '0', '0', 'Z', '97.847366832989', '29.676848537197', '3', 'tr_0 tr_540000 tr_540300 ', '0');
INSERT INTO `provinces` VALUES ('540328', '芒康县', '540300', '', '0', '0', 'M', '98.599685480392', '29.685776117713', '3', 'tr_0 tr_540000 tr_540300 ', '0');
INSERT INTO `provinces` VALUES ('540329', '洛隆县', '540300', '', '0', '0', 'L', '95.831306613477', '30.747126507478', '3', 'tr_0 tr_540000 tr_540300 ', '0');
INSERT INTO `provinces` VALUES ('540330', '边坝县', '540300', '', '0', '0', 'B', '94.714371149159', '30.939624927347', '3', 'tr_0 tr_540000 tr_540300 ', '0');
INSERT INTO `provinces` VALUES ('540402', '巴宜区', '540400', '', '0', '0', 'B', '94.36754427672', '29.641644546372', '3', 'tr_0 tr_540000 tr_540400 ', '0');
INSERT INTO `provinces` VALUES ('540421', '工布江达县', '540400', '', '0', '0', 'G', '93.252419796678', '29.891367616241', '3', 'tr_0 tr_540000 tr_540400 ', '0');
INSERT INTO `provinces` VALUES ('540422', '米林县', '540400', '', '0', '0', 'M', '94.219938578083', '29.220916541197', '3', 'tr_0 tr_540000 tr_540400 ', '0');
INSERT INTO `provinces` VALUES ('540423', '墨脱县', '540400', '', '0', '0', 'M', '95.33949529751', '29.330937701878', '3', 'tr_0 tr_540000 tr_540400 ', '0');
INSERT INTO `provinces` VALUES ('540424', '波密县', '540400', '', '0', '0', 'B', '95.773900121645', '29.865060090549', '3', 'tr_0 tr_540000 tr_540400 ', '0');
INSERT INTO `provinces` VALUES ('540425', '察隅县', '540400', '', '0', '0', 'C', '97.473269749246', '28.667444137201', '3', 'tr_0 tr_540000 tr_540400 ', '0');
INSERT INTO `provinces` VALUES ('540426', '朗县', '540400', '', '0', '0', 'L', '93.081368234407', '29.051902419086', '3', 'tr_0 tr_540000 tr_540400 ', '0');
INSERT INTO `provinces` VALUES ('540602', '色尼区', '540600', '', '0', '0', 'S', '92.05984683665', '31.476117292678', '3', 'tr_0 tr_540000 tr_540600 ', '0');
INSERT INTO `provinces` VALUES ('540621', '嘉黎县', '540600', '', '0', '0', 'J', '93.23873151504', '30.647062455597', '3', 'tr_0 tr_540000 tr_540600 ', '0');
INSERT INTO `provinces` VALUES ('540622', '比如县', '540600', '', '0', '0', 'B', '93.685965938612', '31.48635726205', '3', 'tr_0 tr_540000 tr_540600 ', '0');
INSERT INTO `provinces` VALUES ('540623', '聂荣县', '540600', '', '0', '0', 'N', '92.308654466293', '32.113707483115', '3', 'tr_0 tr_540000 tr_540600 ', '0');
INSERT INTO `provinces` VALUES ('540624', '安多县', '540600', '', '0', '0', 'A', '91.688890677999', '32.271268023108', '3', 'tr_0 tr_540000 tr_540600 ', '0');
INSERT INTO `provinces` VALUES ('540625', '申扎县', '540600', '', '0', '0', 'S', '88.716481108234', '30.936393285832', '3', 'tr_0 tr_540000 tr_540600 ', '0');
INSERT INTO `provinces` VALUES ('540626', '索县', '540600', '', '0', '0', 'S', '93.792172958379', '31.892424309227', '3', 'tr_0 tr_540000 tr_540600 ', '0');
INSERT INTO `provinces` VALUES ('540627', '班戈县', '540600', '', '0', '0', 'B', '90.016707727114', '31.398727622963', '3', 'tr_0 tr_540000 tr_540600 ', '0');
INSERT INTO `provinces` VALUES ('540628', '巴青县', '540600', '', '0', '0', 'B', '94.059881564766', '31.924549424276', '3', 'tr_0 tr_540000 tr_540600 ', '0');
INSERT INTO `provinces` VALUES ('540629', '尼玛县', '540600', '', '0', '0', 'N', '87.243292410868', '31.790953326638', '3', 'tr_0 tr_540000 tr_540600 ', '0');
INSERT INTO `provinces` VALUES ('540630', '双湖县', '540600', '', '0', '0', 'S', '88.843427936123', '33.193503165809', '3', 'tr_0 tr_540000 tr_540600 ', '0');
INSERT INTO `provinces` VALUES ('542521', '普兰县', '542500', '', '0', '0', 'P', '81.183094731974', '30.300162591078', '3', 'tr_0 tr_540000 tr_542500 ', '0');
INSERT INTO `provinces` VALUES ('542522', '札达县', '542500', '', '0', '0', 'Z', '79.809323212178', '31.485343070014', '3', 'tr_0 tr_540000 tr_542500 ', '0');
INSERT INTO `provinces` VALUES ('542523', '噶尔县', '542500', '', '0', '0', 'G', '80.102877146054', '32.497156823602', '3', 'tr_0 tr_540000 tr_542500 ', '0');
INSERT INTO `provinces` VALUES ('542524', '日土县', '542500', '', '0', '0', 'R', '79.739109138263', '33.387186043872', '3', 'tr_0 tr_540000 tr_542500 ', '0');
INSERT INTO `provinces` VALUES ('542525', '革吉县', '542500', '', '0', '0', 'G', '81.151664369638', '32.393356020044', '3', 'tr_0 tr_540000 tr_542500 ', '0');
INSERT INTO `provinces` VALUES ('542526', '改则县', '542500', '', '0', '0', 'G', '84.06911336254', '32.308356643244', '3', 'tr_0 tr_540000 tr_542500 ', '0');
INSERT INTO `provinces` VALUES ('542527', '措勤县', '542500', '', '0', '0', 'C', '85.165952205481', '31.022666379273', '3', 'tr_0 tr_540000 tr_542500 ', '0');
INSERT INTO `provinces` VALUES ('610102', '新城区', '610100', '', '0', '0', 'X', '108.9673910385', '34.272724469533', '3', 'tr_0 tr_610000 tr_610100 ', '0');
INSERT INTO `provinces` VALUES ('610103', '碑林区', '610100', '', '0', '0', 'B', '108.94049774781', '34.236473940412', '3', 'tr_0 tr_610000 tr_610100 ', '0');
INSERT INTO `provinces` VALUES ('610104', '莲湖区', '610100', '', '0', '0', 'L', '108.95042644912', '34.271017203053', '3', 'tr_0 tr_610000 tr_610100 ', '0');
INSERT INTO `provinces` VALUES ('610111', '灞桥区', '610100', '', '0', '0', 'B', '109.07141535554', '34.279127674951', '3', 'tr_0 tr_610000 tr_610100 ', '0');
INSERT INTO `provinces` VALUES ('610112', '未央区', '610100', '', '0', '0', 'W', '108.95340118781', '34.299148106589', '3', 'tr_0 tr_610000 tr_610100 ', '0');
INSERT INTO `provinces` VALUES ('610113', '雁塔区', '610100', '', '0', '0', 'Y', '108.95144045638', '34.220635239986', '3', 'tr_0 tr_610000 tr_610100 ', '0');
INSERT INTO `provinces` VALUES ('610114', '阎良区', '610100', '', '0', '0', 'Y', '109.23246311822', '34.668363274699', '3', 'tr_0 tr_610000 tr_610100 ', '0');
INSERT INTO `provinces` VALUES ('610115', '临潼区', '610100', '', '0', '0', 'L', '109.22043579558', '34.372747432848', '3', 'tr_0 tr_610000 tr_610100 ', '0');
INSERT INTO `provinces` VALUES ('610116', '长安区', '610100', '', '0', '0', 'Z', '108.91358047235', '34.163290267305', '3', 'tr_0 tr_610000 tr_610100 ', '0');
INSERT INTO `provinces` VALUES ('610117', '高陵区', '610100', '', '0', '0', 'G', '109.09438691387', '34.541093106058', '3', 'tr_0 tr_610000 tr_610100 ', '0');
INSERT INTO `provinces` VALUES ('610118', '鄠邑区', '610100', '', '0', '0', 'H', '108.61142023271', '34.115020711599', '3', 'tr_0 tr_610000 tr_610100 ', '0');
INSERT INTO `provinces` VALUES ('610122', '蓝田县', '610100', '', '0', '0', 'L', '109.32938812681', '34.157620654732', '3', 'tr_0 tr_610000 tr_610100 ', '0');
INSERT INTO `provinces` VALUES ('610124', '周至县', '610100', '', '0', '0', 'Z', '108.22842183954', '34.169385269616', '3', 'tr_0 tr_610000 tr_610100 ', '0');
INSERT INTO `provinces` VALUES ('610202', '王益区', '610200', '', '0', '0', 'W', '109.08141735858', '35.075322096471', '3', 'tr_0 tr_610000 tr_610200 ', '0');
INSERT INTO `provinces` VALUES ('610203', '印台区', '610200', '', '0', '0', 'Y', '109.10643408907', '35.120859282945', '3', 'tr_0 tr_610000 tr_610200 ', '0');
INSERT INTO `provinces` VALUES ('610204', '耀州区', '610200', '', '0', '0', 'Y', '108.98643790006', '34.91596030911', '3', 'tr_0 tr_610000 tr_610200 ', '0');
INSERT INTO `provinces` VALUES ('610222', '宜君县', '610200', '', '0', '0', 'Y', '109.12353674801', '35.404582194219', '3', 'tr_0 tr_610000 tr_610200 ', '0');
INSERT INTO `provinces` VALUES ('610302', '渭滨区', '610300', '', '0', '0', 'W', '107.15641916768', '34.377481132682', '3', 'tr_0 tr_610000 tr_610300 ', '0');
INSERT INTO `provinces` VALUES ('610303', '金台区', '610300', '', '0', '0', 'J', '107.15342367813', '34.382351084696', '3', 'tr_0 tr_610000 tr_610300 ', '0');
INSERT INTO `provinces` VALUES ('610304', '陈仓区', '610300', '', '0', '0', 'C', '107.39343842395', '34.360756335457', '3', 'tr_0 tr_610000 tr_610300 ', '0');
INSERT INTO `provinces` VALUES ('610322', '凤翔县', '610300', '', '0', '0', 'F', '107.40737949665', '34.527616279899', '3', 'tr_0 tr_610000 tr_610300 ', '0');
INSERT INTO `provinces` VALUES ('610323', '岐山县', '610300', '', '0', '0', 'Q', '107.62744727879', '34.449776962387', '3', 'tr_0 tr_610000 tr_610300 ', '0');
INSERT INTO `provinces` VALUES ('610324', '扶风县', '610300', '', '0', '0', 'F', '107.9064530651', '34.381463351226', '3', 'tr_0 tr_610000 tr_610300 ', '0');
INSERT INTO `provinces` VALUES ('610326', '眉县', '610300', '', '0', '0', 'M', '107.75639813644', '34.280375863086', '3', 'tr_0 tr_610000 tr_610300 ', '0');
INSERT INTO `provinces` VALUES ('610327', '陇县', '610300', '', '0', '0', 'L', '106.87058365441', '34.898780253107', '3', 'tr_0 tr_610000 tr_610300 ', '0');
INSERT INTO `provinces` VALUES ('610328', '千阳县', '610300', '', '0', '0', 'Q', '107.13946616644', '34.648544600794', '3', 'tr_0 tr_610000 tr_610300 ', '0');
INSERT INTO `provinces` VALUES ('610329', '麟游县', '610300', '', '0', '0', 'L', '107.799514106', '34.683748667164', '3', 'tr_0 tr_610000 tr_610300 ', '0');
INSERT INTO `provinces` VALUES ('610330', '凤县', '610300', '', '0', '0', 'F', '106.52255782187', '33.916583016343', '3', 'tr_0 tr_610000 tr_610300 ', '0');
INSERT INTO `provinces` VALUES ('610331', '太白县', '610300', '', '0', '0', 'T', '107.32552913248', '34.064248441153', '3', 'tr_0 tr_610000 tr_610300 ', '0');
INSERT INTO `provinces` VALUES ('610402', '秦都区', '610400', '', '0', '0', 'Q', '108.71243199239', '34.3351451161', '3', 'tr_0 tr_610000 tr_610400 ', '0');
INSERT INTO `provinces` VALUES ('610403', '杨陵区', '610400', '', '0', '0', 'Y', '108.09151531881', '34.278012507654', '3', 'tr_0 tr_610000 tr_610400 ', '0');
INSERT INTO `provinces` VALUES ('610404', '渭城区', '610400', '', '0', '0', 'W', '108.74345057148', '34.368110229368', '3', 'tr_0 tr_610000 tr_610400 ', '0');
INSERT INTO `provinces` VALUES ('610422', '三原县', '610400', '', '0', '0', 'S', '108.94744650025', '34.623078955252', '3', 'tr_0 tr_610000 tr_610400 ', '0');
INSERT INTO `provinces` VALUES ('610423', '泾阳县', '610400', '', '0', '0', 'J', '108.84937884705', '34.533316532768', '3', 'tr_0 tr_610000 tr_610400 ', '0');
INSERT INTO `provinces` VALUES ('610424', '乾县', '610400', '', '0', '0', 'G', '108.24537762554', '34.534018266142', '3', 'tr_0 tr_610000 tr_610400 ', '0');
INSERT INTO `provinces` VALUES ('610425', '礼泉县', '610400', '', '0', '0', 'L', '108.43161549166', '34.487390768504', '3', 'tr_0 tr_610000 tr_610400 ', '0');
INSERT INTO `provinces` VALUES ('610426', '永寿县', '610400', '', '0', '0', 'Y', '108.14846878644', '34.698035535617', '3', 'tr_0 tr_610000 tr_610400 ', '0');
INSERT INTO `provinces` VALUES ('610428', '长武县', '610400', '', '0', '0', 'Z', '107.80556078005', '35.211657338715', '3', 'tr_0 tr_610000 tr_610400 ', '0');
INSERT INTO `provinces` VALUES ('610429', '旬邑县', '610400', '', '0', '0', 'X', '108.34046703665', '35.117963919719', '3', 'tr_0 tr_610000 tr_610400 ', '0');
INSERT INTO `provinces` VALUES ('610430', '淳化县', '610400', '', '0', '0', 'C', '108.58744176373', '34.804776911295', '3', 'tr_0 tr_610000 tr_610400 ', '0');
INSERT INTO `provinces` VALUES ('610431', '武功县', '610400', '', '0', '0', 'W', '108.20655106479', '34.266137667633', '3', 'tr_0 tr_610000 tr_610400 ', '0');
INSERT INTO `provinces` VALUES ('610481', '兴平市', '610400', '', '0', '0', 'X', '108.49639400877', '34.305476520292', '3', 'tr_0 tr_610000 tr_610400 ', '0');
INSERT INTO `provinces` VALUES ('610482', '彬州市', '610400', '', '0', '0', 'B', '108.08456557823', '35.049610571828', '3', 'tr_0 tr_610000 tr_610400 ', '0');
INSERT INTO `provinces` VALUES ('610502', '临渭区', '610500', '', '0', '0', 'L', '109.4985962764', '34.504000470428', '3', 'tr_0 tr_610000 tr_610500 ', '0');
INSERT INTO `provinces` VALUES ('610503', '华州区', '610500', '', '0', '0', 'H', '109.7784773716', '34.5187307401', '3', 'tr_0 tr_610000 tr_610500 ', '0');
INSERT INTO `provinces` VALUES ('610522', '潼关县', '610500', '', '0', '0', 'T', '110.25250761972', '34.550326848532', '3', 'tr_0 tr_610000 tr_610500 ', '0');
INSERT INTO `provinces` VALUES ('610523', '大荔县', '610500', '', '0', '0', 'D', '109.94845330291', '34.801832760484', '3', 'tr_0 tr_610000 tr_610500 ', '0');
INSERT INTO `provinces` VALUES ('610524', '合阳县', '610500', '', '0', '0', 'H', '110.15539621274', '35.243872196866', '3', 'tr_0 tr_610000 tr_610500 ', '0');
INSERT INTO `provinces` VALUES ('610525', '澄城县', '610500', '', '0', '0', 'C', '109.93843360325', '35.196572815551', '3', 'tr_0 tr_610000 tr_610500 ', '0');
INSERT INTO `provinces` VALUES ('610526', '蒲城县', '610500', '', '0', '0', 'P', '109.59249651068', '34.961274128783', '3', 'tr_0 tr_610000 tr_610500 ', '0');
INSERT INTO `provinces` VALUES ('610527', '白水县', '610500', '', '0', '0', 'B', '109.59752055374', '35.183287514613', '3', 'tr_0 tr_610000 tr_610500 ', '0');
INSERT INTO `provinces` VALUES ('610528', '富平县', '610500', '', '0', '0', 'F', '109.18643744728', '34.757260440256', '3', 'tr_0 tr_610000 tr_610500 ', '0');
INSERT INTO `provinces` VALUES ('610581', '韩城市', '610500', '', '0', '0', 'H', '110.44955264012', '35.482086787313', '3', 'tr_0 tr_610000 tr_610500 ', '0');
INSERT INTO `provinces` VALUES ('610582', '华阴市', '610500', '', '0', '0', 'H', '110.09860075704', '34.571800158753', '3', 'tr_0 tr_610000 tr_610500 ', '0');
INSERT INTO `provinces` VALUES ('610602', '宝塔区', '610600', '', '0', '0', 'B', '109.49959402433', '36.596890441313', '3', 'tr_0 tr_610000 tr_610600 ', '0');
INSERT INTO `provinces` VALUES ('610603', '安塞区', '610600', '', '0', '0', 'A', '109.33541943984', '36.870098259307', '3', 'tr_0 tr_610000 tr_610600 ', '0');
INSERT INTO `provinces` VALUES ('610621', '延长县', '610600', '', '0', '0', 'Y', '110.01847172589', '36.585328801705', '3', 'tr_0 tr_610000 tr_610600 ', '0');
INSERT INTO `provinces` VALUES ('610622', '延川县', '610600', '', '0', '0', 'Y', '110.20054028665', '36.884136960993', '3', 'tr_0 tr_610000 tr_610600 ', '0');
INSERT INTO `provinces` VALUES ('610623', '子长县', '610600', '', '0', '0', 'Z', '109.68138985954', '37.148816918367', '3', 'tr_0 tr_610000 tr_610600 ', '0');
INSERT INTO `provinces` VALUES ('610625', '志丹县', '610600', '', '0', '0', 'Z', '108.77557747991', '36.828021135864', '3', 'tr_0 tr_610000 tr_610600 ', '0');
INSERT INTO `provinces` VALUES ('610626', '吴起县', '610600', '', '0', '0', 'W', '108.18258966361', '36.932576099483', '3', 'tr_0 tr_610000 tr_610600 ', '0');
INSERT INTO `provinces` VALUES ('610627', '甘泉县', '610600', '', '0', '0', 'G', '109.35752350454', '36.282688619053', '3', 'tr_0 tr_610000 tr_610600 ', '0');
INSERT INTO `provinces` VALUES ('610628', '富县', '610600', '', '0', '0', 'F', '109.38659653355', '35.993367977969', '3', 'tr_0 tr_610000 tr_610600 ', '0');
INSERT INTO `provinces` VALUES ('610629', '洛川县', '610600', '', '0', '0', 'L', '109.43840396825', '35.768300429421', '3', 'tr_0 tr_610000 tr_610600 ', '0');
INSERT INTO `provinces` VALUES ('610630', '宜川县', '610600', '', '0', '0', 'Y', '110.17541306458', '36.056397437854', '3', 'tr_0 tr_610000 tr_610600 ', '0');
INSERT INTO `provinces` VALUES ('610631', '黄龙县', '610600', '', '0', '0', 'H', '109.84654907671', '35.590233768069', '3', 'tr_0 tr_610000 tr_610600 ', '0');
INSERT INTO `provinces` VALUES ('610632', '黄陵县', '610600', '', '0', '0', 'H', '109.26960598495', '35.585076348969', '3', 'tr_0 tr_610000 tr_610600 ', '0');
INSERT INTO `provinces` VALUES ('610702', '汉台区', '610700', '', '0', '0', 'H', '107.03840167622', '33.074191093099', '3', 'tr_0 tr_610000 tr_610700 ', '0');
INSERT INTO `provinces` VALUES ('610703', '南郑区', '610700', '', '0', '0', 'N', '106.94243318334', '33.005614599734', '3', 'tr_0 tr_610000 tr_610700 ', '0');
INSERT INTO `provinces` VALUES ('610722', '城固县', '610700', '', '0', '0', 'C', '107.3406125803', '33.162399385178', '3', 'tr_0 tr_610000 tr_610700 ', '0');
INSERT INTO `provinces` VALUES ('610723', '洋县', '610700', '', '0', '0', 'Y', '107.55246428058', '33.228862589315', '3', 'tr_0 tr_610000 tr_610700 ', '0');
INSERT INTO `provinces` VALUES ('610724', '西乡县', '610700', '', '0', '0', 'X', '107.77339281906', '32.989397441895', '3', 'tr_0 tr_610000 tr_610700 ', '0');
INSERT INTO `provinces` VALUES ('610725', '勉县', '610700', '', '0', '0', 'M', '106.67942594867', '33.159804746955', '3', 'tr_0 tr_610000 tr_610700 ', '0');
INSERT INTO `provinces` VALUES ('610726', '宁强县', '610700', '', '0', '0', 'N', '106.26458864382', '32.835380199209', '3', 'tr_0 tr_610000 tr_610700 ', '0');
INSERT INTO `provinces` VALUES ('610727', '略阳县', '610700', '', '0', '0', 'L', '106.16354400616', '33.333193777733', '3', 'tr_0 tr_610000 tr_610700 ', '0');
INSERT INTO `provinces` VALUES ('610728', '镇巴县', '610700', '', '0', '0', 'Z', '107.9014456407', '32.54283336567', '3', 'tr_0 tr_610000 tr_610700 ', '0');
INSERT INTO `provinces` VALUES ('610729', '留坝县', '610700', '', '0', '0', 'L', '106.92741441352', '33.623825216737', '3', 'tr_0 tr_610000 tr_610700 ', '0');
INSERT INTO `provinces` VALUES ('610730', '佛坪县', '610700', '', '0', '0', 'F', '107.99742428443', '33.530693101588', '3', 'tr_0 tr_610000 tr_610700 ', '0');
INSERT INTO `provinces` VALUES ('610802', '榆阳区', '610800', '', '0', '0', 'Y', '109.72755916953', '38.28241962673', '3', 'tr_0 tr_610000 tr_610800 ', '0');
INSERT INTO `provinces` VALUES ('610803', '横山区', '610800', '', '0', '0', 'H', '109.30049134534', '37.968573394166', '3', 'tr_0 tr_610000 tr_610800 ', '0');
INSERT INTO `provinces` VALUES ('610822', '府谷县', '610800', '', '0', '0', 'F', '111.0736281152', '39.03379562985', '3', 'tr_0 tr_610000 tr_610800 ', '0');
INSERT INTO `provinces` VALUES ('610824', '靖边县', '610800', '', '0', '0', 'J', '108.80060049853', '37.605063193955', '3', 'tr_0 tr_610000 tr_610800 ', '0');
INSERT INTO `provinces` VALUES ('610825', '定边县', '610800', '', '0', '0', 'D', '107.60756957446', '37.600459865341', '3', 'tr_0 tr_610000 tr_610800 ', '0');
INSERT INTO `provinces` VALUES ('610826', '绥德县', '610800', '', '0', '0', 'S', '110.26942648536', '37.508907288933', '3', 'tr_0 tr_610000 tr_610800 ', '0');
INSERT INTO `provinces` VALUES ('610827', '米脂县', '610800', '', '0', '0', 'M', '110.19045141747', '37.761397514329', '3', 'tr_0 tr_610000 tr_610800 ', '0');
INSERT INTO `provinces` VALUES ('610828', '佳县', '610800', '', '0', '0', 'J', '110.49747741874', '38.025611678572', '3', 'tr_0 tr_610000 tr_610800 ', '0');
INSERT INTO `provinces` VALUES ('610829', '吴堡县', '610800', '', '0', '0', 'W', '110.74645500778', '37.458269874078', '3', 'tr_0 tr_610000 tr_610800 ', '0');
INSERT INTO `provinces` VALUES ('610830', '清涧县', '610800', '', '0', '0', 'Q', '110.12755916227', '37.094852887828', '3', 'tr_0 tr_610000 tr_610800 ', '0');
INSERT INTO `provinces` VALUES ('610831', '子洲县', '610800', '', '0', '0', 'Z', '110.04239845247', '37.617025887547', '3', 'tr_0 tr_610000 tr_610800 ', '0');
INSERT INTO `provinces` VALUES ('610881', '神木市', '610800', '', '0', '0', 'S', '110.50542966826', '38.848544495221', '3', 'tr_0 tr_610000 tr_610800 ', '0');
INSERT INTO `provinces` VALUES ('610902', '汉滨区', '610900', '', '0', '0', 'H', '109.03359606476', '32.701196105738', '3', 'tr_0 tr_610000 tr_610900 ', '0');
INSERT INTO `provinces` VALUES ('610921', '汉阴县', '610900', '', '0', '0', 'H', '108.51550698561', '32.899120857292', '3', 'tr_0 tr_610000 tr_610900 ', '0');
INSERT INTO `provinces` VALUES ('610922', '石泉县', '610900', '', '0', '0', 'S', '108.25442679592', '33.044602110263', '3', 'tr_0 tr_610000 tr_610900 ', '0');
INSERT INTO `provinces` VALUES ('610923', '宁陕县', '610900', '', '0', '0', 'N', '108.32056400011', '33.316555486503', '3', 'tr_0 tr_610000 tr_610900 ', '0');
INSERT INTO `provinces` VALUES ('610924', '紫阳县', '610900', '', '0', '0', 'Z', '108.54159431661', '32.525785619364', '3', 'tr_0 tr_610000 tr_610900 ', '0');
INSERT INTO `provinces` VALUES ('610925', '岚皋县', '610900', '', '0', '0', 'L', '108.90861535814', '32.312880776501', '3', 'tr_0 tr_610000 tr_610900 ', '0');
INSERT INTO `provinces` VALUES ('610926', '平利县', '610900', '', '0', '0', 'P', '109.36854670128', '32.394804123185', '3', 'tr_0 tr_610000 tr_610900 ', '0');
INSERT INTO `provinces` VALUES ('610927', '镇坪县', '610900', '', '0', '0', 'Z', '109.53349679292', '31.889643295791', '3', 'tr_0 tr_610000 tr_610900 ', '0');
INSERT INTO `provinces` VALUES ('610928', '旬阳县', '610900', '', '0', '0', 'X', '109.37155674338', '32.839864221772', '3', 'tr_0 tr_610000 tr_610900 ', '0');
INSERT INTO `provinces` VALUES ('610929', '白河县', '610900', '', '0', '0', 'B', '110.11958688053', '32.814846485284', '3', 'tr_0 tr_610000 tr_610900 ', '0');
INSERT INTO `provinces` VALUES ('611002', '商州区', '611000', '', '0', '0', 'S', '109.94747163465', '33.86885529308', '3', 'tr_0 tr_610000 tr_611000 ', '0');
INSERT INTO `provinces` VALUES ('611021', '洛南县', '611000', '', '0', '0', 'L', '110.15442748007', '34.097070538846', '3', 'tr_0 tr_610000 tr_611000 ', '0');
INSERT INTO `provinces` VALUES ('611022', '丹凤县', '611000', '', '0', '0', 'D', '110.3335602886', '33.701537322921', '3', 'tr_0 tr_610000 tr_611000 ', '0');
INSERT INTO `provinces` VALUES ('611023', '商南县', '611000', '', '0', '0', 'S', '110.88840847837', '33.537533476707', '3', 'tr_0 tr_610000 tr_611000 ', '0');
INSERT INTO `provinces` VALUES ('611024', '山阳县', '611000', '', '0', '0', 'S', '109.88854863218', '33.537968382769', '3', 'tr_0 tr_610000 tr_611000 ', '0');
INSERT INTO `provinces` VALUES ('611025', '镇安县', '611000', '', '0', '0', 'Z', '109.15957460914', '33.429044650147', '3', 'tr_0 tr_610000 tr_611000 ', '0');
INSERT INTO `provinces` VALUES ('611026', '柞水县', '611000', '', '0', '0', 'Z', '109.120502272', '33.692026241945', '3', 'tr_0 tr_610000 tr_611000 ', '0');
INSERT INTO `provinces` VALUES ('620102', '城关区', '620100', '', '0', '0', 'C', '103.83147490053', '36.063181475369', '3', 'tr_0 tr_620000 tr_620100 ', '0');
INSERT INTO `provinces` VALUES ('620103', '七里河区', '620100', '', '0', '0', 'Q', '103.79241388204', '36.07212925843', '3', 'tr_0 tr_620000 tr_620100 ', '0');
INSERT INTO `provinces` VALUES ('620104', '西固区', '620100', '', '0', '0', 'X', '103.63458007682', '36.094109365757', '3', 'tr_0 tr_620000 tr_620100 ', '0');
INSERT INTO `provinces` VALUES ('620105', '安宁区', '620100', '', '0', '0', 'A', '103.72553503682', '36.109753754973', '3', 'tr_0 tr_620000 tr_620100 ', '0');
INSERT INTO `provinces` VALUES ('620111', '红古区', '620100', '', '0', '0', 'H', '102.86542781272', '36.351863423179', '3', 'tr_0 tr_620000 tr_620100 ', '0');
INSERT INTO `provinces` VALUES ('620121', '永登县', '620100', '', '0', '0', 'Y', '103.26662443823', '36.74209521344', '3', 'tr_0 tr_620000 tr_620100 ', '0');
INSERT INTO `provinces` VALUES ('620122', '皋兰县', '620100', '', '0', '0', 'G', '103.95346415997', '36.338142148673', '3', 'tr_0 tr_620000 tr_620100 ', '0');
INSERT INTO `provinces` VALUES ('620123', '榆中县', '620100', '', '0', '0', 'Y', '104.11956587928', '35.848851048242', '3', 'tr_0 tr_620000 tr_620100 ', '0');
INSERT INTO `provinces` VALUES ('620171', '兰州新区', '620100', '', '0', '0', 'L', '103.76383312444', '36.082833434467', '3', 'tr_0 tr_620000 tr_620100 ', '0');
INSERT INTO `provinces` VALUES ('620201', '市辖区', '620200', '', '0', '0', 'S', '98.208045429791', '39.821463455258', '3', 'tr_0 tr_620000 tr_620200 ', '0');
INSERT INTO `provinces` VALUES ('620302', '金川区', '620300', '', '0', '0', 'J', '102.20058588614', '38.525772245594', '3', 'tr_0 tr_620000 tr_620300 ', '0');
INSERT INTO `provinces` VALUES ('620321', '永昌县', '620300', '', '0', '0', 'Y', '101.97946358316', '38.252940956889', '3', 'tr_0 tr_620000 tr_620300 ', '0');
INSERT INTO `provinces` VALUES ('620402', '白银区', '620400', '', '0', '0', 'B', '104.15541276065', '36.541463568069', '3', 'tr_0 tr_620000 tr_620400 ', '0');
INSERT INTO `provinces` VALUES ('620403', '平川区', '620400', '', '0', '0', 'P', '104.83161394007', '36.733498751869', '3', 'tr_0 tr_620000 tr_620400 ', '0');
INSERT INTO `provinces` VALUES ('620421', '靖远县', '620400', '', '0', '0', 'J', '104.68251507796', '36.577096288837', '3', 'tr_0 tr_620000 tr_620400 ', '0');
INSERT INTO `provinces` VALUES ('620422', '会宁县', '620400', '', '0', '0', 'H', '105.05960693274', '35.698508053094', '3', 'tr_0 tr_620000 tr_620400 ', '0');
INSERT INTO `provinces` VALUES ('620423', '景泰县', '620400', '', '0', '0', 'J', '104.06944438436', '37.187406260097', '3', 'tr_0 tr_620000 tr_620400 ', '0');
INSERT INTO `provinces` VALUES ('620502', '秦州区', '620500', '', '0', '0', 'Q', '105.73041549435', '34.587315743121', '3', 'tr_0 tr_620000 tr_620500 ', '0');
INSERT INTO `provinces` VALUES ('620503', '麦积区', '620500', '', '0', '0', 'M', '105.89559698949', '34.576336861448', '3', 'tr_0 tr_620000 tr_620500 ', '0');
INSERT INTO `provinces` VALUES ('620521', '清水县', '620500', '', '0', '0', 'Q', '106.14359506621', '34.753882906363', '3', 'tr_0 tr_620000 tr_620500 ', '0');
INSERT INTO `provinces` VALUES ('620522', '秦安县', '620500', '', '0', '0', 'Q', '105.68157480343', '34.864876111568', '3', 'tr_0 tr_620000 tr_620500 ', '0');
INSERT INTO `provinces` VALUES ('620523', '甘谷县', '620500', '', '0', '0', 'G', '105.34247534291', '34.738300137398', '3', 'tr_0 tr_620000 tr_620500 ', '0');
INSERT INTO `provinces` VALUES ('620524', '武山县', '620500', '', '0', '0', 'W', '104.89742838309', '34.727669101635', '3', 'tr_0 tr_620000 tr_620500 ', '0');
INSERT INTO `provinces` VALUES ('620525', '张家川回族自治县', '620500', '', '0', '0', 'Z', '106.21139036271', '34.99490501302', '3', 'tr_0 tr_620000 tr_620500 ', '0');
INSERT INTO `provinces` VALUES ('620602', '凉州区', '620600', '', '0', '0', 'L', '102.64857479651', '37.934121948376', '3', 'tr_0 tr_620000 tr_620600 ', '0');
INSERT INTO `provinces` VALUES ('620621', '民勤县', '620600', '', '0', '0', 'M', '103.10040027988', '38.630624826433', '3', 'tr_0 tr_620000 tr_620600 ', '0');
INSERT INTO `provinces` VALUES ('620622', '古浪县', '620600', '', '0', '0', 'G', '102.90362978165', '37.475801906601', '3', 'tr_0 tr_620000 tr_620600 ', '0');
INSERT INTO `provinces` VALUES ('620623', '天祝藏族自治县', '620600', '', '0', '0', 'T', '103.14862131966', '36.97759617654', '3', 'tr_0 tr_620000 tr_620600 ', '0');
INSERT INTO `provinces` VALUES ('620702', '甘州区', '620700', '', '0', '0', 'G', '100.48455772128', '38.934781471785', '3', 'tr_0 tr_620000 tr_620700 ', '0');
INSERT INTO `provinces` VALUES ('620721', '肃南裕固族自治县', '620700', '', '0', '0', 'S', '99.621905418008', '38.843100205023', '3', 'tr_0 tr_620000 tr_620700 ', '0');
INSERT INTO `provinces` VALUES ('620722', '民乐县', '620700', '', '0', '0', 'M', '100.81942903742', '38.436842233981', '3', 'tr_0 tr_620000 tr_620700 ', '0');
INSERT INTO `provinces` VALUES ('620723', '临泽县', '620700', '', '0', '0', 'L', '100.17055476077', '39.158514444726', '3', 'tr_0 tr_620000 tr_620700 ', '0');
INSERT INTO `provinces` VALUES ('620724', '高台县', '620700', '', '0', '0', 'G', '99.825759504337', '39.383646046807', '3', 'tr_0 tr_620000 tr_620700 ', '0');
INSERT INTO `provinces` VALUES ('620725', '山丹县', '620700', '', '0', '0', 'S', '101.09561558172', '38.790452663306', '3', 'tr_0 tr_620000 tr_620700 ', '0');
INSERT INTO `provinces` VALUES ('620802', '崆峒区', '620800', '', '0', '0', 'K', '106.68141452757', '35.548814892232', '3', 'tr_0 tr_620000 tr_620800 ', '0');
INSERT INTO `provinces` VALUES ('620821', '泾川县', '620800', '', '0', '0', 'J', '107.37451813364', '35.338668597821', '3', 'tr_0 tr_620000 tr_620800 ', '0');
INSERT INTO `provinces` VALUES ('620822', '灵台县', '620800', '', '0', '0', 'L', '107.62746120252', '35.07158181696', '3', 'tr_0 tr_620000 tr_620800 ', '0');
INSERT INTO `provinces` VALUES ('620823', '崇信县', '620800', '', '0', '0', 'C', '107.04141513189', '35.308615839828', '3', 'tr_0 tr_620000 tr_620800 ', '0');
INSERT INTO `provinces` VALUES ('620825', '庄浪县', '620800', '', '0', '0', 'Z', '106.04258582178', '35.208192125804', '3', 'tr_0 tr_620000 tr_620800 ', '0');
INSERT INTO `provinces` VALUES ('620826', '静宁县', '620800', '', '0', '0', 'J', '105.73841580322', '35.528257189136', '3', 'tr_0 tr_620000 tr_620800 ', '0');
INSERT INTO `provinces` VALUES ('620881', '华亭市', '620800', '', '0', '0', 'H', '106.65948599177', '35.223550762897', '3', 'tr_0 tr_620000 tr_620800 ', '0');
INSERT INTO `provinces` VALUES ('620902', '肃州区', '620900', '', '0', '0', 'S', '98.514321853032', '39.751245509963', '3', 'tr_0 tr_620000 tr_620900 ', '0');
INSERT INTO `provinces` VALUES ('620921', '金塔县', '620900', '', '0', '0', 'J', '98.908368236172', '39.990029254093', '3', 'tr_0 tr_620000 tr_620900 ', '0');
INSERT INTO `provinces` VALUES ('620922', '瓜州县', '620900', '', '0', '0', 'G', '95.788736364512', '40.52610597895', '3', 'tr_0 tr_620000 tr_620900 ', '0');
INSERT INTO `provinces` VALUES ('620923', '肃北蒙古族自治县', '620900', '', '0', '0', 'S', '94.883692395412', '39.518329738436', '3', 'tr_0 tr_620000 tr_620900 ', '0');
INSERT INTO `provinces` VALUES ('620924', '阿克塞哈萨克族自治县', '620900', '', '0', '0', 'A', '94.346760190396', '39.640045316917', '3', 'tr_0 tr_620000 tr_620900 ', '0');
INSERT INTO `provinces` VALUES ('620981', '玉门市', '620900', '', '0', '0', 'Y', '97.051711691182', '40.297620020884', '3', 'tr_0 tr_620000 tr_620900 ', '0');
INSERT INTO `provinces` VALUES ('620982', '敦煌市', '620900', '', '0', '0', 'D', '94.668527025762', '40.147867484244', '3', 'tr_0 tr_620000 tr_620900 ', '0');
INSERT INTO `provinces` VALUES ('621002', '西峰区', '621000', '', '0', '0', 'X', '107.65739112517', '35.736864475978', '3', 'tr_0 tr_620000 tr_621000 ', '0');
INSERT INTO `provinces` VALUES ('621021', '庆城县', '621000', '', '0', '0', 'Q', '107.88840619724', '36.021726360644', '3', 'tr_0 tr_620000 tr_621000 ', '0');
INSERT INTO `provinces` VALUES ('621022', '环县', '621000', '', '0', '0', 'H', '107.31446964419', '36.574427108907', '3', 'tr_0 tr_620000 tr_621000 ', '0');
INSERT INTO `provinces` VALUES ('621023', '华池县', '621000', '', '0', '0', 'H', '107.99638952632', '36.467575129884', '3', 'tr_0 tr_620000 tr_621000 ', '0');
INSERT INTO `provinces` VALUES ('621024', '合水县', '621000', '', '0', '0', 'H', '108.026447188', '35.8252622164', '3', 'tr_0 tr_620000 tr_621000 ', '0');
INSERT INTO `provinces` VALUES ('621025', '正宁县', '621000', '', '0', '0', 'Z', '108.36637461671', '35.498218780898', '3', 'tr_0 tr_620000 tr_621000 ', '0');
INSERT INTO `provinces` VALUES ('621026', '宁县', '621000', '', '0', '0', 'N', '107.93457092587', '35.507932974537', '3', 'tr_0 tr_620000 tr_621000 ', '0');
INSERT INTO `provinces` VALUES ('621027', '镇原县', '621000', '', '0', '0', 'Z', '107.20757586986', '35.683230586316', '3', 'tr_0 tr_620000 tr_621000 ', '0');
INSERT INTO `provinces` VALUES ('621102', '安定区', '621100', '', '0', '0', 'A', '104.61650040265', '35.585600016725', '3', 'tr_0 tr_620000 tr_621100 ', '0');
INSERT INTO `provinces` VALUES ('621121', '通渭县', '621100', '', '0', '0', 'T', '105.24840362211', '35.217216821266', '3', 'tr_0 tr_620000 tr_621100 ', '0');
INSERT INTO `provinces` VALUES ('621122', '陇西县', '621100', '', '0', '0', 'L', '104.64138059069', '35.010197162318', '3', 'tr_0 tr_620000 tr_621100 ', '0');
INSERT INTO `provinces` VALUES ('621123', '渭源县', '621100', '', '0', '0', 'W', '104.22158401062', '35.142391958021', '3', 'tr_0 tr_620000 tr_621100 ', '0');
INSERT INTO `provinces` VALUES ('621124', '临洮县', '621100', '', '0', '0', 'L', '103.8656010777', '35.400587040258', '3', 'tr_0 tr_620000 tr_621100 ', '0');
INSERT INTO `provinces` VALUES ('621125', '漳县', '621100', '', '0', '0', 'Z', '104.4785953255', '34.854249981778', '3', 'tr_0 tr_620000 tr_621100 ', '0');
INSERT INTO `provinces` VALUES ('621126', '岷县', '621100', '', '0', '0', 'M', '104.04339603983', '34.44440764065', '3', 'tr_0 tr_620000 tr_621100 ', '0');
INSERT INTO `provinces` VALUES ('621202', '武都区', '621200', '', '0', '0', 'W', '104.93259336075', '33.398072188089', '3', 'tr_0 tr_620000 tr_621200 ', '0');
INSERT INTO `provinces` VALUES ('621221', '成县', '621200', '', '0', '0', 'C', '105.7484779029', '33.756635187351', '3', 'tr_0 tr_620000 tr_621200 ', '0');
INSERT INTO `provinces` VALUES ('621222', '文县', '621200', '', '0', '0', 'W', '104.68955842198', '32.949601280768', '3', 'tr_0 tr_620000 tr_621200 ', '0');
INSERT INTO `provinces` VALUES ('621223', '宕昌县', '621200', '', '0', '0', 'D', '104.39938579987', '34.053486291359', '3', 'tr_0 tr_620000 tr_621200 ', '0');
INSERT INTO `provinces` VALUES ('621224', '康县', '621200', '', '0', '0', 'K', '105.61539187549', '33.335376401996', '3', 'tr_0 tr_620000 tr_621200 ', '0');
INSERT INTO `provinces` VALUES ('621225', '西和县', '621200', '', '0', '0', 'X', '105.30761048912', '34.016787358437', '3', 'tr_0 tr_620000 tr_621200 ', '0');
INSERT INTO `provinces` VALUES ('621226', '礼县', '621200', '', '0', '0', 'L', '105.1835909694', '34.194685061207', '3', 'tr_0 tr_620000 tr_621200 ', '0');
INSERT INTO `provinces` VALUES ('621227', '徽县', '621200', '', '0', '0', 'H', '106.09441787005', '33.77519418709', '3', 'tr_0 tr_620000 tr_621200 ', '0');
INSERT INTO `provinces` VALUES ('621228', '两当县', '621200', '', '0', '0', 'L', '106.31141946599', '33.915122835173', '3', 'tr_0 tr_620000 tr_621200 ', '0');
INSERT INTO `provinces` VALUES ('622901', '临夏市', '622900', '', '0', '0', 'L', '103.2495491776', '35.609898772689', '3', 'tr_0 tr_620000 tr_622900 ', '0');
INSERT INTO `provinces` VALUES ('622921', '临夏县', '622900', '', '0', '0', 'L', '103.00251408439', '35.497397958837', '3', 'tr_0 tr_620000 tr_622900 ', '0');
INSERT INTO `provinces` VALUES ('622922', '康乐县', '622900', '', '0', '0', 'K', '103.71547554223', '35.376109760702', '3', 'tr_0 tr_620000 tr_622900 ', '0');
INSERT INTO `provinces` VALUES ('622923', '永靖县', '622900', '', '0', '0', 'Y', '103.29250749455', '35.963330304471', '3', 'tr_0 tr_620000 tr_622900 ', '0');
INSERT INTO `provinces` VALUES ('622924', '广河县', '622900', '', '0', '0', 'G', '103.58240999619', '35.494101361696', '3', 'tr_0 tr_620000 tr_622900 ', '0');
INSERT INTO `provinces` VALUES ('622925', '和政县', '622900', '', '0', '0', 'H', '103.35752370329', '35.430589904166', '3', 'tr_0 tr_620000 tr_622900 ', '0');
INSERT INTO `provinces` VALUES ('622926', '东乡族自治县', '622900', '', '0', '0', 'D', '103.39561320437', '35.669329728624', '3', 'tr_0 tr_620000 tr_622900 ', '0');
INSERT INTO `provinces` VALUES ('622927', '积石山保安族东乡族撒拉族自治县', '622900', '', '0', '0', 'J', '102.88251807505', '35.72349932364', '3', 'tr_0 tr_620000 tr_622900 ', '0');
INSERT INTO `provinces` VALUES ('623001', '合作市', '623000', '', '0', '0', 'H', '102.917571573', '35.005935428196', '3', 'tr_0 tr_620000 tr_623000 ', '0');
INSERT INTO `provinces` VALUES ('623021', '临潭县', '623000', '', '0', '0', 'L', '103.36053329624', '34.698639411522', '3', 'tr_0 tr_620000 tr_623000 ', '0');
INSERT INTO `provinces` VALUES ('623022', '卓尼县', '623000', '', '0', '0', 'Z', '103.51361578396', '34.594916432804', '3', 'tr_0 tr_620000 tr_623000 ', '0');
INSERT INTO `provinces` VALUES ('623023', '舟曲县', '623000', '', '0', '0', 'Z', '104.37748996239', '33.790814973644', '3', 'tr_0 tr_620000 tr_623000 ', '0');
INSERT INTO `provinces` VALUES ('623024', '迭部县', '623000', '', '0', '0', 'D', '103.22844034558', '34.062020054097', '3', 'tr_0 tr_620000 tr_623000 ', '0');
INSERT INTO `provinces` VALUES ('623025', '玛曲县', '623000', '', '0', '0', 'M', '102.07860004026', '34.003358168342', '3', 'tr_0 tr_620000 tr_623000 ', '0');
INSERT INTO `provinces` VALUES ('623026', '碌曲县', '623000', '', '0', '0', 'L', '102.49442413371', '34.597087271566', '3', 'tr_0 tr_620000 tr_623000 ', '0');
INSERT INTO `provinces` VALUES ('623027', '夏河县', '623000', '', '0', '0', 'X', '102.52857708038', '35.208324325541', '3', 'tr_0 tr_620000 tr_623000 ', '0');
INSERT INTO `provinces` VALUES ('630102', '城东区', '630100', '', '0', '0', 'C', '101.80956903833', '36.605707645661', '3', 'tr_0 tr_630000 tr_630100 ', '0');
INSERT INTO `provinces` VALUES ('630103', '城中区', '630100', '', '0', '0', 'C', '101.79048354964', '36.628800570589', '3', 'tr_0 tr_630000 tr_630100 ', '0');
INSERT INTO `provinces` VALUES ('630104', '城西区', '630100', '', '0', '0', 'C', '101.77241422413', '36.634496979524', '3', 'tr_0 tr_630000 tr_630100 ', '0');
INSERT INTO `provinces` VALUES ('630105', '城北区', '630100', '', '0', '0', 'C', '101.77240488176', '36.656293630837', '3', 'tr_0 tr_630000 tr_630100 ', '0');
INSERT INTO `provinces` VALUES ('630121', '大通回族土族自治县', '630100', '', '0', '0', 'D', '101.69256375752', '36.932666463407', '3', 'tr_0 tr_630000 tr_630100 ', '0');
INSERT INTO `provinces` VALUES ('630122', '湟中县', '630100', '', '0', '0', 'H', '101.57861675782', '36.506627546281', '3', 'tr_0 tr_630000 tr_630100 ', '0');
INSERT INTO `provinces` VALUES ('630123', '湟源县', '630100', '', '0', '0', 'H', '101.26244861154', '36.688587514903', '3', 'tr_0 tr_630000 tr_630100 ', '0');
INSERT INTO `provinces` VALUES ('630202', '乐都区', '630200', '', '0', '0', 'L', '102.40856633883', '36.487820051522', '3', 'tr_0 tr_630000 tr_630200 ', '0');
INSERT INTO `provinces` VALUES ('630203', '平安区', '630200', '', '0', '0', 'P', '102.11442787756', '36.506553573162', '3', 'tr_0 tr_630000 tr_630200 ', '0');
INSERT INTO `provinces` VALUES ('630222', '民和回族土族自治县', '630200', '', '0', '0', 'M', '102.11044407228', '36.508511080941', '3', 'tr_0 tr_630000 tr_630200 ', '0');
INSERT INTO `provinces` VALUES ('630223', '互助土族自治县', '630200', '', '0', '0', 'H', '101.96456904899', '36.850021613826', '3', 'tr_0 tr_630000 tr_630200 ', '0');
INSERT INTO `provinces` VALUES ('630224', '化隆回族自治县', '630200', '', '0', '0', 'H', '102.27044827345', '36.100988250893', '3', 'tr_0 tr_630000 tr_630200 ', '0');
INSERT INTO `provinces` VALUES ('630225', '循化撒拉族自治县', '630200', '', '0', '0', 'X', '102.4953853206', '35.856667223862', '3', 'tr_0 tr_630000 tr_630200 ', '0');
INSERT INTO `provinces` VALUES ('632221', '门源回族自治县', '632200', '', '0', '0', 'M', '101.62843803903', '37.382180626313', '3', 'tr_0 tr_630000 tr_632200 ', '0');
INSERT INTO `provinces` VALUES ('632222', '祁连县', '632200', '', '0', '0', 'Q', '100.25962157243', '38.182924871569', '3', 'tr_0 tr_630000 tr_632200 ', '0');
INSERT INTO `provinces` VALUES ('632223', '海晏县', '632200', '', '0', '0', 'H', '101.0005855486', '36.902376022515', '3', 'tr_0 tr_630000 tr_632200 ', '0');
INSERT INTO `provinces` VALUES ('632224', '刚察县', '632200', '', '0', '0', 'G', '100.15360607139', '37.327320072254', '3', 'tr_0 tr_630000 tr_632200 ', '0');
INSERT INTO `provinces` VALUES ('632321', '同仁县', '632300', '', '0', '0', 'T', '102.0254377812', '35.521865150524', '3', 'tr_0 tr_630000 tr_632300 ', '0');
INSERT INTO `provinces` VALUES ('632322', '尖扎县', '632300', '', '0', '0', 'J', '102.0375073242', '35.944284459868', '3', 'tr_0 tr_630000 tr_632300 ', '0');
INSERT INTO `provinces` VALUES ('632323', '泽库县', '632300', '', '0', '0', 'Z', '101.47359451319', '35.0420144951', '3', 'tr_0 tr_630000 tr_632300 ', '0');
INSERT INTO `provinces` VALUES ('632324', '河南蒙古族自治县', '632300', '', '0', '0', 'H', '101.62247338027', '34.740396071091', '3', 'tr_0 tr_630000 tr_632300 ', '0');
INSERT INTO `provinces` VALUES ('632521', '共和县', '632500', '', '0', '0', 'G', '100.62662348005', '36.288703317865', '3', 'tr_0 tr_630000 tr_632500 ', '0');
INSERT INTO `provinces` VALUES ('632522', '同德县', '632500', '', '0', '0', 'T', '100.58542386564', '35.259857775817', '3', 'tr_0 tr_630000 tr_632500 ', '0');
INSERT INTO `provinces` VALUES ('632523', '贵德县', '632500', '', '0', '0', 'G', '101.43953310384', '36.046158080751', '3', 'tr_0 tr_630000 tr_632500 ', '0');
INSERT INTO `provinces` VALUES ('632524', '兴海县', '632500', '', '0', '0', 'X', '99.994380072293', '35.594629879949', '3', 'tr_0 tr_630000 tr_632500 ', '0');
INSERT INTO `provinces` VALUES ('632525', '贵南县', '632500', '', '0', '0', 'G', '100.75359321473', '35.592415454611', '3', 'tr_0 tr_630000 tr_632500 ', '0');
INSERT INTO `provinces` VALUES ('632621', '玛沁县', '632600', '', '0', '0', 'M', '100.24556434882', '34.483569486002', '3', 'tr_0 tr_630000 tr_632600 ', '0');
INSERT INTO `provinces` VALUES ('632622', '班玛县', '632600', '', '0', '0', 'B', '100.74360459645', '32.93850392747', '3', 'tr_0 tr_630000 tr_632600 ', '0');
INSERT INTO `provinces` VALUES ('632623', '甘德县', '632600', '', '0', '0', 'G', '99.907510695578', '33.975003677602', '3', 'tr_0 tr_630000 tr_632600 ', '0');
INSERT INTO `provinces` VALUES ('632624', '达日县', '632600', '', '0', '0', 'D', '99.658010113065', '33.754937373991', '3', 'tr_0 tr_630000 tr_632600 ', '0');
INSERT INTO `provinces` VALUES ('632625', '久治县', '632600', '', '0', '0', 'J', '101.48853225585', '33.434773499408', '3', 'tr_0 tr_630000 tr_632600 ', '0');
INSERT INTO `provinces` VALUES ('632626', '玛多县', '632600', '', '0', '0', 'M', '98.215883832099', '34.920748646186', '3', 'tr_0 tr_630000 tr_632600 ', '0');
INSERT INTO `provinces` VALUES ('632701', '玉树市', '632700', '', '0', '0', 'Y', '97.015376401101', '32.999555650886', '3', 'tr_0 tr_630000 tr_632700 ', '0');
INSERT INTO `provinces` VALUES ('632722', '杂多县', '632700', '', '0', '0', 'Z', '95.306964878828', '32.89924067586', '3', 'tr_0 tr_630000 tr_632700 ', '0');
INSERT INTO `provinces` VALUES ('632723', '称多县', '632700', '', '0', '0', 'C', '97.115000009277', '33.374225698944', '3', 'tr_0 tr_630000 tr_632700 ', '0');
INSERT INTO `provinces` VALUES ('632724', '治多县', '632700', '', '0', '0', 'Z', '95.61979357437', '33.857953267719', '3', 'tr_0 tr_630000 tr_632700 ', '0');
INSERT INTO `provinces` VALUES ('632725', '囊谦县', '632700', '', '0', '0', 'N', '96.486918271283', '32.209194368698', '3', 'tr_0 tr_630000 tr_632700 ', '0');
INSERT INTO `provinces` VALUES ('632726', '曲麻莱县', '632700', '', '0', '0', 'Q', '95.803750013992', '34.132298666997', '3', 'tr_0 tr_630000 tr_632700 ', '0');
INSERT INTO `provinces` VALUES ('632801', '格尔木市', '632800', '', '0', '0', 'G', '94.933310210425', '36.412371046954', '3', 'tr_0 tr_630000 tr_632800 ', '0');
INSERT INTO `provinces` VALUES ('632802', '德令哈市', '632800', '', '0', '0', 'D', '97.367470299975', '37.375345907463', '3', 'tr_0 tr_630000 tr_632800 ', '0');
INSERT INTO `provinces` VALUES ('632803', '茫崖市', '632800', '', '0', '0', 'M', '90.87951750334', '38.261902814972', '3', 'tr_0 tr_630000 tr_632800 ', '0');
INSERT INTO `provinces` VALUES ('632821', '乌兰县', '632800', '', '0', '0', 'W', '98.486735699295', '36.935747859032', '3', 'tr_0 tr_630000 tr_632800 ', '0');
INSERT INTO `provinces` VALUES ('632822', '都兰县', '632800', '', '0', '0', 'D', '98.102704793777', '36.307611028682', '3', 'tr_0 tr_630000 tr_632800 ', '0');
INSERT INTO `provinces` VALUES ('632823', '天峻县', '632800', '', '0', '0', 'T', '99.029242967967', '37.306903395111', '3', 'tr_0 tr_630000 tr_632800 ', '0');
INSERT INTO `provinces` VALUES ('632857', '大柴旦行政委员会', '632800', '', '0', '0', 'D', '95.371722465415', '37.857987655919', '3', 'tr_0 tr_630000 tr_632800 ', '0');
INSERT INTO `provinces` VALUES ('640104', '兴庆区', '640100', '', '0', '0', 'X', '106.29549376692', '38.479578929456', '3', 'tr_0 tr_640000 tr_640100 ', '0');
INSERT INTO `provinces` VALUES ('640105', '西夏区', '640100', '', '0', '0', 'X', '106.15658124015', '38.496817469604', '3', 'tr_0 tr_640000 tr_640100 ', '0');
INSERT INTO `provinces` VALUES ('640106', '金凤区', '640100', '', '0', '0', 'J', '106.24956089094', '38.478695238722', '3', 'tr_0 tr_640000 tr_640100 ', '0');
INSERT INTO `provinces` VALUES ('640121', '永宁县', '640100', '', '0', '0', 'Y', '106.25960457536', '38.283001541521', '3', 'tr_0 tr_640000 tr_640100 ', '0');
INSERT INTO `provinces` VALUES ('640122', '贺兰县', '640100', '', '0', '0', 'H', '106.3565182653', '38.560406689579', '3', 'tr_0 tr_640000 tr_640100 ', '0');
INSERT INTO `provinces` VALUES ('640181', '灵武市', '640100', '', '0', '0', 'L', '106.34644035545', '38.108658666793', '3', 'tr_0 tr_640000 tr_640100 ', '0');
INSERT INTO `provinces` VALUES ('540502', '乃东区', '540500', '', '0', '0', 'N', '91.778681965641', '29.234229154985', '3', 'tr_0 tr_540000 tr_540500 ', '0');
INSERT INTO `provinces` VALUES ('540521', '扎囊县', '540500', '', '0', '0', 'Z', '91.343627127639', '29.251164315795', '3', 'tr_0 tr_540000 tr_540500 ', '0');
INSERT INTO `provinces` VALUES ('540522', '贡嘎县', '540500', '', '0', '0', 'G', '90.990582372498', '29.295585920341', '3', 'tr_0 tr_540000 tr_540500 ', '0');
INSERT INTO `provinces` VALUES ('540523', '桑日县', '540500', '', '0', '0', 'S', '92.022157253696', '29.265175836421', '3', 'tr_0 tr_540000 tr_540500 ', '0');
INSERT INTO `provinces` VALUES ('540524', '琼结县', '540500', '', '0', '0', 'Q', '91.690100777976', '29.030865581933', '3', 'tr_0 tr_540000 tr_540500 ', '0');
INSERT INTO `provinces` VALUES ('540525', '曲松县', '540500', '', '0', '0', 'Q', '92.210174662975', '29.068424815624', '3', 'tr_0 tr_540000 tr_540500 ', '0');
INSERT INTO `provinces` VALUES ('540526', '措美县', '540500', '', '0', '0', 'C', '91.439917573188', '28.444257990161', '3', 'tr_0 tr_540000 tr_540500 ', '0');
INSERT INTO `provinces` VALUES ('540527', '洛扎县', '540500', '', '0', '0', 'L', '90.866452001915', '28.391634617398', '3', 'tr_0 tr_540000 tr_540500 ', '0');
INSERT INTO `provinces` VALUES ('540528', '加查县', '540500', '', '0', '0', 'J', '92.600448881489', '29.146087474784', '3', 'tr_0 tr_540000 tr_540500 ', '0');
INSERT INTO `provinces` VALUES ('540529', '隆子县', '540500', '', '0', '0', 'L', '92.468965520987', '28.414018998419', '3', 'tr_0 tr_540000 tr_540500 ', '0');
INSERT INTO `provinces` VALUES ('540530', '错那县', '540500', '', '0', '0', 'C', '91.96375005827', '27.997004265923', '3', 'tr_0 tr_540000 tr_540500 ', '0');
INSERT INTO `provinces` VALUES ('540531', '浪卡子县', '540500', '', '0', '0', 'L', '90.404646883462', '28.973992017804', '3', 'tr_0 tr_540000 tr_540500 ', '0');
INSERT INTO `provinces` VALUES ('640302', '利通区', '640300', '', '0', '0', 'L', '106.21940702074', '37.990746080857', '3', 'tr_0 tr_640000 tr_640300 ', '0');
INSERT INTO `provinces` VALUES ('640303', '红寺堡区', '640300', '', '0', '0', 'H', '106.06842117808', '37.431882454446', '3', 'tr_0 tr_640000 tr_640300 ', '0');
INSERT INTO `provinces` VALUES ('640323', '盐池县', '640300', '', '0', '0', 'Y', '107.41337954864', '37.789295649909', '3', 'tr_0 tr_640000 tr_640300 ', '0');
INSERT INTO `provinces` VALUES ('640324', '同心县', '640300', '', '0', '0', 'T', '105.9205990776', '36.986269629165', '3', 'tr_0 tr_640000 tr_640300 ', '0');
INSERT INTO `provinces` VALUES ('640381', '青铜峡市', '640300', '', '0', '0', 'Q', '106.08537031661', '38.027412223967', '3', 'tr_0 tr_640000 tr_640300 ', '0');
INSERT INTO `provinces` VALUES ('640402', '原州区', '640400', '', '0', '0', 'Y', '106.29451461392', '36.009367675763', '3', 'tr_0 tr_640000 tr_640400 ', '0');
INSERT INTO `provinces` VALUES ('640422', '西吉县', '640400', '', '0', '0', 'X', '105.73538590857', '35.97007642089', '3', 'tr_0 tr_640000 tr_640400 ', '0');
INSERT INTO `provinces` VALUES ('640423', '隆德县', '640400', '', '0', '0', 'L', '106.1184982967', '35.631762315094', '3', 'tr_0 tr_640000 tr_640400 ', '0');
INSERT INTO `provinces` VALUES ('640424', '泾源县', '640400', '', '0', '0', 'J', '106.33739343083', '35.504361637679', '3', 'tr_0 tr_640000 tr_640400 ', '0');
INSERT INTO `provinces` VALUES ('640425', '彭阳县', '640400', '', '0', '0', 'P', '106.64454429656', '35.85540546349', '3', 'tr_0 tr_640000 tr_640400 ', '0');
INSERT INTO `provinces` VALUES ('640502', '沙坡头区', '640500', '', '0', '0', 'S', '105.20357090089', '37.505701418703', '3', 'tr_0 tr_640000 tr_640500 ', '0');
INSERT INTO `provinces` VALUES ('640521', '中宁县', '640500', '', '0', '0', 'Z', '105.6915371912', '37.497420805579', '3', 'tr_0 tr_640000 tr_640500 ', '0');
INSERT INTO `provinces` VALUES ('640522', '海原县', '640500', '', '0', '0', 'H', '105.65055514638', '36.570781489719', '3', 'tr_0 tr_640000 tr_640500 ', '0');
INSERT INTO `provinces` VALUES ('650102', '天山区', '650100', '', '0', '0', 'T', '87.638407777566', '43.800271358313', '3', 'tr_0 tr_650000 tr_650100 ', '0');
INSERT INTO `provinces` VALUES ('650103', '沙依巴克区', '650100', '', '0', '0', 'S', '87.604670027697', '43.807262352761', '3', 'tr_0 tr_650000 tr_650100 ', '0');
INSERT INTO `provinces` VALUES ('650104', '新市区', '650100', '', '0', '0', 'X', '87.575908441201', '43.861394002748', '3', 'tr_0 tr_650000 tr_650100 ', '0');
INSERT INTO `provinces` VALUES ('650105', '水磨沟区', '650100', '', '0', '0', 'S', '87.648896662192', '43.838251163831', '3', 'tr_0 tr_650000 tr_650100 ', '0');
INSERT INTO `provinces` VALUES ('650106', '头屯河区', '650100', '', '0', '0', 'T', '87.434506709858', '43.882653022602', '3', 'tr_0 tr_650000 tr_650100 ', '0');
INSERT INTO `provinces` VALUES ('650107', '达坂城区', '650100', '', '0', '0', 'D', '88.317397656607', '43.36994274634', '3', 'tr_0 tr_650000 tr_650100 ', '0');
INSERT INTO `provinces` VALUES ('650109', '米东区', '650100', '', '0', '0', 'M', '87.662134271848', '43.979247426398', '3', 'tr_0 tr_650000 tr_650100 ', '0');
INSERT INTO `provinces` VALUES ('650121', '乌鲁木齐县', '650100', '', '0', '0', 'W', '87.416028745179', '43.477086065793', '3', 'tr_0 tr_650000 tr_650100 ', '0');
INSERT INTO `provinces` VALUES ('650171', '乌鲁木齐经济技术开发区', '650100', '', '0', '0', 'W', '87.523118529771', '43.868981036009', '3', 'tr_0 tr_650000 tr_650100 ', '0');
INSERT INTO `provinces` VALUES ('650172', '乌鲁木齐高新技术产业开发区', '650100', '', '0', '0', 'W', '87.58408445863', '43.87767236981', '3', 'tr_0 tr_650000 tr_650100 ', '0');
INSERT INTO `provinces` VALUES ('650202', '独山子区', '650200', '', '0', '0', 'D', '84.893613283343', '44.334407392365', '3', 'tr_0 tr_650000 tr_650200 ', '0');
INSERT INTO `provinces` VALUES ('650203', '克拉玛依区', '650200', '', '0', '0', 'K', '84.866221962114', '45.596624206981', '3', 'tr_0 tr_650000 tr_650200 ', '0');
INSERT INTO `provinces` VALUES ('650204', '白碱滩区', '650200', '', '0', '0', 'B', '85.139510123686', '45.693951629764', '3', 'tr_0 tr_650000 tr_650200 ', '0');
INSERT INTO `provinces` VALUES ('650205', '乌尔禾区', '650200', '', '0', '0', 'W', '85.700304826442', '46.095295184689', '3', 'tr_0 tr_650000 tr_650200 ', '0');
INSERT INTO `provinces` VALUES ('650402', '高昌区', '650400', '', '0', '0', 'G', '89.192458882701', '42.948548691684', '3', 'tr_0 tr_650000 tr_650400 ', '0');
INSERT INTO `provinces` VALUES ('650421', '鄯善县', '650400', '', '0', '0', 'S', '90.220093886103', '42.874759228479', '3', 'tr_0 tr_650000 tr_650400 ', '0');
INSERT INTO `provinces` VALUES ('650422', '托克逊县', '650400', '', '0', '0', 'T', '88.660164359541', '42.798545831023', '3', 'tr_0 tr_650000 tr_650400 ', '0');
INSERT INTO `provinces` VALUES ('650502', '伊州区', '650500', '', '0', '0', 'Y', '93.521320462369', '42.832824924721', '3', 'tr_0 tr_650000 tr_650500 ', '0');
INSERT INTO `provinces` VALUES ('650521', '巴里坤哈萨克自治县', '650500', '', '0', '0', 'B', '93.022930953564', '43.605688770787', '3', 'tr_0 tr_650000 tr_650500 ', '0');
INSERT INTO `provinces` VALUES ('650522', '伊吾县', '650500', '', '0', '0', 'Y', '94.703825671285', '43.260676527466', '3', 'tr_0 tr_650000 tr_650500 ', '0');
INSERT INTO `provinces` VALUES ('652301', '昌吉市', '652300', '', '0', '0', 'C', '87.27386462195', '44.020126845939', '3', 'tr_0 tr_650000 tr_652300 ', '0');
INSERT INTO `provinces` VALUES ('652302', '阜康市', '652300', '', '0', '0', 'F', '87.993677905062', '44.163137321346', '3', 'tr_0 tr_650000 tr_652300 ', '0');
INSERT INTO `provinces` VALUES ('652323', '呼图壁县', '652300', '', '0', '0', 'H', '86.905143806731', '44.197654596132', '3', 'tr_0 tr_650000 tr_652300 ', '0');
INSERT INTO `provinces` VALUES ('652324', '玛纳斯县', '652300', '', '0', '0', 'M', '86.220643452199', '44.3100628588', '3', 'tr_0 tr_650000 tr_652300 ', '0');
INSERT INTO `provinces` VALUES ('652325', '奇台县', '652300', '', '0', '0', 'Q', '89.601080811724', '44.026897819018', '3', 'tr_0 tr_650000 tr_652300 ', '0');
INSERT INTO `provinces` VALUES ('652327', '吉木萨尔县', '652300', '', '0', '0', 'J', '89.187122858141', '44.005717795203', '3', 'tr_0 tr_650000 tr_652300 ', '0');
INSERT INTO `provinces` VALUES ('652328', '木垒哈萨克自治县', '652300', '', '0', '0', 'M', '90.292514737334', '43.840308302807', '3', 'tr_0 tr_650000 tr_652300 ', '0');
INSERT INTO `provinces` VALUES ('652701', '博乐市', '652700', '', '0', '0', 'B', '82.057972254591', '44.860009784639', '3', 'tr_0 tr_650000 tr_652700 ', '0');
INSERT INTO `provinces` VALUES ('652702', '阿拉山口市', '652700', '', '0', '0', 'A', '82.560725272438', '45.179670079921', '3', 'tr_0 tr_650000 tr_652700 ', '0');
INSERT INTO `provinces` VALUES ('652722', '精河县', '652700', '', '0', '0', 'J', '82.900655316205', '44.606645943492', '3', 'tr_0 tr_650000 tr_652700 ', '0');
INSERT INTO `provinces` VALUES ('652723', '温泉县', '652700', '', '0', '0', 'W', '81.031145546486', '44.974856638705', '3', 'tr_0 tr_650000 tr_652700 ', '0');
INSERT INTO `provinces` VALUES ('652801', '库尔勒市', '652800', '', '0', '0', 'K', '86.181494309938', '41.732373221412', '3', 'tr_0 tr_650000 tr_652800 ', '0');
INSERT INTO `provinces` VALUES ('652822', '轮台县', '652800', '', '0', '0', 'L', '84.258212152054', '41.783813000515', '3', 'tr_0 tr_650000 tr_652800 ', '0');
INSERT INTO `provinces` VALUES ('652823', '尉犁县', '652800', '', '0', '0', 'W', '86.266036536399', '41.350122782054', '3', 'tr_0 tr_650000 tr_652800 ', '0');
INSERT INTO `provinces` VALUES ('652824', '若羌县', '652800', '', '0', '0', 'R', '88.175324441896', '39.028991037175', '3', 'tr_0 tr_650000 tr_652800 ', '0');
INSERT INTO `provinces` VALUES ('652825', '且末县', '652800', '', '0', '0', 'Q', '85.535990385731', '38.15138769413', '3', 'tr_0 tr_650000 tr_652800 ', '0');
INSERT INTO `provinces` VALUES ('652826', '焉耆回族自治县', '652800', '', '0', '0', 'Y', '86.581222026277', '42.064850858728', '3', 'tr_0 tr_650000 tr_652800 ', '0');
INSERT INTO `provinces` VALUES ('652827', '和静县', '652800', '', '0', '0', 'H', '86.390398220692', '42.329365035879', '3', 'tr_0 tr_650000 tr_652800 ', '0');
INSERT INTO `provinces` VALUES ('652828', '和硕县', '652800', '', '0', '0', 'H', '86.883689037252', '42.288065062428', '3', 'tr_0 tr_650000 tr_652800 ', '0');
INSERT INTO `provinces` VALUES ('652829', '博湖县', '652800', '', '0', '0', 'B', '86.638469149986', '41.986430356829', '3', 'tr_0 tr_650000 tr_652800 ', '0');
INSERT INTO `provinces` VALUES ('652871', '库尔勒经济技术开发区', '652800', '', '0', '0', 'K', '86.229512961483', '41.71760888729', '3', 'tr_0 tr_650000 tr_652800 ', '0');
INSERT INTO `provinces` VALUES ('652901', '阿克苏市', '652900', '', '0', '0', 'A', '80.269926757334', '41.173859926953', '3', 'tr_0 tr_650000 tr_652900 ', '0');
INSERT INTO `provinces` VALUES ('652922', '温宿县', '652900', '', '0', '0', 'W', '80.245564352581', '41.282567249887', '3', 'tr_0 tr_650000 tr_652900 ', '0');
INSERT INTO `provinces` VALUES ('652923', '库车县', '652900', '', '0', '0', 'K', '82.968458787284', '41.723447514833', '3', 'tr_0 tr_650000 tr_652900 ', '0');
INSERT INTO `provinces` VALUES ('652924', '沙雅县', '652900', '', '0', '0', 'S', '82.788823736148', '41.227749329027', '3', 'tr_0 tr_650000 tr_652900 ', '0');
INSERT INTO `provinces` VALUES ('652925', '新和县', '652900', '', '0', '0', 'X', '82.615823030526', '41.553999628477', '3', 'tr_0 tr_650000 tr_652900 ', '0');
INSERT INTO `provinces` VALUES ('652926', '拜城县', '652900', '', '0', '0', 'B', '81.858516272038', '41.800706601984', '3', 'tr_0 tr_650000 tr_652900 ', '0');
INSERT INTO `provinces` VALUES ('652927', '乌什县', '652900', '', '0', '0', 'W', '79.230868990897', '41.220871106999', '3', 'tr_0 tr_650000 tr_652900 ', '0');
INSERT INTO `provinces` VALUES ('652928', '阿瓦提县', '652900', '', '0', '0', 'A', '80.381849245908', '40.649358802911', '3', 'tr_0 tr_650000 tr_652900 ', '0');
INSERT INTO `provinces` VALUES ('652929', '柯坪县', '652900', '', '0', '0', 'K', '79.053213535614', '40.514055520966', '3', 'tr_0 tr_650000 tr_652900 ', '0');
INSERT INTO `provinces` VALUES ('653001', '阿图什市', '653000', '', '0', '0', 'A', '76.174906408698', '39.722079128589', '3', 'tr_0 tr_650000 tr_653000 ', '0');
INSERT INTO `provinces` VALUES ('653022', '阿克陶县', '653000', '', '0', '0', 'A', '75.953725266709', '39.153888517642', '3', 'tr_0 tr_650000 tr_653000 ', '0');
INSERT INTO `provinces` VALUES ('653023', '阿合奇县', '653000', '', '0', '0', 'A', '78.45253927839', '40.942958224222', '3', 'tr_0 tr_650000 tr_653000 ', '0');
INSERT INTO `provinces` VALUES ('653024', '乌恰县', '653000', '', '0', '0', 'W', '75.26533363237', '39.725123590953', '3', 'tr_0 tr_650000 tr_653000 ', '0');
INSERT INTO `provinces` VALUES ('653101', '喀什市', '653100', '', '0', '0', 'K', '76.000312737915', '39.473649532912', '3', 'tr_0 tr_650000 tr_653100 ', '0');
INSERT INTO `provinces` VALUES ('653121', '疏附县', '653100', '', '0', '0', 'S', '75.869168667361', '39.381291555212', '3', 'tr_0 tr_650000 tr_653100 ', '0');
INSERT INTO `provinces` VALUES ('653122', '疏勒县', '653100', '', '0', '0', 'S', '76.056614395075', '39.406709108732', '3', 'tr_0 tr_650000 tr_653100 ', '0');
INSERT INTO `provinces` VALUES ('653123', '英吉沙县', '653100', '', '0', '0', 'Y', '76.182075425651', '38.935670863521', '3', 'tr_0 tr_650000 tr_653100 ', '0');
INSERT INTO `provinces` VALUES ('653124', '泽普县', '653100', '', '0', '0', 'Z', '77.266559423761', '38.190725516333', '3', 'tr_0 tr_650000 tr_653100 ', '0');
INSERT INTO `provinces` VALUES ('653125', '莎车县', '653100', '', '0', '0', 'S', '77.252436713686', '38.420156752419', '3', 'tr_0 tr_650000 tr_653100 ', '0');
INSERT INTO `provinces` VALUES ('653126', '叶城县', '653100', '', '0', '0', 'Y', '77.420097621865', '37.889166844427', '3', 'tr_0 tr_650000 tr_653100 ', '0');
INSERT INTO `provinces` VALUES ('653127', '麦盖提县', '653100', '', '0', '0', 'M', '77.658824287414', '38.911194315553', '3', 'tr_0 tr_650000 tr_653100 ', '0');
INSERT INTO `provinces` VALUES ('653128', '岳普湖县', '653100', '', '0', '0', 'Y', '76.78414771574', '39.239387333945', '3', 'tr_0 tr_650000 tr_653100 ', '0');
INSERT INTO `provinces` VALUES ('653129', '伽师县', '653100', '', '0', '0', 'J', '76.730385568257', '39.493851605868', '3', 'tr_0 tr_650000 tr_653100 ', '0');
INSERT INTO `provinces` VALUES ('653130', '巴楚县', '653100', '', '0', '0', 'B', '78.5557014018', '39.79078837708', '3', 'tr_0 tr_650000 tr_653100 ', '0');
INSERT INTO `provinces` VALUES ('653131', '塔什库尔干塔吉克自治县', '653100', '', '0', '0', 'T', '75.230804744838', '37.779045640763', '3', 'tr_0 tr_650000 tr_653100 ', '0');
INSERT INTO `provinces` VALUES ('653201', '和田市', '653200', '', '0', '0', 'H', '79.920212469755', '37.118335544466', '3', 'tr_0 tr_650000 tr_653200 ', '0');
INSERT INTO `provinces` VALUES ('653221', '和田县', '653200', '', '0', '0', 'H', '79.866215595042', '37.090362410221', '3', 'tr_0 tr_650000 tr_653200 ', '0');
INSERT INTO `provinces` VALUES ('653222', '墨玉县', '653200', '', '0', '0', 'M', '79.735479265358', '37.282993446907', '3', 'tr_0 tr_650000 tr_653200 ', '0');
INSERT INTO `provinces` VALUES ('653223', '皮山县', '653200', '', '0', '0', 'P', '78.289871062405', '37.627248714375', '3', 'tr_0 tr_650000 tr_653200 ', '0');
INSERT INTO `provinces` VALUES ('653224', '洛浦县', '653200', '', '0', '0', 'L', '80.195387611879', '37.079611030988', '3', 'tr_0 tr_650000 tr_653200 ', '0');
INSERT INTO `provinces` VALUES ('653225', '策勒县', '653200', '', '0', '0', 'C', '80.813201268742', '37.004122359371', '3', 'tr_0 tr_650000 tr_653200 ', '0');
INSERT INTO `provinces` VALUES ('653226', '于田县', '653200', '', '0', '0', 'Y', '81.683782914748', '36.86295413611', '3', 'tr_0 tr_650000 tr_653200 ', '0');
INSERT INTO `provinces` VALUES ('653227', '民丰县', '653200', '', '0', '0', 'M', '82.702713427589', '37.070256968231', '3', 'tr_0 tr_650000 tr_653200 ', '0');
INSERT INTO `provinces` VALUES ('654002', '伊宁市', '654000', '', '0', '0', 'Y', '81.284242405278', '43.915299436243', '3', 'tr_0 tr_650000 tr_654000 ', '0');
INSERT INTO `provinces` VALUES ('654003', '奎屯市', '654000', '', '0', '0', 'K', '84.909449241687', '44.432057210004', '3', 'tr_0 tr_650000 tr_654000 ', '0');
INSERT INTO `provinces` VALUES ('654004', '霍尔果斯市', '654000', '', '0', '0', 'H', '80.427129772427', '44.235308556093', '3', 'tr_0 tr_650000 tr_654000 ', '0');
INSERT INTO `provinces` VALUES ('654021', '伊宁县', '654000', '', '0', '0', 'Y', '81.533906479394', '43.982909125124', '3', 'tr_0 tr_650000 tr_654000 ', '0');
INSERT INTO `provinces` VALUES ('654022', '察布查尔锡伯自治县', '654000', '', '0', '0', 'C', '81.157924570907', '43.846690330452', '3', 'tr_0 tr_650000 tr_654000 ', '0');
INSERT INTO `provinces` VALUES ('654023', '霍城县', '654000', '', '0', '0', 'H', '80.885281123201', '44.062249507399', '3', 'tr_0 tr_650000 tr_654000 ', '0');
INSERT INTO `provinces` VALUES ('654024', '巩留县', '654000', '', '0', '0', 'G', '82.238225609409', '43.488485559536', '3', 'tr_0 tr_650000 tr_654000 ', '0');
INSERT INTO `provinces` VALUES ('654025', '新源县', '654000', '', '0', '0', 'X', '83.267022301497', '43.435927002185', '3', 'tr_0 tr_650000 tr_654000 ', '0');
INSERT INTO `provinces` VALUES ('654026', '昭苏县', '654000', '', '0', '0', 'Z', '81.137377539147', '43.163496741509', '3', 'tr_0 tr_650000 tr_654000 ', '0');
INSERT INTO `provinces` VALUES ('654027', '特克斯县', '654000', '', '0', '0', 'T', '81.842587249244', '43.224248213467', '3', 'tr_0 tr_650000 tr_654000 ', '0');
INSERT INTO `provinces` VALUES ('654028', '尼勒克县', '654000', '', '0', '0', 'N', '82.51800753168', '43.804594836238', '3', 'tr_0 tr_650000 tr_654000 ', '0');
INSERT INTO `provinces` VALUES ('654201', '塔城市', '654200', '', '0', '0', 'T', '82.987235518406', '46.750948254373', '3', 'tr_0 tr_650000 tr_654200 ', '0');
INSERT INTO `provinces` VALUES ('654202', '乌苏市', '654200', '', '0', '0', 'W', '84.720088146964', '44.424048034452', '3', 'tr_0 tr_650000 tr_654200 ', '0');
INSERT INTO `provinces` VALUES ('654221', '额敏县', '654200', '', '0', '0', 'E', '83.633374454783', '46.531884861309', '3', 'tr_0 tr_650000 tr_654200 ', '0');
INSERT INTO `provinces` VALUES ('654223', '沙湾县', '654200', '', '0', '0', 'S', '85.626144686035', '44.331949461741', '3', 'tr_0 tr_650000 tr_654200 ', '0');
INSERT INTO `provinces` VALUES ('654224', '托里县', '654200', '', '0', '0', 'T', '83.612909438315', '45.94274280505', '3', 'tr_0 tr_650000 tr_654200 ', '0');
INSERT INTO `provinces` VALUES ('654225', '裕民县', '654200', '', '0', '0', 'Y', '82.9894387025', '46.207453546928', '3', 'tr_0 tr_650000 tr_654200 ', '0');
INSERT INTO `provinces` VALUES ('654226', '和布克赛尔蒙古自治县', '654200', '', '0', '0', 'H', '85.735008883548', '46.798685112637', '3', 'tr_0 tr_650000 tr_654200 ', '0');
INSERT INTO `provinces` VALUES ('654301', '阿勒泰市', '654300', '', '0', '0', 'A', '88.139226564024', '47.832752648475', '3', 'tr_0 tr_650000 tr_654300 ', '0');
INSERT INTO `provinces` VALUES ('654321', '布尔津县', '654300', '', '0', '0', 'B', '86.881360170273', '47.707951723888', '3', 'tr_0 tr_650000 tr_654300 ', '0');
INSERT INTO `provinces` VALUES ('654322', '富蕴县', '654300', '', '0', '0', 'F', '89.531953408055', '46.999951053055', '3', 'tr_0 tr_650000 tr_654300 ', '0');
INSERT INTO `provinces` VALUES ('654323', '福海县', '654300', '', '0', '0', 'F', '87.493157246325', '47.118140737535', '3', 'tr_0 tr_650000 tr_654300 ', '0');
INSERT INTO `provinces` VALUES ('654324', '哈巴河县', '654300', '', '0', '0', 'H', '86.424817684664', '48.066148902458', '3', 'tr_0 tr_650000 tr_654300 ', '0');
INSERT INTO `provinces` VALUES ('654325', '青河县', '654300', '', '0', '0', 'Q', '90.389444407193', '46.68019396705', '3', 'tr_0 tr_650000 tr_654300 ', '0');
INSERT INTO `provinces` VALUES ('654326', '吉木乃县', '654300', '', '0', '0', 'J', '85.880818240706', '47.449018413257', '3', 'tr_0 tr_650000 tr_654300 ', '0');
INSERT INTO `provinces` VALUES ('659001', '石河子市', '659000', '', '0', '0', 'S', '114.5163190347', '36.772534944449', '3', 'tr_0 tr_650000 tr_659000 ', '0');
INSERT INTO `provinces` VALUES ('659002', '阿拉尔市', '659000', '', '0', '0', 'A', '81.287354225395', '40.553263894706', '3', 'tr_0 tr_650000 tr_659000 ', '0');
INSERT INTO `provinces` VALUES ('659003', '图木舒克市', '659000', '', '0', '0', 'T', '79.075616286896', '39.871209077425', '3', 'tr_0 tr_650000 tr_659000 ', '0');
INSERT INTO `provinces` VALUES ('659004', '五家渠市', '659000', '', '0', '0', 'W', '87.549936632296', '44.172444518901', '3', 'tr_0 tr_650000 tr_659000 ', '0');
INSERT INTO `provinces` VALUES ('659006', '铁门关市', '659000', '', '0', '0', 'T', '85.686857831724', '41.863648697693', '3', 'tr_0 tr_650000 tr_659000 ', '0');
INSERT INTO `provinces` VALUES ('130102', '长安区', '130100', '', '0', '0', 'Z', '114.54561160958', '38.043256136498', '3', 'tr_0 tr_130000 tr_130100 ', '0');
INSERT INTO `provinces` VALUES ('130104', '桥西区', '130100', '', '0', '0', 'Q', '114.46741977426', '38.010381080199', '3', 'tr_0 tr_130000 tr_130100 ', '0');
INSERT INTO `provinces` VALUES ('130105', '新华区', '130100', '', '0', '0', 'X', '114.46943844641', '38.057119539196', '3', 'tr_0 tr_130000 tr_130100 ', '0');
INSERT INTO `provinces` VALUES ('130107', '井陉矿区', '130100', '', '0', '0', 'J', '114.06863186515', '38.070565834517', '3', 'tr_0 tr_130000 tr_130100 ', '0');
INSERT INTO `provinces` VALUES ('130108', '裕华区', '130100', '', '0', '0', 'Y', '114.53758291426', '38.012087686284', '3', 'tr_0 tr_130000 tr_130100 ', '0');
INSERT INTO `provinces` VALUES ('130109', '藁城区', '130100', '', '0', '0', 'G', '114.85337790442', '38.027816555321', '3', 'tr_0 tr_130000 tr_130100 ', '0');
INSERT INTO `provinces` VALUES ('130110', '鹿泉区', '130100', '', '0', '0', 'L', '114.32059757764', '38.09174945759', '3', 'tr_0 tr_130000 tr_130100 ', '0');
INSERT INTO `provinces` VALUES ('130111', '栾城区', '130100', '', '0', '0', 'L', '114.65457561879', '37.905816364165', '3', 'tr_0 tr_130000 tr_130100 ', '0');
INSERT INTO `provinces` VALUES ('130121', '井陉县', '130100', '', '0', '0', 'J', '114.15146299928', '38.038386214927', '3', 'tr_0 tr_130000 tr_130100 ', '0');
INSERT INTO `provinces` VALUES ('130123', '正定县', '130100', '', '0', '0', 'Z', '114.57748106365', '38.151713727954', '3', 'tr_0 tr_130000 tr_130100 ', '0');
INSERT INTO `provinces` VALUES ('130125', '行唐县', '130100', '', '0', '0', 'X', '114.55960676028', '38.444238747676', '3', 'tr_0 tr_130000 tr_130100 ', '0');
INSERT INTO `provinces` VALUES ('130126', '灵寿县', '130100', '', '0', '0', 'L', '114.38947775771', '38.314629370046', '3', 'tr_0 tr_130000 tr_130100 ', '0');
INSERT INTO `provinces` VALUES ('130127', '高邑县', '130100', '', '0', '0', 'G', '114.61841307286', '37.621879561553', '3', 'tr_0 tr_130000 tr_130100 ', '0');
INSERT INTO `provinces` VALUES ('130128', '深泽县', '130100', '', '0', '0', 'S', '115.20740369913', '38.190451203069', '3', 'tr_0 tr_130000 tr_130100 ', '0');
INSERT INTO `provinces` VALUES ('130129', '赞皇县', '130100', '', '0', '0', 'Z', '114.39246354556', '37.671667061291', '3', 'tr_0 tr_130000 tr_130100 ', '0');
INSERT INTO `provinces` VALUES ('130130', '无极县', '130100', '', '0', '0', 'W', '114.98243934348', '38.18543617028', '3', 'tr_0 tr_130000 tr_130100 ', '0');
INSERT INTO `provinces` VALUES ('130131', '平山县', '130100', '', '0', '0', 'P', '113.98543503085', '38.271951013311', '3', 'tr_0 tr_130000 tr_130100 ', '0');
INSERT INTO `provinces` VALUES ('130132', '元氏县', '130100', '', '0', '0', 'Y', '114.53256551866', '37.772338553855', '3', 'tr_0 tr_130000 tr_130100 ', '0');
INSERT INTO `provinces` VALUES ('130133', '赵县', '130100', '', '0', '0', 'Z', '114.78259655058', '37.761858522888', '3', 'tr_0 tr_130000 tr_130100 ', '0');
INSERT INTO `provinces` VALUES ('130171', '石家庄高新技术产业开发区', '130100', '', '0', '0', 'S', '114.47561896798', '38.014375062684', '3', 'tr_0 tr_130000 tr_130100 ', '0');
INSERT INTO `provinces` VALUES ('130172', '石家庄循环化工园区', '130100', '', '0', '0', 'S', '114.69991493042', '38.002797025837', '3', 'tr_0 tr_130000 tr_130100 ', '0');
INSERT INTO `provinces` VALUES ('130181', '辛集市', '130100', '', '0', '0', 'X', '115.22445084279', '37.949309043173', '3', 'tr_0 tr_130000 tr_130100 ', '0');
INSERT INTO `provinces` VALUES ('130183', '晋州市', '130100', '', '0', '0', 'J', '115.0505290147', '38.039491309736', '3', 'tr_0 tr_130000 tr_130100 ', '0');
INSERT INTO `provinces` VALUES ('130184', '新乐市', '130100', '', '0', '0', 'X', '114.69053218327', '38.349292647959', '3', 'tr_0 tr_130000 tr_130100 ', '0');
INSERT INTO `provinces` VALUES ('130202', '路南区', '130200', '', '0', '0', 'L', '118.20604028639', '39.612986996735', '3', 'tr_0 tr_130000 tr_130200 ', '0');
INSERT INTO `provinces` VALUES ('130203', '路北区', '130200', '', '0', '0', 'L', '118.2239040796', '39.673985965975', '3', 'tr_0 tr_130000 tr_130200 ', '0');
INSERT INTO `provinces` VALUES ('130204', '古冶区', '130200', '', '0', '0', 'G', '118.45340092552', '39.739735914766', '3', 'tr_0 tr_130000 tr_130200 ', '0');
INSERT INTO `provinces` VALUES ('130205', '开平区', '130200', '', '0', '0', 'K', '118.26860762449', '39.677143635862', '3', 'tr_0 tr_130000 tr_130200 ', '0');
INSERT INTO `provinces` VALUES ('130207', '丰南区', '130200', '', '0', '0', 'F', '118.0903655757', '39.581540485109', '3', 'tr_0 tr_130000 tr_130200 ', '0');
INSERT INTO `provinces` VALUES ('130208', '丰润区', '130200', '', '0', '0', 'F', '118.16854133135', '39.838353430851', '3', 'tr_0 tr_130000 tr_130200 ', '0');
INSERT INTO `provinces` VALUES ('130209', '曹妃甸区', '130200', '', '0', '0', 'C', '118.46645986221', '39.279283996335', '3', 'tr_0 tr_130000 tr_130200 ', '0');
INSERT INTO `provinces` VALUES ('130224', '滦南县', '130200', '', '0', '0', 'L', '118.68040524315', '39.510044702469', '3', 'tr_0 tr_130000 tr_130200 ', '0');
INSERT INTO `provinces` VALUES ('130225', '乐亭县', '130200', '', '0', '0', 'L', '118.91938406305', '39.431931320096', '3', 'tr_0 tr_130000 tr_130200 ', '0');
INSERT INTO `provinces` VALUES ('130227', '迁西县', '130200', '', '0', '0', 'Q', '118.32038397781', '40.147837151362', '3', 'tr_0 tr_130000 tr_130200 ', '0');
INSERT INTO `provinces` VALUES ('130229', '玉田县', '130200', '', '0', '0', 'Y', '117.74543440564', '39.906592348189', '3', 'tr_0 tr_130000 tr_130200 ', '0');
INSERT INTO `provinces` VALUES ('130271', '唐山市芦台经济技术开发区', '130200', '', '0', '0', 'T', '117.83195389236', '39.334328330689', '3', 'tr_0 tr_130000 tr_130200 ', '0');
INSERT INTO `provinces` VALUES ('130272', '唐山市汉沽管理区', '130200', '', '0', '0', 'T', '117.88832858176', '39.367125548614', '3', 'tr_0 tr_130000 tr_130200 ', '0');
INSERT INTO `provinces` VALUES ('130273', '唐山高新技术产业开发区', '130200', '', '0', '0', 'T', '118.18645947204', '39.636583724147', '3', 'tr_0 tr_130000 tr_130200 ', '0');
INSERT INTO `provinces` VALUES ('130274', '河北唐山海港经济开发区', '130200', '', '0', '0', 'H', '119.00992050252', '39.237818631017', '3', 'tr_0 tr_130000 tr_130200 ', '0');
INSERT INTO `provinces` VALUES ('130281', '遵化市', '130200', '', '0', '0', 'Z', '117.97237521307', '40.195533204033', '3', 'tr_0 tr_130000 tr_130200 ', '0');
INSERT INTO `provinces` VALUES ('130283', '迁安市', '130200', '', '0', '0', 'Q', '118.70645736056', '40.004183924931', '3', 'tr_0 tr_130000 tr_130200 ', '0');
INSERT INTO `provinces` VALUES ('130284', '滦州市', '130200', '', '0', '0', 'L', '118.71048006247', '39.747115765489', '3', 'tr_0 tr_130000 tr_130200 ', '0');
INSERT INTO `provinces` VALUES ('130302', '海港区', '130300', '', '0', '0', 'H', '119.61747524097', '39.940412688357', '3', 'tr_0 tr_130000 tr_130300 ', '0');
INSERT INTO `provinces` VALUES ('130303', '山海关区', '130300', '', '0', '0', 'S', '119.78243521397', '39.984445641831', '3', 'tr_0 tr_130000 tr_130300 ', '0');
INSERT INTO `provinces` VALUES ('130304', '北戴河区', '130300', '', '0', '0', 'B', '119.49152607118', '39.841005667936', '3', 'tr_0 tr_130000 tr_130300 ', '0');
INSERT INTO `provinces` VALUES ('130306', '抚宁区', '130300', '', '0', '0', 'F', '119.25154914402', '39.88141356935', '3', 'tr_0 tr_130000 tr_130300 ', '0');
INSERT INTO `provinces` VALUES ('130321', '青龙满族自治县', '130300', '', '0', '0', 'Q', '118.95648129587', '40.412793702313', '3', 'tr_0 tr_130000 tr_130300 ', '0');
INSERT INTO `provinces` VALUES ('130322', '昌黎县', '130300', '', '0', '0', 'C', '119.16937521021', '39.71905083388', '3', 'tr_0 tr_130000 tr_130300 ', '0');
INSERT INTO `provinces` VALUES ('130324', '卢龙县', '130300', '', '0', '0', 'L', '118.89948911126', '39.897958466103', '3', 'tr_0 tr_130000 tr_130300 ', '0');
INSERT INTO `provinces` VALUES ('130371', '秦皇岛市经济技术开发区', '130300', '', '0', '0', 'Q', '119.48439783729', '39.943641230776', '3', 'tr_0 tr_130000 tr_130300 ', '0');
INSERT INTO `provinces` VALUES ('130372', '北戴河新区', '130300', '', '0', '0', 'B', '119.47981001139', '39.831809170026', '3', 'tr_0 tr_130000 tr_130300 ', '0');
INSERT INTO `provinces` VALUES ('130402', '邯山区', '130400', '', '0', '0', 'H', '114.49638868967', '36.586692191979', '3', 'tr_0 tr_130000 tr_130400 ', '0');
INSERT INTO `provinces` VALUES ('130403', '丛台区', '130400', '', '0', '0', 'C', '114.49943259789', '36.642672565982', '3', 'tr_0 tr_130000 tr_130400 ', '0');
INSERT INTO `provinces` VALUES ('130404', '复兴区', '130400', '', '0', '0', 'F', '114.44809470749', '36.610368592227', '3', 'tr_0 tr_130000 tr_130400 ', '0');
INSERT INTO `provinces` VALUES ('130406', '峰峰矿区', '130400', '', '0', '0', 'F', '114.21948332131', '36.425653614399', '3', 'tr_0 tr_130000 tr_130400 ', '0');
INSERT INTO `provinces` VALUES ('130407', '肥乡区', '130400', '', '0', '0', 'F', '114.80654708226', '36.55382525367', '3', 'tr_0 tr_130000 tr_130400 ', '0');
INSERT INTO `provinces` VALUES ('130408', '永年区', '130400', '', '0', '0', 'Y', '114.55062514246', '36.747569389575', '3', 'tr_0 tr_130000 tr_130400 ', '0');
INSERT INTO `provinces` VALUES ('130423', '临漳县', '130400', '', '0', '0', 'L', '114.62642694614', '36.340765980595', '3', 'tr_0 tr_130000 tr_130400 ', '0');
INSERT INTO `provinces` VALUES ('130424', '成安县', '130400', '', '0', '0', 'C', '114.67657655802', '36.449796208953', '3', 'tr_0 tr_130000 tr_130400 ', '0');
INSERT INTO `provinces` VALUES ('130425', '大名县', '130400', '', '0', '0', 'D', '115.15461253007', '36.291288466231', '3', 'tr_0 tr_130000 tr_130400 ', '0');
INSERT INTO `provinces` VALUES ('130426', '涉县', '130400', '', '0', '0', 'S', '113.69758434883', '36.590691663211', '3', 'tr_0 tr_130000 tr_130400 ', '0');
INSERT INTO `provinces` VALUES ('130427', '磁县', '130400', '', '0', '0', 'C', '114.38043173139', '36.380358940947', '3', 'tr_0 tr_130000 tr_130400 ', '0');
INSERT INTO `provinces` VALUES ('130430', '邱县', '130400', '', '0', '0', 'Q', '115.19339516368', '36.817362417143', '3', 'tr_0 tr_130000 tr_130400 ', '0');
INSERT INTO `provinces` VALUES ('130431', '鸡泽县', '130400', '', '0', '0', 'J', '114.89658577064', '36.916398206414', '3', 'tr_0 tr_130000 tr_130400 ', '0');
INSERT INTO `provinces` VALUES ('130432', '广平县', '130400', '', '0', '0', 'G', '114.95441490649', '36.489779995612', '3', 'tr_0 tr_130000 tr_130400 ', '0');
INSERT INTO `provinces` VALUES ('130433', '馆陶县', '130400', '', '0', '0', 'G', '115.28853676635', '36.553956728653', '3', 'tr_0 tr_130000 tr_130400 ', '0');
INSERT INTO `provinces` VALUES ('130434', '魏县', '130400', '', '0', '0', 'W', '114.94545044631', '36.366156454371', '3', 'tr_0 tr_130000 tr_130400 ', '0');
INSERT INTO `provinces` VALUES ('130435', '曲周县', '130400', '', '0', '0', 'Q', '114.96340442939', '36.771544831336', '3', 'tr_0 tr_130000 tr_130400 ', '0');
INSERT INTO `provinces` VALUES ('130471', '邯郸经济技术开发区', '130400', '', '0', '0', 'H', '114.54562822824', '36.631262731204', '3', 'tr_0 tr_130000 tr_130400 ', '0');
INSERT INTO `provinces` VALUES ('130473', '邯郸冀南新区', '130400', '', '0', '0', 'H', '114.54562822824', '36.631262731204', '3', 'tr_0 tr_130000 tr_130400 ', '0');
INSERT INTO `provinces` VALUES ('130481', '武安市', '130400', '', '0', '0', 'W', '114.21051607638', '36.70248828628', '3', 'tr_0 tr_130000 tr_130400 ', '0');
INSERT INTO `provinces` VALUES ('130502', '桥东区', '130500', '', '0', '0', 'Q', '114.51347113674', '37.073749959651', '3', 'tr_0 tr_130000 tr_130500 ', '0');
INSERT INTO `provinces` VALUES ('130503', '桥西区', '130500', '', '0', '0', 'Q', '114.4743934996', '37.066172415704', '3', 'tr_0 tr_130000 tr_130500 ', '0');
INSERT INTO `provinces` VALUES ('130521', '邢台县', '130500', '', '0', '0', 'X', '114.14341085818', '37.17710928752', '3', 'tr_0 tr_130000 tr_130500 ', '0');
INSERT INTO `provinces` VALUES ('130522', '临城县', '130500', '', '0', '0', 'L', '114.50544333972', '37.450788548442', '3', 'tr_0 tr_130000 tr_130500 ', '0');
INSERT INTO `provinces` VALUES ('130523', '内丘县', '130500', '', '0', '0', 'N', '114.51849293403', '37.292857912047', '3', 'tr_0 tr_130000 tr_130500 ', '0');
INSERT INTO `provinces` VALUES ('130524', '柏乡县', '130500', '', '0', '0', 'B', '114.69949736209', '37.488758727152', '3', 'tr_0 tr_130000 tr_130500 ', '0');
INSERT INTO `provinces` VALUES ('130525', '隆尧县', '130500', '', '0', '0', 'L', '114.77661608165', '37.355908006295', '3', 'tr_0 tr_130000 tr_130500 ', '0');
INSERT INTO `provinces` VALUES ('130526', '任县', '130500', '', '0', '0', 'R', '114.67860600983', '37.126726783523', '3', 'tr_0 tr_130000 tr_130500 ', '0');
INSERT INTO `provinces` VALUES ('130527', '南和县', '130500', '', '0', '0', 'N', '114.69054772395', '37.01099797056', '3', 'tr_0 tr_130000 tr_130500 ', '0');
INSERT INTO `provinces` VALUES ('130528', '宁晋县', '130500', '', '0', '0', 'N', '114.92556169283', '37.625612279932', '3', 'tr_0 tr_130000 tr_130500 ', '0');
INSERT INTO `provinces` VALUES ('130529', '巨鹿县', '130500', '', '0', '0', 'J', '115.04358735887', '37.227088328938', '3', 'tr_0 tr_130000 tr_130500 ', '0');
INSERT INTO `provinces` VALUES ('130530', '新河县', '130500', '', '0', '0', 'X', '115.24854716945', '37.534590601536', '3', 'tr_0 tr_130000 tr_130500 ', '0');
INSERT INTO `provinces` VALUES ('130531', '广宗县', '130500', '', '0', '0', 'G', '115.14960474634', '37.080457122162', '3', 'tr_0 tr_130000 tr_130500 ', '0');
INSERT INTO `provinces` VALUES ('130532', '平乡县', '130500', '', '0', '0', 'P', '115.03658174369', '37.069096393044', '3', 'tr_0 tr_130000 tr_130500 ', '0');
INSERT INTO `provinces` VALUES ('130533', '威县', '130500', '', '0', '0', 'W', '115.27361761861', '36.981581608663', '3', 'tr_0 tr_130000 tr_130500 ', '0');
INSERT INTO `provinces` VALUES ('130534', '清河县', '130500', '', '0', '0', 'Q', '115.67439356765', '37.046375401617', '3', 'tr_0 tr_130000 tr_130500 ', '0');
INSERT INTO `provinces` VALUES ('130535', '临西县', '130500', '', '0', '0', 'L', '115.50762943786', '36.87675996654', '3', 'tr_0 tr_130000 tr_130500 ', '0');
INSERT INTO `provinces` VALUES ('130571', '河北邢台经济开发区', '130500', '', '0', '0', 'H', '114.51146225613', '37.076685950966', '3', 'tr_0 tr_130000 tr_130500 ', '0');
INSERT INTO `provinces` VALUES ('130581', '南宫市', '130500', '', '0', '0', 'N', '115.4145290548', '37.364069402723', '3', 'tr_0 tr_130000 tr_130500 ', '0');
INSERT INTO `provinces` VALUES ('130582', '沙河市', '130500', '', '0', '0', 'S', '114.50947385688', '36.861127341145', '3', 'tr_0 tr_130000 tr_130500 ', '0');
INSERT INTO `provinces` VALUES ('130602', '竞秀区', '130600', '', '0', '0', 'J', '115.46543414161', '38.883787961691', '3', 'tr_0 tr_130000 tr_130600 ', '0');
INSERT INTO `provinces` VALUES ('130606', '莲池区', '130600', '', '0', '0', 'L', '115.53548768833', '38.860675807041', '3', 'tr_0 tr_130000 tr_130600 ', '0');
INSERT INTO `provinces` VALUES ('130607', '满城区', '130600', '', '0', '0', 'M', '115.3283750886', '38.955441208686', '3', 'tr_0 tr_130000 tr_130600 ', '0');
INSERT INTO `provinces` VALUES ('130608', '清苑区', '130600', '', '0', '0', 'Q', '115.49660588179', '38.771001774749', '3', 'tr_0 tr_130000 tr_130600 ', '0');
INSERT INTO `provinces` VALUES ('130609', '徐水区', '130600', '', '0', '0', 'X', '115.66247952133', '39.024712583834', '3', 'tr_0 tr_130000 tr_130600 ', '0');
INSERT INTO `provinces` VALUES ('130623', '涞水县', '130600', '', '0', '0', 'L', '115.72054302508', '39.400334198489', '3', 'tr_0 tr_130000 tr_130600 ', '0');
INSERT INTO `provinces` VALUES ('130624', '阜平县', '130600', '', '0', '0', 'F', '114.20156347384', '38.855351444796', '3', 'tr_0 tr_130000 tr_130600 ', '0');
INSERT INTO `provinces` VALUES ('130626', '定兴县', '130600', '', '0', '0', 'D', '115.81441011189', '39.269423528527', '3', 'tr_0 tr_130000 tr_130600 ', '0');
INSERT INTO `provinces` VALUES ('130627', '唐县', '130600', '', '0', '0', 'T', '114.9894471146', '38.754019925125', '3', 'tr_0 tr_130000 tr_130600 ', '0');
INSERT INTO `provinces` VALUES ('130628', '高阳县', '130600', '', '0', '0', 'G', '115.78544721513', '38.706257734087', '3', 'tr_0 tr_130000 tr_130600 ', '0');
INSERT INTO `provinces` VALUES ('130629', '容城县', '130600', '', '0', '0', 'R', '115.86863129349', '39.048559435416', '3', 'tr_0 tr_130000 tr_130600 ', '0');
INSERT INTO `provinces` VALUES ('130630', '涞源县', '130600', '', '0', '0', 'L', '114.70047561679', '39.366271691524', '3', 'tr_0 tr_130000 tr_130600 ', '0');
INSERT INTO `provinces` VALUES ('130631', '望都县', '130600', '', '0', '0', 'W', '115.16158760286', '38.700157645549', '3', 'tr_0 tr_130000 tr_130600 ', '0');
INSERT INTO `provinces` VALUES ('130632', '安新县', '130600', '', '0', '0', 'A', '115.94242628266', '38.941734298593', '3', 'tr_0 tr_130000 tr_130600 ', '0');
INSERT INTO `provinces` VALUES ('130633', '易县', '130600', '', '0', '0', 'Y', '115.50360664612', '39.355054469981', '3', 'tr_0 tr_130000 tr_130600 ', '0');
INSERT INTO `provinces` VALUES ('130634', '曲阳县', '130600', '', '0', '0', 'Q', '114.7514548138', '38.628384104122', '3', 'tr_0 tr_130000 tr_130600 ', '0');
INSERT INTO `provinces` VALUES ('130635', '蠡县', '130600', '', '0', '0', 'L', '115.59044548045', '38.494200963238', '3', 'tr_0 tr_130000 tr_130600 ', '0');
INSERT INTO `provinces` VALUES ('130636', '顺平县', '130600', '', '0', '0', 'S', '115.14159743069', '38.843261370364', '3', 'tr_0 tr_130000 tr_130600 ', '0');
INSERT INTO `provinces` VALUES ('130637', '博野县', '130600', '', '0', '0', 'B', '115.47046698806', '38.463408004952', '3', 'tr_0 tr_130000 tr_130600 ', '0');
INSERT INTO `provinces` VALUES ('130638', '雄县', '130600', '', '0', '0', 'X', '116.11460144552', '39.000180119499', '3', 'tr_0 tr_130000 tr_130600 ', '0');
INSERT INTO `provinces` VALUES ('130671', '保定高新技术产业开发区', '130600', '', '0', '0', 'B', '115.47146383769', '38.879987768455', '3', 'tr_0 tr_130000 tr_130600 ', '0');
INSERT INTO `provinces` VALUES ('130672', '保定白沟新城', '130600', '', '0', '0', 'B', '116.06423983354', '39.145149134834', '3', 'tr_0 tr_130000 tr_130600 ', '0');
INSERT INTO `provinces` VALUES ('130681', '涿州市', '130600', '', '0', '0', 'Z', '115.98161971138', '39.491065832', '3', 'tr_0 tr_130000 tr_130600 ', '0');
INSERT INTO `provinces` VALUES ('130682', '定州市', '130600', '', '0', '0', 'D', '114.99649620776', '38.522198840134', '3', 'tr_0 tr_130000 tr_130600 ', '0');
INSERT INTO `provinces` VALUES ('130683', '安国市', '130600', '', '0', '0', 'A', '115.33340802488', '38.424828318687', '3', 'tr_0 tr_130000 tr_130600 ', '0');
INSERT INTO `provinces` VALUES ('130684', '高碑店市', '130600', '', '0', '0', 'G', '115.88056905507', '39.332335447462', '3', 'tr_0 tr_130000 tr_130600 ', '0');
INSERT INTO `provinces` VALUES ('130702', '桥东区', '130700', '', '0', '0', 'Q', '114.90060577763', '40.794268437423', '3', 'tr_0 tr_130000 tr_130700 ', '0');
INSERT INTO `provinces` VALUES ('130703', '桥西区', '130700', '', '0', '0', 'Q', '114.87651609843', '40.825605695041', '3', 'tr_0 tr_130000 tr_130700 ', '0');
INSERT INTO `provinces` VALUES ('130705', '宣化区', '130700', '', '0', '0', 'X', '115.1054444068', '40.614591888266', '3', 'tr_0 tr_130000 tr_130700 ', '0');
INSERT INTO `provinces` VALUES ('130706', '下花园区', '130700', '', '0', '0', 'X', '115.29351688226', '40.508145182672', '3', 'tr_0 tr_130000 tr_130700 ', '0');
INSERT INTO `provinces` VALUES ('130708', '万全区', '130700', '', '0', '0', 'W', '114.74742582376', '40.773149648997', '3', 'tr_0 tr_130000 tr_130700 ', '0');
INSERT INTO `provinces` VALUES ('130709', '崇礼区', '130700', '', '0', '0', 'C', '115.28954933632', '40.98047788587', '3', 'tr_0 tr_130000 tr_130700 ', '0');
INSERT INTO `provinces` VALUES ('130722', '张北县', '130700', '', '0', '0', 'Z', '114.7263751121', '41.164943620015', '3', 'tr_0 tr_130000 tr_130700 ', '0');
INSERT INTO `provinces` VALUES ('130723', '康保县', '130700', '', '0', '0', 'K', '114.60635583664', '41.858636884497', '3', 'tr_0 tr_130000 tr_130700 ', '0');
INSERT INTO `provinces` VALUES ('130724', '沽源县', '130700', '', '0', '0', 'G', '115.69540744878', '41.676015876097', '3', 'tr_0 tr_130000 tr_130700 ', '0');
INSERT INTO `provinces` VALUES ('130725', '尚义县', '130700', '', '0', '0', 'S', '113.97552438548', '41.081888482486', '3', 'tr_0 tr_130000 tr_130700 ', '0');
INSERT INTO `provinces` VALUES ('130726', '蔚县', '130700', '', '0', '0', 'W', '114.5954005518', '39.847088636366', '3', 'tr_0 tr_130000 tr_130700 ', '0');
INSERT INTO `provinces` VALUES ('130727', '阳原县', '130700', '', '0', '0', 'Y', '114.15752413604', '40.109588388731', '3', 'tr_0 tr_130000 tr_130700 ', '0');
INSERT INTO `provinces` VALUES ('130728', '怀安县', '130700', '', '0', '0', 'H', '114.39246911506', '40.680369343116', '3', 'tr_0 tr_130000 tr_130700 ', '0');
INSERT INTO `provinces` VALUES ('130730', '怀来县', '130700', '', '0', '0', 'H', '115.52455288485', '40.420289890382', '3', 'tr_0 tr_130000 tr_130700 ', '0');
INSERT INTO `provinces` VALUES ('130731', '涿鹿县', '130700', '', '0', '0', 'Z', '115.21138346203', '40.385834075003', '3', 'tr_0 tr_130000 tr_130700 ', '0');
INSERT INTO `provinces` VALUES ('130732', '赤城县', '130700', '', '0', '0', 'C', '115.83850589957', '40.918761216841', '3', 'tr_0 tr_130000 tr_130700 ', '0');
INSERT INTO `provinces` VALUES ('130771', '张家口市高新技术产业开发区', '130700', '', '0', '0', 'Z', '114.89257223145', '40.773237202691', '3', 'tr_0 tr_130000 tr_130700 ', '0');
INSERT INTO `provinces` VALUES ('130772', '张家口市察北管理区', '130700', '', '0', '0', 'Z', '115.13535097349', '41.463489368202', '3', 'tr_0 tr_130000 tr_130700 ', '0');
INSERT INTO `provinces` VALUES ('130773', '张家口市塞北管理区', '130700', '', '0', '0', 'Z', '115.80931788745', '41.877919284073', '3', 'tr_0 tr_130000 tr_130700 ', '0');
INSERT INTO `provinces` VALUES ('130802', '双桥区', '130800', '', '0', '0', 'S', '117.94942790899', '40.980824477401', '3', 'tr_0 tr_130000 tr_130800 ', '0');
INSERT INTO `provinces` VALUES ('130803', '双滦区', '130800', '', '0', '0', 'S', '117.80657828883', '40.964729148178', '3', 'tr_0 tr_130000 tr_130800 ', '0');
INSERT INTO `provinces` VALUES ('130804', '鹰手营子矿区', '130800', '', '0', '0', 'Y', '117.66560909159', '40.552043233623', '3', 'tr_0 tr_130000 tr_130800 ', '0');
INSERT INTO `provinces` VALUES ('130821', '承德县', '130800', '', '0', '0', 'C', '118.18045573699', '40.774367194936', '3', 'tr_0 tr_130000 tr_130800 ', '0');
INSERT INTO `provinces` VALUES ('130822', '兴隆县', '130800', '', '0', '0', 'X', '117.50742737264', '40.423454029635', '3', 'tr_0 tr_130000 tr_130800 ', '0');
INSERT INTO `provinces` VALUES ('130824', '滦平县', '130800', '', '0', '0', 'L', '117.33949787111', '40.94756096291', '3', 'tr_0 tr_130000 tr_130800 ', '0');
INSERT INTO `provinces` VALUES ('130825', '隆化县', '130800', '', '0', '0', 'L', '117.7454510243', '41.319898805021', '3', 'tr_0 tr_130000 tr_130800 ', '0');
INSERT INTO `provinces` VALUES ('130826', '丰宁满族自治县', '130800', '', '0', '0', 'F', '116.65239270009', '41.215336380004', '3', 'tr_0 tr_130000 tr_130800 ', '0');
INSERT INTO `provinces` VALUES ('130827', '宽城满族自治县', '130800', '', '0', '0', 'K', '118.49159436055', '40.617151507814', '3', 'tr_0 tr_130000 tr_130800 ', '0');
INSERT INTO `provinces` VALUES ('130828', '围场满族蒙古族自治县', '130800', '', '0', '0', 'W', '117.76656434785', '41.944323773611', '3', 'tr_0 tr_130000 tr_130800 ', '0');
INSERT INTO `provinces` VALUES ('130871', '承德高新技术产业开发区', '130800', '', '0', '0', 'C', '117.96939750997', '40.957856012338', '3', 'tr_0 tr_130000 tr_130800 ', '0');
INSERT INTO `provinces` VALUES ('130881', '平泉市', '130800', '', '0', '0', 'P', '118.70742672204', '41.023755625929', '3', 'tr_0 tr_130000 tr_130800 ', '0');
INSERT INTO `provinces` VALUES ('130902', '新华区', '130900', '', '0', '0', 'X', '116.87243317375', '38.320366719478', '3', 'tr_0 tr_130000 tr_130900 ', '0');
INSERT INTO `provinces` VALUES ('130903', '运河区', '130900', '', '0', '0', 'Y', '116.8386119713', '38.316522737476', '3', 'tr_0 tr_130000 tr_130900 ', '0');
INSERT INTO `provinces` VALUES ('130921', '沧县', '130900', '', '0', '0', 'C', '116.88439779466', '38.299452743407', '3', 'tr_0 tr_130000 tr_130900 ', '0');
INSERT INTO `provinces` VALUES ('130922', '青县', '130900', '', '0', '0', 'Q', '116.81057477836', '38.58846475864', '3', 'tr_0 tr_130000 tr_130900 ', '0');
INSERT INTO `provinces` VALUES ('130923', '东光县', '130900', '', '0', '0', 'D', '116.54340955698', '37.894513906653', '3', 'tr_0 tr_130000 tr_130900 ', '0');
INSERT INTO `provinces` VALUES ('130924', '海兴县', '130900', '', '0', '0', 'H', '117.50441804918', '38.149402516518', '3', 'tr_0 tr_130000 tr_130900 ', '0');
INSERT INTO `provinces` VALUES ('130925', '盐山县', '130900', '', '0', '0', 'Y', '117.23741362448', '38.064318399559', '3', 'tr_0 tr_130000 tr_130900 ', '0');
INSERT INTO `provinces` VALUES ('130926', '肃宁县', '130900', '', '0', '0', 'S', '115.83651767998', '38.428905919718', '3', 'tr_0 tr_130000 tr_130900 ', '0');
INSERT INTO `provinces` VALUES ('130927', '南皮县', '130900', '', '0', '0', 'N', '116.71560115883', '38.045187886965', '3', 'tr_0 tr_130000 tr_130900 ', '0');
INSERT INTO `provinces` VALUES ('130928', '吴桥县', '130900', '', '0', '0', 'W', '116.39739206243', '37.633908755554', '3', 'tr_0 tr_130000 tr_130900 ', '0');
INSERT INTO `provinces` VALUES ('130929', '献县', '130900', '', '0', '0', 'X', '116.12956002887', '38.195981438007', '3', 'tr_0 tr_130000 tr_130900 ', '0');
INSERT INTO `provinces` VALUES ('130930', '孟村回族自治县', '130900', '', '0', '0', 'M', '117.11043607455', '38.059839127888', '3', 'tr_0 tr_130000 tr_130900 ', '0');
INSERT INTO `provinces` VALUES ('130971', '河北沧州经济开发区', '130900', '', '0', '0', 'H', '116.84558075595', '38.310215141107', '3', 'tr_0 tr_130000 tr_130900 ', '0');
INSERT INTO `provinces` VALUES ('130972', '沧州高新技术产业开发区', '130900', '', '0', '0', 'C', '116.81727200975', '38.34342368505', '3', 'tr_0 tr_130000 tr_130900 ', '0');
INSERT INTO `provinces` VALUES ('130973', '沧州渤海新区', '130900', '', '0', '0', 'C', '117.7623777537', '38.282913560669', '3', 'tr_0 tr_130000 tr_130900 ', '0');
INSERT INTO `provinces` VALUES ('130981', '泊头市', '130900', '', '0', '0', 'P', '116.58462803581', '38.089256915446', '3', 'tr_0 tr_130000 tr_130900 ', '0');
INSERT INTO `provinces` VALUES ('130982', '任丘市', '130900', '', '0', '0', 'R', '116.1056050955', '38.717348630775', '3', 'tr_0 tr_130000 tr_130900 ', '0');
INSERT INTO `provinces` VALUES ('130983', '黄骅市', '130900', '', '0', '0', 'H', '117.33648109172', '38.377493900735', '3', 'tr_0 tr_130000 tr_130900 ', '0');
INSERT INTO `provinces` VALUES ('130984', '河间市', '130900', '', '0', '0', 'H', '116.10562809212', '38.451356515106', '3', 'tr_0 tr_130000 tr_130900 ', '0');
INSERT INTO `provinces` VALUES ('131002', '安次区', '131000', '', '0', '0', 'A', '116.70963326617', '39.526159764041', '3', 'tr_0 tr_130000 tr_131000 ', '0');
INSERT INTO `provinces` VALUES ('131003', '广阳区', '131000', '', '0', '0', 'G', '116.71761426148', '39.528611447334', '3', 'tr_0 tr_130000 tr_131000 ', '0');
INSERT INTO `provinces` VALUES ('131022', '固安县', '131000', '', '0', '0', 'G', '116.30542004093', '39.444484855304', '3', 'tr_0 tr_130000 tr_131000 ', '0');
INSERT INTO `provinces` VALUES ('131023', '永清县', '131000', '', '0', '0', 'Y', '116.50542928985', '39.327852998574', '3', 'tr_0 tr_130000 tr_131000 ', '0');
INSERT INTO `provinces` VALUES ('131024', '香河县', '131000', '', '0', '0', 'X', '117.0124021078', '39.767939188546', '3', 'tr_0 tr_130000 tr_131000 ', '0');
INSERT INTO `provinces` VALUES ('131025', '大城县', '131000', '', '0', '0', 'D', '116.66040917846', '38.710858640026', '3', 'tr_0 tr_130000 tr_131000 ', '0');
INSERT INTO `provinces` VALUES ('131026', '文安县', '131000', '', '0', '0', 'W', '116.464609479', '38.87895049307', '3', 'tr_0 tr_130000 tr_131000 ', '0');
INSERT INTO `provinces` VALUES ('131028', '大厂回族自治县', '131000', '', '0', '0', 'D', '116.99640912565', '39.892208394086', '3', 'tr_0 tr_130000 tr_131000 ', '0');
INSERT INTO `provinces` VALUES ('131071', '廊坊经济技术开发区', '131000', '', '0', '0', 'L', '116.76777922809', '39.587610159458', '3', 'tr_0 tr_130000 tr_131000 ', '0');
INSERT INTO `provinces` VALUES ('131081', '霸州市', '131000', '', '0', '0', 'B', '116.3983972663', '39.130920596981', '3', 'tr_0 tr_130000 tr_131000 ', '0');
INSERT INTO `provinces` VALUES ('131082', '三河市', '131000', '', '0', '0', 'S', '117.08458787248', '39.988099552443', '3', 'tr_0 tr_130000 tr_131000 ', '0');
INSERT INTO `provinces` VALUES ('131102', '桃城区', '131100', '', '0', '0', 'T', '115.68139532011', '37.741636751694', '3', 'tr_0 tr_130000 tr_131100 ', '0');
INSERT INTO `provinces` VALUES ('131103', '冀州区', '131100', '', '0', '0', 'J', '115.58542988146', '37.557086025833', '3', 'tr_0 tr_130000 tr_131100 ', '0');
INSERT INTO `provinces` VALUES ('131121', '枣强县', '131100', '', '0', '0', 'Z', '115.7305629044', '37.519363689764', '3', 'tr_0 tr_130000 tr_131100 ', '0');
INSERT INTO `provinces` VALUES ('131122', '武邑县', '131100', '', '0', '0', 'W', '115.89451363117', '37.807764276867', '3', 'tr_0 tr_130000 tr_131100 ', '0');
INSERT INTO `provinces` VALUES ('131123', '武强县', '131100', '', '0', '0', 'W', '115.98961391178', '38.046856805237', '3', 'tr_0 tr_130000 tr_131100 ', '0');
INSERT INTO `provinces` VALUES ('131124', '饶阳县', '131100', '', '0', '0', 'R', '115.73257160535', '38.241037525428', '3', 'tr_0 tr_130000 tr_131100 ', '0');
INSERT INTO `provinces` VALUES ('131125', '安平县', '131100', '', '0', '0', 'A', '115.52554928532', '38.240506922191', '3', 'tr_0 tr_130000 tr_131100 ', '0');
INSERT INTO `provinces` VALUES ('131126', '故城县', '131100', '', '0', '0', 'G', '115.97260216135', '37.353347552477', '3', 'tr_0 tr_130000 tr_131100 ', '0');
INSERT INTO `provinces` VALUES ('131127', '景县', '131100', '', '0', '0', 'J', '116.2774107853', '37.698814551395', '3', 'tr_0 tr_130000 tr_131100 ', '0');
INSERT INTO `provinces` VALUES ('131128', '阜城县', '131100', '', '0', '0', 'F', '116.18242153525', '37.868732457906', '3', 'tr_0 tr_130000 tr_131100 ', '0');
INSERT INTO `provinces` VALUES ('131171', '河北衡水高新技术产业开发区', '131100', '', '0', '0', 'H', '115.73456139967', '37.807821775773', '3', 'tr_0 tr_130000 tr_131100 ', '0');
INSERT INTO `provinces` VALUES ('131172', '衡水滨湖新区', '131100', '', '0', '0', 'H', '115.70627999969', '37.701616037093', '3', 'tr_0 tr_130000 tr_131100 ', '0');
INSERT INTO `provinces` VALUES ('131182', '深州市', '131100', '', '0', '0', 'S', '115.56636927583', '38.006941234922', '3', 'tr_0 tr_130000 tr_131100 ', '0');
INSERT INTO `provinces` VALUES ('640202', '大武口区', '640200', '', '0', '0', '', '', '', '3', 'tr_0 tr_640000 tr_640200 ', '0');
INSERT INTO `provinces` VALUES ('640205', '惠农区', '640200', '', '0', '0', '', '', '', '3', 'tr_0 tr_640000 tr_640200 ', '0');
INSERT INTO `provinces` VALUES ('640221', '平罗县', '640200', '', '0', '0', '', '', '', '3', 'tr_0 tr_640000 tr_640200 ', '0');

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
INSERT INTO `seckill_products` VALUES ('1', '64', '2020-07-12 12:00:00', '2020-11-28 12:30:50');
INSERT INTO `seckill_products` VALUES ('2', '72', '2020-07-12 12:00:00', '2020-11-28 12:30:50');
INSERT INTO `seckill_products` VALUES ('3', '99', '2020-07-16 14:15:13', '2020-11-28 12:30:50');
INSERT INTO `seckill_products` VALUES ('4', '100', '2020-07-12 12:00:00', '2020-11-28 12:30:50');
INSERT INTO `seckill_products` VALUES ('5', '101', '2020-07-12 12:00:00', '2020-11-28 12:30:50');
INSERT INTO `seckill_products` VALUES ('6', '102', '2020-07-12 12:00:00', '2020-11-28 12:30:50');
INSERT INTO `seckill_products` VALUES ('7', '103', '2020-07-12 12:00:00', '2020-11-28 12:30:50');
INSERT INTO `seckill_products` VALUES ('8', '104', '2020-07-12 12:00:00', '2020-11-28 12:30:50');
INSERT INTO `seckill_products` VALUES ('9', '105', '2020-07-12 12:00:00', '2020-11-28 12:30:50');
INSERT INTO `seckill_products` VALUES ('10', '106', '2020-07-12 12:00:00', '2020-11-28 12:30:50');
INSERT INTO `seckill_products` VALUES ('11', '107', '2020-07-12 12:00:00', '2020-11-28 12:30:50');
INSERT INTO `seckill_products` VALUES ('14', '118', '2020-08-10 11:04:34', '2020-11-28 12:30:50');
INSERT INTO `seckill_products` VALUES ('15', '121', '2020-08-08 13:54:18', '2020-11-28 12:30:50');

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
  `user_id` bigint(20) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of shops
-- ----------------------------
INSERT INTO `shops` VALUES ('1', '现代化', '现代化', '', '', 'guo', '15165108623', '', '2020-10-28 16:15:36', '2020-10-28 16:15:39', '1');

-- ----------------------------
-- Table structure for `sitehelps`
-- ----------------------------
DROP TABLE IF EXISTS `sitehelps`;
CREATE TABLE `sitehelps` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容',
  `synopsis` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '概要',
  `view` int(10) unsigned NOT NULL COMMENT '浏览量',
  `sender_id` int(10) unsigned NOT NULL COMMENT '发送者id',
  `sender_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '发送者name',
  `sitehelp_type_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sitehelps_sitehelp_type_id_foreign` (`sitehelp_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of sitehelps
-- ----------------------------
INSERT INTO `sitehelps` VALUES ('1', '支付宝', '支付宝', '支付宝', '0', '1', 'guo', '1', '2020-09-08 14:17:00', '2020-09-08 14:17:07');
INSERT INTO `sitehelps` VALUES ('2', '微信', '微信', '微信', '1', '1', 'guo', '1', '2020-09-08 14:17:02', '2020-09-08 16:59:45');
INSERT INTO `sitehelps` VALUES ('3', '平台支付', '平台支付', '平台支付', '1', '1', 'guo', '1', '2020-09-08 14:17:05', '2020-09-08 16:59:37');
INSERT INTO `sitehelps` VALUES ('4', '测试1', '测试1', '测试1', '0', '1', 'admin', '2', '2020-09-22 10:32:26', '2020-09-22 15:04:53');
INSERT INTO `sitehelps` VALUES ('5', '配送安全', '<p><span style=\"color: #666666; font-family: Arial, Helvetica, sans-serif, 宋体; font-size: 12px; text-indent: 24px;\">因酒类属特殊商品，相关规定只能陆运，不能空运。同时为保证货品安全，每瓶酒都采用酒类专用安全包装，以确保在运输途中不会因挤压、碰撞等因素造成破损；如出现破损，请与快递人员当面核实，并对破损进行拍照取证，后致电 400-617-9999与客服沟通。</span></p>', '因酒类属特殊商品，相关规定只能陆运，不能空运。', '0', '1', 'admin', '3', '2020-09-22 15:37:53', '2020-09-22 15:38:37');

-- ----------------------------
-- Table structure for `sitehelp_types`
-- ----------------------------
DROP TABLE IF EXISTS `sitehelp_types`;
CREATE TABLE `sitehelp_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cover` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '封面',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of sitehelp_types
-- ----------------------------
INSERT INTO `sitehelp_types` VALUES ('1', '支付方式', '/static/logo.png');
INSERT INTO `sitehelp_types` VALUES ('2', '退换货', 'images/coupon.png');
INSERT INTO `sitehelp_types` VALUES ('3', '配送说明', 'images/Learned.png');

-- ----------------------------
-- Table structure for `site_opinions`
-- ----------------------------
DROP TABLE IF EXISTS `site_opinions`;
CREATE TABLE `site_opinions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL COMMENT '用户id',
  `content` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容',
  `covers` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '反馈图片',
  `contact_way` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '联系方式',
  `reply` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '回复',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '反馈类型',
  `from` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '来源',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '优先级（0-9）',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `site_opinions_user_id_foreign` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of site_opinions
-- ----------------------------
INSERT INTO `site_opinions` VALUES ('1', '1', '121221', '[\"http://test.xslp.cn:8080//uploads/images/opinions/202009/08/1_1599554089_sh9QE7E7RH.png\"]', '111', '666888', '1', 'weapp', '1', '2020-09-08 14:15:05', '2020-09-22 11:40:07');
INSERT INTO `site_opinions` VALUES ('2', '1', 'UI无法直视，丑哭了', '', '15165108623', '', '2', 'h5', '0', '2020-09-08 16:43:49', '2020-09-08 16:43:49');

-- ----------------------------
-- Table structure for `suppliers`
-- ----------------------------
DROP TABLE IF EXISTS `suppliers`;
CREATE TABLE `suppliers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '供货商名称',
  `desc` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '供货商描述',
  `linkman_tel` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '联系人电话',
  `linkman_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '联系人姓名',
  `linkman_address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '联系人地址',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of suppliers
-- ----------------------------
INSERT INTO `suppliers` VALUES ('1', '恒远经贸有限公司', '电子产品', '15165108623', '郭郭', '15165108623', '1', '2020-09-16 11:21:45', '2020-09-16 11:21:45');

-- ----------------------------
-- Table structure for `transactions`
-- ----------------------------
DROP TABLE IF EXISTS `transactions`;
CREATE TABLE `transactions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `payable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payable_id` bigint(20) unsigned NOT NULL,
  `wallet_id` bigint(20) unsigned DEFAULT NULL,
  `type` enum('deposit','withdraw') COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(64,0) NOT NULL,
  `confirmed` tinyint(1) NOT NULL,
  `meta` text COLLATE utf8mb4_unicode_ci,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `transactions_uuid_unique` (`uuid`),
  KEY `transactions_payable_type_payable_id_index` (`payable_type`,`payable_id`),
  KEY `payable_type_ind` (`payable_type`,`payable_id`,`type`),
  KEY `payable_confirmed_ind` (`payable_type`,`payable_id`,`confirmed`),
  KEY `payable_type_confirmed_ind` (`payable_type`,`payable_id`,`type`,`confirmed`),
  KEY `transactions_type_index` (`type`),
  KEY `transactions_wallet_id_foreign` (`wallet_id`)
) ENGINE=MyISAM AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of transactions
-- ----------------------------
INSERT INTO `transactions` VALUES ('16', 'App\\Models\\User', '1', '1', 'deposit', '500', '1', '{\"type\":\"deposit\"}', 'b5155379-83fb-4314-bc63-cc7a132ee3a6', '2020-09-21 16:46:41', null);
INSERT INTO `transactions` VALUES ('17', 'App\\Models\\User', '1', '1', 'withdraw', '-50', '1', '{\"type\":\"withdraw\"}', '144fbfcf-bfa8-4cf9-ace8-0d83c92ead28', '2020-09-21 16:47:33', null);
INSERT INTO `transactions` VALUES ('18', 'App\\Models\\User', '3', '3', 'deposit', '100000', '1', '{\"type\":\"deposit\"}', 'd3c0841d-ced9-4551-bd90-4afd220d9cdb', '2020-10-16 16:00:51', null);
INSERT INTO `transactions` VALUES ('19', 'App\\Models\\User', '3', '3', 'deposit', '400000', '1', '{\"type\":\"deposit\"}', '0676649e-7993-40ae-8b50-42d0741de23d', '2020-10-20 10:59:33', null);
INSERT INTO `transactions` VALUES ('20', 'App\\Models\\User', '3', '3', 'withdraw', '-500000', '1', '{\"type\":\"finance_frozen\"}', '648d1c6d-908c-4dc6-bbed-a5f939a6ca32', '2020-10-20 11:08:09', null);
INSERT INTO `transactions` VALUES ('21', 'App\\Models\\User', '1', '1', 'deposit', '500000', '1', '{\"type\":\"finance_frozen\"}', '6a1698c5-b765-4751-9650-35169c890d0c', '2020-10-20 11:08:09', null);
INSERT INTO `transactions` VALUES ('22', 'App\\Models\\User', '4', '4', 'deposit', '500000', '1', '{\"type\":\"deposit\"}', '648b6ce2-539e-4200-a5c6-7a882e01fd0d', '2020-10-20 13:18:31', null);
INSERT INTO `transactions` VALUES ('23', 'App\\Models\\User', '4', '4', 'withdraw', '-500000', '1', '{\"type\":\"finance_frozen\"}', '5972f4a2-c52c-464d-b33f-5f9cc46adb2d', '2020-10-20 13:21:06', null);
INSERT INTO `transactions` VALUES ('24', 'App\\Models\\User', '1', '1', 'deposit', '500000', '1', '{\"type\":\"finance_frozen\"}', 'b3f2fb6d-df17-4673-94a2-7570044ba462', '2020-10-20 13:21:06', null);
INSERT INTO `transactions` VALUES ('25', 'App\\Models\\User', '5', '5', 'deposit', '100000', '1', '{\"type\":\"deposit\"}', '603932fd-4e3f-45d0-8ff3-3485493974ee', '2020-10-20 13:27:42', null);
INSERT INTO `transactions` VALUES ('26', 'App\\Models\\User', '5', '5', 'withdraw', '-100000', '1', '{\"type\":\"finance_frozen\"}', '543dbf76-622c-4bdc-bb45-26aa035db392', '2020-10-20 13:31:28', null);
INSERT INTO `transactions` VALUES ('27', 'App\\Models\\User', '1', '1', 'deposit', '100000', '1', '{\"type\":\"finance_frozen\"}', 'dd45be2d-63f7-4923-8bf8-2e4466204460', '2020-10-20 13:31:28', null);
INSERT INTO `transactions` VALUES ('28', 'App\\Models\\User', '5', '5', 'deposit', '100000', '1', '{\"type\":\"deposit\"}', '3d6d8d6c-0b71-43e9-b2d4-769c60ea5326', '2020-10-20 13:33:47', null);
INSERT INTO `transactions` VALUES ('29', 'App\\Models\\User', '5', '5', 'withdraw', '-100000', '1', '{\"type\":\"finance_frozen\"}', '45490a76-3233-43ac-9163-a689432cd9dd', '2020-10-20 13:34:50', null);
INSERT INTO `transactions` VALUES ('30', 'App\\Models\\User', '1', '1', 'deposit', '100000', '1', '{\"type\":\"finance_frozen\"}', '1e1ef4c1-9ab2-4a44-8493-980a114eea95', '2020-10-20 13:34:50', null);
INSERT INTO `transactions` VALUES ('31', 'App\\Models\\User', '1', '1', 'withdraw', '-1150000', '1', '{\"type\":\"finance_success\"}', '6b761b05-da0c-42c7-8599-698906f42133', '2020-10-20 15:14:57', null);
INSERT INTO `transactions` VALUES ('32', 'App\\Models\\User', '2', '2', 'deposit', '1150000', '1', '{\"type\":\"finance_success\"}', '436ef844-b7c0-4353-b119-85ef7b54ac80', '2020-10-20 15:14:57', null);
INSERT INTO `transactions` VALUES ('33', 'App\\Models\\User', '2', '2', 'withdraw', '-11250', '1', '{\"type\":\"finance_payback\"}', 'da7a7ec1-e5d8-45de-bc2b-e02436d67853', '2020-10-22 13:32:43', '2020-10-22 13:32:43');
INSERT INTO `transactions` VALUES ('34', 'App\\Models\\User', '3', '3', 'deposit', '11250', '1', '{\"type\":\"finance_payback\"}', '8766fae1-565c-48e2-bc2c-1a1cf65f83ee', '2020-10-22 13:32:43', '2020-10-22 13:32:43');
INSERT INTO `transactions` VALUES ('35', 'App\\Models\\User', '2', '2', 'withdraw', '-11250', '1', '{\"type\":\"finance_payback\"}', 'e6e1aabe-0439-4380-b472-0aff1c1e5d24', '2020-10-22 13:32:43', '2020-10-22 13:32:43');
INSERT INTO `transactions` VALUES ('36', 'App\\Models\\User', '4', '4', 'deposit', '11250', '1', '{\"type\":\"finance_payback\"}', '224278ad-00f6-42ee-beac-42444aa4e3e6', '2020-10-22 13:32:43', '2020-10-22 13:32:43');
INSERT INTO `transactions` VALUES ('37', 'App\\Models\\User', '2', '2', 'withdraw', '-4500', '1', '{\"type\":\"finance_payback\"}', '8e1428be-6c4e-4a84-a8be-3b22d0264617', '2020-10-22 13:32:43', '2020-10-22 13:32:43');
INSERT INTO `transactions` VALUES ('38', 'App\\Models\\User', '5', '5', 'deposit', '4500', '1', '{\"type\":\"finance_payback\"}', 'a83de6f7-441e-4a49-b90d-fd56984314cc', '2020-10-22 13:32:43', '2020-10-22 13:32:43');
INSERT INTO `transactions` VALUES ('39', 'App\\Models\\User', '2', '2', 'deposit', '27000', '1', '{\"type\":\"deposit\"}', '65f82a41-659a-46c5-a08e-c076ff03025e', '2020-10-23 15:46:12', '2020-10-23 15:46:12');
INSERT INTO `transactions` VALUES ('40', 'App\\Models\\User', '2', '2', 'withdraw', '-50000', '1', '{\"type\":\"withdraw\"}', '1c424616-5142-4184-a745-2d43dd64854e', '2020-10-23 15:54:00', '2020-10-23 15:54:00');
INSERT INTO `transactions` VALUES ('41', 'App\\Models\\User', '5', '5', 'deposit', '10000', '1', '{\"type\":\"deposit\"}', 'd7c7ad58-24a2-4f91-9c3d-d8705113128d', '2020-10-27 09:44:13', '2020-10-27 09:44:13');
INSERT INTO `transactions` VALUES ('42', 'App\\Models\\User', '5', '5', 'deposit', '1000', '1', '{\"type\":\"deposit\"}', 'fd2eb8ac-e2e2-411f-8eae-08e8e92d8865', '2020-10-27 16:57:03', '2020-10-27 16:57:03');
INSERT INTO `transactions` VALUES ('43', 'App\\Models\\User', '5', '5', 'withdraw', '-10000', '1', '{\"type\":\"finance_frozen\"}', '6bacac3e-0e0a-47ed-a803-128485a38733', '2020-10-27 16:59:41', '2020-10-27 16:59:41');
INSERT INTO `transactions` VALUES ('44', 'App\\Models\\User', '1', '1', 'deposit', '10000', '1', '{\"type\":\"finance_frozen\"}', 'cca58653-33eb-43c7-ab5a-e54aa008acd0', '2020-10-27 16:59:41', '2020-10-27 16:59:41');
INSERT INTO `transactions` VALUES ('45', 'App\\Models\\User', '5', '5', 'deposit', '4000', '1', '{\"type\":\"deposit\"}', '22833e4b-6b31-406a-befb-b300d361a45d', '2020-10-27 17:04:28', '2020-10-27 17:04:28');
INSERT INTO `transactions` VALUES ('46', 'App\\Models\\User', '5', '5', 'withdraw', '-3000', '1', '{\"title\": \"订单号：20201028110042831983\", \"description\": \"Purchase of Product #32\",\"type\":\"pending\"}', '62c0d1ac-1170-4b39-bdb4-adb8619b7d71', '2020-10-28 11:03:05', '2020-10-28 11:03:05');
INSERT INTO `transactions` VALUES ('47', 'App\\Models\\Order', '32', '6', 'deposit', '3000', '1', '{\"title\": \"订单号：20201028110042831983\", \"description\": \"Purchase of Product #32\",\"type\":\"pending\"}', 'd5131381-5551-4eae-8ce3-78b8c1fea35d', '2020-10-28 11:03:05', '2020-10-28 11:03:05');
INSERT INTO `transactions` VALUES ('48', 'App\\Models\\User', '5', '5', 'deposit', '10000', '1', '{\"type\":\"deposit\"}', '877bc795-2a84-4c3e-b51f-c1403eb3ddfd', '2020-10-28 16:38:40', '2020-10-28 16:38:40');
INSERT INTO `transactions` VALUES ('49', 'App\\Models\\User', '5', '5', 'withdraw', '-3000', '1', '{\"title\": \"订单号：20201028163914040118\", \"description\": \"Purchase of Product #33\",\"type\":\"pending\"}', '69521ca3-0902-4891-a125-c26758d901cf', '2020-10-28 16:44:39', '2020-10-28 16:44:39');
INSERT INTO `transactions` VALUES ('50', 'App\\Models\\Shop', '1', '7', 'deposit', '3000', '1', '{\"title\": \"订单号：20201028163914040118\", \"description\": \"Purchase of Product #33\",\"type\":\"pending\"}', '2f9ed510-e2fd-44da-b6f2-e40eab530201', '2020-10-28 16:44:39', '2020-10-28 16:44:39');
INSERT INTO `transactions` VALUES ('51', 'App\\Models\\User', '5', '5', 'withdraw', '-3000', '1', '{\"title\":\"\\u8ba2\\u5355\\u53f7\\uff1a20201029091627102156\",\"description\":\"order_id #34\",\"type\":\"pending\"}', 'd533283f-1b63-4e9f-a427-39afcb80f110', '2020-10-29 09:17:06', '2020-10-29 09:17:06');
INSERT INTO `transactions` VALUES ('52', 'App\\Models\\Shop', '1', '7', 'deposit', '3000', '1', '{\"title\":\"\\u8ba2\\u5355\\u53f7\\uff1a20201029091627102156\",\"description\":\"order_id #34\",\"type\":\"pending\"}', 'eb985195-04c5-4716-a86e-4ddd4c3296a4', '2020-10-29 09:17:06', '2020-10-29 09:17:06');
INSERT INTO `transactions` VALUES ('53', 'App\\Models\\Shop', '1', '7', 'withdraw', '-3000', '1', '{\"title\":\"\\u8ba2\\u5355\\u53f7\\uff1a20201029091627102156\",\"description\":\"order_id #34\",\"type\":\"proccessing\"}', '29bad683-7c06-48cd-88b2-1426fb1de08d', '2020-10-29 13:41:18', '2020-10-29 13:41:18');
INSERT INTO `transactions` VALUES ('54', 'App\\Models\\User', '5', '5', 'deposit', '3000', '1', '{\"title\":\"\\u8ba2\\u5355\\u53f7\\uff1a20201029091627102156\",\"description\":\"order_id #34\",\"type\":\"proccessing\"}', 'e271d988-8f5d-425f-9cfe-d5df2eea5b47', '2020-10-29 13:41:18', '2020-10-29 13:41:18');
INSERT INTO `transactions` VALUES ('55', 'App\\Models\\User', '3', '3', 'deposit', '10000', '1', '{\"type\":\"deposit\"}', '0dba2f9b-3a98-46ca-9fd9-39dbaadfed47', '2020-10-29 14:47:56', '2020-10-29 14:47:56');
INSERT INTO `transactions` VALUES ('56', 'App\\Models\\User', '3', '3', 'withdraw', '-3000', '1', '{\"title\":\"\\u8ba2\\u5355\\u53f7\\uff1a20201029145629812925\",\"description\":\"order_id #35\",\"type\":\"pending\"}', 'ce8e5c47-1ab9-4dc9-8510-53aff05ca9cc', '2020-10-29 14:56:36', '2020-10-29 14:56:36');
INSERT INTO `transactions` VALUES ('57', 'App\\Models\\Shop', '1', '7', 'deposit', '3000', '1', '{\"title\":\"\\u8ba2\\u5355\\u53f7\\uff1a20201029145629812925\",\"description\":\"order_id #35\"}', '6b3f3ba0-e756-41e5-9537-6c675004a9ac', '2020-10-29 14:56:36', '2020-10-29 14:56:36');
INSERT INTO `transactions` VALUES ('58', 'App\\Models\\User', '3', '3', 'withdraw', '-3000', '1', '{\"title\":\"\\u8ba2\\u5355\\u53f7\\uff1a20201104130905145966\",\"description\":\"order_id #36\",\"type\":\"pending\"}', 'd6ba8afe-27f1-4c51-aa42-5337c7541d59', '2020-11-04 13:41:56', '2020-11-04 13:41:56');
INSERT INTO `transactions` VALUES ('59', 'App\\Models\\Shop', '1', '7', 'deposit', '3000', '1', '{\"title\":\"\\u8ba2\\u5355\\u53f7\\uff1a20201104130905145966\",\"description\":\"order_id #36\",\"type\":\"pending\"}', '175a1991-68ac-45a6-9958-60051315f23d', '2020-11-04 13:41:56', '2020-11-04 13:41:56');

-- ----------------------------
-- Table structure for `transfers`
-- ----------------------------
DROP TABLE IF EXISTS `transfers`;
CREATE TABLE `transfers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `from_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_id` bigint(20) unsigned NOT NULL,
  `to_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `to_id` bigint(20) unsigned NOT NULL,
  `status` enum('exchange','transfer','paid','refund','gift') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'transfer',
  `status_last` enum('exchange','transfer','paid','refund','gift') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deposit_id` bigint(20) unsigned NOT NULL,
  `withdraw_id` bigint(20) unsigned NOT NULL,
  `discount` decimal(64,0) NOT NULL DEFAULT '0',
  `fee` decimal(64,0) NOT NULL DEFAULT '0',
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `transfers_uuid_unique` (`uuid`),
  KEY `transfers_from_type_from_id_index` (`from_type`,`from_id`),
  KEY `transfers_to_type_to_id_index` (`to_type`,`to_id`),
  KEY `transfers_deposit_id_foreign` (`deposit_id`),
  KEY `transfers_withdraw_id_foreign` (`withdraw_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of transfers
-- ----------------------------
INSERT INTO `transfers` VALUES ('1', 'Bavix\\Wallet\\Models\\Wallet', '3', 'App\\Models\\User', '1', 'transfer', null, '6', '5', '0', '0', '6cbb5a67-c38a-450c-9088-6c0fb61a0a05', '2020-10-20 11:08:09', '2020-10-20 11:08:09');
INSERT INTO `transfers` VALUES ('2', 'Bavix\\Wallet\\Models\\Wallet', '4', 'App\\Models\\User', '1', 'transfer', null, '9', '8', '0', '0', 'bcb3b21b-0faf-4498-989e-224bc5900d02', '2020-10-20 13:21:06', '2020-10-20 13:21:06');
INSERT INTO `transfers` VALUES ('3', 'Bavix\\Wallet\\Models\\Wallet', '5', 'App\\Models\\User', '1', 'transfer', null, '251', '26', '0', '0', '8180c4b0-9482-4542-b690-3d34f34428bb', '2020-10-20 13:31:28', '2020-10-20 13:31:28');
INSERT INTO `transfers` VALUES ('4', 'Bavix\\Wallet\\Models\\Wallet', '5', 'App\\Models\\User', '1', 'transfer', '', '281', '29', '0', '0', 'f03c18ae-c017-4fc7-a72c-74b8140b5ca7', '2020-10-20 13:34:50', '2020-10-20 13:34:50');
INSERT INTO `transfers` VALUES ('5', 'Bavix\\Wallet\\Models\\Wallet', '1', 'App\\Models\\User', '2', 'transfer', null, '32', '31', '0', '0', 'f135709b-c946-4e7e-bf76-d92ab7a00ed7', '2020-10-20 15:14:57', '2020-10-20 15:14:57');
INSERT INTO `transfers` VALUES ('6', 'Bavix\\Wallet\\Models\\Wallet', '2', 'App\\Models\\User', '1', 'transfer', null, '34', '33', '0', '0', '3896fde0-0638-46fd-9e1f-dd788e24be99', '2020-10-22 13:32:43', '2020-10-22 13:32:43');
INSERT INTO `transfers` VALUES ('7', 'Bavix\\Wallet\\Models\\Wallet', '2', 'App\\Models\\User', '1', 'transfer', null, '36', '35', '0', '0', '78082e50-1a3c-46f1-b427-f4e6b8216260', '2020-10-22 13:32:43', '2020-10-22 13:32:43');
INSERT INTO `transfers` VALUES ('8', 'Bavix\\Wallet\\Models\\Wallet', '2', 'App\\Models\\User', '1', 'transfer', null, '38', '37', '0', '0', '86db57bf-be01-4091-b2a3-383088b64bfb', '2020-10-22 13:32:43', '2020-10-22 13:32:43');
INSERT INTO `transfers` VALUES ('9', 'Bavix\\Wallet\\Models\\Wallet', '5', 'App\\Models\\User', '1', 'transfer', null, '44', '43', '0', '0', '513af50c-1ce8-489d-9825-a519444fc6ad', '2020-10-27 16:59:41', '2020-10-27 16:59:41');
INSERT INTO `transfers` VALUES ('10', 'Bavix\\Wallet\\Models\\Wallet', '5', 'App\\Models\\Order', '32', 'paid', null, '47', '46', '0', '0', '420bb795-c3fc-4b64-9cee-08ddba71a888', '2020-10-28 11:03:05', '2020-10-28 11:03:05');
INSERT INTO `transfers` VALUES ('11', 'Bavix\\Wallet\\Models\\Wallet', '5', 'App\\Models\\Shop', '1', 'paid', null, '50', '49', '0', '0', 'a7fa3c46-48f2-4b89-97d9-095a87c00a79', '2020-10-28 16:44:39', '2020-10-28 16:44:39');
INSERT INTO `transfers` VALUES ('12', 'Bavix\\Wallet\\Models\\Wallet', '5', 'App\\Models\\Order', '34', 'refund', null, '52', '51', '0', '0', 'ecaf7d75-76ba-4b92-9f06-3335d61977f5', '2020-10-29 09:17:06', '2020-10-29 13:41:18');
INSERT INTO `transfers` VALUES ('13', 'Bavix\\Wallet\\Models\\Wallet', '7', 'Bavix\\Wallet\\Models\\Wallet', '5', 'transfer', null, '54', '53', '0', '0', '505a6fcf-3c35-41d7-8b1b-08c754471974', '2020-10-29 13:41:18', '2020-10-29 13:41:18');
INSERT INTO `transfers` VALUES ('14', 'Bavix\\Wallet\\Models\\Wallet', '3', 'App\\Models\\Order', '35', 'paid', null, '57', '56', '0', '0', 'af8d4ac9-0ab7-41af-b818-6391002256c4', '2020-10-29 14:56:36', '2020-10-29 14:56:36');
INSERT INTO `transfers` VALUES ('15', 'Bavix\\Wallet\\Models\\Wallet', '3', 'App\\Models\\Order', '36', 'paid', null, '59', '58', '0', '0', 'c343f826-03ff-4a0b-86b6-c80719b2970f', '2020-11-04 13:41:56', '2020-11-04 13:41:56');

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
  `weapp_openid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weixin_session_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weixin_unionid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `introduction` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `member_level` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `notification_count` int(10) unsigned NOT NULL DEFAULT '0',
  `birthday` date DEFAULT NULL,
  `qq` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` tinyint(4) DEFAULT '0',
  `scores` int(11) DEFAULT '0' COMMENT '积分',
  `lock` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_phone_unique` (`phone`),
  UNIQUE KEY `users_weixin_openid_unique` (`weixin_openid`),
  UNIQUE KEY `users_weixin_unionid_unique` (`weixin_unionid`),
  UNIQUE KEY `users_weapp_openid_unique` (`weapp_openid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '投资-公账', 'invest', '250411626@qq.com', '15165108623', '2020-07-30 16:39:18', '$2y$10$zV1XoiYynT5526DY9Z73yOQ6mDlsRDsgXAFPvl/TZaPu5zMk8uXuK', '111', 'om9DL4lsqImJVbW6fCTpkK9pqLHc', 'XZTle7DURX3LY3MAG4Irvw==', null, 'lWQmXDXoXzNcwzHuTlqpHvljFotkfMHzOJtadVswfzCk62uaHnvOK082bWl0', '2020-07-30 16:39:18', '2020-10-27 10:48:55', 'http://test.xslp.cn:8080/uploads/images/avatars/202010/23/1_1603422384_GMMdKNRabC.jpg', '哈哈你好啊', '0', '5', '1979-10-20', '250411626', '1', '0', '0');
INSERT INTO `users` VALUES ('2', 'guo', 'jn1039', 'jn1039@163.com', '15165108625', '2020-10-20 10:55:13', '$2y$10$zV1XoiYynT5526DY9Z73yOQ6mDlsRDsgXAFPvl/TZaPu5zMk8uXuK', null, null, null, null, null, '2020-08-03 10:14:56', '2020-10-27 10:48:58', 'http://test.xslp.cn:8080/uploads/images/avatars/202010/23/2_1603431468_CWNBOQn18m.jpg', '66666666', '0', '5', '2007-10-25', '250411627', '1', '0', '0');
INSERT INTO `users` VALUES ('3', '郭继安', null, 'guojian19791039@163.com', '15165108626', '2020-10-20 10:55:16', '$2y$10$zV1XoiYynT5526DY9Z73yOQ6mDlsRDsgXAFPvl/TZaPu5zMk8uXuK', null, null, null, null, null, '2020-10-16 15:33:35', '2020-10-27 10:48:58', 'https://cdn.learnku.com/uploads/images/201801/03/1/MFCtSTiGzj.jpg', null, '0', '1', null, null, '0', '0', '0');
INSERT INTO `users` VALUES ('4', '郭宇浩', 'gyh', 'gyh@163.com', '15165108627', '2020-10-20 11:39:12', '$2y$10$zV1XoiYynT5526DY9Z73yOQ6mDlsRDsgXAFPvl/TZaPu5zMk8uXuK', null, null, null, null, null, '2020-10-20 11:38:27', '2020-10-27 10:48:58', 'https://cdn.learnku.com/uploads/images/201801/03/1/MFCtSTiGzj.jpg', null, '0', '1', null, null, '0', '0', '0');
INSERT INTO `users` VALUES ('5', '坏男孩', 'badboy', 'badboy_guo@hotmail.com', '15165108628', '2020-10-27 09:41:45', '$2y$10$zV1XoiYynT5526DY9Z73yOQ6mDlsRDsgXAFPvl/TZaPu5zMk8uXuK', null, null, null, null, null, '2020-10-20 13:26:13', '2020-10-27 10:48:58', 'http://test.xslp.cn:8080/uploads/images/avatars/202010/27/5_1603763861_1ajclCPeko.jpg', '个人介绍', '0', '1', null, '250411626', '1', '0', '0');

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
  `is_default` tinyint(4) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_addresses_user_id_foreign` (`user_id`),
  CONSTRAINT `user_addresses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user_addresses
-- ----------------------------
INSERT INTO `user_addresses` VALUES ('1', '1', '江苏省', '南京市', '浦口区', '384200', '第68街道第847号', '汪涛', '18485197712', null, '0', '2020-06-17 15:32:22', '2020-06-17 15:32:22');
INSERT INTO `user_addresses` VALUES ('2', '1', '广东省', '深圳市', '福田区', '837000', '第14街道第110号', '喻勇', '18765645898', null, '0', '2020-06-17 15:32:22', '2020-06-17 15:32:22');
INSERT INTO `user_addresses` VALUES ('3', '1', '山东省', '济南市', '历下区', '442700', '第36街道第514号', '卞浩', '15318175060', null, '0', '2020-06-17 15:32:23', '2020-06-17 15:32:23');
INSERT INTO `user_addresses` VALUES ('4', '1', '江苏省', '南京市', '浦口区', '151300', '第26街道第204号', '梅建华', '13278354425', null, '0', '2020-06-17 15:32:23', '2020-06-17 15:32:23');
INSERT INTO `user_addresses` VALUES ('5', '1', '北京市', '市辖区', '昌平区', '856800', '第92街道第318号', '沙婷', '18854894726', null, '0', '2020-06-17 15:32:23', '2020-06-17 15:32:23');
INSERT INTO `user_addresses` VALUES ('6', '1', '山东省', '济南市', '历下区', '321100', '第3街道第218号', '蔺春梅', '18918683997', null, '0', '2020-06-17 15:32:23', '2020-06-17 15:32:23');
INSERT INTO `user_addresses` VALUES ('7', '1', '北京市', '市辖区', '昌平区', '600006', '王府大街101号', '米小圈', '15165108626', null, '0', '2020-06-18 10:12:37', '2020-06-18 10:13:00');
INSERT INTO `user_addresses` VALUES ('9', '1', '广东省', '珠海市', '金湾区', '114006', '泉城广场11号', '李军', '15165108623', null, '0', '2020-06-18 10:15:55', '2020-06-18 10:15:55');
INSERT INTO `user_addresses` VALUES ('10', '1', '山东省', '济南市', '天桥区', '262000', '影山花园2-2-302', '郭继安', '15165108626', null, '1', '2020-08-26 15:43:47', '2020-08-26 16:02:41');
INSERT INTO `user_addresses` VALUES ('11', '2', '北京市', '市辖区', '昌平区', '620000', '王府大街100号', '王小明', '15165108623', null, '0', '2020-10-21 10:13:17', '2020-10-21 10:13:17');
INSERT INTO `user_addresses` VALUES ('12', '5', '北京市', '市辖区', '密云区', '600000', '王府大街200号', '李军', '15165108623', null, '0', '2020-10-21 16:55:33', '2020-10-21 16:55:33');
INSERT INTO `user_addresses` VALUES ('13', '3', '山东省', '临沂市', '蒙阴县', '620000', '王府大街100号1', '王小明', '15165108623', null, '0', '2020-10-29 14:56:15', '2020-10-29 14:56:15');

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user_favorite_products
-- ----------------------------
INSERT INTO `user_favorite_products` VALUES ('1', '1', '75', '2020-07-08 10:52:52', '2020-07-08 10:52:52');
INSERT INTO `user_favorite_products` VALUES ('4', '1', '76', '2020-07-08 10:54:12', '2020-07-08 10:54:12');
INSERT INTO `user_favorite_products` VALUES ('6', '1', '96', '2020-07-13 13:22:28', '2020-07-13 13:22:28');
INSERT INTO `user_favorite_products` VALUES ('8', '1', '98', '2020-07-13 14:02:16', '2020-07-13 14:02:16');
INSERT INTO `user_favorite_products` VALUES ('9', '1', '97', '2020-07-13 16:06:42', '2020-07-13 16:06:42');
INSERT INTO `user_favorite_products` VALUES ('10', '1', '93', '2020-07-13 16:06:55', '2020-07-13 16:06:55');
INSERT INTO `user_favorite_products` VALUES ('12', '1', '88', '2020-07-13 16:41:56', '2020-07-13 16:41:56');
INSERT INTO `user_favorite_products` VALUES ('13', '1', '95', '2020-07-13 16:43:35', '2020-07-13 16:43:35');
INSERT INTO `user_favorite_products` VALUES ('16', '1', '79', '2020-07-22 14:07:46', '2020-07-22 14:07:46');
INSERT INTO `user_favorite_products` VALUES ('17', '5', '79', '2020-10-22 14:44:14', '2020-10-22 14:44:14');
INSERT INTO `user_favorite_products` VALUES ('18', '5', '92', '2020-10-28 10:42:53', '2020-10-28 10:42:53');
INSERT INTO `user_favorite_products` VALUES ('19', '3', '92', '2020-10-29 14:55:28', '2020-10-29 14:55:28');
INSERT INTO `user_favorite_products` VALUES ('20', '3', '91', '2020-11-05 15:19:21', '2020-11-05 15:19:21');

-- ----------------------------
-- Table structure for `user_footprints`
-- ----------------------------
DROP TABLE IF EXISTS `user_footprints`;
CREATE TABLE `user_footprints` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned DEFAULT NULL,
  `category_id` bigint(20) unsigned DEFAULT NULL,
  `view_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_footprints_user_id_foreign` (`user_id`),
  KEY `user_footprints_product_id_foreign` (`product_id`),
  KEY `user_footprints_category_id_foreign` (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of user_footprints
-- ----------------------------
INSERT INTO `user_footprints` VALUES ('1', '1', '121', '25', '1', '0', '2020-08-25 10:12:38', '2020-08-25 11:12:41');

-- ----------------------------
-- Table structure for `user_invoices`
-- ----------------------------
DROP TABLE IF EXISTS `user_invoices`;
CREATE TABLE `user_invoices` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL COMMENT '用户id',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公司抬头',
  `duty_paragraph` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '税号',
  `opening_bank` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '开户行',
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '地址及电话',
  `content` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '内容',
  `is_default` tinyint(4) NOT NULL DEFAULT '0' COMMENT '默认',
  `type` tinyint(4) NOT NULL COMMENT '类型 1企业 2个人',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_invoices_user_id_foreign` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of user_invoices
-- ----------------------------
INSERT INTO `user_invoices` VALUES ('1', '1', '1', '2', '3', '4', '5', '0', '1', '2020-09-08 14:22:40', '2020-09-08 14:22:43');
INSERT INTO `user_invoices` VALUES ('2', '1', '张扬科技', '122188999', '', '', '', '1', '1', '2020-09-08 17:07:45', '2020-09-08 17:07:45');
INSERT INTO `user_invoices` VALUES ('3', '3', '联想科技', '371329001', '', '', '', '1', '1', '2020-10-30 14:56:49', '2020-10-30 14:56:49');

-- ----------------------------
-- Table structure for `user_notifiable_types`
-- ----------------------------
DROP TABLE IF EXISTS `user_notifiable_types`;
CREATE TABLE `user_notifiable_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notification_logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notification_count` int(10) unsigned NOT NULL DEFAULT '0',
  `description` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_notifiable_types_user_id_foreign` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of user_notifiable_types
-- ----------------------------
INSERT INTO `user_notifiable_types` VALUES ('1', '1', 'App\\Notifications\\ProductOnsale', '/static/logo.png', '0', 'mi10发布，价格3600', '2020-08-31 15:46:21', '2020-09-02 14:02:55');
INSERT INTO `user_notifiable_types` VALUES ('2', '1', 'App\\Notifications\\WebAnnounceNotification', '/static/logo.png', '3', '大家可以众筹喜欢的商品了', '2020-09-23 13:53:25', '2020-09-23 14:01:05');
INSERT INTO `user_notifiable_types` VALUES ('3', '2', 'App\\Notifications\\WebAnnounceNotification', '/static/logo.png', '3', '大家可以众筹喜欢的商品了', '2020-09-23 13:53:26', '2020-09-23 14:01:05');
INSERT INTO `user_notifiable_types` VALUES ('4', '1', 'App\\Notifications\\CouponNotification', '/static/logo.png', '2', '满5000减50获取时间：2020-10-28 10:48:12至2020-11-09 10:48:18', '2020-09-23 14:42:45', '2020-10-27 10:48:55');
INSERT INTO `user_notifiable_types` VALUES ('5', '2', 'App\\Notifications\\CouponNotification', '/static/logo.png', '2', '满5000减50获取时间：2020-10-28 10:48:12至2020-11-09 10:48:18', '2020-09-23 14:42:45', '2020-10-27 10:48:58');
INSERT INTO `user_notifiable_types` VALUES ('6', '3', 'App\\Notifications\\CouponNotification', '/static/logo.png', '1', '满5000减50获取时间：2020-10-28 10:48:12至2020-11-09 10:48:18', '2020-10-27 10:48:58', '2020-10-27 10:48:58');
INSERT INTO `user_notifiable_types` VALUES ('7', '4', 'App\\Notifications\\CouponNotification', '/static/logo.png', '1', '满5000减50获取时间：2020-10-28 10:48:12至2020-11-09 10:48:18', '2020-10-27 10:48:58', '2020-10-27 10:48:58');
INSERT INTO `user_notifiable_types` VALUES ('8', '5', 'App\\Notifications\\CouponNotification', '/static/logo.png', '1', '满5000减50获取时间：2020-10-28 10:48:12至2020-11-09 10:48:18', '2020-10-27 10:48:58', '2020-10-27 10:48:58');

-- ----------------------------
-- Table structure for `wallets`
-- ----------------------------
DROP TABLE IF EXISTS `wallets`;
CREATE TABLE `wallets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `holder_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `holder_id` bigint(20) unsigned NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `balance` decimal(64,0) NOT NULL DEFAULT '0',
  `decimal_places` smallint(6) NOT NULL DEFAULT '2',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wallets_holder_type_holder_id_slug_unique` (`holder_type`,`holder_id`,`slug`),
  KEY `wallets_holder_type_holder_id_index` (`holder_type`,`holder_id`),
  KEY `wallets_slug_index` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of wallets
-- ----------------------------
INSERT INTO `wallets` VALUES ('1', 'App\\Models\\User', '1', 'Default Wallet', 'default', null, '87450', '2', '2020-09-21 15:53:43', '2020-10-27 16:59:41');
INSERT INTO `wallets` VALUES ('2', 'App\\Models\\User', '2', 'Default Wallet', 'default', null, '1100000', '2', '2020-09-21 15:53:43', '2020-10-23 15:54:00');
INSERT INTO `wallets` VALUES ('3', 'App\\Models\\User', '3', 'Default Wallet', 'default', null, '4000', '2', '2020-10-16 15:48:23', '2020-11-04 13:41:56');
INSERT INTO `wallets` VALUES ('4', 'App\\Models\\User', '4', 'Default Wallet', 'default', null, '0', '2', '2020-10-20 11:38:27', '2020-10-20 13:21:06');
INSERT INTO `wallets` VALUES ('5', 'App\\Models\\User', '5', 'Default Wallet', 'default', null, '9000', '2', '2020-10-20 13:26:13', '2020-10-29 13:41:18');
INSERT INTO `wallets` VALUES ('6', 'App\\Models\\Order', '32', 'Default Wallet', 'default', null, '3000', '2', '2020-10-28 11:03:05', '2020-10-28 11:03:05');
INSERT INTO `wallets` VALUES ('7', 'App\\Models\\Shop', '1', 'Default Wallet', 'default', null, '9000', '2', '2020-10-28 16:44:39', '2020-11-04 13:41:56');
