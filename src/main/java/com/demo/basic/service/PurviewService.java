package com.demo.basic.service;

import com.demo.basic.entity.Purview;
import com.demo.basic.mapper.PurviewMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by guoyibin on 7/25/14.
 *
 *
 */
@Service
public class PurviewService {

    @Autowired
    private PurviewMapper purviewDao;

    public List<Purview> findListByParentId(Long parentId) {
        return purviewDao.findListByParentId(parentId);
    }


    public Purview findById(Long id){
        return purviewDao.findById(id);
    }

    public List<Purview> findPurviewList() {
        return purviewDao.findPurviewList();
    }

    public void deletePurviewById(Long id) {
        purviewDao.deletePurviewById(id);
    }

    public void saveOrUpdatePurview(Purview purview) {
        if (purview.getId()==null){
            purviewDao.add(purview);
        }else{
            purviewDao.update(purview);
        }
    }
}
