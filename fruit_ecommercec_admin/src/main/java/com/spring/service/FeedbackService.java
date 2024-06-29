package com.spring.service;

import com.spring.model.Feedback;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface FeedbackService {
    public List<Feedback> getListFeedback(int index);
    public void deleteFeedback(int id);
    public int countFeedback();
    public void addFeedback(Feedback feedback);
    public void update(Feedback feedback);
    public Feedback getFeedbackById(int id);

}
