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

    public void saveOrUpdateKeyWord(Long id, Long questionId, String keyWord, String[] anshuizhong, String[] anredianwenti) {
        if (id!=null&&id!=0){
            KeyWord keyWords1 = new KeyWord();
            keyWords1.setId(id);
            keyWords1.setQuestionId(questionId);
            if (keyWord!=null){
                keyWords1.setKeyWord(keyWord);
            }else{
                keyWords1.setKeyWord("null");
            }
            if (keyWordMapper.findByQuestionIdAndKeyword(keyWords1).size()<=0){
                keyWordMapper.update(keyWords1);
            }
        }else{

            if (anredianwenti!=null&&anredianwenti.length>0){
                for (int i = 0; i < anredianwenti.length; i++) {
                    KeyWord keyWords3 = new KeyWord();
                    keyWords3.setQuestionId(questionId);
                    keyWords3.setKeyWord(anredianwenti[i]);
                    if (keyWordMapper.findByQuestionIdAndKeyword(keyWords3).size()<=0) {
                        keyWordMapper.add(keyWords3);
                    }
                }
            }
            if (anshuizhong!=null&&anshuizhong.length>0){
                for (int i = 0; i < anshuizhong.length; i++) {
                    KeyWord keyWords4 = new KeyWord();
                    keyWords4.setQuestionId(questionId);
                    keyWords4.setKeyWord(anshuizhong[i]);
                    if (keyWordMapper.findByQuestionIdAndKeyword(keyWords4).size()<=0) {
                        keyWordMapper.add(keyWords4);
                    }
                }
            }
            if (keyWord!=null&&!keyWord.equals("")){
                KeyWord keyWords2 = new KeyWord();
                keyWords2.setQuestionId(questionId);
                keyWords2.setKeyWord(keyWord);
                if (keyWordMapper.findByQuestionIdAndKeyword(keyWords2).size()<=0) {
                    keyWordMapper.add(keyWords2);
                }
            }


        }
    }


}
