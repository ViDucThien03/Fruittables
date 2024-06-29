package com.spring.model;



public class User {
    private int id;
    private String cusName;
    private String userName;
    private String password;
    private String cusPhone;
    private String cusAddress;
    private String cusEmail;
    private boolean gender;
    private String cusEnable;
    private int roleId;

    public String getCusEnable() {
        return cusEnable;
    }

    public void setCusEnable(String cusEnable) {
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

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
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

    public String getCusEmail() {
        return cusEmail;
    }

    public void setCusEmail(String cusEmail) {
        this.cusEmail = cusEmail;
    }

    public User() {
    }

    public User(int id, String cusName, String userName, String password, String cusPhone, String cusAddress, String cusEmail, boolean gender, int roleId) {
        this.id = id;
        this.cusName = cusName;
        this.userName = userName;
        this.password = password;
        this.cusPhone = cusPhone;
        this.cusAddress = cusAddress;
        this.cusEmail = cusEmail;
        this.gender = gender;
        this.roleId = roleId;
    }
}
