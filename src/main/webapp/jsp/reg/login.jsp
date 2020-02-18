<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2019/1/8
  Time: 9:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录页</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">

    <link href="${web}/../static/css/Layout.css" rel="stylesheet" type="text/css"/>

</head>
<body>
<!--顶部开始-->
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
<!--顶部结束-->
<!--菜单开始-->
<div class="menu">
    <div class="menu_left fl">全部商品分类</div>
    <div class="menu_center fl">
        <div class="dh_topd"><A href="list">个人信息</A></div>
        <div class="dh_topd"><A href="../../index.jsp">我的订单</A></div>
        <div class="dh_topd"><A href="../../index.jsp">联系我们</A></div>
    </div>
</div>
<div class="clearall"></div>
<!--菜单结束-->

<!--主体开始-->
<div class="main mt10">
    <div class="mleft fl ah">
        <!--登录开始-->
        <div class="login_b fl">
            <p class="title fl">用户登录</p>
            <div class="login_d fl">
                <form method="post" action="${pageContext.request.contextPath}/login.do">
                    <table width="350" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td width="100" height="40" align="middle" colspan=2>
                                <font color="red"><h5>${error}</h5>
                                </font>  <!--s:property value="message"/-->
                            </td>
                        </tr>
                        <tr>
                            <td width="100" height="40" align="right" valign="middle">用户名：</td>
                            <td width="250" align="left" valign="middle"><input name="account" type="text"
                                                                                class="login_input"/></td>
                        </tr>
                        <tr>
                            <td width="100" height="40" align="right" valign="middle">密码：</td>
                            <td width="250" align="left" valign="middle"><input name="password" type="password"
                                                                                class="login_input"/></td>
                        </tr>
                        <tr>
                            <td height="50" colspan="2" align="center" valign="middle"><input type="radio"
                                                                                              name="radiobutton"
                                                                                              value="radiobutton"/>
                                请保存我这次的登陆信息
                            </td>
                        </tr>
                        <tr>
                            <td height="50" colspan="4" align="center" valign="middle">
                                <!-- input type="image" src="images/d017.jpg"/-->
                                <input data-mtevent="login.mobile.submit" type="submit" class="btn" name="commit"
                                       value="            登录             ">
                                <!--   onclick="window.location.href='login.action'" onClick="location='login.action'"  -->
                        </tr>
                        <tr>
                            <td height="35" colspan="2" align="center" valign="middle"><a href="${web}/jsp/reg/userReg.jsp">注册</a> &nbsp&nbsp找回密码</td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="end">
    <div class="cont">
        <div class="cont_a fl">地址：gduf 电话：88888888 邮箱：lizekai@manghai.com.cn 邮编：224000<br/>
        </div>
        <div class="cont_b fl"><img src="${web}/../static/images/008.jpg"/></div>
    </div>
</div>
</body>
</html>
