package com.spring.model;

import java.util.Date;

public class BlogDetails {
    private int id;
    private String title;
    private String content;
    private String description;
    private String blogImg;
    private Date createdAt;
    private int blogId;
    private int customerId;

    public BlogDetails() {
    }

    public BlogDetails(int id, String title, String content,String description, String blogImg, Date createdAt, int blogId, int customerId) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.description = description;
        this.blogImg = blogImg;
        this.createdAt = createdAt;
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

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public int getBlogId() {
        return blogId;
    }

    public void setBlogId(int blogId) {
        this.blogId = blogId;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

}
