package com.spring.service;

import com.spring.dao.CategoryDao;
import com.spring.model.Categories;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class CategoryServiceImpl implements CategoryService{
    @Autowired
    private CategoryDao categoryDao;
    @Override
    public List<Categories> getCategories() {
        return categoryDao.getCategories();
    }
    public int countCategory (){
       return  categoryDao.countCategory();
    }

    @Override
    public List<Categories> paginationCategory(int index) {
        return categoryDao.paginationCategory(index);
    }

    @Override
    public Categories getCategoryById(int id) {
        return categoryDao.getCategoryById(id);
    }

    @Override
    public Categories getCategoryByID(int id) {
        return categoryDao.getCategoryByID(id);
    }

    @Override
    public void addCategory(Categories categories) {
        categoryDao.addCategory(categories);
    }

    @Override
    public void editCategory(Categories categories) {
        categoryDao.updateCategory(categories);
    }

    @Override
    public void deleteCategory(int id) {
        categoryDao.deleteCategory(id);
    }

}
