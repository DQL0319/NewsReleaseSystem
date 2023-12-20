package com.nrs.servlet;

import com.nrs.dao.NewsDao;
import com.nrs.entity.News;
import com.nrs.utils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/update")
public class UpdateServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");

        int id = Integer.parseInt(req.getParameter("id"));
        String newsTitle = req.getParameter("newstitle");
        String newsContent = req.getParameter("newscontent");
        String publisher = req.getParameter("publisher");

        System.out.println("请求参数newsTitle:" + newsTitle + "------newsContent:" + newsContent);

        // 处理数据
        NewsDao newsDao = new NewsDao();
        News news = new News();
        news.setId(id);
        news.setNewsTitle(newsTitle);
        news.setNewsContent(newsContent);
        news.setName(publisher);
        boolean isSuccess = false;
        try {
            isSuccess = newsDao.updateNews(news);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (isSuccess) {
            System.out.println("修改成功!");
            resp.sendRedirect("newslist");
        } else {
            System.out.println("修改失败，返回修改页面!");
            resp.sendRedirect("update.jsp");
        }
    }
}
