package com.spring.Service;

import com.spring.DAO.ShopDetailDAO;
import com.spring.model.Products;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ShopDetailServiceImpl implements ShopDetailService {


    @Autowired
    private ShopDetailDAO shopDetailDAO;
    @Override
    public List<Products> getSimilarProductsByCate(int cateId) {
        return shopDetailDAO.getSimilarProductsByCate(cateId);
    }
//    @Override
//    public List<CategoryProductCount> getCategoryByProduct() {
//        return shopDetailDAO.getCategoryByProduct();
//    }
    @Override
    public List<Products> getProductSales() {
        return shopDetailDAO.getProductSales();
    }
    @Override
    public List<Products> getProductById(int id) {
        return shopDetailDAO.getProductById(id);
    }
}
