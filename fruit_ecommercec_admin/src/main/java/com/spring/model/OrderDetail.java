package com.spring.model;

public class OrderDetail {
    private int id;
    private double totalPiad;
    private int orderID;
    private int quantityProduct;
//    private Orders order;
    private int productId;
    private String productName;
    private double productPrice;

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getTotalPiad() {
        return totalPiad;
    }

    public void setTotalPiad(double totalPiad) {
        this.totalPiad = totalPiad;
    }


    public double getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(double productPrice) {
        this.productPrice = productPrice;
    }

    public int getQuantityProduct() {
        return quantityProduct;
    }

    public void setQuantityProduct(int quantityProduct) {
        this.quantityProduct = quantityProduct;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

//    public Orders getOrder() {
//        return order;
//    }
//
//    public void setOrder(Orders order) {
//        this.order = order;
//    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public OrderDetail() {
    }
}
