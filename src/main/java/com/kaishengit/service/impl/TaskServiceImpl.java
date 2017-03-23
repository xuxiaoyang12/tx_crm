package com.kaishengit.service.impl;

import com.kaishengit.mapper.TaskMapper;
import com.kaishengit.pojo.Task;
import com.kaishengit.service.TaskService;
import com.kaishengit.util.ShiroUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Mxia on 2017/3/23.
 */
@Service
public class TaskServiceImpl implements TaskService {

    @Autowired
    private TaskMapper taskMapper;

    @Override
    public List<Task> findAll() {
        return taskMapper.findAll();
    }

    @Override
    public void save(Task task, String hour, String minute) {
        //添加用户id
        task.setUserId(ShiroUtils.getCurrentId());
        //获取提示时间
        if(StringUtils.isNotEmpty(hour) && StringUtils.isNotEmpty(minute)) {
            String reminderTime = task.getStart()+" "+hour+":"+minute+":00";
            task.setReminderTime(reminderTime);
            taskMapper.save(task);

            //TODO  加提醒时间

        }else{

            task.setDone(false);
            taskMapper.save(task);
        }
    }

    @Override
    public void delTaskById(Integer id) {
        taskMapper.delTaskById(id);
    }

    @Override
    public void update(Integer id) {
        Task task = taskMapper.findById(id);
        task.setDone(true);
        String color = "#cccccc";
        task.setColor(color);
        taskMapper.update(task);
    }

    @Override
    public void update(Integer id, String start, String end) {
        //TODo 更改提醒时间
        Task task = taskMapper.findById(id);
        task.setStart(start);
        task.setEnd(end);
        taskMapper.update(task);
    }

    @Override
    public List<Task> findAllByUserId(Integer userId) {
        return taskMapper.findAllByUserId(userId);
    }
}
