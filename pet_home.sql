    /*
     Navicat Premium Data Transfer

     Source Server         : mysql
     Source Server Type    : MySQL
     Source Server Version : 80041 (8.0.41)
     Source Host           : localhost:3306
     Source Schema         : pet_home

     Target Server Type    : MySQL
     Target Server Version : 80041 (8.0.41)
     File Encoding         : 65001

     Date: 18/05/2025 10:45:29
    */

    SET NAMES utf8mb4;
    SET FOREIGN_KEY_CHECKS = 0;

    -- ----------------------------
    -- Table structure for adoption
    -- ----------------------------
    DROP TABLE IF EXISTS `adoption`;
    CREATE TABLE `adoption`  (
      `id` bigint NOT NULL AUTO_INCREMENT COMMENT '申请ID',
      `user_id` bigint NOT NULL COMMENT '用户ID',
      `pet_id` bigint NOT NULL COMMENT '宠物ID',
      `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态(已申请/审核中/已通过/已拒绝)',
      `apply_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '申请理由',
      `contact_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
      `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地址',
      `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
      `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
      PRIMARY KEY (`id`) USING BTREE,
      INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
      INDEX `idx_pet_id`(`pet_id` ASC) USING BTREE
    ) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '领养申请表' ROW_FORMAT = Dynamic;

    -- ----------------------------
    -- Records of adoption
    -- ----------------------------
    INSERT INTO `adoption` VALUES (1, 2, 9, '已拒绝', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', '15252393501', 'jiangsuihnsiu', '2025-05-14 14:05:25', '2025-05-17 18:45:09');
    INSERT INTO `adoption` VALUES (2, 2, 6, '已通过', '我想要我想要我想要我想要我想要我想要我想要我想要', '15252393501', '江苏省淮安市淮阴区', '2025-05-17 12:19:07', '2025-05-17 12:19:33');
    INSERT INTO `adoption` VALUES (3, 2, 7, '已申请', '11111111111', '13952632125', '1111111111111111111', '2025-05-18 10:08:37', '2025-05-18 10:08:37');

    -- ----------------------------
    -- Table structure for banner
    -- ----------------------------
    DROP TABLE IF EXISTS `banner`;
    CREATE TABLE `banner`  (
      `id` bigint NOT NULL AUTO_INCREMENT COMMENT '轮播图ID',
      `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标题',
      `image_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '图片URL',
      `link_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '链接URL',
      `sort` int NULL DEFAULT 0 COMMENT '排序',
      `status` tinyint NULL DEFAULT 1 COMMENT '状态(0:禁用,1:正常)',
      `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
      `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
      PRIMARY KEY (`id`) USING BTREE
    ) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '轮播图表' ROW_FORMAT = Dynamic;

    -- ----------------------------
    -- Records of banner
    -- ----------------------------
    INSERT INTO `banner` VALUES (1, '新人专享优惠', '/img/1747412982979.png', '/promotion/new', 1, 1, '2025-05-13 22:32:13', '2025-05-17 00:29:44');
    INSERT INTO `banner` VALUES (2, '宠物美容8折', '/img/1747412990629.png', '/service/beauty', 2, 1, '2025-05-13 22:32:13', '2025-05-17 00:29:52');
    INSERT INTO `banner` VALUES (3, '精品猫粮推荐', '/img/1747412997612.png', '/product/category/cat-food', 3, 1, '2025-05-13 22:32:13', '2025-05-18 08:51:42');
    INSERT INTO `banner` VALUES (4, '夏季宠物防暑指南', '/img/1747413009399.jpg', '/encyclopedia/summer-guide', 4, 1, '2025-05-13 22:32:13', '2025-05-17 00:30:10');

    -- ----------------------------
    -- Table structure for boarding
    -- ----------------------------
    DROP TABLE IF EXISTS `boarding`;
    CREATE TABLE `boarding`  (
      `id` bigint NOT NULL AUTO_INCREMENT COMMENT '寄养ID',
      `user_id` bigint NOT NULL COMMENT '用户ID',
      `pet_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '宠物名称',
      `pet_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '宠物类型',
      `start_time` datetime NOT NULL COMMENT '开始时间',
      `end_time` datetime NOT NULL COMMENT '结束时间',
      `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态(已申请/已接受/进行中/已完成/已取消)',
      `requirements` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '特殊要求',
      `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
      `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
      `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
      PRIMARY KEY (`id`) USING BTREE,
      INDEX `idx_user_id`(`user_id` ASC) USING BTREE
    ) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '寄养信息表' ROW_FORMAT = Dynamic;

    -- ----------------------------
    -- Records of boarding
    -- ----------------------------
    INSERT INTO `boarding` VALUES (1, 2, '小白', '猫', '2025-05-14 00:00:00', '2025-05-22 00:00:00', '已完成', '', 55.00, '2025-05-14 13:54:17', '2025-05-15 18:40:08');
    INSERT INTO `boarding` VALUES (2, 2, '小黑', '1', '2025-05-29 00:00:00', '2025-06-24 00:00:00', '已申请', '', 2080.00, '2025-05-17 14:32:52', '2025-05-17 14:32:52');
    INSERT INTO `boarding` VALUES (4, 2, '小灰', '豚鼠', '2025-05-23 00:00:00', '2025-06-22 00:00:00', '已申请', '', 1800.00, '2025-05-17 18:58:36', '2025-05-17 18:58:36');

    -- ----------------------------
    -- Table structure for order
    -- ----------------------------
    DROP TABLE IF EXISTS `order`;
    CREATE TABLE `order`  (
      `id` bigint NOT NULL AUTO_INCREMENT COMMENT '订单ID',
      `user_id` bigint NOT NULL COMMENT '用户ID',
      `order_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单编号',
      `product_id` bigint NOT NULL COMMENT '商品ID',
      `quantity` int NOT NULL DEFAULT 1 COMMENT '商品数量',
      `price` decimal(10, 2) NOT NULL COMMENT '商品单价',
      `total_amount` decimal(10, 2) NOT NULL COMMENT '订单总金额',
      `payment_method` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '支付方式',
      `payment_time` datetime NULL DEFAULT NULL COMMENT '支付时间',
      `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单状态(待付款/待发货/待收货/已完成/已取消)',
      `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '收货地址',
      `contact_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '联系人',
      `contact_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '联系电话',
      `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '订单备注',
      `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
      `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
      PRIMARY KEY (`id`) USING BTREE,
      UNIQUE INDEX `uk_order_no`(`order_no` ASC) USING BTREE,
      INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
      INDEX `idx_product_id`(`product_id` ASC) USING BTREE,
      INDEX `idx_create_time`(`create_time` ASC) USING BTREE
    ) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '订单表' ROW_FORMAT = Dynamic;

    -- ----------------------------
    -- Records of order
    -- ----------------------------
    INSERT INTO `order` VALUES (2, 2, '202505142218286a08', 13, 1, 29.90, 29.90, '支付宝', '2025-05-14 22:18:39', '已完成', '江苏南京', '张三', '13800138001', '', '2025-05-14 22:18:28', '2025-05-15 01:46:13');
    INSERT INTO `order` VALUES (4, 2, '202505150147558b7b', 13, 1, 29.90, 29.90, '支付宝', '2025-05-15 01:48:03', '待发货', '江苏南京', '张三', '13800138001', '', '2025-05-15 01:47:56', '2025-05-15 01:48:03');
    INSERT INTO `order` VALUES (5, 2, '202505150153540ef5', 14, 1, 159.00, 159.00, '微信支付', '2025-05-15 01:54:00', '已完成', '江苏南京', '张三', '13800138001', '', '2025-05-15 01:53:54', '2025-05-15 01:56:04');
    INSERT INTO `order` VALUES (6, 2, '2025051810085962e5', 14, 1, 159.00, 159.00, '支付宝', '2025-05-18 10:09:06', '待发货', '江苏南京水渡口', '张三', '13800138001', '', '2025-05-18 10:08:59', '2025-05-18 10:09:06');

    -- ----------------------------
    -- Table structure for pet
    -- ----------------------------
    DROP TABLE IF EXISTS `pet`;
    CREATE TABLE `pet`  (
      `id` bigint NOT NULL AUTO_INCREMENT COMMENT '宠物ID',
      `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '宠物名称',
      `breed` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '品种',
      `age` int NULL DEFAULT NULL COMMENT '年龄',
      `gender` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '性别',
      `health_status` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '健康状况',
      `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '描述',
      `images` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图片',
      `adoption_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '领养状态',
      `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
      `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
      `category_id` bigint NULL DEFAULT NULL COMMENT '宠物分类ID',
      PRIMARY KEY (`id`) USING BTREE,
      INDEX `idx_category_id`(`category_id` ASC) USING BTREE,
      CONSTRAINT `fk_pet_category` FOREIGN KEY (`category_id`) REFERENCES `pet_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
    ) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '宠物信息表' ROW_FORMAT = Dynamic;

    -- ----------------------------
    -- Records of pet
    -- ----------------------------
    INSERT INTO `pet` VALUES (1, '花花', '英国短毛猫', 2, '母', '健康', '花花是一只活泼可爱的英短，性格温顺，非常亲人。', '/img/1747414602722.jpg', '可领养', '2025-05-13 22:32:13', '2025-05-17 00:56:44', 1);
    INSERT INTO `pet` VALUES (2, '奇奇', '金毛', 1, '公', '健康', '奇奇是一只阳光开朗的金毛，喜欢户外活动，对小孩子很友好。', '/img/1747414582496.jpg,/img/1747414584634.jpg', '可领养', '2025-05-13 22:32:13', '2025-05-17 00:56:25', 2);
    INSERT INTO `pet` VALUES (3, '豆豆', '美国短毛猫', 3, '公', '健康', '豆豆性格独立，但也非常黏人，喜欢被抚摸。', '/img/1747414594072.jpg,/img/1747414596660.jpg', '可领养', '2025-05-13 22:32:13', '2025-05-17 00:56:37', 1);
    INSERT INTO `pet` VALUES (4, '贝贝', '柯基', 2, '母', '健康', '贝贝活泼好动，喜欢和主人一起玩耍，是一只理想的家庭伴侣犬。', '/img/1747414574763.jpg,/img/1747414576998.jpg', '已领养', '2025-05-13 22:32:13', '2025-05-17 00:56:18', 2);
    INSERT INTO `pet` VALUES (5, '小黑', '拉布拉多', 3, '母', '健康', '小黑是一只活泼开朗的拉布拉多，喜欢奔跑和游泳，对人友好，很适合有小孩的家庭。', '/img/1747414452863.jpg', '可领养', '2025-05-13 22:32:30', '2025-05-17 00:54:15', 16);
    INSERT INTO `pet` VALUES (6, '米莉', '布偶猫', 1, '母', '健康', '米莉是一只漂亮的布偶猫，有着蓝色的大眼睛，性格温顺，喜欢安静的环境。', '/img/1747414465045.jpg,/img/1747414467363.jpg', '已领养', '2025-05-13 22:32:30', '2025-05-17 00:54:28', 1);
    INSERT INTO `pet` VALUES (7, '皮蛋', '泰迪', 2, '公', '健康', '皮蛋是一只聪明的泰迪犬，毛色棕褐，卷曲毛发，不掉毛，很适合家庭饲养。', '/img/1747414477659.jpg,/img/1747414487749.jpg', '可领养', '2025-05-13 22:32:30', '2025-05-17 00:54:48', 2);
    INSERT INTO `pet` VALUES (8, '咪咪', '暹罗猫', 2, '母', '健康', '咪咪有着典型的暹罗猫外表，聪明机警，活力充沛，很黏人。', '/img/1747414495022.jpg,/img/1747414497999.jpg', '可领养', '2025-05-13 22:32:30', '2025-05-17 00:54:58', 1);
    INSERT INTO `pet` VALUES (9, '旺财', '边境牧羊犬', 1, '公', '健康', '旺财是一只高智商的边牧，黑白相间的毛色，对主人忠诚，需要大量运动。', '/img/1747414507419.jpg,/img/1747414509807.jpg', '已领养', '2025-05-13 22:32:30', '2025-05-17 00:55:10', 2);
    INSERT INTO `pet` VALUES (10, '点点', '斑点猫', 3, '母', '健康', '点点有着独特的花纹毛发，性格独立，但对熟悉的人很亲近。', '/img/1747414517302.jpg,/img/1747414519454.jpg', '可领养', '2025-05-13 22:32:30', '2025-05-17 00:55:20', 1);
    INSERT INTO `pet` VALUES (11, '大黄', '中华田园犬', 4, '公', '健康', '大黄是一只忠诚的中华田园犬，警觉性高，非常适合看家护院。', '/img/1747414527491.jpg,/img/1747414528986.jpg', '可领养', '2025-05-13 22:32:30', '2025-05-17 00:55:30', 2);
    INSERT INTO `pet` VALUES (12, '雪球', '波斯猫', 2, '母', '健康', '雪球有着雪白的长毛，性格安静优雅，喜欢舒适的环境和被梳理毛发。', '/img/1747414557598.jpg', '已领养', '2025-05-13 22:32:30', '2025-05-17 00:55:58', 1);
    INSERT INTO `pet` VALUES (13, '小灰', '垂耳兔', 1, '公', '健康', '小灰是一只可爱的垂耳兔，灰色毛发，性格温顺，喜欢吃胡萝卜和新鲜蔬菜。', '/img/1747414538865.jpg,/img/1747414540433.jpg', '可领养', '2025-05-13 22:32:30', '2025-05-17 00:55:42', 23);
    INSERT INTO `pet` VALUES (14, '豆芽', '布丁仓鼠', 1, '母', '健康', '豆芽是一只活泼的小仓鼠，金黄色毛发，喜欢在滚轮上奔跑，性格好奇。', '/img/1747414618964.jpg,/img/1747414620827.jpg,/img/1747414623273.jpg,/img/1747414625633.jpg', '可领养', '2025-05-13 22:32:30', '2025-05-17 00:57:06', 24);

    -- ----------------------------
    -- Table structure for pet_category
    -- ----------------------------
    DROP TABLE IF EXISTS `pet_category`;
    CREATE TABLE `pet_category`  (
      `id` bigint NOT NULL AUTO_INCREMENT COMMENT '分类ID',
      `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类名称',
      `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分类描述',
      `sort` int NULL DEFAULT 0 COMMENT '排序',
      `parent_id` bigint NULL DEFAULT NULL COMMENT '父分类ID',
      `status` tinyint NULL DEFAULT 1 COMMENT '状态(0:禁用,1:正常)',
      `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
      `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
      PRIMARY KEY (`id`) USING BTREE,
      INDEX `idx_parent_id`(`parent_id` ASC) USING BTREE
    ) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '宠物分类表' ROW_FORMAT = Dynamic;

    -- ----------------------------
    -- Records of pet_category
    -- ----------------------------
    INSERT INTO `pet_category` VALUES (1, '猫', '各种猫咪品种1', 1, 0, 1, '2025-05-16 15:43:42', '2025-05-16 16:02:10');
    INSERT INTO `pet_category` VALUES (2, '狗', '各种犬类品种', 2, NULL, 1, '2025-05-16 15:43:42', '2025-05-16 15:43:42');
    INSERT INTO `pet_category` VALUES (3, '小型宠物', '适合在家饲养的小型宠物', 3, NULL, 1, '2025-05-16 15:43:42', '2025-05-16 15:43:42');
    INSERT INTO `pet_category` VALUES (4, '鸟类', '各种鸟类宠物', 4, NULL, 1, '2025-05-16 15:43:42', '2025-05-16 15:43:42');
    INSERT INTO `pet_category` VALUES (5, '爬行动物', '蜥蜴、乌龟等爬行宠物', 5, NULL, 1, '2025-05-16 15:43:42', '2025-05-16 15:43:42');
    INSERT INTO `pet_category` VALUES (6, '其他', '其他类型宠物', 99, NULL, 0, '2025-05-16 15:43:42', '2025-05-16 15:43:42');
    INSERT INTO `pet_category` VALUES (7, '波斯猫', '长毛猫的代表品种，性格温顺', 1, 1, 1, '2025-05-16 15:43:42', '2025-05-16 15:43:42');
    INSERT INTO `pet_category` VALUES (8, '英国短毛猫', '体型圆胖，性格温和友善', 2, 1, 1, '2025-05-16 15:43:42', '2025-05-16 15:43:42');
    INSERT INTO `pet_category` VALUES (9, '美国短毛猫', '体型中等，性格活泼', 3, 1, 1, '2025-05-16 15:43:42', '2025-05-16 15:43:42');
    INSERT INTO `pet_category` VALUES (10, '暹罗猫', '外形苗条，叫声响亮', 4, 1, 1, '2025-05-16 15:43:42', '2025-05-16 15:43:42');
    INSERT INTO `pet_category` VALUES (11, '缅因猫', '大型猫种，被毛浓密', 5, 1, 1, '2025-05-16 15:43:42', '2025-05-16 15:43:42');
    INSERT INTO `pet_category` VALUES (12, '异国短毛猫', '扁平的面部，安静友好', 6, 1, 1, '2025-05-16 15:43:42', '2025-05-16 15:43:42');
    INSERT INTO `pet_category` VALUES (13, '布偶猫', '大型温顺猫种，被毛柔软', 7, 1, 1, '2025-05-16 15:43:42', '2025-05-16 15:43:42');
    INSERT INTO `pet_category` VALUES (14, '折耳猫', '特殊的折耳特征，性格温顺', 8, 1, 1, '2025-05-16 15:43:42', '2025-05-16 15:43:42');
    INSERT INTO `pet_category` VALUES (15, '金毛犬', '聪明忠诚的家庭犬', 1, 2, 1, '2025-05-16 15:43:42', '2025-05-16 15:43:42');
    INSERT INTO `pet_category` VALUES (16, '拉布拉多犬', '友善活泼，适合家庭饲养', 2, 2, 1, '2025-05-16 15:43:42', '2025-05-16 15:43:42');
    INSERT INTO `pet_category` VALUES (17, '柴犬', '精力充沛，警惕性高', 3, 2, 1, '2025-05-16 15:43:42', '2025-05-16 15:43:42');
    INSERT INTO `pet_category` VALUES (18, '哈士奇', '活泼好动，喜欢户外活动', 4, 2, 1, '2025-05-16 15:43:42', '2025-05-16 15:43:42');
    INSERT INTO `pet_category` VALUES (19, '边境牧羊犬', '聪明敏捷，最聪明的犬种之一', 5, 2, 1, '2025-05-16 15:43:42', '2025-05-16 15:43:42');
    INSERT INTO `pet_category` VALUES (20, '泰迪犬', '小型温顺犬种，不掉毛', 6, 2, 1, '2025-05-16 15:43:42', '2025-05-16 15:43:42');
    INSERT INTO `pet_category` VALUES (21, '柯基犬', '短腿长身体，活泼可爱', 7, 2, 1, '2025-05-16 15:43:42', '2025-05-16 15:43:42');
    INSERT INTO `pet_category` VALUES (22, '萨摩耶犬', '白色被毛，永远微笑的脸', 8, 2, 1, '2025-05-16 15:43:42', '2025-05-16 15:43:42');
    INSERT INTO `pet_category` VALUES (23, '兔子', '安静可爱的小宠物', 1, 3, 1, '2025-05-16 15:43:42', '2025-05-16 15:43:42');
    INSERT INTO `pet_category` VALUES (24, '仓鼠', '小型啮齿动物，活动力强', 2, 3, 1, '2025-05-16 15:43:42', '2025-05-16 15:43:42');
    INSERT INTO `pet_category` VALUES (25, '豚鼠', '温顺友好的小型宠物', 3, 3, 1, '2025-05-16 15:43:42', '2025-05-16 15:43:42');
    INSERT INTO `pet_category` VALUES (26, '荷兰猪', '可爱的小型宠物，易于饲养', 4, 3, 1, '2025-05-16 15:43:42', '2025-05-16 15:43:42');
    INSERT INTO `pet_category` VALUES (27, '雪貂', '活泼好动的小型宠物', 5, 3, 1, '2025-05-16 15:43:42', '2025-05-16 15:43:42');
    INSERT INTO `pet_category` VALUES (28, '虎皮鹦鹉', '小型鹦鹉，性格活泼', 1, 4, 1, '2025-05-16 15:43:42', '2025-05-16 15:43:42');
    INSERT INTO `pet_category` VALUES (29, '金丝雀', '歌声优美的笼养鸟', 2, 4, 1, '2025-05-16 15:43:42', '2025-05-16 15:43:42');
    INSERT INTO `pet_category` VALUES (30, '鸡尾鹦鹉', '小型鹦鹉，色彩鲜艳', 3, 4, 0, '2025-05-16 15:43:42', '2025-05-16 15:43:42');
    INSERT INTO `pet_category` VALUES (31, '文鸟', '小型笼养鸟，性格温顺', 4, 4, 1, '2025-05-16 15:43:42', '2025-05-16 15:43:42');
    INSERT INTO `pet_category` VALUES (32, '乌龟', '寿命长，饲养简单', 1, 5, 1, '2025-05-16 15:43:42', '2025-05-16 15:43:42');
    INSERT INTO `pet_category` VALUES (33, '蜥蜴', '包括守宫等多种蜥蜴', 2, 5, 1, '2025-05-16 15:43:42', '2025-05-16 15:43:42');
    INSERT INTO `pet_category` VALUES (34, '蛇', '特殊的爬行宠物', 3, 5, 1, '2025-05-16 15:43:42', '2025-05-16 15:43:42');

    -- ----------------------------
    -- Table structure for pet_health_record
    -- ----------------------------
    DROP TABLE IF EXISTS `pet_health_record`;
    CREATE TABLE `pet_health_record`  (
      `id` bigint NOT NULL AUTO_INCREMENT COMMENT '记录ID',
      `pet_id` bigint NOT NULL COMMENT '宠物ID',
      `user_id` bigint NOT NULL COMMENT '主人ID',
      `record_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '记录类型(体检/疫苗/就诊/手术)',
      `record_date` datetime NOT NULL COMMENT '记录日期',
      `hospital` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '医院名称',
      `doctor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '医生姓名',
      `weight` decimal(5, 2) NULL DEFAULT NULL COMMENT '体重(kg)',
      `temperature` decimal(3, 1) NULL DEFAULT NULL COMMENT '体温(℃)',
      `heart_rate` int NULL DEFAULT NULL COMMENT '心率(次/分)',
      `blood_pressure` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '血压',
      `respiratory_rate` int NULL DEFAULT NULL COMMENT '呼吸频率(次/分)',
      `skin_condition` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '皮肤状况',
      `fur_condition` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '毛发状况',
      `eye_condition` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '眼部状况',
      `ear_condition` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '耳部状况',
      `oral_condition` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '口腔状况',
      `limb_condition` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '四肢状况',
      `diagnosis_results` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '诊断和检查结果',
      `health_suggestions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '健康建议(包括饮食和活动)',
      `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '备注',
      `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
      `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
      PRIMARY KEY (`id`) USING BTREE,
      INDEX `idx_pet_id`(`pet_id` ASC) USING BTREE,
      INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
      INDEX `idx_record_date`(`record_date` ASC) USING BTREE,
      INDEX `idx_record_type`(`record_type` ASC) USING BTREE
    ) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '宠物健康记录表' ROW_FORMAT = Dynamic;

    -- ----------------------------
    -- Records of pet_health_record
    -- ----------------------------
    INSERT INTO `pet_health_record` VALUES (1, 1, 2, '体检', '2025-01-15 10:30:00', '爱宠动物医院', '张医生', 4.20, 38.5, 120, '正常', 25, '良好，无异常', '光滑，无寄生虫', '清澈，无分泌物', '清洁，无异常', '牙齿健康，轻微牙结石', '正常，关节灵活', '整体健康状况良好，有轻微牙结石', '建议定期刷牙，保持口腔卫生；提供足够的活动空间，保持适当运动；继续保持现有饮食结构', '饮食情况良好，精神状态活泼', '2025-05-13 22:32:30', '2025-05-13 22:32:30');
    INSERT INTO `pet_health_record` VALUES (2, 2, 2, '就诊', '2025-02-01 15:00:00', '康宠宠物医院', '李医生', 28.50, 39.0, 95, '正常', 22, '局部皮肤发红', '部分区域掉毛', '正常', '正常', '正常', '右后腿轻微跛行', '轻度皮肤过敏，建议进行过敏原检测', '更换低过敏性狗粮；避免使用可能引起过敏的洗护产品；每天为皮肤问题区域进行药物涂抹；观察是否有环境过敏原', '对主人描述的花粉季节症状加重情况进行了记录，考虑可能存在季节性过敏', '2025-05-13 22:32:30', '2025-05-13 22:32:30');
    INSERT INTO `pet_health_record` VALUES (3, 3, 3, '体检', '2025-01-20 09:15:00', '爱宠动物医院', '王医生', 5.80, 38.3, 125, '正常', 24, '良好', '浓密健康', '清澈明亮', '清洁', '良好', '正常', '身体各项指标正常，适当控制体重', '控制食量，增加运动量；每日梳理毛发，减少毛球形成；定期进行口腔护理；保持足够的饮水量', '主人反映近期食欲增加，建议控制饮食', '2025-05-13 22:32:30', '2025-05-13 22:32:30');
    INSERT INTO `pet_health_record` VALUES (4, 4, 3, '手术', '2025-02-18 08:00:00', '宠爱专科医院', '赵医生', 3.50, 37.8, 130, '偏低', 28, '手术区域已剃毛', '良好', '轻微发红', '正常', '正常', '正常', '绝育手术顺利完成，恢复情况良好', '保持伤口清洁干燥；术后7-10天拆线；穿戴伊丽莎白圈防止舔舐伤口；减少活动量，避免跳跃；按时服用处方药物', '手术恢复期间需要特别关注饮食和精神状态', '2025-05-13 22:32:30', '2025-05-13 22:32:30');
    INSERT INTO `pet_health_record` VALUES (5, 5, 2, '疫苗', '2025-03-05 14:30:00', '康宠宠物医院', '张医生', 30.20, 38.7, 90, '正常', 21, '良好', '光泽', '正常', '正常', '正常', '正常', '狂犬疫苗接种完成，无不良反应', '接种后24小时内避免洗澡；观察有无不良反应；保持正常饮食和运动；一年后进行下次接种', '本次为年度常规疫苗接种，宠物状态良好', '2025-05-13 22:32:30', '2025-05-15 18:28:48');
    INSERT INTO `pet_health_record` VALUES (6, 8, 2, '体检', '2025-02-25 11:00:00', '爱宠动物医院', '李医生', 3.80, 38.6, 128, '正常', 26, '良好', '柔软光滑', '明亮', '清洁', '轻微牙垢', '正常', '整体健康，有轻微牙垢', '建议定期洁牙；提供适合猫咪的磨牙零食；保持均衡饮食；继续保持良好的生活习惯', '主人反映有时会呕吐毛球，建议增加梳理频率', '2025-05-13 22:32:30', '2025-05-13 22:32:30');
    INSERT INTO `pet_health_record` VALUES (7, 9, 3, '就诊', '2025-03-10 16:45:00', '小动物专科医院', '王医生', 1.20, 39.2, 205, '正常', 36, '局部有湿疹', '部分区域脱毛', '轻微分泌物', '正常', '正常', '正常', '皮肤真菌感染，需要抗真菌治疗', '每天用药液擦拭感染区域；口服抗真菌药物；隔离单独饲养，防止传染；改善饲养环境，保持干燥清洁', '两周后复查', '2025-05-13 22:32:30', '2025-05-13 22:32:30');
    INSERT INTO `pet_health_record` VALUES (8, 10, 3, '体检', '2025-01-30 10:30:00', '小宠物诊所', '赵医生', 0.12, 37.9, 450, '正常', 90, '良好', '光滑', '明亮', '正常', '正常', '正常', '各项指标正常，健康状况良好', '保持笼子清洁；提供适量的运动机会；喂食均衡的食物；避免过冷过热环境', '首次体检，主人反映精神状态良好，食欲正常', '2025-05-13 22:32:30', '2025-05-13 22:32:30');

    -- ----------------------------
    -- Table structure for pet_vaccination
    -- ----------------------------
    DROP TABLE IF EXISTS `pet_vaccination`;
    CREATE TABLE `pet_vaccination`  (
      `id` bigint NOT NULL AUTO_INCREMENT COMMENT '接种ID',
      `pet_id` bigint NOT NULL COMMENT '宠物ID',
      `vaccine_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '疫苗名称',
      `vaccination_date` datetime NOT NULL COMMENT '接种日期',
      `next_date` datetime NULL DEFAULT NULL COMMENT '下次接种日期',
      `hospital` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '接种医院',
      `batch_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '疫苗批号',
      `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '备注',
      `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
      `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
      PRIMARY KEY (`id`) USING BTREE,
      INDEX `idx_pet_id`(`pet_id` ASC) USING BTREE,
      INDEX `idx_vaccination_date`(`vaccination_date` ASC) USING BTREE
    ) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '疫苗接种记录表' ROW_FORMAT = Dynamic;

    -- ----------------------------
    -- Records of pet_vaccination
    -- ----------------------------
    INSERT INTO `pet_vaccination` VALUES (1, 1, '三联疫苗', '2024-12-01 09:30:00', '2025-12-01 00:00:00', '爱宠动物医院', 'BCV20241201', '首次接种，无不良反应', '2025-05-13 22:32:30', '2025-05-13 22:32:30');
    INSERT INTO `pet_vaccination` VALUES (2, 1, '狂犬疫苗', '2024-12-15 14:00:00', '2025-12-15 00:00:00', '爱宠动物医院', 'RBV20241215', '年度接种，状态良好', '2025-05-13 22:32:30', '2025-05-13 22:32:30');
    INSERT INTO `pet_vaccination` VALUES (3, 2, '八联疫苗', '2024-11-20 10:15:00', '2025-11-20 00:00:00', '康宠宠物医院', 'OCV20241120', '年度接种，无异常', '2025-05-13 22:32:30', '2025-05-13 22:32:30');
    INSERT INTO `pet_vaccination` VALUES (4, 2, '狂犬疫苗', '2025-03-05 14:30:00', '2026-03-05 00:00:00', '康宠宠物医院', 'RBV20250305', '年度接种，无不良反应', '2025-05-13 22:32:30', '2025-05-13 22:32:30');
    INSERT INTO `pet_vaccination` VALUES (5, 3, '三联疫苗', '2024-12-10 11:00:00', '2025-12-10 00:00:00', '爱宠动物医院', 'BCV20241210', '年度接种，状态良好', '2025-05-13 22:32:30', '2025-05-13 22:32:30');
    INSERT INTO `pet_vaccination` VALUES (6, 4, '猫三联疫苗', '2025-01-05 09:45:00', '2026-01-05 00:00:00', '爱宠动物医院', 'FCV20250105', '年度接种，无异常', '2025-05-13 22:32:30', '2025-05-13 22:32:30');
    INSERT INTO `pet_vaccination` VALUES (7, 5, '八联疫苗', '2025-02-10 15:30:00', '2026-02-10 00:00:00', '康宠宠物医院', 'OCV20250210', '加强针，无不良反应', '2025-05-13 22:32:30', '2025-05-13 22:32:30');
    INSERT INTO `pet_vaccination` VALUES (8, 5, '狂犬疫苗', '2025-02-10 15:45:00', '2026-02-10 00:00:00', '康宠宠物医院', 'RBV20250210', '与八联疫苗同时接种。', '2025-05-13 22:32:30', '2025-05-15 18:33:28');
    INSERT INTO `pet_vaccination` VALUES (9, 6, '猫三联疫苗', '2025-01-18 10:30:00', '2026-01-18 00:00:00', '宠爱专科医院', 'FCV20250118', '年度接种，状态良好', '2025-05-13 22:32:30', '2025-05-13 22:32:30');
    INSERT INTO `pet_vaccination` VALUES (10, 8, '猫咪传染性腹膜炎疫苗', '2025-01-25 14:00:00', '2026-01-25 00:00:00', '爱宠动物医院', 'FIP20250125', '首次接种，无异常', '2025-05-13 22:32:30', '2025-05-13 22:32:30');
    INSERT INTO `pet_vaccination` VALUES (11, 9, '兔多杆菌疫苗', '2025-02-20 11:15:00', '2025-08-20 00:00:00', '小动物专科医院', 'RBV20250220', '半年接种一次，无不良反应', '2025-05-13 22:32:30', '2025-05-13 22:32:30');

    -- ----------------------------
    -- Table structure for product
    -- ----------------------------
    DROP TABLE IF EXISTS `product`;
    CREATE TABLE `product`  (
      `id` bigint NOT NULL AUTO_INCREMENT COMMENT '商品ID',
      `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商品名称',
      `category` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分类',
      `price` decimal(10, 2) NOT NULL COMMENT '价格',
      `stock` int NOT NULL DEFAULT 0 COMMENT '库存',
      `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '描述',
      `images` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图片',
      `status` tinyint NULL DEFAULT 1 COMMENT '状态(0:下架,1:上架)',
      `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
      `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
      PRIMARY KEY (`id`) USING BTREE,
      INDEX `idx_category`(`category` ASC) USING BTREE
    ) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商品表' ROW_FORMAT = Dynamic;

    -- ----------------------------
    -- Records of product
    -- ----------------------------
    INSERT INTO `product` VALUES (1, '高级猫粮', '猫粮', 199.00, 100, '适合成年猫的高级营养猫粮，富含多种维生素和矿物质。', '/img/1747462000750.jpg,/img/1747462002721.jpg,/img/1747462003950.jpg,/img/1747462006893.jpg', 1, '2025-05-13 22:32:13', '2025-05-17 14:06:48');
    INSERT INTO `product` VALUES (2, '狗狗玩具球', '玩具', 29.90, 200, '耐咬耐磨的狗狗玩具球，可以增强宠物的运动能力。', '/img/1747461984663.jpg,/img/1747461986385.jpg,/img/1747461987688.jpg', 1, '2025-05-13 22:32:13', '2025-05-17 14:06:29');
    INSERT INTO `product` VALUES (3, '猫咪睡床', '窝垫', 89.00, 50, '柔软舒适的猫咪睡床，让您的猫咪睡得更安心。', '/img/1747461974690.jpg,/img/1747461977343.jpg', 1, '2025-05-13 22:32:13', '2025-05-17 14:06:18');
    INSERT INTO `product` VALUES (4, '宠物指甲剪', '护理用品', 39.00, 100, '安全便捷的宠物指甲剪，不伤害宠物爪子。', '/img/1747461958045.jpg,/img/1747461959405.jpg,/img/1747461962188.jpg', 1, '2025-05-13 22:32:13', '2025-05-17 14:06:03');
    INSERT INTO `product` VALUES (5, '狗狗沐浴露', '洗护用品', 59.00, 80, '温和不刺激的狗狗专用沐浴露，清洁同时保护皮肤。', '/img/1747461942429.jpg,/img/1747461946440.jpg,/img/1747461947996.jpg,/img/1747461950358.jpg', 1, '2025-05-13 22:32:13', '2025-05-17 14:05:51');
    INSERT INTO `product` VALUES (6, '进口高级狗粮', '狗粮', 259.00, 150, '来自美国的优质狗粮，适合所有成年犬种，含有丰富的蛋白质和必要的营养素。', '/img/1747461797360.jpg,/img/1747461799059.jpg,/img/1747461800480.jpg', 1, '2025-05-13 22:32:30', '2025-05-17 14:03:22');
    INSERT INTO `product` VALUES (7, '天然猫砂', '猫砂', 79.00, 200, '天然植物材质猫砂，除臭效果好，易结块，对猫咪健康无害。', '/img/1747461787081.jpg,/img/1747461788943.jpg', 1, '2025-05-13 22:32:30', '2025-05-17 14:03:10');
    INSERT INTO `product` VALUES (8, '宠物自动喂食器', '喂食器', 299.00, 50, '智能定时喂食器，可通过APP控制，保证宠物按时定量进食。', '/img/1747461780566.jpg', 1, '2025-05-13 22:32:30', '2025-05-17 14:03:02');
    INSERT INTO `product` VALUES (9, '猫爬架', '猫咪玩具', 399.00, 30, '多层猫爬架，带有猫窝、抓板和吊球，满足猫咪的休息和玩耍需求。', '/img/1747461770418.jpg,/img/1747461772181.jpg,/img/1747461773393.jpg', 1, '2025-05-13 22:32:30', '2025-05-17 14:02:55');
    INSERT INTO `product` VALUES (10, '宠物电动按摩器', '护理用品', 129.00, 80, '宠物专用按摩器，缓解宠物肌肉紧张，促进血液循环。', '/img/1747461760348.jpg,/img/1747461762095.jpg,/img/1747461763378.jpg', 1, '2025-05-13 22:32:30', '2025-05-17 14:02:45');
    INSERT INTO `product` VALUES (11, '狗狗零食骨头', '零食', 49.90, 200, '可食用的狗狗磨牙骨头，帮助清洁牙齿，强健牙龈。', '/img/1747461735022.jpg', 1, '2025-05-13 22:32:30', '2025-05-17 14:02:32');
    INSERT INTO `product` VALUES (12, '猫咪隧道玩具', '猫咪玩具', 89.00, 60, '可折叠的猫咪隧道，刺激猫咪的探索本能，增加运动量。', '/img/1747461702060.jpg,/img/1747461703935.jpg,/img/1747461705143.jpg,/img/1747461707318.jpg', 1, '2025-05-13 22:32:30', '2025-05-17 14:01:48');
    INSERT INTO `product` VALUES (13, '宠物清洁湿巾', '清洁用品', 29.90, 298, '专为宠物设计的清洁湿巾，无酒精，温和不刺激，方便日常清洁。', '/img/1747461688168.jpg,/img/1747461689948.jpg,/img/1747461691630.jpg,/img/1747461694123.jpg', 1, '2025-05-13 22:32:30', '2025-05-17 14:01:35');
    INSERT INTO `product` VALUES (14, '宠物口腔护理套装', '护理用品', 159.00, 67, '包含宠物牙刷、牙膏和漱口水的口腔护理套装，保持口腔健康。', '/img/1747461678603.jpg,/img/1747461680600.jpg,/img/1747461681897.jpg', 1, '2025-05-13 22:32:30', '2025-05-18 10:08:59');
    INSERT INTO `product` VALUES (15, '猫咪逗猫棒', '猫咪玩具', 39.90, 150, '互动逗猫棒，带有羽毛和铃铛，刺激猫咪的捕猎本能。', '/img/1747461650939.jpg,/img/1747461653884.jpg', 1, '2025-05-13 22:32:30', '2025-05-18 08:23:09');

    -- ----------------------------
    -- Table structure for service
    -- ----------------------------
    DROP TABLE IF EXISTS `service`;
    CREATE TABLE `service`  (
      `id` bigint NOT NULL AUTO_INCREMENT COMMENT '服务ID',
      `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '服务名称',
      `category_id` bigint NULL DEFAULT NULL COMMENT '分类ID',
      `price` decimal(10, 2) NOT NULL COMMENT '价格',
      `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '描述',
      `duration` int NULL DEFAULT NULL COMMENT '时长(分钟)',
      `status` tinyint NULL DEFAULT 1 COMMENT '状态(0:停用,1:启用)',
      `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
      `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
      PRIMARY KEY (`id`) USING BTREE,
      INDEX `idx_category_id`(`category_id` ASC) USING BTREE
    ) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '服务表' ROW_FORMAT = Dynamic;

    -- ----------------------------
    -- Records of service
    -- ----------------------------
    INSERT INTO `service` VALUES (1, '猫咪洗澡', 2, 88.00, '专业的猫咪洗澡服务，使用温和的洗浴产品，不伤害猫咪皮肤。', 60, 1, '2025-05-13 22:32:13', '2025-05-13 22:32:13');
    INSERT INTO `service` VALUES (2, '狗狗洗澡', 2, 108.00, '根据不同犬种提供专业的洗浴服务，包括洗澡、吹干、梳毛。', 90, 1, '2025-05-13 22:32:13', '2025-05-13 22:32:13');
    INSERT INTO `service` VALUES (3, '猫咪美容', 1, 138.00, '包括洗澡、剪指甲、清洁耳朵、梳毛等全套美容服务。', 120, 1, '2025-05-13 22:32:13', '2025-05-13 22:32:13');
    INSERT INTO `service` VALUES (4, '狗狗美容', 1, 168.00, '根据犬种特点提供专业的美容服务，包括造型修剪。', 150, 1, '2025-05-13 22:32:13', '2025-05-13 22:32:13');
    INSERT INTO `service` VALUES (5, '宠物常规体检', 3, 199.00, '包括体温、心率、呼吸、体重等基础检查，评估宠物健康状况。', 60, 1, '2025-05-13 22:32:13', '2025-05-13 22:32:13');
    INSERT INTO `service` VALUES (6, '短期寄养(猫)', 4, 98.00, '提供猫咪短期寄养服务，包括喂食、清洁、日常照料。', 1440, 1, '2025-05-13 22:32:13', '2025-05-13 22:32:13');
    INSERT INTO `service` VALUES (7, '短期寄养(狗)', 4, 128.00, '提供狗狗短期寄养服务，包括喂食、遛狗、日常照料。', 1440, 1, '2025-05-13 22:32:13', '2025-05-13 22:32:13');

    -- ----------------------------
    -- Table structure for service_appointment
    -- ----------------------------
    DROP TABLE IF EXISTS `service_appointment`;
    CREATE TABLE `service_appointment`  (
      `contact_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
      `id` bigint NOT NULL AUTO_INCREMENT COMMENT '预约ID',
      `user_id` bigint NOT NULL COMMENT '用户ID',
      `service_id` bigint NOT NULL COMMENT '服务ID',
      `appointment_time` datetime NOT NULL COMMENT '预约时间',
      `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态(已预约/已确认/已完成/已取消)',
      `pet_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '宠物名称',
      `requirements` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '特殊要求',
      `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
      `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
      PRIMARY KEY (`id`) USING BTREE,
      INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
      INDEX `idx_service_id`(`service_id` ASC) USING BTREE
    ) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '服务预约表' ROW_FORMAT = Dynamic;

    -- ----------------------------
    -- Records of service_appointment
    -- ----------------------------
    INSERT INTO `service_appointment` VALUES ('13800138001', 1, 2, 1, '2025-05-22 11:00:00', '已取消', '小白', '', '2025-05-15 02:23:08', '2025-05-15 02:23:08');
    INSERT INTO `service_appointment` VALUES ('13800138001', 2, 2, 1, '2025-05-22 11:00:00', '已完成', '小白', '', '2025-05-15 02:23:42', '2025-05-15 02:23:42');
    INSERT INTO `service_appointment` VALUES ('13800138001', 3, 2, 1, '2025-05-22 11:00:00', '已取消', '小麦', '', '2025-05-17 01:06:46', '2025-05-17 01:06:46');
    INSERT INTO `service_appointment` VALUES ('13800138001', 4, 2, 1, '2025-05-22 14:00:00', '已预约', '旺财', '', '2025-05-17 14:23:25', '2025-05-17 14:23:25');
    INSERT INTO `service_appointment` VALUES ('13800138001', 5, 2, 2, '2025-05-21 01:00:00', '已预约', '小黑', '', '2025-05-17 17:59:32', '2025-05-17 17:59:32');

    -- ----------------------------
    -- Table structure for service_category
    -- ----------------------------
    DROP TABLE IF EXISTS `service_category`;
    CREATE TABLE `service_category`  (
      `id` bigint NOT NULL AUTO_INCREMENT COMMENT '分类ID',
      `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类名称',
      `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分类描述',
      `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分类图标',
      `sort` int NULL DEFAULT 0 COMMENT '排序',
      `status` tinyint NULL DEFAULT 1 COMMENT '状态(0:禁用,1:正常)',
      `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
      `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
      PRIMARY KEY (`id`) USING BTREE
    ) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '服务分类表' ROW_FORMAT = Dynamic;

    -- ----------------------------
    -- Records of service_category
    -- ----------------------------
    INSERT INTO `service_category` VALUES (1, '美容服务', '提供专业的宠物美容服务', 'beauty', 1, 1, '2025-05-13 22:32:13', '2025-05-13 22:32:13');
    INSERT INTO `service_category` VALUES (2, '洗浴服务', '提供专业的宠物洗浴服务', 'shower', 2, 1, '2025-05-13 22:32:13', '2025-05-15 02:54:11');
    INSERT INTO `service_category` VALUES (3, '体检服务', '提供全面的宠物健康体检', 'stethoscope', 3, 0, '2025-05-13 22:32:13', '2025-05-13 22:32:13');
    INSERT INTO `service_category` VALUES (4, '寄养服务', '提供舒适的宠物寄养环境', 'home', 4, 1, '2025-05-13 22:32:13', '2025-05-13 22:32:13');

    -- ----------------------------
    -- Table structure for shipping
    -- ----------------------------
    DROP TABLE IF EXISTS `shipping`;
    CREATE TABLE `shipping`  (
      `id` bigint NOT NULL AUTO_INCREMENT COMMENT '发货ID',
      `order_id` bigint NOT NULL COMMENT '订单ID',
      `order_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单编号',
      `shipping_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '发货单号',
      `delivery_company` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '快递公司',
      `tracking_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '快递单号',
      `delivery_time` datetime NULL DEFAULT NULL COMMENT '发货时间',
      `receipt_time` datetime NULL DEFAULT NULL COMMENT '收货时间',
      `shipping_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '配送状态(待发货/已发货/已签收/已退回)',
      `operator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '操作人',
      `notes` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
      `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
      `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
      PRIMARY KEY (`id`) USING BTREE,
      UNIQUE INDEX `uk_shipping_no`(`shipping_no` ASC) USING BTREE,
      INDEX `idx_order_id`(`order_id` ASC) USING BTREE,
      INDEX `idx_order_no`(`order_no` ASC) USING BTREE,
      INDEX `idx_tracking_no`(`tracking_no` ASC) USING BTREE
    ) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '发货信息表' ROW_FORMAT = Dynamic;

    -- ----------------------------
    -- Records of shipping
    -- ----------------------------
    INSERT INTO `shipping` VALUES (1, 1, '202505141731535bfb', 'S1747217492424a5dd', '顺丰速运', 'SF15681561651', '2025-05-14 18:11:32', '2025-05-14 22:09:51', '已签收', NULL, '', '2025-05-14 18:11:32', '2025-05-14 22:09:51');
    INSERT INTO `shipping` VALUES (2, 2, '202505142218286a08', 'S1747232349134c75d', '圆通速递', 'YT4567892222', '2025-05-14 22:19:09', NULL, '已退回', 'admin', '', '2025-05-14 22:19:09', '2025-05-15 01:54:38');
    INSERT INTO `shipping` VALUES (3, 5, '202505150153540ef5', 'S1747245266902d8a6', '韵达快递', 'YD34R567890P', '2025-05-15 01:54:27', '2025-05-15 01:56:04', '已签收', NULL, '', '2025-05-15 01:54:27', '2025-05-15 01:56:04');

    -- ----------------------------
    -- Table structure for sys_announcement
    -- ----------------------------
    DROP TABLE IF EXISTS `sys_announcement`;
    CREATE TABLE `sys_announcement`  (
      `id` bigint NOT NULL AUTO_INCREMENT COMMENT '公告ID',
      `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公告标题',
      `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '公告内容',
      `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '公告类型',
      `status` tinyint NULL DEFAULT 1 COMMENT '状态(0:禁用,1:正常)',
      `created_by` bigint NULL DEFAULT NULL COMMENT '创建人ID',
      `created_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
      `updated_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
      PRIMARY KEY (`id`) USING BTREE,
      INDEX `idx_created_time`(`created_time` ASC) USING BTREE
    ) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '系统公告表' ROW_FORMAT = Dynamic;

    -- ----------------------------
    -- Records of sys_announcement
    -- ----------------------------
    INSERT INTO `sys_announcement` VALUES (1, '系统维护通知', '尊敬的用户，本系统将于2025年3月1日凌晨2:00-4:00进行例行维护，届时系统将暂停服务。给您带来的不便，敬请谅解。', 'NOTICE', 1, 1, '2025-05-13 22:32:13', '2025-05-18 09:06:28');
    INSERT INTO `sys_announcement` VALUES (2, '宠物领养活动', '本月底将举行大型宠物领养活动，欢迎各位爱心人士参加，给流浪宠物一个温暖的家。活动时间：2025年3月15日 10:00-17:00，活动地点：市中心广场。', 'ACTIVITY', 1, 1, '2025-05-13 22:32:13', '2025-05-18 09:06:42');
    INSERT INTO `sys_announcement` VALUES (3, '新增宠物训练课程', '宠物之家新增多门宠物训练课程，包括幼犬基础训练、成犬进阶训练、问题行为纠正等。现在报名可享受8折优惠！', 'OTHER', 1, 1, '2025-05-13 22:32:13', '2025-05-18 09:06:51');

    -- ----------------------------
    -- Table structure for sys_menu
    -- ----------------------------
    DROP TABLE IF EXISTS `sys_menu`;
    CREATE TABLE `sys_menu`  (
      `id` int NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
      `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '菜单名称',
      `path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '菜单路径',
      `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '组件路径',
      `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '菜单图标',
      `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
      `pid` int NULL DEFAULT NULL COMMENT '父菜单ID',
      `sort_num` int NULL DEFAULT 1 COMMENT '排序号',
      `hidden` tinyint NULL DEFAULT 0 COMMENT '是否隐藏',
      `created_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
      `updated_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
      PRIMARY KEY (`id`) USING BTREE,
      INDEX `idx_pid`(`pid` ASC) USING BTREE
    ) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '系统菜单表' ROW_FORMAT = Dynamic;

    -- ----------------------------
    -- Records of sys_menu
    -- ----------------------------
    INSERT INTO `sys_menu` VALUES (1, '首页', '/dashboard', 'Dashboard', 'house', '系统首页', NULL, 1, 0, '2025-05-13 22:32:13', '2025-05-13 22:32:13');
    INSERT INTO `sys_menu` VALUES (2, '用户管理', '/user', '', 'user', '用户信息管理', NULL, 2, 0, '2025-05-13 22:32:13', '2025-05-14 13:05:55');
    INSERT INTO `sys_menu` VALUES (3, '宠物管理', '/pet', '', 'Opportunity', '宠物信息管理', NULL, 3, 0, '2025-05-13 22:32:13', '2025-05-17 18:27:19');
    INSERT INTO `sys_menu` VALUES (4, '订单管理', '/order', '', 'shopping-cart', '订单管理', NULL, 4, 0, '2025-05-13 22:32:13', '2025-05-14 12:38:05');
    INSERT INTO `sys_menu` VALUES (5, '服务管理', '/service', '', 'service', '服务管理', NULL, 5, 0, '2025-05-13 22:32:13', '2025-05-14 12:38:04');
    INSERT INTO `sys_menu` VALUES (7, '内容管理', '/content', '', 'SetUp', '内容管理', NULL, 7, 0, '2025-05-13 22:32:13', '2025-05-17 18:27:48');
    INSERT INTO `sys_menu` VALUES (8, '系统管理', '/system', '', 'setting', '系统管理', NULL, 8, 0, '2025-05-13 22:32:13', '2025-05-14 13:07:00');
    INSERT INTO `sys_menu` VALUES (9, '用户列表', '/user/list', 'user/UserList', 'list', '用户信息列表', 2, 1, 0, '2025-05-13 22:32:13', '2025-05-13 22:32:13');
    INSERT INTO `sys_menu` VALUES (10, '角色管理', '/user/role', 'user/RoleList', 'UserFilled', '角色管理', 2, 2, 0, '2025-05-13 22:32:13', '2025-05-17 18:27:26');
    INSERT INTO `sys_menu` VALUES (11, '宠物列表', '/pet/list', 'pet/PetManage', 'list', '宠物信息列表', 3, 1, 0, '2025-05-13 22:32:13', '2025-05-14 13:15:37');
    INSERT INTO `sys_menu` VALUES (12, '领养申请', '/pet/adoption', 'pet/AdoptionManage', 'CopyDocument', '领养申请管理', 3, 2, 0, '2025-05-13 22:32:13', '2025-05-17 18:26:52');
    INSERT INTO `sys_menu` VALUES (13, '寄养管理', '/pet/boarding', 'pet/BoardingManage', 'Coffee', '寄养信息管理', 3, 3, 0, '2025-05-13 22:32:13', '2025-05-17 18:26:47');
    INSERT INTO `sys_menu` VALUES (14, '订单列表', '/order/list', 'order/OrderManage', 'list', '订单列表', 4, 1, 0, '2025-05-13 22:32:13', '2025-05-14 17:38:25');
    INSERT INTO `sys_menu` VALUES (15, '发货管理', '/order/shipping', 'order/ShippingManage', 'Van', '发货管理', 4, 2, 0, '2025-05-13 22:32:13', '2025-05-17 18:27:34');
    INSERT INTO `sys_menu` VALUES (16, '服务列表', '/service/list', 'service/ServiceManagement', 'list', '服务列表', 5, 1, 0, '2025-05-13 22:32:13', '2025-05-15 02:25:51');
    INSERT INTO `sys_menu` VALUES (17, '服务分类', '/service/category', 'service/ServiceCategoryManagement', 'Box', '服务分类管理', 5, 2, 0, '2025-05-13 22:32:13', '2025-05-17 18:26:41');
    INSERT INTO `sys_menu` VALUES (18, '服务预约', '/service/appointment', 'service/AppointmentManagement', 'calendar', '服务预约管理', 5, 3, 0, '2025-05-13 22:32:13', '2025-05-15 09:59:45');
    INSERT INTO `sys_menu` VALUES (19, '训练课程', '/service/training', 'training/TrainingCourseManagement', 'trophy', '训练课程管理', 5, 4, 0, '2025-05-13 22:32:13', '2025-05-15 09:59:03');
    INSERT INTO `sys_menu` VALUES (20, '训练预约', '/service/training-appointment', 'training/TrainingAppointmentManagement', 'calendar', '训练预约管理', 5, 5, 0, '2025-05-13 22:32:13', '2025-05-15 09:59:36');
    INSERT INTO `sys_menu` VALUES (24, '轮播图管理', '/content/banner', 'banner/BannerManagement', 'picture', '轮播图管理', 7, 2, 0, '2025-05-13 22:32:13', '2025-05-16 22:56:57');
    INSERT INTO `sys_menu` VALUES (25, '公告管理', '/content/announcement', 'announcement/AnnouncementManagement', 'notification', '公告管理', 7, 3, 0, '2025-05-13 22:32:13', '2025-05-18 09:03:44');
    INSERT INTO `sys_menu` VALUES (26, '菜单管理', '/system/menu', 'system/MenuList', 'menu', '菜单管理', 8, 1, 0, '2025-05-13 22:32:13', '2025-05-13 22:32:13');
    INSERT INTO `sys_menu` VALUES (28, '宠物用品', '/product', '', 'Goods', '', NULL, 1, 0, '2025-05-14 17:37:14', '2025-05-14 17:37:14');
    INSERT INTO `sys_menu` VALUES (29, '宠物用品管理', '/productManage', 'product/ProductManage', 'GoodsFilled', '', 28, 1, 0, '2025-05-14 17:37:42', '2025-05-14 17:40:39');
    INSERT INTO `sys_menu` VALUES (30, '训练分类', '/service/training-category', 'training/TrainingCategoryManagement', 'Aim', '', 5, 1, 0, '2025-05-15 10:08:46', '2025-05-15 10:08:46');
    INSERT INTO `sys_menu` VALUES (31, '宠物分类', '/pet/petCategoryManage', 'pet/PetCategoryManage', 'CopyDocument', '', 3, 1, 0, '2025-05-16 15:46:59', '2025-05-16 15:46:59');
    INSERT INTO `sys_menu` VALUES (33, '个人中心', '/user/person', 'user/PersonInfo', 'User', '', NULL, 2, 0, '2025-05-17 18:30:33', '2025-05-17 18:30:33');

    -- ----------------------------
    -- Table structure for sys_role
    -- ----------------------------
    DROP TABLE IF EXISTS `sys_role`;
    CREATE TABLE `sys_role`  (
      `id` int NOT NULL AUTO_INCREMENT COMMENT '角色ID',
      `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色编码',
      `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色名称',
      `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
      `created_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
      `updated_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
      PRIMARY KEY (`id`) USING BTREE,
      UNIQUE INDEX `uk_code`(`code` ASC) USING BTREE
    ) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '系统角色表' ROW_FORMAT = Dynamic;

    -- ----------------------------
    -- Records of sys_role
    -- ----------------------------
    INSERT INTO `sys_role` VALUES (1, 'ADMIN', '系统管理员', '系统管理员，拥有所有权限', '2025-05-13 22:32:13', '2025-05-17 18:30:49');
    INSERT INTO `sys_role` VALUES (2, 'USER', '普通用户', '普通用户，具有基本操作权限', '2025-05-13 22:32:13', '2025-05-13 22:32:13');
    INSERT INTO `sys_role` VALUES (3, 'GUEST', '游客', '游客角色，只有浏览权限', '2025-05-13 22:32:13', '2025-05-13 22:32:13');

    -- ----------------------------
    -- Table structure for sys_role_menu
    -- ----------------------------
    DROP TABLE IF EXISTS `sys_role_menu`;
    CREATE TABLE `sys_role_menu`  (
      `role_id` int NOT NULL COMMENT '角色ID',
      `menu_id` int NOT NULL COMMENT '菜单ID',
      `created_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
      PRIMARY KEY (`role_id`, `menu_id`) USING BTREE,
      INDEX `idx_menu_id`(`menu_id` ASC) USING BTREE,
      CONSTRAINT `fk_rm_menu_id` FOREIGN KEY (`menu_id`) REFERENCES `sys_menu` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
      CONSTRAINT `fk_rm_role_id` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
    ) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色菜单关联表' ROW_FORMAT = Dynamic;

    -- ----------------------------
    -- Records of sys_role_menu
    -- ----------------------------
    INSERT INTO `sys_role_menu` VALUES (1, 1, '2025-05-17 18:30:49');
    INSERT INTO `sys_role_menu` VALUES (1, 2, '2025-05-17 18:30:49');
    INSERT INTO `sys_role_menu` VALUES (1, 3, '2025-05-17 18:30:49');
    INSERT INTO `sys_role_menu` VALUES (1, 4, '2025-05-17 18:30:49');
    INSERT INTO `sys_role_menu` VALUES (1, 5, '2025-05-17 18:30:49');
    INSERT INTO `sys_role_menu` VALUES (1, 7, '2025-05-17 18:30:49');
    INSERT INTO `sys_role_menu` VALUES (1, 8, '2025-05-17 18:30:49');
    INSERT INTO `sys_role_menu` VALUES (1, 9, '2025-05-17 18:30:49');
    INSERT INTO `sys_role_menu` VALUES (1, 10, '2025-05-17 18:30:49');
    INSERT INTO `sys_role_menu` VALUES (1, 11, '2025-05-17 18:30:49');
    INSERT INTO `sys_role_menu` VALUES (1, 12, '2025-05-17 18:30:49');
    INSERT INTO `sys_role_menu` VALUES (1, 13, '2025-05-17 18:30:49');
    INSERT INTO `sys_role_menu` VALUES (1, 14, '2025-05-17 18:30:49');
    INSERT INTO `sys_role_menu` VALUES (1, 15, '2025-05-17 18:30:49');
    INSERT INTO `sys_role_menu` VALUES (1, 16, '2025-05-17 18:30:49');
    INSERT INTO `sys_role_menu` VALUES (1, 17, '2025-05-17 18:30:49');
    INSERT INTO `sys_role_menu` VALUES (1, 18, '2025-05-17 18:30:49');
    INSERT INTO `sys_role_menu` VALUES (1, 19, '2025-05-17 18:30:49');
    INSERT INTO `sys_role_menu` VALUES (1, 20, '2025-05-17 18:30:49');
    INSERT INTO `sys_role_menu` VALUES (1, 24, '2025-05-17 18:30:49');
    INSERT INTO `sys_role_menu` VALUES (1, 25, '2025-05-17 18:30:49');
    INSERT INTO `sys_role_menu` VALUES (1, 26, '2025-05-17 18:30:49');
    INSERT INTO `sys_role_menu` VALUES (1, 28, '2025-05-17 18:30:49');
    INSERT INTO `sys_role_menu` VALUES (1, 29, '2025-05-17 18:30:49');
    INSERT INTO `sys_role_menu` VALUES (1, 30, '2025-05-17 18:30:49');
    INSERT INTO `sys_role_menu` VALUES (1, 31, '2025-05-17 18:30:49');
    INSERT INTO `sys_role_menu` VALUES (1, 33, '2025-05-17 18:30:49');
    INSERT INTO `sys_role_menu` VALUES (2, 1, '2025-05-13 22:32:13');
    INSERT INTO `sys_role_menu` VALUES (2, 9, '2025-05-13 22:32:13');
    INSERT INTO `sys_role_menu` VALUES (2, 11, '2025-05-13 22:32:13');
    INSERT INTO `sys_role_menu` VALUES (2, 14, '2025-05-13 22:32:13');
    INSERT INTO `sys_role_menu` VALUES (2, 16, '2025-05-13 22:32:13');

    -- ----------------------------
    -- Table structure for training_appointment
    -- ----------------------------
    DROP TABLE IF EXISTS `training_appointment`;
    CREATE TABLE `training_appointment`  (
      `contact_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系方式',
      `id` bigint NOT NULL AUTO_INCREMENT COMMENT '预约ID',
      `user_id` bigint NOT NULL COMMENT '用户ID',
      `course_id` bigint NOT NULL COMMENT '课程ID',
      `pet_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '宠物名称',
      `appointment_time` datetime NOT NULL COMMENT '预约时间',
      `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态(已预约/已确认/已完成/已取消)',
      `requirements` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '特殊要求',
      `progress` int NULL DEFAULT 0 COMMENT '进度(0-100)',
      `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
      `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
      `rating` int NULL DEFAULT NULL COMMENT '满意度评分',
      `feedback` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '反馈内容',
      `feedback_time` datetime NULL DEFAULT NULL COMMENT '反馈时间',
      PRIMARY KEY (`id`) USING BTREE,
      INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
      INDEX `idx_course_id`(`course_id` ASC) USING BTREE
    ) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '训练预约表' ROW_FORMAT = Dynamic;

    -- ----------------------------
    -- Records of training_appointment
    -- ----------------------------
    INSERT INTO `training_appointment` VALUES ('13800138001', 1, 2, 5, '阿财', '2025-05-21 01:00:00', '已完成', '', 80, '2025-05-15 09:53:33', '2025-05-15 13:56:29', NULL, NULL, NULL);
    INSERT INTO `training_appointment` VALUES ('13800138001', 2, 2, 2, '阿旺', '2025-05-27 02:00:00', '已完成', '', 100, '2025-05-15 13:33:22', '2025-05-15 13:52:54', 5, '不错哎', '2025-05-15 13:52:54');
    INSERT INTO `training_appointment` VALUES ('13800138001', 3, 2, 6, '小黑', '2025-05-21 02:00:00', '已预约', '', 0, '2025-05-17 15:01:27', '2025-05-17 15:01:26', NULL, NULL, NULL);

    -- ----------------------------
    -- Table structure for training_category
    -- ----------------------------
    DROP TABLE IF EXISTS `training_category`;
    CREATE TABLE `training_category`  (
      `id` bigint NOT NULL AUTO_INCREMENT COMMENT '分类ID',
      `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类名称',
      `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分类描述',
      `sort_order` int NULL DEFAULT 0 COMMENT '排序顺序',
      `status` tinyint(1) NULL DEFAULT 1 COMMENT '状态(0:禁用,1:启用)',
      `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分类图标',
      `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
      `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
      PRIMARY KEY (`id`) USING BTREE,
      UNIQUE INDEX `idx_name`(`name` ASC) USING BTREE
    ) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '训练课程分类' ROW_FORMAT = Dynamic;

    -- ----------------------------
    -- Records of training_category
    -- ----------------------------
    INSERT INTO `training_category` VALUES (1, '基础训练', '适合所有宠物的基础行为训练', 1, 0, 'PriceTag', '2025-05-15 02:11:05', '2025-05-18 08:23:44');
    INSERT INTO `training_category` VALUES (2, '技能训练', '特定技能和指令训练', 2, 1, 'Medal', '2025-05-15 10:04:06', NULL);
    INSERT INTO `training_category` VALUES (3, '问题行为纠正', '解决宠物常见问题行为', 3, 1, 'Warning', '2025-05-15 10:04:06', NULL);
    INSERT INTO `training_category` VALUES (4, '幼犬训练', '专为幼犬设计的早期训练课程', 4, 1, 'Position', '2025-05-15 10:04:06', NULL);
    INSERT INTO `training_category` VALUES (5, '展示训练', '针对宠物展示和比赛的专业训练', 5, 1, 'Trophy', '2025-05-15 10:04:06', NULL);

    -- ----------------------------
    -- Table structure for training_course
    -- ----------------------------
    DROP TABLE IF EXISTS `training_course`;
    CREATE TABLE `training_course`  (
      `id` bigint NOT NULL AUTO_INCREMENT COMMENT '课程ID',
      `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程名称',
      `category_id` bigint NULL DEFAULT NULL COMMENT '分类ID',
      `price` decimal(10, 2) NOT NULL COMMENT '价格',
      `duration` int NULL DEFAULT NULL COMMENT '时长(分钟)',
      `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '描述',
      `max_participants` int NULL DEFAULT NULL COMMENT '最大参与人数',
      `status` tinyint NULL DEFAULT 1 COMMENT '状态(0:停用,1:启用)',
      `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
      `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
      PRIMARY KEY (`id`) USING BTREE,
      INDEX `fk_training_course_category`(`category_id` ASC) USING BTREE,
      CONSTRAINT `fk_training_course_category` FOREIGN KEY (`category_id`) REFERENCES `training_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
    ) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '训练课程表' ROW_FORMAT = Dynamic;

    -- ----------------------------
    -- Records of training_course
    -- ----------------------------
    INSERT INTO `training_course` VALUES (1, '幼犬基础训练', 1, 399.00, 60, '针对3-6个月大的幼犬，教授基本的服从命令，如\"坐下\"、\"趴下\"、\"停留\"等。', 5, 1, '2025-05-13 22:32:13', '2025-05-15 10:04:12');
    INSERT INTO `training_course` VALUES (2, '成犬进阶训练', 2, 599.00, 90, '针对已掌握基础命令的成犬，教授更复杂的技能，如\"拿取物品\"、\"跟随行走\"等。', 4, 1, '2025-05-13 22:32:13', '2025-05-15 10:19:37');
    INSERT INTO `training_course` VALUES (3, '问题行为纠正', 3, 799.00, 120, '针对有咬人、吠叫、破坏等问题行为的犬只，进行专业的行为矫正训练。', 3, 1, '2025-05-13 22:32:13', '2025-05-15 10:19:41');
    INSERT INTO `training_course` VALUES (4, '猫咪互动游戏', 1, 299.00, 60, '教授如何与猫咪进行互动游戏，增强猫咪的活跃度和社交能力。', 5, 0, '2025-05-13 22:32:13', '2025-05-18 08:25:59');
    INSERT INTO `training_course` VALUES (5, '家庭护卫犬训练', 1, 899.00, 135, '针对中大型犬种的护卫训练，教授基本的护卫技能，如警戒、守卫和有限度的防卫行为，同时保持对主人的绝对服从。', 3, 1, '2025-05-13 22:32:30', '2025-05-15 13:29:10');
    INSERT INTO `training_course` VALUES (6, '犬类敏捷训练', 2, 499.00, 90, '针对精力充沛的中小型犬，设置障碍跑、跳跃、穿越等趣味性训练项目，提高犬只的灵活性、协调性和反应能力。', 6, 1, '2025-05-13 22:32:30', '2025-05-15 10:15:02');
    INSERT INTO `training_course` VALUES (7, '宠物礼仪训练', 1, 349.00, 60, '适合所有犬种，教授如何在公共场合保持良好行为，包括不乱叫、不随地便溺、见到陌生人和其他宠物时的得体表现等。', 8, 1, '2025-05-13 22:32:30', '2025-05-15 10:04:12');
    INSERT INTO `training_course` VALUES (8, '搜寻犬训练', 2, 999.00, 150, '针对嗅觉敏锐的犬种如猎犬、牧羊犬等，训练其通过气味寻找特定物品或人员的能力，培养专注力和执行力。', 4, 1, '2025-05-13 22:32:30', '2025-05-15 10:18:00');
    INSERT INTO `training_course` VALUES (9, '服务犬基础训练', 2, 1299.00, 180, '为有潜力成为服务犬的犬只提供的基础训练，包括基本服从训练、任务导向训练和公共场合行为训练，为后续专业服务犬训练打基础。', 3, 1, '2025-05-13 22:32:30', '2025-05-15 10:19:29');

    -- ----------------------------
    -- Table structure for user
    -- ----------------------------
    DROP TABLE IF EXISTS `user`;
    CREATE TABLE `user`  (
      `id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
      `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
      `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码(加密存储)',
      `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '邮箱',
      `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号',
      `role_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '角色code',
      `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '姓名',
      `avatar` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像',
      `status` tinyint NULL DEFAULT 1 COMMENT '状态(0:禁用,1:正常)',
      `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
      `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
      `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '性别',
      PRIMARY KEY (`id`, `sex`) USING BTREE,
      UNIQUE INDEX `uk_username`(`username` ASC) USING BTREE,
      UNIQUE INDEX `uk_email`(`email` ASC) USING BTREE,
      INDEX `idx_role_code`(`role_code` ASC) USING BTREE
    ) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

    -- ----------------------------
    -- Records of user
    -- ----------------------------
    INSERT INTO `user` VALUES (1, 'admin', '$2a$10$a4AH4Jap15ZuYGsJVA4Y3Od.84ZNoAF1tTfZ9Koxx5sRNmb/aHHzG', 'admin@example.com', '13800138000', 'ADMIN', '系统管理员', '/img/1747477883790.jpg', 1, '2025-05-13 22:32:13', '2025-05-17 18:31:25', '男');
    INSERT INTO `user` VALUES (2, 'user', '$2a$10$a4AH4Jap15ZuYGsJVA4Y3Od.84ZNoAF1tTfZ9Koxx5sRNmb/aHHzG', 'user1@example.com', '13800138001', 'USER', '张三', '/img/1747214735538.jpg', 1, '2025-05-13 22:32:13', '2025-05-18 09:30:30', '男');
    INSERT INTO `user` VALUES (3, 'user2', '$2a$10$a4AH4Jap15ZuYGsJVA4Y3Od.84ZNoAF1tTfZ9Koxx5sRNmb/aHHzG', 'user2@example.com', '13800138002', 'USER', '李四', NULL, 1, '2025-05-13 22:32:13', '2025-05-13 22:32:13', '');

    SET FOREIGN_KEY_CHECKS = 1;
