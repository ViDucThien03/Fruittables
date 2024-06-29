package com.spring.Service;

import com.spring.model.BlogDetails;
import com.spring.model.BlogTypes;

import java.util.List;

public interface BlogDetailService {
    public List<BlogDetails> getAllBlogDetails();
    public List<BlogTypes> getAllBlogTypes();
    public List<BlogTypes> getBlogTypesByID(int id);
    public List<BlogDetails> getAllBlogDetailsNew();
    public List<BlogDetails> paginationBlog(int index);
    public int countBlog ();
    public List<BlogDetails> getBlogByID(int id, int index);
    public int countBlogByID(int id);
    public List<BlogDetails> getBlogByID(int id);
    public List<BlogDetails> getBlogDetailsByBlogTypeID(int id);
}
