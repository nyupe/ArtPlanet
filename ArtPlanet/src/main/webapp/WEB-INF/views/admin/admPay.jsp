<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
 
<!-- 아이디 얻어서 var에 지정한 변수 id저장  페이지내에서 EL 사용하여 (ex. ${id} )아이디값 사용가능-->
<sec:authentication property="principal.username" var="id" />
<%
	request.setCharacterEncoding ("utf-8");
 
    /* ============================================================================== */
    /* =   PAGE : 취소모듈 PAGE                                                    = */
    /* = -------------------------------------------------------------------------- = */
    /* =   Copyright (c)  2013   KCP Inc.   All Rights Reserved.                    = */
    /* ============================================================================== */
%>
 
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
    <title>Art Planet - 관리자</title>
    <meta http-equiv="X-UA-Compatible" content="text/html;charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Language" content="en">
    <link href="${pageContext.request.contextPath}/resources/kero/main.07a59de7b920cd76b874.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> 
    <script type="text/javascript">
 
    var todayTime;
    var cancelButtonShow =0;
    var todayOrderCount;
    var todayOrderMoney = 0;
			function  jsf__go_mod( form )
		    {
		        if ( form.tno.value.length < 14 )
		        {
		            alert( "KCP 거래 번호 14자리를 입력하세요" );
		            form.tno.focus();
		            form.tno.select();
		            return false;
		        }
				  else
		        {
		            return true;
		        }
			}
			function  sub_cancel_chk( val )
		    {
		        if( val == "STPC")
		        {
		            show_sub_cancel.style.display = "block";
		        }
		        else
		        {
		            show_sub_cancel.style.display = "none";
		        }
		    }
			
			// 취소 카운트
 
			$(function(){
				 	todayTime = new Date();
				    var getYear =  todayTime.getFullYear();
				    var getMonth  = todayTime.getMonth()+1;
				    var getDate = todayTime.getDate();
				    getDate = getDate >= 10 ? getDate : '0' + getDate;
				   console.log(todayTime);
				   todayTime = getYear+""+getMonth+""+getDate;
				   console.log("TodayTime",todayTime); 
				   console.log("getYear",getYear); 
				   console.log("getMonth",getMonth); 
				   console.log("getDate",getDate); 
				   
				/*
				//취소카운트
				$.ajax({
					url:"<c:url value='CancelCount.do'/>",
					dataType: 'text',
					type:'get',
					data:,
					success:function(data){successAjax2(data,'cancelButtonShow');},
					error:function(request,error){
						console.log('상태코드:',request.status);
						console.log('취소카운트데이터:',request.responseText);
						console.log('에러:',error);
					}
				});			
				
				var successAjax2 = function(data,id){
					console.log('서버로 부터 받은 cancelButtonShow 0or1 데이타:',data);
				
				}
				*/
				////////////////////////////
				$.ajax({
					url:"<c:url value='AdmUserPayList.ad'/>",
					dataType:'json',
					success:function(data){successAjax(data,'list');},
					error:function(request,error){
						console.log('상태코드:',request.status);
						console.log('서버로부터 받은 HTML데이타:',request.responseText);
						console.log('에러:',error);
					}
				});			
 
						//없어도됨 작동안됨
				 		//var kim;
						//var clickBtn2 = $('.cancel').click(function(){
						//	var  btnIndex  = clickBtn.index(this);
						//		console.log('index : ',clickBtn.index(this));
							
						//	console.log($(this).parent().prev().text());
						//	kim = $(this).parent().prev().text();
						//	$('#tno').val(kim);
						
						
						//	}); ///  clickBtn
						
			});  // onload
			
			//거래번호 모달옮기기
			 var clickBtn = function(e){
				document.getElementById('tno').value = e.parentNode.previousSibling.innerHTML;
			};
			
			//원화 세자리씩 끊어주기함수
			function numberWithCommas(x) {
			    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			}
 
 
			var successAjax = function(data,id){
				console.log('서버로 부터 받은 데이타:',data);
				/*JSON배열을 출력할때는 $.each(data,function(index,index에 따른 요소값){}); 
				사용]
				data:서버로부터 전송받은 데이타(JSON배열타입)
				index:JSON배열의 인덱스(0부터 시작)	
				index에 따른 요소값:JSON배열에서 하나씩 꺼내온거를 담은 인자		
			*/
				
				var tableString="<table style='width: 100%;' id='example' class='table table-hover table-striped table-bordered'>";
               tableString += "<thead><tr><th>번호</th><th>결제금액</th><th>주문번호</th><th>주문자명</th><th>이메일주소</th><th>연락처</th><th>결제일</th><th>카드사</th><th>거래번호</th><th>취소</th></tr></thead>";
               tableString += "<tbody>";
               var totalOrderCount = 0;
               var totalOrderMoney = 0;
               var totalCancelMoney =0;
               todayOrderCount = 0;
               
               $.each(data,function(index,element){
            	   totalOrderCount++;
            	   totalOrderMoney += parseInt(element['amount']);
            	   console.log(totalOrderMoney);
            	   console.log('if 들어가기 전');
					tableString+="<tr>";		
					//memberno
					tableString+="<td>"+(index+1)+"</td><td>"+numberWithCommas(element['amount'])+"원</td><td>"+element['ordr_idxx']+"</td><td>"+element['buyr_name']+
					"</td><td>"+element['buyr_mail']+"</td><td>"+element['buyr_tel2']+"</td><td>"+element['app_time']+
					"</td><td>"+element['card_name']+"</td><td>"+element['tno']+"</td><td>"
					if(element['isCanceled'] == 0){
						tableString+="<button type='button' onclick='clickBtn(this);' class='mb-2 mr-2 btn-square btn btn-success active' data-toggle='modal' data-target='#exampleModal'>취소가능</button></td>";
						console.log('넌좀찍혔으면 좋겠어',element['app_time'].substring(0,8));
						console.log('todayTime도 찍혀야되는거 아니겠니',todayTime);
						if(element['app_time'].substring(0,8)==todayTime){
							console.log('넌찍히냐',element['app_time'].substring(0,8));
							todayOrderCount++;
							todayOrderMoney += parseInt(element['amount']);
							console.log('if 문 안에');
							console.log(todayOrderCount);
							console.log(todayOrderMoney);
						}
					}
					else{
						tableString+="<button disabled='' class='mb-2 mr-2 btn-square btn btn-danger disabled'>취소완료</button>";
						
						totalCancelMoney += parseInt(element['amount']);
						
					}
					tableString+="</tr>";
					
					
				});
               tableString+="</tbody><tfoot><tr><th>No</th><th>memberno</th><th>ordr_idxx</th><th>buyr_name</th><th>buyr_email</th><th>buyr_tel2</th><th>app_time</th><th>card_name</th><th>tno</th><th>cancel</th></tr></tfoot></table>";		    
			    $('#'+id).html(tableString);
			    $('#totalOrderCount').html("총 "+totalOrderCount+"건");
			    $('#totalOrderMoney').html("￦ "+numberWithCommas(totalOrderMoney));
			    $('#totalCancelMoney').html("￦"+numberWithCommas(totalCancelMoney));
			
			    //프로그레스바
			  	console.log('토탈캔슬머니좀 찍어주세염',totalCancelMoney);
			  	console.log('토탈오더머니는여',totalOrderMoney);
			  	var prog3 = totalCancelMoney/totalOrderMoney;
			  	prog3 = prog3.toFixed(3);
				prog3 = prog3*100;
				prog3 = prog3.toFixed(2);
			  	prog3 += '%';
			 	console.log('prog3', prog3);
			    $('#progress3_1').css({'width':prog3});
			  	$('#prgress3').html(prog3);
				
			  	var prog1 = todayOrderCount/totalOrderCount;
			 
				prog1= prog1.toFixed(3);
				prog1 =prog1*100;
				prog1 =prog1.toFixed(2);
			 	console.log('prog1', prog1);
			  	prog1 += '%';
			  	
			  	$('#progress1').html(prog1);
			  	$('#progress1_1').css({'width':prog1});
				
			  	console.log("찍혀랏",todayOrderMoney);
			  	var prog2 = todayOrderMoney/totalOrderMoney;
			  	
			  	prog2 = prog2.toFixed(3);
			  	prog2 = prog2*100
			  	prog2 = prog2.toFixed(2);
			  	console.log('prog2', prog2);
			  	prog2 += '%';
			  	
			  	$('#progress2').html(prog2);
			  	$('#progress2_1').css({'width':prog2});
			  	 
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
                            일반결제 관리
                            <div class="page-title-subheading">
                                일반결제관리 페이지입니다.
                            </div>
                        </div>
             
                        <div class="app-header-overlay d-none animated fadeIn"></div>
                    </div><!-- 앱 헤더 -->
          
                    <!-- 위에 세개칸 -->
                    			
                    			
                    					<div class="container-fluid">
                                           <div class="row">
                                            <div class="col-md-6 col-xl-4">
                                                <div class="card mb-3 widget-content">
                                                    <div class="widget-content-outer">
                                                        <div class="widget-content-wrapper">
                                                            <div class="widget-content-left">
                                                                <div class="widget-heading">총 주문건수</div>
                                                                <div class="widget-subheading">현재까지</div>
                                                            </div>
                                                            <div class="widget-content-right">
                                                                <div id="totalOrderCount" class="widget-numbers text-success"></div>
                                                            </div>
                                                        </div>
                                                        <div class="widget-progress-wrapper">
                                                            <div class="progress-bar-sm progress">
                                                                <div class="progress-bar bg-primary" role="progressbar"
                                                              			id="progress1_1"
                                                                     aria-valuenow="40" aria-valuemin="0"
                                                                     aria-valuemax="100"
                                                                     style="width: 40%;"></div>
                                                            </div>
                                                            <div class="progress-sub-label">
                                                                <div class="sub-label-left">오늘 결제건/현재까지 총 주문건</div>
                                                                <div class="sub-label-right" id="progress1"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-xl-4">
                                                <div class="card mb-3 widget-content">
                                                    <div class="widget-content-outer">
                                                        <div class="widget-content-wrapper">
                                                            <div class="widget-content-left">
                                                                <div class="widget-heading">총 결제금액</div>
                                                                <div class="widget-subheading">현재까지</div>
                                                            </div>
                                                            <div class="widget-content-right">
                                                                <div id="totalOrderMoney" class="widget-numbers text-warning"></div>
                                                            </div>
                                                        </div>
                                                        <div class="widget-progress-wrapper">
                                                            <div class="progress-bar-sm progress-bar-animated-alt progress">
                                                                <div class="progress-bar bg-danger" role="progressbar"
                                                                     aria-valuenow="85" aria-valuemin="0"
                                                                     aria-valuemax="100"
                                                                     style="width: 85%;" id="progress2_1"></div>
                                                            </div>
                                                            <div class="progress-sub-label">
                                                                <div class="sub-label-left">오늘결제금액/현재까지 총 주문금액</div>
                                                                <div class="sub-label-right" id="progress2"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-xl-4">
                                                <div class="card mb-3 widget-content">
                                                    <div class="widget-content-outer">
                                                        <div class="widget-content-wrapper">
                                                            <div class="widget-content-left">
                                                                <div class="widget-heading">총 취소금액</div>
                                                                <div class="widget-subheading">현재까지</div>
                                                            </div>
                                                            <div class="widget-content-right">
                                                                <div id="totalCancelMoney" class="widget-numbers text-danger"></div>
                                                            </div>
                                                        </div>
                                                        <div class="widget-progress-wrapper">
                                                            <div class="progress-bar-sm progress-bar-animated-alt progress">
                                                                <div class="progress-bar bg-success" role="progressbar" id="progress3_1"
                                                                     aria-valuenow="90" aria-valuemin="0"
                                                                     aria-valuemax="100"
                                                                     ></div>
                                                            </div>
                                                            <div class="progress-sub-label">
                                                                <div class="sub-label-left">결제금액 대비 취소금액 비율</div>
                                                                <div id="prgress3" class="sub-label-right"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                           </div>
                                        </div>             
                                
                    <!-- 위에 세개칸 끝 --> 
                                         
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
 	
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
	     aria-hidden="true">
	    <div class="modal-dialog" role="document">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h5 class="modal-title" id="exampleModalLabel">카드결제건 취소</h5>
	                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                    <span aria-hidden="true">&times;</span>
	                </button>
	            </div>
	            <div class="modal-body">
	               
	                 <form name="acnt_form" action="Cancel.do" method="post" >
	                 <!-- 씨큐리티 쓰려면 바로 밑 소스 한줄 무조건 넣어야함 -->
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
									    
        <table class="tbl" cellpadding="0" cellspacing="0">
		<tr style="text-align: left;">
                <th style="text-align: left;">거래번호</th>
                <td style="text-align: left;"><input type="text" name="tno" value="" id="tno" class="frminput" size="20" maxlength="14"/></td>
            </tr>
            <!-- 변경유형 -->
            <tr style="text-align: left;">
                <th style="text-align: left;">변경 유형</th>
                <td style="text-align: left;">
                    <select name="mod_type" class="frmselect" onChange="sub_cancel_chk(this.value);"/>
                        <option value="STSC">전체 취소요청</option>
                        <option value="STPC">부분 취소요청</option>
                    </select>
                </td>
            </tr>
            <!-- 변경사유 -->
            <tr style="text-align: left;">
                <th style="text-align: left;">변경사유</th>
                <td style="text-align: left;"><input type="text" name="mod_desc" value=""  class="frminput" size="40" maxlength="100"/></td>
            </tr>
        </table>
        <!-- 부분취소테이블 -->
		<table id="show_sub_cancel" style="display:none" class="tbl" cellpadding="0" cellspacing="0">
            <!-- 요청 구분 : 개별승인 환불요청 정보 -->
            <tr>
                <th>요청 구분</th>
                <td>부분 취소요청</td>
            </tr>
            <!-- Input : 부분환불 요청 금액 입력 -->
            <tr>
                <th>부분취소 요청 금액</th>
                <td><input type="text" name="mod_mny" value=""  class="frminput" size="20" maxlength="10"/></td>
            </tr>
            <!-- Input : 부분환불 전 남은 금액(rem_mny) 입력 -->
            <tr>
                <th>부분취소 전 남은 금액</th>
                <td><input type="text" name="rem_mny" value="" class="frminput" size="20" maxlength="10"/></td>
            </tr>
			
			<tr>
                <th>과세금액</th>
                <td><input type="text" name="mod_tax_mny" value="" class="frminput" size="20" maxlength="10"/></td>
            </tr>
			
			<tr>
                <th>부가세 금액</th>
                <td><input type="text" name="mod_vat_mny" value="" class="frminput" size="20" maxlength="10"/></td>
            </tr>
			
			<tr>
                <th>비과세 금액</th>
                <td><input type="text" name="mod_free_mny" value="" class="frminput" size="20" maxlength="10"/></td>
            </tr>
 
        </table>        
    <input type="hidden" name = "req_tx"       value="mod"/>
    <!-- 
    <input name="" type="submit" class="submit" value="취소요청" onclick="return jsf__go_mod(this.form);"/>
   <button type="button" class="btn btn-primary" onclick="return jsf__go_mod(this.form);">취소하기</button> -->
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	                <button type="submit" class="btn btn-primary" onclick="return jsf__go_mod(this.form);">취소하기</button>
	            </div>
	            </form>
	        </div><!-- modal-content -->
	    </div><!-- modal dialog -->
	</div><!-- 모달끝 class="modal fade" id="exampleModal" -->
	
</body>
</html>