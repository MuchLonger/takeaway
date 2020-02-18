<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${web}/static/css/bootstrap.min.css">
    <link href="${web}/static/css/Layout.css" rel="stylesheet" type="text/css"/>
    <style>
        .input-group {
            margin-bottom: 20px;
        }
        .midDiv {
            position: absolute;
            top: 200px;
            left: 350px;
        }
    </style>
</head>
<body>
<jsp:include page="${web}/common/header.jsp"></jsp:include>

<div style="position: relative;">
    <c:if test="${updateFlag eq true}">
        <h2 class="text-success" style="position: absolute;left:500px;top:150px;">更新成功</h2>
    </c:if>
    <c:if test="${updateFlag eq false}">
        <h2 class="text-danger" style="position: absolute;left:300px;top:150px;">更新失败</h2>
    </c:if>
    <form
            <c:if test="${operation eq 'update'}">
                action="${web}/dish/updateDish"
            </c:if>
            <c:if test="${operation eq 'insert'}">
                action="${web}/dish/insertDish"
            </c:if>
            method="post">
        <div style="width: 960px;height:800px;" class="midDiv">
            <input type="hidden" name="shopId" value="${bs.shopId}">
            <input type="hidden" name="dishId" value="${dish.dishId}">
            <div class="input-group">
                <span class="input-group-addon" id="basic-addon1">菜名</span>
                <input type="text" class="form-control" placeholder="菜名" aria-describedby="basic-addon1"
                       name="dishName" value="${dish.dishName}">
            </div>
            <div class="input-group">
                <span class="input-group-addon" id="basic-addon2">菜的价格</span>
                <input type="text" class="form-control" placeholder="菜的价格" aria-describedby="basic-addon1"
                       name="dishPrice" value="${dish.dishPrice}">
            </div>
            <div class="input-group">
                <span class="input-group-addon" id="basic-addon3">菜的信息</span>
                <input type="text" class="form-control" placeholder="菜的信息" aria-describedby="basic-addon1"
                       name="dishDetails" value="${dish.dishDetails}">
            </div>
            <a href="${web}/dish/toDishPage/${bs.shopId}" class="btn btn-info">返回上一页</a>

            <c:if test="${operation eq 'update'}">
                <input type="submit" value="提交修改" class="btn btn-info"/>
            </c:if>
            <c:if test="${operation eq 'insert'}">
                <input type="submit" value="新增菜品" class="btn btn-info"/>
            </c:if>
        </div>
    </form>
</div>

<jsp:include page="${web}/common/footer.jsp"></jsp:include>
</body>
</html>
