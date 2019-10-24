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
</style>
<script>
	$(function() {
		
	});
</script>

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
				<li class="nav-item"><a href="<c:url value='/Search/Artwork'/>" class="nav-link">작품</a></li>
				<li class="nav-item"><a href="<c:url value='/Search/Artist'/>" class="nav-link">아티스트</a></li>
				<li class="nav-item"><a href="<c:url value='/Search/Project'/>" class="nav-link active">프로젝트</a></li>
			</ul>
		</div>

		<div class="filters portfolio-filter">
			<ul>
				<li class="active" data-filter="*">all</li>
				<li data-filter=".illustration">일러스트레이션</li>
				<li data-filter=".painting">회화</li>
				<li data-filter=".animation">애니메이션</li>
				<li data-filter=".design">디자인</li>
				<li data-filter=".calligraphy">캘리그라피</li>
				<li data-filter=".crafts">조소/공예</li>
			</ul>
		</div>

		<div class="filters-content">
			<div class="row portfolio-grid">
				<div class="grid-sizer col-md-4 col-lg-3"></div>
				<div class="col-lg-3 col-md-4 all illustration painting">
					<div class="single_portfolio">
						<img class="img-fluid w-100" src="<c:url value='/resources/img/project/1.jpg'/>" alt="">
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
						<img class="img-fluid w-100" src="<c:url value='/resources/img/project/2.jpg'/>" alt="">
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
						<img class="img-fluid w-100" src="<c:url value='/resources/img/project/4.jpg'/>" alt="">
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
						<img class="img-fluid w-100" src="<c:url value='/resources/img/project/3.jpg'/>" alt="">
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


				<div class="col-lg-3 col-md-4 all weeding motion fashion">
					<div class="single_portfolio">
						<img class="img-fluid w-100" src="<c:url value='/resources/img/project/d2.jpg'/>" alt="">
						<div class="short_info">
							<p>construction</p>
							<h4>
								<a href="portfolio-details.html">Desert Work, Dubai</a>
							</h4>
						</div>
					</div>
				</div>
				
				<div class="col-lg-3 col-md-4 all fashion motion">
					<div class="single_portfolio">
						<img class="img-fluid w-100" src="<c:url value='/resources/img/project/1.jpg'/>" alt="">
						<div class="short_info">
							<p>Fashion</p>
							<h4>
								<a href="portfolio-details.html">Fahion photography</a>
							</h4>
						</div>
					</div>
				</div>

				<div class="col-lg-3 col-md-4 all weeding motion portrait">
					<div class="single_portfolio">
						<img class="img-fluid w-100" src="<c:url value='/resources/img/project/2.jpg'/>" alt="">
						<div class="short_info">
							<p>construction</p>
							<h4>
								<a href="portfolio-details.html">Desert Work, Dubai</a>
							</h4>
						</div>
					</div>
				</div>


				<div class="col-lg-3 col-md-4 all weeding motion fashion">
					<div class="single_portfolio">
						<img class="img-fluid w-100" src="<c:url value='/resources/img/project/d2.jpg'/>" alt="">
						<div class="short_info">
							<p>construction</p>
							<h4>
								<a href="portfolio-details.html">Desert Work, Dubai</a>
							</h4>
						</div>
					</div>
				</div>
				
				<div class="col-lg-3 col-md-4 all fashion motion">
					<div class="single_portfolio">
						<img class="img-fluid w-100" src="<c:url value='/resources/img/project/1.jpg'/>" alt="">
						<div class="short_info">
							<p>Fashion</p>
							<h4>
								<a href="portfolio-details.html">Fahion photography</a>
							</h4>
						</div>
					</div>
				</div>

				<div class="col-lg-3 col-md-4 all weeding motion portrait">
					<div class="single_portfolio">
						<img class="img-fluid w-100" src="<c:url value='/resources/img/project/2.jpg'/>" alt="">
						<div class="short_info">
							<p>construction</p>
							<h4>
								<a href="portfolio-details.html">Desert Work, Dubai</a>
							</h4>
						</div>
					</div>
				</div>

				<div class="col-lg-3 col-md-4 all weeding motion fashion">
					<div class="single_portfolio">
						<img class="img-fluid w-100" src="<c:url value='/resources/img/project/d2.jpg'/>" alt="">
						<div class="short_info">
							<p>construction</p>
							<h4>
								<a href="portfolio-details.html">Desert Work, Dubai</a>
							</h4>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>
</section>
<!--================ End Portfolio Area =================-->