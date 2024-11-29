package com.ecommerce.entity;

import java.time.LocalDate;

public class Customer {
    private String customerId;
    private String customerName;
    private String password;
    private int age;
    private String job;
    private String grade;
    private long savings;
    private LocalDate registerDate;

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

    public LocalDate getRegisterDate() {
        return registerDate;
    }
}
