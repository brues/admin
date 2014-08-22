package com.demo.question.service;

import com.demo.question.entity.KeyWord;
import com.demo.question.mapper.KeyWordMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by guoyibin on 8/21/14.
 *
 */
@Service
public class KeyWordService {

    @Autowired
    private KeyWordMapper keyWordMapper;

    public List<KeyWord> findKeyWordList(Long questionId) {
        return keyWordMapper.findKeyWordList(questionId);
    }

    public void deleteKeyWordById(Long id) {
        keyWordMapper.deleteKeyWordById(id);
    }

    public void saveOrUpdateKeyWord(Long id, Long questionId, String keyWord) {
        KeyWord keyWords = new KeyWord();

        if (questionId!=null&&questionId!=0l){
            keyWords.setQuestionId(questionId);
        }else {
            keyWords.setQuestionId(0l);
        }
        if (keyWord!=null){
            keyWords.setKeyWord(keyWord);
        }else {
            keyWords.setKeyWord("null");
        }

        if (id!=null&&id!=0){
            keyWords.setId(id);
            keyWordMapper.update(keyWords);
        }else{
            keyWordMapper.add(keyWords);
        }
    }
}
