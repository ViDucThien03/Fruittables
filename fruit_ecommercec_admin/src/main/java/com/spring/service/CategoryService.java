package com.spring.service;

import com.spring.model.Categories;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface CategoryService {
    public List<Categories> getCategories();
    public int countCategory ();
    public List<Categories> paginationCategory(int index);
    public Categories getCategoryById(int id);
    public Categories getCategoryByID(int id);
    public void addCategory (Categories categories);
    public void editCategory (Categories categories);
    public void deleteCategory(int id);
}
