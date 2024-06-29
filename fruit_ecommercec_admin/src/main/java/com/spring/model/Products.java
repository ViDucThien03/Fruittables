package com.spring.model;

import java.util.Date;

public class Products {
    private int productId;
    private String productName;
    private String productDesc;
    //private String shortDesc;
    private double productPrice;
    private int quantity;
    private double sale;
    private boolean hot;
    private String expDate;
    private String createDate;
    private String productImg;
    private int cateId;
    private String cateName;
    private int sell_quantity;

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductDesc() {
        return productDesc;
    }

    public void setProductDesc(String productDesc) {
        this.productDesc = productDesc;
    }

//    public String getShortDesc() {
//        return shortDesc;
//    }
//
//    public void setShortDesc(String shortDesc) {
//        this.shortDesc = shortDesc;
//    }


    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getSale() {
        return sale;
    }

    public void setSale(double sale) {
        this.sale = sale;
    }

    public boolean isHot() {
        return hot;
    }

    public void setHot(boolean hot) {
        this.hot = hot;
    }

    public String getExpDate() {
        return expDate;
    }

    public void setExpDate(String expDate) {
        this.expDate = expDate;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public String getProductImg() {
        return productImg;
    }

    public void setProductImg(String productImg) {
        this.productImg = productImg;
    }

    public int getCateId() {
        return cateId;
    }

    public void setCateId(int cateId) {
        this.cateId = cateId;
    }

    public String getCateName() {
        return cateName;
    }

    public void setCateName(String cateName) {
        this.cateName = cateName;
    }

    public double getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(double productPrice) {
        this.productPrice = productPrice;
    }

    public int getSell_quantity() {
        return sell_quantity;
    }

    public void setSell_quantity(int sell_quantity) {
        this.sell_quantity = sell_quantity;
    }

    public Products() {
    }

    public Products(int productId, String productName, String productDesc, double productPrice, int quantity, double sale, boolean hot, String expDate, String createDate, String productImg, int cateId, String cateName, int sell_quantity) {
        this.productId = productId;
        this.productName = productName;
        this.productDesc = productDesc;
        //this.shortDesc = shortDesc;
        this.productPrice = productPrice;
        this.quantity = quantity;
        this.sale = sale;
        this.hot = hot;
        this.expDate = expDate;
        this.createDate = createDate;
        this.productImg = productImg;
        this.cateId = cateId;
        this.cateName = cateName;
        this.sell_quantity = sell_quantity;
    }
}
