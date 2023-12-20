<%--
  Created by IntelliJ IDEA.
  User: acer
  Date: 2023/12/15
  Time: 17:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>用户管理</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link href="images/news.png" rel="icon">
    <style>
        .container {
            padding: 20px;
        }

        .fixed-pagination {
            position: fixed;
            left: 50%;
            transform: translateX(-50%);
        }

        .nav-item:hover > .nav-link {
            background-color: #1677ff;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg bg-body-tertiary bg-dark" data-bs-theme="dark">
        <div class="container-fluid" style="height: 35px;">
            <a class="navbar-brand" href="newslist">
                <img src="images/news.png" alt="Logo" width="30" height="24"
                     class="d-inline-block align-text-top">
                新闻发布系统
            </a>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link nav-link-hover" aria-current="page" href="newslist">新闻发布首页</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link nav-link-hover"
                           href="<%=request.getSession().getAttribute("role").equals("0") ? "manager?search=" + request.getSession().getAttribute("username") : "manager"%>">
                            <%=request.getSession().getAttribute("role").equals("1") ? "用户管理" : "个人信息"%>
                        </a>
                    </li>
                    <%
                        if (request.getSession().getAttribute("role").equals("0")) {
                    %>
                    <li class="nav-item">
                        <a class="nav-link nav-link-hover"
                           href="updateuser.jsp?id=<%=request.getSession().getAttribute("id")%>&username=<%=request.getSession().getAttribute("username")%>&password=<%=request.getSession().getAttribute("password")%>&age=<%=request.getSession().getAttribute("age")%>&favorites=<%=request.getSession().getAttribute("favorites")%>&phone=<%=request.getSession().getAttribute("phone")%>&gender=<%=request.getSession().getAttribute("gender")%>&role=<%=request.getSession().getAttribute("role")%>">修改个人信息</a>
                    </li>
                    <%
                        }
                    %>
                </ul>
            </div>
            <p style="color:#b0b3aa; position: relative;top: 10%;transform: translateY(25%); margin-right: 30px;">
                当前用户：<%=request.getSession().getAttribute("username")%>
                [<%= (request.getSession().getAttribute("role").equals("1")) ? "管理员" : "普通用户" %>]
            </p>
            <form action="logout" method="get">
                <button class="btn btn-danger btn-sm" type="submit"
                        style="position: relative;top: 50%;transform: translateY(25%);">退出系统
                </button>
            </form>
        </div>
    </nav>

    <div class="container">
        <div class="row">
            <%
                if (request.getSession().getAttribute("role").equals("1")) {
            %>
            <div class="col-md-3">
                <a href="adduser.jsp" class="btn btn-success mb-3">添加用户</a>
            </div>
            <div class="col-md-6">
                <form action="manager" style="height: 100%">
                    <div class="input-group mb-3">
                        <input type="text" class="form-control" placeholder="请输入用户名" name="search">
                        <button class="btn btn-primary" type="submit">搜索</button>
                    </div>
                </form>
            </div>
            <%
                }
            %>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="portlet">
                <div class="category-list" style="border-top: 1.5px solid #ddd;">
                    <c:if test="${empty pages.userdata}">
                        <p class="text-center" style="font-size: 50px; margin-top: 50px;">Error:该用户名不存在</p>
                    </c:if>
                    <c:if test="${not empty pages.userdata}">
                    <table class="table table-striped table-hover" id="dataTable">
                        <thead>
                            <tr style="text-align: center">
                                <th>编号</th>
                                <th>用户名</th>
                                <th>密码</th>
                                <th>年龄</th>
                                <th>爱好</th>
                                <th>电话</th>
                                <th>性别</th>
                                <th>角色</th>
                                <%
                                    if (request.getSession().getAttribute("role").equals("1")) {
                                %>
                                <th>操作</th>
                                <%
                                    }
                                %>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${pages.userdata}" var="userlist">
                                <tr>
                                    <td style="text-align: center">${userlist.id}</td>
                                    <td style="text-align: center">${userlist.name}</td>
                                    <td style="text-align: center">${userlist.password}</td>
                                    <td style="text-align: center">${userlist.age}</td>
                                    <td style="text-align: center">${userlist.favorites}</td>
                                    <td style="text-align: center">${userlist.phone}</td>
                                    <td style="text-align: center">${userlist.gender}</td>
                                    <td style="text-align: center"> ${userlist.role eq 1 ? '管理员' : '普通用户'}</td>
                                    <%
                                        if (request.getSession().getAttribute("role").equals("1")) {
                                    %>
                                    <td style="display: flex; justify-content: space-evenly; align-items: center;">
                                        <a href="updateuser.jsp?id=${userlist.id}&username=${userlist.name}&password=${userlist.password}&age=${userlist.age}&favorites=${userlist.favorites}&phone=${userlist.phone}&gender=${userlist.gender}&role=${userlist.role}"
                                           class="btn btn-primary btn-sm">修改</a>
                                        <a href="deleteuser.jsp?id=${userlist.id}&username=${userlist.name}"
                                           class="btn btn-danger btn-sm" id="remove">删除</a>
                                    </td>
                                    <%
                                        }
                                    %>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- 分页控件，标签必须是<ul> -->
    <%
        if (request.getSession().getAttribute("role").equals("1")) {
    %>
    <nav aria-label="Page navigation example" class="fixed-pagination">
        <ul class="pagination">
            <c:if test="${pages.current > 1}">
                <li class="page-item">
                    <a class="page-link" href="manager?current=${pages.current-1}&pageSize=${pages.pageSize}"
                       aria-label="Previous">
                        <span aria-hidden="true">上一页</span>
                    </a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="manager?current=1&pageSize=${pages.pageSize}">首页</a>
                </li>
            </c:if>
            <c:forEach var="i" begin="1" end="${pages.pageNum}">
                <li class="page-item ${i==pages.current ? 'active' : ''}">
                    <a class="page-link" href="manager?current=${i}&pageSize=${pages.pageSize}">${i}</a>
                </li>
            </c:forEach>
            <c:if test="${pages.current < pages.pageNum}">
                <li class="page-item">
                    <a class="page-link" href="manager?current=${pages.pageNum}&pageSize=${pages.pageSize}">尾页</a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="manager?current=${pages.current+1}&pageSize=${pages.pageSize}"
                       aria-label="Next">
                        <span aria-hidden="true">下一页</span>
                    </a>
                </li>
            </c:if>
            <p class="fw-light" style="height: 37.6px; line-height: 37.6px; margin-left: 20px">
                第${pages.current}页/共${pages.pageNum}页</p>
        </ul>
    </nav>
    <%
        }
    %>
    </c:if>
</body>
</html>
