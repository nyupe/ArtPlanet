<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >

<head>
    <title>Art Planet - 관리자</title>
    <meta http-equiv="X-UA-Compatible" content="text/html;charset=utf-8">
     <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Language" content="en">
  <link
   href="${pageContext.request.contextPath}/resources/kero/main.07a59de7b920cd76b874.css" rel="stylesheet">
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> 
    <script>
    $(function(){
		
		$.ajax({
			url:"<c:url value='AdmBatchKeyList.ad'/>",
			dataType:'json',
			success:function(data){successAjax(data,'list');},
			error:function(request,error){
				console.log('상태코드:',request.status);
				console.log('서버로부터 받은 HTML데이타:',request.responseText);
				console.log('에러:',error);
			}
		});	
    });	///////////////
		
		var successAjax = function(data,id){
			console.log('서버로 부터 받은 배치키 데이타:',data);
			var tableString="<table style='width: 100%;' id='example' class='table table-hover table-striped table-bordered'>";
            tableString += "<thead><tr><th>번호</th><th>아이디(고유번호)</th><th>배치키</th><th>주문번호</th><th>응답코드</th><th>카드코드</th><th>주문자명</th></tr></thead>";
            tableString += "<tbody>";
            $.each(data,function(index,element){
					tableString+="<tr>";					
					tableString+="<td>"+(index+1)+"</td><td>"+element['memberno']+"</td><td>"+element['batch_key']+"</td><td>"+element['ordr_idxx']+"</td><td>"+element['res_cd']+
					"</td><td>"+element['card_cd']+"</td><td>"+element['buyr_name']+"</td>";			
					tableString+="</tr>";
				});
            tableString+="</tbody><tfoot><tr><th>No</th><th>memberno</th><th>batch_key</th><th>ordr_idxx</th><th>res_cd</th><th>card_cd</th><th>buyr_name</th></tr></tfoot></table>";		    
			    $('#'+id).html(tableString);
			};
	
	</script>
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
                                        <li><a href="AdmUserInfo.ad">가입회원</a></li>

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
                                     	<li><a href="AdmUserPay.ad">일반결제-취소가능</a></li>
                                     	<li><a href="AdmUserPay.ad">정기결제-배치키</a></li>
                                        <li><a href="AdmUserRecPay.ad">정기결제</a></li>
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
                            정기과금 관리
                            <div class="page-title-subheading">
                                정기과금관리 페이지입니다.
                            </div>
                        </div>
             
                        <div class="app-header-overlay d-none animated fadeIn"></div>
                    </div><!-- 앱 헤더 -->
          
                                         
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
                                                    
                                                    	 <div id=list></div>
                                                    	 <!-- 
                                                        <table style="width: 100%;" id="example"
                                                               class="table table-hover table-striped table-bordered">
                                                            <thead>
                                                            <tr>
                                                            	<th>번호</th>
                                                                <th>아이디</th>
                                                                <th>주문번호</th>
                                                                <th>주문자명</th>
                                                                <th>카드코드</th>
                                                                <th>배치키</th>
                                                                <th>결제시도일</th>
                                                                <th>카드사응답</th>
                            
                                                            </tr>
                                                            </thead>
                                                            <tbody>
                                                            <tr>
                                                            	<td>1</td>
                                                            	<td>KIM</td>
                                                                <td>20191010</td>
                                                                <td>김길동</td>
                                                                <td>CCLG</td>
                                                                <td>19102911457819EA</td>                                            
                                                                <td>2019/04/25</td>
                                                                <td>
                                                   					<button type="button" class="badge badge-pill badge-success" data-toggle="modal" data-target="#exampleModal">
                                                          			 성공
                                                    			    </button>
                                                    			</td>
                                                            </tr>
                                                   
                                                            </tbody>
                                                            <tfoot>
                                                            <tr>
                                                            	<th>No</th>
                                                            	<th>ID</th>
                                                            	<th>ordr_idxx</th>
                                                                <th>buyr_name</th>
                                                                <th>card_cd</th>
                                                                <th>batch_key</th>
                                                                <th>date</th>
                                                                <th>sucFail</th>
                                                              
                                                            </tr>
                                                            </tfoot>
                                                        </table>
                                                         -->
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
                        
   
    
   
    
    <!-- javascript -->
 	<script type="text/javascript" src="<c:url value='/resources/kero/assets/scripts/main.07a59de7b920cd76b874.js'/>"></script>
 	
	
</body>
</html>
