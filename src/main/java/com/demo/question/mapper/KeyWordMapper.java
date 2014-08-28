package com.demo.question.mapper;

import com.demo.question.entity.KeyWord;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by guoyibin on 8/21/14.
 *
 */
@Repository
public interface KeyWordMapper {

    public List<KeyWord> findKeyWordList(Long questionId);

    public void deleteKeyWordById(Long id);

    public void update(KeyWord keyWords);

    public void add(KeyWord keyWords);

    public List<KeyWord> findByQuestionIdAndKeyword(KeyWord keyWord);
}
