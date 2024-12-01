package com.ecommerce.entity;

import java.time.LocalDate;

public class Cart {
    private String ordersCode;
    private String customerId;
    private String productCode;
    private String productName;
    private long productPrice;
    private int purchaseQuantity;
    private long productAmountPrice;
    private LocalDate ordersDatetime;

    public Cart(String customerId, String productCode) {
        this.customerId = customerId;
        this.productCode = productCode;
    }

    public Cart(String ordersCode, String customerId, String productCode) {
        this.ordersCode = ordersCode;
        this.customerId = customerId;
        this.productCode = productCode;
    }

    public Cart(String ordersCode, String customerId, String productCode, int purchaseQuantity) {
        this.ordersCode = ordersCode;
        this.customerId = customerId;
        this.productCode = productCode;
        this.purchaseQuantity = purchaseQuantity;
    }

    public Cart(String ordersCode, String customerId, String productCode, String productName, long productPrice, int purchaseQuantity, LocalDate ordersDatetime) {
        this.ordersCode = ordersCode;
        this.customerId = customerId;
        this.productCode = productCode;
        this.productName = productName;
        this.productPrice = productPrice;
        this.purchaseQuantity = purchaseQuantity;
        this.ordersDatetime = ordersDatetime;
    }

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

    public long getProductAmountPrice() {
        return productPrice * purchaseQuantity;
    }

    public LocalDate getOrdersDatetime() {
        return ordersDatetime;
    }
}
