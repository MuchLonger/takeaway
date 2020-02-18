<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2019/1/10
  Time: 20:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>个人信息页</title>
    <%--<link type="text/javascript" src="js">--%>
    <link href="${web}/static/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="${web}/../static/css/information.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<%--<c:set var="goToUserNum" scope="session" value="${user.goToUserNum}"></c:set>--%>
<div class="midblock" id="midblock">
    <div class="abs">
        修改的值:&nbsp&nbsp<input type="text" class="inputSize"/>
        <span class="comfirm">确定</span>
    </div>
</div>
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
<div>
    <form action="${web}/user/updateUser" method="post">
        <input type="hidden" value="${user.goToUserNum}" name="id"/>
        <table class="one">
            <tr>
                <td style="font-size:20px;font-weight:700">
                    个人信息
                </td>
            </tr>
            <tr>
                <td>
                    帐号设置
                </td>
            </tr>
            <tbody class="tow">
            <tr>
                <td>
                    头像
                </td>
                <td>
                    <img src="${web}/../static/css/hp.jpg" alt="" class="ph">
                </td>
                <td>
                    <a href="javascript:;">修改</a>
                </td>
            </tr>
            <tr class="success">
                <td>
                    昵称
                </td>
                <td>
                    ${user.userName}
                </td>
                <td>
                    <a href="javascript:;" class="alterNick" id="alterNick"
                       name="alter" data-for="userName">修改</a>
                </td>
            </tr>
            <tr class="error">
                <td>
                    注册日期
                </td>
                <td>
                    <fmt:formatDate value="${user.userRegTime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
                </td>
                <td>
                    <a href="javascript:;" class="alterNick"></a>
                </td>
            </tr>
            <tr class="warning">
                <td>
                    绑定手机
                </td>
                <td>
                    ${user.userTel}
                </td>
                <td>
                    <a href="javascript:;" class="alterNick" name="alter" data-for="tel">换绑</a>
                </td>
            </tr>
            <tr class="info">
                <td>
                    登录密码
                </td>
                <td class="alterNick">
                    <c:choose>
                        <c:when test="${pLen <= 6}">安全强度 弱</c:when>
                        <c:when test="${pLen > 6 and pLen <= 10}">安全强度:中</c:when>
                        <c:otherwise>安全强度:强</c:otherwise>
                    </c:choose>
                </td>
                <td>
                    <a href="javascript:;" class="alterNick" name="alter" data-for="password">修改</a>
                </td>
            </tr>
            <tr>
                <td>
                    地址
                </td>
                <td>
                    ${user.userAddress}
                </td>
                <td>
                    <a href="javascript:;" class="alterNick" name="alter" data-for="addr">修改</a>
                </td>
            </tr>
            <tr>
                <td colspan="1"><a href="${web}/acc.do">返回上一页</a></td>
                <td colspan="2"><input type="submit" value="提交修改" class="btn btn-info"/></td>
            </tr>
            </tbody>
        </table>
    </form>
</div>
<div class="end">地址：gduf 电话：88888888 邮箱：lizekai@manghai.com.cn 邮编：224000</div>
<script src="${web}/../static/js/jquery-3.3.1.js"></script>
<script>
    $(function () {
        var flag = 0;
        $("a[name=alter]").click(function () {
            var pparent = $(this).parent().parent().find("td:eq(1)");
            if (flag == 0) {
                flag = 1;
                pparent.html("<input type='text' value='" + pparent.text().trim() + "'name='"+$(this).attr("data-for")+"'></input>");

            } else {
                flag = 0;
                pparent.html(pparent.find("input").val());
            }
        })

    })
</script>
</body>
</html>
