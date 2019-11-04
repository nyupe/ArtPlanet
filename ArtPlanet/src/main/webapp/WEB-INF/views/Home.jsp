<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        	  <div class="app-inner-layout__sidebar card">
                                <ul class="nav flex-column">
                                    <li class="pt-3 pl-3 pr-3 pb-3 nav-item">
                                        <button class="btn-pill btn-shadow btn btn-primary btn-block">나의 회원정보 바로가기
                                        </button>
                                    </li>
                                    <li class="nav-item-header nav-item">My Account</li>
                                    <div class="menu-header-content" style="text-align: center;">
							        	<div class="avatar-icon-wrapper mb-3 avatar-icon-xxl">
												<div class="avatar-icon"><img src="<c:url value='/resources/img/blog/cat-post/cat-post-3.jpg'/>" alt="Avatar 5"></div>
										</div>
									</div>
									<!-- 쓸데없지만 예쁜 8개의 dot -->
									<li class="text-center p-2 nav-item">
                                        <div>
                                            <div class="avatar-icon-wrapper">
                                                <div class="badge badge-primary badge-dot badge-dot-lg"></div>
                                                <div class="avatar-icon"><img
                                                        src="assets/images/avatars/1.jpg"
                                                        alt=""></div>
                                            </div>
                                            <div class="avatar-icon-wrapper">
                                                <div class="badge badge-focus badge-dot badge-dot-lg"></div>
                                                <div class="avatar-icon"><img
                                                        src="assets/images/avatars/2.jpg"
                                                        alt=""></div>
                                            </div>
                                            <div class="avatar-icon-wrapper">
                                                <div class="badge badge-warning badge-dot badge-dot-lg"></div>
                                                <div class="avatar-icon"><img
                                                        src="assets/images/avatars/3.jpg"
                                                        alt=""></div>
                                            </div>
                                            <div class="avatar-icon-wrapper">
                                                <div class="badge badge-danger badge-dot badge-dot-lg"></div>
                                                <div class="avatar-icon"><img
                                                        src="assets/images/avatars/4.jpg"
                                                        alt=""></div>
                                            </div>
                                            <div class="avatar-icon-wrapper">
                                                <div class="badge badge-info badge-dot badge-dot-lg"></div>
                                                <div class="avatar-icon"><img
                                                        src="assets/images/avatars/5.jpg"
                                                        alt=""></div>
                                            </div>
                                            <div class="avatar-icon-wrapper">
                                                <div class="badge badge-success badge-dot badge-dot-lg"></div>
                                                <div class="avatar-icon"><img
                                                        src="assets/images/avatars/6.jpg"
                                                        alt=""></div>
                                            </div>
                                            <div class="avatar-icon-wrapper">
                                                <div class="badge badge-secondary badge-dot badge-dot-lg"></div>
                                                <div class="avatar-icon"><img
                                                        src="assets/images/avatars/7.jpg"
                                                        alt=""></div>
                                            </div>
                                            <div class="avatar-icon-wrapper">
                                                <div class="badge badge-warning badge-dot badge-dot-lg"></div>
                                                <div class="avatar-icon"><img
                                                        src="assets/images/avatars/8.jpg"
                                                        alt=""></div>
                                            </div>
                                        </div>
                                    </li>
									
									<!-- 시작 -->
                                    <li class="nav-item"><a href="javascript:void(0);" class="nav-link"><i
                                            class="nav-link-icon pe-7s-chat"> </i><span>내가 시작한 프로젝트 후원</span>
                                        <div class="ml-auto badge badge-pill badge-info">10개</div>
                                    </a></li>
                                    <li class="nav-item"><a href="javascript:void(0);" class="nav-link"><i
                                            class="nav-link-icon pe-7s-chat"> </i><span>내가 참여한 프로젝트 후원</span>
                                        <div class="ml-auto badge badge-pill badge-info">5개</div>
                                    </a></li>
                                    <!-- 괘선 -->
                                   <li class="nav-item-divider nav-item"></li>
                                   
                                    <li class="nav-item"><a href="javascript:void(0);" class="nav-link"><i
                                            class="nav-link-icon pe-7s-box2"> </i><span>내가 개설한 클래스 강좌</span>
                                        <div class="ml-auto badge badge-success">4개</div>
                                    </a></li>
                                    
                                    <li class="nav-item"><a href="javascript:void(0);" class="nav-link"><i
                                            class="nav-link-icon pe-7s-box2"> </i><span>내가 참여한 클래스 강좌</span>
                                        <div class="ml-auto badge badge-success">0개</div>
                                    </a></li>
                                     <!-- 괘선 -->
                                   <li class="nav-item-divider nav-item"></li>
                                    <li class="nav-item"><a href="javascript:void(0);" class="nav-link"><i
                                            class="nav-link-icon pe-7s-coffee"> </i><span>진행중인 프로젝트&클래스 합계</span>
                                        <div class="ml-auto badge badge-warning">512개</div>
                                    </a></li>
                                    <li class="nav-item-divider nav-item"></li>
                                    <li class="nav-item-header nav-item">Project History</li>
                                    
                                    <!-- 스크롤러블 타임라인 시작 -->
                                                                                        <div class="main-card mb-3 card">
                                                        <div class="card-body"><h5 class="card-title">Scrollable Small</h5>
                                                            <div class="scroll-area-sm">
                                                                <div class="scrollbar-container">
                                                                    <div class="vertical-timeline vertical-timeline--animate vertical-timeline--one-column">
                                                                        <div class="vertical-timeline-item vertical-timeline-element">
                                                                            <div><span
                                                                                    class="vertical-timeline-element-icon bounce-in"><i
                                                                                    class="badge badge-dot badge-dot-xl badge-success"> </i></span>
                                                                                <div class="vertical-timeline-element-content bounce-in">
                                                                                    <h4 class="timeline-title">All Hands
                                                                                        Meeting</h4>
                                                                                    <p>Lorem ipsum dolor sic amet, today at
                                                                                        <a
                                                                                                href="javascript:void(0);">12:00
                                                                                            PM</a></p><span
                                                                                        class="vertical-timeline-element-date">10:30 PM</span>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="vertical-timeline-item vertical-timeline-element">
                                                                            <div><span
                                                                                    class="vertical-timeline-element-icon bounce-in"><i
                                                                                    class="badge badge-dot badge-dot-xl badge-warning"> </i></span>
                                                                                <div class="vertical-timeline-element-content bounce-in">
                                                                                    <p>Another meeting today, at <b
                                                                                            class="text-danger">12:00 PM</b>
                                                                                    </p>
                                                                                    <p>Yet another one, at <span
                                                                                            class="text-success">15:00 PM</span>
                                                                                    </p><span
                                                                                        class="vertical-timeline-element-date">12:25 PM</span>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="vertical-timeline-item vertical-timeline-element">
                                                                            <div><span
                                                                                    class="vertical-timeline-element-icon bounce-in"><i
                                                                                    class="badge badge-dot badge-dot-xl badge-danger"> </i></span>
                                                                                <div class="vertical-timeline-element-content bounce-in">
                                                                                    <h4 class="timeline-title">Build the
                                                                                        production release</h4>
                                                                                    <p>Lorem ipsum dolor sit
                                                                                        amit,consectetur
                                                                                        eiusmdd tempor incididunt ut labore
                                                                                        et
                                                                                        dolore magna elit enim at minim
                                                                                        veniam
                                                                                        quis nostrud</p><span
                                                                                        class="vertical-timeline-element-date">15:00 PM</span>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="vertical-timeline-item vertical-timeline-element">
                                                                            <div><span
                                                                                    class="vertical-timeline-element-icon bounce-in"><i
                                                                                    class="badge badge-dot badge-dot-xl badge-primary"> </i></span>
                                                                                <div class="vertical-timeline-element-content bounce-in">
                                                                                    <h4 class="timeline-title text-success">
                                                                                        Something not important</h4>
                                                                                    <p>Lorem ipsum dolor sit
                                                                                        amit,consectetur
                                                                                        elit enim at minim veniam quis
                                                                                        nostrud</p><span
                                                                                        class="vertical-timeline-element-date">15:00 PM</span>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="vertical-timeline-item vertical-timeline-element">
                                                                            <div><span
                                                                                    class="vertical-timeline-element-icon bounce-in"><i
                                                                                    class="badge badge-dot badge-dot-xl badge-success"> </i></span>
                                                                                <div class="vertical-timeline-element-content bounce-in">
                                                                                    <h4 class="timeline-title">All Hands
                                                                                        Meeting</h4>
                                                                                    <p>Lorem ipsum dolor sic amet, today at
                                                                                        <a
                                                                                                href="javascript:void(0);">12:00
                                                                                            PM</a></p><span
                                                                                        class="vertical-timeline-element-date">10:30 PM</span>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="vertical-timeline-item vertical-timeline-element">
                                                                            <div><span
                                                                                    class="vertical-timeline-element-icon bounce-in"><i
                                                                                    class="badge badge-dot badge-dot-xl badge-warning"> </i></span>
                                                                                <div class="vertical-timeline-element-content bounce-in">
                                                                                    <p>Another meeting today, at <b
                                                                                            class="text-danger">12:00 PM</b>
                                                                                    </p>
                                                                                    <p>Yet another one, at <span
                                                                                            class="text-success">15:00 PM</span>
                                                                                    </p><span
                                                                                        class="vertical-timeline-element-date">12:25 PM</span>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="vertical-timeline-item vertical-timeline-element">
                                                                            <div><span
                                                                                    class="vertical-timeline-element-icon bounce-in"><i
                                                                                    class="badge badge-dot badge-dot-xl badge-danger"> </i></span>
                                                                                <div class="vertical-timeline-element-content bounce-in">
                                                                                    <h4 class="timeline-title">Build the
                                                                                        production release</h4>
                                                                                    <p>Lorem ipsum dolor sit
                                                                                        amit,consectetur
                                                                                        eiusmdd tempor incididunt ut labore
                                                                                        et
                                                                                        dolore magna elit enim at minim
                                                                                        veniam
                                                                                        quis nostrud</p><span
                                                                                        class="vertical-timeline-element-date">15:00 PM</span>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="vertical-timeline-item vertical-timeline-element">
                                                                            <div><span
                                                                                    class="vertical-timeline-element-icon bounce-in"><i
                                                                                    class="badge badge-dot badge-dot-xl badge-primary"> </i></span>
                                                                                <div class="vertical-timeline-element-content bounce-in">
                                                                                    <h4 class="timeline-title text-success">
                                                                                        Something not important</h4>
                                                                                    <p>Lorem ipsum dolor sit
                                                                                        amit,consectetur
                                                                                        elit enim at minim veniam quis
                                                                                        nostrud</p><span
                                                                                        class="vertical-timeline-element-date">15:00 PM</span>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="vertical-timeline-item vertical-timeline-element">
                                                                            <div><span
                                                                                    class="vertical-timeline-element-icon bounce-in"><i
                                                                                    class="badge badge-dot badge-dot-xl badge-success"> </i></span>
                                                                                <div class="vertical-timeline-element-content bounce-in">
                                                                                    <h4 class="timeline-title">All Hands
                                                                                        Meeting</h4>
                                                                                    <p>Lorem ipsum dolor sic amet, today at
                                                                                        <a
                                                                                                href="javascript:void(0);">12:00
                                                                                            PM</a></p><span
                                                                                        class="vertical-timeline-element-date">10:30 PM</span>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="vertical-timeline-item vertical-timeline-element">
                                                                            <div><span
                                                                                    class="vertical-timeline-element-icon bounce-in"><i
                                                                                    class="badge badge-dot badge-dot-xl badge-warning"> </i></span>
                                                                                <div class="vertical-timeline-element-content bounce-in">
                                                                                    <p>Another meeting today, at <b
                                                                                            class="text-danger">12:00 PM</b>
                                                                                    </p>
                                                                                    <p>Yet another one, at <span
                                                                                            class="text-success">15:00 PM</span>
                                                                                    </p><span
                                                                                        class="vertical-timeline-element-date">12:25 PM</span>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="vertical-timeline-item vertical-timeline-element">
                                                                            <div><span
                                                                                    class="vertical-timeline-element-icon bounce-in"><i
                                                                                    class="badge badge-dot badge-dot-xl badge-danger"> </i></span>
                                                                                <div class="vertical-timeline-element-content bounce-in">
                                                                                    <h4 class="timeline-title">Build the
                                                                                        production release</h4>
                                                                                    <p>Lorem ipsum dolor sit
                                                                                        amit,consectetur
                                                                                        eiusmdd tempor incididunt ut labore
                                                                                        et
                                                                                        dolore magna elit enim at minim
                                                                                        veniam
                                                                                        quis nostrud</p><span
                                                                                        class="vertical-timeline-element-date">15:00 PM</span>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="vertical-timeline-item vertical-timeline-element">
                                                                            <div><span
                                                                                    class="vertical-timeline-element-icon bounce-in"><i
                                                                                    class="badge badge-dot badge-dot-xl badge-primary"> </i></span>
                                                                                <div class="vertical-timeline-element-content bounce-in">
                                                                                    <h4 class="timeline-title text-success">
                                                                                        Something not important</h4>
                                                                                    <p>Lorem ipsum dolor sit
                                                                                        amit,consectetur
                                                                                        elit enim at minim veniam quis
                                                                                        nostrud</p><span
                                                                                        class="vertical-timeline-element-date">15:00 PM</span>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                    
                                    <!-- 스크롤러블 타임라인 끝 -->
                                    <!--베이직 타임라인 잘림 시작 
                                     <div class="card-body">
                                     <h5 class="card-title">최근 참여한 프로젝트&클래스 히스토리</h5>
                                                            <div class="vertical-time-simple vertical-without-time vertical-timeline vertical-timeline--animate vertical-timeline--one-column">
                                                                <div class="vertical-timeline-item dot-danger vertical-timeline-element">
                                                                    <div>
                                                                        <span class="vertical-timeline-element-icon bounce-in"></span>
                                                                        <div class="vertical-timeline-element-content bounce-in">
                                                                            <h4 class="timeline-title">All Hands
                                                                                Meeting</h4>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="vertical-timeline-item dot-warning vertical-timeline-element">
                                                                    <div>
                                                                        <span class="vertical-timeline-element-icon bounce-in"></span>
                                                                        <div class="vertical-timeline-element-content bounce-in">
                                                                            <p>Yet another one, at <span
                                                                                    class="text-success">15:00 PM</span>
                                                                            </p>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="vertical-timeline-item dot-success vertical-timeline-element">
                                                                    <div>
                                                                        <span class="vertical-timeline-element-icon bounce-in"></span>
                                                                        <div class="vertical-timeline-element-content bounce-in">
                                                                            <h4 class="timeline-title">Build the production
                                                                                release
                                                                                <div class="badge badge-danger ml-2">NEW
                                                                                </div>
                                                                            </h4>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="vertical-timeline-item dot-primary vertical-timeline-element">
                                                                    <div>
                                                                        <span class="vertical-timeline-element-icon bounce-in"></span>
                                                                        <div class="vertical-timeline-element-content bounce-in">
                                                                            <h4 class="timeline-title">
                                                                                Something not important
                                                                                <div class="avatar-wrapper mt-2 avatar-wrapper-overlap">
                                                                                    <div class="avatar-icon-wrapper avatar-icon-sm">
                                                                                        <div class="avatar-icon"><img
                                                                                                src="assets/images/avatars/1.jpg"
                                                                                                alt=""></div>
                                                                                    </div>
                                                                                    <div class="avatar-icon-wrapper avatar-icon-sm">
                                                                                        <div class="avatar-icon"><img
                                                                                                src="assets/images/avatars/2.jpg"
                                                                                                alt=""></div>
                                                                                    </div>
                                                                                    <div class="avatar-icon-wrapper avatar-icon-sm">
                                                                                        <div class="avatar-icon"><img
                                                                                                src="assets/images/avatars/3.jpg"
                                                                                                alt=""></div>
                                                                                    </div>
                                                                                    <div class="avatar-icon-wrapper avatar-icon-sm">
                                                                                        <div class="avatar-icon"><img
                                                                                                src="assets/images/avatars/4.jpg"
                                                                                                alt=""></div>
                                                                                    </div>
                                                                                    <div class="avatar-icon-wrapper avatar-icon-sm">
                                                                                        <div class="avatar-icon"><img
                                                                                                src="assets/images/avatars/5.jpg"
                                                                                                alt=""></div>
                                                                                    </div>
                                                                                    <div class="avatar-icon-wrapper avatar-icon-sm">
                                                                                        <div class="avatar-icon"><img
                                                                                                src="assets/images/avatars/9.jpg"
                                                                                                alt=""></div>
                                                                                    </div>
                                                                                    <div class="avatar-icon-wrapper avatar-icon-sm">
                                                                                        <div class="avatar-icon"><img
                                                                                                src="assets/images/avatars/7.jpg"
                                                                                                alt=""></div>
                                                                                    </div>
                                                                                    <div class="avatar-icon-wrapper avatar-icon-sm">
                                                                                        <div class="avatar-icon"><img
                                                                                                src="assets/images/avatars/8.jpg"
                                                                                                alt=""></div>
                                                                                    </div>
                                                                                    <div class="avatar-icon-wrapper avatar-icon-sm avatar-icon-add">
                                                                                        <div class="avatar-icon"><i>+</i>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </h4>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="vertical-timeline-item dot-info vertical-timeline-element">
                                                                    <div>
                                                                        <span class="vertical-timeline-element-icon bounce-in"></span>
                                                                        <div class="vertical-timeline-element-content bounce-in">
                                                                            <h4 class="timeline-title">This dot has an info
                                                                                state</h4>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <!-- 헐 잘림ㅠ_ㅠ 이거 안써야할듯-->
                                                                <div class="vertical-timeline-item dot-dark vertical-timeline-element">
                                                                    <div>
                                                                        <span class="vertical-timeline-element-icon bounce-in"></span>
                                                                        <div class="vertical-timeline-element-content bounce-in">
                                                                            <h4 class="timeline-title">This dot has a dark
                                                                                state</h4>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                     타임라인끝 -->
                                    
                                    <li class="nav-item-btn text-center nav-item">
                                        <button class="btn-wide btn-pill btn btn-success btn-sm">Start New Conversation
                                        </button>
                                    </li>
                                    <li class="nav-item-divider nav-item"></li>
                                    <li class="nav-item-header nav-item">Tags
                                        <small class="ml-1">Important</small>
                                    </li>
                                    <li class="nav-item">
                                        <button type="button" tabindex="0" class="d-flex align-items-center dropdown-item">
                                            <div class="badge ml-0 mr-3 badge-dot badge-dot-xl badge-success">Dark</div>
                                            Important
                                        </button>
                                        <button type="button" tabindex="0" class="d-flex align-items-center dropdown-item">
                                            <div class="badge ml-0 mr-3 badge-dot badge-dot-xl badge-danger">Dark</div>
                                            Favourites
                                        </button>
                                        <button type="button" tabindex="0" class="d-flex align-items-center dropdown-item">
                                            <div class="badge ml-0 mr-3 badge-dot badge-dot-xl badge-warning">Dark</div>
                                            Actions
                                        </button>
                                        <div tabindex="-1" class="dropdown-divider"></div>
                                        <button type="button" tabindex="0" class="d-flex align-items-center dropdown-item">
                                            <div class="badge ml-0 mr-3 badge-dot badge-dot-xl badge-primary">Dark</div>
                                            Other Tags
                                        </button>
                                    </li>
                                </ul>
                            </div>
                        
                        
                        
                        </div>
                    </div>
               
                
        	
			
			
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