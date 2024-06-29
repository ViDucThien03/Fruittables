package com.spring.Service;

import com.spring.model.Feedback;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface FeedbackServices {
    public List<Feedback> getListFeedback();
}
