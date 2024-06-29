package com.spring.model;

public class BlogTypes {

    private int id ;
    private String typeName;

    public BlogTypes() {}

    public BlogTypes(int id, String type_name) {
        this.id = id;
        this.typeName = type_name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }
}
