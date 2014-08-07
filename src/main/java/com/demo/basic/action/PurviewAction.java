package com.demo.basic.action;

import com.demo.base.action.BaseAction;
import com.demo.basic.entity.Purview;
import com.demo.basic.service.PurviewService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 权限action
 *
 */
public class PurviewAction extends BaseAction {

    Map map = new HashMap();
    private Purview purview;
    private Long id;
    private Long parentId;
    List<Purview> purviewList = new ArrayList<Purview>();

    @Autowired
    private PurviewService purviewService;


    /**
     * 通过父节点查找节点
     *
     * */
    public String findListByParentId(){
        purviewList = purviewService.findListByParentId(parentId);
        map.put("total",purviewList.size());
        map.put("rows",purviewList);
        return "findListByParentId";
    }


    /**
     * 通过id查找节点
     *
     * */
    public String findPurviewById(){
        purview = purviewService.findById(id);
        return "findPurviewById";
    }


    /**
     * 查找所有节点
     *
     * */
    public String purviewList() throws Exception {
        return "purviewList";
    }


    /**
     * 查找所有节点
     *
     * */
    public String findPurviewList() throws Exception{
        purviewList = purviewService.findPurviewList();
        return "findPurviewList";
    }






    public Purview getPurview() {
        return purview;
    }

    public void setPurview(Purview purview) {
        this.purview = purview;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Map getMap() {
        return map;
    }

    public void setMap(Map map) {
        this.map = map;
    }

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    public List<Purview> getPurviewList() {
        return purviewList;
    }

    public void setPurviewList(List<Purview> purviewList) {
        this.purviewList = purviewList;
    }
}
