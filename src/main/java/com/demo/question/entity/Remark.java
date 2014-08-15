package com.demo.question.entity;

import com.demo.base.entity.BaseEntity;

/**
 * Created by guoyibin on 8/11/14.
 *
 * 问题备注
 */
public class Remark extends BaseEntity {

    private String content;//备注内容
    private Long questionId;//问题id
    private Long remarkPer;//备注人
    private String remmarkTime;//备注时间

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Long getQuestionId() {
        return questionId;
    }

    public void setQuestionId(Long questionId) {
        this.questionId = questionId;
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
