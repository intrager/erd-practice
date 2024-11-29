package com.ecommerce.entity;

import java.time.LocalDate;

public class Orders {
    private String ordersCode;
    private int purchaseQuantity;
    private LocalDate ordersDatetime;
    private Customer customerId;
    private Product productCode;

    public String getOrdersCode() {
        return ordersCode;
    }

    public int getPurchaseQuantity() {
        return purchaseQuantity;
    }

    public LocalDate getOrdersDatetime() {
        return ordersDatetime;
    }

    public Customer getCustomerId() {
        return customerId;
    }

    public Product getProductCode() {
        return productCode;
    }
}
