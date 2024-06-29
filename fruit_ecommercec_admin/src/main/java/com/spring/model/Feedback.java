package com.spring.model;

public class Feedback {
    private int id;
    private String content;
    private int rate;
    private int product_id;
    private int customer_id;
    private String cusName;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getRate() {
        return rate;
    }

    public void setRate(int rate) {
        this.rate = rate;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public int getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(int customer_id) {
        this.customer_id = customer_id;
    }

    public String getCusName() {
        return cusName;
    }

    public void setCusName(String cusName) {
        this.cusName = cusName;
    }

    public Feedback() {
    }

    public Feedback(int id, String content, int rate, int product_id, int customer_id, String cusName) {
        this.id = id;
        this.content = content;
        this.rate = rate;
        this.product_id = product_id;
        this.customer_id = customer_id;
        this.cusName = cusName;
    }
}
