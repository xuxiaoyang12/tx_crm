package com.kaishengit.service;

import com.kaishengit.pojo.Notice;
import com.kaishengit.pojo.User;

/**
 * Created by Mxia on 2017/3/18.
 */
public interface NoticeService {
    void saveNewNotice(User user, Notice notice);
}
