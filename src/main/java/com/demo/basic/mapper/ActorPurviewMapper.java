package com.demo.basic.mapper;

import com.demo.basic.entity.ActorPurview;
import org.springframework.stereotype.Repository;

/**
 * Created by guoyibin on 7/25/14.
 *
 */
@Repository
public interface ActorPurviewMapper {

    public void add(ActorPurview actorPurview);

    public void deleteByActorId(Long actorId);
}
