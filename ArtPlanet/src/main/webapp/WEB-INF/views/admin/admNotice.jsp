<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!-- 아이디 얻어서 var에 지정한 변수 id저장  페이지내에서 EL 사용하여 (ex. ${id} )아이디값 사용가능-->
<sec:authentication property="principal.username" var="id" />

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<title>Art Planet - 관리자</title>
<meta http-equiv="X-UA-Compatible" content="text/html;charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Language" content="en">
<link
	href="${pageContext.request.contextPath}/resources/kero/main.07a59de7b920cd76b874.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</head>
<body oncontextmenu="return false;" ondragstart="return false;"
	onselectstart="return false;">
	<!-- 케로 관리자UI -->
	<div class="app-container app-theme-gray">
		<div class="app-main">
			<!-- 왼쪽바 시작 -->
			<div class="app-sidebar-wrapper">
				<div class="app-sidebar sidebar-shadow">
					<input type="hidden" value="${cancelButtonShow}" id="number" />
					<div>
						<a class="navbar-brand logo_h"
							href="<c:url value='/Search/Artwork'/>"><img
							style="width: 200px; height: 86px;"
							src="<c:url value='/resources/img/logo.png'/>" alt="logo"></a>

						<a href="#" data-toggle="tooltip" data-placement="bottom"
							title="KeroUI Admin Template" class="logo-src"></a>
						<!-- 햄버거 네줄 
                        <button type="button" class="hamburger hamburger--elastic mobile-toggle-nav">
                                <span class="hamburger-box">
                                    <span class="hamburger-inner"></span>
                                </span>
                        </button>
                         -->
					</div>

					<div class="scrollbar-sidebar scrollbar-container">
						<div class="app-sidebar__inner">
							<ul class="vertical-nav-menu">
								<li class="app-sidebar__heading">Admin Menu</li>
								<li class="mm-active"><a href="#"> <i
										class="metismenu-icon pe-7s-rocket"></i> 회원관리 <i
										class="metismenu-state-icon pe-7s-angle-down caret-left"></i>
								</a>

									<ul>
										<li><a href="<c:url value='/AdmUserInfo.ad'/>">가입회원</a></li>
									</ul></li>

								<!-- 작품관리 -->
								<li class="mm-active"><a href="#"> <i
										class="metismenu-icon pe-7s-rocket"></i> 결제관리 <i
										class="metismenu-state-icon pe-7s-angle-down caret-left"></i>
								</a>

									<ul>
										<li><a href="<c:url value='/AdmUserPay.ad'/>">[ARTCLASS]일반결제</a></li>
										<hr style="background-color: gray; height: 1px; width: 220px" />
										<li><a href="<c:url value='/AdmUserBatch.ad'/>">[BLOG]정기결제-배치키</a></li>
										<li><a href="<c:url value='/RecurringPayOrder.do'/>">[BLOG]정기결제-관리자결제</a></li>
										<li><a href="<c:url value='/AdmUserRecPay.ad'/>">[BLOG]정기결제-결제내역</a></li>
										<hr style="background-color: gray; height: 1px; width: 220px" />
										<li><a href="<c:url value='/AdmUserProjBatch.ad'/>">[PROJECT]후원-배치키(일회성)</a></li>
										<li><a href="<c:url value='/ProjectPayOrder.do'/>">[PROJECT]후원-관리자결제</a></li>
										<li><a href="<c:url value='/AdmUserProjPay.ad'/>">[PROJECT]후원-결제내역</a></li>

									</ul> <!-- 결제관리 -->
									<li class="mm-active"><a href="#"> <i
											class="metismenu-icon pe-7s-rocket"></i> 작품관리 <i
											class="metismenu-state-icon pe-7s-angle-down caret-left"></i>
									</a>

										<ul>
											<li><a href="">프로젝트</a></li>
											<li><a href="">클래스</a></li>
										</ul></li>
							</ul>
						</div>
						<!-- 앱 사이드바 이너 -->
					</div>
					<!-- 스크롤바 사이드바 스크롤바 컨테이너 -->


				</div>
				<!-- 앱 사이드바 사이드바 섀도우 -->
			</div>
			<!-- side bar 앱 사이드바 래퍼 -->

			<!-- 여기 -->
			<div class="app-main__outer">
				<div class="app-header">
					<div class="page-title-heading">
						공지사항
						<div class="page-title-subheading">모바일 푸시알림 전송 페이지입니다.</div>
					</div>

					<div class="app-header-overlay d-none animated fadeIn"></div>
				</div>
				<!-- 앱 헤더 -->


				<!-- dashboard 시작 -->

				<div class="app-inner-layout app-inner-layout-page">
					<div class="app-inner-layout__wrapper">
						<div class="app-inner-layout__content pt-1">
							<div class="tab-content">
								<div class="container-fluid">
									<div class="row">
										<div class="col-md-12">
											<div class="main-card mb-3 card">
												<div class="card-body">
													<h2>여기부터 내용작성</h2>
<!--  -->													
<form action="<c:url value='/AdmPushToPhone'/>" method="post">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<table style="border-spacing:1px;background-color:gray;width:400px">
	
		<tr style="border-spacing:1px;background-color:white">
			<td style="width:20%">제목</td>
			<td><input type="text" name="noti_title" style="width:90%"/></td>
		</tr>
		<tr style="border-spacing:1px;background-color:white">
			<td colspan="2">메시지</td>
			
		</tr>
		<tr style="border-spacing:1px;background-color:white">
			
			<td colspan="2"><textarea name="noti_message" style="width:90%;height:200px" ></textarea></td>
		</tr>
		<tr style="border-spacing:1px;background-color:white">
			<td colspan="2" style="text-align:center"><input type="submit" value="확인"/></td>			
		</tr>  
		
	</table>
</form>






































































												</div>
												<!-- 카드바디 -->
											</div>
										</div>
										<!-- 다이브12 -->
									</div>
									<!-- row -->
								</div>
								<!-- 컨테이너플루이드 -->
							</div>
							<!-- 탭컨텐츠 -->
						</div>
					</div>
				</div>
				<!-- 앱이너레이아웃 -->


			</div>
			<!-- app-main outer -->
		</div>
		<!-- app-main -->
	</div>
	<!-- app-container gray -->





	<!-- javascript -->
	<script type="text/javascript"
		src="<c:url value='/resources/kero/assets/scripts/main.07a59de7b920cd76b874.js'/>"></script>


</body>
</html>
