<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >

<head>
    <title>Art Planet - 취소</title>
    <meta http-equiv="X-UA-Compatible" content="text/html;charset=utf-8">
     <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Language" content="en">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>  
  <link
   href="${pageContext.request.contextPath}/resources/kero/main.07a59de7b920cd76b874.css" rel="stylesheet">
</head>


<%
	request.setCharacterEncoding ("utf-8");
	
    /* ============================================================================== */
    /* =   PAGE : 지불 요청 및 결과 처리 PAGE                                       = */
    /* = -------------------------------------------------------------------------- = */
    /* =   연동시 오류가 발생하는 경우 아래의 주소로 접속하셔서 확인하시기 바랍니다.= */
    /* =   접속 주소 : http://kcp.co.kr/technique.requestcode.do                    = */
    /* = -------------------------------------------------------------------------- = */
    /* =   Copyright (c)  2016   NHN KCP Inc.   All Rights Reserverd.               = */
    /* ============================================================================== */

    /* ============================================================================== */ 
    /* =   POST 형식 체크부분                                                       = */ 
    /* = -------------------------------------------------------------------------- = */ 
    if ( !request.getMethod().equals("POST")) 
    { 
        out.println("잘못된 경로로 접속하였습니다.");
        return;
    } 
    /* ============================================================================== */ 
%>
<%

    /* ============================================================================== */
    /* =   환경 설정 파일 Include                                                   = */
    /* = -------------------------------------------------------------------------- = */
    /* =   ※ 필수                                                                  = */
    /* =   테스트 및 실결제 연동시 site_conf_inc.jsp파일을 수정하시기 바랍니다.     = */
    /* = -------------------------------------------------------------------------- = */
%>
    <%@ page import="com.kcp.*" %>
    <%@ page import="java.net.URLEncoder"%>
    <%@ include file = "../cfg/site_conf_inc.jsp"%>
<%

    /* = -------------------------------------------------------------------------- = */
    /* =   환경 설정 파일 Include END                                               = */
    /* ============================================================================== */
%>

<%!
    /* ============================================================================== */
    /* =   null 값을 처리하는 메소드                                                = */
    /* = -------------------------------------------------------------------------- = */
        public String f_get_parm( String val )
        {
          if ( val == null ) val = "";
          return  val;
        }
    /* ============================================================================== */
%>
<%
    /* ============================================================================== */
    /* =   02. 지불 요청 정보 설정                                                  = */
    /* = -------------------------------------------------------------------------- = */
   String req_tx          = "";                                                     	// 취소요청
    String tran_cd         = "";                                                     	// 업무코드
    String cust_ip         = f_get_parm( request.getRemoteAddr()); 						// 요청 IP
    /* = -------------------------------------------------------------------------- = */
    String res_cd          = "";                                                     	// 응답코드
    String res_msg         = "";                                                     	// 응답 메세지
    String tno             = f_get_parm( request.getParameter( "tno"     ) );    		// KCP 거래 고유 번호
	String card_cd     	   = ""; 														// 카드 코드
    String card_name       = "";														// 카드 명
    String amount          = "";    													// 결제 금액
    String coupon_mny      = "";    													// 쿠폰 금액
    String canc_time       = "";														// 취소시간  
    /* = -------------------------------------------------------------------------- = */
    String mod_type        = f_get_parm( request.getParameter( "mod_type" ) );  		// 변경TYPE(승인취소시 필요)
    String mod_desc        = "";                                                     	// 변경사유
    String panc_mod_mny    = f_get_parm( request.getParameter( "mod_mny"   ) );  		// 부분취소 금액
    String panc_rem_mny    = f_get_parm( request.getParameter( "rem_mny"   ) ); 		// 부분취소 가능 금액
    String panc_coupon_mod_mny = "";													// 쿠폰 부분 취소 요청 금액
	  String panc_card_mod_mny="";														// 카드 부분 취소 청 금액
    String mod_tax_mny     = f_get_parm( request.getParameter( "mod_tax_mny" ) );                                                    	// 공급가 부분 취소 요청 금액
    String mod_vat_mny     = f_get_parm( request.getParameter( "mod_vat_mny" ) );                                                   	// 부과세 부분 취소 요청 금액
    String mod_free_mny    = f_get_parm( request.getParameter( "mod_free_mny" ) );                                                     	// 비과세 부분 취소 요청 금액금액
    /* ============================================================================== */
    /* =   02. 지불 요청 정보 설정 END                                              = */
    /* ============================================================================== */


    /* ============================================================================== */
    /* =   03. 인스턴스 생성 및 초기화(변경 불가)                                   = */
    /* = -------------------------------------------------------------------------- = */
    /* =       결제에 필요한 인스턴스를 생성하고 초기화 합니다.                     = */
    /* = -------------------------------------------------------------------------- = */
    J_PP_CLI_N c_PayPlus = new J_PP_CLI_N();

    c_PayPlus.mf_init( "", g_conf_gw_url, g_conf_gw_port, g_conf_tx_mode, g_conf_log_dir );
    c_PayPlus.mf_init_set();  

    /* ============================================================================== */
    /* =   03. 인스턴스 생성 및 초기화 END                                          = */
    /* ============================================================================== */


    /* ============================================================================== */
    /* =   04. 처리 요청 정보 설정                                                  = */
    /* = -------------------------------------------------------------------------- = */

    /* = -------------------------------------------------------------------------- = */
    /* =   04-1. 취소/매입 요청                                                     = */
    /* = -------------------------------------------------------------------------- = */
    if ( req_tx.equals( "" ) )
    {
        int    mod_data_set_no;

        tran_cd = "00200000";
        mod_data_set_no = c_PayPlus.mf_add_set( "mod_data" );

        c_PayPlus.mf_set_us( mod_data_set_no, "tno",      tno		  ); 				  						// KCP 원거래 거래번호
        c_PayPlus.mf_set_us( mod_data_set_no, "mod_type", request.getParameter( "mod_type")); 					// 전체취소 STSC / 부분취소 STPC 
        c_PayPlus.mf_set_us( mod_data_set_no, "mod_ip",   cust_ip     ); 				  						// 변경 요청자 IP
        c_PayPlus.mf_set_us( mod_data_set_no, "mod_desc", ""          ); 
				               
        if ( mod_type.equals( "STPC" ) ) // 부분취소의 경우
        {
            c_PayPlus.mf_set_us( mod_data_set_no, "mod_mny", "" ); // 취소요청금액
            c_PayPlus.mf_set_us( mod_data_set_no, "rem_mny", "" ); // 취소가능잔액

            //복합거래 부분 취소시 주석을 풀어 주시기 바랍니다.
            c_PayPlus.mf_set_us( mod_data_set_no, "tax_flag",     "TG03"                       ); // 복합과세 구분
            c_PayPlus.mf_set_us( mod_data_set_no, "mod_tax_mny",  mod_tax_mny                  ); // 공급가 부분 취소 요청 금액
            c_PayPlus.mf_set_us( mod_data_set_no, "mod_vat_mny",  mod_vat_mny                  ); // 부과세 부분 취소 요청 금액
            c_PayPlus.mf_set_us( mod_data_set_no, "mod_free_mny", mod_free_mny                 ); // 비과세 부분 취소 요청 금액
        }
    }
    /* = -------------------------------------------------------------------------- = */
    /* =   04. 처리 요청 정보 설정 END                                              = */
    /* = ========================================================================== = */


    /* = ========================================================================== = */
    /* =   05. 실행                                                                 = */
    /* = -------------------------------------------------------------------------- = */
   if ( tran_cd.length() > 0 )
        {
             c_PayPlus.mf_do_tx( g_conf_site_cd, g_conf_site_key, tran_cd, "", "", g_conf_log_level, "1" );
        }
        else
        {
            c_PayPlus.m_res_cd  = "9562";
            c_PayPlus.m_res_msg = "연동 오류";
        }
        res_cd  = c_PayPlus.m_res_cd;                      // 결과 코드
        res_msg = c_PayPlus.m_res_msg;                     // 결과 메시지
    /* = -------------------------------------------------------------------------- = */
    /* =   05. 실행 END                                                             = */
    /* ============================================================================== */
	
	/* = -------------------------------------------------------------------------- = */
    /* =   06. 취소 결과 처리                                                       = */
    /* ============================================================================== */
	if ( res_cd.equals( "0000" )) // 정상결제 인 경우
    {
    
    	card_cd     = c_PayPlus.mf_get_res( "card_cd"   );
        card_name   = c_PayPlus.mf_get_res( "card_name" );
        amount    	= c_PayPlus.mf_get_res( "amount"    );
        coupon_mny  = c_PayPlus.mf_get_res( "coupon_mny");
        canc_time   = c_PayPlus.mf_get_res( "canc_time"  );
  	
  if ( mod_type.equals( "STPC")) //부분 취소 정상결제인 경우 
  	{
  	 	card_cd      	= c_PayPlus.mf_get_res( "card_cd"   );
        card_name    	= c_PayPlus.mf_get_res( "card_name" );
        amount    	 	= c_PayPlus.mf_get_res( "amount"    );
        coupon_mny   	= c_PayPlus.mf_get_res( "coupon_mny");
        canc_time    	= c_PayPlus.mf_get_res( "canc_time" );
        panc_mod_mny 	= c_PayPlus.mf_get_res( "panc_mod_mny");	
        panc_rem_mny   	= c_PayPlus.mf_get_res( "panc_rem_mny");
        panc_coupon_mod_mny  = c_PayPlus.mf_get_res( "panc_coupon_mod_mny ");
		panc_card_mod_mny = c_PayPlus.mf_get_res( "panc_card_mod_mny");
    
   		}
    }    
  
%>

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
                            취소결과페이지
                            <div class="page-title-subheading">
                                페이지는 취소요청결과를 출력하는 페이지입니다.
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
<%
/* = -------------------------------------------------------------------------- = */
/* =   07. 취소 결과 출력                                                       = */
/* ============================================================================== */   
 if ( res_cd.equals( "0000" ) && mod_type.equals( "STSC")) 
  	{  
    out.println( "취소요청이 완료되었습니다.        <br>");
    out.println( "결과코드 : "      + res_cd   	 + "<br>");
	out.println( "카드 코드: "      + card_cd    + "<br>");
    out.println( "카드 명  : "      + card_name  + "<br>");
    out.println( "결제 금액: "      + amount     + "<br>");
    out.println( "쿠폰 금액: "      + coupon_mny + "<br>");
    out.println( "취소 시간: "  	+ canc_time  + "<br>");
    out.println( "결과메세지 : "    + res_msg    + "<p>");
    
    }
 else if ( res_cd.equals( "0000" ) && mod_type.equals( "STPC"))
    {
    out.println( "취소요청이 완료되었습니다.        <br>");
    out.println( "결과코드 : "      + res_cd   	 + "<br>");
	out.println( "카드 코드: "      + card_cd    + "<br>");
    out.println( "카드 명  : "      + card_name  + "<br>");
    out.println( "결제 금액: "      + amount     + "<br>");
    out.println( "쿠폰 금액: "      + coupon_mny + "<br>");
    out.println( "취소 시간: "  	+ canc_time  + "<br>");
    out.println( "취소 금액: "  	+ panc_mod_mny + "<br>");
    out.println( "남은 금액: "  	+ panc_rem_mny + "<br>");
    out.println( "쿠폰 취소 금액:"  + panc_coupon_mod_mny  + "<br>");
	out.println( "카드 취소 금액:"  + panc_card_mod_mny  + "<br>");
    out.println( "결과메세지 : "    + res_msg    + "<p>");
	}
 
else
{
    out.println( "취소요청이 처리 되지 못하였습니다.  <br>");
    out.println( "결과코드 : "      + res_cd       + "<br>");
    out.println( "결과메세지 : "    + res_msg      + "<p>");
}
/* = -------------------------------------------------------------------------- = */
/* =   07. 취소 결과 출력 END                                                   = */
/* ============================================================================== */
%>     											
     					
     					
</div>
 					
 									

<%
	System.out.println(tno);
	System.out.println(res_cd);
	System.out.println(res_msg);
%>
								
     									<form id="cancelSave" action="CancelSave.do" method="post">
  											
  											<input type="hidden" name="tno" id="tno" value="<%=tno%>">
  									
 											<input type="hidden" name="res_cd" id="res_cd" value="<%=res_cd%>">
 											<input type="hidden" name="res_msg" id="res_msg" value="<%=res_msg%>">
 											<input type="hidden" name="memberno" id="memberno"">
 										 	
 										 	<input type="submit" value="Submit">
 										 
 											<!-- 씨큐리티 쓰려면 바로 밑 소스 한줄 무조건 넣어야함 -->
											<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
 										 
										</form>
     									
     									<script type="text/javascript">
											this.document.getElementById("cancelSave").submit();
										</script>
     									
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
                        