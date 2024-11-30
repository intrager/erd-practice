package com.ecommerce.entity;

import java.time.LocalDate;

public class Orders {
    private String ordersCode;
    private int purchaseQuantity;
    private LocalDate ordersDatetime;
    private String customerId;
    private String productCode;

    public Orders(String ordersCode, String customerId, String productCode) {
        this.ordersCode = ordersCode;
        this.customerId = customerId;
        this.productCode = productCode;
    }

    public String getOrdersCode() {
        return ordersCode;
    }

    public int getPurchaseQuantity() {
        return purchaseQuantity;
    }

    public LocalDate getOrdersDatetime() {
        return ordersDatetime;
    }

    public String getCustomerId() {
        return customerId;
    }

    public String getProductCode() {
        return productCode;
    }
}
