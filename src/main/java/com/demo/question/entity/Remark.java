package com.demo.question.entity;

import com.demo.base.entity.BaseEntity;

/**
 * Created by guoyibin on 8/11/14.
 */
public class Remark extends BaseEntity {

    private String content;
    private Long questionId;
    private String remarkPer;
    private String remmarkTime;

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

    public String getRemarkPer() {
        return remarkPer;
    }

    public void setRemarkPer(String remarkPer) {
        this.remarkPer = remarkPer;
    }

    public String getRemmarkTime() {
        return remmarkTime;
    }

    public void setRemmarkTime(String remmarkTime) {
        this.remmarkTime = remmarkTime;
    }
}
