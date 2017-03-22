package com.kaishengit.controller;

import com.google.common.collect.Maps;
import com.kaishengit.dto.DataBaseResult;
import com.kaishengit.dto.JSONResult;
import com.kaishengit.pojo.Sales;
import com.kaishengit.pojo.User;
import com.kaishengit.service.SalesService;
import com.kaishengit.util.ShiroUtils;
import org.joda.time.DateTime;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 销售机会控制器
 * Created by Mxia on 2017/3/19.
 */
@Controller
@RequestMapping("/sales")
public class SalesController {

   @Autowired
    private SalesService salesService;

    @RequestMapping
    public String  list() {

        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        Long time = new Date().getTime();
        System.out.println(format.format(time));
        System.out.println(DateTime.now().toString("yyyy-MM-dd hh:mm:ss"));

        //查询所有客户信息
        //TODO 查询所所有客户传入list中
       return "sales/list";
    }

    @RequestMapping("/load")
    @ResponseBody
    public DataBaseResult load(HttpServletRequest request) {
        String draw = request.getParameter("draw");
        String start = request.getParameter("start");
        String length = request.getParameter("length");

        String name = request.getParameter("name");
        String progress = request.getParameter("progress");
        String startTime = request.getParameter("startTime");
        String endTime = request.getParameter("endTime");

        System.out.println(name);
        System.out.println(progress);
        System.out.println(startTime);
        System.out.println(endTime);

        Map<String,Object> queryNames = Maps.newHashMap();
        queryNames.put("start",start);
        queryNames.put("length",length);
        queryNames.put("name",name);
        queryNames.put("progress",progress);
        queryNames.put("startTime",startTime);
        queryNames.put("endTime",endTime);

        List<Sales> salesList = salesService.findSalesByQueryName(queryNames);
        Long count = salesService.connt();
        Long countFilter = salesService.countFilter(queryNames);

        return new DataBaseResult(draw,count,countFilter,salesList);

    }

    @RequestMapping("/new")
    @ResponseBody
    public JSONResult newSales(Sales sales) {
        //保存新的机会
        User user = ShiroUtils.getCurrentUser();
        salesService.save(sales,user);

        return new JSONResult(JSONResult.SUCCESS,JSONResult.SUCCESS);
    }



}
