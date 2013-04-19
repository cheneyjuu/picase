<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/styles/thumb.css">
</head>
<body>
    <div class="ja-box column ja-box-full" style="width: 100%;">
        <div class="ja-moduletable moduletable  clearfix" id="Mod159">
            <div class="ja-box-ct clearfix">
                <div>
                    <div id="captifyContent159" class="captifyContent cclight-background">
                        <c:forEach items="${albums.content}" var="album">
                            <div class="ccRow">
                                <div class="ccItem" style="margin-right: 1px;margin-bottom: 1px; width: 225px; height: 225px;">
                                    <div class="viewport">
                                        <a class="light-background" href="${ctx}/picture/list/${album.id}">
                                            <img src="${ctx}${album.imagePath}${album.thumbImage}" class="captify captify159" alt="${album.title}" style="height:225px;width:225px" original="/media/plg_jblibrary/imagecache/23f7ab440677b9072372e69f46728b1e.jpg">
                                            <span class="light-background bottom">${album.title}</span>
                                        </a>
                                    </div>

                                </div>
                            </div>
                            <div class="ccClear"></div>
                        </c:forEach>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
        </div>

    </div>
    <div class="pill-content pull-right">
        <c:if test="${fn:length(albums.content) > 0}">
            <tags:pagination page="${albums}" paginationSize="12"/>
        </c:if>
    </div>
    <script type="text/javascript">
        $(function(){
            $('.viewport').mouseenter(function(e){
                var titleSpan = $(this).children('a').children('span');
                if(titleSpan.is(':hidden')){
                    titleSpan.slideToggle(800);
                };

            }).mouseleave(function(e) {
                        var titleSpan = $(this).children('a').children('span');
                        if(titleSpan.is(':visible')){
                            titleSpan.slideToggle(800);
                        };
                    });
            $('img.captify').fadeIn(800); // This sets the opacity of the thumbs to fade down to 60% when the page loads
            $('img.captify').hover(function(){
                $(this).fadeTo('slow', 0.6); // This should set the opacity to 100% on hover
            },function(){
                $(this).fadeTo('slow', 1.0); // This should set the opacity back to 60% on mouseout
            });
        });
    </script>
</body>
</html>