package com.kaishengit.service;

import com.kaishengit.pojo.Notice;
import com.kaishengit.pojo.User;

import java.util.List;
import java.util.Map;

/**
 * Created by Mxia on 2017/3/18.
 */
public interface NoticeService {
    void saveNewNotice(User user, Notice notice);

    List<Notice> findNoticeByQueryname(Map<String, Object> map);

    Long countOfNotice();

    Notice findNoticeById(Integer noticeId);
}
