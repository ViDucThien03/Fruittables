package com.spring.service;

import com.spring.model.BlogDetail;
import com.spring.model.BlogTypes;

import java.util.List;

public interface BlogDetailService {

    List<BlogDetail> paginationBlogDetails(int index);
    int countBlog();
    List<BlogDetail> getAllBlogDetails();
    BlogDetail getBlogDetailById(int id);
    void addBlogDetail(BlogDetail blogDetail);
    void updateBlogDetail(BlogDetail blogDetail);
    void deleteBlogDetail(int id);
    public List<BlogTypes> getAllBlogTypes();
}
