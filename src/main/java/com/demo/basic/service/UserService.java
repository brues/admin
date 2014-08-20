package com.demo.basic.service;

import com.demo.basic.entity.User;
import com.demo.basic.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by guoyibin on 7/25/14.
 *
 */
@Service
public class UserService {

    @Autowired
    private UserMapper userMapper;

    public User findByUserNameAndPassword(String userName, String password) {
        User user = new User();
        user.setUserName(userName);
        user.setPassword(password);
        return userMapper.findByUserNameAndPassword(user);
    }

    public List<User> userList() {
        return userMapper.userList();
    }

    public void deleteUserById(Long id) {
        userMapper.deleteUserById(id);
        userMapper.deleteUserActorByUserId(id);
    }

    public void saveOrUpdateUser(User user) {

        if (user.getId()==null||user.getId()==0){
            user.setRegisterDate(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date()));
            userMapper.saveUser(user);
        }else{
            userMapper.updateUser(user);
        }
    }

    public List<User> findListByUserNameAndPassword(String userName, String password) {
        User user = new User();
        user.setUserName(userName);
        user.setPassword(password);
        return userMapper.findListByUserNameAndPassword(user);
    }
}
