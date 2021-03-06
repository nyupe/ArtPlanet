<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >

<head>
<style>
th {
	text-align: center;
}
tr {
	text-align: center;
}
td {
	text-align: center;
}
</style>
    <title>Art Planet - 회원정보</title>
    <meta http-equiv="X-UA-Compatible" content="text/html;charset=utf-8">
     <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Language" content="en">
  <link
   href="${pageContext.request.contextPath}/resources/kero/main.07a59de7b920cd76b874.css" rel="stylesheet">
	<!-- chat.js CDN -->  
  <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</head>

<body oncontextmenu="return false;" ondragstart="return false;" onselectstart="return false;">
	
	
	<!-- 회원 테이블 데이터 가져오는 로직시작 -->
  	<script>	
  		
  		//진입점 시작
		$(function(){
			
			//페이지 로드시 회원목록 뿌려주기 
			showMembers();
			//추가로 월별회원 가입자수 뿌려주기 chartJS용
			showMemberTotal();
			//누적 가입자수 뿌려주기 chartJS용
			showAccumulated();
		})
		//진입점 끝
  		
		//회원목록 가져오는 함수 Ajax로 처리
		var showMembers = function(){
			$.ajax({
				url:"<c:url value='/getMemberList'/>",
				//스프링 씨큐리티 적용시(단, csrf적용시(Post방식)에만 서버에 CSRF토큰값도 같이 보내야한다)
				data:{'_csrf':'${_csrf.token}'},
				dataType:'json',
				type:'post',
				success:displayMembers
			});
		}/////showMembers
		
		var displayMembers = function(data){
			//회원리스트 찍어보기
			console.log(data);
			
			//테이블 헤드 <thead> 시작
			var tableString="<table style='width: 100%;' id='example' class='table table-hover table-striped table-bordered'>";
		 	tableString += "<thead><tr><th>회원번호</th><th>아이디</th><th>닉네임</th><th>이름</th><th>주소</th><th>연락처</th><th>생년월일</th><th>가입일</th><th>회원관리</th></tr></thead>";
		 	//테이블 헤드 <thead> 끝
		 	
		 	//테이블 바디 <tbody> 시작
			tableString += "<tbody>";
	   		
			// data : 회원리스트  / index : 리스트 인덱스 번호(0부터 시작) / element : 리스트에서 꺼낸 값(Map) 
	    	$.each(data,function(index,element){
	    		if(element['BIRTH'] == null) element['BIRTH']= "19900123";
	    		if(element['ID']!='ADMIN'){
					tableString+="<tr>";		
					//memberno
					tableString+="<td>"+element['MEMBERNO']+"</td><td>"+element['ID']+"</td><td>"+element['NICKNAME']+"</td><td>"+element['NAME']+
					"</td><td>"+element['ADDRESS']+"</td><td>"+element['PHONENUMBER']+"</td><td>"+element['BIRTH']+
					"</td><td>"+element['MEMBERSHIPDATE']+"</td>"
					tableString+="<td><button type='button' class='btn_Exile badge badge-pill badge-danger' title='"+element['ID']+"'  data-toggle='modal' data-target='#exampleModal'>추방</button></td>";
					tableString+="</tr>";
	    		}
			});
	    		
	    		tableString+="</tbody><tfooter></tfooter></table>";
	    	//테이블 바디 <tbody> 끝 	
	   		
	    	//테이블 삽입 
	    	$('#startMemberTable').html(tableString);
	    	
    	$('.btn_Exile').click(function(){
    		var confirmExile = confirm('정말로 추방시키겠습니까?')
    		
    		// 선택자로 지정한 객체(추방 버튼)의 title 속성값(id값)을 Map에 담아 컨트롤러로 넘겨줌 
    		if(confirmExile){//확인버튼 누를시 회원탈퇴 처리 
    			$.ajax({
    				url:"<c:url value='/DeleteMember'/>",
    				data:{'id':$(this).attr('title'),'_csrf':'${_csrf.token}'},
    				type:'post',
    				success:function(){
    					showMembers();
    				}
    			})/////$.ajax
    		}/////if 
    		
    	})/////$('#btn_Exile').click(function(){})
			
	}/////displayMembers
	    	
	
	var  showMemberTotal = function(){
		$.ajax({
			url:"<c:url value='/getMemberTotal'/>",
			dataType:'json',
			success:function(data){successAjax(data,'monthList');},
			error:function(request,error){
				console.log('상태코드:',request.status);
				console.log('서버로부터 받은 HTML데이타:',request.responseText);
				console.log('에러:',error);
			}
		});			
	}
	var month1, month2, month3, month4, month5, month6, month7, month8, month9, month10, month11, month12;
	var tot1=0, tot2=0, tot3=0, tot4=0, tot5=0, tot6=0, tot7=0, tot8=0, tot9=0, tot10=0, tot11=0, tot12=0;
	
	var successAjax = function(data,id){
		console.log('월+가입회원수 데이타:',data);
		  $.each(data,function(index,element){
			  console.log('뭐야 왜 undefined야?',element['month'])
			  switch(element['month']){
			  	case 1:
			  		 month1 = element['month'];
			  		 tot1 = element['tot'];		
			  		 break;
			  	case 2:
			  		 month2 = element['month'];
			  		 tot2 = element['tot'];
			  		 break;
			  	case 3:
			  		 month3 = element['month'];
			  		 tot3 = element['tot'];
			  		 break;
			  	case 4:
			  		 month4 = element['month'];
			  		 tot4 = element['tot'];
			  		 break;
			  	case 5:
			  		 month5 = element['month'];
			  		 tot5 = element['tot'];
			  		 break;
			  	case 6:
			  		 month6 = element['month'];
			  		 tot6 = element['tot'];
			  		 break;
			  	case 7:
			  		 month7 = element['month'];
			  		 tot7 = element['tot'];
			  		 break;
			  	case 8:
			  		 month8 = element['month'];
			  		 tot8 = element['tot'];
			  		 break;
			  	case 9:
			  		 month9 = element['month'];
			  		 tot9 = element['tot'];
			  		 break;
			  	case 10:
			  		 month10 = element['month'];
			  		 tot10 = element['tot'];
			  		 break;
			  	case 11:
					 month11 = 	element['month'];
					 tot11 = element['tot'];
					 break;
			  	case 12:
			  		 month12 = element['month'];
			  	     tot12 = element['tot'];
			  	     break;
			  	
			  }		
		  });	
		  
		  console.log("너는도대체몇월달찍히냐",month11);
		  console.log("너는도대체몇명찍히냐",tot11);
		    var ctx = document.getElementById('myChart').getContext('2d');
		    var myChart = new Chart(ctx, {
		       type: 'line',
		       data: {
		           labels: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		           datasets: [{
		               label: '#월별 신규회원수',
		               
		               data: [tot1,tot2,tot3,tot4,tot5,tot6,tot7,tot8,tot9,tot10,tot11,tot12], // 월별 신규가입회원수 조회
		               backgroundColor: [
		                   'rgba(255, 99, 132, 0.2)',
		                   /* 'rgba(54, 162, 235, 0.2)',
		                   'rgba(255, 206, 86, 0.2)',
		                   'rgba(75, 192, 192, 0.2)',
		                   'rgba(153, 102, 255, 0.2)',
		                   'rgba(255, 159, 64, 0.2)' */
		               ],
		               borderColor: [
		                   'rgba(255, 99, 132, 1)',
		                   /* 'rgba(54, 162, 235, 1)',
		                   'rgba(255, 206, 86, 1)',
		                   'rgba(75, 192, 192, 1)',
		                   'rgba(153, 102, 255, 1)',
		                   'rgba(255, 159, 64, 1)' */
		               ],
		               borderWidth: 1,
		               fill:false  
		           }]
		       },
		       options: {
		           scales: {
		        	   yAxes: [{
		                    ticks: {
		                        beginAtZero: true,	suggestedMax: 30, 
		                        callback: function (value) { if (Number.isInteger(value)) { return value; } },
		                        stepSize: 1
		                    }
		                }]
		           }
		       }
		    });
		    
		
		
		  
	};
	
	//도넛차트
	 var ctx2 = document.getElementById('myDoughnutChart').getContext('2d');
	// And for a doughnut chart
	var myDoughnutChart = new Chart(ctx2, {
	    type: 'doughnut',
	    data:  {
	        datasets: [{
	            data: [10, 20, 30]
	        }],

	        // These labels appear in the legend and in the tooltips when hovering different arcs
	        labels: [
	            'Red',
	            'Yellow',
	            'Blue'
	        ]
	    },
	    options: options
	});

	//누적 시작
	var  showAccumulated = function(){
		$.ajax({
			url:"<c:url value='/getAccumulated'/>",
			dataType:'json',
			success:function(data){successAjax2(data,'accList');},
			error:function(request,error){
				console.log('상태코드:',request.status);
				console.log('서버로부터 받은 HTML데이타:',request.responseText);
				console.log('에러:',error);
			}
		});			
	}
	
	var successAjax2 = function(data,id){
		console.log('누적회원 데이타:',data);
		  $.each(data,function(index,element){
			  
		  });
	
	};
	</script>
	<!-- 회원 테이블 데이터 가져오는 로직 끝 -->
	
	
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
					<!-- 차트테스트 -->
					<canvas id="myChart" width="20%" height="20%"></canvas> 
					<canvas id="myDoughnutChart" width="20%" height="20%"></canvas>
  				  </div>
					
                     
                                         
                   
                    <div class="app-inner-layout app-inner-layout-page">
                        <div class="app-inner-layout__wrapper">
                            <div class="app-inner-layout__content pt-1">
                                <div class="tab-content">
                                    <div class="container-fluid">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="main-card mb-3 card">
                                                    <div class="card-body">
                                                     	<div id="startMemberTable">
                                                     	<!-- 회원관리 테이블 시작 -->
                                                 			
                                                 			<!-- Ajax로 생성 -->
                                                 			
                                                        <!-- 회원가입 테이블 끝 -->
                                                       	</div>
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
  
    
   /* 	
   		왕수
   	 	var  arr = [12, 19, 3, 5, 2, 3];
   		var  arr2= [10,10,10]];
   		$.each(arr, function(index, element) {
   		arr2.push(arr[index]);
	}); */

			
	
			
	</script>
    
    <!-- javascript -->
 	<script type="text/javascript" src="<c:url value='/resources/kero/assets/scripts/main.07a59de7b920cd76b874.js'/>"></script>
 	
	
</body>
</html>
