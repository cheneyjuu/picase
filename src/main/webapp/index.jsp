<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title></title>
    <style type="text/css">

        img#fotografia:hover{
            opacity : 0.70;
            filter : alpha(opacity=70);
        }
    </style>
</head>
<body>
<div style="margin-top: 10%;">
    <div style="width: 45%; float:left;">
        <a href="/index"><img id="fotografia" src="${ctx}/static/images/web-top-DG.jpg" alt="wedding, commercial photography" style="border-style: none" /></a>
    </div>
    <div style="width: 45%; float:left;">
        <a href="http://daniel-photo.lofter.com/"><img id="fotografia" src="${ctx}/static/images/web-top-Dan.jpg" alt="artistic photography" style="border-style: none" /></a>
    </div>
</div>

</body>
</html>