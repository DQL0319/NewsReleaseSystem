package com.nrs.dao;

import com.nrs.entity.Page;
import com.nrs.entity.User;
import com.nrs.utils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapHandler;

import java.util.List;
import java.util.Map;

public class UserDao {

    // 登录时查询用户的业务方法
    public List<User> queryUser(String username, String password) throws Exception {
        QueryRunner runner = new QueryRunner(DbUtils.getSource());
        // 查询
        List<User> users = runner.query("select userId as id, name, password, age, favorites, phone, gender, role from user where name = ? and password = ?",
                new BeanListHandler<User>(User.class), username, password);
        return users;
    }

    // 注册的业务方法
    public boolean register(User user) throws Exception {
        // 处理数据
        QueryRunner runner = new QueryRunner(DbUtils.getSource());
        int res = runner.execute("insert into user(name,password,role) values(?,?,?)",
                user.getName(), user.getPassword(), user.getRole());
        return res > 0;
    }

    // 分页查询所有用户的方法
    public Page queryUserList(int current, int pageSize) throws Exception {
        Page page = new Page();
        page.setCurrent(current);
        page.setPageSize(pageSize);
        QueryRunner runner = new QueryRunner(DbUtils.getSource());
        //查询用户总数
        Map tMap = runner.query("select count(1) as t from user", new MapHandler());
        int total = Integer.parseInt(tMap.get("t").toString());
        //计算总页数
        int pageNum = (total % pageSize == 0 ? total / pageSize : (total / pageSize + 1));
        //查询用户数据
        List<User> userList = runner.query("select userId as id, name, password, age, favorites, phone, gender, role from user limit ?,?",
                new BeanListHandler<User>(User.class), //将结果初始化为User类的实例
                (current - 1) * pageSize, pageSize);
        page.setUserdata(userList);
        page.setPageNum(pageNum);
        page.setTotal(total);
        System.out.println(page);

        return page;
    }

    // 按条件分页查询的业务方法
    public Page queryUserByCondition(int current, int pageSize, String searchContent) throws Exception {
        Page page = new Page();
        page.setCurrent(current);
        page.setPageSize(pageSize);
        QueryRunner runner = new QueryRunner(DbUtils.getSource());
        // 查询用户总数
        Map tMap = runner.query("select count(1) as t from user where name like ?",
                new MapHandler(), "%" + searchContent + "%");
        int total = Integer.parseInt(tMap.get("t").toString());
        // 计算总页数
        int pageNum = (total % pageSize == 0 ? total / pageSize : (total / pageSize + 1));
        // 查询用户数据
        List<User> users = runner.query("select userId as id, name, password, age, favorites, phone, gender, role from user where name like ? limit ?, ?",
                new BeanListHandler<User>(User.class), "%" + searchContent + "%", (current - 1) * pageSize, pageSize);

        page.setUserdata(users);
        page.setPageNum(pageNum);
        page.setTotal(total);

        return page;
    }


    // 添加用户的业务方法
    public boolean addUser(User user) throws Exception {
        // 处理数据
        QueryRunner runner = new QueryRunner(DbUtils.getSource());
        int res = runner.execute("insert into user(name,password,age,favorites,phone,gender,role) values(?,?,?,?,?,?,?)",
                user.getName(), user.getPassword(), user.getAge(), user.getFavorites(), user.getPhone(), user.getGender(), user.getRole());
        return res > 0;
    }

    // 修改用户的业务方法
    public boolean updateUser(User user) throws Exception {
        // 处理数据
        QueryRunner runner = new QueryRunner(DbUtils.getSource());
        int res = runner.execute("update user set name = ?, password = ?, age = ?, favorites = ?, phone = ?, gender = ?, role = ? where userId = ?",
                user.getName(), user.getPassword(), user.getAge(), user.getFavorites(), user.getPhone(), user.getGender(), user.getRole(), user.getId());
        return res > 0;
    }

    // 删除用户的业务方法
    public boolean deleteUser(User user) throws Exception {
        // 处理数据
        QueryRunner runner = new QueryRunner(DbUtils.getSource());
        int res = runner.execute("delete from user where userId = ?", user.getId());
        return res > 0;
    }

}
