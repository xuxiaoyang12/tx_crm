package com.kaishengit.controller;

import com.kaishengit.pojo.UserLog;
import com.kaishengit.service.UserService;
import com.kaishengit.util.ShiroUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by Mxia on 2017/3/15.
 */
@Controller
public class HomeController {

    @Autowired
    private UserService userService;


    @RequestMapping(value = "/",method = RequestMethod.GET)
    public String login(){

        return "user/login";
    }


    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String login(String username, String password,
                        RedirectAttributes redirectAttributes, HttpServletRequest request){
        //使用shiro方式进行登录
        Subject subject = SecurityUtils.getSubject();

        try {
            subject.login(new UsernamePasswordToken(username, password));
            //登录成功后保存登录日志
            UserLog userLog = new UserLog();
            String ip = request.getRemoteAddr();//获取登录ip
            userLog.setLoginIp(ip);
            userLog.setLoginTime( DateTime.now().toString("YYYY-MM-DD hh:mm:ss"));
            userLog.setUserId(ShiroUtils.getCurrentId());

            userService.saveUserLog(userLog);
            return "redirect:/home";
        }catch(AuthenticationException e){
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("message","账号或密码错误");
            return "redirect:/";
        }
    }

    @GetMapping("/home")
    public String home(){

        return "home";
    }
    /**
     * 权限不足弹回的页面
     *
     */
    @RequestMapping("/403")
    public String  permissionDenied(RedirectAttributes redirectAttributes){
        redirectAttributes.addFlashAttribute("message","用户权限不足");
        return "redirect: /";
    }

    /**
     * 安全退出
     * @return
     */
    @RequestMapping("/logout")
    public String logout(RedirectAttributes redirectAttributes) {
        SecurityUtils.getSubject().logout();
        redirectAttributes.addFlashAttribute("message","已安全退出");
        return "redirect:/";


    }
}
