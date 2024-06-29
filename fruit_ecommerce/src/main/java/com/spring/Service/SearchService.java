package com.spring.Service;

import com.spring.model.Products;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface SearchService
{
    public List<Products> findAllProducts(String text);
}
