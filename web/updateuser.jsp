<%--
  Created by IntelliJ IDEA.
  User: acer
  Date: 2023/12/15
  Time: 21:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改用户</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link href="images/news.png" rel="icon">
</head>
<body>
    <script>
        const loginRole = <%=request.getSession().getAttribute("role")%>;
        const role = <%=request.getParameter("role")%>;
        const gender = "<%=request.getParameter("gender")%>";

        function setRadioButtons() {
            if (gender === "男") {
                document.getElementById('flexRadioDefault1').checked = true;
            } else if (gender === "女") {
                document.getElementById('flexRadioDefault2').checked = true;
            }
            if (role === 1) {
                document.getElementById('flexRadioDefault3').checked = true;
            }
            if (role === 0) {
                document.getElementById('flexRadioDefault4').checked = true;
            }
            if (loginRole === 0) {
                document.getElementById('exampleInputId').readOnly = true;
                document.getElementById('exampleInputUserName').readOnly = true;
                document.getElementById('flexRadioDefault3').disabled = true;
            }
            document.getElementById('exampleInputId').value = "<%=request.getParameter("id")%>";
            document.getElementById('exampleInputUserName').value = "<%=request.getParameter("username")%>";
            document.getElementById('exampleInputPassword').value = "<%=request.getParameter("password")%>";
            document.getElementById('exampleInputAge').value = "<%=request.getParameter("age")%>";
            document.getElementById('exampleInputFavorites').value = "<%=request.getParameter("favorites")%>";
            document.getElementById('exampleInputPhone').value = "<%=request.getParameter("phone")%>";
        }

        window.onload = function () {
            setRadioButtons();
        };
    </script>
    <div class="card container my-5" style="width: 50rem;">
        <div class="card-body">
            <h1 class="card-title">修改用户</h1>
            <form action="updateUser" method="get" class="mb-3">
                <div class="mb-3">
                    <label for="exampleInputId" class="form-label">Id</label>
                    <input
                            type="text"
                            class="form-control"
                            id="exampleInputId"
                            name="id"
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
                    <a href="<%=request.getSession().getAttribute("role").equals("0") ? "manager?search=" + request.getSession().getAttribute("username") : "manager"%>"
                       class="btn btn-dark" style="width: 6rem;">返回</a>
                    <button type="submit" class="btn btn-success" style="width: 6rem;">修改</button>
                    <%
                        if (request.getSession().getAttribute("role").equals("1")) {
                    %>
                    <button type="reset" class="btn btn-dark" style="width: 6rem;">重置</button>
                    <%
                        }
                    %>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
