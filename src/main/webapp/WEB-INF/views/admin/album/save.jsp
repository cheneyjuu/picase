<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <title>新增相册</title>
</head>
<body>
    <div class="container">
        <form class="span10 form-horizontal" action="/admin/album/save">
            <div class="control-group">
                <label class="control-label" for="title">相册名：</label>
                <div class="controls">
                    <input type="text" id="title" name="title" placeholder="相册名"/>
                </div>
            </div>
            <%--<div class="control-group">--%>
                <%--<label class="control-label" for="cover">相册封面：</label>--%>
                <%--<div class="controls">--%>
                    <%--<input type="file" name="file"/>--%>
                <%--</div>--%>
            <%--</div>--%>
            <div class="control-group">
                <label class="control-label" for="parent">所属菜单：</label>
                <div class="controls">
                    <span id="parent_menu_span">
                    <select name="parentMenu" id="parent_menu" class="select">
                        <option value="-1">一级菜单</option>
                        <c:forEach items="${parentList}" var="pm">
                            <option value="${pm.id}">${pm.menuName}</option>
                        </c:forEach>
                    </select>
                </span>
                <span id="child_menu_span" style="display: none;">
                    <select name="childMenu" id="child_menu">
                        <option value="-1">二级菜单</option>
                    </select>
                </span>
                </div>
            </div>
            <div class="control-group">
                <div class="controls">
                    <a class="btn btn-primary" id="submit_form" href="#"><i class="icon-plus icon-white"></i> 保存</a>
                </div>
            </div>
            <input type="hidden" id="parent_name" name="parentName"/>
            <input type="hidden" id="child_name" name="childName"/>
        </form>
    </div>
    <script type="text/javascript">
        $(function(){
            // hidden child menu
            $('#child_menu_span').hide();

        });
        //parent menu change event
        $("#parent_menu").change(function () {
            var str = "";
            var menuid = "";
            $("#parent_menu option:selected").each(function () {
                str = $(this).text();
                if (str == "Corporate & Business") {
                    str = "CorporateBusiness";
                }
                $("#parent_name").val(str);
                menuid = $(this).val();
                if (menuid != -1) {
                    $.ajax({
                        url:"${ctx}/admin/menu/childMenu",
                        data:"parentMenu="+str,
                        success:function(result){
                            if (result.length > 0) {
                                $("#child_menu_span").show();
                                $("#child_menu").empty();
                                $("#child_menu").append("<option value='-1'>二级菜单</option>");
                                for (var i=0; i < result.length; i++){
                                    $("#child_menu").append("<option value='"+i+"'>"+result[i].menuName+"</option>");
                                    console.info("<option value='"+i+"'>"+result[i].menuName+"</option>");
                                }
                            } else {
                                $("#child_menu_span").hide();
                                $("#child_name").val("");
                            }
                        },
                        error:function(msg){
                            console.info(msg);
                        }
                    });
                } else {
                    $("#child_menu_span").hide();
                    $("#child_name").val("");
                }
            });
        }).trigger("change");

        $("#child_menu").change(function(){
            var childStr = "";
            $("#child_menu option:selected").each(function(){
                childStr = $(this).text();
                $("#child_name").val(childStr);
            });
        });

        $("#submit_form").click(function(){
            var title = $("#title").val();
            var pm = $("#parent_name").val();
            var cm = $("#child_name").val();
            $.ajax({
                url:"${ctx}/admin/album/save",
                type:"post",
                data:"title="+title+"&parentMenu="+pm+"&childMenu="+cm,
                success:function(msg){
                    alert("添加成功");
                }
            });

        });
    </script>
</body>
</html>