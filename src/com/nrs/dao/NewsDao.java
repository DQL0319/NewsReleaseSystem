package com.nrs.dao;

import com.nrs.entity.News;
import com.nrs.entity.Page;
import com.nrs.utils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapHandler;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

public class NewsDao {

    // 分页查询的业务方法
    public Page queryNewsList(int current, int pageSize) throws Exception {
        Page page = new Page();
        page.setCurrent(current);
        page.setPageSize(pageSize);
        QueryRunner runner = new QueryRunner(DbUtils.getSource());
        //查询用户总数
        Map tMap = runner.query("select count(1) as t from news", new MapHandler());
        int total = Integer.parseInt(tMap.get("t").toString());
        //计算总页数
        int pageNum = (total % pageSize == 0 ? total / pageSize : (total / pageSize + 1));
        //查询用户数据
        List<News> news = runner.query("select news.id,news.newstitle,news.newscontent,user.name,news.createtime from news,user where news.userid = user.userid limit ?,?",
                new BeanListHandler<News>(News.class), //将结果初始化为News类的实例
                (current - 1) * pageSize, pageSize);
//        System.out.println(news);
        page.setData(news);
        page.setPageNum(pageNum);
        page.setTotal(total);

        return page;
    }

    // 按新闻名称分页查询的业务方法
    public Page queryNewsByCondition(int current, int pageSize, String searchContent) throws Exception {
        Page page = new Page();
        page.setCurrent(current);
        page.setPageSize(pageSize);
        QueryRunner runner = new QueryRunner(DbUtils.getSource());
        // 查询用户总数
        Map tMap = runner.query("select count(1) as t from news where newstitle like ?", new MapHandler(), "%" + searchContent + "%");
        int total = Integer.parseInt(tMap.get("t").toString());
        // 计算总页数
        int pageNum = (total % pageSize == 0 ? total / pageSize : (total / pageSize + 1));
        // 查询用户数据
        List<News> news = runner.query("select news.id,news.newstitle,news.newscontent,user.name,news.createtime from news,user where news.userid = user.userid and newstitle like ? limit ?, ?",
                new BeanListHandler<News>(News.class), "%" + searchContent + "%", (current - 1) * pageSize, pageSize);

        page.setData(news);
        page.setPageNum(pageNum);
        page.setTotal(total);

        return page;
    }

    // 按发布人分页查询的业务方法
    public Page queryNewsByUser(int current, int pageSize, String searchContent) throws Exception {
        Page page = new Page();
        page.setCurrent(current);
        page.setPageSize(pageSize);
        QueryRunner runner = new QueryRunner(DbUtils.getSource());
        // 查询用户总数
        Map tMap = runner.query("select count(1) as t from news,user where news.userid = user.userId and news.userid = (select userId from user where name = ?)", new MapHandler(), searchContent);
        int total = Integer.parseInt(tMap.get("t").toString());
        // 计算总页数
        int pageNum = (total % pageSize == 0 ? total / pageSize : (total / pageSize + 1));
        // 查询用户数据
        List<News> news = runner.query("select news.id,news.newstitle,news.newscontent,user.name,news.createtime from news,user where news.userid = user.userId and news.userid = (select userId from user where name = ?) limit ?, ?",
                new BeanListHandler<News>(News.class), searchContent, (current - 1) * pageSize, pageSize);

        page.setData(news);
        page.setPageNum(pageNum);
        page.setTotal(total);

        return page;
    }

    // 发布新闻的业务方法
    public boolean addNews(News news) throws Exception {
        // 处理数据
        QueryRunner runner = new QueryRunner(DbUtils.getSource());
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String currentTime = sdf.format(new Date());
        int res = runner.execute("insert into news(newstitle,newscontent,createtime,userId) values(?,?,?,?)", news.getNewsTitle(), news.getNewsContent(), currentTime, news.getUserId());
        return res > 0;
    }

    // 修改新闻的业务方法
    public boolean updateNews(News news) throws Exception {
        // 处理数据
        QueryRunner runner = new QueryRunner(DbUtils.getSource());
        int res = runner.execute("update news join user on news.userId = user.userId set news.userId = (select userId from user where name = ?), news.newstitle = ?, news.newscontent = ? where news.id = ?", news.getName(), news.getNewsTitle(), news.getNewsContent(), news.getId());
        return res > 0;
    }

    // 删除新闻的业务方法
    public boolean deleteNews(News news) throws Exception {
        // 处理数据
        QueryRunner runner = new QueryRunner(DbUtils.getSource());
        int res = runner.execute("delete from news where id = ?", news.getId());
        return res > 0;
    }
}
