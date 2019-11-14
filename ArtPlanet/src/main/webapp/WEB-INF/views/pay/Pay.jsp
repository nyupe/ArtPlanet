<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<section class="pricing-table-area bg-1 area-padding">
	<div class="container">
		<div class="area-heading">
			<h3>
				강좌 <span> 결제</span> test
			</h3>
			<p>She'd earth that midst void creeping him above seas</p>
		</div>

		<div class="row">
			<div class="col-lg-12 col-md-12 mb-12 mb-lg-0">
				<div class="text-center card-priceTable">
					<div class="priceTable-header">
						<h3>Studio</h3>
						<p>test</p>
						<h1 class="priceTable-price">
							<span>\</span> 50000원
						</h1>
					</div>
					<ul class="priceTable-list">
						<li><span class="position"><i class="ti-check"></i></span>
							Unlimited Entrance</li>
						<li><span class="position"><i class="ti-check"></i></span>
							Comfortable Seat</li>
						<li><span class="position"><i class="ti-check"></i></span>
							Paid Certificate</li>
						<li><span class="negative"><i class="ti-close"></i></span>
							Day One Workshop</li>
						<li><span class="negative"><i class="ti-close"></i></span>
							One Certificate</li>
					</ul>
					<div class="priceTable-footer">
						<a class="main_btn" href="Order.do">일반결제(ArtClass)</a>
<<<<<<< HEAD
						<a class="main_btn" href="RecurringAuthReq.do">정기인증(Project)</a>	
						<a class="main_btn" href="<c:url value='/AuthStart.do'/> ">본인인증(신모듈)</a>
=======
						<a class="main_btn" href="RecurringAuthReq.do">정기인증(Blog 매달결제용)</a>	
						<a class="main_btn" href="<c:url value='/ProjectAuthReq.do'/>">정기인증(Project 일회성결제용/배치키 삭제해야함 )</a>	
						<a class="main_btn" href="AuthStart.do">본인인증(신모듈)</a>
>>>>>>> branch 'master' of https://github.com/nyupe/ArtPlanet.git
					</div>
					  <button type="button"  onclick="location.href='http://localhost:8080/artplanet/Search/Artwork';"
                               class="btn-shadow float-right btn-wide btn-pill mr-3 btn btn-outline-secondary" >
                                             홈으로</button>
				</div>
			</div>
		</div>
	</div>
</section>