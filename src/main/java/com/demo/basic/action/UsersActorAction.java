package com.demo.basic.action;

import com.demo.base.action.BaseAction;
import com.demo.basic.entity.UserActor;
import com.demo.basic.service.UserActorService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 *
 */
public class UsersActorAction extends BaseAction {

    private Long id;
    private Long userId;
    private Long actorId;
    private Map map = new HashMap();

    @Autowired
    private UserActorService userActorService;


    public String saveOrUpdateUserActor() throws Exception {
        userActorService.saveOrUpdateUserActor(userId,actorId);
        return "saveOrUpdateUserActor";
    }
    public String findActorByUserId() throws Exception {
        actorId=userActorService.findActorByUserId(userId);
        return "findActorByUserId";
    }

    public String deleteUserActorById() throws Exception {
        userActorService.deleteUserActorById(id);
        return "deleteUserActorById";
    }

    public String findUserActorList() throws Exception {
        List<UserActor> userActorList = userActorService.userActorList();
        map.put("total",userActorList.size());
        map.put("rows",userActorList);
        return "findUserActorList";
    }

    public String userActorList() throws Exception {
        return "userActorList";
    }




    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getActorId() {
        return actorId;
    }

    public void setActorId(Long actorId) {
        this.actorId = actorId;
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

}
