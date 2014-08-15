package com.demo.base.action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by guoyibin on 7/29/14.
 *
 *
 */
public class BaseAction extends ActionSupport implements ServletRequestAware,ServletResponseAware {
    public Long id;

    protected HttpServletRequest request;
    protected HttpSession session ;
    protected HttpServletResponse response ;

    public BaseAction(){}


    public void setServletRequest(HttpServletRequest req) {
        this.request=req;
        this.session = this.request.getSession();
    }
    public void setServletResponse(HttpServletResponse res) {
        this.response=res;
    }
    public HttpServletRequest getRequest() {
        return request;
    }
    public HttpServletResponse getResponse() {
        return response;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }


}
