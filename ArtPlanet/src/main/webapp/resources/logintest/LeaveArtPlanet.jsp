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
    <title>ForgotPassword</title>
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
                                            <div class="slide-img-bg opacity-6" style="background-image: url('resources/kero/assets/images/originals/citydark.jpg');"></div>
                                            <div class="slider-content"><h3>좋아하는 그림에 쉽게 다가갈 수 있게...</h3>
                                                <p>ArtPlanet에서는 자신이 좋아하는 그림에 좀더 쉽게 다가갈 수 있게...</p></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="h-100 d-flex bg-white justify-content-center align-items-center col-md-12 col-lg-8">
                            <div class="mx-auto app-login-box col-sm-12 col-md-8 col-lg-6">
                                <div style="padding-bottom: 50px">
                                	<a href="<c:url value='/Home'/>"><img src="<c:url value='/resources/img/logo.png'/>"  alt="로고이미지"/></a>
                                </div>
                                <h4>
                                    <div>회원탈퇴</div>
                                    <span>회원님의 비밀번호를 입력해주세요.</span></h4>
                                <div style="padding-bottom: 100px">
                                    <form class="">
                                        <div class="form-row">
                                            <div class="col-md-12">
                                                <div class="position-relative form-group"><input name="password" id="exampleEmail" placeholder="비밀번호를 입력해주세요" type="text" class="form-control"></div>
                                            </div>
                                        </div>
                                        <div class="mt-4 d-flex align-items-center">
                                        	<h6 class="mb-0">
                                        		<a href="<c:url value='/Login'/>" class="text-primary">로그인 하시려면 여기를 클릭하세요.</a>
                                        	</h6>
                                            <div class="ml-auto">
                                                <button class="btn btn-primary btn-lg">ArtPlanet 탈퇴하기</button>
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
	<script type="text/javascript" src="<c:url value='/resources/kero/assets/scripts/main.07a59de7b920cd76b874.js'/>"></script>
	</body>
</html>
