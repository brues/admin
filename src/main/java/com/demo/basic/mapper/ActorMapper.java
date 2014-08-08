package com.demo.basic.mapper;

import com.demo.basic.entity.Actor;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by guoyibin on 7/25/14.
 *
 */
@Repository
public interface ActorMapper{

    public List<Actor> actorList();

    public void deleteActorById(Long id);

    public void addActor(Actor actor);

    public void updateActor(Actor actor);

    public void deleteActorPurviewByActorId(Long id);
}
