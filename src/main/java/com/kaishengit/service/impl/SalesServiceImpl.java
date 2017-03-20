package com.kaishengit.service.impl;

import com.kaishengit.mapper.SalesMapper;
import com.kaishengit.service.SalesService;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by Mxia on 2017/3/19.
 */
public class SalesServiceImpl implements SalesService {

    @Autowired
    private SalesMapper salesMapper;
}
