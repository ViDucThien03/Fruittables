package com.spring.model;

public class Supplier {
    private int id;
    private String supName;
    private String supAddress;
    private String awards;
    private String supImg;

    public Supplier() {
    }

    public Supplier(int id, String supName, String supAddress, String awards, String supImg) {
        this.id = id;
        this.supName = supName;
        this.supAddress = supAddress;
        this.awards = awards;
        this.supImg = supImg;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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
}
