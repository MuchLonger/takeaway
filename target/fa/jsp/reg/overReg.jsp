<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2019/1/9
  Time: 15:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册成功页</title>
    <link href="${web}/../static/css/Layout.css" rel="stylesheet" type="text/css"/>

</head>
<body>
<div class="header">
    <div class="logo fl"><img src="${web}/../static/images/logo.png"/></div>
    <div class="right">
        <ul id="links">
            <li data-index="0"></li>
            <a href="${web}/../index.jsp">首页</a>
            <li data-index="1"></li>
            <a href="javascript:void(0);">用户商家</a>
            <li data-index="2"></li>
            <a href="javascript:void(0);">联系我们</a>
        </ul>
    </div>
</div>

<div class="regSuc"><h1>注册${identity}成功!</h1></div>


<div class="end">
    <div class="cont">
        <div class="cont_a fl">地址：gduf 电话：88888888 邮箱：lizekai@manghai.com.cn 邮编：224000<br/>
        </div>
        <div class="cont_b fl"><img src="${web}/../static/images/008.jpg"/></div>
    </div>
</div>
</body>
</html>
