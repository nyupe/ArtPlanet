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
        /* FormOrJson�� ������ ���� Ȱ�� ����                               */
        /* frm ���� FormOrJson ���� ���� �� frm ������ Ȱ�� �ϼž� �˴ϴ�.  */
        /* FormOrJson ���� Ȱ�� �Ͻ÷��� ������������� ���ǹٶ��ϴ�.       */
        /********************************************************************/
        GetField( frm, FormOrJson ); 

        
        if( frm.res_cd.value == "0000" )
        {
		    alert("���� ���� ��û ��,\n\n�ݵ�� ����â���� ������ ���� ���� �Ϸ� ��\n\n���� ���� ordr_chk �� ��ü �� �ֹ�������\n\n�ٽ� �ѹ� ���� �� ���� ���� ��û�Ͻñ� �ٶ��ϴ�."); //��ü ���� �� �ʼ� Ȯ�� ����.
            /*
                ������ ���ϰ� ó�� ����
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
        /* �÷����� ��ġ(Ȯ��) */
        //kcpTx_install(); // Plugin ����â ȣ�� ����� ��� �����Ͻñ� �ٶ��ϴ�.

        /* Payplus Plug-in ���� */
        function jsf__pay( form )
        {
            try
            {
                KCP_Pay_Execute( form ); 
            }
            catch (e)
            {
                /* IE ���� ���� ��������� throw�� ��ũ��Ʈ ���� */ 
            }
        }             

        /* �ֹ���ȣ ���� */
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
			</div><!-- �ο� -->
		</div><!-- �����̳� -->
	</div><!-- ���ž -->
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
				</div><!-- ������ҷ� -->
			</div><!-- �ο� -->
		</div><!-- �����̳� -->
	</div><!-- ������� -->
</div><!--  Ŭ���� ��� ��  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
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
						1. �ּ��Է�</a>
						<div id="checkout-method" class="collapse in">
							<div class="accordion-body checkout-method fix">
								<div class="checkout-reg float-left">
									<h3>DB���� ����ͼ� ����Ʈ�ڽ� �ѷ��ֱ�</h3>
									<h4>�ּҸ� �����ϼ���</h4>
									<input type="radio" name="billing-info" id="ship-address"> <label for="ship-address">Ship to this address</label>
									
									<form action="#">
									<select>
										<option>����Ư���� ���굿 ��������з�14 ��浿</option>
										<option>����Ư���� ���α� ���ε� �ڱ浿</option>
									</select>
	
										<input type="radio" name="billing-info" id="different-address"> <label for="different-address">Ship to different address</label>
										<p>DB�� ������������� ���ο��ּ� <br />���� �ּҷ� API?</p>
										
										<a href="#" class="button color-hover">�ּҰ˻�</a>
										
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
						2. �����</a>
						<div id="billing-method" class="collapse">
							<div class="accordion-body billing-method fix">
								<p>����� �����Դϴ�</p>
								<form action="#">
								
									<button class="button color-hover">continiue</button>
								</form>
							</div>
						</div>
					</div>
					
					<!-- Payment Info -->
					<div class="panel single-accordion">
						<a class="accordion-head collapsed" data-toggle="collapse" data-parent="#checkout-accordion" href="#payment-info">
						2. ���������Է�</a>
						<div id="payment-info" class="collapse">
							<div class="accordion-body payment-info fix">
									<!-- PG��� ���� ����Ʈ�� �����ϱ� -->
									<form name="order_info" method="post" action="Hub.do" >
									<div class="input-box">
										<label>1. ���ҹ��</label>
										<select name="pay_method">
											<option value="100000000000">�ſ�ī��</option>
			                                <option value="010000000000">������ü</option>
			                                <option value="001000000000">�������</option>
			                                <option value="000100000000">����Ʈ</option>
			                                <option value="000010000000">�޴���</option>
			                                <option value="000000001000">��ǰ��</option>
			                                <option value="000000000010">ARS</option>
			                                <option value="111000000000">�ſ�ī��/������ü/�������</option>
										</select>
									</div>
						
									<div class="input-box">
										<label for="card-name">2. �ֹ���ȣ</label>
										<input type="text" name="ordr_idxx" value="TEST1234" maxlength="40" />
									</div>
									
									<div class="input-box">
										<label for="card-name">3. ��ǰ��</label>
										<input type="text" name="good_name"  value="������ �׸�����"/>
									</div>
									
									<div class="input-box">
										<label for="card-name">4. �����ݾ�</label>
										<input type="text" name="good_mny"  value="1004" maxlength="9"/>��(���ڸ� �Է�)
									</div>
									
									<div class="input-box">
										<label for="card-name">5. �ֹ��ڸ�</label>
										<input type="text" name="buyr_name"  value="���浿" />
									</div>
									
									<div class="input-box">
										<label for="card-name">6. E-mail</label>
										<input type="text" name="buyr_mail"  value="test@test.co.kr" maxlength="30"/>
									</div>
									
									<div class="input-box">
										<label for="card-name">7. ��ȭ��ȣ</label>
										<input type="text" name="buyr_tel2"  value="010-0000-0000"/>
									</div>
									
									<div class="input-box">
										<label for="card-name">8. �޴�����ȣ</label>
										<input type="text" name="buyr_tel2"  value="010-0000-0000"/>
									</div>
									
										<button class="button color-hover" class="submit" onclick="jsf__pay(this.form);" >������û</button>
										 
									<!-- ������û ��ư -->
									<input name="button" type="button" class="submit" value="������û" onclick="jsf__pay(this.form);"/>
     							    <!-- ����Ÿ�� ���������� -->
     							    <input type="hidden" name="req_tx"          value="pay" />
    								<input type="hidden" name="site_cd"         value="<%= g_conf_site_cd   %>" />
    								<input type="hidden" name="site_name"       value="<%= g_conf_site_name %>" />
    								<input type="hidden" name="quotaopt"        value="12"/>
    								<input type="hidden" name="currency"        value="WON"/>
    								<!-- �ʼ�����(����Ұ�) -->
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
						</form> <!-- ���� -->
									
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
									
									<a href="#">�ѱ۱��� ?</a>
								
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