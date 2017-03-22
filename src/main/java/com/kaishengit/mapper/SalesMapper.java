package com.kaishengit.mapper;

import com.kaishengit.pojo.Sales;

import java.util.List;
import java.util.Map;

/**
 * Created by Mxia on 2017/3/19.
 */
public interface SalesMapper {

    List<Sales> findSalesByQueryName(Map<String, Object> queryNames);

    Long count();

    Long conntFilter(Map<String, Object> queryNames);

    void save(Sales sales);
}
