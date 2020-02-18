<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${web}/static/css/bootstrap.min.css">
    <link href="${web}/static/css/Layout.css" rel="stylesheet" type="text/css"/>
    <style>
        a {
            text-decoration: none;
        }
    </style>
</head>
<body>
<jsp:include page="${web}/common/header.jsp"></jsp:include>
<div style="position:relative;">
    <a href="${web}/dish/toDishInfoPage/1/insert" class="btn-primary btn-lg btn-primary"
       style="position: absolute;left:300px;top:150px;">新增菜品</a>

    <c:if test="${insertDish eq true}">
        <h2 class="text-success" style="position: absolute;left:550px;top:150px;">增加成功</h2>
    </c:if>
    <c:if test="${insertDish eq false}">
        <h2 class="text-danger" style="position: absolute;left:550px;top:150px;">增加失败</h2>
    </c:if>

    <c:if test="${deleteFlag eq true}">
        <h2 class="text-success" style="position: absolute;left:550px;top:150px;">删除成功</h2>
    </c:if>
    <c:if test="${deleteFlag eq false}">
        <h2 class="text-danger" style="position: absolute;left:550px;top:150px;">删除失败</h2>
    </c:if>
    <table border="1" style="position: absolute;top:200px;left:300px; width: 800px;heigth:500px; text-align: center;"
           class="table table-condensed">
        <thead>
        <tr>
            <th>序号</th>
            <th>图片</th>
            <th>菜名</th>
            <th>价格</th>
            <th>说明</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${dishes}" var="obj" varStatus="status">
            <tr name="dishValue">
                <td>${status.count}</td>
                <td><img src="" alt=""></td>
                <td>${obj.dishName}</td>
                <td>${obj.dishPrice}</td>
                <td>${obj.dishDetails}</td>
                <td>
                    <a href="${web}/dish/toDishInfoPage/${obj.dishId}/update" class="btn btn-info">编辑</a>
                    <a href="#" role="button" class="btn btn-danger" data-toggle="modal" data-target="#toDelDish">删除
                    </a>

                    <div class="modal fade" id="toDelDish" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title" id="myModalLabel">确认框</h4>
                                </div>
                                <h1 class="text-danger text-center">确定删除？</h1>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default confrimDel" data-del="${obj.dishId}" data-dismiss="modal">确定</button>
                                    <button type="button" class="btn btn-primary" data-dismiss="modal">取消</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <a href="javascript:history.go(-1)"
       style="position: absolute; top:500px; font-size: 30px;font-weight: 700;">返回上一页</a>
</div>

<jsp:include page="${web}/common/footer.jsp"></jsp:include>
<script src="${web}/static/js/jquery-3.3.1.js"></script>
<script src="${web}/static/js/bootstrap.js"></script>
<script>
    $(function () {
        $("#toDelDish .confrimDel").on("click", function () {
            var $delDishId = $(this).attr("data-del");
            window.location.href='${web}/dish/delDish/' + $delDishId;
        })
    })
</script>
</body>
</html>
