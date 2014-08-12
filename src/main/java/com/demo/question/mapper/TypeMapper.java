package com.demo.question.mapper;

import com.demo.question.entity.Type;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by guoyibin on 8/11/14.
 *
 */
@Repository
public interface TypeMapper {

    public List<Type> findTypeList();

    public void deleteTypeById(Long id);

    public void add(Type type);

    public void update(Type type);
}
