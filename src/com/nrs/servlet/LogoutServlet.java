package com.nrs.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/logout")
public class LogoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getSession().removeAttribute("username");
        req.getSession().removeAttribute("password");
        req.getSession().removeAttribute("favorites");
        req.getSession().removeAttribute("age");
        req.getSession().removeAttribute("role");
        req.getSession().removeAttribute("phone");
        req.getSession().removeAttribute("id");
        req.getSession().removeAttribute("gender");
        resp.sendRedirect("login.jsp");
    }
}
