package com.ecommerce.entity;

import java.time.LocalDateTime;

public class Orders {
    private String ordersCode;
    private int purchaseQuantity;
    private LocalDateTime ordersDatetime;
    private String customerId;
    private String productCode;

    public String getOrdersCode() {
        return ordersCode;
    }

    public int getPurchaseQuantity() {
        return purchaseQuantity;
    }

    public LocalDateTime getOrdersDatetime() {
        return ordersDatetime;
    }

    public String getCustomerId() {
        return customerId;
    }

    public String getProductCode() {
        return productCode;
    }
}
