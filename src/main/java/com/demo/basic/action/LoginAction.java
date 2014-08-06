package com.demo.basic.action;

import com.demo.base.action.BaseAction;
import com.demo.basic.entity.Purview;
import com.demo.basic.entity.User;
import com.demo.basic.service.PurviewService;
import com.demo.basic.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;

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



    @Autowired
    private UserService userService;

    @Autowired
    private PurviewService purviewService;

    public String login() throws Exception {
        return "login";
    }

    public String welcome() throws Exception {
        User user = userService.findByUserNameAndPassword(userName,password);
        if (user == null){
            return "login";
        }else{
            session.setAttribute("admin_user",user);
            List<Purview> purviewList = purviewService.findListByParentId(0L);
            for (int i = 0; i < purviewList.size(); i++) {
                treeString+="<li data-options=\"state:\'closed\'\">";
                treeString+="<span>"+purviewList.get(i).getPurviewName()+"</span>";
                List<Purview> purviews = purviewService.findListByParentId(purviewList.get(i).getId());
                if (purviews.size()>0){
                    treeString+="<ul>";
                    for (int j = 0; j < purviews.size(); j++) {
                        treeString+="<li>";
                        treeString+="<span><a href='javascript:addPanel("+purviews.get(j).getId()+")'>"+purviews.get(j).getPurviewName()+"</a></span>";
                        treeString+="</li>";
                    }
                    treeString+="</ul>";
                }
                treeString+="</li>";
            }
            return "welcome";
        }
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
}

