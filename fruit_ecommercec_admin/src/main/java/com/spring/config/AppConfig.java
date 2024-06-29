package com.spring.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

@Configuration
public class AppConfig {
    @Value("${external.img.path}")
    private String externalImgPath;

    public String getExternalImgPath() {
        return externalImgPath;
    }

}
