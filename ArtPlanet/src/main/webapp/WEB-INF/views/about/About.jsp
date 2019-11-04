<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.about-area .about-content p {
	font-size: 15px;
	color: #1a1d24;
}
</style>
<div class="app-header"></div>
<div class="container">
	<section class="about-area area-padding">
		<div class="row">
			<div class="col-lg-6">
				<div class="img-styleBox" style="padding-bottom: 80px;'">
					<img src="<c:url value='/resources/img/banner/home-banner1.jpg'/>"
						alt="">
				</div>
			</div>
			<div class="col-lg-5 col-md-12 offset-md-0 offset-lg-1" style="align-self: center;">
				<div class="about-content">
					<h4 style="font-weight: bold; font-family: auto;">
						Artist's <span style="color: #ff5555;">Planet</span>
					</h4>
					<p>아트 플래닛은 아티스트들의 멋진 작품을</p>
					<p>발견하고, 공유하고, 후원할 수 있는 크리에이티브 콘텐츠 커뮤니티입니다.</p>
					<p>아트 플래닛 안에서, 아티스트들이 더 좋은 작품을 만들고, 많은 팬들을 만나며,</p>
					<p>수익을 창출하여 창작 활동을 지속할 수 있기를 바랍니다.</p>
				</div>
			</div>
		</div>
	</section>
	<!--================About Area End =================-->
	<section class="service-area area-padding pad-top-0">
		<div class="container">
			<div class="area-heading">
				<h3 style="font-weight: bold; font-family: auto;">
					What <span style="color: #ff5555;">We</span> Offer
				</h3>
			</div>
			<div class="row">
				<div class="col-md-6 col-xl-4">
					<div class="single-service">
						<div class="service-icon">
							<span class="flaticon-leaf"></span>
						</div>
						<div class="service-content">
							<h5>Keep on Creating</h5>
							<p>후원과 보상을 통해 당신이 좋아하는 작가를 응원하고, 당신을 응원하는 팬들에게 보답하세요. 이는 당신이
								창작활동을 지속하는데 중요한 원동력이 될 것입니다.</p>
						</div>
					</div>
				</div>

				<div class="col-md-6 col-xl-4">
					<div class="single-service">
						<div class="service-icon">
							<span class="flaticon-send"></span>
						</div>
						<div class="service-content">
							<h5>Start Project</h5>
							<p>금전적인 문제로 실행하지 못한 창작활동이 있나요? 프로젝트를 등록하고 성사시키세요. 당신의 작품을
								소유하기 원하는 팬들이 도와줄 것입니다.</p>
						</div>
					</div>
				</div>

				<div class="col-md-6 col-xl-4">
					<div class="single-service">
						<div class="service-icon">
							<span class="flaticon-camera"></span>
						</div>
						<div class="service-content">
							<h5>Improve Skills</h5>
							<p>아트 클래스를 통해 기술을 연마하고 멋진 경험을 함께하세요. 숙련자에게는 실력상승의 기회가, 초심자에게는
								길잡이가 되어줄 것입니다.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>