<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>更新结果</title>
    <link href="${web}/../static/css/Layout.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<jsp:include page="${web}/common/header.jsp"></jsp:include>
<c:if test="${updateResult eq true}">
    <div style="position: relative">
        <h1 style="position: absolute;top:200px;left:700px;">更新成功</h1>
        <a href=${web}/shop/toEditShopInfo/${bs.shopId} style="position: absolute;top:250px;left:700px; font-size:26px;font-weight:700;">返回上一页</a>
    </div>
</c:if>
<c:if test="${updateResult eq false}">
    <h5 style="margin: 200px auto 0 auto">更新失败</h5>
    <a href="${web}/shop/toEditShopInfo/${bs.shopId}" style="margin: 200px auto 0 auto;font-size:26px;font-weight:700;">返回上一页</a>
</c:if>
<jsp:include page="${web}/common/footer.jsp"></jsp:include>
</body>
</html>
