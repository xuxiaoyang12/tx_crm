package com.kaishengit.mapper;

import com.kaishengit.pojo.Notice;

import java.util.List;
import java.util.Map;

/**
 * Created by Mxia on 2017/3/18.
 */
public interface NoticeMapper {
    void save(Notice notice);

    List<Notice> findNoticeByQueryname(Map<String, Object> map);

    Long countOfNotice();

    Notice fingNoticeById(Integer noticeId);
}
