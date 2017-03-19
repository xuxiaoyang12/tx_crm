package com.kaishengit.controller;

import com.google.common.collect.Maps;
import com.kaishengit.dto.DataBaseResult;
import com.kaishengit.dto.JSONResult;
import com.kaishengit.exception.ServiceException;
import com.kaishengit.pojo.User;
import com.kaishengit.pojo.UserLog;
import com.kaishengit.service.UserService;
import com.kaishengit.util.ShiroUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * Created by Mxia on 2017/3/19.
 */
@Controller
@RequestMapping("/user")
public class UserController {


    @Autowired
    private UserService userService;

    /**
     * 更改用户密码
     * @param model
     * @return
     */
    @RequestMapping("/password")
    public String editPassword(Model model) {
        String oldPassword = ShiroUtils.getCurrentUser().getPassword();
        model.addAttribute("oldPassword",oldPassword);
        return "user/resetPassword";
    }

    /**
     * 修改密码
     * @param oldPassword
     * @param newPassword
     * @return
     */
    @RequestMapping(value = "/password",method = RequestMethod.POST)
    @ResponseBody
    public String resetPassword(String oldPassword,String newPassword) {
        //验证旧密码是否一致

        User user = ShiroUtils.getCurrentUser();
        String oldPasswordShiro = ShiroUtils.getCurrentUser().getPassword();
        System.out.println(oldPasswordShiro);
        if(oldPasswordShiro.equals(oldPassword)){
            user.setPassword(newPassword);
            //更改密码
            userService.update(user);
            return "success";
        }else{
            return "error";
        }
    }

    /**
     * 查看用户登录日志
     * @return
     */
    @RequestMapping("/log")
    public String userLogList() {
        return "user/log";
    }

    @RequestMapping(value = "/log/list")
    @ResponseBody
    public DataBaseResult logList(HttpServletRequest request) {

        String draw = request.getParameter("draw");
        String start = request.getParameter("start");
        String length = request.getParameter("length");

        Map<String,Object> queryName = Maps.newHashMap();
        queryName.put("start",start);
        queryName.put("length",length);

        //获取日志列表
        List<UserLog> userLogList  = userService.findUserLogByQueryName(queryName);

        Long count = userService.countUserLog();


        return new DataBaseResult(draw,count,count,userLogList);
    }


    /**
     * 重置密码
     */
    @RequestMapping("/reset/{id:\\d+}.json")
    @ResponseBody
    public JSONResult resetPassword(@PathVariable("id") Integer userId) {


        try {
            userService.resetPasswordByUserId(userId);
            return new JSONResult(JSONResult.SUCCESS,userId);
        } catch (ServiceException e) {
            return new JSONResult(e.getMessage());
        }


    }



}
