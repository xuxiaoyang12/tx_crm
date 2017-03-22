package com.kaishengit.mapper;

import com.kaishengit.pojo.Role;
import com.kaishengit.pojo.User;
import com.kaishengit.pojo.UserLog;

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

    List<UserLog> findUserLogByQueryName(Map<String, Object> queryName);

    Long countUserLog();

    void saveUserLog(UserLog userLog);


    Long countFilter(Map<String, Object> queryName);
}
