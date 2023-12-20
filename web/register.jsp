<%--
  Created by IntelliJ IDEA.
  User: acer
  Date: 2023/11/27
  Time: 10:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link href="images/news.png" rel="icon">
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        body {
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background-image: url("images/mountain.jpg");
            background-size: cover;
        }

        .form {
            width: 700px;
            background-color: rgba(41, 45, 62, 0.8);
            color: #fff;
            border-radius: 2px;
            padding: 50px 80px 80px;
            border-radius: 10px;
            box-shadow: 2px 2px 2px rgba(0, 0, 0, 0.4);
        }

        .header {
            text-align: center;
            font-size: 50px;
            text-transform: uppercase;
            line-height: 100px;
        }

        .main .inpbox input {
            background-color: rgb(41, 45, 62);
            border: 0;
            width: 100%;
            text-align: center;
            font-size: 15px;
            color: #fff;
            outline: none;
        }

        .main .inpbox {
            background: linear-gradient(90deg, #03a9f4, #f441a5, #ffeb3b, #03a9f4);
            background-size: 400%;
            width: 100%;
            height: 50px;
            margin-bottom: 20px;
            border-radius: 30px;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 1s;
        }

        .main .inpbox input {
            height: calc(100% - 4px);
            width: calc(100% - 6px);
            border-radius: 30px;
        }

        .action {
            display: flex;
            justify-content: space-evenly;
        }

        .action .btn {
            width: 20%;
            text-transform: uppercase;
            border: 2px solid #0e92b3;
            text-align: center;
            line-height: 30px;
            border-radius: 30px;
            cursor: pointer;
            transition: all 1s;
            color: #fff;
        }

        .main .inpbox:has(input:focus) {
            animation: animate 5s linear infinite;
            transform: scale(1.2);
        }

        @keyframes animate {
            0% {
                background-position: 0 0;
            }
            100% {
                background-position: 400% 0;
            }
        }

        .action .btn:hover {
            transform: scale(1.2);
            background-color: #0e92b3;
        }

        .roles {
            display: flex;
            justify-content: center;
        }
    </style>
</head>
<body>
    <div class="form">
        <div class="header">Register</div>
        <form action="register" method="post">
            <div class="main">
                <div class="inpbox">
                    <input type="text" placeholder="用户名" name="username">
                </div>
                <div class="inpbox">
                    <input type="password" placeholder="密码" name="password">
                </div>
            </div>

            <div class="form-group roles mb-3">
                <label class="form-label">身份</label>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" style="margin-left: 4px;" type="radio" name="role"
                           id="flexRadioDefault1" checked value="1">
                    <label class="form-check-label" for="flexRadioDefault1" style="margin-left: 10px;">管理员</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="role" id="flexRadioDefault2" value="0">
                    <label class="form-check-label" for="flexRadioDefault2">普通用户</label>
                </div>
            </div>

            <div class="action">
                <a href="login.jsp" class="btn">返回</a>
                <button class="btn" type="submit">注册</button>
                <button type="reset" class="btn">重置</button>
            </div>
        </form>
    </div>
</body>
</html>
