package com.spring.service;

import com.spring.dao.FeedbackDao;
import com.spring.model.Feedback;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class FeedbackServiceImpl implements FeedbackService{
    @Autowired
    private FeedbackDao feedbackDao;
    @Override
    public List<Feedback> getListFeedback(int index) {
        return feedbackDao.getListFeedback(index);
    }

    @Override
    public void deleteFeedback(int id) {
        feedbackDao.deleteFeedback(id);
    }

    @Override
    public int countFeedback() {
        return feedbackDao.countFeedback();
    }

    @Override
    public void addFeedback(Feedback feedback) {
        feedbackDao.addFeedback(feedback);
    }

    @Override
    public void update(Feedback feedback) {
        feedbackDao.update(feedback);
    }
    @Override
    public Feedback getFeedbackById(int id){
        return feedbackDao.getFeedbackById(id);
    }
}
