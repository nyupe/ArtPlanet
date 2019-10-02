<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

 
<style>
.img {
 width: 800px !important; 
 height: 300px !important;
 max-width :100%;
 max-height: 100%;

 
}
.food__list__inner {
width: 1300px !important; 
 height: 300px !important;
 max-width :100%;
 max-height: 100%;
}
</style>

<!doctype html>

<html class="no-js" lang="zxx">



<head>
<!-- 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$('.art1 img').each(function(){
		$(this).css({
			"left": "50%",
			"margin-left": "-"+( $(this).width()/2 )+"px",
			"top": "50%",
			"margin-top": "-"+( $(this).height()/2 )+"px"
			});
			}); 
</script>-->
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Favicons -->
    <link rel="shortcut icon" href="<c:url value='/resources//artclass/images/favicon.ico'/>">
    <link rel="apple-touch-icon" href="<c:url value='/resources//artclass/images/icon.png'/>">

    <!-- Stylesheets -->
    <link rel="stylesheet" href="<c:url value='/resources/artclass/css/plugins.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/artclass/css/style.css'/>">

    <!-- Cusom css -->
    <link rel="stylesheet" href="<c:url value='/resources/artclass/css/custom.css'/>">

    <!-- Modernizer js -->
    <script src="<c:url value='/resources/artclass/js/vendor/modernizr-3.5.0.min.js'/>"></script>
</head>
<body>


        <!-- Start Menu Grid Area -->
        <div class="container">
        <section class="food__menu__grid__area section-padding--lg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="food__nav nav nav-tabs" role="tablist">
                	   <!-- 
                	    <li class="active" data-filter="*">all</li>
						<li data-filter=".weeding">일러스트 회화 </li>
						<li data-filter=".motion">애니메이션</li>
						<li data-filter=".portrait">디자인</li>
						<li data-filter=".fashion">캘리그라피</li>
						<li data-filter=".fashion">조소/공예</li>
					  일러스트 회화 애니메이션 디자인 캘리그라피 조소/공예	                   
                   -->
                   
                    <a class="active" id="nav-all-tab" data-toggle="tab" href="#nav-all" role="tab">전체보기</a>
                    <a id="nav-1-tab" data-toggle="tab" href="#nav-1" role="tab">민화,동양화</a>
                    <a id="nav-2-tab" data-toggle="tab" href="#nav-2" role="tab">팝아트,아크릴,인물화</a>
                    <a id="nav-3-tab" data-toggle="tab" href="#nav-3" role="tab">서예,캘리그라피</a>
                    <a id="nav-4-tab" data-toggle="tab" href="#nav-4" role="tab">드로잉,일러스트</a>
                    <a id="nav-5-tab" data-toggle="tab" href="#nav-5" role="tab">기타</a> 
                       
                    
                        </div>
                    </div> 
                </div>
               <div class="row mt--30">
            <div class="col-lg-12">
                <div class="fd__tab__content tab-content" id="nav-tabContent">
                    <!-- Start Single Content -->
                    <div class="food__list__tab__content tab-pane fade show active" id="nav-all" role="tabpanel">
                        <!-- Start Single Food -->
                        <div class="single__food__list d-flex wow fadeInUp">
                            <div  class="art1">
                                <a href="<c:url value='/View'/>">
                                    <img class="img" src="<c:url value='/resources/artclass/images/menu-list/7.jpg'/>" alt="images">
                                </a>
                            </div>
                            <div class="food__list__inner d-flex align-items-center justify-content-between">
                                <div class="food__list__details">
                                    <h2>  <a href="<c:url value='/View'/>">민화</a></h2>
                                    <p>민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화민화</p>
                                    <div class="list__btn">
                                        <a class="food__btn grey--btn theme--hover" href="<c:url value='/View'/>">상세 보기</a>
                                    </div>
                                </div>
                                <div class="food__rating">
                                    <div class="list__food__prize">
                                        <span>￦30,000</span>
                                    </div>
                                    <ul class="rating">
                                        <li><i class="zmdi zmdi-star"></i></li>
                                        <li><i class="zmdi zmdi-star"></i></li>
                                        <li><i class="zmdi zmdi-star"></i></li>
                                        <li><i class="zmdi zmdi-star"></i></li>
                                        <li class="rating__opasity"><i class="zmdi zmdi-star"></i></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- End Single Food -->
                         </div>
                           <!-- Start Single Content -->
                 <div class="food__list__tab__content tab-pane fade" id="nav-1" role="tabpanel">
                        <!-- Start Single Food -->
                        <div class="single__food__list d-flex wow fadeInUp">
                            <div  class="art1">
                                 <a href="<c:url value='/View'/>">
                                    <img class="img" src="<c:url value='/resources/artclass/images/menu-list/1.jpg'/>" alt="images">
                                </a>
                            </div>
                            <div class="food__list__inner d-flex align-items-center justify-content-between">
                                <div class="food__list__details">
                                    <h2>  <a href="<c:url value='/View'/>">동양화</a></h2>
                                    <p>동양화동양화동양화동양화동양화동양화동양화동양화동양화동양화동양화동양화동양화동양화동양화동양화동양화동양화동양화동양화</p>
                                    <div class="list__btn">
                                        <a class="food__btn grey--btn theme--hover" href="<c:url value='/View'/>">상세 보기</a>
                                    </div>
                                </div>
                                <div class="food__rating">
                                    <div class="list__food__prize">
                                        <span>￦30,000</span>
                                    </div>
                                    <ul class="rating">
                                        <li><i class="zmdi zmdi-star"></i></li>
                                        <li><i class="zmdi zmdi-star"></i></li>
                                        <li><i class="zmdi zmdi-star"></i></li>
                                        <li><i class="zmdi zmdi-star"></i></li>
                                        <li class="rating__opasity"><i class="zmdi zmdi-star"></i></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- End Single Food -->
                    </div>
                    <!-- End Single Content -->
                        
                            <!-- Start Single Content -->
                            <div class="food__list__tab__content tab-pane fade" id="nav-2" role="tabpanel">
   
                              <!-- Start Single Food -->
                        <div class="single__food__list d-flex wow fadeInUp">
                            <div  class="art1">
                                <a href="<c:url value='/View'/>">
                                    <img class='img' src="<c:url value='/resources/artclass/images/menu-list/12.jpg'/>" alt="images">
                                </a>
                            </div>
                            <div class="food__list__inner d-flex align-items-center justify-content-between">
                                <div class="food__list__details">
                                    <h2>  <a href="<c:url value='/View'/>">아크릴</a></h2>
                                    <p>아크릴아크릴아크릴아크릴아크릴아크릴아크릴아크릴아크릴아크릴아크릴아크릴아크릴아크릴아크릴아크릴아크릴아크릴아크릴아크릴아크릴.</p>
                                    <div class="list__btn">
                                        <a class="food__btn grey--btn theme--hover" href="<c:url value='/View'/>">상세 보기</a>
                                    </div>
                                </div>
                                <div class="food__rating">
                                    <div class="list__food__prize">
                                        <span>￦30,000</span>
                                    </div>
                                    <ul class="rating">
                                        <li><i class="zmdi zmdi-star"></i></li>
                                        <li><i class="zmdi zmdi-star"></i></li>
                                        <li><i class="zmdi zmdi-star"></i></li>
                                        <li><i class="zmdi zmdi-star"></i></li>
                                        <li class="rating__opasity"><i class="zmdi zmdi-star"></i></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- End Single Food -->
                            </div>
                            <!-- End Single Content -->
                            
                            <!-- Start Single Content -->
                    <div class="food__list__tab__content tab-pane fade" id="nav-3" role="tabpanel">
                   <!-- Start Single Food -->
                        <div class="single__food__list d-flex wow fadeInUp">
                            <div  class="art1">
                                  <a href="<c:url value='/View'/>">
                                    <img class="img" src="<c:url value='/resources/artclass/images/menu-list/13.jpg'/>" alt="images">
                                </a>
                            </div>
                            <div class="food__list__inner d-flex align-items-center justify-content-between">
                                <div class="food__list__details">
                                    <h2>  <a href="<c:url value='/View'/>">서예</a></h2>
                                    <p>서예서예서예서예서예서예서예서예서예서예서예서예서예서예서예서예서예서예서예서예서예서예서예서예서예서예서예서예서예서예서예서예서예</p>
                                    <div class="list__btn">
                                        <a class="food__btn grey--btn theme--hover" href="<c:url value='/View'/>">상세 보기</a>
                                    </div>
                                </div>
                                <div class="food__rating">
                                    <div class="list__food__prize">
                                        <span>￦10,000</span>
                                    </div>
                                    <ul class="rating">
                                        <li><i class="zmdi zmdi-star"></i></li>
                                        <li><i class="zmdi zmdi-star"></i></li>
                                        <li><i class="zmdi zmdi-star"></i></li>
                                        <li><i class="zmdi zmdi-star"></i></li>
                                        <li class="rating__opasity"><i class="zmdi zmdi-star"></i></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- End Single Food -->
                   <!-- Start Single Food -->
                        <div class="single__food__list d-flex wow fadeInUp">
                           <div  class="art1">
                                  <a href="<c:url value='/View'/>">
                                    <img class='img' src="<c:url value='/resources/artclass/images/menu-list/6.jpg'/>" alt="images">
                                </a>
                            </div>
                            <div class="food__list__inner d-flex align-items-center justify-content-between">
                                <div class="food__list__details">
                                    <h2>  <a href="<c:url value='/View'/>">캘리크라피</a></h2>
                                    <p>캘리크라피캘리크라피캘리크라피캘리크라피캘리크라피캘리크라피캘리크라피캘리크라피캘리크라피캘리크라피캘리크라피캘리크라피캘리크라피캘리크라피캘리크라피캘리크라피.</p>
                                    <div class="list__btn">
                                        <a class="food__btn grey--btn theme--hover" href="menu-details.html">상세 보기</a>
                                    </div>
                                </div>
                                <div class="food__rating">
                                    <div class="list__food__prize">
                                        <span>￦30,000</span>
                                    </div>
                                    <ul class="rating">
                                        <li><i class="zmdi zmdi-star"></i></li>
                                        <li><i class="zmdi zmdi-star"></i></li>
                                        <li><i class="zmdi zmdi-star"></i></li>
                                        <li><i class="zmdi zmdi-star"></i></li>
                                        <li class="rating__opasity"><i class="zmdi zmdi-star"></i></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- End Single Food -->
                    </div>
                    <!-- End Single Content -->
   <!-- Start Single Content -->
                    <div class="food__list__tab__content tab-pane fade" id="nav-4" role="tabpanel">
                        
                        <!-- Start Single Food -->
                        <div class="single__food__list d-flex wow fadeInUp">
                           <div  class="art1">
                                  <a href="<c:url value='/View'/>">
                                    <img class='img 'src="<c:url value='/resources/artclass/images/menu-list/9.jpg'/>" alt="images">
                                </a>
                            </div>
                            <div class="food__list__inner d-flex align-items-center justify-content-between">
                                <div class="food__list__details">
                                    <h2>  <a href="<c:url value='/View'/>">드로잉</a></h2>
                                    <p>드로잉드로잉드로잉드로잉드로잉드로잉드로잉드로잉드로잉드로잉드로잉드로잉드로잉드로잉드로잉드로잉드로잉드로잉드로잉드로잉드로잉드로잉드로잉</p>
                                    <div class="list__btn">
                                        <a class="food__btn grey--btn theme--hover" href="<c:url value='/View'/>">상세 보기</a>
                                    </div>
                                </div>
                                <div class="food__rating">
                                    <div class="list__food__prize">
                                        <span>￦30,000</span>
                                    </div>
                                    <ul class="rating">
                                        <li><i class="zmdi zmdi-star"></i></li>
                                        <li><i class="zmdi zmdi-star"></i></li>
                                        <li><i class="zmdi zmdi-star"></i></li>
                                        <li><i class="zmdi zmdi-star"></i></li>
                                        <li class="rating__opasity"><i class="zmdi zmdi-star"></i></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- End Single Food -->
                  <!-- Start Single Food -->
                        <div class="single__food__list d-flex wow fadeInUp">
                             <div  class="art1">
                                  <a href="<c:url value='/View'/>">
                                    <img class='img' src="<c:url value='/resources/artclass/images/menu-list/11.jpg'/>" alt="images">
                                </a>
                            </div>
                            <div class="food__list__inner d-flex align-items-center justify-content-between">
                                <div class="food__list__details">
                                    <h2>  <a href="<c:url value='/View'/>">일러스트</a></h2>
                                    <p>일러스트일러스트일러스트일러스트일러스트일러스트일러스트일러스트일러스트일러스트일러스트일러스트일러스트일러스트일러스트일러스트일러스트</p>
                                    <div class="list__btn">
                                        <a class="food__btn grey--btn theme--hover" href="<c:url value='/View'/>">상세 보기</a>
                                    </div>
                                </div>
                                <div class="food__rating">
                                    <div class="list__food__prize">
                                        <span>￦30,000</span>
                                    </div>
                                    <ul class="rating">
                                        <li><i class="zmdi zmdi-star"></i></li>
                                        <li><i class="zmdi zmdi-star"></i></li>
                                        <li><i class="zmdi zmdi-star"></i></li>
                                        <li><i class="zmdi zmdi-star"></i></li>
                                        <li class="rating__opasity"><i class="zmdi zmdi-star"></i></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- End Single Food -->
              
                    </div>
                    <!-- End Single Content -->
                               <!-- Start Single Content -->
                    <div class="food__list__tab__content tab-pane fade" id="nav-5" role="tabpanel">
                      
                        <!-- Start Single Food -->
                        <div class="single__food__list d-flex wow fadeInUp">
                           <div  class="art1">
                                 <a href="<c:url value='/View'/>">
                                    <img class='img' src="<c:url value='/resources/artclass/images/menu-list/10.jpg'/>" alt="images">
                                </a>
                            </div>
                            <div class="food__list__inner d-flex align-items-center justify-content-between">
                                <div class="food__list__details">
                                    <h2>  <a href="<c:url value='/View'/>">기타</a></h2>
                                    <p>기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타</p>
                                    <div class="list__btn">
                                        <a class="food__btn grey--btn theme--hover" href="<c:url value='/View'/>">상세 보기</a>
                                    </div>
                                </div>
                                <div class="food__rating">
                                    <div class="list__food__prize">
                                        <span>￦30,000</span>
                                    </div>
                                    <ul class="rating">
                                        <li><i class="zmdi zmdi-star"></i></li>
                                        <li><i class="zmdi zmdi-star"></i></li>
                                        <li><i class="zmdi zmdi-star"></i></li>
                                        <li><i class="zmdi zmdi-star"></i></li>
                                        <li class="rating__opasity"><i class="zmdi zmdi-star"></i></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- End Single Food -->
                       
                            
                            </div>
                        <!-- End Single Content -->
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <ul class="food__pagination d-flex justify-content-center align-items-center mt--130">
                            <li><a href="#"><i class="zmdi zmdi-chevron-left"></i></a></li>
                            <li><a href="#">1</a></li>
                            <li class="active"><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#">5</a></li>
                            <li><a href="#">...</a></li>
                            <li><a href="#">7</a></li>
                            <li><a href="#"><i class="zmdi zmdi-chevron-right"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>
          </div>
        <!-- End Menu Grid Area -->
       

	<!-- JS Files -->
<script src="<c:url value='/resources/artclass/js/vendor/jquery-3.2.1.min.js'/>"></script>
<script src="<c:url value='/resources/artclass/js/popper.min.js'/>"></script>
<script src="<c:url value='/resources/artclass/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/resources/artclass/js/plugins.js'/>"></script>
<script src="<c:url value='/resources/artclass/js/active.js'/>"></script>
</body>
</html>

