package com.demo.question.mapper;

import com.demo.question.entity.AnsShape;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by guoyibin on 8/11/14.
 *
 */
@Repository
public interface AnsShapeMapper {

    public List<AnsShape> findAnsShapeList();

    public void deleteAnsShapeById(Long id);


    public void add(AnsShape ansShape);

    public void update(AnsShape ansShape);
}
