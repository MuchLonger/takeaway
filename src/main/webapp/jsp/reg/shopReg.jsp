<%@ page language="java" pageEncoding="UTF-8" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

    <title>商家注册页</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">

    <link href="${web}/../static/css/Layout.css" rel="stylesheet" type="text/css"/>
</head>

<body>
<!--顶部结束-->

<!--头部搜索开始-->
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
<!--头部搜索结束-->

<!--菜单开始-->
<div class="menu">
    <div class="menu_left fl">全部商品分类</div>
    <div class="menu_center fl">
        <div class="dh_topd"><A href="../../index.jsp">网站首页</A></div>
        <div class="dh_topd"><A href="../../index.jsp">购物流程</A></div>
        <div class="dh_topd"><A href="../../index.jsp">联系我们</A></div>
    </div>
</div>
<div class="clearall"></div>
<!--菜单结束-->

<!--主体开始-->
<div class="main mt10">
    <div class="mleft fl ah">
        <!--注册开始-->
        <div class="reg_a jiacu">商家注册</div>
        <div class="reg_b fl">填写注册信息</div>
        <div class="reg_c fl ah">
            <form action="${pageContext.request.contextPath}/regb.do" method="post">
                <table width="350" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td width="100" height="40" align="middle" colspan=2></td>
                    </tr>
                    <tr>
                        <td width="100" height="40" align="right" valign="middle">账&nbsp&nbsp&nbsp号：</td>
                        <td width="250" align="left" valign="middle"><input name="userName" type="text"
                                                                            class="login_input"/></td>
                    </tr>
                    <tr>
                        <td width="100" height="40" align="right" valign="middle">密&nbsp&nbsp&nbsp码：</td>
                        <td width="250" align="left" valign="middle"><input name="password" type="password"
                                                                            class="login_input"/></td>
                    </tr>
                    <tr>
                        <td width="100" height="40" align="right" valign="middle">店&nbsp&nbsp&nbsp名：</td>
                        <td width="250" align="left" valign="middle"><input name="XiaoName" type="text"
                                                                            class="login_input"/></td>
                    </tr>
                    <tr>
                        <td width="100" height="40" align="right" valign="middle">电&nbsp&nbsp&nbsp话：</td>
                        <td width="250" align="left" valign="middle"><input name="Tel" type="text"
                                                                            class="login_input"/>
                        </td>
                    </tr>
                    <tr>
                        <td width="100" height="40" align="right" valign="middle">地&nbsp&nbsp&nbsp址：</td>
                        <td width="250" align="left" valign="middle"><input name="addr" type="text" class="login_input"/>
                        </td>
                    </tr>
                    <tr>
                        <td height="50" colspan="4" align="center" valign="middle" class="tt">
                            <input type="submit" class="btn" name="regValue"
                                   value="立即注册">
                            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" class="btn"
                                                                                               name="commit"
                                                                                               value="会员注册"
                                                                                               onclick="window.location.href = 'userReg.jsp'">
                </table>
            </form>
        </div>
        <!--注册结束-->
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
