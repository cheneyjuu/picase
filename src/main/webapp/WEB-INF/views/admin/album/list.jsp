<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <style type="text/css">
        .dropdown-toggle {
            height: 20px;
        }
    </style>
</head>
<body>
    <ul class="thumbnails">
    <c:forEach items="${albums.content}" var="album">
        <li class="span3">
            <a href="${ctx}/admin/picture/list/${album.parentMenu}-${album.childMenu}" class="thumbnail">
                <img src="${ctx}/static/images/holder.jpg" alt="">
            </a>
        <span style="display: block; margin-bottom: 5px;">
            <c:if test="${album.childMenu!=null}">
                ${album.childMenu}
                &nbsp;->&nbsp;
            </c:if>
            ${album.title}
        </span>
        <div class="btn-group">
            <a class="btn btn-primary" href="${ctx}/admin/picture/save/${album.id}"><i class="icon-plus icon-white"></i> 添加图片</a>
            <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="caret"></span></a>
            <ul class="dropdown-menu">
                <li><a href="#"><i class="icon-pencil"></i> 修改相册</a></li>
                <li><a href="#"><i class="icon-trash"></i> 删除相册</a></li>
            </ul>
        </div>
        </li>
    </c:forEach>
    </ul>
    <p>
        <tags:pagination page="${albums}" paginationSize="12"/>
    </p>
</body>
</html>