<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
    <title>Art Planet - 관리자</title>
    <meta http-equiv="X-UA-Compatible" content="text/html;charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Language" content="en">
    <link href="${pageContext.request.contextPath}/resources/kero/main.07a59de7b920cd76b874.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> 
    <script type="text/javascript">
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
			
			$(function(){
				
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
				
				 console.log('김승찬');
						

				 		var kim;
						var clickBtn2 = $('.cancel').click(function(){
							var  btnIndex  = clickBtn.index(this);
								console.log('index : ',clickBtn.index(this));
							
							console.log($(this).parent().prev().text());
							kim = $(this).parent().prev().text();
							$('#tno').val(kim);
						
						
							}); ///  clickBtn
				
			});  // onload
			 var clickBtn = function(e){
				document.getElementById('tno').value = e.parentNode.previousSibling.innerHTML;
			};
			
			var successAjax = function(data,id){
				console.log('서버로 부터 받은 데이타:',data);
				/*JSON배열을 출력할때는 $.each(data,function(index,index에 따른 요소값){}); 
				사용]
				data:서버로부터 전송받은 데이타(JSON배열타입)
				index:JSON배열의 인덱스(0부터 시작)	
				index에 따른 요소값:JSON배열에서 하나씩 꺼내온거를 담은 인자		
			    
			    var tableString="<table style='border-spacing:1px;background-color:red'>";
			    tableString+="<tr style='background-color:white'><th>번호</th><th>제목</th><th>이름</th><th>작성일</th></tr>";
				$.each(data,function(index,element){
					tableString+="<tr style='background-color:white'>";
					
					tableString+="<td>"+(index+1)+"</td><td>"+element['tno']+"</td><td>"+element['ordr_idxx']+"</td><td>"+element['buyr_mail']+"</td>";
					//서버에서 보내준 데이타 순서대로 뿌려줄때
					/*
					$.each(element,function(key,value){
						tableString+="<td>"+value+"</td>";				
					});
					tableString+="</tr>";
				});		
			    tableString+="</table>";		    
			    $('#'+id).html(tableString);
		
				*/
				
				var tableString="<table style='width: 100%;' id='example' class='table table-hover table-striped table-bordered'>";
               tableString += "<thead><tr><th>번호</th><th>회원번호</th><th>주문번호</th><th>주문자명</th><th>이메일주소</th><th>연락처</th><th>결제일</th><th>카드사</th><th>거래번호</th><th>취소</th></tr></thead>";
               tableString += "<tbody>";
               $.each(data,function(index,element){
					tableString+="<tr>";					
					tableString+="<td>"+(index+1)+"</td><td>"+element['memberno']+"</td><td>"+element['ordr_idxx']+"</td><td>"+element['buyr_name']+
					"</td><td>"+element['buyr_email']+"</td><td>"+element['buyr_tel2']+"</td><td>"+element['app_time']+
					"</td><td>"+element['card_name']+"</td><td>"+element['tno']+"</td><td>"
					+"<button type='button' onclick='clickBtn(this);' class='btn mr-2 mb-2 btn-primary cancel' data-toggle='modal' data-target='#exampleModal'>취소</button></td>"
					;
				
					tableString+="</tr>";
				});
               tableString+="</tbody><tfoot><tr><th>No</th><th>memberno</th><th>ordr_idxx</th><th>buyr_name</th><th>buyr_email</th><th>buyr_tel2</th><th>app_time</th><th>card_name</th><th>tno</th><th>cancel</th></tr></tfoot></table>";		    
			    $('#'+id).html(tableString);
			};

	 </script>
	 
</head>
<body oncontextmenu="return false;" ondragstart="return false;" onselectstart="return false;">
	<!-- 케로 관리자UI -->
   	<div class="app-container app-theme-gray">
		  <div class="app-main">
            <div class="app-sidebar-wrapper">
                <div class="app-sidebar sidebar-shadow">
                
                	<div class="app-header__logo">
                        <a href="#" data-toggle="tooltip" data-placement="bottom" title="KeroUI Admin Template" class="logo-src"></a>
                        <button type="button" class="hamburger hamburger--elastic mobile-toggle-nav">
                                <span class="hamburger-box">
                                    <span class="hamburger-inner"></span>
                                </span>
                        </button>
                    </div>
                    
                      <div class="scrollbar-sidebar scrollbar-container">
                        <div class="app-sidebar__inner">
                            <ul class="vertical-nav-menu">
                                <li class="app-sidebar__heading">Menu</li>
                                  <li class="mm-active">
      
                                    <a href="#">
                                        <i class="metismenu-icon pe-7s-rocket"></i>
                                        	관리자전용 게시판
                                        <i class="metismenu-state-icon pe-7s-angle-down caret-left"></i>
                                    </a>
                                    
                                    <ul>          
                                        <li><a href="AdmUserInfo.ad">회원관리</a></li>
                                        <li><a href="AdmUserPay.ad">일반결제관리</a></li>
                                        <li><a href="AdmUserRecPay.ad">정기결제관리</a></li>
                                        <li><a href="helpdesk-dashboard.html">프로젝트/클래스관리</a></li>
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
                                                                <div class="widget-subheading">이번달</div>
                                                            </div>
                                                            <div class="widget-content-right">
                                                                <div class="widget-numbers text-success">1896</div>
                                                            </div>
                                                        </div>
                                                        <div class="widget-progress-wrapper">
                                                            <div class="progress-bar-sm progress">
                                                                <div class="progress-bar bg-primary" role="progressbar"
                                                              
                                                                     aria-valuenow="40" aria-valuemin="0"
                                                                     aria-valuemax="100"
                                                                     style="width: 40%;"></div>
                                                            </div>
                                                            <div class="progress-sub-label">
                                                                <div class="sub-label-left">YoY Growth</div>
                                                                <div class="sub-label-right">100%</div>
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
                                                                <div class="widget-subheading">이번달</div>
                                                            </div>
                                                            <div class="widget-content-right">
                                                                <div class="widget-numbers text-warning">$3M</div>
                                                            </div>
                                                        </div>
                                                        <div class="widget-progress-wrapper">
                                                            <div class="progress-bar-sm progress-bar-animated-alt progress">
                                                                <div class="progress-bar bg-danger" role="progressbar"
                                                                     aria-valuenow="85" aria-valuemin="0"
                                                                     aria-valuemax="100"
                                                                     style="width: 85%;"></div>
                                                            </div>
                                                            <div class="progress-sub-label">
                                                                <div class="sub-label-left">Sales</div>
                                                                <div class="sub-label-right">100%</div>
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
                                                                <div class="widget-subheading">이번달</div>
                                                            </div>
                                                            <div class="widget-content-right">
                                                                <div class="widget-numbers text-danger">45,9%</div>
                                                            </div>
                                                        </div>
                                                        <div class="widget-progress-wrapper">
                                                            <div class="progress-bar-sm progress-bar-animated-alt progress">
                                                                <div class="progress-bar bg-success" role="progressbar"
                                                                     aria-valuenow="46" aria-valuemin="0"
                                                                     aria-valuemax="100"
                                                                     style="width: 46%;"></div>
                                                            </div>
                                                            <div class="progress-sub-label">
                                                                <div class="sub-label-left">Twitter Progress</div>
                                                                <div class="sub-label-right">100%</div>
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
                                                        <table style="width: 100%;" id="example"
                                                               class="table table-hover table-striped table-bordered">
                                                            <thead>
                                                            <tr>
                                                            	<th>번호</th>
                                                                <th>아이디</th>
                                                                <th>주문번호</th>
                                                                <th>주문자명</th>
                                                                <th>배송지주소</th>
                                                                <th>연락처</th>
                                                                <th>결제일</th>
                                                                <th>취소일</th>
                                                                <th>거래번호</th>
                                                                <th>취소</th>
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
                                                                <td>19552928618000</td>
                                                                <td>
                                                   					<button type="button" class="btn mr-2 mb-2 btn-primary cancel" data-toggle="modal" data-target="#exampleModal">
                                                          			 취소
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
                                                                <td>19552928618000</td>
                                                                <td>
                                                   			<button type="button" class="btn mr-2 mb-2 btn-primary cancel" data-toggle="modal" data-target="#exampleModal">
                                                          			 취소
                                                    			    </button>
                                                    			</td>
                                                            </tr>
                                                            
                                                             
                                                            
                                                            </tbody>
                                                            <tfoot>
                                                            <tr>
                                                            	<th>No</th>
                                                            	<th>ID</th>
                                                            	<th>ordr_idxx</th>
                                                                <th>Name</th>
                                                                <th>Addr</th>
                                                                <th>tell</th>
                                                                <th>Birth</th>
                                                                <th>Regidate</th>
                                                                <th>tno</th>
                                                                <th>cancel</th>
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
        <table class="tbl" cellpadding="0" cellspacing="0">
		<tr>
                <th>거래번호</th>
                <td><input type="text" name="tno" value="" id="tno" class="frminput" size="20" maxlength="14"/></td>
            </tr>
            <!-- 변경유형 -->
            <tr>
                <th>변경 유형</th>
                <td>
                    <select name="mod_type" class="frmselect" onChange="sub_cancel_chk(this.value);"/>
                        <option value="STSC">전체 취소요청</option>
                        <option value="STPC">부분 취소요청</option>
                    </select>
                </td>
            </tr>
            <!-- 변경사유 -->
            <tr>
                <th>변경사유</th>
                <td><input type="text" name="mod_desc" value=""  class="frminput" size="40" maxlength="100"/></td>
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
