<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title></title>
    <style type="text/css">

        a, a:visited, a:hover, a:active, a:focus {direction:ltr; outline:0;}

        #positioner {
            position: absolute;
            top: 80px;
            width: 160px;
            height: 235px;
            padding-left: 10px;
            float: left;
            background: #fff;
        }
        .logo{
            width: 450%;
            margin-top: 20px;
        }
        .holder {position:absolute; width:150px; height:25px;}
        dl.menu {width:300px; float:left; margin:-32005px 0 0 -10005px;}
        .p1 {top:0;}
        .p2 {top:26px;}
        .p3 {top:52px;}
        .p4 {top:78px;}
        .p5 {top:104px;}
        .p6 {top:130px;}
        .p7 {top:156px;}
        .p8 {top:182px;}
        .p9 {top:208px;}

        dl.menu a {display:block; height:25px; font:normal 12px/25px verdana; text-decoration:none; text-indent:10px; border-bottom:1px solid #fff; border-left:1px solid #fff;}

        dl.menu dt {float:left; padding:0; position:relative; left:9999px; z-index:50; margin:32000px 0 0 0;}
        dl.menu dt a {width:149px; background:#fff; float:left; color:#777;}
        dl.menu dt a.sub {background:#fff url(dl-flyout/arrow.gif) no-repeat 140px center; color:#777;}
        dl.menu dt a:hover,
        dl.menu dt a:focus,
        dl.menu dt a:active
        {margin-right:1px; text-decoration:none; background-color:#ccc; color:#fff;}

        dl.menu dd {float:left; padding:0; margin:0;height:25px;}
        dl.menu dd a {position:relative; background:#ddd; width:149px; color:#666; left:10149px; top:-26px; z-index:60;}
        dl.menu dd a:hover,
        dl.menu dd a:focus,
        dl.menu dd a:active
        {margin-right:1px; background:#ddd; color:#fff;}
    </style>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>
    <div class="span3">
        <div class="logo">
            <a href="/"><img src="${ctx}/static/images/logo.jpg" /></a>
        </div>
        <div id="positioner">
            <div class="holder p1">
                <dl class="menu">
                    <dt><a href="${ctx}/index.jsp">Home</a></dt>
                </dl>
            </div>
            <div class="holder p2">
                <dl class="menu">
                    <dt><a class="sub">Corporate &amp; Business</a></dt>
                    <dd>
                        <a href="${ctx}/album/list/CorporateBusiness-Events">Events</a>
                        <a href="${ctx}/album/list/CorporateBusiness-Interiorsbuildings">Interiors &amp; buildings</a>
                        <a href="${ctx}/album/list/CorporateBusiness-conference">conference</a>
                        <a href="${ctx}/album/list/CorporateBusiness-Other">Other</a>
                    </dd>
                </dl>
            </div>
            <div class="holder p4">
                <dl class="menu">
                    <dt><a class="sub">Wedding</a></dt>
                    <dd>
                        <a href="${ctx}/album/list/Wedding-Preparation">Preparation</a>
                        <a href="${ctx}/album/list/Wedding-Ceremony">Ceremony</a>
                        <a href="${ctx}/album/list/Wedding-Reception">Reception</a>
                        <a href="${ctx}/album/list/Wedding-Session">Session</a>
                    </dd>
                </dl>
            </div>
            <div class="holder p3">
                <dl class="menu">
                    <dt><a class="sub">Fashion</a></dt>
                    <dd>
                        <a href="#">Sessions</a>
                        <a href="#">Events</a>
                    </dd>
                </dl>
            </div>
            <div class="holder p5">
                <dl class="menu">
                    <dt><a href="${ctx}/album/list/Portrait">Portrait</a></dt>
                </dl>
            </div>
            <div class="holder p6">
                <dl class="menu">
                    <dt><a href="${ctx}/aboutus">About us &amp; contact</a></dt>
                </dl>
            </div>
        </div>
    </div>
<script type="text/javascript">
    $(function(){
        var pmenu, cmenu;
        $("dd > a").each(function(i){
            $(this).click(function(){
                pmenu = $(this).parent().siblings().find("a").text();
                if (pmenu == "Corporate & Business") {
                    pmenu = "CorporateBusiness";
                }
                if (cmenu == "Interiors & buildings") {
                    cmenu = "Interiorsbuildings";
                }
                cmenu = $(this).text();
                $.ajax({
                    url : "${ctx}/album/list",
                    type : "post",
                    data : "parentMenu="+pmenu+"&childMenu="+cmenu,
                    success : function(){
                    }
                });
            });
        });
    });
</script>
</body>
</html>