package com.spring.model;

public class Supplier {
    private int supplierId;
    private String supName;
    private String supAddress;
    private String awards;
    private String supImg;

    public int getSupplierId() {
        return supplierId;
    }

    public void setSupplierId(int supplierId) {
        this.supplierId = supplierId;
    }

    public String getSupName() {
        return supName;
    }

    public void setSupName(String supName) {
        this.supName = supName;
    }

    public String getSupAddress() {
        return supAddress;
    }

    public void setSupAddress(String supAddress) {
        this.supAddress = supAddress;
    }

    public String getAwards() {
        return awards;
    }

    public void setAwards(String awards) {
        this.awards = awards;
    }

    public String getSupImg() {
        return supImg;
    }

    public void setSupImg(String supImg) {
        this.supImg = supImg;
    }

    public Supplier() {
    }

    public Supplier(int supplierId, String supName, String supAddress, String awards, String supImg) {
        this.supplierId = supplierId;
        this.supName = supName;
        this.supAddress = supAddress;
        this.awards = awards;
        this.supImg = supImg;
    }
}
