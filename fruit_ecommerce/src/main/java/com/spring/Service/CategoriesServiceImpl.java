package com.spring.Service;

import com.spring.DAO.HomeDAO;
import com.spring.model.Categories;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoriesServiceImpl implements CategoriesService
{
    @Autowired
    private HomeDAO homeDAO = new HomeDAO();

    @Override
    public List<Categories> getAllCategories()
    {
        return homeDAO.getCategories();
    }
}
