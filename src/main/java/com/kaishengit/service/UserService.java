package com.kaishengit.service;

import com.kaishengit.pojo.Role;
import com.kaishengit.pojo.User;
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
}
