<%@ page language="java" contentType="text/html;charset=euc-kr" pageEncoding="utf-8"%>
<%@ include file="../../cfg/site_conf_inc.jsp" %>
<%request.setCharacterEncoding ( "utf-8" ) ;%>
<% response.setContentType("text/html;charset=utf-8"); %>
<%!   
        public String f_get_parm( String val )
        {
          if ( val == null ) val = "";
          return  val;
        }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<title>Art Planet-인증페이지</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${pageContext.request.contextPath}/resources/kero/main.07a59de7b920cd76b874.css" rel="stylesheet"> 
<script type="text/javascript">
   function m_Completepayment( frm_mpi, closeEvent )
   {
       var frm = document.formOrder;

       if( frm_mpi.res_cd.value == "0000" )
       {
           GetField(frm, frm_mpi);

           frm.submit();

           closeEvent();
       }
       else
       {
           closeEvent();

           setTimeout( "alert( \"[" + frm_mpi.res_cd.value + "]" + frm_mpi.res_msg.value  + "\");", 1000 );
       }
   }
</script>
		
<script type="text/javascript" src="<%= g_conf_js_url %>"charset="euc-kr"></script>
 
<script type="text/javascript">
 
        /* Payplus Plug-in 실행 */
        function jsf__pay( form )
        {
			try
			{
	            KCP_Pay_Execute( form ); 
			}
			catch (e)
			{
				/* IE 에서 결제 정상종료시 throw로 스크립트 종료 */ 
			}
        }        
 
        // 주문번호 생성 예제
        function init_orderid()
        {
            var today = new Date();
            var year  = today.getFullYear();
            var month = today.getMonth()+ 1;
            var date  = today.getDate();
            var time  = today.getTime();
 
            if(parseInt(month) < 10) { month = "0" + month; }
            if(parseInt(date) < 10) { date = "0" + date; }
 
            var vOrderID = year + "" + month + "" + date + "" + time;
 
            document.forms[0].ordr_idxx.value = vOrderID;
        }
 
    </script>
</head>
 
<body onload="init_orderid();" >
 
<!-- 케로UI시작 -->
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
                
                  <li> <em>1</em><span>카드인증</span></li>
               
               </ul>
 <!-- 위자드폼 시작 -->
 <div class="form-wizard-content">
        <div id="step-2">
             <div id="accordion" class="accordion-wrapper mb-3">
                <div class="card">
                   <div id="headingOne" class="card-header">
                      <button type="button" data-toggle="collapse"
                         data-target="#collapseOne" aria-expanded="false"
                         aria-controls="collapseOne"
                         class="text-left m-0 p-0 btn btn-link btn-block">
                         <!-- STEP2 입력폼 -->
                         <span class="form-heading">정기과금 카드등록페이지
                            <p>Enter your user informations below</p>
                         </span>
                      </button>
                   </div>
                   <div data-parent="#accordion" id="collapseOne"
                      aria-labelledby="headingOne" class="collapse show">
                      <div class="card-body">
   	   <!-- PG사로 폼값 포스트로 전송하기 -->
                              
       <form name="formOrder" method="post" action="RecurringAuthHub.do">
       <!-- 상단 문구 -->
       <div class="sample">
       <p>후원자의 신원정보와 신용카드 정보를 입력하여</br> 
               신용카드의 인증요청하는 페이지입니다.</br>
               요청자의 신원정보와 카드사에 등록된 신원정보가  일치된 경우</br> 
               과금을 신청 할 수 있는 인증키가 리턴됩니다.</br></br>
               리턴된 인증키로 결제요청 페이지를 통해 정기과금 결제를 요청 할 수 있습니다.</p>
       <!-- 인증 정보시작  -->
       
       <div class="col-md-6">
          <!-- 주문 번호 -->
         <div class="position-relative form-group">
            <label>주문번호</label> 
            <input class="form-control" placeholder="주문번호" type="text" name="ordr_idxx"
               value="TEST1234" maxlength="40" />
         </div>
       </div>
       
       <!-- 주문자 이름 -->
       <div class="col-md-6">
          <div class="position-relative form-group">
             <label>주문자명</label> 
             <input class="form-control" type="text" name="buyr_name" value="강좌결제테스트상품 " />
          </div>
       </div>
	  
	  <!-- 그룹아이디 : 테스트 결제시 설정 값 으로 설정, 리얼 결제시 관리자 생성 그룹아이디 입력 -->
      <div class="col-md-6">
         <div class="position-relative form-group">
            <label>그룹아이디</label> <input class="form-control"
               type="text" name="kcpgroup_id" value="BA0011000348" />
         </div>
      </div>
       <!-- 결제 요청 -->
       <div class="btnset" id="display_pay_button" style="display:block">
        <!--  <input name="" type="button" class="submit" value="인증요청" onclick="jsf__pay(this.form);"/>
         -->
       </div>
    
      </div>
    
   <div class="footer">
     Copyright (c) KCP INC. All Rights reserved.
   </div>

    <!-- 필수 항목 : 요청구분 -->
    <input type="hidden" name="req_tx"         value="pay"/>
    <input type="hidden" name="site_cd"        value="<%= g_conf_site_cd   %>" />
    <input type="hidden" name="site_name"      value="<%= g_conf_site_name %>" />
    
    <!-- 결제 방법 : 인증키 요청(AUTH:CARD) -->
    <input type='hidden' name='pay_method'     value='AUTH:CARD'>
 
    <!-- 인증 방식 : 공인인증(BCERT) -->
    <input type='hidden' name='card_cert_type' value='BATCH'>
 
    <!-- 필수 항목 : PULGIN 설정 정보 변경하지 마세요 -->
    <input type='hidden' name='module_type'    value='01'>
 
    <!-- 필수 항목 : PLUGIN에서 값을 설정하는 부분으로 반드시 포함되어야 합니다. ※수정하지 마십시오.-->
    <input type='hidden' name='res_cd'         value=''>
    <input type='hidden' name='res_msg'        value=''>
    <input type='hidden' name='trace_no'       value=''>
    <input type='hidden' name='enc_info'       value=''>
    <input type='hidden' name='enc_data'       value=''>
    <input type='hidden' name='tran_cd'        value=''>
 
    <!-- 배치키 발급시 주민번호 입력을 결제창 안에서 진행 -->
    <input type='hidden' name='batch_soc'      value='Y'>
 
    <!-- 상품제공기간 설정 -->
    <input type='hidden' name='good_expr' value='2:1m'>
	
	<!-- 주민번호 S / 사업자번호 C 픽스 여부 -->
    <!-- <input type='hidden' name='batch_soc_choice' value='' /> -->
 
    <!-- 카드번호 해쉬 데이터 리턴 여부 -->
	<!-- 배치키 리턴 시 카드번호 해쉬데이터 추가 전달 -->
    <!-- <input type='hidden' name='rtn_key_info_yn' value='Y' /> -->
 
	<!-- 배치키 발급시 카드번호 리턴 여부 설정 -->
	<!-- Y : 1234-4567-****-8910 형식, L : 8910 형식(카드번호 끝 4자리) -->
	<!-- <input type='hidden' name='batch_cardno_return_yn'  value=''> -->
 
	<!-- batch_cardno_return_yn 설정시 결제창에서 리턴 -->
	<!-- <input type='hidden' name='card_mask_no'			  value=''>    -->
   

    
               </div>
                       </div>
                   </div>
               </div>
           </div>
           
       </div>

   <div class="divider"></div>
   <div class="clearfix">
    
         <button type="button"  id="next-btn"
               class="btn-shadow btn-wide float-right btn-pill btn-hover-shine btn btn-primary"
               onclick="jsf__pay(this.form);">
               		     정기후원결제
	  </button>
            </div>
                </form>
        </div><!-- 스마트 위자드 -->
    </div><!-- 카드바디 -->
</div><!-- col -->

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