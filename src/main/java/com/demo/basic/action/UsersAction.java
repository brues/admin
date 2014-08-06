package com.demo.basic.action;

import com.demo.base.action.BaseAction;
import com.demo.basic.entity.User;
import com.demo.basic.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 */
@SuppressWarnings("serial")
public class UsersAction extends BaseAction {


    private Map map = new HashMap();
    private Long id;
    private String userName;
    private String trueName;
    private String phone;
    private String email;
    private String comments;


    @Autowired
    private UserService userService;

    public String userList() throws Exception {
        return "userList";
    }

    public String findUserList() throws Exception {
        List<User> userList = userService.userList();
        map.put("total",userList.size());
        map.put("rows",userList);
        return "findUserList";
    }

    public String deleteUserById() throws Exception {
        userService.deleteUserById(id);
        return "deleteUserById";
    }

    public String saveOrUpdateUser() throws Exception {
        User user = new User();
        if(id!=null)
            user.setId(id);
        else
            user.setPassword(userName);
        if(!userName.equals(""))
            user.setUserName(userName);
        else
            user.setUserName("");
        if(!trueName.equals(""))
            user.setTrueName(trueName);
        else
            user.setTrueName("");
        if(!phone.equals(""))
            user.setPhone(phone);
        else
            user.setPhone("");
        if(!email.equals(""))
            user.setEmail(email);
        else
            user.setEmail("");
        if(!comments.equals(""))
            user.setComments(comments);
        else
            user.setComments("");
        userService.saveOrUpdateUser(user);

        return "saveOrUpdateUser";
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

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getTrueName() {
        return trueName;
    }

    public void setTrueName(String trueName) {
        this.trueName = trueName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

}
