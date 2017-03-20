package com.kaishengit.pojo;

import java.sql.Timestamp;

/**
 * 销售机会表
 * Created by Mxia on 2017/3/19.
 */
public class Sales {

    private Integer id;
    private String name;
    private Float price;
    private Integer costomerId;
    private String costomerName;
    private String userName;
    private Timestamp createTime;
    private Timestamp lastTime;
    private String progress;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public Integer getCostomerId() {
        return costomerId;
    }

    public void setCostomerId(Integer costomerId) {
        this.costomerId = costomerId;
    }

    public String getCostomerName() {
        return costomerName;
    }

    public void setCostomerName(String costomerName) {
        this.costomerName = costomerName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    public Timestamp getLastTime() {
        return lastTime;
    }

    public void setLastTime(Timestamp lastTime) {
        this.lastTime = lastTime;
    }

    public String getProgress() {
        return progress;
    }

    public void setProgress(String progress) {
        this.progress = progress;
    }
}
