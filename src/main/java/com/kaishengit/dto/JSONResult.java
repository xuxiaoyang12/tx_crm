package com.kaishengit.dto;

import com.fasterxml.jackson.annotation.JsonInclude;
import sun.java2d.opengl.OGLContext;

/**
 * json工具类
 * Created by Mxia on 2017/3/19.
 */
@JsonInclude(JsonInclude.Include.NON_NULL)
public class JSONResult {
    public  static final String SUCCESS ="success";
    public static final String ERROR = "error";

    private String message;//错误信息
    private String state;//状态
    private Object data;//数据


    public JSONResult(String message) {
        this.state = ERROR;
        this.message = message;
    }
    public JSONResult(Object data) {
        this.state = SUCCESS;
        this.data = data;
    }
    public JSONResult(String state,Object data) {
        this.state = state;
        this.data =data;

    }
    public JSONResult(String state,String message) {
        this.state = state;
        this.message = message;
    }



    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
