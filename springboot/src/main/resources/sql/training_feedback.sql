-- 添加训练预约反馈字段
ALTER TABLE training_appointment
ADD COLUMN rating INT COMMENT '满意度评分',
ADD COLUMN feedback TEXT COMMENT '反馈内容',
ADD COLUMN feedback_time DATETIME COMMENT '反馈时间'; 