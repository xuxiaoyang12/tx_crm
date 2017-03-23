package com.kaishengit.mapper;

import com.kaishengit.pojo.Task;
import org.apache.ibatis.annotations.Delete;

import java.util.List;

/**
 * Created by Mxia on 2017/3/23.
 */
public interface TaskMapper {
    List<Task> findAll();

    void save(Task task);


    void delTaskById(Integer id);

    Task findById(Integer id);

    void update(Task task);

    List<Task> findAllByUserId(Integer userId);
}
