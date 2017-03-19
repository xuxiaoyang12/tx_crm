package com.kaishengit.service;

import com.kaishengit.pojo.Role;
import com.kaishengit.pojo.User;
import com.kaishengit.pojo.UserLog;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by Mxia on 2017/3/15.
 */
@Service
public interface UserService {

    List<User> findAll();

    List<User> findAllByQueryName(Map<String, Object> queryName);

    Long countAll();

    List<Role> findAllRole();

    User findUserById(Integer userId);

    User findUserByUserName(String userName);

    void saveNewUser(User user);

    void update(User user);

    List<UserLog> findUserLogByQueryName(Map<String, Object> queryName);

    Long countUserLog();

    void saveUserLog(UserLog userLog);

    void resetPasswordByUserId(Integer userId);
}
