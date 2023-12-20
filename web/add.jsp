<%--
  Created by IntelliJ IDEA.
  User: acer
  Date: 2023/12/8
  Time: 11:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>发布新闻</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link href="images/news.png" rel="icon">
</head>
<body>
    <div class="card container my-5" style="width: 50rem;">
        <div class="card-body">
            <h1 class="card-title">发布新闻</h1>
            <form action="add" method="post" class="mb-3">
                <div class="mb-3">
                    <label for="exampleInputTitle" class="form-label">Title</label>
                    <input
                            type="text"
                            class="form-control"
                            id="exampleInputTitle"
                            name="newstitle"
                    >
                </div>
                <div class="mb-3">
                    <label for="exampleInputContent" class="form-label">Content</label>
                    <textarea class="form-control" id="exampleInputContent" name="newscontent" style="height: 300px;"></textarea>
                </div>
                <div class="d-grid gap-2 d-flex justify-content-evenly">
                    <a href="newslist" class="btn btn-dark" style="width: 6rem;">返回</a>
                    <button type="submit" class="btn btn-success" style="width: 6rem;">发布</button>
                    <button type="reset" class="btn btn-dark" style="width: 6rem;">重置</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
