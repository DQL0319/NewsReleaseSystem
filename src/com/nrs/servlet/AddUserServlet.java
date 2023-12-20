package com.nrs.servlet;

import com.nrs.dao.UserDao;
import com.nrs.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/addUser")
public class AddUserServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");

        String name = req.getParameter("username");
        String password = req.getParameter("password");
        int age = Integer.parseInt(req.getParameter("age"));
        String favorites = req.getParameter("favorites");
        String phone = req.getParameter("phone");
        String gender = req.getParameter("gender");
        String role = req.getParameter("role");

        System.out.println("请求参数name:" + name + "------password:" + password + "------age:" + age +
                "------favorites:" + favorites + "------phone:" + phone +
                "------gender:" + gender + "------role:" + role);

        // 处理数据
        // 据用户名查询用户
        UserDao userDao = new UserDao();
        User user = new User();
        user.setName(name);
        user.setPassword(password);
        user.setAge(age);
        user.setFavorites(favorites);
        user.setPhone(phone);
        user.setGender(gender);
        user.setRole(role);
        boolean isSuccess = false;
        try {
            isSuccess = userDao.addUser(user);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (isSuccess) {
            System.out.println("添加成功!");
            resp.sendRedirect("manager");
        } else {
            System.out.println("添加失败，返回登录页面!");
            resp.sendRedirect("addUser.jsp");
        }
    }
}
