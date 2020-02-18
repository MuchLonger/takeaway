<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2019/1/10
  Time: 10:35
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商店页</title>

    <link href="${web}/../static/css/ShopStore.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div class="header">
    <div class="logo fl"><img src="${web}/static/images/logo.png"/></div>
    <div class="right">
        <ul id="links">
            <li data-index="0"></li>
            <a href="/">首页</a>
            <li data-index="1"></li>
            <a href="/">用户商家</a>
            <li data-index="2"></li>
            <a href="/">联系我们</a>
        </ul>
    </div>
</div>
<c:forEach var="bus" items="${BusinessList}" varStatus="status">
    <div class="head" >
        <div class="number" style="color:white">${status.count}.</div>
        <div class="sb"><img src="${web}/${bus.localImg}" style="margin-top:20px;width: 100px;height:100px;"/></div>
        <div class="dm">
            <table>
                <tr>
                    <td style="font-size:50px;">${bus.shopName}</td>
                </tr>
                <tr>
                    <td>电话：${bus.shopTel}</td>
                </tr>
                <tr>
                    <td>地址：${bus.shopAddress}</td>
                </tr>
            </table>
        </div>
        <div>
            <a href="${web}/shop/detail/${bus.shopId}" style="font-weight: 700;font-size: 30px;color: #fff;">进入店铺</a>
        </div>
    </div>
</c:forEach>

<!--尾部开始-->
<div class="end">地址：gduf 电话：88888888 邮箱：lizekai@manghai.com.cn 邮编：224000</div>
</body>
</html>
