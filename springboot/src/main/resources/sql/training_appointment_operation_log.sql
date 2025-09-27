-- 训练预约操作日志表
CREATE TABLE IF NOT EXISTS `training_appointment_operation_log` (
    `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志ID',
    `appointment_id` bigint(20) NOT NULL COMMENT '预约ID',
    `operator_id` bigint(20) NOT NULL COMMENT '操作人ID',
    `operator_name` varchar(50) DEFAULT NULL COMMENT '操作人姓名',
    `action` varchar(20) NOT NULL COMMENT '操作动作',
    `before_status` varchar(20) DEFAULT NULL COMMENT '操作前状态',
    `after_status` varchar(20) DEFAULT NULL COMMENT '操作后状态',
    `remark` varchar(255) DEFAULT NULL COMMENT '备注',
    `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    PRIMARY KEY (`id`),
    KEY `idx_appointment_id` (`appointment_id`),
    KEY `idx_operator_id` (`operator_id`),
    KEY `idx_create_time` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='训练预约操作日志'; 