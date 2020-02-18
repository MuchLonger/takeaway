<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="${web}/../static/css/Layout.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<jsp:include page="${web}/common/header.jsp"></jsp:include>
<div style="position: relative">
    <h1 style="position: absolute;top:200px;left:700px;">请<a href="${web}/jsp/reg/login.jsp" style="color:#ff0246;">登录</a></h1>
</div>

<jsp:include page="${web}/common/footer.jsp"></jsp:include>
</body>
</html>


