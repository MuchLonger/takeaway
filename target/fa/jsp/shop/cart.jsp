<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2019/1/10
  Time: 14:44
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>订单页</title>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <link href="${web}/../static/css/cart.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<c:set var="goToUserNum" scope="session" value="${user.goToUserNum}"></c:set>
<div class="header">
    <div class="logo fl"><img src="${web}/../static/images/logo.png"/></div>
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
<div class="hui">
    <div class="dd">
        <div class="dleft">
            <table class="one">
                <tr>
                    <td>
                        <div class="dh_topd"><a href="javasript:void(0);">一个月订单</a></div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="dh_topd"><a href=${web}/shop/toEditShopInfo/${bs.shopId}>我的帐号</a></div>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>
            </table>
        </div>
        <div class="dright">
            <div class="xinxi">
                <table>
                    <tr>
                        <td>订单内容
                            <lable class="n"/>
                            商家电话
                            <lable class="o"/>
                            支付金额
                            <lable class="e"/>
                            操作
                        </td>
                    </tr>
                </table>
            </div>
            <c:forEach var="ord" items="${orderList}" varStatus="status">
                <div class="neir">
                    <table class="two">
                        <tr>
                            <td><a href="${web}/shop/toShop/${ord.shopName}" ><span style="color:#ff6932;font-size:20pt;font-weight:700; font-family:楷体 ;">${ord.shopName}</span></a>
                            </td>
                        </tr>
                        <tr>
                            <td><span style="font-size:10pt; font-family:楷体">${ord.orderTime}</span></td>
                        </tr>
                        <tr>
                            <td><span style="font-size:10pt; font-family:楷体">订单号：${ord.orderNumber}</span></td>
                        </tr>
                    </table>
                    <div class="dh">${userTel}</div>
                    <table class="je">
                        <tr>
                            <td>￥${ord.dishPrice}</td>
                        </tr>
                    </table>
                    <div class="btn"><a href="${web}/shop/toShop/${ord.shopName}"><input type="submit" class="bs" name="commit" value="再来一单 "></a></div>
                </div>
                <div class="xq">
                    <div class="tleft">
                        <table class="three">
                            <tr>
                                <td style="font-size:20px; color:#565555">订单详情</td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                        ${ord.dishName}&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp${ord.dishPrice}
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    包装费：&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp￥0
                                </td>
                            </tr>
                        </table>
                        <table class="froe">
                            <tr>
                                <td style="font-size:25px; color:#565555">
                                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp实际付款：${ord.dishPrice}
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="tright">
                        <table class="five">
                            <tr>
                                <td>地址：${ord.handToAddr}</td>
                            </tr>
                            <tr>
                                <td>姓名：${userName}（先生）</td>
                            </tr>
                            <tr>
                                <td>电话：${userTel}</td>
                            </tr>
                            <tr>
                                <td>备注：（无）</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
<!--尾部开始-->
<div class="end">地址：gduf 电话：88888888 邮箱：lizekai@manghai.com.cn 邮编：224000</div>
</body>
</html>
