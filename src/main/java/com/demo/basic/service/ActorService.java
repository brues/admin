package com.demo.basic.service;

import com.demo.basic.entity.Actor;
import com.demo.basic.mapper.ActorMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by guoyibin on 7/25/14.
 */
@Service
public class ActorService {

    @Autowired
    private ActorMapper actorMapper;

    public List<Actor> actorList() {
        return actorMapper.actorList();
    }

    public void deleteActorById(Long id) {
        actorMapper.deleteActorById(id);
        actorMapper.deleteActorPurviewByActorId(id);
    }

    public void saveOrUpdateActor(Actor actor) {
        if (actor.getId()==null||actor.getId()==0){
            actorMapper.addActor(actor);
        }else{
            actorMapper.updateActor(actor);
        }
    }

    public Actor findActorByUserId(Long userId){
        return actorMapper.findActorByUserId(userId);
    }
}
