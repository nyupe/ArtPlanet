<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Muli:300,400,600,700"
	rel="stylesheet">

<link rel="stylesheet"
	href="<c:url value='/resources/artclass2/css/open-iconic-bootstrap.min.css'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/artclass2/css/animate.css'/>">

<link rel="stylesheet"
	href="<c:url value='/resources/artclass2/css/owl.carousel.min.css'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/artclass2/css/owl.theme.default.min.css'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/artclass2/css/magnific-popup.css'/>">

<link rel="stylesheet"
	href="<c:url value='/resources/artclass2/css/aos.css'/>">

<link rel="stylesheet"
	href="<c:url value='/resources/artclass2/css/ionicons.min.css'/>">

<link rel="stylesheet"
	href="<c:url value='/resources/artclass2/css/bootstrap-datepicker.css'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/artclass2/css/jquery.timepicker.css'/>">


<link rel="stylesheet"
	href="<c:url value='/resources/artclass2/css/flaticon.css'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/artclass2/css/icomoon.css'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/artclass2/css/style.css'/>">
<style>
.portfolio_area .filters ul li {
width: 100%;
padding-left:  25px;
margin: 0px;
}
.portfolio_area .filters ul li.active:before{
	left: 25px;
	right: 25px;
}	



</style>


		<section class="portfolio_area area-padding" id="portfolio">
			<div class="container" style="max-width:1700px">
				
						<div class="area-heading">
							<div class="row no-gutters justify-content-center mb-2 pb-2 ftco-animate">
				
								<div class="col-md-7 text-center heading-section">
									<h2>아트클래스</h2>

<video width="854" height="480" autoplay>
<source src="https://gocoder.tistory.com/attachment/cfile8.uf@99D874365C22E0671419F4.mp4" type="video/mp4">
<source src="https://gocoder.tistory.com/attachment/cfile8.uf@99D874365C22E0671419F4.webm" type="video/webm">
<source src="https://gocoder.tistory.com/attachment/cfile8.uf@99D874365C22E0671419F4.ogg" type="video/ogg">
</video>






								</div>
				
							</div>
				  
						</div> 
                  <!-- 
                   <div class="dropdown d-inline-block">
                   	
                       <button type="button" aria-haspopup="true"
                               aria-expanded="false"
                               data-toggle="dropdown"
                               class="mb-2 mr-2 dropdown-toggle btn btn-primary">
                                                                                   카테고리
                       </button>
                       <div tabindex="-1" role="menu" aria-hidden="true"
                            class="dropdown-menu-lg dropdown-menu">
                           <div class="dropdown-menu-header">
                               <div class="dropdown-menu-header-inner bg-primary">
                                   <div class="menu-header-image"
                                        style="background-image: url('assets/images/dropdown-header/abstract1.jpg');"></div>
                                   <div class="menu-header-content"><h5
                                           class="menu-header-title">Settings</h5>
                                       <h6
                                               class="menu-header-subtitle">Manage
                                           all of
                                           your
                                           options</h6></div>
                               </div>
                           </div>
                         	
                           <ul>
                               <li class="nav-item-header nav-item" data-filter=".seoul">Activity</li>
                               <li class="nav-item"><a href="javascript:void(0);"
                                                       class="nav-link">Chat
                                   <div class="ml-auto badge badge-pill badge-info">
                                       8
                                   </div>
                               </a></li>
                               <li class="nav-item" ><a href="javascript:void(0);"
                                                       class="nav-link">Recover
                                   Password</a>
                               </li>
                               <li class="nav-item-header nav-item">My Account</li>
                               <li class="nav-item"><a href="javascript:void(0);"
                                                       class="nav-link">Settings
                                   <div class="ml-auto badge badge-success">New
                                   </div>
                               </a></li>
                               <li class="nav-item"><a href="javascript:void(0);"
                                                       class="nav-link">Messages
                                   <div class="ml-auto badge badge-warning">512
                                   </div>
                               </a></li>
                               <li class="nav-item"><a href="javascript:void(0);"
                                                       class="nav-link">Logs</a>
                               </li>
                               <li class="nav-item-divider nav-item"></li>
                               <li class="nav-item-btn nav-item">
                                   <button class="btn-wide btn-shadow btn btn-danger btn-sm">
                                       Cancel
                                   </button>
                               </li>
                           </ul>
                       </div>
                   </div>
                  -->
			<!-- 메뉴 바 시작 -->		
			  <div class="filters portfolio-filter"    >			
				 <div class="dropdown d-inline-block"  >
				     <ul >
                        <button type="button" aria-haspopup="true"
                                  aria-expanded="false"
                                  data-toggle="dropdown"
                                  class="mb-2 mr-2 dropdown-toggle btn btn-outline-primary">
                                  	지역별
                          </button>
                          
                          <div tabindex="-1" role="menu" aria-hidden="true"
                               class="dropdown-menu" >
                              <button  type="button" tabindex="1"
                                      class="dropdown-item">
                                   <li data-filter=".seoul"><a herf=#>서울</a></li>
                                     </button>
                              
                              <button  type="button" tabindex="1"
                                      class="dropdown-item">
                             	   <li data-filter=".daejeon">대전</li>
                              </button>
                              <button type="button" tabindex="2"
                                      class="dropdown-item">
                             	   <li data-filter=".gg">경기</li>
                              </button>
                              <button type="button" tabindex="3"
                                      class="dropdown-item">
                             	   <li data-filter=".busan">부산</li>
                              </button>
                             
                              <button type="button" tabindex="4"
                                      class="dropdown-item">
                                   <li data-filter="."> 대구</li>
                              </button>
                               <button type="button" tabindex="0"
                                      class="dropdown-item">
                                   <li data-filter="."> 경남</li>
                              </button>
                               <button type="button" tabindex="0"
                                      class="dropdown-item">
                                   <li data-filter=".">인천</li>
                              </button>
                               <button type="button" tabindex="0"
                                      class="dropdown-item">
                                   <li data-filter="."> 충북</li>
                              </button>
                               <button type="button" tabindex="0"
                                      class="dropdown-item">
                                   <li data-filter="."> 강원</li>
                              </button>
                               <button type="button" tabindex="0"
                                      class="dropdown-item">
                                   <li data-filter=".">광주</li>
                              </button>
                               <button type="button" tabindex="0"
                                      class="dropdown-item">
                                   <li data-filter="."> 충남</li>
                              </button>
                               <button type="button" tabindex="0"
                                      class="dropdown-item">
                                   <li data-filter="."> 울산</li>
                              </button>
                               <button type="button" tabindex="0"
                                      class="dropdown-item">
                                   <li data-filter="."> 제주</li>
                              </button>
                          
                          </div>
                          </ul> 
                      </div>	
                        
                 	
			<!-- 메뉴 바 끝 -->     
          	
			<!-- 메뉴 바 시작 -->
                 <div class="dropdown d-inline-block" >
                        <button type="button" aria-haspopup="true"
                                  aria-expanded="false"
                                  data-toggle="dropdown"
                                  class="mb-2 mr-2 dropdown-toggle btn btn-outline-primary">
                                                          카테고리
                          </button>
                          	<ul class="menu">
                          <div tabindex="-1" role="menu" aria-hidden="true"
                               class="dropdown-menu">
                              <button type="button" tabindex="0"
                                      class="dropdown-item">
                                 <li class="active" data-filter="*">all</li>
                              </button>
                              <button type="button" tabindex="0"
                                      class="dropdown-item">
                              	  <li data-filter=".illustration">일러스트레이션</li>
                              </button>
                             
                              <button type="button" tabindex="0"
                                      class="dropdown-item">
                             	     <li data-filter=".painting">회화</li>
                              </button>
                              <button type="button" tabindex="0"
                                      class="dropdown-item">
                             	   <li data-filter=".animation">애니메이션</li>
                              </button>
                               <button type="button" tabindex="0"
                                      class="dropdown-item">
                             	   <li data-filter=".design">디자인</li>
                              </button>
                               <button type="button" tabindex="0"
                                      class="dropdown-item">
                             	  <li data-filter=".calligraphy">캘리그라피</li>
                              </button>
                               <button type="button" tabindex="0"
                                      class="dropdown-item">
                             	  <li data-filter=".crafts">조소/공예</li>
                              </button>
                            
                          </div>
                          
                      </div>
                      </ul> 
				</div>
				<!-- 메뉴 바 끝 -->	
			<div class="col-md-12 filters-content">
				<div class="row portfolio-grid">
					<div class="grid-sizer col-md-6 col-lg-3 "></div>
						<div class="col-md-6 col-lg-3 all illustration  seoul class_content">
						
							<a href="<c:url value='/View'/>" class="block-5"
								style="background-image: url('<c:url value='/resources/artclass/images/menu-list/1.jpg'/>');">
								<div class="text">
	
									<h3 class="heading">일러스트레이션</h3>
									<div class="post-meta">
										<span>장소:가산디지털단지</span>
									</div>
									<p>
										<span class="price">￦30,000</span>
									</p>
									<p>재미있어요</p>
								</div>
							</a>
						</div>


					<div class="col-md-6 col-lg-3 all painting  seoul class_content">
						<a href="#" class="block-5"
							style="background-image: url('<c:url value='/resources/artclass/images/menu-list/1.jpg'/>');">

							<div class="text">

								<h3 class="heading">페인팅</h3>
								<div class="post-meta">
									<span>장소:가산디지털단지</span>
								</div>
								<p>
									<span class="price">￦30,000</span>
								</p>
								<p>재미있어요</p>
							</div>
						</a>
					</div>


					<div class="col-md-6 col-lg-3 all design daejeon class_content">
						<a href="#" class="block-5"
							style="background-image: url('<c:url value='/resources/artclass/images/menu-list/1.jpg'/>');">

							<div class="text">

								<h3 class="heading">디자인</h3>
								<div class="post-meta">
									<span>장소:대전</span>
								</div>
								<p>
									<span class="price">￦30,000</span>
								</p>
								<p>재미있어요</p>
							</div>
						</a>
					</div>


					<div class="col-md-6 col-lg-3 all calligraphy gg class_content">
						<a href="#" class="block-5"
							style="background-image: url('<c:url value='/resources/artclass/images/menu-list/1.jpg'/>');">

							<div class="text">

								<h3 class="heading">캘리그라피</h3>
								<div class="post-meta">
									<span>장소:경기도</span>
								</div>
								<p>
									<span class="price">￦30,000</span>
								</p>
								<p>재미있어요</p>
							</div>
						</a>
					</div>


					<div class="col-md-6 col-lg-3 all design gg class_content">
						<a href="#" class="block-5"
							style="background-image: url('<c:url value='/resources/artclass/images/menu-list/1.jpg'/>');">

							<div class="text">

								<h3 class="heading">디자인</h3>
								<div class="post-meta">
									<span>장소:경기도</span>
								</div>
								<p>
									<span class="price">￦30,000</span>
								</p>
								<p>재미있어요</p>
							</div>
						</a>
					</div>


					<div class="col-md-6 col-lg-3 all calligraphy gg class_content">
						<a href="#" class="block-5"
							style="background-image: url('<c:url value='/resources/artclass/images/menu-list/1.jpg'/>');">

							<div class="text">

								<h3 class="heading">칼리그라피</h3>
								<div class="post-meta">
									<span>장소:경기도</span>
								</div>
								<p>
									<span class="price">￦30,000</span>
								</p>
								<p>재미있어요</p>
							</div>
						</a>
					</div>


					<div class="col-md-6 col-lg-3 all crafts busan class_content">
						<a href="#" class="block-5"
							style="background-image: url('<c:url value='/resources/artclass/images/menu-list/1.jpg'/>');">

							<div class="text">

								<h3 class="heading">조소/공예</h3>
								<div class="post-meta">
									<span>장소:부산</span>
								</div>
								<p>
									<span class="price">￦30,000</span>
								</p>
								<p>재미있어요</p>
							</div>
						</a>
					</div>

					<div class="col-md-6 col-lg-3 all crafts busan class_content">
						<a href="#" class="block-5"
							style="background-image: url('<c:url value='/resources/artclass/images/menu-list/1.jpg'/>');">

							<div class="text">

								<h3 class="heading">조소/공예</h3>
								<div class="post-meta">
									<span>장소:부산</span>
								</div>

								<p>재미있어요</p>
							</div>
						</a>
					</div>
				</div>
			</div>
		</div>
</section>




<script src="<c:url value='/resources/artclass2/js/jquery.min.js'/>"></script>
<script	src="<c:url value='/resources/artclass2/js/jquery-migrate-3.0.1.min.js'/>"></script>
<script src="<c:url value='/resources/artclass2/js/popper.min.js'/>"></script>
<script src="<c:url value='/resources/artclass2/js/bootstrap.min.js'/>"></script>
<script	src="<c:url value='/resources/artclass2/js/jquery.easing.1.3.js'/>"></script>
<script	src="<c:url value='/resources/artclass2/js/jquery.waypoints.min.js'/>"></script>
<script	src="<c:url value='/resources/artclass2/js/jquery.stellar.min.js'/>"></script>
<script	src="<c:url value='/resources/artclass2/js/owl.carousel.min.js'/>"></script>
<script	src="<c:url value='/resources/artclass2/js/jquery.magnific-popup.min.js'/>"></script>
<script src="<c:url value='/resources/artclass2/js/aos.js'/>"></script>
<script	src="<c:url value='/resources/artclass2/js/jquery.animateNumber.min.js'/>"></script>
<script	src="<c:url value='/resources/artclass2/js/bootstrap-datepicker.js'/>"></script>
<script	src="<c:url value='/resources/artclass2/js/jquery.timepicker.min.js'/>"></script>
<script	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
<script src="<c:url value='/resources/artclass2/js/google-map.js'/>"></script>
<script src="<c:url value='/resources/artclass2/js/main.js'/>"></script>

    

<script>
$(function(){
	
	$('.dropdown-item').click(function() {
        $('.dropdown-menu').removeClass('show');
     });
	});

</script>







<!--   <script src="<c:url value='/resources/artclass3/js/main.js'/>"></script>-->









