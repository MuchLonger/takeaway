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
    <style>

    </style>
</head>
<body>
<%--<c:set var="goToUserNum" scope="session" value="${bs.goToUserNum}"></c:set>--%>
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
    <form action="${web}/shop/editShopInfo" method="post" enctype="multipart/form-data">
        <input type="hidden" value="${bs.goToUserNum}" name="goToUserNum"/>
        <input type="hidden" value="${bs.shopId}" name="shopId"/>
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
                    <img src="${web}/${bs.localImg}" alt="" class="ph" id="viewImg">
                </td>
                <td>
                    <input type="file" name="file" value="上传" class="btn btn-primary" onchange="uploadImg(this)"
                           id="fileUpload"/>
                </td>
            </tr>
            <tr class="success">
                <td>
                    昵称
                </td>
                <td>
                    ${bs.shopName}
                </td>
                <td>
                    <a href="javascript:;" class="alterNick" id="alterNick"
                       name="alter" data-for="shopName">修改</a>
                </td>
            </tr>
            <tr class="info">
                <td>
                    营业状态
                </td>
                <td>
                    <select name="operatingStatus" id="" class="form-control">
                        <option value="0" <c:if test="${bs.operatingStatus eq 0}">selected</c:if>>休业中</option>
                        <option value="1" <c:if test="${bs.operatingStatus eq 1}">selected</c:if>>营业中</option>
                    </select>
                </td>
                <td>
                    <a href="javascript:;" class="alterNick"></a>
                </td>
            </tr>
            <tr class="info">
                <td>
                    商品折扣
                </td>
                <td>
                    ${bs.shopDiscount}
                </td>
                <td>
                    <a href="javascript:;" class="alterNick" data-for="shopDiscount" name="alter">修改</a>
                </td>
            </tr>
            <tr class="warning">
                <td>
                    绑定手机
                </td>
                <td>
                    ${bs.shopTel}
                </td>
                <td>
                    <a href="javascript:;" class="alterNick" name="alter" data-for="shopTel">换绑</a>
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
                    店铺地址
                </td>
                <td>
                    ${bs.shopAddress}
                </td>
                <td>
                    <a href="javascript:;" class="alterNick" name="alter" data-for="shopAddress">修改</a>
                </td>
            </tr>
            <tr>
                <td colspan="1"><a href="javascript:history.go(-1)" class="btn btn-info">返回上一页</a></td>
                <td colspan="2"><input type="submit" value="提交修改" class="btn btn-info" id="submitUpdateVal"/></td>
                <td colspan="2"><a href="${web}/dish/toDishPage/${bs.shopId}" class="btn btn-primary">修改菜谱</a></td>
            </tr>
            </tbody>
        </table>
    </form>
</div>
<div class="end">地址：gduf 电话：88888888 邮箱：lizekai@manghai.com.cn 邮编：224000</div>
<script src="${web}/../static/js/jquery-3.3.1.js"></script>
<script>

    function uploadImg(fileDom) {
        //获得文件名
        var fileName = fileDom.files[0].name;
        var subFileName = fileName.split(".");
        var sufFileName = subFileName[1].toLocaleLowerCase();

        if (sufFileName != "jpg" && sufFileName != "png" && sufFileName != "jpeg") {
            alert("你上传的文件不符合要求");
        } else {
            // 获取图片数据对象
            var file = fileDom.files[0];
            //对图片内容进行base64编码
            var reader = new FileReader();
            reader.readAsDataURL(file);

            //确保文件成功获取，base64数据量比较大
            reader.onload = function (event) {
                var e = event || window.event;
                var img = document.getElementById("viewImg");
                img.src = e.target.result;
                //或者 img.src = this.result; 因为e.target == this
            }
        }
    }

    $(function () {
        $("#submitUpdateVal").on("click",function () {
            //获取到文件名，以下的值为 D:/fakepath/文件名.jpg，想要只有文件名.jpg的话可以使用split+lastIndexOf("/")
            var fileName = $("#fileUpload").val();
            //以"."分割,即可获取后缀
            var subFileName = fileName.split(".");
            //分成两部分取后面部分，并忽略大小写获得后缀名
            var sufFileName = subFileName[1].toLocaleLowerCase();
            if (sufFileName != "jpg" && sufFileName != "png" && sufFileName != "jpeg") {
                alert("你上传的文件不符合要求");
                return false;
            }
        })

        var $aAlter = $("a[name=alter]");
        $aAlter.attr("class", "btn btn-warning");
        var flag = 0;
        $("a[name=alter]").click(function () {
            var pparent = $(this).parent().parent().find("td:eq(1)");
            if (flag == 0) {
                flag = 1;
                pparent.html("<input type='text' value='" + pparent.text().trim() + "'name='" + $(this).attr("data-for") + "'></input>");

            } else {
                flag = 0;
                pparent.html(pparent.find("input").val());
            }
        })

    })
</script>
</body>
</html>
