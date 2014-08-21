package com.demo.question.entity;

import com.demo.base.entity.BaseEntity;

/**
 * Created by guoyibin on 8/21/14.
 *
 */
public class KeyWord extends BaseEntity {

    private Long questionId;
    private String keyWord;

    public KeyWord(){}

    public KeyWord(Long questionId,String keyWord){
        this.questionId = questionId;
        this.keyWord = keyWord;
    }

    public Long getQuestionId() {
        return questionId;
    }

    public void setQuestionId(Long questionId) {
        this.questionId = questionId;
    }

    public String getKeyWord() {
        return keyWord;
    }

    public void setKeyWord(String keyWord) {
        this.keyWord = keyWord;
    }
}
