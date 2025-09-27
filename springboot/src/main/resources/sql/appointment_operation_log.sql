-- 预约操作日志表
CREATE TABLE `appointment_operation_log` (
    `id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志ID',
    `appointment_id` bigint NOT NULL COMMENT '预约ID',
    `operator_id` bigint DEFAULT NULL COMMENT '操作人ID',
    `operator_name` varchar(50) DEFAULT NULL COMMENT '操作人姓名',
    `action` varchar(50) NOT NULL COMMENT '操作动作',
    `before_status` varchar(20) DEFAULT NULL COMMENT '操作前状态',
    `after_status` varchar(20) DEFAULT NULL COMMENT '操作后状态',
    `remark` varchar(200) DEFAULT NULL COMMENT '备注',
    `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    PRIMARY KEY (`id`),
    INDEX `idx_appointment_id` (`appointment_id`),
    INDEX `idx_operator_id` (`operator_id`),
    INDEX `idx_create_time` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='预约操作日志表';