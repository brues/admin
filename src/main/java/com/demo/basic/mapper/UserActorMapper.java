package com.demo.basic.mapper;

import com.demo.basic.entity.UserActor;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by guoyibin on 7/25/14.
 *
 */
@Repository
public interface UserActorMapper{

    public void update(UserActor userActor);

    public List<UserActor> findByUserId(Long userId);

    public void add(UserActor userActor);

    public Long findActorByUserId(Long userId);

    public void deleteUserActorById(Long id);

    public List<UserActor> userActorList();
}
