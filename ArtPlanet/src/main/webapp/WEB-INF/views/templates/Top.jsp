<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 스프링 써큐리티 적용에 필요한 태그라이브러리 -->
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<header class="header_area" >
	<div class="main_menu">
		<nav class="navbar navbar-expand-lg navbar-light">
			<div class="container">
				<!-- Brand and toggle get grouped for better mobile display -->
				<a class="navbar-brand logo_h" href="<c:url value='/Search/Artwork'/>"><img style="width: 200px; height: 86px;"
					src="<c:url value='/resources/img/logo.png'/>" alt="logo"></a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse offset"
					id="navbarSupportedContent">
					<ul class="nav navbar-nav menu_nav ml-auto">
						<%-- <li class="nav-item active"><a class="nav-link" href="<c:url value='/Home'/>">Home</a></li> --%>
						<li  class="nav-item"><a class="nav-link" href="<c:url value='/About'/>">About</a></li>
						<li  class="nav-item"><a class="nav-link" href="<c:url value='/Search/Artwork'/>">Artworks</a></li>
						<li  class="nav-item"><a class="nav-link" href="<c:url value='/Search/Artist'/>">Artists</a></li>
						<li  class="nav-item"><a class="nav-link" href="<c:url value='/Search/Project'/>">Projects</a></li>
						<li  class="nav-item"><a class="nav-link" href="<c:url value='/ArtClass'/>">Art Class</a></li>						
						<li  class="nav-item"><a class="nav-link" href="<c:url value='/Pay'/>">Pay</a></li>
						<li  class="nav-item"><a class="nav-link" href="<c:url value='/Others'/>">Others</a></li>
						<li  class="nav-item"><a class="nav-link" id="go_admin" href="<c:url value='/AdmUserInfo.ad'/>">Admin</a></li>
						<!-- <li  class="nav-item"><a class="nav-link" id="go_admin" href="http://localhost:7070/artplanet/AdmUserInfo.ad">Admin</a></li> -->
						<!-- 인증모듈 적용 회원가입 막힘  : 2019.11.22 17시 기준 -->
						<%-- <li  class="nav-item"><a class="nav-link" href="<c:url value='/AuthStart.do'/>">Register</a></li> --%>
						<!-- 인증 모듈 없이 회원가입 페이지로 이동 -->
						<li  class="nav-item"><a class="nav-link" href="<c:url value='/Register'/>">Register</a></li>
						<sec:authorize access="isAnonymous()"> <!-- 로그인 안한 상태 -->
							<li  class="nav-item"><a class="nav-link" id="go_login" href="<c:url value='/Login'/>">Login</a></li>
				 		</sec:authorize>
				 		<sec:authorize access="isAuthenticated()"> <!-- 로그인 한상태 -->
				 			<li  class="nav-item"><a class="nav-link" href="javascript:logout()">LogOut</a></li>
				 			<li  class="nav-item"><a class="nav-link" href="<c:url value='/MyPage'/>">MyPage</a></li>
			 			</sec:authorize>
						<!-- 드랍다운메뉴
						<li class="nav-item submenu dropdown"><a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Blog</a>
							<ul class="dropdown-menu">
								<li class="nav-item"><a class="nav-link" href="<c:url value='/Blog'/>">Blog</a></li>
								<li class="nav-item"><a class="nav-link" href="<c:url value='/ViewPost'/>">Blog2</a></li>
							</ul>
						</li> -->
					</ul>
					<!-- 검색돋보기
					<div class="right-button">
						<ul>
							<li><a id="search" href="javascript:void(0)"><i	class="fas fa-search"></i></a></li>
						</ul>
					</div> -->
				</div>
			</div>
		</nav>
			<!-- 스프링 씨큐러티 사용시  -->
		<form id="logoutForm" method="post" action="<c:url value='/logout'/>">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		</form>
		<script>
			//스프링 시큐리티 로그아웃 처리
			//csrf 사용시에만 아래함수 필요
			function logout(){
				$('#logoutForm').submit();
			}
		</script>
	</div>
</header>


