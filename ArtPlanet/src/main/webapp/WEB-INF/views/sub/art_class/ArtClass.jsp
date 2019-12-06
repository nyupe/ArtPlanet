<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
 
 
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
	 padding-left: 25px; 
	 margin: 0px; 
}
 
.portfolio_area .s ul li.active:before {
	 left: 25px;
	right: 25px; 
}
 
.search-inner {
	background-color: #fff;
}
 
</style>
 
<script>
		$(function(){ // 진입점 시작
			$.ajax({
					type : "get",
					url : "<c:url value='/getClassList'/>",
					dataType : "json",
					success :function(data) {
							console.log(data);
							var listString;
	
							$.each(data,function(index, element) {
									console.log("들어왓나")
									var image = "";
									if(element['images'][0] != null)
										image = element['images'][0]
									listString = "<div class='col-md-6 col-lg-3 all illustration  seoul class_content'>"
									listString += "<a title="
											+ element['classNo']
											+ " href='<c:url value="/View"/>?classNo="
											+ element['classNo']
											+ "' class='block-5'"
											+ " style='background-image: url(\""+image+"\")'>"
	
									//+element+['imageUrl']"
	
									listString += "<div class='text'>"
									listString += "<h3 class=heading>"
											+ element['title']
											+ "</h3>"
											+ "<div class='post-meta'><span>장소:"
											+ element['classAddress']
											+ "</span></div>"
											+ "<p><span class='price'>"
											+ element['tuitionFee']
											+ "</span></p>"
									listString += "</div>";
									listString += "</a>";
									console.log($('.portfolio-grid'));
									console.log(listString);
									
									$('.portfolio-grid').append(listString);
								});//.each
								
							clearGrid();
					}/////success
				}); //ajax
			});// 진입점 끝
	
	function clearGrid()
	{
		$('.portfolio-filter ul li').on('click', function () {
	        $('.portfolio-filter ul li').removeClass('active');
	        $(this).addClass('active');
 
	        var data = $(this).attr('data-filter');
	        $workGrid.isotope({
	            filter: data
	        });
	    });
 
	    if (document.getElementById('portfolio')) {
	        var $workGrid = $('.portfolio-grid').isotope({
	            itemSelector: '.all',
	            percentPosition: true,
	            masonry: {
	                columnWidth: '.grid-sizer'
	            }
	        });
	    }
	    	
	}
</script>
 
 
<div class="container" style="margin-bottom: 60px; max-width: 1360px;">
	<section class="portfolio_area area-padding" id="portfolio">
 
		<div class="area-heading">
			<h3>
				당신의 <span>기술과 멋진 경험을</span> 공유하세요.
			</h3>
			<p>새로운 분야에 도전하거나, 당신의 기술을 향상시키거나. 어느 것이든 좋습니다.</p>
			<form class="search-inner" action="<c:url value='/Search'/>">
				<input type="text" class="form-control" id="search_input"
					placeholder="Search Here">
				<button type="submit" class="btn">
					<i class="fas fa-search"></i>
				</button>
			</form>
			<div
				class="row no-gutters justify-content-center mb-2 pb-2 ftco-animate">
 
				<div class="col-md-7 text-center heading-section">
					<!--    	        
		<video type="video/webm" autoplay loop="" muted="" playsinline="">
  			 <source src="https://player.vimeo.com/external/160999247.sd.mp4?s=193dc7c78332bb051ef5b59b31d076c68ee5d827&profile_id=164"/>
   
		</video>
-->
					<!--  
동영상 주소
https://player.vimeo.com/external/307814435.hd.mp4?s=112c2d57d192c55a37de507121645654613ec150&profile_id=174
https://player.vimeo.com/external/325698769.sd.mp4?s=4e70164190f4b472059c9f4ca74ca0ca58056ce4&profile_id=165
https://player.vimeo.com/external/288452948.sd.mp4?s=1f5252301f28373524ac48c75fc261b96e6aa273&profile_id=164
<video width="640" height="480" class="printsPage-header-video-bg" autoplay="" loop="" muted="" playsinline="">
 
<video controls style="width:640px;height:360px;" poster="poster.png" autoplay>
  <source src="resources/artclass2/images/devstories.webm" 
          type='video/webm;codecs="vp8, vorbis "' />
  <source src="devstories.mp4" 
          type='video/mp4;codecs="avc1.42E01E, mp4a.40.2"' />
  <track src="devstories-en.vtt" label="English subtitles" 
         kind="subtitles" srclang="en" default></track>
</video>-->
 
 
 
 
				</div>
 
			</div>
 
		</div>
	
		<!-- 메뉴 바 시작 -->
 
		<div class="filters portfolio-filter">
			<div class="dropdown d-inline-block">
				<ul>
					<button type="button" aria-haspopup="true" aria-expanded="false"
						data-toggle="dropdown"
						class="mb-2 mr-2 dropdown-toggle btn btn-outline-primary">
						지역별</button>
 
					<div id=national tabindex="-1" role="menu" aria-hidden="true"
						class="dropdown-menu">
						<button type="button" tabindex="1" class="dropdown-item">
							<li data-filter=".seoul"><a herf=#>서울</a></li>
						</button>
 
						<button type="button" tabindex="1" class="dropdown-item">
							<li data-filter=".daejeon">대전</li>
						</button>
						<button type="button" tabindex="2" class="dropdown-item">
							<li data-filter=".gg">경기</li>
						</button>
						<button type="button" tabindex="3" class="dropdown-item">
							<li data-filter=".busan">부산</li>
						</button>
 
						<button type="button" tabindex="4" class="dropdown-item">
							<li data-filter=".daegu">대구</li>
						</button>
						<button type="button" tabindex="0" class="dropdown-item">
							<li data-filter=".gyeongnam">경남</li>
						</button>
						<button type="button" tabindex="0" class="dropdown-item">
							<li data-filter=".incheon">인천</li>
						</button>
						<button type="button" tabindex="0" class="dropdown-item">
							<li data-filter=".chungbuk">충북</li>
						</button>
						<button type="button" tabindex="0" class="dropdown-item">
							<li data-filter=".gangwon">강원</li>
						</button>
						<button type="button" tabindex="0" class="dropdown-item">
							<li data-filter=".gwangju">광주</li>
						</button>
						<button type="button" tabindex="0" class="dropdown-item">
							<li data-filter=".chungnam">충남</li>
						</button>
						<button type="button" tabindex="0" class="dropdown-item">
							<li data-filter=".ulsan">울산</li>
						</button>
						<button type="button" tabindex="0" class="dropdown-item">
							<li data-filter=".jeju">제주</li>
						</button>
					</div>
				</ul>
			</div>
			<!-- 메뉴 바 끝 -->
			
			<!-- 카테고리 드롭 다운 시작 -->
			<div class="dropdown d-inline-block">
				<button type="button" aria-haspopup="true" aria-expanded="false"
					data-toggle="dropdown"
					class="mb-2 mr-2 dropdown-toggle btn btn-outline-primary">
					카테고리</button>
				<ul class="menu">
					<div id=category tabindex="-1" role="menu" aria-hidden="true"
						class="dropdown-menu">
						<button type="button" tabindex="0" class="dropdown-item">
							<li data-filter="*">all</li>
						</button>
						<button type="button" tabindex="0" class="dropdown-item">
							<li data-filter=".illustration">일러스트레이션</li>
						</button>
 
						<button type="button" tabindex="0" class="dropdown-item">
							<li data-filter=".painting">회화</li>
						</button>
						<button type="button" tabindex="0" class="dropdown-item">
							<li data-filter=".animation">애니메이션</li>
						</button>
						<button type="button" tabindex="0" class="dropdown-item">
							<li data-filter=".design">디자인</li>
						</button>
						<button type="button" tabindex="0" class="dropdown-item">
							<li data-filter=".calligraphy">캘리그라피</li>
						</button>
						<button type="button" tabindex="0" class="dropdown-item">
							<li data-filter=".crafts">조소/공예</li>
						</button>
 
					</div>
			</div>
			</ul>
			
			
			<!-- 등록하기 버튼 -->
			<!-- 로그인 안한 상태  등록하기 버튼 비활성화 -->
				<sec:authorize access="isAnonymous()" > 
						<button class="btn-wide mb-2 mr-2 btn-pill btn btn-danger"
							style="left: 75%;"  onclick="alert('로그인 후 이용해주세요')" >아트클래스 등록하기</button>
				</sec:authorize>
				
				<!-- 로그인 한상태 등록하기 버튼 활성화-->
				<sec:authorize access="isAuthenticated()" >
					<a href="<c:url value='/WriteClass'/>">
						<label class="btn-wide mb-2 mr-2 btn-pill btn btn-danger"
							style="left: 75%;" >아트 클래스 등록하기</label>
					</a>
				</sec:authorize>
			<!-- 등록하기 버튼 끝 -->
			
		</div>
		<!-- 메뉴 바 끝 -->
		<div class="col-md-12 filters-content">
			<div class="row portfolio-grid" id="startListPrintPoint">
				<div class="grid-sizer col-md-6 col-lg-3 "></div>
				<!-- 여기에 .apend -->
			</div>
		</div>
	</section>
</div>
 
 
 
 
 
<script src="<c:url value='/resources/artclass2/js/jquery.min.js'/>"></script>
<script
	src="<c:url value='/resources/artclass2/js/jquery-migrate-3.0.1.min.js'/>"></script>
<script src="<c:url value='/resources/artclass2/js/popper.min.js'/>"></script>
<script src="<c:url value='/resources/artclass2/js/bootstrap.min.js'/>"></script>
<script
	src="<c:url value='/resources/artclass2/js/jquery.easing.1.3.js'/>"></script>
<script
	src="<c:url value='/resources/artclass2/js/jquery.waypoints.min.js'/>"></script>
<script
	src="<c:url value='/resources/artclass2/js/jquery.stellar.min.js'/>"></script>
<script
	src="<c:url value='/resources/artclass2/js/owl.carousel.min.js'/>"></script>
<script
	src="<c:url value='/resources/artclass2/js/jquery.magnific-popup.min.js'/>"></script>
<script src="<c:url value='/resources/artclass2/js/aos.js'/>"></script>
<script
	src="<c:url value='/resources/artclass2/js/jquery.animateNumber.min.js'/>"></script>
<script
	src="<c:url value='/resources/artclass2/js/bootstrap-datepicker.js'/>"></script>
<script
	src="<c:url value='/resources/artclass2/js/jquery.timepicker.min.js'/>"></script>
<script src="<c:url value='/resources/artclass2/js/main.js'/>"></script>
 
<script>
	$(function() {
		$('.dropdown-item').click(function() {
			$('.dropdown-menu').removeClass('show');
		});
	});
</script>
 