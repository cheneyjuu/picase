<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>添加关于我们内容</title>
    <script type="text/javascript">
        (function(){
            window.UEDITOR_HOME_URL = "${ctx}/static/ueditor/";
        })();

    </script>
    <script type="text/javascript" src="${ctx}/static/ueditor/editor_config.js"></script>
    <script type="text/javascript" src="${ctx}/static/ueditor/editor_all_min.js"></script>
</head>
<body>
<div>
    <c:if test="${not empty message}">
        <div class="notification success png_bg">
            <a href="#" class="close"><img src="/static/resources/images/icons/cross_grey_small.png" title="Close this notification" alt="close"></a>
            <div>${message}</div>
        </div>
    </c:if>
</div>
<form action="${ctx}/admin/about/save" method="post">
    <textarea id="myEditor" name="content">${about.content}</textarea><br>
    <input type="hidden" name="id" value="${about.id}">
    <input type="submit" class="btn btn-primary" value="保存" style="float:left;">
    <script type="text/javascript">
        UE.getEditor('myEditor')
    </script>
</form>
</body>
</html>