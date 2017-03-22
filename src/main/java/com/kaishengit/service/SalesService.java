package com.kaishengit.service;

import com.kaishengit.pojo.Sales;
import com.kaishengit.pojo.User;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by Mxia on 2017/3/19.
 */
@Service
public interface SalesService {
    List<Sales> findSalesByQueryName(Map<String, Object> queryNames);

    Long connt();

    Long countFilter(Map<String, Object> queryNames);

    void save(Sales sales, User user);
}
