package com.nrs.servlet;

import com.nrs.dao.NewsDao;
import com.nrs.entity.News;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/add")
public class AddServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");

        String title = req.getParameter("newstitle");
        String content = req.getParameter("newscontent");
        int userId = (int) req.getSession().getAttribute("id");

        System.out.println("请求参数title:" + title + "------content:" + content);

        // 处理数据
        NewsDao newsDao = new NewsDao();
        News news = new News();
        news.setNewsTitle(title);
        news.setNewsContent(content);
        news.setUserId(userId);
        boolean isSuccess = false;
        try {
            isSuccess = newsDao.addNews(news);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (isSuccess) {
            System.out.println("插入成功!");
            resp.sendRedirect("newslist");
        } else {
            System.out.println("插入失败，返回发布页面!");
            resp.sendRedirect("add.jsp");
        }
    }
}
