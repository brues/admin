package com.demo.question.service;

import com.demo.question.entity.WordReplace;
import com.demo.question.mapper.WordReplaceMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by guoyibin on 8/22/14.
 */
@Service
public class WordReplaceService {

    @Autowired
    private WordReplaceMapper wordReplaceMapper;

    public List<WordReplace> findWordReplaceList(Long questionId) {
        return wordReplaceMapper.findWordReplaceList(questionId);
    }

    public void deleteWordReplaceById(Long id) {
        wordReplaceMapper.deleteWordReplaceById(id);
    }

    public void saveOrUpdateWordReplace(Long id, Long questionId, String word, String replaceWord) {
        WordReplace wordReplace = new WordReplace();
        wordReplace.setQuestionId(questionId);
        wordReplace.setWord(word);
        wordReplace.setReplaceWord(replaceWord);
        if (id==null){
            wordReplaceMapper.add(wordReplace);
        }else{
            wordReplace.setId(id);
            wordReplaceMapper.update(wordReplace);
        }
    }
}
