package com.spring.Service;

import com.spring.model.Products;

import java.util.List;

public interface ProductsService {
    public List<Products> getAllProducts();
    public int countProductByCate(int cateId);
    public List<Products> getProductByCate(int cateId, int index);
    public int countProduct();
    public List<Products> paginationProduct(int index);
    public List<Products> getFreshVegetable();
    public List<Products> getBestSeller();
    public List<Products> paginationProductShop(int index);
    public List<Products> hotProduct(int limit);
    public int countHotProduct();
    public List<Products> paginationProductByCatePage(int cateId, int index);
}
