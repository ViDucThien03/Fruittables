package com.spring.model;

import java.util.Date;

public class BlogDetail {
    private int id;
    private String title;
    private String content;
    private String description;
    private String blogImg;
    private Date createAt;
    private Integer blogId;
    private Integer customerId;

    // Constructor
    public BlogDetail() {}

    public BlogDetail(int id, String title, String content, String description, String blogImg, Date createAt, Integer blogId, Integer customerId) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.description = description;
        this.blogImg = blogImg;
        this.createAt = createAt;
        this.blogId = blogId;
        this.customerId = customerId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getBlogImg() {
        return blogImg;
    }

    public void setBlogImg(String blogImg) {
        this.blogImg = blogImg;
    }

    public Date getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }

    public Integer getBlogId() {
        return blogId;
    }

    public void setBlogId(Integer blogId) {
        this.blogId = blogId;
    }

    public Integer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Integer customerId) {
        this.customerId = customerId;
    }
}
