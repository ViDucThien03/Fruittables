package com.spring.model;

public class CodeVerify {
    private int number;
    public CodeVerify(int number) {
        this.number = number;
    }
    public int getNumber() {
        return number;
    }
    public void setNumber(int number) {
        this.number = number;
    }
    @Override
    public String toString() {
        return String.format("%06d", number);
    }
}
