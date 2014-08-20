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

    public String login() {
        return "login";
    }

    public String welcome() throws Exception {
        System.out.println("1");
        System.out.println(userName);
        System.out.println("2");
        System.out.println(password);
        System.out.println("3");
        User user = userService.findByUserNameAndPassword(userName,password);
        if (user == null){
            return "login";
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

