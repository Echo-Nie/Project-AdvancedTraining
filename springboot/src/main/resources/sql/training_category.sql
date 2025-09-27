-- 训练分类表
CREATE TABLE IF NOT EXISTS `training_category` (
    `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '分类ID',
    `name` varchar(50) NOT NULL COMMENT '分类名称',
    `description` varchar(255) DEFAULT NULL COMMENT '分类描述',
    `sort_order` int(11) DEFAULT 0 COMMENT '排序顺序',
    `status` tinyint(1) DEFAULT 1 COMMENT '状态(0:禁用,1:启用)',
    `icon` varchar(100) DEFAULT NULL COMMENT '分类图标',
    `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='训练课程分类';

-- 初始数据
INSERT INTO `training_category` (`name`, `description`, `sort_order`, `status`, `icon`) VALUES 
('基础训练', '适合所有宠物的基础行为训练', 1, 1, 'PriceTag'),
('技能训练', '特定技能和指令训练', 2, 1, 'Medal'),
('问题行为纠正', '解决宠物常见问题行为', 3, 1, 'Warning'),
('幼犬训练', '专为幼犬设计的早期训练课程', 4, 1, 'Position'),
('展示训练', '针对宠物展示和比赛的专业训练', 5, 1, 'Trophy'); 