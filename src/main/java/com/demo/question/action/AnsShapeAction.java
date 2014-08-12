package com.demo.question.action;

import com.demo.base.action.BaseAction;
import com.demo.question.service.AnsShapeService;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by guoyibin on 8/11/14.
 *
 *
 */
public class AnsShapeAction extends BaseAction {

    @Autowired
    private AnsShapeService ansShapeService;

    public String ansShapeList() throws Exception {
        return "ansShapeList";
    }
}
