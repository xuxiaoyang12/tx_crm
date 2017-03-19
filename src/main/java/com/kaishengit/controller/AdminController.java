package com.kaishengit.controller;

import com.google.common.collect.Maps;
import com.kaishengit.dto.DataBaseResult;
import com.kaishengit.dto.JSONResult;
import com.kaishengit.exception.ServiceException;
import com.kaishengit.pojo.Role;
import com.kaishengit.pojo.User;
import com.kaishengit.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * 管理员登录系统
 * Created by Mxia on 2017/3/18.
 */
@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private UserService userService;

    @RequestMapping("/users")
    public String list(Model model) {
        //获取角色列表
        List<Role> roleList = userService.findAllRole();
       model.addAttribute("roleList",roleList);
        return "admin/userList";
    }

    /**
     * 获取用户列表
     * @param request
     * @return
     */
    @RequestMapping("/list")
    @ResponseBody
    public DataBaseResult userList(HttpServletRequest request) {
        String draw = request.getParameter("draw");
        String start = request.getParameter("start");
        String length = request.getParameter("length");

        Map<String,Object> queryName = Maps.newHashMap();
        queryName.put("start",start);
        queryName.put("length",length);

        //通过参数查询 用户列表
        List<User> userList = userService.findAllByQueryName(queryName);

        //查询用户总数量
        Long count = userService.countAll();

        return new DataBaseResult(draw,count,count,userList);

    }

    @RequestMapping("/user/{id:\\d+}.json")
    @ResponseBody
    public JSONResult findUserById(@PathVariable("id") Integer userId) {
        //查询用户数据
        User user = userService.findUserById(userId);

        if(user == null) {
            return new  JSONResult("用户"+userId+"找不到");
        }else{
            return new JSONResult(JSONResult.SUCCESS,user);
        }
    }

    /**
     * 远程检查用户名是否被占用
     */
    @RequestMapping("/user/checkUserName")
    @ResponseBody
    public String checkUserName(String userName) {
        //验证用户名是否可用
        User user = userService.findUserByUserName(userName);
        if(user == null) {
            return "true";
        }
        return "false";
    }

    /**
     * 保存新增用户
     */
    @RequestMapping(value = "/user/new",method = RequestMethod.POST)
    @ResponseBody
    public String  saveNewUser(User user) {
        //获取用户数据

            userService.saveNewUser(user);
            return "success";

    }

    @RequestMapping(value = "/user/edit",method = RequestMethod.POST)
    @ResponseBody
    public String edit(User user) {
            userService.update(user);
            return "success";
    }
}
