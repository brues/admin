package com.demo.basic.entity;

import com.demo.base.entity.BaseEntity;

/**
 * Created by guoyibin on 7/25/14.
 *
 *
 * 用户
 */
public class User extends BaseEntity {

    private String userName;//管理员名称
    private String password;//密码
    private String trueName;//真是姓名
    private String email;//邮件
    private String phone;//电话
    private String registerDate;//注册日期
    private String comments;//备注



    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getTrueName() {
        return trueName;
    }

    public void setTrueName(String trueName) {
        this.trueName = trueName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getRegisterDate() {
        return registerDate;
    }

    public void setRegisterDate(String registerDate) {
        this.registerDate = registerDate;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

}
