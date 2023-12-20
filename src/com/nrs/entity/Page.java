package com.nrs.entity;

import lombok.Data;

import java.util.List;

@Data
public class Page {
    private int pageNum; // 页面总数
    private int current; // 当前页
    private int pageSize; // 一页的大小，也就是显示多少条数据
    private int total; // 总共的数据
    // 添加的属性
    private List<User> userdata; // 用户数据对象
    private List<News> data; // 新闻数据对象
}
