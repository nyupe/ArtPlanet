<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title>Art Planet - 관리자 정기결제</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   <link
   href="${pageContext.request.contextPath}/resources/kero/main.07a59de7b920cd76b874.css"
   rel="stylesheet">
    <script type="text/javascript">

        // 주문번호 생성 예제
        function init_orderid()
        {
            var today = new Date();
            var year  = today.getFullYear();
            var month = today.getMonth()+ 1;
            var date  = today.getDate();
            var time  = today.getTime();

            if(parseInt(month) < 10)
            {
                month = "0" + month;
            }

            var vOrderID = year + "" + month + "" + date + "" + time;

            document.forms[0].ordr_idxx.value = vOrderID;
        }

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

    </script>
</head>

<body onload="init_orderid();" oncontextmenu="return false;" ondragstart="return false;" onselectstart="return false;">

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
                            프로젝트결제요청페이지
                            <div class="page-title-subheading">
                                프로젝트결제요청결과를 출력하는 페이지입니다.
                            </div>
                        </div>
                        
               </div><!-- app header --> 
              <div class="app-inner-layout app-inner-layout-page">
                        <div class="app-inner-layout__wrapper">
                            <div class="app-inner-layout__content pt-1">
                                <div class="tab-content">
                                    <div class="container-fluid">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="main-card mb-3 card">
                                                    <div class="card-body">
                                                    
                                                        <!-- 내용 -->


    <form name="form_order" method="post" action="<c:url value='/ProjectPayHub.do'/>">
				<!-- 케로UI -->
				 <div id="step-2">
                     <div id="accordion" class="accordion-wrapper mb-3">
                        <div class="card">
                           <div id="headingOne" class="card-header">
                              <button type="button" data-toggle="collapse"
                                 data-target="#collapseOne" aria-expanded="false"
                                 aria-controls="collapseOne"
                                 class="text-left m-0 p-0 btn btn-link btn-block">
                                 <!-- STEP2 입력폼 -->
                                 <span class="form-heading">[신용카드 정기과금 결제요청]
                                    <p>이 페이지는 요청자의 인증키를 입력하여 신용카드 결제 요청을하는 페이지입니다.</br><br>
                               결제 요청 할 인증키가 다수인 경우 해당 모듈에 설정하는 인증 키 값을 사용자에 맞게 금액과 할부를 설정하여주시기 바랍니다.</p>
                                 </span>
                              </button>
                           </div>
                           <div data-parent="#accordion" id="collapseOne"
                              aria-labelledby="headingOne" class="collapse show">
                              <div class="card-body">
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
                                                value="TEST1234" maxlength="40" />
                                          </div>
                                       </div>
                                       <div class="col-md-6">
                                          <div class="position-relative form-group">
                                             <label>상품명</label> <input class="form-control"
                                                type="text" name="good_name" value="일회성모금_TEST " />
                                          </div>
                                       </div>

                                       <div class="col-md-6">
                                          <div class="position-relative form-group">
                                             <label>주문자명</label> <input class="form-control"
                                                type="text" name="buyr_name" value="래닛" />
                                          </div>
                                       </div>

                                    </div>
                                    <div class="position-relative form-group">
                                       <label>결제금액</label> <input class="form-control" type="text"
                                          name="good_mny" value="10000" maxlength="9" />원(숫자만 입력)
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
                                          class="form-control">
                                    </div>

                                    <div class="position-relative form-group">
                                       <label>휴대폰번호</label> 
                                       <input value="010-0000-0000"
                                          name="buyr_tel2" placeholder="010-0000-1234" type="text"
                                          class="form-control">
                                    </div>
                                    
                                    <div class="position-relative form-group">
                                       <label>인증키</label> 
                                       <input value=""
                                          name="bt_batch_key"  type="text"
                                          class="form-control">
                                    </div>
                                    
                                     <div class="position-relative form-group">
                                       <label>그룹ID</label> 
                                       <input value="BA0011000348"
                                          name="bt_group_id" placeholder="010-0000-1234" type="text"
                                          class="form-control">
                                    </div>
                                    
                                    <div class="position-relative form-group">
                                       <label>할부개월</label> 
                                       <input value="00"
                                          name="quotaopt" placeholder="010-0000-1234" type="text"
                                          class="form-control">
                                    </div>

                                    <!-- 결제요청 버튼
                                    <input name="button" type="button" class="submit" value="결제요청" onclick="jsf__pay(this.form);"/>-->
                                    <button type="submit"
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
                                 <!-- 폼끝 -->

              
				
				
				<!-- 케로UI끝 -->
                 
        <div class="footer">
            Copyright (c) KCP INC. All Rights reserved.
        </div>

											
                                                    </div><!-- card-body -->
                                                 </div><!-- main card mb -->
                                             </div><!-- col md 12 -->
                                         </div><!-- row -->
                                     </div><!-- container-fluid -->
                                   </div><!-- tab-content -->
                              </div> <!-- app inner layout -->     
                        </div><!-- app inner layout___wrapper -->
                 </div><!-- app-inner-layout app-inner-layout-page -->
               
               </div><!-- app-main outer -->       
           </div><!-- app-main -->
     </div><!-- app-container gray -->   
                        
</body>
</html>