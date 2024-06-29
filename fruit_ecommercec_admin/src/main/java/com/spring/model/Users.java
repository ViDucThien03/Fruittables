package com.spring.model;

public class Users {
    private int id;
    private String cusName;
    private String username;
    private String password;
    private String cusPhone;
    private String cusEmail;
    private String cusAddress;
    private boolean gender;
    private int roleId;
    private String cusEnable;

    public Users() {
    }

    public Users(int id, String cusName, String username, String password, String cusPhone, String cusEmail, String cusAddress, boolean gender, int roleId, String cusEnable) {
        this.id = id;
        this.cusName = cusName;
        this.username = username;
        this.password = password;
        this.cusPhone = cusPhone;
        this.cusEmail = cusEmail;
        this.cusAddress = cusAddress;
        this.gender = gender;
        this.roleId = roleId;
        this.cusEnable = cusEnable;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCusName() {
        return cusName;
    }

    public void setCusName(String cusName) {
        this.cusName = cusName;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getCusPhone() {
        return cusPhone;
    }

    public void setCusPhone(String cusPhone) {
        this.cusPhone = cusPhone;
    }

    public String getCusEmail() {
        return cusEmail;
    }

    public void setCusEmail(String cusEmail) {
        this.cusEmail = cusEmail;
    }

    public String getCusAddress() {
        return cusAddress;
    }

    public void setCusAddress(String cusAddress) {
        this.cusAddress = cusAddress;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public String getCusEnable() {
        return cusEnable;
    }

    public void setCusEnable(String cusEnable) {
        this.cusEnable = cusEnable;
    }
}
