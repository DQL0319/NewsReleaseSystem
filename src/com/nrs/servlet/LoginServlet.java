package com.nrs.servlet;

import com.nrs.dao.UserDao;
import com.nrs.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(value = "/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 设置字符集防止乱码
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        // 获取表单参数
        String name = req.getParameter("username");
        String password = req.getParameter("password");
        String role = req.getParameter("role");
        System.out.println("请求参数name:" + name + "------password:" + password);

        // 根据用户名查询用户
        UserDao userDao = new UserDao();
        List<User> userList = null;
        // 判断用户密码是否正确
        boolean isSuccess = false;
        try {
            userList = userDao.queryUser(name, password);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (userList != null && userList.size() > 0) {
            User user = userList.get(0);
            int id = user.getId();
            int age = user.getAge();
            String favorites = user.getFavorites();
            String phone = user.getPhone();
            String gender = user.getGender();
            System.out.println(user);
            if (user.getPassword().equals(password) && user.getName().equals(name)) {
                if (user.getRole().equals(role)) {
                    isSuccess = true;
                    req.setAttribute("user", user);
                    // 获取用户身份，做权限认定
                    req.getSession().setAttribute("id", id);
                    req.getSession().setAttribute("username", name);
                    req.getSession().setAttribute("password", password);
                    req.getSession().setAttribute("age", age);
                    req.getSession().setAttribute("favorites", favorites);
                    req.getSession().setAttribute("phone", phone);
                    req.getSession().setAttribute("gender", gender);
                    req.getSession().setAttribute("role", role);
                } else {
                    req.getSession().setAttribute("Error", "❗请您选择对应的身份!");
                    resp.sendRedirect("login.jsp");
                    return;
                }
            }
        }

        // 根据登陆结果决定显示的内容
        if (isSuccess) {
            req.getRequestDispatcher("newslist").forward(req, resp);
//            resp.sendRedirect("newslist");
            req.getSession().removeAttribute("Error");
        } else {
            req.getSession().setAttribute("Error", "❗用户名或密码错误");
            resp.sendRedirect("login.jsp");
        }
    }
}
