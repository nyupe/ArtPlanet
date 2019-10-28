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
				<li data-filter=".animation">애니메이션</li>
				<li data-filter=".design">디자인</li>
				<li data-filter=".calligraphy">캘리그라피</li>
				<li data-filter=".crafts">조소/공예</li>
			</ul>
		</div>

		<div class="filters-content">
			<div class="row portfolio-grid">
				<div class="grid-sizer col-md-6 col-lg-4 col-xl-3"></div>
				<div class="col-xl-3 col-lg-4 col-md-6 all illustration painting">
					<div class="single_portfolio">
						<a href="#"><img class="img-fluid w-100" src="<c:url value='/resources/img/project/magic.jpg'/>" alt=""></a>
						<div class="project-info">
			        		<h4><a href="#"><span class="project-title">프로젝트제목저쩌구어쩌구저쩌구어쩌구저ㅓ쩌구</span></a></h4>
			        		<div class="avatar-icon-wrapper avatar-icon-sm">
			        			<div class="avatar-icon"><img src="<c:url value='/resources/kero/assets/images/avatars/2.jpg'/>"/></div>
			        		</div>
		        			<span class="post-artist">작가이름</span><br/>
		        			<span class="project-explain">이 프로젝트는 어쩌구저쩌구 이 프로젝트는 어쩌구저쩌구 이 프로젝트는 어쩌구저쩌구 이 프로젝트는 어쩌구저쩌구</span>
       						<div class="mb-3 progress-bar-animated-alt progress">
								<div class="progress-bar" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"
								style="width: 70%;"></div>
							</div>
							<div class="project-stats">
								<span class="stat-progress">70%</span>
								<span class="stat-target">￦ 1,500,000</span>
								<span class="stat-limit">34일 남음</span>
							</div>
						</div>
					</div>
				</div>
					

				<div class="col-xl-3 col-lg-4 col-md-6 all illustration painting">
					<div class="single_portfolio">
						<a href="#"><img class="img-fluid w-100" src="<c:url value='/resources/img/project/magic.jpg'/>" alt=""></a>
						<div class="project-info">
			        		<h4><a href="#"><span class="project-title">프로젝트제목저쩌구어쩌구저쩌구어쩌구저ㅓ쩌구</span></a></h4>
			        		<div class="avatar-icon-wrapper avatar-icon-sm">
			        			<div class="avatar-icon"><img src="<c:url value='/resources/kero/assets/images/avatars/2.jpg'/>"/></div>
			        		</div>
		        			<span class="post-artist">작가이름</span><br/>
		        			<span class="project-explain">이 프로젝트는 어쩌구저쩌구 이 프로젝트는 어쩌구저쩌구 이 프로젝트는 어쩌구저쩌구 이 프로젝트는 어쩌구저쩌구</span>
       						<div class="mb-3 progress-bar-animated-alt progress">
								<div class="progress-bar" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"
								style="width: 70%;"></div>
							</div>
							<div class="project-stats">
								<span class="stat-progress">70%</span>
								<span class="stat-target">￦ 1,500,000</span>
								<span class="stat-limit">34일 남음</span>
							</div>
						</div>
					</div>
				</div>
				
				<div class="col-xl-3 col-lg-4 col-md-6 all animation">
					<div class="single_portfolio">
						<a href="#"><img class="img-fluid w-100" src="<c:url value='/resources/img/project/magic.jpg'/>" alt=""></a>
						<div class="project-info">
			        		<h4><a href="#"><span class="project-title">프로젝트제목저쩌구어쩌구저쩌구어쩌구저ㅓ쩌구</span></a></h4>
			        		<div class="avatar-icon-wrapper avatar-icon-sm">
			        			<div class="avatar-icon"><img src="<c:url value='/resources/kero/assets/images/avatars/2.jpg'/>"/></div>
			        		</div>
		        			<span class="post-artist">작가이름</span><br/>
		        			<span class="project-explain">이 프로젝트는 어쩌구저쩌구 이 프로젝트는 어쩌구저쩌구 이 프로젝트는 어쩌구저쩌구 이 프로젝트는 어쩌구저쩌구</span>
       						<div class="mb-3 progress-bar-animated-alt progress">
								<div class="progress-bar" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"
								style="width: 70%;"></div>
							</div>
							<div class="project-stats">
								<span class="stat-progress">70%</span>
								<span class="stat-target">￦ 1,500,000</span>
								<span class="stat-limit">34일 남음</span>
							</div>
						</div>
					</div>
				</div>
				
				<div class="col-xl-3 col-lg-4 col-md-6 all design">
					<div class="single_portfolio">
						<a href="#"><img class="img-fluid w-100" src="<c:url value='/resources/img/project/magic.jpg'/>" alt=""></a>
						<div class="project-info">
			        		<h4><a href="#"><span class="project-title">프로젝트제목저쩌구어쩌구저쩌구어쩌구저ㅓ쩌구</span></a></h4>
			        		<div class="avatar-icon-wrapper avatar-icon-sm">
			        			<div class="avatar-icon"><img src="<c:url value='/resources/kero/assets/images/avatars/2.jpg'/>"/></div>
			        		</div>
		        			<span class="post-artist">작가이름</span><br/>
		        			<span class="project-explain">이 프로젝트는 어쩌구저쩌구 이 프로젝트는 어쩌구저쩌구 이 프로젝트는 어쩌구저쩌구 이 프로젝트는 어쩌구저쩌구</span>
       						<div class="mb-3 progress-bar-animated-alt progress">
								<div class="progress-bar" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"
								style="width: 70%;"></div>
							</div>
							<div class="project-stats">
								<span class="stat-progress">70%</span>
								<span class="stat-target">￦ 1,500,000</span>
								<span class="stat-limit">34일 남음</span>
							</div>
						</div>
					</div>
				</div>


				<div class="col-xl-3 col-lg-4 col-md-6 all illustration">
					<div class="single_portfolio">
						<a href="#"><img class="img-fluid w-100" src="<c:url value='/resources/img/project/magic.jpg'/>" alt=""></a>
						<div class="project-info">
			        		<h4><a href="#"><span class="project-title">프로젝트제목저쩌구어쩌구저쩌구어쩌구저ㅓ쩌구</span></a></h4>
			        		<div class="avatar-icon-wrapper avatar-icon-sm">
			        			<div class="avatar-icon"><img src="<c:url value='/resources/kero/assets/images/avatars/2.jpg'/>"/></div>
			        		</div>
		        			<span class="post-artist">작가이름</span><br/>
		        			<span class="project-explain">이 프로젝트는 어쩌구저쩌구 이 프로젝트는 어쩌구저쩌구 이 프로젝트는 어쩌구저쩌구 이 프로젝트는 어쩌구저쩌구</span>
       						<div class="mb-3 progress-bar-animated-alt progress">
								<div class="progress-bar" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"
								style="width: 70%;"></div>
							</div>
							<div class="project-stats">
								<span class="stat-progress">70%</span>
								<span class="stat-target">￦ 1,500,000</span>
								<span class="stat-limit">34일 남음</span>
							</div>
						</div>
					</div>
				</div>
				
				<div class="col-xl-3 col-lg-4 col-md-6 all crafts">
					<div class="single_portfolio">
						<a href="#"><img class="img-fluid w-100" src="<c:url value='/resources/img/project/magic.jpg'/>" alt=""></a>
						<div class="project-info">
			        		<h4><a href="#"><span class="project-title">프로젝트제목저쩌구어쩌구저쩌구어쩌구저ㅓ쩌구</span></a></h4>
			        		<div class="avatar-icon-wrapper avatar-icon-sm">
			        			<div class="avatar-icon"><img src="<c:url value='/resources/kero/assets/images/avatars/2.jpg'/>"/></div>
			        		</div>
		        			<span class="post-artist">작가이름</span><br/>
		        			<span class="project-explain">이 프로젝트는 어쩌구저쩌구 이 프로젝트는 어쩌구저쩌구 이 프로젝트는 어쩌구저쩌구 이 프로젝트는 어쩌구저쩌구</span>
       						<div class="mb-3 progress-bar-animated-alt progress">
								<div class="progress-bar" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"
								style="width: 70%;"></div>
							</div>
							<div class="project-stats">
								<span class="stat-progress">70%</span>
								<span class="stat-target">￦ 1,500,000</span>
								<span class="stat-limit">34일 남음</span>
							</div>
						</div>
					</div>
				</div>

				<div class="col-xl-3 col-lg-4 col-md-6 all design">
					<div class="single_portfolio">
						<a href="#"><img class="img-fluid w-100" src="<c:url value='/resources/img/project/magic.jpg'/>" alt=""></a>
						<div class="project-info">
			        		<h4><a href="#"><span class="project-title">프로젝트제목저쩌구어쩌구저쩌구어쩌구저ㅓ쩌구</span></a></h4>
			        		<div class="avatar-icon-wrapper avatar-icon-sm">
			        			<div class="avatar-icon"><img src="<c:url value='/resources/kero/assets/images/avatars/2.jpg'/>"/></div>
			        		</div>
		        			<span class="post-artist">작가이름</span><br/>
		        			<span class="project-explain">이 프로젝트는 어쩌구저쩌구 이 프로젝트는 어쩌구저쩌구 이 프로젝트는 어쩌구저쩌구 이 프로젝트는 어쩌구저쩌구</span>
       						<div class="mb-3 progress-bar-animated-alt progress">
								<div class="progress-bar" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"
								style="width: 70%;"></div>
							</div>
							<div class="project-stats">
								<span class="stat-progress">70%</span>
								<span class="stat-target">￦ 1,500,000</span>
								<span class="stat-limit">34일 남음</span>
							</div>
						</div>
					</div>
				</div>

				<div class="col-xl-3 col-lg-4 col-md-6 all crafts">
					<div class="single_portfolio">
						<a href="#"><img class="img-fluid w-100" src="<c:url value='/resources/img/project/magic.jpg'/>" alt=""></a>
						<div class="project-info">
			        		<h4><a href="#"><span class="project-title">프로젝트제목저쩌구어쩌구저쩌구어쩌구저ㅓ쩌구</span></a></h4>
			        		<div class="avatar-icon-wrapper avatar-icon-sm">
			        			<div class="avatar-icon"><img src="<c:url value='/resources/kero/assets/images/avatars/2.jpg'/>"/></div>
			        		</div>
		        			<span class="post-artist">작가이름</span><br/>
		        			<span class="project-explain">이 프로젝트는 어쩌구저쩌구 이 프로젝트는 어쩌구저쩌구 이 프로젝트는 어쩌구저쩌구 이 프로젝트는 어쩌구저쩌구</span>
       						<div class="mb-3 progress-bar-animated-alt progress">
								<div class="progress-bar" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"
								style="width: 70%;"></div>
							</div>
							<div class="project-stats">
								<span class="stat-progress">70%</span>
								<span class="stat-target">￦ 1,500,000</span>
								<span class="stat-limit">34일 남음</span>
							</div>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>
</section>
<!--================ End Portfolio Area =================-->