package com.spring.service;

import com.spring.dao.BlogDetailDao;
import com.spring.model.BlogDetail;
import com.spring.model.BlogTypes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BlogDetailServiceImpl implements BlogDetailService {
    @Autowired
    private BlogDetailDao blogDetailDao;

    @Override
    public List<BlogDetail> paginationBlogDetails(int index) {
        return blogDetailDao.paginationBlogDetails(index);
    }

    @Override
    public int countBlog() {
        return blogDetailDao.countBlog();
    }

    @Override
    public List<BlogDetail> getAllBlogDetails() {
        return blogDetailDao.getAllBlogDetails();
    }

    @Override
    public BlogDetail getBlogDetailById(int id) {
        return blogDetailDao.getBlogDetailById(id);
    }

    @Override
    public void addBlogDetail(BlogDetail blogDetail) {
        blogDetailDao.addBlogDetail(blogDetail);
    }

    @Override
    public void updateBlogDetail(BlogDetail blogDetail) {
        blogDetailDao.updateBlogDetail(blogDetail);
    }

    @Override
    public void deleteBlogDetail(int id) {
        blogDetailDao.deleteBlogDetail(id);
    }

    @Override
    public List<BlogTypes> getAllBlogTypes() {
        return blogDetailDao.getAllBlogTypes();
    }


}
