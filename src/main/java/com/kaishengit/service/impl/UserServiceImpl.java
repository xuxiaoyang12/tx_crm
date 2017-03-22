package com.kaishengit.service.impl;

import com.kaishengit.exception.ServiceException;
import com.kaishengit.mapper.UserMapper;
import com.kaishengit.pojo.Role;
import com.kaishengit.pojo.User;
import com.kaishengit.pojo.UserLog;
import com.kaishengit.service.UserService;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

/**
 * Created by Mxia on 2017/3/15.
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    /**
     * 查询所有用户
     * @return
     */
    @Override
    public List<User> findAll() {

       return null;
    }

    /**
     * 获取用户列表 datebase
     * @param queryName
     * @return
     */
    @Override
    public List<User> findAllByQueryName(Map<String, Object> queryName) {

        return userMapper.findAllByQueryName(queryName);
       // return userMapper.findAll(queryName);
    }

    /**
     * 获取用户总数量
     * @return
     */
    @Override
    public Long countAll() {
        return userMapper.countALl();
    }

    /**
     * 获取角色
     * @return
     */
    @Override
    public List<Role> findAllRole() {
        return userMapper.findAllRole();
    }

    @Override
    public User findUserById(Integer userId) {
        return userMapper.findUserById(userId);
    }

    @Override
    public User findUserByUserName(String userName) {
        return userMapper.findByUsername(userName);
    }

    @Override
    public void saveNewUser(User user) {
        user.setCreateTime(new Timestamp(new DateTime().getMillis()).toString());
        user.setState(1);

        userMapper.save(user);

    }

    @Override
    public void update(User user) {


            userMapper.update(user);

    }

    /**
     * 获取日志列表
     * @param queryName
     * @return
     */
    @Override
    public List<UserLog> findUserLogByQueryName(Map<String, Object> queryName) {
        return userMapper.findUserLogByQueryName(queryName);
    }

    /**
     * 获取日志总数
     * @return
     */
    @Override
    public Long countUserLog() {
        return userMapper.countUserLog();
    }

    @Override
    public void saveUserLog(UserLog userLog) {
        userMapper.saveUserLog(userLog);
    }

    /**
     * 重置密码
     * @param userId
     */
    @Override
    public void resetPasswordByUserId(Integer userId) {

        User user = userMapper.findUserById(userId);
        if(user==null){
            throw new ServiceException("用户被删除或者不存在");
        }
        user.setPassword("666666");
        userMapper.update(user);
    }

    @Override
    public Long countFilter(Map<String, Object> queryName) {
        return userMapper.countFilter(queryName);
    }
}
