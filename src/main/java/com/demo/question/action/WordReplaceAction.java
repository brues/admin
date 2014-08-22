package com.demo.question.action;

import com.demo.base.action.BaseAction;
import com.demo.question.entity.WordReplace;
import com.demo.question.service.WordReplaceService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by guoyibin on 8/22/14.
 *
 */
public class WordReplaceAction extends BaseAction {

    private Map map = new HashMap();
    private Long id;
    private Long questionId;
    private String word;
    private String replaceWord;

    @Autowired
    private WordReplaceService wordReplaceService;

    public String wordReplaceList() throws Exception {
        return "wordReplaceList";
    }

    public String findWordReplaceList() throws Exception {
        List<WordReplace> wordReplaceList = wordReplaceService.findWordReplaceList(questionId);
        map.put("total",wordReplaceList.size());
        map.put("rows",wordReplaceList);
        return "findWordReplaceList";
    }

    public String deleteWordReplaceById() throws Exception {
        wordReplaceService.deleteWordReplaceById(id);
        return "deleteWordReplaceById";
    }

    public String saveOrUpdateWordReplace() throws Exception {
        wordReplaceService.saveOrUpdateWordReplace(id,questionId,word,replaceWord);
        return "saveOrUpdateWordReplace";
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

    public Long getQuestionId() {
        return questionId;
    }

    public void setQuestionId(Long questionId) {
        this.questionId = questionId;
    }

    public String getWord() {
        return word;
    }

    public void setWord(String word) {
        this.word = word;
    }

    public String getReplaceWord() {
        return replaceWord;
    }

    public void setReplaceWord(String replaceWord) {
        this.replaceWord = replaceWord;
    }
}
