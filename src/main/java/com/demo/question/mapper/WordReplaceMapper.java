package com.demo.question.mapper;

import com.demo.question.entity.WordReplace;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by guoyibin on 8/22/14.
 *
 */
@Repository
public interface WordReplaceMapper {

    public List<WordReplace> findWordReplaceList(Long questionId);

    public void deleteWordReplaceById(Long id);

    public void add(WordReplace wordReplace);

    public void update(WordReplace wordReplace);
}
