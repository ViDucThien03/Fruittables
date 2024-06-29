package com.spring.model;

import java.sql.Date;

public class Checkout
{
    private int checkoutid;
    private String fullName;
    private String address;
    private String phone;
    private String email;
    private String desc_order;
    private int quantity;
    private double total;
    private int userid;
    private String status;
    private Date createDay;
    private String paymentMethod;
    private String statusPayment;
    public Checkout() {}

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public String getStatusPayment() {
        return statusPayment;
    }

    public void setStatusPayment(String statusPayment) {
        this.statusPayment = statusPayment;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public Date getCreateDay() {
        return createDay;
    }
    public void setCreateDay(Date createDay) {
        this.createDay = createDay;
    }
    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }
    public int getCheckoutid() {
        return checkoutid;
    }
    public void setCheckoutid(int checkoutid) {
        this.checkoutid = checkoutid;
    }
    public String getFullName() {
        return fullName;
    }
    public void setFullName(String fullName) {
        this.fullName = fullName;
    }
    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }
    public String getPhone() {
        return phone;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getDesc_order() {
        return desc_order;
    }
    public void setDesc_order(String desc_order) {
        this.desc_order = desc_order;
    }
    public int getQuantity() {
        return quantity;
    }
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    public double getTotal() {
        return total;
    }
    public void setTotal(double total) {
        this.total = total;
    }
    public int getUserid() {
        return userid;
    }
    public void setUserid(int userid) {
        this.userid = userid;
    }
}
