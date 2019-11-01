<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
.font-icon-wrapper {
	font-size: 16px;
	border: none;
	margin: 0;
}
.font-icon-wrapper:hover {
	background: none;
	color: #1a1d24;
}
.font-icon-wrapper i {
	font-size: 1.5em;
}
.single_portfolio .short_info {
	bottom: 0;
	padding: 0 15px 0;
}
</style>
<script>
	$(function() {
		
	});
</script>

<!--================ Start Portfolio Area =================-->
<section class="portfolio_area area-padding" id="portfolio">
	<div class="container">
		<div class="area-heading" style="margin-bottom: 40px;">
			<h3>당신이 <span>좋아하게 될</span> 작품을 찾아보세요.</h3>
			<p>보기 전까지는 무엇을 찾고 있는지 모릅니다.</p>
			<form class="search-inner" action="<c:url value='/Search'/>">
				<input type="text" class="form-control" id="search_input" placeholder="Search Here">
				<button type="submit" class="btn"><i class="fas fa-search"></i></button>
			</form>
		</div>
		<div class="card-header card-header-tab-animation" style="font-size: 1.8em; margin-bottom: 30px; padding: 0;">
			<ul class="nav nav-justified">
				<li class="nav-item"><a href="<c:url value='/Search/Artwork'/>" class="nav-link active">작품</a></li>
				<li class="nav-item"><a href="<c:url value='/Search/Artist'/>" class="nav-link">아티스트</a></li>
				<li class="nav-item"><a href="<c:url value='/Search/Project'/>" class="nav-link">프로젝트</a></li>
			</ul>
		</div>

		<div class="filters portfolio-filter">
			<ul>
				<li class="active" data-filter="*">all</li>
				<li data-filter=".illustration">일러스트레이션</li>
				<!-- <li data-filter=".painting">회화</li> -->
				<li data-filter=".animation">애니메이션</li>
				<li data-filter=".design">디자인</li>
				<li data-filter=".calligraphy">캘리그라피</li>
				<li data-filter=".crafts">조소/공예</li>
			</ul>
		</div>

		<div class="filters-content">
			<div class="row portfolio-grid">
				<div class="grid-sizer col-md-4 col-lg-3"></div>
<!-- 일러스트레이션 그림 시작 -->	
			
					<div class="col-lg-3 col-md-4 all illustration painting">
				<a href="<c:url value='/Blog'/>"><div class="single_portfolio">
						<img class="img-fluid w-100" src="<c:url value='/resources/img/project/illustration/1.jpg'/>" alt="">
						<div class="short_info">
							<span class="post-type">일러스트</span>
		        			<span class="post-date">13분 전</span>
			        		<h3><span class="post-title">그림그린그림</span></h3>
			        		<div class="avatar-icon-wrapper avatar-icon-sm">
			        			<div class="avatar-icon"><img src="<c:url value='/resources/kero/assets/images/avatars/2.jpg'/>"/></div>
			        		</div>
		        			<span class="post-artist">작가이름</span>
		        			<div class="clear"> </div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-comment"> </i> <span class="post-comment">12</span>
		        			</div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-look"> </i> <span class="post-comment">107</span>
		        			</div>
						</div>
					</div>
					</a>
				</div>
					
				<div class="col-lg-3 col-md-4 all illustration painting">
					<div class="single_portfolio">
						<img class="img-fluid w-100" src="<c:url value='/resources/img/project/illustration/2.jpg'/>" alt="">
						<div class="short_info">
							<span class="post-type">일러스트</span>
		        			<span class="post-date">13분 전</span>
			        		<h3><span class="post-title">그림그린그림</span></h3>
			        		<div class="avatar-icon-wrapper avatar-icon-sm">
			        			<div class="avatar-icon"><img src="<c:url value='/resources/kero/assets/images/avatars/2.jpg'/>"/></div>
			        		</div>
		        			<span class="post-artist">작가이름</span>
		        			<div class="clear"> </div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-comment"> </i> <span class="post-comment">12</span>
		        			</div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-look"> </i> <span class="post-comment">107</span>
		        			</div>
						</div>
					</div>
				</div>
				
				<div class="col-lg-3 col-md-4 all illustration painting">
					<div class="single_portfolio">
						<img class="img-fluid w-100" src="<c:url value='/resources/img/project/illustration/3.jpg'/>" alt="">
						<div class="short_info">
							<span class="post-type">일러스트</span>
		        			<span class="post-date">13분 전</span>
			        		<h3><span class="post-title">그림그린그림</span></h3>
			        		<div class="avatar-icon-wrapper avatar-icon-sm">
			        			<div class="avatar-icon"><img src="<c:url value='/resources/kero/assets/images/avatars/2.jpg'/>"/></div>
			        		</div>
		        			<span class="post-artist">작가이름</span>
		        			<div class="clear"> </div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-comment"> </i> <span class="post-comment">12</span>
		        			</div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-look"> </i> <span class="post-comment">107</span>
		        			</div>
						</div>
					</div>
				</div>
				
				<div class="col-lg-3 col-md-4 all illustration painting">
					<div class="single_portfolio">
						<img class="img-fluid w-100" src="<c:url value='/resources/img/project/illustration/5.jpg'/>" alt="">
						<div class="short_info">
							<span class="post-type">일러스트</span>
		        			<span class="post-date">13분 전</span>
			        		<h3><span class="post-title">그림그린그림</span></h3>
			        		<div class="avatar-icon-wrapper avatar-icon-sm">
			        			<div class="avatar-icon"><img src="<c:url value='/resources/kero/assets/images/avatars/2.jpg'/>"/></div>
			        		</div>
		        			<span class="post-artist">작가이름</span>
		        			<div class="clear"> </div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-comment"> </i> <span class="post-comment">12</span>
		        			</div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-look"> </i> <span class="post-comment">107</span>
		        			</div>
						</div>
					</div>
				</div>
				
				<div class="col-lg-3 col-md-4 all illustration painting">
					<div class="single_portfolio">
						<img class="img-fluid w-100" src="<c:url value='/resources/img/project/illustration/6.jpg'/>" alt="">
						<div class="short_info">
							<span class="post-type">일러스트</span>
		        			<span class="post-date">13분 전</span>
			        		<h3><span class="post-title">그림그린그림</span></h3>
			        		<div class="avatar-icon-wrapper avatar-icon-sm">
			        			<div class="avatar-icon"><img src="<c:url value='/resources/kero/assets/images/avatars/2.jpg'/>"/></div>
			        		</div>
		        			<span class="post-artist">작가이름</span>
		        			<div class="clear"> </div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-comment"> </i> <span class="post-comment">12</span>
		        			</div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-look"> </i> <span class="post-comment">107</span>
		        			</div>
						</div>
					</div>
				</div>
				
				<div class="col-lg-3 col-md-4 all illustration painting">
					<div class="single_portfolio">
						<img class="img-fluid w-100" src="<c:url value='/resources/img/project/illustration/7.jpg'/>" alt="">
						<div class="short_info">
							<span class="post-type">일러스트</span>
		        			<span class="post-date">13분 전</span>
			        		<h3><span class="post-title">그림그린그림</span></h3>
			        		<div class="avatar-icon-wrapper avatar-icon-sm">
			        			<div class="avatar-icon"><img src="<c:url value='/resources/kero/assets/images/avatars/2.jpg'/>"/></div>
			        		</div>
		        			<span class="post-artist">작가이름</span>
		        			<div class="clear"> </div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-comment"> </i> <span class="post-comment">12</span>
		        			</div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-look"> </i> <span class="post-comment">107</span>
		        			</div>
						</div>
					</div>
				</div>
				
				<div class="col-lg-3 col-md-4 all illustration painting">
					<div class="single_portfolio">
						<img class="img-fluid w-100" src="<c:url value='/resources/img/project/illustration/8.jpg'/>" alt="">
						<div class="short_info">
							<span class="post-type">일러스트</span>
		        			<span class="post-date">13분 전</span>
			        		<h3><span class="post-title">그림그린그림</span></h3>
			        		<div class="avatar-icon-wrapper avatar-icon-sm">
			        			<div class="avatar-icon"><img src="<c:url value='/resources/kero/assets/images/avatars/2.jpg'/>"/></div>
			        		</div>
		        			<span class="post-artist">작가이름</span>
		        			<div class="clear"> </div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-comment"> </i> <span class="post-comment">12</span>
		        			</div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-look"> </i> <span class="post-comment">107</span>
		        			</div>
						</div>
					</div>
				</div>
				
				<div class="col-lg-3 col-md-4 all illustration painting">
					<div class="single_portfolio">
						<img class="img-fluid w-100" src="<c:url value='/resources/img/project/illustration/9.jpg'/>" alt="">
						<div class="short_info">
							<span class="post-type">일러스트</span>
		        			<span class="post-date">13분 전</span>
			        		<h3><span class="post-title">그림그린그림</span></h3>
			        		<div class="avatar-icon-wrapper avatar-icon-sm">
			        			<div class="avatar-icon"><img src="<c:url value='/resources/kero/assets/images/avatars/2.jpg'/>"/></div>
			        		</div>
		        			<span class="post-artist">작가이름</span>
		        			<div class="clear"> </div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-comment"> </i> <span class="post-comment">12</span>
		        			</div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-look"> </i> <span class="post-comment">107</span>
		        			</div>
						</div>
					</div>
				</div>
				
				<div class="col-lg-3 col-md-4 all illustration painting">
					<div class="single_portfolio">
						<img class="img-fluid w-100" src="<c:url value='/resources/img/project/illustration/4.jpg'/>" alt="">
						<div class="short_info">
							<span class="post-type">일러스트</span>
		        			<span class="post-date">13분 전</span>
			        		<h3><span class="post-title">그림그린그림</span></h3>
			        		<div class="avatar-icon-wrapper avatar-icon-sm">
			        			<div class="avatar-icon"><img src="<c:url value='/resources/kero/assets/images/avatars/2.jpg'/>"/></div>
			        		</div>
		        			<span class="post-artist">작가이름</span>
		        			<div class="clear"> </div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-comment"> </i> <span class="post-comment">12</span>
		        			</div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-look"> </i> <span class="post-comment">107</span>
		        			</div>
						</div>
					</div>
				</div>
<!-- 일러스트레이션 끝 -->
<!-- 애니메이션 시작 -->
				<div class="col-lg-3 col-md-4 all painting animation">
					<div class="single_portfolio">
						<img class="img-fluid w-100" src="<c:url value='/resources/img/project/animation/1.gif'/>" alt="">
						<div class="short_info">
							<span class="post-type">일러스트</span>
		        			<span class="post-date">13분 전</span>
			        		<h3><span class="post-title">그림그린그림</span></h3>
			        		<div class="avatar-icon-wrapper avatar-icon-sm">
			        			<div class="avatar-icon"><img src="<c:url value='/resources/kero/assets/images/avatars/2.jpg'/>"/></div>
			        		</div>
		        			<span class="post-artist">작가이름</span>
		        			<div class="clear"> </div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-comment"> </i> <span class="post-comment">12</span>
		        			</div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-look"> </i> <span class="post-comment">107</span>
		        			</div>
						</div>
					</div>
				</div>
				
				<div class="col-lg-3 col-md-4 all painting animation">
					<div class="single_portfolio">
						<img class="img-fluid w-100" src="<c:url value='/resources/img/project/animation/2.gif'/>" alt="">
						<div class="short_info">
							<span class="post-type">일러스트</span>
		        			<span class="post-date">13분 전</span>
			        		<h3><span class="post-title">그림그린그림</span></h3>
			        		<div class="avatar-icon-wrapper avatar-icon-sm">
			        			<div class="avatar-icon"><img src="<c:url value='/resources/kero/assets/images/avatars/2.jpg'/>"/></div>
			        		</div>
		        			<span class="post-artist">작가이름</span>
		        			<div class="clear"> </div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-comment"> </i> <span class="post-comment">12</span>
		        			</div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-look"> </i> <span class="post-comment">107</span>
		        			</div>
						</div>
					</div>
				</div>
				
				<div class="col-lg-3 col-md-4 all painting animation">
					<div class="single_portfolio">
						<img class="img-fluid w-100" src="<c:url value='/resources/img/project/animation/3.gif'/>" alt="">
						<div class="short_info">
							<span class="post-type">일러스트</span>
		        			<span class="post-date">13분 전</span>
			        		<h3><span class="post-title">그림그린그림</span></h3>
			        		<div class="avatar-icon-wrapper avatar-icon-sm">
			        			<div class="avatar-icon"><img src="<c:url value='/resources/kero/assets/images/avatars/2.jpg'/>"/></div>
			        		</div>
		        			<span class="post-artist">작가이름</span>
		        			<div class="clear"> </div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-comment"> </i> <span class="post-comment">12</span>
		        			</div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-look"> </i> <span class="post-comment">107</span>
		        			</div>
						</div>
					</div>
				</div>
				
				<div class="col-lg-3 col-md-4 all painting animation">
					<div class="single_portfolio">
						<img class="img-fluid w-100" src="<c:url value='/resources/img/project/animation/4.gif'/>" alt="">
						<div class="short_info">
							<span class="post-type">일러스트</span>
		        			<span class="post-date">13분 전</span>
			        		<h3><span class="post-title">그림그린그림</span></h3>
			        		<div class="avatar-icon-wrapper avatar-icon-sm">
			        			<div class="avatar-icon"><img src="<c:url value='/resources/kero/assets/images/avatars/2.jpg'/>"/></div>
			        		</div>
		        			<span class="post-artist">작가이름</span>
		        			<div class="clear"> </div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-comment"> </i> <span class="post-comment">12</span>
		        			</div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-look"> </i> <span class="post-comment">107</span>
		        			</div>
						</div>
					</div>
				</div>
				
				<div class="col-lg-3 col-md-4 all painting animation">
					<div class="single_portfolio">
						<img class="img-fluid w-100" src="<c:url value='/resources/img/project/animation/5.gif'/>" alt="">
						<div class="short_info">
							<span class="post-type">일러스트</span>
		        			<span class="post-date">13분 전</span>
			        		<h3><span class="post-title">그림그린그림</span></h3>
			        		<div class="avatar-icon-wrapper avatar-icon-sm">
			        			<div class="avatar-icon"><img src="<c:url value='/resources/kero/assets/images/avatars/2.jpg'/>"/></div>
			        		</div>
		        			<span class="post-artist">작가이름</span>
		        			<div class="clear"> </div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-comment"> </i> <span class="post-comment">12</span>
		        			</div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-look"> </i> <span class="post-comment">107</span>
		        			</div>
						</div>
					</div>
				</div>
				
				<div class="col-lg-3 col-md-4 all painting animation">
					<div class="single_portfolio">
						<img class="img-fluid w-100" src="<c:url value='/resources/img/project/animation/6.gif'/>" alt="">
						<div class="short_info">
							<span class="post-type">일러스트</span>
		        			<span class="post-date">13분 전</span>
			        		<h3><span class="post-title">그림그린그림</span></h3>
			        		<div class="avatar-icon-wrapper avatar-icon-sm">
			        			<div class="avatar-icon"><img src="<c:url value='/resources/kero/assets/images/avatars/2.jpg'/>"/></div>
			        		</div>
		        			<span class="post-artist">작가이름</span>
		        			<div class="clear"> </div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-comment"> </i> <span class="post-comment">12</span>
		        			</div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-look"> </i> <span class="post-comment">107</span>
		        			</div>
						</div>
					</div>
				</div>
<!-- 애니메이션 끝 -->
<!-- 디자인 시작 -->				
				<div class="col-lg-3 col-md-4 all design">
					<div class="single_portfolio">
						<img class="img-fluid w-100" src="<c:url value='/resources/img/project/design/1.jpg'/>" alt="">
						<div class="short_info">
							<span class="post-type">일러스트</span>
		        			<span class="post-date">13분 전</span>
			        		<h3><span class="post-title">그림그린그림</span></h3>
			        		<div class="avatar-icon-wrapper avatar-icon-sm">
			        			<div class="avatar-icon"><img src="<c:url value='/resources/kero/assets/images/avatars/2.jpg'/>"/></div>
			        		</div>
		        			<span class="post-artist">작가이름</span>
		        			<div class="clear"> </div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-comment"> </i> <span class="post-comment">12</span>
		        			</div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-look"> </i> <span class="post-comment">107</span>
		        			</div>
						</div>
					</div>
				</div>
				
				<div class="col-lg-3 col-md-4 all design">
					<div class="single_portfolio">
						<img class="img-fluid w-100" src="<c:url value='/resources/img/project/design/2.jpg'/>" alt="">
						<div class="short_info">
							<span class="post-type">일러스트</span>
		        			<span class="post-date">13분 전</span>
			        		<h3><span class="post-title">그림그린그림</span></h3>
			        		<div class="avatar-icon-wrapper avatar-icon-sm">
			        			<div class="avatar-icon"><img src="<c:url value='/resources/kero/assets/images/avatars/2.jpg'/>"/></div>
			        		</div>
		        			<span class="post-artist">작가이름</span>
		        			<div class="clear"> </div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-comment"> </i> <span class="post-comment">12</span>
		        			</div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-look"> </i> <span class="post-comment">107</span>
		        			</div>
						</div>
					</div>
				</div>
				
				<div class="col-lg-3 col-md-4 all design">
					<div class="single_portfolio">
						<img class="img-fluid w-100" src="<c:url value='/resources/img/project/design/3.jpg'/>" alt="">
						<div class="short_info">
							<span class="post-type">일러스트</span>
		        			<span class="post-date">13분 전</span>
			        		<h3><span class="post-title">그림그린그림</span></h3>
			        		<div class="avatar-icon-wrapper avatar-icon-sm">
			        			<div class="avatar-icon"><img src="<c:url value='/resources/kero/assets/images/avatars/2.jpg'/>"/></div>
			        		</div>
		        			<span class="post-artist">작가이름</span>
		        			<div class="clear"> </div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-comment"> </i> <span class="post-comment">12</span>
		        			</div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-look"> </i> <span class="post-comment">107</span>
		        			</div>
						</div>
					</div>
				</div>
				
				<div class="col-lg-3 col-md-4 all design">
					<div class="single_portfolio">
						<img class="img-fluid w-100" src="<c:url value='/resources/img/project/design/4.jpg'/>" alt="">
						<div class="short_info">
							<span class="post-type">일러스트</span>
		        			<span class="post-date">13분 전</span>
			        		<h3><span class="post-title">그림그린그림</span></h3>
			        		<div class="avatar-icon-wrapper avatar-icon-sm">
			        			<div class="avatar-icon"><img src="<c:url value='/resources/kero/assets/images/avatars/2.jpg'/>"/></div>
			        		</div>
		        			<span class="post-artist">작가이름</span>
		        			<div class="clear"> </div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-comment"> </i> <span class="post-comment">12</span>
		        			</div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-look"> </i> <span class="post-comment">107</span>
		        			</div>
						</div>
					</div>
				</div>
				
				<div class="col-lg-3 col-md-4 all design">
					<div class="single_portfolio">
						<img class="img-fluid w-100" src="<c:url value='/resources/img/project/design/5.jpg'/>" alt="">
						<div class="short_info">
							<span class="post-type">일러스트</span>
		        			<span class="post-date">13분 전</span>
			        		<h3><span class="post-title">그림그린그림</span></h3>
			        		<div class="avatar-icon-wrapper avatar-icon-sm">
			        			<div class="avatar-icon"><img src="<c:url value='/resources/kero/assets/images/avatars/2.jpg'/>"/></div>
			        		</div>
		        			<span class="post-artist">작가이름</span>
		        			<div class="clear"> </div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-comment"> </i> <span class="post-comment">12</span>
		        			</div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-look"> </i> <span class="post-comment">107</span>
		        			</div>
						</div>
					</div>
				</div>
				
				<div class="col-lg-3 col-md-4 all design">
					<div class="single_portfolio">
						<img class="img-fluid w-100" src="<c:url value='/resources/img/project/design/6.jpg'/>" alt="">
						<div class="short_info">
							<span class="post-type">일러스트</span>
		        			<span class="post-date">13분 전</span>
			        		<h3><span class="post-title">그림그린그림</span></h3>
			        		<div class="avatar-icon-wrapper avatar-icon-sm">
			        			<div class="avatar-icon"><img src="<c:url value='/resources/kero/assets/images/avatars/2.jpg'/>"/></div>
			        		</div>
		        			<span class="post-artist">작가이름</span>
		        			<div class="clear"> </div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-comment"> </i> <span class="post-comment">12</span>
		        			</div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-look"> </i> <span class="post-comment">107</span>
		        			</div>
						</div>
					</div>
				</div>
<!-- 디자인 끝 -->
<!-- 켈리그라피 시작 -->
				<div class="col-lg-3 col-md-4 all calligraphy">
					<div class="single_portfolio">
						<img class="img-fluid w-100" src="<c:url value='/resources/img/project/calligraphy/1.jpg'/>" alt="">
						<div class="short_info">
							<span class="post-type">일러스트</span>
		        			<span class="post-date">13분 전</span>
			        		<h3><span class="post-title">그림그린그림</span></h3>
			        		<div class="avatar-icon-wrapper avatar-icon-sm">
			        			<div class="avatar-icon"><img src="<c:url value='/resources/kero/assets/images/avatars/2.jpg'/>"/></div>
			        		</div>
		        			<span class="post-artist">작가이름</span>
		        			<div class="clear"> </div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-comment"> </i> <span class="post-comment">12</span>
		        			</div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-look"> </i> <span class="post-comment">107</span>
		        			</div>
						</div>
					</div>
				</div>

<div class="col-lg-3 col-md-4 all calligraphy">
					<div class="single_portfolio">
						<img class="img-fluid w-100" src="<c:url value='/resources/img/project/calligraphy/2.jpg'/>" alt="">
						<div class="short_info">
							<span class="post-type">일러스트</span>
		        			<span class="post-date">13분 전</span>
			        		<h3><span class="post-title">그림그린그림</span></h3>
			        		<div class="avatar-icon-wrapper avatar-icon-sm">
			        			<div class="avatar-icon"><img src="<c:url value='/resources/kero/assets/images/avatars/2.jpg'/>"/></div>
			        		</div>
		        			<span class="post-artist">작가이름</span>
		        			<div class="clear"> </div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-comment"> </i> <span class="post-comment">12</span>
		        			</div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-look"> </i> <span class="post-comment">107</span>
		        			</div>
						</div>
					</div>
				</div>
				
				<div class="col-lg-3 col-md-4 all calligraphy">
					<div class="single_portfolio">
						<img class="img-fluid w-100" src="<c:url value='/resources/img/project/calligraphy/3.jpg'/>" alt="">
						<div class="short_info">
							<span class="post-type">일러스트</span>
		        			<span class="post-date">13분 전</span>
			        		<h3><span class="post-title">그림그린그림</span></h3>
			        		<div class="avatar-icon-wrapper avatar-icon-sm">
			        			<div class="avatar-icon"><img src="<c:url value='/resources/kero/assets/images/avatars/2.jpg'/>"/></div>
			        		</div>
		        			<span class="post-artist">작가이름</span>
		        			<div class="clear"> </div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-comment"> </i> <span class="post-comment">12</span>
		        			</div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-look"> </i> <span class="post-comment">107</span>
		        			</div>
						</div>
					</div>
				</div>
				
				<div class="col-lg-3 col-md-4 all calligraphy">
					<div class="single_portfolio">
						<img class="img-fluid w-100" src="<c:url value='/resources/img/project/calligraphy/4.jpg'/>" alt="">
						<div class="short_info">
							<span class="post-type">일러스트</span>
		        			<span class="post-date">13분 전</span>
			        		<h3><span class="post-title">그림그린그림</span></h3>
			        		<div class="avatar-icon-wrapper avatar-icon-sm">
			        			<div class="avatar-icon"><img src="<c:url value='/resources/kero/assets/images/avatars/2.jpg'/>"/></div>
			        		</div>
		        			<span class="post-artist">작가이름</span>
		        			<div class="clear"> </div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-comment"> </i> <span class="post-comment">12</span>
		        			</div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-look"> </i> <span class="post-comment">107</span>
		        			</div>
						</div>
					</div>
				</div>
<!-- 켈리그라피 끝 -->

<!-- 조소공예시작 -->
				<div class="col-lg-3 col-md-4 all crafts">
					<div class="single_portfolio">
						<img class="img-fluid w-100" src="<c:url value='/resources/img/project/claymodelcrafts/1.jpg'/>" alt="">
						<div class="short_info">
							<span class="post-type">일러스트</span>
		        			<span class="post-date">13분 전</span>
			        		<h3><span class="post-title">그림그린그림</span></h3>
			        		<div class="avatar-icon-wrapper avatar-icon-sm">
			        			<div class="avatar-icon"><img src="<c:url value='/resources/kero/assets/images/avatars/2.jpg'/>"/></div>
			        		</div>
		        			<span class="post-artist">작가이름</span>
		        			<div class="clear"> </div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-comment"> </i> <span class="post-comment">12</span>
		        			</div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-look"> </i> <span class="post-comment">107</span>
		        			</div>
						</div>
					</div>
				</div>
				
				<div class="col-lg-3 col-md-4 all crafts">
					<div class="single_portfolio">
						<img class="img-fluid w-100" src="<c:url value='/resources/img/project/claymodelcrafts/2.jpg'/>" alt="">
						<div class="short_info">
							<span class="post-type">일러스트</span>
		        			<span class="post-date">13분 전</span>
			        		<h3><span class="post-title">그림그린그림</span></h3>
			        		<div class="avatar-icon-wrapper avatar-icon-sm">
			        			<div class="avatar-icon"><img src="<c:url value='/resources/kero/assets/images/avatars/2.jpg'/>"/></div>
			        		</div>
		        			<span class="post-artist">작가이름</span>
		        			<div class="clear"> </div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-comment"> </i> <span class="post-comment">12</span>
		        			</div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-look"> </i> <span class="post-comment">107</span>
		        			</div>
						</div>
					</div>
				</div>
				
				<div class="col-lg-3 col-md-4 all crafts">
					<div class="single_portfolio">
						<img class="img-fluid w-100" src="<c:url value='/resources/img/project/claymodelcrafts/3.jpg'/>" alt="">
						<div class="short_info">
							<span class="post-type">일러스트</span>
		        			<span class="post-date">13분 전</span>
			        		<h3><span class="post-title">그림그린그림</span></h3>
			        		<div class="avatar-icon-wrapper avatar-icon-sm">
			        			<div class="avatar-icon"><img src="<c:url value='/resources/kero/assets/images/avatars/2.jpg'/>"/></div>
			        		</div>
		        			<span class="post-artist">작가이름</span>
		        			<div class="clear"> </div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-comment"> </i> <span class="post-comment">12</span>
		        			</div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-look"> </i> <span class="post-comment">107</span>
		        			</div>
						</div>
					</div>
				</div>
				
				<div class="col-lg-3 col-md-4 all crafts">
					<div class="single_portfolio">
						<img class="img-fluid w-100" src="<c:url value='/resources/img/project/claymodelcrafts/4.jpg'/>" alt="">
						<div class="short_info">
							<span class="post-type">일러스트</span>
		        			<span class="post-date">13분 전</span>
			        		<h3><span class="post-title">그림그린그림</span></h3>
			        		<div class="avatar-icon-wrapper avatar-icon-sm">
			        			<div class="avatar-icon"><img src="<c:url value='/resources/kero/assets/images/avatars/2.jpg'/>"/></div>
			        		</div>
		        			<span class="post-artist">작가이름</span>
		        			<div class="clear"> </div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-comment"> </i> <span class="post-comment">12</span>
		        			</div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-look"> </i> <span class="post-comment">107</span>
		        			</div>
						</div>
					</div>
				</div>
				
				<div class="col-lg-3 col-md-4 all crafts">
					<div class="single_portfolio">
						<img class="img-fluid w-100" src="<c:url value='/resources/img/project/claymodelcrafts/5.jpg'/>" alt="">
						<div class="short_info">
							<span class="post-type">일러스트</span>
		        			<span class="post-date">13분 전</span>
			        		<h3><span class="post-title">그림그린그림</span></h3>
			        		<div class="avatar-icon-wrapper avatar-icon-sm">
			        			<div class="avatar-icon"><img src="<c:url value='/resources/kero/assets/images/avatars/2.jpg'/>"/></div>
			        		</div>
		        			<span class="post-artist">작가이름</span>
		        			<div class="clear"> </div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-comment"> </i> <span class="post-comment">12</span>
		        			</div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-look"> </i> <span class="post-comment">107</span>
		        			</div>
						</div>
					</div>
				</div>
				
				<div class="col-lg-3 col-md-4 all crafts">
					<div class="single_portfolio">
						<img class="img-fluid w-100" src="<c:url value='/resources/img/project/claymodelcrafts/6.jpg'/>" alt="">
						<div class="short_info">
							<span class="post-type">일러스트</span>
		        			<span class="post-date">13분 전</span>
			        		<h3><span class="post-title">그림그린그림</span></h3>
			        		<div class="avatar-icon-wrapper avatar-icon-sm">
			        			<div class="avatar-icon"><img src="<c:url value='/resources/kero/assets/images/avatars/2.jpg'/>"/></div>
			        		</div>
		        			<span class="post-artist">작가이름</span>
		        			<div class="clear"> </div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-comment"> </i> <span class="post-comment">12</span>
		        			</div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-look"> </i> <span class="post-comment">107</span>
		        			</div>
						</div>
					</div>
				</div>
<!-- 조소공예끝 -->
				
			</div>
		</div>
	</div>
</section>
<!--================ End Portfolio Area =================-->