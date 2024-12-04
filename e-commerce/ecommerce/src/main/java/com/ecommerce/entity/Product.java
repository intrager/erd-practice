package com.ecommerce.entity;

public class Product {
    private String productCode;
    private String productName;
    private int stockQuantity;
    private long productPrice;
    private String manufacturer;

    public String getProductCode() {
        return productCode;
    }

    public String getProductName() {
        return productName;
    }

    public int getStockQuantity() {
        return stockQuantity;
    }

    public long getProductPrice() {
        return productPrice;
    }

    public String getManufacturer() {
        return manufacturer;
    }
}
