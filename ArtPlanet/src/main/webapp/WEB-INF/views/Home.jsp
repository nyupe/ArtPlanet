<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<style>
	.ui-theme-settings {
		top: 96px;
	}
	.ui-theme-settings.settings-open {
		top: 96px;
	}
	.ui-theme-settings .theme-settings__inner {
		height: 800px;
		/*background-color: transparent;*/
	}
	/* 사이드메뉴 버튼 위치 */
	.ui-theme-settings .btn-open-options {
		bottom: 300px;
	}
	.ui-theme-settings.settings-open .btn-open-options {
		bottom: 300px;
	}
</style>
<section class="home_banner_area">
	<div class="banner_inner d-flex align-items-center">
		<div class="overlay bg-parallax" data-stellar-ratio="0.9"
			data-stellar-vertical-offset="0" data-background=""></div>
		<div class="container">
			<div class="banner_content">
				<h1><span class="basecolor">ART PLANET</span></h1>
				<a class="main_btn" href="#">크하하하하하하</a>
			</div>
			<!-- 배너컨텐트 -->
		</div>
		<!-- 컨테이너 -->
	</div>
	<!-- 배너이너 -->
	<!-- 사이드메뉴 시작 -->
	<div class="ui-theme-settings">
        <button type="button" id="TooltipDemo" class="btn-open-options btn btn-outline-2x btn-outline-focus">
            <i class="fa fa-sync-alt icon-anim-pulse fa-2x"></i>
        </button>
        <div class="theme-settings__inner">
            <!-- 사이드메뉴 내용 시작 -->
            <!-- 
            <div class="ps__rail-x" style="left: 0px; bottom: 0px;">
	            <div class="ps__thumb-x" tabindex="0" style="left: 0px; width: 0px;"></div>
        	</div>
            <div class="ps__rail-y" style="top: 0px; right: 0px;">
	            <div class="ps__thumb-y" tabindex="0" style="top: 0px; height: 0px;"></div>
        	</div>
        	-->
        </div>
    </div>
	<!-- 사이드메뉴 끝 -->
	
	<!--
	<div class="social_area">
		<h4><a href="#"><i class="ti-instagram"></i>Instagram</a></h4>
		<div class="round"></div>
		<h4><a class="twitter" href="#"><i class="ti-twitter"></i>Twitter</a></h4>
		<div class="round"></div>
		<h4><a href="#"><i class="ti-facebook"></i>Facebook</a></h4>
		<div></div>
	</div>
	-->
	
</section>