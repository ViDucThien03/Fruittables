package com.spring.model;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
@Setter
@Getter
public class Payment implements Serializable
{
    private String status;
    private String message;
    private String URL;

}
