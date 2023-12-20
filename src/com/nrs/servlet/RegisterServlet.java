package com.nrs.servlet;

import com.nrs.dao.UserDao;
import com.nrs.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/register")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");

        String name = req.getParameter("username");
        String password = req.getParameter("password");
        String role = req.getParameter("role");

        System.out.println("请求参数name:" + name + "------password:" + password + "------role:" + role);

        // 处理数据
        UserDao userDao = new UserDao();
        User user = new User();
        user.setName(name);
        user.setPassword(password);
        user.setRole(role);
        boolean isSuccess = false;
        try {
            isSuccess = userDao.register(user);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (isSuccess) {
            System.out.println("注册成功!");
            resp.sendRedirect("login.jsp");
        } else {
            System.out.println("注册失败!");
            resp.sendRedirect("register.jsp");
        }
    }
}


