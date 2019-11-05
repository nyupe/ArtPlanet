<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!doctype html>
<html lang="en">

<head>
<style type="text/css">
	.display-4 {
		font-size: 3.5rem;
    	font-weight: 300;
    	line-height: 1.2;
    	color: black;
    	/* color: #495057; */
	}
	
</style>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Language" content="en">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Welcome</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no"
    />
    <meta name="description" content="Kero HTML Bootstrap 4 Dashboard Template">

    <!-- Disable tap highlight on IE -->
    <meta name="msapplication-tap-highlight" content="no">

	<!-- 기존 kero CSS -->
	<link href="<c:url value='/resources/kero/main.07a59de7b920cd76b874.css'/>" rel="stylesheet">

<body>
    <div class="app-container app-theme-white body-tabs-shadow">
            <div class="app-container">
                <div class="h-100 bg-premium-white">
                    <div class="d-flex h-100 justify-content-center align-items-center">
                        <div class="mx-auto app-login-box col-md-8">
                            <div class="col" align="center" style="margin-bottom: 25px; margin-top: 150px">
                                	<a href="<c:url value='/Search/Artwork'/>">	<img  class="img-fluid" src="<c:url value='/resources/img/logo.png'/>"  alt="로고이미지"/></a>
                            </div>
                            <div class="modal-dialog w-100">
                                <div class="modal-content">
                                    <div class="modal-body">
                                        <h5 class="modal-title">
                                            <h4 class="mt-2">
                                                <div style="margin-top: 150px"align="center" class="display-4">환영합니다!</div>
                                                <div align="center" style="color:black; margin-top: 20px"><span>${param.name }님, 회원가입을 축하합니다. </br> 
                                                ArtPlanet의 아이디는 
                                                <span class="text-success" style="text-decoration: underline;"/> ${param.id }</span>입니다</span></div>
                                        </h5>
                                         
                                        </div>
                                        
                                    <div class="modal-footer d-block text-center" style="margin-top: 100px">
                                        <a href="<c:url value='/Search/Artwork'/>"><button class="btn-wide mb-2 mr-2 btn-pill btn btn-primary btn-lg btn-block">ArtPlanet 시작하기</button></a>
                                    </div>
                                </div>
                            </div>
                            <div class="text-center text-black opacity-8 mt-3">Copyright © ArtPlanet 2019</div>
                        </div>
                    </div>
                </div>
            </div>
    </div>
<script type="text/javascript" src="<c:url value='/resources/kero/assets/scripts/main.07a59de7b920cd76b874.js'/>"/>
</body>
</html>
