package com.demo.basic.entity;

import com.demo.base.entity.BaseEntity;

/**
 * Created by guoyibin on 7/25/14.
 *
 * 角色权限
 */
public class ActorPurview extends BaseEntity {

    private Integer actorId;//角色ID
    private Integer purviewId;//权限ID

    public Integer getActorId() {
        return actorId;
    }

    public void setActorId(Integer actorId) {
        this.actorId = actorId;
    }


    public Integer getPurviewId() {
        return purviewId;
    }

    public void setPurviewId(Integer purviewId) {
        this.purviewId = purviewId;
    }

}
