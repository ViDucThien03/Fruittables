package com.spring.model;

public class Cart
{
    private int quantity;
    private double totalPrice;
    private Products product;

    public Cart(int quantity, double totalPrice, Products product) {
        this.quantity = quantity;
        this.totalPrice = totalPrice;
        this.product = product;
    }

    public Cart() {}

    public Products getProduct() {
        return product;
    }
    public void setProduct(Products product) {
        this.product = product;
    }
    public double getTotalPrice() {
        return totalPrice;
    }
    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }
    public int getQuantity() {
        return quantity;
    }
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
