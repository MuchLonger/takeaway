<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>首页</title>
    <link href="${web}/../static/css/Layout.css" rel="stylesheet" type="text/css"/>
</head>

<body>

<div class="header">
    <div class="logo fl"><img src="${web}/../static/images/logo.png"/></div>
    <div class="right">
        <ul id="links">
            <li data-index="0"></li>
            <a href="${web}/index.jsp">首页</a>
            <li data-index="1"></li>
            <a href="javascript:void(0);">用户商家</a>
            <li data-index="2"></li>
            <a href="javascript:void(0);">联系我们</a>
        </ul>
    </div>
</div>
<!--头部搜索结束-->
<!--菜单开始-->
<div class="menu">
    <div class="menu_left fl">全部商品分类</div>
    <div class="menu_center fl">
        <div class="dh_topd"><A href="list">网站首页</A></div>
        <div class="dh_topd"><A href="index.jsp">购物流程</A></div>
        <div class="dh_topd"><A href="index.jsp">联系我们</A></div>
    </div>
</div>
<div class="clearall"></div>
<!--菜单结束-->
<div class="background">
    <div class="search_from">
        <div class="quan" style="line-height: 30px; ">
            <c:if test="${empty user && empty bs}">
                <a class="dls" href="${web}/jsp/reg/login.jsp">登录</a>
                <a class="zc" href="${web}/jsp/reg/userReg.jsp">注册</a>
            </c:if>
            <c:if test="${not empty user}">
                <c:if test="${user.role eq 'sys'}">
                    <c:set var="goToUserNum" value="${goToUserNum}" scope="session"></c:set>
                    <a class="dl" href="${web}/acc.do">${role}：${userName}</a>
                    <a class="zc" href="${web}/cart.do">管理商户</a>
                    <a class="zc" href="${web}/logout.do/${user.role}">注销</a>
                </c:if>
                <c:if test="${user.role eq 'user'}">
                    <c:set var="goToUserNum" value="${goToUserNum}" scope="session"></c:set>
                    <a class="dl" href="${web}/acc.do">${role}：${userName}</a>
                    <a class="zc" href="${web}/cart.do">查询订单</a>
                    <a class="zc" href="${web}/logout.do/${user.role}">注销</a>
                </c:if>
            </c:if>
            <c:if test="${not empty bs}">
                <c:set var="goToUserNum" value="${bs.goToUserNum}" scope="session"></c:set>
                <a class="dl" href="${web}/shop/toEditShopInfo/${bs.shopId}">${role}：${userName}</a>
                <a class="zc" href="${web}/shop/shopOrder/${bs.shopName}/1">店铺订单</a>
                <a class="zc" href="${web}/shopCart/${bs.goToUserNum}">查询订单</a>
                <a class="zc" href="${web}/logout.do/${bs.role}">注销</a>
            </c:if>
        </div>
        <div><input id="borderSearch" name="search" type="text" class="s_input" autofocus="autofocus"
                    placeholder="请输入地址..."/></div>
        <a href="" class="flv" id="search" onclick="sendValue()">搜索</a>
    </div>
</div>

<!--尾部开始-->
<div class="end">
    <div class="cont">
        <div class="cont_a fl">地址：gduf 电话：88888888 邮箱：lizekai@manghai.com.cn 邮编：224000<br/>
        </div>
        <div class="cont_b fl"><img src="${web}/../static/images/008.jpg"/></div>
    </div>
</div>

<script type="text/javascript">
    function sendValue() {
        var searchValue = document.getElementById("borderSearch").value;

        var aHref = document.getElementById("search");
        aHref.setAttribute("href", "http://localhost:8080/sear.do/" + searchValue);
    }
</script>
</body>
</html>
