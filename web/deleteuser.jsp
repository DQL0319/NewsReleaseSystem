<%--
  Created by IntelliJ IDEA.
  User: acer
  Date: 2023/12/15
  Time: 22:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>删除用户</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link href="images/news.png" rel="icon">
</head>
<body>
    <script>
        function deleteId() {
            document.getElementById('exampleInputDelete').value = "<%=request.getParameter("id")%>";
            document.getElementById('exampleInputUserName').value = "<%=request.getParameter("username")%>";
            document.getElementById('exampleInputDelete').readOnly = true;
            document.getElementById('exampleInputUserName').readOnly = true;
        }

        window.onload = function () {
            deleteId();
        };
    </script>
    <div class="card container my-5" style="width: 50rem;">
        <div class="card-body">
            <h1 class="card-title">删除用户</h1>
            <form action="deleteUser" method="get" class="mb-3">
                <div class="mb-3">
                    <label for="exampleInputDelete" class="form-label">Id</label>
                    <input
                            type="text"
                            class="form-control"
                            id="exampleInputDelete"
                            name="delete"
                    >
                </div>
                <div class="mb-3">
                    <label for="exampleInputUserName" class="form-label">UserName</label>
                    <input
                            type="text"
                            class="form-control"
                            id="exampleInputUserName"
                            name="username"
                    >
                </div>
                <div class="d-grid gap-2 d-flex justify-content-evenly">
                    <a href="manager" class="btn btn-dark" style="width: 6rem;">返回</a>
                    <button type="submit" class="btn btn-danger" style="width: 6rem;">删除</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
