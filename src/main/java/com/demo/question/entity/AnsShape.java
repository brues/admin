package com.demo.question.entity;

import com.demo.base.entity.BaseEntity;

/**
 * Created by guoyibin on 8/11/14.
 *
 * 回复形式类型表
 */
public class AnsShape extends BaseEntity {
    private String shape;//形式名称

    public String getShape() {
        return shape;
    }

    public void setShape(String shape) {
        this.shape = shape;
    }
}
