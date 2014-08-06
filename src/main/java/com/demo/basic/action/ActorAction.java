package com.demo.basic.action;

import com.demo.base.action.BaseAction;
import com.demo.basic.entity.Actor;
import com.demo.basic.service.ActorService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 *
 *
 */
public class ActorAction extends BaseAction {

    private Map map = new HashMap();
    private Long id;
    private String actorName;


    @Autowired
    private ActorService actorService;


    public String actorList() throws Exception {
        return "actorList";
    }


    public String findActorList() throws Exception {
        List<Actor> actorList = actorService.actorList();
        map.put("total",actorList.size());
        map.put("rows",actorList);
        return "findActorList";
    }


    public String deleteActorById() throws Exception {
        actorService.deleteActorById(id);
        return "deleteActorById";
    }

    public String saveOrUpdateActor() throws Exception {
        Actor actor = new Actor();
        if(id!=null)
            actor.setId(id);
        if(!actorName.equals(""))
            actor.setActorName(actorName);
        actorService.saveOrUpdateActor(actor);

        return "saveOrUpdateActor";
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

    public String getActorName() {
        return actorName;
    }

    public void setActorName(String actorName) {
        this.actorName = actorName;
    }
}
