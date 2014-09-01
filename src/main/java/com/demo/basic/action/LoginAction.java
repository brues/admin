package com.demo.basic.action;

import com.demo.base.action.BaseAction;
import com.demo.basic.entity.Actor;
import com.demo.basic.entity.Purview;
import com.demo.basic.entity.User;
import com.demo.basic.service.ActorService;
import com.demo.basic.service.PurviewService;
import com.demo.basic.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

/**
 *
 *
 *
 */
public class LoginAction extends BaseAction {


    private String userName;
    private String password;
    private String treeString;
    private List<User> userList = new ArrayList<User>();



    @Autowired
    private UserService userService;

    @Autowired
    private PurviewService purviewService;

    @Autowired
    private ActorService actorService;

    public String login() {
        return "login";
    }

    public String welcome() throws Exception {
        User user = userService.findByUserNameAndPassword(userName,password);
        if (user == null){
            return "login";
        }else{
            Actor actor = actorService.findActorByUserId(user.getId());
            if(actor.getActorName().equals("客户")){
                return "front";
            }else{
                session.setAttribute("admin_user",user);
                treeString="";
                List<Purview> purviewList = purviewService.findByUserIdAndParentId(user.getId(),0l);
                for (int i = 0; i < purviewList.size(); i++) {
                    List<Purview> purviews = purviewService.findByUserIdAndParentId(user.getId(),purviewList.get(i).getId());
                    if (purviews.size()>0){
                        treeString+="<div title=\""+purviewList.get(i).getPurviewName()+"\"  style=\"padding:10px;\">";

                        for (int j = 0; j < purviews.size(); j++) {
                            treeString+="<p>";
                            treeString+="<a href='javascript:addPanel("+purviews.get(j).getId()+")'>"+purviews.get(j).getPurviewName()+"</a>";
                            treeString+="</p>";
                        }

                        treeString+="</div>";
                    }
                }
                return "welcome";
            }
        }
    }

    public String findUserByUserNameAndPassword() throws Exception {
        userList = userService.findListByUserNameAndPassword(userName,password);
        return "findUserByUserNameAndPassword";
    }

    public String toLogin() throws Exception {
        return "toLogin";
    }











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

    public String getTreeString() {
        return treeString;
    }

    public void setTreeString(String treeString) {
        this.treeString = treeString;
    }

    public List<User> getUserList() {
        return userList;
    }

    public void setUserList(List<User> userList) {
        this.userList = userList;
    }


}

