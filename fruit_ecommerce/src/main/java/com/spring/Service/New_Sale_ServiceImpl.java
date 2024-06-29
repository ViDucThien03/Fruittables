package com.spring.Service;

import com.spring.DAO.NewSaleDAO;
import com.spring.model.Products;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class New_Sale_ServiceImpl implements New_Sale_Service
{
    @Autowired
    private NewSaleDAO new_sale_DAO = new NewSaleDAO();

    @Override
    public List<Products> getSellingProduct() {
        return new_sale_DAO.getSellingProduct();
    }
    public List<Products> getDiscountProduct() {
        return new_sale_DAO.getDiscountProduct();
    }
    @Override
    public int countProduct() {
        return new_sale_DAO.countProduct();
    }


}
