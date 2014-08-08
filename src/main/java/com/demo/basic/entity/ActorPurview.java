package com.demo.basic.entity;

import com.demo.base.entity.BaseEntity;

/**
 * Created by guoyibin on 7/25/14.
 *
 * 角色权限
 */
public class ActorPurview extends BaseEntity {

    private Long actorId;//角色ID
    private Long purviewId;//权限ID

    public Long getActorId() {
        return actorId;
    }

    public void setActorId(Long actorId) {
        this.actorId = actorId;
    }

    public Long getPurviewId() {
        return purviewId;
    }

    public void setPurviewId(Long purviewId) {
        this.purviewId = purviewId;
    }
}
