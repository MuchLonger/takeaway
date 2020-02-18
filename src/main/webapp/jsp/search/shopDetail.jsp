<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>店铺信息</title>
    <link href="${web}/../static/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="${web}/static/css/Layout.css" rel="stylesheet" type="text/css"/>

</head>
<body>
<jsp:include page="${web}/common/header.jsp"></jsp:include>

<div style="position:relative;">
    <table border="1" style="position: absolute;top:200px;left:300px; width: 800px;heigth:500px; text-align: center;"
           class="table table-condensed">
        <thead>
        <tr>
            <th>序号</th>
            <th>图片</th>
            <th>菜名</th>
            <th>价格</th>
            <th>说明</th>
            <th>点菜</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${dishes}" var="obj" varStatus="status">
            <tr name="dishValue">
                <input type="hidden" name="shopId" value="${obj.shopId}"/>
                <input type="hidden" name="dishId" value="${obj.dishId}"/>
                <td>${status.count}</td>
                <td></td>
                <td>${obj.dishName}</td>
                <td>${obj.dishPrice}</td>
                <td>${obj.dishDetails}</td>
                <td><input type="checkbox" style="width: 30px;height: 30px;text-align: center;" name="isCheck"></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <a href="javascript:history.go(-1)"
       style="position: absolute; top:500px; font-size: 30px;font-weight: 700;">返回上一页</a>

    <td><a href="javascript:;" class="makeOrder"
           style="position: absolute; top:500px; right:0;font-size: 30px;font-weight: 700;">下单</a></td>
</div>
<script src="${web}/../static/js/jquery-3.3.1.js"></script>
<script>
    $(function () {
        $(".makeOrder").click(function () {
            var arr = [];
            $("input[name=isCheck]").each(function (index) {
                var shopId = $(this).parent().parent().find($("input[name=shopId]")).val();
                var dishId = $(this).parent().parent().find($("input[name=dishId]")).val();
                if ($(this).prop("checked")) {
                    arr.push({"shopId": shopId, "dishId": dishId});
                }
            })
            <c:if test="${not empty bs}">
            $.ajax({
                url: '${web}/shop/bsOrder',
                data: JSON.stringify(arr),
                type: "post",
                contentType: "application/json",
                success: function (data) {
                    window.location.href = "${web}/shop/toShopOrderResult/" + data.code;
                }
            })
            </c:if>
            <c:if test="${not empty user}">
            $.ajax({
                url: '${web}/shop/order',
                data: JSON.stringify(arr),
                type: "post",
                contentType: "application/json",
                success: function (data) {
                    window.location.href = "${web}/shop/toOrderResult/" + data.code;
                },
                error: function (xhr) {
                    //alert(xhr.status);
                }
            })
            </c:if>
        })
    })
</script>
<jsp:include page="${web}/common/footer.jsp"></jsp:include>
</body>
</html>
