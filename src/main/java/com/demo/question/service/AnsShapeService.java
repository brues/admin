package com.demo.question.service;

import com.demo.question.entity.AnsShape;
import com.demo.question.mapper.AnsShapeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by guoyibin on 8/11/14.
 *
 */
@Service
public class AnsShapeService {

    @Autowired
    private AnsShapeMapper ansShapeMapper;

    public List<AnsShape> findAnsShapeList() {
        return ansShapeMapper.findAnsShapeList();
    }

    public void deleteAnsShapeById(Long id) {
        ansShapeMapper.deleteAnsShapeById(id);
    }

    public void saveOrUpdateAnsShape(Long id, String shape) {
        AnsShape ansShape = new AnsShape();
        ansShape.setShape(shape);
        if (id==null){
            ansShapeMapper.add(ansShape);
        }else{
            ansShape.setId(id);
            ansShapeMapper.update(ansShape);
        }
    }
}
