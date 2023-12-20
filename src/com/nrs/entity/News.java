package com.nrs.entity;

import lombok.Data;

import java.util.Date;

@Data
public class News {
    private int id; // 新闻编号
    private String newsTitle; // 新闻标题
    private String newsContent; // 新闻内容
    private Date createTime; // 新闻发布时间
    // 新增的属性
    private String name; // 发布人名称
    private int userId;
}
