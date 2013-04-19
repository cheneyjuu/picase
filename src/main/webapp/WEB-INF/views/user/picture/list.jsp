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
        #myCarousel {
            margin-top: 50px;
            background-color: #fff;
        }
        .box {

            /*非IE的主流浏览器识别的垂直居中的方法*/

            display: table-cell;

            vertical-align:middle;

            /*设置水平居中*/

            text-align:center;

            /* 针对IE的Hack */

            *display: block;

            *font-size: 175px;/*约为高度的0.873，200*0.873 约为175*/

            *font-family:Arial;/*防止非utf-8引起的hack失效问题，如gbk编码*/

            width:830px;

            height:830px;

            border: 1px solid #eee;

        }

        .box img {

            /*设置图片垂直居中*/

            vertical-align:middle;

        }
    </style>
</head>
<body>
<c:if test="${fn:length(pictureList) > 0}">
    <div id="myCarousel" class="carousel slide well" style=" display: table-cell;">
        <div class="carousel-inner" style="">
            <c:forEach items="${pictureList}" var="picture" varStatus="st">
                <c:choose>
                    <c:when test="${st.index == 0}">
                        <div class="item active" style="height: 830px; width: 830px; vertical-align: middle;">
                    </c:when>
                    <c:otherwise>
                        <div class="item" style="height: 830px; width: 830px; vertical-align: middle;">
                    </c:otherwise>
                </c:choose>
                <img src="${ctx}${picture.imagePath}${picture.sliderName}" style="margin: 0 auto;vertical-align:middle;" alt="">
                <div class="carousel-caption">
                    <%--<h4>First Thumbnail label</h4>--%>
                    <p>${picture.intro}</p>
                </div>
                </div>
            </c:forEach>
        </div>
        <a class="left carousel-control" href="#myCarousel" data-slide="prev">‹</a>
        <a class="right carousel-control" href="#myCarousel" data-slide="next">›</a>
    </div>
</c:if>
<script type="text/javascript">
    $(function(){
        $('#myCarousel').carousel({
            interval: 2000
        })
    });
</script>
</body>
</html>