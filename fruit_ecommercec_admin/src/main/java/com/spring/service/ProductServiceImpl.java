package com.spring.service;

import com.spring.dao.ProductsDao;
import com.spring.model.Products;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ProductServiceImpl implements ProductService{
    @Autowired
    private ProductsDao proDao;
    @Override
    public int countProduct() {

        return proDao.countProduct();
    }

    @Override
    public List<Products> paginationProduct(int index) {
        return proDao.paginationProduct(index);
    }

    @Override
    public Products getProductById(int id) {
        return proDao.getProductById(id);
    }

    @Override
    public void deleteProduct(int id) {
        try {
            proDao.deleteProduct(id);
        } catch (DataIntegrityViolationException e) {
            throw new DataIntegrityViolationException("Cannot delete product with id " + id + " because it has related data in other tables.");
        }
    }

    @Override
    public void addProduct(Products product) {
        proDao.addProduct(product);
    }

    @Override
    public void updateProduct(Products product) {
        proDao.updateProduct(product);
    }

    @Override
    public List<Products> showBestSellerProduct() {
        return proDao.showBestSellerProduct();
    }

    @Override
    public List<Products> showPoorlyProduct() {
        return proDao.showPoorlyProduct();
    }

    @Override
    public void updateSale(int productId, double sale) {
        proDao.updateSale(productId, sale);
    }
}
