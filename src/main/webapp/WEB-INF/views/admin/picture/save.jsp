<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <title></title>
</head>
<body>
<div class="container">
    <div class="span2"></div>
    <div class="progress progress-striped active span4">
        <div class="bar" style="width: 100%;">正在上传，稍后...</div>
    </div>
    <form class="span10 form-horizontal" action="${ctx}/admin/picture/upload" method="post" enctype="multipart/form-data">
        <div class="control-group">
            <label class="control-label" for="">图片简介：</label>
            <div class="controls">
                <input type="text" name="intro"/>
            </div>
        </div>
        <div class="control-group">
            <label class="control-label" for="">上传图片：</label>
            <div class="controls" id="file_controls">
                <input type="file" id="field1" name="file"/>
                <button id="b1" onClick="addFormField()" class="btn btn-info" type="button">+</button>
            </div>
        </div>
        <div class="control-group">
            <div class="controls">
                <input type="hidden" value="${albumid}" name="albumid"/>
                <a href="#" class="btn btn-primary" id="submit_form"><i class="icon-plus icon-white"></i> 保存</a>
            </div>
        </div>
    </form>
</div>
<script type="text/javascript">

    var next = 1;
    function addFormField(){
        var addto = "#field" + next;
        next = next + 1;
        var newIn = '<br /><br /><input id="field' + next + '" name="file" type="file">';
        var newInput = $(newIn);
        $(addto).after(newInput);
    }

    $(".progress").hide();

    $("#submit_form").click(function(){
        $(".progress").show();
        $("form").submit();
    });
</script>
</body>
</html>