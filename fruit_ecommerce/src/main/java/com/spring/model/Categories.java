package com.spring.model;

public class Categories
{
    private int cateId;
    private String cateName;
    private boolean enable;
    private String cateImg;

    public Categories(int cateId, String cateName, boolean enable, String cateImg) {
        this.cateId = cateId;
        this.cateName = cateName;
        this.enable = enable;
        this.cateImg = cateImg;
    }

    public Categories() {

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

    public boolean isEnable() {
        return enable;
    }

    public void setEnable(boolean enable) {
        this.enable = enable;
    }

    public String getCateImg() {
        return cateImg;
    }

    public void setCateImg(String cateImg) {
        this.cateImg = cateImg;
    }
}
