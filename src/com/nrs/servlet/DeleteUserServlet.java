package com.nrs.servlet;

import com.nrs.dao.UserDao;
import com.nrs.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/deleteUser")
public class DeleteUserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");

        int id = Integer.parseInt(req.getParameter("delete"));

        // 处理数据
        UserDao  userDao = new UserDao();
        User user = new User();
        user.setId(id);
        boolean isSuccess = false;
        try {
            isSuccess = userDao.deleteUser(user);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (isSuccess) {
            System.out.println("删除成功!");
            resp.sendRedirect("manager");
        } else {
            System.out.println("删除失败");
            resp.sendRedirect("deleteuser.jsp");
        }
    }
}
