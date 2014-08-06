package com.demo.basic.mapper;

import com.demo.basic.entity.User;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by guoyibin on 7/25/14.
 *
 */
@Repository
public interface UserMapper {

    public User findByUserNameAndPassword(User user);

    public List<User> userList();

    public void deleteUserById(Long id);

    public void saveUser(User user);

    public void updateUser(User user);
}
