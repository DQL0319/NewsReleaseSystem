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

@WebServlet(value = "/delete")
public class DeleteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");

        int deleteId = Integer.parseInt(req.getParameter("id"));

        // 处理数据
        NewsDao newsDao = new NewsDao();
        News news = new News();
        news.setId(deleteId);
        boolean isSuccess = false;
        try {
            isSuccess = newsDao.deleteNews(news);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (isSuccess) {
            System.out.println("删除成功!");
            resp.sendRedirect("newslist");
        } else {
            System.out.println("删除失败，返回删除页面!");
            resp.sendRedirect("delete.jsp");
        }

    }
}
