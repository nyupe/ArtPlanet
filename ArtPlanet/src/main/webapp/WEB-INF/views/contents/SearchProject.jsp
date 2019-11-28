<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<sec:authorize access="hasRole('ROLE_USER')">
	<sec:authentication property="principal.username" var="id"/>
</sec:authorize>
<sec:authorize access="hasRole('ROLE_ADMIN')">
	<sec:authentication property="principal.username" var="id"/>
</sec:authorize>

<style>

.card-header>.nav .nav-link:hover {
color: #ff5555;
}
.card-header>.nav .nav-link.active {
color: #ff5555;
}
.card-header>.nav .nav-link::before {
	background: #ff5555;
}
.avatar-icon-sm .avatar-icon {
	border: none;
	width: 28px;
	height: 28px;
}
.single_portfolio {
	border: 1px solid #ddd;
	border-radius: 8px;
}
.single_portfolio:before {
	position: relative;
	background: none;
}
.img-fluid {
	height: 180px;
}
.project-info {
	padding: 10px;
}
.project-title {
	color: #1a1d24;
	font-weight: bold;
}

.project-artist {
	color: #1a1d24;
	font-weight: 400;
}
.project-stats {
	color: #f55;
	text-align: center;
	font-size: 1.1em;
	font-weight: bold;
}
.stat-progress {
	float: left;
}
.stat-target {
	
}
.stat-limit {
	float: right;
}
.progress {
	margin-top: 5px;
	margin-bottom: 5px !important;
}
.prolist li{
display:inline-block;
color:#888888;
float: left;
font-size: 13px;
padding: 5px 5px;
 
}

.project-title{
margin: 10px 0px;}

</style>


<!--================ Start Portfolio Area =================-->
<section class="portfolio_area area-padding" id="portfolio">
	<div class="container">
		<div class="area-heading" style="margin-bottom: 40px;">
			<h3>당신이 <span>응원하는</span> 프로젝트에 투자하세요.</h3>
			<p>프로젝트가 달성되면, 멋진 작품을 소유할 수 있습니다.</p>
			<form class="search-inner" action="<c:url value='/Search'/>">
				<input type="text" class="form-control" id="search_input" placeholder="Search Here">
				<button type="submit" class="btn"><i class="fas fa-search"></i></button>
			</form>
		</div>
		<div class="card-header card-header-tab-animation" style="font-size: 1.8em; margin-bottom: 30px; padding: 0;">
			<ul class="nav nav-justified">
				<li class="nav-item"><a href="<c:url value='/Search/Project'/>" class="nav-link active">최신글</a></li>
				<li class="nav-item"><a href="<c:url value='/Search/Project/Closing'/>" class="nav-link">마감임박</a></li>
				<li class="nav-item"><a href="<c:url value='#'/>" class="nav-link">인기글</a></li>
			</ul>
		</div>

		<div class="filters portfolio-filter" style="display: flex; margin-bottom: 20px;">
			
			<ul style="margin:auto 0px;">
				<li class="active" data-filter="*">all</li>
				<c:forEach items="${tags }" var="item" >
					<li data-filter=".${item.TAGNAME }">${item.TAGNAME }</li>
				</c:forEach>
				
			</ul>
			
		
			<form action="<c:url value='/Search/Project/ProjectWrite'/>">
				<button class="bb primary-bg w-100" type="submit" name="${id }"
				style="background:white;border: none;border-radius: 2px;font-weight: bold;cursor: pointer;color: #00c4c4;">글쓰기</button>
			</form>
			<form action="<c:url value='/Search/Project/Test'/>">
				<button class="bb primary-bg w-100" type="submit" name="${id }"
				style="background:white;border: none;border-radius: 2px;font-weight: bold;cursor: pointer;color: #00c4c4;">글쓰기</button>
			</form>
			
			
		</div>

		<div class="filters-content">
			<div class="row portfolio-grid">
				<div class="grid-sizer col-md-6 col-lg-4 col-xl-3"></div>
				<!-- 프로젝트 게시글 시작 -->
				<c:if test="${not empty list }" var="isEmpth">
				<c:forEach var="item" items="${list }" varStatus="loop">
				
				
				<div class="col-xl-3 col-lg-4 col-md-6 all painting 
				<c:forEach var="list2" items="${list2[loop.index] }">${list2 } </c:forEach>">
					<div class="single_portfolio">
						<a href="<c:url value='/Search/Project/ProjectView?projectNo=${item.projectNo }'/>">
							<img class="img-fluid w-100" src="${item.fileurl}" alt=""></a>
								<div class="project-info">
									<div class="avatar-icon-wrapper avatar-icon-sm" style="padding: 0px;">
			        					<div class="avatar-icon">
			        					<img src="${item.profilePicture}"/></div>
			        				</div>
		        					<span class="post-artist">${item.id}</span><br/>		
		        					<ul class="prolist"style="max-height:60px;contain:paint; height: 60px;margin-bottom: 0px;"> 
										<c:forEach var="list2" items="${list2[loop.index] }">
											<li>#${list2 }</li>
										</c:forEach>
									</ul>
										<fmt:parseNumber value="${item.postDate.time / (1000*60*60*24)}" integerOnly="true" var="nowdate"></fmt:parseNumber>
										<fmt:parseNumber value="${item.deadline.time / (1000*60*60*24)}" integerOnly="true" var="targetdate"></fmt:parseNumber>
									<c:if test="${item.projectsupportsum != null }" var="total">
										<fmt:parseNumber value="${item.projectsupportsum / item.targetFigure * 100 }" integerOnly="true" var="per" type="number"></fmt:parseNumber>
									</c:if>
									<c:if test="${not total }">
										<fmt:parseNumber value="0" integerOnly="true" var="per" type="number"></fmt:parseNumber>
									</c:if>
			        				<h4 style="clear: both;max-height: 35px;contain:paint;" ><span class="project-title" style="display: inline-block;">${item.title}</span></h4>
       								<div class="mb-3 progress-bar-animated-alt progress">
									<div class="progress-bar" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"
										style="width: ${per}%;"></div>
									</div>
									<div class="project-stats" >
										<span class="stat-target">목표 ${item.targetFigure}원</span>
										<span class="stat-progress">${per}%</span>
										<span class="stat-limit">남은 기간 ${targetdate - nowdate }일</span>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:if>
				<!-- 프로젝트 게시글 끝 -->
				
			</div>
		</div>
	</div>
</section>

<script >

$(function() {
	
	$('.bb').click(function(e){
		if($('.bb').attr('name') == ""){
			alert('로그인 해주세요');
			e.stopPropagation();
	        e.preventDefault();
		}
	})
	
	$('.portfolio-filter ul li').on('click', function () {
           $('.portfolio-filter ul li').removeClass('active');
           $(this).addClass('active');
   
           var data = $(this).attr('data-filter');
           $workGrid.isotope({
               filter: data
           });
         });
      //레이아웃 설정
      var $workGrid;
       if (document.getElementById('portfolio')) {
         $workGrid = $('.portfolio-grid').isotope({
               itemSelector: '.all',
               percentPosition: true,
               masonry: {
                   columnWidth: '.grid-sizer'
               }
           });
       }
});

</script>
<!--================ End Portfolio Area =================-->