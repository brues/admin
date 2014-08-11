package com.demo.question.service;

import com.demo.question.mapper.QuestionMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by guoyibin on 8/11/14.
 */
@Service
public class QuestionService {

    @Autowired
    private QuestionMapper questionMapper;
}
