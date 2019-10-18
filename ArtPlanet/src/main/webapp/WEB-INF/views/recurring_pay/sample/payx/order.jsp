<%@ page language="java" contentType="text/html;charset=euc-kr"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title>*** KCP Online Payment System [JSP Version] ***</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
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

<body onload="init_orderid();">

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
                     	</div>
                     </div>
                  </div>
              </div><!-- side bar -->
              
              <!-- 여기 -->
               <div class="app-main__outer">
               <div class="app-header">
                        <div class="page-title-heading">
                            정기과금결제요청페이지
                            <div class="page-title-subheading">
                                정기과금결제요청결과를 출력하는 페이지입니다.
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
                                                        <div class="card-title">
                                                        <!-- 내용 -->
<div id="sample_wrap">

    <form name="form_order" method="post" action="RecurringPayHub.do">
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
                                 <form name="order_info" method="post" action="Hub.do">
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
                                                type="text" name="good_name" value="정기후원_TEST " />
                                          </div>
                                       </div>

                                       <div class="col-md-6">
                                          <div class="position-relative form-group">
                                             <label>주문자명</label> <input class="form-control"
                                                type="text" name="buyr_name" value="홍길동" />
                                          </div>
                                       </div>

                                    </div>
                                    <div class="position-relative form-group">
                                       <label>결제금액</label> <input class="form-control" type="text"
                                          name="good_mny" value="1004" maxlength="9" />원(숫자만 입력)
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
                                          name="bt_batch_key" placeholder="010-0000-1234" type="text"
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
                                    <button type="button"
                                       class="btn-shadow btn-wide float-right btn-pill btn-hover-shine btn btn-primary"
                                       onclick="jsf__pay(this.form);">Pay</button>

                                   
                                 </form>
                                 <!-- 폼끝 -->

                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
				
				
				
				<!-- 케로UI끝 -->
                    <h1> <span>페이지</span></h1>
                    <!-- 상단 문구 -->
                    <div class="sample">
                         
                    <!-- 상단 테이블 End -->
				
                <!-- 주문정보 타이틀 -->
                    <h2>&sdot; 주문 정보</h2>
                    <table class="tbl" cellpadding="0" cellspacing="0">

                    <!-- 지불 방법 -->
                    <tr>
                        <th>지불 방법</th>
                        <td><input type="text" name="pay_method" value="CARD" size="13" class="w100" readonly/></td>
                    </tr>
                    <!-- 주문 번호 -->
                    <tr>
                        <th>주문 번호</th>
                        <td><input type="text" name="ordr_idxx" class="w200" value="" maxlength="40"/></td>
                    </tr>
                    <!-- 상품명 -->
                    <tr>
                        <th>상품명</th>
                        <td><input type="text" name="good_name" class="w100" value="운동화"/></td>
                    </tr>
                    <!-- 결제 금액 -->
                    <tr>
                        <th>결제 금액</th>
                        <td><input type="text" name="good_mny" class="w100" value="1004" maxlength="9"/>원(숫자만 입력)</td>
                    </tr>
                    <!-- 주문자 이름 -->
                    <tr>
                        <th>주문자명</th>
                        <td><input type="text" name="buyr_name" class="w100" value="홍길동"/></td>
                    </tr>
                    <!-- 주문자 E-Mail -->
                    <tr>
                        <th>E-mail</th>
                        <td><input type="text" name="buyr_mail" class="w200" value="test@test.co.kr" maxlength="30" /></td>
                    </tr>
                    <!-- 주문자 전화번호 -->
                    <tr>
                        <th>전화번호</th>
                        <td><input type="text" name="buyr_tel1" class="w100" value="02-2108-1000"/></td>
                    </tr>
                    <!-- 주문자 휴대폰번호 -->
                    <tr>
                        <th>휴대폰번호</th>
                        <td><input type="text" name="buyr_tel2" class="w100" value="010-0000-0000"/></td>
                    </tr>
                    </table>
                    <!-- 주문 정보 출력 테이블 End -->

                    <!-- 정기과금 정보 출력 테이블 Start -->
                    <h2>&sdot; 정기과금 정보</h2>
                    <table class="tbl" cellpadding="0" cellspacing="0">
                    <!-- 인증키 -->
                    <tr>
                        <th>인증키</th>
                        <td><input type="text" name="bt_batch_key" value="" class="w100" /></td>
                    </tr>
                    <!-- 그룹ID BA0011000348 -->
                    <tr>
                        <th>그룹ID</th>
                        <td><input type="text" name="bt_group_id" value="BA0011000348" class="w100" /></td>
                    </tr>
                    <!-- 할부개월 -->
                    <tr>
                        <th>할부개월</th>
                        <td><input type="text" name="quotaopt" value="00" size="2" maxlength="2"  class="w10" /></td>
                    </tr>
                    </table>
                    <!-- 정기과금 정보 출력 테이블 End -->

                <!-- 결제 버튼 테이블 Start -->
                    <div class="btnset">
                        <table align="center" cellspacing="0" cellpadding="0" class="margin_top_20"> 
                            <tr id="show_pay_btn">
                                <td colspan="2" align="center"> 
                                  <input name="" type="submit" class="submit" value="결제요청" onclick="return jsf__pay(this.form);" alt="결제를 요청합니다" /></a>
                                  <a href="../index.html" class="home">처음으로</a>
                     </div>
                                </td>
                            </tr>
                            <!-- 결제 진행 중입니다. 메시지 -->
                            <tr id="show_progress" style="display:none">
                                <td colspan="2" class="center red" >결제 진행 중입니다. 잠시만 기다려 주십시오...</td>
                            </tr>
                        </table>
                    </div>
                <!-- 결제 버튼 테이블 End -->

                </div>
        <div class="footer">
            Copyright (c) KCP INC. All Rights reserved.
        </div>

        <!-- 요청종류 승인(pay)/취소,매입(mod) 요청시 사용 -->
        <input type="hidden" name="req_tx"          value="pay"/>
        <input type="hidden" name="pay_method"      value="CARD"/>
        <input type="hidden" name="card_pay_method" value="Batch"/>
        <!-- 필수 항목 : 결제 금액/화폐단위 -->
        <input type="hidden" name="currency" value="410"/>
    </form>
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