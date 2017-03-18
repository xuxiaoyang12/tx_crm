package com.kaishengit.util;

import com.kaishengit.pojo.User;
import org.apache.shiro.SecurityUtils;

/**
 * shiro工具类
 * Created by Mxia on 2017/3/18.
 */
public class ShiroUtils {


    /**
     * 获取当前用户
     * @return
     */
    public static User getCurrentUser() {
        return (User) SecurityUtils.getSubject().getPrincipal();
    }

    public static String  getCurrentName() {
        return getCurrentUser().getUserName();
    }

    public static Integer getCurrentId() {
        return getCurrentUser().getId();
    }

    public static String getCurrentRealName() {
        return getCurrentUser().getRealName();
    }




}
