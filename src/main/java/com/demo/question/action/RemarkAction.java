package com.demo.question.action;

import com.demo.base.action.BaseAction;
import com.demo.basic.entity.User;
import com.demo.question.entity.Remark;
import com.demo.question.service.RemarkService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by guoyibin on 8/11/14.
 *
 *
 */
public class RemarkAction extends BaseAction {

    private Long questionId;
    private Map map = new HashMap();
    private String content;
    private Long remarkPer;
    private String remmarkTime;

    @Autowired
    private RemarkService remarkService;

    public String remarkList() throws Exception {
        return "remarkList";
    }

    public String findRemarkList() throws Exception {
        List<Remark> remarkList = remarkService.findRemarkList(questionId);
        map.put("total",remarkList.size());
        map.put("rows",remarkList);
        return "findRemarkList";
    }

    public String deleteRemarkById() throws Exception {
        remarkService.deleteRemarkById(id);
        return "deleteRemarkById";
    }

    public String saveOrUpdateRemark() throws Exception {
        if (remarkPer==null){
            remarkPer = ((User)session.getAttribute("admin_user")).getId();
        }
        remarkService.saveOrUpdateRemark(id,content,questionId,remarkPer,remmarkTime);
        return "saveOrUpdateRemark";
    }

    public Long getQuestionId() {
        return questionId;
    }

    public void setQuestionId(Long questionId) {
        this.questionId = questionId;
    }

    public Map getMap() {
        return map;
    }

    public void setMap(Map map) {
        this.map = map;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getRemmarkTime() {
        return remmarkTime;
    }

    public void setRemmarkTime(String remmarkTime) {
        this.remmarkTime = remmarkTime;
    }

    public Long getRemarkPer() {
        return remarkPer;
    }

    public void setRemarkPer(Long remarkPer) {
        this.remarkPer = remarkPer;
    }
}
