<%@ page language="java" contentType="text/html;charset=euc-kr"
   pageEncoding="utf-8"%>
<%@ include file="../cfg/site_conf_inc.jsp"%>
<%request.setCharacterEncoding("utf-8");%>
<%response.setContentType("text/html;charset=utf-8");%>

<!doctype html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Language" content="ko">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Art Planet-주문페이지</title>
<meta name="viewport"
   content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no" />
<meta name="description"
   content="Easily create beautiful form multi step wizards!">
<link rel="icon" href="favicon.ico">

<!-- Disable tap highlight on IE -->
<meta name="msapplication-tap-highlight" content="no">

<link
   href="${pageContext.request.contextPath}/resources/kero/main.07a59de7b920cd76b874.css"
   rel="stylesheet">
</head>

<!-- PG사 결제창호출함수 -->
<script type="text/javascript">
   function m_Completepayment(FormOrJson, closeEvent) {
      var frm = document.order_info;
      GetField(frm, FormOrJson);

      if (frm.res_cd.value == "0000") {
         alert("결제 승인 요청 전,\n\n반드시 결제창에서 고객님이 결제 인증 완료 후\n\n리턴 받은 ordr_chk 와 업체 측 주문정보를\n\n다시 한번 검증 후 결제 승인 요청하시기 바랍니다.");
         frm.submit();
      } else {
         alert("[" + frm.res_cd.value + "] " + frm.res_msg.value);

         closeEvent();
      }
   }
</script>

<script type="text/javascript" src="<%=g_conf_js_url%>"></script>
<script type="text/javascript">
   function jsf__pay(form) {
      try {
         KCP_Pay_Execute(form);
      } catch (e) {

      }
   }

   function init_orderid() {
      var today = new Date();
      var year = today.getFullYear();
      var month = today.getMonth() + 1;
      var date = today.getDate();
      var time = today.getTime();

      if (parseInt(month) < 10) {
         month = "0" + month;
      }

      if (parseInt(date) < 10) {
         date = "0" + date;
      }

      var order_idxx = "TEST" + year + "" + month + "" + date + "" + time;

      document.order_info.ordr_idxx.value = order_idxx;
   }
</script>

<!-- PG사 결제창호출함수 끝-->

<div class="container">
   <div style="padding-top: 130px;" class="row"></div>
   <div class="row">
      <div class="inner-bar-center">
         <ul class="nav">
            <li class="nav-item"><a role="tab" data-toggle="tab"
               id="tab-nav-0" class="nav-link active" href="#tab-content-0"> <span>주문페이지</span>
            </a></li>
         </ul>
      </div>
   </div>
   <div class="row">
      <div class="col-lg-8 col-md-12">
         <div class="card-body">

            <div id="smartwizard">
               <ul class="forms-wizard">
                  <li><a href="#step-1"> <em>1</em><span>주소 정보</span>
                  </a></li>
                  <li><a href="#step-2"> <em>2</em><span>결제 정보</span>
                  </a></li>
                  <li><a href="#step-3"> <em>3</em><span>완료</span>
                  </a></li>
               </ul>
               <!-- 위자드폼 시작 -->
               <div class="form-wizard-content">
                  <div id="step-1">
                     <div class="form-row">
                        <div class="col-md-6"></div>
                        <div class="col-md-6"></div>
                     </div>
                     <div class="position-relative form-group">
                        <label for="exampleAddress">주소</label><input name="address"
                           id="exampleAddress" placeholder="예) 서울특별시 금천구 가산로11"
                           type="text" class="form-control">
                     </div>
                     <div class="position-relative form-group">
                        <label for="exampleAddress2">상세주소</label><input name="address2"
                           id="exampleAddress2" placeholder="예) 4층 한국소프트인재개발원" type="text"
                           class="form-control">
                     </div>
                     <div class="form-row">
                        <div class="col-md-6">
                           <div class="position-relative form-group">
                              <label for="exampleCity">우편번호</label><input name="city"
                                 id="exampleCity" type="text" class="form-control">
                           </div>
                        </div>
                        <div class="col-md-4">
                           <div class="position-relative form-group">
                              <label for="exampleState">여분용1</label><input name="state"
                                 id="exampleState" type="text" class="form-control">
                           </div>
                        </div>
                        <div class="col-md-2">
                           <div class="position-relative form-group">
                              <label for="exampleZip">여분용2</label><input name="zip"
                                 id="exampleZip" type="text" class="form-control">
                           </div>
                        </div>
                     </div>
                     <div class="position-relative form-check">
                        <input name="check" id="exampleCheck" type="checkbox"
                           class="form-check-input"><label for="exampleCheck"
                           class="form-check-label">Check me out</label>
                     </div>
                  </div>
                  <div id="step-2">
                     <div id="accordion" class="accordion-wrapper mb-3">
                        <div class="card">
                           <div id="headingOne" class="card-header">
                              <button type="button" data-toggle="collapse"
                                 data-target="#collapseOne" aria-expanded="false"
                                 aria-controls="collapseOne"
                                 class="text-left m-0 p-0 btn btn-link btn-block">
                                 <!-- STEP2 입력폼 -->
                                 <span class="form-heading">결제정보
                                    <p>Enter your user informations below</p>
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
                                          <label>지불방법</label> <select
                                             class="multiselect-dropdown form-control"
                                             name="pay_method">
                                             <optgroup label="pay_method">
                                                <option value="100000000000">신용카드</option>
                                                <option value="010000000000">계좌이체</option>
                                                <option value="001000000000">가상계좌</option>
                                                <option value="000100000000">포인트</option>
                                                <option value="000010000000">휴대폰</option>
                                                <option value="000000001000">상품권</option>
                                                <option value="000000000010">ARS</option>
                                                <option value="111000000000">신용카드/계좌이체/가상계좌</option>
                                             </optgroup>
                                          </select>

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
                                                type="text" name="good_name" value="강좌결제테스트상품 " />
                                          </div>
                                       </div>

                                       <div class="col-md-6">
                                          <div class="position-relative form-group">
                                             <label>주문자명</label> <input class="form-control"
                                                type="text" name="buyr_name" value="주문자명" />
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
                                             name="buyr_mail" placeholder="Email" />
                                       </div>
                                    </div>

                                    <div class="position-relative form-group">
                                       <label>전화번호</label> <input value="02-0000-0000"
                                          name="buyr_tel1" placeholder="02-0000-1234" type="text"
                                          class="form-control">
                                    </div>

                                    <div class="position-relative form-group">
                                       <label>휴대폰번호</label> <input value="010-0000-0000"
                                          name="buyr_tel2" placeholder="010-0000-1234" type="text"
                                          class="form-control">
                                    </div>

                                    <!-- 결제요청 버튼
                                    <input name="button" type="button" class="submit" value="결제요청" onclick="jsf__pay(this.form);"/>-->
                                    <button type="button"
                                       class="btn-shadow btn-wide float-right btn-pill btn-hover-shine btn btn-primary"
                                       onclick="jsf__pay(this.form);">Pay</button>

                                    <!-- 히든타입 가맹점정보 -->
                                    <input type="hidden" name="req_tx" value="pay" />
                                    <input type="hidden" name="site_cd" value="<%=g_conf_site_cd%>" />
                                    <input type="hidden" name="site_name" value="<%=g_conf_site_name%>" />
                                    <input type="hidden" name="quotaopt" value="12" />
                                    <input type="hidden" name="currency" value="WON" />
                                    <!-- 필수정보(변경불가) -->
                                    <input type="hidden" name="module_type" value="<%=module_type%>" />
                                    <input type="hidden" name="res_cd" value="" />
                                    <input type="hidden" name="res_msg" value="" />
                                    <input type="hidden" name="enc_info" value="" />
                                    <input type="hidden" name="enc_data" value="" />
                                    <input type="hidden" name="ret_pay_method" value="" />
                                    <input type="hidden" name="tran_cd" value="" />
                                    <input type="hidden" name="use_pay_method" value="" />
                                    <input type="hidden" name="ordr_chk" value="" />
                                    <input type="hidden" name="cash_yn" value="" />
                                    <input type="hidden" name="cash_tr_code" value="" />
                                    <input type="hidden" name="cash_id_info" value="" />
                                    <input type="hidden" name="good_expr" value="0">
                                 </form>
                                 <!-- 폼끝 -->

                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div id="step-3">
                     <div class="no-results">
                        <div class="swal2-icon swal2-success swal2-animate-success-icon">
                           <div class="swal2-success-circular-line-left"
                              style="background-color: rgb(255, 255, 255);"></div>
                           <span class="swal2-success-line-tip"></span> <span
                              class="swal2-success-line-long"></span>
                           <div class="swal2-success-ring"></div>
                           <div class="swal2-success-fix"
                              style="background-color: rgb(255, 255, 255);"></div>
                           <div class="swal2-success-circular-line-right"
                              style="background-color: rgb(255, 255, 255);"></div>
                        </div>
                        <div class="results-subtitle mt-4">Failed!</div>
                        <div class="results-title">이전 페이지로 돌아가 Pay버튼을 누르고 진행해주세요</div>
                        <div class="mt-3 mb-3"></div>
                        <div class="text-center"></div>
                     </div>
                  </div>
               </div>
            </div>
            <div class="divider"></div>
            <div class="clearfix">
               <button type="button" id="reset-btn"
                  class="btn-shadow float-left btn btn-link">Reset</button>
               <button type="button" id="next-btn"
                  class="btn-shadow btn-wide float-right btn-pill btn-hover-shine btn btn-primary">
                  Next</button>
               <button type="button" id="prev-btn"
                  class="btn-shadow float-right btn-wide btn-pill mr-3 btn btn-outline-secondary">
                  Previous</button>
            </div>
         </div>
      </div>

      <div class="col-md-12 col-lg-4">
         <div class="main-card mb-3 card">
            <div class="card-header">공지사항</div>
            <ul class="todo-list-wrapper list-group list-group-flush">
               <li class="list-group-item">
                  <div class="todo-indicator bg-warning"></div>
                  <div class="widget-content p-0">
                     <div class="widget-content-wrapper">
                        <div class="widget-content-left mr-2"></div>
                        <div class="widget-content-left">
                           <div class="badge badge-danger ml-2">필독</div>
                           <div class="widget-heading">
                              결제건에 대한 취소관련 궁금하신점은</br>ArtPlanet으로 문의주세요

                           </div>
                           <div class="widget-subheading">
                              <i>운영자</i>
                           </div>
                        </div>

                     </div>
                  </div>
               </li>

            </ul>
            <div class="d-block text-right card-footer">

               <button class="btn btn-success btn-lg">문의하러가기</button>
            </div>
         </div>
      </div>
   </div>
</div>
