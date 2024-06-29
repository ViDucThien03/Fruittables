package com.spring.Service;

import com.spring.DAO.NewSaleDAO;
import com.spring.DAO.SearchDAO;
import com.spring.model.Products;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SearchServiceImpl implements SearchService
{
    @Autowired
    private SearchDAO searchDAO = new SearchDAO();

    @Override
    public List<Products> findAllProducts(String text) {
        return searchDAO.findAllProduct(text);
    }
}
