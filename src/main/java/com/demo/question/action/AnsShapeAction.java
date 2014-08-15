package com.demo.question.action;

import com.demo.base.action.BaseAction;
import com.demo.question.entity.AnsShape;
import com.demo.question.service.AnsShapeService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by guoyibin on 8/11/14.
 *
 *
 */
public class AnsShapeAction extends BaseAction {

    private Map map = new HashMap();
    private String shape;


    @Autowired
    private AnsShapeService ansShapeService;

    public String ansShapeList() throws Exception {
        return "ansShapeList";
    }

    public String findAnsShapeList() throws Exception {
        List<AnsShape> ansShapeList = ansShapeService.findAnsShapeList();
        map.put("total",ansShapeList.size());
        map.put("rows",ansShapeList);
        return "findAnsShapeList";
    }

    public String deleteAnsShapeById() throws Exception {
        ansShapeService.deleteAnsShapeById(id);
        return "deleteAnsShapeById";
    }

    public String saveOrUpdateAnsShape() throws Exception {
        ansShapeService.saveOrUpdateAnsShape(id,shape);
        return "saveOrUpdateAnsShape";
    }



    public Map getMap() {
        return map;
    }

    public void setMap(Map map) {
        this.map = map;
    }

    public String getShape() {
        return shape;
    }

    public void setShape(String shape) {
        this.shape = shape;
    }
}
