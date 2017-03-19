package com.kaishengit.mapper;

import com.kaishengit.pojo.Role;
import com.kaishengit.pojo.User;

import java.util.List;
import java.util.Map;

/**
 * Created by Mxia on 2017/3/15.
 */
public interface UserMapper {

    User findByUsername(String username);


    List<User> findAllByQueryName(Map<String, Object> queryName);



    Long countALl();

    List<User> findAll(Map<String, Object> queryName);

    List<Role> findAllRole();

    User findUserById(Integer userId);

    void save(User user);

    void update(User user);
}
