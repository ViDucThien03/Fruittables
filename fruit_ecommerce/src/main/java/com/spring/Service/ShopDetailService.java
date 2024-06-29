package com.spring.Service;

import com.spring.model.Products;

import java.util.List;

public interface ShopDetailService {
    public List<Products> getSimilarProductsByCate(int cateId);
//    public List<CategoryProductCount> getCategoryByProduct();
    public List<Products> getProductSales();
    public List<Products> getProductById(int id);
}
