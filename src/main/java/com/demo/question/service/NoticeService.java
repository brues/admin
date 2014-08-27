package com.demo.question.service;

import com.demo.question.entity.Notice;
import com.demo.question.mapper.NoticeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by guoyibin on 8/26/14.
 *
 */
@Service
public class NoticeService {

    @Autowired
    private NoticeMapper noticeMapper;


    public List<Notice> findNoticeList() {
        return noticeMapper.findNoticeList();
    }

    public void deleteNoticeById(Long id) {
        noticeMapper.deleteNoticeById(id);
    }

    public void saveOrUpdateNotice(Long id, String nTime, String notice) {
        Notice notices = new Notice();
        notices.setNotice(notice);
        if (id == null) {
            notices.setnTime(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date()));
            noticeMapper.add(notices);
        } else {
            notices.setId(id);
            notices.setnTime(nTime);
            noticeMapper.update(notices);
        }
    }
}
