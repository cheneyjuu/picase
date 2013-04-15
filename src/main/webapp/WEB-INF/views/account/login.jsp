<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ page import="org.apache.shiro.authc.ExcessiveAttemptsException"%>
<%@ page import="org.apache.shiro.authc.IncorrectCredentialsException"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<title>登录页</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${ctx}/static/styles/default.css" rel="stylesheet">
    <!-- Loading Flat UI -->
    <link href="${ctx}/static/flatui/css/bootstrap.css" rel="stylesheet">
    <link href="${ctx}/static/flatui/css/flat-ui.css" rel="stylesheet">

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements. All other JS at the end of file. -->
    <!--[if lt IE 9]>
    <script src="${ctx}/static/flatui/js/html5shiv.js"></script>
    <![endif]-->
    <style type="text/css">
        body {
            background: #ECF0F1;
            color: #27AE60;
        }
    </style>
	<script>
		$(document).ready(function() {
			$("#loginForm").validate();
		});
	</script>
</head>

<body>
<div class="container well-large">
	<form id="loginForm" action="${ctx}/login" method="post" class="form-horizontal">

        <div class="container">
            <div class="row">
                <div class="span4 offset4 well">
                    <legend>请登录</legend>
                    <%
                        String error = (String) request.getAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);
                        if(error != null){
                    %>
                    <div class="alert alert-error">
                        <a class="close" data-dismiss="alert" href="#">×</a>登录失败，请重试.
                    </div>
                    <%
                        }
                    %>
                    <form method="POST" action="" accept-charset="UTF-8">
                        <input type="text" id="username" class="span4" name="username" placeholder="Username">
                        <input type="password" id="password" class="span4" name="password" placeholder="Password">
                        <label class="checkbox">
                            <input type="checkbox" id="rememberMe" name="rememberMe" value="1"> 记住我
                        </label>
                        <button type="submit" name="submit" class="btn btn-info btn-block">登录</button>
                    </form>
                </div>
            </div>
        </div>
	</form>
</div>
</body>
</html>
