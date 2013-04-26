<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <link type="text/css" rel="stylesheet" href="${ctx}/static/styles/jackwander/jquery.galleryview-3.0-dev.css" />
    <script type="text/javascript" src="${ctx}/static/script/jquery.timers-1.2.js"></script>
    <script type="text/javascript" src="${ctx}/static/script/jquery.easing.1.3.js"></script>

    <script type="text/javascript" src="${ctx}/static/script/jquery.galleryview-3.0-dev.js"></script>
</head>
<body>

        <ul id="myGallery">
            <c:forEach items="${pictureList}" var="picture">
            <li>
                <img data-frame="${ctx}${picture.imagePath}${picture.thumbName}" src="${ctx}${picture.imagePath}${picture.sliderName}" title="" data-description="" />
            </li>
                </c:forEach>
        </ul>
        <div class="modal" id="myModal" style="display: none; width: 98%; height: 100%; background-color: #000;top: 10px;left: 20%;">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        </div>
        <script type="text/javascript">
            $(function(){
                $(".gv_panel > img").css("width:auto;display:block;");
                $('#myGallery').galleryView({
                    transition_speed: 800, 		//INT - duration of panel/frame transition (in milliseconds)
                    transition_interval: 800, 		//INT - delay between panel/frame transitions (in milliseconds)
                    easing: 'swing', 				//STRING - easing method to use for animations (jQuery provides 'swing' or 'linear', more available with jQuery UI or Easing plugin)
                    show_panels: true, 				//BOOLEAN - flag to show or hide panel portion of gallery
                    show_panel_nav: true, 			//BOOLEAN - flag to show or hide panel navigation buttons
                    enable_overlays: false, 			//BOOLEAN - flag to show or hide panel overlays

                    panel_width: 1000, 				//INT - width of gallery panel (in pixels)
                    panel_height: 550, 				//INT - height of gallery panel (in pixels)
                    panel_animation: 'fade', 		//STRING - animation method for panel transitions (crossfade,fade,slide,none)
                    panel_scale: 'fit', 			//STRING - cropping option for panel images (crop = scale image and fit to aspect ratio determined by panel_width and panel_height, fit = scale image and preserve original aspect ratio)
                    overlay_position: 'bottom', 	//STRING - position of panel overlay (bottom, top)
                    pan_images: true,				//BOOLEAN - flag to allow user to grab/drag oversized images within gallery
                    pan_style: 'drag',				//STRING - panning method (drag = user clicks and drags image to pan, track = image automatically pans based on mouse position
                    pan_smoothness: 15,				//INT - determines smoothness of tracking pan animation (higher number = smoother)
                    start_frame: 1, 				//INT - index of panel/frame to show first when gallery loads
                    show_filmstrip: true, 			//BOOLEAN - flag to show or hide filmstrip portion of gallery
                    show_filmstrip_nav: true, 		//BOOLEAN - flag indicating whether to display navigation buttons
                    enable_slideshow: true,		//BOOLEAN - flag indicating whether to display slideshow play/pause button
                    autoplay: false,				    //BOOLEAN - flag to start slideshow on gallery load
                    show_captions: false, 			//BOOLEAN - flag to show or hide frame captions
                    filmstrip_size: 3, 				//INT - number of frames to show in filmstrip-only gallery
                    filmstrip_style: 'scroll', 		//STRING - type of filmstrip to use (scroll = display one line of frames, scroll filmstrip if necessary, showall = display multiple rows of frames if necessary)
                    filmstrip_position: 'bottom', 	//STRING - position of filmstrip within gallery (bottom, top, left, right)
                    frame_width: 165, 				//INT - width of filmstrip frames (in pixels)
                    frame_height: 80, 				//INT - width of filmstrip frames (in pixels)
                    frame_opacity: 0.5, 			//FLOAT - transparency of non-active frames (1.0 = opaque, 0.0 = transparent)
                    frame_scale: 'fit', 			//STRING - cropping option for filmstrip images (same as above)
                    frame_gap: 5, 					//INT - spacing between frames within filmstrip (in pixels)
                    show_infobar: false,			//BOOLEAN - flag to show or hide infobar
                    infobar_opacity: 0				//FLOAT - transparency for info bar
                });

                $('.gv_panelWrap').click(function(){
                    var cImgSrc = $(this).find('img').attr('src');
                    var thumbIndex = cImgSrc.indexOf("s_");
                    var originImageName = cImgSrc.substr(thumbIndex+2,cImgSrc.length);
                    var imagePath = cImgSrc.substr(0,thumbIndex);
                    $('#myModal').children('img').remove();
                    $('#myModal').append('<img src="'+imagePath+originImageName+'" style="display:block; margin:0 auto; max-height:700px;  " />');
                    $('#myModal').modal({
                        backdrop:true,
                        keyboard:true,
                        show:true
                    });
                });
            });
        </script>
</body>
</html>