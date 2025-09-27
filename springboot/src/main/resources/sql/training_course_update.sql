-- 修改训练课程表，添加分类ID字段，并设置外键关联
ALTER TABLE `training_course` 
ADD COLUMN `category_id` bigint(20) DEFAULT NULL COMMENT '分类ID' AFTER `category`,
ADD CONSTRAINT `fk_training_course_category` FOREIGN KEY (`category_id`) REFERENCES `training_category` (`id`);

-- 更新现有数据的category_id字段
-- 注意：实际执行时需要根据已有数据的category字段内容来匹配相应的category_id
UPDATE `training_course` tc 
JOIN `training_category` tcat ON tc.category = tcat.name
SET tc.category_id = tcat.id; 