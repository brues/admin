package com.demo.question.service;

import com.demo.question.entity.Remark;
import com.demo.question.mapper.RemarkMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by guoyibin on 8/11/14.
 *
 */
@Service
public class RemarkService {

    @Autowired
    private RemarkMapper remarkMapper;

    public List<Remark> findRemarkList(Long questionId) {
        return remarkMapper.findRemarkList(questionId);
    }

    public void deleteRemarkById(Long id) {
        remarkMapper.deleteRemarkById(id);
    }

    public void saveOrUpdateRemark(Long id, String content, Long questionId, Long remarkPer, String remmarkTime) {
        Remark remark = new Remark();
        remark.setContent(content);
        if (id==null){
            remark.setQuestionId(questionId);
            remark.setRemmarkTime(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date()));
            remark.setRemarkPer(remarkPer);
            remarkMapper.add(remark);
        }else{
            remark.setRemmarkTime(remmarkTime);
            remark.setId(id);
            remark.setQuestionId(questionId);
            remark.setRemarkPer(remarkPer);
            remarkMapper.update(remark);
        }
    }
}
