package com.demo.basic.entity;

import com.demo.base.entity.BaseEntity;

/**
 * Created by guoyibin on 7/25/14.
 *
 * 权限
 */
public class Purview extends BaseEntity {

    private String purviewName;//权限名称
    private Integer parentId;//父ID
    private String url;//路径
    private String isLeaf;


    public String getPurviewName() {
        return purviewName;
    }

    public void setPurviewName(String purviewName) {
        this.purviewName = purviewName;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getIsLeaf() {
        return isLeaf;
    }

    public void setIsLeaf(String isLeaf) {
        this.isLeaf = isLeaf;
    }


}
