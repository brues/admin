package com.demo.question.action;

import com.demo.base.action.BaseAction;
import com.demo.question.entity.Notice;
import com.demo.question.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by guoyibin on 8/26/14.
 */
public class NoticeAction extends BaseAction {

    private Long id;

    private String nTime;

    private String notice;

    private Map map = new HashMap();

    @Autowired
    private NoticeService noticeService;

    public String noticeList() throws Exception {
        return "noticeList";
    }


    public String findNoticeList() throws Exception {
        List<Notice> noticeList = noticeService.findNoticeList();
        map.put("total",noticeList.size());
        map.put("rows",noticeList);
        return "findNoticeList";
    }

    public String deleteNoticeById() throws Exception {
        noticeService.deleteNoticeById(id);
        return "deleteNoticeById";
    }

    public String saveOrUpdateNotice() throws Exception {
        noticeService.saveOrUpdateNotice(id,nTime,notice);
        return "saveOrUpdateNotice";
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

    public String getnTime() {
        return nTime;
    }

    public void setnTime(String nTime) {
        this.nTime = nTime;
    }

    public String getNotice() {
        return notice;
    }

    public void setNotice(String notice) {
        this.notice = notice;
    }



}
