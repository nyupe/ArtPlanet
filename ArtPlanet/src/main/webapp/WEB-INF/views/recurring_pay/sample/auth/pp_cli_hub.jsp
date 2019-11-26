<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!-- 아이디 얻어서 var에 지정한 변수 id저장  페이지내에서 EL 사용하여 (ex. ${id} )아이디값 사용가능-->
<sec:authentication property="principal.username" var="id" />

<%
    /* ============================================================================== */
    /* =   PAGE : 인증 요청 및 결과 처리 PAGE                                       = */
    /* = -------------------------------------------------------------------------- = */
    /* =   Copyright (c)  2013   KCP Inc.   All Rights Reserverd.                   = */
    /* ============================================================================== */
%>
<%@ page import="com.kcp.*" %>
<%@ include file="../../cfg/site_conf_inc.jsp"%>
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
    /* =   01. 인증 데이터 셋업 (업체에 맞게 수정)                                  = */
    /* = -------------------------------------------------------------------------- = */

    /* ============================================================================== */


    /* ============================================================================== */
    /* =   02. 인증 요청 정보 설정                                                  = */
    /* = -------------------------------------------------------------------------- = */
    String req_tx      = f_get_parm( request.getParameter( "req_tx"      ) ); // 요청 종류
    String tran_cd     = f_get_parm( request.getParameter( "tran_cd"     ) ); // 처리 종류
    String cust_ip     = f_get_parm( request.getRemoteAddr()               ); // 요청 IP
    /* = -------------------------------------------------------------------------- = */
    String pay_method  = f_get_parm( request.getParameter( "pay_method"  ) ); // 결제 방법
    String ordr_idxx   = f_get_parm( request.getParameter( "ordr_idxx"   ) ); // 쇼핑몰 주문번호
    String buyr_name   = f_get_parm( request.getParameter( "buyr_name"   ) ); // 요청자 이름
    /* = -------------------------------------------------------------------------- = */
    String res_cd      = "";                                                  // 결과 코드
    String res_msg     = "";                                                  // 결과 메시지
    /* = -------------------------------------------------------------------------- = */
    String card_cd     = "";                                                  // 카드 코드
    String batch_key   = "";                                                  // 배치 인증키
    /* ============================================================================== */


    /* ============================================================================== */
    /* =   03. 인스턴스 생성 및 초기화                                              = */
    /* = -------------------------------------------------------------------------- = */
    J_PP_CLI_N c_PayPlus = new J_PP_CLI_N();

    c_PayPlus.mf_init( g_conf_log_dir, g_conf_gw_url, g_conf_gw_port, g_conf_tx_mode, "" );
    c_PayPlus.mf_init_set();
    /* ============================================================================== */


    /* ============================================================================== */
    /* =   04. 처리 요청 정보 설정, 실행                                            = */
    /* = -------------------------------------------------------------------------- = */

    /* = -------------------------------------------------------------------------- = */
    /* =   04-1. 인증 요청                                                          = */
    /* = -------------------------------------------------------------------------- = */
    c_PayPlus.mf_set_enc_data( f_get_parm( request.getParameter( "enc_data" ) ),
                               f_get_parm( request.getParameter( "enc_info" ) ) );
    c_PayPlus.mf_set_trace_no( f_get_parm( request.getParameter( "trace_no" ) ) );

    /* = -------------------------------------------------------------------------- = */
    /* =   04-2. 실행                                                               = */
    /* = -------------------------------------------------------------------------- = */
    if ( tran_cd.length() > 0 )
    {
        c_PayPlus.mf_do_tx( g_conf_site_cd, g_conf_site_key, tran_cd, cust_ip, ordr_idxx, g_conf_log_level, "0" );
    }
    else
    {
        c_PayPlus.m_res_cd  = "9562";
        c_PayPlus.m_res_msg = "연동 오류 + TRAN_CD[" + tran_cd + "]";
    }

    res_cd  = c_PayPlus.m_res_cd;                      // 결과 코드
    res_msg = c_PayPlus.m_res_msg;                     // 결과 메시지
    /* ============================================================================== */


    /* ============================================================================== */
    /* =   05. 인증 결과 처리                                                       = */
    /* = -------------------------------------------------------------------------- = */
    if ( res_cd.equals( "0000" ) )
    {
        card_cd   = c_PayPlus.mf_get_res( "card_cd"   );       // 카드 코드
        batch_key = c_PayPlus.mf_get_res( "batch_key" );       // 배치 인증키
    }
    /* ============================================================================== */


    /* ============================================================================== */
    /* =   06. 폼 구성 및 결과페이지 호출                                           = */
    /* ============================================================================== */
%>
    <html>
    <head>
    <script>
        function goResult()
        {
            document.pay_info.submit();
        }
    </script>
    </head>
    <body onload="goResult()">
    <form name="pay_info" method="post" action="<c:url value='/RecurringAuthRes.do'/>">
        <input type="hidden" name="res_cd"      value="<%=res_cd%>">            <!-- 결과 코드 -->
        <input type="hidden" name="res_msg"     value="<%=res_msg%>">           <!-- 결과 메세지 -->
        <input type="hidden" name="ordr_idxx"   value="<%=ordr_idxx%>">         <!-- 주문번호 -->
        <input type="hidden" name="buyr_name"   value="<%=buyr_name%>">         <!-- 요청자 이름 -->
        <input type="hidden" name="card_cd"     value="<%=card_cd%>">           <!-- 카드 코드 -->
        <input type="hidden" name="batch_key"   value="<%=batch_key%>">         <!-- 배치 인증키 -->
   	 	<!-- 씨큐리티 쓰려면 바로 밑 소스 한줄 무조건 넣어야함 -->
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
		 <!-- 스프링시큐리티에서 내려주는 아이디사용 -->
        <input type="hidden" name="id"              value="<c:out value='${id}'/>"/> 
    </form>
    </body>
    </html>
