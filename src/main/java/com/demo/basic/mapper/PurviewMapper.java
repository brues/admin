package com.demo.basic.mapper;

import com.demo.basic.entity.Purview;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by guoyibin on 7/25/14.
 *
 */
@Repository
public interface PurviewMapper{

    public List<Purview> findListByParentId(Long parentId);

    public Purview findById(Long id);
}
