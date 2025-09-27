package org.example.springboot.enumClass;

import lombok.Getter;

/**
 * 订单状态枚举类
 */
@Getter
public enum OrderStatusEnum {
    
    PENDING_PAYMENT("待付款"),
    PENDING_DELIVERY("待发货"),
    PENDING_RECEIPT("待收货"),
    COMPLETED("已完成"),
    CANCELLED("已取消");
    
    private final String value;
    
    OrderStatusEnum(String value) {
        this.value = value;
    }
} 