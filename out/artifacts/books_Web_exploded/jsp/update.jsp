<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>登录页</title>
    <!--引入css支持-->
    <link rel="stylesheet" href="/static/css/bootstrap.css" />
    <!--如果要引用js要先引入支持-->
    <script type="text/javascript" src="/static/js/jquery-2.1.0.min.js"></script>
</head>
<body>
<div class="container" style="margin-top: 0px;">
    <div class="row" style="margin-top: 30px; margin-left: 100px;">
        <div class="col-sm-6 col--sm-offset-2">
            <p style="font-weight: 700; font-size: 18px; margin-bottom: 20px; margin-left: 50px;">更新电子图书:</p>

            <form class="form-horizontal" action="/bookEntry/update" method="post">
                <%--隐藏域 当前图书的id值， 进行修改使用的--%>
                <input type="hidden" value="${ebookEntry.id}" name="id">;
                <div class="form-group" >
                    <label for="title" class="col-sm-4 control-label">图书名称*</label>
                    <input type="text" id="title" value="${ebookEntry.title}" required name="title" style="width: 200px; height: 30px;">
                </div>
                <div class="form-group" >
                    <label for="title" class="col-sm-4 control-label">图书分类*</label>
                    <select id="categoryId" name="categoryId" style="width: 130px; height: 30px;" >
                        <option value="0">全部</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="summary" class="col-sm-4 control-label">图书摘要</label>
                    <input type="text" id="summary"  value="${ebookEntry.summary}" required name="summary" style="width: 200px; height: 30px;">
                </div>

                <div class="form-group">
                    <label for="uploaduser" class="col-sm-4 control-label">上传人</label>
                    <input type="text" id="uploaduser"  value="${ebookEntry.uploaduser}"  name="uploaduser"  style="width: 200px; height: 30px;">
                </div>
                <div class="form-group">
                    <label for="createdate" class="col-sm-4 control-label">上传时间*</label>
                    <input type="text" id="createdate"  value="<fmt:formatDate value='${ebookEntry.createdate }' pattern='yyyy-MM-dd'/>" name="createdate"  style="width: 200px; height: 30px;">(yyyy-MM-dd)
                </div>

                <div class="form-group">
                    <div style="margin-left: 150px;">
                        <button type="submit">提交</button>
                        <button type="button" onclick="history.go(-1)">返回</button>
                    </div>
                </div>
                <div>${error}</div>
            </form>
        </div>
    </div>
</div>
<script>
    // 异步加载 下拉框 进行回显
    $.ajax({
        url:"/bookCategory/list",
        success:function (data){
            // console.log(data);
            var options = "";
            for (var i = 0; i < data.length; i++) {
                options += "<option value='"+data[i].id+"'>"+data[i].name+"</option>";
            }
            // 放到下拉中
            $("#categoryId").append(options);
            $("#categoryId").val(${ebookEntry.categoryId});
        }
    });
</script>
</body>
</html>
