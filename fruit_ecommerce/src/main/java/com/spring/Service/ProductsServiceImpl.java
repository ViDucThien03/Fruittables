package com.spring.Service;

import com.spring.DAO.HomeDAO;
import com.spring.DAO.ProductByCatePageDAO;
import com.spring.DAO.ShopDAO;
import com.spring.model.Products;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductsServiceImpl implements ProductsService{
    @Autowired
    private HomeDAO homeDAO = new HomeDAO();
    @Autowired
    private ShopDAO shopDAO;
    @Autowired
    private ProductByCatePageDAO productByCatePageDAO;

    @Override
    public List<Products> getAllProducts() {
        return homeDAO.getAllProducts();
    }

    @Override
    public int countProductByCate(int cateId) {
        return homeDAO.countProductByCate(cateId);
    }

    @Override
    public List<Products> getProductByCate(int cateId, int index) {
        return homeDAO.getProductByCate(cateId, index);
    }

    @Override
    public int countProduct() {
        return homeDAO.countProduct();
    }

    @Override
    public List<Products> paginationProduct(int index) {
        return homeDAO.paginationProduct(index);
    }

    @Override
    public List<Products> getFreshVegetable() { return homeDAO.getFreshVegetable(); }

    @Override
    public List<Products> getBestSeller() {
        return homeDAO.getBestSeller();
    }

    @Override
    public List<Products> paginationProductShop(int index) {
        return shopDAO.paginationProductShop(index);
    }

    @Override
    public List<Products> hotProduct(int limit) {
        return shopDAO.hotProduct(limit);
    }

    @Override
    public int countHotProduct() {
        return shopDAO.countHotProduct();
    }

    @Override
    public List<Products> paginationProductByCatePage(int cateId, int index)
    {
        return productByCatePageDAO.paginationProductByCate(cateId, index);
    }
}
