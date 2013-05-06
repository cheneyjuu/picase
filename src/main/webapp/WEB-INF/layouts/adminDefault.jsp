<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
    <title><sitemesh:title /></title>
    <link href="${ctx}/static/styles/admin.css" type="text/css" rel="stylesheet" />
    <link href="${ctx}/static/bootstrap/2.2.2/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <link href="${ctx}/static/jquery-validation/1.10.0/validate.css" type="text/css" rel="stylesheet" />
    <script src="${ctx}/static/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
    <script src="${ctx}/static/jquery-validation/1.10.0/jquery.validate.min.js" type="text/javascript"></script>
    <script src="${ctx}/static/jquery-validation/1.10.0/messages_bs_zh.js" type="text/javascript"></script>
    <%--<script type="text/javascript" src="${ctx}/static/bootstrap/responsive-nav/responsive-nav.min.js"></script>--%>
    <%--<link href="${ctx}/static/bootstrap/responsive-nav/responsive-nav.css" type="text/css" rel="stylesheet" />--%>
    <!-- HTML5 shim, for IE6-8 support of HTML5 elements. All other JS at the end of file. -->
    <!--[if lt IE 9]>
    <script src="${ctx}/static/flatui/js/html5shiv.js"></script>
    <![endif]-->
    <sitemesh:head />
</head>
<body>
    <div class="span12 row-fluid" id="container">
        <div role="navigation" id="nav" class="closed" data-spy="affix" aria-hidden="false" style="position: relative; -webkit-transition: max-height 400ms; ">
            <ul>
                <li class="active"><a href="${ctx}/admin/album/save">相册管理</a></li>
                <li><a href="${ctx}/admin/album/list/CorporateBusiness">Corporate & Business</a></li>
                <li><a href="${ctx}/admin/album/list/Fashion">Fashion</a></li>
                <li><a href="${ctx}/admin/album/list/Wedding">Wedding</a></li>
                <li><a href="${ctx}/admin/album/list/Portrait">Portrait</a></li>
                <li><a href="${ctx}/admin/about/add">About us & contact</a></li>
            </ul>
        </div>
        <div class="main"><sitemesh:body /></div>
    </div>
    <script>
        var navigation = responsiveNav("#nav");
    </script>
    <script src="${ctx}/static/bootstrap/2.2.2/js/bootstrap.min.js" type="text/javascript"></script>
</body>
</html>