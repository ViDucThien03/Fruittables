package com.spring.model;

public class Contacts {
    private int id;
    private String contactEmail;
    private String contactPhone;
    private String contactAddress;

    public Contacts() {}

    public Contacts(int id, String contactEmail, String contactPhone, String contactAddress) {
        this.id = id;
        this.contactEmail = contactEmail;
        this.contactPhone = contactPhone;
        this.contactAddress = contactAddress;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContactEmail() {
        return contactEmail;
    }

    public void setContactEmail(String contactEmail) {
        this.contactEmail = contactEmail;
    }

    public String getContactPhone() {
        return contactPhone;
    }

    public void setContactPhone(String contactPhone) {
        this.contactPhone = contactPhone;
    }

    public String getContactAddress() {
        return contactAddress;
    }

    public void setContactAddress(String contactAddress) {
        this.contactAddress = contactAddress;
    }
}
