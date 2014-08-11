package com.demo.basic.mapper;

import com.demo.basic.entity.Purview;
import com.demo.basic.vo.UserPurviewVo;
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

    public List<Purview> findPurviewList();

    public void deletePurviewById(Long id);

    public void add(Purview purview);

    public void update(Purview purview);

    public List<Purview> findByUserIdAndParentId(UserPurviewVo userPurviewVo);
}
