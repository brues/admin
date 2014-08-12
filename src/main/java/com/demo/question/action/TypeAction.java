package com.demo.question.action;

import com.demo.base.action.BaseAction;
import com.demo.question.entity.Type;
import com.demo.question.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by guoyibin on 8/11/14.
 *
 *
 */
public class TypeAction extends BaseAction {

    private Map map = new HashMap();
    private Long id;
    private String name;


    @Autowired
    private TypeService typeService;

    public String typeList() throws Exception {
        return "typeList";
    }

    public String findTypeList() throws Exception {
        List<Type> typeList = typeService.findTypeList();
        map.put("total",typeList.size());
        map.put("rows",typeList);
        return "findTypeList";
    }

    public String deleteTypeById() throws Exception {
        typeService.deleteTypeById(id);
        return "deleteTypeById";
    }

    public String saveOrUpdateType() throws Exception {
        typeService.saveOrUpdateType(id,name);
        return "saveOrUpdateType";
    }



    public Map getMap() {
        return map;
    }

    public void setMap(Map map) {
        this.map = map;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
