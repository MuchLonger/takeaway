<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="${web}/../static/css/Layout.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<jsp:include page="${web}/common/header.jsp"></jsp:include>
<c:if test="${orderResult eq true}">
    <div style="position: relative">
        <h1 style="position: absolute;top:200px;left:700px;">新增订单成功</h1>
    </div>
</c:if>
<c:if test="${orderResult eq false}">
    <div style="position: relative">
        <h1 style="position: absolute;top:200px;left:700px;">新增订单失败</h1>
    </div>
</c:if>
<div style="position: relative">
    <c:if test="${not empty user}">
        <a href="${web}/cart.do"><h1 style="position: absolute;top:250px;left:700px;">返回订单</h1></a>
    </c:if>
    <c:if test="${not empty bs}">
        <a href="${web}/shopCart/${bs.goToUserNum}"><h1 style="position: absolute;top:250px;left:700px;">返回订单</h1></a>
    </c:if>
</div>
<jsp:include page="${web}/common/footer.jsp"></jsp:include>
</body>
</html>


