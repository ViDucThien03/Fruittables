package com.spring.Service;

import com.spring.model.Categories;
import com.spring.model.Products;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface New_Sale_Service
{
    // By New and sale
    public List<Products> getSellingProduct();
    public List<Products> getDiscountProduct();
    public int countProduct();
}
