<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!-- 아이디 얻어서 var에 지정한 변수 id저장  페이지내에서 EL 사용하여 (ex. ${id} )아이디값 사용가능-->
<sec:authentication property="principal.username" var="id" />

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
  <link
   href="${pageContext.request.contextPath}/resources/kero/main.07a59de7b920cd76b874.css" rel="stylesheet">
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> 
      <script type="text/javascript">
   
    //결제관련
        function  jsf__pay( form )
        {
            if ( jsf__chk( form ) == true )
            {
                return  true;
            }
            else
            {
                return  false;
            }
        }
        
        function jsf__chk( form )
        {
            if ( form.batch_key.value.length != 16 )
            {
                alert("인증키 값을 정확히 입력해 주시기 바랍니다.");
                form.batch_key.focus();
                return false;
            }
            else
            {
                return true;
            }
        }
        //결제관련끝
    
    //배치키 전체리스트
    $(function(){
		
		$.ajax({
			url:"<c:url value='/AdmBatchKeyForProjList.ad'/>",
			dataType:'json',
			success:function(data){successAjax(data,'list');},
			error:function(request,error){
				console.log('상태코드:',request.status);
				console.log('서버로부터 받은 HTML데이타:',request.responseText);
				console.log('에러:',error);
			}
		});	
		
		//주문번호 생성 진입점에 넣음
		init_orderid();
		
    });	///////////////
		
    var successAjax = function(data,id){
		console.log('서버로 부터 받은 배치키 데이타:',data);
		var tableString="<table style='width: 100%;' id='example' class='table table-hover table-striped table-bordered'>";
        tableString += "<thead><tr><th>번호</th><th>프로젝트No</th><th>주문번호</th><th>응답코드</th><th>카드코드</th><th>주문자명</th><th>멤버No</th><th>배치키</th><th>후원금액</th><th>결제하기</th><th>최근결제일자</th></tr></thead>";
        tableString += "<tbody>";
        $.each(data,function(index,element){
				tableString+="<tr>";					
				tableString+="<td>"+(index+1)+"</td><td>"+element['projectNo']+"</td><td>"+element['ordr_idxx']+"</td><td>"+element['res_cd']+
				"</td><td>"+element['card_cd']+"</td><td>"+element['buyr_name']+"</td><td>"+element['memberNo']+"</td><td>"+element['batch_key']+"</td><td>"+element['projectSupportSum']+"</td>";			
				if(element['res_cd']!=0000)
					tableString+="<td><button type='button' class='mb-2 mr-2 border-0 btn-transition btn btn-shadow btn-outline-danger' data-toggle='modal' data-target='#exampleModal'>배치키재발급요망</button></td>";
				else if(element['app_time'].substr(4,2)==new Date().getMonth()+ 1)
					tableString+="<td><button type='button' class='mb-2 mr-2 border-0 btn-transition btn btn-shadow btn-outline-info' data-toggle='modal' data-target='#exampleModal'>프로젝트 결제완료</button></td>";
				else 	
					tableString+="<td><button type='button' class='mb-2 mr-2 border-0 btn-transition btn btn-shadow btn-outline-success' data-toggle='modal' data-target='#exampleModal' onclick='payTrigger(this)'>결제대기</button></td>";
				tableString+="<td>"+element['app_time'].substr(1,8)+"</td></tr>";
			});
        tableString+="</tbody><tfoot><tr></th></tr></tfoot></table>";		    
		    $('#'+id).html(tableString);
		};
	
		 // 주문번호 생성 예제
		 var init_orderid =   function(){
		        var today = new Date();
		        var year  = today.getFullYear();
		        var month = today.getMonth()+ 1;
		        var date  = today.getDate();
		        var hours = today.getHours();
		        var second = today.getSeconds();
		        var time  = today.getTime();

		        if(parseInt(month) < 10)
		        {
		            month = "0" + month;
		        }

		        var vOrderID = year + "" + month + "" + date + "" + hours + "" + second + "" + time;
		        
		        document.forms[0].ordr_idxx.value = vOrderID;
		    
		    }
		 
		//결제 트리거
			function payTrigger(el)
			{
				console.log('페이트리거 안입니다')
				$('#good_mny').val($(el).parent().prev().html());
				$('#batch_key').val($(el).parent().prev().prev().html());
			
				console.log('아임노캐쉬');
				$('#pay').trigger('click');
				//document.form_order.submit();
			
			}	
	</script>
</head>
<body oncontextmenu="return false;" ondragstart="return false;" onselectstart="return false;">
	<!-- 케로 관리자UI -->
   	<div class="app-container app-theme-gray">
		  <div class="app-main">
      <!-- 왼쪽바 시작 -->
            <div class="app-sidebar-wrapper">
                <div class="app-sidebar sidebar-shadow">
                <input type="hidden" value="${cancelButtonShow}" id="number"/>
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
                            프로젝트 (1회성) 관리
                            <div class="page-title-subheading">
                                프로젝트 (1회성)관리 페이지입니다.
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
                                                    
                                                       <!-- 폼 시작  -->
                          <div style="display: none;">
                          <form name="form_order" method="post" action="<c:url value='/ProjectPayHub.do'/>">          
                                   <!-- PG사로 폼값 포스트로 전송하기 -->
                                    <div class="form-row">
                                       <div class="col-md-6">
                                          <label>지불방법</label> 
											<input class="form-control"
                                                 type="text" name="pay_method"
                                                value="CARD" maxlength="40" />
                                       </div>

                                       <div class="col-md-6">
                                          <div class="position-relative form-group">
                                             <label>주문번호</label> <input class="form-control"
                                                placeholder="주문번호" type="text" name="ordr_idxx"
                                                value="TEST1234" maxlength="40"/>
                                          </div>
                                       </div>
                                       <div class="col-md-6">
                                          <div class="position-relative form-group">
                                             <label>상품명</label> <input class="form-control"
                                                type="text" name="good_name" value="정기후원_TEST " />
                                          </div>
                                       </div>

                                       <div class="col-md-6">
                                          <div class="position-relative form-group">
                                             <label>주문자명</label> <input class="form-control"
                                                type="text" name="buyr_name" value="프로젝트_관리자" />
                                          </div>
                                       </div>

                                    </div>
                                    <div class="position-relative form-group">
                                       <label>결제금액</label> <input class="form-control" type="text"
                                          name="good_mny" id="good_mny" value="10000" maxlength="9" />원(숫자만 입력)
                                    </div>

                                    <div class="form-group">
                                       <label for="email">Email</label>
                                       <div>
                                          <input type="text" class="form-control" id="email"
                                             name="buyr_mail" placeholder="Email" value="test@test.co.kr" />
                                       </div>
                                    </div>

                                    <div class="position-relative form-group">
                                       <label>전화번호</label> 
                                       <input value="02-0000-0000"
                                          name="buyr_tel1" placeholder="02-0000-1234" type="text"
                                          class="form-control"/>
                                    </div>

                                    <div class="position-relative form-group">
                                       <label>휴대폰번호</label> 
                                       <input value="010-0000-0000"
                                          name="buyr_tel2" placeholder="010-0000-1234" type="text"
                                          class="form-control" />
                                    </div>
                                    
                                    <div class="position-relative form-group">
                                       <label>인증키</label> 
                                       <input value=""
                                          name="bt_batch_key" id="batch_key" type="text"
                                          class="form-control" />
                                    </div>
                                    
                                     <div class="position-relative form-group">
                                       <label>그룹ID</label> 
                                       <input value="BA0011000348"
                                          name="bt_group_id" placeholder="010-0000-1234" type="text"
                                          class="form-control" />
                                    </div>
                                    
                                    <div class="position-relative form-group">
                                       <label>할부개월</label> 
                                       <input value="00"
                                          name="quotaopt" placeholder="010-0000-1234" type="text"
                                          class="form-control" />
                                    </div>

                                    <!-- 결제요청 버튼
                                    <input name="button" type="button" class="submit" value="결제요청" onclick="jsf__pay(this.form);"/>-->
                                    <button type="submit" id="pay"
                                       class="btn-shadow btn-wide float-right btn-pill btn-hover-shine btn btn-primary"
                                       onclick="jsf__pay(this.form);">Pay</button>

                                    <!-- 요청종류 승인(pay)/취소,매입(mod) 요청시 사용 -->
							        <input type="hidden" name="req_tx"          value="pay"/>
							        <input type="hidden" name="pay_method"      value="CARD"/>
							        <input type="hidden" name="card_pay_method" value="Batch"/>
							        <!-- 필수 항목 : 결제 금액/화폐단위 -->
							        <input type="hidden" name="currency" value="410"/>
							        
							        <!-- 씨큐리티 쓰려면 바로 밑 소스 한줄 무조건 넣어야함 -->
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
                                 </form>
                                 </div>
                                 <!-- 폼끝 -->
                                                    
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
