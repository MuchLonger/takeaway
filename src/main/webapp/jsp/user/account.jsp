<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2019/1/10
  Time: 21:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>修改信息</title>

    <link href="${web}/../static/css/accout.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="header">
    <div class="logo fl"><img src="${web}/static/images/logo.png"/></div>
    <div class="right">
        <ul id="links">
            <li data-index="0"></li>
            <a href="/">首页</a>
            <li data-index="1"></li>
            <a href="javascript:;">用户商家</a>
            <li data-index="2"></li>
            <a href="javascript:;">联系我们</a>
        </ul>
    </div>
</div>
<div class="hui">
    <div class="dd">
        <div class="dleft">
            <table >
                <tr>
                    <td><div class="dh_topd"><a href="${web}/cart.do">一个月订单</a></div></td>
                </tr>
                <tr>
                    <td><div class="dh_topd"><a href="javascript:;">我的帐号</a></div></td>
                </tr>
                <tr>
                    <td ><div class="dh_topd"><a href="javascript:;">我的收藏</a></div></td>
                </tr>
            </table>
        </div>
        <div class="dright">
            <div class="container">
            <table class="one">
                <tr><td>我&nbsp&nbsp的&nbsp&nbsp头&nbsp&nbsp像:&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td><img src="${web}/static/css/hp.jpg" class="ph"> </tr>
                <tr><td>用&nbsp&nbsp户 :&nbsp&nbsp${user.userName}</td></tr>
                <tr><td>手&nbsp&nbsp机&nbsp&nbsp号:&nbsp&nbsp${userTel}</td></tr>
                <c:set var="goToUserNum" scope="session" value="${user.goToUserNum}"></c:set>
                <tr><td><a href="${pageContext.request.contextPath}/info.do" class="change">修改</a> </td></tr></table>
        </div>
    </div>
</div>
<!--尾部开始-->
<div class="end">地址：gduf 电话：88888888 邮箱：lizekai@manghai.com.cn 邮编：224000<br/>
</div>
<!--尾部结束-->
</body>
</html>
