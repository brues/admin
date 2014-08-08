package com.demo.basic.entity;

import com.demo.base.entity.BaseEntity;

/**
 * Created by guoyibin on 7/25/14.
 *
 * 用户角色
 */
public class UserActor extends BaseEntity {

    private Long userId;//用户ID
    private Long actorId;//角色ID

    private String userName;
    private String actorName;

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

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getActorName() {
        return actorName;
    }

    public void setActorName(String actorName) {
        this.actorName = actorName;
    }
}
