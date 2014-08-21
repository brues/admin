package com.demo.question.service;

import com.demo.question.mapper.KeyWordMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by guoyibin on 8/21/14.
 *
 */
@Service
public class KeyWordService {

    @Autowired
    private KeyWordMapper keyWordMapper;
}
