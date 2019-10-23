<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<style>
.img {
	width: 150px !important;
	height: 150px !important;
	max-width: 100%;
	max-height: 100%;
}

.img1 {
	width: 250px !important;
	height: 250px !important;
	max-width: 100%;
	max-height: 100%;
}

.d-block w-100 {
	width: 100px !important;
	height: 150px !important;
	max-width: 100%;
	max-height: 100%;
	
}
   /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 100%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
</style>



<!doctype html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>아트 클래스</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">



<!-- Stylesheets -->
<link rel="stylesheet"
	href="<c:url value='/resources/artclass/css/plugins.css'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/artclass/css/style.css'/>">
<!-- Cusom css -->
<link rel="stylesheet"
	href="<c:url value='/resources/artclass/css/custom.css'/>">


</head>

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="<c:url value='/resources/artclass2/css/bootstrap.css'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/artclass2/vendors/linericon/style.css'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/artclass2/css/font-awesome.min.css'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/artclass2/vendors/owl-carousel/owl.carousel.min.css'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/artclass2/vendors/bootstrap-datepicker/bootstrap-datetimepicker.min.css'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/artclass2/vendors/nice-select/css/nice-select.css'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/artclass2/vendors/owl-carousel/owl.carousel.min.css'/>">
<!-- Date Picker -->
<link rel="stylesheet"
	href="<c:url value='/resources/artclass2/css/bootstrap-datepicker.css'/>">


</head>
<body>
	<!--[if lte IE 9]>
		<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
	<![endif]-->

	<!-- Start Blog List View Area -->
	<section
		class="blog__list__view section-padding--lg menudetails-right-sidebar bg--white">



		<div class="container">


			<div class="row">

				<div class="col-lg-8 col-md-8 col-sm-12" >

					<div class="food__menu__container">
						<!-- 사진  슬라이드 시작-->

						<div id="demo" class="carousel slide" data-rode="carousel">
							<div class="carousel-inner">

								<div class="carousel-item active">
									<img class="d-block w-100"
										src="<c:url value='/resources/artclass/images/menu-list/1.jpg'/>"
										alt="First slide" 
										height="600px !important">
									<div class=carousel-caption d-noned-md-block"></div>
								</div>
								<div class="carousel-item">
									<img class="d-block w-100"
										src="<c:url value='/resources/artclass/images/menu-list/1.jpg'/>"
										alt="Second slide"  
										 height="600px !important">

								</div>
								<div class="carousel-item">
									<img class="d-block w-100"
										src="<c:url value='/resources/artclass/images/menu-list/1.jpg'/>"
										alt="Third slide" 
										 height="600px !important">

								</div>

								<a class="carousel-control-prev" href="#demo" data-slide="prev" style= "height:650px">
									<span class="carousel-control-prev-icon" aria-hidden="true"  ></span>

								</a> <a class="carousel-control-next" href="#demo" data-slide="next" style= "height:650px">
									<span class="carousel-control-next-icon" aria-hidden="true" ></span>
								</a>


								<div class="food__menu__details">
									<div class="food__menu__content">

										<h2>민화</h2>
										<ul class="food__dtl__prize d-flex">

											<li>￦30,000</li>

										</ul>
										<!-- Start Category Area -->

										<div class="food__category__area mt--60" style= "padding:10px 10px">

											<ul class="food__category">
												<li><a href="#"> 난이도<span>중</span></a></li>
												<li><a href="#">소요시간<span>2시간</span>
												</a></li>
												<li><a href="#">최대인원 <span>최대 3명</span></a></li>


											</ul>
										</div>
										<!-- End Category Area -->
									</div>
								</div>

								<!-- 사진  슬라이드 끝-->




								<div
									class="food__menu__inner d-flex flex-wrap flex-md-nowrap flex-lg-nowrap">


									<div class="product-action-wrap">
										<div class="prodict-statas">
											<span>민화예요</span>
										</div>



										<div class="product-quantity">
											<form id='myform' method='POST' action='#'>
												<div class="product-quantity"></div>
											</form>
										</div>

									</div>
								</div>
							</div>
						</div>

						<!-- Start Product Descrive Area -->
						<div class="menu__descrive__area">
							<div class="menu__nav nav nav-tabs" role="tablist">
								<a class="active" id="nav-all-tab" data-toggle="tab"
									href="#nav-all" role="tab">Description</a> <a
									id="nav-location-tab" data-toggle="tab" href="#nav-1"
									role="tab">Location</a> <a id="nav-location-tab"
									data-toggle="tab" href="#nav-2" role="tab">introduce artist
								</a>

							</div>
							<!-- Start Tab Content -->
							<div class="menu__tab__content tab-content" id="nav-tabContent">
								<!-- Start Single Content -->
								<div class="single__dec__content fade show active" id="nav-all"
									role="tabpanel">
									<p>민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화</p>
									<p>
										민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화
										<strong>“민화 ”</strong>
										민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화
									</p>
								</div>
								<!-- End Single Content -->
								<!-- Start Single Content -->
								<div class="single__dec__content fade" id="nav-2"
									role="tabpanel">
									<p>이름 : 한진섭</p>
									<p>
										<strong>“경력 ”</strong> 20년
									</p>
								</div>
								<!-- End Single Content -->
								<!-- Start Single Content -->
								<div class="single__dec__content fade" id="nav-1"
									role="tabpanel">
									<div class="review__wrapper">

                                      <div class="card-title">Google Maps</div>
                                      <div id="gmap-example"></div>
                                 
									</div>

								</div>
								<!-- End Single Content -->
							</div>
							<!-- End Tab Content -->
						</div>
						<!-- End Product Descrive Area -->
					</div>
					
					<div class="row">
						<div class="col-md-12">
							<div class="popupal__menu">
								<h4>인기있는 항목</h4>
							</div>
						</div>
					</div>
					<div class="row mt--10">
 						
						<!-- Start Single Product -->
						<div class="col-lg-4 col-md-6 col-sm-12" >
							<div class="beef_product">
								<div class="beef__thumb">
									<a href="menu-details.html"> <img class='img1'
										src=" <c:url value='/resources/artclass/images/menu-list/1.jpg'/>"
										>
									</a>
								</div>
								<div class="beef__details">
									<h4>
										<a href="menu-details.html">서예</a>
									</h4>
									<ul class="beef__prize">
										<li class="old__prize">￦30,000</li>
										<li>￦30,000</li>
									</ul>
									<p>동양화와 함께해요 동양화와 함께해요</p>
									<div class="beef__cart__btn">
										<a href="cart.html">배우러 가기</a>
									</div>
								</div>
							</div>
						</div>
						
						<!-- End Single Product -->
						<!-- Start Single Product -->
						<div class="col-lg-4 col-md-6 col-sm-12">
							<div class="beef_product">
								<div class="beef__thumb">
									<a href="menu-details.html"> <img class='img1'
										src=" <c:url value='/resources/artclass/images/menu-list/1.jpg'/>"
										>
									</a>
								</div>


								<div class="beef__details">
									<h4>
										<a href="menu-details.html">기타</a>
									</h4>
									<ul class="beef__prize">
										<li class="old__prize">￦30,000</li>
										<li>￦30,000</li>
									</ul>
									<p>동양화와 함께해요 동양화와 함께해요</p>
									<div class="beef__cart__btn">
										<a href="cart.html">배우러 가기</a>
									</div>
								</div>
							</div>
						</div>
						<!-- End Single Product -->


						<!-- Start Single Product -->
						<div class="col-lg-4 col-md-6 col-sm-12">
							<div class="beef_product">
								<div class="beef__thumb">
									<a href="menu-details.html"> <img class='img1'
										src=" <c:url value='/resources/artclass/images/menu-list/1.jpg'/>"
										>
									</a>
								</div>


								<div class="beef__details">
									<h4>
										<a href="menu-details.html">동양화</a>
									</h4>
									<ul class="beef__prize">
										<li class="old__prize">￦30,000</li>
										<li>￦30,000</li>
									</ul>
									<p>동양화와 함께해요 동양화와 함께해요</p>
									<div class="beef__cart__btn">
										<a href="cart.html">배우러 가기</a>
									</div>
								</div>
							</div>
						</div>
						<!-- End Single Product -->
					</div>
				</div>

				<div class="col-lg-4 col-md-12 col-sm-14 md--mt--40 sm--mt--40">
				
				
					<!--================Banner Area =================-->
									
								<div class="food__category__area mt--60">
									<h4 class="side__title">예약하기</h4>	
                                    
                                  <div class="main-card mb-3 card">
                                                        <div class="card-body">
                                                            <h5 class="card-title">날짜 선택</h5>
                                                            <div class="input-group">
                                                                <div class="input-group-prepend datepicker-trigger">
                                                                    <div class="input-group-text">
                                                                        <i class="fa fa-calendar-alt"></i>
                                                                    </div>
                                                                </div>
                                                                <input type="text" class="form-control"
                                                                       data-toggle="datepicker-icon"/>
                                                            </div>
                                                      
				                                        <h5 class="card-title">인원 선택</h5>
														 <div class="col-md-4">
														<div class="book_tabel_item">
															<div class="input-group">
																<select class="wide">
																	<option value="1">1명</option>
																	<option value="3">3명</option>
																	<option value="4">4명</option>
																	<option value="4">5명</option>
																	<option value="4">6명</option>
																	<option value="4">7명</option>
																</select>
				
															</div>
														</div>
															
													</div>
												<h5 class="card-title">  </h5>	
												<button type="button" class="btn btn-danger">예약하기</button>
												<button type="button" class="btn btn-light">메세지보내기</button>
												
										
													 
												</div>
											  </div>	
										
							
					
									
							<!-- <div class="boking_table">
								<div class="row">
									<div class="col-md-10">
										<div class="book_tabel_item">
											<div class="form-group">
												<div class='input-group date' id='datetimepicker11'>
													<input type='text' class="form-control"
														placeholder="Start Date" /> <span
														class="input-group-addon"> <i
														class="fa fa-calendar" aria-hidden="true"></i>
													</span>
												</div>
											</div>
											<div class="form-group">
												<div class='input-group date' id='datetimepicker1'>
													<input type='text' class="form-control"
														placeholder="finish Date" /> <span
														class="input-group-addon"> <i
														class="fa fa-calendar" aria-hidden="true"></i>
													</span>
												</div>
											</div>
										</div>
									</div>
									
								</div>
								================Banner Area =================

								<div class="add__to__cart__btn">
									<a class="food__btn" href="cart.html">예약하기</a>

								</div>
							</div> -->

							<div class="food__sidebar">



								<!-- Start Recent Post -->
								<div class="food__recent__post mt--60">
									<h4 class="side__title">최근 아트 클래스</h4>
									<div class="recent__post__wrap">
										<!-- Start Single Post -->
										<div class="single__recent__post d-flex">
											<div class="recent__post__thumb">
												<a href="blog-details.html"> <img class='img'
													src=" <c:url value='/resources/artclass/images/menu-list/1.jpg'/>"
													alt="beef images">
												</a>
											</div>
											<div class="recent__post__details">
												<span>2019년 9월13일 금요일</span>
												<h4>
													<a href="blog-details.html">보고가세요.</a>
												</h4>
											</div>
										</div>
										<!-- End Single Post -->
										<!-- Start Single Post -->
										<div class="single__recent__post d-flex">
											<div class="recent__post__thumb">
												<a href="blog-details.html"> <img class='img'
													src=" <c:url value='/resources/artclass/images/menu-list/1.jpg'/>"
													alt="beef images">
												</a>
											</div>
											<div class="recent__post__details">
												<span>2019년 9월13일 금요일</span>
												<h4>
													<a href="blog-details.html">보고 가세요</a>
												</h4>
											</div>
										</div>
										<!-- End Single Post -->




										<!-- Start Single Post -->
										<div class="single__recent__post d-flex">
											<div class="recent__post__thumb">
												<a href="blog-details.html"> <img class='img'
													src=" <c:url value='/resources/artclass/images/menu-list/1.jpg'/>"
													alt="beef images">
												</a>
											</div>
											<div class="recent__post__details">
												<span>February 13, 2019</span>
												<h4>
													<a href="blog-details.html">보고 가세요.</a>
												</h4>
											</div>
										</div>
										<!-- End Single Post -->
										<!-- Start Single Post -->
										<div class="single__recent__post d-flex">
											<div class="recent__post__thumb">
												<a href="blog-details.html"> <img class='img'
													src=" <c:url value='/resources/artclass/images/menu-list/1.jpg'/>"
													alt="beef images">
												</a>
											</div>
											<div class="recent__post__details">
												<span>February 15, 2019</span>
												<h4>
													<a href="blog-details.html">보고 가세요.</a>
												</h4>
											</div>
										</div>
										<!-- End Single Post -->
									</div>
								</div>
								<!-- End Recent Post -->

								<!-- Start Category Area -->

								<div class="food__category__area mt--60">
									<h4 class="side__title">Categories</h4>
									<ul class="food__category">
										<li><a href="#">일러스트레이션 <span>(20)</span></a></li>
										<li><a href="#">회화 <span>(30)</span></a></li>
										<li><a href="#">애니메이션 <span>(40)</span></a></li>
										<li><a href="#">디자인 <span>(50)</span></a></li>
										<li><a href="#">캘리그라피 <span>(60)</span></a></li>
										<li><a href="#">조소/공예 <span>(70)</span></a></li>

									</ul>
								</div>
								<!-- End Category Area -->
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>

	</section>
	<!-- End Blog List View Area -->


	<!-- Login Form 
	<div class="accountbox-wrapper">
		<div class="accountbox text-left">
			<ul class="nav accountbox__filters" id="myTab" role="tablist">
				<li><a class="active" id="log-tab" data-toggle="tab"
					href="#log" role="tab" aria-controls="log" aria-selected="true">Login</a>
				</li>
				<li><a id="profile-tab" data-toggle="tab" href="#profile"
					role="tab" aria-controls="profile" aria-selected="false">Register</a>
				</li>
			</ul>
			<div class="accountbox__inner tab-content" id="myTabContent">
				<div class="accountbox__login tab-pane fade show active" id="log"
					role="tabpanel" aria-labelledby="log-tab">
					<form action="#">
						<div class="single-input">
							<input class="cr-round--lg" type="text"
								placeholder="User name or email">
						</div>
						<div class="single-input">
							<input class="cr-round--lg" type="password"
								placeholder="Password">
						</div>
						<div class="single-input">
							<button type="submit" class="card-title">
								<span>Go</span>
							</button>
						</div>
						<div class="accountbox-login__others">
							<h6>Or login with</h6>
							<div class="social-icons">
								<ul>
									<li class="facebook"><a href="https://www.facebook.com/"><i
											class="fa fa-facebook"></i></a></li>
									<li class="twitter"><a href="https://twitter.com/"><i
											class="fa fa-twitter"></i></a></li>
									<li class="pinterest"><a href="#"><i
											class="fa fa-google-plus"></i></a></li>
								</ul>
							</div>
						</div>
					</form>
				</div>
				<div class="accountbox__register tab-pane fade" id="profile"
					role="tabpanel" aria-labelledby="profile-tab">
					<form action="#">
						<div class="single-input">
							<input class="cr-round--lg" type="text" placeholder="User name">
						</div>
						<div class="single-input">
							<input class="cr-round--lg" type="email"
								placeholder="Email address">
						</div>
						<div class="single-input">
							<input class="cr-round--lg" type="password"
								placeholder="Password">
						</div>
						<div class="single-input">
							<input class="cr-round--lg" type="password"
								placeholder="Confirm password">
						</div>
						<div class="single-input">
							<button type="submit" class="food__btn">
								<span>Sign Up</span>
							</button>
						</div>
					</form>
				</div>
				<span class="accountbox-close-button"><i
					class="zmdi zmdi-close"></i></span>
			</div>
		</div>
	</div>  -->
	<!-- //Login Form -->

	</div>
	<!-- //Main wrapper -->

	<!-- JS Files -->
	<script
		src="<c:url value='/resources/artclass/js/vendor/jquery-3.2.1.min.js'/>"></script>
	<script src="<c:url value='/resources/artclass/js/popper.min.js'/>"></script>
	<script src="<c:url value='/resources/artclass/js/bootstrap.min.js'/>"></script>
	<script src="<c:url value='/resources/artclass/js/plugins.js'/>"></script>
	<script src="<c:url value='/resources/artclass/js/active.js'/>"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

	<script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>">
		
	</script>

	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script
		src="<c:url value='/resources/artclass2/js/jquery-3.2.1.min.js'/>"></script>
	<script src="<c:url value='/resources/artclass2/js/popper.js'/>"></script>
	<script src="<c:url value='/resources/artclass2/js/bootstrap.min.js'/>"></script>
	<script
		src="<c:url value='/resources/artclass2/vendors/owl-carousel/owl.carousel.min.js'/>"></script>
	<script
		src="<c:url value='/resources/artclass2/js/jquery.ajaxchimp.min.js'/>"></script>
	<script src="<c:url value='/resources/artclass2/js/mail-script.js'/>"></script>
	<script
		src="<c:url value='/resources/artclass2/vendors/bootstrap-datepicker/bootstrap-datetimepicker.min.js'/>"></script>
	<script
		src="<c:url value='/resources/artclass2/vendors/nice-select/js/jquery.nice-select.js'/>"></script>
	<script src="<c:url value='/resources/artclass2/js/mail-script.js'/>"></script>
	<script src="<c:url value='/resources/artclass2/js/stellar.js'/>"></script>
	<script
		src="<c:url value='/resources/artclass2/vendors/lightbox/simpleLightbox.min.js'/>"></script>
	<script src="<c:url value='/resources/artclass2/js/custom.js'/>"></script>
	<!-- Date Picker -->
	<script
		src="<c:url value='/resources/artclass2/js/bootstrap-datepicker.js'/>"></script>
		
		<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBwlNqAEil52XRPHmSVb4Luk18qQG9GqcM&sensor=false&language=en"></script> 

		
		
</body>
</html>
