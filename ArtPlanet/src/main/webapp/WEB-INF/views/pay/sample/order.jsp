<%@ page language="java" contentType="text/html;charset=euc-kr" pageEncoding="euc-kr"%>
<%@ include file="../cfg/site_conf_inc.jsp" %>
<% request.setCharacterEncoding ("euc-kr"); %>
<% response.setContentType("text/html;charset=euc-kr"); %>
<!doctype html >

<html class="no-js" lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" /> 
	<meta http-equiv="Pragma" content="no-cache"> 
	<meta http-equiv="Expires" content="-1">
	<title>ArtPlanet_Order</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- Favicon -->
	<link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
	
	<!-- Google Fonts -->
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
		/****************************************************************/
        /* m_Completepayment  설명                                      */
        /****************************************************************/
        /* 인증완료시 재귀 함수                                         */
        /* 해당 함수명은 절대 변경하면 안됩니다.                        */
        /* 해당 함수의 위치는 payplus.js 보다먼저 선언되어여 합니다.    */
        /* Web 방식의 경우 리턴 값이 form 으로 넘어옴                   */
        /* EXE 방식의 경우 리턴 값이 json 으로 넘어옴                   */
        /****************************************************************/
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

        /* 주문번호 생성 예제 */
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


<div class="main-content-wrapper">
<!-- Page Breadcrumb Area
============================================ -->
<div class="page-breadcrumb bg-off-white padding-bottom-90">
	<div class="container">
		<div class="row">
			<div class="col-xs-12">
				<ul class="breadcrumbs">
					<li>TEST</li>
				</ul>
			</div>
		</div>
	</div>
</div>
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
						<a class="accordion-head" data-toggle="collapse" data-parent="#checkout-accordion" href="#checkout-method">1. checkout method</a>
						<div id="checkout-method" class="collapse in">
							<div class="accordion-body checkout-method fix">
								<div class="checkout-reg float-left">
									<h3>choose checkout method</h3>
									<h4>test</h4>
									<form action="#">
										<input type="radio" name="checkout" value="guest" checked> <label>CARD</label><br>
										<input type="radio" name="checkout" value="reg"> <label>계좌이체</label>
									</form>
									
								
								</div>
								
							</div>
						</div>
					</div>
					
					
					
					
					<!-- Payment Info -->
					<div class="panel single-accordion">
						<a class="accordion-head collapsed" data-toggle="collapse" data-parent="#checkout-accordion" href="#payment-info">3. shipping method</a>
						<div id="payment-info" class="collapse">
							<div class="accordion-body payment-info fix">
								<form name="order_info" method="post" action="pp_cli_hub.jsp" >
									<div class="payment-method fix">
										<input type="radio" name="payment-method" id="check"> <label for="check">check / money order</label>
										<input type="radio" name="payment-method" id="card"> <label for="card">credit card (saved)</label>
									</div>
									<div class="input-box">
										<label for="card-name">Name on Card *</label>
										<input type="text" id="card-name" />
									</div>
									<div class="input-box">
										<label>Credit Card Type</label>
										<select>
											<option>Please Select</option>
											<option>Credit Card Type 1</option>
											<option>Credit Card Type 2</option>
										</select>
									</div>
									<div class="input-box">
										<label for="card-number">Credit Card Number *</label>
										<input type="text" id="card-number" />
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
									<div class="input-box">
										<label for="card-Verify">Card Verification Number *</label>
										<input type="text" id="card-Verify" />
									</div>
									   <table class="tbl" cellpadding="0" cellspacing="0">
<%
                    /* ============================================================================== */
                    /* =   1-1. 결제 수단 정보 설정                                                 = */
                    /* = -------------------------------------------------------------------------- = */
                    /* =   결제에 필요한 결제 수단 정보를 설정합니다.                               = */
                    /* =                                                                            = */
                    /* =  신용카드 : 100000000000, 계좌이체 : 010000000000, 가상계좌 : 001000000000 = */
                    /* =  포인트   : 000100000000, 휴대폰   : 000010000000, 상품권   : 000000001000 = */
                    /* =  ARS      : 000000000010                                                   = */
                    /* =                                                                            = */
                    /* =  위와 같이 설정한 경우 PayPlus Plugin에서 설정한 결제수단이 표시됩니다.    = */
                    /* =  Payplug Plugin에서 여러 결제수단을 표시하고 싶으신 경우 설정하시려는 결제 = */
                    /* =  수단에 해당하는 위치에 해당하는 값을 1로 변경하여 주십시오.               = */
                    /* =                                                                            = */
                    /* =  예) 신용카드, 계좌이체, 가상계좌를 동시에 표시하고자 하는 경우            = */
                    /* =  pay_method = "111000000000"                                               = */
                    /* =  신용카드(100000000000), 계좌이체(010000000000), 가상계좌(001000000000)에  = */
                    /* =  해당하는 값을 모두 더해주면 됩니다.                                       = */
                    /* =                                                                            = */
                    /* = ※ 필수                                                                    = */
                    /* =  KCP에 신청된 결제수단으로만 결제가 가능합니다.                            = */
                    /* = -------------------------------------------------------------------------- = */
%>
                    <tr>
                        <th>지불 방법</th>
                        <td>
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
                        </td>
                    </tr>
                    <!-- 주문번호(ordr_idxx) -->
                    <tr>
                        <th>주문 번호</th>
                        <td><input type="text" name="ordr_idxx" class="w200" value="" maxlength="40"/></td>
                    </tr>
                    <!-- 상품명(good_name) -->
                    <tr>
                        <th>상품명</th>
                        <td><input type="text" name="good_name" class="w100" value="운동화"/></td>
                    </tr>
                    <!-- 결제금액(good_mny) - ※ 필수 : 값 설정시 ,(콤마)를 제외한 숫자만 입력하여 주십시오. -->
                    <tr>
                        <th>결제 금액</th>
                        <td><input type="text" name="good_mny" class="w100" value="1004" maxlength="9"/>원(숫자만 입력)</td>
                    </tr>
                    <!-- 주문자명(buyr_name) -->
                    <tr>
                        <th>주문자명</th>
                        <td><input type="text" name="buyr_name" class="w100" value="홍길동"/></td>
                    </tr>
                    <!-- 주문자 E-mail(buyr_mail) -->
                    <tr>
                        <th>E-mail</th>
                        <td><input type="text" name="buyr_mail" class="w200" value="test@test.co.kr" maxlength="30" /></td>
                    </tr>
                    <!-- 주문자 연락처1(buyr_tel1) -->
                    <tr>
                        <th>전화번호</th>
                        <td><input type="text" name="buyr_tel2" class="w100" value="010-0000-0000"/></td>
                    </tr>
                    <!-- 휴대폰번호(buyr_tel2) -->
                    <tr>
                        <th>휴대폰번호</th>
                        <td><input type="text" name="buyr_tel2" class="w100" value="010-0000-0000"/></td>
                    </tr>
                    </table>
					   <!-- 결제 요청/처음으로 이미지 -->
                    <div class="btnset" id="display_pay_button" style="display:block">
                      <input name="" type="button" class="submit" value="결제요청" onclick="jsf__pay(this.form);"/>
                    </div>		
                    
                    <%
    /* ============================================================================== */
    /* =   2. 가맹점 필수 정보 설정                                                 = */
    /* = -------------------------------------------------------------------------- = */
    /* =   ※ 필수 - 결제에 반드시 필요한 정보입니다.                               = */
    /* =   site_conf_inc.jsp 파일을 참고하셔서 수정하시기 바랍니다.                 = */
    /* = -------------------------------------------------------------------------- = */
    // 요청종류 : 승인(pay)/취소,매입(mod) 요청시 사용
%>
    <input type="hidden" name="req_tx"          value="pay" />
    <input type="hidden" name="site_cd"         value="<%= g_conf_site_cd   %>" />
    <input type="hidden" name="site_name"       value="<%= g_conf_site_name %>" />
<%
    /*
       할부옵션 : Payplus Plug-in에서 카드결제시 최대로 표시할 할부개월 수를 설정합니다.(0 ~ 18 까지 설정 가능)
       ※ 주의  - 할부 선택은 결제금액이 50,000원 이상일 경우에만 가능, 50000원 미만의 금액은 일시불로만 표기됩니다
                  예) value 값을 "5" 로 설정했을 경우 => 카드결제시 결제창에 일시불부터 5개월까지 선택가능
    */
%>
    <input type="hidden" name="quotaopt"        value="12"/>
    <!-- 필수 항목 : 결제 금액/화폐단위 -->
    <input type="hidden" name="currency"        value="WON"/>
<%
    /* = -------------------------------------------------------------------------- = */
    /* =   2. 가맹점 필수 정보 설정 END                                             = */
    /* ============================================================================== */
%>

<%
    /* ============================================================================== */
    /* =   3. Payplus Plugin 필수 정보(변경 불가)                                   = */
    /* = -------------------------------------------------------------------------- = */
    /* =   결제에 필요한 주문 정보를 입력 및 설정합니다.                            = */
    /* = -------------------------------------------------------------------------- = */
%>
    <!-- PLUGIN 설정 정보입니다(변경 불가) -->
    <input type="hidden" name="module_type"     value="<%= module_type %>"/>
<!--
      ※ 필 수
          필수 항목 : Payplus Plugin에서 값을 설정하는 부분으로 반드시 포함되어야 합니다
          값을 설정하지 마십시오
-->
    <input type="hidden" name="res_cd"          value=""/>
    <input type="hidden" name="res_msg"         value=""/>
    <input type="hidden" name="enc_info"        value=""/>
    <input type="hidden" name="enc_data"        value=""/>
    <input type="hidden" name="ret_pay_method"  value=""/>
    <input type="hidden" name="tran_cd"         value=""/>
    <input type="hidden" name="use_pay_method"  value=""/>
	
	<!-- 주문정보 검증 관련 정보 : Payplus Plugin 에서 설정하는 정보입니다 -->
	<input type="hidden" name="ordr_chk"        value=""/>

    <!--  현금영수증 관련 정보 : Payplus Plugin 에서 설정하는 정보입니다 -->
    <input type="hidden" name="cash_yn"         value=""/>
    <input type="hidden" name="cash_tr_code"    value=""/>
    <input type="hidden" name="cash_id_info"    value=""/>

	<!-- 2012년 8월 18일 전자상거래법 개정 관련 설정 부분 -->
	<!-- 제공 기간 설정 0:일회성 1:기간설정(ex 1:2012010120120131)  -->
	<input type="hidden" name="good_expr" value="0">		
	</form> <!-- 폼끝 -->
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
</div>
<!-- Brand Area
============================================ -->



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


