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
import java.util.List;
import java.util.Map;

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

    /**
     * 查询公告列表
     * @param map
     * @return
     */
    @Override
    public List<Notice> findNoticeByQueryname(Map<String, Object> map) {
        return noticeMapper.findNoticeByQueryname(map);
    }

    /*
    公告总数
     */
    @Override
    public Long countOfNotice() {
        return noticeMapper.countOfNotice();
    }

    /**
     * 通过公告id 查询公共详情
     * @param noticeId
     * @return
     */
    @Override
    public Notice findNoticeById(Integer noticeId) {
        return noticeMapper.fingNoticeById(noticeId);
    }
}
