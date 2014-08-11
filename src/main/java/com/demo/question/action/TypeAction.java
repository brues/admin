package com.demo.question.action;

import com.demo.base.action.BaseAction;
import com.demo.question.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by guoyibin on 8/11/14.
 */
public class TypeAction extends BaseAction {

    @Autowired
    private TypeService typeService;
}
