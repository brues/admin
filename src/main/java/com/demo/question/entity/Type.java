package com.demo.question.entity;

import com.demo.base.entity.BaseEntity;

/**
 * Created by guoyibin on 8/11/14.
 *
 * 问题来源
 */
public class Type extends BaseEntity {

    private String name;//问题来源名

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
