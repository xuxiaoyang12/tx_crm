package com.kaishengit.controller;

import com.google.common.collect.Maps;
import com.kaishengit.dto.DataBaseResult;
import com.kaishengit.exception.ServiceException;
import com.kaishengit.pojo.Notice;
import com.kaishengit.pojo.User;
import com.kaishengit.service.NoticeService;
import com.kaishengit.util.ShiroUtils;
import com.qiniu.util.Auth;
import com.qiniu.util.StringMap;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.w3c.dom.html.HTMLModElement;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.util.List;
import java.util.Map;

/**
 * 公告控制器
 * Created by Mxia on 2017/3/18.
 */
@Controller
@RequestMapping("/notice")
public class NoticeController {

    @Value("${filePath}")
    private String filePath;
    @Value("${qiniu.ak}")
    private String ak;
    @Value("${qiniu.sk}")
    private String sk;
    @Value("${qiniu.bucket}")
    private String bucket;
    @Value("${qiniu.domain}")
    private String url;

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
    public String newNotice(Model model) {
        //获取文件长传的token
        Auth auth = Auth.create(ak,sk);
        //String token =auth.uploadToken(bucket);
        StringMap stringMap = new StringMap();
        //给七妞云制定返回的东西
       // "{ \"success\": true,\"file_path\": \""+Config.get("qiniu.domain")+"${key}\"}"
        stringMap.put("returnBody","{\"success\":true,\"file_path\":\""+url+"${key}\"}");
        String token = auth.uploadToken(bucket,null,3600,stringMap);

        model.addAttribute("token",token);
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

    @RequestMapping("/load")
    @ResponseBody
    public DataBaseResult load(HttpServletRequest request) {
        //获取dataBase的传入的参数
        String draw = request.getParameter("draw");
        String start = request.getParameter("start");
        String length = request.getParameter("length");

        Map<String,Object> map = Maps.newHashMap();
        map.put("draw",draw);
        map.put("start",start);
        map.put("length",length);

        //通过数据查询公告列表
        List<Notice>  noticeList = noticeService.findNoticeByQueryname(map);

        //查询公告列表总数
        Long count = noticeService.countOfNotice();


        return  new DataBaseResult(draw,count,count,noticeList);
    }

    @RequestMapping("/{id}")
    public String findNoticeById(@PathVariable("id") Integer noticeId, Model model) {

        Notice notice = noticeService.findNoticeById(noticeId);
        model.addAttribute("notice",notice);

        return "notice/detail";
    }

    //图片上传
    @RequestMapping(value = "/upload",method = RequestMethod.POST)
    @ResponseBody
    public String upload (MultipartFile file) throws IOException {

        //保存文件
        String sourceName = file.getName();
        String contentType = file.getContentType();
        String originalName = file.getOriginalFilename();
        System.out.println(sourceName+""+contentType);
        System.out.println(originalName);

        //获取输入流
        InputStream inputStream = file.getInputStream();
        OutputStream outputStream = new FileOutputStream(new File(filePath+originalName));

        IOUtils.copy(inputStream,outputStream);
        outputStream.flush();
        outputStream.close();
        inputStream.close();
        return "true";

    }

}
