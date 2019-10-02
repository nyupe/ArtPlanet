<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<style>
.img {
 width: 150px !important; 
 height: 150px !important;
 max-width :100%;
 max-height: 100%;

 
}
.img1 {
 width: 250px !important; 
 height: 250px !important;
 max-width :100%;
 max-height: 100%;

 
}
.img2 {
 width: 300px !important; 
 height: 300px !important;
 max-width :100%;
 max-height: 100%;

 
}

</style>




<!doctype html>
<html class="no-js" lang="zxx">
<head>
	<meta charset="utf-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>아트 클래스</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- Favicons -->
	<link rel="shortcut icon" href="images/favicon.ico">
	<link rel="apple-touch-icon" href="images/icon.png">

	<!-- Stylesheets -->
	<link rel="stylesheet" href="<c:url value='/resources/artclass/css/plugins.css'/>">
	<link rel="stylesheet" href="<c:url value='/resources/artclass/css/style.css'/>">

	<!-- Cusom css -->
   <link rel="stylesheet" href="<c:url value='/resources/artclass/css/custom.css'/>">

	
    <!-- Font Awesome -->
    <link href="<c:url value='/resources/template/vendors/font-awesome/css/font-awesome.min.css'/>" rel="stylesheet">
   
    <!-- bootstrap-daterangepicker -->
    <link href="<c:url value='/resources/template/vendors/bootstrap-daterangepicker/daterangepicker.css'/>" rel="stylesheet">
    <!-- bootstrap-datetimepicker -->
    <link href="<c:url value='/resources/template/vendors/bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.css'/>" rel="stylesheet">
  
   
    





</head>
<body>
	<!--[if lte IE 9]>
		<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
	<![endif]-->

       
        <!-- Start Blog List View Area -->
        <section class="blog__list__view section-padding--lg menudetails-right-sidebar bg--white">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-md-12 col-sm-12">
                        <div class="food__menu__container">
                            <div class="food__menu__inner d-flex flex-wrap flex-md-nowrap flex-lg-nowrap">
                                <div class="thumb">
                                  <img class='img2'src="<c:url value='/resources/artclass/images/menu-list/1.jpg'/>" alt="images">
                                 
                                 </div> <!-- class=thumb -->
                                <div class="food__menu__details">
                                    <div class="food__menu__content">
                                        <h2>민화</h2>
                                        <ul class="food__dtl__prize d-flex">
                                            
                                            <li>￦30,000</li>
                                        </ul>
                                       
                                        <p>민화 클래스입니다.</p>
                                        <div class="product-action-wrap">
                                            <div class="prodict-statas"><span>민화예요</span><button>  <a href="<c:url value='/TextArea'/>"> 수정</a></button>   </div>
                                           <div class="input-prepend input-group">
                                		   <span class="add-on input-group-addon"><i class="glyphicon glyphicon-calendar fa fa-calendar"></i></span>
                               			   <input type="text" name="reservation-time" id="reservation-time" class="form-control" value="01/01/2016 - 01/25/2016" />
                              				  </div>
                                           
                                            <div class="product-quantity">
                                                <form id='myform' method='POST' action='#'>
                                                    <div class="product-quantity">
                                                        
                                                            
                                                            <div class="add__to__cart__btn">
                                                                <a class="food__btn" href="cart.html">Add To Cart</a>
                                                            </div>
                                                        
                                                       
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Start Product Descrive Area -->
                            <div class="menu__descrive__area">
                                <div class="menu__nav nav nav-tabs" role="tablist">
                                    <a class="active" id="nav-all-tab" data-toggle="tab" href="#nav-all" role="tab">Description</a>
                                    <a id="nav-breakfast-tab" data-toggle="tab" href="#nav-breakfast" role="tab">Reviews</a>
                                </div>
                                <!-- Start Tab Content -->
                                <div class="menu__tab__content tab-content" id="nav-tabContent">
                                    <!-- Start Single Content -->
                                    <div class="single__dec__content fade show active" id="nav-all" role="tabpanel">
                                        <p>민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화</p>
                                        <p>민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화
                                  <strong>“민화 ”</strong> 민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화</p>
                                    </div>
                                    <!-- End Single Content -->
                                    <!-- Start Single Content -->
                                    <div class="single__dec__content fade" id="nav-breakfast" role="tabpanel">
                                        <div class="review__wrapper">
                                            <!-- Start Single Review -->
                                            <div class="single__review d-flex">
                                                <div class="review__thumb">
                                                    <img src="images/testimonial/rev/1.jpg" alt="review images">
                                                </div>
                                                <div class="review__details">
                                                    <h3>민화 조아요</h3>
                                                    <div class="rev__meta d-flex justify-content-between">
                                                        <span>Admin - February  13,  2018</span>
                                                        <ul class="rating">
                                                            <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                                            <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                                            <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                                            <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                                            <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                                        </ul>
                                                    </div>
                                                    <p>민화 잘배웠습니다.</p>
                                                </div>
                                            </div>
                                            <!-- End Single Review -->
                                            <!-- Start Single Review -->
                                            <div class="single__review d-flex">
                                                <div class="review__thumb">
                                                    <img src="images/testimonial/rev/2.jpg" alt="review images">
                                                </div>
                                                <div class="review__details">
                                                    <h3>민화 싫어요</h3>
                                                    <div class="rev__meta d-flex justify-content-between">
                                                        <span>Admin - February  13,  2018</span>
                                                        <ul class="rating">
                                                            <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                                            <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                                       
                                                        </ul>
                                                    </div>
                                                    <p>너무 실망입니다.</p>
                                                </div>
                                            </div>
                                            <!-- End Single Review -->
                                        </div>
                                    </div>
                                    <!-- End Single Content -->
                                </div>
                                <!-- End Tab Content -->
                            </div>
                            <!-- End Product Descrive Area -->
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="popupal__menu">
                                    <h4>인기있는 항목</h4>
                                </div>
                            </div>
                        </div>
                        <div class="row mt--30">
                           
                             <!-- Start Single Product -->
                            <div class="col-lg-4 col-md-6 col-sm-12">
                                <div class="beef_product">
                                    <div class="beef__thumb">
                                        <a href="menu-details.html">
                                            <img class='img1' src=" <c:url value='/resources/artclass/images/menu-list/1.jpg'/>" alt="beef images">
                                        </a>
                                    </div>
                                   
                                   
                                    <div class="beef__details">
                                        <h4><a href="menu-details.html">서예</a></h4>
                                        <ul class="beef__prize">
                                            <li class="old__prize">￦30,000</li>
                                            <li>￦30,000</li>
                                        </ul>
                                        <p>동양화와 함께해요 동양화와 함께해요</p>
                                        <div class="beef__cart__btn">
                                            <a href="cart.html">배우러 가기</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- End Single Product -->
                       <!-- Start Single Product -->
                            <div class="col-lg-4 col-md-6 col-sm-12">
                                <div class="beef_product">
                                    <div class="beef__thumb">
                                        <a href="menu-details.html">
                                             <img class='img1' src=" <c:url value='/resources/artclass/images/menu-list/1.jpg'/>" alt="beef images">
                                        </a>
                                    </div>
                                   
                                   
                                    <div class="beef__details">
                                        <h4><a href="menu-details.html">기타</a></h4>
                                        <ul class="beef__prize">
                                            <li class="old__prize">￦30,000</li>
                                            <li>￦30,000</li>
                                        </ul>
                                        <p>동양화와 함께해요 동양화와 함께해요</p>
                                        <div class="beef__cart__btn">
                                            <a href="cart.html">배우러 가기</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- End Single Product -->
                           
                           
                            <!-- Start Single Product -->
                            <div class="col-lg-4 col-md-6 col-sm-12">
                                <div class="beef_product">
                                    <div class="beef__thumb">
                                        <a href="menu-details.html">
                                            <img class='img1' src=" <c:url value='/resources/artclass/images/menu-list/1.jpg'/>" alt="beef images">
                                        </a>
                                    </div>
                                   
                                   
                                    <div class="beef__details">
                                        <h4><a href="menu-details.html">동양화</a></h4>
                                        <ul class="beef__prize">
                                            <li class="old__prize">￦30,000</li>
                                            <li>￦30,000</li>
                                        </ul>
                                        <p>동양화와 함께해요 동양화와 함께해요</p>
                                        <div class="beef__cart__btn">
                                            <a href="cart.html">배우러 가기</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- End Single Product -->
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12 col-sm-12 md--mt--40 sm--mt--40">
                        <div class="food__sidebar">
                             
                               <!-- Start Category Area -->
                           
                            <div class="food__category__area mt--60">
                                <h4 class="side__title">Categories</h4>
                                <ul class="food__category">
                                    <li><a href="#">민화,동양화 <span>(20)</span></a></li>
                                    <li><a href="#">팝아트,아크릴,인물화 <span>(30)</span></a></li>
                                    <li><a href="#">서예,캘리그라피 <span>(40)</span></a></li>
                                    <li><a href="#">드로잉,일러스트 <span>(50)</span></a></li>
                                    <li><a href="#">기타 <span>(60)</span></a></li>
                                    
                                </ul>
                            </div>
                            <!-- End Category Area -->
                            <!-- Start Recent Post -->
                            <div class="food__recent__post mt--60">
                                <h4 class="side__title">최근 아트 클래스</h4>
                                <div class="recent__post__wrap">
                                    <!-- Start Single Post -->
                                    <div class="single__recent__post d-flex">
                                        <div class="recent__post__thumb">
                                            <a href="blog-details.html">
                                              <img class='img' src=" <c:url value='/resources/artclass/images/menu-list/1.jpg'/>" alt="beef images">
                                            </a>
                                        </div>
                                        <div class="recent__post__details">
                                            <span>2019년 9월13일 금요일</span>
                                            <h4><a href="blog-details.html">보고가세요.</a></h4>
                                        </div>
                                    </div>
                                    <!-- End Single Post -->
                                    <!-- Start Single Post -->
                                    <div class="single__recent__post d-flex">
                                        <div class="recent__post__thumb">
                                            <a href="blog-details.html">
                                                <img class='img' src=" <c:url value='/resources/artclass/images/menu-list/1.jpg'/>" alt="beef images">
                                            </a>
                                        </div>
                                        <div class="recent__post__details">
                                            <span>2019년 9월13일 금요일</span>
                                            <h4><a href="blog-details.html">보고 가세요</a></h4>
                                        </div>
                                    </div>
                                    <!-- End Single Post -->
                                    <!-- Start Single Post -->
                                    <div class="single__recent__post d-flex">
                                        <div class="recent__post__thumb">
                                            <a href="blog-details.html">
                                               <img class='img' src=" <c:url value='/resources/artclass/images/menu-list/1.jpg'/>" alt="beef images">
                                            </a>
                                        </div>
                                        <div class="recent__post__details">
                                            <span>February  13,  2019</span>
                                            <h4><a href="blog-details.html">보고 가세요.</a></h4>
                                        </div>
                                    </div>
                                    <!-- End Single Post -->
                                    <!-- Start Single Post -->
                                    <div class="single__recent__post d-flex">
                                        <div class="recent__post__thumb">
                                            <a href="blog-details.html">
                                               <img class='img' src=" <c:url value='/resources/artclass/images/menu-list/1.jpg'/>" alt="beef images">
                                            </a>
                                        </div>
                                        <div class="recent__post__details">
                                            <span>February  15,  2019</span>
                                            <h4><a href="blog-details.html">보고 가세요.</a></h4>
                                        </div>
                                    </div>
                                    <!-- End Single Post -->
                                </div>
                            </div>
                            <!-- End Recent Post -->
                        
                           
                           
                          
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Blog List View Area -->
       

        <!-- Login Form -->
        <div class="accountbox-wrapper">
            <div class="accountbox text-left">
                <ul class="nav accountbox__filters" id="myTab" role="tablist">
                    <li>
                        <a class="active" id="log-tab" data-toggle="tab" href="#log" role="tab" aria-controls="log" aria-selected="true">Login</a>
                    </li>
                    <li>
                        <a id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Register</a>
                    </li>
                </ul>
                <div class="accountbox__inner tab-content" id="myTabContent">
                    <div class="accountbox__login tab-pane fade show active" id="log" role="tabpanel" aria-labelledby="log-tab">
                        <form action="#">
                            <div class="single-input">
                                <input class="cr-round--lg" type="text" placeholder="User name or email">
                            </div>
                            <div class="single-input">
                                <input class="cr-round--lg" type="password" placeholder="Password">
                            </div>
                            <div class="single-input">
                                <button type="submit" class="food__btn"><span>Go</span></button>
                            </div>
                            <div class="accountbox-login__others">
                                <h6>Or login with</h6>
                                <div class="social-icons">
                                    <ul>
                                        <li class="facebook"><a href="https://www.facebook.com/"><i class="fa fa-facebook"></i></a></li>
                                        <li class="twitter"><a href="https://twitter.com/"><i class="fa fa-twitter"></i></a></li>
                                        <li class="pinterest"><a href="#"><i class="fa fa-google-plus"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="accountbox__register tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                        <form action="#">
                            <div class="single-input">
                                <input class="cr-round--lg" type="text" placeholder="User name">
                            </div>
                            <div class="single-input">
                                <input class="cr-round--lg" type="email" placeholder="Email address">
                            </div>
                            <div class="single-input">
                                <input class="cr-round--lg" type="password" placeholder="Password">
                            </div>
                            <div class="single-input">
                                <input class="cr-round--lg" type="password" placeholder="Confirm password">
                            </div>
                            <div class="single-input">
                                <button type="submit" class="food__btn"><span>Sign Up</span></button>
                            </div>
                        </form>
                    </div>
                    <span class="accountbox-close-button"><i class="zmdi zmdi-close"></i></span>
                </div>
            </div>
        </div><!-- //Login Form -->
            <!-- Cartbox -->
        <div class="cartbox-wrap">
            <div class="cartbox text-right">
                <button class="cartbox-close"><i class="zmdi zmdi-close"></i></button>
                <div class="cartbox__inner text-left">
                    <div class="cartbox__items">
                        <!-- Cartbox Single Item -->
                        <div class="cartbox__item">
                            <div class="cartbox__item__thumb">
                                <a href="product-details.html">
                                    <img src="images/blog/sm-img/1.jpg" alt="small thumbnail">
                                </a>
                            </div>
                            <div class="cartbox__item__content">
                                <h5><a href="product-details.html" class="product-name">민화</a></h5>
                                <p>Qty: <span>01</span></p>
                                <span class="price">$15</span>
                            </div>
                            <button class="cartbox__item__remove">
                                <i class="fa fa-trash"></i>
                            </button>
                        </div><!-- //Cartbox Single Item -->
                        <!-- Cartbox Single Item -->
                        <div class="cartbox__item">
                            <div class="cartbox__item__thumb">
                                <a href="product-details.html">
                                    <img src="images/blog/sm-img/2.jpg" alt="small thumbnail">
                                </a>
                            </div>
                            <div class="cartbox__item__content">
                                <h5><a href="product-details.html" class="product-name">Wheat Bread</a></h5>
                                <p>Qty: <span>01</span></p>
                                <span class="price">$25</span>
                            </div>
                            <button class="cartbox__item__remove">
                                <i class="fa fa-trash"></i>
                            </button>
                        </div><!-- //Cartbox Single Item -->
                        <!-- Cartbox Single Item -->
                        <div class="cartbox__item">
                            <div class="cartbox__item__thumb">
                                <a href="product-details.html">
                                    <img src="images/blog/sm-img/3.jpg" alt="small thumbnail">
                                </a>
                            </div>
                            <div class="cartbox__item__content">
                                <h5><a href="product-details.html" class="product-name">Mixed Fruits Pie</a></h5>
                                <p>Qty: <span>01</span></p>
                                <span class="price">￦30,000</span>
                            </div>
                            <button class="cartbox__item__remove">
                                <i class="fa fa-trash"></i>
                            </button>
                        </div><!-- //Cartbox Single Item -->
                    </div>
                    <div class="cartbox__total">
                        <ul>
                            <li><span class="cartbox__total__title">Subtotal</span><span class="price">$70</span></li>
                            <li class="shipping-charge"><span class="cartbox__total__title">Shipping Charge</span><span class="price">￦30,000</span></li>
                            <li class="grandtotal">Total<span class="price">￦30,000</span></li>
                        </ul>
                    </div>
                    <div class="cartbox__buttons">
                        <a class="food__btn" href="cart.html"><span>View cart</span></a>
                        <a class="food__btn" href="checkout.html"><span>Checkout</span></a>
                    </div>
                </div>
            </div>
        </div><!-- //Cartbox -->   
	</div>
	<!-- //Main wrapper -->

	<!-- JS Files -->
	<script src="<c:url value='/resources/artclass/js/vendor/jquery-3.2.1.min.js'/>"></script>
	<script src="<c:url value='/resources/artclass/js/popper.min.js'/>"></script>
	<script src="<c:url value='/resources/artclass/js/bootstrap.min.js'/>"></script>
	<script src="<c:url value='/resources/artclass/js/plugins.js'/>"></script>
	<script src="<c:url value='/resources/artclass/js/active.js'/>"></script>
   <!-- 추가 -->
<!-- jQuery -->
    <script src="<c:url value='/resources/template/vendors/jquery/dist/jquery.min.js'/>"></script>
    <!-- Bootstrap -->
    <script src="<c:url value='/resources/template/vendors/bootstrap/dist/js/bootstrap.min.js'/>"></script>
    <!-- FastClick -->
    <script src="<c:url value='/resources/template/vendors/fastclick/lib/fastclick.js'/>"></script>
    <!-- NProgress -->
    <script src="<c:url value='/resources/template/vendors/nprogress/nprogress.js'/>"></script>
    <!-- bootstrap-daterangepicker -->
    <script src="<c:url value='/resources/template/vendors/moment/min/moment.min.js'/>"></script>
    <script src="<c:url value='/resources/template/vendors/bootstrap-daterangepicker/daterangepicker.js'/>"></script>
    <!-- bootstrap-datetimepicker -->    
    <script src="<c:url value='/resources/template/vendors/bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js'/>"></script>
    <!-- Ion.RangeSlider -->
    <script src="<c:url value='/resources/template/vendors/ion.rangeSlider/js/ion.rangeSlider.min.js'/>"></script>
    <!-- Bootstrap Colorpicker -->
    <script src="<c:url value='/resources/template/vendors/mjolnic-bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js'/>"></script>
    <!-- jquery.inputmask -->
    <script src="<c:url value='/resources/template/vendors/jquery.inputmask/dist/min/jquery.inputmask.bundle.min.js'/>"></script>
    <!-- jQuery Knob -->
    <script src="<c:url value='/resources/template/vendors/jquery-knob/dist/jquery.knob.min.js'/>"></script>
    <!-- Cropper -->
    <script src="<c:url value='/resources/template/vendors/cropper/dist/cropper.min.js'/>"></script>
    <!-- Custom Theme Scripts -->
    <script src="<c:url value='/resources/template/build/js/custom.min.js'/>"></script>
    
    <!-- Initialize datetimepicker -->
     <script>
    $('#myDatepicker').datetimepicker();
    
    $('#myDatepicker2').datetimepicker({
        format: 'DD.MM.YYYY'
    });
    
    $('#myDatepicker3').datetimepicker({
        format: 'hh:mm A'
    });
    
    $('#myDatepicker4').datetimepicker({
        ignoreReadonly: true,
        allowInputToggle: true
    });

    $('#datetimepicker6').datetimepicker();
    
    $('#datetimepicker7').datetimepicker({
        useCurrent: false
    });
    
    $("#datetimepicker6").on("dp.change", function(e) {
        $('#datetimepicker7').data("DateTimePicker").minDate(e.date);
    });
    
    $("#datetimepicker7").on("dp.change", function(e) {
        $('#datetimepicker6').data("DateTimePicker").maxDate(e.date);
    });
</script>





</body>
</html>
