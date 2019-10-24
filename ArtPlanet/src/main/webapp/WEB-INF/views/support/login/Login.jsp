<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Language" content="en">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no"
    />
    <meta name="description" content="Kero HTML Bootstrap 4 Dashboard Template">

    <!-- Disable tap highlight on IE -->
    <meta name="msapplication-tap-highlight" content="no">
	
	<!-- 기존 kero CSS -->
	<link href="<c:url value='/resources/kero/main.07a59de7b920cd76b874.css'/>" rel="stylesheet">
</head>
<body>
     <div class="app-container app-theme-white body-tabs-shadow">
            <div class="app-container">
                <div class="h-100">
                    <div class="h-100 no-gutters row">
                        <div class="d-none d-lg-block col-lg-4">
                            <div class="slider-light">
                                <div class="slick-slider">
                                    <div>
                                        <div class="h-100 d-flex justify-content-center align-items-center bg-plum-plate" tabindex="-1">
                                            <div class="slide-img-bg" style="background-image: url('resources/kero/assets/images/originals/city.jpg');"></div>
                                            <div class="slider-content"><h3>그림을 통해 소통을...</h3>
                                                <p>ArtPlanet에서는 그림을 통해 서로 소통하며...</p></div>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="h-100 d-flex justify-content-center align-items-center bg-premium-dark" tabindex="-1">
                                            <div class="slide-img-bg" style="background-image: url('resources/kero/assets/images/originals/citynights.jpg');"></div>
                                            <div class="slider-content"><h3>좀 더 그림에 집중할 수 있게....</h3>
                                                <p>ArtPlanet에서는 그림에 집중할 수 있게 후원 시스템을...</p></div>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="h-100 d-flex justify-content-center align-items-center bg-sunny-morning" tabindex="-1">
                                            <div class="slide-img-bg" style="background-image: url('resources/kero/assets/images/originals/citydark.jpg');"></div>
                                            <div class="slider-content"><h3>좋아하는 그림에 쉽게 다가갈 수 있게...</h3>
                                                <p>ArtPlanet에서는 자신이 좋아하는 그림에 좀더 쉽게 다가갈 수 있게...</p></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="h-100 d-flex bg-white justify-content-center align-items-center col-md-12 col-lg-8">
                            <div class="mx-auto app-login-box col-sm-12 col-md-10 col-lg-9">
                                <div style="margin-bottom: 50px; margin-left: 100px; ">
                                	<a href="<c:url value='/Home'/>">	<img src="<c:url value='/resources/img/logo.png'/>"  alt="로고이미지"/></a>
                                </div>
                                <h4 class="mb-0">
                                    <span class="d-block"><span class="text-primary">ArtPlanet</span>에 오신걸 환영합니다,</span>
                                    <span>로그인 해주세요.</span></h4>
                                <h6 class="mt-3">회원이 아니시라구요? 
                                <br/>
                                	<!-- 회원가입 페이지로 이동  GET방식 -->
                                	<a href="<c:url value='/Register'/>;" class="text-danger">이곳을 클릭하여 회원가입하세요.</a>
                                </h6>
                                <div class="divider row"></div>
                                <div style="padding-bottom: 100px">
                                	<!-- 정상적인 로그인시 Home.jsp으로 이동 -->
                                    <form action="<c:url value='/Home'/>">
                                        <div class="form-row">
                                            <div class="col-md-6">
                                                <div class="position-relative form-group"><label for="exampleEmail" class="">ID</label><input name="email" id="exampleEmail" placeholder="ID를 입력하세요..." type="email" class="form-control"></div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="position-relative form-group"><label for="examplePassword" class="">Password</label><input name="password" id="examplePassword" placeholder="Password을 입력하세요..." type="password"
                                                                                                                                                       class="form-control"></div>
                                            </div>
                                        </div>
                                        <div class="position-relative form-check"><input name="check" id="exampleCheck" type="checkbox" class="form-check-input"><label for="exampleCheck" class="form-check-label">아이디 저장</label></div>
                                        <div class="divider row"></div>
                                        <div class="d-flex align-items-center">
                                            <div class="ml-auto"><a href="<c:url value='/ForgotPassword'/>" class="btn-lg btn btn-link"><span class="text-danger">비밀번호 찾기</span></a>
                                                <button class="btn btn-primary btn-lg">로그인</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </div>
	<script type="text/javascript" src="<c:url value='/resources/kero/assets/scripts/main.07a59de7b920cd76b874.js'/>"/>
</body>
</html>
    