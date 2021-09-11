
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            <p style="font-weight: 700; font-size: 18px; margin-bottom: 20px; margin-left: 50px;">增加电子图书:</p>
            <form class="form-horizontal" action="/bookEntry/add" id="addForm" method="post">
                <div class="form-group" >
                    <label for="title" class="col-sm-4 control-label">图书名称*</label>
                    <input type="text" id="title"   name="title" style="width: 200px; height: 30px;">
                </div>
                <div class="form-group" >
                    <label for="title" class="col-sm-4 control-label">图书分类*</label>
                    <select id="categoryId" name="categoryId" style="width: 130px; height: 30px;" >
                        <option value="0">全部</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="summary" class="col-sm-4 control-label">图书摘要</label>
                    <input type="text" id="summary"  name="summary" style="width: 200px; height: 30px;">
                </div>

                <div class="form-group">
                    <label for="uploaduser" class="col-sm-4 control-label">上传人</label>
                    <input type="text" id="uploaduser"  name="uploaduser"  style="width: 200px; height: 30px;">
                </div>
                <div class="form-group">
                    <label for="createdate" class="col-sm-4 control-label">上传时间*</label>
                    <input type="text" id="createdate"  name="createdate"  style="width: 200px; height: 30px;">(yyyy-MM-dd)
                </div>

                <div class="form-group">
                    <div style="margin-left: 150px;">
                        <button type="button" id="send">提交</button>
<%--                            <button type="submit" id="put">提交</button>--%>
                        <button type="button" onclick="history.go(-1)">返回</button>
                    </div>
                </div>
                <div style="color: red">${error}</div>
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

        }
    });

    // 对图书名称和上传事件时间做非空判断
    $("#send").click(function () {
        if(!is_null("title")){
            alert("图书名称不能为空!");
        }else if(!is_null("createdate")){
            alert("上传不能为空!");
        }else {
            console.log(111)
            $.ajax({
                url:"/bookEntry/add",
                data:$("#addForm").serialize(), // 把表单值转换成JSON串传到后台。
                success:function (data) {
                    // console.log(data);
                    if(data.code ==200){
                        alert(data.msg);
                        // 是跳到后台地址，list
                        location.href="/bookEntry/list";
                    }else{ // 添加失败
                        alert(data.msg);
                        location.href="/jsp/update.jsp";
                    }

                }
            });
        }
    });

    function is_null(id) {
        // 获取id标签的值
        var value = $("#"+id).val();
        // 简单的正则
        var regrep = /\S/;

        // 判断标签的值是否是非空
       return  regrep.test(value);
    }

</script>
</body>
</html>
