package com.demo.basic.service;

import com.demo.basic.entity.ActorPurview;
import com.demo.basic.mapper.ActorPurviewMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by guoyibin on 7/25/14.
 */
@Service
public class ActorPurviewService {

    @Autowired
    private ActorPurviewMapper actorPurviewMapper;

    public void add(Long actorId, Long purviewId) {
        ActorPurview actorPurview = new ActorPurview();
        actorPurview.setActorId(actorId);
        actorPurview.setPurviewId(purviewId);
        actorPurviewMapper.add(actorPurview);
    }

    public void deleteByActorId(Long actorId) {
        actorPurviewMapper.deleteByActorId(actorId);
    }
}
