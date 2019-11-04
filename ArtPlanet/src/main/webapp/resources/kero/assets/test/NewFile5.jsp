<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Responsive Image Gallery</title>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"> 
        <meta name="description" content="Responsive Image Gallery with jQuery" />
        <meta name="keywords" content="jquery, carousel, image gallery, slider, responsive, flexible, fluid, resize, css3" />
		<meta name="author" content="Codrops" />
		<link rel="shortcut icon" href="../favicon.ico"> 
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/artclass4/css/demo.css'/>" />
		<link rel="stylesheet" type="text/css" href="<c:url value='/resources/artclass4/css/style.css'/>" />
		<link rel="stylesheet" type="text/css" href="<c:url value='/resources/artclass4/css/elastislide.css'/>" />
		<link href='http://fonts.googleapis.com/css?family=PT+Sans+Narrow&v1' rel='stylesheet' type='text/css' />
		<link href='http://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css' />
		<noscript>
			<style>
				.es-carousel ul{
					display:block;
				}
			</style>
		</noscript>
		<script id="img-wrapper-tmpl" type="text/x-jquery-tmpl">	
			<div class="rg-image-wrapper">
				{{if itemsCount > 1}}
					<div class="rg-image-nav">
						<a href="#" class="rg-image-nav-prev">Previous Image</a>
						<a href="#" class="rg-image-nav-next">Next Image</a>
					</div>
				{{/if}}
				<div class="rg-image"></div>
				<div class="rg-loading"></div>
				<div class="rg-caption-wrapper">
					<div class="rg-caption" style="display:none;">
						<p></p>
					</div>
				</div>
			</div>
			
			
		</script>
    </head>
    <body>
		<div class="container">
			<div class="header">
				<a href="http://tympanus.net/Development/Elastislide/"><span>&laquo; Previous Demo: </span>Elastislide</a>
				<span class="right_ab">
					<a href="http://www.flickr.com/photos/smanography/" target="_blank">Images by Shermeee</a>
					<a href="http://creativecommons.org/licenses/by/2.0/deed.en_GB">CC BY 2.0</a>
					<a href="http://tympanus.net/codrops/2011/09/20/responsive-image-gallery/"><strong>back to the Codrops post</strong></a>
				</span>
				<div class="clr"></div>
			</div><!-- header -->
			
			<div class="content">
				<h1>Responsive Image Gallery <span>A jQuery image gallery with a thumbnail carousel</span></h1>
				<div id="rg-gallery" class="rg-gallery">
					<div class="rg-thumbs">
						<!-- Elastislide Carousel Thumbnail Viewer -->
						
						<div class="es-carousel-wrapper">
							<div class="es-nav">
								<span class="es-nav-prev">Previous</span>
								<span class="es-nav-next">Next</span>
							</div>
							<div class="es-carousel">
								<ul>
									<li><a href="#"><img src="<c:url value='/resources/artclass4/images/thumbs/1.jpg'/>" data-large="images/1.jpg" alt="image01" data-description="From off a hill whose concave womb reworded" /></a></li>
									<li><a href="#"><img src="<c:url value='/resources/artclass4/images/thumbs/2.jpg'/>" data-large="images/2.jpg" alt="image02" data-description="A plaintful story from a sistering vale" /></a></li>
									<li><a href="#"><img src="<c:url value='/resources/artclass4/images/thumbs/3.jpg'/>" data-large="images/3.jpg" alt="image03" data-description="A plaintful story from a sistering vale" /></a></li>
									<li><a href="#"><img src="<c:url value='/resources/artclass4/images/thumbs/4.jpg'/>" data-large="images/4.jpg" alt="image04" data-description="My spirits to attend this double voice accorded" /></a></li>
									<li><a href="#"><img src="<c:url value='/resources/artclass4/images/thumbs/5.jpg'/>" data-large="images/5.jpg" alt="image05" data-description="And down I laid to list the sad-tuned tale" /></a></li>
								
								</ul>
							</div>
						</div>
						<!-- End Elastislide Carousel Thumbnail Viewer -->
					</div><!-- rg-thumbs -->
				</div><!-- rg-gallery -->
				<p class="sub">Want more Shakespeare? <a href="http://www.opensourceshakespeare.org/" target="_blank">http://www.opensourceshakespeare.org/</a></p>
			</div><!-- content -->
		</div><!-- container -->
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
		<script type="text/javascript" src="<c:url value='/resources/artclass4/js/jquery.tmpl.min.js'/>"></script>
		<script type="text/javascript" src="<c:url value='/resources/artclass4/js/jquery.easing.1.3.js'/>"></script>
		<script type="text/javascript" src="<c:url value='/resources/artclass4/js/jquery.elastislide.js'/>"></script>
		<script type="text/javascript" src="<c:url value='/resources/artclass4/js/gallery.js'/>"></script>
    </body>
</html>