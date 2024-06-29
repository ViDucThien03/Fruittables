package com.spring.Service;

import com.spring.DAO.HomeDAO;
import com.spring.model.Feedback;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FeedbackServicesImpl implements FeedbackServices{
    @Autowired
    private HomeDAO homeDAO;
    @Override
    public List<Feedback> getListFeedback() {
        return homeDAO.getListFeedback();
    }
}
