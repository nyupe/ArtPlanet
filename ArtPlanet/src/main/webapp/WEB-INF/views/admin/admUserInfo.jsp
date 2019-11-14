<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >

<head>
    <title>Art Planet - 취소</title>
    <meta http-equiv="X-UA-Compatible" content="text/html;charset=utf-8">
     <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Language" content="en">
  <link
   href="${pageContext.request.contextPath}/resources/kero/main.07a59de7b920cd76b874.css" rel="stylesheet">
  
  
  <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
	
</head>
<body oncontextmenu="return false;" ondragstart="return false;" onselectstart="return false;">
	<!-- 케로 관리자UI -->
   	<div class="app-container app-theme-gray">
		  <div class="app-main">
            <!-- 왼쪽바 시작 -->
            <div class="app-sidebar-wrapper">
                <div class="app-sidebar sidebar-shadow">
                
                	<div>
                	<a class="navbar-brand logo_h" href="<c:url value='/Search/Artwork'/>"><img style="width: 200px; height: 86px;"
					src="<c:url value='/resources/img/logo.png'/>" alt="logo"></a>
					
                        <a href="#" data-toggle="tooltip" data-placement="bottom" title="KeroUI Admin Template" class="logo-src"></a>
                        <!-- 햄버거 네줄 
                        <button type="button" class="hamburger hamburger--elastic mobile-toggle-nav">
                                <span class="hamburger-box">
                                    <span class="hamburger-inner"></span>
                                </span>
                        </button>
                         -->
                    </div>
                    
                      <div class="scrollbar-sidebar scrollbar-container">
                        <div class="app-sidebar__inner">
                            <ul class="vertical-nav-menu">
                                <li class="app-sidebar__heading">Admin Menu</li>
                                  <li class="mm-active">
      
                                    <a href="#">
                                        <i class="metismenu-icon pe-7s-rocket"></i>
                                        	회원관리
                                        <i class="metismenu-state-icon pe-7s-angle-down caret-left"></i>
                                    </a>
                                    
                                    <ul>          
                                        <li><a href="<c:url value='/AdmUserInfo.ad'/>">가입회원</a></li>
                                    </ul>
                                 
                                  </li>
                                 
                                 <!-- 작품관리 -->
                                  <li class="mm-active">
      
                                    <a href="#">
                                        <i class="metismenu-icon pe-7s-rocket"></i>
                                        	결제관리
                                        <i class="metismenu-state-icon pe-7s-angle-down caret-left"></i>
                                    </a>
                                    
                                    <ul>          
                                    	<li><a href="<c:url value='/AdmUserPay.ad'/>">[ARTCLASS]일반결제</a></li>
                                     	<hr style="background-color:gray;height:1px; width:220px" />
                                     	<li><a href="<c:url value='/AdmUserBatch.ad'/>">[BLOG]정기결제-배치키</a></li>
                                        <li><a href="<c:url value='/RecurringPayOrder.do'/>">[BLOG]정기결제-관리자결제</a></li>
                                        <li><a href="<c:url value='/AdmUserRecPay.ad'/>">[BLOG]정기결제-결제내역</a></li>
                                        <hr style="background-color:gray;height:1px; width:220px" />
                                        <li><a href="<c:url value='/AdmUserProjBatch.ad'/>">[PROJECT]후원-배치키(일회성)</a></li>
                                        <li><a href="<c:url value='/ProjectPayOrder.do'/>">[PROJECT]후원-관리자결제</a></li>
                                        <li><a href="<c:url value='/AdmUserProjPay.ad'/>">[PROJECT]후원-결제내역</a></li>
                                        
                                    </ul>
                                 
                                  </li>
                                 
                                  <!-- 결제관리 -->
                                  <li class="mm-active">
      
                                    <a href="#">
                                        <i class="metismenu-icon pe-7s-rocket"></i>
                                        	작품관리
                                        <i class="metismenu-state-icon pe-7s-angle-down caret-left"></i>
                                    </a>
                                    
                                    <ul>          
                                       <li><a href="">프로젝트</a></li>
                                       <li><a href="">클래스</a></li>
                                    </ul>
                                 
                                  </li>
                                 
                                                                        
                                      
                            </ul>
                     		</div><!-- 앱 사이드바 이너 -->
                     	</div><!-- 스크롤바 사이드바 스크롤바 컨테이너 -->
                     
                     
                 	 </div><!-- 앱 사이드바 사이드바 섀도우 -->
              </div><!-- side bar 앱 사이드바 래퍼 -->
              
              <!-- 여기 -->
               <div class="app-main__outer">
                	<div class="app-header">
                        <div class="page-title-heading">
                            회원 관리
                            <div class="page-title-subheading">
                                회원관리 페이지입니다.
                            </div>
                        </div>
             
                        <div class="app-header-overlay d-none animated fadeIn"></div>
                    </div><!-- 앱 헤더 -->
          	
          	<!-- 구글API -->
          <!-- 	 <div id="chart_div" style="width: 900px; height: 500px;"></div> -->
                     
                  <!-- chart.js -->
                  <div  class="card-body" style="width:40%;margin:0 auto; ">
					<%-- <canvas id="chart_canvas" class="chartjs" style="display: block; width: 100%; height: 100%;"></canvas> --%>
					<!-- 차트테스트  -->
					<canvas id="myChart" width="20%" height="20%"></canvas>
  				  </div>

                     
                                         
                    <!-- dashboard 시작 -->
                    
                    <div class="app-inner-layout app-inner-layout-page">
                        <div class="app-inner-layout__wrapper">
                            <div class="app-inner-layout__content pt-1">
                                <div class="tab-content">
                                    <div class="container-fluid">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="main-card mb-3 card">
                                                    <div class="card-body">
                                                        <table style="width: 100%;" id="example"
                                                               class="table table-hover table-striped table-bordered">
                                                            <thead>
                                                            <tr>
                                                            	<th>번호</th>
                                                                <th>아이디</th>
                                                                <th>닉네임</th>
                                                                <th>이름</th>
                                                                <th>주소</th>
                                                                <th>연락처</th>
                                                                <th>생년월일</th>
                                                                <th>가입일</th>
                                                                <th>회원</th>
                                                            </tr>
                                                            </thead>
                                                            <tbody>
                                                            <tr>
                                                            	<td>1</td>
                                                            	<td>KIM</td>
                                                                <td>Tiger Nixon</td>
                                                                <td>김길동</td>
                                                                <td>서울특별시 금천구 가산동</td>
                                                                <td>01011112222</td>
                                                                <td>2011/04/25</td>
                                                                <td>2019/04/25</td>
                                                                <td><!-- Button trigger modal -->
                                                   					<button type="button" class="btn mr-2 mb-2 btn-primary" data-toggle="modal" data-target="#exampleModal">
                                                          			 탈퇴
                                                    			    </button>
                                                    			</td>
                                                            </tr>
                                                           
                                                           <tr>
                                                            	<td>2</td>
                                                            	<td>LEE</td>
                                                                <td>Nixon</td>
                                                                <td>이길동</td>
                                                                <td>대전광역시 서구</td>
                                                                <td>01011112222</td>
                                                                <td>1970/12/25</td>
                                                                <td>2019/10/25</td>
                                                                <td><!-- Button trigger modal -->
                                                   					<button type="button" class="btn mr-2 mb-2 btn-primary" data-toggle="modal" data-target="#exampleModal">
                                                          			 탈퇴
                                                    			    </button>
                                                    			</td>
                                                            </tr>
                                                            
                                                             <tr>
                                                            	<td>3</td>
                                                            	<td>Park</td>
                                                                <td>qqqq</td>
                                                                <td>박길동</td>
                                                                <td>부산광역시</td>
                                                                <td>01011112222</td>
                                                                <td>1990/05/25</td>
                                                                <td>2019/12/01</td>
                                                                <td><!-- Button trigger modal -->
                                                   					<button type="button" class="btn mr-2 mb-2 btn-primary" data-toggle="modal" data-target="#exampleModal">
                                                          			 탈퇴
                                                    			    </button>
                                                    			</td>
                                                            </tr>
                                                            
                                                            </tbody>
                                                            <tfoot>
                                                            <tr>
                                                            	<th>No</th>
                                                            	<th>ID</th>
                                                            	<th>Nick</th>
                                                                <th>Name</th>
                                                                <th>Addr</th>
                                                                <th>tell</th>
                                                                <th>Birth</th>
                                                                <th>Regidate</th>
                                                                <th>Ban</th>
                                                            </tr>
                                                            </tfoot>
                                                        </table>
                                                    </div><!-- 카드바디 -->
                                                </div>
                                            </div><!-- 다이브12 -->
                                        </div><!-- row -->
                                    </div><!-- 컨테이너플루이드 -->
                                </div><!-- 탭컨텐츠 -->
                			</div>
                		</div>
                	</div><!-- 앱이너레이아웃 -->
      
               
               </div><!-- app-main outer -->       
           </div><!-- app-main -->
     </div><!-- app-container gray -->   
                        
   
   	<script>
			var ctx = document.getElementById('myChart').getContext('2d');
			var myChart = new Chart(ctx, {
			    type: 'bar',
			    data: {
			        labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
			        datasets: [{
			            label: '# of Votes',
			            data: [12, 19, 3, 5, 2, 3],
			            backgroundColor: [
			                'rgba(255, 99, 132, 0.2)',
			                'rgba(54, 162, 235, 0.2)',
			                'rgba(255, 206, 86, 0.2)',
			                'rgba(75, 192, 192, 0.2)',
			                'rgba(153, 102, 255, 0.2)',
			                'rgba(255, 159, 64, 0.2)'
			            ],
			            borderColor: [
			                'rgba(255, 99, 132, 1)',
			                'rgba(54, 162, 235, 1)',
			                'rgba(255, 206, 86, 1)',
			                'rgba(75, 192, 192, 1)',
			                'rgba(153, 102, 255, 1)',
			                'rgba(255, 159, 64, 1)'
			            ],
			            borderWidth: 1
			        }]
			    },
			    options: {
			        scales: {
			            yAxes: [{
			                ticks: {
			                    beginAtZero: true
			                }
			            }]
			        }
			    }
			});
	</script>
    
    <!-- javascript -->
 	<script type="text/javascript" src="<c:url value='/resources/kero/assets/scripts/main.07a59de7b920cd76b874.js'/>"></script>
 	
	
</body>
</html>
