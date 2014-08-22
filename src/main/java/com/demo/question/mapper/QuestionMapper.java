package com.demo.question.mapper;

import com.demo.question.entity.Question;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by guoyibin on 8/11/14.
 *
 *
 */
@Repository
public interface QuestionMapper {

    public List<Question> findQuestionList();

    public List<Question> searchQuestionList();

    public List<Question> searchResultList(String key);

    public void deleteQuestionById(Long id);

    public void add(Question question);

    public void update(Question question);

    public void deleteRemarkByQuestionId(Long questionId);

    public void deleteKeyWordByQuestionId(Long id);

    public void deleteReplaceWordByQuestionId(Long id);
}
