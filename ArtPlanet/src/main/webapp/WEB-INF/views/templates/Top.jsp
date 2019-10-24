<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header class="header_area">
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
						<li class="nav-item"><a class="nav-link" href="<c:url value='/About'/>">About</a></li>
						<li class="nav-item"><a class="nav-link" href="<c:url value='/Search/Artwork'/>">Artworks</a></li>
						<li class="nav-item"><a class="nav-link" href="<c:url value='/Search/Artist'/>">Artists</a></li>
						<li class="nav-item"><a class="nav-link" href="<c:url value='/Search/Project'/>">Projects</a></li>
						<li class="nav-item"><a class="nav-link" href="<c:url value='/ArtClass'/>">Art Class</a></li>
						<li class="nav-item"><a class="nav-link" href="<c:url value='/Pay'/>">Pay</a></li>
						<li class="nav-item"><a class="nav-link" href="<c:url value='/Others'/>">Others</a></li>
						<li class="nav-item"><a class="nav-link" href="<c:url value='/Login'/>">Login</a></li>
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
	</div>
	<!-- 검색바 -->
	<!-- 
	<div class="search_input" id="search_input_box">
		<div class="container">
			<form class="d-flex justify-content-between search-inner" action="<c:url value='/Search'/>">
				<input type="text" class="form-control" id="search_input"
					placeholder="Search Here">
				<button type="submit" class="btn"></button>
				<span class="ti-close" id="close_search" title="Close Search"></span>
			</form>
		</div>
	</div>
	 -->
	
	
</header>