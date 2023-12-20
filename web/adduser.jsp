<%--
  Created by IntelliJ IDEA.
  User: acer
  Date: 2023/12/15
  Time: 17:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加用户</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link href="images/news.png" rel="icon">
</head>
<body>
    <div class="card container my-5" style="width: 50rem;">
        <div class="card-body">
            <h1 class="card-title">添加用户</h1>
            <form action="addUser" method="post" class="mb-3">
                <div class="mb-3">
                    <label for="exampleInputUserName" class="form-label">UserName</label>
                    <input
                            type="text"
                            class="form-control"
                            id="exampleInputUserName"
                            name="username"
                    >
                    <div id="nameHelp" class="form-text">We'll never share your username with anyone else.</div>
                </div>
                <div class="mb-3">
                    <label for="exampleInputPassword" class="form-label">Password</label>
                    <input
                            type="password"
                            class="form-control"
                            id="exampleInputPassword"
                            name="password"
                    >
                </div>
                <div class="mb-3">
                    <label for="exampleInputAge" class="form-label">Age</label>
                    <input
                            type="text"
                            class="form-control"
                            id="exampleInputAge"
                            name="age"
                    >
                </div>
                <div class="mb-3">
                    <label for="exampleInputFavorites" class="form-label">Favorites</label>
                    <input
                            type="text"
                            class="form-control"
                            id="exampleInputFavorites"
                            name="favorites"
                    >
                </div>
                <div class="mb-3">
                    <label for="exampleInputPhone" class="form-label">Phone</label>
                    <input
                            type="text"
                            class="form-control"
                            id="exampleInputPhone"
                            name="phone"
                    >
                </div>
                <div>
                    <label class="form-label">Gender</label>
                </div>
                <div class="form-check form-check-inline">
                    <input
                            class="form-check-input"
                            type="radio"
                            name="gender"
                            id="flexRadioDefault1"
                            checked
                            value="男"
                    >
                    <label class="form-check-label" for="flexRadioDefault1">
                        Male
                    </label>
                </div>
                <div class="form-check form-check-inline">
                    <input
                            class="form-check-input"
                            type="radio"
                            name="gender"
                            id="flexRadioDefault2"
                            value="女"
                    >
                    <label class="form-check-label" for="flexRadioDefault2">
                        Female
                    </label>
                </div>
                <div>
                    <label class="form-label">Role</label>
                </div>
                <div class="form-check form-check-inline">
                    <input
                            class="form-check-input"
                            type="radio"
                            name="role"
                            id="flexRadioDefault3"
                            checked
                            value="1"
                    >
                    <label class="form-check-label" for="flexRadioDefault3">
                        Admin
                    </label>
                </div>
                <div class="form-check form-check-inline">
                    <input
                            class="form-check-input"
                            type="radio"
                            name="role"
                            id="flexRadioDefault4"
                            value="0"
                    >
                    <label class="form-check-label" for="flexRadioDefault4">
                        User
                    </label>
                </div>
                <div class="d-grid gap-2 d-flex justify-content-evenly">
                    <a href="manager" class="btn btn-dark" style="width: 6rem;">返回</a>
                    <button type="submit" class="btn btn-success" style="width: 6rem;">添加</button>
                    <button type="reset" class="btn btn-dark" style="width: 6rem;">重置</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
