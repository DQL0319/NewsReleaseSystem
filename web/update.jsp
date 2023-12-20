<%--
  Created by IntelliJ IDEA.
  User: acer
  Date: 2023/12/1
  Time: 20:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改新闻</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link href="images/news.png" rel="icon">
</head>
<body>
    <script>
        const loginRole = <%=request.getSession().getAttribute("role")%>;

        function setRadioButtons() {
            if(loginRole === 0) {
                document.getElementById('exampleInputPublisher').readOnly = true;
            }
            document.getElementById('exampleInputId').readOnly = true;
            document.getElementById('exampleInputTime').readOnly = true;
            document.getElementById('exampleInputId').value = "<%=request.getParameter("id")%>";
            document.getElementById('exampleInputTitle').value = "<%=request.getParameter("newstitle")%>";
            document.getElementById('exampleInputContent').value = "<%=request.getParameter("newscontent")%>";
            document.getElementById('exampleInputPublisher').value = "<%=request.getParameter("publisher")%>";
            document.getElementById('exampleInputTime').value = "<%=request.getParameter("createtime")%>";
        }

        window.onload = function () {
            setRadioButtons();
        };
    </script>
    <div class="card container my-5" style="width: 50rem;">
        <div class="card-body">
            <h1 class="card-title">修改新闻</h1>
            <form action="update" method="post" class="mb-3">
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
                    <textarea class="form-control" id="exampleInputContent" name="newscontent" style="height: 150px;"></textarea>
                </div>
                <div class="mb-3">
                    <label for="exampleInputPublisher" class="form-label">Publisher</label>
                    <input
                            type="text"
                            class="form-control"
                            id="exampleInputPublisher"
                            name="publisher"
                    >
                </div>
                <div class="mb-3">
                    <label for="exampleInputTime" class="form-label">CreateTime</label>
                    <input
                            type="text"
                            class="form-control"
                            id="exampleInputTime"
                            name="createtime"
                    >
                </div>
                <div class="d-grid gap-2 d-flex justify-content-evenly">
                    <a href="newslist" class="btn btn-dark" style="width: 6rem;">返回</a>
                    <button type="submit" class="btn btn-success" style="width: 6rem;">修改</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
