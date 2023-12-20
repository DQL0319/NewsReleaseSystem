package com.nrs.servlet;

import com.nrs.dao.UserDao;
import com.nrs.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/updateUser")
public class UpdateUserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");

        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("username");
        String password = req.getParameter("password");
        int age = Integer.parseInt(req.getParameter("age"));
        String favorites = req.getParameter("favorites");
        String phone = req.getParameter("phone");
        String gender = req.getParameter("gender");
        String role = req.getParameter("role");
//        String loginRole = (String) req.getSession().getAttribute("role");
//        String loginName = (String) req.getSession().getAttribute("username");

        System.out.println("请求参数name:" + name + "------password:" + password + "------age:" + age +
                "------favorites:" + favorites + "------phone:" + phone +
                "------gender:" + gender + "------role:" + role);

        // 处理数据
        User user = new User();
        UserDao userDao = new UserDao();
        user.setId(id);
        user.setName(name);
        user.setPassword(password);
        user.setAge(age);
        user.setFavorites(favorites);
        user.setPhone(phone);
        user.setGender(gender);
        user.setRole(role);
        boolean isSuccess = false;
        try {
            // 据用户名查询用户
            isSuccess = userDao.updateUser(user);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (isSuccess) {
            resp.sendRedirect("manager");
        } else {
            System.out.println("修改失败");
            resp.sendRedirect("updateuser.jsp");
        }
    }
}
