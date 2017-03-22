package com.kaishengit.service.impl;

import com.kaishengit.mapper.SalesMapper;
import com.kaishengit.pojo.Sales;
import com.kaishengit.pojo.User;
import com.kaishengit.service.SalesService;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by Mxia on 2017/3/19.
 */
@Service
public class SalesServiceImpl implements SalesService {

    @Autowired
    private SalesMapper salesMapper;

    @Override
    public List<Sales> findSalesByQueryName(Map<String, Object> queryNames) {
        return salesMapper.findSalesByQueryName(queryNames);
    }

    @Override
    public Long connt() {
        return salesMapper.count();
    }

    @Override
    public Long countFilter(Map<String, Object> queryNames) {
        return salesMapper.conntFilter(queryNames);
    }

    @Override
    @Transactional
    public void save(Sales sales, User user) {
        sales.setUserName(user.getRealName());
        sales.setUserId(user.getId());
        sales.setLastTime(Timestamp.valueOf(DateTime.now().toString("yyyy-MM-dd hh:mm:ss")));

        salesMapper.save(sales);
    }
}
