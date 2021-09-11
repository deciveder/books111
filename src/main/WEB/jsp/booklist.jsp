
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>销售信息页</title>
    <!--引入css支持-->
    <link rel="stylesheet" href="/static/css/bootstrap.css" />
    <!--如果要引用js要先引入支持-->
    <script type="text/javascript" src="/static/js/jquery-2.1.0.min.js"></script>
    <style>
        tr:nth-child(odd){
            background-color: #8ded97;
        }
        tr:last-of-type{
            background-color: #ffffff;
        }

    </style>
</head>
<body>
<div class="container">
    <!--上-->
    <div class="row" style="margin-top: 20px;">
        <div class="col-md-6">
            <form action="${pageContext.request.contextPath }/bookEntry/list" method="post" id="form1" class="form-inline">
                <input type="hidden" value="1" name="pageNo" id="pageNo">
                <div class="form-group">
                  图书分类:
                    <select id="categoryId" name="categoryId" style="width: 130px; height: 30px;" >
                        <option value="0">全部</option>
                    </select>
                    <button type="submit" class="btn btn-default">查询</button>
                </div>
            </form>
        </div>
        <div class="col-md-6 ">
            <button type="button"><a href="/jsp/add.jsp">新增电子图书</a></button>
        </div>
    </div>
    <!--下-->
    <div style="margin-left: 300px; margin-bottom:50px;font-weight: bold;font-size: 20px">电子图书列表</div>
    <div class="row">
        <div class="col-sm-12" >
            <table class="table table-bordered ">
                <tr class="info text-center">
                    <th>图书编号</th>
                    <th>图书名称</th>
                    <th>图书摘要</th>
                    <th>上传人</th>
                    <th>上传时间</th>
                    <th>操作</th>
                </tr>
                <c:if test="${ not empty pageInfo}">
                    <c:forEach var="book" items="${pageInfo.list}">
                        <tr class=" text-center">
                            <td>${book.id}</td>
                            <td>${book.title}</td>
                            <td>${book.summary}</td>
                            <td>${book.uploaduser}</td>
                            <td><fmt:formatDate value="${book.createdate}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
                            <td>
                                <a href="/bookEntry/toUpdate/${book.id}">修改</a>
                                <a href="javascript:del(${book.id})">删除</a>
                            </td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td colspan="6">
                            <div class="col-sm-8 col-sm-offset-3" style="padding-left: 30px;">
                                <div class="btn-group" role="group " aria-label="... ">

                                    <c:if test="${pageInfo.pageNum >1}">
                                        <button type="button " class="btn btn-default" onclick="page_nav(1)" >首页</button>
                                        <button type="button " class="btn btn-default" onclick="page_nav(${pageInfo.pageNum-1})">上一页</button>
                                    </c:if>
                                    <c:if test="${pageInfo.pageNum<pageInfo.pages}">
                                        <button type="button " class="btn btn-default " onclick="page_nav(${pageInfo.pageNum+1})">下一页</button>
                                        <button type="button " class="btn btn-default " onclick="page_nav(${pageInfo.pages})">尾页</button>
                                    </c:if>
                                   <span style="position: relative; top: 7px;left: 5px"> 第${pageInfo.pageNum}/共${pageInfo.pages}页(${pageInfo.total}条记录)</span>
                                </div>
                            </div>
                        </td>
                    </tr>
                </c:if>

                <tr>
                    <td colspan="6">
                        <td>
                        <span style="color: red">${pointout}</span>
                        </td>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>
<script>
    // 删除
    function del(id){
        if(confirm("您确定删除吗?")){
            location.href= "/bookEntry/del?id="+id;
        }
    }

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

            // 回显
            $("#categoryId").val(${categoryId});
        }
    });


    // 翻页 上下页事件
    function page_nav(pageNo){
        // 将pageNo给隐藏域
        var elementById = document.getElementById("form1");
        elementById.pageNo.value=pageNo;

        // 提交表单发送请求
        elementById.submit();
    }

</script>

</body>
</html>
