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
    <title>MemberInfo</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no"
    />
    <meta name="description" content="Kero HTML Bootstrap 4 Dashboard Template">

    <!-- Disable tap highlight on IE -->
    <meta name="msapplication-tap-highlight" content="no">

	<link href="<c:url value='/resources/kero/main.07a59de7b920cd76b874.css'/>" rel="stylesheet"></head>

<body>
    <div class="app-container app-theme-white body-tabs-shadow">
            <div class="app-container">
                <div class="h-100 bg-premium-white">
                    <div class="d-flex h-100 justify-content-center align-items-center">
                        <div class="mx-auto app-login-box col-md-8">
                            <div class="col-md-6 mx-auto" >
                            	<a href="<c:url value='/Home'/>">	<img src="<c:url value='/resources/img/logo.png'/>"  alt="로고이미지"/></a>
                            </div>
                            <div class="modal-dialog w-100">
                                <div class="modal-content">
                                    <div class="modal-body">
                                        <h5 class="modal-title">
                                            <h4 class="mt-2">
                                                <div style="text-align:center; ">내정보</div>
                                                
                                        </h5>
                                        <div class="divider row"></div>
                                        <div class="form-row">
                                            <div class="col-md-12">
                                                <div class="position-relative form-group"><input name="email" value="${param.id}" id="exampleEmail" placeholder="이메일(아이디):ahnyj1115@xxxxxxxxxx" type="email" class="form-control"></div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="position-relative form-group"><input name="text" value="${param.name}" id="exampleName" placeholder="이름:안용주" type="text" class="form-control"></div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="position-relative form-group"><input name="password"  value="${param.password}"id="examplePassword" placeholder="비밀번호:********" type="password" class="form-control"></div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="position-relative form-group"><input name="passwordConfirm"  value="${param.passwordConfirm}"id="examplePasswordRep" placeholder="비밀번호 확인:********" type="password" class="form-control"></div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="position-relative form-group"><input name="address" value="${param.address} ${param.detailAddress}"id="exampleaddress" placeholder="주소: 서울시 금천구 xxxxx" type="text" class="form-control"></div>
                                            </div>
                                            <div class="col-md-12">
         
                                        </div>
                                        
                                        <div class="divider row"></div>
                                        <h6 class="mb-0">ArtPlanet을 더이상 이용하지 않으세요? <a href="<c:url value='/LeaveArtPlanet'/>" class="text-primary">회원탈퇴</a></h6></div>
                                    <div class="modal-footer d-block text-center">
                                        <button class="btn-wide btn-pill btn-shadow btn-hover-shine btn btn-primary btn-lg">정보수정</button>
                                    </div>
                                </div>
                            </div>
                            <div class="text-center text-dark opacity-8 mt-3">Copyright © ArtPlanet</div>
                        </div>
                    </div>
                </div>
            </div>
    </div>
<script type="text/javascript" src="<c:url value='/resources/kero/assets/scripts/main.07a59de7b920cd76b874.js'/>"></script></body>
</html>
    