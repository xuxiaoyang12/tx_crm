package com.kaishengit.mapper;

import com.kaishengit.pojo.User;

/**
 * Created by Mxia on 2017/3/15.
 */
public interface UserMapper {

    User findByUsername(String username);
}
