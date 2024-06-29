package com.spring.Service;

import com.spring.model.Categories;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface CategoriesService
{
    public List<Categories> getAllCategories();
}
