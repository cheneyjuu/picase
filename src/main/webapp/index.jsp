<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title></title>
    <link href="${ctx}/static/bootstrap/2.2.2/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <style type="text/css">

        img#fotografia:hover{
            opacity : 0.70;
            filter : alpha(opacity=70);
        }
    </style>
</head>
<body>
<div class="span12" style="height: 10%;"></div>
<div class="span12 row-fluid">
    <div class="span2 row-fluid"></div>
    <div class="span8 row-fluid">
        <span style="padding-left: 10%; padding-right: 10%">
            <a href="${ctx}/picture/index"><img id="fotografia" src="${ctx}/static/images/web-top-DG.jpg" alt="wedding, commercial photography" style="border-style: none" /></a>
        </span>
        <span>
            <a href="http://daniel-photo.lofter.com/"><img id="fotografia" src="${ctx}/static/images/web-top-Dan.jpg" alt="artistic photography" style="border-style: none" /></a>
        </span>
    </div>
    <div class="span2 row-fluid"></div>
</div>

</body>
</html>