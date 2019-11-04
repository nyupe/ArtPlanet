<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
<link href="<c:url value='/resources/artclass5/light-carousel.css'/>" rel="stylesheet" type="text/css">
<style>
.container {
  max-width: 500px;
  margin: 0 auto;
}
h1 { margin:150px auto 30px auto; text-align:center}

.img3
{
height: 600px ! important;
wight: 200px ! important;

}
.img2{
height: 100px ! important;
wight: 100px ! important;
}
</style>
</head>

<body>



<div class="container">
  <div class="sample1">
    <div class="carousel">
      <ul>
        <li> <img class="img3" src="<c:url value='/resources/artclass/images/menu-list/1.jpg'/>" alt="Description for photo 1" > </li>
        <li> <img class="img3" src="<c:url value='/resources/artclass/images/menu-list/2.jpg'/>" alt="Description for photo 2"  > </li>
        <li> <img class="img3" src="<c:url value='/resources/artclass/images/menu-list/3.jpg'/>" alt="Description for photo 3"  > </li>
        
      </ul>
      <div class="controls">
        <div class="prev"></div>
        <div class="next"></div>
      </div>
    </div>
    
    <div class="thumbnails">
      <ul>
        <li> <a href="#"><img class="img2"	src="<c:url value='/resources/artclass/images/menu-list/1.jpg'/>" alt="Description for photo 1"  > </a></li>
        <li><a href="#"> <img class="img2" src="<c:url value='/resources/artclass/images/menu-list/2.jpg'/>"  alt="Description for photo 2" ></a> </li>
        <li><a href="#"> <img class="img2" src="<c:url value='/resources/artclass/images/menu-list/3.jpg'/>" alt="Description for photo 3"  ></a> </li>
       
      </ul>
    </div>
  </div>
  
  
 
  <script src="http://code.jquery.com/jquery-1.11.2.min.js"></script> 
  <script src="<c:url value='/resources/artclass5/jquery.light-carousel.js'/>"></script> 
  <script>
$('.sample1').lightCarousel();
</script> 

<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-36251023-1']);
  _gaq.push(['_setDomainName', 'jqueryscript.net']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
</body>
</html>
