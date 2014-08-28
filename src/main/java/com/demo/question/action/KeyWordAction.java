package com.demo.question.action;

import com.demo.base.action.BaseAction;
import com.demo.question.entity.KeyWord;
import com.demo.question.service.KeyWordService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by guoyibin on 8/21/14.
 *
 */
public class KeyWordAction extends BaseAction {

    private Long id;
    private Long questionId;
    private String keyWord;

    private String[] anshuizhong;
    private String[] anredianwenti;

    Map map = new HashMap();


    @Autowired
    private KeyWordService keyWordService;

    public String keyWordList() throws Exception {
        return "keyWordList";
    }

    public String findKeyWordList() throws Exception {
        List<KeyWord> keyWordList  = keyWordService.findKeyWordList(questionId);
        map.put("total",keyWordList.size());
        map.put("rows",keyWordList);
        return "findKeyWordList";
    }


    public String deleteKeyWordById() throws Exception {
        keyWordService.deleteKeyWordById(id);
        return "deleteKeyWordById";
    }

    public String saveOrUpdateKeyWord() throws Exception {
        keyWordService.saveOrUpdateKeyWord(id,questionId,keyWord,anshuizhong,anredianwenti);
        return "saveOrUpdateKeyWord";
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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

    public Map getMap() {
        return map;
    }

    public void setMap(Map map) {
        this.map = map;
    }

    public String[] getAnshuizhong() {
        return anshuizhong;
    }

    public void setAnshuizhong(String[] anshuizhong) {
        this.anshuizhong = anshuizhong;
    }

    public String[] getAnredianwenti() {
        return anredianwenti;
    }

    public void setAnredianwenti(String[] anredianwenti) {
        this.anredianwenti = anredianwenti;
    }
}
