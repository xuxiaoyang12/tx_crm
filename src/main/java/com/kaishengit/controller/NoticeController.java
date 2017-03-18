package com.kaishengit.controller;

import com.kaishengit.exception.ServiceException;
import com.kaishengit.pojo.Notice;
import com.kaishengit.pojo.User;
import com.kaishengit.service.NoticeService;
import com.kaishengit.util.ShiroUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * 公告控制器
 * Created by Mxia on 2017/3/18.
 */
@Controller
@RequestMapping("/notice")
public class NoticeController {

    @Autowired
    private NoticeService noticeService;
    /**
     * 公告列表
     * @return
     */
    @RequestMapping
    public String list() {

        return "notice/list";
    }


    /**
     * 新增公告
     */
    @RequestMapping("/new")
    public String newNotice() {

        return "notice/new";
    }

    /**
     * 添加公告
     */
    @RequestMapping(value = "/new",method = RequestMethod.POST)
    public String newNotice(Notice notice, RedirectAttributes redirectAttributes) {

        //获取当前用户
        User user = ShiroUtils.getCurrentUser();
        //保存新增公告
        try{
            noticeService.saveNewNotice(user,notice);
        }catch (ServiceException e) {
            redirectAttributes.addFlashAttribute("message","发布失败");
        }
        redirectAttributes.addFlashAttribute("message","发布成功");
        return "redirect:/notice";
    }

}
