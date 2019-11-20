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

#map {
	height: 100%;
}

html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}

  
* {
	box-sizing: border-box;
}

.row>.column {
	padding: 0 8px;
}

.row:after {
	content: "";
	display: table;
	clear: both;
}

.column {
	float: left;
	width: 25%;
}

.slides {
	padding: 0;
	width: 609px;
	height: 420px;
	display: block;
	margin: 0 auto;
	position: relative;
}

.slides * {
	user-select: none;
	-ms-user-select: none;
	-moz-user-select: none;
	-khtml-user-select: none;
	-webkit-user-select: none;
	-webkit-touch-callout: none;
}

.slides input {
	display: none;
}

.slide-container {
	display: block;
}

.slide {
	top: 0;
	opacity: 0;
	width: 609px;
	height: 420px;
	display: block;
	position: absolute;
	transform: scale(0);
	transition: all .7s ease-in-out;
}

.slide img {
	width: 100%;
	height: 100%;
}

.nav label {
	width: 200px;
	height: 100%;
	display: none;
	position: absolute;
	opacity: 0;
	z-index: 9;
	cursor: pointer;
	transition: opacity .2s;
	color: #FFF;
	font-size: 156pt;
	text-align: center;
	line-height: 380px;
	
	background-color: rgba(255, 255, 255, .3);
	text-shadow: 0px 0px 15px rgb(119, 119, 119);
}

.slide:hover+.nav label {
	opacity: 0.5;
}

.nav label:hover {
	opacity: 1;
}

.nav .next {
	right: 0;
}

input:checked+.slide-container  .slide {
	opacity: 1;
	transform: scale(1);
	transition: opacity 1s ease-in-out;
}

input:checked+.slide-container .nav label {
	display: block;
}

.nav-dots {
	width: 100%;
	bottom: 9px;
	height: 11px;
	display: block;
	position: absolute;
	text-align: center;
}

.nav-dots .nav-dot {
	top: -5px;
	width: 11px;
	height: 11px;
	margin: 0 4px;
	position: relative;
	border-radius: 100%;
	display: inline-block;
	background-color: rgba(0, 0, 0, 0.6);
}

.nav-dots .nav-dot:hover {
	cursor: pointer;
	background-color: rgba(0, 0, 0, 0.8);
}

input#img-1:checked ~ .nav-dots label#img-dot-1, input#img-2:checked ~
	.nav-dots label#img-dot-2, input#img-3:checked ~ .nav-dots label#img-dot-3,
	input#img-4:checked ~ .nav-dots label#img-dot-4, input#img-5:checked ~
	.nav-dots label#img-dot-5, input#img-6:checked ~ .nav-dots label#img-dot-6
	{
	background: rgba(0, 0, 0, 0.8);
}

.popular{
    position: relative;
    top: 200px;
}
</style>


<!-- 
<!--로그인시 버튼 수정 삭제  
<script>
	$(function(){
		
		//페이지 로드시 코멘트 목록 뿌려주기]
		showComment();
		
		
		//코멘트 입력및 수정처리]
		$('#submit').click(function(){
			if($(this).val()=='등록')
				var action="<c:url value='/MemoComment/BBS/Write.bbs'/>";
			else
				var action="<c:url value='/MemoComment/BBS/Edit.bbs'/>";	
			//ajax로 요청]
			$.ajax({
				url:action,
				data:$('#frm').serialize(),
				dataType:'text',
				type:'post',
				success:function(data){
					console.log(data);
					//등록한후 현재 모든 댓글 뿌려주기
					showComment();
					//입력댓글 클리어 및 포커스 주기
					$('#title').val('');
					$('#title').focus();
					//글 수정후 등록버튼으로 다시 교체하기
					if($('#submit').val()=='수정')
						$('#submit').val('등록');
				}				
			});	
			
		});//#submit
</script>
 -->

<!--로그인시 버튼 수정 삭제 끝 -->



<!-- Stylesheets -->
<link rel="stylesheet"
	href="<c:url value='/resources/artclass/css/plugins.css'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/artclass/css/style.css'/>">
<!-- Cusom css -->
<link rel="stylesheet"
	href="<c:url value='/resources/artclass/css/custom.css'/>">

<!-- timepicker
 <link rel="stylesheet" href="https://kendo.cdn.telerik.com/2019.3.1023/styles/kendo.common.min.css"/>
    <link rel="stylesheet" href="https://kendo.cdn.telerik.com/2019.3.1023/styles/kendo.rtl.min.css"/>
    <link rel="stylesheet" href="https://kendo.cdn.telerik.com/2019.3.1023/styles/kendo.silver.min.css"/>
    <link rel="stylesheet" href="https://kendo.cdn.telerik.com/2019.3.1023/styles/kendo.mobile.all.min.css"/>

    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script src="https://kendo.cdn.telerik.com/2019.3.1023/js/kendo.all.min.js"></script>
     -->

<!--[if lte IE 9]>
		<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
	<![endif]-->

<!-- Start Blog List View Area -->
<section
	class="blog__list__view section-padding--lg menudetails-right-sidebar bg--white">


	<div class="container">			
									
								
		<div class="row">

			<div class="col-lg-6 col-md-6 col-sm-12">

				<div class="food__menu__container" style="position: relative;top: 5%;left: 5%;">

					<div class="carousel-inner mySlides">
					
						<div class="carousel-item active" >


							<!-- 사진  슬라이드 시작
							<div id="demo" class="carousel slide" data-rode="carousel">
							<div class="carousel-inner mySlides">
								<div class="carousel-item active">
									<img class="d-block w-100"
										src="<c:url value='/resources/artclass/images/menu-list/1.jpg'/>"
										alt="First slide" 
										height="600px !important">
									<div class=carousel-caption ></div>
								</div>
								<div class="carousel-item">
									<img class="d-block w-100"
										src="<c:url value='/resources/artclass/images/menu-list/2.jpg'/>"
										alt="Second slide"  
										 height="600px !important">

								</div>
								<div class="carousel-item">
									<img class="d-block w-100"
										src="<c:url value='/resources/artclass/images/menu-list/3.jpg'/>"
										alt="Third slide" 
										 height="600px !important">

								</div>

								<a class="carousel-control-prev" href="#demo" data-slide="prev" role="button"style= "height:650px">
									<span class="carousel-control-prev-icon" aria-hidden="true"  ></span>

								</a> <a class="carousel-control-next" href="#demo" data-slide="next" role="button" style= "height:650px">
									<span class="carousel-control-next-icon" aria-hidden="true" ></span>
								</a>
								-->
								<!-- 사진  슬라이드 끝-->



						

							<ul class="slides">
								<input type="radio" name="radio-btn" id="img-1" checked />
								<li class="slide-container">
									<div class="slide">
										<img
											src="<c:url value='/resources/artclass/images/2.jpg'/>" />
									</div>
									<div class="nav">
										<label for="img-6" class="prev">&#x2039;</label> <label
											for="img-2" class="next">&#x203a;</label>
									</div>
								</li>

								<input type="radio" name="radio-btn" id="img-2" />
								<li class="slide-container">
									<div class="slide">
										<img
											src="<c:url value='/resources/artclass/images/4.jpg'/>" />
									</div>
									<div class="nav">
										<label for="img-1" class="prev">&#x2039;</label> <label
											for="img-3" class="next">&#x203a;</label>
									</div>
								</li>

								<input type="radio" name="radio-btn" id="img-3" />
								<li class="slide-container">
									<div class="slide">
										<img
											src="http://farm9.staticflickr.com/8068/8250438572_d1a5917072_z.jpg" />
									</div>
									<div class="nav">
										<label for="img-2" class="prev">&#x2039;</label> <label
											for="img-4" class="next">&#x203a;</label>
									</div>
								</li>

								<input type="radio" name="radio-btn" id="img-4" />
								<li class="slide-container">
									<div class="slide">
										<img
											src="http://farm9.staticflickr.com/8061/8237246833_54d8fa37f0_z.jpg" />
									</div>
									<div class="nav">
										<label for="img-3" class="prev">&#x2039;</label> <label
											for="img-5" class="next">&#x203a;</label>
									</div>
								</li>

								<input type="radio" name="radio-btn" id="img-5" />
								<li class="slide-container">
									<div class="slide">
										<img
											src="http://farm9.staticflickr.com/8055/8098750623_66292a35c0_z.jpg" />
									</div>
									<div class="nav">
										<label for="img-4" class="prev">&#x2039;</label> <label
											for="img-6" class="next">&#x203a;</label>
									</div>
								</li>

								<input type="radio" name="radio-btn" id="img-6" />
								<li class="slide-container">
									<div class="slide">
										<img
											src="http://farm9.staticflickr.com/8195/8098750703_797e102da2_z.jpg" />
									</div>
									<div class="nav">
										<label for="img-5" class="prev">&#x2039;</label> <label
											for="img-1" class="next">&#x203a;</label>
									</div>
								</li>

								<li class="nav-dots"><label for="img-1" class="nav-dot"
									id="img-dot-1"></label> <label for="img-2" class="nav-dot"
									id="img-dot-2"></label> <label for="img-3" class="nav-dot"
									id="img-dot-3"></label> <label for="img-4" class="nav-dot"
									id="img-dot-4"></label> <label for="img-5" class="nav-dot"
									id="img-dot-5"></label> <label for="img-6" class="nav-dot"
									id="img-dot-6"></label></li>
							</ul>


							<div
								class="food__menu__inner d-flex flex-wrap flex-md-nowrap flex-lg-nowrap">
								<div class="product-action-wrap">

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


						<div class="card-body" style="padding: 0px">
							<ul class="tabs-animated-shadow nav-justified tabs-animated nav">
								<li class="nav-item"><a role="tab" class="nav-link active"
									id="tab-c1-0" data-toggle="tab" href="#tab-animated1-0"> <span
										class="nav-text">소개</span>
								</a></li>
								<li class="nav-item"><a role="tab" class="nav-link"
									id="tab-c1-1" data-toggle="tab" href="#tab-animated1-1"> <span
										class="nav-text">장소</span>
								</a></li>
								<li class="nav-item"><a role="tab" class="nav-link"
									id="tab-c1-2" data-toggle="tab" href="#tab-animated1-2"> <span
										class="nav-text">작가 정보</span>
								</a></li>
							</ul>
							<div class="tab-content">
								<div class="tab-pane active" id="tab-animated1-0"
									role="tabpanel">
									<p class="mb-0">아트 아트 아트 아트아트 아트아트 아트아트 아트아트 아트아트 아트아트 아트아트 아트아트 아트아트 아트아트 아트</p>
								</div>
								<div class="tab-pane" id="tab-animated1-1" role="tabpanel">
									<div id="map" style="width: 100%; height: 350px;"></div>
								</div>
								<div class="tab-pane" id="tab-animated1-2" role="tabpanel">
									<p class="mb-0">이름:</p>
									<p class="mb-0">나이:</p>
								</div>
							</div>
							<!-- Start Single Content -->
						</div>
						<!-- End Tab Content -->
					</div>
					<!-- End Product Descrive Area -->
				</div>
				
				<div class="row">
					<div class="col-md-12">
						<div class="popupal__menu" style="
    position: relative;
    top: 250px;">
							<h4>인기있는 항목</h4>
						</div>
					</div>
				</div>
				<div class="row mt--10">

					<!-- Start Single Product -->
					<div class="col-lg-4 col-md-6 col-sm-12 popular">
						<div class="beef_product">
							<div class="beef__thumb">
								<a href="menu-details.html"> <img class='img1'
									src=" <c:url value='/resources/artclass/images/menu-list/1.jpg'/>">
								</a>
							</div>
							<div class="beef__details">
								<h4>
									<a href="menu-details.html">서예</a>
								</h4>
								<ul class="beef__prize">

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
					<div class="col-lg-4 col-md-6 col-sm-12 popular">
						<div class="beef_product">
							<div class="beef__thumb">
								<a href="menu-details.html"> <img class='img1'
									src=" <c:url value='/resources/artclass/images/menu-list/1.jpg'/>">
								</a>
							</div>


							<div class="beef__details">
								<h4>
									<a href="menu-details.html">기타</a>
								</h4>
								<ul class="beef__prize">

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
					<div class="col-lg-4 col-md-6 col-sm-12 popular">
						<div class="beef_product">
							<div class="beef__thumb">
								<a href="menu-details.html"> <img class='img1'
									src=" <c:url value='/resources/artclass/images/menu-list/1.jpg'/>">
								</a>
							</div>


							<div class="beef__details">
								<h4>
									<a href="menu-details.html">동양화</a>
								</h4>
								<ul class="beef__prize">

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

			<div class="col-lg-4 col-md-12 col-sm-14 md--mt--40 sm--mt--40"
				style="left: 150px;">
                         			    <!-- 수정 삭제 버튼 -->
                          <div class="col-lg-10" style="left: 40%;">
                           <a href="<c:url value='/View_Input'/>">  
                            <button class="mb-2 mr-2 btn-icon btn-pill btn btn-outline-primary">
                               <i class="pe-7s-tools btn-icon-wrapper"> </i>수정하기
                            </button></a>
                                                     
                            <button class="mb-2 mr-2 btn-icon btn-pill btn btn-outline-danger">
                                <i class="pe-7s-trash btn-icon-wrapper"> </i>삭제하기
                            </button>
                          </div>
                          				<!-- 수정 삭제 버튼 -->
				<!--================Banner Area =================-->

				<div class="food__category__area mt--60">

					<h4 class="side__title" id="modal_opne_btn">예약하기</h4>

					<div class="main-card mb-3 card">

						<div class="card-body">
							<div class="food__menu__details">
								<div class="food__menu__content">

									<h2>애니메이션</h2>
									<ul class="food__dtl__prize d-flex">

										<li>￦30,000</li>

									</ul>
									<!-- Start Category Area -->

									<div class="food__category__area mt--60"
										style="padding: 10px 10px">

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

							<!--    
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
-->



							<!-- timepicker
															<input id="timepicker">
															<script>
															$("#timepicker").kendoTimePicker({
																'disableTimeRanges': [
																	['1am', '2am'],
																	['3am', '4:00am']
																]
															});
											
															var timepicker = $("#timepicker").data("kendoTimePicker");
															
															var value = timepicker.value();
															console.log(value);
															</script>
																	 -->


							<h5 class="card-title"></h5>

							<button type="button" class="btn btn-danger" data-toggle="modal"
								data-target="#modalQuickView">예약하기</button>
							<button type="button" class="btn btn-light">메세지보내기</button>





						</div>
					</div>




					<!-- <div class="boking_table">

													</div>
												<h5 class="card-title">  </h5>	
												<a href="Order.do"><button type="button" class="btn btn-danger">예약하기</button></a>
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


<!-- Modal -->
<div class="modal fade" id="modalQuickView" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true"
	data-backdrop="false" style="background: rgba(10, 0, 0, 0.5);">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-body">
				<div class="row">
					<div class="col-lg-5">
						<div data-toggle="datepicker-inline" style="position: relative;top: 30px;"></div>
					</div>
					<div class="col-lg-7">
						<h2 class="h2-responsive product-name">
							<strong>아트 클래스</strong>
						</h2>
						<h4 class="h4-responsive">
							<span class="green-text"> <strong>30000원</strong>
							<!--  </span> <span class="grey-text"> <small> <s>60000</s> -->
							</small>
							</span>
						</h4>
						
						                        <!-- accordion -->
                                                <div id="accordion" class="accordion-wrapper mb-3">
                                                    <div class="">
                                                        <div id="headingOne" class="card-header">
                                                            <h5 class="mb-0" style="position: relative;bottom: 13px;">2019년 11월 03일</h5>
                                                        </div>
                                                        <div data-parent="#accordion" id="collapseOne1"
                                                             aria-labelledby="headingOne" class="collapse show">
                                                           
                                                        </div>
                                                    </div>
                                                    <div class="">
                                                        <div id="headingTwo" class="b-radius-0 card-header">
                                                            <button type="button" data-toggle="collapse"
                                                                    data-target="#collapseOne2" aria-expanded="false"
                                                                    aria-controls="collapseTwo"
                                                                    class="text-left m-0 p-0 btn btn-link btn-block"><h5
                                                                    class="m-0 p-0" >시간 선택      <i class="icon ion-android-arrow-down"></i> </h5></button>
                                                        </div>
                                                        <div data-parent="#accordion" id="collapseOne2" class="collapse">
                                                            <div class="card-body">
							                                                      <!-- Card body -->
																		
																			<div class="font-icon-wrapper">
																				<i class="lnr-clock"> </i>
																				<p>2:00~4:00</p>
																			</div>
																		
																		<div class="font-icon-wrapper">
																			<i class="lnr-clock"> </i>
																			<p>4:00~6:00</p>
																		</div>
																</div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="">
                                                        <div id="headingThree" class="card-header">
                                                      
												<form name='form' style="right: 10px;bottom: 8px; position: relative">
													<table style="margin: 10px;">
														<td>인원</td>
														<td><input id="pricount" type='text' name='count' value='1' size='3'
															readonly></td>
														<td><a href='#' onclick='change(1);'>▲</a><br>
															<a href='#' onclick='change(-1);'>▼</a> </td>
													</table>
												
												</form>
															<form style="position: relative; left: 20px;bottom: 8px; ">    
												                       합계:<input type="text" id="classPrice" value="30000원" style="position: relative; left: 20px;" />
												                      
															</form>
                                                        </div>
                                                        <div data-parent="#accordion" id="collapseOne3" class="collapse">
                                                            <div class="card-body">
                                                            </div>
                                                        </div>
                                                    </div>
                                                     	<input type="text" id="classValue" style="visibility: hidden;" value=30000 />
                                                </div>
                                            
	                                            <!-- accordion  end -->              
								
							<!-- 결제 버튼 -->
							<div class="card-body" style="position: relative; left: 600px">
								<div class="row">
								<!-- Add to Cart 
									<div class="col-md-6">
					
										<select
											class="md-form mdb-select colorful-select dropdown-primary">
											<option value="" disabled selected>Choose your option</option>
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
										</select> <label>선택하세요</label>
	
									</div>
									<div class="col-md-6">
	
										<select
											class="md-form mdb-select colorful-select dropdown-primary">
											<option value="" disabled selected>Choose your option</option>
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
										</select> <label>선택하세요</label>
	
									</div>
								</div>
								<!-- /.Add to Cart -->
								<div class="text-center">
									<button class="btn btn-primary">
										결제하기 <i class="fas fa-cart-plus ml-2" aria-hidden="true"></i>
									</button>
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">닫기</button>
									
								</div>
							</div>
							
						</div>
						<!-- 결제버튼 end-->
					</div>
				</div>
			</div>
		</div>
	

<!-- Modal end -->

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
<script src="<c:url value='/resources/artclass/js/vendor/jquery-3.2.1.min.js'/>"></script>
<script src="<c:url value='/resources/artclass/js/popper.min.js'/>"></script>
<script src="<c:url value='/resources/artclass/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/resources/artclass/js/plugins.js'/>"></script>
<script src="<c:url value='/resources/artclass/js/active.js'/>"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<!-- Date Picker -->
<script
	src="<c:url value='/resources/artclass2/js/bootstrap-datepicker.js'/>"></script>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBwlNqAEil52XRPHmSVb4Luk18qQG9GqcM&sensor=false&language=en"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=507d9a5016712739e50d9d8c9ef33fd9"></script>
<!-- 맵 -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>
<!-- 이미지 -->
<script>
	function view() {
		var div = document.form
	}
</script>
<script >
	function change(num) {
		
		var value = $('#classValue').val();
		var counter = $('#pricount').val();
		
		if(num == 1){
			counter++;
			//alert((counter*value));
			document.getElementById("pricount").value = counter;
			document.getElementById("classPrice").value=(counter*value)+"원";
		}
		else
		{
			counter--;
			
			if(counter<=0){
		        
			}
			//alert((counter*value));
			document.getElementById("pricount").value = counter;
			document.getElementById("classPrice").value=(counter*value)+"원";
			
		}
		
		
	}
</script>

<!-- 카카오맵 -->
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		level : 10
	// 지도의 확대 레벨 
	};

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
	if (navigator.geolocation) {

		// GeoLocation을 이용해서 접속 위치를 얻어옵니다
		navigator.geolocation.getCurrentPosition(function(position) {

			var lat = position.coords.latitude, // 위도
			lon = position.coords.longitude; // 경도

			var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
			message = '<div style="padding:5px;">현재위치</div>'; // 인포윈도우에 표시될 내용입니다

			// 마커와 인포윈도우를 표시합니다
			displayMarker(locPosition, message);

		});

	} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

		var locPosition = new kakao.maps.LatLng(33.450701, 126.570667), message = 'geolocation을 사용할수 없어요..'

		displayMarker(locPosition, message);
	}

	// 지도에 마커와 인포윈도우를 표시하는 함수입니다
	function displayMarker(locPosition, message) {

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
			map : map,
			position : locPosition
		});

		var iwContent = message, // 인포윈도우에 표시할 내용
		iwRemoveable = true;

		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
			content : iwContent,
			removable : iwRemoveable
		});

		// 인포윈도우를 마커위에 표시합니다 
		infowindow.open(map, marker);

		// 지도 중심좌표를 접속위치로 변경합니다
		map.setCenter(locPosition);
	}

	$(function() {
		$('#tab-c1-1').click(function() {
			setTimeout(function() {
				map.relayout();
			}, 10);
		});
	});
</script>
<!-- 맵끝 -->
<!-- 삭제 처리 -->
<script>		
   		function isDelete(){
   			if(confirm("정말로 삭제 하시겠습니까?")){
   				location.replace("<c:url value='/OneMemo/BBS/Delete.jsp?no=${record.no}'/>");
   			}
   		}  
   		
</script>
<!-- 삭제 처리  끝-->
