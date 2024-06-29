package com.spring.Service;

import com.spring.DAO.BlogDetailDAO;
import com.spring.DAO.BlogTypeDAO;
import com.spring.model.BlogDetails;
import com.spring.model.BlogTypes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class BlogDetailServiceImpl implements BlogDetailService {
    @Override
    public List<BlogDetails> getBlogByID(int id) {
        return blogDetailDAO.getBlogByID(id);
    }

    @Override
    public List<BlogDetails> getBlogDetailsByBlogTypeID(int id) {
        return blogDetailDAO.getBlogDetailsByBlogTypeID(id);
    }

    @Autowired
    private BlogDetailDAO blogDetailDAO = new BlogDetailDAO();
    @Autowired
    private BlogTypeDAO blogTypesDAO = new BlogTypeDAO();

    @Override
    public List<BlogDetails> getAllBlogDetails()
    {
       return blogDetailDAO.getBlogDetails();
    }

    @Override
    public List<BlogTypes> getAllBlogTypes() {
        return blogTypesDAO.getBlogTypes();
    }

    @Override
    public List<BlogTypes> getBlogTypesByID(int id) {
        return blogTypesDAO.getBlogTypesByID(id);
    }

    @Override
    public List<BlogDetails> getAllBlogDetailsNew() {
        return blogDetailDAO.getBlogDetailsNew();
    }

    @Override
    public List<BlogDetails> paginationBlog(int index) {
        return blogDetailDAO.paginationBlog(index);
    }
    @Override
    public int countBlog() {
        return blogDetailDAO.countBlog();
    }

    @Override
    public List<BlogDetails> getBlogByID(int id, int index) {
        return blogDetailDAO.getBlogDetailsByID(id, index);
    }

    @Override
    public int countBlogByID(int id) {
        return blogDetailDAO.countBlogByID(id);
    }
}
