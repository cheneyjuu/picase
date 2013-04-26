<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<table class="table table-bordered table-striped">
    <thead>
        <tr>
            <th>序号</th>
            <th>相册名称</th>
            <th>所属菜单</th>
            <th>添加图片</th>
            <th>操作</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${albums.content}" var="album" varStatus="status">
            <tr>
                <td>${status.index+1}</td>
                <td>${album.title}</td>
                <td>
                    ${album.parentMenu}<c:if test="${fn:length(album.childMenu) > 0}">&nbsp;--&nbsp;${album.childMenu}</c:if>
                </td>
                <td>
                    <a class="btn" href="${ctx}/admin/picture/save/${album.id}"><i class="icon-plus"></i> 添加图片</a>
                </td>
                <td>
                    <a class="btn" href="${ctx}/admin/picture/list/${album.parentMenu}-${album.childMenu}/${album.id}"><i class="icon-list"></i> 查看</a>
                    <%--<a class="btn btn-info" href="${ctx}/admin/picture/save/${album.id}"><i class="icon-pencil icon-white"></i> 修改</a>--%>
                    <a class="btn btn-danger" href="${ctx}/admin/picture/save/${album.id}"><i class="icon-trash icon-white"></i> 删除</a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
    <tfoot>
        <tr>
            <td colspan="5">
                <c:if test="${fn:length(albums.content) > 0}">
                    <tags:pagination page="${albums}" paginationSize="12"/>
                </c:if>
            </td>
        </tr>
    </tfoot>
</table>
</body>
</html>