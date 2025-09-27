# 宠物之家系统设计文档

## 1. 系统概述
本系统是一个基于SpringBoot3和Vue3开发的宠物服务平台，主要提供宠物领养、寄养、用品购买、宠物服务、宠物训练、宠物百科等功能。

## 2. 用户角色划分

### 2.1 游客
- 浏览宠物信息
- 浏览商品信息
- 注册账号

### 2.2 普通用户
- 宠物领养申请
- 宠物寄养预约
- 购买宠物用品
- 预约宠物服务
- 订单管理
- 个人信息管理

### 2.3 管理员
- 用户管理
- 宠物信息管理
- 商品管理
- 订单管理
- 服务管理
- 系统维护

## 3. 功能模块设计

### 3.1 用户模块
- 登录注册
- 个人信息修改
- 密码修改
- 地址管理
- 角色权限管理

**相关数据表**：
- 用户表(user)
- 系统角色表(sys_role)
- 系统菜单表(sys_menu)
- 角色菜单关联表(sys_role_menu)

### 3.2 宠物领养模块
- 宠物信息展示
- 领养申请
- 领养进度查询
- 领养记录管理

**相关数据表**：
- 宠物信息表(pet)
- 领养申请表(adoption)

### 3.3 宠物寄养模块
- 寄养服务展示
- 寄养预约
- 寄养状态查询
- 寄养记录管理

**相关数据表**：
- 寄养信息表(boarding)

### 3.4 宠物用品模块
- 商品分类展示
- 商品搜索
- 购物车
- 订单管理
- 支付功能

**相关数据表**：
- 商品表(product)
- 订单表(order)
- 发货信息表(shipping)

### 3.5 宠物服务模块
- 服务类型展示（美容、洗澡、体检等）
- 服务预约
- 服务评价
- 服务记录管理

**相关数据表**：
- 服务表(service)
- 服务分类表(service_category)
- 服务预约表(service_appointment)

### 3.6 宠物训练模块
- 训练课程展示
- 训练课程预约
- 训练进度跟踪
- 训练成果展示
- 训练评价管理

**相关数据表**：
- 训练课程表(training_course)
- 训练预约表(training_appointment)

### 3.7 宠物百科模块
- 宠物品种介绍
- 养护知识
- 疾病预防
- 饮食指南
- 行为训练指南
- 用户问答互动

**相关数据表**：
- 宠物百科表(pet_encyclopedia)

### 3.8 首页轮播图模块
- 轮播图管理
- 活动展示
- 热门信息推送

**相关数据表**：
- 轮播图表(banner)
- 系统公告表(sys_announcement)

### 3.9 智能推荐模块
- 基于用户偏好的商品推荐
- 个性化宠物推荐
- 相关服务推荐

**相关数据表**：
- 用户表(user)
- 商品表(product)
- 订单表(order)
- 宠物信息表(pet)

### 3.10 系统管理模块
- 菜单管理
- 角色权限管理
- 系统日志查看
- 系统公告管理
- 系统监控
- 数据字典管理

**相关数据表**：
- 系统菜单表(sys_menu)
- 系统角色表(sys_role)
- 角色菜单关联表(sys_role_menu)
- 系统日志表(sys_log)
- 系统公告表(sys_announcement)

### 3.11 宠物健康记录模块
- 宠物体检记录
- 疫苗接种记录
- 病历管理
- 健康提醒
- 饮食建议
- 健康报告生成

**相关数据表**：
- 宠物健康记录表(pet_health_record)
- 疫苗接种记录表(pet_vaccination)
- 宠物信息表(pet)

## 4. 数据库设计

### 4.1 用户表(user)
```sql
CREATE TABLE `user` (
    `id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
    `username` varchar(50) NOT NULL COMMENT '用户名',
    `password` varchar(100) NOT NULL COMMENT '密码(加密存储)',
    `email` varchar(100) NOT NULL COMMENT '邮箱',
    `phone` varchar(20) DEFAULT NULL COMMENT '手机号',
    `role_code` varchar(50) DEFAULT NULL COMMENT '角色code',
    `name` varchar(50) DEFAULT NULL COMMENT '姓名',
    `avatar` varchar(200) DEFAULT NULL COMMENT '头像',
    `status` tinyint DEFAULT 1 COMMENT '状态(0:禁用,1:正常)',
    `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_username` (`username`),
    UNIQUE KEY `uk_email` (`email`),
    INDEX `idx_role_code` (`role_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户信息表';
```

### 4.2 宠物信息表(pet)
```sql
CREATE TABLE pet (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    type VARCHAR(50),
    breed VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    health_status VARCHAR(200),
    description TEXT,
    images VARCHAR(500),
    adoption_status VARCHAR(20),
    create_time DATETIME,
    update_time DATETIME
);
```

### 4.3 领养申请表(adoption)
```sql
CREATE TABLE adoption (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id BIGINT,
    pet_id BIGINT,
    status VARCHAR(20),
    apply_reason TEXT,
    contact_phone VARCHAR(20),
    address VARCHAR(200),
    create_time DATETIME,
    update_time DATETIME
);
```

### 4.4 寄养信息表(boarding)
```sql
CREATE TABLE boarding (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id BIGINT,
    pet_name VARCHAR(50),
    pet_type VARCHAR(50),
    start_time DATETIME,
    end_time DATETIME,
    status VARCHAR(20),
    requirements TEXT,
    price DECIMAL(10,2),
    create_time DATETIME,
    update_time DATETIME
);
```

### 4.5 商品表(product)
```sql
CREATE TABLE product (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock INT,
    description TEXT,
    images VARCHAR(500),
    status TINYINT DEFAULT 1,
    create_time DATETIME,
    update_time DATETIME
);
```

### 4.6 订单表(order)
```sql
CREATE TABLE `order` (
    `id` bigint NOT NULL AUTO_INCREMENT COMMENT '订单ID',
    `user_id` bigint NOT NULL COMMENT '用户ID',
    `order_no` varchar(50) NOT NULL COMMENT '订单编号',
    `product_id` bigint NOT NULL COMMENT '商品ID',
    `product_name` varchar(100) NOT NULL COMMENT '商品名称',
    `product_image` varchar(200) DEFAULT NULL COMMENT '商品图片',
    `quantity` int NOT NULL DEFAULT 1 COMMENT '商品数量',
    `price` decimal(10,2) NOT NULL COMMENT '商品单价',
    `total_amount` decimal(10,2) NOT NULL COMMENT '订单总金额',
    `payment_method` varchar(20) DEFAULT NULL COMMENT '支付方式',
    `payment_time` datetime DEFAULT NULL COMMENT '支付时间',
    `status` varchar(20) NOT NULL COMMENT '订单状态(待付款/待发货/待收货/已完成/已取消)',
    `address` varchar(200) NOT NULL COMMENT '收货地址',
    `contact_name` varchar(50) NOT NULL COMMENT '联系人',
    `contact_phone` varchar(20) NOT NULL COMMENT '联系电话',
    `remark` varchar(200) DEFAULT NULL COMMENT '订单备注',
    `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_order_no` (`order_no`),
    INDEX `idx_user_id` (`user_id`),
    INDEX `idx_product_id` (`product_id`),
    INDEX `idx_create_time` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='订单表';
```

### 4.7 发货信息表(shipping)
```sql
CREATE TABLE `shipping` (
    `id` bigint NOT NULL AUTO_INCREMENT COMMENT '发货ID',
    `order_id` bigint NOT NULL COMMENT '订单ID',
    `order_no` varchar(50) NOT NULL COMMENT '订单编号',
    `shipping_no` varchar(50) NOT NULL COMMENT '发货单号',
    `delivery_company` varchar(50) DEFAULT NULL COMMENT '快递公司',
    `tracking_no` varchar(50) DEFAULT NULL COMMENT '快递单号',
    `delivery_time` datetime DEFAULT NULL COMMENT '发货时间',
    `receipt_time` datetime DEFAULT NULL COMMENT '收货时间',
    `shipping_status` varchar(20) NOT NULL COMMENT '配送状态(待发货/已发货/已签收/已退回)',

    `operator` varchar(50) DEFAULT NULL COMMENT '操作人',
    `notes` varchar(200) DEFAULT NULL COMMENT '备注',
    `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_shipping_no` (`shipping_no`),
    INDEX `idx_order_id` (`order_id`),
    INDEX `idx_order_no` (`order_no`),
    INDEX `idx_tracking_no` (`tracking_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='发货信息表';
```

### 4.8 服务表(service)
```sql
CREATE TABLE service (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    category_id BIGINT,
    price DECIMAL(10,2),
    description TEXT,
    duration INT,
    status TINYINT DEFAULT 1,
    create_time DATETIME,
    update_time DATETIME
);
```

### 4.9 服务分类表(service_category)
```sql
CREATE TABLE `service_category` (
    `id` bigint NOT NULL AUTO_INCREMENT,
    `name` varchar(50) NOT NULL COMMENT '分类名称',
    `description` varchar(200) DEFAULT NULL COMMENT '分类描述',
    `icon` varchar(100) DEFAULT NULL COMMENT '分类图标',
    `sort` int DEFAULT 0 COMMENT '排序',
    `status` tinyint DEFAULT 1 COMMENT '状态(0:禁用,1:正常)',
    `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
    `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='服务分类表';
```

### 4.10 服务预约表(service_appointment)
```sql
CREATE TABLE service_appointment (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id BIGINT,
    service_id BIGINT,
    appointment_time DATETIME,
    status VARCHAR(20),
    pet_name VARCHAR(50),
    requirements TEXT,
    create_time DATETIME,
    update_time DATETIME
);
```

### 4.11 训练课程表(training_course)
```sql
CREATE TABLE training_course (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10,2),
    duration INT,
    description TEXT,
    max_participants INT,
    status TINYINT DEFAULT 1,
    create_time DATETIME,
    update_time DATETIME
);
```

### 4.12 训练预约表(training_appointment)
```sql
CREATE TABLE training_appointment (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id BIGINT,
    course_id BIGINT,
    pet_name VARCHAR(50),
    appointment_time DATETIME,
    status VARCHAR(20),
    requirements TEXT,
    progress INT DEFAULT 0,
    create_time DATETIME,
    update_time DATETIME
);
```

### 4.13 宠物百科表(pet_encyclopedia)
```sql
CREATE TABLE pet_encyclopedia (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(200) NOT NULL,
    category VARCHAR(50),
    content TEXT,
    author VARCHAR(50),
    views INT DEFAULT 0,
    likes INT DEFAULT 0,
    images VARCHAR(500),
    create_time DATETIME,
    update_time DATETIME
);
```

### 4.14 轮播图表(banner)
```sql
CREATE TABLE banner (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100),
    image_url VARCHAR(200) NOT NULL,
    link_url VARCHAR(200),
    sort INT DEFAULT 0,
    status TINYINT DEFAULT 1,
    create_time DATETIME,
    update_time DATETIME
);
```

### 4.15 宠物健康记录表(pet_health_record)
```sql
CREATE TABLE `pet_health_record` (
    `id` bigint NOT NULL AUTO_INCREMENT,
    `pet_id` bigint NOT NULL COMMENT '宠物ID',
    `user_id` bigint NOT NULL COMMENT '主人ID',
    `record_type` varchar(50) NOT NULL COMMENT '记录类型(体检/疫苗/就诊/手术)',
    `record_date` datetime NOT NULL COMMENT '记录日期',
    `hospital` varchar(100) DEFAULT NULL COMMENT '医院名称',
    `doctor` varchar(50) DEFAULT NULL COMMENT '医生姓名',
    
    /* 体检信息 */
    `weight` decimal(5,2) DEFAULT NULL COMMENT '体重(kg)',
    `temperature` decimal(3,1) DEFAULT NULL COMMENT '体温(℃)',
    `heart_rate` int DEFAULT NULL COMMENT '心率(次/分)',
    `blood_pressure` varchar(20) DEFAULT NULL COMMENT '血压',
    `respiratory_rate` int DEFAULT NULL COMMENT '呼吸频率(次/分)',
    
    /* 身体状况 */
    `skin_condition` varchar(200) DEFAULT NULL COMMENT '皮肤状况',
    `fur_condition` varchar(200) DEFAULT NULL COMMENT '毛发状况',
    `eye_condition` varchar(200) DEFAULT NULL COMMENT '眼部状况',
    `ear_condition` varchar(200) DEFAULT NULL COMMENT '耳部状况',
    `oral_condition` varchar(200) DEFAULT NULL COMMENT '口腔状况',
    `limb_condition` varchar(200) DEFAULT NULL COMMENT '四肢状况',
    
    /* 检查结果与建议 */
    `diagnosis_results` text COMMENT '诊断和检查结果',
    `health_suggestions` text COMMENT '健康建议(包括饮食和活动)',
    
    `notes` text COMMENT '备注',
    `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`),
    INDEX `idx_pet_id` (`pet_id`),
    INDEX `idx_user_id` (`user_id`),
    INDEX `idx_record_date` (`record_date`),
    INDEX `idx_record_type` (`record_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='宠物健康记录表';
```

### 4.16 疫苗接种记录表(pet_vaccination)
```sql
CREATE TABLE `pet_vaccination` (
    `id` bigint NOT NULL AUTO_INCREMENT,
    `pet_id` bigint NOT NULL COMMENT '宠物ID',
    `vaccine_name` varchar(100) NOT NULL COMMENT '疫苗名称',
    `vaccination_date` datetime NOT NULL COMMENT '接种日期',
    `next_date` datetime DEFAULT NULL COMMENT '下次接种日期',
    `hospital` varchar(100) DEFAULT NULL COMMENT '接种医院',
    `batch_number` varchar(50) DEFAULT NULL COMMENT '疫苗批号',
    `notes` text COMMENT '备注',
    `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
    `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    INDEX `idx_pet_id` (`pet_id`),
    INDEX `idx_vaccination_date` (`vaccination_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='疫苗接种记录表';
```

### 4.17 系统菜单表(sys_menu)
```sql
CREATE TABLE `sys_menu` (
    `id` int NOT NULL AUTO_INCREMENT,
    `name` varchar(50) NOT NULL COMMENT '菜单名称',
    `path` varchar(100) DEFAULT NULL COMMENT '菜单路径',
    `component` varchar(100) DEFAULT NULL COMMENT '组件路径',
    `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
    `description` varchar(200) DEFAULT NULL COMMENT '描述',
    `pid` int DEFAULT NULL COMMENT '父菜单ID',
    `sort_num` int DEFAULT 1 COMMENT '排序号',
    `hidden` tinyint DEFAULT 0 COMMENT '是否隐藏',
    `created_time` datetime DEFAULT CURRENT_TIMESTAMP,
    `updated_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    INDEX `idx_pid` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='系统菜单表';
```

### 4.18 系统角色表(sys_role)
```sql
CREATE TABLE `sys_role` (
    `id` int NOT NULL AUTO_INCREMENT,
    `code` varchar(50) NOT NULL COMMENT '角色编码',
    `name` varchar(50) NOT NULL COMMENT '角色名称',
    `description` varchar(200) DEFAULT NULL COMMENT '描述',
    `created_time` datetime DEFAULT CURRENT_TIMESTAMP,
    `updated_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='系统角色表';
```

### 4.19 角色菜单关联表(sys_role_menu)
```sql
CREATE TABLE `sys_role_menu` (
    `role_id` int NOT NULL,
    `menu_id` int NOT NULL,
    `created_time` datetime DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`role_id`, `menu_id`),
    INDEX `idx_menu_id` (`menu_id`),
    CONSTRAINT `fk_rm_menu_id` FOREIGN KEY (`menu_id`) REFERENCES `sys_menu` (`id`) ON DELETE CASCADE,
    CONSTRAINT `fk_rm_role_id` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='角色菜单关联表';
```

### 4.20 系统日志表(sys_log)
```sql
CREATE TABLE `sys_log` (
    `id` bigint NOT NULL AUTO_INCREMENT,
    `user_id` bigint DEFAULT NULL COMMENT '操作用户ID',
    `username` varchar(50) DEFAULT NULL COMMENT '操作用户名',
    `operation` varchar(50) DEFAULT NULL COMMENT '操作类型',
    `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
    `params` text COMMENT '请求参数',
    `ip` varchar(64) DEFAULT NULL COMMENT '操作IP',
    `created_time` datetime DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    INDEX `idx_user_id` (`user_id`),
    INDEX `idx_created_time` (`created_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='系统日志表';
```

### 4.21 系统公告表(sys_announcement)
```sql
CREATE TABLE `sys_announcement` (
    `id` bigint NOT NULL AUTO_INCREMENT,
    `title` varchar(100) NOT NULL COMMENT '公告标题',
    `content` text COMMENT '公告内容',
    `type` varchar(20) DEFAULT NULL COMMENT '公告类型',
    `status` tinyint DEFAULT 1 COMMENT '状态(0:禁用,1:正常)',
    `created_by` bigint DEFAULT NULL COMMENT '创建人ID',
    `created_time` datetime DEFAULT CURRENT_TIMESTAMP,
    `updated_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    INDEX `idx_created_time` (`created_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='系统公告表';
```

## 5. 技术栈

### 5.1 后端
- SpringBoot 3.x
- MySQL 8.x
- MyBatis-Plus
- Spring Security
- JWT
- Maven
- Apache Mahout (推荐系统)
- Redis (缓存)

### 5.2 前端
- Vue 3.x
- Element Plus
- Axios
- Vite
- Pinia
- Vue Router
- Swiper (轮播图)
- Markdown Editor (百科编辑)

## 6. 接口规范

所有接口统一返回格式：
```json
{
    "code": 200,
    "message": "success",
    "data": {}
}
```

状态码说明：
- 200: 成功
- 400: 请求参数错误
- 401: 未授权
- 403: 禁止访问
- 500: 服务器错误

## 7. 注意事项
1. 所有涉及金额的字段使用decimal类型
2. 密码需要加密存储
3. 文件上传需要做大小和类型限制
4. 接口需要做权限控制
5. 需要做参数校验
6. 关键操作需要做日志记录
7. 推荐算法需要定期更新
8. 百科内容需要审核机制
9. 轮播图需要做响应式适配
10. 用户行为数据需要脱敏处理

# 个人中心页面

## 功能概述
个人中心页面为用户提供了查看和管理个人信息的界面，主要包括以下功能：
1. 显示用户基本信息
2. 上传和更新用户头像
3. 修改用户基本信息
4. 修改用户密码

## 技术实现
- 使用Element Plus组件库构建用户界面
- 使用Vue 3 Composition API实现页面逻辑
- 使用Pinia进行状态管理
- 通过RESTful API与后端进行数据交互

## 页面结构
个人中心页面分为两个标签页：
1. **基本信息标签页**：显示用户头像和基本信息表单
2. **修改密码标签页**：提供修改密码的表单

### 基本信息标签页
- 头像上传与显示：使用Element Plus的Upload组件实现头像上传功能
- 用户信息表单：包含姓名、性别、邮箱、手机号等基本信息

### 修改密码标签页
- 旧密码输入框
- 新密码输入框
- 确认新密码输入框

## API接口
页面使用以下API接口与后端进行数据交互：

- **获取用户信息**：`/user/{id}`
- **更新用户信息**：`PUT /user/{id}`
- **上传用户头像**：`POST /file/upload/img`
- **修改用户密码**：`PUT /user/password/{id}`

## 头像上传与显示
头像上传功能使用后端提供的文件上传API，上传成功后返回的图片路径会自动添加API前缀（基于.env.development配置），确保头像能够正确显示。

### 上传流程
1. 用户选择图片文件
2. 前端进行文件类型和大小的验证
3. 调用后端文件上传接口
4. 上传成功后，更新用户信息中的头像路径
5. 刷新页面上的头像显示

## 路由配置
个人中心页面的路由配置如下：
```js
{
  path: 'profile',
  name: 'Profile',
  component: () => import('@/views/profile/index.vue'),
  meta: { title: '个人中心', requiresAuth: true }
}
```

`requiresAuth: true` 表示该页面需要用户登录后才能访问。

## 安全措施
1. 头像上传时加入了token验证，确保只有登录用户才能上传文件
2. 用户修改密码时，需要先验证旧密码
3. 密码修改成功后，会自动登出用户，要求重新登录 