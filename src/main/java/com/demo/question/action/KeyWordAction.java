package com.demo.question.action;

import com.demo.base.action.BaseAction;
import com.demo.question.service.KeyWordService;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by guoyibin on 8/21/14.
 */
public class KeyWordAction extends BaseAction {

    private Long id;
    private Long questionId;
    private String keyWord;

    @Autowired
    private KeyWordService keyWordService;

}
