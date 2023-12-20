package com.nrs.servlet;

import com.nrs.dao.NewsDao;
import com.nrs.entity.Page;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/newslist")
public class NewsServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");

        String current = req.getParameter("current");
        String pSize = req.getParameter("pageSize");
        String searchCon = req.getParameter("search");

        String user = (String) req.getSession().getAttribute("username");
        String role = (String) req.getSession().getAttribute("role");

        //当前页面和每页数据量
        int curPage = (current == null ? 1 : Integer.parseInt(current));
        int pageSize = (pSize == null ? 10 : Integer.parseInt(pSize));
        Page page = null;
        try {
            if (searchCon != null && !"".equals(searchCon)) {
                page = new NewsDao().queryNewsByCondition(curPage, pageSize, searchCon);
                req.setAttribute("pages", page);
            } else {
                if (role.equals("0")) {
                    page = new NewsDao().queryNewsByUser(curPage, pageSize, user);
                } else {
                    page = new NewsDao().queryNewsList(curPage, pageSize);
                }
                //带参数进行页面转发
                req.setAttribute("pages", page);
            }
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
