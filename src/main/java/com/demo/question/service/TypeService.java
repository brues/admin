package com.demo.question.service;

import com.demo.question.entity.Type;
import com.demo.question.mapper.TypeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by guoyibin on 8/11/14.
 */
@Service
public class TypeService {

    @Autowired
    private TypeMapper typeMapper;

    public List<Type> findTypeList() {
        return typeMapper.findTypeList();
    }

    public void deleteTypeById(Long id) {
        typeMapper.deleteTypeById(id);
    }

    public void saveOrUpdateType(Long id, String name) {
        Type type = new Type();
        if (id==null){
            type.setName(name);
            typeMapper.add(type);
        }else{
            type.setName(name);
            type.setId(id);
            typeMapper.update(type);
        }
    }
}
