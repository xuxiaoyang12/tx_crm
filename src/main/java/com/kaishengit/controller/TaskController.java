package com.kaishengit.controller;

import com.kaishengit.dto.JSONResult;
import com.kaishengit.pojo.Task;
import com.kaishengit.service.TaskService;
import com.kaishengit.util.ShiroUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by Mxia on 2017/3/22.
 */
@Controller
@RequestMapping("/task")
public class TaskController {
    @Autowired
    private TaskService taskService;

    @RequestMapping
    public String list() {
        return "task/list";
    }

    @RequestMapping("/list")
    @ResponseBody
    public List<Task>   taskList() {
        Integer userId = ShiroUtils.getCurrentId();
        //获取当前用户代办事项列表
       // List<Task> taskList =taskService.findAll();
        List<Task> taskList = taskService.findAllByUserId(userId);
       // String json = new Gson().toJson(taskList);
        return taskList;
    }

    @RequestMapping(value = "/new",method = RequestMethod.POST)
    @ResponseBody
    public JSONResult newTask(Task task,String hour,String minute) {

        taskService.save(task,hour,minute);

        return new JSONResult(JSONResult.SUCCESS,task);
    }

    //删除代办事项
    @RequestMapping(value = "/del",method = RequestMethod.POST)
    @ResponseBody
    public JSONResult delTask(Integer id) {
        taskService.delTaskById(id);

        return new JSONResult(JSONResult.SUCCESS,JSONResult.SUCCESS);
    }

    //标记代办事项
    @RequestMapping(value = "/edit",method = RequestMethod.POST)
    @ResponseBody
    public JSONResult editTask(Integer id) {
        taskService.update(id);

        return new JSONResult(JSONResult.SUCCESS,JSONResult.SUCCESS);
    }

    //拖动代办事项
    @RequestMapping(value = "/drop",method = RequestMethod.POST)
    @ResponseBody
    public JSONResult dropTask(Integer id,String start,String end) {
        taskService.update(id,start,end);

        return new JSONResult(JSONResult.SUCCESS,JSONResult.SUCCESS);
    }
}
