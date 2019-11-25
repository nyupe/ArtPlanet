<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!-- 아이디 얻어서 var에 지정한 변수 id저장  페이지내에서 EL 사용하여 (ex. ${id} )아이디값 사용가능-->
<sec:authentication property="principal.username" var="id" />

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


<!-- Stylesheets -->
<link rel="stylesheet"
	href="<c:url value='/resources/artclass/css/plugins.css'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/artclass/css/style.css'/>">
<!-- Cusom css -->
<link rel="stylesheet"
	href="<c:url value='/resources/artclass/css/custom.css'/>">


<script>
//리퀘스트 영역에 저장된 classNo 찍어보기
//console.log('${classNo}')
	
	 var dateNo;
	
	 $(function(){ // 진입점 시작
		
		//클래스 개설날짜정보 리스트 얻기
		$.ajax({
			url:"<c:url value='/getOpeningDates'/>",
			dataType:'json',
			type: "get",
			data:{classNo:"${classNo}"},
			success:displayClassDateAndTime
		})/////ajax
	})// 진입점 끝
	
	var displayClassDateAndTime = function(data){
		// 데이타 찍어보기(성공)
		//console.log(data)
		var checkBoxString="<table style='margin-left:auto; margin-right:auto'>";
		checkBoxString+="<tr style='background-color:white;'><th></th><th>수업날짜</th><th>시작시간</th><th>소요시간</th><th>선택</th></tr>";
		$.each(data,function(index,element){
			checkBoxString+="<tr style='background-color:white'>";
			checkBoxString+="<td>"+(index+1)+"</td><td>"+element['openingDate']+"</td><td>"+element['openingTime']+"</td>"+"<td>${record.timeRequired}시간</td>"+"<td><input type='checkbox' class='checkClassOpeningInfo' title="+element['dateNo']+"></td>";
			checkBoxString+="</tr>";
		});
		checkBoxString+="</table>";
		
	    $('#classDateAndTimePick').html(checkBoxString);
	    
	    
	    
	}/////displayClassDateAndTime
	
	
	function reservation(){/// 아트클래스 예약정보 테이블에
		// 아트클래스 개설날짜정보 테이블 일련번호 
		dateNo = $('.checkClassOpeningInfo').attr('title');
		
		var confirmResult = confirm('예약 결제를 진행하시겠습니까?')
		
		if(confirmResult){
			/////결제화면으로 form 전송 및 페이지이동
			$.ajax({
				url : "<c:url value='/createReservationRecord'/>",
				//스프링 씨큐리티 적용시(단, csrf적용시(Post방식)에만 서버에 CSRF토큰값도 같이 보내야한다)
				data : {memberNo:"${memberNo}",'_csrf':'${_csrf.token}',classNo:"${classNo}","dateNo":dateNo},
				type : "POST"
			})
			document.getElementById('payform').submit();
		}/////if
	}/////reservation()
	
	
	function deleteClass(){ // 클래스 삭제하기
		
		var confirmResult = confirm('클래스를 정말 삭제하시겠습니까?')
		if(confirmResult){
			$.ajax({
				url : "<c:url value='/deleteClass'/>",
				//스프링 씨큐리티 적용시(단, csrf적용시(Post방식)에만 서버에 CSRF토큰값도 같이 보내야한다)
				data : {'_csrf':'${_csrf.token}',classNo:"${classNo}"},
				type : "POST"
			})
		}
		history.back();
	}/////deleteClass()
	
	
</script>


<!-- Start Blog List View Area -->
<section
	class="blog__list__view section-padding--lg menudetails-right-sidebar bg--white" >


	<div class="container" style="margin-bottom: 90px">			
		<div class="row">

			<div class="col-lg-6 col-md-6 col-sm-12" >

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
										class="nav-text">클래스에 대한 소개</span>
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
									<p class="mb-0">${record.content }</p>
								</div>
								<div class="tab-pane" id="tab-animated1-1" role="tabpanel" align="center">
									<h4>주소 : ${record.classAddress}, ${record.detailedAddr}</h4> 
									<!-- 카카오 map을 출력할 div -->
									<div id="map" style="width: 100%; height: 350px;"></div>
								</div>
								<div class="tab-pane" id="tab-animated1-2" role="tabpanel">
									<p class="mb-0">닉네임:${artClassCreater.nickName }</p>
									<p class="mb-0">소개:${artClassCreater.introContent }</p>
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
				
				
				<!-- 인기있는 아트클래스 뿌려주는 부분(시작) : 클래스 예약정보에 많이 등록되어 있는 아트클래스 상위 3개를 뿌려주면 될듯--> 
				<div class="row mt--10"  >
					<!-- Start Single Product -->
					<div class="col-lg-4 col-md-6 col-sm-12 popular" >
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
				</div>
			 <!-- 인기있는 아트클래스 뿌려주는 부분(끝) -->	
		</div>
			
			    <div class="col-lg-4 col-md-12 col-sm-14 md--mt--40 sm--mt--40"	style="left: 150px;">
       			    
       			    
					 <!-- 수정 삭제 버튼 시작 -->
					 <!-- 로그인한 아이디와 클래스 만든 사람의 아이디가 동일할 경우만 수정 및 삭제버튼 출력 -->
					 <c:if test="${createClassId eq id }">
	                      <div class="col-lg-10" style="left: 40%;">
	                       <a href="<c:url value='/View_Input'/>">  
	                        <button class="mb-2 mr-2 btn-icon btn-pill btn btn-outline-primary">
	                           <i class="pe-7s-tools btn-icon-wrapper"> </i>수정하기
	                        </button></a>
	                                                 
	                        <button class="mb-2 mr-2 btn-icon btn-pill btn btn-outline-danger" 
	                        	onclick="deleteClass()">
	                            <i class="pe-7s-trash btn-icon-wrapper"> </i>삭제하기
	                        </button>
	                     </div>
                     </c:if>
                    <!-- 수정 삭제 버튼 끝-->
			
				
				<!--================Banner Area =================-->

				<div class="food__category__area mt--60">

					<h4 class="side__title" id="modal_opne_btn">예약하기</h4>

					<div class="main-card mb-3 card">

						<div class="card-body">
							<div class="food__menu__details">
								<div class="food__menu__content">

									<h2>${record.title}</h2>
									<ul class="food__dtl__prize d-flex">

										<li>${record.tuitionFee}</li>

									</ul>
									<!-- Start Category Area -->

									<div class="food__category__area mt--60"
										style="padding: 10px 10px">

										<ul class="food__category">
											<li><a href="#"> 난이도<span>${record.classLevel}</span></a></li>
											<li><a href="#">소요시간<span>${record.timeRequired} 시간</span>
											</a></li>
											<li><a href="#">최대인원 <span>최대 ${record.numberOfPeople} 명</span></a></li>


										</ul>
									</div>
									<!-- End Category Area -->
								</div>
							</div>



							<h5 class="card-title"></h5>

							<button type="button" class="btn btn-danger" data-toggle="modal"
								data-target="#modalQuickView">예약하기</button>
							<button type="button" class="btn btn-light">메세지보내기</button>





						</div>
					</div>


					<div class="food__sidebar">
						<!-- Start Recent Post -->
						<div class="food__recent__post mt--60">
							<h4 class="side__title">최근 게시된 아트 클래스</h4>
							
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


<!-- 예약하기 누르면 나오는 모달창 -->
<div class="modal fade" id="modalQuickView" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true"
	data-backdrop="false" style="background: rgba(10, 0, 0, 0.5);">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-body">
				<div class="row">
					
				
					<!-- 아트클래스 수강료, 날짜출력, 시간선택 아코디언, 수강인원수 및 가격출력 div 시작 -->
					<div class="col-lg-12">
						<!-- 아트클래스 이름  -->
						<h2 class="h2-responsive product-name">
							<strong>${record.title }</strong>
						</h2>
						
						<!-- 아트클래스 강의날짜 및 시간 출력 체크박스가 포함될 테이블이 생성될 다이브 -->
						<div id="classDateAndTimePick" align="center"> </div>
					   
					   	
    				  
                                     <div class="">
                                     
                                         <div style="margin-left: 400px"align="right">
                                       
											<form id="payform" action="<c:url value='Order.do'/>" method="post" style="right: 10px;bottom: 8px; position: relative">
												<!-- CSRF 방지 -->
												<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
												
												<table style="margin: 10px;">
														<td>인원</td>
														<td><input id="pricount" type='text' name='count' value='1' size='3'
														readonly></td>
														<td><a href='#' onclick='change(1);'>▲</a><a href='#' onclick='change(-1);'>▼</a></td>
														<td>합계: <input type="text" name="fee" id="classPrice" value="${fee}원" size='15' style="margin-left: 10px"/></td>
														<!-- 예약하기 모달창에서 버튼에 의해 value가 증감되는 태그 -->
                                      					<input type="text" id="classValue" style="visibility: hidden;"  value="${fee}" />
												</table>
											</form>
                                         </div>
                                         
                                     </div>
                                     
                                     	
                				 </div>
                             <!-- 아트클래스  날짜출력, 수강 인원수 및 수강일에 따른 가격 출력 div 끝 -->
	                                                    
								
							<div class="card-body" style="position: relative; left: 600px">
								<div class="row">
									<div class="text-center">
								
										<button class="btn btn-primary" onclick="reservation()">
											결제하기 <i class="fas fa-cart-plus ml-2" aria-hidden="true"></i>
										</button>
									
										<button type="button" class="btn btn-secondary"
										data-dismiss="modal">닫기</button>
									
									</div>
								</div>
							</div>
					</div>
				</div>
			</div>
		</div>
	
<!-- 예약하기 누르면 나오는 모달창 끝 -->



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
	
	
<!-- 카카오 맵 -->
<!-- 아래 스크랩트 태그 2개에 Daum 카카오 API 에서 제공해주는 key를 삽입할것 appkey= xxxxx &  : xxxx 위치에 넣어줘야함 -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d29cf6db2d1dca112820c1f0483f5b61&libraries=services,clusterer,drawing"></script>
	
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d29cf6db2d1dca112820c1f0483f5b61"></script>	
	
<!-- 이미지 -->
<script>
	function view() {
		var div = document.form
	}
</script>
<script >
	function change(num) {
	
		
		var value =$('#classValue').val();
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
$(function(){
	
	
	
function mapInit(addr){
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
	    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	    level: 3 // 지도의 확대 레벨
	};  
	
	//지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	//주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	//주소로 좌표를 검색합니다
	geocoder.addressSearch(addr, function(result, status) {
	
	// 정상적으로 검색이 완료됐으면 
	 if (status === kakao.maps.services.Status.OK) {
	
	    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	    // 결과값으로 받은 위치를 마커로 표시합니다
	    var marker = new kakao.maps.Marker({
	        map: map,
	        position: coords
	    });
	
	    // 인포윈도우로 장소에 대한 설명을 표시합니다
	    var infowindow = new kakao.maps.InfoWindow({
	        content: '<div style="width:150px;text-align:center;padding:6px 0;">여기로 오세요</div>'
	    });
	    infowindow.open(map, marker);
	
	    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	    map.setCenter(coords);
	}//if
	
	});//geocoder.addressSearch
}
function btnInit(addr) {
	$('#tab-c1-1').click(function() {
		//map.relayout();
		setTimeout(function() {
			mapInit(addr);
		}, 300);
		
	});
}
	var addr = '<c:out value="${record.classAddress}"/>'
	btnInit(addr);
	});
</script>
<!-- 맵끝 -->
<!-- 삭제 처리 -->
<script>		
   		function isDelete(){
   			if(confirm("정말로 삭제 하시겠습니까?")){
   				/* location.replace("<c:url value='/OneMemo/BBS/Delete.jsp?classNo=${record.classNo}'/>"); */
   			}
   		}  
   		
</script>
<!-- 삭제 처리  끝-->
