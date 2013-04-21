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
        .thumbnail {
            margin: 5px;
        }
    </style>
</head>
<body>
<div class="row-fluid">
    <ul class="thumbnails">
        <c:forEach items="${picturePage.content}" var="pic">
            <li class="span4 target${pic.id}" style="margin-left: 0;">
                <div class="thumbnail" style="line-height: 10px;">
                    <img style="width: 300px; height: 200px;" src="${ctx}${pic.imagePath}/${pic.thumbName}">
                    <div class="caption">
                        <p style="padding-left: 5px;">在这里你可以对每张图片单独更改简介</p>
                        <p><input class="span12" type="text" value="${pic.intro}"/></p>
                        <div class="btn-group">
                            <a class="btn btn-info" href="#" id="update_btn" onclick="updatePicture(this)"><i class="icon-pencil icon-white"></i> 更改</a>
                            <input type="hidden" value="${pic.id}"/>
                            <a class="btn btn-info dropdown-toggle" data-toggle="dropdown" href="#"><span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#" onclick="deletePicture(this);"><i class="icon-trash"></i> 删除图片</a></li>
                                <c:choose>
                                    <c:when test="${pic.showIndex == 1}">
                                        <li><a href="#" onclick="showIndexPicture(this);"><i class="icon-home"></i> 取消首页显示</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li><a href="#" onclick="showIndexPicture(this);"><i class="icon-home"></i> 在首页显示</a></li>
                                    </c:otherwise>
                                </c:choose>
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
    var id, intro;
    function updatePicture(currentDom){
        id = $(currentDom).siblings(":eq(0)").val();
        intro = $(currentDom).parent().siblings(":eq(1)").find("input").val();
        console.info(id+" : "+intro);
        $.ajax({
            url : "${ctx}/admin/picture/update",
            type: "post",
            data:"pictureId="+id+"&intro="+intro,
            success : function(){
                alert("操作成功");
            }
        });
    }

    function deletePicture(currentDom) {
        var picId = $(currentDom).parent().parent().siblings(":eq(1)").val();
        var deleteNode = ".target"+picId;

        $.ajax({
            url : "${ctx}/admin/picture/delete",
            type: "post",
            data: "pictureId="+picId,
            success : function(){
                alert("操作成功");
                $(currentDom).parents(deleteNode).remove();
            }
        });
    }

    function showIndexPicture(currentDom) {
        var picId = $(currentDom).parent().parent().siblings(":eq(1)").val();
        var currentText = $(currentDom).text();
        var status;
        $(currentDom).empty();
        if ($.trim(currentText) === "在首页显示"){
            status = 1;
            $(currentDom).append("<i class='icon-home'></i>取消首页显示");
        } else {
            status = 0;
            $(currentDom).append("<i class='icon-home'></i>在首页显示");
        }
        $.ajax({
            url : "${ctx}/admin/picture/showIndex",
            type : "post",
            data : "perloadPictureId="+picId+"&status="+status,
            success : function(){
                alert("操作成功");
            }
        });
    }
</script>
</body>
</html>