package com.ecommerce.entity;

import java.time.LocalDate;

public class Cart {
    private String ordersCode;
    private String customerId;
    private String productCode;
    private String productName;
    private long productPrice;
    private int purchaseQuantity;
    private long orderAmountPrice;
    private LocalDate ordersDatetime;

    public String getOrdersCode() {
        return ordersCode;
    }

    public String getCustomerId() {
        return customerId;
    }

    public String getProductCode() {
        return productCode;
    }

    public String getProductName() {
        return productName;
    }

    public long getProductPrice() {
        return productPrice;
    }

    public int getPurchaseQuantity() {
        return purchaseQuantity;
    }

    public long getOrderAmountPrice() {
        return productPrice * purchaseQuantity;
    }

    public LocalDate getOrdersDatetime() {
        return ordersDatetime;
    }
}
