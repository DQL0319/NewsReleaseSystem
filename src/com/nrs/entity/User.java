package com.nrs.entity;

import lombok.Data;

@Data
public class User {
    private int id;           // id
    private String name;      // 用户名
    private String password;  // 密码
    private int age;          // 年龄
    private String favorites; // 爱好
    private String phone;     // 电话
    private String gender;    // 性别
    private String role;      // 角色（1是管理员，0是普通用户）
}
