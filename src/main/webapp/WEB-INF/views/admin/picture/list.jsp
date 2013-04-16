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
        .thumbnail {
            margin: 5px;
        }
    </style>
</head>
<body>
<div class="row-fluid">
    <ul class="thumbnails">
        <c:forEach items="${picturePage.content}" var="pic">
            <li class="span4" style="margin-left: 0;">
                <div class="thumbnail" style="line-height: 10px;">
                    <img style="width: 300px; height: 200px;" src="${ctx}${pic.imagePath}/${pic.thumbName}">
                    <div class="caption">
                        <p style="padding-left: 5px;">在这里你可以对每张图片单独更改简介</p>
                        <p><input class="span12" type="text" value="${pic.intro}"/></p>
                        <div class="btn-group">
                            <a class="btn btn-info" href="#" id="update_btn"><i class="icon-pencil icon-white"></i> 更改</a>
                            <input type="hidden" value="${pic.id}"/>
                            <input type="hidden" value="${pic.intro}"/>
                            <a class="btn btn-info dropdown-toggle" data-toggle="dropdown" href="#"><span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#"><i class="icon-trash"></i> 删除图片</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </li>
        </c:forEach>
    </ul>
    <p class="">
        <tags:pagination page="${picturePage}" paginationSize="12"/>
    </p>
</div>
<script type="text/javascript">
    $("#update_btn").click(function(){
        var id, intro;
        $(this).siblings()
    });
    function updatePicture(id,intro){
        $.ajax({
            url : "/admin/picture/update",
            type: "post",
            dataType:"pictureId="+id+"&intro="+intro,
            success : function(){
                alert("操作成功");
            }
        });
    }
</script>
</body>
</html>