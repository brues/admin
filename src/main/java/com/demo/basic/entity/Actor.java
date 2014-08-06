package com.demo.basic.entity;

import com.demo.base.entity.BaseEntity;

/**
 * Created by guoyibin on 7/25/14.
 *
 * 角色
 */
public class Actor extends BaseEntity {

    private String actorName;


    public String getActorName() {
        return actorName;
    }

    public void setActorName(String actorName) {
        this.actorName = actorName;
    }

}
