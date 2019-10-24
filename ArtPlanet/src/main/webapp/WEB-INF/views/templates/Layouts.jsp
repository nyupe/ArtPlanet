<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<!-- Required meta tags -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Disable tap highlight on IE -->
    <meta name="msapplication-tap-highlight" content="no">
	<!-- 홈페이지 탭 아이콘 -->
	<link rel="icon" href="<c:url value='/resources/img/favicon.png'/>" type="image/png">
	
	<title>Art Planet</title>
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.css'/>">
	<link rel="stylesheet" href="<c:url value='/resources/css/themify-icons.css'/>">
	<link rel="stylesheet" href="<c:url value='/resources/css/flaticon.css'/>">
	<link rel="stylesheet" href="<c:url value='/resources/vendors/fontawesome/css/all.min.css'/>">
	<link rel="stylesheet" href="<c:url value='/resources/vendors/owl-carousel/owl.carousel.min.css'/>">
	<link rel="stylesheet" href="<c:url value='/resources/vendors/animate-css/animate.css'/>">
	<!-- main css -->
	<link rel="stylesheet" href="<c:url value='/resources/css/style.css'/>">
	<link rel="stylesheet" href="<c:url value='/resources/css/responsive.css'/>">
	<!-- 추가한 스크립트 -->
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha256-pasqAKBDmFT4eHoN2ndd6lN370kFiGUFyTiUHWhU7k8=" crossorigin="anonymous"></script>
	<!-- kero css -->
    <link href="<c:url value='/resources/kero/main.07a59de7b920cd76b874.css'/>" rel="stylesheet">
    <!-- summernote -->
    <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
</head>
<body>
	<div style="position: relative;">
		<!-- 탑 부분 시작 -->
		<tiles:insertAttribute name="Top" />
		<!-- 탑 부분 끝  -->
		<!-- 바디부분 시작 -->
		<tiles:insertAttribute name="Body" />
		<!-- 바디부분 끝 -->
		<!-- 푸터 부분 시작 -->
		<tiles:insertAttribute name="Footer" />
		<!-- 푸터 부분 끝 -->
	</div>
	
	
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="<c:url value='/resources/js/jquery-3.3.1.min.js'/>"></script>
	<script src="<c:url value='/resources/js/popper.js'/>"></script>
	<script src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
	<script src="<c:url value='/resources/js/stellar.js'/>"></script>
	<script src="<c:url value='/resources/vendors/isotope/imagesloaded.pkgd.min.js'/>"></script>
	<script src="<c:url value='/resources/vendors/isotope/isotope.pkgd.min.js'/>"></script>
	<script src="<c:url value='/resources/vendors/owl-carousel/owl.carousel.min.js'/>"></script>
	<script src="<c:url value='/resources/js/jquery.ajaxchimp.min.js'/>"></script>
	<script src="<c:url value='/resources/js/jquery.counterup.min.js'/>"></script>
	<script src="<c:url value='/resources/js/jquery.waypoints.min.js'/>"></script>
	<script src="<c:url value='/resources/js/mail-script.js'/>"></script>
	<script src="<c:url value='/resources/js/contact.js'/>"></script>
	<script src="<c:url value='/resources/js/jquery.form.js'/>"></script>
	<script src="<c:url value='/resources/js/jquery.validate.min.js'/>"></script>
	<script src="<c:url value='/resources/js/mail-script.js'/>"></script>
	<script src="<c:url value='/resources/js/theme.js'/>"></script>
	<!-- kero js -->
	<script type="text/javascript" src="<c:url value='/resources/kero/assets/scripts/main.07a59de7b920cd76b874.js'/>"></script>
	<!-- summernote -->
  	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
</body>
</html>