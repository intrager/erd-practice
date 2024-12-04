package com.ecommerce.entity;

import java.time.LocalDateTime;

public class Customer {
    private String customerId;
    private String customerName;
    private String password;
    private int age;
    private String job;
    private String grade;
    private long savings;
    private LocalDateTime registerDate;

    public Customer(String customerId, String password) {
        this.customerId = customerId;
        this.password = password;
    }

    public Customer(String customerId, long savings) {
        this.customerId = customerId;
        this.savings = savings;
    }

    public Customer(String customerId, String customerName, String password, int age, String job, String grade, long savings, LocalDateTime registerDate) {
        this.customerId = customerId;
        this.customerName = customerName;
        this.password = password;
        this.age = age;
        this.job = job;
        this.grade = grade;
        this.savings = savings;
        this.registerDate = registerDate;
    }

    public String getCustomerId() {
        return customerId;
    }

    public String getCustomerName() {
        return customerName;
    }

    public String getPassword() {
        return password;
    }

    public int getAge() {
        return age;
    }

    public String getJob() {
        return job;
    }

    public String getGrade() {
        return grade;
    }

    public long getSavings() {
        return savings;
    }

    public LocalDateTime getRegisterDate() {
        return registerDate;
    }
}
