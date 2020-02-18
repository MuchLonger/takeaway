<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="${web}/static/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="${web}/static/css/Layout.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<jsp:include page="${web}/common/header.jsp"></jsp:include>
<div style="padding-top:150px;width: 1024px;height: 500px;margin-bottom: 200px;">
    <table class="table table-striped ">
        <thead>
        <tr>
            <th>序号</th>
            <th>菜谱</th>
            <th>菜价格</th>
            <th>订单时间</th>
            <th>送往地址</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="ord" items="${page.list}" varStatus="status">
            <tr>
                <td>${status.count}</td>
                <td>${ord.dishName}</td>
                <td>${ord.dishPrice}</td>
                <td>${ord.orderTime}</td>
                <td>${ord.handToAddr}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <nav aria-label="Page navigation">
        <ul class="pagination" id="pageUl">
            <li>
                <a href="#" aria-label="Previous" data-for="page-prev">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
            <li>
                <a href="#" aria-label="Next" data-for="page-next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        </ul>
    </nav>
    <a href="javascript:history.go(-1)"
       style="position: absolute; bottom:100px; font-size: 30px;font-weight: 700;">返回上一页</a>
</div>
<jsp:include page="${web}/common/footer.jsp"></jsp:include>
<script src="${web}/static/js/jquery-3.3.1.js"></script>
<script>
    $(function () {
        // 以下用来动态的显示页码
        var pages=${page.pages};
        var shopName='${bs.shopName}';
        var $midLi=$("#pageUl li:eq(1)");
        for (var i = 1;i<=pages;i++){
            var pageNumHtml="<li class='pageNumLi'><span style='cursor:pointer;'>"+i+"</span></li>";
            $midLi.before(pageNumHtml);
        }

        // 以下是实现分页效果
        $("a[data-for^=page]").click(function () {
            // 获取当前点击的对象
            var val = $(this).attr("data-for");
            // 等于默认设置(1)的页面
            var pageNum = ${page.pageNum};
            switch (val) {
                case "page-prev":
                    pageNum = pageNum - 1;
                    break;
                case "page-next":
                    pageNum = pageNum + 1;
                    break;
            }
            // 用以保证pageNum不会比最小页码（1）小，且不会超过最大页码
            if (pageNum <= 0) {
                pageNum = 1;
            } else if (pageNum >pages) {
                pageNum =pages;
            }

            // 提交到对应页面
            window.location.href="${web}/shop/shopOrder/"+shopName+"/"+pageNum;
        })

        $(".pageNumLi span").on("click",function () {
            window.location.href="${web}/shop/shopOrder/"+shopName+"/"+$(this).text();
        })

    })
</script>
</body>
</html>
