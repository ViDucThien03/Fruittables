package com.spring.dao;

import com.spring.model.Categories;
import com.spring.model.CategoriesMapper;
import com.spring.model.Feedback;
import com.spring.model.FeedbackMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class FeedbackDao {
    @Autowired
    JdbcTemplate jdbcTemplate;

    public int countFeedback(){
        String sql = "select count(*) from feedback";
        int count = jdbcTemplate.queryForObject(sql,new Object[]{}, Integer.class);
        return count;
    }
    public List<Feedback> getListFeedback(int index){
        List<Feedback> list = new ArrayList<Feedback>();
        String sql = "select f.*, c.cus_name from feedback f inner join customer c on c.id = f.id limit 10 offset ?";
        int page = (index-1) * 10;
        Object[] params = new Object[]{page};
        list = jdbcTemplate.query(sql,params, new FeedbackMapper());
        return list;
    }
    public void deleteFeedback(int id){
        String sql = "delete from feedback where fb_id=?";
        jdbcTemplate.update(sql,id);
    }
    public void addFeedback(Feedback feedback){
        String sql = "Insert into feedback (content, rate, product_id, id) values(?,?,?,?)";
        jdbcTemplate.update(sql, feedback.getContent(),feedback.getRate(),feedback.getProduct_id(),feedback.getCustomer_id());
    }
    public void update(Feedback feedback){
        String sql = "update feedback set content=?,rate=?,product_id=?,id=? where fb_id=?";
        jdbcTemplate.update(sql,feedback.getContent(),feedback.getRate(),feedback.getProduct_id(),feedback.getCustomer_id(),feedback.getId());
    }
    public Feedback getFeedbackById(int id){
        Feedback feedback = new Feedback();
        String sql = "SELECT * FROM feedback where fb_id=?";
        feedback = jdbcTemplate.queryForObject(sql, new FeedbackMapper(), new Object[]{id});
        return feedback;
    }
}
