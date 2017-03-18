package com.kaishengit.service.impl;

import com.kaishengit.exception.ServiceException;
import com.kaishengit.mapper.NoticeMapper;
import com.kaishengit.pojo.Notice;
import com.kaishengit.pojo.User;
import com.kaishengit.service.NoticeService;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.Date;

/**
 * Created by Mxia on 2017/3/18.
 */
@Service
public class NoticeServiceImpl implements NoticeService {

    @Autowired
    private NoticeMapper noticeMapper;
    /**
     * 新增公告
     * @param user
     * @param notice
     */
    @Override
    public void saveNewNotice(User user, Notice notice) {
        notice.setRealName(user.getRealName());

        notice.setCreateTime(new Timestamp(new DateTime().getMillis()).toString());

        notice.setUserId(user.getId());
        try{
            noticeMapper.save(notice);
        }catch(ServiceException e) {
            throw new ServiceException("sql执行异常");
        }


    }
}
