<%@ page language="java" contentType="text/html;charset=euc-kr" pageEncoding="euc-kr"%>
<%@ include file="../cfg/site_conf_inc.jsp" %>
<% request.setCharacterEncoding ("euc-kr"); %>
<% response.setContentType("text/html;charset=euc-kr"); %>
<!doctype html>
<html class="no-js" lang="ko">
<head>
	<meta charset="euc-kr">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
	<meta http-equiv="Pragma" content="no-cache"> 
	<meta http-equiv="Expires" content="-1">
	<title>ArtPlanet_Checkout</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- Favicon -->
	<link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
	
	<!-- Google Fonts 	-->
	<link href='https://fonts.googleapis.com/css?family=Raleway:400,300,500,600,700,800,900' rel='stylesheet' type='text/css'>
	<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">

	<!-- css  -->
	<!-- Bootstrap CSS
	============================================ -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ksc/css/bootstrap.min.css">
	<!-- Icon Font CSS
	============================================ -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ksc/css/material-design-iconic-font.min.css">
	<!-- Mean Menu CSS
	============================================ -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ksc/css/meanmenu.min.css">
	<!-- Owl Carousel CSS
	============================================ -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ksc/css/owl.carousel.css">
	<!-- Nivo Slider CSS
	============================================ -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ksc/css/nivo-slider.css">
	<!-- Price Slider CSS
	============================================ -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ksc/css/jquery-ui.min.css">
	<!-- Magnific Popup CSS
	============================================ -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ksc/css/magnific-popup.css">
	<!-- Animate CSS
	============================================ -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ksc/css/animate.min.css">
	<!-- Style CSS
	============================================ -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ksc/style.css">
	<!-- Default Color CSS
	============================================ -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ksc/css/color/color-one.css">
	<!-- Responsive CSS 
	============================================ -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ksc/css/responsive.css">
	<!-- Modernizer JS
	============================================ -->
	<script src="${pageContext.request.contextPath}/resources/ksc/js/vendor/modernizr-2.8.3.min.js"></script>
	<script type="text/javascript">
	function m_Completepayment( FormOrJson, closeEvent ) 
    {
        var frm = document.order_info; 
     
        /********************************************************************/
        /* FormOrJson은 가맹점 임의 활용 금지                               */
        /* frm 값에 FormOrJson 값이 설정 됨 frm 값으로 활용 하셔야 됩니다.  */
        /* FormOrJson 값을 활용 하시려면 기술지원팀으로 문의바랍니다.       */
        /********************************************************************/
        GetField( frm, FormOrJson ); 

        
        if( frm.res_cd.value == "0000" )
        {
		    alert("결제 승인 요청 전,\n\n반드시 결제창에서 고객님이 결제 인증 완료 후\n\n리턴 받은 ordr_chk 와 업체 측 주문정보를\n\n다시 한번 검증 후 결제 승인 요청하시기 바랍니다."); //업체 연동 시 필수 확인 사항.
            /*
                가맹점 리턴값 처리 영역
            */
         
            frm.submit(); 
        }
        else
        {
            alert( "[" + frm.res_cd.value + "] " + frm.res_msg.value );
            
            closeEvent();
        }
    }
	</script>
	
	<script type="text/javascript" src="<%= g_conf_js_url %>"></script>
  <script type="text/javascript">
        /* 플러그인 설치(확인) */
        //kcpTx_install(); // Plugin 결제창 호출 방식인 경우 적용하시기 바랍니다.

        /* Payplus Plug-in 실행 */
        function jsf__pay( form )
        {
            try
            {
                KCP_Pay_Execute( form ); 
            }
            catch (e)
            {
                /* IE 에서 결제 정상종료시 throw로 스크립트 종료 */ 
            }
        }             

        /* 주문번호 생성 */
        function init_orderid()
        {
            var today = new Date();
            var year  = today.getFullYear();
            var month = today.getMonth() + 1;
            var date  = today.getDate();
            var time  = today.getTime();

            if(parseInt(month) < 10) {
                month = "0" + month;
            }

            if(parseInt(date) < 10) {
                date = "0" + date;
            }

            var order_idxx = "TEST" + year + "" + month + "" + date + "" + time;

            document.order_info.ordr_idxx.value = order_idxx;            
        }
       
    </script>
</head>
<body>
<!-- Pre Loader
============================================ -->
<div class="preloader">
	<div class="loading-center">
		<div class="loading-center-absolute">
			<div class="object object_one"></div>
			<div class="object object_two"></div>
			<div class="object object_three"></div>
		</div>
	</div>
</div>
<div class="as-mainwrapper">
<!-- Header
============================================ -->
<div class="header">
	<!-- Header Top -->
	<div class="header-top">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-xs-4 header-top-left">
					<!-- Header Language Currency -->
					<ul class="header-lan-cur float-left">
						<!-- Header Language -->
						
					
					</ul>
				</div>
				<div class="col-sm-6 col-xs-8 header-top-right">
					<!-- Header Mini Cart -->
					
					<!-- Header Account Login -->
					<div class="header-account-login float-right">
						
					</div>
				</div>
			</div><!-- 로우 -->
		</div><!-- 컨테이너 -->
	</div><!-- 헤더탑 -->
	<!-- Header Bottom -->
	<div class="header-bottom">
		<div class="container">
			<div class="row">
				<div class="header-bottom-wrap">
					<!-- Logo -->
					<div class="header-logo col-lg-3 col-md-2">
						<div class="logo"><a href="index.html"><img src="img/logo-3.png" alt="logo" /></a></div>
					</div>
					<!-- Main Menu -->
					
					<!-- Mobile Menu -->
				
					<!-- Header Search -->
					<!-- 
					<div class="header-search col-lg-3 col-md-3">
						<form action="#">
							<input type="text" placeholder="search" />
							<button><i class="zmdi zmdi-search"></i></button>
						</form>
					</div> -->
				</div><!-- 헤더바텀랩 -->
			</div><!-- 로우 -->
		</div><!-- 컨테이너 -->
	</div><!-- 헤더바텀 -->
</div><!--  클래스 헤더 끝  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
<div class="main-content-wrapper">
<!-- Page Breadcrumb Area
============================================ -->

<!-- Checkout Page
============================================ -->
<div class="checkout-page bg-off-white padding-bottom-90">
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-xs-12">
				<!-- Checkout Accordion -->
				<div id="checkout-accordion" class="panel-group">
					<!-- Checkout Method -->
					<div class="panel single-accordion">
						<a class="accordion-head" data-toggle="collapse" data-parent="#checkout-accordion" href="#checkout-method">
						1. 주소입력</a>
						<div id="checkout-method" class="collapse in">
							<div class="accordion-body checkout-method fix">
								<div class="checkout-reg float-left">
									<h3>DB에서 끌어와서 셀렉트박스 뿌려주기</h3>
									<h4>주소를 선택하세요</h4>
									<input type="radio" name="billing-info" id="ship-address"> <label for="ship-address">Ship to this address</label>
									
									<form action="#">
									<select>
										<option>서울특별시 가산동 가산디지털로14 김길동</option>
										<option>서울특별시 구로구 구로동 박길동</option>
									</select>
	
										<input type="radio" name="billing-info" id="different-address"> <label for="different-address">Ship to different address</label>
										<p>DB에 저장된정보말고 새로운주소 <br />다음 주소록 API?</p>
										
										<a href="#" class="button color-hover">주소검색</a>
										
										<div class="input-box">
										</div>
									</form>
									
									
								</div>
								
							</div>
						</div>
					</div>
					<!-- Billing Method -->
					<div class="panel single-accordion">
						<a class="accordion-head collapsed" data-toggle="collapse" data-parent="#checkout-accordion" href="#billing-method">
						2. 예비용</a>
						<div id="billing-method" class="collapse">
							<div class="accordion-body billing-method fix">
								<p>예비용 내용입니다</p>
								<form action="#">
								
									<button class="button color-hover">continiue</button>
								</form>
							</div>
						</div>
					</div>
					
					<!-- Payment Info -->
					<div class="panel single-accordion">
						<a class="accordion-head collapsed" data-toggle="collapse" data-parent="#checkout-accordion" href="#payment-info">
						2. 결제정보입력</a>
						<div id="payment-info" class="collapse">
							<div class="accordion-body payment-info fix">
									<!-- PG사로 폼값 포스트로 전송하기 -->
									<form name="order_info" method="post" action="Hub.do" >
									<div class="input-box">
										<label>1. 지불방법</label>
										<select name="pay_method">
											<option value="100000000000">신용카드</option>
			                                <option value="010000000000">계좌이체</option>
			                                <option value="001000000000">가상계좌</option>
			                                <option value="000100000000">포인트</option>
			                                <option value="000010000000">휴대폰</option>
			                                <option value="000000001000">상품권</option>
			                                <option value="000000000010">ARS</option>
			                                <option value="111000000000">신용카드/계좌이체/가상계좌</option>
										</select>
									</div>
						
									<div class="input-box">
										<label for="card-name">2. 주문번호</label>
										<input type="text" name="ordr_idxx" value="TEST1234" maxlength="40" />
									</div>
									
									<div class="input-box">
										<label for="card-name">3. 상품명</label>
										<input type="text" name="good_name"  value="용주의 그림교실"/>
									</div>
									
									<div class="input-box">
										<label for="card-name">4. 결제금액</label>
										<input type="text" name="good_mny"  value="1004" maxlength="9"/>원(숫자만 입력)
									</div>
									
									<div class="input-box">
										<label for="card-name">5. 주문자명</label>
										<input type="text" name="buyr_name"  value="가길동" />
									</div>
									
									<div class="input-box">
										<label for="card-name">6. E-mail</label>
										<input type="text" name="buyr_mail"  value="test@test.co.kr" maxlength="30"/>
									</div>
									
									<div class="input-box">
										<label for="card-name">7. 전화번호</label>
										<input type="text" name="buyr_tel2"  value="010-0000-0000"/>
									</div>
									
									<div class="input-box">
										<label for="card-name">8. 휴대폰번호</label>
										<input type="text" name="buyr_tel2"  value="010-0000-0000"/>
									</div>
									
										<button class="button color-hover" class="submit" onclick="jsf__pay(this.form);" >결제요청</button>
										 
									<!-- 결제요청 버튼 -->
									<input name="button" type="button" class="submit" value="결제요청" onclick="jsf__pay(this.form);"/>
     							    <!-- 히든타입 가맹점정보 -->
     							    <input type="hidden" name="req_tx"          value="pay" />
    								<input type="hidden" name="site_cd"         value="<%= g_conf_site_cd   %>" />
    								<input type="hidden" name="site_name"       value="<%= g_conf_site_name %>" />
    								<input type="hidden" name="quotaopt"        value="12"/>
    								<input type="hidden" name="currency"        value="WON"/>
    								<!-- 필수정보(변경불가) -->
    							    <input type="hidden" name="module_type"     value="<%= module_type %>"/>
    							    <input type="hidden" name="res_cd"          value=""/>
								    <input type="hidden" name="res_msg"         value=""/>
								    <input type="hidden" name="enc_info"        value=""/>
								    <input type="hidden" name="enc_data"        value=""/>
								    <input type="hidden" name="ret_pay_method"  value=""/>
								    <input type="hidden" name="tran_cd"         value=""/>
								    <input type="hidden" name="use_pay_method"  value=""/>
    								
    								<input type="hidden" name="ordr_chk"        value=""/>
    								
    								<input type="hidden" name="cash_yn"         value=""/>
 								    <input type="hidden" name="cash_tr_code"    value=""/>
  								    <input type="hidden" name="cash_id_info"    value=""/>
    								<input type="hidden" name="good_expr" value="0">		
						</form> <!-- 폼끝 -->
									
									<div class="payment-method fix">
										<input type="radio" name="payment-method" id="check"> <label for="check">check / money order</label>
										<input type="radio" name="payment-method" id="card"> <label for="card">credit card (saved)</label>
									</div>
								
									<div class="input-box-2 fix">
										<label>Expiration Date</label>
										<div class="input-box">
											<select>
												<option>Month</option>
												<option>Jan</option>
												<option>Feb</option>
												<option>Mar</option>
												<option>Apr</option>
												<option>May</option>
												<option>Jun</option>
												<option>Jul</option>
												<option>Aug</option>
												<option>Sep</option>
												<option>Oct</option>
												<option>Nov</option>
												<option>Dec</option>
											</select>
										</div>
										<div class="input-box">
											<select>
												<option>Month</option>
												<option>Jan</option>
												<option>Feb</option>
												<option>Mar</option>
												<option>Apr</option>
												<option>May</option>
												<option>Jun</option>
												<option>Jul</option>
												<option>Aug</option>
												<option>Sep</option>
												<option>Oct</option>
												<option>Nov</option>
												<option>Dec</option>
											</select>
										</div>
									</div>
									
									<a href="#">한글깨짐 ?</a>
								
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Order Details -->
			<div class="col-md-6 col-xs-12">
				<div class="order-details-wrapper">
					<h2>your order</h2>
					<div class="order-details fix">
						<form action="#">
							<ul>
								<li><p class="strong float-left">product</p><p class="last-child strong float-right">total</p></li>
								<li><p class="float-left">Lorem ipsum dolor sit amet x1</p><p class="last-child float-right">$104.99</p></li>
								<li><p class="float-left">Lorem ipsum dolor T-shirt x1 </p><p class="last-child float-right">$85.99</p></li>
								<li><p class="strong float-left">cart subtotal</p><p class="last-child strong float-right">$190.98</p></li>
								<li><p class="strong float-left">shipping</p><p class="last-child float-right">
									<input type="radio" name="order-shipping" id="flat" /><label for="flat">Flat Rate $ 7.00</label><br />
									<input type="radio" name="order-shipping" id="free" /><label for="free">Free Shipping</label>
								</p></li>
								<li><p class="strong float-left">order total</p><p class="last-child strong float-right">$190.98</p><button class="button large color-hover float-right">place order</button></li>
							</ul>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Brand Area
============================================ -->
<div class="brand-area">
	<div class="container">
		<div class="row">
			<div class="col-xs-12">
				<div class="brand-slider">
					<div class="sin-brand"><img src="img/brands/1.png" alt="" /></div>
					<div class="sin-brand"><img src="img/brands/2.png" alt="" /></div>
					
					<div class="sin-brand"><img src="img/brands/10.png" alt="" /></div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Footer Top Area
============================================ -->
<div class="footer-top bg-off-white padding-top-80 padding-bottom-90">
	<div class="container">
		<div class="row">
			<!-- Footer Address -->
			<div class="sin-footer footer-address col-lg-3 col-md-4 col-sm-6 col-xs-12">
				<div class="footer-logo"><img src="img/logo-2.png" alt="logo" /></div>
				<p><span>ADDRESS:</span> 28 Green Tower, Street Name New York City, USA</p>
				<p><span>Telephone:</span> +88017 222 333</p>
				<p><span>Email:</span> contact@shopieee.com</p>
				<div class="footer-social">
					<a class="facebook" href="#"><i class="zmdi zmdi-facebook"></i></a>
					<a class="twitter" href="#"><i class="zmdi zmdi-twitter"></i></a>
					<a class="vimeo" href="#"><i class="zmdi zmdi-vimeo"></i></a>
					<a class="google-plus" href="#"><i class="zmdi zmdi-google-plus"></i></a>
					<a class="tumblr" href="#"><i class="zmdi zmdi-tumblr"></i></a>
					<a class="pinterest" href="#"><i class="zmdi zmdi-pinterest"></i></a>
				</div>
			</div>
			<!-- Footer Service -->
			<div class="sin-footer footer-service footer-link col-lg-3 col-md-2 col-sm-6 col-xs-12">
				<h3>services</h3>
				<ul>
					<li><a href="#">About us</a></li>
					<li><a href="#">Return Policy</a></li>
					<li><a href="#">Our Blog</a></li>
					<li><a href="#">Contact Us</a></li>
					<li><a href="#">Terms & Condition</a></li>
				</ul>
			</div>
			<!-- Footer Account -->
			<div class="sin-footer footer-account footer-link col-lg-3 col-md-2 col-sm-6 col-xs-12">
				<h3>account</h3>
				<ul>
					<li><a href="#">Your Account</a></li>
					<li><a href="#">Checkout</a></li>
					<li><a href="#">Login</a></li>
					<li><a href="#">Register</a></li>
				</ul>
			</div>
			<!-- Footer Newsletter -->
			<div class="sin-footer footer-newsletter col-lg-3 col-md-4 col-sm-6 col-xs-12">
				<h3>newsletter</h3>
				<p>Subscribe by our newsletter and get update protidin.</p>
				<form id="mc-form" class="mc-form footer-newsletter">
					<input id="mc-email" type="email" autocomplete="off" placeholder="Email Address">
					<input id="mc-submit" type="submit" value="subscribe" />
				</form>
				<!-- mailchimp-alerts Start -->
				<div class="mailchimp-alerts text-centre">
					<div class="mailchimp-submitting"></div><!-- mailchimp-submitting end -->
					<div class="mailchimp-success"></div><!-- mailchimp-success end -->
					<div class="mailchimp-error"></div><!-- mailchimp-error end -->
				</div><!-- mailchimp-alerts end -->
			</div>
		</div>
	</div>
</div>
<!-- Footer Bottom Area
============================================ -->
<div class="footer-bottom">
	<div class="container">
		<div class="row">
			<!-- Copyright -->
			<div class="copyright col-sm-6 col-xs-12 text-left">
				<p>2016  All Rights Reserved - <a href="https://freethemescloud.com/">Free themes Cloud</a> Responsive Theme </p>
			</div>
			<!-- Payment Method -->
			<div class="payment-method col-sm-6 col-xs-12 text-right">
				<img src="img/payment-method.png" alt="" />
			</div>
		</div>
	</div>
</div>
</div>
</div>



<!-- JS -->

<!-- jQuery JS
============================================ -->
<script src="${pageContext.request.contextPath}/resources/ksc/js/vendor/jquery-1.12.0.min.js"></script>
<!-- Bootstrap JS
============================================ -->
<script src="${pageContext.request.contextPath}/resources/ksc/js/bootstrap.min.js"></script>
<!-- Nivo Slider JS
============================================ -->
<script src="${pageContext.request.contextPath}/resources/ksc/js/jquery.nivo.slider.pack.js"></script>
<!-- Mean Menu JS
============================================ -->
<script src="${pageContext.request.contextPath}/resources/ksc/js/jquery.meanmenu.min.js"></script>
<!-- Owl Carousel JS
============================================ -->
<script src="${pageContext.request.contextPath}/resources/ksc/js/owl.carousel.min.js"></script>
<!-- Count Down JS
============================================ -->
<script src="${pageContext.request.contextPath}/resources/ksc/js/jquery.countdown.min.js"></script>
<!-- ScrollUP JS
============================================ -->
<script src="${pageContext.request.contextPath}/resources/ksc/js/jquery.scrollup.min.js"></script>
<!-- TreeView JS
============================================ -->
<script src="${pageContext.request.contextPath}/resources/ksc/js/jquery.treeview.js"></script>
<!-- Price Slider JS
============================================ -->
<script src="${pageContext.request.contextPath}/resources/ksc/js/jquery-ui.min.js"></script>
<!-- simpleLens JS
============================================ -->
<script src="${pageContext.request.contextPath}/resources/ksc/js/jquery.elevateZoom-3.0.8.min.js"></script>
<!-- Magnific Popup JS
============================================ -->
<script src="${pageContext.request.contextPath}/resources/ksc/js/jquery.magnific-popup.min.js"></script>
<!-- Nice Scroll JS
============================================ -->
<script src="${pageContext.request.contextPath}/resources/ksc/js/jquery.nicescroll.min.js"></script>

<!-- WOW JS
============================================ -->
<script src="${pageContext.request.contextPath}/resources/ksc/js/wow.min.js"></script>
<script>
	new WOW().init();
</script>	
<!-- Main JS
============================================ -->
<script src="${pageContext.request.contextPath}/resources/ksc/js/main.js"></script>

</body>