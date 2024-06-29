package com.spring.model;

public class CheckoutDetail
{
    private int id;
    private int productID;
    private int checkoutID;
    private int quantity;
    private double total;

    public CheckoutDetail(){}

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public int getProductID() {
        return productID;
    }
    public void setProductID(int productID) {
        this.productID = productID;
    }
    public int getCheckoutID() {
        return checkoutID;
    }
    public void setCheckoutID(int checkoutID) {
        this.checkoutID = checkoutID;
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
}
