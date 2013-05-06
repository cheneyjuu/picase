<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <style>
        #galleria{ width: 930px; height: 600px; background: #fff; }
        .galleria-container {
            background: #fff;
        }
        .galleria-thumbnails-list {
            margin : 0 45px 0 45px;
        }
        .galleria-image-nav-right {
            background-position:-280px 20px;
            width: 50px;
            height: 70px;
            background-color: #ccc;
            right: -60;
        }
        .galleria-image-nav-left{
            width: 50px;
            height: 70px;
            background-color: #ccc;
            background-position:20px 20px;
        }
    </style>
    <script type="text/javascript" src="${ctx}/static/jquery/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="${ctx}/static/galleria/galleria-1.2.9.min.js"></script>
</head>
<body>
    <div id="galleria">
        <c:forEach items="${pictureList}" var="picture">
            <a href="${ctx}${picture.imagePath}${picture.sliderName}"><img src="${ctx}${picture.imagePath}${picture.thumbName}" data-big="${ctx}${picture.imagePath}${picture.originName}"></a>
        </c:forEach>
    </div>
    <script>
        Galleria.loadTheme('${ctx}/static/galleria/themes/classic/galleria.classic.min.js');
        Galleria.run('#galleria');
        Galleria.configure({
            showImagenav: 'true',
            autoplay: 5000,
            imageCrop: false,
            preload:'7',
            responsive:true,
            maxScaleRatio:'1',
            minScaleRatio:'1'
        });
    </script>
</body>
</html>