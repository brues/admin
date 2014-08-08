package com.demo.basic.service;

import com.demo.basic.entity.UserActor;
import com.demo.basic.mapper.UserActorMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by guoyibin on 7/25/14.
 *
 */
@Service
public class UserActorService {

    @Autowired
    private UserActorMapper userActorMapper;

    public void saveOrUpdateUserActor(Long userId, Long actorId) {
        List<UserActor> userActorList = userActorMapper.findByUserId(userId);
        if (userActorList.size()==0){
            UserActor userActor = new UserActor();
            userActor.setUserId(userId);
            userActor.setActorId(actorId);
            userActorMapper.add(userActor);
        }else{
            UserActor userActor = new UserActor();
            userActor.setUserId(userId);
            userActor.setActorId(actorId);
            userActorMapper.update(userActor);
        }
    }

    public Long findActorByUserId(Long userId) {
        return userActorMapper.findActorByUserId(userId);
    }

    public void deleteUserActorById(Long id) {
        userActorMapper.deleteUserActorById(id);
    }

    public List<UserActor> userActorList(){
        return userActorMapper.userActorList();
    }
}
