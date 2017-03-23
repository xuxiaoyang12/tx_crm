package com.kaishengit.service;

import com.kaishengit.pojo.Task;

import java.util.List;

/**
 * Created by Mxia on 2017/3/23.
 */
public interface TaskService {
    List<Task> findAll();

    void save(Task task, String hour, String minute);

    void delTaskById(Integer id);

    void update(Integer id);

    void update(Integer id, String start, String end);

    List<Task> findAllByUserId(Integer userId);
}
