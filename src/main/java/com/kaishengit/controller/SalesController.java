package com.kaishengit.controller;

import com.kaishengit.dto.DataBaseResult;
import com.kaishengit.service.SalesService;
import org.joda.time.DateTime;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 销售机会控制器
 * Created by Mxia on 2017/3/19.
 */
@Controller
@RequestMapping("/sales")
public class SalesController {

   //@Autowired
    //private SalesService salesService;

    @RequestMapping
    public String  list() {

        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        Long time = new Date().getTime();
        System.out.println(format.format(time));
        System.out.println(DateTime.now().toString("yyyy-MM-dd hh:mm:ss"));
       return "sales/list";
    }

    @RequestMapping("/load")
    @ResponseBody
    public DataBaseResult load(HttpServletRequest request) {

        return null;
    }



}
