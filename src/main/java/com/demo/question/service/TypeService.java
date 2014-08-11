package com.demo.question.service;

import com.demo.question.mapper.TypeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by guoyibin on 8/11/14.
 */
@Service
public class TypeService {

    @Autowired
    private TypeMapper typeMapper;
}
