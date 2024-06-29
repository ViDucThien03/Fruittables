package com.spring.model;

public class Roles {
    private int id;
    private String roles;

    public Roles() {
    }

    public Roles(int id, String roles) {
        this.id = id;
        this.roles = roles;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRoles() {
        return roles;
    }

    public void setRoles(String roles) {
        this.roles = roles;
    }
}
