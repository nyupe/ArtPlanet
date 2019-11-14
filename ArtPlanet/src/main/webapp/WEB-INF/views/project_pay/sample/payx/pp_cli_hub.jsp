<%@ page language="java" contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    /* ============================================================================== */
    /* =   PAGE : 결제 요청 처리 PAGE                                               = */
    /* = -------------------------------------------------------------------------- = */
    /* =   연동시 오류가 발생하는 경우 아래의 주소로 접속하셔서 확인하시기 바랍니다.= */
    /* =   접속 주소 : http://testpay.kcp.co.kr/pgsample/FAQ/search_error.jsp       = */
    /* = -------------------------------------------------------------------------- = */
    /* =   Copyright (c)  2008   KCP Inc.   All Rights Reserverd.                   = */
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
    /* = 라이브러리 및 사이트 정보 include                                          = */
    /* = -------------------------------------------------------------------------- = */
%>
    <%@ page import="com.kcp.*"%>
    <%@ page import="java.net.URLEncoder"%>
    <%@ include file="../../cfg/site_conf_inc.jsp"%>
<%
    /* ============================================================================== */

    request.setCharacterEncoding ( "utf-8" ); //utf-8로 변경
    /* ============================================================================== */
    /* =   01. 지불 요청 정보 설정                                                  = */
    /* = -------------------------------------------------------------------------- = */
    String    pay_method = f_get_parm( request.getParameter( "pay_method" ) );  // 결제 방법
    String    ordr_idxx  = f_get_parm( request.getParameter( "ordr_idxx"  ) );  // 주문 번호
    String    good_name  = f_get_parm( request.getParameter( "good_name"  ) );  // 상품 정보
    String    good_mny   = f_get_parm( request.getParameter( "good_mny"   ) );  // 결제 금액
    String    buyr_name  = f_get_parm( request.getParameter( "buyr_name"  ) );  // 주문자 이름
    String    buyr_mail  = f_get_parm( request.getParameter( "buyr_mail"  ) );  // 주문자 E-Mail
    String    buyr_tel1  = f_get_parm( request.getParameter( "buyr_tel1"  ) );  // 주문자 전화번호
    String    buyr_tel2  = f_get_parm( request.getParameter( "buyr_tel2"  ) );  // 주문자 휴대폰번호
    String    req_tx     = f_get_parm( request.getParameter( "req_tx"     ) );  // 요청 종류
    String    currency   = f_get_parm( request.getParameter( "currency"   ) );  // 화폐단위 (WON/USD)
    /* = -------------------------------------------------------------------------- = */
    String    mod_type      = f_get_parm( request.getParameter( "mod_type"     ) ); // 변경TYPE(승인취소시 필요)
    String    mod_desc      = f_get_parm( request.getParameter( "mod_desc"     ) ); // 변경사유
    String    amount        = "";                                                   // 총 금액
    String    panc_mod_mny  = "";                                                   // 부분취소 요청금액
    String    panc_rem_mny  = "";                                                   // 부분취소 가능금액
    /* = -------------------------------------------------------------------------- = */
    String    tran_cd    = "";                                                  // 트랜잭션 코드
    String    bSucc      = "";                                                  // DB 작업 성공 여부
    /* = -------------------------------------------------------------------------- = */
    String    res_cd     = "";                                                  // 결과코드
    String    res_msg    = "";                                                  // 결과메시지
    String    tno        = "";                                                  // 거래번호
    /* = -------------------------------------------------------------------------- = */
    String    card_pay_method = f_get_parm( request.getParameter( "card_pay_method" ) );  // 카드 결제 방법
    String    card_cd         = "";                                                       // 카드 코드
    String    card_no         = "";                                                       // 카드 번호
    String    card_name       = "";                                                       // 카드명
    String    app_time        = "";                                                       // 승인시간
    String    app_no          = "";                                                       // 승인번호
    String    noinf           = "";                                                       // 무이자여부
    String    quota           = "";                                                       // 할부개월
    /* ============================================================================== */


    /* ============================================================================== */
    /* =   02. 인스턴스 생성 및 초기화                                              = */
    /* = -------------------------------------------------------------------------- = */
    J_PP_CLI_N c_PayPlus = new J_PP_CLI_N();

    c_PayPlus.mf_init( g_conf_log_dir, g_conf_gw_url, g_conf_gw_port, g_conf_tx_mode, "" );
    c_PayPlus.mf_init_set();
    /* ============================================================================== */


    /* ============================================================================== */
    /* =   03. 처리 요청 정보 설정, 실행                                            = */
    /* = -------------------------------------------------------------------------- = */

    /* = -------------------------------------------------------------------------- = */
    /* =   03-1. 승인 요청                                                          = */
    /* = -------------------------------------------------------------------------- = */
        // 업체 환경 정보
        String cust_ip = request.getRemoteAddr(); // 요청 IP (옵션값)

        if ( req_tx.equals( "pay" ) )
        {
            tran_cd = "00100000";

            int payx_data_set;
            int common_data_set;

            payx_data_set   = c_PayPlus.mf_add_set( "payx_data" );
            common_data_set = c_PayPlus.mf_add_set( "common"    );

            c_PayPlus.mf_set_us( common_data_set, "amount",   good_mny    );
            c_PayPlus.mf_set_us( common_data_set, "currency", currency    );
            c_PayPlus.mf_set_us( common_data_set, "cust_ip",  cust_ip     );
            c_PayPlus.mf_set_us( common_data_set, "escw_mod", "N"         );

            c_PayPlus.mf_add_rs( payx_data_set, common_data_set );

            // 주문 정보
            int ordr_data_set;

            ordr_data_set = c_PayPlus.mf_add_set( "ordr_data" );

            c_PayPlus.mf_set_us( ordr_data_set, "ordr_idxx", ordr_idxx );
            c_PayPlus.mf_set_us( ordr_data_set, "good_name", good_name );
            c_PayPlus.mf_set_us( ordr_data_set, "good_mny",  good_mny  );
            c_PayPlus.mf_set_us( ordr_data_set, "buyr_name", buyr_name );
            c_PayPlus.mf_set_us( ordr_data_set, "buyr_tel1", buyr_tel1 );
            c_PayPlus.mf_set_us( ordr_data_set, "buyr_tel2", buyr_tel2 );
            c_PayPlus.mf_set_us( ordr_data_set, "buyr_mail", buyr_mail );

            if (pay_method.equals("CARD") )
            {
                int card_data_set;

                card_data_set = c_PayPlus.mf_add_set( "card" );

                c_PayPlus.mf_set_us( card_data_set, "card_mny", good_mny );        // 결제 금액

                if (card_pay_method.equals("Batch"))
                {
                    c_PayPlus.mf_set_us( card_data_set, "card_tx_type",   "11511000" );
                    c_PayPlus.mf_set_us( card_data_set, "quota",          request.getParameter("quotaopt") );
                    c_PayPlus.mf_set_us( card_data_set, "bt_group_id",    request.getParameter("bt_group_id") );
                    c_PayPlus.mf_set_us( card_data_set, "bt_batch_key",   request.getParameter("bt_batch_key") );
                }
                c_PayPlus.mf_add_rs( payx_data_set, card_data_set );
            }
        }

    /* = -------------------------------------------------------------------------- = */
    /* =   03-2. 취소/매입 요청                                                     = */
    /* = -------------------------------------------------------------------------- = */
        else if ( req_tx.equals( "mod" ) )
        {
            int     mod_data_set_no;

            tran_cd = "00200000";
            mod_data_set_no = c_PayPlus.mf_add_set( "mod_data" );

            c_PayPlus.mf_set_us( mod_data_set_no, "tno",        request.getParameter( "tno"       ) );      // KCP 원거래 거래번호
            c_PayPlus.mf_set_us( mod_data_set_no, "mod_type",   mod_type                            );      // 원거래 변경 요청 종류
            c_PayPlus.mf_set_us( mod_data_set_no, "mod_ip",     cust_ip                             );      // 변경 요청자 IP
            c_PayPlus.mf_set_us( mod_data_set_no, "mod_desc",   request.getParameter( "mod_desc"  ) );      // 변경 사유

            if ( mod_type.equals( "STPC" ) ) // 부분취소의 경우
            {
                c_PayPlus.mf_set_us( mod_data_set_no, "mod_mny", request.getParameter( "mod_mny" ) ); // 취소요청금액
                c_PayPlus.mf_set_us( mod_data_set_no, "rem_mny", request.getParameter( "rem_mny" ) ); // 취소가능잔액
            }
        }
    /* ============================================================================== */


    /* ============================================================================== */
    /* =   03-3. 실행                                                               = */
    /* ------------------------------------------------------------------------------ */
        if ( tran_cd.length() > 0 )
        {
            c_PayPlus.mf_do_tx( g_conf_site_cd, g_conf_site_key, tran_cd, cust_ip, ordr_idxx, "3", "1" );
        }
        else
        {
            c_PayPlus.m_res_cd  = "9562";
            c_PayPlus.m_res_msg = "연동 오류";
        }
        res_cd  = c_PayPlus.m_res_cd;                      // 결과 코드
        res_msg = c_PayPlus.m_res_msg;                     // 결과 메시지
    /* ============================================================================== */


    /* ============================================================================== */
    /* =   04. 승인 결과 처리                                                       = */
    /* = -------------------------------------------------------------------------- = */
        if ( req_tx.equals( "pay" ) )
        {
            if ( res_cd.equals( "0000" ) )
            {
                tno = c_PayPlus.mf_get_res( "tno" );       // KCP 거래 고유 번호

    /* = -------------------------------------------------------------------------- = */
    /* =   04-1. 신용카드 승인 결과 처리                                            = */
    /* = -------------------------------------------------------------------------- = */
                if ( pay_method.equals( "CARD" ) )
                {
                    card_cd   = c_PayPlus.mf_get_res( "card_cd"   );
                    card_no   = c_PayPlus.mf_get_res( "card_no"   );
                    card_name = c_PayPlus.mf_get_res( "card_name" );
                    app_time  = c_PayPlus.mf_get_res( "app_time"  );
                    app_no    = c_PayPlus.mf_get_res( "app_no"    );
                    noinf     = c_PayPlus.mf_get_res( "noinf"     );
                    quota     = c_PayPlus.mf_get_res( "quota"     );
                }

    /* = -------------------------------------------------------------------------- = */
    /* =   04-2. 승인 결과를 업체 자체적으로 DB 처리 작업하시는 부분입니다.         = */
    /* = -------------------------------------------------------------------------- = */
    /* =         승인 결과를 DB 작업 하는 과정에서 정상적으로 승인된 건에 대해      = */
    /* =         DB 작업을 실패하여 DB update 가 완료되지 않은 경우, 자동으로       = */
    /* =         승인 취소 요청을 하는 프로세스가 구성되어 있습니다.                = */
    /* =         DB 작업이 실패 한 경우, bSucc 라는 변수(String)의 값을 "false"     = */
    /* =         로 세팅해 주시기 바랍니다. (DB 작업 성공의 경우에는 "false" 이외의 = */
    /* =         값을 세팅하시면 됩니다.)                                           = */
    /* = -------------------------------------------------------------------------- = */
                bSucc = "";             // DB 작업 실패일 경우 "false" 로 세팅

    /* = -------------------------------------------------------------------------- = */
    /* =   04-3. DB 작업 실패일 경우 자동 승인 취소                                 = */
    /* = -------------------------------------------------------------------------- = */
                if ( bSucc.equals("false") )
                {
                    int mod_data_set_no;

                    c_PayPlus.mf_init_set();

                    tran_cd = "00200000";

                    mod_data_set_no = c_PayPlus.mf_add_set( "mod_data" );

                    c_PayPlus.mf_set_us( mod_data_set_no, "tno",      tno    );                         // KCP 원거래 거래번호
                    c_PayPlus.mf_set_us( mod_data_set_no, "mod_type", "STSC" );                         // 원거래 변경 요청 종류
                    c_PayPlus.mf_set_us( mod_data_set_no, "mod_ip",   cust_ip );                        // 변경 요청자 IP (옵션값)
                    c_PayPlus.mf_set_us( mod_data_set_no, "mod_desc", "가맹점 결과 처리 오류 - 가맹점에서 자동 취소 요청" );   // 변경 사유
                    c_PayPlus.mf_do_tx( g_conf_site_cd, g_conf_site_key, tran_cd, cust_ip, ordr_idxx, "3", "0" );

                    res_cd  = c_PayPlus.m_res_cd;
                    res_msg = c_PayPlus.m_res_msg;
                }

            }    // End of [res_cd = "0000"]

    /* = -------------------------------------------------------------------------- = */
    /* =   04-4. 승인 실패를 업체 자체적으로 DB 처리 작업하시는 부분입니다.         = */
    /* = -------------------------------------------------------------------------- = */
            else
            {
            }
        }
    /* ============================================================================== */


    /* ============================================================================== */
    /* =   05. 취소/매입 결과 처리                                                  = */
    /* = -------------------------------------------------------------------------- = */
        else if ( req_tx.equals( "mod" ) )
        {
            if ( res_cd.equals( "0000" ) )
            {
                if ( mod_type.equals ( "STPC") )
                {
                amount       = c_PayPlus.mf_get_res( "amount"       ); // 총 금액
                panc_mod_mny = c_PayPlus.mf_get_res( "panc_mod_mny" ); // 부분취소 요청금액
                panc_rem_mny = c_PayPlus.mf_get_res( "panc_rem_mny" ); // 부분취소 가능금액
                }
            }
        }
    /* ============================================================================== */


    /* ============================================================================== */
    /* =   06. 폼 구성 및 결과페이지 호출                                           = */
    /* ============================================================================== */
%>

    <html>
    <head>
        <script type="text/javascript">
            function goResult()
            {
                document.pay_info.submit();
            }
        </script>
    </head>
								
    <body onload="goResult();">  
        <form name="pay_info" method="post" action="<c:url value='/ProjectPayRes'/>">
            <input type="hidden" name="req_tx"     value="<%= req_tx     %>">  <!-- 요청 구분 -->
            <input type="hidden" name="pay_method" value="<%= pay_method %>">  <!-- 사용한 결제 수단 -->
            <input type="hidden" name="bSucc"      value="<%= bSucc      %>">  <!-- 쇼핑몰 DB 처리 성공 여부 -->
            <input type="hidden" name="mod_type"   value="<%= mod_type   %>">
            <input type="hidden" name="amount"     value="<%= amount     %>">  <!-- 총 금액 -->
            <input type="hidden" name="panc_mod_mny"   value="<%=panc_mod_mny%>">  <!-- 부분취소 요청금액 -->
            <input type="hidden" name="panc_rem_mny"   value="<%=panc_rem_mny%>">  <!-- 부분취소 가능금액 -->

            <input type="hidden" name="res_cd"     value="<%= res_cd     %>">  <!-- 결과 코드 -->
            <input type="hidden" name="res_msg"    value="<%= res_msg    %>">  <!-- 결과 메세지 -->
            <input type="hidden" name="ordr_idxx"  value="<%= ordr_idxx  %>">  <!-- 주문번호 -->
            <input type="hidden" name="tno"        value="<%= tno        %>">  <!-- KCP 거래번호 -->
            <input type="hidden" name="good_mny"   value="<%= good_mny   %>">  <!-- 결제금액 -->
            <input type="hidden" name="good_name"  value="<%= good_name  %>">  <!-- 상품명 -->
            <input type="hidden" name="buyr_name"  value="<%= buyr_name  %>">  <!-- 주문자명 -->
            <input type="hidden" name="buyr_tel1"  value="<%= buyr_tel1  %>">  <!-- 주문자 전화번호 -->
            <input type="hidden" name="buyr_tel2"  value="<%= buyr_tel2  %>">  <!-- 주문자 휴대폰번호 -->
            <input type="hidden" name="buyr_mail"  value="<%= buyr_mail  %>">  <!-- 주문자 E-mail -->

            <input type="hidden" name="card_cd"    value="<%= card_cd    %>">  <!-- 카드코드 -->
            <input type="hidden" name="card_no"    value="<%= card_no    %>">  <!-- 카드번호 -->
            <input type="hidden" name="card_name"  value="<%= card_name  %>">  <!-- 카드명 -->
            <input type="hidden" name="app_time"   value="<%= app_time   %>">  <!-- 승인시간 -->
            <input type="hidden" name="app_no"     value="<%= app_no     %>">  <!-- 승인번호 -->
            <input type="hidden" name="quota"      value="<%= quota      %>">  <!-- 할부개월 -->
            <input type="hidden" name="noinf"      value="<%= noinf      %>">  <!-- 무이자여부 -->
			
			 <!-- 씨큐리티 쓰려면 바로 밑 소스 한줄 무조건 넣어야함 -->
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
        </form>
    </body>
    </html>
